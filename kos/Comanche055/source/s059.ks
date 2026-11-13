// PORT: Original source unit RCS-CSM_DIGITAL_AUTOPILOT.agc.
// PORT: Physical bank 21. Shared continuation entries, slots 19525–19535.
function agcAotUnit1123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19529 {
        if slot <= 19526 {
            if slot <= 19525 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:2
//# Filename:	RCS-CSM_DIGITAL_AUTOPILOT.agc
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:9
//# Pages:	1002-1024
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:12
//#
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:21
//#
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:23
//#
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:26
//#
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:28
//#			Colossus 2A
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:29
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:30
//# Page 1002
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:31
//# T5 INTERRUPT PROGRAM FOR THE RCS-CSM AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:32
//# 	START OF T5 INTERRUPT PROGRAM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:33
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:34
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:35
//		BANK	20
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:36
//		SETLOC	DAPS3
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:37
//		BANK
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:38
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:39
//		COUNT	21/DAPRC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:40
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:41
//		EBANK=	KMPAC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:42
//REDORCS		LXCH	BANKRUPT	# RESTART OF AUTOPILOT COMES HERE
// PORT: Fixed ROM slots 19525.
                if slot <> 19525 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:43
//		CA	T5PHASE		# ON A T5 RUPT.
// PORT: Fixed ROM slots 19526.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:44
//		EXTEND
// PORT: Fixed ROM slots 19527.
                if slot <> 19527 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19528 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:45
//		BZMF	+2		# IF T5PHASE +0, -0, OR -, RESET TO -
// PORT: Fixed ROM slots 19528.
                    if slot <> 19528 or instruction <> 25674 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25674, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:46
//		TCF	+3		# IF T5PHASE +, LEAVE IT +.  DO A FRESHDAP
// PORT: Fixed ROM slots 19529.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:47
//		CS	ONE
// PORT: Fixed ROM slots 19530.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:48
//		TS	T5PHASE
// PORT: Fixed ROM slots 19531.
                    if slot <> 19531 or instruction <> 23349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:49
//		EXTEND
// PORT: Fixed ROM slots 19532.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:50
//		DCA	RCSLOC
// PORT: Fixed ROM slots 19533.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:51
//		DXCH	T5LOC		# HOOK UP T5RUPT TO AUTOPILOT
// PORT: Fixed ROM slots 19534.
                    if slot <> 19534 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:52
//		TCF	RCSATT +1
// PORT: Fixed ROM slots 19535.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:53
//		EBANK=	KMPAC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:54
//RCSLOC		2CADR	RCSATT
// PORT: Fixed ROM slots 19536 19537.
    19536, 2212, 19537, 34924
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19538–19564.
function agcAotUnit1124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19550 {
        if slot <= 19543 {
            if slot <= 19540 {
                if slot <= 19538 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:55
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:56
//RCSATT		LXCH	BANKRUPT	# SAVE BB
// PORT: Fixed ROM slots 19538.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:57
//		EXTEND			# SAVE Q
// PORT: Fixed ROM slots 19539.
                        if slot <> 19539 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:58
//		QXCH	QRUPT
// PORT: Fixed ROM slots 19540.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:59
//		CAF	BIT15		# BIT15 CHAN31 = 0 IF IMU POWER IS ON AND
// PORT: Fixed ROM slots 19541.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:60
//		EXTEND			# S/C CONT SW IS IN CMC (I.E. IF G/C AUTO
// PORT: Fixed ROM slots 19542.
                        if slot <> 19542 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:61
//		RAND	CHAN31		# PILOT IS FULLY ENABLED)
// PORT: Fixed ROM slots 19543.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:62
//		EXTEND
// PORT: Fixed ROM slots 19544.
                    if slot <> 19544 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19545 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:63
//		BZF	SETT5		# IF G/C AUTOPILOT IS FULLY ENABLED,
// PORT: Fixed ROM slots 19545.
                        if slot <> 19545 or instruction <> 5232 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:64
//					# GO TO SETT5
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:65
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:66
//		CS	RCSFLAGS	# IF G/C AUTOPILOT IS NOT FULLY ENABLED,
// PORT: Fixed ROM slots 19546.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:67
//		MASK	BIT14
// PORT: Fixed ROM slots 19547.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:68
//		ADS	RCSFLAGS	# SET NORATE FLAG,
// PORT: Fixed ROM slots 19548.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:69
//		CAF	POSMAX
// PORT: Fixed ROM slots 19549.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:70
//		TS	HOLDFLAG	# SET HOLDFLAG +,
// PORT: Fixed ROM slots 19550.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:71
//		CAF	ZERO		# ZERO ERRORX, ERRORY, AND ERRORZ,
// PORT: Fixed ROM slots 19551.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:72
//		TS	ERRORX
// PORT: Fixed ROM slots 19552.
                        if slot <> 19552 or instruction <> 23415 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23415, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:73
//		TS	ERRORY
// PORT: Fixed ROM slots 19553.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:74
//		TS	ERRORZ
// PORT: Fixed ROM slots 19554.
                        if slot <> 19554 or instruction <> 23417 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23417, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:75
//		CAF	BIT14
// PORT: Fixed ROM slots 19555.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:76
//		EXTEND
// PORT: Fixed ROM slots 19556.
                        if slot <> 19556 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:77
//		RAND	CHAN31		# AND CHECK FREE FUNCTION (BIT14 CHAN31).
// PORT: Fixed ROM slots 19557.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:78
//		EXTEND
// PORT: Fixed ROM slots 19558.
                    if slot <> 19558 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19559 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:79
//# Page 1003
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:80
//		BZF	SETT5		# IF IN FREE MODE, GO TO SETT5.
// PORT: Fixed ROM slots 19559.
                        if slot <> 19559 or instruction <> 5232 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5232, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:81
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:82
//		TS	T5PHASE		# IF NOT IN FREE MODE,
// PORT: Fixed ROM slots 19560.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:83
//		CAF	OCT37766	# SCHEDULE REINITIALIZATION (FRESHDAP)
// PORT: Fixed ROM slots 19561.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:84
//		TS	TIME5		# IN 100 MS VIA T5RUPT
// PORT: Fixed ROM slots 19562.
                        if slot <> 19562 or instruction <> 22552 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22552, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19563 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:85
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:86
//		TCR	ZEROJET		# ZERO JET CHANNELS IN 14 MS VIA ZEROJET
// PORT: Fixed ROM slots 19563.
                        if slot <> 19563 or instruction <> 1434 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1434, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:87
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:88
//		TCF	KMATRIX
// PORT: Fixed ROM slots 19564.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:89
//DELTATT		OCT	37770		# 80MS (TIME5)
// PORT: Fixed ROM slots 19565.
    19565, 32752,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:90
//DELTATT2	OCT	37776		# 20MS (TIME5)
// PORT: Fixed ROM slots 19566.
    19566, 32764,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:91
//ONESEK		DEC	16284		# 1 SEC(TIME5)
// PORT: Fixed ROM slots 19567.
    19567, 32568
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19568–19590.
function agcAotUnit1125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19578 {
        if slot <= 19572 {
            if slot <= 19569 {
                if slot <= 19568 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:92
//CHAN5		EQUALS	5
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:93
//CHAN6		EQUALS	6
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:94
//PRIO34A		=	PRIO34
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:95
//# 		CHECK PHASE OF T5 PROGRAM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:96
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:97
//# 	BECAUSE OF THE LENGTH OF THE T5 PROGRAM, IT HAS BEEN DIVIDED INTO
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:98
//# THREE PARTS, T5PHASE1, T5PHASE2, AND THE JET SELECTION LOGIC,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:99
//# TO ALLOW FOR THE EXECUTION OF OTHER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:100
//# INTERRUPTS.  T5PHASE IS ALSO USED IN THE INITIALIZATION OF THE AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:101
//# VARIABLES AT TURN ON.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:102
//# THE CODING OF T5PHASE IS...
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:103
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:104
//#		+ = INITIALIZE T5 RCS-CSM AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:105
//#    T5PHASE = +0 = PHASE2 OF THE T5 PROGRAM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:106
//#		- = RESTART DAP
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:107
//#	       -0 = PHASE1 OF THE T5 PROGRAM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:108
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:109
//SETT5		CCS	T5PHASE
// PORT: Fixed ROM slots 19568.
                    if slot <> 19568 or instruction <> 4917 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 821).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:110
//		TCF	FRESHDAP	# TURN ON AUTOPILOT
// PORT: Fixed ROM slots 19569.
                    if slot <> 19569 or instruction <> 5476 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5476, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19570 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:111
//		TCF	T5PHASE2	# BRANCH TO PHASE2 OF PROGRAM
// PORT: Fixed ROM slots 19570.
                    if slot <> 19570 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19571 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:112
//		TCF	REDAP		# RESTART AUTOPILOT
// PORT: Fixed ROM slots 19571.
                        if slot <> 19571 or instruction <> 5478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5478, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:113
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:114
//		TS	T5PHASE		# PHASE 1 RESET FOR PHASE 2
// PORT: Fixed ROM slots 19572.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:115
//		CA	TIME5
// PORT: Fixed ROM slots 19573.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:116
//		TS	T5TIME		# USED IN COMPENSATING FOR DELAYS IN T5
// PORT: Fixed ROM slots 19574.
                        if slot <> 19574 or instruction <> 23452 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23452, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:117
//		CAF	DELTATT2	# RESET FOR T5RUPT IN 20MS FOR PHASE2
// PORT: Fixed ROM slots 19575.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:118
//		TS	TIME5		# OF PROGRAM
// PORT: Fixed ROM slots 19576.
                    if slot <> 19576 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19577 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:119
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:120
//# Page 1004
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:121
//# IMU STATUS CHECK
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:122
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:123
//		CS	IMODES33	# CHECK IMU STATUS
// PORT: Fixed ROM slots 19577.
                        if slot <> 19577 or instruction <> 17105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 721).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:124
//		MASK	BIT6		# BIT6 = 0  IMU OK
// PORT: Fixed ROM slots 19578.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:125
//		CCS	A		# BIT6 = 1 NO IMU
// PORT: Fixed ROM slots 19579.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:126
//		TCF	RATEFILT
// PORT: Fixed ROM slots 19580.
                        if slot <> 19580 or instruction <> 5256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5256, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:127
//FREECHK		CS	RCSFLAGS	# BIT14 INDICATES THAT RATES HAVE NOT BEEN
// PORT: Fixed ROM slots 19581.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:128
//		MASK	BIT14		# INITIALIZED
// PORT: Fixed ROM slots 19582.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:129
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 19583.
                        if slot <> 19583 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:130
//		CAF	BIT14		# NO ATTITUDE REFERENCE
// PORT: Fixed ROM slots 19584.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:131
//		TS	HOLDFLAG	# STOP ANY AUTOMATIC STEERING AND PREPARE
// PORT: Fixed ROM slots 19585.
                    if slot <> 19585 or instruction <> 23258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23258, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19586 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:132
//					# TO PICK UP CDU ANGLES UPON RESUMPTION OF
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:133
//					# ATTITUDE HOLD
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:134
//		EXTEND
// PORT: Fixed ROM slots 19586.
                        if slot <> 19586 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:135
//		RAND	CHAN31		# CHECK FOR FREE MODE
// PORT: Fixed ROM slots 19587.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:136
//		EXTEND
// PORT: Fixed ROM slots 19588.
                    if slot <> 19588 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19589 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:137
//		BZF	KRESUME1	# IN FREE MODE PROVIDE FREE CONTROL ONLY
// PORT: Fixed ROM slots 19589.
                        if slot <> 19589 or instruction <> 5391 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5391, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:138
//		TCF	REINIT		# .....TILT...............................
// PORT: Fixed ROM slots 19590.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:139
//BITS4,5		OCT	30
// PORT: Fixed ROM slots 19591.
    19591, 48
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19592–19601.
function agcAotUnit1126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19596 {
        if slot <= 19593 {
            if slot <= 19592 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:140
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:141
//RATEFILT	CA	RCSFLAGS	# SEE IF RATEFILTER HAS BEEN INITIALIZED
// PORT: Fixed ROM slots 19592.
                if slot <> 19592 or instruction <> 13121 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 833).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:142
//		MASK	BIT14
// PORT: Fixed ROM slots 19593.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:143
//		EXTEND			# IF SO, PROCEED WITH RATE DERIVATION
// PORT: Fixed ROM slots 19594.
                if slot <> 19594 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19595 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:144
//		BZF	+2
// PORT: Fixed ROM slots 19595.
                    if slot <> 19595 or instruction <> 5261 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5261, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:145
//		TCF	KMATRIX		# IF NOT, SKIP RATE DERIVATION
// PORT: Fixed ROM slots 19596.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:146
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:147
//# 	RATE FILTER	TIMING = 7.72 MS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:148
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:149
//# RATE FILTER EQUATIONS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:150
//# DRHO = DELRHO - (.1)ADOT + (1 = GAIN1)DRHO
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:151
//#					    -1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:152
//# ADOT = ADOT   + GAIN2 DRHO + KMJ DFT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:153
//#	     -1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:154
//#	-        *     -     -
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:155
//# WHERE DELRHO = AMGB (CDU - CDU  )
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:156
//#			 	-1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:157
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:158
//		CAF	TWO
// PORT: Fixed ROM slots 19597.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:159
//DRHOLOOP	TS	SPNDX
// PORT: Fixed ROM slots 19598.
                if slot <> 19598 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19599 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:160
//		DOUBLE
// PORT: Fixed ROM slots 19599.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:161
//		TS	DPNDX
// PORT: Fixed ROM slots 19600.
                    if slot <> 19600 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:162
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19601.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:163
//		CS	DRHO		# DRHO SCALED 180 DEGS
// PORT: Fixed ROM slots 19602.
    19602, 34516
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19603–19604.
function agcAotUnit1127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19603 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:164
//		EXTEND
// PORT: Fixed ROM slots 19603.
        if slot <> 19603 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:165
//		INDEX	ATTKALMN	# PICK UP DESIRED FILTER GAIN
// PORT: Fixed ROM slots 19604.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:166
//		MP	GAIN1
// PORT: Fixed ROM slots 19605.
    19605, 60542
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19606–19606.
function agcAotUnit1128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:167
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19606.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:168
//		DAS	DRHO		# (1 -.064)DRHO
// PORT: Fixed ROM slots 19607.
    19607, 18134
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19608–19609.
function agcAotUnit1129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19608 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:169
//		EXTEND
// PORT: Fixed ROM slots 19608.
        if slot <> 19608 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:170
//# Page 1005
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:171
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19609.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:172
//		DCS	ADOT
// PORT: Fixed ROM slots 19610.
    19610, 34488
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19611–19615.
function agcAotUnit1130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19612 {
        if slot <= 19611 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:173
//		DXCH	KMPAC		# -(.1)ADOT
// PORT: Fixed ROM slots 19611.
            if slot <> 19611 or instruction <> 22345 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:174
//		CA	QUARTER
// PORT: Fixed ROM slots 19612.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:175
//		TC	SMALLMP
// PORT: Fixed ROM slots 19613.
            if slot <> 19613 or instruction <> 1058 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1058, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19614 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:176
//		DXCH	KMPAC
// PORT: Fixed ROM slots 19614.
                if slot <> 19614 or instruction <> 22345 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:177
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19615.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:178
//		DAS	DRHO
// PORT: Fixed ROM slots 19616.
    19616, 18134
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19617–19661.
function agcAotUnit1131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19638 {
        if slot <= 19627 {
            if slot <= 19621 {
                if slot <= 19618 {
                    if slot <= 19617 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:179
//		CCS	SPNDX
// PORT: Fixed ROM slots 19617.
                        if slot <> 19617 or instruction <> 4934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 838).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:180
//		TCF	DRHOLOOP
// PORT: Fixed ROM slots 19618.
                        if slot <> 19618 or instruction <> 5262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5262, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19619 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:181
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:182
//		CA	CDUX		# MEASURED BODY RATES--
// PORT: Fixed ROM slots 19619.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:183
//		XCH	RHO
// PORT: Fixed ROM slots 19620.
                            if slot <> 19620 or instruction <> 24477 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 925, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:184
//		EXTEND
// PORT: Fixed ROM slots 19621.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:185
//		MSU	RHO		# -        *     -     -
// PORT: Fixed ROM slots 19622.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:186
//		COM			# DELRHO = AMGB (CDU - CDU  )
// PORT: Fixed ROM slots 19623.
                            if slot <> 19623 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:187
//					#			  -1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:188
//		ZL
// PORT: Fixed ROM slots 19624.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:189
//		DXCH	DELTEMPX
// PORT: Fixed ROM slots 19625.
                        if slot <> 19625 or instruction <> 22350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 846, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19626 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:190
//		CA	CDUY
// PORT: Fixed ROM slots 19626.
                            if slot <> 19626 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:191
//		XCH	RHO1
// PORT: Fixed ROM slots 19627.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:192
//		EXTEND
// PORT: Fixed ROM slots 19628.
                        if slot <> 19628 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:193
//		MSU	RHO1
// PORT: Fixed ROM slots 19629.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:194
//		COM
// PORT: Fixed ROM slots 19630.
                        if slot <> 19630 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19631 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:195
//		TS	T5TEMP		# (CDUY - RHO1)	   SCALED 90 DEGS
// PORT: Fixed ROM slots 19631.
                            if slot <> 19631 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:196
//		EXTEND
// PORT: Fixed ROM slots 19632.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:197
//		MP	AMGB1
// PORT: Fixed ROM slots 19633.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:198
//		DAS	DELTEMPX	# DELTEMPX = (CDUX-RHO) + AMGB1(CDUY-RHO1)
// PORT: Fixed ROM slots 19634.
                            if slot <> 19634 or instruction <> 9038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 846) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:199
//					# MUST BE DOUBLE PRECISION OR WILL LOSE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:200
//					# PULSES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:201
//		CA	AMGB4
// PORT: Fixed ROM slots 19635.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:202
//		EXTEND
// PORT: Fixed ROM slots 19636.
                        if slot <> 19636 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19637 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:203
//		MP	T5TEMP
// PORT: Fixed ROM slots 19637.
                            if slot <> 19637 or instruction <> 29506 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 834, readEffective:call(words, 834)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:204
//		DXCH	DELTEMPY
// PORT: Fixed ROM slots 19638.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:205
//		CA	AMGB7
// PORT: Fixed ROM slots 19639.
                        if slot <> 19639 or instruction <> 13219 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:206
//		EXTEND
// PORT: Fixed ROM slots 19640.
                        if slot <> 19640 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19641 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:207
//		MP	T5TEMP
// PORT: Fixed ROM slots 19641.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:208
//		DXCH	DELTEMPZ
// PORT: Fixed ROM slots 19642.
                            if slot <> 19642 or instruction <> 22354 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 850, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:209
//		CA	CDUZ
// PORT: Fixed ROM slots 19643.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:210
//		XCH	RHO2
// PORT: Fixed ROM slots 19644.
                        if slot <> 19644 or instruction <> 24479 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 927, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19645 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:211
//		EXTEND
// PORT: Fixed ROM slots 19645.
                            if slot <> 19645 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:212
//		MSU	RHO2
// PORT: Fixed ROM slots 19646.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:213
//		COM
// PORT: Fixed ROM slots 19647.
                        if slot <> 19647 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19648 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:214
//		TS	T5TEMP		# (CDUZ - RHO2)    SCALED 90 DEGS
// PORT: Fixed ROM slots 19648.
                            if slot <> 19648 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:215
//		EXTEND
// PORT: Fixed ROM slots 19649.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:216
//		MP	AMGB5
// PORT: Fixed ROM slots 19650.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:217
//		DAS	DELTEMPY	# DELTEMPY =AMGB4(CDUY-RHO1)
// PORT: Fixed ROM slots 19651.
                            if slot <> 19651 or instruction <> 9040 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 848) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:218
//					#		  + AMGB5(CDUZ-RHO2)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:219
//		CA	AMGB8
// PORT: Fixed ROM slots 19652.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:220
//		EXTEND
// PORT: Fixed ROM slots 19653.
                        if slot <> 19653 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19654 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:221
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:222
//# Page 1006
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:223
//		MP	T5TEMP
// PORT: Fixed ROM slots 19654.
                            if slot <> 19654 or instruction <> 29506 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 834, readEffective:call(words, 834)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:224
//		DAS	DELTEMPZ	# DELTEMPZ = AMBG7(CDUY-RHO1)
// PORT: Fixed ROM slots 19655.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:225
//					#		  + AMGB8(CDUZ-RHO2)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:226
//		CAF	TWO
// PORT: Fixed ROM slots 19656.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:227
//ADOTLOOP	TS	SPNDX
// PORT: Fixed ROM slots 19657.
                            if slot <> 19657 or instruction <> 23366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:228
//		DOUBLE
// PORT: Fixed ROM slots 19658.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:229
//		TS	DPNDX
// PORT: Fixed ROM slots 19659.
                        if slot <> 19659 or instruction <> 23367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23367, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19660 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:230
//		EXTEND
// PORT: Fixed ROM slots 19660.
                            if slot <> 19660 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:231
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19661.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:232
//		DCA	DELTEMPX
// PORT: Fixed ROM slots 19662.
    19662, 26268
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19663–19663.
function agcAotUnit1132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:233
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19663.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:234
//		DAS	DRHO
// PORT: Fixed ROM slots 19664.
    19664, 18134
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19665–19665.
function agcAotUnit1133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:235
//		EXTEND
// PORT: Fixed ROM slots 19665.
    if slot <> 19665 or instruction <> 6 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1133] to agcAotUnit1133@.

// PORT: Physical bank 21. Shared continuation entries, slots 19666–19666.
function agcAotUnit1134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:236
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19666.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:237
//		DCA	DELTEMPX
// PORT: Fixed ROM slots 19667.
    19667, 26268
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19668–19668.
function agcAotUnit1135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:238
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19668.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:239
//		DAS	MERRORX
// PORT: Fixed ROM slots 19669.
    19669, 18116
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19670–19670.
function agcAotUnit1136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:240
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19670.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:241
//		CA	DRHO
// PORT: Fixed ROM slots 19671.
    19671, 26324
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19672–19675.
function agcAotUnit1137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19673 {
        if slot <= 19672 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:242
//		DOUBLE			# N.B.
// PORT: Fixed ROM slots 19672.
            if slot <> 19672 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:243
//		DOUBLE			# N.B.
// PORT: Fixed ROM slots 19673.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:244
//		EXTEND
// PORT: Fixed ROM slots 19674.
            if slot <> 19674 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:245
//		INDEX	ATTKALMN	# PICK UP DESIRED FILTER GAINS
// PORT: Fixed ROM slots 19675.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:246
//		MP	GAIN2
// PORT: Fixed ROM slots 19676.
    19676, 60570
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19677–19677.
function agcAotUnit1138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:247
//		INDEX	DPNDX		# ADOT   + (.16)(.1)DRHO
// PORT: Fixed ROM slots 19677.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:248
//		DAS	ADOT		#     -1
// PORT: Fixed ROM slots 19678.
    19678, 18104
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19679–19679.
function agcAotUnit1139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:249
//		INDEX	SPNDX		# S/C TORQUE TO INERTIA RATIO
// PORT: Fixed ROM slots 19679.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:250
//		CA	KMJ		# SCALED (450)(1600)/(57.3)(16384)=1/1.3
// PORT: Fixed ROM slots 19680.
    19680, 26400
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19681–19682.
function agcAotUnit1140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19681 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:251
//		EXTEND
// PORT: Fixed ROM slots 19681.
        if slot <> 19681 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:252
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19682.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:253
//		MP	DFT
// PORT: Fixed ROM slots 19683.
    19683, 59086
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19684–19684.
function agcAotUnit1141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:254
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19684.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:255
//		DAS	ADOT		# KMJ(DFT)
// PORT: Fixed ROM slots 19685.
    19685, 18104
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19686–19693.
function agcAotUnit1142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19689 {
        if slot <= 19687 {
            if slot <= 19686 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:256
//		CCS	SPNDX
// PORT: Fixed ROM slots 19686.
                if slot <> 19686 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:257
//		TCF	ADOTLOOP	# END CALCULATION OF VEHICLE RATES
// PORT: Fixed ROM slots 19687.
                if slot <> 19687 or instruction <> 5321 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5321, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19688 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:258
//KMATRIX		CA	ATTSEC
// PORT: Fixed ROM slots 19688.
                if slot <> 19688 or instruction <> 13168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 880).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:259
//		MASK	LOW4
// PORT: Fixed ROM slots 19689.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:260
//		CCS	A
// PORT: Fixed ROM slots 19690.
                if slot <> 19690 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:261
//		TCF	TENTHSEK
// PORT: Fixed ROM slots 19691.
                if slot <> 19691 or instruction <> 5361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5361, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19692 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:262
//		CAF	PRIO34		# CALL FOR 1 SEC UPDATE OF TRANSFORMATION
// PORT: Fixed ROM slots 19692.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:263
//		TC	NOVAC		# MATRIX FROM GIMBAL AXES TO BODY AXES
// PORT: Fixed ROM slots 19693.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:264
//		EBANK=	KMPAC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:265
//		2CADR	AMBGUPDT
// PORT: Fixed ROM slots 19694 19695.
    19694, 3662, 19695, 36972
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19696–19706.
function agcAotUnit1143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19700 {
        if slot <= 19697 {
            if slot <= 19696 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:266
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:267
//		CAF	NINE
// PORT: Fixed ROM slots 19696.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:268
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:269
//TENTHSEK	TS	ATTSEC
// PORT: Fixed ROM slots 19697.
                if slot <> 19697 or instruction <> 23408 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23408, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19698 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:270
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:271
//# Page 1007
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:272
//# WHEN AUTOMATIC MANEUVERS ARE BEING PERFORMED, THE FOLLOWING ANGLE ADDITION MUST BE MADE TO PROVIDE A SMOOTH
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:273
//# SEQUENCE OF ANGULAR COMMANDS TO THE AUTOPILOT--
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:274
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:275
//#	CDUXD = CDUXD + DELCDUX		(DOUBLE PRECISION)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:276
//#	CDUYD = CDUYD + DELCDUY		(DOUBLE PRECISION)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:277
//#	CDUZD = CDUZD + DELCDUZ		(DOUBLE PRECISION)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:278
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:279
//# THE STEERING PROGRAMS-
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:280
//#	1) ATTITUDE MANEUVER ROUTINE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:281
//#	2) LEM TRACKING
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:282
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:283
//# SHOULD GENERATE THE DESIRED ANGLES (CDUXD, CDUYD, CDUZD) AS WELL AS THE INCREMENTAL ANGLES (DELCDUX, DELCDUY,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:284
//# DELCDUZ) SO THAT THE GIMBAL ANGLE COMMANDS CAN BE INTERPOLATED BETWEEN UPDATES.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:285
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:286
//# HOLDFLAG CODING-
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:287
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:288
//#	+ = GRAB PRESENT CDU ANGLES AND STORE IN THETADX, THETADY, THETADZ
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:289
//#	    AND PERFORM ATTITUDE HOLD ABOUT THESE ANGLES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:290
//#	    ALSO IGNORE AUTOMATIC STEERING
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:291
//#	    SET = + BY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:292
//#		1) INITIALIZATION PHASE OF AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:293
//#		2) OCCURANCE OF RHC COMMANDS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:294
//#		3) FREE MODE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:295
//#		4) SWITCH OVER TO ATTITUDE HOLD FROM AUTO
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:296
//#		   WHILE DOING AUTOMATIC STEERING (IN THIS CASE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:297
//#		   HOLDFLAG IS NOT ACTUALLY SET TO +, BUT THE LOGIC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:298
//#		   FUNCTIONS AS IF IT WERE.)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:299
//#		5) S/C CONTROL SWITCH IS SCS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:300
//#		6) IMU POWER OFF
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:301
//#      +0 = IN ATTITUDE HOLD ABOUT A PREVIOUSLY ESTABLISHED REFERENCE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:302
//#	- = PERFORMING AUTOMATIC MANEUVER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:303
//#      -0 = NOT USED AT PRESENT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:304
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:305
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:306
//# 	NOTE THAT THIS FLAG MUST BE SET = - BY THE STEERING PROGRAM IF IT IS TO COMMAND THE AUTOPILOT.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:307
//# SINCE ASTRONAUT ACTION MAY CHANGE THE HOLDFLAG SETTING, IT SHOULD BE MONITORED BY THE STEERING PROGRAM TO
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:308
//# DETERMINE IF THE AUTOMATIC SEQUENCE HAS BEEN INTERRUPTED AND IF SO, TAKE THE APPROPRIATE ACTION.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:309
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:310
//		CS	HOLDFLAG
// PORT: Fixed ROM slots 19698.
                if slot <> 19698 or instruction <> 17114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 730).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19699 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:311
//		EXTEND
// PORT: Fixed ROM slots 19699.
                    if slot <> 19699 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:312
//		BZMF	DACNDLS		# IF HOLDFLAG +0,-0,+, BYPASS AUTOMATIC
// PORT: Fixed ROM slots 19700.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:313
//					# COMMANDS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:314
//DCDUINCR	CAF	TWO
// PORT: Fixed ROM slots 19701.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:315
//DELOOP		TS	SPNDX
// PORT: Fixed ROM slots 19702.
                    if slot <> 19702 or instruction <> 23366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:316
//		DOUBLE
// PORT: Fixed ROM slots 19703.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:317
//		TS	DPNDX
// PORT: Fixed ROM slots 19704.
                if slot <> 19704 or instruction <> 23367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23367, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19705 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:318
//		EXTEND
// PORT: Fixed ROM slots 19705.
                    if slot <> 19705 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:319
//		INDEX	A
// PORT: Fixed ROM slots 19706.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:320
//		DCA	CDUXD
// PORT: Fixed ROM slots 19707.
    19707, 26446
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19708–19710.
function agcAotUnit1144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19708 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:321
//# Page 1008
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:322
//		DXCH	KMPAC
// PORT: Fixed ROM slots 19708.
        if slot <> 19708 or instruction <> 22345 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 841, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19709 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:323
//		EXTEND
// PORT: Fixed ROM slots 19709.
            if slot <> 19709 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:324
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19710.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:325
//		DCA	DELCDUX
// PORT: Fixed ROM slots 19711.
    19711, 26364
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19712–19715.
function agcAotUnit1145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19713 {
        if slot <= 19712 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:326
//		TC	DPADD
// PORT: Fixed ROM slots 19712.
            if slot <> 19712 or instruction <> 1068 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1068, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:327
//		EXTEND
// PORT: Fixed ROM slots 19713.
            if slot <> 19713 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19714 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:328
//		DCA	KMPAC
// PORT: Fixed ROM slots 19714.
            if slot <> 19714 or instruction <> 13129 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 841, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:329
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19715.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:330
//		TS	THETADX
// PORT: Fixed ROM slots 19716.
    19716, 46836
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19717–19717.
function agcAotUnit1146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:331
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19717.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:332
//		DXCH	CDUXD
// PORT: Fixed ROM slots 19718.
    19718, 44878
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19719–19778.
function agcAotUnit1147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19748 {
        if slot <= 19733 {
            if slot <= 19725 {
                if slot <= 19721 {
                    if slot <= 19719 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:333
//		CCS	SPNDX
// PORT: Fixed ROM slots 19719.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:334
//		TCF	DELOOP
// PORT: Fixed ROM slots 19720.
                            if slot <> 19720 or instruction <> 5366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:335
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:336
//# Page 1009
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:337
//# RCS-CSM AUTOPILOT ATTITUDE ERROR DISPLAY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:338
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:339
//# THREE TYPES OF ATTITUDE ERRORS MAY BE DISPLAYED ON THE FDAI-
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:340
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:341
//#	MODE 1)	AUTOPILOT FOLLOWING ERRORS		SELECTED BY V61E
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:342
//#		GENERATED INTERNALLY BY THE AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:343
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:344
//#	MODE 2)	TOTAL ATTITUDE ERRORS			SELECTED BY V62E
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:345
//#		WITH RESPECT TO THE CONTENTS OF N22
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:346
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:347
//#	MODE 3)	TOTAL ASTRONAUT ATTITUDE ERRORS		SELECTED BY V63E
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:348
//#		WITH RESPECT TO THE CONTENTS OF N17
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:349
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:350
//# MODE 1 IS PROVIDED AS A MONITOR OF THE RCS DAP AND ITS ABILITY TO TRACK AUTOMATIC STEERING COMMANDS.  IN THIS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:351
//# MODE THE ATTITUDE ERRORS WILL BE ZEROED WHEN THE CMC MODE SWITCH IS IN FREE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:352
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:353
//# MODE 2 IS PROVIDED TO ASSIST THE CREW IN MANUALLY MANEUVERING THE S/C TO THE ATTITUDE (GIMBAL ANGLES) SPECIFIED
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:354
//# IN N22.  THE ATTITUDE ERRORS WRT THESE ANGLES AND THE CURRENT CDU ANGLES ARE RESOLVED INTO S/C CONTROL AXES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:355
//# AS A FLY-TO INDICATOR.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:356
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:357
//# MODE 3 IS PROVIDED TO ASSIST THE CREW IN MANUALLY MANEUVERING THE S/C TO THE ATTITUDE (GIMBAL ANGLES) SPECIFIED
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:358
//# IN N17.  THE ATTITUDE ERRORS WRT THESE ANGLES AND THE CURRENT CDU ANGLES ARE RESOLVED INTO S/C CONTROL AXES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:359
//# AS A FLY-TO INDICATOR.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:360
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:361
//# 	V60 IS PROVIDED TO LOAD N17 WITH A SNAPSHOT OF THE CURRENT CDU ANGLES, THUS SYNCHRONIZING THE MODE 3 DISPLAY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:362
//# WITH THE CURRENT S/C ATTITUDE.  THIS VERB MAY BE USED AT ANY TIME.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:363
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:364
//# 	THESE DISPLAYS WILL BE AVAILABLE IN ANY MODE (AUTO, HOLD, FREE, G+N, OR SCS) ONCE THE RCS DAP HAS BEEN
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:365
//# INITIATED VIA V46E.  MODE 1, HOWEVER, WILL BE MEANINGFUL ONLY IN G+N AUTO OR HOLD.  THE CREW MAY PRESET (VIA
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:366
//# V25N17) AN ATTITUDE REFERENCE (DESIRED GIMBAL ANGLES) INTO N17 AT ANY TIME.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:367
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:368
//DACNDLS		CS	RCSFLAGS	# ALTERNATE BETWEEN FDAIDSP1 AND FDAIDSP2
// PORT: Fixed ROM slots 19721.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:369
//		MASK	BIT4
// PORT: Fixed ROM slots 19722.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:370
//		EXTEND
// PORT: Fixed ROM slots 19723.
                            if slot <> 19723 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19724 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:371
//		BZF	FDAIDSP2
// PORT: Fixed ROM slots 19724.
                            if slot <> 19724 or instruction <> 5744 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5744, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:372
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:373
//FDAIDSP1	ADS	RCSFLAGS
// PORT: Fixed ROM slots 19725.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:374
//		TC	NEEDLER
// PORT: Fixed ROM slots 19726.
                            if slot <> 19726 or instruction <> 1296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1296, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:375
//KRESUME1	TCF	RESUME		# END PHASE 1
// PORT: Fixed ROM slots 19727.
                            if slot <> 19727 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19728 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:376
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:377
//# Page 1010
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:378
//# FDAI ATTITUDE ERROR DISPLAY SUBROUTINE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:379
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:380
//# PROGRAM DESCRIPTION:	D. KEENE  5/24/67
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:381
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:382
//# 	THIS SUBROUTINE IS USED TO DISPLAY ATTITUDE ERRORS ON THE FDAI VIA THE DIGITAL TO ANALOG CONVERTERS (DACS)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:383
//# IN THE CDUS.  CARE IS TAKEN TO METER OUT THE APPROPRIATE NUMBER OF PULSES TO THE IMU ERROR COUNTERS AND PREVENT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:384
//# OVERFLOW, TO CONTROL THE RELAY SEQUENCING, AND TO AVOID INTERFERENCE WITH THE COARSE ALIGN LOOP WHICH ALSO USES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:385
//# THE DACS.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:386
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:387
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:388
//# CALLING SEQUENCE:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:389
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:390
//# 	DURING THE INITIALIZATION SECTION OF THE USER'S PROGRAM, BIT3 OF RCSFLAGS SHOULD BE SET TO INITIATE THE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:391
//# TURN-ON SEQUENCE WITHIN THE NEEDLES PROGRAM:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:392
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:393
//#		CS	RCSFLAGS	# IN EBANK6
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:394
//#		MASK	BIT3
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:395
//#		ADS	RCSFLAGS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:396
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:397
//# THEREAFTER, THE ATTITUDE ERRORS GENERATED BY THE USER SHOULD BE TRANSFERED TO THE FOLLOWING LOCATIONS IN EBANK6:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:398
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:399
//#		AK	SCALED 180 DEGREES	NOTE:	THESE LOCATIONS ARE SUBJECT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:400
//#		AK1	SCALED 180 DEGREES		TO CHANGE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:401
//#		AK2	SCALED 180 DEGREES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:402
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:403
//# FULL SCALED DEFLECTION CORRESPONDS TO 16 7/8 DEGREES OF ATTITUDE ERROR
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:404
//#		(= 384 BITS IN IMU ERROR COUNTER)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:405
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:406
//# A CALL TO NEEDLER WILL THEN UPDATE THE DISPLAY:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:407
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:408
//#		INHINT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:409
//#		TC	IBNKCALL	# NOTE: EBANK SHOULD BE SET TO E6
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:410
//#		CADR	NEEDLER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:411
//#		RELINT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:412
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:413
//# 	THIS PROCESS SHOULD BE REPEATED EACH TIME THE ERRORS ARE UPDATED.  AT LEAST 3 PASSES THRU THE PROGRAM ARE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:414
//# REQUIRED BEFORE ANYTHING IS ACTUALLY DISPLAYED ON THE ERROR METERS.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:415
//# NOTE: EACH CALL TO NEEDLER MUST BE SEPARATED BY AT LEAST 50MS TO ASSURE PROPER RELAY SEQUENCING.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:416
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:417
//# ERASABLE USED:
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:418
//#		AK		CDUXCMD
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:419
//#		AK1		CDUYCMD
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:420
//#		AK2		CDUZCMD
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:421
//#		EDRIVEX		A,L,Q
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:422
//#		EDRIVEY		T5TEMP
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:423
//#		EDRIVEZ		SPNDX
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:424
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:425
//# SWITCHES:	RCSFLAGS	BITS 3,2
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:426
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:427
//# I/O CHANNELS:	CHAN12		BIT 4 (COARSE ALIGN - READ ONLY)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:428
//# Page 1011
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:429
//#		CHAN12		BIT 6 (IMU ERROR COUNTER ENABLE)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:430
//#		CHAN14		BIT 13,14,15 (DAC ACTIVITY)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:431
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:432
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:433
//# SIGN CONVENTION<	AK = THETAC - THETA
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:434
//#		WHERE	THETAC = COMMAND ANGLE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:435
//#			THETA = PRESENT ANGLE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:436
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:437
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:438
//NEEDLER		CAF	BIT4		# CHECK FOR COARSE ALIGN ENABLE
// PORT: Fixed ROM slots 19728.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:439
//		EXTEND			# IF IN COARSE ALIGN DO NOT USE IMU
// PORT: Fixed ROM slots 19729.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:440
//		RAND	CHAN12		# ERROR COUNTERS.  DONT USE NEEDLES
// PORT: Fixed ROM slots 19730.
                            if slot <> 19730 or instruction <> 1034 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:441
//		EXTEND
// PORT: Fixed ROM slots 19731.
                            if slot <> 19731 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19732 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:442
//		BZF	NEEDLER1
// PORT: Fixed ROM slots 19732.
                            if slot <> 19732 or instruction <> 5401 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5401, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:443
//		CS	RCSFLAGS	# SET BIT3 FOR INITIALIZATION PASS
// PORT: Fixed ROM slots 19733.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:444
//		MASK	BIT3
// PORT: Fixed ROM slots 19734.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:445
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 19735.
                            if slot <> 19735 or instruction <> 12097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:446
//		TC	Q
// PORT: Fixed ROM slots 19736.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:447
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:448
//NEEDLER1	CA	RCSFLAGS
// PORT: Fixed ROM slots 19737.
                            if slot <> 19737 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:449
//		MASK	SIX
// PORT: Fixed ROM slots 19738.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:450
//		EXTEND
// PORT: Fixed ROM slots 19739.
                            if slot <> 19739 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:451
//		BZF	NEEDLES3
// PORT: Fixed ROM slots 19740.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:452
//		MASK	BIT3
// PORT: Fixed ROM slots 19741.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:453
//		EXTEND
// PORT: Fixed ROM slots 19742.
                            if slot <> 19742 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19743 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:454
//		BZF	NEEDLER2	# BIT3 = 0, BIT2 = 1
// PORT: Fixed ROM slots 19743.
                            if slot <> 19743 or instruction <> 5426 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5426, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:455
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:456
//		CS	BIT6		# FIRST PASS BIT3 = 1
// PORT: Fixed ROM slots 19744.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:457
//		EXTEND			# DISABLE IMU ERROR COUNTER TO ZERO DACS
// PORT: Fixed ROM slots 19745.
                            if slot <> 19745 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:458
//		WAND	CHAN12		# MUST WAIT AT LEAST 60 MS BEFORE
// PORT: Fixed ROM slots 19746.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:459
//NEEDLE11	CS	ZERO		# ENABLING COUNTERS.
// PORT: Fixed ROM slots 19747.
                            if slot <> 19747 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:460
//		TS	AK		# ZERO THE INPUTS ON FIRST PASS
// PORT: Fixed ROM slots 19748.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:461
//		TS	AK1
// PORT: Fixed ROM slots 19749.
                        if slot <> 19749 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19750 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:462
//		TS	AK2
// PORT: Fixed ROM slots 19750.
                            if slot <> 19750 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:463
//		TS	EDRIVEX		# ZERO THE DISPLAY REGISTERS
// PORT: Fixed ROM slots 19751.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:464
//		TS	EDRIVEY
// PORT: Fixed ROM slots 19752.
                            if slot <> 19752 or instruction <> 23364 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23364, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:465
//		TS	EDRIVEZ
// PORT: Fixed ROM slots 19753.
                            if slot <> 19753 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19754 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:466
//		TS	CDUXCMD		# ZERO THE OUT COUNTERS
// PORT: Fixed ROM slots 19754.
                            if slot <> 19754 or instruction <> 22568 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22568, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:467
//		TS	CDUYCMD
// PORT: Fixed ROM slots 19755.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:468
//		TS	CDUZCMD
// PORT: Fixed ROM slots 19756.
                            if slot <> 19756 or instruction <> 22570 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22570, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:469
//		CS	SIX		# RESET RCSFLAGS FOR PASS2
// PORT: Fixed ROM slots 19757.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:470
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 19758.
                            if slot <> 19758 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:471
//		AD	BIT2
// PORT: Fixed ROM slots 19759.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:472
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 19760.
                            if slot <> 19760 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:473
//		TC	Q		# END PASS1
// PORT: Fixed ROM slots 19761.
                            if slot <> 19761 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19762 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:474
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:475
//NEEDLER2	CAF	BIT6		# ENABLE IMU ERROR COUNTERS
// PORT: Fixed ROM slots 19762.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:476
//		EXTEND
// PORT: Fixed ROM slots 19763.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:477
//		WOR	CHAN12
// PORT: Fixed ROM slots 19764.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:478
//		CS	SIX		# RESET RCSFLAGS TO DISPLAY ATTITUDE
// PORT: Fixed ROM slots 19765.
                            if slot <> 19765 or instruction <> 19593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:479
//# Page 1012
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:480
//		MASK	RCSFLAGS	# ERRORS    WAIT AT LEAST 4 MS FOR
// PORT: Fixed ROM slots 19766.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:481
//		TS	RCSFLAGS	# RELAY CLOSURE
// PORT: Fixed ROM slots 19767.
                            if slot <> 19767 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:482
//		TC	Q
// PORT: Fixed ROM slots 19768.
                            if slot <> 19768 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19769 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:483
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:484
//NEEDLES3	CAF	BIT6		# CHECK TO SEE IF IMU ERROR COUNTER
// PORT: Fixed ROM slots 19769.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:485
//		EXTEND			# IS ENABLED
// PORT: Fixed ROM slots 19770.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:486
//		RAND	CHAN12
// PORT: Fixed ROM slots 19771.
                            if slot <> 19771 or instruction <> 1034 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:487
//		EXTEND			# IF NOT RECYCLE NEEDLES
// PORT: Fixed ROM slots 19772.
                            if slot <> 19772 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19773 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:488
//		BZF	NEEDLER +5
// PORT: Fixed ROM slots 19773.
                            if slot <> 19773 or instruction <> 5397 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5397, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:489
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:490
//NEEDLES		CAF	TWO
// PORT: Fixed ROM slots 19774.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:491
//DACLOOP		TS	SPNDX
// PORT: Fixed ROM slots 19775.
                            if slot <> 19775 or instruction <> 23366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23366, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:492
//		CS	QUARTER
// PORT: Fixed ROM slots 19776.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:493
//		EXTEND
// PORT: Fixed ROM slots 19777.
                            if slot <> 19777 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:494
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19778.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:495
//		MP	AK
// PORT: Fixed ROM slots 19779.
    19779, 59004
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19780–19788.
function agcAotUnit1148 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19783 {
        if slot <= 19781 {
            if slot <= 19780 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:496
//		TS	L
// PORT: Fixed ROM slots 19780.
                if slot <> 19780 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:497
//		CCS	A
// PORT: Fixed ROM slots 19781.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:498
//		CA	DACLIMIT
// PORT: Fixed ROM slots 19782.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:499
//		TCF	+2
// PORT: Fixed ROM slots 19783.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:500
//		CS	DACLIMIT
// PORT: Fixed ROM slots 19784.
                if slot <> 19784 or instruction <> 17762 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1378), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:501
//		AD	L
// PORT: Fixed ROM slots 19785.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:502
//		TS	T5TEMP		# OVFLO CHK
// PORT: Fixed ROM slots 19786.
                if slot <> 19786 or instruction <> 23362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23362, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19787 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:503
//		TCF	+4
// PORT: Fixed ROM slots 19787.
                    if slot <> 19787 or instruction <> 5455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5455, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:504
//		INDEX	A		# ON OVERFLOW LIMIT OUTPUT TO +-384
// PORT: Fixed ROM slots 19788.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:505
//		CAF	DACLIMIT
// PORT: Fixed ROM slots 19789.
    19789, 27332
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19790–19791.
function agcAotUnit1149 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19790 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:506
//		TS	L
// PORT: Fixed ROM slots 19790.
        if slot <> 19790 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:507
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19791.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:508
//		CS	EDRIVEX		# CURRENT VALUE OF DAC
// PORT: Fixed ROM slots 19792.
    19792, 34438
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19793–19794.
function agcAotUnit1150 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19793 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:509
//		AD	L
// PORT: Fixed ROM slots 19793.
        if slot <> 19793 or instruction <> 24577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:510
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19794.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:511
//		ADS	CDUXCMD
// PORT: Fixed ROM slots 19795.
    19795, 22608
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19796–19796.
function agcAotUnit1151 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:512
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19796.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:513
//		LXCH	EDRIVEX
// PORT: Fixed ROM slots 19797.
    19797, 20102
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19798–19807.
function agcAotUnit1152 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19802 {
        if slot <= 19799 {
            if slot <= 19798 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:514
//		CCS	SPNDX
// PORT: Fixed ROM slots 19798.
                if slot <> 19798 or instruction <> 4934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 838).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:515
//		TCF	DACLOOP
// PORT: Fixed ROM slots 19799.
                if slot <> 19799 or instruction <> 5439 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5439, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19800 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:516
//		CAF	13,14,15
// PORT: Fixed ROM slots 19800.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:517
//		EXTEND
// PORT: Fixed ROM slots 19801.
                    if slot <> 19801 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:518
//		WOR	CHAN14		# SET DAC ACTIVITY BITS
// PORT: Fixed ROM slots 19802.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:519
//		TC	Q
// PORT: Fixed ROM slots 19803.
                if slot <> 19803 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:520
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:521
//REINIT		CAF	DELAY200	# ........TILT LOGIC
// PORT: Fixed ROM slots 19804.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:522
//		TS	TIME5		# REINITIALIZE DAP IN 200MS
// PORT: Fixed ROM slots 19805.
                if slot <> 19805 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19806 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:523
//		TS	T5PHASE
// PORT: Fixed ROM slots 19806.
                    if slot <> 19806 or instruction <> 23349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23349, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:524
//		TCF	RESUME
// PORT: Fixed ROM slots 19807.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:525
//DELAY200	DEC	16364		# 200MS
// PORT: Fixed ROM slots 19808.
    19808, 32728,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:526
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:527
//		DEC	-384
// PORT: Fixed ROM slots 19809.
    19809, 64766,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:528
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:529
//# Page 1013
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:530
//DACLIMIT	DEC	16000
// PORT: Fixed ROM slots 19810.
    19810, 32000,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:531
//		DEC	384
// PORT: Fixed ROM slots 19811.
    19811, 768
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19812–19814.
function agcAotUnit1153 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19812 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:532
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:533
//# Page 1014
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:534
//# INITIALIZATION PROGRAM FOR RCS-CSM AUTOPILOT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:535
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:536
//# THE FOLLOWING QUANTITIES WILL BE ZEROED AND SHOULD APPEAR IN CONSECUTIVE LOCATIONS IN MEMORY AFTER WBODY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:537
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:538
//# WBODY		(+1)		DFT			TAU2
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:539
//# WBODY1	(+1)		DFT1			BIAS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:540
//# WBODY2	(+1)		DFT2			BIAS1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:541
//# ADOT		(+1)		DRHO	(+1)		BIAS2
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:542
//# ADOT1		(+1)		DRHO1	(+1)		ERRORX
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:543
//# ADOT2		(+1)		DRHO2	(+1)		ERRORY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:544
//# MERRORX	(+1)		ATTSEC			ERRORZ
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:545
//# MERRORY	(+1)		TAU
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:546
//# MERRORZ	(+1)		TAU1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:547
//FRESHDAP	CAF	ONE		# RESET HOLDFLAG TO STOP AUTOMATIC
// PORT: Fixed ROM slots 19812.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:548
//		TS	HOLDFLAG	# STEERING AND PREPARE TO PICK UP AN
// PORT: Fixed ROM slots 19813.
            if slot <> 19813 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:549
//					# ATTITUDE HOLD REFERENCE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:550
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:551
//REDAP		TC	IBNKCALL	# DECODE DAPDATR1, DAPDATR2 FOR DEADBANDS
// PORT: Fixed ROM slots 19814.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:552
//		CADR	S41.2		# RATES, QUADFAILS, QUAD MANAGEMENT
// PORT: Fixed ROM slots 19815.
    19815, 33230
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19816–19816.
function agcAotUnit1154 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:553
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:554
//		TC	IBNKCALL	# DECODE IXX, IAVG, AND CONVERT
// PORT: Fixed ROM slots 19816.
    if slot <> 19816 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1154] to agcAotUnit1154@.

agcAotInstallSourceRope(list(
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:555
//		CADR	S40.14		# TO AUTOPILOT GAINS
// PORT: Fixed ROM slots 19817.
    19817, 33408
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19818–19818.
function agcAotUnit1155 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:556
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:557
//		CAF	NO.T5VAR	# NO. LOCATIONS TO BE ZEROED MINUS ONE
// PORT: Fixed ROM slots 19818.
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

// PORT: Physical bank 21. Shared continuation entries, slots 19819–19821.
function agcAotUnit1156 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19819 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:558
//ZEROT5		TS	SPNDX		# ZERO ALL NECESSARY ERASABLE REGISTERS
// PORT: Fixed ROM slots 19819.
        if slot <> 19819 or instruction <> 23366 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23366, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19820 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:559
//		CAF	ZERO
// PORT: Fixed ROM slots 19820.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:560
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19821.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:561
//		TS	WBODY
// PORT: Fixed ROM slots 19822.
    19822, 46762
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19823–19851.
function agcAotUnit1157 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19836 {
        if slot <= 19829 {
            if slot <= 19825 {
                if slot <= 19823 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:562
//		CCS	SPNDX
// PORT: Fixed ROM slots 19823.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:563
//		TCF	ZEROT5
// PORT: Fixed ROM slots 19824.
                        if slot <> 19824 or instruction <> 5483 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5483, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:564
//		TCR	ZEROJET
// PORT: Fixed ROM slots 19825.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:565
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:566
//		CS	ZERO
// PORT: Fixed ROM slots 19826.
                        if slot <> 19826 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:567
//		TS	CHANTEMP	# INITIALIZE MINIMUM IMPULSE CONTROL
// PORT: Fixed ROM slots 19827.
                        if slot <> 19827 or instruction <> 23451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23451, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19828 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:568
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:569
//		TS	CH31TEMP	# INITIALIZE RHC POSITION MEMORY FOR
// PORT: Fixed ROM slots 19828.
                        if slot <> 19828 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:570
//					# MANUAL RATE MODES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:571
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:572
//		CAF	=.24
// PORT: Fixed ROM slots 19829.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:573
//		TS	SLOPE		# INITIALIZE SWITCHING LOGIC SLOPE
// PORT: Fixed ROM slots 19830.
                    if slot <> 19830 or instruction <> 23468 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19831 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:574
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:575
//		CAF	FOUR
// PORT: Fixed ROM slots 19831.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:576
//		TS	T5TIME		# PHASE 0 RESETS FOR PHASE 2 INTERRUPT IN
// PORT: Fixed ROM slots 19832.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:577
//					# 60 MS.  PHASE 2 RESETS FOR PHASE 1 RUPT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:578
//					# IN (80MS - T5TIME(40MS)).  THEREFORE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:579
//					# PHASE 1 (RATEFILTER) BEGINS CYCLING 100
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:580
//					# MS FROM NOW AND EVERY 100MS THEREAFTER.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:581
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:582
//		CAF	ELEVEN
// PORT: Fixed ROM slots 19833.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:583
//		TS	ATTKALMN	# RESET TO PICK UP KALMAN FILTER GAINS
// PORT: Fixed ROM slots 19834.
                        if slot <> 19834 or instruction <> 23439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19835 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:584
//					# TO INITIALIZE THE S/C ANGULAR RATES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:585
//# Page 1015
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:586
//		CA	CDUX
// PORT: Fixed ROM slots 19835.
                        if slot <> 19835 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:587
//		TS	RHO
// PORT: Fixed ROM slots 19836.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:588
//		CA	CDUY
// PORT: Fixed ROM slots 19837.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:589
//		TS	RHO1
// PORT: Fixed ROM slots 19838.
                        if slot <> 19838 or instruction <> 23454 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23454, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:590
//		CA	CDUZ
// PORT: Fixed ROM slots 19839.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:591
//		TS	RHO2
// PORT: Fixed ROM slots 19840.
                        if slot <> 19840 or instruction <> 23455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23455, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:592
//		CAF	ZERO		# RESET AUTOPILOT TO BEGIN EXECUTING
// PORT: Fixed ROM slots 19841.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:593
//		TS	T5PHASE		# PHASE2 OF PROGRAM
// PORT: Fixed ROM slots 19842.
                        if slot <> 19842 or instruction <> 23349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:594
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:595
//		CS	IMODES33	# CHECK IMU STATUS
// PORT: Fixed ROM slots 19843.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:596
//		MASK	BIT6		# IF BIT6 = 0 IMU IN FINE ALIGN
// PORT: Fixed ROM slots 19844.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:597
//		CCS	A		# IF BIT6 = 1 IMU NOT READY
// PORT: Fixed ROM slots 19845.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:598
//		TCF	IMUAOK
// PORT: Fixed ROM slots 19846.
                        if slot <> 19846 or instruction <> 5514 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5514, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:599
//		TS	ATTKALMN	# CANNOT USE IMU
// PORT: Fixed ROM slots 19847.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:600
//		CAF	RCSINITB	# PROVIDE FREE CONTROL ONLY
// PORT: Fixed ROM slots 19848.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:601
//		TCF	RCSSWIT		# DONT START UP RATE FILTER
// PORT: Fixed ROM slots 19849.
                        if slot <> 19849 or instruction <> 5519 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5519, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19850 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:602
//					# SIGNAL NO RATE FILTER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:603
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:604
//IMUAOK		CAF	PRIO34		# START MATRIX INITIALIZATION
// PORT: Fixed ROM slots 19850.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:605
//		TC	NOVAC		# BYPASS IF IMU NOT IN FINE ALIGN
// PORT: Fixed ROM slots 19851.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:606
//		EBANK=	KMPAC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:607
//		2CADR	AMBGUPDT
// PORT: Fixed ROM slots 19852 19853.
    19852, 3662, 19853, 36972
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19854–19858.
function agcAotUnit1158 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19855 {
        if slot <= 19854 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:608
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:609
//		CAF	RCSINIT		# CLEAR BIT14 -ASSUME WE HAVE A GOOD IMU
// PORT: Fixed ROM slots 19854.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:610
//RCSSWIT		TS	RCSFLAGS	# CLEAR BIT1  -INITIALIZE T6 PROGRAM
// PORT: Fixed ROM slots 19855.
            if slot <> 19855 or instruction <> 23361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23361, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19856 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:611
//					#   SET BIT3  -INITIALIZE NEEDLES
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:612
//					# CLEAR BIT4  -RESET FOR FDAIDSP1
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:613
//		CAF	T5WAIT60	# NEXT T5RUPT 60 MS FROM NOW TO ALLOW IMU
// PORT: Fixed ROM slots 19856.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:614
//					# ERROR COUNTER TO ZERO.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:615
//					# (MINIMUM DELAY = 15 MS)
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:616
//		TS	TIME5		# SINCE ATTKALMN IS +11, PROGRAM WILL THEN
// PORT: Fixed ROM slots 19857.
                if slot <> 19857 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:617
//		TC	RESUME		# PICK UP THE KALMAN FILTER GAINS.  RATE
// PORT: Fixed ROM slots 19858.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:618
//					# FILTER WILL BEGIN OPERATING ZOOMS FROM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:619
//					# NOW
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:620
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:621
//# CONSTANTS USED IN INITIALIZATION PROGRAM
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:622
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:623
//NO.T5VAR	DEC	36
// PORT: Fixed ROM slots 19859.
    19859, 72,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:624
//=.24		DEC	.24		# = SLOPE OF 0.6/SEC
// PORT: Fixed ROM slots 19860.
    19860, 7864,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:625
//RCSINIT		OCT	00004
// PORT: Fixed ROM slots 19861.
    19861, 8,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:626
//RCSINITB	OCT	20004
// PORT: Fixed ROM slots 19862.
    19862, 16392,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:627
//T5WAIT60	DEC	16378		# = 6 CS
// PORT: Fixed ROM slots 19863.
    19863, 32756,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:628
//		EBANK=	KMPAC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:629
//T6ADDR		2CADR	T6START
// PORT: Fixed ROM slots 19864 19865.
    19864, 3870, 19865, 30828
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19866–19869.
function agcAotUnit1159 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19867 {
        if slot <= 19866 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:630
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:631
//ZEROJET		CAF	ELEVEN		# ZERO BLAST2, BLAST1, BLAST, YWORD2,
// PORT: Fixed ROM slots 19866.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:632
//		TS	SPNDX		# YWORD1, PWORD2, PWORD1, RWORD2,
// PORT: Fixed ROM slots 19867.
            if slot <> 19867 or instruction <> 23366 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23366, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19868 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:633
//		CAF	ZERO		# AND RWORD1.
// PORT: Fixed ROM slots 19868.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:634
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:635
//# Page 1016
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:636
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19869.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:637
//		TS	RWORD1
// PORT: Fixed ROM slots 19870.
    19870, 46674
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19871–19952.
function agcAotUnit1160 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19911 {
        if slot <= 19890 {
            if slot <= 19880 {
                if slot <= 19875 {
                    if slot <= 19872 {
                        if slot <= 19871 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:638
//		CCS	SPNDX
// PORT: Fixed ROM slots 19871.
                            if slot <> 19871 or instruction <> 4934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 838).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:639
//		TCF	ZEROJET +1
// PORT: Fixed ROM slots 19872.
                            if slot <> 19872 or instruction <> 5531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19873 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:640
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:641
//		CAF	FOUR
// PORT: Fixed ROM slots 19873.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:642
//		TS	BLAST1 +1
// PORT: Fixed ROM slots 19874.
                                if slot <> 19874 or instruction <> 23346 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23346, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:643
//		CAF	ELEVEN
// PORT: Fixed ROM slots 19875.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:644
//		TS	BLAST2 +1
// PORT: Fixed ROM slots 19876.
                            if slot <> 19876 or instruction <> 23348 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23348, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:645
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:646
//		CS	BIT1
// PORT: Fixed ROM slots 19877.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:647
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 19878.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:648
//		TS	RCSFLAGS	# RESET BIT1 OF RCSFLAGS TO 0
// PORT: Fixed ROM slots 19879.
                                if slot <> 19879 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:649
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:650
//		EXTEND
// PORT: Fixed ROM slots 19880.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:651
//		DCA	T6ADDR
// PORT: Fixed ROM slots 19881.
                            if slot <> 19881 or instruction <> 13721 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1433, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:652
//		DXCH	T6LOC
// PORT: Fixed ROM slots 19882.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:653
//		CAF	=+14MS		# ENABLE T6RUPT TO SHUT OFF JETS IN 14 MS.
// PORT: Fixed ROM slots 19883.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:654
//		TS	TIME6
// PORT: Fixed ROM slots 19884.
                                if slot <> 19884 or instruction <> 22553 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22553, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:655
//		CAF	BIT15
// PORT: Fixed ROM slots 19885.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:656
//		EXTEND
// PORT: Fixed ROM slots 19886.
                            if slot <> 19886 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:657
//		WOR	CHAN13
// PORT: Fixed ROM slots 19887.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:658
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:659
//		TC	Q
// PORT: Fixed ROM slots 19888.
                            if slot <> 19888 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19889 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:660
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:661
//T5PHASE2	CCS	ATTKALMN	# IF (+) INITIALIZE RATE ESTIMATE
// PORT: Fixed ROM slots 19889.
                                if slot <> 19889 or instruction <> 5007 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:662
//		TCF	KALUPDT
// PORT: Fixed ROM slots 19890.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:663
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:664
//		TCF	+2		# ONLY IF ATTKALMN POSITIVE
// PORT: Fixed ROM slots 19891.
                            if slot <> 19891 or instruction <> 5557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:665
//		TCF	+1
// PORT: Fixed ROM slots 19892.
                            if slot <> 19892 or instruction <> 5557 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5557, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19893 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:666
//		CA	DELTATT2	# RESET FOR PHASE3 IN 20 MS
// PORT: Fixed ROM slots 19893.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:667
//		XCH	TIME5		# (JET SELECTION LOGIC)
// PORT: Fixed ROM slots 19894.
                                if slot <> 19894 or instruction <> 23576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 24, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:668
//		ADS	T5TIME		# TO COMPENSATE FOR DELAYS IN T5RUPT
// PORT: Fixed ROM slots 19895.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:669
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:670
//		CA	RCSFLAGS	# IF A HIGH RATE AUTO MANEUVER IS IN
// PORT: Fixed ROM slots 19896.
                            if slot <> 19896 or instruction <> 13121 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:671
//		MASK	BIT15		# PROGRESS (BIT 15 OF RCSFLAGS SET), SET
// PORT: Fixed ROM slots 19897.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:672
//		EXTEND			# ATTKALMN TO -1
// PORT: Fixed ROM slots 19898.
                            if slot <> 19898 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19899 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:673
//		BZF	NOHIAUTO	# OTHERWISE SET ATTKALMN TO 0.
// PORT: Fixed ROM slots 19899.
                                if slot <> 19899 or instruction <> 5565 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5565, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:674
//		CS	ONE
// PORT: Fixed ROM slots 19900.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:675
//NOHIAUTO	TS	ATTKALMN
// PORT: Fixed ROM slots 19901.
                            if slot <> 19901 or instruction <> 23439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:676
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:677
//# Page 1017
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:678
//# MANUAL ROTATION COMMANDS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:679
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:680
//		CS	OCT01760	# RESET FORCED FIRING BITS (BITS 10 TO 5
// PORT: Fixed ROM slots 19902.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:681
//		MASK	RCSFLAGS	# OF RCSFLAGS) TO ZERO
// PORT: Fixed ROM slots 19903.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:682
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 19904.
                                if slot <> 19904 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:683
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:684
//		EXTEND
// PORT: Fixed ROM slots 19905.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:685
//		READ	CHAN31
// PORT: Fixed ROM slots 19906.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:686
//		TS	L
// PORT: Fixed ROM slots 19907.
                                if slot <> 19907 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:687
//		CA	CH31TEMP
// PORT: Fixed ROM slots 19908.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:688
//		EXTEND
// PORT: Fixed ROM slots 19909.
                            if slot <> 19909 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19910 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:689
//		RXOR	LCHAN
// PORT: Fixed ROM slots 19910.
                                if slot <> 19910 or instruction <> 3073 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:690
//		MASK	MANROT		# = OCT00077
// PORT: Fixed ROM slots 19911.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:691
//		EXTEND
// PORT: Fixed ROM slots 19912.
                            if slot <> 19912 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:692
//		BZMF	NOCHANGE
// PORT: Fixed ROM slots 19913.
                            if slot <> 19913 or instruction <> 26068 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26068, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19914 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:693
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:694
//		LXCH	A
// PORT: Fixed ROM slots 19914.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:695
//		TS	CH31TEMP	# SAVE CONTENTS OF CHANNEL 31 IN CH31TEMP
// PORT: Fixed ROM slots 19915.
                                if slot <> 19915 or instruction <> 23450 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23450, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:696
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:697
//		CA	L
// PORT: Fixed ROM slots 19916.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:698
//		EXTEND
// PORT: Fixed ROM slots 19917.
                            if slot <> 19917 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:699
//		MP	BIT5		# PUT BITS 6-1 OF A IN BITS 10-5 OF L
// PORT: Fixed ROM slots 19918.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:700
//		CA	L
// PORT: Fixed ROM slots 19919.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:701
//		ADS	RCSFLAGS	# SET FORCED FIRING BITS FOR AXES WITH
// PORT: Fixed ROM slots 19920.
                                if slot <> 19920 or instruction <> 12097 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 833).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:702
//					# CHANGES IN COMMAND.  BITS 10,9 FOR
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:703
//					# ROLL, BITS 8,7 FOR YAW, BITS 6,5 FOR
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:704
//					# PITCH
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:705
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:706
//		CS	RCSFLAGS	# SET RATE DAMPING FLAGS (BITS 13,12,AND
// PORT: Fixed ROM slots 19921.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:707
//		MASK	OCT16000	# 11 OF RCSFLAGS)
// PORT: Fixed ROM slots 19922.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:708
//		ADS	RCSFLAGS
// PORT: Fixed ROM slots 19923.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:709
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:710
//NOCHANGE	CS	CH31TEMP
// PORT: Fixed ROM slots 19924.
                            if slot <> 19924 or instruction <> 17306 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 922).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19925 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:711
//		MASK	MANROT
// PORT: Fixed ROM slots 19925.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:712
//		EXTEND
// PORT: Fixed ROM slots 19926.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:713
//		BZMF	AHFNOROT	# IF NO MANUAL COMMANDS, GO TO AHFNOROT
// PORT: Fixed ROM slots 19927.
                            if slot <> 19927 or instruction <> 26280 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26280, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:714
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:715
//		TS	HOLDFLAG	# SET HOLDFLAG +
// PORT: Fixed ROM slots 19928.
                            if slot <> 19928 or instruction <> 23258 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23258, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19929 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:716
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:717
//		TC	STICKCHK	# WHEN THE RHC IS OUT OF DETENT, PMANNDX,
// PORT: Fixed ROM slots 19929.
                            if slot <> 19929 or instruction <> 1624 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1624, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19930 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:718
//					# YMANNDX, AND RMANNDX ARE ALL SET, BY
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:719
//					# MEANS OF STICKCHK, TO 0, 1, OR 2 FOR NO,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:720
//					# +, OR - ROTATION RESPECTIVELY AS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:721
//					# COMMANDED BY THE RHC.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:722
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:723
//					# HOWEVER, IT IS WELL TO NOTE THAT AFTER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:724
//					# THE RHC IS RETURNED TO DETENT, THE
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:725
//					# PROGRAM BRANCHES TO AHFNOROT AND AVOIDS
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:726
//					# STICKCHK SO PMANNDX, YMANNDX, AND
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:727
//					# RMANNDX ARE NOT RESET TO ZERO BUT RATHER
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:728
//					# LEFT SET TO THEIR LAST OUT OF DETENT
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:729
//# Page 1018
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:730
//					# VALUES.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:731
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:732
//		CS	FLAGWRD1	# SET STIKFLAG TO INFORM STEERING
// PORT: Fixed ROM slots 19930.
                                if slot <> 19930 or instruction <> 16445 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 61).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:733
//		MASK	BIT14		# PROGRAMS (P20) THAT ASTRONAUT HAS
// PORT: Fixed ROM slots 19931.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:734
//		ADS	FLAGWRD1	# ASSUMED ROTATIONAL CONTROL OF SPACECRAFT
// PORT: Fixed ROM slots 19932.
                            if slot <> 19932 or instruction <> 11325 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:735
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:736
//		CAF	BIT14
// PORT: Fixed ROM slots 19933.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:737
//		EXTEND
// PORT: Fixed ROM slots 19934.
                            if slot <> 19934 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19935 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:738
//		RAND	CHAN31
// PORT: Fixed ROM slots 19935.
                                if slot <> 19935 or instruction <> 1049 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:739
//		EXTEND
// PORT: Fixed ROM slots 19936.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:740
//		BZMF	FREEFUNC
// PORT: Fixed ROM slots 19937.
                            if slot <> 19937 or instruction <> 26153 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26153, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:741
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:742
//		CA	RCSFLAGS	# EXAMINE RCSFLAGS TO SEE IF RATE FILTER
// PORT: Fixed ROM slots 19938.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:743
//		MASK	BIT14		# HAS BEEN INITIALIZED
// PORT: Fixed ROM slots 19939.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:744
//		CCS	A		# IF SO, PROCEED WITH MANUAL RATE COMMANDS
// PORT: Fixed ROM slots 19940.
                                if slot <> 19940 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:745
//		TCF	REINIT		# .....TILT, RECYCLE TO INITIALIZE FILTER
// PORT: Fixed ROM slots 19941.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:746
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:747
//		CS	FIVE		# IF MANUAL MANEUVER IS AT HIGH RTE, SET
// PORT: Fixed ROM slots 19942.
                            if slot <> 19942 or instruction <> 18962 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:748
//		AD	RATEINDX	# ATTKALMN TO -1.
// PORT: Fixed ROM slots 19943.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:749
//		EXTEND			# OTHERWISE, LEAVE ATTKALMN ALONE.
// PORT: Fixed ROM slots 19944.
                            if slot <> 19944 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19945 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:750
//		BZMF	+3
// PORT: Fixed ROM slots 19945.
                                if slot <> 19945 or instruction <> 26092 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26092, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:751
//		CS	ONE
// PORT: Fixed ROM slots 19946.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:752
//		TS	ATTKALMN
// PORT: Fixed ROM slots 19947.
                            if slot <> 19947 or instruction <> 23439 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23439, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19948 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:753
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:754
//		CAF	TWO		# AUTO-HOLD MANUAL ROTATION
// PORT: Fixed ROM slots 19948.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:755
//SETWBODY	TS	SPNDX
// PORT: Fixed ROM slots 19949.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:756
//		DOUBLE
// PORT: Fixed ROM slots 19950.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:757
//		TS	DPNDX
// PORT: Fixed ROM slots 19951.
                                if slot <> 19951 or instruction <> 23367 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23367, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:758
//		INDEX	SPNDX		# RMANNDX = 0 NO ROTATION
// PORT: Fixed ROM slots 19952.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:759
//		CA	RMANNDX		#	  = 1  + ROTATION
// PORT: Fixed ROM slots 19953.
    19953, 26460
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19954–19958.
function agcAotUnit1161 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19955 {
        if slot <= 19954 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:760
//		EXTEND			#  	  = 2  - ROTATION
// PORT: Fixed ROM slots 19954.
            if slot <> 19954 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:761
//		BZF	NORATE		# IF NO ROTATION COMMAND ON THIS AXIS,
// PORT: Fixed ROM slots 19955.
            if slot <> 19955 or instruction <> 5637 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5637, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19956 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:762
//					# GO TO NORATE.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:763
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:764
//		AD	RATEINDX	# RATEINDX = 0  0.05 DEG/SEC
// PORT: Fixed ROM slots 19956.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:765
//		TS	Q		#          = 2  0.2  DEG/SEC
// PORT: Fixed ROM slots 19957.
                if slot <> 19957 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:766
//		INDEX	Q		#          = 4  0.5  DEG/SEC
// PORT: Fixed ROM slots 19958.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:767
//		CA	MANTABLE -1	#          = 6  2.0  DEG/SEC
// PORT: Fixed ROM slots 19959.
    19959, 27710
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19960–19962.
function agcAotUnit1162 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19960 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:768
//		EXTEND
// PORT: Fixed ROM slots 19960.
        if slot <> 19960 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19961 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:769
//		MP	BIT9		# MULTIPLY MANTABLE BY 2 TO THE -6
// PORT: Fixed ROM slots 19961.
            if slot <> 19961 or instruction <> 31239 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2567, readEffective:call(words, 2567)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:770
//		INDEX	DPNDX		# TO GET COMMANDED RATE.
// PORT: Fixed ROM slots 19962.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:771
//		DXCH	WBODY		# SET WBODY TO COMMANDED RATE.
// PORT: Fixed ROM slots 19963.
    19963, 44716
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19964–19970.
function agcAotUnit1163 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19966 {
        if slot <= 19964 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:772
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:773
//		CA	RCSFLAGS
// PORT: Fixed ROM slots 19964.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:774
//		MASK	OCT16000	# IS RATE DAMPING COMPLETED (BITS 13,12 AND
// PORT: Fixed ROM slots 19965.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:775
//		EXTEND			# 11 OF RCSFLAGS ALL ZERO.)  IF SO, GO TO
// PORT: Fixed ROM slots 19966.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:776
//		BZF	MERUPDAT	# MERUPDAT TO UPDATE CUMULATIVE ATTITUDE
// PORT: Fixed ROM slots 19967.
                if slot <> 19967 or instruction <> 5645 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5645, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:777
//					# ERROR.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:778
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:779
//# Page 1019
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:780
//ZEROER		CA	ZERO		# ZEROER ZEROS MERRORS
// PORT: Fixed ROM slots 19968.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:781
//		ZL
// PORT: Fixed ROM slots 19969.
                if slot <> 19969 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:782
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19970.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:783
//		DXCH	MERRORX
// PORT: Fixed ROM slots 19971.
    19971, 44740
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19972–19974.
function agcAotUnit1164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19972 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:784
//		TCF	SPNDXCHK
// PORT: Fixed ROM slots 19972.
        if slot <> 19972 or instruction <> 5651 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5651, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19973 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:785
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:786
//NORATE		ZL
// PORT: Fixed ROM slots 19973.
            if slot <> 19973 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:787
//		INDEX	DPNDX
// PORT: Fixed ROM slots 19974.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:788
//		DXCH	WBODY		# ZERO WBODY FOR THIS AXIS
// PORT: Fixed ROM slots 19975.
    19975, 44716
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19976–19981.
function agcAotUnit1165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19978 {
        if slot <= 19976 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:789
//		CA	RCSFLAGS
// PORT: Fixed ROM slots 19976.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:790
//		MASK	OCT16000
// PORT: Fixed ROM slots 19977.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:791
//		EXTEND			# IS RATE DAMPING COMPLETED
// PORT: Fixed ROM slots 19978.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:792
//		BZF	SPNDXCHK	# YES, KEEP CURRENT MERRORX GO TO SPNDXCHK
// PORT: Fixed ROM slots 19979.
            if slot <> 19979 or instruction <> 5651 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5651, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19980 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:793
//		TCF	ZEROER		# NO,GO TO ZEROER
// PORT: Fixed ROM slots 19980.
                if slot <> 19980 or instruction <> 5632 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5632, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:794
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:795
//MERUPDAT	INDEX	Q		# MERRORX=MERRORX+MEASURED CHANGE IN ANGLE
// PORT: Fixed ROM slots 19981.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:796
//		CS	MANTABLE -1	# -COMMANDED CHANGE IN ANGLE
// PORT: Fixed ROM slots 19982.
    19982, 35902
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19983–19985.
function agcAotUnit1166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19983 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:797
//		EXTEND			# THE ADDITION OF MEASURED CHANGE IN ANGLE
// PORT: Fixed ROM slots 19983.
        if slot <> 19983 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19984 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:798
//		MP	BIT7		# HAS ALREADY BEEN DONE IN THE RATE FILTER
// PORT: Fixed ROM slots 19984.
            if slot <> 19984 or instruction <> 31241 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2569, readEffective:call(words, 2569)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:799
//		INDEX	DPNDX		# COMMANDED CHANGE IN ANGLE = WBODY TIMES
// PORT: Fixed ROM slots 19985.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:800
//		DAS	MERRORX		# .1SEC = MANTABLE ENTRY TIMES 2 TO THE -8
// PORT: Fixed ROM slots 19986.
    19986, 18116
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19987–19987.
function agcAotUnit1167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:801
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:802
//SPNDXCHK	INDEX	DPNDX
// PORT: Fixed ROM slots 19987.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:803
//		CA	MERRORX
// PORT: Fixed ROM slots 19988.
    19988, 26306
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19989–19989.
function agcAotUnit1168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:804
//		INDEX	SPNDX
// PORT: Fixed ROM slots 19989.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:805
//		TS	ERRORX		# ERRORX = HIGH ORDER WORD OF MERRORX
// PORT: Fixed ROM slots 19990.
    19990, 46830
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19991–19993.
function agcAotUnit1169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19991 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:806
//		CCS	SPNDX
// PORT: Fixed ROM slots 19991.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:807
//		TCF	SETWBODY
// PORT: Fixed ROM slots 19992.
            if slot <> 19992 or instruction <> 5613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5613, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:808
//		TCF	JETS
// PORT: Fixed ROM slots 19993.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:809
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:810
//OCT01760	OCT	01760		# FORCED FIRING BITS MASK
// PORT: Fixed ROM slots 19994.
    19994, 2016,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:811
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:812
//OCT01400	OCT	01400		# ROLL FORCED FIRING MASK	ORDER OF
// PORT: Fixed ROM slots 19995.
    19995, 1536,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:813
//OCT00060	OCT	00060		# PITCH FORCED FIRING MASK	DEFINITION
// PORT: Fixed ROM slots 19996.
    19996, 96,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:814
//OCT00300	OCT	00300		# YAW FORCED FIRING MASK	MUST BE
// PORT: Fixed ROM slots 19997.
    19997, 384,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:815
//					#				PRESERVED
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:816
//					#			      FOR INDEXING
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:817
//MANROT		OCT	77
// PORT: Fixed ROM slots 19998.
    19998, 126,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:818
//OCT16000	OCT	16000		# RATE DAMPING FLAGS MASK
// PORT: Fixed ROM slots 19999.
    19999, 14336,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:819
//MANTABLE	DEC	.0071111
// PORT: Fixed ROM slots 20000.
    20000, 234,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:820
//		DEC	-.0071111
// PORT: Fixed ROM slots 20001.
    20001, 65300,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:821
//		DEC	.028444
// PORT: Fixed ROM slots 20002.
    20002, 932,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:822
//		DEC	-0.028444
// PORT: Fixed ROM slots 20003.
    20003, 64602,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:823
//		DEC	.071111
// PORT: Fixed ROM slots 20004.
    20004, 2330,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:824
//		DEC	-.071111
// PORT: Fixed ROM slots 20005.
    20005, 63204,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:825
//		DEC	.284444
// PORT: Fixed ROM slots 20006.
    20006, 9320,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:826
//		DEC	-.284444
// PORT: Fixed ROM slots 20007.
    20007, 56214,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:827
//=+14MS		DEC	23
// PORT: Fixed ROM slots 20008.
    20008, 46
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20009–20009.
function agcAotUnit1170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:828
//FREEFUNC	INDEX	RMANNDX		# ACCELERATION
// PORT: Fixed ROM slots 20009.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:829
//# Page 1020
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:830
//		CA	FREETAU		# COMMANDS
// PORT: Fixed ROM slots 20010.
    20010, 27750
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20011–20012.
function agcAotUnit1171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20011 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:831
//		TS	TAU
// PORT: Fixed ROM slots 20011.
        if slot <> 20011 or instruction <> 23409 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23409, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:832
//		INDEX	PMANNDX
// PORT: Fixed ROM slots 20012.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:833
//		CA	FREETAU		# FREETAU	0 SEC
// PORT: Fixed ROM slots 20013.
    20013, 27750
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20014–20015.
function agcAotUnit1172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20014 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:834
//		TS	TAU1		# +1	       +0.10 SEC
// PORT: Fixed ROM slots 20014.
        if slot <> 20014 or instruction <> 23410 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23410, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:835
//		INDEX	YMANNDX		# +2	       -0.10 SEC
// PORT: Fixed ROM slots 20015.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:836
//		CA	FREETAU		# (+3)		0 SEC
// PORT: Fixed ROM slots 20016.
    20016, 27750
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20017–20018.
function agcAotUnit1173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20017 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:837
//		TS	TAU2
// PORT: Fixed ROM slots 20017.
        if slot <> 20017 or instruction <> 23411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23411, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:838
//		TCF	T6PROGM
// PORT: Fixed ROM slots 20018.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:839
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:840
//FREETAU		DEC	0
// PORT: Fixed ROM slots 20019.
    20019, 0,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:841
//		DEC	480
// PORT: Fixed ROM slots 20020.
    20020, 960,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:842
//		DEC	-480
// PORT: Fixed ROM slots 20021.
    20021, 64574,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:843
//		DEC	0
// PORT: Fixed ROM slots 20022.
    20022, 0
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20023–20027.
function agcAotUnit1174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20024 {
        if slot <= 20023 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:844
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:845
//T6PROGM		CAF	ZERO		# FOR MANUAL ROTATIONS
// PORT: Fixed ROM slots 20023.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:846
//		TS	ERRORX
// PORT: Fixed ROM slots 20024.
            if slot <> 20024 or instruction <> 23415 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23415, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20025 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:847
//		TS	ERRORY
// PORT: Fixed ROM slots 20025.
            if slot <> 20025 or instruction <> 23416 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23416, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20026 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:848
//		TS	ERRORZ
// PORT: Fixed ROM slots 20026.
                if slot <> 20026 or instruction <> 23417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:849
//		TCF	T6PROG
// PORT: Fixed ROM slots 20027.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:850
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:851
//# Page 1021
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:852
//		DEC	.2112		# FILTER GAIN FOR TRANSLATION, LEM ON
// PORT: Fixed ROM slots 20028.
    20028, 6920,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:853
//		DEC	.8400		# FILTER GAIN FOR TRANSLATION 2(ZETA)WN DT
// PORT: Fixed ROM slots 20029.
    20029, 27526,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:854
//		DEC	.2112		# FILTER GAIN FOR 2 DEGREES/SEC MANEUVERS
// PORT: Fixed ROM slots 20030.
    20030, 6920,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:855
//GAIN1		DEC	.0640		# KALMAN FILTER GAINS FOR INITIALIZATION
// PORT: Fixed ROM slots 20031.
    20031, 2098,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:856
//		DEC	.3180		# OF ATTITUDE RATES
// PORT: Fixed ROM slots 20032.
    20032, 10420,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:857
//		DEC	.3452
// PORT: Fixed ROM slots 20033.
    20033, 11312,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:858
//		DEC	.3774
// PORT: Fixed ROM slots 20034.
    20034, 12366,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:859
//		DEC	.4161
// PORT: Fixed ROM slots 20035.
    20035, 13634,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:860
//		DEC	.4634
// PORT: Fixed ROM slots 20036.
    20036, 15184,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:861
//		DEC	.5223
// PORT: Fixed ROM slots 20037.
    20037, 17114,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:862
//		DEC	.5970
// PORT: Fixed ROM slots 20038.
    20038, 19562,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:863
//		DEC	.6933
// PORT: Fixed ROM slots 20039.
    20039, 22718,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:864
//		DEC	.8151
// PORT: Fixed ROM slots 20040.
    20040, 26710,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:865
//		DEC	.9342
// PORT: Fixed ROM slots 20041.
    20041, 30612,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:866
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:867
//		DEC	.0174		# FILTER GAIN FOR TRANSLATION, LEM ON
// PORT: Fixed ROM slots 20042.
    20042, 570,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:868
//		DEC	.3600		# FILTER GAIN FOR TRANSLATION (WN)(WN)DT
// PORT: Fixed ROM slots 20043.
    20043, 11796,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:869
//		DEC	.0174		# FILTER GAIN FOR 2 DEGREES/SEC MANEUVERS
// PORT: Fixed ROM slots 20044.
    20044, 570,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:870
//GAIN2		DEC	.0016		# SCALED 10
// PORT: Fixed ROM slots 20045.
    20045, 52,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:871
//		DEC	.0454
// PORT: Fixed ROM slots 20046.
    20046, 1488,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:872
//		DEC	.0545
// PORT: Fixed ROM slots 20047.
    20047, 1786,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:873
//		DEC	.0666
// PORT: Fixed ROM slots 20048.
    20048, 2182,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:874
//		DEC	.0832
// PORT: Fixed ROM slots 20049.
    20049, 2726,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:875
//		DEC	.1069
// PORT: Fixed ROM slots 20050.
    20050, 3502,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:876
//		DEC	.1422
// PORT: Fixed ROM slots 20051.
    20051, 4660,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:877
//		DEC	.1985
// PORT: Fixed ROM slots 20052.
    20052, 6504,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:878
//		DEC	.2955
// PORT: Fixed ROM slots 20053.
    20053, 9682,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:879
//		DEC	.4817
// PORT: Fixed ROM slots 20054.
    20054, 15784,
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:880
//		DEC	.8683
// PORT: Fixed ROM slots 20055.
    20055, 28452
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20056–20135.
function agcAotUnit1175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20095 {
        if slot <= 20075 {
            if slot <= 20065 {
                if slot <= 20060 {
                    if slot <= 20057 {
                        if slot <= 20056 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:881
//STICKCHK	TS	T5TEMP
// PORT: Fixed ROM slots 20056.
                            if slot <> 20056 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:882
//		MASK	THREE		# INDICES FOR MANUAL ROTATION
// PORT: Fixed ROM slots 20057.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:883
//		TS	PMANNDX
// PORT: Fixed ROM slots 20058.
                            if slot <> 20058 or instruction <> 23471 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23471, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20059 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:884
//		CA	T5TEMP
// PORT: Fixed ROM slots 20059.
                                if slot <> 20059 or instruction <> 13122 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 834).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:885
//		EXTEND			# MAN RATE  0  0 RATE (DP)
// PORT: Fixed ROM slots 20060.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:886
//		MP	QUARTER		# 	   +1 	+RATE (DP)
// PORT: Fixed ROM slots 20061.
                            if slot <> 20061 or instruction <> 31235 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2563, readEffective:call(words, 2563)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:887
//		TS	T5TEMP		#          +2	-RATE (DP)
// PORT: Fixed ROM slots 20062.
                            if slot <> 20062 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20063 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:888
//		MASK	THREE		#	  (+3)	0 RATE (DP)
// PORT: Fixed ROM slots 20063.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:889
//		TS	YMANNDX
// PORT: Fixed ROM slots 20064.
                                if slot <> 20064 or instruction <> 23472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23472, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:890
//		CA	T5TEMP
// PORT: Fixed ROM slots 20065.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:891
//		EXTEND
// PORT: Fixed ROM slots 20066.
                            if slot <> 20066 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:892
//		MP	QUARTER
// PORT: Fixed ROM slots 20067.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:893
//		TS	RMANNDX
// PORT: Fixed ROM slots 20068.
                            if slot <> 20068 or instruction <> 23470 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23470, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20069 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:894
//		TC	Q
// PORT: Fixed ROM slots 20069.
                                if slot <> 20069 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:895
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:896
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:897
//KALUPDT		TS	ATTKALMN	# INITIALIZATION OF ATTITUDE RATES USING
// PORT: Fixed ROM slots 20070.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:898
//					# KALMAN FILTER TAKES 1.1 SEC
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:899
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:900
//		CA	DELTATT		# =1SEC - 80MS
// PORT: Fixed ROM slots 20071.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:901
//		AD	T5TIME		# + DELAYS
// PORT: Fixed ROM slots 20072.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:902
//# Page 1022
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:903
//		TS	TIME5
// PORT: Fixed ROM slots 20073.
                            if slot <> 20073 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20074 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:904
//		TCF	+3
// PORT: Fixed ROM slots 20074.
                                if slot <> 20074 or instruction <> 5741 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5741, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:905
//		CAF	DELTATT2	# SAFETY PLAY TO ASSURE
// PORT: Fixed ROM slots 20075.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:906
//		TS	TIME5		# A T5RUPT
// PORT: Fixed ROM slots 20076.
                            if slot <> 20076 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:907
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:908
//KRESUME2	CS	ZERO		# RESET FOR PHASE1
// PORT: Fixed ROM slots 20077.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:909
//		TS	T5PHASE		# RESUME INTERRUPTED PROGRAM
// PORT: Fixed ROM slots 20078.
                            if slot <> 20078 or instruction <> 23349 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23349, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20079 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:910
//		TCF	RESUME
// PORT: Fixed ROM slots 20079.
                                if slot <> 20079 or instruction <> 6875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:911
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:912
//FDAIDSP2	CS	BIT4		# RESET FOR FDAIDSP1
// PORT: Fixed ROM slots 20080.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:913
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 20081.
                            if slot <> 20081 or instruction <> 29505 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 833).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:914
//		TS	RCSFLAGS
// PORT: Fixed ROM slots 20082.
                            if slot <> 20082 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20083 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:915
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:916
//		CS	FLAGWRD0	# ON - DISPLAY ONE OF THE TOTAL ATTITUDE
// PORT: Fixed ROM slots 20083.
                            if slot <> 20083 or instruction <> 16444 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 60).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20084 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:917
//		MASK	BIT9		# ERRORS
// PORT: Fixed ROM slots 20084.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:918
//		EXTEND
// PORT: Fixed ROM slots 20085.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:919
//		BZF	FDAITOTL
// PORT: Fixed ROM slots 20086.
                            if slot <> 20086 or instruction <> 5757 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5757, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:920
//		EXTEND
// PORT: Fixed ROM slots 20087.
                            if slot <> 20087 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20088 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:921
//		DCS	ERRORX		# OFF -DISPLAY AUTOPILOT FOLLOWING ERROR
// PORT: Fixed ROM slots 20088.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:922
//		DXCH	AK
// PORT: Fixed ROM slots 20089.
                                if slot <> 20089 or instruction <> 22335 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 831, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:923
//		CS	ERRORZ
// PORT: Fixed ROM slots 20090.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:924
//		TS	AK2
// PORT: Fixed ROM slots 20091.
                            if slot <> 20091 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:925
//		TCF	RESUME		# END PHASE 1
// PORT: Fixed ROM slots 20092.
                            if slot <> 20092 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20093 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:926
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:927
//FDAITOTL	CA	FLAGWRD9
// PORT: Fixed ROM slots 20093.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:928
//		MASK	BIT6
// PORT: Fixed ROM slots 20094.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:929
//		EXTEND
// PORT: Fixed ROM slots 20095.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:930
//		BZF	WRTN17		# IS N22ORN17 (BIT6 OF FLAGWRD9) = 0
// PORT: Fixed ROM slots 20096.
                            if slot <> 20096 or instruction <> 5795 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5795, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:931
//					# IF SO, GO TO WRTN17
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:932
//WRTN22		EXTEND			# OTHERWISE, CONTINUE ON TO WRTN22 AND
// PORT: Fixed ROM slots 20097.
                            if slot <> 20097 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20098 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:933
//		DCA	CTHETA		# GET SET TO COMPUTE TOTAL ATTITUDE
// PORT: Fixed ROM slots 20098.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:934
//		DXCH	WTEMP		# ERROR WRT N22 BY PICKING UP THE THREE
// PORT: Fixed ROM slots 20099.
                                if slot <> 20099 or instruction <> 22348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:935
//		CA	CPHI		# COMPONENTS OF N22
// PORT: Fixed ROM slots 20100.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:936
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:937
//GETAKS		EXTEND			# COMPUTE TOTAL ATTITUDE ERROR FOR
// PORT: Fixed ROM slots 20101.
                            if slot <> 20101 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:938
//		MSU	CDUX		# DISPLAY ON FDAI ERROR NEEDLES
// PORT: Fixed ROM slots 20102.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:939
//		TS	AK
// PORT: Fixed ROM slots 20103.
                            if slot <> 20103 or instruction <> 23358 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23358, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20104 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:940
//		CA	WTEMP
// PORT: Fixed ROM slots 20104.
                                if slot <> 20104 or instruction <> 13131 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 843).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:941
//		EXTEND
// PORT: Fixed ROM slots 20105.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:942
//		MSU	CDUY
// PORT: Fixed ROM slots 20106.
                            if slot <> 20106 or instruction <> 8219 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:943
//		TS	T5TEMP
// PORT: Fixed ROM slots 20107.
                            if slot <> 20107 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20108 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:944
//		EXTEND
// PORT: Fixed ROM slots 20108.
                            if slot <> 20108 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20109 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:945
//		MP	AMGB1
// PORT: Fixed ROM slots 20109.
                                if slot <> 20109 or instruction <> 29600 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 928, readEffective:call(words, 928)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:946
//		ADS	AK
// PORT: Fixed ROM slots 20110.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:947
//		CA	T5TEMP
// PORT: Fixed ROM slots 20111.
                            if slot <> 20111 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:948
//		EXTEND
// PORT: Fixed ROM slots 20112.
                            if slot <> 20112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20113 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:949
//		MP	AMGB4
// PORT: Fixed ROM slots 20113.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:950
//# Page 1023
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:951
//		TS	AK1
// PORT: Fixed ROM slots 20114.
                                if slot <> 20114 or instruction <> 23359 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:952
//		CA	T5TEMP
// PORT: Fixed ROM slots 20115.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:953
//		EXTEND
// PORT: Fixed ROM slots 20116.
                            if slot <> 20116 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:954
//		MP	AMGB7
// PORT: Fixed ROM slots 20117.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:955
//		TS	AK2
// PORT: Fixed ROM slots 20118.
                            if slot <> 20118 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20119 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:956
//		CA	WTEMP +1
// PORT: Fixed ROM slots 20119.
                                if slot <> 20119 or instruction <> 13132 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 844).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:957
//		EXTEND
// PORT: Fixed ROM slots 20120.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:958
//		MSU	CDUZ
// PORT: Fixed ROM slots 20121.
                            if slot <> 20121 or instruction <> 8220 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:959
//		TS	T5TEMP
// PORT: Fixed ROM slots 20122.
                            if slot <> 20122 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20123 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:960
//		EXTEND
// PORT: Fixed ROM slots 20123.
                            if slot <> 20123 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20124 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:961
//		MP	AMGB5
// PORT: Fixed ROM slots 20124.
                                if slot <> 20124 or instruction <> 29602 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 930, readEffective:call(words, 930)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:962
//		ADS	AK1
// PORT: Fixed ROM slots 20125.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:963
//		CA	T5TEMP
// PORT: Fixed ROM slots 20126.
                            if slot <> 20126 or instruction <> 13122 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 834).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:964
//		EXTEND
// PORT: Fixed ROM slots 20127.
                            if slot <> 20127 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 20128 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:965
//		MP	AMGB8
// PORT: Fixed ROM slots 20128.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:966
//		ADS	AK2
// PORT: Fixed ROM slots 20129.
                                if slot <> 20129 or instruction <> 12096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 832).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:967
//		TCF	RESUME		# END PHASE1 OF RCS DAP
// PORT: Fixed ROM slots 20130.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:968
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:969
//WRTN17		EXTEND			# GET SET TO COMPUTE TOTAL ASTRONAUT
// PORT: Fixed ROM slots 20131.
                            if slot <> 20131 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:970
//		DCA	CPHIX +1	# ATTITUDE ERROR WRT N17 BY PICKING UP
// PORT: Fixed ROM slots 20132.
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
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:971
//		DXCH	WTEMP		# THE THREE COMPONENTS OF N17
// PORT: Fixed ROM slots 20133.
                            if slot <> 20133 or instruction <> 22348 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 844, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 20134 {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:972
//		CA	CPHIX
// PORT: Fixed ROM slots 20134.
                                if slot <> 20134 or instruction <> 13019 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 731).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:973
//		TCF	GETAKS
// PORT: Fixed ROM slots 20135.
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

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:974
//
// PORT: SOURCE RCS-CSM_DIGITAL_AUTOPILOT.agc:975
//# Page 1024 (empty page)
