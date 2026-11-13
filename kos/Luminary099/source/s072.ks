// PORT: Original source unit RTB_OP_CODES.agc.
// PORT: Physical bank 10. Shared continuation entries, slots 11131–11180.
function agcAotUnit721 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11155 {
        if slot <= 11142 {
            if slot <= 11136 {
                if slot <= 11133 {
                    if slot <= 11131 {
// PORT: SOURCE RTB_OP_CODES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE RTB_OP_CODES.agc:2
//# Filename:	RTB_OP_CODES.agc
// PORT: SOURCE RTB_OP_CODES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE RTB_OP_CODES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE RTB_OP_CODES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE RTB_OP_CODES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE RTB_OP_CODES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE RTB_OP_CODES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE RTB_OP_CODES.agc:9
//# Pages:	1397-1401
// PORT: SOURCE RTB_OP_CODES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE RTB_OP_CODES.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE RTB_OP_CODES.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE RTB_OP_CODES.agc:13
//#
// PORT: SOURCE RTB_OP_CODES.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE RTB_OP_CODES.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE RTB_OP_CODES.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE RTB_OP_CODES.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE RTB_OP_CODES.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE RTB_OP_CODES.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE RTB_OP_CODES.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE RTB_OP_CODES.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE RTB_OP_CODES.agc:22
//# actually created.
// PORT: SOURCE RTB_OP_CODES.agc:23
//#
// PORT: SOURCE RTB_OP_CODES.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE RTB_OP_CODES.agc:25
//#
// PORT: SOURCE RTB_OP_CODES.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE RTB_OP_CODES.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE RTB_OP_CODES.agc:28
//
// PORT: SOURCE RTB_OP_CODES.agc:29
//# Page 1397
// PORT: SOURCE RTB_OP_CODES.agc:30
//		BANK	22
// PORT: SOURCE RTB_OP_CODES.agc:31
//		SETLOC	RTBCODES
// PORT: SOURCE RTB_OP_CODES.agc:32
//		BANK
// PORT: SOURCE RTB_OP_CODES.agc:33
//
// PORT: SOURCE RTB_OP_CODES.agc:34
//		EBANK=	XNB
// PORT: SOURCE RTB_OP_CODES.agc:35
//		COUNT*	$$/RTB
// PORT: SOURCE RTB_OP_CODES.agc:36
//
// PORT: SOURCE RTB_OP_CODES.agc:37
//# LOAD TIME2, TIME1 INTO MPAC:
// PORT: SOURCE RTB_OP_CODES.agc:38
//
// PORT: SOURCE RTB_OP_CODES.agc:39
//LOADTIME	EXTEND
// PORT: Fixed ROM slots 11131.
                        if slot <> 11131 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11132 {
// PORT: SOURCE RTB_OP_CODES.agc:40
//		DCA	TIME2
// PORT: Fixed ROM slots 11132.
                            if slot <> 11132 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:41
//		TCF	SLOAD2
// PORT: Fixed ROM slots 11133.
                            if slot <> 11133 or instruction <> 7213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11134 {
// PORT: SOURCE RTB_OP_CODES.agc:42
//
// PORT: SOURCE RTB_OP_CODES.agc:43
//# 	   CONVERT THE SINGLE PRECISION 2'S COMPLEMENT NUMBER ARRIVING IN MPAC (SCALED IN HALF-REVOLUTIONS) TO A
// PORT: SOURCE RTB_OP_CODES.agc:44
//# DP 1'S COMPLEMENT NUMBER SCALED IN REVOLUTIONS.
// PORT: SOURCE RTB_OP_CODES.agc:45
//
// PORT: SOURCE RTB_OP_CODES.agc:46
//CDULOGIC	CCS	MPAC
// PORT: Fixed ROM slots 11134.
                        if slot <> 11134 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11135 {
// PORT: SOURCE RTB_OP_CODES.agc:47
//		CAF	ZERO
// PORT: Fixed ROM slots 11135.
                            if slot <> 11135 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:48
//		TCF	+3
// PORT: Fixed ROM slots 11136.
                            if slot <> 11136 or instruction <> 6019 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6019, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11139 {
                    if slot <= 11137 {
// PORT: SOURCE RTB_OP_CODES.agc:49
//		NOOP
// PORT: Fixed ROM slots 11137.
                        if slot <> 11137 or instruction <> 6018 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6018, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11138 {
// PORT: SOURCE RTB_OP_CODES.agc:50
//		CS	HALF
// PORT: Fixed ROM slots 11138.
                            if slot <> 11138 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:51
//
// PORT: SOURCE RTB_OP_CODES.agc:52
//		TS	MPAC +1
// PORT: Fixed ROM slots 11139.
                            if slot <> 11139 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11140 {
// PORT: SOURCE RTB_OP_CODES.agc:53
//		CAF	ZERO
// PORT: Fixed ROM slots 11140.
                        if slot <> 11140 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11141 {
// PORT: SOURCE RTB_OP_CODES.agc:54
//		XCH	MPAC
// PORT: Fixed ROM slots 11141.
                            if slot <> 11141 or instruction <> 23660 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 108, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:55
//		EXTEND
// PORT: Fixed ROM slots 11142.
                            if slot <> 11142 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 11148 {
                if slot <= 11145 {
                    if slot <= 11143 {
// PORT: SOURCE RTB_OP_CODES.agc:56
//		MP	HALF
// PORT: Fixed ROM slots 11143.
                        if slot <> 11143 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11144 {
// PORT: SOURCE RTB_OP_CODES.agc:57
//		DAS	MPAC
// PORT: Fixed ROM slots 11144.
                            if slot <> 11144 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:58
//		TCF	DANZIG		# MODE IS ALREADY AT DOUBLE-PRECISION
// PORT: Fixed ROM slots 11145.
                            if slot <> 11145 or instruction <> 7217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7217, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11146 {
// PORT: SOURCE RTB_OP_CODES.agc:59
//
// PORT: SOURCE RTB_OP_CODES.agc:60
//# 	   FORCE TP SIGN AGREEMENT IN MPAC:
// PORT: SOURCE RTB_OP_CODES.agc:61
//
// PORT: SOURCE RTB_OP_CODES.agc:62
//SGNAGREE	TC	TPAGREE
// PORT: Fixed ROM slots 11146.
                        if slot <> 11146 or instruction <> 3759 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3759, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11147 {
// PORT: SOURCE RTB_OP_CODES.agc:63
//		TCF	DANZIG
// PORT: Fixed ROM slots 11147.
                            if slot <> 11147 or instruction <> 7217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7217, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:64
//
// PORT: SOURCE RTB_OP_CODES.agc:65
//# 	   CONVERT THE DP 1'S COMPLEMENT ANGLE SCALED IN REVOLUTIONS TO A SINGLE PRECISION 2'S COMPLEMENT ANGLE
// PORT: SOURCE RTB_OP_CODES.agc:66
//# SCALED IN HALF-REVOLUTIONS.
// PORT: SOURCE RTB_OP_CODES.agc:67
//
// PORT: SOURCE RTB_OP_CODES.agc:68
//1STO2S		TC	1TO2SUB
// PORT: Fixed ROM slots 11148.
                            if slot <> 11148 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11151 {
                    if slot <= 11149 {
// PORT: SOURCE RTB_OP_CODES.agc:69
//		CAF	ZERO
// PORT: Fixed ROM slots 11149.
                        if slot <> 11149 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11150 {
// PORT: SOURCE RTB_OP_CODES.agc:70
//		TS	MPAC +1
// PORT: Fixed ROM slots 11150.
                            if slot <> 11150 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:71
//		TCF	NEWMODE
// PORT: Fixed ROM slots 11151.
                            if slot <> 11151 or instruction <> 7216 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7216, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11153 {
                        if slot <= 11152 {
// PORT: SOURCE RTB_OP_CODES.agc:72
//
// PORT: SOURCE RTB_OP_CODES.agc:73
//# 	   DO 1STO2S ON A VECTOR OF ANGLES:
// PORT: SOURCE RTB_OP_CODES.agc:74
//
// PORT: SOURCE RTB_OP_CODES.agc:75
//V1STO2S		TC	1TO2SUB		# ANSWER ARRIVES IN A AND MPAC.
// PORT: Fixed ROM slots 11152.
                            if slot <> 11152 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:76
//
// PORT: SOURCE RTB_OP_CODES.agc:77
//		DXCH	MPAC +5
// PORT: Fixed ROM slots 11153.
                            if slot <> 11153 or instruction <> 21618 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 11154 {
// PORT: SOURCE RTB_OP_CODES.agc:78
//		DXCH	MPAC
// PORT: Fixed ROM slots 11154.
                            if slot <> 11154 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:79
//		TC	1TO2SUB
// PORT: Fixed ROM slots 11155.
                            if slot <> 11155 or instruction <> 1956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1956, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 11167 {
            if slot <= 11161 {
                if slot <= 11158 {
                    if slot <= 11156 {
// PORT: SOURCE RTB_OP_CODES.agc:80
//# Page 1398
// PORT: SOURCE RTB_OP_CODES.agc:81
//		TS	MPAC +2
// PORT: Fixed ROM slots 11156.
                        if slot <> 11156 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11157 {
// PORT: SOURCE RTB_OP_CODES.agc:82
//
// PORT: SOURCE RTB_OP_CODES.agc:83
//		DXCH	MPAC +3
// PORT: Fixed ROM slots 11157.
                            if slot <> 11157 or instruction <> 21616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:84
//		DXCH	MPAC
// PORT: Fixed ROM slots 11158.
                            if slot <> 11158 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11159 {
// PORT: SOURCE RTB_OP_CODES.agc:85
//		TC	1TO2SUB
// PORT: Fixed ROM slots 11159.
                        if slot <> 11159 or instruction <> 1956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1956, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11160 {
// PORT: SOURCE RTB_OP_CODES.agc:86
//		TS	MPAC +1
// PORT: Fixed ROM slots 11160.
                            if slot <> 11160 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:87
//
// PORT: SOURCE RTB_OP_CODES.agc:88
//		CA	MPAC +5
// PORT: Fixed ROM slots 11161.
                            if slot <> 11161 or instruction <> 12401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 113).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11164 {
                    if slot <= 11162 {
// PORT: SOURCE RTB_OP_CODES.agc:89
//		TS	MPAC
// PORT: Fixed ROM slots 11162.
                        if slot <> 11162 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11163 {
// PORT: SOURCE RTB_OP_CODES.agc:90
//
// PORT: SOURCE RTB_OP_CODES.agc:91
//TPMODE		CAF	ONE		# MODE IS TP.
// PORT: Fixed ROM slots 11163.
                            if slot <> 11163 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:92
//		TCF	NEWMODE
// PORT: Fixed ROM slots 11164.
                            if slot <> 11164 or instruction <> 7216 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7216, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11165 {
// PORT: SOURCE RTB_OP_CODES.agc:93
//
// PORT: SOURCE RTB_OP_CODES.agc:94
//# 	   V1STO2S FOR 2 COMPONENT VECTOR. USED BY RR.
// PORT: SOURCE RTB_OP_CODES.agc:95
//
// PORT: SOURCE RTB_OP_CODES.agc:96
//2V1STO2S	TC	1TO2SUB
// PORT: Fixed ROM slots 11165.
                        if slot <> 11165 or instruction <> 1956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1956, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11166 {
// PORT: SOURCE RTB_OP_CODES.agc:97
//		DXCH	MPAC +3
// PORT: Fixed ROM slots 11166.
                            if slot <> 11166 or instruction <> 21616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:98
//		DXCH	MPAC
// PORT: Fixed ROM slots 11167.
                            if slot <> 11167 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 11173 {
                if slot <= 11170 {
                    if slot <= 11168 {
// PORT: SOURCE RTB_OP_CODES.agc:99
//		TC	1TO2SUB
// PORT: Fixed ROM slots 11168.
                        if slot <> 11168 or instruction <> 1956 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1956, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11169 {
// PORT: SOURCE RTB_OP_CODES.agc:100
//		TS	L
// PORT: Fixed ROM slots 11169.
                            if slot <> 11169 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:101
//		CA	MPAC +3
// PORT: Fixed ROM slots 11170.
                            if slot <> 11170 or instruction <> 12399 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 111).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11171 {
// PORT: SOURCE RTB_OP_CODES.agc:102
//		TCF	SLOAD2
// PORT: Fixed ROM slots 11171.
                        if slot <> 11171 or instruction <> 7213 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7213, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11172 {
// PORT: SOURCE RTB_OP_CODES.agc:103
//
// PORT: SOURCE RTB_OP_CODES.agc:104
//# 	   SUBROUTINE TO DO DOUBLING AND 1'S TO 2'S CONVERSION:
// PORT: SOURCE RTB_OP_CODES.agc:105
//
// PORT: SOURCE RTB_OP_CODES.agc:106
//1TO2SUB		DXCH	MPAC		# FINAL MPAC +1 UNSPECIFIED.
// PORT: Fixed ROM slots 11172.
                            if slot <> 11172 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:107
//		DDOUBL
// PORT: Fixed ROM slots 11173.
                            if slot <> 11173 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 11176 {
                    if slot <= 11174 {
// PORT: SOURCE RTB_OP_CODES.agc:108
//		CCS	A
// PORT: Fixed ROM slots 11174.
                        if slot <> 11174 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 11175 {
// PORT: SOURCE RTB_OP_CODES.agc:109
//		AD	ONE
// PORT: Fixed ROM slots 11175.
                            if slot <> 11175 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RTB_OP_CODES.agc:110
//		TCF	+2
// PORT: Fixed ROM slots 11176.
                            if slot <> 11176 or instruction <> 6058 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6058, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 11178 {
                        if slot <= 11177 {
// PORT: SOURCE RTB_OP_CODES.agc:111
//		COM			# THIS WAS REVERSE OF MSU.
// PORT: Fixed ROM slots 11177.
                            if slot <> 11177 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:112
//
// PORT: SOURCE RTB_OP_CODES.agc:113
//		TS	MPAC		# AND SKIP ON OVERFLOW.
// PORT: Fixed ROM slots 11178.
                            if slot <> 11178 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 11179 {
// PORT: SOURCE RTB_OP_CODES.agc:114
//		TC	Q
// PORT: Fixed ROM slots 11179.
                            if slot <> 11179 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RTB_OP_CODES.agc:115
//
// PORT: SOURCE RTB_OP_CODES.agc:116
//		INDEX	A		# OVERFLOW UNCORRECT AND IN MSU.
// PORT: Fixed ROM slots 11180.
                            if slot <> 11180 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[721] to agcAotUnit721@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:117
//		CAF	LIMITS
// PORT: Fixed ROM slots 11181.
    11181, 29624
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11182–11185.
function agcAotUnit722 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11183 {
        if slot <= 11182 {
// PORT: SOURCE RTB_OP_CODES.agc:118
//		ADS	MPAC
// PORT: Fixed ROM slots 11182.
            if slot <> 11182 or instruction <> 11372 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RTB_OP_CODES.agc:119
//		TC	Q
// PORT: Fixed ROM slots 11183.
            if slot <> 11183 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 11184 {
// PORT: SOURCE RTB_OP_CODES.agc:120
//
// PORT: SOURCE RTB_OP_CODES.agc:121
//# 	   THE FOLLOWING ROUTINE INCREMENTS IN 2S COMPLEMENT THE REGISTER WHOSE ADDRESS IS IN BUF BY THE 1S COMPL.
// PORT: SOURCE RTB_OP_CODES.agc:122
//# QUANTITY FOUND IN TEM2. THIS MAY BE USED TO INCREMENT DESIRED IMU AND OPTICS CDU ANGLES OR ANY OTHER 2S COMPL.
// PORT: SOURCE RTB_OP_CODES.agc:123
//# (+0 UNEQUAL TO -0) QUANTITY. MAY BE CALLED BY BANKCALL/SWCALL.
// PORT: SOURCE RTB_OP_CODES.agc:124
//
// PORT: SOURCE RTB_OP_CODES.agc:125
//CDUINC		TS	TEM2		# 1S COMPL.QUANT. ARRIVES IN ACC. STORE IT
// PORT: Fixed ROM slots 11184.
            if slot <> 11184 or instruction <> 22626 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22626, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RTB_OP_CODES.agc:126
//		INDEX	BUF
// PORT: Fixed ROM slots 11185.
            if slot <> 11185 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[722] to agcAotUnit722@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:127
//		CCS	0		# CHANGE 2S COMPL. ANGLE(IN BUF)INTO 1S
// PORT: Fixed ROM slots 11186.
    11186, 8192
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11187–11199.
function agcAotUnit723 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11192 {
        if slot <= 11189 {
            if slot <= 11187 {
// PORT: SOURCE RTB_OP_CODES.agc:128
//		AD	ONE
// PORT: Fixed ROM slots 11187.
                if slot <> 11187 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                if slot <= 11188 {
// PORT: SOURCE RTB_OP_CODES.agc:129
//		TCF	+4
// PORT: Fixed ROM slots 11188.
                    if slot <> 11188 or instruction <> 6072 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6072, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:130
//		AD	ONE
// PORT: Fixed ROM slots 11189.
                    if slot <> 11189 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 11190 {
// PORT: SOURCE RTB_OP_CODES.agc:131
//# Page 1399
// PORT: SOURCE RTB_OP_CODES.agc:132
//		AD	ONE		# OVERFLOW HERE IF 2S COMPL. IS 180 DEG.
// PORT: Fixed ROM slots 11190.
                if slot <> 11190 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                if slot <= 11191 {
// PORT: SOURCE RTB_OP_CODES.agc:133
//		COM
// PORT: Fixed ROM slots 11191.
                    if slot <> 11191 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:134
//
// PORT: SOURCE RTB_OP_CODES.agc:135
//		AD	TEM2		# SULT MOVES FROM 2ND TO 3D QUAD.(OR BACK)
// PORT: Fixed ROM slots 11192.
                    if slot <> 11192 or instruction <> 24674 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 98).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 11195 {
            if slot <= 11193 {
// PORT: SOURCE RTB_OP_CODES.agc:136
//		CCS	A		# BACK TO 2S COMPL.
// PORT: Fixed ROM slots 11193.
                if slot <> 11193 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 11194 {
// PORT: SOURCE RTB_OP_CODES.agc:137
//		AD	ONE
// PORT: Fixed ROM slots 11194.
                    if slot <> 11194 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RTB_OP_CODES.agc:138
//		TCF	+2
// PORT: Fixed ROM slots 11195.
                    if slot <> 11195 or instruction <> 6077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 11197 {
                if slot <= 11196 {
// PORT: SOURCE RTB_OP_CODES.agc:139
//		COM
// PORT: Fixed ROM slots 11196.
                    if slot <> 11196 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:140
//		TS	TEM2		# STORE 14BIT QUANTITY WITH PRESENT SIGN
// PORT: Fixed ROM slots 11197.
                    if slot <> 11197 or instruction <> 22626 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22626, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 11198 {
// PORT: SOURCE RTB_OP_CODES.agc:141
//		TCF	+4
// PORT: Fixed ROM slots 11198.
                    if slot <> 11198 or instruction <> 6082 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6082, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:142
//		INDEX	A		#  SIGN.
// PORT: Fixed ROM slots 11199.
                    if slot <> 11199 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[723] to agcAotUnit723@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:143
//		CAF	LIMITS		# FIX IT,BY ADDING IN 37777 OR 40000
// PORT: Fixed ROM slots 11200.
    11200, 29624
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11201–11202.
function agcAotUnit724 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11201 {
// PORT: SOURCE RTB_OP_CODES.agc:144
//		AD	TEM2
// PORT: Fixed ROM slots 11201.
        if slot <> 11201 or instruction <> 24674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 98).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RTB_OP_CODES.agc:145
//
// PORT: SOURCE RTB_OP_CODES.agc:146
//		INDEX	BUF
// PORT: Fixed ROM slots 11202.
        if slot <> 11202 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[724] to agcAotUnit724@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:147
//		TS	0		# STORE NEW ANGLE IN 2S COMPLEMENT.
// PORT: Fixed ROM slots 11203.
    11203, 45056
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11204–11205.
function agcAotUnit725 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11204 {
// PORT: SOURCE RTB_OP_CODES.agc:148
//		TC	Q
// PORT: Fixed ROM slots 11204.
        if slot <> 11204 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RTB_OP_CODES.agc:149
//
// PORT: SOURCE RTB_OP_CODES.agc:150
//# Page 1400
// PORT: SOURCE RTB_OP_CODES.agc:151
//# 	   RTB TO TORQUE GYROS, EXCEPT FOR THE CALL TO IMUSTALL. ECADR OF COMMANDS ARRIVES IN X1.
// PORT: SOURCE RTB_OP_CODES.agc:152
//
// PORT: SOURCE RTB_OP_CODES.agc:153
//PULSEIMU	INDEX	FIXLOC		# ADDRESS OF GYRO COMMANDS SHOULD BE IN X1
// PORT: Fixed ROM slots 11205.
        if slot <> 11205 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[725] to agcAotUnit725@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:154
//		CA	X1
// PORT: Fixed ROM slots 11206.
    11206, 24652
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11207–11207.
function agcAotUnit726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RTB_OP_CODES.agc:155
//		TC	BANKCALL
// PORT: Fixed ROM slots 11207.
    if slot <> 11207 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[726] to agcAotUnit726@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:156
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 11208.
    11208, 15782
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11209–11225.
function agcAotUnit727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11216 {
        if slot <= 11212 {
            if slot <= 11210 {
                if slot <= 11209 {
// PORT: SOURCE RTB_OP_CODES.agc:157
//		TCF	DANZIG
// PORT: Fixed ROM slots 11209.
                    if slot <> 11209 or instruction <> 7217 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7217, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:158
//
// PORT: SOURCE RTB_OP_CODES.agc:159
//# Page 1401
// PORT: SOURCE RTB_OP_CODES.agc:160
//# 	   THE SUBROUTINE SIGNMPAC  SETS C(MPAC, MPAC +1) TO SIGN(MPAC).
// PORT: SOURCE RTB_OP_CODES.agc:161
//# FOR THIS, ONLY THE CONTENTS OF MPAC ARE EXAMINED.   ALSO +0 YIELDS POSMAX AND -0 YIELDS NEGMAX.
// PORT: SOURCE RTB_OP_CODES.agc:162
//#
// PORT: SOURCE RTB_OP_CODES.agc:163
//# ENTRY MAY BE BY EITHER OF THE FOLLOWING:
// PORT: SOURCE RTB_OP_CODES.agc:164
//# 1.	   LIMIT THE SIZE OF MPAC ON INTERPRETIVE OVERFLOW:
// PORT: SOURCE RTB_OP_CODES.agc:165
//# ENTRY:	  BOVB
// PORT: SOURCE RTB_OP_CODES.agc:166
//#			 SIGNMPAC
// PORT: SOURCE RTB_OP_CODES.agc:167
//# 2.	   GENERATE IN MPAC THE SIGNUM FUNCTION OF MPAC:
// PORT: SOURCE RTB_OP_CODES.agc:168
//# ENTRY:	  RTB
// PORT: SOURCE RTB_OP_CODES.agc:169
//#			 SIGNMPAC
// PORT: SOURCE RTB_OP_CODES.agc:170
//# IN EITHER CASE, RETURN IS TO  THE NEXT INTERPRETIVE INSTRUCTION IN THE CALLING SEQUENCE.
// PORT: SOURCE RTB_OP_CODES.agc:171
//
// PORT: SOURCE RTB_OP_CODES.agc:172
//SIGNMPAC	EXTEND
// PORT: Fixed ROM slots 11210.
                    if slot <> 11210 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 11211 {
// PORT: SOURCE RTB_OP_CODES.agc:173
//		DCA	DPOSMAX
// PORT: Fixed ROM slots 11211.
                    if slot <> 11211 or instruction <> 14811 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2523, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:174
//		DXCH	MPAC
// PORT: Fixed ROM slots 11212.
                    if slot <> 11212 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 11214 {
                if slot <= 11213 {
// PORT: SOURCE RTB_OP_CODES.agc:175
//		CCS	A
// PORT: Fixed ROM slots 11213.
                    if slot <> 11213 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:176
//DPMODE		CAF	ZERO		# SETS MPAC +2 TO ZERO IN THE PROCESS
// PORT: Fixed ROM slots 11214.
                    if slot <> 11214 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 11215 {
// PORT: SOURCE RTB_OP_CODES.agc:177
//		TCF	SLOAD2 +2
// PORT: Fixed ROM slots 11215.
                    if slot <> 11215 or instruction <> 7215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7215, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:178
//		TCF	+1
// PORT: Fixed ROM slots 11216.
                    if slot <> 11216 or instruction <> 6097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6097, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 11220 {
            if slot <= 11218 {
                if slot <= 11217 {
// PORT: SOURCE RTB_OP_CODES.agc:179
//		EXTEND
// PORT: Fixed ROM slots 11217.
                    if slot <> 11217 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:180
//		DCS	DPOSMAX
// PORT: Fixed ROM slots 11218.
                    if slot <> 11218 or instruction <> 18907 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 2523, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 11219 {
// PORT: SOURCE RTB_OP_CODES.agc:181
//		TCF	SLOAD2
// PORT: Fixed ROM slots 11219.
                    if slot <> 11219 or instruction <> 7213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7213, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:182
//
// PORT: SOURCE RTB_OP_CODES.agc:183
//#     RTB OP CODE NORMUNIT IS LIKE INTERPRETIVE INSTRUCTION UNIT, EXCEPT THAT IT CAN BE DEPENDED ON NOT TO BLOW
// PORT: SOURCE RTB_OP_CODES.agc:184
//# UP WHEN THE VECTOR BEING UNITIZED IS VERY SMALL -- IT WILL BLOW UP WHEN ALL COMPONENTS ARE ZERO.   IF NORMUNIT
// PORT: SOURCE RTB_OP_CODES.agc:185
//# IS USED AND THE UPPER ORDER HALVES OF ALL COMPONENTS ARE ZERO, THE MAGNITUDE RETURNED IN 36D WILL BE TOO LARGE
// PORT: SOURCE RTB_OP_CODES.agc:186
//# BY A FACTOR OF 2(13) AND THE SQUARED MAGNITUDE RETURNED AT 34D WILL BE TOO BIG BY A FACTOR OF 2(26).
// PORT: SOURCE RTB_OP_CODES.agc:187
//
// PORT: SOURCE RTB_OP_CODES.agc:188
//NORMUNX1	CAF	ONE
// PORT: Fixed ROM slots 11220.
                    if slot <> 11220 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 11222 {
                if slot <= 11221 {
// PORT: SOURCE RTB_OP_CODES.agc:189
//		TCF	NORMUNIT +1
// PORT: Fixed ROM slots 11221.
                    if slot <> 11221 or instruction <> 6103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RTB_OP_CODES.agc:190
//NORMUNIT	CAF	ZERO
// PORT: Fixed ROM slots 11222.
                    if slot <> 11222 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 11223 {
// PORT: SOURCE RTB_OP_CODES.agc:191
//		AD	FIXLOC
// PORT: Fixed ROM slots 11223.
                    if slot <> 11223 or instruction <> 24656 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 80).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11224 {
// PORT: SOURCE RTB_OP_CODES.agc:192
//		TS	MPAC +2
// PORT: Fixed ROM slots 11224.
                        if slot <> 11224 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:193
//		TC	BANKCALL	# GET SIGN AGREEMENT IN ALL COMPONENTS
// PORT: Fixed ROM slots 11225.
                        if slot <> 11225 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[727] to agcAotUnit727@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:194
//		CADR	VECAGREE
// PORT: Fixed ROM slots 11226.
    11226, 1040
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11227–11252.
function agcAotUnit728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11239 {
        if slot <= 11232 {
            if slot <= 11229 {
                if slot <= 11227 {
// PORT: SOURCE RTB_OP_CODES.agc:195
//		CCS	MPAC
// PORT: Fixed ROM slots 11227.
                    if slot <> 11227 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11228 {
// PORT: SOURCE RTB_OP_CODES.agc:196
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11228.
                        if slot <> 11228 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:197
//		TCF	+2
// PORT: Fixed ROM slots 11229.
                        if slot <> 11229 or instruction <> 6111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6111, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 11230 {
// PORT: SOURCE RTB_OP_CODES.agc:198
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11230.
                    if slot <> 11230 or instruction <> 6136 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6136, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11231 {
// PORT: SOURCE RTB_OP_CODES.agc:199
//		CCS	MPAC +3
// PORT: Fixed ROM slots 11231.
                        if slot <> 11231 or instruction <> 4207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 111).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:200
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11232.
                        if slot <> 11232 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 11235 {
                if slot <= 11233 {
// PORT: SOURCE RTB_OP_CODES.agc:201
//		TCF	+2
// PORT: Fixed ROM slots 11233.
                    if slot <> 11233 or instruction <> 6115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11234 {
// PORT: SOURCE RTB_OP_CODES.agc:202
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11234.
                        if slot <> 11234 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:203
//		CCS	MPAC +5
// PORT: Fixed ROM slots 11235.
                        if slot <> 11235 or instruction <> 4209 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 113).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 11237 {
                    if slot <= 11236 {
// PORT: SOURCE RTB_OP_CODES.agc:204
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11236.
                        if slot <> 11236 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:205
//		TCF	+2
// PORT: Fixed ROM slots 11237.
                        if slot <> 11237 or instruction <> 6119 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6119, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11238 {
// PORT: SOURCE RTB_OP_CODES.agc:206
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 11238.
                        if slot <> 11238 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:207
//# Page 1402
// PORT: SOURCE RTB_OP_CODES.agc:208
//		CA	MPAC +1		# SHIFT ALL COMPONENTS LEFT 13
// PORT: Fixed ROM slots 11239.
                        if slot <> 11239 or instruction <> 12397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 11245 {
            if slot <= 11242 {
                if slot <= 11240 {
// PORT: SOURCE RTB_OP_CODES.agc:209
//		EXTEND
// PORT: Fixed ROM slots 11240.
                    if slot <> 11240 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11241 {
// PORT: SOURCE RTB_OP_CODES.agc:210
//		MP	BIT14
// PORT: Fixed ROM slots 11241.
                        if slot <> 11241 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:211
//		DAS	MPAC		# DAS GAINS A LITTLE ACCURACY
// PORT: Fixed ROM slots 11242.
                        if slot <> 11242 or instruction <> 8301 { return choose false if checkOnly else -1. }
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
                if slot <= 11243 {
// PORT: SOURCE RTB_OP_CODES.agc:212
//		CA	MPAC +4
// PORT: Fixed ROM slots 11243.
                    if slot <> 11243 or instruction <> 12400 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 112).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11244 {
// PORT: SOURCE RTB_OP_CODES.agc:213
//		EXTEND
// PORT: Fixed ROM slots 11244.
                        if slot <> 11244 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:214
//		MP	BIT14
// PORT: Fixed ROM slots 11245.
                        if slot <> 11245 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 11248 {
                if slot <= 11246 {
// PORT: SOURCE RTB_OP_CODES.agc:215
//		DAS	MPAC +3
// PORT: Fixed ROM slots 11246.
                    if slot <> 11246 or instruction <> 8304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 112) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 11247 {
// PORT: SOURCE RTB_OP_CODES.agc:216
//		CA	MPAC +6
// PORT: Fixed ROM slots 11247.
                        if slot <> 11247 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:217
//		EXTEND
// PORT: Fixed ROM slots 11248.
                        if slot <> 11248 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 11250 {
                    if slot <= 11249 {
// PORT: SOURCE RTB_OP_CODES.agc:218
//		MP	BIT14
// PORT: Fixed ROM slots 11249.
                        if slot <> 11249 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:219
//		DAS	MPAC +5
// PORT: Fixed ROM slots 11250.
                        if slot <> 11250 or instruction <> 8306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 114) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 11251 {
// PORT: SOURCE RTB_OP_CODES.agc:220
//		CAF	THIRTEEN
// PORT: Fixed ROM slots 11251.
                        if slot <> 11251 or instruction <> 14833 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2545), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RTB_OP_CODES.agc:221
//		INDEX	MPAC +2
// PORT: Fixed ROM slots 11252.
                        if slot <> 11252 or instruction <> 20590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20590, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[728] to agcAotUnit728@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:222
//		TS	37D
// PORT: Fixed ROM slots 11253.
    11253, 45130
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11254–11254.
function agcAotUnit729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RTB_OP_CODES.agc:223
//OFFTUNIT	TC	POSTJUMP
// PORT: Fixed ROM slots 11254.
    if slot <> 11254 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[729] to agcAotUnit729@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:224
//		CADR	UNIT +1		# SKIP THE "TC VECAGREE" DONE AT UNIT
// PORT: Fixed ROM slots 11255.
    11255, 1064
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11256–11258.
function agcAotUnit730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 11256 {
// PORT: SOURCE RTB_OP_CODES.agc:225
//
// PORT: SOURCE RTB_OP_CODES.agc:226
//NOSHIFT		CAF	ZERO
// PORT: Fixed ROM slots 11256.
        if slot <> 11256 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 11257 {
// PORT: SOURCE RTB_OP_CODES.agc:227
//		TCF	OFFTUNIT -2
// PORT: Fixed ROM slots 11257.
            if slot <> 11257 or instruction <> 6132 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6132, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RTB_OP_CODES.agc:228
//
// PORT: SOURCE RTB_OP_CODES.agc:229
//# RTB VECSGNAG   ...FORCES SIGN AGREEMENT OF VECTOR IN MPAC.
// PORT: SOURCE RTB_OP_CODES.agc:230
//
// PORT: SOURCE RTB_OP_CODES.agc:231
//VECSGNAG	TC	BANKCALL
// PORT: Fixed ROM slots 11258.
            if slot <> 11258 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[730] to agcAotUnit730@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RTB_OP_CODES.agc:232
//		CADR	VECAGREE
// PORT: Fixed ROM slots 11259.
    11259, 1040
)).

// PORT: Physical bank 10. Shared continuation entries, slots 11260–11260.
function agcAotUnit731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RTB_OP_CODES.agc:233
//		TC	DANZIG
// PORT: Fixed ROM slots 11260.
    if slot <> 11260 or instruction <> 3121 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3121, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[731] to agcAotUnit731@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE RTB_OP_CODES.agc:234
//
// PORT: SOURCE RTB_OP_CODES.agc:235
//# *** END OF SKIPPER .087 ***
// PORT: SOURCE RTB_OP_CODES.agc:236
//
