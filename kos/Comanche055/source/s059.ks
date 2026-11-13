// RCS-CSM_DIGITAL_AUTOPILOT.agc
// bank 21, slots 19525-19535
function agcAotUnit1123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19529 {
        if slot <= 19526 {
            if slot <= 19525 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:2
//# Filename:	RCS-CSM_DIGITAL_AUTOPILOT.agc
// RCS-CSM_DIGITAL_AUTOPILOT.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:4
//#		It is part of the source code for the Command Module's (CM)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// RCS-CSM_DIGITAL_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:9
//# Pages:	1002-1024
// RCS-CSM_DIGITAL_AUTOPILOT.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// RCS-CSM_DIGITAL_AUTOPILOT.agc:11
//#				same name, using Comanche055 page images.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:12
//#
// RCS-CSM_DIGITAL_AUTOPILOT.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// RCS-CSM_DIGITAL_AUTOPILOT.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// RCS-CSM_DIGITAL_AUTOPILOT.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// RCS-CSM_DIGITAL_AUTOPILOT.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// RCS-CSM_DIGITAL_AUTOPILOT.agc:17
//# consequent reduction in image quality as well) are available online at
// RCS-CSM_DIGITAL_AUTOPILOT.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// RCS-CSM_DIGITAL_AUTOPILOT.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// RCS-CSM_DIGITAL_AUTOPILOT.agc:20
//# (much) higher-quality images which Paul actually created.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:21
//#
// RCS-CSM_DIGITAL_AUTOPILOT.agc:22
//# Notations on the hardcopy document read, in part:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:23
//#
// RCS-CSM_DIGITAL_AUTOPILOT.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// RCS-CSM_DIGITAL_AUTOPILOT.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// RCS-CSM_DIGITAL_AUTOPILOT.agc:26
//#
// RCS-CSM_DIGITAL_AUTOPILOT.agc:27
//#	This AGC program shall also be referred to as
// RCS-CSM_DIGITAL_AUTOPILOT.agc:28
//#			Colossus 2A
// RCS-CSM_DIGITAL_AUTOPILOT.agc:29
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:30
//# Page 1002
// RCS-CSM_DIGITAL_AUTOPILOT.agc:31
//# T5 INTERRUPT PROGRAM FOR THE RCS-CSM AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:32
//# 	START OF T5 INTERRUPT PROGRAM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:33
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:34
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:35
//		BANK	20
// RCS-CSM_DIGITAL_AUTOPILOT.agc:36
//		SETLOC	DAPS3
// RCS-CSM_DIGITAL_AUTOPILOT.agc:37
//		BANK
// RCS-CSM_DIGITAL_AUTOPILOT.agc:38
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:39
//		COUNT	21/DAPRC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:40
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:41
//		EBANK=	KMPAC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:42
//REDORCS		LXCH	BANKRUPT	# RESTART OF AUTOPILOT COMES HERE
// slot 19525
                if slot <> 19525 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:43
//		CA	T5PHASE		# ON A T5 RUPT.
// slot 19526
                if slot <> 19526 or instruction <> 13109 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 821).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19527 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:44
//		EXTEND
// slot 19527
                if slot <> 19527 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19528 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:45
//		BZMF	+2		# IF T5PHASE +0, -0, OR -, RESET TO -
// slot 19528
                    if slot <> 19528 or instruction <> 25674 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25674, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:46
//		TCF	+3		# IF T5PHASE +, LEAVE IT +.  DO A FRESHDAP
// slot 19529
                    if slot <> 19529 or instruction <> 5196 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5196, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19532 {
            if slot <= 19530 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:47
//		CS	ONE
// slot 19530
                if slot <> 19530 or instruction <> 18959 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19531 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:48
//		TS	T5PHASE
// slot 19531
                    if slot <> 19531 or instruction <> 23349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:49
//		EXTEND
// slot 19532
                    if slot <> 19532 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19533 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:50
//		DCA	RCSLOC
// slot 19533
                if slot <> 19533 or instruction <> 13393 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1105, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19534 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:51
//		DXCH	T5LOC		# HOOK UP T5RUPT TO AUTOPILOT
// slot 19534
                    if slot <> 19534 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:52
//		TCF	RCSATT +1
// slot 19535
                    if slot <> 19535 or instruction <> 5203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5203, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1123] to agcAotUnit1123@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:53
//		EBANK=	KMPAC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:54
//RCSLOC		2CADR	RCSATT
// slot 19536 19537
    19536, 2212, 19537, 34924
)).

// bank 21, slots 19538-19564
function agcAotUnit1124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19550 {
        if slot <= 19543 {
            if slot <= 19540 {
                if slot <= 19538 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:55
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:56
//RCSATT		LXCH	BANKRUPT	# SAVE BB
// slot 19538
                    if slot <> 19538 or instruction <> 9230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 14, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19539 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:57
//		EXTEND			# SAVE Q
// slot 19539
                        if slot <> 19539 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:58
//		QXCH	QRUPT
// slot 19540
                        if slot <> 19540 or instruction <> 9226 { return choose false if checkOnly else -1. }
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
                if slot <= 19541 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:59
//		CAF	BIT15		# BIT15 CHAN31 = 0 IF IMU POWER IS ON AND
// slot 19541
                    if slot <> 19541 or instruction <> 14849 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19542 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:60
//		EXTEND			# S/C CONT SW IS IN CMC (I.E. IF G/C AUTO
// slot 19542
                        if slot <> 19542 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:61
//		RAND	CHAN31		# PILOT IS FULLY ENABLED)
// slot 19543
                        if slot <> 19543 or instruction <> 1049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19546 {
                if slot <= 19544 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:62
//		EXTEND
// slot 19544
                    if slot <> 19544 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19545 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:63
//		BZF	SETT5		# IF G/C AUTOPILOT IS FULLY ENABLED,
// slot 19545
                        if slot <> 19545 or instruction <> 5232 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:64
//					# GO TO SETT5
// RCS-CSM_DIGITAL_AUTOPILOT.agc:65
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:66
//		CS	RCSFLAGS	# IF G/C AUTOPILOT IS NOT FULLY ENABLED,
// slot 19546
                        if slot <> 19546 or instruction <> 17217 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 833).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19548 {
                    if slot <= 19547 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:67
//		MASK	BIT14
// slot 19547
                        if slot <> 19547 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
// RCS-CSM_DIGITAL_AUTOPILOT.agc:68
//		ADS	RCSFLAGS	# SET NORATE FLAG,
// slot 19548
                        if slot <> 19548 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19549 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:69
//		CAF	POSMAX
// slot 19549
                        if slot <> 19549 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:70
//		TS	HOLDFLAG	# SET HOLDFLAG +,
// slot 19550
                        if slot <> 19550 or instruction <> 23258 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23258, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19557 {
            if slot <= 19553 {
                if slot <= 19551 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:71
//		CAF	ZERO		# ZERO ERRORX, ERRORY, AND ERRORZ,
// slot 19551
                    if slot <> 19551 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19552 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:72
//		TS	ERRORX
// slot 19552
                        if slot <> 19552 or instruction <> 23415 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23415, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:73
//		TS	ERRORY
// slot 19553
                        if slot <> 19553 or instruction <> 23416 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23416, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19555 {
                    if slot <= 19554 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:74
//		TS	ERRORZ
// slot 19554
                        if slot <> 19554 or instruction <> 23417 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23417, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:75
//		CAF	BIT14
// slot 19555
                        if slot <> 19555 or instruction <> 14850 { return choose false if checkOnly else -1. }
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
                    if slot <= 19556 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:76
//		EXTEND
// slot 19556
                        if slot <> 19556 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:77
//		RAND	CHAN31		# AND CHECK FREE FUNCTION (BIT14 CHAN31).
// slot 19557
                        if slot <> 19557 or instruction <> 1049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19560 {
                if slot <= 19558 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:78
//		EXTEND
// slot 19558
                    if slot <> 19558 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19559 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:79
//# Page 1003
// RCS-CSM_DIGITAL_AUTOPILOT.agc:80
//		BZF	SETT5		# IF IN FREE MODE, GO TO SETT5.
// slot 19559
                        if slot <> 19559 or instruction <> 5232 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:81
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:82
//		TS	T5PHASE		# IF NOT IN FREE MODE,
// slot 19560
                        if slot <> 19560 or instruction <> 23349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19562 {
                    if slot <= 19561 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:83
//		CAF	OCT37766	# SCHEDULE REINITIALIZATION (FRESHDAP)
// slot 19561
                        if slot <> 19561 or instruction <> 16318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4030), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:84
//		TS	TIME5		# IN 100 MS VIA T5RUPT
// slot 19562
                        if slot <> 19562 or instruction <> 22552 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22552, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19563 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:85
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:86
//		TCR	ZEROJET		# ZERO JET CHANNELS IN 14 MS VIA ZEROJET
// slot 19563
                        if slot <> 19563 or instruction <> 1434 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1434, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:87
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:88
//		TCF	KMATRIX
// slot 19564
                        if slot <> 19564 or instruction <> 5352 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5352, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1124] to agcAotUnit1124@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:89
//DELTATT		OCT	37770		# 80MS (TIME5)
// slot 19565
    19565, 32752,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:90
//DELTATT2	OCT	37776		# 20MS (TIME5)
// slot 19566
    19566, 32764,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:91
//ONESEK		DEC	16284		# 1 SEC(TIME5)
// slot 19567
    19567, 32568
)).

// bank 21, slots 19568-19590
function agcAotUnit1125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19578 {
        if slot <= 19572 {
            if slot <= 19569 {
                if slot <= 19568 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:92
//CHAN5		EQUALS	5
// RCS-CSM_DIGITAL_AUTOPILOT.agc:93
//CHAN6		EQUALS	6
// RCS-CSM_DIGITAL_AUTOPILOT.agc:94
//PRIO34A		=	PRIO34
// RCS-CSM_DIGITAL_AUTOPILOT.agc:95
//# 		CHECK PHASE OF T5 PROGRAM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:96
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:97
//# 	BECAUSE OF THE LENGTH OF THE T5 PROGRAM, IT HAS BEEN DIVIDED INTO
// RCS-CSM_DIGITAL_AUTOPILOT.agc:98
//# THREE PARTS, T5PHASE1, T5PHASE2, AND THE JET SELECTION LOGIC,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:99
//# TO ALLOW FOR THE EXECUTION OF OTHER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:100
//# INTERRUPTS.  T5PHASE IS ALSO USED IN THE INITIALIZATION OF THE AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:101
//# VARIABLES AT TURN ON.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:102
//# THE CODING OF T5PHASE IS...
// RCS-CSM_DIGITAL_AUTOPILOT.agc:103
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:104
//#		+ = INITIALIZE T5 RCS-CSM AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:105
//#    T5PHASE = +0 = PHASE2 OF THE T5 PROGRAM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:106
//#		- = RESTART DAP
// RCS-CSM_DIGITAL_AUTOPILOT.agc:107
//#	       -0 = PHASE1 OF THE T5 PROGRAM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:108
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:109
//SETT5		CCS	T5PHASE
// slot 19568
                    if slot <> 19568 or instruction <> 4917 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 821).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:110
//		TCF	FRESHDAP	# TURN ON AUTOPILOT
// slot 19569
                    if slot <> 19569 or instruction <> 5476 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5476, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19570 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:111
//		TCF	T5PHASE2	# BRANCH TO PHASE2 OF PROGRAM
// slot 19570
                    if slot <> 19570 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19571 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:112
//		TCF	REDAP		# RESTART AUTOPILOT
// slot 19571
                        if slot <> 19571 or instruction <> 5478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5478, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:113
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:114
//		TS	T5PHASE		# PHASE 1 RESET FOR PHASE 2
// slot 19572
                        if slot <> 19572 or instruction <> 23349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19575 {
                if slot <= 19573 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:115
//		CA	TIME5
// slot 19573
                    if slot <> 19573 or instruction <> 12312 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 24).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19574 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:116
//		TS	T5TIME		# USED IN COMPENSATING FOR DELAYS IN T5
// slot 19574
                        if slot <> 19574 or instruction <> 23452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:117
//		CAF	DELTATT2	# RESET FOR T5RUPT IN 20MS FOR PHASE2
// slot 19575
                        if slot <> 19575 or instruction <> 13422 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1134), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19576 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:118
//		TS	TIME5		# OF PROGRAM
// slot 19576
                    if slot <> 19576 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19577 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:119
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:120
//# Page 1004
// RCS-CSM_DIGITAL_AUTOPILOT.agc:121
//# IMU STATUS CHECK
// RCS-CSM_DIGITAL_AUTOPILOT.agc:122
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:123
//		CS	IMODES33	# CHECK IMU STATUS
// slot 19577
                        if slot <> 19577 or instruction <> 17105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 721).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:124
//		MASK	BIT6		# BIT6 = 0  IMU OK
// slot 19578
                        if slot <> 19578 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
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
    } else {
        if slot <= 19584 {
            if slot <= 19581 {
                if slot <= 19579 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:125
//		CCS	A		# BIT6 = 1 NO IMU
// slot 19579
                    if slot <> 19579 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19580 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:126
//		TCF	RATEFILT
// slot 19580
                        if slot <> 19580 or instruction <> 5256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5256, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:127
//FREECHK		CS	RCSFLAGS	# BIT14 INDICATES THAT RATES HAVE NOT BEEN
// slot 19581
                        if slot <> 19581 or instruction <> 17217 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 833).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19582 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:128
//		MASK	BIT14		# INITIALIZED
// slot 19582
                    if slot <> 19582 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                    if slot <= 19583 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:129
//		ADS	RCSFLAGS
// slot 19583
                        if slot <> 19583 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:130
//		CAF	BIT14		# NO ATTITUDE REFERENCE
// slot 19584
                        if slot <> 19584 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19587 {
                if slot <= 19585 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:131
//		TS	HOLDFLAG	# STOP ANY AUTOMATIC STEERING AND PREPARE
// slot 19585
                    if slot <> 19585 or instruction <> 23258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23258, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19586 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:132
//					# TO PICK UP CDU ANGLES UPON RESUMPTION OF
// RCS-CSM_DIGITAL_AUTOPILOT.agc:133
//					# ATTITUDE HOLD
// RCS-CSM_DIGITAL_AUTOPILOT.agc:134
//		EXTEND
// slot 19586
                        if slot <> 19586 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:135
//		RAND	CHAN31		# CHECK FOR FREE MODE
// slot 19587
                        if slot <> 19587 or instruction <> 1049 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19588 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:136
//		EXTEND
// slot 19588
                    if slot <> 19588 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19589 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:137
//		BZF	KRESUME1	# IN FREE MODE PROVIDE FREE CONTROL ONLY
// slot 19589
                        if slot <> 19589 or instruction <> 5391 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5391, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:138
//		TCF	REINIT		# .....TILT...............................
// slot 19590
                        if slot <> 19590 or instruction <> 5468 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5468, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1125] to agcAotUnit1125@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:139
//BITS4,5		OCT	30
// slot 19591
    19591, 48
)).

// bank 21, slots 19592-19601
function agcAotUnit1126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19596 {
        if slot <= 19593 {
            if slot <= 19592 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:140
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:141
//RATEFILT	CA	RCSFLAGS	# SEE IF RATEFILTER HAS BEEN INITIALIZED
// slot 19592
                if slot <> 19592 or instruction <> 13121 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 833).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:142
//		MASK	BIT14
// slot 19593
                if slot <> 19593 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 19594 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:143
//		EXTEND			# IF SO, PROCEED WITH RATE DERIVATION
// slot 19594
                if slot <> 19594 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19595 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:144
//		BZF	+2
// slot 19595
                    if slot <> 19595 or instruction <> 5261 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5261, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:145
//		TCF	KMATRIX		# IF NOT, SKIP RATE DERIVATION
// slot 19596
                    if slot <> 19596 or instruction <> 5352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5352, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19598 {
            if slot <= 19597 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:146
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:147
//# 	RATE FILTER	TIMING = 7.72 MS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:148
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:149
//# RATE FILTER EQUATIONS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:150
//# DRHO = DELRHO - (.1)ADOT + (1 = GAIN1)DRHO
// RCS-CSM_DIGITAL_AUTOPILOT.agc:151
//#					    -1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:152
//# ADOT = ADOT   + GAIN2 DRHO + KMJ DFT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:153
//#	     -1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:154
//#	-        *     -     -
// RCS-CSM_DIGITAL_AUTOPILOT.agc:155
//# WHERE DELRHO = AMGB (CDU - CDU  )
// RCS-CSM_DIGITAL_AUTOPILOT.agc:156
//#			 	-1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:157
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:158
//		CAF	TWO
// slot 19597
                if slot <> 19597 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:159
//DRHOLOOP	TS	SPNDX
// slot 19598
                if slot <> 19598 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19599 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:160
//		DOUBLE
// slot 19599
                if slot <> 19599 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19600 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:161
//		TS	DPNDX
// slot 19600
                    if slot <> 19600 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:162
//		INDEX	DPNDX
// slot 19601
                    if slot <> 19601 or instruction <> 21319 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21319, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21319, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1126] to agcAotUnit1126@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:163
//		CS	DRHO		# DRHO SCALED 180 DEGS
// slot 19602
    19602, 34516
)).

// bank 21, slots 19603-19604
function agcAotUnit1127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19603 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:164
//		EXTEND
// slot 19603
        if slot <> 19603 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:165
//		INDEX	ATTKALMN	# PICK UP DESIRED FILTER GAIN
// slot 19604
        if slot <> 19604 or instruction <> 21391 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1127] to agcAotUnit1127@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:166
//		MP	GAIN1
// slot 19605
    19605, 60542
)).

// bank 21, slots 19606-19606
function agcAotUnit1128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:167
//		INDEX	DPNDX
// slot 19606
    if slot <> 19606 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1128] to agcAotUnit1128@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:168
//		DAS	DRHO		# (1 -.064)DRHO
// slot 19607
    19607, 18134
)).

// bank 21, slots 19608-19609
function agcAotUnit1129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19608 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:169
//		EXTEND
// slot 19608
        if slot <> 19608 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:170
//# Page 1005
// RCS-CSM_DIGITAL_AUTOPILOT.agc:171
//		INDEX	DPNDX
// slot 19609
        if slot <> 19609 or instruction <> 21319 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21319, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21319, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1129] to agcAotUnit1129@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:172
//		DCS	ADOT
// slot 19610
    19610, 34488
)).

// bank 21, slots 19611-19615
function agcAotUnit1130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19612 {
        if slot <= 19611 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:173
//		DXCH	KMPAC		# -(.1)ADOT
// slot 19611
            if slot <> 19611 or instruction <> 22345 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:174
//		CA	QUARTER
// slot 19612
            if slot <> 19612 or instruction <> 14851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19613 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:175
//		TC	SMALLMP
// slot 19613
            if slot <> 19613 or instruction <> 1058 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1058, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19614 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:176
//		DXCH	KMPAC
// slot 19614
                if slot <> 19614 or instruction <> 22345 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:177
//		INDEX	DPNDX
// slot 19615
                if slot <> 19615 or instruction <> 21319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1130] to agcAotUnit1130@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:178
//		DAS	DRHO
// slot 19616
    19616, 18134
)).

// bank 21, slots 19617-19661
function agcAotUnit1131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19638 {
        if slot <= 19627 {
            if slot <= 19621 {
                if slot <= 19618 {
                    if slot <= 19617 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:179
//		CCS	SPNDX
// slot 19617
                        if slot <> 19617 or instruction <> 4934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 838).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:180
//		TCF	DRHOLOOP
// slot 19618
                        if slot <> 19618 or instruction <> 5262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5262, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19619 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:181
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:182
//		CA	CDUX		# MEASURED BODY RATES--
// slot 19619
                        if slot <> 19619 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19620 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:183
//		XCH	RHO
// slot 19620
                            if slot <> 19620 or instruction <> 24477 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 925, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:184
//		EXTEND
// slot 19621
                            if slot <> 19621 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19624 {
                    if slot <= 19622 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:185
//		MSU	RHO		# -        *     -     -
// slot 19622
                        if slot <> 19622 or instruction <> 9117 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 925).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19623 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:186
//		COM			# DELRHO = AMGB (CDU - CDU  )
// slot 19623
                            if slot <> 19623 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:187
//					#			  -1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:188
//		ZL
// slot 19624
                            if slot <> 19624 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
                    if slot <= 19625 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:189
//		DXCH	DELTEMPX
// slot 19625
                        if slot <> 19625 or instruction <> 22350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 846, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19626 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:190
//		CA	CDUY
// slot 19626
                            if slot <> 19626 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:191
//		XCH	RHO1
// slot 19627
                            if slot <> 19627 or instruction <> 24478 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 926, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19632 {
                if slot <= 19629 {
                    if slot <= 19628 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:192
//		EXTEND
// slot 19628
                        if slot <> 19628 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:193
//		MSU	RHO1
// slot 19629
                        if slot <> 19629 or instruction <> 9118 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19630 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:194
//		COM
// slot 19630
                        if slot <> 19630 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19631 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:195
//		TS	T5TEMP		# (CDUY - RHO1)	   SCALED 90 DEGS
// slot 19631
                            if slot <> 19631 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:196
//		EXTEND
// slot 19632
                            if slot <> 19632 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19635 {
                    if slot <= 19633 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:197
//		MP	AMGB1
// slot 19633
                        if slot <> 19633 or instruction <> 29600 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 928, readEffective:call(words, 928)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19634 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:198
//		DAS	DELTEMPX	# DELTEMPX = (CDUX-RHO) + AMGB1(CDUY-RHO1)
// slot 19634
                            if slot <> 19634 or instruction <> 9038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 846) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:199
//					# MUST BE DOUBLE PRECISION OR WILL LOSE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:200
//					# PULSES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:201
//		CA	AMGB4
// slot 19635
                            if slot <> 19635 or instruction <> 13217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 929).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19636 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:202
//		EXTEND
// slot 19636
                        if slot <> 19636 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19637 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:203
//		MP	T5TEMP
// slot 19637
                            if slot <> 19637 or instruction <> 29506 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 834, readEffective:call(words, 834)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:204
//		DXCH	DELTEMPY
// slot 19638
                            if slot <> 19638 or instruction <> 22352 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 848, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19649 {
            if slot <= 19643 {
                if slot <= 19640 {
                    if slot <= 19639 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:205
//		CA	AMGB7
// slot 19639
                        if slot <> 19639 or instruction <> 13219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:206
//		EXTEND
// slot 19640
                        if slot <> 19640 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19641 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:207
//		MP	T5TEMP
// slot 19641
                        if slot <> 19641 or instruction <> 29506 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 834, readEffective:call(words, 834)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19642 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:208
//		DXCH	DELTEMPZ
// slot 19642
                            if slot <> 19642 or instruction <> 22354 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 850, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:209
//		CA	CDUZ
// slot 19643
                            if slot <> 19643 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19646 {
                    if slot <= 19644 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:210
//		XCH	RHO2
// slot 19644
                        if slot <> 19644 or instruction <> 24479 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 927, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19645 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:211
//		EXTEND
// slot 19645
                            if slot <> 19645 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:212
//		MSU	RHO2
// slot 19646
                            if slot <> 19646 or instruction <> 9119 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 927).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19647 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:213
//		COM
// slot 19647
                        if slot <> 19647 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19648 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:214
//		TS	T5TEMP		# (CDUZ - RHO2)    SCALED 90 DEGS
// slot 19648
                            if slot <> 19648 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:215
//		EXTEND
// slot 19649
                            if slot <> 19649 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 19655 {
                if slot <= 19652 {
                    if slot <= 19650 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:216
//		MP	AMGB5
// slot 19650
                        if slot <> 19650 or instruction <> 29602 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 930, readEffective:call(words, 930)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19651 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:217
//		DAS	DELTEMPY	# DELTEMPY =AMGB4(CDUY-RHO1)
// slot 19651
                            if slot <> 19651 or instruction <> 9040 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 848) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:218
//					#		  + AMGB5(CDUZ-RHO2)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:219
//		CA	AMGB8
// slot 19652
                            if slot <> 19652 or instruction <> 13220 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 932).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19653 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:220
//		EXTEND
// slot 19653
                        if slot <> 19653 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19654 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:221
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:222
//# Page 1006
// RCS-CSM_DIGITAL_AUTOPILOT.agc:223
//		MP	T5TEMP
// slot 19654
                            if slot <> 19654 or instruction <> 29506 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 834, readEffective:call(words, 834)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:224
//		DAS	DELTEMPZ	# DELTEMPZ = AMBG7(CDUY-RHO1)
// slot 19655
                            if slot <> 19655 or instruction <> 9042 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 850) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19658 {
                    if slot <= 19656 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:225
//					#		  + AMGB8(CDUZ-RHO2)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:226
//		CAF	TWO
// slot 19656
                        if slot <> 19656 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19657 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:227
//ADOTLOOP	TS	SPNDX
// slot 19657
                            if slot <> 19657 or instruction <> 23366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:228
//		DOUBLE
// slot 19658
                            if slot <> 19658 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19659 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:229
//		TS	DPNDX
// slot 19659
                        if slot <> 19659 or instruction <> 23367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23367, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19660 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:230
//		EXTEND
// slot 19660
                            if slot <> 19660 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:231
//		INDEX	DPNDX
// slot 19661
                            if slot <> 19661 or instruction <> 21319 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21319, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21319, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1131] to agcAotUnit1131@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:232
//		DCA	DELTEMPX
// slot 19662
    19662, 26268
)).

// bank 21, slots 19663-19663
function agcAotUnit1132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:233
//		INDEX	DPNDX
// slot 19663
    if slot <> 19663 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1132] to agcAotUnit1132@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:234
//		DAS	DRHO
// slot 19664
    19664, 18134
)).

// bank 21, slots 19665-19665
function agcAotUnit1133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:235
//		EXTEND
// slot 19665
    if slot <> 19665 or instruction <> 6 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1133] to agcAotUnit1133@.

// bank 21, slots 19666-19666
function agcAotUnit1134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:236
//		INDEX	DPNDX
// slot 19666
    if slot <> 19666 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1134] to agcAotUnit1134@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:237
//		DCA	DELTEMPX
// slot 19667
    19667, 26268
)).

// bank 21, slots 19668-19668
function agcAotUnit1135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:238
//		INDEX	DPNDX
// slot 19668
    if slot <> 19668 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1135] to agcAotUnit1135@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:239
//		DAS	MERRORX
// slot 19669
    19669, 18116
)).

// bank 21, slots 19670-19670
function agcAotUnit1136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:240
//		INDEX	DPNDX
// slot 19670
    if slot <> 19670 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1136] to agcAotUnit1136@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:241
//		CA	DRHO
// slot 19671
    19671, 26324
)).

// bank 21, slots 19672-19675
function agcAotUnit1137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19673 {
        if slot <= 19672 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:242
//		DOUBLE			# N.B.
// slot 19672
            if slot <> 19672 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:243
//		DOUBLE			# N.B.
// slot 19673
            if slot <> 19673 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19674 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:244
//		EXTEND
// slot 19674
            if slot <> 19674 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:245
//		INDEX	ATTKALMN	# PICK UP DESIRED FILTER GAINS
// slot 19675
            if slot <> 19675 or instruction <> 21391 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1137] to agcAotUnit1137@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:246
//		MP	GAIN2
// slot 19676
    19676, 60570
)).

// bank 21, slots 19677-19677
function agcAotUnit1138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:247
//		INDEX	DPNDX		# ADOT   + (.16)(.1)DRHO
// slot 19677
    if slot <> 19677 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1138] to agcAotUnit1138@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:248
//		DAS	ADOT		#     -1
// slot 19678
    19678, 18104
)).

// bank 21, slots 19679-19679
function agcAotUnit1139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:249
//		INDEX	SPNDX		# S/C TORQUE TO INERTIA RATIO
// slot 19679
    if slot <> 19679 or instruction <> 21318 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1139] to agcAotUnit1139@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:250
//		CA	KMJ		# SCALED (450)(1600)/(57.3)(16384)=1/1.3
// slot 19680
    19680, 26400
)).

// bank 21, slots 19681-19682
function agcAotUnit1140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19681 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:251
//		EXTEND
// slot 19681
        if slot <> 19681 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:252
//		INDEX	SPNDX
// slot 19682
        if slot <> 19682 or instruction <> 21318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1140] to agcAotUnit1140@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:253
//		MP	DFT
// slot 19683
    19683, 59086
)).

// bank 21, slots 19684-19684
function agcAotUnit1141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:254
//		INDEX	DPNDX
// slot 19684
    if slot <> 19684 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1141] to agcAotUnit1141@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:255
//		DAS	ADOT		# KMJ(DFT)
// slot 19685
    19685, 18104
)).

// bank 21, slots 19686-19693
function agcAotUnit1142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19689 {
        if slot <= 19687 {
            if slot <= 19686 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:256
//		CCS	SPNDX
// slot 19686
                if slot <> 19686 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:257
//		TCF	ADOTLOOP	# END CALCULATION OF VEHICLE RATES
// slot 19687
                if slot <> 19687 or instruction <> 5321 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5321, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19688 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:258
//KMATRIX		CA	ATTSEC
// slot 19688
                if slot <> 19688 or instruction <> 13168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 880).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:259
//		MASK	LOW4
// slot 19689
                if slot <> 19689 or instruction <> 31254 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                    if fixedOperand = 15 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 16) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19691 {
            if slot <= 19690 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:260
//		CCS	A
// slot 19690
                if slot <> 19690 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:261
//		TCF	TENTHSEK
// slot 19691
                if slot <> 19691 or instruction <> 5361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19692 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:262
//		CAF	PRIO34		# CALL FOR 1 SEC UPDATE OF TRANSFORMATION
// slot 19692
                if slot <> 19692 or instruction <> 16313 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:263
//		TC	NOVAC		# MATRIX FROM GIMBAL AXES TO BODY AXES
// slot 19693
                if slot <> 19693 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1142] to agcAotUnit1142@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:264
//		EBANK=	KMPAC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:265
//		2CADR	AMBGUPDT
// slot 19694 19695
    19694, 3662, 19695, 36972
)).

// bank 21, slots 19696-19706
function agcAotUnit1143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19700 {
        if slot <= 19697 {
            if slot <= 19696 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:266
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:267
//		CAF	NINE
// slot 19696
                if slot <> 19696 or instruction <> 14556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:268
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:269
//TENTHSEK	TS	ATTSEC
// slot 19697
                if slot <> 19697 or instruction <> 23408 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23408, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19698 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:270
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:271
//# Page 1007
// RCS-CSM_DIGITAL_AUTOPILOT.agc:272
//# WHEN AUTOMATIC MANEUVERS ARE BEING PERFORMED, THE FOLLOWING ANGLE ADDITION MUST BE MADE TO PROVIDE A SMOOTH
// RCS-CSM_DIGITAL_AUTOPILOT.agc:273
//# SEQUENCE OF ANGULAR COMMANDS TO THE AUTOPILOT--
// RCS-CSM_DIGITAL_AUTOPILOT.agc:274
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:275
//#	CDUXD = CDUXD + DELCDUX		(DOUBLE PRECISION)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:276
//#	CDUYD = CDUYD + DELCDUY		(DOUBLE PRECISION)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:277
//#	CDUZD = CDUZD + DELCDUZ		(DOUBLE PRECISION)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:278
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:279
//# THE STEERING PROGRAMS-
// RCS-CSM_DIGITAL_AUTOPILOT.agc:280
//#	1) ATTITUDE MANEUVER ROUTINE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:281
//#	2) LEM TRACKING
// RCS-CSM_DIGITAL_AUTOPILOT.agc:282
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:283
//# SHOULD GENERATE THE DESIRED ANGLES (CDUXD, CDUYD, CDUZD) AS WELL AS THE INCREMENTAL ANGLES (DELCDUX, DELCDUY,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:284
//# DELCDUZ) SO THAT THE GIMBAL ANGLE COMMANDS CAN BE INTERPOLATED BETWEEN UPDATES.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:285
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:286
//# HOLDFLAG CODING-
// RCS-CSM_DIGITAL_AUTOPILOT.agc:287
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:288
//#	+ = GRAB PRESENT CDU ANGLES AND STORE IN THETADX, THETADY, THETADZ
// RCS-CSM_DIGITAL_AUTOPILOT.agc:289
//#	    AND PERFORM ATTITUDE HOLD ABOUT THESE ANGLES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:290
//#	    ALSO IGNORE AUTOMATIC STEERING
// RCS-CSM_DIGITAL_AUTOPILOT.agc:291
//#	    SET = + BY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:292
//#		1) INITIALIZATION PHASE OF AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:293
//#		2) OCCURANCE OF RHC COMMANDS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:294
//#		3) FREE MODE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:295
//#		4) SWITCH OVER TO ATTITUDE HOLD FROM AUTO
// RCS-CSM_DIGITAL_AUTOPILOT.agc:296
//#		   WHILE DOING AUTOMATIC STEERING (IN THIS CASE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:297
//#		   HOLDFLAG IS NOT ACTUALLY SET TO +, BUT THE LOGIC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:298
//#		   FUNCTIONS AS IF IT WERE.)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:299
//#		5) S/C CONTROL SWITCH IS SCS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:300
//#		6) IMU POWER OFF
// RCS-CSM_DIGITAL_AUTOPILOT.agc:301
//#      +0 = IN ATTITUDE HOLD ABOUT A PREVIOUSLY ESTABLISHED REFERENCE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:302
//#	- = PERFORMING AUTOMATIC MANEUVER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:303
//#      -0 = NOT USED AT PRESENT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:304
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:305
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:306
//# 	NOTE THAT THIS FLAG MUST BE SET = - BY THE STEERING PROGRAM IF IT IS TO COMMAND THE AUTOPILOT.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:307
//# SINCE ASTRONAUT ACTION MAY CHANGE THE HOLDFLAG SETTING, IT SHOULD BE MONITORED BY THE STEERING PROGRAM TO
// RCS-CSM_DIGITAL_AUTOPILOT.agc:308
//# DETERMINE IF THE AUTOMATIC SEQUENCE HAS BEEN INTERRUPTED AND IF SO, TAKE THE APPROPRIATE ACTION.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:309
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:310
//		CS	HOLDFLAG
// slot 19698
                if slot <> 19698 or instruction <> 17114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 730).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19699 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:311
//		EXTEND
// slot 19699
                    if slot <> 19699 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:312
//		BZMF	DACNDLS		# IF HOLDFLAG +0,-0,+, BYPASS AUTOMATIC
// slot 19700
                    if slot <> 19700 or instruction <> 25865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25865, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19703 {
            if slot <= 19701 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:313
//					# COMMANDS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:314
//DCDUINCR	CAF	TWO
// slot 19701
                if slot <> 19701 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19702 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:315
//DELOOP		TS	SPNDX
// slot 19702
                    if slot <> 19702 or instruction <> 23366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:316
//		DOUBLE
// slot 19703
                    if slot <> 19703 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19704 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:317
//		TS	DPNDX
// slot 19704
                if slot <> 19704 or instruction <> 23367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23367, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19705 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:318
//		EXTEND
// slot 19705
                    if slot <> 19705 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:319
//		INDEX	A
// slot 19706
                    if slot <> 19706 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1143] to agcAotUnit1143@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:320
//		DCA	CDUXD
// slot 19707
    19707, 26446
)).

// bank 21, slots 19708-19710
function agcAotUnit1144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19708 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:321
//# Page 1008
// RCS-CSM_DIGITAL_AUTOPILOT.agc:322
//		DXCH	KMPAC
// slot 19708
        if slot <> 19708 or instruction <> 22345 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19709 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:323
//		EXTEND
// slot 19709
            if slot <> 19709 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:324
//		INDEX	DPNDX
// slot 19710
            if slot <> 19710 or instruction <> 21319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1144] to agcAotUnit1144@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:325
//		DCA	DELCDUX
// slot 19711
    19711, 26364
)).

// bank 21, slots 19712-19715
function agcAotUnit1145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19713 {
        if slot <= 19712 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:326
//		TC	DPADD
// slot 19712
            if slot <> 19712 or instruction <> 1068 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1068, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:327
//		EXTEND
// slot 19713
            if slot <> 19713 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19714 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:328
//		DCA	KMPAC
// slot 19714
            if slot <> 19714 or instruction <> 13129 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 841, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:329
//		INDEX	SPNDX
// slot 19715
            if slot <> 19715 or instruction <> 21318 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1145] to agcAotUnit1145@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:330
//		TS	THETADX
// slot 19716
    19716, 46836
)).

// bank 21, slots 19717-19717
function agcAotUnit1146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:331
//		INDEX	DPNDX
// slot 19717
    if slot <> 19717 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1146] to agcAotUnit1146@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:332
//		DXCH	CDUXD
// slot 19718
    19718, 44878
)).

// bank 21, slots 19719-19778
function agcAotUnit1147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19748 {
        if slot <= 19733 {
            if slot <= 19725 {
                if slot <= 19721 {
                    if slot <= 19719 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:333
//		CCS	SPNDX
// slot 19719
                        if slot <> 19719 or instruction <> 4934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 838).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19720 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:334
//		TCF	DELOOP
// slot 19720
                            if slot <> 19720 or instruction <> 5366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:335
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:336
//# Page 1009
// RCS-CSM_DIGITAL_AUTOPILOT.agc:337
//# RCS-CSM AUTOPILOT ATTITUDE ERROR DISPLAY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:338
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:339
//# THREE TYPES OF ATTITUDE ERRORS MAY BE DISPLAYED ON THE FDAI-
// RCS-CSM_DIGITAL_AUTOPILOT.agc:340
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:341
//#	MODE 1)	AUTOPILOT FOLLOWING ERRORS		SELECTED BY V61E
// RCS-CSM_DIGITAL_AUTOPILOT.agc:342
//#		GENERATED INTERNALLY BY THE AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:343
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:344
//#	MODE 2)	TOTAL ATTITUDE ERRORS			SELECTED BY V62E
// RCS-CSM_DIGITAL_AUTOPILOT.agc:345
//#		WITH RESPECT TO THE CONTENTS OF N22
// RCS-CSM_DIGITAL_AUTOPILOT.agc:346
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:347
//#	MODE 3)	TOTAL ASTRONAUT ATTITUDE ERRORS		SELECTED BY V63E
// RCS-CSM_DIGITAL_AUTOPILOT.agc:348
//#		WITH RESPECT TO THE CONTENTS OF N17
// RCS-CSM_DIGITAL_AUTOPILOT.agc:349
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:350
//# MODE 1 IS PROVIDED AS A MONITOR OF THE RCS DAP AND ITS ABILITY TO TRACK AUTOMATIC STEERING COMMANDS.  IN THIS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:351
//# MODE THE ATTITUDE ERRORS WILL BE ZEROED WHEN THE CMC MODE SWITCH IS IN FREE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:352
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:353
//# MODE 2 IS PROVIDED TO ASSIST THE CREW IN MANUALLY MANEUVERING THE S/C TO THE ATTITUDE (GIMBAL ANGLES) SPECIFIED
// RCS-CSM_DIGITAL_AUTOPILOT.agc:354
//# IN N22.  THE ATTITUDE ERRORS WRT THESE ANGLES AND THE CURRENT CDU ANGLES ARE RESOLVED INTO S/C CONTROL AXES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:355
//# AS A FLY-TO INDICATOR.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:356
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:357
//# MODE 3 IS PROVIDED TO ASSIST THE CREW IN MANUALLY MANEUVERING THE S/C TO THE ATTITUDE (GIMBAL ANGLES) SPECIFIED
// RCS-CSM_DIGITAL_AUTOPILOT.agc:358
//# IN N17.  THE ATTITUDE ERRORS WRT THESE ANGLES AND THE CURRENT CDU ANGLES ARE RESOLVED INTO S/C CONTROL AXES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:359
//# AS A FLY-TO INDICATOR.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:360
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:361
//# 	V60 IS PROVIDED TO LOAD N17 WITH A SNAPSHOT OF THE CURRENT CDU ANGLES, THUS SYNCHRONIZING THE MODE 3 DISPLAY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:362
//# WITH THE CURRENT S/C ATTITUDE.  THIS VERB MAY BE USED AT ANY TIME.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:363
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:364
//# 	THESE DISPLAYS WILL BE AVAILABLE IN ANY MODE (AUTO, HOLD, FREE, G+N, OR SCS) ONCE THE RCS DAP HAS BEEN
// RCS-CSM_DIGITAL_AUTOPILOT.agc:365
//# INITIATED VIA V46E.  MODE 1, HOWEVER, WILL BE MEANINGFUL ONLY IN G+N AUTO OR HOLD.  THE CREW MAY PRESET (VIA
// RCS-CSM_DIGITAL_AUTOPILOT.agc:366
//# V25N17) AN ATTITUDE REFERENCE (DESIRED GIMBAL ANGLES) INTO N17 AT ANY TIME.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:367
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:368
//DACNDLS		CS	RCSFLAGS	# ALTERNATE BETWEEN FDAIDSP1 AND FDAIDSP2
// slot 19721
                            if slot <> 19721 or instruction <> 17217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 833).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19723 {
                        if slot <= 19722 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:369
//		MASK	BIT4
// slot 19722
                            if slot <> 19722 or instruction <> 31244 { return choose false if checkOnly else -1. }
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
// RCS-CSM_DIGITAL_AUTOPILOT.agc:370
//		EXTEND
// slot 19723
                            if slot <> 19723 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19724 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:371
//		BZF	FDAIDSP2
// slot 19724
                            if slot <> 19724 or instruction <> 5744 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:372
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:373
//FDAIDSP1	ADS	RCSFLAGS
// slot 19725
                            if slot <> 19725 or instruction <> 12097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19729 {
                    if slot <= 19727 {
                        if slot <= 19726 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:374
//		TC	NEEDLER
// slot 19726
                            if slot <> 19726 or instruction <> 1296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1296, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:375
//KRESUME1	TCF	RESUME		# END PHASE 1
// slot 19727
                            if slot <> 19727 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19728 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:376
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:377
//# Page 1010
// RCS-CSM_DIGITAL_AUTOPILOT.agc:378
//# FDAI ATTITUDE ERROR DISPLAY SUBROUTINE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:379
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:380
//# PROGRAM DESCRIPTION:	D. KEENE  5/24/67
// RCS-CSM_DIGITAL_AUTOPILOT.agc:381
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:382
//# 	THIS SUBROUTINE IS USED TO DISPLAY ATTITUDE ERRORS ON THE FDAI VIA THE DIGITAL TO ANALOG CONVERTERS (DACS)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:383
//# IN THE CDUS.  CARE IS TAKEN TO METER OUT THE APPROPRIATE NUMBER OF PULSES TO THE IMU ERROR COUNTERS AND PREVENT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:384
//# OVERFLOW, TO CONTROL THE RELAY SEQUENCING, AND TO AVOID INTERFERENCE WITH THE COARSE ALIGN LOOP WHICH ALSO USES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:385
//# THE DACS.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:386
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:387
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:388
//# CALLING SEQUENCE:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:389
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:390
//# 	DURING THE INITIALIZATION SECTION OF THE USER'S PROGRAM, BIT3 OF RCSFLAGS SHOULD BE SET TO INITIATE THE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:391
//# TURN-ON SEQUENCE WITHIN THE NEEDLES PROGRAM:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:392
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:393
//#		CS	RCSFLAGS	# IN EBANK6
// RCS-CSM_DIGITAL_AUTOPILOT.agc:394
//#		MASK	BIT3
// RCS-CSM_DIGITAL_AUTOPILOT.agc:395
//#		ADS	RCSFLAGS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:396
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:397
//# THEREAFTER, THE ATTITUDE ERRORS GENERATED BY THE USER SHOULD BE TRANSFERED TO THE FOLLOWING LOCATIONS IN EBANK6:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:398
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:399
//#		AK	SCALED 180 DEGREES	NOTE:	THESE LOCATIONS ARE SUBJECT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:400
//#		AK1	SCALED 180 DEGREES		TO CHANGE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:401
//#		AK2	SCALED 180 DEGREES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:402
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:403
//# FULL SCALED DEFLECTION CORRESPONDS TO 16 7/8 DEGREES OF ATTITUDE ERROR
// RCS-CSM_DIGITAL_AUTOPILOT.agc:404
//#		(= 384 BITS IN IMU ERROR COUNTER)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:405
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:406
//# A CALL TO NEEDLER WILL THEN UPDATE THE DISPLAY:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:407
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:408
//#		INHINT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:409
//#		TC	IBNKCALL	# NOTE: EBANK SHOULD BE SET TO E6
// RCS-CSM_DIGITAL_AUTOPILOT.agc:410
//#		CADR	NEEDLER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:411
//#		RELINT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:412
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:413
//# 	THIS PROCESS SHOULD BE REPEATED EACH TIME THE ERRORS ARE UPDATED.  AT LEAST 3 PASSES THRU THE PROGRAM ARE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:414
//# REQUIRED BEFORE ANYTHING IS ACTUALLY DISPLAYED ON THE ERROR METERS.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:415
//# NOTE: EACH CALL TO NEEDLER MUST BE SEPARATED BY AT LEAST 50MS TO ASSURE PROPER RELAY SEQUENCING.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:416
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:417
//# ERASABLE USED:
// RCS-CSM_DIGITAL_AUTOPILOT.agc:418
//#		AK		CDUXCMD
// RCS-CSM_DIGITAL_AUTOPILOT.agc:419
//#		AK1		CDUYCMD
// RCS-CSM_DIGITAL_AUTOPILOT.agc:420
//#		AK2		CDUZCMD
// RCS-CSM_DIGITAL_AUTOPILOT.agc:421
//#		EDRIVEX		A,L,Q
// RCS-CSM_DIGITAL_AUTOPILOT.agc:422
//#		EDRIVEY		T5TEMP
// RCS-CSM_DIGITAL_AUTOPILOT.agc:423
//#		EDRIVEZ		SPNDX
// RCS-CSM_DIGITAL_AUTOPILOT.agc:424
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:425
//# SWITCHES:	RCSFLAGS	BITS 3,2
// RCS-CSM_DIGITAL_AUTOPILOT.agc:426
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:427
//# I/O CHANNELS:	CHAN12		BIT 4 (COARSE ALIGN - READ ONLY)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:428
//# Page 1011
// RCS-CSM_DIGITAL_AUTOPILOT.agc:429
//#		CHAN12		BIT 6 (IMU ERROR COUNTER ENABLE)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:430
//#		CHAN14		BIT 13,14,15 (DAC ACTIVITY)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:431
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:432
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:433
//# SIGN CONVENTION<	AK = THETAC - THETA
// RCS-CSM_DIGITAL_AUTOPILOT.agc:434
//#		WHERE	THETAC = COMMAND ANGLE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:435
//#			THETA = PRESENT ANGLE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:436
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:437
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:438
//NEEDLER		CAF	BIT4		# CHECK FOR COARSE ALIGN ENABLE
// slot 19728
                            if slot <> 19728 or instruction <> 14860 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:439
//		EXTEND			# IF IN COARSE ALIGN DO NOT USE IMU
// slot 19729
                            if slot <> 19729 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19731 {
                        if slot <= 19730 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:440
//		RAND	CHAN12		# ERROR COUNTERS.  DONT USE NEEDLES
// slot 19730
                            if slot <> 19730 or instruction <> 1034 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:441
//		EXTEND
// slot 19731
                            if slot <> 19731 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19732 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:442
//		BZF	NEEDLER1
// slot 19732
                            if slot <> 19732 or instruction <> 5401 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5401, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:443
//		CS	RCSFLAGS	# SET BIT3 FOR INITIALIZATION PASS
// slot 19733
                            if slot <> 19733 or instruction <> 17217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 833).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19740 {
                if slot <= 19736 {
                    if slot <= 19734 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:444
//		MASK	BIT3
// slot 19734
                        if slot <> 19734 or instruction <> 31245 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            if fixedOperand = 4 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19735 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:445
//		ADS	RCSFLAGS
// slot 19735
                            if slot <> 19735 or instruction <> 12097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:446
//		TC	Q
// slot 19736
                            if slot <> 19736 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19738 {
                        if slot <= 19737 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:447
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:448
//NEEDLER1	CA	RCSFLAGS
// slot 19737
                            if slot <> 19737 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:449
//		MASK	SIX
// slot 19738
                            if slot <> 19738 or instruction <> 31881 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                if fixedOperand = 6 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19739 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:450
//		EXTEND
// slot 19739
                            if slot <> 19739 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:451
//		BZF	NEEDLES3
// slot 19740
                            if slot <> 19740 or instruction <> 5433 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5433, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19744 {
                    if slot <= 19742 {
                        if slot <= 19741 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:452
//		MASK	BIT3
// slot 19741
                            if slot <> 19741 or instruction <> 31245 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                if fixedOperand = 4 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:453
//		EXTEND
// slot 19742
                            if slot <> 19742 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19743 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:454
//		BZF	NEEDLER2	# BIT3 = 0, BIT2 = 1
// slot 19743
                            if slot <> 19743 or instruction <> 5426 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5426, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:455
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:456
//		CS	BIT6		# FIRST PASS BIT3 = 1
// slot 19744
                            if slot <> 19744 or instruction <> 18954 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19746 {
                        if slot <= 19745 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:457
//		EXTEND			# DISABLE IMU ERROR COUNTER TO ZERO DACS
// slot 19745
                            if slot <> 19745 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:458
//		WAND	CHAN12		# MUST WAIT AT LEAST 60 MS BEFORE
// slot 19746
                            if slot <> 19746 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19747 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:459
//NEEDLE11	CS	ZERO		# ENABLING COUNTERS.
// slot 19747
                            if slot <> 19747 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:460
//		TS	AK		# ZERO THE INPUTS ON FIRST PASS
// slot 19748
                            if slot <> 19748 or instruction <> 23358 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23358, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19763 {
            if slot <= 19755 {
                if slot <= 19751 {
                    if slot <= 19749 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:461
//		TS	AK1
// slot 19749
                        if slot <> 19749 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19750 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:462
//		TS	AK2
// slot 19750
                            if slot <> 19750 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:463
//		TS	EDRIVEX		# ZERO THE DISPLAY REGISTERS
// slot 19751
                            if slot <> 19751 or instruction <> 23363 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23363, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19753 {
                        if slot <= 19752 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:464
//		TS	EDRIVEY
// slot 19752
                            if slot <> 19752 or instruction <> 23364 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23364, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:465
//		TS	EDRIVEZ
// slot 19753
                            if slot <> 19753 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19754 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:466
//		TS	CDUXCMD		# ZERO THE OUT COUNTERS
// slot 19754
                            if slot <> 19754 or instruction <> 22568 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22568, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:467
//		TS	CDUYCMD
// slot 19755
                            if slot <> 19755 or instruction <> 22569 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22569, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19759 {
                    if slot <= 19757 {
                        if slot <= 19756 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:468
//		TS	CDUZCMD
// slot 19756
                            if slot <> 19756 or instruction <> 22570 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22570, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:469
//		CS	SIX		# RESET RCSFLAGS FOR PASS2
// slot 19757
                            if slot <> 19757 or instruction <> 19593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19758 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:470
//		MASK	RCSFLAGS
// slot 19758
                            if slot <> 19758 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:471
//		AD	BIT2
// slot 19759
                            if slot <> 19759 or instruction <> 27150 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19761 {
                        if slot <= 19760 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:472
//		TS	RCSFLAGS
// slot 19760
                            if slot <> 19760 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:473
//		TC	Q		# END PASS1
// slot 19761
                            if slot <> 19761 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19762 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:474
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:475
//NEEDLER2	CAF	BIT6		# ENABLE IMU ERROR COUNTERS
// slot 19762
                            if slot <> 19762 or instruction <> 14858 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:476
//		EXTEND
// slot 19763
                            if slot <> 19763 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 19770 {
                if slot <= 19766 {
                    if slot <= 19764 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:477
//		WOR	CHAN12
// slot 19764
                        if slot <> 19764 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19765 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:478
//		CS	SIX		# RESET RCSFLAGS TO DISPLAY ATTITUDE
// slot 19765
                            if slot <> 19765 or instruction <> 19593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:479
//# Page 1012
// RCS-CSM_DIGITAL_AUTOPILOT.agc:480
//		MASK	RCSFLAGS	# ERRORS    WAIT AT LEAST 4 MS FOR
// slot 19766
                            if slot <> 19766 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19768 {
                        if slot <= 19767 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:481
//		TS	RCSFLAGS	# RELAY CLOSURE
// slot 19767
                            if slot <> 19767 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:482
//		TC	Q
// slot 19768
                            if slot <> 19768 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19769 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:483
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:484
//NEEDLES3	CAF	BIT6		# CHECK TO SEE IF IMU ERROR COUNTER
// slot 19769
                            if slot <> 19769 or instruction <> 14858 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:485
//		EXTEND			# IS ENABLED
// slot 19770
                            if slot <> 19770 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19774 {
                    if slot <= 19772 {
                        if slot <= 19771 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:486
//		RAND	CHAN12
// slot 19771
                            if slot <> 19771 or instruction <> 1034 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:487
//		EXTEND			# IF NOT RECYCLE NEEDLES
// slot 19772
                            if slot <> 19772 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19773 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:488
//		BZF	NEEDLER +5
// slot 19773
                            if slot <> 19773 or instruction <> 5397 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5397, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:489
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:490
//NEEDLES		CAF	TWO
// slot 19774
                            if slot <> 19774 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 19776 {
                        if slot <= 19775 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:491
//DACLOOP		TS	SPNDX
// slot 19775
                            if slot <> 19775 or instruction <> 23366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:492
//		CS	QUARTER
// slot 19776
                            if slot <> 19776 or instruction <> 18947 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19777 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:493
//		EXTEND
// slot 19777
                            if slot <> 19777 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:494
//		INDEX	SPNDX
// slot 19778
                            if slot <> 19778 or instruction <> 21318 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21318, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21318, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1147] to agcAotUnit1147@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:495
//		MP	AK
// slot 19779
    19779, 59004
)).

// bank 21, slots 19780-19788
function agcAotUnit1148 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19783 {
        if slot <= 19781 {
            if slot <= 19780 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:496
//		TS	L
// slot 19780
                if slot <> 19780 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:497
//		CCS	A
// slot 19781
                if slot <> 19781 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19782 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:498
//		CA	DACLIMIT
// slot 19782
                if slot <> 19782 or instruction <> 13666 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1378), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:499
//		TCF	+2
// slot 19783
                if slot <> 19783 or instruction <> 5449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5449, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19785 {
            if slot <= 19784 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:500
//		CS	DACLIMIT
// slot 19784
                if slot <> 19784 or instruction <> 17762 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1378), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:501
//		AD	L
// slot 19785
                if slot <> 19785 or instruction <> 24577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19786 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:502
//		TS	T5TEMP		# OVFLO CHK
// slot 19786
                if slot <> 19786 or instruction <> 23362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19787 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:503
//		TCF	+4
// slot 19787
                    if slot <> 19787 or instruction <> 5455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5455, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:504
//		INDEX	A		# ON OVERFLOW LIMIT OUTPUT TO +-384
// slot 19788
                    if slot <> 19788 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1148] to agcAotUnit1148@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:505
//		CAF	DACLIMIT
// slot 19789
    19789, 27332
)).

// bank 21, slots 19790-19791
function agcAotUnit1149 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19790 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:506
//		TS	L
// slot 19790
        if slot <> 19790 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:507
//		INDEX	SPNDX
// slot 19791
        if slot <> 19791 or instruction <> 21318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1149] to agcAotUnit1149@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:508
//		CS	EDRIVEX		# CURRENT VALUE OF DAC
// slot 19792
    19792, 34438
)).

// bank 21, slots 19793-19794
function agcAotUnit1150 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19793 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:509
//		AD	L
// slot 19793
        if slot <> 19793 or instruction <> 24577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:510
//		INDEX	SPNDX
// slot 19794
        if slot <> 19794 or instruction <> 21318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1150] to agcAotUnit1150@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:511
//		ADS	CDUXCMD
// slot 19795
    19795, 22608
)).

// bank 21, slots 19796-19796
function agcAotUnit1151 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:512
//		INDEX	SPNDX
// slot 19796
    if slot <> 19796 or instruction <> 21318 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1151] to agcAotUnit1151@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:513
//		LXCH	EDRIVEX
// slot 19797
    19797, 20102
)).

// bank 21, slots 19798-19807
function agcAotUnit1152 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19802 {
        if slot <= 19799 {
            if slot <= 19798 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:514
//		CCS	SPNDX
// slot 19798
                if slot <> 19798 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:515
//		TCF	DACLOOP
// slot 19799
                if slot <> 19799 or instruction <> 5439 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5439, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19800 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:516
//		CAF	13,14,15
// slot 19800
                if slot <> 19800 or instruction <> 16327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4039), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19801 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:517
//		EXTEND
// slot 19801
                    if slot <> 19801 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:518
//		WOR	CHAN14		# SET DAC ACTIVITY BITS
// slot 19802
                    if slot <> 19802 or instruction <> 2572 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19804 {
            if slot <= 19803 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:519
//		TC	Q
// slot 19803
                if slot <> 19803 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:520
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:521
//REINIT		CAF	DELAY200	# ........TILT LOGIC
// slot 19804
                if slot <> 19804 or instruction <> 13664 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1376), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19805 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:522
//		TS	TIME5		# REINITIALIZE DAP IN 200MS
// slot 19805
                if slot <> 19805 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19806 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:523
//		TS	T5PHASE
// slot 19806
                    if slot <> 19806 or instruction <> 23349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:524
//		TCF	RESUME
// slot 19807
                    if slot <> 19807 or instruction <> 6875 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1152] to agcAotUnit1152@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:525
//DELAY200	DEC	16364		# 200MS
// slot 19808
    19808, 32728,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:526
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:527
//		DEC	-384
// slot 19809
    19809, 64766,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:528
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:529
//# Page 1013
// RCS-CSM_DIGITAL_AUTOPILOT.agc:530
//DACLIMIT	DEC	16000
// slot 19810
    19810, 32000,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:531
//		DEC	384
// slot 19811
    19811, 768
)).

// bank 21, slots 19812-19814
function agcAotUnit1153 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19812 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:532
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:533
//# Page 1014
// RCS-CSM_DIGITAL_AUTOPILOT.agc:534
//# INITIALIZATION PROGRAM FOR RCS-CSM AUTOPILOT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:535
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:536
//# THE FOLLOWING QUANTITIES WILL BE ZEROED AND SHOULD APPEAR IN CONSECUTIVE LOCATIONS IN MEMORY AFTER WBODY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:537
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:538
//# WBODY		(+1)		DFT			TAU2
// RCS-CSM_DIGITAL_AUTOPILOT.agc:539
//# WBODY1	(+1)		DFT1			BIAS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:540
//# WBODY2	(+1)		DFT2			BIAS1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:541
//# ADOT		(+1)		DRHO	(+1)		BIAS2
// RCS-CSM_DIGITAL_AUTOPILOT.agc:542
//# ADOT1		(+1)		DRHO1	(+1)		ERRORX
// RCS-CSM_DIGITAL_AUTOPILOT.agc:543
//# ADOT2		(+1)		DRHO2	(+1)		ERRORY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:544
//# MERRORX	(+1)		ATTSEC			ERRORZ
// RCS-CSM_DIGITAL_AUTOPILOT.agc:545
//# MERRORY	(+1)		TAU
// RCS-CSM_DIGITAL_AUTOPILOT.agc:546
//# MERRORZ	(+1)		TAU1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:547
//FRESHDAP	CAF	ONE		# RESET HOLDFLAG TO STOP AUTOMATIC
// slot 19812
        if slot <> 19812 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19813 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:548
//		TS	HOLDFLAG	# STEERING AND PREPARE TO PICK UP AN
// slot 19813
            if slot <> 19813 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:549
//					# ATTITUDE HOLD REFERENCE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:550
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:551
//REDAP		TC	IBNKCALL	# DECODE DAPDATR1, DAPDATR2 FOR DEADBANDS
// slot 19814
            if slot <> 19814 or instruction <> 2528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1153] to agcAotUnit1153@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:552
//		CADR	S41.2		# RATES, QUADFAILS, QUAD MANAGEMENT
// slot 19815
    19815, 33230
)).

// bank 21, slots 19816-19816
function agcAotUnit1154 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:553
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:554
//		TC	IBNKCALL	# DECODE IXX, IAVG, AND CONVERT
// slot 19816
    if slot <> 19816 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1154] to agcAotUnit1154@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:555
//		CADR	S40.14		# TO AUTOPILOT GAINS
// slot 19817
    19817, 33408
)).

// bank 21, slots 19818-19818
function agcAotUnit1155 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:556
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:557
//		CAF	NO.T5VAR	# NO. LOCATIONS TO BE ZEROED MINUS ONE
// slot 19818
    if slot <> 19818 or instruction <> 13715 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        local fixedOperand is mod(readEffective:call(words, 1427), 32768).
        set words[0] to agcSignExtend(fixedOperand).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1155] to agcAotUnit1155@.

// bank 21, slots 19819-19821
function agcAotUnit1156 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19819 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:558
//ZEROT5		TS	SPNDX		# ZERO ALL NECESSARY ERASABLE REGISTERS
// slot 19819
        if slot <> 19819 or instruction <> 23366 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23366, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19820 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:559
//		CAF	ZERO
// slot 19820
            if slot <> 19820 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:560
//		INDEX	SPNDX
// slot 19821
            if slot <> 19821 or instruction <> 21318 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1156] to agcAotUnit1156@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:561
//		TS	WBODY
// slot 19822
    19822, 46762
)).

// bank 21, slots 19823-19851
function agcAotUnit1157 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19836 {
        if slot <= 19829 {
            if slot <= 19825 {
                if slot <= 19823 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:562
//		CCS	SPNDX
// slot 19823
                    if slot <> 19823 or instruction <> 4934 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 838).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19824 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:563
//		TCF	ZEROT5
// slot 19824
                        if slot <> 19824 or instruction <> 5483 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5483, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:564
//		TCR	ZEROJET
// slot 19825
                        if slot <> 19825 or instruction <> 1434 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1434, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19827 {
                    if slot <= 19826 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:565
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:566
//		CS	ZERO
// slot 19826
                        if slot <> 19826 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:567
//		TS	CHANTEMP	# INITIALIZE MINIMUM IMPULSE CONTROL
// slot 19827
                        if slot <> 19827 or instruction <> 23451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23451, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19828 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:568
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:569
//		TS	CH31TEMP	# INITIALIZE RHC POSITION MEMORY FOR
// slot 19828
                        if slot <> 19828 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:570
//					# MANUAL RATE MODES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:571
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:572
//		CAF	=.24
// slot 19829
                        if slot <> 19829 or instruction <> 13716 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1428), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19832 {
                if slot <= 19830 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:573
//		TS	SLOPE		# INITIALIZE SWITCHING LOGIC SLOPE
// slot 19830
                    if slot <> 19830 or instruction <> 23468 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19831 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:574
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:575
//		CAF	FOUR
// slot 19831
                        if slot <> 19831 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:576
//		TS	T5TIME		# PHASE 0 RESETS FOR PHASE 2 INTERRUPT IN
// slot 19832
                        if slot <> 19832 or instruction <> 23452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19834 {
                    if slot <= 19833 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:577
//					# 60 MS.  PHASE 2 RESETS FOR PHASE 1 RUPT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:578
//					# IN (80MS - T5TIME(40MS)).  THEREFORE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:579
//					# PHASE 1 (RATEFILTER) BEGINS CYCLING 100
// RCS-CSM_DIGITAL_AUTOPILOT.agc:580
//					# MS FROM NOW AND EVERY 100MS THEREAFTER.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:581
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:582
//		CAF	ELEVEN
// slot 19833
                        if slot <> 19833 or instruction <> 14868 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:583
//		TS	ATTKALMN	# RESET TO PICK UP KALMAN FILTER GAINS
// slot 19834
                        if slot <> 19834 or instruction <> 23439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19835 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:584
//					# TO INITIALIZE THE S/C ANGULAR RATES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:585
//# Page 1015
// RCS-CSM_DIGITAL_AUTOPILOT.agc:586
//		CA	CDUX
// slot 19835
                        if slot <> 19835 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:587
//		TS	RHO
// slot 19836
                        if slot <> 19836 or instruction <> 23453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23453, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19843 {
            if slot <= 19839 {
                if slot <= 19837 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:588
//		CA	CDUY
// slot 19837
                    if slot <> 19837 or instruction <> 12315 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 27).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19838 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:589
//		TS	RHO1
// slot 19838
                        if slot <> 19838 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:590
//		CA	CDUZ
// slot 19839
                        if slot <> 19839 or instruction <> 12316 { return choose false if checkOnly else -1. }
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
                if slot <= 19841 {
                    if slot <= 19840 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:591
//		TS	RHO2
// slot 19840
                        if slot <> 19840 or instruction <> 23455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23455, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:592
//		CAF	ZERO		# RESET AUTOPILOT TO BEGIN EXECUTING
// slot 19841
                        if slot <> 19841 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    if slot <= 19842 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:593
//		TS	T5PHASE		# PHASE2 OF PROGRAM
// slot 19842
                        if slot <> 19842 or instruction <> 23349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:594
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:595
//		CS	IMODES33	# CHECK IMU STATUS
// slot 19843
                        if slot <> 19843 or instruction <> 17105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 721).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19847 {
                if slot <= 19845 {
                    if slot <= 19844 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:596
//		MASK	BIT6		# IF BIT6 = 0 IMU IN FINE ALIGN
// slot 19844
                        if slot <> 19844 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            if fixedOperand = 32 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:597
//		CCS	A		# IF BIT6 = 1 IMU NOT READY
// slot 19845
                        if slot <> 19845 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19846 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:598
//		TCF	IMUAOK
// slot 19846
                        if slot <> 19846 or instruction <> 5514 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5514, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:599
//		TS	ATTKALMN	# CANNOT USE IMU
// slot 19847
                        if slot <> 19847 or instruction <> 23439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19849 {
                    if slot <= 19848 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:600
//		CAF	RCSINITB	# PROVIDE FREE CONTROL ONLY
// slot 19848
                        if slot <> 19848 or instruction <> 13718 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1430), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:601
//		TCF	RCSSWIT		# DONT START UP RATE FILTER
// slot 19849
                        if slot <> 19849 or instruction <> 5519 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5519, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19850 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:602
//					# SIGNAL NO RATE FILTER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:603
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:604
//IMUAOK		CAF	PRIO34		# START MATRIX INITIALIZATION
// slot 19850
                        if slot <> 19850 or instruction <> 16313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:605
//		TC	NOVAC		# BYPASS IF IMU NOT IN FINE ALIGN
// slot 19851
                        if slot <> 19851 or instruction <> 2652 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2652, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1157] to agcAotUnit1157@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:606
//		EBANK=	KMPAC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:607
//		2CADR	AMBGUPDT
// slot 19852 19853
    19852, 3662, 19853, 36972
)).

// bank 21, slots 19854-19858
function agcAotUnit1158 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19855 {
        if slot <= 19854 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:608
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:609
//		CAF	RCSINIT		# CLEAR BIT14 -ASSUME WE HAVE A GOOD IMU
// slot 19854
            if slot <> 19854 or instruction <> 13717 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1429), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:610
//RCSSWIT		TS	RCSFLAGS	# CLEAR BIT1  -INITIALIZE T6 PROGRAM
// slot 19855
            if slot <> 19855 or instruction <> 23361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23361, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19856 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:611
//					#   SET BIT3  -INITIALIZE NEEDLES
// RCS-CSM_DIGITAL_AUTOPILOT.agc:612
//					# CLEAR BIT4  -RESET FOR FDAIDSP1
// RCS-CSM_DIGITAL_AUTOPILOT.agc:613
//		CAF	T5WAIT60	# NEXT T5RUPT 60 MS FROM NOW TO ALLOW IMU
// slot 19856
            if slot <> 19856 or instruction <> 13719 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1431), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19857 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:614
//					# ERROR COUNTER TO ZERO.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:615
//					# (MINIMUM DELAY = 15 MS)
// RCS-CSM_DIGITAL_AUTOPILOT.agc:616
//		TS	TIME5		# SINCE ATTKALMN IS +11, PROGRAM WILL THEN
// slot 19857
                if slot <> 19857 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:617
//		TC	RESUME		# PICK UP THE KALMAN FILTER GAINS.  RATE
// slot 19858
                if slot <> 19858 or instruction <> 2779 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2779, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1158] to agcAotUnit1158@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:618
//					# FILTER WILL BEGIN OPERATING ZOOMS FROM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:619
//					# NOW
// RCS-CSM_DIGITAL_AUTOPILOT.agc:620
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:621
//# CONSTANTS USED IN INITIALIZATION PROGRAM
// RCS-CSM_DIGITAL_AUTOPILOT.agc:622
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:623
//NO.T5VAR	DEC	36
// slot 19859
    19859, 72,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:624
//=.24		DEC	.24		# = SLOPE OF 0.6/SEC
// slot 19860
    19860, 7864,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:625
//RCSINIT		OCT	00004
// slot 19861
    19861, 8,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:626
//RCSINITB	OCT	20004
// slot 19862
    19862, 16392,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:627
//T5WAIT60	DEC	16378		# = 6 CS
// slot 19863
    19863, 32756,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:628
//		EBANK=	KMPAC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:629
//T6ADDR		2CADR	T6START
// slot 19864 19865
    19864, 3870, 19865, 30828
)).

// bank 21, slots 19866-19869
function agcAotUnit1159 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19867 {
        if slot <= 19866 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:630
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:631
//ZEROJET		CAF	ELEVEN		# ZERO BLAST2, BLAST1, BLAST, YWORD2,
// slot 19866
            if slot <> 19866 or instruction <> 14868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:632
//		TS	SPNDX		# YWORD1, PWORD2, PWORD1, RWORD2,
// slot 19867
            if slot <> 19867 or instruction <> 23366 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23366, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19868 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:633
//		CAF	ZERO		# AND RWORD1.
// slot 19868
            if slot <> 19868 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:634
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:635
//# Page 1016
// RCS-CSM_DIGITAL_AUTOPILOT.agc:636
//		INDEX	SPNDX
// slot 19869
            if slot <> 19869 or instruction <> 21318 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21318, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1159] to agcAotUnit1159@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:637
//		TS	RWORD1
// slot 19870
    19870, 46674
)).

// bank 21, slots 19871-19952
function agcAotUnit1160 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19911 {
        if slot <= 19890 {
            if slot <= 19880 {
                if slot <= 19875 {
                    if slot <= 19872 {
                        if slot <= 19871 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:638
//		CCS	SPNDX
// slot 19871
                            if slot <> 19871 or instruction <> 4934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 838).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:639
//		TCF	ZEROJET +1
// slot 19872
                            if slot <> 19872 or instruction <> 5531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19873 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:640
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:641
//		CAF	FOUR
// slot 19873
                            if slot <> 19873 or instruction <> 14861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19874 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:642
//		TS	BLAST1 +1
// slot 19874
                                if slot <> 19874 or instruction <> 23346 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23346, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:643
//		CAF	ELEVEN
// slot 19875
                                if slot <> 19875 or instruction <> 14868 { return choose false if checkOnly else -1. }
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
                    }
                } else {
                    if slot <= 19877 {
                        if slot <= 19876 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:644
//		TS	BLAST2 +1
// slot 19876
                            if slot <> 19876 or instruction <> 23348 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23348, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:645
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:646
//		CS	BIT1
// slot 19877
                            if slot <> 19877 or instruction <> 18959 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19878 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:647
//		MASK	RCSFLAGS
// slot 19878
                            if slot <> 19878 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19879 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:648
//		TS	RCSFLAGS	# RESET BIT1 OF RCSFLAGS TO 0
// slot 19879
                                if slot <> 19879 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:649
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:650
//		EXTEND
// slot 19880
                                if slot <> 19880 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 19885 {
                    if slot <= 19882 {
                        if slot <= 19881 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:651
//		DCA	T6ADDR
// slot 19881
                            if slot <> 19881 or instruction <> 13721 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1433, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:652
//		DXCH	T6LOC
// slot 19882
                            if slot <> 19882 or instruction <> 22217 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 713, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19883 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:653
//		CAF	=+14MS		# ENABLE T6RUPT TO SHUT OFF JETS IN 14 MS.
// slot 19883
                            if slot <> 19883 or instruction <> 13864 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1576), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19884 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:654
//		TS	TIME6
// slot 19884
                                if slot <> 19884 or instruction <> 22553 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22553, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:655
//		CAF	BIT15
// slot 19885
                                if slot <> 19885 or instruction <> 14849 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19887 {
                        if slot <= 19886 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:656
//		EXTEND
// slot 19886
                            if slot <> 19886 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:657
//		WOR	CHAN13
// slot 19887
                            if slot <> 19887 or instruction <> 2571 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19888 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:658
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:659
//		TC	Q
// slot 19888
                            if slot <> 19888 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19889 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:660
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:661
//T5PHASE2	CCS	ATTKALMN	# IF (+) INITIALIZE RATE ESTIMATE
// slot 19889
                                if slot <> 19889 or instruction <> 5007 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:662
//		TCF	KALUPDT
// slot 19890
                                if slot <> 19890 or instruction <> 5734 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5734, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19900 {
                if slot <= 19895 {
                    if slot <= 19892 {
                        if slot <= 19891 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:663
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:664
//		TCF	+2		# ONLY IF ATTKALMN POSITIVE
// slot 19891
                            if slot <> 19891 or instruction <> 5557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:665
//		TCF	+1
// slot 19892
                            if slot <> 19892 or instruction <> 5557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19893 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:666
//		CA	DELTATT2	# RESET FOR PHASE3 IN 20 MS
// slot 19893
                            if slot <> 19893 or instruction <> 13422 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1134), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19894 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:667
//		XCH	TIME5		# (JET SELECTION LOGIC)
// slot 19894
                                if slot <> 19894 or instruction <> 23576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 24, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:668
//		ADS	T5TIME		# TO COMPENSATE FOR DELAYS IN T5RUPT
// slot 19895
                                if slot <> 19895 or instruction <> 12188 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 924).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19897 {
                        if slot <= 19896 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:669
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:670
//		CA	RCSFLAGS	# IF A HIGH RATE AUTO MANEUVER IS IN
// slot 19896
                            if slot <> 19896 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:671
//		MASK	BIT15		# PROGRESS (BIT 15 OF RCSFLAGS SET), SET
// slot 19897
                            if slot <> 19897 or instruction <> 31233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                if fixedOperand = 16384 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19898 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:672
//		EXTEND			# ATTKALMN TO -1
// slot 19898
                            if slot <> 19898 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19899 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:673
//		BZF	NOHIAUTO	# OTHERWISE SET ATTKALMN TO 0.
// slot 19899
                                if slot <> 19899 or instruction <> 5565 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5565, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:674
//		CS	ONE
// slot 19900
                                if slot <> 19900 or instruction <> 18959 { return choose false if checkOnly else -1. }
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
                if slot <= 19905 {
                    if slot <= 19902 {
                        if slot <= 19901 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:675
//NOHIAUTO	TS	ATTKALMN
// slot 19901
                            if slot <> 19901 or instruction <> 23439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:676
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:677
//# Page 1017
// RCS-CSM_DIGITAL_AUTOPILOT.agc:678
//# MANUAL ROTATION COMMANDS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:679
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:680
//		CS	OCT01760	# RESET FORCED FIRING BITS (BITS 10 TO 5
// slot 19902
                            if slot <> 19902 or instruction <> 17946 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1562), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19903 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:681
//		MASK	RCSFLAGS	# OF RCSFLAGS) TO ZERO
// slot 19903
                            if slot <> 19903 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19904 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:682
//		TS	RCSFLAGS
// slot 19904
                                if slot <> 19904 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:683
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:684
//		EXTEND
// slot 19905
                                if slot <> 19905 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19908 {
                        if slot <= 19906 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:685
//		READ	CHAN31
// slot 19906
                            if slot <> 19906 or instruction <> 25 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19907 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:686
//		TS	L
// slot 19907
                                if slot <> 19907 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:687
//		CA	CH31TEMP
// slot 19908
                                if slot <> 19908 or instruction <> 13210 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 922).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19909 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:688
//		EXTEND
// slot 19909
                            if slot <> 19909 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19910 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:689
//		RXOR	LCHAN
// slot 19910
                                if slot <> 19910 or instruction <> 3073 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:690
//		MASK	MANROT		# = OCT00077
// slot 19911
                                if slot <> 19911 or instruction <> 30238 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 1566), 32768).
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
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
        if slot <= 19931 {
            if slot <= 19921 {
                if slot <= 19916 {
                    if slot <= 19913 {
                        if slot <= 19912 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:691
//		EXTEND
// slot 19912
                            if slot <> 19912 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:692
//		BZMF	NOCHANGE
// slot 19913
                            if slot <> 19913 or instruction <> 26068 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26068, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19914 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:693
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:694
//		LXCH	A
// slot 19914
                            if slot <> 19914 or instruction <> 9216 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 0, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19915 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:695
//		TS	CH31TEMP	# SAVE CONTENTS OF CHANNEL 31 IN CH31TEMP
// slot 19915
                                if slot <> 19915 or instruction <> 23450 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23450, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:696
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:697
//		CA	L
// slot 19916
                                if slot <> 19916 or instruction <> 12289 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 19918 {
                        if slot <= 19917 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:698
//		EXTEND
// slot 19917
                            if slot <> 19917 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:699
//		MP	BIT5		# PUT BITS 6-1 OF A IN BITS 10-5 OF L
// slot 19918
                            if slot <> 19918 or instruction <> 31243 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2571, readEffective:call(words, 2571)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19919 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:700
//		CA	L
// slot 19919
                            if slot <> 19919 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19920 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:701
//		ADS	RCSFLAGS	# SET FORCED FIRING BITS FOR AXES WITH
// slot 19920
                                if slot <> 19920 or instruction <> 12097 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 833).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:702
//					# CHANGES IN COMMAND.  BITS 10,9 FOR
// RCS-CSM_DIGITAL_AUTOPILOT.agc:703
//					# ROLL, BITS 8,7 FOR YAW, BITS 6,5 FOR
// RCS-CSM_DIGITAL_AUTOPILOT.agc:704
//					# PITCH
// RCS-CSM_DIGITAL_AUTOPILOT.agc:705
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:706
//		CS	RCSFLAGS	# SET RATE DAMPING FLAGS (BITS 13,12,AND
// slot 19921
                                if slot <> 19921 or instruction <> 17217 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 833).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19926 {
                    if slot <= 19923 {
                        if slot <= 19922 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:707
//		MASK	OCT16000	# 11 OF RCSFLAGS)
// slot 19922
                            if slot <> 19922 or instruction <> 30239 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:708
//		ADS	RCSFLAGS
// slot 19923
                            if slot <> 19923 or instruction <> 12097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19924 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:709
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:710
//NOCHANGE	CS	CH31TEMP
// slot 19924
                            if slot <> 19924 or instruction <> 17306 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 922).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19925 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:711
//		MASK	MANROT
// slot 19925
                                if slot <> 19925 or instruction <> 30238 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 1566), 32768).
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:712
//		EXTEND
// slot 19926
                                if slot <> 19926 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19928 {
                        if slot <= 19927 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:713
//		BZMF	AHFNOROT	# IF NO MANUAL COMMANDS, GO TO AHFNOROT
// slot 19927
                            if slot <> 19927 or instruction <> 26280 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26280, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:714
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:715
//		TS	HOLDFLAG	# SET HOLDFLAG +
// slot 19928
                            if slot <> 19928 or instruction <> 23258 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23258, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19929 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:716
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:717
//		TC	STICKCHK	# WHEN THE RHC IS OUT OF DETENT, PMANNDX,
// slot 19929
                            if slot <> 19929 or instruction <> 1624 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1624, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19930 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:718
//					# YMANNDX, AND RMANNDX ARE ALL SET, BY
// RCS-CSM_DIGITAL_AUTOPILOT.agc:719
//					# MEANS OF STICKCHK, TO 0, 1, OR 2 FOR NO,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:720
//					# +, OR - ROTATION RESPECTIVELY AS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:721
//					# COMMANDED BY THE RHC.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:722
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:723
//					# HOWEVER, IT IS WELL TO NOTE THAT AFTER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:724
//					# THE RHC IS RETURNED TO DETENT, THE
// RCS-CSM_DIGITAL_AUTOPILOT.agc:725
//					# PROGRAM BRANCHES TO AHFNOROT AND AVOIDS
// RCS-CSM_DIGITAL_AUTOPILOT.agc:726
//					# STICKCHK SO PMANNDX, YMANNDX, AND
// RCS-CSM_DIGITAL_AUTOPILOT.agc:727
//					# RMANNDX ARE NOT RESET TO ZERO BUT RATHER
// RCS-CSM_DIGITAL_AUTOPILOT.agc:728
//					# LEFT SET TO THEIR LAST OUT OF DETENT
// RCS-CSM_DIGITAL_AUTOPILOT.agc:729
//# Page 1018
// RCS-CSM_DIGITAL_AUTOPILOT.agc:730
//					# VALUES.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:731
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:732
//		CS	FLAGWRD1	# SET STIKFLAG TO INFORM STEERING
// slot 19930
                                if slot <> 19930 or instruction <> 16445 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 61).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:733
//		MASK	BIT14		# PROGRAMS (P20) THAT ASTRONAUT HAS
// slot 19931
                                if slot <> 19931 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19941 {
                if slot <= 19936 {
                    if slot <= 19933 {
                        if slot <= 19932 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:734
//		ADS	FLAGWRD1	# ASSUMED ROTATIONAL CONTROL OF SPACECRAFT
// slot 19932
                            if slot <> 19932 or instruction <> 11325 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:735
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:736
//		CAF	BIT14
// slot 19933
                            if slot <> 19933 or instruction <> 14850 { return choose false if checkOnly else -1. }
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
                        if slot <= 19934 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:737
//		EXTEND
// slot 19934
                            if slot <> 19934 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19935 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:738
//		RAND	CHAN31
// slot 19935
                                if slot <> 19935 or instruction <> 1049 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:739
//		EXTEND
// slot 19936
                                if slot <> 19936 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19938 {
                        if slot <= 19937 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:740
//		BZMF	FREEFUNC
// slot 19937
                            if slot <> 19937 or instruction <> 26153 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26153, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:741
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:742
//		CA	RCSFLAGS	# EXAMINE RCSFLAGS TO SEE IF RATE FILTER
// slot 19938
                            if slot <> 19938 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19939 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:743
//		MASK	BIT14		# HAS BEEN INITIALIZED
// slot 19939
                            if slot <> 19939 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                            if slot <= 19940 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:744
//		CCS	A		# IF SO, PROCEED WITH MANUAL RATE COMMANDS
// slot 19940
                                if slot <> 19940 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:745
//		TCF	REINIT		# .....TILT, RECYCLE TO INITIALIZE FILTER
// slot 19941
                                if slot <> 19941 or instruction <> 5468 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5468, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19946 {
                    if slot <= 19943 {
                        if slot <= 19942 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:746
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:747
//		CS	FIVE		# IF MANUAL MANEUVER IS AT HIGH RTE, SET
// slot 19942
                            if slot <> 19942 or instruction <> 18962 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:748
//		AD	RATEINDX	# ATTKALMN TO -1.
// slot 19943
                            if slot <> 19943 or instruction <> 25176 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 600).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19944 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:749
//		EXTEND			# OTHERWISE, LEAVE ATTKALMN ALONE.
// slot 19944
                            if slot <> 19944 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19945 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:750
//		BZMF	+3
// slot 19945
                                if slot <> 19945 or instruction <> 26092 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26092, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:751
//		CS	ONE
// slot 19946
                                if slot <> 19946 or instruction <> 18959 { return choose false if checkOnly else -1. }
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
                    if slot <= 19949 {
                        if slot <= 19947 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:752
//		TS	ATTKALMN
// slot 19947
                            if slot <> 19947 or instruction <> 23439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19948 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:753
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:754
//		CAF	TWO		# AUTO-HOLD MANUAL ROTATION
// slot 19948
                                if slot <> 19948 or instruction <> 14862 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:755
//SETWBODY	TS	SPNDX
// slot 19949
                                if slot <> 19949 or instruction <> 23366 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19950 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:756
//		DOUBLE
// slot 19950
                            if slot <> 19950 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19951 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:757
//		TS	DPNDX
// slot 19951
                                if slot <> 19951 or instruction <> 23367 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23367, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:758
//		INDEX	SPNDX		# RMANNDX = 0 NO ROTATION
// slot 19952
                                if slot <> 19952 or instruction <> 21318 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
                                }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
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
set agcAotRoutes[1160] to agcAotUnit1160@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:759
//		CA	RMANNDX		#	  = 1  + ROTATION
// slot 19953
    19953, 26460
)).

// bank 21, slots 19954-19958
function agcAotUnit1161 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19955 {
        if slot <= 19954 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:760
//		EXTEND			#  	  = 2  - ROTATION
// slot 19954
            if slot <> 19954 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:761
//		BZF	NORATE		# IF NO ROTATION COMMAND ON THIS AXIS,
// slot 19955
            if slot <> 19955 or instruction <> 5637 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5637, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19956 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:762
//					# GO TO NORATE.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:763
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:764
//		AD	RATEINDX	# RATEINDX = 0  0.05 DEG/SEC
// slot 19956
            if slot <> 19956 or instruction <> 25176 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 600).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19957 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:765
//		TS	Q		#          = 2  0.2  DEG/SEC
// slot 19957
                if slot <> 19957 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:766
//		INDEX	Q		#          = 4  0.5  DEG/SEC
// slot 19958
                if slot <> 19958 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1161] to agcAotUnit1161@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:767
//		CA	MANTABLE -1	#          = 6  2.0  DEG/SEC
// slot 19959
    19959, 27710
)).

// bank 21, slots 19960-19962
function agcAotUnit1162 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19960 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:768
//		EXTEND
// slot 19960
        if slot <> 19960 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19961 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:769
//		MP	BIT9		# MULTIPLY MANTABLE BY 2 TO THE -6
// slot 19961
            if slot <> 19961 or instruction <> 31239 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2567, readEffective:call(words, 2567)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:770
//		INDEX	DPNDX		# TO GET COMMANDED RATE.
// slot 19962
            if slot <> 19962 or instruction <> 21319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1162] to agcAotUnit1162@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:771
//		DXCH	WBODY		# SET WBODY TO COMMANDED RATE.
// slot 19963
    19963, 44716
)).

// bank 21, slots 19964-19970
function agcAotUnit1163 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19966 {
        if slot <= 19964 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:772
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:773
//		CA	RCSFLAGS
// slot 19964
            if slot <> 19964 or instruction <> 13121 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 833).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19965 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:774
//		MASK	OCT16000	# IS RATE DAMPING COMPLETED (BITS 13,12 AND
// slot 19965
                if slot <> 19965 or instruction <> 30239 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:775
//		EXTEND			# 11 OF RCSFLAGS ALL ZERO.)  IF SO, GO TO
// slot 19966
                if slot <> 19966 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19968 {
            if slot <= 19967 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:776
//		BZF	MERUPDAT	# MERUPDAT TO UPDATE CUMULATIVE ATTITUDE
// slot 19967
                if slot <> 19967 or instruction <> 5645 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5645, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:777
//					# ERROR.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:778
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:779
//# Page 1019
// RCS-CSM_DIGITAL_AUTOPILOT.agc:780
//ZEROER		CA	ZERO		# ZEROER ZEROS MERRORS
// slot 19968
                if slot <> 19968 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 19969 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:781
//		ZL
// slot 19969
                if slot <> 19969 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:782
//		INDEX	DPNDX
// slot 19970
                if slot <> 19970 or instruction <> 21319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1163] to agcAotUnit1163@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:783
//		DXCH	MERRORX
// slot 19971
    19971, 44740
)).

// bank 21, slots 19972-19974
function agcAotUnit1164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19972 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:784
//		TCF	SPNDXCHK
// slot 19972
        if slot <> 19972 or instruction <> 5651 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5651, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19973 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:785
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:786
//NORATE		ZL
// slot 19973
            if slot <> 19973 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:787
//		INDEX	DPNDX
// slot 19974
            if slot <> 19974 or instruction <> 21319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1164] to agcAotUnit1164@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:788
//		DXCH	WBODY		# ZERO WBODY FOR THIS AXIS
// slot 19975
    19975, 44716
)).

// bank 21, slots 19976-19981
function agcAotUnit1165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19978 {
        if slot <= 19976 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:789
//		CA	RCSFLAGS
// slot 19976
            if slot <> 19976 or instruction <> 13121 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 833).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19977 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:790
//		MASK	OCT16000
// slot 19977
                if slot <> 19977 or instruction <> 30239 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:791
//		EXTEND			# IS RATE DAMPING COMPLETED
// slot 19978
                if slot <> 19978 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19979 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:792
//		BZF	SPNDXCHK	# YES, KEEP CURRENT MERRORX GO TO SPNDXCHK
// slot 19979
            if slot <> 19979 or instruction <> 5651 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5651, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19980 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:793
//		TCF	ZEROER		# NO,GO TO ZEROER
// slot 19980
                if slot <> 19980 or instruction <> 5632 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5632, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:794
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:795
//MERUPDAT	INDEX	Q		# MERRORX=MERRORX+MEASURED CHANGE IN ANGLE
// slot 19981
                if slot <> 19981 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1165] to agcAotUnit1165@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:796
//		CS	MANTABLE -1	# -COMMANDED CHANGE IN ANGLE
// slot 19982
    19982, 35902
)).

// bank 21, slots 19983-19985
function agcAotUnit1166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19983 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:797
//		EXTEND			# THE ADDITION OF MEASURED CHANGE IN ANGLE
// slot 19983
        if slot <> 19983 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19984 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:798
//		MP	BIT7		# HAS ALREADY BEEN DONE IN THE RATE FILTER
// slot 19984
            if slot <> 19984 or instruction <> 31241 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:799
//		INDEX	DPNDX		# COMMANDED CHANGE IN ANGLE = WBODY TIMES
// slot 19985
            if slot <> 19985 or instruction <> 21319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1166] to agcAotUnit1166@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:800
//		DAS	MERRORX		# .1SEC = MANTABLE ENTRY TIMES 2 TO THE -8
// slot 19986
    19986, 18116
)).

// bank 21, slots 19987-19987
function agcAotUnit1167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:801
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:802
//SPNDXCHK	INDEX	DPNDX
// slot 19987
    if slot <> 19987 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1167] to agcAotUnit1167@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:803
//		CA	MERRORX
// slot 19988
    19988, 26306
)).

// bank 21, slots 19989-19989
function agcAotUnit1168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:804
//		INDEX	SPNDX
// slot 19989
    if slot <> 19989 or instruction <> 21318 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1168] to agcAotUnit1168@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:805
//		TS	ERRORX		# ERRORX = HIGH ORDER WORD OF MERRORX
// slot 19990
    19990, 46830
)).

// bank 21, slots 19991-19993
function agcAotUnit1169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19991 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:806
//		CCS	SPNDX
// slot 19991
        if slot <> 19991 or instruction <> 4934 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 838).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19992 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:807
//		TCF	SETWBODY
// slot 19992
            if slot <> 19992 or instruction <> 5613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5613, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:808
//		TCF	JETS
// slot 19993
            if slot <> 19993 or instruction <> 5921 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5921, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1169] to agcAotUnit1169@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:809
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:810
//OCT01760	OCT	01760		# FORCED FIRING BITS MASK
// slot 19994
    19994, 2016,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:811
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:812
//OCT01400	OCT	01400		# ROLL FORCED FIRING MASK	ORDER OF
// slot 19995
    19995, 1536,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:813
//OCT00060	OCT	00060		# PITCH FORCED FIRING MASK	DEFINITION
// slot 19996
    19996, 96,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:814
//OCT00300	OCT	00300		# YAW FORCED FIRING MASK	MUST BE
// slot 19997
    19997, 384,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:815
//					#				PRESERVED
// RCS-CSM_DIGITAL_AUTOPILOT.agc:816
//					#			      FOR INDEXING
// RCS-CSM_DIGITAL_AUTOPILOT.agc:817
//MANROT		OCT	77
// slot 19998
    19998, 126,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:818
//OCT16000	OCT	16000		# RATE DAMPING FLAGS MASK
// slot 19999
    19999, 14336,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:819
//MANTABLE	DEC	.0071111
// slot 20000
    20000, 234,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:820
//		DEC	-.0071111
// slot 20001
    20001, 65300,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:821
//		DEC	.028444
// slot 20002
    20002, 932,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:822
//		DEC	-0.028444
// slot 20003
    20003, 64602,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:823
//		DEC	.071111
// slot 20004
    20004, 2330,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:824
//		DEC	-.071111
// slot 20005
    20005, 63204,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:825
//		DEC	.284444
// slot 20006
    20006, 9320,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:826
//		DEC	-.284444
// slot 20007
    20007, 56214,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:827
//=+14MS		DEC	23
// slot 20008
    20008, 46
)).

// bank 21, slots 20009-20009
function agcAotUnit1170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS-CSM_DIGITAL_AUTOPILOT.agc:828
//FREEFUNC	INDEX	RMANNDX		# ACCELERATION
// slot 20009
    if slot <> 20009 or instruction <> 21422 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21422, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21422, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1170] to agcAotUnit1170@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:829
//# Page 1020
// RCS-CSM_DIGITAL_AUTOPILOT.agc:830
//		CA	FREETAU		# COMMANDS
// slot 20010
    20010, 27750
)).

// bank 21, slots 20011-20012
function agcAotUnit1171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20011 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:831
//		TS	TAU
// slot 20011
        if slot <> 20011 or instruction <> 23409 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23409, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:832
//		INDEX	PMANNDX
// slot 20012
        if slot <> 20012 or instruction <> 21423 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1171] to agcAotUnit1171@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:833
//		CA	FREETAU		# FREETAU	0 SEC
// slot 20013
    20013, 27750
)).

// bank 21, slots 20014-20015
function agcAotUnit1172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20014 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:834
//		TS	TAU1		# +1	       +0.10 SEC
// slot 20014
        if slot <> 20014 or instruction <> 23410 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23410, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:835
//		INDEX	YMANNDX		# +2	       -0.10 SEC
// slot 20015
        if slot <> 20015 or instruction <> 21424 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1172] to agcAotUnit1172@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:836
//		CA	FREETAU		# (+3)		0 SEC
// slot 20016
    20016, 27750
)).

// bank 21, slots 20017-20018
function agcAotUnit1173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20017 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:837
//		TS	TAU2
// slot 20017
        if slot <> 20017 or instruction <> 23411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23411, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:838
//		TCF	T6PROGM
// slot 20018
        if slot <> 20018 or instruction <> 5687 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5687, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1173] to agcAotUnit1173@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:839
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:840
//FREETAU		DEC	0
// slot 20019
    20019, 0,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:841
//		DEC	480
// slot 20020
    20020, 960,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:842
//		DEC	-480
// slot 20021
    20021, 64574,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:843
//		DEC	0
// slot 20022
    20022, 0
)).

// bank 21, slots 20023-20027
function agcAotUnit1174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20024 {
        if slot <= 20023 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:844
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:845
//T6PROGM		CAF	ZERO		# FOR MANUAL ROTATIONS
// slot 20023
            if slot <> 20023 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:846
//		TS	ERRORX
// slot 20024
            if slot <> 20024 or instruction <> 23415 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23415, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20025 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:847
//		TS	ERRORY
// slot 20025
            if slot <> 20025 or instruction <> 23416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20026 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:848
//		TS	ERRORZ
// slot 20026
                if slot <> 20026 or instruction <> 23417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:849
//		TCF	T6PROG
// slot 20027
                if slot <> 20027 or instruction <> 6127 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6127, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1174] to agcAotUnit1174@.

agcAotInstallSourceRope(list(
// RCS-CSM_DIGITAL_AUTOPILOT.agc:850
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:851
//# Page 1021
// RCS-CSM_DIGITAL_AUTOPILOT.agc:852
//		DEC	.2112		# FILTER GAIN FOR TRANSLATION, LEM ON
// slot 20028
    20028, 6920,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:853
//		DEC	.8400		# FILTER GAIN FOR TRANSLATION 2(ZETA)WN DT
// slot 20029
    20029, 27526,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:854
//		DEC	.2112		# FILTER GAIN FOR 2 DEGREES/SEC MANEUVERS
// slot 20030
    20030, 6920,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:855
//GAIN1		DEC	.0640		# KALMAN FILTER GAINS FOR INITIALIZATION
// slot 20031
    20031, 2098,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:856
//		DEC	.3180		# OF ATTITUDE RATES
// slot 20032
    20032, 10420,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:857
//		DEC	.3452
// slot 20033
    20033, 11312,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:858
//		DEC	.3774
// slot 20034
    20034, 12366,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:859
//		DEC	.4161
// slot 20035
    20035, 13634,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:860
//		DEC	.4634
// slot 20036
    20036, 15184,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:861
//		DEC	.5223
// slot 20037
    20037, 17114,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:862
//		DEC	.5970
// slot 20038
    20038, 19562,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:863
//		DEC	.6933
// slot 20039
    20039, 22718,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:864
//		DEC	.8151
// slot 20040
    20040, 26710,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:865
//		DEC	.9342
// slot 20041
    20041, 30612,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:866
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:867
//		DEC	.0174		# FILTER GAIN FOR TRANSLATION, LEM ON
// slot 20042
    20042, 570,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:868
//		DEC	.3600		# FILTER GAIN FOR TRANSLATION (WN)(WN)DT
// slot 20043
    20043, 11796,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:869
//		DEC	.0174		# FILTER GAIN FOR 2 DEGREES/SEC MANEUVERS
// slot 20044
    20044, 570,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:870
//GAIN2		DEC	.0016		# SCALED 10
// slot 20045
    20045, 52,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:871
//		DEC	.0454
// slot 20046
    20046, 1488,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:872
//		DEC	.0545
// slot 20047
    20047, 1786,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:873
//		DEC	.0666
// slot 20048
    20048, 2182,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:874
//		DEC	.0832
// slot 20049
    20049, 2726,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:875
//		DEC	.1069
// slot 20050
    20050, 3502,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:876
//		DEC	.1422
// slot 20051
    20051, 4660,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:877
//		DEC	.1985
// slot 20052
    20052, 6504,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:878
//		DEC	.2955
// slot 20053
    20053, 9682,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:879
//		DEC	.4817
// slot 20054
    20054, 15784,
// RCS-CSM_DIGITAL_AUTOPILOT.agc:880
//		DEC	.8683
// slot 20055
    20055, 28452
)).

// bank 21, slots 20056-20135
function agcAotUnit1175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20095 {
        if slot <= 20075 {
            if slot <= 20065 {
                if slot <= 20060 {
                    if slot <= 20057 {
                        if slot <= 20056 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:881
//STICKCHK	TS	T5TEMP
// slot 20056
                            if slot <> 20056 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:882
//		MASK	THREE		# INDICES FOR MANUAL ROTATION
// slot 20057
                            if slot <> 20057 or instruction <> 31884 { return choose false if checkOnly else -1. }
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
                    } else {
                        if slot <= 20058 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:883
//		TS	PMANNDX
// slot 20058
                            if slot <> 20058 or instruction <> 23471 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23471, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20059 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:884
//		CA	T5TEMP
// slot 20059
                                if slot <> 20059 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:885
//		EXTEND			# MAN RATE  0  0 RATE (DP)
// slot 20060
                                if slot <> 20060 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20062 {
                        if slot <= 20061 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:886
//		MP	QUARTER		# 	   +1 	+RATE (DP)
// slot 20061
                            if slot <> 20061 or instruction <> 31235 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2563, readEffective:call(words, 2563)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:887
//		TS	T5TEMP		#          +2	-RATE (DP)
// slot 20062
                            if slot <> 20062 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20063 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:888
//		MASK	THREE		#	  (+3)	0 RATE (DP)
// slot 20063
                            if slot <> 20063 or instruction <> 31884 { return choose false if checkOnly else -1. }
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
                            if slot <= 20064 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:889
//		TS	YMANNDX
// slot 20064
                                if slot <> 20064 or instruction <> 23472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23472, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:890
//		CA	T5TEMP
// slot 20065
                                if slot <> 20065 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20070 {
                    if slot <= 20067 {
                        if slot <= 20066 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:891
//		EXTEND
// slot 20066
                            if slot <> 20066 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:892
//		MP	QUARTER
// slot 20067
                            if slot <> 20067 or instruction <> 31235 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2563, readEffective:call(words, 2563)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20068 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:893
//		TS	RMANNDX
// slot 20068
                            if slot <> 20068 or instruction <> 23470 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23470, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20069 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:894
//		TC	Q
// slot 20069
                                if slot <> 20069 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:895
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:896
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:897
//KALUPDT		TS	ATTKALMN	# INITIALIZATION OF ATTITUDE RATES USING
// slot 20070
                                if slot <> 20070 or instruction <> 23439 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23439, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20072 {
                        if slot <= 20071 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:898
//					# KALMAN FILTER TAKES 1.1 SEC
// RCS-CSM_DIGITAL_AUTOPILOT.agc:899
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:900
//		CA	DELTATT		# =1SEC - 80MS
// slot 20071
                            if slot <> 20071 or instruction <> 13421 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1133), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:901
//		AD	T5TIME		# + DELAYS
// slot 20072
                            if slot <> 20072 or instruction <> 25500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 924).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20073 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:902
//# Page 1022
// RCS-CSM_DIGITAL_AUTOPILOT.agc:903
//		TS	TIME5
// slot 20073
                            if slot <> 20073 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20074 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:904
//		TCF	+3
// slot 20074
                                if slot <> 20074 or instruction <> 5741 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5741, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:905
//		CAF	DELTATT2	# SAFETY PLAY TO ASSURE
// slot 20075
                                if slot <> 20075 or instruction <> 13422 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1134), 32768).
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
            if slot <= 20085 {
                if slot <= 20080 {
                    if slot <= 20077 {
                        if slot <= 20076 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:906
//		TS	TIME5		# A T5RUPT
// slot 20076
                            if slot <> 20076 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:907
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:908
//KRESUME2	CS	ZERO		# RESET FOR PHASE1
// slot 20077
                            if slot <> 20077 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20078 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:909
//		TS	T5PHASE		# RESUME INTERRUPTED PROGRAM
// slot 20078
                            if slot <> 20078 or instruction <> 23349 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23349, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20079 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:910
//		TCF	RESUME
// slot 20079
                                if slot <> 20079 or instruction <> 6875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:911
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:912
//FDAIDSP2	CS	BIT4		# RESET FOR FDAIDSP1
// slot 20080
                                if slot <> 20080 or instruction <> 18956 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20082 {
                        if slot <= 20081 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:913
//		MASK	RCSFLAGS
// slot 20081
                            if slot <> 20081 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:914
//		TS	RCSFLAGS
// slot 20082
                            if slot <> 20082 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20083 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:915
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:916
//		CS	FLAGWRD0	# ON - DISPLAY ONE OF THE TOTAL ATTITUDE
// slot 20083
                            if slot <> 20083 or instruction <> 16444 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 60).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20084 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:917
//		MASK	BIT9		# ERRORS
// slot 20084
                                if slot <> 20084 or instruction <> 31239 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                                    if fixedOperand = 256 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:918
//		EXTEND
// slot 20085
                                if slot <> 20085 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 20090 {
                    if slot <= 20087 {
                        if slot <= 20086 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:919
//		BZF	FDAITOTL
// slot 20086
                            if slot <> 20086 or instruction <> 5757 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5757, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:920
//		EXTEND
// slot 20087
                            if slot <> 20087 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20088 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:921
//		DCS	ERRORX		# OFF -DISPLAY AUTOPILOT FOLLOWING ERROR
// slot 20088
                            if slot <> 20088 or instruction <> 17272 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 888, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20089 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:922
//		DXCH	AK
// slot 20089
                                if slot <> 20089 or instruction <> 22335 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 831, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:923
//		CS	ERRORZ
// slot 20090
                                if slot <> 20090 or instruction <> 17273 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 889).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20092 {
                        if slot <= 20091 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:924
//		TS	AK2
// slot 20091
                            if slot <> 20091 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:925
//		TCF	RESUME		# END PHASE 1
// slot 20092
                            if slot <> 20092 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20093 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:926
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:927
//FDAITOTL	CA	FLAGWRD9
// slot 20093
                            if slot <> 20093 or instruction <> 12357 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 69).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20094 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:928
//		MASK	BIT6
// slot 20094
                                if slot <> 20094 or instruction <> 31242 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                                    if fixedOperand = 32 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:929
//		EXTEND
// slot 20095
                                if slot <> 20095 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 20115 {
            if slot <= 20105 {
                if slot <= 20100 {
                    if slot <= 20097 {
                        if slot <= 20096 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:930
//		BZF	WRTN17		# IS N22ORN17 (BIT6 OF FLAGWRD9) = 0
// slot 20096
                            if slot <> 20096 or instruction <> 5795 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5795, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:931
//					# IF SO, GO TO WRTN17
// RCS-CSM_DIGITAL_AUTOPILOT.agc:932
//WRTN22		EXTEND			# OTHERWISE, CONTINUE ON TO WRTN22 AND
// slot 20097
                            if slot <> 20097 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20098 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:933
//		DCA	CTHETA		# GET SET TO COMPUTE TOTAL ATTITUDE
// slot 20098
                            if slot <> 20098 or instruction <> 12911 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 623, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20099 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:934
//		DXCH	WTEMP		# ERROR WRT N22 BY PICKING UP THE THREE
// slot 20099
                                if slot <> 20099 or instruction <> 22348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:935
//		CA	CPHI		# COMPONENTS OF N22
// slot 20100
                                if slot <> 20100 or instruction <> 12909 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 621).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20102 {
                        if slot <= 20101 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:936
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:937
//GETAKS		EXTEND			# COMPUTE TOTAL ATTITUDE ERROR FOR
// slot 20101
                            if slot <> 20101 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:938
//		MSU	CDUX		# DISPLAY ON FDAI ERROR NEEDLES
// slot 20102
                            if slot <> 20102 or instruction <> 8218 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20103 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:939
//		TS	AK
// slot 20103
                            if slot <> 20103 or instruction <> 23358 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23358, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20104 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:940
//		CA	WTEMP
// slot 20104
                                if slot <> 20104 or instruction <> 13131 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 843).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:941
//		EXTEND
// slot 20105
                                if slot <> 20105 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 20110 {
                    if slot <= 20107 {
                        if slot <= 20106 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:942
//		MSU	CDUY
// slot 20106
                            if slot <> 20106 or instruction <> 8219 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:943
//		TS	T5TEMP
// slot 20107
                            if slot <> 20107 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20108 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:944
//		EXTEND
// slot 20108
                            if slot <> 20108 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20109 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:945
//		MP	AMGB1
// slot 20109
                                if slot <> 20109 or instruction <> 29600 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 928, readEffective:call(words, 928)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:946
//		ADS	AK
// slot 20110
                                if slot <> 20110 or instruction <> 12094 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 830).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20112 {
                        if slot <= 20111 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:947
//		CA	T5TEMP
// slot 20111
                            if slot <> 20111 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:948
//		EXTEND
// slot 20112
                            if slot <> 20112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20113 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:949
//		MP	AMGB4
// slot 20113
                            if slot <> 20113 or instruction <> 29601 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 929, readEffective:call(words, 929)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20114 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:950
//# Page 1023
// RCS-CSM_DIGITAL_AUTOPILOT.agc:951
//		TS	AK1
// slot 20114
                                if slot <> 20114 or instruction <> 23359 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:952
//		CA	T5TEMP
// slot 20115
                                if slot <> 20115 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 20125 {
                if slot <= 20120 {
                    if slot <= 20117 {
                        if slot <= 20116 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:953
//		EXTEND
// slot 20116
                            if slot <> 20116 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:954
//		MP	AMGB7
// slot 20117
                            if slot <> 20117 or instruction <> 29603 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 931, readEffective:call(words, 931)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20118 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:955
//		TS	AK2
// slot 20118
                            if slot <> 20118 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20119 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:956
//		CA	WTEMP +1
// slot 20119
                                if slot <> 20119 or instruction <> 13132 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 844).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:957
//		EXTEND
// slot 20120
                                if slot <> 20120 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20122 {
                        if slot <= 20121 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:958
//		MSU	CDUZ
// slot 20121
                            if slot <> 20121 or instruction <> 8220 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:959
//		TS	T5TEMP
// slot 20122
                            if slot <> 20122 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20123 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:960
//		EXTEND
// slot 20123
                            if slot <> 20123 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20124 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:961
//		MP	AMGB5
// slot 20124
                                if slot <> 20124 or instruction <> 29602 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 930, readEffective:call(words, 930)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:962
//		ADS	AK1
// slot 20125
                                if slot <> 20125 or instruction <> 12095 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 831).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 20130 {
                    if slot <= 20127 {
                        if slot <= 20126 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:963
//		CA	T5TEMP
// slot 20126
                            if slot <> 20126 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:964
//		EXTEND
// slot 20127
                            if slot <> 20127 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20128 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:965
//		MP	AMGB8
// slot 20128
                            if slot <> 20128 or instruction <> 29604 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 932, readEffective:call(words, 932)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20129 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:966
//		ADS	AK2
// slot 20129
                                if slot <> 20129 or instruction <> 12096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 832).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:967
//		TCF	RESUME		# END PHASE1 OF RCS DAP
// slot 20130
                                if slot <> 20130 or instruction <> 6875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 20132 {
                        if slot <= 20131 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:968
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:969
//WRTN17		EXTEND			# GET SET TO COMPUTE TOTAL ASTRONAUT
// slot 20131
                            if slot <> 20131 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:970
//		DCA	CPHIX +1	# ATTITUDE ERROR WRT N17 BY PICKING UP
// slot 20132
                            if slot <> 20132 or instruction <> 13021 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 733, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20133 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:971
//		DXCH	WTEMP		# THE THREE COMPONENTS OF N17
// slot 20133
                            if slot <> 20133 or instruction <> 22348 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20134 {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:972
//		CA	CPHIX
// slot 20134
                                if slot <> 20134 or instruction <> 13019 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 731).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// RCS-CSM_DIGITAL_AUTOPILOT.agc:973
//		TCF	GETAKS
// slot 20135
                                if slot <> 20135 or instruction <> 5765 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5765, words[0], readEffective).
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
set agcAotRoutes[1175] to agcAotUnit1175@.

// no code for the lines below
// RCS-CSM_DIGITAL_AUTOPILOT.agc:974
//
// RCS-CSM_DIGITAL_AUTOPILOT.agc:975
//# Page 1024 (empty page)
