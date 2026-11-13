// MYSUBS.agc
// bank 21, slots 19490-19524
function agcAotUnit1122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19506 {
        if slot <= 19497 {
            if slot <= 19493 {
                if slot <= 19491 {
                    if slot <= 19490 {
// MYSUBS.agc:1
//# Copyright:	Public domain.
// MYSUBS.agc:2
//# Filename:	MYSUBS.agc
// MYSUBS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// MYSUBS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// MYSUBS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// MYSUBS.agc:6
//# Assembler:	yaYUL
// MYSUBS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// MYSUBS.agc:8
//# Website:	www.ibiblio.org/apollo.
// MYSUBS.agc:9
//# Pages:	999-1001
// MYSUBS.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// MYSUBS.agc:11
//#				same name, using Comanche055 page images.
// MYSUBS.agc:12
//#		2009-05-20 RSB	Corrections: EBANK= changed from MPAC to KMPAC.
// MYSUBS.agc:13
//#
// MYSUBS.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// MYSUBS.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// MYSUBS.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// MYSUBS.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// MYSUBS.agc:18
//# consequent reduction in image quality as well) are available online at
// MYSUBS.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// MYSUBS.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// MYSUBS.agc:21
//# (much) higher-quality images which Paul actually created.
// MYSUBS.agc:22
//#
// MYSUBS.agc:23
//# Notations on the hardcopy document read, in part:
// MYSUBS.agc:24
//#
// MYSUBS.agc:25
//#	Assemble revision 055 of AGC program Comanche by NASA
// MYSUBS.agc:26
//#	2021113-051.  10:28 APR. 1, 1969
// MYSUBS.agc:27
//#
// MYSUBS.agc:28
//#	This AGC program shall also be referred to as
// MYSUBS.agc:29
//#			Colossus 2A
// MYSUBS.agc:30
//
// MYSUBS.agc:31
//# Page 999
// MYSUBS.agc:32
//		BANK	20
// MYSUBS.agc:33
//		SETLOC	MYSUBS
// MYSUBS.agc:34
//		BANK
// MYSUBS.agc:35
//
// MYSUBS.agc:36
//		EBANK=	KMPAC
// MYSUBS.agc:37
//SPCOS1		EQUALS	SPCOS
// MYSUBS.agc:38
//SPSIN1		EQUALS	SPSIN
// MYSUBS.agc:39
//SPCOS2		EQUALS	SPCOS
// MYSUBS.agc:40
//SPSIN2		EQUALS	SPSIN
// MYSUBS.agc:41
//
// MYSUBS.agc:42
//
// MYSUBS.agc:43
//		COUNT	21/DAPMS
// MYSUBS.agc:44
//
// MYSUBS.agc:45
//# ONE AND ONE HALF PRECISION MULTIPLICATION ROUTINE
// MYSUBS.agc:46
//
// MYSUBS.agc:47
//SMALLMP		TS	KMPTEMP		# A(X+Y)
// slot 19490
                        if slot <> 19490 or instruction <> 23370 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23370, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:48
//		EXTEND
// slot 19491
                        if slot <> 19491 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19492 {
// MYSUBS.agc:49
//		MP	KMPAC 	+1
// slot 19492
                        if slot <> 19492 or instruction <> 29513 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 841, readEffective:call(words, 841)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:50
//		TS	KMPAC 	+1	# AY
// slot 19493
                        if slot <> 19493 or instruction <> 23369 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23369, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19495 {
                    if slot <= 19494 {
// MYSUBS.agc:51
//		CAF	ZERO
// slot 19494
                        if slot <> 19494 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:52
//		XCH	KMPAC
// slot 19495
                        if slot <> 19495 or instruction <> 24392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 840, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19496 {
// MYSUBS.agc:53
//		EXTEND
// slot 19496
                        if slot <> 19496 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:54
//		MP	KMPTEMP		# AX
// slot 19497
                        if slot <> 19497 or instruction <> 29514 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 842, readEffective:call(words, 842)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19501 {
                if slot <= 19499 {
                    if slot <= 19498 {
// MYSUBS.agc:55
//		DAS	KMPAC		# AX+AY
// slot 19498
                        if slot <> 19498 or instruction <> 9033 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 841) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:56
//		TC	Q
// slot 19499
                        if slot <> 19499 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19500 {
// MYSUBS.agc:57
//
// MYSUBS.agc:58
//
// MYSUBS.agc:59
//# SUBROUTINE FOR DOUBLE PRECISION ADDITIONS OF ANGLES
// MYSUBS.agc:60
//# A AND L CONTAIN A DP(1S) ANGLE SCALED BY 180 DEGS TO BE ADDED TO KMPAC.
// MYSUBS.agc:61
//# RESULT IS PLACED IN KMPAC.  TIMING = 6 MCT (22 MCT ON OVERFLOW)
// MYSUBS.agc:62
//
// MYSUBS.agc:63
//DPADD		DAS	KMPAC
// slot 19500
                        if slot <> 19500 or instruction <> 9033 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 841) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:64
//		EXTEND
// slot 19501
                        if slot <> 19501 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19503 {
                    if slot <= 19502 {
// MYSUBS.agc:65
//		BZF	TSK 	+1	# NO OVERFLOW
// slot 19502
                        if slot <> 19502 or instruction <> 5179 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5179, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:66
//		CCS	KMPAC
// slot 19503
                        if slot <> 19503 or instruction <> 4936 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 840).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19504 {
// MYSUBS.agc:67
//		TCF	DPADD+		# + OVERFLOW
// slot 19504
                        if slot <> 19504 or instruction <> 5180 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5180, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19505 {
// MYSUBS.agc:68
//		TCF	+2
// slot 19505
                            if slot <> 19505 or instruction <> 5171 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5171, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// MYSUBS.agc:69
//		TCF	DPADD-		# - OVERFLOW
// slot 19506
                            if slot <> 19506 or instruction <> 5182 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5182, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19515 {
            if slot <= 19510 {
                if slot <= 19508 {
                    if slot <= 19507 {
// MYSUBS.agc:70
//		CCS	KMPAC 	+1
// slot 19507
                        if slot <> 19507 or instruction <> 4937 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 841).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:71
//		TCF	DPADD2+		# UPPER = 0, LOWER +
// slot 19508
                        if slot <> 19508 or instruction <> 5185 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5185, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19509 {
// MYSUBS.agc:72
//		TCF	+2
// slot 19509
                        if slot <> 19509 or instruction <> 5175 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5175, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:73
//		COM			# UPPER = 0, LOWER -
// slot 19510
                        if slot <> 19510 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19512 {
                    if slot <= 19511 {
// MYSUBS.agc:74
//		AD	POSMAX		# LOWER = 0, A=0
// slot 19511
                        if slot <> 19511 or instruction <> 27135 { return choose false if checkOnly else -1. }
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
// MYSUBS.agc:75
//		TS	KMPAC 	+1	# CAN NOT OVERFLOW
// slot 19512
                        if slot <> 19512 or instruction <> 23369 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23369, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19513 {
// MYSUBS.agc:76
//		CA	POSMAX		# UPPER WAS = 0
// slot 19513
                        if slot <> 19513 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19514 {
// MYSUBS.agc:77
//TSK		TS	KMPAC
// slot 19514
                            if slot <> 19514 or instruction <> 23368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// MYSUBS.agc:78
//		TC	Q
// slot 19515
                            if slot <> 19515 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19519 {
                if slot <= 19517 {
                    if slot <= 19516 {
// MYSUBS.agc:79
//
// MYSUBS.agc:80
//DPADD+		AD	NEGMAX		# KMPAC GREATER THAN 0
// slot 19516
                        if slot <> 19516 or instruction <> 27137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:81
//		TCF	TSK
// slot 19517
                        if slot <> 19517 or instruction <> 5178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5178, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19518 {
// MYSUBS.agc:82
//
// MYSUBS.agc:83
//# Page 1000
// MYSUBS.agc:84
//DPADD-		COM
// slot 19518
                        if slot <> 19518 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:85
//		AD	POSMAX		# KMPAC LESS THAN 0
// slot 19519
                        if slot <> 19519 or instruction <> 27135 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19521 {
                    if slot <= 19520 {
// MYSUBS.agc:86
//		TCF	TSK
// slot 19520
                        if slot <> 19520 or instruction <> 5178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5178, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// MYSUBS.agc:87
//
// MYSUBS.agc:88
//DPADD2+		AD	NEGMAX		# CAN NOT OVERFLOW
// slot 19521
                        if slot <> 19521 or instruction <> 27137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19522 {
// MYSUBS.agc:89
//		TS	KMPAC 	+1
// slot 19522
                        if slot <> 19522 or instruction <> 23369 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23369, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19523 {
// MYSUBS.agc:90
//		CA	NEGMAX		# UPPER WAS = 0
// slot 19523
                            if slot <> 19523 or instruction <> 14849 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// MYSUBS.agc:91
//		TCF	TSK
// slot 19524
                            if slot <> 19524 or instruction <> 5178 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5178, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1122] to agcAotUnit1122@.

// no code for the lines below
// MYSUBS.agc:92
//
// MYSUBS.agc:93
//# Page 1001 (empty page)
