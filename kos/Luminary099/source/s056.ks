// PORT: Original source unit P70-P71.agc.
// PORT: Physical bank 21. Shared continuation entries, slots 19462–19471.
function agcAotUnit1186 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19466 {
        if slot <= 19463 {
            if slot <= 19462 {
// PORT: SOURCE P70-P71.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P70-P71.agc:2
//# Filename:	P70-P71.agc
// PORT: SOURCE P70-P71.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P70-P71.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P70-P71.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P70-P71.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P70-P71.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE P70-P71.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P70-P71.agc:9
//# Pages:	829-837
// PORT: SOURCE P70-P71.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// PORT: SOURCE P70-P71.agc:11
//#		2009-06-05 RSB	Fixed a typo.
// PORT: SOURCE P70-P71.agc:12
//#
// PORT: SOURCE P70-P71.agc:13
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P70-P71.agc:14
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P70-P71.agc:15
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P70-P71.agc:16
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P70-P71.agc:17
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P70-P71.agc:18
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P70-P71.agc:19
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P70-P71.agc:20
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P70-P71.agc:21
//# actually created.
// PORT: SOURCE P70-P71.agc:22
//#
// PORT: SOURCE P70-P71.agc:23
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P70-P71.agc:24
//#
// PORT: SOURCE P70-P71.agc:25
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P70-P71.agc:26
//#	16:27 JULY 14, 1969
// PORT: SOURCE P70-P71.agc:27
//
// PORT: SOURCE P70-P71.agc:28
//# Page 829
// PORT: SOURCE P70-P71.agc:29
//		BANK	21
// PORT: SOURCE P70-P71.agc:30
//		SETLOC	R11
// PORT: SOURCE P70-P71.agc:31
//		BANK
// PORT: SOURCE P70-P71.agc:32
//
// PORT: SOURCE P70-P71.agc:33
//		EBANK=	DVCNTR
// PORT: SOURCE P70-P71.agc:34
//		COUNT*	$$/R11
// PORT: SOURCE P70-P71.agc:35
//
// PORT: SOURCE P70-P71.agc:36
//R10,R11		CS	FLAGWRD7	# IS SERVICER STILL RUNNING?
// PORT: Fixed ROM slots 19462.
                if slot <> 19462 or instruction <> 16451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 67).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:37
//		MASK	AVEGFBIT
// PORT: Fixed ROM slots 19463.
                if slot <> 19463 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 19464 {
// PORT: SOURCE P70-P71.agc:38
//		CCS	A
// PORT: Fixed ROM slots 19464.
                if slot <> 19464 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19465 {
// PORT: SOURCE P70-P71.agc:39
//		TCF	TASKOVER	# LET AVGEND TAKE CARE OF GROUP 2.
// PORT: Fixed ROM slots 19465.
                    if slot <> 19465 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:40
//		CCS	PIPCTR
// PORT: Fixed ROM slots 19466.
                    if slot <> 19466 or instruction <> 4654 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 558).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19468 {
            if slot <= 19467 {
// PORT: SOURCE P70-P71.agc:41
//		TCF	+2
// PORT: Fixed ROM slots 19467.
                if slot <> 19467 or instruction <> 5133 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5133, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:42
//		TCF	LRHTASK		# LAST PASS. CALL LRHTASK.
// PORT: Fixed ROM slots 19468.
                if slot <> 19468 or instruction <> 5208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5208, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19469 {
// PORT: SOURCE P70-P71.agc:43
// +2		TS	PIPCTR1
// PORT: Fixed ROM slots 19469.
                if slot <> 19469 or instruction <> 23500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23500, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19470 {
// PORT: SOURCE P70-P71.agc:44
//
// PORT: SOURCE P70-P71.agc:45
//PIPCTR1		=	LADQSAVE
// PORT: SOURCE P70-P71.agc:46
//PIPCTR		=	PHSPRDT2
// PORT: SOURCE P70-P71.agc:47
//		CAF	OCT31
// PORT: Fixed ROM slots 19470.
                    if slot <> 19470 or instruction <> 15368 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3080), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:48
//		TC	TWIDDLE
// PORT: Fixed ROM slots 19471.
                    if slot <> 19471 or instruction <> 2683 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2683, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1186] to agcAotUnit1186@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:49
//		ADRES	R10,R11
// PORT: Fixed ROM slots 19472.
    19472, 2060
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19473–19523.
function agcAotUnit1187 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19497 {
        if slot <= 19484 {
            if slot <= 19478 {
                if slot <= 19475 {
                    if slot <= 19473 {
// PORT: SOURCE P70-P71.agc:50
//R10,R11A	CS	IMODES33	# IF LAMP TEST, DO NOT CHANGE LR LITES.
// PORT: Fixed ROM slots 19473.
                        if slot <> 19473 or instruction <> 17091 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 707).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19474 {
// PORT: SOURCE P70-P71.agc:51
//		MASK	BIT1
// PORT: Fixed ROM slots 19474.
                            if slot <> 19474 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P70-P71.agc:52
//		EXTEND
// PORT: Fixed ROM slots 19475.
                            if slot <> 19475 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19476 {
// PORT: SOURCE P70-P71.agc:53
//		BZF	10,11
// PORT: Fixed ROM slots 19476.
                        if slot <> 19476 or instruction <> 5154 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5154, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19477 {
// PORT: SOURCE P70-P71.agc:54
//
// PORT: SOURCE P70-P71.agc:55
//FLASHH?		MASK	FLGWRD11	# C(A) = 1 = HFLASH BIT
// PORT: Fixed ROM slots 19477.
                            if slot <> 19477 or instruction <> 28743 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 71).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:56
//		EXTEND
// PORT: Fixed ROM slots 19478.
                            if slot <> 19478 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19481 {
                    if slot <= 19479 {
// PORT: SOURCE P70-P71.agc:57
//		BZF	FLASHV?		# H FLASH OFF, SO LEAVE ALONE
// PORT: Fixed ROM slots 19479.
                        if slot <> 19479 or instruction <> 5147 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5147, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19480 {
// PORT: SOURCE P70-P71.agc:58
//
// PORT: SOURCE P70-P71.agc:59
//		CA	HLITE
// PORT: Fixed ROM slots 19480.
                            if slot <> 19480 or instruction <> 14823 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:60
//		TS	L
// PORT: Fixed ROM slots 19481.
                            if slot <> 19481 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19482 {
// PORT: SOURCE P70-P71.agc:61
//		TC	FLIP		# FLIP H LITE
// PORT: Fixed ROM slots 19482.
                        if slot <> 19482 or instruction <> 2438 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2438, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19483 {
// PORT: SOURCE P70-P71.agc:62
//
// PORT: SOURCE P70-P71.agc:63
//FLASHV?		CA	VFLSHBIT	# VLASHBIT MUST BE BIT 2.
// PORT: Fixed ROM slots 19483.
                            if slot <> 19483 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:64
//		MASK	FLGWRD11
// PORT: Fixed ROM slots 19484.
                            if slot <> 19484 or instruction <> 28743 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 71).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19490 {
                if slot <= 19487 {
                    if slot <= 19485 {
// PORT: SOURCE P70-P71.agc:65
//		EXTEND
// PORT: Fixed ROM slots 19485.
                        if slot <> 19485 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19486 {
// PORT: SOURCE P70-P71.agc:66
//		BZF	10,11		# V FLASH OFF
// PORT: Fixed ROM slots 19486.
                            if slot <> 19486 or instruction <> 5154 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5154, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:67
//
// PORT: SOURCE P70-P71.agc:68
//		CA	VLITE
// PORT: Fixed ROM slots 19487.
                            if slot <> 19487 or instruction <> 14825 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19488 {
// PORT: SOURCE P70-P71.agc:69
//		TS	L
// PORT: Fixed ROM slots 19488.
                        if slot <> 19488 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19489 {
// PORT: SOURCE P70-P71.agc:70
//		TC	FLIP		# FLIP V LITE
// PORT: Fixed ROM slots 19489.
                            if slot <> 19489 or instruction <> 2438 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2438, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:71
//
// PORT: SOURCE P70-P71.agc:72
//10,11		CA	FLAGWRD9	# IS THE LETABORT FLAG SET ?
// PORT: Fixed ROM slots 19490.
                            if slot <> 19490 or instruction <> 12357 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 69).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19493 {
                    if slot <= 19491 {
// PORT: SOURCE P70-P71.agc:73
//		MASK	LETABBIT
// PORT: Fixed ROM slots 19491.
                        if slot <> 19491 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
                    } else {
                        if slot <= 19492 {
// PORT: SOURCE P70-P71.agc:74
//		EXTEND
// PORT: Fixed ROM slots 19492.
                            if slot <> 19492 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:75
//		BZF	LANDISP		# NO.  PROCEED TO R10.
// PORT: Fixed ROM slots 19493.
                            if slot <> 19493 or instruction <> 5228 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5228, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19495 {
                        if slot <= 19494 {
// PORT: SOURCE P70-P71.agc:76
//
// PORT: SOURCE P70-P71.agc:77
//P71NOW?		CS	MODREG		# YES.  ARE WE IN P71 NOW?
// PORT: Fixed ROM slots 19494.
                            if slot <> 19494 or instruction <> 16905 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 521).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:78
//# Page 830
// PORT: SOURCE P70-P71.agc:79
//		AD	1DEC71
// PORT: Fixed ROM slots 19495.
                            if slot <> 19495 or instruction <> 25671 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1095), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19496 {
// PORT: SOURCE P70-P71.agc:80
//		EXTEND
// PORT: Fixed ROM slots 19496.
                            if slot <> 19496 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:81
//		BZF	LANDISP		# YES.  PROCEED TO R10.
// PORT: Fixed ROM slots 19497.
                            if slot <> 19497 or instruction <> 5228 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5228, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19510 {
            if slot <= 19503 {
                if slot <= 19500 {
                    if slot <= 19498 {
// PORT: SOURCE P70-P71.agc:82
//
// PORT: SOURCE P70-P71.agc:83
//		EXTEND			# NO.  IS AN ABORT STAGE COMMANDED?
// PORT: Fixed ROM slots 19498.
                        if slot <> 19498 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19499 {
// PORT: SOURCE P70-P71.agc:84
//		READ	CHAN30
// PORT: Fixed ROM slots 19499.
                            if slot <> 19499 or instruction <> 24 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 0, 24, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:85
//		COM
// PORT: Fixed ROM slots 19500.
                            if slot <> 19500 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19501 {
// PORT: SOURCE P70-P71.agc:86
//		TS	L
// PORT: Fixed ROM slots 19501.
                        if slot <> 19501 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19502 {
// PORT: SOURCE P70-P71.agc:87
//		MASK	BIT4
// PORT: Fixed ROM slots 19502.
                            if slot <> 19502 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P70-P71.agc:88
//		CCS	A
// PORT: Fixed ROM slots 19503.
                            if slot <> 19503 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19506 {
                    if slot <= 19504 {
// PORT: SOURCE P70-P71.agc:89
//		TCF	P71A		# YES.
// PORT: Fixed ROM slots 19504.
                        if slot <> 19504 or instruction <> 5182 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5182, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19505 {
// PORT: SOURCE P70-P71.agc:90
//
// PORT: SOURCE P70-P71.agc:91
//P70NOW?		CS	MODREG		# NO.  ARE WE IN P70 NOW?
// PORT: Fixed ROM slots 19505.
                            if slot <> 19505 or instruction <> 16905 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 521).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:92
//		AD	1DEC70
// PORT: Fixed ROM slots 19506.
                            if slot <> 19506 or instruction <> 25670 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1094), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19508 {
                        if slot <= 19507 {
// PORT: SOURCE P70-P71.agc:93
//		EXTEND
// PORT: Fixed ROM slots 19507.
                            if slot <> 19507 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:94
//		BZF	LANDISP		# YES.  PROCEED TO R10.
// PORT: Fixed ROM slots 19508.
                            if slot <> 19508 or instruction <> 5228 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5228, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19509 {
// PORT: SOURCE P70-P71.agc:95
//
// PORT: SOURCE P70-P71.agc:96
//		CA	L		# NO.  IS AN ABORT COMMANDED?
// PORT: Fixed ROM slots 19509.
                            if slot <> 19509 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:97
//		MASK	BIT1
// PORT: Fixed ROM slots 19510.
                            if slot <> 19510 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        } else {
            if slot <= 19516 {
                if slot <= 19513 {
                    if slot <= 19511 {
// PORT: SOURCE P70-P71.agc:98
//		CCS	A
// PORT: Fixed ROM slots 19511.
                        if slot <> 19511 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19512 {
// PORT: SOURCE P70-P71.agc:99
//		TCF	P70A		# YES.
// PORT: Fixed ROM slots 19512.
                            if slot <> 19512 or instruction <> 5179 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5179, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:100
//		TCF	LANDISP		# NO.  PROCEED TO R10.
// PORT: Fixed ROM slots 19513.
                            if slot <> 19513 or instruction <> 5228 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5228, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19514 {
// PORT: SOURCE P70-P71.agc:101
//
// PORT: SOURCE P70-P71.agc:102
//		COUNT*	$$/P70
// PORT: SOURCE P70-P71.agc:103
//
// PORT: SOURCE P70-P71.agc:104
//P70		TC	LEGAL?
// PORT: Fixed ROM slots 19514.
                        if slot <> 19514 or instruction <> 1096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1096, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19515 {
// PORT: SOURCE P70-P71.agc:105
//P70A		CS	ZERO
// PORT: Fixed ROM slots 19515.
                            if slot <> 19515 or instruction <> 18925 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:106
//		TCF	+3
// PORT: Fixed ROM slots 19516.
                            if slot <> 19516 or instruction <> 5183 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5183, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19519 {
                    if slot <= 19517 {
// PORT: SOURCE P70-P71.agc:107
//P71		TC	LEGAL?
// PORT: Fixed ROM slots 19517.
                        if slot <> 19517 or instruction <> 1096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1096, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19518 {
// PORT: SOURCE P70-P71.agc:108
//P71A		CAF	TWO
// PORT: Fixed ROM slots 19518.
                            if slot <> 19518 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:109
// +3		TS	Q
// PORT: Fixed ROM slots 19519.
                            if slot <> 19519 or instruction <> 22530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19521 {
                        if slot <= 19520 {
// PORT: SOURCE P70-P71.agc:110
// 		INHINT
// PORT: Fixed ROM slots 19520.
                            if slot <> 19520 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:111
//		EXTEND
// PORT: Fixed ROM slots 19521.
                            if slot <> 19521 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19522 {
// PORT: SOURCE P70-P71.agc:112
//		DCA	CNTABTAD
// PORT: Fixed ROM slots 19522.
                            if slot <> 19522 or instruction <> 13381 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1093, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:113
//		DTCB
// PORT: Fixed ROM slots 19523.
                            if slot <> 19523 or instruction <> 21510 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
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
set agcAotRoutes[1187] to agcAotUnit1187@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:114
//
// PORT: SOURCE P70-P71.agc:115
//		EBANK=	DVCNTR
// PORT: SOURCE P70-P71.agc:116
//CNTABTAD	2CADR	CONTABRT
// PORT: Fixed ROM slots 19524 19525.
    19524, 3588, 19525, 10350,
// PORT: SOURCE P70-P71.agc:117
//
// PORT: SOURCE P70-P71.agc:118
//1DEC70		DEC	70
// PORT: Fixed ROM slots 19526.
    19526, 140,
// PORT: SOURCE P70-P71.agc:119
//1DEC71		DEC	71
// PORT: Fixed ROM slots 19527.
    19527, 142
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7938–7947.
function agcAotUnit445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7942 {
        if slot <= 7939 {
            if slot <= 7938 {
// PORT: SOURCE P70-P71.agc:120
//
// PORT: SOURCE P70-P71.agc:121
//		BANK	05
// PORT: SOURCE P70-P71.agc:122
//		SETLOC	ABORTS1
// PORT: SOURCE P70-P71.agc:123
//		BANK
// PORT: SOURCE P70-P71.agc:124
//		COUNT*	$$/P70
// PORT: SOURCE P70-P71.agc:125
//
// PORT: SOURCE P70-P71.agc:126
//CONTABRT	CAF	ABRTJADR
// PORT: Fixed ROM slots 7938.
                if slot <> 7938 or instruction <> 14085 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1797), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:127
//		TS	BRUPT
// PORT: Fixed ROM slots 7939.
                if slot <> 7939 or instruction <> 22543 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22543, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7940 {
// PORT: SOURCE P70-P71.agc:128
//		RESUME
// PORT: Fixed ROM slots 7940.
                if slot <> 7940 or instruction <> 20495 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20495, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7941 {
// PORT: SOURCE P70-P71.agc:129
//# Page 831
// PORT: SOURCE P70-P71.agc:130
//
// PORT: SOURCE P70-P71.agc:131
//ABRTJADR	TCF	ABRTJASK
// PORT: Fixed ROM slots 7941.
                    if slot <> 7941 or instruction <> 5894 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5894, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:132
//
// PORT: SOURCE P70-P71.agc:133
//ABRTJASK	CAF	OCTAL27
// PORT: Fixed ROM slots 7942.
                    if slot <> 7942 or instruction <> 14143 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1855), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7944 {
            if slot <= 7943 {
// PORT: SOURCE P70-P71.agc:134
//		AD	Q
// PORT: Fixed ROM slots 7943.
                if slot <> 7943 or instruction <> 24578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:135
//		TS	L
// PORT: Fixed ROM slots 7944.
                if slot <> 7944 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7945 {
// PORT: SOURCE P70-P71.agc:136
//		COM
// PORT: Fixed ROM slots 7945.
                if slot <> 7945 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7946 {
// PORT: SOURCE P70-P71.agc:137
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 7946.
                    if slot <> 7946 or instruction <> 22001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:138
//		INDEX	Q
// PORT: Fixed ROM slots 7947.
                    if slot <> 7947 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[445] to agcAotUnit445@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:139
//		CAF	MODE70
// PORT: Fixed ROM slots 7948.
    7948, 28284
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7949–7994.
function agcAotUnit446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7971 {
        if slot <= 7959 {
            if slot <= 7953 {
                if slot <= 7950 {
                    if slot <= 7949 {
// PORT: SOURCE P70-P71.agc:140
//		TS	MODREG
// PORT: Fixed ROM slots 7949.
                        if slot <> 7949 or instruction <> 23049 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23049, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P70-P71.agc:141
//
// PORT: SOURCE P70-P71.agc:142
//		TS	DISPDEX		# INSURE DISPDEX IS POSITIVE.
// PORT: Fixed ROM slots 7950.
                        if slot <> 7950 or instruction <> 23155 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23155, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7951 {
// PORT: SOURCE P70-P71.agc:143
//
// PORT: SOURCE P70-P71.agc:144
//		CCS	Q		# SET APSFLAG IF P71.
// PORT: Fixed ROM slots 7951.
                        if slot <> 7951 or instruction <> 4098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7952 {
// PORT: SOURCE P70-P71.agc:145
//		CS	FLGWRD10	# SET APSFLAG PRIOR TO THE ENEMA.
// PORT: Fixed ROM slots 7952.
                            if slot <> 7952 or instruction <> 16454 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 70).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:146
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 7953.
                            if slot <> 7953 or instruction <> 31199 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                if fixedOperand = 4096 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
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
                if slot <= 7956 {
                    if slot <= 7954 {
// PORT: SOURCE P70-P71.agc:147
//		ADS	FLGWRD10
// PORT: Fixed ROM slots 7954.
                        if slot <> 7954 or instruction <> 11334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 70).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7955 {
// PORT: SOURCE P70-P71.agc:148
//		CS	DAPBITS		# DAPBITS = OCT 640 = BITS 6, 8, 9
// PORT: Fixed ROM slots 7955.
                            if slot <> 7955 or instruction <> 18241 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1857), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:149
//		MASK	DAPBOOLS	# (TURN OFF: ULLAGE, DRIFT, AND XOVINHIB )
// PORT: Fixed ROM slots 7956.
                            if slot <> 7956 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7957 {
// PORT: SOURCE P70-P71.agc:150
//		TS	DAPBOOLS
// PORT: Fixed ROM slots 7957.
                        if slot <> 7957 or instruction <> 22601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22601, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7958 {
// PORT: SOURCE P70-P71.agc:151
//
// PORT: SOURCE P70-P71.agc:152
//		CS	FLAGWRD5	# SET ENGONFLG.
// PORT: Fixed ROM slots 7958.
                            if slot <> 7958 or instruction <> 16449 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 65).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:153
//		MASK	ENGONBIT
// PORT: Fixed ROM slots 7959.
                            if slot <> 7959 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            }
        } else {
            if slot <= 7965 {
                if slot <= 7962 {
                    if slot <= 7960 {
// PORT: SOURCE P70-P71.agc:154
//		ADS	FLAGWRD5
// PORT: Fixed ROM slots 7960.
                        if slot <> 7960 or instruction <> 11329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7961 {
// PORT: SOURCE P70-P71.agc:155
//
// PORT: SOURCE P70-P71.agc:156
//		CS	PRIO30		# INSURE THAT THE ENGINE IS ON, IF ARMED.
// PORT: Fixed ROM slots 7961.
                            if slot <> 7961 or instruction <> 18669 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:157
//		EXTEND
// PORT: Fixed ROM slots 7962.
                            if slot <> 7962 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7963 {
// PORT: SOURCE P70-P71.agc:158
//		RAND	DSALMOUT
// PORT: Fixed ROM slots 7963.
                        if slot <> 7963 or instruction <> 1033 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7964 {
// PORT: SOURCE P70-P71.agc:159
//		AD	BIT13
// PORT: Fixed ROM slots 7964.
                            if slot <> 7964 or instruction <> 27103 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:160
//		EXTEND
// PORT: Fixed ROM slots 7965.
                            if slot <> 7965 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7968 {
                    if slot <= 7966 {
// PORT: SOURCE P70-P71.agc:161
//		WRITE	DSALMOUT
// PORT: Fixed ROM slots 7966.
                        if slot <> 7966 or instruction <> 521 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7967 {
// PORT: SOURCE P70-P71.agc:162
//
// PORT: SOURCE P70-P71.agc:163
//		CAF	LRBYBIT		# TERMINATE R12.
// PORT: Fixed ROM slots 7967.
                            if slot <> 7967 or instruction <> 14813 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:164
//		TS	FLGWRD11
// PORT: Fixed ROM slots 7968.
                            if slot <> 7968 or instruction <> 22599 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22599, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7969 {
// PORT: SOURCE P70-P71.agc:165
//
// PORT: SOURCE P70-P71.agc:166
//		CS	FLAGWRD0	# SET R10FLAG TO SUPPRESS OUTPUTS TO THE
// PORT: Fixed ROM slots 7969.
                        if slot <> 7969 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7970 {
// PORT: SOURCE P70-P71.agc:167
//		MASK	R10FLBIT	# CROSS-POINTER DISPLAY.
// PORT: Fixed ROM slots 7970.
                            if slot <> 7970 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P70-P71.agc:168
//		ADS	FLAGWRD0	# THE FOLLOWING ENEMA WILL REMOVE THE
// PORT: Fixed ROM slots 7971.
                            if slot <> 7971 or instruction <> 11324 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 60).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 7982 {
            if slot <= 7976 {
                if slot <= 7973 {
                    if slot <= 7972 {
// PORT: SOURCE P70-P71.agc:169
//					# DISPLAY INERTIAL DATA OUTBIT.
// PORT: SOURCE P70-P71.agc:170
//
// PORT: SOURCE P70-P71.agc:171
//		TC	CLRADMOD	# INSURE RADMODES PROPERLY SET FOR R29.
// PORT: Fixed ROM slots 7972.
                        if slot <> 7972 or instruction <> 3081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P70-P71.agc:172
//
// PORT: SOURCE P70-P71.agc:173
//		EXTEND			# LOAD TEVENT FOR THE DOWNLINK.
// PORT: Fixed ROM slots 7973.
                        if slot <> 7973 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7974 {
// PORT: SOURCE P70-P71.agc:174
//		DCA	TIME2
// PORT: Fixed ROM slots 7974.
                        if slot <> 7974 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7975 {
// PORT: SOURCE P70-P71.agc:175
//		DXCH	TEVENT
// PORT: Fixed ROM slots 7975.
                            if slot <> 7975 or instruction <> 22245 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 741, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:176
//
// PORT: SOURCE P70-P71.agc:177
//		EXTEND
// PORT: Fixed ROM slots 7976.
                            if slot <> 7976 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7979 {
                    if slot <= 7977 {
// PORT: SOURCE P70-P71.agc:178
//		DCA	SVEXITAD
// PORT: Fixed ROM slots 7977.
                        if slot <> 7977 or instruction <> 14141 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1853, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7978 {
// PORT: SOURCE P70-P71.agc:179
//		DXCH	AVGEXIT
// PORT: Fixed ROM slots 7978.
                            if slot <> 7978 or instruction <> 22187 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:180
//
// PORT: SOURCE P70-P71.agc:181
//# Page 832
// PORT: SOURCE P70-P71.agc:182
//		EXTEND
// PORT: Fixed ROM slots 7979.
                            if slot <> 7979 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7980 {
// PORT: SOURCE P70-P71.agc:183
//		DCA	NEG0
// PORT: Fixed ROM slots 7980.
                        if slot <> 7980 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7981 {
// PORT: SOURCE P70-P71.agc:184
//		DXCH	-PHASE1
// PORT: Fixed ROM slots 7981.
                            if slot <> 7981 or instruction <> 21995 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:185
//
// PORT: SOURCE P70-P71.agc:186
//		EXTEND
// PORT: Fixed ROM slots 7982.
                            if slot <> 7982 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 7988 {
                if slot <= 7985 {
                    if slot <= 7983 {
// PORT: SOURCE P70-P71.agc:187
//		DCA	NEG0
// PORT: Fixed ROM slots 7983.
                        if slot <> 7983 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7984 {
// PORT: SOURCE P70-P71.agc:188
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 7984.
                            if slot <> 7984 or instruction <> 21999 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:189
//
// PORT: SOURCE P70-P71.agc:190
//		EXTEND
// PORT: Fixed ROM slots 7985.
                            if slot <> 7985 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7986 {
// PORT: SOURCE P70-P71.agc:191
//		DCA	NEG0
// PORT: Fixed ROM slots 7986.
                        if slot <> 7986 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7987 {
// PORT: SOURCE P70-P71.agc:192
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 7987.
                            if slot <> 7987 or instruction <> 22005 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:193
//
// PORT: SOURCE P70-P71.agc:194
//		CAF	THREE		# SET UP 4.3SPOT FOR GOABORT
// PORT: Fixed ROM slots 7988.
                            if slot <> 7988 or instruction <> 15525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7991 {
                    if slot <= 7989 {
// PORT: SOURCE P70-P71.agc:195
//		TS	L
// PORT: Fixed ROM slots 7989.
                        if slot <> 7989 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7990 {
// PORT: SOURCE P70-P71.agc:196
//		COM
// PORT: Fixed ROM slots 7990.
                            if slot <> 7990 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:197
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 7991.
                            if slot <> 7991 or instruction <> 22001 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7992 {
// PORT: SOURCE P70-P71.agc:198
//
// PORT: SOURCE P70-P71.agc:199
//		CAF	OCT37774	# SET T5RUPT TO CALL DAPIDLER IN
// PORT: Fixed ROM slots 7992.
                        if slot <> 7992 or instruction <> 16344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4056), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7993 {
// PORT: SOURCE P70-P71.agc:200
//		TS	TIME5		# 40 MILLISECONDS.
// PORT: Fixed ROM slots 7993.
                            if slot <> 7993 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE P70-P71.agc:201
//
// PORT: SOURCE P70-P71.agc:202
//		TC	POSTJUMP
// PORT: Fixed ROM slots 7994.
                            if slot <> 7994 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[446] to agcAotUnit446@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:203
//		CADR	ENEMA
// PORT: Fixed ROM slots 7995.
    7995, 11242,
// PORT: SOURCE P70-P71.agc:204
//
// PORT: SOURCE P70-P71.agc:205
//		EBANK=	DVCNTR
// PORT: SOURCE P70-P71.agc:206
//SVEXITAD	2CADR	SERVEXIT
// PORT: Fixed ROM slots 7996 7997.
    7996, 4080, 7997, 53358,
// PORT: SOURCE P70-P71.agc:207
//
// PORT: SOURCE P70-P71.agc:208
//MODE70		DEC	70
// PORT: Fixed ROM slots 7998.
    7998, 140,
// PORT: SOURCE P70-P71.agc:209
//OCTAL27		OCT	27
// PORT: Fixed ROM slots 7999.
    7999, 46,
// PORT: SOURCE P70-P71.agc:210
//MODE71		DEC	71
// PORT: Fixed ROM slots 8000.
    8000, 142,
// PORT: SOURCE P70-P71.agc:211
//
// PORT: SOURCE P70-P71.agc:212
//DAPBITS		OCT	00640
// PORT: Fixed ROM slots 8001.
    8001, 832
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29536–29536.
function agcAotUnit1890 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:213
//
// PORT: SOURCE P70-P71.agc:214
//		BANK	32
// PORT: SOURCE P70-P71.agc:215
//		SETLOC	ABORTS
// PORT: SOURCE P70-P71.agc:216
//		BANK
// PORT: SOURCE P70-P71.agc:217
//
// PORT: SOURCE P70-P71.agc:218
//		COUNT*	$$/P70
// PORT: SOURCE P70-P71.agc:219
//
// PORT: SOURCE P70-P71.agc:220
//GOABORT		TC	INTPRET
// PORT: Fixed ROM slots 29536.
    if slot <> 29536 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1890] to agcAotUnit1890@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:221
//		CALL
// PORT: Fixed ROM slots 29537.
    29537, 65320,
// PORT: SOURCE P70-P71.agc:222
//			INITCDUW
// PORT: Fixed ROM slots 29538.
    29538, 50312,
// PORT: SOURCE P70-P71.agc:223
//		EXIT
// PORT: Fixed ROM slots 29539.
    29539, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29540–29544.
function agcAotUnit1891 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29541 {
        if slot <= 29540 {
// PORT: SOURCE P70-P71.agc:224
//		CAF	FOUR
// PORT: Fixed ROM slots 29540.
            if slot <> 29540 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P70-P71.agc:225
//		TS	DVCNTR
// PORT: Fixed ROM slots 29541.
            if slot <> 29541 or instruction <> 23373 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23373, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29542 {
// PORT: SOURCE P70-P71.agc:226
//
// PORT: SOURCE P70-P71.agc:227
//		CAF	WHICHADR
// PORT: Fixed ROM slots 29542.
            if slot <> 29542 or instruction <> 14324 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29543 {
// PORT: SOURCE P70-P71.agc:228
//		TS	WHICH
// PORT: Fixed ROM slots 29543.
                if slot <> 29543 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:229
//
// PORT: SOURCE P70-P71.agc:230
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 29544.
                if slot <> 29544 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1891] to agcAotUnit1891@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:231
//		ADRES	FLRCS
// PORT: Fixed ROM slots 29545.
    29545, 280
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29546–29546.
function agcAotUnit1892 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:232
//# Page 833
// PORT: SOURCE P70-P71.agc:233
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 29546.
    if slot <> 29546 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1892] to agcAotUnit1892@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:234
//		ADRES	FLUNDISP
// PORT: Fixed ROM slots 29547.
    29547, 250
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29548–29548.
function agcAotUnit1893 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:235
//
// PORT: SOURCE P70-P71.agc:236
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 29548.
    if slot <> 29548 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1893] to agcAotUnit1893@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:237
//		ADRES	IDLEFLAG
// PORT: Fixed ROM slots 29549.
    29549, 226
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29550–29550.
function agcAotUnit1894 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:238
//
// PORT: SOURCE P70-P71.agc:239
//		TC	UPFLAG		# INSURE 4-JET TRANSLATION CAPABILITY.
// PORT: Fixed ROM slots 29550.
    if slot <> 29550 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1894] to agcAotUnit1894@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:240
//		ADRES	ACC4-2FL
// PORT: Fixed ROM slots 29551.
    29551, 398
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29552–29552.
function agcAotUnit1895 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:241
//
// PORT: SOURCE P70-P71.agc:242
//		TC	CHECKMM
// PORT: Fixed ROM slots 29552.
    if slot <> 29552 or instruction <> 2769 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2769, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1895] to agcAotUnit1895@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:243
//70DEC		DEC	70
// PORT: Fixed ROM slots 29553.
    29553, 140
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29554–29555.
function agcAotUnit1896 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29554 {
// PORT: SOURCE P70-P71.agc:244
//		TCF	P71RET
// PORT: Fixed ROM slots 29554.
        if slot <> 29554 or instruction <> 6087 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6087, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P70-P71.agc:245
//
// PORT: SOURCE P70-P71.agc:246
//P70INIT		TC	INTPRET
// PORT: Fixed ROM slots 29555.
        if slot <> 29555 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1896] to agcAotUnit1896@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:247
//		CALL
// PORT: Fixed ROM slots 29556.
    29556, 65320,
// PORT: SOURCE P70-P71.agc:248
//			TGOCOMP
// PORT: Fixed ROM slots 29557.
    29557, 55230,
// PORT: SOURCE P70-P71.agc:249
//		DLOAD	SL
// PORT: Fixed ROM slots 29558.
    29558, 45514,
// PORT: SOURCE P70-P71.agc:250
//			MDOTDPS
// PORT: Fixed ROM slots 29559.
    29559, 28678,
// PORT: SOURCE P70-P71.agc:251
//			4D
// PORT: Fixed ROM slots 29560.
    29560, 16650,
// PORT: SOURCE P70-P71.agc:252
//		BDDV
// PORT: Fixed ROM slots 29561.
    29561, 65386,
// PORT: SOURCE P70-P71.agc:253
//			MASS
// PORT: Fixed ROM slots 29562.
    29562, 1354,
// PORT: SOURCE P70-P71.agc:254
//		STODL	TBUP
// PORT: Fixed ROM slots 29563.
    29563, 14706,
// PORT: SOURCE P70-P71.agc:255
//			MASS
// PORT: Fixed ROM slots 29564.
    29564, 1354,
// PORT: SOURCE P70-P71.agc:256
//		DDV	SR1
// PORT: Fixed ROM slots 29565.
    29565, 57970,
// PORT: SOURCE P70-P71.agc:257
//			K(1/DV)
// PORT: Fixed ROM slots 29566.
    29566, 14362,
// PORT: SOURCE P70-P71.agc:258
//		STORE	1/DV1
// PORT: Fixed ROM slots 29567.
    29567, 3898,
// PORT: SOURCE P70-P71.agc:259
//		STORE	1/DV2
// PORT: Fixed ROM slots 29568.
    29568, 3902,
// PORT: SOURCE P70-P71.agc:260
//		STORE	1/DV3
// PORT: Fixed ROM slots 29569.
    29569, 3906,
// PORT: SOURCE P70-P71.agc:261
//		BDDV
// PORT: Fixed ROM slots 29570.
    29570, 65386,
// PORT: SOURCE P70-P71.agc:262
//			K(AT)
// PORT: Fixed ROM slots 29571.
    29571, 22502,
// PORT: SOURCE P70-P71.agc:263
//		STODL	AT
// PORT: Fixed ROM slots 29572.
    29572, 14694,
// PORT: SOURCE P70-P71.agc:264
//			DTDECAY
// PORT: Fixed ROM slots 29573.
    29573, 28682,
// PORT: SOURCE P70-P71.agc:265
//		DCOMP	SL
// PORT: Fixed ROM slots 29574.
    29574, 45436,
// PORT: SOURCE P70-P71.agc:266
//			11D
// PORT: Fixed ROM slots 29575.
    29575, 16664,
// PORT: SOURCE P70-P71.agc:267
//		STORE	TTO
// PORT: Fixed ROM slots 29576.
    29576, 2414,
// PORT: SOURCE P70-P71.agc:268
//		SLOAD	DCOMP
// PORT: Fixed ROM slots 29577.
    29577, 48826,
// PORT: SOURCE P70-P71.agc:269
//			DPSVEX
// PORT: Fixed ROM slots 29578.
    29578, 22532,
// PORT: SOURCE P70-P71.agc:270
//		SR2
// PORT: Fixed ROM slots 29579.
    29579, 65412,
// PORT: SOURCE P70-P71.agc:271
//		STORE	VE		# INITIALIZE DPS EXHAUST VELOCITY
// PORT: Fixed ROM slots 29580.
    29580, 2410,
// PORT: SOURCE P70-P71.agc:272
//		SET	CALL
// PORT: Fixed ROM slots 29581.
    29581, 37912,
// PORT: SOURCE P70-P71.agc:273
//			FLAP
// PORT: Fixed ROM slots 29582.
    29582, 4718,
// PORT: SOURCE P70-P71.agc:274
//			COMMINIT
// PORT: Fixed ROM slots 29583.
    29583, 49536,
// PORT: SOURCE P70-P71.agc:275
//		AXC,1	GOTO		# RETURN HERE IN P70, SE X1 FOR DPS COEFF.
// PORT: Fixed ROM slots 29584.
    29584, 43232,
// PORT: SOURCE P70-P71.agc:276
//			0D
// PORT: Fixed ROM slots 29585.
    29585, 0,
// PORT: SOURCE P70-P71.agc:277
//			BOTHPOLY
// PORT: Fixed ROM slots 29586.
    29586, 55082,
// PORT: SOURCE P70-P71.agc:278
//INJTARG		AXC,1			# RETURN HERE IN P71, SET X1 FOR APS COEFF
// PORT: Fixed ROM slots 29587.
    29587, 65504,
// PORT: SOURCE P70-P71.agc:279
//			8D
// PORT: Fixed ROM slots 29588.
    29588, 16,
// PORT: SOURCE P70-P71.agc:280
//BOTHPOLY	DLOAD*	DMP		# TGO D
// PORT: Fixed ROM slots 29589.
    29589, 34246,
// PORT: SOURCE P70-P71.agc:281
//			ABTCOF,1
// PORT: Fixed ROM slots 29590.
    29590, 2770,
// PORT: SOURCE P70-P71.agc:282
//			TGO
// PORT: Fixed ROM slots 29591.
    29591, 3742,
// PORT: SOURCE P70-P71.agc:283
//# Page 834
// PORT: SOURCE P70-P71.agc:284
//		DAD*	DMP
// PORT: Fixed ROM slots 29592.
    29592, 34070,
// PORT: SOURCE P70-P71.agc:285
//			ABTCOF +2,1	# TGO(C+TGO D)
// PORT: Fixed ROM slots 29593.
    29593, 2774,
// PORT: SOURCE P70-P71.agc:286
//			TGO
// PORT: Fixed ROM slots 29594.
    29594, 3742,
// PORT: SOURCE P70-P71.agc:287
//		DAD*	DMP
// PORT: Fixed ROM slots 29595.
    29595, 34070,
// PORT: SOURCE P70-P71.agc:288
//			ABTCOF +4,1	# TGO(B+TGO(C+TGO D))
// PORT: Fixed ROM slots 29596.
    29596, 2778,
// PORT: SOURCE P70-P71.agc:289
//			TGO
// PORT: Fixed ROM slots 29597.
    29597, 3742,
// PORT: SOURCE P70-P71.agc:290
//		DAD*
// PORT: Fixed ROM slots 29598.
    29598, 65302,
// PORT: SOURCE P70-P71.agc:291
//			ABTCOF +6,1	# A+TGO(B+TGO(C+TGO D))
// PORT: Fixed ROM slots 29599.
    29599, 2782,
// PORT: SOURCE P70-P71.agc:292
//		STORE	ZDOTD		# STORE TENTATIVELY IN ZDOTD
// PORT: Fixed ROM slots 29600.
    29600, 2430,
// PORT: SOURCE P70-P71.agc:293
//		DSU	BPL		# CHECK AGAINST MINIMUM
// PORT: Fixed ROM slots 29601.
    29601, 42026,
// PORT: SOURCE P70-P71.agc:294
//			VMIN
// PORT: Fixed ROM slots 29602.
    29602, 2802,
// PORT: SOURCE P70-P71.agc:295
//			UPRATE		# IF BIG ENOUGH, LEAVE ZDOTD AS IS .
// PORT: Fixed ROM slots 29603.
    29603, 55118,
// PORT: SOURCE P70-P71.agc:296
//		DLOAD
// PORT: Fixed ROM slots 29604.
    29604, 65482,
// PORT: SOURCE P70-P71.agc:297
//			VMIN
// PORT: Fixed ROM slots 29605.
    29605, 2802,
// PORT: SOURCE P70-P71.agc:298
//		STORE	ZDOTD		# IF TOO SMALL, REPLACE WITH MINIMUM.
// PORT: Fixed ROM slots 29606.
    29606, 2430,
// PORT: SOURCE P70-P71.agc:299
//UPRATE		DLOAD
// PORT: Fixed ROM slots 29607.
    29607, 65482,
// PORT: SOURCE P70-P71.agc:300
//			ABTRDOT
// PORT: Fixed ROM slots 29608.
    29608, 2810,
// PORT: SOURCE P70-P71.agc:301
//		STCALL	RDOTD		# INITIALZE RDOTD.
// PORT: Fixed ROM slots 29609.
    29609, 31094,
// PORT: SOURCE P70-P71.agc:302
//			YCOMP		# COMPUTE Y
// PORT: Fixed ROM slots 29610.
    29610, 48532,
// PORT: SOURCE P70-P71.agc:303
//		ABS	DSU
// PORT: Fixed ROM slots 29611.
    29611, 38220,
// PORT: SOURCE P70-P71.agc:304
//			YLIM		# /Y/-DYMAX
// PORT: Fixed ROM slots 29612.
    29612, 2806,
// PORT: SOURCE P70-P71.agc:305
//		BMN	SIGN		# IF <0, XR<.5DEG, LEAVE YCO AT 0
// PORT: Fixed ROM slots 29613.
    29613, 62784,
// PORT: SOURCE P70-P71.agc:306
//			YOK		# IF >0, FIX SIGN OF DEFICIT, THIS IS YCO.
// PORT: Fixed ROM slots 29614.
    29614, 55138,
// PORT: SOURCE P70-P71.agc:307
//			Y
// PORT: Fixed ROM slots 29615.
    29615, 2490,
// PORT: SOURCE P70-P71.agc:308
//		STORE	YCO
// PORT: Fixed ROM slots 29616.
    29616, 3894,
// PORT: SOURCE P70-P71.agc:309
//YOK		DLOAD	DSU
// PORT: Fixed ROM slots 29617.
    29617, 38346,
// PORT: SOURCE P70-P71.agc:310
//			YCO
// PORT: Fixed ROM slots 29618.
    29618, 3894,
// PORT: SOURCE P70-P71.agc:311
//			Y		# COMPUTE XRANGE IN CASE ASTRONAUT WANTS
// PORT: Fixed ROM slots 29619.
    29619, 2490,
// PORT: SOURCE P70-P71.agc:312
//		SR
// PORT: Fixed ROM slots 29620.
    29620, 65378,
// PORT: SOURCE P70-P71.agc:313
//			5D
// PORT: Fixed ROM slots 29621.
    29621, 17164,
// PORT: SOURCE P70-P71.agc:314
//		STORE	XRANGE		# TO LOOK.
// PORT: Fixed ROM slots 29622.
    29622, 3910,
// PORT: SOURCE P70-P71.agc:315
//UPTHROT		SET	EXIT
// PORT: Fixed ROM slots 29623.
    29623, 65048,
// PORT: SOURCE P70-P71.agc:316
//			FLVR
// PORT: Fixed ROM slots 29624.
    29624, 4706
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29625–29625.
function agcAotUnit1897 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:317
//
// PORT: SOURCE P70-P71.agc:318
//		TC	UPFLAG		# SET ROTFLAG
// PORT: Fixed ROM slots 29625.
    if slot <> 29625 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1897] to agcAotUnit1897@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:319
//		ADRES	ROTFLAG
// PORT: Fixed ROM slots 29626.
    29626, 288
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29627–29628.
function agcAotUnit1898 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29627 {
// PORT: SOURCE P70-P71.agc:320
//
// PORT: SOURCE P70-P71.agc:321
//		TC	THROTUP
// PORT: Fixed ROM slots 29627.
        if slot <> 29627 or instruction <> 2022 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2022, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P70-P71.agc:322
//
// PORT: SOURCE P70-P71.agc:323
//		TC	PHASCHNG
// PORT: Fixed ROM slots 29628.
        if slot <> 29628 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1898] to agcAotUnit1898@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:324
//		OCT	04024
// PORT: Fixed ROM slots 29629.
    29629, 4136
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29630–29630.
function agcAotUnit1899 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:325
//
// PORT: SOURCE P70-P71.agc:326
// -3		TC	BANKCALL	# VERIFY THAT THE PANEL SWITCHES
// PORT: Fixed ROM slots 29630.
    if slot <> 29630 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1899] to agcAotUnit1899@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:327
//		CADR	P40AUTO		# ARE PROPERLY SET.
// PORT: Fixed ROM slots 29631.
    29631, 61390
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29632–29636.
function agcAotUnit1900 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29633 {
        if slot <= 29632 {
// PORT: SOURCE P70-P71.agc:328
//
// PORT: SOURCE P70-P71.agc:329
//		TC	THROTUP
// PORT: Fixed ROM slots 29632.
            if slot <> 29632 or instruction <> 2022 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2022, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P70-P71.agc:330
//
// PORT: SOURCE P70-P71.agc:331
//UPTHROT1	EXTEND			# SET SERVICER TO CALL ASCENT GUIDANCE.
// PORT: Fixed ROM slots 29633.
            if slot <> 29633 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29634 {
// PORT: SOURCE P70-P71.agc:332
//		DCA	ATMAGAD
// PORT: Fixed ROM slots 29634.
            if slot <> 29634 or instruction <> 14326 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2038, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29635 {
// PORT: SOURCE P70-P71.agc:333
//		DXCH	AVGEXIT
// PORT: Fixed ROM slots 29635.
                if slot <> 29635 or instruction <> 22187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:334
//# Page 835
// PORT: SOURCE P70-P71.agc:335
//GRP4OFF		TC	PHASCHNG	# TERMINATE USE OF GROUP 4.
// PORT: Fixed ROM slots 29636.
                if slot <> 29636 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1900] to agcAotUnit1900@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:336
//		OCT	00004
// PORT: Fixed ROM slots 29637.
    29637, 8
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29638–29639.
function agcAotUnit1901 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29638 {
// PORT: SOURCE P70-P71.agc:337
//
// PORT: SOURCE P70-P71.agc:338
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 29638.
        if slot <> 29638 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P70-P71.agc:339
//
// PORT: SOURCE P70-P71.agc:340
//P71RET		TC	DOWNFLAG
// PORT: Fixed ROM slots 29639.
        if slot <> 29639 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1901] to agcAotUnit1901@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:341
//		ADRES	LETABORT
// PORT: Fixed ROM slots 29640.
    29640, 282
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29641–29643.
function agcAotUnit1902 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29641 {
// PORT: SOURCE P70-P71.agc:342
//
// PORT: SOURCE P70-P71.agc:343
//		CAF	THRESH2		# SET DVMON THRESHOLD TO THE ASCENT VALUE.
// PORT: Fixed ROM slots 29641.
        if slot <> 29641 or instruction <> 15360 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3072), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29642 {
// PORT: SOURCE P70-P71.agc:344
//		TS	DVTHRUSH
// PORT: Fixed ROM slots 29642.
            if slot <> 29642 or instruction <> 23209 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23209, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P70-P71.agc:345
//
// PORT: SOURCE P70-P71.agc:346
//		TC	INTPRET
// PORT: Fixed ROM slots 29643.
            if slot <> 29643 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1902] to agcAotUnit1902@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:347
//		BON	CALL
// PORT: Fixed ROM slots 29644.
    29644, 37912,
// PORT: SOURCE P70-P71.agc:348
//			FLAP
// PORT: Fixed ROM slots 29645.
    29645, 5006,
// PORT: SOURCE P70-P71.agc:349
//			OLDTIME
// PORT: Fixed ROM slots 29646.
    29646, 55208,
// PORT: SOURCE P70-P71.agc:350
//			TGOCOMP		# IF FLAP=0, TGO=T-TIG
// PORT: Fixed ROM slots 29647.
    29647, 55230,
// PORT: SOURCE P70-P71.agc:351
//		SSP	GOTO
// PORT: Fixed ROM slots 29648.
    29648, 43186,
// PORT: SOURCE P70-P71.agc:352
//			QPRET
// PORT: Fixed ROM slots 29649.
    29649, 86,
// PORT: SOURCE P70-P71.agc:353
//		CADR	INJTARG
// PORT: Fixed ROM slots 29650.
    29650, 55078,
// PORT: SOURCE P70-P71.agc:354
//			P12INIT		# WILL EXIT P12INIT TO INJTARG
// PORT: Fixed ROM slots 29651.
    29651, 49496,
// PORT: SOURCE P70-P71.agc:355
//OLDTIME		DLOAD	SL1		# IF FLAP=1,GTO=2 TGO
// PORT: Fixed ROM slots 29652.
    29652, 60106,
// PORT: SOURCE P70-P71.agc:356
//			TGO
// PORT: Fixed ROM slots 29653.
    29653, 3742,
// PORT: SOURCE P70-P71.agc:357
//		STCALL	TGO1
// PORT: Fixed ROM slots 29654.
    29654, 32388,
// PORT: SOURCE P70-P71.agc:358
//			P12INIT
// PORT: Fixed ROM slots 29655.
    29655, 49496,
// PORT: SOURCE P70-P71.agc:359
//		EXIT
// PORT: Fixed ROM slots 29656.
    29656, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29657–29657.
function agcAotUnit1903 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P70-P71.agc:360
//		TC	PHASCHNG
// PORT: Fixed ROM slots 29657.
    if slot <> 29657 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1903] to agcAotUnit1903@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:361
//		OCT	04024
// PORT: Fixed ROM slots 29658.
    29658, 4136
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29659–29662.
function agcAotUnit1904 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29660 {
        if slot <= 29659 {
// PORT: SOURCE P70-P71.agc:362
//
// PORT: SOURCE P70-P71.agc:363
//		EXTEND
// PORT: Fixed ROM slots 29659.
            if slot <> 29659 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P70-P71.agc:364
//		DCA	TGO1
// PORT: Fixed ROM slots 29660.
            if slot <> 29660 or instruction <> 13122 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 834, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29661 {
// PORT: SOURCE P70-P71.agc:365
//		DXCH	TGO
// PORT: Fixed ROM slots 29661.
            if slot <> 29661 or instruction <> 22351 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 847, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P70-P71.agc:366
//		TCF	UPTHROT1 -3
// PORT: Fixed ROM slots 29662.
            if slot <> 29662 or instruction <> 6078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1904] to agcAotUnit1904@.

// PORT: Physical bank 21. Shared continuation entries, slots 19528–19542.
function agcAotUnit1188 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19534 {
        if slot <= 19530 {
            if slot <= 19528 {
// PORT: SOURCE P70-P71.agc:367
//
// PORT: SOURCE P70-P71.agc:368
//TGO1		=	VGBODY
// PORT: SOURCE P70-P71.agc:369
//# *************************************************************************
// PORT: SOURCE P70-P71.agc:370
//
// PORT: SOURCE P70-P71.agc:371
//		BANK	21
// PORT: SOURCE P70-P71.agc:372
//		SETLOC	R11
// PORT: SOURCE P70-P71.agc:373
//		BANK
// PORT: SOURCE P70-P71.agc:374
//
// PORT: SOURCE P70-P71.agc:375
//		COUNT*	$$/P70
// PORT: SOURCE P70-P71.agc:376
//
// PORT: SOURCE P70-P71.agc:377
//LEGAL?		CS	MMNUMBER	# IS THE DESIRED PGM ALREADY IN PROGRESS?
// PORT: Fixed ROM slots 19528.
                if slot <> 19528 or instruction <> 16893 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 509).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19529 {
// PORT: SOURCE P70-P71.agc:378
//		AD	MODREG
// PORT: Fixed ROM slots 19529.
                    if slot <> 19529 or instruction <> 25097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:379
//		EXTEND
// PORT: Fixed ROM slots 19530.
                    if slot <> 19530 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19532 {
                if slot <= 19531 {
// PORT: SOURCE P70-P71.agc:380
//		BZF	ABORTALM
// PORT: Fixed ROM slots 19531.
                    if slot <> 19531 or instruction <> 5204 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5204, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:381
//
// PORT: SOURCE P70-P71.agc:382
//		CS	FLAGWRD9	# ARE THE ABORTS ENABLED?
// PORT: Fixed ROM slots 19532.
                    if slot <> 19532 or instruction <> 16453 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 69).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19533 {
// PORT: SOURCE P70-P71.agc:383
//		MASK	LETABBIT
// PORT: Fixed ROM slots 19533.
                    if slot <> 19533 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
                } else {
// PORT: SOURCE P70-P71.agc:384
//		CCS	A
// PORT: Fixed ROM slots 19534.
                    if slot <> 19534 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19538 {
            if slot <= 19536 {
                if slot <= 19535 {
// PORT: SOURCE P70-P71.agc:385
//# Page 836
// PORT: SOURCE P70-P71.agc:386
//		TCF	ABORTALM
// PORT: Fixed ROM slots 19535.
                    if slot <> 19535 or instruction <> 5204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5204, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:387
//
// PORT: SOURCE P70-P71.agc:388
//		CA	FLAGWRD7	# IS SERVICER ON THE AIR?
// PORT: Fixed ROM slots 19536.
                    if slot <> 19536 or instruction <> 12355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 67).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19537 {
// PORT: SOURCE P70-P71.agc:389
//		MASK	AVEGFBIT
// PORT: Fixed ROM slots 19537.
                    if slot <> 19537 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE P70-P71.agc:390
//		CCS	A
// PORT: Fixed ROM slots 19538.
                    if slot <> 19538 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 19540 {
                if slot <= 19539 {
// PORT: SOURCE P70-P71.agc:391
//		TC	Q		# YES.  ALL IS WELL.
// PORT: Fixed ROM slots 19539.
                    if slot <> 19539 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:392
//ABORTALM	TC	FALTON
// PORT: Fixed ROM slots 19540.
                    if slot <> 19540 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19541 {
// PORT: SOURCE P70-P71.agc:393
//		TC	RELDSP
// PORT: Fixed ROM slots 19541.
                    if slot <> 19541 or instruction <> 2351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2351, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P70-P71.agc:394
//		TC	POSTJUMP
// PORT: Fixed ROM slots 19542.
                    if slot <> 19542 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1188] to agcAotUnit1188@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:395
//		CADR	PINBRNCH
// PORT: Fixed ROM slots 19543.
    19543, 17488,
// PORT: SOURCE P70-P71.agc:396
//
// PORT: SOURCE P70-P71.agc:397
//		BANK	32
// PORT: SOURCE P70-P71.agc:398
//		SETLOC	ABORTS
// PORT: SOURCE P70-P71.agc:399
//		BANK
// PORT: SOURCE P70-P71.agc:400
//
// PORT: SOURCE P70-P71.agc:401
//		COUNT*	$$/P70
// PORT: SOURCE P70-P71.agc:402
//
// PORT: SOURCE P70-P71.agc:403
//# ************************************************************************
// PORT: SOURCE P70-P71.agc:404
//
// PORT: SOURCE P70-P71.agc:405
//TGOCOMP		RTB	DSU
// PORT: Fixed ROM slots 29663.
    29663, 38200,
// PORT: SOURCE P70-P71.agc:406
//			LOADTIME
// PORT: Fixed ROM slots 29664.
    29664, 18166,
// PORT: SOURCE P70-P71.agc:407
//			TIG
// PORT: Fixed ROM slots 29665.
    29665, 3652,
// PORT: SOURCE P70-P71.agc:408
//		SL
// PORT: Fixed ROM slots 29666.
    29666, 65378,
// PORT: SOURCE P70-P71.agc:409
//			11D
// PORT: Fixed ROM slots 29667.
    29667, 16664,
// PORT: SOURCE P70-P71.agc:410
//		STORE	TGO
// PORT: Fixed ROM slots 29668.
    29668, 3742,
// PORT: SOURCE P70-P71.agc:411
//		RVQ
// PORT: Fixed ROM slots 29669.
    29669, 65308
)).

// PORT: Physical bank 32. Shared continuation entries, slots 29670–29675.
function agcAotUnit1905 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29672 {
        if slot <= 29670 {
// PORT: SOURCE P70-P71.agc:412
//
// PORT: SOURCE P70-P71.agc:413
//# ************************************************************************
// PORT: SOURCE P70-P71.agc:414
//
// PORT: SOURCE P70-P71.agc:415
//THROTUP		CAF	BIT13
// PORT: Fixed ROM slots 29670.
            if slot <> 29670 or instruction <> 14815 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29671 {
// PORT: SOURCE P70-P71.agc:416
//		TS	THRUST
// PORT: Fixed ROM slots 29671.
                if slot <> 29671 or instruction <> 22573 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22573, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:417
//		CAF	BIT4
// PORT: Fixed ROM slots 29672.
                if slot <> 29672 or instruction <> 14824 { return choose false if checkOnly else -1. }
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
        if slot <= 29673 {
// PORT: SOURCE P70-P71.agc:418
//		EXTEND
// PORT: Fixed ROM slots 29673.
            if slot <> 29673 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29674 {
// PORT: SOURCE P70-P71.agc:419
//		WOR	CHAN14
// PORT: Fixed ROM slots 29674.
                if slot <> 29674 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P70-P71.agc:420
//		TC	Q
// PORT: Fixed ROM slots 29675.
                if slot <> 29675 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1905] to agcAotUnit1905@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P70-P71.agc:421
//
// PORT: SOURCE P70-P71.agc:422
//# ************************************************************************
// PORT: SOURCE P70-P71.agc:423
//
// PORT: SOURCE P70-P71.agc:424
//10SECS		2DEC	1000
// PORT: Fixed ROM slots 29676 29677.
    29676, 0, 29677, 2000,
// PORT: SOURCE P70-P71.agc:425
//
// PORT: SOURCE P70-P71.agc:426
//HINJECT		2DEC	18288 B-24	# 60,000 FEET EXPRESSED IN METERS.
// PORT: Fixed ROM slots 29678 29679.
    29678, 34, 29679, 28160,
// PORT: SOURCE P70-P71.agc:427
//
// PORT: SOURCE P70-P71.agc:428
//(TGO)A		2DEC	37000 B-17
// PORT: Fixed ROM slots 29680 29681.
    29680, 9250, 29681, 0,
// PORT: SOURCE P70-P71.agc:429
//
// PORT: SOURCE P70-P71.agc:430
//K(AT)		2DEC	.02		# SCALING CONSTANT
// PORT: Fixed ROM slots 29682 29683.
    29682, 654, 29683, 22282,
// PORT: SOURCE P70-P71.agc:431
//
// PORT: SOURCE P70-P71.agc:432
//WHICHADR	REMADR	ABRTABLE
// PORT: Fixed ROM slots 29684.
    29684, 2196,
// PORT: SOURCE P70-P71.agc:433
//
// PORT: SOURCE P70-P71.agc:434
//# ************************************************************************
// PORT: SOURCE P70-P71.agc:435
//# Page 837
// PORT: SOURCE P70-P71.agc:436
//		EBANK=	DVCNTR
// PORT: SOURCE P70-P71.agc:437
//ATMAGAD		2CADR	ATMAG
// PORT: Fixed ROM slots 29685 29686.
    29685, 3908, 29686, 57454,
// PORT: SOURCE P70-P71.agc:438
//
// PORT: SOURCE P70-P71.agc:439
//ORBMANAD	ADRES	ORBMANUV
// PORT: Fixed ROM slots 29687.
    29687, 6
)).

