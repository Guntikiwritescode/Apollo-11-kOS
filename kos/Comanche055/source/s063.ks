// RT8_OP_CODES.agc
// bank 22, slots 21320-21382
function agcAotUnit1209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21350 {
        if slot <= 21334 {
            if slot <= 21326 {
                if slot <= 21322 {
                    if slot <= 21320 {
// RT8_OP_CODES.agc:1
//# Copyright:    Public domain.
// RT8_OP_CODES.agc:2
//# Filename:     RT8_OP_CODES.agc
// RT8_OP_CODES.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// RT8_OP_CODES.agc:4
//#               is part of the source code for the Command Module's
// RT8_OP_CODES.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// RT8_OP_CODES.agc:6
//# Assembler:    yaYUL
// RT8_OP_CODES.agc:7
//# Reference:    pp. 1508-1516
// RT8_OP_CODES.agc:8
//# Contact:      Burkey Kerman <info@sandroid.org>
// RT8_OP_CODES.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// RT8_OP_CODES.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249/RT8_OP_CODES.agc
// RT8_OP_CODES.agc:11
//#				and page images.
// RT8_OP_CODES.agc:12
//#		2009-05-07 RSB	Oops! Left out the entire last page before.
// RT8_OP_CODES.agc:13
//#
// RT8_OP_CODES.agc:14
//# The contents of the "Comanche055" files, in general, are transcribed
// RT8_OP_CODES.agc:15
//# from scanned documents.
// RT8_OP_CODES.agc:16
//#
// RT8_OP_CODES.agc:17
//#       Assemble revision 055 of AGC program Comanche by NASA
// RT8_OP_CODES.agc:18
//#       2021113-051.  April 1, 1969.
// RT8_OP_CODES.agc:19
//#
// RT8_OP_CODES.agc:20
//#       This AGC program shall also be referred to as Colossus 2A
// RT8_OP_CODES.agc:21
//#
// RT8_OP_CODES.agc:22
//#       Prepared by
// RT8_OP_CODES.agc:23
//#                       Massachusetts Institute of Technology
// RT8_OP_CODES.agc:24
//#                       75 Cambridge Parkway
// RT8_OP_CODES.agc:25
//#                       Cambridge, Massachusetts
// RT8_OP_CODES.agc:26
//#
// RT8_OP_CODES.agc:27
//#       under NASA contract NAS 9-4065.
// RT8_OP_CODES.agc:28
//#
// RT8_OP_CODES.agc:29
//# Refer directly to the online document mentioned above for further
// RT8_OP_CODES.agc:30
//# information.  Please report any errors to info@sandroid.org.
// RT8_OP_CODES.agc:31
//
// RT8_OP_CODES.agc:32
//# Page 1508
// RT8_OP_CODES.agc:33
//		BANK	22
// RT8_OP_CODES.agc:34
//		SETLOC	RTBCODES
// RT8_OP_CODES.agc:35
//		BANK
// RT8_OP_CODES.agc:36
//
// RT8_OP_CODES.agc:37
//		EBANK=	XNB
// RT8_OP_CODES.agc:38
//		COUNT*	$$/RTB
// RT8_OP_CODES.agc:39
//
// RT8_OP_CODES.agc:40
//# LOAD TIME2, TIME1 INTO MPAC:
// RT8_OP_CODES.agc:41
//
// RT8_OP_CODES.agc:42
//LOADTIME	EXTEND
// slot 21320
                        if slot <> 21320 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 21321 {
// RT8_OP_CODES.agc:43
//		DCA	TIME2
// slot 21321
                            if slot <> 21321 or instruction <> 12309 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:44
//		TCF	SLOAD2
// slot 21322
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
// RT8_OP_CODES.agc:45
//
// RT8_OP_CODES.agc:46
//# CONVERT THE SINGLE PRECISION 2'S COMPLEMENT NUMBER ARRIVING IN MPAC (SCALED IN HALF-REVOLUTIONS) TO A
// RT8_OP_CODES.agc:47
//# DP 1'S COMPLEMENT NUMBER SCALED IN REVOLUTIONS.
// RT8_OP_CODES.agc:48
//
// RT8_OP_CODES.agc:49
//CDULOGIC	CCS	MPAC
// slot 21323
                            if slot <> 21323 or instruction <> 4204 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 108).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:50
//		CAF	ZERO
// slot 21324
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
// RT8_OP_CODES.agc:51
//		TCF	+3
// slot 21325
                            if slot <> 21325 or instruction <> 5968 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5968, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:52
//		NOOP
// slot 21326
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
// RT8_OP_CODES.agc:53
//		CS	HALF
// slot 21327
                            if slot <> 21327 or instruction <> 18946 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:54
//
// RT8_OP_CODES.agc:55
//		TS	MPAC +1
// slot 21328
                            if slot <> 21328 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21329 {
// RT8_OP_CODES.agc:56
//		CAF	ZERO
// slot 21329
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
// RT8_OP_CODES.agc:57
//		XCH	MPAC
// slot 21330
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
// RT8_OP_CODES.agc:58
//		EXTEND
// slot 21331
                            if slot <> 21331 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:59
//		MP	HALF
// slot 21332
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
// RT8_OP_CODES.agc:60
//		DAS	MPAC
// slot 21333
                            if slot <> 21333 or instruction <> 8301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 109) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:61
//		TCF	DANZIG		# MODE IS ALREADY AT DOUBLE-PRECISION
// slot 21334
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
// RT8_OP_CODES.agc:62
//
// RT8_OP_CODES.agc:63
//# READ THE PIPS INTO MPAC WITHOUT CHANGING THEM:
// RT8_OP_CODES.agc:64
//
// RT8_OP_CODES.agc:65
//READPIPS	INHINT
// slot 21335
                            if slot <> 21335 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:66
//		CA	PIPAX
// slot 21336
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
// RT8_OP_CODES.agc:67
//		TS	MPAC
// slot 21337
                            if slot <> 21337 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:68
//		CA	PIPAY
// slot 21338
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
// RT8_OP_CODES.agc:69
//		TS	MPAC +3
// slot 21339
                            if slot <> 21339 or instruction <> 22639 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22639, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:70
//		CA	PIPAZ
// slot 21340
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
// RT8_OP_CODES.agc:71
//		RELINT
// slot 21341
                            if slot <> 21341 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:72
//		TS	MPAC +5
// slot 21342
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
// RT8_OP_CODES.agc:73
//
// RT8_OP_CODES.agc:74
//		CAF	ZERO
// slot 21343
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
// RT8_OP_CODES.agc:75
//		TS	MPAC +1
// slot 21344
                            if slot <> 21344 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21345 {
// RT8_OP_CODES.agc:76
//		TS	MPAC +4
// slot 21345
                            if slot <> 21345 or instruction <> 22640 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22640, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:77
//		TS	MPAC +6
// slot 21346
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
// RT8_OP_CODES.agc:78
//
// RT8_OP_CODES.agc:79
//VECMODE		TCF	VMODE
// slot 21347
                            if slot <> 21347 or instruction <> 7480 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7480, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:80
//
// RT8_OP_CODES.agc:81
//# FORCE TP SIGN AGREEMENT IN MPAC:
// RT8_OP_CODES.agc:82
//
// RT8_OP_CODES.agc:83
//SGNAGREE	TC	TPAGREE
// slot 21348
                            if slot <> 21348 or instruction <> 3734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3734, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21349 {
// RT8_OP_CODES.agc:84
//
// RT8_OP_CODES.agc:85
//# Page 1509
// RT8_OP_CODES.agc:86
//
// RT8_OP_CODES.agc:87
//		TCF	DANZIG
// slot 21349
                            if slot <> 21349 or instruction <> 7192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7192, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:88
//
// RT8_OP_CODES.agc:89
//# CONVERT THE DP 1'S COMPLEMENT ANGLE SCALED IN REVOLUTIONS TO A SINGLE PRECISION 2'S COMPLEMENT ANGLE
// RT8_OP_CODES.agc:90
//# SCALED IN HALF-REVOLUTIONS.
// RT8_OP_CODES.agc:91
//
// RT8_OP_CODES.agc:92
//1STO2S		TC	1TO2SUB
// slot 21350
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
// RT8_OP_CODES.agc:93
//		CAF	ZERO
// slot 21351
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
// RT8_OP_CODES.agc:94
//		TS	MPAC +1
// slot 21352
                            if slot <> 21352 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21353 {
// RT8_OP_CODES.agc:95
//		TCF	NEWMODE
// slot 21353
                            if slot <> 21353 or instruction <> 7191 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7191, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:96
//
// RT8_OP_CODES.agc:97
//# DO 1STO2S ON A VECTOR OF ANGLES:
// RT8_OP_CODES.agc:98
//
// RT8_OP_CODES.agc:99
//V1STO2S		TC	1TO2SUB		# ANSWER ARRIVES IN A AND MPAC.
// slot 21354
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
// RT8_OP_CODES.agc:100
//
// RT8_OP_CODES.agc:101
//		DXCH	MPAC +5
// slot 21355
                            if slot <> 21355 or instruction <> 21618 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 114, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:102
//		DXCH	MPAC
// slot 21356
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
// RT8_OP_CODES.agc:103
//		TC	1TO2SUB
// slot 21357
                            if slot <> 21357 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:104
//		TS	MPAC +2
// slot 21358
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
// RT8_OP_CODES.agc:105
//
// RT8_OP_CODES.agc:106
//		DXCH	MPAC +3
// slot 21359
                            if slot <> 21359 or instruction <> 21616 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:107
//		DXCH	MPAC
// slot 21360
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
// RT8_OP_CODES.agc:108
//		TC	1TO2SUB
// slot 21361
                            if slot <> 21361 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:109
//		TS	MPAC +1
// slot 21362
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
// RT8_OP_CODES.agc:110
//
// RT8_OP_CODES.agc:111
//		CA	MPAC +5
// slot 21363
                            if slot <> 21363 or instruction <> 12401 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 113).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:112
//		TS	MPAC
// slot 21364
                            if slot <> 21364 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21365 {
// RT8_OP_CODES.agc:113
//
// RT8_OP_CODES.agc:114
//TPMODE		CAF	ONE		# MODE IS TP.
// slot 21365
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
// RT8_OP_CODES.agc:115
//		TCF	NEWMODE
// slot 21366
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
// RT8_OP_CODES.agc:116
//
// RT8_OP_CODES.agc:117
//# V1STO2S FOR 2 COMPONENT VECTOR. USED BY RR.
// RT8_OP_CODES.agc:118
//
// RT8_OP_CODES.agc:119
//2V1STO2S	TC	1TO2SUB
// slot 21367
                            if slot <> 21367 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:120
//		DXCH	MPAC +3
// slot 21368
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
// RT8_OP_CODES.agc:121
//		DXCH	MPAC
// slot 21369
                            if slot <> 21369 or instruction <> 21613 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:122
//		TC	1TO2SUB
// slot 21370
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
// RT8_OP_CODES.agc:123
//		TS	L
// slot 21371
                            if slot <> 21371 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:124
//		CA	MPAC +3
// slot 21372
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
// RT8_OP_CODES.agc:125
//		TCF	SLOAD2
// slot 21373
                            if slot <> 21373 or instruction <> 7188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 7188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:126
//
// RT8_OP_CODES.agc:127
//# SUBROUTINE TO DO DOUBLING AND 1'S TO 2'S CONVERSION:
// RT8_OP_CODES.agc:128
//
// RT8_OP_CODES.agc:129
//1TO2SUB		DXCH	MPAC		# FINAL MPAC +1 UNSPECIFIED.
// slot 21374
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
// RT8_OP_CODES.agc:130
//		DDOUBL
// slot 21375
                            if slot <> 21375 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:131
//		CCS	A
// slot 21376
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
// RT8_OP_CODES.agc:132
//		AD	ONE
// slot 21377
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
// RT8_OP_CODES.agc:133
//		TCF	+2
// slot 21378
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
// RT8_OP_CODES.agc:134
//		COM			# THIS WAS REVERSE OF MSU.
// slot 21379
                            if slot <> 21379 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:135
//
// RT8_OP_CODES.agc:136
//		TS	MPAC		# AND SKIP ON OVERFLOW.
// slot 21380
                            if slot <> 21380 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 21381 {
// RT8_OP_CODES.agc:137
//# Page 1510
// RT8_OP_CODES.agc:138
//		TC	Q
// slot 21381
                            if slot <> 21381 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RT8_OP_CODES.agc:139
//
// RT8_OP_CODES.agc:140
//		INDEX	A		# OVERFLOW UNCORRECT AND IN MSU.
// slot 21382
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
// RT8_OP_CODES.agc:141
//		CAF	LIMITS
// slot 21383
    21383, 29696
)).

// bank 22, slots 21384-21396
function agcAotUnit1210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21389 {
        if slot <= 21386 {
            if slot <= 21384 {
// RT8_OP_CODES.agc:142
//		ADS	MPAC
// slot 21384
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
// RT8_OP_CODES.agc:143
//		TC	Q
// slot 21385
                    if slot <> 21385 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:144
//
// RT8_OP_CODES.agc:145
//# Page 1511
// RT8_OP_CODES.agc:146
//# SUBROUTINE TO INCREMENT CDUS
// RT8_OP_CODES.agc:147
//
// RT8_OP_CODES.agc:148
//INCRCDUS	CAF	LOCTHETA
// slot 21386
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
// RT8_OP_CODES.agc:149
//		TS	BUF		# PLACE ADRES(THETA) IN BUF.
// slot 21387
                if slot <> 21387 or instruction <> 22616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22616, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21388 {
// RT8_OP_CODES.agc:150
//		CAE	MPAC		# INCREMENT IN 1S COMPL.
// slot 21388
                    if slot <> 21388 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:151
//		TC	CDUINC
// slot 21389
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
// RT8_OP_CODES.agc:152
//
// RT8_OP_CODES.agc:153
//		INCR	BUF
// slot 21390
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
// RT8_OP_CODES.agc:154
//		CAE	MPAC +3
// slot 21391
                    if slot <> 21391 or instruction <> 12399 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 111).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:155
//		TC	CDUINC
// slot 21392
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
// RT8_OP_CODES.agc:156
//
// RT8_OP_CODES.agc:157
//		INCR	BUF
// slot 21393
                    if slot <> 21393 or instruction <> 10328 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 88).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:158
//		CAE	MPAC +5
// slot 21394
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
// RT8_OP_CODES.agc:159
//		TC	CDUINC
// slot 21395
                    if slot <> 21395 or instruction <> 1942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:160
//
// RT8_OP_CODES.agc:161
//		TCF	VECMODE
// slot 21396
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
// RT8_OP_CODES.agc:162
//
// RT8_OP_CODES.agc:163
//LOCTHETA	ADRES	THETAD
// slot 21397
    21397, 1242
)).

// bank 22, slots 21398-21399
function agcAotUnit1211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21398 {
// RT8_OP_CODES.agc:164
//
// RT8_OP_CODES.agc:165
//# THE FOLLOWING ROUTINE INCREMENTS IN 2S COMPLEMENT THE REGISTER WHOSE ADDRESS IS IN BUF BY THE 1S COMPL.
// RT8_OP_CODES.agc:166
//# QUANTITY FOUND IN TEM2.  THIS MAY BE USED TO INCREMENT DESIRED IMU AND OPTICS CDU ANGLES OR ANY OTHER 2S COMPL.
// RT8_OP_CODES.agc:167
//# (+0 UNEQUAL TO -0) QUANTITY.  MAY BE CALLED BY BANKCALL/SWCALL.
// RT8_OP_CODES.agc:168
//
// RT8_OP_CODES.agc:169
//CDUINC		TS	TEM2		# 1S COMPL.QUANT. ARRIVES IN ACC.  STORE IT
// slot 21398
        if slot <> 21398 or instruction <> 22626 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22626, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RT8_OP_CODES.agc:170
//		INDEX	BUF
// slot 21399
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
// RT8_OP_CODES.agc:171
//		CCS	0		# CHANGE 2S COMPLE. ANGLE(IN BUF) INTO 1S
// slot 21400
    21400, 8192
)).

// bank 22, slots 21401-21413
function agcAotUnit1212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21406 {
        if slot <= 21403 {
            if slot <= 21401 {
// RT8_OP_CODES.agc:172
//		AD	ONE
// slot 21401
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
// RT8_OP_CODES.agc:173
//		TCF	+4
// slot 21402
                    if slot <> 21402 or instruction <> 6046 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6046, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:174
//		AD	ONE
// slot 21403
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
// RT8_OP_CODES.agc:175
//		AD	ONE		# OVEFLOW HERE IF 2S COMPL. IS 180 DEG.
// slot 21404
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
// RT8_OP_CODES.agc:176
//		COM
// slot 21405
                    if slot <> 21405 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:177
//
// RT8_OP_CODES.agc:178
//		AD	TEM2		# SULT MOVES FROM 2ND TO 3D QUAD.(OR BACK)
// slot 21406
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
// RT8_OP_CODES.agc:179
//		CCS	A		# BACK TO 2S COMPL.
// slot 21407
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
// RT8_OP_CODES.agc:180
//		AD	ONE
// slot 21408
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
// RT8_OP_CODES.agc:181
//		TCF	+2
// slot 21409
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
// RT8_OP_CODES.agc:182
//		COM
// slot 21410
                    if slot <> 21410 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:183
//		TS	TEM2		# STORE 14BIT QUANTITY WITH PRESENT SIGN
// slot 21411
                    if slot <> 21411 or instruction <> 22626 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22626, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21412 {
// RT8_OP_CODES.agc:184
//		TCF	+4
// slot 21412
                    if slot <> 21412 or instruction <> 6056 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6056, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:185
//		INDEX	A		# SIGN.
// slot 21413
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
// RT8_OP_CODES.agc:186
//		CAF	LIMITS		# FIX IT,BY ADDING IN 37777 OR 40000
// slot 21414
    21414, 29696
)).

// bank 22, slots 21415-21416
function agcAotUnit1213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21415 {
// RT8_OP_CODES.agc:187
//		AD	TEM2
// slot 21415
        if slot <> 21415 or instruction <> 24674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 98).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// RT8_OP_CODES.agc:188
//
// RT8_OP_CODES.agc:189
//		INDEX	BUF
// slot 21416
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
// RT8_OP_CODES.agc:190
//		TS	0		# STORE NEW ANGLE IN 2S COMPLEMENT.
// slot 21417
    21417, 45056
)).

// bank 22, slots 21418-21419
function agcAotUnit1214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21418 {
// RT8_OP_CODES.agc:191
//		TC	Q
// slot 21418
        if slot <> 21418 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RT8_OP_CODES.agc:192
//
// RT8_OP_CODES.agc:193
//# Page 1512
// RT8_OP_CODES.agc:194
//# RTB TO TORQUE GYROS, EXCEPT FOR THE CALL TO IMUSTALL.  ECADR OF COMMANDS ARRIVES IN X1.
// RT8_OP_CODES.agc:195
//
// RT8_OP_CODES.agc:196
//PULSEIMU	INDEX	FIXLOC		# ADDRESS OF GYRO COMMANDS SHOULD BE IN X1
// slot 21419
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
// RT8_OP_CODES.agc:197
//		CA	X1
// slot 21420
    21420, 24652
)).

// bank 22, slots 21421-21421
function agcAotUnit1215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RT8_OP_CODES.agc:198
//		TC	BANKCALL
// slot 21421
    if slot <> 21421 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1215] to agcAotUnit1215@.

agcAotInstallSourceRope(list(
// RT8_OP_CODES.agc:199
//		CADR	IMUPULSE
// slot 21422
    21422, 15628
)).

// bank 22, slots 21423-21423
function agcAotUnit1216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RT8_OP_CODES.agc:200
//		TCF	DANZIG
// slot 21423
    if slot <> 21423 or instruction <> 7192 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7192, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1216] to agcAotUnit1216@.

agcAotInstallSourceRope(list(
// RT8_OP_CODES.agc:201
//
// RT8_OP_CODES.agc:202
//# Page 1513
// RT8_OP_CODES.agc:203
//# EACH ROUTINE TAKES A 3X3 MATRIX STORED IN DOUBLE PRECISION IN A FIXED AREA OF ERASABLE MEMORY AND REPLACES IT
// RT8_OP_CODES.agc:204
//# WITH THE TRANSPOSE MATRIX.  TRANSP1 USES LOCATIONS XNB+0,+1 THROUGH XNB+16D, 17D AND TRANSP2 USES LOCATIONS
// RT8_OP_CODES.agc:205
//# XNB1+0,+1 THROUGH XNB1+16D, 17D.  EACH MATRIX IS STORED BY ROWS.
// RT8_OP_CODES.agc:206
//
// RT8_OP_CODES.agc:207
//XNBEB		ECADR	XNB
// slot 21424
    21424, 2966,
// RT8_OP_CODES.agc:208
//XNB1EB		ECADR	XNB1
// slot 21425
    21425, 2776
)).

// bank 22, slots 21426-21456
function agcAotUnit1217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21440 {
        if slot <= 21432 {
            if slot <= 21428 {
                if slot <= 21426 {
// RT8_OP_CODES.agc:209
//
// RT8_OP_CODES.agc:210
//		EBANK=	XNB
// RT8_OP_CODES.agc:211
//
// RT8_OP_CODES.agc:212
//TRANSP1		CAF	XNBEB
// slot 21426
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
// RT8_OP_CODES.agc:213
//		TS	EBANK
// slot 21427
                        if slot <> 21427 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:214
//		DXCH	XNB +2
// slot 21428
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
// RT8_OP_CODES.agc:215
//		DXCH	XNB +6
// slot 21429
                        if slot <> 21429 or instruction <> 22482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 978, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:216
//		DXCH	XNB +2
// slot 21430
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
// RT8_OP_CODES.agc:217
//
// RT8_OP_CODES.agc:218
//		DXCH	XNB +4
// slot 21431
                        if slot <> 21431 or instruction <> 22480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 976, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:219
//		DXCH	XNB +12D
// slot 21432
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
// RT8_OP_CODES.agc:220
//		DXCH	XNB +4
// slot 21433
                        if slot <> 21433 or instruction <> 22480 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 976, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:221
//
// RT8_OP_CODES.agc:222
//		DXCH	XNB +10D
// slot 21434
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
// RT8_OP_CODES.agc:223
//		DXCH	XNB +14D
// slot 21435
                        if slot <> 21435 or instruction <> 22490 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 986, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:224
//		DXCH	XNB +10D
// slot 21436
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
// RT8_OP_CODES.agc:225
//		TCF	DANZIG
// slot 21437
                        if slot <> 21437 or instruction <> 7192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:226
//
// RT8_OP_CODES.agc:227
//
// RT8_OP_CODES.agc:228
//		EBANK=	XNB1
// RT8_OP_CODES.agc:229
//
// RT8_OP_CODES.agc:230
//TRANSP2		CAF	XNB1EB
// slot 21438
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
// RT8_OP_CODES.agc:231
//		TS	EBANK
// slot 21439
                        if slot <> 21439 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:232
//		DXCH	XNB1 +2
// slot 21440
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
// RT8_OP_CODES.agc:233
//		DXCH	XNB1 +6
// slot 21441
                        if slot <> 21441 or instruction <> 22387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 883, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:234
//		DXCH	XNB1 +2
// slot 21442
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
// RT8_OP_CODES.agc:235
//
// RT8_OP_CODES.agc:236
//		DXCH	XNB1 +4
// slot 21443
                        if slot <> 21443 or instruction <> 22385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:237
//		DXCH	XNB1 +12D
// slot 21444
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
// RT8_OP_CODES.agc:238
//		DXCH	XNB1 +4
// slot 21445
                        if slot <> 21445 or instruction <> 22385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 881, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:239
//
// RT8_OP_CODES.agc:240
//		DXCH	XNB1 +10D
// slot 21446
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
// RT8_OP_CODES.agc:241
//		DXCH	XNB1 +14D
// slot 21447
                        if slot <> 21447 or instruction <> 22395 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 891, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:242
//		DXCH	XNB1 +10D
// slot 21448
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
// RT8_OP_CODES.agc:243
//		TCF	DANZIG
// slot 21449
                        if slot <> 21449 or instruction <> 7192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7192, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:244
//
// RT8_OP_CODES.agc:245
//# Page 1514
// RT8_OP_CODES.agc:246
//# THE SUBROUTINE SIGNMPAC SETS C(MPAC, MPAC +1) TO SIGN(MPAC).
// RT8_OP_CODES.agc:247
//# FOR THIS, ONLY THE CONTENTS OF MPAC ARE EXAMINED.  ALSO +0 YIELDS POSMAX AND -0 YIELDS NEGMAX.
// RT8_OP_CODES.agc:248
//#
// RT8_OP_CODES.agc:249
//# ENTRY MAY BE BY EITHER OF THE FOLLOWING:
// RT8_OP_CODES.agc:250
//#	1.	LIMIT THE SIZE OF MPAC ON INTERPRETIVE OVERFLOW:
// RT8_OP_CODES.agc:251
//#		ENTRY:		BOVB
// RT8_OP_CODES.agc:252
//#					SIGNMPAC
// RT8_OP_CODES.agc:253
//#	2.	GENERATE IN MPAC THE SIGNUM FUNCTION OF MPAC:
// RT8_OP_CODES.agc:254
//#		ENTRY:		RTB
// RT8_OP_CODES.agc:255
//#					SIGNMPAC
// RT8_OP_CODES.agc:256
//# IN EITHER CASE, RETURN IS TO TEH NEXT INTERPRETIVE INSTRUCTION IN THE CALLING SEQUENCE.
// RT8_OP_CODES.agc:257
//
// RT8_OP_CODES.agc:258
//SIGNMPAC	EXTEND
// slot 21450
                        if slot <> 21450 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21451 {
// RT8_OP_CODES.agc:259
//		DCA	DPOSMAX
// slot 21451
                        if slot <> 21451 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2559, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:260
//		DXCH	MPAC
// slot 21452
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
// RT8_OP_CODES.agc:261
//		CCS	A
// slot 21453
                        if slot <> 21453 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:262
//DPMODE		CAF	ZERO		# SETS MPAC +2 TO ZERO IN THE PROCESS
// slot 21454
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
// RT8_OP_CODES.agc:263
//		TCF	SLOAD2 +2
// slot 21455
                        if slot <> 21455 or instruction <> 7190 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7190, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:264
//		TCF	+1
// slot 21456
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

// bank 22, slots 21457-21465
function agcAotUnit1218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21460 {
        if slot <= 21458 {
            if slot <= 21457 {
// RT8_OP_CODES.agc:265
//		EXTEND
// slot 21457
                if slot <> 21457 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RT8_OP_CODES.agc:266
//		DCS	DPOSMAX
// slot 21458
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
// RT8_OP_CODES.agc:267
//		TCF	SLOAD2
// slot 21459
                if slot <> 21459 or instruction <> 7188 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7188, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RT8_OP_CODES.agc:268
//
// RT8_OP_CODES.agc:269
//# RTB OP CODE NORMUNIT IS LIKE INTERPRETIVE INSTRUCTION UNIT, EXCEPT THAT IT CAN BE DEPENDED ON NOT TO BLOW
// RT8_OP_CODES.agc:270
//# UP WHEN THE VECTOR BEING UNITIZED IS VERY SMALL -- IT WILL BLOW UP WHEN ALL COMPONENT ARE ZERO.  IF NORMUNIT
// RT8_OP_CODES.agc:271
//# IS USED AND THE UPPER ORDER HALVES OF ALL COMPONENTS ARE ZERO, THE MAGNITUDE RETURNS IN 36D WILL BE TOO LARGE
// RT8_OP_CODES.agc:272
//# BY A FACTOR OF 2(13) AND THE SQUARED MAGNITUDE RETURNED AT 34D WILL BE TOO BIG BY A FACTOR OF 2(26).
// RT8_OP_CODES.agc:273
//
// RT8_OP_CODES.agc:274
//NORMUNX1	CAF	ONE
// slot 21460
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
// RT8_OP_CODES.agc:275
//		TCF	NORMUNIT +1
// slot 21461
                if slot <> 21461 or instruction <> 6103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RT8_OP_CODES.agc:276
//NORMUNIT	CAF	ZERO
// slot 21462
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
// RT8_OP_CODES.agc:277
//		AD	FIXLOC
// slot 21463
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
// RT8_OP_CODES.agc:278
//		TS	MPAC +2
// slot 21464
                    if slot <> 21464 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RT8_OP_CODES.agc:279
//		TC	BANKCALL	# GET SIGN AGREEMENT IN ALL COMPONENTS
// slot 21465
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
// RT8_OP_CODES.agc:280
//		CADR	VECAGREE
// slot 21466
    21466, 1040
)).

// bank 22, slots 21467-21492
function agcAotUnit1219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21479 {
        if slot <= 21472 {
            if slot <= 21469 {
                if slot <= 21467 {
// RT8_OP_CODES.agc:281
//		CCS	MPAC
// slot 21467
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
// RT8_OP_CODES.agc:282
//		TCF	NOSHIFT
// slot 21468
                        if slot <> 21468 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:283
//		TCF	+2
// slot 21469
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
// RT8_OP_CODES.agc:284
//		TCF	NOSHIFT
// slot 21470
                    if slot <> 21470 or instruction <> 6136 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6136, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21471 {
// RT8_OP_CODES.agc:285
//		CCS	MPAC +3
// slot 21471
                        if slot <> 21471 or instruction <> 4207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 111).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:286
//		TCF	NOSHIFT
// slot 21472
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
// RT8_OP_CODES.agc:287
//		TCF	+2
// slot 21473
                    if slot <> 21473 or instruction <> 6115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21474 {
// RT8_OP_CODES.agc:288
//		TCF	NOSHIFT
// slot 21474
                        if slot <> 21474 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:289
//		CCS	MPAC +5
// slot 21475
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
// RT8_OP_CODES.agc:290
//		TCF	NOSHIFT
// slot 21476
                        if slot <> 21476 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:291
//		TCF	+2
// slot 21477
                        if slot <> 21477 or instruction <> 6119 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6119, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 21478 {
// RT8_OP_CODES.agc:292
//		TCF	NOSHIFT
// slot 21478
                        if slot <> 21478 or instruction <> 6136 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6136, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:293
//# Page 1515
// RT8_OP_CODES.agc:294
//		CA	MPAC +1		# SHIFT ALL COMPONENTS LEFT 13
// slot 21479
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
// RT8_OP_CODES.agc:295
//		EXTEND
// slot 21480
                    if slot <> 21480 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 21481 {
// RT8_OP_CODES.agc:296
//		MP	BIT14
// slot 21481
                        if slot <> 21481 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:297
//		DAS	MPAC		# DAS GAINS A LITTLE ACCURACY
// slot 21482
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
// RT8_OP_CODES.agc:298
//		CA	MPAC +4
// slot 21483
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
// RT8_OP_CODES.agc:299
//		EXTEND
// slot 21484
                        if slot <> 21484 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:300
//		MP	BIT14
// slot 21485
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
// RT8_OP_CODES.agc:301
//		DAS	MPAC +3
// slot 21486
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
// RT8_OP_CODES.agc:302
//		CA	MPAC +6
// slot 21487
                        if slot <> 21487 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:303
//		EXTEND
// slot 21488
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
// RT8_OP_CODES.agc:304
//		MP	BIT14
// slot 21489
                        if slot <> 21489 or instruction <> 31234 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RT8_OP_CODES.agc:305
//		DAS	MPAC +5
// slot 21490
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
// RT8_OP_CODES.agc:306
//		CAF	THIRTEEN
// slot 21491
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
// RT8_OP_CODES.agc:307
//		INDEX	MPAC +2
// slot 21492
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
// RT8_OP_CODES.agc:308
//		TS	37D
// slot 21493
    21493, 45130
)).

// bank 22, slots 21494-21494
function agcAotUnit1220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RT8_OP_CODES.agc:309
//OFFTUNIT	TC	POSTJUMP
// slot 21494
    if slot <> 21494 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1220] to agcAotUnit1220@.

agcAotInstallSourceRope(list(
// RT8_OP_CODES.agc:310
//		CADR	UNIT +1		# SKIP THE "TC VECAGREE" DONE AT UNIT
// slot 21495
    21495, 1064
)).

// bank 22, slots 21496-21498
function agcAotUnit1221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21496 {
// RT8_OP_CODES.agc:311
//
// RT8_OP_CODES.agc:312
//NOSHIFT		CAF	ZERO
// slot 21496
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
// RT8_OP_CODES.agc:313
//		TCF	OFFTUNIT -2
// slot 21497
            if slot <> 21497 or instruction <> 6132 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6132, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RT8_OP_CODES.agc:314
//
// RT8_OP_CODES.agc:315
//# RTB VECSGNAG ...FORCES SIGN AGREEMENT OF VECTOR IN MPAC.
// RT8_OP_CODES.agc:316
//
// RT8_OP_CODES.agc:317
//VECSGNAG	TC	BANKCALL
// slot 21498
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
// RT8_OP_CODES.agc:318
//		CADR	VECAGREE
// slot 21499
    21499, 1040
)).

// bank 22, slots 21500-21500
function agcAotUnit1222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RT8_OP_CODES.agc:319
//		TC	DANZIG
// slot 21500
    if slot <> 21500 or instruction <> 3096 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3096, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1222] to agcAotUnit1222@.

agcAotInstallSourceRope(list(
// RT8_OP_CODES.agc:320
//
// RT8_OP_CODES.agc:321
//# Page 1516
// RT8_OP_CODES.agc:322
//# MODULE CHANGE FOR NEW MUN GRAVITY MODEL
// RT8_OP_CODES.agc:323
//		SETLOC	MODCHG3
// RT8_OP_CODES.agc:324
//		BANK
// RT8_OP_CODES.agc:325
//QUALITY1	BOF	DLOAD
// slot 14328
    14328, 58648,
// RT8_OP_CODES.agc:326
//			MOONFLAG
// slot 14329
    14329, 454,
// RT8_OP_CODES.agc:327
//			NBRANCH
// slot 14330
    14330, 19744,
// RT8_OP_CODES.agc:328
//			URPV
// slot 14331
    14331, 30,
// RT8_OP_CODES.agc:329
//		DSQ	GOTO
// slot 14332
    14332, 43164,
// RT8_OP_CODES.agc:330
//			QUALITY2
// slot 14333
    14333, 22488,
// RT8_OP_CODES.agc:331
//		SETLOC	MODCHG2
// RT8_OP_CODES.agc:332
//		BANK
// RT8_OP_CODES.agc:333
//QUALITY2	PDDL	DSQ		# SQUARE INTO 2D, B2
// slot 13292
    13292, 52906,
// RT8_OP_CODES.agc:334
//			URPV	+2	# Y COMPONENT, B1
// slot 13293
    13293, 34,
// RT8_OP_CODES.agc:335
//		DSU
// slot 13294
    13294, 65322,
// RT8_OP_CODES.agc:336
//		DMP	VXSC		# 5(Y**2-X**2)UR
// slot 13295
    13295, 61706,
// RT8_OP_CODES.agc:337
//			5/8		# CONSTANT, 5B3
// slot 13296
    13296, 24538,
// RT8_OP_CODES.agc:338
//			URPV		# VECTOR, RESULT MAXIMUM IS 5, SCALING
// slot 13297
    13297, 30,
// RT8_OP_CODES.agc:339
//					# HERE B6
// RT8_OP_CODES.agc:340
//		VSL3	PDDL		# STORE SCALED B3 IN 2D, 4D, 6D FOR XYZ
// slot 13298
    13298, 54708,
// RT8_OP_CODES.agc:341
//			URPV		# X COMPONENT, B1
// slot 13299
    13299, 30,
// RT8_OP_CODES.agc:342
//		SR1	DAD		# 2 X X COMPONENT FOR B3 SCALING
// slot 13300
    13300, 36292,
// RT8_OP_CODES.agc:343
//			2D		# ADD TO VECTOR X COMPONENT OF ANSWER.
// slot 13301
    13301, 6,
// RT8_OP_CODES.agc:344
//					# SAME AS MULTIPLYING BY UNITX.  MAX IS 7.
// RT8_OP_CODES.agc:345
//		STODL	2D
// slot 13302
    13302, 12294,
// RT8_OP_CODES.agc:346
//			URPV	+2	# Y COMPONENT, B1
// slot 13303
    13303, 34,
// RT8_OP_CODES.agc:347
//		SR1	BDSU		# 2 X Y COMPONENT FOR B3 SCALING
// slot 13304
    13304, 37316,
// RT8_OP_CODES.agc:348
//			4D		# SUBTRACT FROM VECTOR Y COMPONENT OF
// slot 13305
    13305, 10,
// RT8_OP_CODES.agc:349
//					# ANSWER, SAME AS MULTIPLYING BY UNITY.
// RT8_OP_CODES.agc:350
//					# MAX IS 7.
// RT8_OP_CODES.agc:351
//		STORE 	4D		# 2D HAS VECTOR, B3.
// slot 13306
    13306, 10,
// RT8_OP_CODES.agc:352
//		SLOAD	VXSC		# MULTIPLY COEFFICIENT TIMES VECTOR IN 2D
// slot 13307
    13307, 61882,
// RT8_OP_CODES.agc:353
//			E3J22R2M
// slot 13308
    13308, 2046,
// RT8_OP_CODES.agc:354
//		PDDL	RVQ		# J22 TERM X R**4 IN 2D, SCALED B61
// slot 13309
    13309, 36522,
// RT8_OP_CODES.agc:355
//			COSPHI/2	# SAME AS URPV +4, Z COMPONENT
// slot 13310
    13310, 38
)).

// no code for the lines below
// RT8_OP_CODES.agc:356
//
// RT8_OP_CODES.agc:357
//# *** END OF CHIEFTAN.028 ***
// RT8_OP_CODES.agc:358
//
