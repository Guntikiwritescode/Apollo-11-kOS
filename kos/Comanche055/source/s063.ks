// PORT: Original source unit RT8_OP_CODES.agc.
// PORT: Physical bank 22. Shared continuation entries, slots 21320–21382.
function agcAotUnit1209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21350 {
        if slot <= 21334 {
            if slot <= 21326 {
                if slot <= 21322 {
                    if slot <= 21320 {
// PORT: SOURCE RT8_OP_CODES.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE RT8_OP_CODES.agc:2
//# Filename:     RT8_OP_CODES.agc
// PORT: SOURCE RT8_OP_CODES.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE RT8_OP_CODES.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE RT8_OP_CODES.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE RT8_OP_CODES.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE RT8_OP_CODES.agc:7
//# Reference:    pp. 1508-1516
// PORT: SOURCE RT8_OP_CODES.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE RT8_OP_CODES.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE RT8_OP_CODES.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249/RT8_OP_CODES.agc
// PORT: SOURCE RT8_OP_CODES.agc:11
//#				and page images.
// PORT: SOURCE RT8_OP_CODES.agc:12
//#		2009-05-07 RSB	Oops! Left out the entire last page before.
// PORT: SOURCE RT8_OP_CODES.agc:13
//#
// PORT: SOURCE RT8_OP_CODES.agc:14
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE RT8_OP_CODES.agc:15
//# from scanned documents.
// PORT: SOURCE RT8_OP_CODES.agc:16
//#
// PORT: SOURCE RT8_OP_CODES.agc:17
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE RT8_OP_CODES.agc:18
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE RT8_OP_CODES.agc:19
//#
// PORT: SOURCE RT8_OP_CODES.agc:20
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE RT8_OP_CODES.agc:21
//#
// PORT: SOURCE RT8_OP_CODES.agc:22
//#       Prepared by
// PORT: SOURCE RT8_OP_CODES.agc:23
//#                       Massachusetts Institute of Technology
// PORT: SOURCE RT8_OP_CODES.agc:24
//#                       75 Cambridge Parkway
// PORT: SOURCE RT8_OP_CODES.agc:25
//#                       Cambridge, Massachusetts
// PORT: SOURCE RT8_OP_CODES.agc:26
//#
// PORT: SOURCE RT8_OP_CODES.agc:27
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE RT8_OP_CODES.agc:28
//#
// PORT: SOURCE RT8_OP_CODES.agc:29
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE RT8_OP_CODES.agc:30
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE RT8_OP_CODES.agc:31
//
// PORT: SOURCE RT8_OP_CODES.agc:32
//# Page 1508
// PORT: SOURCE RT8_OP_CODES.agc:33
//		BANK	22
// PORT: SOURCE RT8_OP_CODES.agc:34
//		SETLOC	RTBCODES
// PORT: SOURCE RT8_OP_CODES.agc:35
//		BANK
// PORT: SOURCE RT8_OP_CODES.agc:36
//
// PORT: SOURCE RT8_OP_CODES.agc:37
//		EBANK=	XNB
// PORT: SOURCE RT8_OP_CODES.agc:38
//		COUNT*	$$/RTB
// PORT: SOURCE RT8_OP_CODES.agc:39
//
// PORT: SOURCE RT8_OP_CODES.agc:40
//# LOAD TIME2, TIME1 INTO MPAC:
// PORT: SOURCE RT8_OP_CODES.agc:41
//
// PORT: SOURCE RT8_OP_CODES.agc:42
//LOADTIME	EXTEND
// PORT: Fixed ROM slots 21320.
                        if slot <> 21320 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 21321 {
// PORT: SOURCE RT8_OP_CODES.agc:43
//		DCA	TIME2
// PORT: Fixed ROM slots 21321.
                            if slot <> 21321 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:44
//		TCF	SLOAD2
// PORT: Fixed ROM slots 21322.
                            if slot <> 21322 or instruction <> 7188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21324 {
                        if slot <= 21323 {
// PORT: SOURCE RT8_OP_CODES.agc:45
//
// PORT: SOURCE RT8_OP_CODES.agc:46
//# CONVERT THE SINGLE PRECISION 2'S COMPLEMENT NUMBER ARRIVING IN MPAC (SCALED IN HALF-REVOLUTIONS) TO A
// PORT: SOURCE RT8_OP_CODES.agc:47
//# DP 1'S COMPLEMENT NUMBER SCALED IN REVOLUTIONS.
// PORT: SOURCE RT8_OP_CODES.agc:48
//
// PORT: SOURCE RT8_OP_CODES.agc:49
//CDULOGIC	CCS	MPAC
// PORT: Fixed ROM slots 21323.
                            if slot <> 21323 or instruction <> 4204 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 108).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:50
//		CAF	ZERO
// PORT: Fixed ROM slots 21324.
                            if slot <> 21324 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 21325 {
// PORT: SOURCE RT8_OP_CODES.agc:51
//		TCF	+3
// PORT: Fixed ROM slots 21325.
                            if slot <> 21325 or instruction <> 5968 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5968, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:52
//		NOOP
// PORT: Fixed ROM slots 21326.
                            if slot <> 21326 or instruction <> 5967 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5967, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 21330 {
                    if slot <= 21328 {
                        if slot <= 21327 {
// PORT: SOURCE RT8_OP_CODES.agc:53
//		CS	HALF
// PORT: Fixed ROM slots 21327.
                            if slot <> 21327 or instruction <> 18946 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:54
//
// PORT: SOURCE RT8_OP_CODES.agc:55
//		TS	MPAC +1
// PORT: Fixed ROM slots 21328.
                            if slot <> 21328 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21329 {
// PORT: SOURCE RT8_OP_CODES.agc:56
//		CAF	ZERO
// PORT: Fixed ROM slots 21329.
                            if slot <> 21329 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:57
//		XCH	MPAC
// PORT: Fixed ROM slots 21330.
                            if slot <> 21330 or instruction <> 23660 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 108, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21332 {
                        if slot <= 21331 {
// PORT: SOURCE RT8_OP_CODES.agc:58
//		EXTEND
// PORT: Fixed ROM slots 21331.
                            if slot <> 21331 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:59
//		MP	HALF
// PORT: Fixed ROM slots 21332.
                            if slot <> 21332 or instruction <> 31234 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21333 {
// PORT: SOURCE RT8_OP_CODES.agc:60
//		DAS	MPAC
// PORT: Fixed ROM slots 21333.
                            if slot <> 21333 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:61
//		TCF	DANZIG		# MODE IS ALREADY AT DOUBLE-PRECISION
// PORT: Fixed ROM slots 21334.
                            if slot <> 21334 or instruction <> 7192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7192, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 21342 {
                if slot <= 21338 {
                    if slot <= 21336 {
                        if slot <= 21335 {
// PORT: SOURCE RT8_OP_CODES.agc:62
//
// PORT: SOURCE RT8_OP_CODES.agc:63
//# READ THE PIPS INTO MPAC WITHOUT CHANGING THEM:
// PORT: SOURCE RT8_OP_CODES.agc:64
//
// PORT: SOURCE RT8_OP_CODES.agc:65
//READPIPS	INHINT
// PORT: Fixed ROM slots 21335.
                            if slot <> 21335 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:66
//		CA	PIPAX
// PORT: Fixed ROM slots 21336.
                            if slot <> 21336 or instruction <> 12319 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 31).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21337 {
// PORT: SOURCE RT8_OP_CODES.agc:67
//		TS	MPAC
// PORT: Fixed ROM slots 21337.
                            if slot <> 21337 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:68
//		CA	PIPAY
// PORT: Fixed ROM slots 21338.
                            if slot <> 21338 or instruction <> 12320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 32).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21340 {
                        if slot <= 21339 {
// PORT: SOURCE RT8_OP_CODES.agc:69
//		TS	MPAC +3
// PORT: Fixed ROM slots 21339.
                            if slot <> 21339 or instruction <> 22639 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22639, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:70
//		CA	PIPAZ
// PORT: Fixed ROM slots 21340.
                            if slot <> 21340 or instruction <> 12321 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 33).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21341 {
// PORT: SOURCE RT8_OP_CODES.agc:71
//		RELINT
// PORT: Fixed ROM slots 21341.
                            if slot <> 21341 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:72
//		TS	MPAC +5
// PORT: Fixed ROM slots 21342.
                            if slot <> 21342 or instruction <> 22641 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 21346 {
                    if slot <= 21344 {
                        if slot <= 21343 {
// PORT: SOURCE RT8_OP_CODES.agc:73
//
// PORT: SOURCE RT8_OP_CODES.agc:74
//		CAF	ZERO
// PORT: Fixed ROM slots 21343.
                            if slot <> 21343 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:75
//		TS	MPAC +1
// PORT: Fixed ROM slots 21344.
                            if slot <> 21344 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21345 {
// PORT: SOURCE RT8_OP_CODES.agc:76
//		TS	MPAC +4
// PORT: Fixed ROM slots 21345.
                            if slot <> 21345 or instruction <> 22640 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22640, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:77
//		TS	MPAC +6
// PORT: Fixed ROM slots 21346.
                            if slot <> 21346 or instruction <> 22642 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22642, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21348 {
                        if slot <= 21347 {
// PORT: SOURCE RT8_OP_CODES.agc:78
//
// PORT: SOURCE RT8_OP_CODES.agc:79
//VECMODE		TCF	VMODE
// PORT: Fixed ROM slots 21347.
                            if slot <> 21347 or instruction <> 7480 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7480, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:80
//
// PORT: SOURCE RT8_OP_CODES.agc:81
//# FORCE TP SIGN AGREEMENT IN MPAC:
// PORT: SOURCE RT8_OP_CODES.agc:82
//
// PORT: SOURCE RT8_OP_CODES.agc:83
//SGNAGREE	TC	TPAGREE
// PORT: Fixed ROM slots 21348.
                            if slot <> 21348 or instruction <> 3734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3734, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21349 {
// PORT: SOURCE RT8_OP_CODES.agc:84
//
// PORT: SOURCE RT8_OP_CODES.agc:85
//# Page 1509
// PORT: SOURCE RT8_OP_CODES.agc:86
//
// PORT: SOURCE RT8_OP_CODES.agc:87
//		TCF	DANZIG
// PORT: Fixed ROM slots 21349.
                            if slot <> 21349 or instruction <> 7192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7192, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:88
//
// PORT: SOURCE RT8_OP_CODES.agc:89
//# CONVERT THE DP 1'S COMPLEMENT ANGLE SCALED IN REVOLUTIONS TO A SINGLE PRECISION 2'S COMPLEMENT ANGLE
// PORT: SOURCE RT8_OP_CODES.agc:90
//# SCALED IN HALF-REVOLUTIONS.
// PORT: SOURCE RT8_OP_CODES.agc:91
//
// PORT: SOURCE RT8_OP_CODES.agc:92
//1STO2S		TC	1TO2SUB
// PORT: Fixed ROM slots 21350.
                            if slot <> 21350 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 21366 {
            if slot <= 21358 {
                if slot <= 21354 {
                    if slot <= 21352 {
                        if slot <= 21351 {
// PORT: SOURCE RT8_OP_CODES.agc:93
//		CAF	ZERO
// PORT: Fixed ROM slots 21351.
                            if slot <> 21351 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:94
//		TS	MPAC +1
// PORT: Fixed ROM slots 21352.
                            if slot <> 21352 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21353 {
// PORT: SOURCE RT8_OP_CODES.agc:95
//		TCF	NEWMODE
// PORT: Fixed ROM slots 21353.
                            if slot <> 21353 or instruction <> 7191 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7191, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:96
//
// PORT: SOURCE RT8_OP_CODES.agc:97
//# DO 1STO2S ON A VECTOR OF ANGLES:
// PORT: SOURCE RT8_OP_CODES.agc:98
//
// PORT: SOURCE RT8_OP_CODES.agc:99
//V1STO2S		TC	1TO2SUB		# ANSWER ARRIVES IN A AND MPAC.
// PORT: Fixed ROM slots 21354.
                            if slot <> 21354 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21356 {
                        if slot <= 21355 {
// PORT: SOURCE RT8_OP_CODES.agc:100
//
// PORT: SOURCE RT8_OP_CODES.agc:101
//		DXCH	MPAC +5
// PORT: Fixed ROM slots 21355.
                            if slot <> 21355 or instruction <> 21618 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:102
//		DXCH	MPAC
// PORT: Fixed ROM slots 21356.
                            if slot <> 21356 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21357 {
// PORT: SOURCE RT8_OP_CODES.agc:103
//		TC	1TO2SUB
// PORT: Fixed ROM slots 21357.
                            if slot <> 21357 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:104
//		TS	MPAC +2
// PORT: Fixed ROM slots 21358.
                            if slot <> 21358 or instruction <> 22638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 21362 {
                    if slot <= 21360 {
                        if slot <= 21359 {
// PORT: SOURCE RT8_OP_CODES.agc:105
//
// PORT: SOURCE RT8_OP_CODES.agc:106
//		DXCH	MPAC +3
// PORT: Fixed ROM slots 21359.
                            if slot <> 21359 or instruction <> 21616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:107
//		DXCH	MPAC
// PORT: Fixed ROM slots 21360.
                            if slot <> 21360 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21361 {
// PORT: SOURCE RT8_OP_CODES.agc:108
//		TC	1TO2SUB
// PORT: Fixed ROM slots 21361.
                            if slot <> 21361 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:109
//		TS	MPAC +1
// PORT: Fixed ROM slots 21362.
                            if slot <> 21362 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21364 {
                        if slot <= 21363 {
// PORT: SOURCE RT8_OP_CODES.agc:110
//
// PORT: SOURCE RT8_OP_CODES.agc:111
//		CA	MPAC +5
// PORT: Fixed ROM slots 21363.
                            if slot <> 21363 or instruction <> 12401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 113).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:112
//		TS	MPAC
// PORT: Fixed ROM slots 21364.
                            if slot <> 21364 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21365 {
// PORT: SOURCE RT8_OP_CODES.agc:113
//
// PORT: SOURCE RT8_OP_CODES.agc:114
//TPMODE		CAF	ONE		# MODE IS TP.
// PORT: Fixed ROM slots 21365.
                            if slot <> 21365 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:115
//		TCF	NEWMODE
// PORT: Fixed ROM slots 21366.
                            if slot <> 21366 or instruction <> 7191 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7191, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 21374 {
                if slot <= 21370 {
                    if slot <= 21368 {
                        if slot <= 21367 {
// PORT: SOURCE RT8_OP_CODES.agc:116
//
// PORT: SOURCE RT8_OP_CODES.agc:117
//# V1STO2S FOR 2 COMPONENT VECTOR. USED BY RR.
// PORT: SOURCE RT8_OP_CODES.agc:118
//
// PORT: SOURCE RT8_OP_CODES.agc:119
//2V1STO2S	TC	1TO2SUB
// PORT: Fixed ROM slots 21367.
                            if slot <> 21367 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:120
//		DXCH	MPAC +3
// PORT: Fixed ROM slots 21368.
                            if slot <> 21368 or instruction <> 21616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21369 {
// PORT: SOURCE RT8_OP_CODES.agc:121
//		DXCH	MPAC
// PORT: Fixed ROM slots 21369.
                            if slot <> 21369 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:122
//		TC	1TO2SUB
// PORT: Fixed ROM slots 21370.
                            if slot <> 21370 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21372 {
                        if slot <= 21371 {
// PORT: SOURCE RT8_OP_CODES.agc:123
//		TS	L
// PORT: Fixed ROM slots 21371.
                            if slot <> 21371 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:124
//		CA	MPAC +3
// PORT: Fixed ROM slots 21372.
                            if slot <> 21372 or instruction <> 12399 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 111).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21373 {
// PORT: SOURCE RT8_OP_CODES.agc:125
//		TCF	SLOAD2
// PORT: Fixed ROM slots 21373.
                            if slot <> 21373 or instruction <> 7188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:126
//
// PORT: SOURCE RT8_OP_CODES.agc:127
//# SUBROUTINE TO DO DOUBLING AND 1'S TO 2'S CONVERSION:
// PORT: SOURCE RT8_OP_CODES.agc:128
//
// PORT: SOURCE RT8_OP_CODES.agc:129
//1TO2SUB		DXCH	MPAC		# FINAL MPAC +1 UNSPECIFIED.
// PORT: Fixed ROM slots 21374.
                            if slot <> 21374 or instruction <> 21613 { return choose false if checkOnly else -1. }
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
                if slot <= 21378 {
                    if slot <= 21376 {
                        if slot <= 21375 {
// PORT: SOURCE RT8_OP_CODES.agc:130
//		DDOUBL
// PORT: Fixed ROM slots 21375.
                            if slot <> 21375 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:131
//		CCS	A
// PORT: Fixed ROM slots 21376.
                            if slot <> 21376 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21377 {
// PORT: SOURCE RT8_OP_CODES.agc:132
//		AD	ONE
// PORT: Fixed ROM slots 21377.
                            if slot <> 21377 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RT8_OP_CODES.agc:133
//		TCF	+2
// PORT: Fixed ROM slots 21378.
                            if slot <> 21378 or instruction <> 6020 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6020, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 21380 {
                        if slot <= 21379 {
// PORT: SOURCE RT8_OP_CODES.agc:134
//		COM			# THIS WAS REVERSE OF MSU.
// PORT: Fixed ROM slots 21379.
                            if slot <> 21379 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:135
//
// PORT: SOURCE RT8_OP_CODES.agc:136
//		TS	MPAC		# AND SKIP ON OVERFLOW.
// PORT: Fixed ROM slots 21380.
                            if slot <> 21380 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21381 {
// PORT: SOURCE RT8_OP_CODES.agc:137
//# Page 1510
// PORT: SOURCE RT8_OP_CODES.agc:138
//		TC	Q
// PORT: Fixed ROM slots 21381.
                            if slot <> 21381 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RT8_OP_CODES.agc:139
//
// PORT: SOURCE RT8_OP_CODES.agc:140
//		INDEX	A		# OVERFLOW UNCORRECT AND IN MSU.
// PORT: Fixed ROM slots 21382.
                            if slot <> 21382 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1209] to agcAotUnit1209@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:141
//		CAF	LIMITS
// PORT: Fixed ROM slots 21383.
    21383, 29696
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21384–21396.
function agcAotUnit1210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21389 {
        if slot <= 21386 {
            if slot <= 21384 {
// PORT: SOURCE RT8_OP_CODES.agc:142
//		ADS	MPAC
// PORT: Fixed ROM slots 21384.
                if slot <> 21384 or instruction <> 11372 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21385 {
// PORT: SOURCE RT8_OP_CODES.agc:143
//		TC	Q
// PORT: Fixed ROM slots 21385.
                    if slot <> 21385 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:144
//
// PORT: SOURCE RT8_OP_CODES.agc:145
//# Page 1511
// PORT: SOURCE RT8_OP_CODES.agc:146
//# SUBROUTINE TO INCREMENT CDUS
// PORT: SOURCE RT8_OP_CODES.agc:147
//
// PORT: SOURCE RT8_OP_CODES.agc:148
//INCRCDUS	CAF	LOCTHETA
// PORT: Fixed ROM slots 21386.
                    if slot <> 21386 or instruction <> 14229 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1941), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21387 {
// PORT: SOURCE RT8_OP_CODES.agc:149
//		TS	BUF		# PLACE ADRES(THETA) IN BUF.
// PORT: Fixed ROM slots 21387.
                if slot <> 21387 or instruction <> 22616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21388 {
// PORT: SOURCE RT8_OP_CODES.agc:150
//		CAE	MPAC		# INCREMENT IN 1S COMPL.
// PORT: Fixed ROM slots 21388.
                    if slot <> 21388 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:151
//		TC	CDUINC
// PORT: Fixed ROM slots 21389.
                    if slot <> 21389 or instruction <> 1942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21392 {
            if slot <= 21390 {
// PORT: SOURCE RT8_OP_CODES.agc:152
//
// PORT: SOURCE RT8_OP_CODES.agc:153
//		INCR	BUF
// PORT: Fixed ROM slots 21390.
                if slot <> 21390 or instruction <> 10328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 88).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21391 {
// PORT: SOURCE RT8_OP_CODES.agc:154
//		CAE	MPAC +3
// PORT: Fixed ROM slots 21391.
                    if slot <> 21391 or instruction <> 12399 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 111).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:155
//		TC	CDUINC
// PORT: Fixed ROM slots 21392.
                    if slot <> 21392 or instruction <> 1942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21394 {
                if slot <= 21393 {
// PORT: SOURCE RT8_OP_CODES.agc:156
//
// PORT: SOURCE RT8_OP_CODES.agc:157
//		INCR	BUF
// PORT: Fixed ROM slots 21393.
                    if slot <> 21393 or instruction <> 10328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:158
//		CAE	MPAC +5
// PORT: Fixed ROM slots 21394.
                    if slot <> 21394 or instruction <> 12401 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21395 {
// PORT: SOURCE RT8_OP_CODES.agc:159
//		TC	CDUINC
// PORT: Fixed ROM slots 21395.
                    if slot <> 21395 or instruction <> 1942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:160
//
// PORT: SOURCE RT8_OP_CODES.agc:161
//		TCF	VECMODE
// PORT: Fixed ROM slots 21396.
                    if slot <> 21396 or instruction <> 5987 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5987, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1210] to agcAotUnit1210@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:162
//
// PORT: SOURCE RT8_OP_CODES.agc:163
//LOCTHETA	ADRES	THETAD
// PORT: Fixed ROM slots 21397.
    21397, 1242
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21398–21399.
function agcAotUnit1211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21398 {
// PORT: SOURCE RT8_OP_CODES.agc:164
//
// PORT: SOURCE RT8_OP_CODES.agc:165
//# THE FOLLOWING ROUTINE INCREMENTS IN 2S COMPLEMENT THE REGISTER WHOSE ADDRESS IS IN BUF BY THE 1S COMPL.
// PORT: SOURCE RT8_OP_CODES.agc:166
//# QUANTITY FOUND IN TEM2.  THIS MAY BE USED TO INCREMENT DESIRED IMU AND OPTICS CDU ANGLES OR ANY OTHER 2S COMPL.
// PORT: SOURCE RT8_OP_CODES.agc:167
//# (+0 UNEQUAL TO -0) QUANTITY.  MAY BE CALLED BY BANKCALL/SWCALL.
// PORT: SOURCE RT8_OP_CODES.agc:168
//
// PORT: SOURCE RT8_OP_CODES.agc:169
//CDUINC		TS	TEM2		# 1S COMPL.QUANT. ARRIVES IN ACC.  STORE IT
// PORT: Fixed ROM slots 21398.
        if slot <> 21398 or instruction <> 22626 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22626, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RT8_OP_CODES.agc:170
//		INDEX	BUF
// PORT: Fixed ROM slots 21399.
        if slot <> 21399 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1211] to agcAotUnit1211@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:171
//		CCS	0		# CHANGE 2S COMPLE. ANGLE(IN BUF) INTO 1S
// PORT: Fixed ROM slots 21400.
    21400, 8192
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21401–21413.
function agcAotUnit1212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21406 {
        if slot <= 21403 {
            if slot <= 21401 {
// PORT: SOURCE RT8_OP_CODES.agc:172
//		AD	ONE
// PORT: Fixed ROM slots 21401.
                if slot <> 21401 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                if slot <= 21402 {
// PORT: SOURCE RT8_OP_CODES.agc:173
//		TCF	+4
// PORT: Fixed ROM slots 21402.
                    if slot <> 21402 or instruction <> 6046 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6046, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:174
//		AD	ONE
// PORT: Fixed ROM slots 21403.
                    if slot <> 21403 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
            if slot <= 21404 {
// PORT: SOURCE RT8_OP_CODES.agc:175
//		AD	ONE		# OVEFLOW HERE IF 2S COMPL. IS 180 DEG.
// PORT: Fixed ROM slots 21404.
                if slot <> 21404 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                if slot <= 21405 {
// PORT: SOURCE RT8_OP_CODES.agc:176
//		COM
// PORT: Fixed ROM slots 21405.
                    if slot <> 21405 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:177
//
// PORT: SOURCE RT8_OP_CODES.agc:178
//		AD	TEM2		# SULT MOVES FROM 2ND TO 3D QUAD.(OR BACK)
// PORT: Fixed ROM slots 21406.
                    if slot <> 21406 or instruction <> 24674 { return choose false if checkOnly else -1. }
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
        if slot <= 21409 {
            if slot <= 21407 {
// PORT: SOURCE RT8_OP_CODES.agc:179
//		CCS	A		# BACK TO 2S COMPL.
// PORT: Fixed ROM slots 21407.
                if slot <> 21407 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21408 {
// PORT: SOURCE RT8_OP_CODES.agc:180
//		AD	ONE
// PORT: Fixed ROM slots 21408.
                    if slot <> 21408 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE RT8_OP_CODES.agc:181
//		TCF	+2
// PORT: Fixed ROM slots 21409.
                    if slot <> 21409 or instruction <> 6051 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6051, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21411 {
                if slot <= 21410 {
// PORT: SOURCE RT8_OP_CODES.agc:182
//		COM
// PORT: Fixed ROM slots 21410.
                    if slot <> 21410 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:183
//		TS	TEM2		# STORE 14BIT QUANTITY WITH PRESENT SIGN
// PORT: Fixed ROM slots 21411.
                    if slot <> 21411 or instruction <> 22626 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22626, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21412 {
// PORT: SOURCE RT8_OP_CODES.agc:184
//		TCF	+4
// PORT: Fixed ROM slots 21412.
                    if slot <> 21412 or instruction <> 6056 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6056, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:185
//		INDEX	A		# SIGN.
// PORT: Fixed ROM slots 21413.
                    if slot <> 21413 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1212] to agcAotUnit1212@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:186
//		CAF	LIMITS		# FIX IT,BY ADDING IN 37777 OR 40000
// PORT: Fixed ROM slots 21414.
    21414, 29696
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21415–21416.
function agcAotUnit1213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21415 {
// PORT: SOURCE RT8_OP_CODES.agc:187
//		AD	TEM2
// PORT: Fixed ROM slots 21415.
        if slot <> 21415 or instruction <> 24674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 98).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RT8_OP_CODES.agc:188
//
// PORT: SOURCE RT8_OP_CODES.agc:189
//		INDEX	BUF
// PORT: Fixed ROM slots 21416.
        if slot <> 21416 or instruction <> 20568 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1213] to agcAotUnit1213@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:190
//		TS	0		# STORE NEW ANGLE IN 2S COMPLEMENT.
// PORT: Fixed ROM slots 21417.
    21417, 45056
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21418–21419.
function agcAotUnit1214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21418 {
// PORT: SOURCE RT8_OP_CODES.agc:191
//		TC	Q
// PORT: Fixed ROM slots 21418.
        if slot <> 21418 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RT8_OP_CODES.agc:192
//
// PORT: SOURCE RT8_OP_CODES.agc:193
//# Page 1512
// PORT: SOURCE RT8_OP_CODES.agc:194
//# RTB TO TORQUE GYROS, EXCEPT FOR THE CALL TO IMUSTALL.  ECADR OF COMMANDS ARRIVES IN X1.
// PORT: SOURCE RT8_OP_CODES.agc:195
//
// PORT: SOURCE RT8_OP_CODES.agc:196
//PULSEIMU	INDEX	FIXLOC		# ADDRESS OF GYRO COMMANDS SHOULD BE IN X1
// PORT: Fixed ROM slots 21419.
        if slot <> 21419 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1214] to agcAotUnit1214@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:197
//		CA	X1
// PORT: Fixed ROM slots 21420.
    21420, 24652
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21421–21421.
function agcAotUnit1215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RT8_OP_CODES.agc:198
//		TC	BANKCALL
// PORT: Fixed ROM slots 21421.
    if slot <> 21421 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1215] to agcAotUnit1215@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:199
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 21422.
    21422, 15628
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21423–21423.
function agcAotUnit1216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RT8_OP_CODES.agc:200
//		TCF	DANZIG
// PORT: Fixed ROM slots 21423.
    if slot <> 21423 or instruction <> 7192 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7192, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1216] to agcAotUnit1216@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:201
//
// PORT: SOURCE RT8_OP_CODES.agc:202
//# Page 1513
// PORT: SOURCE RT8_OP_CODES.agc:203
//# EACH ROUTINE TAKES A 3X3 MATRIX STORED IN DOUBLE PRECISION IN A FIXED AREA OF ERASABLE MEMORY AND REPLACES IT
// PORT: SOURCE RT8_OP_CODES.agc:204
//# WITH THE TRANSPOSE MATRIX.  TRANSP1 USES LOCATIONS XNB+0,+1 THROUGH XNB+16D, 17D AND TRANSP2 USES LOCATIONS
// PORT: SOURCE RT8_OP_CODES.agc:205
//# XNB1+0,+1 THROUGH XNB1+16D, 17D.  EACH MATRIX IS STORED BY ROWS.
// PORT: SOURCE RT8_OP_CODES.agc:206
//
// PORT: SOURCE RT8_OP_CODES.agc:207
//XNBEB		ECADR	XNB
// PORT: Fixed ROM slots 21424.
    21424, 2966,
// PORT: SOURCE RT8_OP_CODES.agc:208
//XNB1EB		ECADR	XNB1
// PORT: Fixed ROM slots 21425.
    21425, 2776
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21426–21456.
function agcAotUnit1217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21440 {
        if slot <= 21432 {
            if slot <= 21428 {
                if slot <= 21426 {
// PORT: SOURCE RT8_OP_CODES.agc:209
//
// PORT: SOURCE RT8_OP_CODES.agc:210
//		EBANK=	XNB
// PORT: SOURCE RT8_OP_CODES.agc:211
//
// PORT: SOURCE RT8_OP_CODES.agc:212
//TRANSP1		CAF	XNBEB
// PORT: Fixed ROM slots 21426.
                    if slot <> 21426 or instruction <> 14256 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1968), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21427 {
// PORT: SOURCE RT8_OP_CODES.agc:213
//		TS	EBANK
// PORT: Fixed ROM slots 21427.
                        if slot <> 21427 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:214
//		DXCH	XNB +2
// PORT: Fixed ROM slots 21428.
                        if slot <> 21428 or instruction <> 22478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 974, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21430 {
                    if slot <= 21429 {
// PORT: SOURCE RT8_OP_CODES.agc:215
//		DXCH	XNB +6
// PORT: Fixed ROM slots 21429.
                        if slot <> 21429 or instruction <> 22482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 978, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:216
//		DXCH	XNB +2
// PORT: Fixed ROM slots 21430.
                        if slot <> 21430 or instruction <> 22478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 974, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21431 {
// PORT: SOURCE RT8_OP_CODES.agc:217
//
// PORT: SOURCE RT8_OP_CODES.agc:218
//		DXCH	XNB +4
// PORT: Fixed ROM slots 21431.
                        if slot <> 21431 or instruction <> 22480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 976, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:219
//		DXCH	XNB +12D
// PORT: Fixed ROM slots 21432.
                        if slot <> 21432 or instruction <> 22488 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 984, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21436 {
                if slot <= 21434 {
                    if slot <= 21433 {
// PORT: SOURCE RT8_OP_CODES.agc:220
//		DXCH	XNB +4
// PORT: Fixed ROM slots 21433.
                        if slot <> 21433 or instruction <> 22480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 976, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:221
//
// PORT: SOURCE RT8_OP_CODES.agc:222
//		DXCH	XNB +10D
// PORT: Fixed ROM slots 21434.
                        if slot <> 21434 or instruction <> 22486 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 982, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21435 {
// PORT: SOURCE RT8_OP_CODES.agc:223
//		DXCH	XNB +14D
// PORT: Fixed ROM slots 21435.
                        if slot <> 21435 or instruction <> 22490 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 986, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:224
//		DXCH	XNB +10D
// PORT: Fixed ROM slots 21436.
                        if slot <> 21436 or instruction <> 22486 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 982, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21438 {
                    if slot <= 21437 {
// PORT: SOURCE RT8_OP_CODES.agc:225
//		TCF	DANZIG
// PORT: Fixed ROM slots 21437.
                        if slot <> 21437 or instruction <> 7192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:226
//
// PORT: SOURCE RT8_OP_CODES.agc:227
//
// PORT: SOURCE RT8_OP_CODES.agc:228
//		EBANK=	XNB1
// PORT: SOURCE RT8_OP_CODES.agc:229
//
// PORT: SOURCE RT8_OP_CODES.agc:230
//TRANSP2		CAF	XNB1EB
// PORT: Fixed ROM slots 21438.
                        if slot <> 21438 or instruction <> 14257 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1969), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21439 {
// PORT: SOURCE RT8_OP_CODES.agc:231
//		TS	EBANK
// PORT: Fixed ROM slots 21439.
                        if slot <> 21439 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:232
//		DXCH	XNB1 +2
// PORT: Fixed ROM slots 21440.
                        if slot <> 21440 or instruction <> 22383 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 879, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 21448 {
            if slot <= 21444 {
                if slot <= 21442 {
                    if slot <= 21441 {
// PORT: SOURCE RT8_OP_CODES.agc:233
//		DXCH	XNB1 +6
// PORT: Fixed ROM slots 21441.
                        if slot <> 21441 or instruction <> 22387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 883, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:234
//		DXCH	XNB1 +2
// PORT: Fixed ROM slots 21442.
                        if slot <> 21442 or instruction <> 22383 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 879, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21443 {
// PORT: SOURCE RT8_OP_CODES.agc:235
//
// PORT: SOURCE RT8_OP_CODES.agc:236
//		DXCH	XNB1 +4
// PORT: Fixed ROM slots 21443.
                        if slot <> 21443 or instruction <> 22385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:237
//		DXCH	XNB1 +12D
// PORT: Fixed ROM slots 21444.
                        if slot <> 21444 or instruction <> 22393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 889, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21446 {
                    if slot <= 21445 {
// PORT: SOURCE RT8_OP_CODES.agc:238
//		DXCH	XNB1 +4
// PORT: Fixed ROM slots 21445.
                        if slot <> 21445 or instruction <> 22385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:239
//
// PORT: SOURCE RT8_OP_CODES.agc:240
//		DXCH	XNB1 +10D
// PORT: Fixed ROM slots 21446.
                        if slot <> 21446 or instruction <> 22391 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 887, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21447 {
// PORT: SOURCE RT8_OP_CODES.agc:241
//		DXCH	XNB1 +14D
// PORT: Fixed ROM slots 21447.
                        if slot <> 21447 or instruction <> 22395 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 891, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:242
//		DXCH	XNB1 +10D
// PORT: Fixed ROM slots 21448.
                        if slot <> 21448 or instruction <> 22391 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 887, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21452 {
                if slot <= 21450 {
                    if slot <= 21449 {
// PORT: SOURCE RT8_OP_CODES.agc:243
//		TCF	DANZIG
// PORT: Fixed ROM slots 21449.
                        if slot <> 21449 or instruction <> 7192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:244
//
// PORT: SOURCE RT8_OP_CODES.agc:245
//# Page 1514
// PORT: SOURCE RT8_OP_CODES.agc:246
//# THE SUBROUTINE SIGNMPAC SETS C(MPAC, MPAC +1) TO SIGN(MPAC).
// PORT: SOURCE RT8_OP_CODES.agc:247
//# FOR THIS, ONLY THE CONTENTS OF MPAC ARE EXAMINED.  ALSO +0 YIELDS POSMAX AND -0 YIELDS NEGMAX.
// PORT: SOURCE RT8_OP_CODES.agc:248
//#
// PORT: SOURCE RT8_OP_CODES.agc:249
//# ENTRY MAY BE BY EITHER OF THE FOLLOWING:
// PORT: SOURCE RT8_OP_CODES.agc:250
//#	1.	LIMIT THE SIZE OF MPAC ON INTERPRETIVE OVERFLOW:
// PORT: SOURCE RT8_OP_CODES.agc:251
//#		ENTRY:		BOVB
// PORT: SOURCE RT8_OP_CODES.agc:252
//#					SIGNMPAC
// PORT: SOURCE RT8_OP_CODES.agc:253
//#	2.	GENERATE IN MPAC THE SIGNUM FUNCTION OF MPAC:
// PORT: SOURCE RT8_OP_CODES.agc:254
//#		ENTRY:		RTB
// PORT: SOURCE RT8_OP_CODES.agc:255
//#					SIGNMPAC
// PORT: SOURCE RT8_OP_CODES.agc:256
//# IN EITHER CASE, RETURN IS TO TEH NEXT INTERPRETIVE INSTRUCTION IN THE CALLING SEQUENCE.
// PORT: SOURCE RT8_OP_CODES.agc:257
//
// PORT: SOURCE RT8_OP_CODES.agc:258
//SIGNMPAC	EXTEND
// PORT: Fixed ROM slots 21450.
                        if slot <> 21450 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21451 {
// PORT: SOURCE RT8_OP_CODES.agc:259
//		DCA	DPOSMAX
// PORT: Fixed ROM slots 21451.
                        if slot <> 21451 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2559, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:260
//		DXCH	MPAC
// PORT: Fixed ROM slots 21452.
                        if slot <> 21452 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21454 {
                    if slot <= 21453 {
// PORT: SOURCE RT8_OP_CODES.agc:261
//		CCS	A
// PORT: Fixed ROM slots 21453.
                        if slot <> 21453 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:262
//DPMODE		CAF	ZERO		# SETS MPAC +2 TO ZERO IN THE PROCESS
// PORT: Fixed ROM slots 21454.
                        if slot <> 21454 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    if slot <= 21455 {
// PORT: SOURCE RT8_OP_CODES.agc:263
//		TCF	SLOAD2 +2
// PORT: Fixed ROM slots 21455.
                        if slot <> 21455 or instruction <> 7190 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7190, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:264
//		TCF	+1
// PORT: Fixed ROM slots 21456.
                        if slot <> 21456 or instruction <> 6097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6097, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1217] to agcAotUnit1217@.

// PORT: Physical bank 22. Shared continuation entries, slots 21457–21465.
function agcAotUnit1218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21460 {
        if slot <= 21458 {
            if slot <= 21457 {
// PORT: SOURCE RT8_OP_CODES.agc:265
//		EXTEND
// PORT: Fixed ROM slots 21457.
                if slot <> 21457 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RT8_OP_CODES.agc:266
//		DCS	DPOSMAX
// PORT: Fixed ROM slots 21458.
                if slot <> 21458 or instruction <> 18943 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 2559, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21459 {
// PORT: SOURCE RT8_OP_CODES.agc:267
//		TCF	SLOAD2
// PORT: Fixed ROM slots 21459.
                if slot <> 21459 or instruction <> 7188 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7188, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RT8_OP_CODES.agc:268
//
// PORT: SOURCE RT8_OP_CODES.agc:269
//# RTB OP CODE NORMUNIT IS LIKE INTERPRETIVE INSTRUCTION UNIT, EXCEPT THAT IT CAN BE DEPENDED ON NOT TO BLOW
// PORT: SOURCE RT8_OP_CODES.agc:270
//# UP WHEN THE VECTOR BEING UNITIZED IS VERY SMALL -- IT WILL BLOW UP WHEN ALL COMPONENT ARE ZERO.  IF NORMUNIT
// PORT: SOURCE RT8_OP_CODES.agc:271
//# IS USED AND THE UPPER ORDER HALVES OF ALL COMPONENTS ARE ZERO, THE MAGNITUDE RETURNS IN 36D WILL BE TOO LARGE
// PORT: SOURCE RT8_OP_CODES.agc:272
//# BY A FACTOR OF 2(13) AND THE SQUARED MAGNITUDE RETURNED AT 34D WILL BE TOO BIG BY A FACTOR OF 2(26).
// PORT: SOURCE RT8_OP_CODES.agc:273
//
// PORT: SOURCE RT8_OP_CODES.agc:274
//NORMUNX1	CAF	ONE
// PORT: Fixed ROM slots 21460.
                if slot <> 21460 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 21462 {
            if slot <= 21461 {
// PORT: SOURCE RT8_OP_CODES.agc:275
//		TCF	NORMUNIT +1
// PORT: Fixed ROM slots 21461.
                if slot <> 21461 or instruction <> 6103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RT8_OP_CODES.agc:276
//NORMUNIT	CAF	ZERO
// PORT: Fixed ROM slots 21462.
                if slot <> 21462 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 21463 {
// PORT: SOURCE RT8_OP_CODES.agc:277
//		AD	FIXLOC
// PORT: Fixed ROM slots 21463.
                if slot <> 21463 or instruction <> 24656 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 80).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21464 {
// PORT: SOURCE RT8_OP_CODES.agc:278
//		TS	MPAC +2
// PORT: Fixed ROM slots 21464.
                    if slot <> 21464 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RT8_OP_CODES.agc:279
//		TC	BANKCALL	# GET SIGN AGREEMENT IN ALL COMPONENTS
// PORT: Fixed ROM slots 21465.
                    if slot <> 21465 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1218] to agcAotUnit1218@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:280
//		CADR	VECAGREE
// PORT: Fixed ROM slots 21466.
    21466, 1040
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21467–21492.
function agcAotUnit1219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21479 {
        if slot <= 21472 {
            if slot <= 21469 {
                if slot <= 21467 {
// PORT: SOURCE RT8_OP_CODES.agc:281
//		CCS	MPAC
// PORT: Fixed ROM slots 21467.
                    if slot <> 21467 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21468 {
// PORT: SOURCE RT8_OP_CODES.agc:282
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21468.
                        if slot <> 21468 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:283
//		TCF	+2
// PORT: Fixed ROM slots 21469.
                        if slot <> 21469 or instruction <> 6111 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6111, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21470 {
// PORT: SOURCE RT8_OP_CODES.agc:284
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21470.
                    if slot <> 21470 or instruction <> 6136 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6136, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21471 {
// PORT: SOURCE RT8_OP_CODES.agc:285
//		CCS	MPAC +3
// PORT: Fixed ROM slots 21471.
                        if slot <> 21471 or instruction <> 4207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 111).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:286
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21472.
                        if slot <> 21472 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 21475 {
                if slot <= 21473 {
// PORT: SOURCE RT8_OP_CODES.agc:287
//		TCF	+2
// PORT: Fixed ROM slots 21473.
                    if slot <> 21473 or instruction <> 6115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21474 {
// PORT: SOURCE RT8_OP_CODES.agc:288
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21474.
                        if slot <> 21474 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:289
//		CCS	MPAC +5
// PORT: Fixed ROM slots 21475.
                        if slot <> 21475 or instruction <> 4209 { return choose false if checkOnly else -1. }
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
                if slot <= 21477 {
                    if slot <= 21476 {
// PORT: SOURCE RT8_OP_CODES.agc:290
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21476.
                        if slot <> 21476 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:291
//		TCF	+2
// PORT: Fixed ROM slots 21477.
                        if slot <> 21477 or instruction <> 6119 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6119, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21478 {
// PORT: SOURCE RT8_OP_CODES.agc:292
//		TCF	NOSHIFT
// PORT: Fixed ROM slots 21478.
                        if slot <> 21478 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:293
//# Page 1515
// PORT: SOURCE RT8_OP_CODES.agc:294
//		CA	MPAC +1		# SHIFT ALL COMPONENTS LEFT 13
// PORT: Fixed ROM slots 21479.
                        if slot <> 21479 or instruction <> 12397 { return choose false if checkOnly else -1. }
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
        if slot <= 21485 {
            if slot <= 21482 {
                if slot <= 21480 {
// PORT: SOURCE RT8_OP_CODES.agc:295
//		EXTEND
// PORT: Fixed ROM slots 21480.
                    if slot <> 21480 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21481 {
// PORT: SOURCE RT8_OP_CODES.agc:296
//		MP	BIT14
// PORT: Fixed ROM slots 21481.
                        if slot <> 21481 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:297
//		DAS	MPAC		# DAS GAINS A LITTLE ACCURACY
// PORT: Fixed ROM slots 21482.
                        if slot <> 21482 or instruction <> 8301 { return choose false if checkOnly else -1. }
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
                if slot <= 21483 {
// PORT: SOURCE RT8_OP_CODES.agc:298
//		CA	MPAC +4
// PORT: Fixed ROM slots 21483.
                    if slot <> 21483 or instruction <> 12400 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 112).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21484 {
// PORT: SOURCE RT8_OP_CODES.agc:299
//		EXTEND
// PORT: Fixed ROM slots 21484.
                        if slot <> 21484 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:300
//		MP	BIT14
// PORT: Fixed ROM slots 21485.
                        if slot <> 21485 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 21488 {
                if slot <= 21486 {
// PORT: SOURCE RT8_OP_CODES.agc:301
//		DAS	MPAC +3
// PORT: Fixed ROM slots 21486.
                    if slot <> 21486 or instruction <> 8304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 112) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21487 {
// PORT: SOURCE RT8_OP_CODES.agc:302
//		CA	MPAC +6
// PORT: Fixed ROM slots 21487.
                        if slot <> 21487 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:303
//		EXTEND
// PORT: Fixed ROM slots 21488.
                        if slot <> 21488 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 21490 {
                    if slot <= 21489 {
// PORT: SOURCE RT8_OP_CODES.agc:304
//		MP	BIT14
// PORT: Fixed ROM slots 21489.
                        if slot <> 21489 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:305
//		DAS	MPAC +5
// PORT: Fixed ROM slots 21490.
                        if slot <> 21490 or instruction <> 8306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 114) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21491 {
// PORT: SOURCE RT8_OP_CODES.agc:306
//		CAF	THIRTEEN
// PORT: Fixed ROM slots 21491.
                        if slot <> 21491 or instruction <> 14869 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RT8_OP_CODES.agc:307
//		INDEX	MPAC +2
// PORT: Fixed ROM slots 21492.
                        if slot <> 21492 or instruction <> 20590 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1219] to agcAotUnit1219@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:308
//		TS	37D
// PORT: Fixed ROM slots 21493.
    21493, 45130
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21494–21494.
function agcAotUnit1220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RT8_OP_CODES.agc:309
//OFFTUNIT	TC	POSTJUMP
// PORT: Fixed ROM slots 21494.
    if slot <> 21494 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1220] to agcAotUnit1220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:310
//		CADR	UNIT +1		# SKIP THE "TC VECAGREE" DONE AT UNIT
// PORT: Fixed ROM slots 21495.
    21495, 1064
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21496–21498.
function agcAotUnit1221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21496 {
// PORT: SOURCE RT8_OP_CODES.agc:311
//
// PORT: SOURCE RT8_OP_CODES.agc:312
//NOSHIFT		CAF	ZERO
// PORT: Fixed ROM slots 21496.
        if slot <> 21496 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21497 {
// PORT: SOURCE RT8_OP_CODES.agc:313
//		TCF	OFFTUNIT -2
// PORT: Fixed ROM slots 21497.
            if slot <> 21497 or instruction <> 6132 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6132, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RT8_OP_CODES.agc:314
//
// PORT: SOURCE RT8_OP_CODES.agc:315
//# RTB VECSGNAG ...FORCES SIGN AGREEMENT OF VECTOR IN MPAC.
// PORT: SOURCE RT8_OP_CODES.agc:316
//
// PORT: SOURCE RT8_OP_CODES.agc:317
//VECSGNAG	TC	BANKCALL
// PORT: Fixed ROM slots 21498.
            if slot <> 21498 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1221] to agcAotUnit1221@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:318
//		CADR	VECAGREE
// PORT: Fixed ROM slots 21499.
    21499, 1040
)).

// PORT: Physical bank 22. Shared continuation entries, slots 21500–21500.
function agcAotUnit1222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RT8_OP_CODES.agc:319
//		TC	DANZIG
// PORT: Fixed ROM slots 21500.
    if slot <> 21500 or instruction <> 3096 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3096, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1222] to agcAotUnit1222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RT8_OP_CODES.agc:320
//
// PORT: SOURCE RT8_OP_CODES.agc:321
//# Page 1516
// PORT: SOURCE RT8_OP_CODES.agc:322
//# MODULE CHANGE FOR NEW LUNAR GRAVITY MODEL
// PORT: SOURCE RT8_OP_CODES.agc:323
//		SETLOC	MODCHG3
// PORT: SOURCE RT8_OP_CODES.agc:324
//		BANK
// PORT: SOURCE RT8_OP_CODES.agc:325
//QUALITY1	BOF	DLOAD
// PORT: Fixed ROM slots 14328.
    14328, 58648,
// PORT: SOURCE RT8_OP_CODES.agc:326
//			MOONFLAG
// PORT: Fixed ROM slots 14329.
    14329, 454,
// PORT: SOURCE RT8_OP_CODES.agc:327
//			NBRANCH
// PORT: Fixed ROM slots 14330.
    14330, 19744,
// PORT: SOURCE RT8_OP_CODES.agc:328
//			URPV
// PORT: Fixed ROM slots 14331.
    14331, 30,
// PORT: SOURCE RT8_OP_CODES.agc:329
//		DSQ	GOTO
// PORT: Fixed ROM slots 14332.
    14332, 43164,
// PORT: SOURCE RT8_OP_CODES.agc:330
//			QUALITY2
// PORT: Fixed ROM slots 14333.
    14333, 22488,
// PORT: SOURCE RT8_OP_CODES.agc:331
//		SETLOC	MODCHG2
// PORT: SOURCE RT8_OP_CODES.agc:332
//		BANK
// PORT: SOURCE RT8_OP_CODES.agc:333
//QUALITY2	PDDL	DSQ		# SQUARE INTO 2D, B2
// PORT: Fixed ROM slots 13292.
    13292, 52906,
// PORT: SOURCE RT8_OP_CODES.agc:334
//			URPV	+2	# Y COMPONENT, B1
// PORT: Fixed ROM slots 13293.
    13293, 34,
// PORT: SOURCE RT8_OP_CODES.agc:335
//		DSU
// PORT: Fixed ROM slots 13294.
    13294, 65322,
// PORT: SOURCE RT8_OP_CODES.agc:336
//		DMP	VXSC		# 5(Y**2-X**2)UR
// PORT: Fixed ROM slots 13295.
    13295, 61706,
// PORT: SOURCE RT8_OP_CODES.agc:337
//			5/8		# CONSTANT, 5B3
// PORT: Fixed ROM slots 13296.
    13296, 24538,
// PORT: SOURCE RT8_OP_CODES.agc:338
//			URPV		# VECTOR, RESULT MAXIMUM IS 5, SCALING
// PORT: Fixed ROM slots 13297.
    13297, 30,
// PORT: SOURCE RT8_OP_CODES.agc:339
//					# HERE B6
// PORT: SOURCE RT8_OP_CODES.agc:340
//		VSL3	PDDL		# STORE SCALED B3 IN 2D, 4D, 6D FOR XYZ
// PORT: Fixed ROM slots 13298.
    13298, 54708,
// PORT: SOURCE RT8_OP_CODES.agc:341
//			URPV		# X COMPONENT, B1
// PORT: Fixed ROM slots 13299.
    13299, 30,
// PORT: SOURCE RT8_OP_CODES.agc:342
//		SR1	DAD		# 2 X X COMPONENT FOR B3 SCALING
// PORT: Fixed ROM slots 13300.
    13300, 36292,
// PORT: SOURCE RT8_OP_CODES.agc:343
//			2D		# ADD TO VECTOR X COMPONENT OF ANSWER.
// PORT: Fixed ROM slots 13301.
    13301, 6,
// PORT: SOURCE RT8_OP_CODES.agc:344
//					# SAME AS MULTIPLYING BY UNITX.  MAX IS 7.
// PORT: SOURCE RT8_OP_CODES.agc:345
//		STODL	2D
// PORT: Fixed ROM slots 13302.
    13302, 12294,
// PORT: SOURCE RT8_OP_CODES.agc:346
//			URPV	+2	# Y COMPONENT, B1
// PORT: Fixed ROM slots 13303.
    13303, 34,
// PORT: SOURCE RT8_OP_CODES.agc:347
//		SR1	BDSU		# 2 X Y COMPONENT FOR B3 SCALING
// PORT: Fixed ROM slots 13304.
    13304, 37316,
// PORT: SOURCE RT8_OP_CODES.agc:348
//			4D		# SUBTRACT FROM VECTOR Y COMPONENT OF
// PORT: Fixed ROM slots 13305.
    13305, 10,
// PORT: SOURCE RT8_OP_CODES.agc:349
//					# ANSWER, SAME AS MULTIPLYING BY UNITY.
// PORT: SOURCE RT8_OP_CODES.agc:350
//					# MAX IS 7.
// PORT: SOURCE RT8_OP_CODES.agc:351
//		STORE 	4D		# 2D HAS VECTOR, B3.
// PORT: Fixed ROM slots 13306.
    13306, 10,
// PORT: SOURCE RT8_OP_CODES.agc:352
//		SLOAD	VXSC		# MULTIPLY COEFFICIENT TIMES VECTOR IN 2D
// PORT: Fixed ROM slots 13307.
    13307, 61882,
// PORT: SOURCE RT8_OP_CODES.agc:353
//			E3J22R2M
// PORT: Fixed ROM slots 13308.
    13308, 2046,
// PORT: SOURCE RT8_OP_CODES.agc:354
//		PDDL	RVQ		# J22 TERM X R**4 IN 2D, SCALED B61
// PORT: Fixed ROM slots 13309.
    13309, 36522,
// PORT: SOURCE RT8_OP_CODES.agc:355
//			COSPHI/2	# SAME AS URPV +4, Z COMPONENT
// PORT: Fixed ROM slots 13310.
    13310, 38
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE RT8_OP_CODES.agc:356
//
// PORT: SOURCE RT8_OP_CODES.agc:357
//# *** END OF CHIEFTAN.028 ***
// PORT: SOURCE RT8_OP_CODES.agc:358
//
