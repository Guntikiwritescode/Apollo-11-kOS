// PORT: Original source unit FRESH_START_AND_RESTART.agc.
// PORT: Physical bank 05. Shared continuation entries, slots 7463–7467.
function agcAotUnit434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7464 {
        if slot <= 7463 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:2
//# Filename:	FRESH_START_AND_RESTART.agc
// PORT: SOURCE FRESH_START_AND_RESTART.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE FRESH_START_AND_RESTART.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:9
//# Pages:	211-237
// PORT: SOURCE FRESH_START_AND_RESTART.agc:10
//# Mod history:	2009-05-19 HG	Transcribed from page images.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:11
//#		2010-12-31 JL	Fixed page number comments.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:12
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:13
//#		2011-01-06 JL	Added missing comment characters.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:14
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:15
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE FRESH_START_AND_RESTART.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE FRESH_START_AND_RESTART.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE FRESH_START_AND_RESTART.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE FRESH_START_AND_RESTART.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE FRESH_START_AND_RESTART.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE FRESH_START_AND_RESTART.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE FRESH_START_AND_RESTART.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE FRESH_START_AND_RESTART.agc:23
//# actually created.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:24
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE FRESH_START_AND_RESTART.agc:26
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE FRESH_START_AND_RESTART.agc:28
//#	16:27 JULY 14, 1969
// PORT: SOURCE FRESH_START_AND_RESTART.agc:29
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:30
//# Page 211
// PORT: SOURCE FRESH_START_AND_RESTART.agc:31
//		BANK	10
// PORT: SOURCE FRESH_START_AND_RESTART.agc:32
//		SETLOC	FRANDRES
// PORT: SOURCE FRESH_START_AND_RESTART.agc:33
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:34
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:35
//		EBANK=	LST1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:36
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:37
//		COUNT*	$$/START	# FRESH AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:38
//SLAP1		INHINT			# FRESH START.  COMES HERE FROM PINBALL.
// PORT: Fixed ROM slots 7463.
            if slot <> 7463 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:39
//		TC	STARTSUB	# SUBROUTINE DOES MOST OF THE WORK
// PORT: Fixed ROM slots 7464.
            if slot <> 7464 or instruction <> 1607 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1607, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7465 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:40
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:41
//STARTSW		TCF	SKIPSIM		# PATCH....TCF STARTSIM FOR SIMULATION
// PORT: Fixed ROM slots 7465.
            if slot <> 7465 or instruction <> 5422 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5422, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7466 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:42
//STARTSIM	CAF	BIT14
// PORT: Fixed ROM slots 7466.
                if slot <> 7466 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:43
//		TC	FINDVAC
// PORT: Fixed ROM slots 7467.
                if slot <> 7467 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[434] to agcAotUnit434@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:44
//SIM2CADR	OCT	77777		# PATCH 2CADR (AND EBANK DESIGNATION) OF
// PORT: Fixed ROM slots 7468.
    7468, 65534,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:45
//		OCT	77777		# SIMULATION START ADDRESS.
// PORT: Fixed ROM slots 7469.
    7469, 65534
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7470–7585.
function agcAotUnit435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7527 {
        if slot <= 7498 {
            if slot <= 7483 {
                if slot <= 7476 {
                    if slot <= 7472 {
                        if slot <= 7470 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:46
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:47
//SKIPSIM		CA	DSPTAB +11D	# TURN OFF ALL DSPTAB +11D LAMPS
// PORT: Fixed ROM slots 7470.
                            if slot <> 7470 or instruction <> 12830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7471 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:48
//		MASK	BITS4&6		# EXCEPT THE GIMBAL LOCK & NO ATT ONLY ON
// PORT: Fixed ROM slots 7471.
                                if slot <> 7471 or instruction <> 31225 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                                    if fixedOperand = 40 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8 + mod(floor(words[0] / 32), 2) * 32).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:49
//		AD	BIT15		# REQUESTED FRESH START.
// PORT: Fixed ROM slots 7472.
                                if slot <> 7472 or instruction <> 27101 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7474 {
                            if slot <= 7473 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:50
//		TS	DSPTAB +11D
// PORT: Fixed ROM slots 7473.
                                if slot <> 7473 or instruction <> 23070 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23070, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:51
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:52
//		CA	BIT12		# INITIALIZE DOWNLINK EARASABLE MEMORY
// PORT: Fixed ROM slots 7474.
                                if slot <> 7474 or instruction <> 14816 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7475 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:53
//		TS	DUMPCNT		# DUMP FOR ONE PASS
// PORT: Fixed ROM slots 7475.
                                if slot <> 7475 or instruction <> 22747 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22747, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:54
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:55
//		CA	ZERO
// PORT: Fixed ROM slots 7476.
                                if slot <> 7476 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 7479 {
                        if slot <= 7477 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:56
//		TS	ERCOUNT
// PORT: Fixed ROM slots 7477.
                            if slot <> 7477 or instruction <> 23285 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23285, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7478 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:57
//		TS	FAILREG
// PORT: Fixed ROM slots 7478.
                                if slot <> 7478 or instruction <> 22781 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22781, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:58
//		TS	FAILREG +1
// PORT: Fixed ROM slots 7479.
                                if slot <> 7479 or instruction <> 22782 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22782, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7481 {
                            if slot <= 7480 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:59
//		TS	FAILREG +2
// PORT: Fixed ROM slots 7480.
                                if slot <> 7480 or instruction <> 22783 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22783, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:60
//		TS	REDOCTR
// PORT: Fixed ROM slots 7481.
                                if slot <> 7481 or instruction <> 22736 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22736, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7482 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:61
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:62
//		CS	PRIO12
// PORT: Fixed ROM slots 7482.
                                if slot <> 7482 or instruction <> 18852 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2468), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:63
//		TS	DSRUPTSW
// PORT: Fixed ROM slots 7483.
                                if slot <> 7483 or instruction <> 23243 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23243, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7490 {
                    if slot <= 7486 {
                        if slot <= 7484 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:64
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:65
//DOFSTART	CAF	BIT14		# INSURE ENGINE IS OFF.
// PORT: Fixed ROM slots 7484.
                            if slot <> 7484 or instruction <> 14814 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7485 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:66
//		EXTEND
// PORT: Fixed ROM slots 7485.
                                if slot <> 7485 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:67
//		WRITE	DSALMOUT
// PORT: Fixed ROM slots 7486.
                                if slot <> 7486 or instruction <> 521 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7488 {
                            if slot <= 7487 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:68
//		CS	ZERO
// PORT: Fixed ROM slots 7487.
                                if slot <> 7487 or instruction <> 18925 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:69
//		TS	THRUST
// PORT: Fixed ROM slots 7488.
                                if slot <> 7488 or instruction <> 22573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22573, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7489 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:70
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:71
//DOFSTRT1	CAF	FOUR
// PORT: Fixed ROM slots 7489.
                                if slot <> 7489 or instruction <> 14825 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:72
//		TS	RCSFLAGS	# INITIALIZE ATTITUDE ERROR DISPLAYS.
// PORT: Fixed ROM slots 7490.
                                if slot <> 7490 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7494 {
                        if slot <= 7492 {
                            if slot <= 7491 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:73
//		CA	PRIO30
// PORT: Fixed ROM slots 7491.
                                if slot <> 7491 or instruction <> 14573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:74
//		TS	RESTREG		# SUPER BANK PRIORITY FOR DISPLAYS.
// PORT: Fixed ROM slots 7492.
                                if slot <> 7492 or instruction <> 22774 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22774, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7493 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:75
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:76
//		CA	ZERO
// PORT: Fixed ROM slots 7493.
                                if slot <> 7493 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:77
//		TS	ABDELV		# DAP INITIALIZATION
// PORT: Fixed ROM slots 7494.
                                if slot <> 7494 or instruction <> 23206 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23206, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7496 {
                            if slot <= 7495 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:78
//		TS	NVSAVE
// PORT: Fixed ROM slots 7495.
                                if slot <> 7495 or instruction <> 22777 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22777, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:79
//		TS	EBANKTEM
// PORT: Fixed ROM slots 7496.
                                if slot <> 7496 or instruction <> 23098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23098, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7497 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:80
//# Page 212
// PORT: SOURCE FRESH_START_AND_RESTART.agc:81
//		TS	CH5MASK
// PORT: Fixed ROM slots 7497.
                                if slot <> 7497 or instruction <> 23218 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23218, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:82
//		TS	CH6MASK
// PORT: Fixed ROM slots 7498.
                                if slot <> 7498 or instruction <> 23219 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23219, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 7512 {
                if slot <= 7505 {
                    if slot <= 7501 {
                        if slot <= 7499 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:83
//		TS	PVALVEST	# FOR RCS FAILURE MONITOR
// PORT: Fixed ROM slots 7499.
                            if slot <> 7499 or instruction <> 23230 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23230, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7500 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:84
//		TS	ERESTORE	# ***** MUST NOT BE REMOVED FROM DOFSTART
// PORT: Fixed ROM slots 7500.
                                if slot <> 7500 or instruction <> 23280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:85
//		TS	SMODE		# ***** MUST NOT BE REMOVED FROM DOFSTART
// PORT: Fixed ROM slots 7501.
                                if slot <> 7501 or instruction <> 23282 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23282, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7503 {
                            if slot <= 7502 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:86
//		TS	DNLSTCOD	# SELECT P00 DOWNLIST
// PORT: Fixed ROM slots 7502.
                                if slot <> 7502 or instruction <> 22746 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22746, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:87
//		TS	AGSWORD		# ALLOW AGS INITIALIZATION
// PORT: Fixed ROM slots 7503.
                                if slot <> 7503 or instruction <> 23252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23252, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7504 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:88
//		TS	UPSVFLAG	# ZERO UPDATE STATE VECTOR REQUEST FLAGWRD
// PORT: Fixed ROM slots 7504.
                                if slot <> 7504 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:89
//		EXTEND
// PORT: Fixed ROM slots 7505.
                                if slot <> 7505 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7508 {
                        if slot <= 7506 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:90
//		WRITE	CHAN5		# TURN OFF RCS JETS.
// PORT: Fixed ROM slots 7506.
                            if slot <> 7506 or instruction <> 517 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7507 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:91
//		EXTEND
// PORT: Fixed ROM slots 7507.
                                if slot <> 7507 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:92
//		WRITE	CHAN6		# TURN OFF RCS JETS.
// PORT: Fixed ROM slots 7508.
                                if slot <> 7508 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7510 {
                            if slot <= 7509 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:93
//		EXTEND
// PORT: Fixed ROM slots 7509.
                                if slot <> 7509 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:94
//		WRITE	CHAN12
// PORT: Fixed ROM slots 7510.
                                if slot <> 7510 or instruction <> 522 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7511 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:95
//		EXTEND
// PORT: Fixed ROM slots 7511.
                                if slot <> 7511 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:96
//		WRITE	CHAN13
// PORT: Fixed ROM slots 7512.
                                if slot <> 7512 or instruction <> 523 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7519 {
                    if slot <= 7515 {
                        if slot <= 7513 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:97
//		EXTEND
// PORT: Fixed ROM slots 7513.
                            if slot <> 7513 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7514 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:98
//		WRITE	CHAN14
// PORT: Fixed ROM slots 7514.
                                if slot <> 7514 or instruction <> 524 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:99
//		CS	DSPTAB +11D
// PORT: Fixed ROM slots 7515.
                                if slot <> 7515 or instruction <> 16926 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 542).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7517 {
                            if slot <= 7516 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:100
//		MASK	BITS4&6
// PORT: Fixed ROM slots 7516.
                                if slot <> 7516 or instruction <> 31225 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                                    if fixedOperand = 40 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8 + mod(floor(words[0] / 32), 2) * 32).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:101
//		CCS	A
// PORT: Fixed ROM slots 7517.
                                if slot <> 7517 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7518 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:102
//		TC	+4
// PORT: Fixed ROM slots 7518.
                                if slot <> 7518 or instruction <> 1378 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1378, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:103
//		CA	BITS4&6
// PORT: Fixed ROM slots 7519.
                                if slot <> 7519 or instruction <> 14841 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7523 {
                        if slot <= 7521 {
                            if slot <= 7520 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:104
//		EXTEND			# THE IMU WAS IN COARSE ALIGN IN GIMBAL
// PORT: Fixed ROM slots 7520.
                                if slot <> 7520 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:105
//		WOR	CHAN12		# LOCK, SO PUT IT BACK INTO COARSE ALIGN.
// PORT: Fixed ROM slots 7521.
                                if slot <> 7521 or instruction <> 2570 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7522 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:106
// +4		TC	MR.KLEAN
// PORT: Fixed ROM slots 7522.
                                if slot <> 7522 or instruction <> 1443 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1443, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:107
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:108
//		CS	ZERO
// PORT: Fixed ROM slots 7523.
                                if slot <> 7523 or instruction <> 18925 { return choose false if checkOnly else -1. }
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
                        if slot <= 7525 {
                            if slot <= 7524 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:109
//		TS	MODREG
// PORT: Fixed ROM slots 7524.
                                if slot <> 7524 or instruction <> 23049 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23049, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:110
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:111
//		CAF	IM30INIF	# FRESH START IMU INITIALIZATION
// PORT: Fixed ROM slots 7525.
                                if slot <> 7525 or instruction <> 14066 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1778), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7526 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:112
//		TS	IMODES30
// PORT: Fixed ROM slots 7526.
                                if slot <> 7526 or instruction <> 23234 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23234, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:113
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:114
//		CAF	MAXDB
// PORT: Fixed ROM slots 7527.
                                if slot <> 7527 or instruction <> 13879 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1591), 32768).
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
    } else {
        if slot <= 7556 {
            if slot <= 7541 {
                if slot <= 7534 {
                    if slot <= 7530 {
                        if slot <= 7528 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:115
//		TS	DB
// PORT: Fixed ROM slots 7528.
                            if slot <> 7528 or instruction <> 23270 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23270, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7529 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:116
//		CAF	FOUR
// PORT: Fixed ROM slots 7529.
                                if slot <> 7529 or instruction <> 14825 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:117
//		TS	RATEINDX	# INITIALZE KALCMANU RATE
// PORT: Fixed ROM slots 7530.
                                if slot <> 7530 or instruction <> 23253 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23253, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7532 {
                            if slot <= 7531 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:118
//		CA	BOOLSTRT
// PORT: Fixed ROM slots 7531.
                                if slot <> 7531 or instruction <> 13875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1587), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:119
//		TS	DAPBOOLS
// PORT: Fixed ROM slots 7532.
                                if slot <> 7532 or instruction <> 22601 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22601, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7533 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:120
//		CAF	EBANK6
// PORT: Fixed ROM slots 7533.
                                if slot <> 7533 or instruction <> 14861 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:121
//		TS	EBANK
// PORT: Fixed ROM slots 7534.
                                if slot <> 7534 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7537 {
                        if slot <= 7535 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:122
//		EBANK=	HIASCENT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:123
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:124
//		CA	STIKSTRT
// PORT: Fixed ROM slots 7535.
                            if slot <> 7535 or instruction <> 13872 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1584), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7536 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:125
//		TS	STIKSENS
// PORT: Fixed ROM slots 7536.
                                if slot <> 7536 or instruction <> 23332 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23332, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:126
//		CA	RATESTRT
// PORT: Fixed ROM slots 7537.
                                if slot <> 7537 or instruction <> 13873 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1585), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7539 {
                            if slot <= 7538 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:127
//		TS	-RATEDB
// PORT: Fixed ROM slots 7538.
                                if slot <> 7538 or instruction <> 23358 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:128
//		CAF	FULLAPS		# INITIALIZE MAXIMUM ASCENT MASS FOR USE
// PORT: Fixed ROM slots 7539.
                                if slot <> 7539 or instruction <> 13312 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7540 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:129
//		TS	HIASCENT	#   BY 1/ACCS UNTIL THE PAD LOAD IS DONE.
// PORT: Fixed ROM slots 7540.
                                if slot <> 7540 or instruction <> 23296 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23296, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:130
//		CA	77001OCT	#     LOAD DAP FILTER GAINS PAD LOAD.
// PORT: Fixed ROM slots 7541.
                                if slot <> 7541 or instruction <> 13876 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1588), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7548 {
                    if slot <= 7544 {
                        if slot <= 7542 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:131
//# Page 213
// PORT: SOURCE FRESH_START_AND_RESTART.agc:132
//		TS	DKTRAP		#       TO BEST PRESENT ESTIMATE OF GOODIES
// PORT: Fixed ROM slots 7542.
                            if slot <> 7542 or instruction <> 23299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23299, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7543 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:133
//		TS	LMTRAP		# .14 DEG
// PORT: Fixed ROM slots 7543.
                                if slot <> 7543 or instruction <> 23302 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23302, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:134
//		CA	60DEC
// PORT: Fixed ROM slots 7544.
                                if slot <> 7544 or instruction <> 13877 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1589), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7546 {
                            if slot <= 7545 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:135
//		TS	DKKAOSN
// PORT: Fixed ROM slots 7545.
                                if slot <> 7545 or instruction <> 23301 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23301, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:136
//		TS	LMKAOSN		# 6 SEC GAIN FOR ALPHA
// PORT: Fixed ROM slots 7546.
                                if slot <> 7546 or instruction <> 23304 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23304, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7547 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:137
//		CA	ZERO
// PORT: Fixed ROM slots 7547.
                                if slot <> 7547 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:138
//		TS	LMOMEGAN	# UNITY GAIN
// PORT: Fixed ROM slots 7548.
                                if slot <> 7548 or instruction <> 23303 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23303, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7552 {
                        if slot <= 7550 {
                            if slot <= 7549 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:139
//		CA	TEN
// PORT: Fixed ROM slots 7549.
                                if slot <> 7549 or instruction <> 14579 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:140
//		TS	DKOMEGAN	# 1 SEC GAIN FOR OMEGA
// PORT: Fixed ROM slots 7550.
                                if slot <> 7550 or instruction <> 23300 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23300, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7551 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:141
//		CAF	BIT8		# SET DOCKED DB TO 1.4 DEG.  MAY OVERWRITE
// PORT: Fixed ROM slots 7551.
                                if slot <> 7551 or instruction <> 14820 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:142
//		TS	DKDB		#	WITH PAD LOAD.
// PORT: Fixed ROM slots 7552.
                                if slot <> 7552 or instruction <> 23305 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23305, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7554 {
                            if slot <= 7553 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:143
//		CAF	IM33INIT
// PORT: Fixed ROM slots 7553.
                                if slot <> 7553 or instruction <> 14870 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:144
//		AD	BIT6		# KEEP BOTH DAP AND ERROR-NEEDLES DISPLAY
// PORT: Fixed ROM slots 7554.
                                if slot <> 7554 or instruction <> 27110 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7555 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:145
//		TS	IMODES33	#	OFF UNTIL ICDU ZERO IS FINISHED.
// PORT: Fixed ROM slots 7555.
                                if slot <> 7555 or instruction <> 23235 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:146
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:147
//		EXTEND			# INITIALIZE SWITCHES ONLY ON FRESH START.
// PORT: Fixed ROM slots 7556.
                                if slot <> 7556 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 7570 {
                if slot <= 7563 {
                    if slot <= 7559 {
                        if slot <= 7557 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:148
//		DCA	SWINIT
// PORT: Fixed ROM slots 7557.
                            if slot <> 7557 or instruction <> 14071 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1783, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7558 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:149
//		DXCH	STATE
// PORT: Fixed ROM slots 7558.
                                if slot <> 7558 or instruction <> 21565 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 61, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:150
//		CA	SWINIT +2
// PORT: Fixed ROM slots 7559.
                                if slot <> 7559 or instruction <> 14072 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1784), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7561 {
                            if slot <= 7560 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:151
//		TS	STATE +2
// PORT: Fixed ROM slots 7560.
                                if slot <> 7560 or instruction <> 22590 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22590, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:152
//		CA	REFSMBIT	# DO NOT ALTER REFSMFLG ON FRESH START.
// PORT: Fixed ROM slots 7561.
                                if slot <> 7561 or instruction <> 14815 { return choose false if checkOnly else -1. }
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
                            if slot <= 7562 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:153
//		MASK	STATE +3
// PORT: Fixed ROM slots 7562.
                                if slot <> 7562 or instruction <> 28735 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 63).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:154
//		AD	SWINIT +3
// PORT: Fixed ROM slots 7563.
                                if slot <> 7563 or instruction <> 26361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1785), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7566 {
                        if slot <= 7564 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:155
//		TS	STATE +3
// PORT: Fixed ROM slots 7564.
                            if slot <> 7564 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7565 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:156
//		EXTEND
// PORT: Fixed ROM slots 7565.
                                if slot <> 7565 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:157
//		DCA	SWINIT +4
// PORT: Fixed ROM slots 7566.
                                if slot <> 7566 or instruction <> 14075 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1787, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7568 {
                            if slot <= 7567 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:158
//		DXCH	STATE +4
// PORT: Fixed ROM slots 7567.
                                if slot <> 7567 or instruction <> 21569 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 65, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:159
//		EXTEND
// PORT: Fixed ROM slots 7568.
                                if slot <> 7568 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7569 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:160
//		DCA	SWINIT +6
// PORT: Fixed ROM slots 7569.
                                if slot <> 7569 or instruction <> 14077 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1789, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:161
//		DXCH	STATE +6
// PORT: Fixed ROM slots 7570.
                                if slot <> 7570 or instruction <> 21571 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 67, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7577 {
                    if slot <= 7573 {
                        if slot <= 7571 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:162
//		CA	SURFFBIT	# DO NOT ALTER	SURFFLAG ON FRESH START.
// PORT: Fixed ROM slots 7571.
                            if slot <> 7571 or instruction <> 14820 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7572 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:163
//		AD	CMOONBIT	#		CMOONFLG
// PORT: Fixed ROM slots 7572.
                                if slot <> 7572 or instruction <> 27104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:164
//		AD	LMOONBIT	#		LMOONFLG
// PORT: Fixed ROM slots 7573.
                                if slot <> 7573 or instruction <> 27105 { return choose false if checkOnly else -1. }
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
                        if slot <= 7575 {
                            if slot <= 7574 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:165
//		MASK	STATE +8D
// PORT: Fixed ROM slots 7574.
                                if slot <> 7574 or instruction <> 28740 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 68).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:166
//		AD	SWINIT +8D
// PORT: Fixed ROM slots 7575.
                                if slot <> 7575 or instruction <> 26366 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1790), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7576 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:167
//		TS	STATE +8D
// PORT: Fixed ROM slots 7576.
                                if slot <> 7576 or instruction <> 22596 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22596, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:168
//		CA	SWINIT +9D
// PORT: Fixed ROM slots 7577.
                                if slot <> 7577 or instruction <> 14079 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1791), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7581 {
                        if slot <= 7579 {
                            if slot <= 7578 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:169
//		TS	STATE +9D
// PORT: Fixed ROM slots 7578.
                                if slot <> 7578 or instruction <> 22597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22597, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:170
//		CA	APSFLBIT	# DO NOT ALTER APSFLAG ON FRESH START.
// PORT: Fixed ROM slots 7579.
                                if slot <> 7579 or instruction <> 14815 { return choose false if checkOnly else -1. }
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
                            if slot <= 7580 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:171
//		MASK	STATE +10D
// PORT: Fixed ROM slots 7580.
                                if slot <> 7580 or instruction <> 28742 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 70).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:172
//		AD	SWINIT +10D
// PORT: Fixed ROM slots 7581.
                                if slot <> 7581 or instruction <> 26368 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1792), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7583 {
                            if slot <= 7582 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:173
//		TS	STATE +10D
// PORT: Fixed ROM slots 7582.
                                if slot <> 7582 or instruction <> 22598 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22598, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:174
//		CAF	SWINIT +11D
// PORT: Fixed ROM slots 7583.
                                if slot <> 7583 or instruction <> 14081 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1793), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7584 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:175
//		TS	STATE +11D
// PORT: Fixed ROM slots 7584.
                                if slot <> 7584 or instruction <> 22599 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22599, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:176
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:177
//ENDRSTRT	TC	POSTJUMP	# NOW IN ANOTHER BANK.
// PORT: Fixed ROM slots 7585.
                                if slot <> 7585 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[435] to agcAotUnit435@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:178
//		CADR	DUMMYJOB +2	# PICKS UP AT RELINT.	(DON'T ZERO NEWJOB)
// PORT: Fixed ROM slots 7586.
    7586, 3344
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7587–7593.
function agcAotUnit436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7589 {
        if slot <= 7587 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:179
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:180
//MR.KLEAN	INHINT
// PORT: Fixed ROM slots 7587.
            if slot <> 7587 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7588 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:181
//# Page 214
// PORT: SOURCE FRESH_START_AND_RESTART.agc:182
//		EXTEND
// PORT: Fixed ROM slots 7588.
                if slot <> 7588 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:183
//		DCA	NEG0
// PORT: Fixed ROM slots 7589.
                if slot <> 7589 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7591 {
            if slot <= 7590 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:184
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 7590.
                if slot <> 7590 or instruction <> 21997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:185
//P00KLEAN	EXTEND
// PORT: Fixed ROM slots 7591.
                if slot <> 7591 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7592 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:186
//		DCA	NEG0
// PORT: Fixed ROM slots 7592.
                if slot <> 7592 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:187
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 7593.
                if slot <> 7593 or instruction <> 22001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[436] to agcAotUnit436@.

// PORT: Physical bank 05. Shared continuation entries, slots 7594–7636.
function agcAotUnit437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7614 {
        if slot <= 7603 {
            if slot <= 7598 {
                if slot <= 7595 {
                    if slot <= 7594 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:188
//V37KLEAN	EXTEND
// PORT: Fixed ROM slots 7594.
                        if slot <> 7594 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:189
//		DCA	NEG0
// PORT: Fixed ROM slots 7595.
                        if slot <> 7595 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7596 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:190
//		DXCH	-PHASE1
// PORT: Fixed ROM slots 7596.
                        if slot <> 7596 or instruction <> 21995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7597 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:191
//		EXTEND
// PORT: Fixed ROM slots 7597.
                            if slot <> 7597 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:192
//		DCA	NEG0
// PORT: Fixed ROM slots 7598.
                            if slot <> 7598 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7600 {
                    if slot <= 7599 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:193
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 7599.
                        if slot <> 7599 or instruction <> 21999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:194
//		EXTEND
// PORT: Fixed ROM slots 7600.
                        if slot <> 7600 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7601 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:195
//		DCA	NEG0
// PORT: Fixed ROM slots 7601.
                        if slot <> 7601 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7602 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:196
//		DXCH	-PHASE5
// PORT: Fixed ROM slots 7602.
                            if slot <> 7602 or instruction <> 22003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:197
//		EXTEND
// PORT: Fixed ROM slots 7603.
                            if slot <> 7603 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 7608 {
                if slot <= 7605 {
                    if slot <= 7604 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:198
//		DCA	NEG0
// PORT: Fixed ROM slots 7604.
                        if slot <> 7604 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:199
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 7605.
                        if slot <> 7605 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7606 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:200
//		TC	Q
// PORT: Fixed ROM slots 7606.
                        if slot <> 7606 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7607 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:201
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:202
//# Page 215
// PORT: SOURCE FRESH_START_AND_RESTART.agc:203
//# COMES HERE FROM LOCATION 4000, GOJAM, RESTART ANY PROGRAMS WHICH MAY HAVE BEEN RUNNING AT THE TIME.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:204
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:205
//		EBANK=	LST1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:206
//GOPROG		INCR	REDOCTR		# ADVANCE RESTART COUNTER.
// PORT: Fixed ROM slots 7607.
                            if slot <> 7607 or instruction <> 10448 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 208).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:207
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:208
//		LXCH	Q
// PORT: Fixed ROM slots 7608.
                            if slot <> 7608 or instruction <> 9218 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 2, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7611 {
                    if slot <= 7609 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:209
//		EXTEND
// PORT: Fixed ROM slots 7609.
                        if slot <> 7609 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7610 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:210
//		ROR	SUPERBNK
// PORT: Fixed ROM slots 7610.
                            if slot <> 7610 or instruction <> 2055 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:211
//		DXCH	RSBBQ
// PORT: Fixed ROM slots 7611.
                            if slot <> 7611 or instruction <> 22299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 795, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7612 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:212
//		CA	DSPTAB +11D
// PORT: Fixed ROM slots 7612.
                        if slot <> 7612 or instruction <> 12830 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7613 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:213
//		MASK	BIT4
// PORT: Fixed ROM slots 7613.
                            if slot <> 7613 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:214
//		EXTEND
// PORT: Fixed ROM slots 7614.
                            if slot <> 7614 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 7625 {
            if slot <= 7619 {
                if slot <= 7616 {
                    if slot <= 7615 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:215
//		BZF	+4
// PORT: Fixed ROM slots 7615.
                        if slot <> 7615 or instruction <> 5571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5571, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:216
//		AD	BIT6		# SET ERROR COUNTER ENABLE
// PORT: Fixed ROM slots 7616.
                        if slot <> 7616 or instruction <> 27110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7617 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:217
//		EXTEND
// PORT: Fixed ROM slots 7617.
                        if slot <> 7617 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7618 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:218
//		WOR	CHAN12		# ISS WAS IN COARSE ALIGN SO GO BACK TO
// PORT: Fixed ROM slots 7618.
                            if slot <> 7618 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:219
//BUTTONS		TC	LIGHTSET
// PORT: Fixed ROM slots 7619.
                            if slot <> 7619 or instruction <> 1592 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1592, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7622 {
                    if slot <= 7620 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:220
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:221
//# ERASCHK TEMPORARILY STORES THE CONTENST OF TWO ERASABLE LOCATIONS, X
// PORT: SOURCE FRESH_START_AND_RESTART.agc:222
//# AND X+1 INTO SKEEP5 AND SKEEP6.  IT ALSO STORES X INTO SKEEP7 AND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:223
//# ERESTORE.  IF ERASCHK IS INTERRUPTED BY A RESTART, C(ERESTORE) SHOULD
// PORT: SOURCE FRESH_START_AND_RESTART.agc:224
//# EQUAL C(SKEEP7), AND SHOULD BE A + NUMBER LESS THAN 2000 OCT.  OTHERWISE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:225
//# C(ERESTORE) SHOULD EQUAL +0.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:226
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:227
//		CAF	HI5
// PORT: Fixed ROM slots 7620.
                        if slot <> 7620 or instruction <> 14568 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7621 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:228
//		MASK	ERESTORE
// PORT: Fixed ROM slots 7621.
                            if slot <> 7621 or instruction <> 29424 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 752).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:229
//		EXTEND
// PORT: Fixed ROM slots 7622.
                            if slot <> 7622 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7623 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:230
//		BZF	+2		# IF ERESTORE NOT = +0 OR +N LESS THAN 2K,
// PORT: Fixed ROM slots 7623.
                        if slot <> 7623 or instruction <> 5577 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5577, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7624 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:231
//		TCF	NONAVKEY +3	# DO FRESH START -- E MEMORY MIGHT BE BAD
// PORT: Fixed ROM slots 7624.
                            if slot <> 7624 or instruction <> 5701 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5701, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:232
//		CS	ERESTORE
// PORT: Fixed ROM slots 7625.
                            if slot <> 7625 or instruction <> 17136 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 752).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7630 {
                if slot <= 7627 {
                    if slot <= 7626 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:233
//		EXTEND
// PORT: Fixed ROM slots 7626.
                        if slot <> 7626 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:234
//		BZF	DORSTART	# = +0 CONTINUE WITH RESTART.
// PORT: Fixed ROM slots 7627.
                        if slot <> 7627 or instruction <> 5592 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5592, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7628 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:235
//		AD	SKEEP7
// PORT: Fixed ROM slots 7628.
                        if slot <> 7628 or instruction <> 25343 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 767).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7629 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:236
//		EXTEND
// PORT: Fixed ROM slots 7629.
                            if slot <> 7629 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:237
//		BZF	+2		# = SKEEP7, RESTORE E MEMORY.
// PORT: Fixed ROM slots 7630.
                            if slot <> 7630 or instruction <> 5584 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5584, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7633 {
                    if slot <= 7631 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:238
//		TCF	NONAVKEY +3	# DO FRESH START -- E MEMORY MIGHT BE BAD
// PORT: Fixed ROM slots 7631.
                        if slot <> 7631 or instruction <> 5701 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5701, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7632 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:239
//		CA	SKEEP4
// PORT: Fixed ROM slots 7632.
                            if slot <> 7632 or instruction <> 13052 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:240
//		TS	EBANK		# EBANK OF E MEMORY THAT WAS UNDER TEST.
// PORT: Fixed ROM slots 7633.
                            if slot <> 7633 or instruction <> 22531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7634 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:241
//		EXTEND			# (NOT DXCH SINCE THIS MIGHT HAPPEN AGAIN)
// PORT: Fixed ROM slots 7634.
                        if slot <> 7634 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7635 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:242
//		DCA	SKEEP5
// PORT: Fixed ROM slots 7635.
                            if slot <> 7635 or instruction <> 13054 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:243
//		INDEX	SKEEP7
// PORT: Fixed ROM slots 7636.
                            if slot <> 7636 or instruction <> 21247 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21247, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21247, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[437] to agcAotUnit437@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:244
//		DXCH	0000		# E MEMORY RESTORED
// PORT: Fixed ROM slots 7637.
    7637, 43010
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7638–7681.
function agcAotUnit438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7659 {
        if slot <= 7648 {
            if slot <= 7642 {
                if slot <= 7639 {
                    if slot <= 7638 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:245
//		CA	ZERO
// PORT: Fixed ROM slots 7638.
                        if slot <> 7638 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:246
//		TS	ERESTORE
// PORT: Fixed ROM slots 7639.
                        if slot <> 7639 or instruction <> 23280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23280, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7640 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:247
//DORSTART	TC	STARTSUB	# DO INITIALIZATION AFTER ERASE RESTORE.
// PORT: Fixed ROM slots 7640.
                        if slot <> 7640 or instruction <> 1607 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1607, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7641 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:248
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:249
//SETINFL		CS	INTFLBIT
// PORT: Fixed ROM slots 7641.
                            if slot <> 7641 or instruction <> 18910 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:250
//		MASK	FLGWRD10
// PORT: Fixed ROM slots 7642.
                            if slot <> 7642 or instruction <> 28742 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 70).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7645 {
                    if slot <= 7643 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:251
//		TS	FLGWRD10
// PORT: Fixed ROM slots 7643.
                        if slot <> 7643 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7644 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:252
//# Page 216
// PORT: SOURCE FRESH_START_AND_RESTART.agc:253
//		CA	9,6,4		# LEAVE PROG ALARM, GIMBAL LOCK, NO ATT
// PORT: Fixed ROM slots 7644.
                            if slot <> 7644 or instruction <> 14068 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1780), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:254
//		MASK	DSPTAB +11D	# LAMPS INTACT ON HARDWARE RESTART
// PORT: Fixed ROM slots 7645.
                            if slot <> 7645 or instruction <> 29214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7646 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:255
//		AD	BIT15
// PORT: Fixed ROM slots 7646.
                        if slot <> 7646 or instruction <> 27101 { return choose false if checkOnly else -1. }
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
                        if slot <= 7647 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:256
//		XCH	DSPTAB +11D
// PORT: Fixed ROM slots 7647.
                            if slot <> 7647 or instruction <> 24094 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 542, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:257
//		CAF	IFAILINH	# LEAVE IMU FAILURE INHIBITS INTACT ON
// PORT: Fixed ROM slots 7648.
                            if slot <> 7648 or instruction <> 14056 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1768), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7653 {
                if slot <= 7650 {
                    if slot <= 7649 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:258
//		MASK	IMODES30	# HARDWARE RESTART, RESET ALL FAILURE
// PORT: Fixed ROM slots 7649.
                        if slot <> 7649 or instruction <> 29378 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:259
//		AD	IM30INIR	# CODES.
// PORT: Fixed ROM slots 7650.
                        if slot <> 7650 or instruction <> 26355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1779), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7651 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:260
//		TS	IMODES30
// PORT: Fixed ROM slots 7651.
                        if slot <> 7651 or instruction <> 23234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23234, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7652 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:261
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:262
//		CA	AGSWORD		# BE SURE OF CORRECT DOWNLIST
// PORT: Fixed ROM slots 7652.
                            if slot <> 7652 or instruction <> 13012 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 724).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:263
//		TS	DNLSTCOD
// PORT: Fixed ROM slots 7653.
                            if slot <> 7653 or instruction <> 22746 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22746, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7656 {
                    if slot <= 7654 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:264
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:265
//		CA	BIT4		# TURN ON THROTTLE COUNTER
// PORT: Fixed ROM slots 7654.
                        if slot <> 7654 or instruction <> 14824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7655 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:266
//		EXTEND
// PORT: Fixed ROM slots 7655.
                            if slot <> 7655 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:267
//		WOR	CHAN14		# TURN ON THRUST DRIVE
// PORT: Fixed ROM slots 7656.
                            if slot <> 7656 or instruction <> 2572 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7657 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:268
//		CS	FLAGWRD5
// PORT: Fixed ROM slots 7657.
                        if slot <> 7657 or instruction <> 16449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 65).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7658 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:269
//		MASK	ENGONBIT
// PORT: Fixed ROM slots 7658.
                            if slot <> 7658 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:270
//		CCS	A
// PORT: Fixed ROM slots 7659.
                            if slot <> 7659 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 7670 {
            if slot <= 7664 {
                if slot <= 7661 {
                    if slot <= 7660 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:271
//		TCF	+5
// PORT: Fixed ROM slots 7660.
                        if slot <> 7660 or instruction <> 5617 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5617, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:272
//		CAF	BIT13
// PORT: Fixed ROM slots 7661.
                        if slot <> 7661 or instruction <> 14815 { return choose false if checkOnly else -1. }
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
                    if slot <= 7662 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:273
//		EXTEND
// PORT: Fixed ROM slots 7662.
                        if slot <> 7662 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7663 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:274
//		WOR	DSALMOUT	# TURN ENGINE ON
// PORT: Fixed ROM slots 7663.
                            if slot <> 7663 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:275
//		TCF	GOPROG3
// PORT: Fixed ROM slots 7664.
                            if slot <> 7664 or instruction <> 5629 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5629, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7667 {
                    if slot <= 7665 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:276
// +5		CAF	BIT14
// PORT: Fixed ROM slots 7665.
                        if slot <> 7665 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7666 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:277
//		EXTEND
// PORT: Fixed ROM slots 7666.
                            if slot <> 7666 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:278
//		WOR	DSALMOUT	# TURN ENGINE OFF
// PORT: Fixed ROM slots 7667.
                            if slot <> 7667 or instruction <> 2569 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7668 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:279
//		TCF	GOPROG3
// PORT: Fixed ROM slots 7668.
                        if slot <> 7668 or instruction <> 5629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5629, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7669 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:280
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:281
//ENEMA		INHINT
// PORT: Fixed ROM slots 7669.
                            if slot <> 7669 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:282
//		TC	STARTSB1
// PORT: Fixed ROM slots 7670.
                            if slot <> 7670 or instruction <> 1614 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1614, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7675 {
                if slot <= 7672 {
                    if slot <= 7671 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:283
//		TCF	GOPROG2A
// PORT: Fixed ROM slots 7671.
                        if slot <> 7671 or instruction <> 5625 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5625, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:284
//GOPROG2		TC	STARTSB2
// PORT: Fixed ROM slots 7672.
                        if slot <> 7672 or instruction <> 1638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7673 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:285
//GOPROG2A	TC	LIGHTSET
// PORT: Fixed ROM slots 7673.
                        if slot <> 7673 or instruction <> 1592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1592, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7674 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:286
//		CS	RSFLGBTS	# CLEAR BITS 7 AND 14.
// PORT: Fixed ROM slots 7674.
                            if slot <> 7674 or instruction <> 17974 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1590), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:287
//		MASK	FLGWRD10
// PORT: Fixed ROM slots 7675.
                            if slot <> 7675 or instruction <> 28742 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 70).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7678 {
                    if slot <= 7676 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:288
//		TS	FLGWRD10
// PORT: Fixed ROM slots 7676.
                        if slot <> 7676 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7677 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:289
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:290
//GOPROG3		CAF	NUMGRPS		# VERIFY PHASE TABLE AGREEMENTS
// PORT: Fixed ROM slots 7677.
                            if slot <> 7677 or instruction <> 14830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:291
//PCLOOP		TS	MPAC +5
// PORT: Fixed ROM slots 7678.
                            if slot <> 7678 or instruction <> 22641 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 7679 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:292
//		DOUBLE
// PORT: Fixed ROM slots 7679.
                        if slot <> 7679 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7680 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:293
//		EXTEND
// PORT: Fixed ROM slots 7680.
                            if slot <> 7680 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:294
//		INDEX	A
// PORT: Fixed ROM slots 7681.
                            if slot <> 7681 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[438] to agcAotUnit438@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:295
//		DCA	-PHASE1		# COMPLEMENT INTO A, DIRECT INTO L.
// PORT: Fixed ROM slots 7682.
    7682, 25558
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7683–7706.
function agcAotUnit439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7694 {
        if slot <= 7688 {
            if slot <= 7685 {
                if slot <= 7683 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:296
//		EXTEND
// PORT: Fixed ROM slots 7683.
                    if slot <> 7683 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7684 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:297
//		RXOR	LCHAN		# RESULT MUST BE -0 FOR AGREEMENT.
// PORT: Fixed ROM slots 7684.
                        if slot <> 7684 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:298
//		CCS	A
// PORT: Fixed ROM slots 7685.
                        if slot <> 7685 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 7686 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:299
//		TCF	PTBAD		# RESTART FAILURE.
// PORT: Fixed ROM slots 7686.
                    if slot <> 7686 or instruction <> 5676 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5676, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7687 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:300
//		TCF	PTBAD
// PORT: Fixed ROM slots 7687.
                        if slot <> 7687 or instruction <> 5676 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5676, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:301
//		TCF	PTBAD
// PORT: Fixed ROM slots 7688.
                        if slot <> 7688 or instruction <> 5676 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5676, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7691 {
                if slot <= 7689 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:302
//# Page 217
// PORT: SOURCE FRESH_START_AND_RESTART.agc:303
//		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// PORT: Fixed ROM slots 7689.
                    if slot <> 7689 or instruction <> 4209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7690 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:304
//		TCF	PCLOOP
// PORT: Fixed ROM slots 7690.
                        if slot <> 7690 or instruction <> 5630 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5630, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:305
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:306
//		TS	MPAC +6		# SET TO +0.
// PORT: Fixed ROM slots 7691.
                        if slot <> 7691 or instruction <> 22642 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22642, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7692 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:307
//		TC	MMDSPLAY	# DISPLAY MAJOR MODE
// PORT: Fixed ROM slots 7692.
                    if slot <> 7692 or instruction <> 2765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7693 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:308
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:309
//		INHINT			# RELINT DONE IN MMDSPLAY
// PORT: Fixed ROM slots 7693.
                        if slot <> 7693 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:310
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:311
//		CS	DIDFLBIT	# CLEAR DIDFLAG IN ORDER TO FORCE R10 TO
// PORT: Fixed ROM slots 7694.
                        if slot <> 7694 or instruction <> 18910 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7700 {
            if slot <= 7697 {
                if slot <= 7695 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:312
//		MASK	FLAGWRD1	# RE-INITIALIZE ITSELF IF IT HAD BEEN
// PORT: Fixed ROM slots 7695.
                    if slot <> 7695 or instruction <> 28733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7696 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:313
//		TS	FLAGWRD1	# OPERATION AT THE TIME OF THE RESTART.
// PORT: Fixed ROM slots 7696.
                        if slot <> 7696 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:314
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:315
//		CS	RODFLBIT	# CLEAR RODFLAG.  IF P66 IS IN OPERATION
// PORT: Fixed ROM slots 7697.
                        if slot <> 7697 or instruction <> 18912 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7698 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:316
//		MASK	FLAGWRD1	#	IT WILL RE-INITIALIZE ITSELF AND
// PORT: Fixed ROM slots 7698.
                    if slot <> 7698 or instruction <> 28733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7699 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:317
//		TS	FLAGWRD1	#	CONTINUE.
// PORT: Fixed ROM slots 7699.
                        if slot <> 7699 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:318
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:319
//		CS	P21FLBIT	# CLEAR P21 FLAG SO THAT P21 WILL COMPUTE
// PORT: Fixed ROM slots 7700.
                        if slot <> 7700 or instruction <> 18913 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7703 {
                if slot <= 7701 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:320
//		MASK	FLAGWRD0	# NEW BASE STATE VECTORS.
// PORT: Fixed ROM slots 7701.
                    if slot <> 7701 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7702 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:321
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 7702.
                        if slot <> 7702 or instruction <> 22588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:322
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:323
//		CAF	NUMGRPS		# SEE IF ANY GROUPS RUNNING.
// PORT: Fixed ROM slots 7703.
                        if slot <> 7703 or instruction <> 14830 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7704 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:324
//NXTRST		TS	MPAC +5
// PORT: Fixed ROM slots 7704.
                    if slot <> 7704 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7705 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:325
//		DOUBLE
// PORT: Fixed ROM slots 7705.
                        if slot <> 7705 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:326
//		INDEX	A
// PORT: Fixed ROM slots 7706.
                        if slot <> 7706 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[439] to agcAotUnit439@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:327
//		CCS	PHASE1
// PORT: Fixed ROM slots 7707.
    7707, 9174
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7708–7724.
function agcAotUnit440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7715 {
        if slot <= 7711 {
            if slot <= 7709 {
                if slot <= 7708 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:328
//		TCF	PACTIVE		# PNZ -- GROUP ACTIVE.
// PORT: Fixed ROM slots 7708.
                    if slot <> 7708 or instruction <> 5662 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5662, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:329
//		TCF	PINACT		# +0 -- GROUP NOT RUNNING.
// PORT: Fixed ROM slots 7709.
                    if slot <> 7709 or instruction <> 5667 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5667, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7710 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:330
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:331
//PACTIVE		TS	MPAC
// PORT: Fixed ROM slots 7710.
                    if slot <> 7710 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:332
//		INCR	MPAC		# ABS OF PHASE.
// PORT: Fixed ROM slots 7711.
                    if slot <> 7711 or instruction <> 10348 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7713 {
                if slot <= 7712 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:333
//		INCR	MPAC +6		# INDICATE GROUP DEMANDS PRESENT.
// PORT: Fixed ROM slots 7712.
                    if slot <> 7712 or instruction <> 10354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:334
//		CA	RACTCADR
// PORT: Fixed ROM slots 7713.
                    if slot <> 7713 or instruction <> 13874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1586), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7714 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:335
//		TC	SWCALL		# MUST RETURN TO SWRETURN.
// PORT: Fixed ROM slots 7714.
                    if slot <> 7714 or instruction <> 2450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2450, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:336
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:337
//PINACT		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// PORT: Fixed ROM slots 7715.
                    if slot <> 7715 or instruction <> 4209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7719 {
            if slot <= 7717 {
                if slot <= 7716 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:338
//		TCF	NXTRST
// PORT: Fixed ROM slots 7716.
                    if slot <> 7716 or instruction <> 5656 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5656, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:339
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:340
//		CCS	MPAC +6		# NO, CHECK PHASE ACTIVITY FLAG
// PORT: Fixed ROM slots 7717.
                    if slot <> 7717 or instruction <> 4210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7718 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:341
//		TCF	ENDRSTRT	# PHASE ACTIVE
// PORT: Fixed ROM slots 7718.
                    if slot <> 7718 or instruction <> 5537 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5537, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:342
//		CAF	BIT15		# IS MODE -0
// PORT: Fixed ROM slots 7719.
                    if slot <> 7719 or instruction <> 14813 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7721 {
                if slot <= 7720 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:343
//		MASK	MODREG
// PORT: Fixed ROM slots 7720.
                    if slot <> 7720 or instruction <> 29193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:344
//		EXTEND
// PORT: Fixed ROM slots 7721.
                    if slot <> 7721 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7722 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:345
//		BZF	GOTOPOOH	# NO
// PORT: Fixed ROM slots 7722.
                    if slot <> 7722 or instruction <> 7169 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7169, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7723 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:346
//		TCF	ENDRSTRT	# YES
// PORT: Fixed ROM slots 7723.
                        if slot <> 7723 or instruction <> 5537 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5537, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:347
//PTBAD		TC	ALARM		# SET ALARM TO SHOW PHASE TABLE FAILURE.
// PORT: Fixed ROM slots 7724.
                        if slot <> 7724 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[440] to agcAotUnit440@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:348
//		OCT	1107
// PORT: Fixed ROM slots 7725.
    7725, 1166
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7726–7726.
function agcAotUnit441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:349
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:350
//		TCF	DOFSTRT1
// PORT: Fixed ROM slots 7726.
    if slot <> 7726 or instruction <> 5441 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5441, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[441] to agcAotUnit441@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:351
//#******** ****** ******
// PORT: SOURCE FRESH_START_AND_RESTART.agc:352
//# Page 218
// PORT: SOURCE FRESH_START_AND_RESTART.agc:353
//# DO NOT USE GOPROG2 OR ENEMA WITHOUT CONSULTING POOH PEOPLE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:354
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:355
//OCT10000	=	BIT13
// PORT: SOURCE FRESH_START_AND_RESTART.agc:356
//OCT30000	=	PRIO30
// PORT: SOURCE FRESH_START_AND_RESTART.agc:357
//OCT7777		OCT	7777
// PORT: Fixed ROM slots 7727.
    7727, 8190,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:358
//STIKSTRT	DEC	0.825268	# 20 D/S MAXIMUM COMPANDED RATE
// PORT: Fixed ROM slots 7728.
    7728, 27042,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:359
//RATESTRT	DEC	-218
// PORT: Fixed ROM slots 7729.
    7729, 65098,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:360
//RACTCADR	CADR	RESTARTS
// PORT: Fixed ROM slots 7730.
    7730, 3756,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:361
//BOOLSTRT	OCT	21312
// PORT: Fixed ROM slots 7731.
    7731, 17812,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:362
//77001OCT	OCT	77001		# .14 DEG SCALED AT 4.5 DEG
// PORT: Fixed ROM slots 7732.
    7732, 64514,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:363
//60DEC		DEC	60
// PORT: Fixed ROM slots 7733.
    7733, 120,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:364
//RSFLGBTS	OCT	20100
// PORT: Fixed ROM slots 7734.
    7734, 16512,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:365
//MAXDB		OCTAL	03434		# 5 DEG ATTITUDE DEADBAND, SCALED AT 45.
// PORT: Fixed ROM slots 7735.
    7735, 3640
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7736–7862.
function agcAotUnit442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7798 {
        if slot <= 7766 {
            if slot <= 7750 {
                if slot <= 7742 {
                    if slot <= 7738 {
                        if slot <= 7736 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:366
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:367
//LIGHTSET	CAF	BIT5		# CHECK FOR MARK REJECT AND ERROR RESET
// PORT: Fixed ROM slots 7736.
                            if slot <> 7736 or instruction <> 14823 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7737 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:368
//		EXTEND
// PORT: Fixed ROM slots 7737.
                                if slot <> 7737 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:369
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 7738.
                                if slot <> 7738 or instruction <> 1038 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7740 {
                            if slot <= 7739 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:370
//		EXTEND
// PORT: Fixed ROM slots 7739.
                                if slot <> 7739 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:371
//		BZF	NONAVKEY	# NO MARK REJECT
// PORT: Fixed ROM slots 7740.
                                if slot <> 7740 or instruction <> 5698 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5698, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7741 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:372
//		EXTEND
// PORT: Fixed ROM slots 7741.
                                if slot <> 7741 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:373
//		READ	MNKEYIN		# CHECK IF KEYS 2M AND 5M ON
// PORT: Fixed ROM slots 7742.
                                if slot <> 7742 or instruction <> 13 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 0, 13, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7746 {
                        if slot <= 7744 {
                            if slot <= 7743 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:374
//		AD	-ELR		# MAIN DSKY KEYCODE (BITS 1-5)
// PORT: Fixed ROM slots 7743.
                                if slot <> 7743 or instruction <> 26353 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1777), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:375
//		EXTEND
// PORT: Fixed ROM slots 7744.
                                if slot <> 7744 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7745 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:376
//		BZF	+2
// PORT: Fixed ROM slots 7745.
                                if slot <> 7745 or instruction <> 5699 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5699, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:377
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:378
//NONAVKEY	TC	Q
// PORT: Fixed ROM slots 7746.
                                if slot <> 7746 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7748 {
                            if slot <= 7747 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:379
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:380
//		TC	STARTSUB
// PORT: Fixed ROM slots 7747.
                                if slot <> 7747 or instruction <> 1607 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1607, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:381
//		TCF	DOFSTART
// PORT: Fixed ROM slots 7748.
                                if slot <> 7748 or instruction <> 5436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7749 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:382
// +3		TC	STARTSUB
// PORT: Fixed ROM slots 7749.
                                if slot <> 7749 or instruction <> 1607 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1607, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:383
//		TCF	DOFSTRT1	# DO FRESH START BUT DON'T TOUCH ENGINE
// PORT: Fixed ROM slots 7750.
                                if slot <> 7750 or instruction <> 5441 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5441, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7758 {
                    if slot <= 7754 {
                        if slot <= 7752 {
                            if slot <= 7751 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:384
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:385
//# Page 219
// PORT: SOURCE FRESH_START_AND_RESTART.agc:386
//# INITIALIZATION COMMON TO BOTH FRESH START AND RESTART.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:387
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:388
//		EBANK=	AOSQ
// PORT: SOURCE FRESH_START_AND_RESTART.agc:389
//STARTSUB	CAF	LDNPHAS1	# SET POINTER SO NEXT 20MS DOWNRUPT WILL
// PORT: Fixed ROM slots 7751.
                                if slot <> 7751 or instruction <> 14057 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1769), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:390
//		TS	DNTMGOTO	# CAUSE THE CURRENT DOWNLIST TO BE
// PORT: Fixed ROM slots 7752.
                                if slot <> 7752 or instruction <> 22749 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22749, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7753 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:391
//					# INTERRUPTED AND START SENDING FROM THE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:392
//					# BEGINNING OF THE CURRENT DOWNLIST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:393
//		CAF	BIT6
// PORT: Fixed ROM slots 7753.
                                if slot <> 7753 or instruction <> 14822 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:394
//		EXTEND
// PORT: Fixed ROM slots 7754.
                                if slot <> 7754 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7756 {
                            if slot <= 7755 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:395
//		RAND	CHAN33
// PORT: Fixed ROM slots 7755.
                                if slot <> 7755 or instruction <> 1051 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:396
//		AD	RMODINIT
// PORT: Fixed ROM slots 7756.
                                if slot <> 7756 or instruction <> 26357 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1781), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7757 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:397
//		TS	RADMODES
// PORT: Fixed ROM slots 7757.
                                if slot <> 7757 or instruction <> 22600 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:398
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:399
//STARTSB1	CAF	POSMAX
// PORT: Fixed ROM slots 7758.
                                if slot <> 7758 or instruction <> 14811 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 7762 {
                        if slot <= 7760 {
                            if slot <= 7759 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:400
//		TS	TIME3
// PORT: Fixed ROM slots 7759.
                                if slot <> 7759 or instruction <> 22550 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22550, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:401
//		AD	MINUS2
// PORT: Fixed ROM slots 7760.
                                if slot <> 7760 or instruction <> 28646 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7761 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:402
//		TS	TIME4
// PORT: Fixed ROM slots 7761.
                                if slot <> 7761 or instruction <> 22551 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22551, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:403
//		AD	NEGONE
// PORT: Fixed ROM slots 7762.
                                if slot <> 7762 or instruction <> 28647 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7764 {
                            if slot <= 7763 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:404
//		TS	TIME5
// PORT: Fixed ROM slots 7763.
                                if slot <> 7763 or instruction <> 22552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:405
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:406
//		CAF	EBANK6
// PORT: Fixed ROM slots 7764.
                                if slot <> 7764 or instruction <> 14861 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7765 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:407
//		TS	EBANK
// PORT: Fixed ROM slots 7765.
                                if slot <> 7765 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:408
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:409
//		CS	BIT13		# CAUSE DAPIDLER TO CALL 1/ACCS
// PORT: Fixed ROM slots 7766.
                                if slot <> 7766 or instruction <> 18911 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 7782 {
                if slot <= 7774 {
                    if slot <= 7770 {
                        if slot <= 7768 {
                            if slot <= 7767 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:410
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 7767.
                                if slot <> 7767 or instruction <> 29371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:411
//		TS	RCSFLAGS	# ZERO BIT 13
// PORT: Fixed ROM slots 7768.
                                if slot <> 7768 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7769 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:412
//		CAF	POSMAX		# DISABLE TIME6 CLOCK.  JUST IN CASE A T6
// PORT: Fixed ROM slots 7769.
                                if slot <> 7769 or instruction <> 14811 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:413
//		TS	T6NEXT		#	RUPT IS ALREADY IN THE PRIORITY CHAIN,
// PORT: Fixed ROM slots 7770.
                                if slot <> 7770 or instruction <> 23350 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23350, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7772 {
                            if slot <= 7771 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:414
//		EXTEND			#	ENSURE THAT ITS INPUTS WILL RENDER IT
// PORT: Fixed ROM slots 7771.
                                if slot <> 7771 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:415
//		WAND	CHAN13		#	INEFFECTUAL.
// PORT: Fixed ROM slots 7772.
                                if slot <> 7772 or instruction <> 1547 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7773 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:416
//		CAF	ZERO
// PORT: Fixed ROM slots 7773.
                                if slot <> 7773 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:417
//		TS	NXT6ADR
// PORT: Fixed ROM slots 7774.
                                if slot <> 7774 or instruction <> 23349 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23349, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7778 {
                        if slot <= 7776 {
                            if slot <= 7775 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:418
//		TS	NEXTP
// PORT: Fixed ROM slots 7775.
                                if slot <> 7775 or instruction <> 23354 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23354, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:419
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:420
//		CS	ACCSOKAY
// PORT: Fixed ROM slots 7776.
                                if slot <> 7776 or instruction <> 18921 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7777 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:421
//		MASK	DAPBOOLS
// PORT: Fixed ROM slots 7777.
                                if slot <> 7777 or instruction <> 28745 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 73).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:422
//		TS	DAPBOOLS
// PORT: Fixed ROM slots 7778.
                                if slot <> 7778 or instruction <> 22601 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22601, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7780 {
                            if slot <= 7779 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:423
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:424
//		EXTEND			# SET T5RUPT FOR DAPIDLER PROGRAM.
// PORT: Fixed ROM slots 7779.
                                if slot <> 7779 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:425
//		DCA	IDLEADR
// PORT: Fixed ROM slots 7780.
                                if slot <> 7780 or instruction <> 14055 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1767, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7781 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:426
//		DXCH	T5ADR
// PORT: Fixed ROM slots 7781.
                                if slot <> 7781 or instruction <> 22205 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 701, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:427
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:428
//STARTSB2	CAF	OCT30001	# DURING SOFTWARE RESTART, DO NOT DISTURB
// PORT: Fixed ROM slots 7782.
                                if slot <> 7782 or instruction <> 14064 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1776), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7790 {
                    if slot <= 7786 {
                        if slot <= 7784 {
                            if slot <= 7783 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:429
//		EXTEND			# ENGINE ON, OFF AND ISS WARNING.
// PORT: Fixed ROM slots 7783.
                                if slot <> 7783 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:430
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 7784.
                                if slot <> 7784 or instruction <> 1545 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7785 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:431
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:432
//		CS	READRBIT	# CLEAR READRFLG FOR R29
// PORT: Fixed ROM slots 7785.
                                if slot <> 7785 or instruction <> 18915 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:433
//		MASK	FLAGWRD3
// PORT: Fixed ROM slots 7786.
                                if slot <> 7786 or instruction <> 28735 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 63).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7788 {
                            if slot <= 7787 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:434
//		TS	FLAGWRD3
// PORT: Fixed ROM slots 7787.
                                if slot <> 7787 or instruction <> 22591 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22591, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:435
//# Page 220
// PORT: SOURCE FRESH_START_AND_RESTART.agc:436
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:437
//		CS	FLAGWRD3	# DURING SOFTWARE RESTART, CLEAR TURNON,
// PORT: Fixed ROM slots 7788.
                                if slot <> 7788 or instruction <> 16447 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 63).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7789 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:438
//		MASK	NR29FBIT	# REPOSITION, CDU ZERO AND REMODE BITS
// PORT: Fixed ROM slots 7789.
                                if slot <> 7789 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:439
//		EXTEND			# IN RADMODES, SINCE TASKS ASSOCIATED
// PORT: Fixed ROM slots 7790.
                                if slot <> 7790 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7794 {
                        if slot <= 7792 {
                            if slot <= 7791 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:440
//		BZF	+2		# WITH THESE BITS HAVE BEEN KILLED
// PORT: Fixed ROM slots 7791.
                                if slot <> 7791 or instruction <> 5745 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5745, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:441
//		CAF	BIT10		# ALSO IF R29 HAD BEEN REQUESTED.
// PORT: Fixed ROM slots 7792.
                                if slot <> 7792 or instruction <> 14818 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7793 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:442
//		AD	OCT32001	# (NOR29FLG = 0) CLEAR BIT 10 RADMODES
// PORT: Fixed ROM slots 7793.
                                if slot <> 7793 or instruction <> 26348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1772), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:443
//		COM			# TO MAKE R29 FORGET IT HAD STARTED
// PORT: Fixed ROM slots 7794.
                                if slot <> 7794 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7796 {
                            if slot <= 7795 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:444
//		MASK	RADMODES	# DESIGNATING
// PORT: Fixed ROM slots 7795.
                                if slot <> 7795 or instruction <> 28744 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 72).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:445
//		TS	RADMODES
// PORT: Fixed ROM slots 7796.
                                if slot <> 7796 or instruction <> 22600 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7797 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:446
//		CAF	OCT27470	# DURING SOFTWARE RESTART, DO NOT DISTURB
// PORT: Fixed ROM slots 7797.
                                if slot <> 7797 or instruction <> 14062 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1774), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:447
//		EXTEND			# IMU FLAGS.  (COARSE ALIGN ENABLE, ZERO
// PORT: Fixed ROM slots 7798.
                                if slot <> 7798 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 7830 {
            if slot <= 7814 {
                if slot <= 7806 {
                    if slot <= 7802 {
                        if slot <= 7800 {
                            if slot <= 7799 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:448
//		WAND	CHAN12		# IMU CDUS, ENABLE IMU COUNTER) AND GIMBAL
// PORT: Fixed ROM slots 7799.
                                if slot <> 7799 or instruction <> 1546 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:449
//					# TRIM DRIVES.  LEAVE RR LOCKON ENABLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:450
//					# ALONE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:451
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:452
//		CS	NORRMBIT	# ENABLE R25.
// PORT: Fixed ROM slots 7800.
                                if slot <> 7800 or instruction <> 18920 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7801 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:453
//		MASK	FLAGWRD5
// PORT: Fixed ROM slots 7801.
                                if slot <> 7801 or instruction <> 28737 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 65).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:454
//		TS	FLAGWRD5
// PORT: Fixed ROM slots 7802.
                                if slot <> 7802 or instruction <> 22593 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22593, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7804 {
                            if slot <= 7803 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:455
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:456
//		CS	R77FLBIT	# CLEAR R77FLAG
// PORT: Fixed ROM slots 7803.
                                if slot <> 7803 or instruction <> 18913 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:457
//		MASK	FLAGWRD5
// PORT: Fixed ROM slots 7804.
                                if slot <> 7804 or instruction <> 28737 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 65).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7805 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:458
//		TS	FLAGWRD5
// PORT: Fixed ROM slots 7805.
                                if slot <> 7805 or instruction <> 22593 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22593, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:459
//		CAF	OCT74160	# DURING SOFTWARE RESTART, DO NOT DISTURB
// PORT: Fixed ROM slots 7806.
                                if slot <> 7806 or instruction <> 14063 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1775), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7810 {
                        if slot <= 7808 {
                            if slot <= 7807 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:460
//		EXTEND			# TELEMETRY FLAGS, RESET TRAP FLAGS, AND
// PORT: Fixed ROM slots 7807.
                                if slot <> 7807 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:461
//		WAND	CHAN13		# ENABLE T6RUPT FLAG.
// PORT: Fixed ROM slots 7808.
                                if slot <> 7808 or instruction <> 1547 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7809 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:462
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:463
//		CAF	BIT12		# REENABLE RUPT10 (RUPT QUICKLY
// PORT: Fixed ROM slots 7809.
                                if slot <> 7809 or instruction <> 14816 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:464
//		EXTEND			#	RESUMES EXCEPT DURING P64)
// PORT: Fixed ROM slots 7810.
                                if slot <> 7810 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7812 {
                            if slot <= 7811 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:465
//		WOR	CHAN13
// PORT: Fixed ROM slots 7811.
                                if slot <> 7811 or instruction <> 2571 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:466
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:467
//		CAF	BIT6		# DURING SOFTWARE RESTART, DO NOT DISTURB
// PORT: Fixed ROM slots 7812.
                                if slot <> 7812 or instruction <> 14822 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7813 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:468
//		EXTEND			# GYRO ENABLE FLAG.
// PORT: Fixed ROM slots 7813.
                                if slot <> 7813 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:469
//		WAND	CHAN14
// PORT: Fixed ROM slots 7814.
                                if slot <> 7814 or instruction <> 1548 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7822 {
                    if slot <= 7818 {
                        if slot <= 7816 {
                            if slot <= 7815 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:470
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:471
//		EBANK=	LST1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:472
//		CAF	STARTEB
// PORT: Fixed ROM slots 7815.
                                if slot <> 7815 or instruction <> 14855 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:473
//		TS	EBANK		# SET FOR E3
// PORT: Fixed ROM slots 7816.
                                if slot <> 7816 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7817 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:474
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:475
//		CAF	NEG1/2		# INITIALIZE WAITLIST DELTA-TS.
// PORT: Fixed ROM slots 7817.
                                if slot <> 7817 or instruction <> 14812 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2524), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:476
//		TS	LST1 +7
// PORT: Fixed ROM slots 7818.
                                if slot <> 7818 or instruction <> 23303 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23303, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7820 {
                            if slot <= 7819 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:477
//		TS	LST1 +6
// PORT: Fixed ROM slots 7819.
                                if slot <> 7819 or instruction <> 23302 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23302, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:478
//		TS	LST1 +5
// PORT: Fixed ROM slots 7820.
                                if slot <> 7820 or instruction <> 23301 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23301, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7821 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:479
//		TS	LST1 +4
// PORT: Fixed ROM slots 7821.
                                if slot <> 7821 or instruction <> 23300 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23300, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:480
//		TS	LST1 +3
// PORT: Fixed ROM slots 7822.
                                if slot <> 7822 or instruction <> 23299 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23299, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7826 {
                        if slot <= 7824 {
                            if slot <= 7823 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:481
//		TS	LST1 +2
// PORT: Fixed ROM slots 7823.
                                if slot <> 7823 or instruction <> 23298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23298, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:482
//		TS	LST1 +1
// PORT: Fixed ROM slots 7824.
                                if slot <> 7824 or instruction <> 23297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23297, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7825 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:483
//		TS	LST1
// PORT: Fixed ROM slots 7825.
                                if slot <> 7825 or instruction <> 23296 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23296, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:484
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:485
//		CS	ENDTASK
// PORT: Fixed ROM slots 7826.
                                if slot <> 7826 or instruction <> 19102 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2718), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7828 {
                            if slot <= 7827 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:486
//		TS	LST2
// PORT: Fixed ROM slots 7827.
                                if slot <> 7827 or instruction <> 23304 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23304, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:487
//# Page 221
// PORT: SOURCE FRESH_START_AND_RESTART.agc:488
//		TS	LST2 +2
// PORT: Fixed ROM slots 7828.
                                if slot <> 7828 or instruction <> 23306 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23306, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7829 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:489
//		TS	LST2 +4
// PORT: Fixed ROM slots 7829.
                                if slot <> 7829 or instruction <> 23308 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23308, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:490
//		TS	LST2 +6
// PORT: Fixed ROM slots 7830.
                                if slot <> 7830 or instruction <> 23310 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23310, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 7846 {
                if slot <= 7838 {
                    if slot <= 7834 {
                        if slot <= 7832 {
                            if slot <= 7831 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:491
//		TS	LST2 +8D
// PORT: Fixed ROM slots 7831.
                                if slot <> 7831 or instruction <> 23312 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23312, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:492
//		TS	LST2 +10D
// PORT: Fixed ROM slots 7832.
                                if slot <> 7832 or instruction <> 23314 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23314, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7833 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:493
//		TS	LST2 +12D
// PORT: Fixed ROM slots 7833.
                                if slot <> 7833 or instruction <> 23316 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23316, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:494
//		TS	LST2 +14D
// PORT: Fixed ROM slots 7834.
                                if slot <> 7834 or instruction <> 23318 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23318, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7836 {
                            if slot <= 7835 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:495
//		TS	LST2 +16D
// PORT: Fixed ROM slots 7835.
                                if slot <> 7835 or instruction <> 23320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23320, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:496
//		CS	ENDTASK +1
// PORT: Fixed ROM slots 7836.
                                if slot <> 7836 or instruction <> 19103 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2719), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7837 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:497
//		TS	LST2 +1
// PORT: Fixed ROM slots 7837.
                                if slot <> 7837 or instruction <> 23305 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23305, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:498
//		TS	LST2 +3
// PORT: Fixed ROM slots 7838.
                                if slot <> 7838 or instruction <> 23307 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23307, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7842 {
                        if slot <= 7840 {
                            if slot <= 7839 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:499
//		TS	LST2 +5
// PORT: Fixed ROM slots 7839.
                                if slot <> 7839 or instruction <> 23309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23309, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:500
//		TS	LST2 +7
// PORT: Fixed ROM slots 7840.
                                if slot <> 7840 or instruction <> 23311 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23311, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7841 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:501
//		TS	LST2 +9D
// PORT: Fixed ROM slots 7841.
                                if slot <> 7841 or instruction <> 23313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:502
//		TS	LST2 +11D
// PORT: Fixed ROM slots 7842.
                                if slot <> 7842 or instruction <> 23315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7844 {
                            if slot <= 7843 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:503
//		TS	LST2 +13D
// PORT: Fixed ROM slots 7843.
                                if slot <> 7843 or instruction <> 23317 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23317, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:504
//		TS	LST2 +15D
// PORT: Fixed ROM slots 7844.
                                if slot <> 7844 or instruction <> 23319 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7845 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:505
//		TS	LST2 +17D
// PORT: Fixed ROM slots 7845.
                                if slot <> 7845 or instruction <> 23321 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23321, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:506
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:507
//		CS	ZERO		# MAKE ALL EXECUTIVE REGISTER SETS
// PORT: Fixed ROM slots 7846.
                                if slot <> 7846 or instruction <> 18925 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7854 {
                    if slot <= 7850 {
                        if slot <= 7848 {
                            if slot <= 7847 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:508
//		TS	PRIORITY	# AVAILABLE.
// PORT: Fixed ROM slots 7847.
                                if slot <> 7847 or instruction <> 22647 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22647, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:509
//		TS	PRIORITY +12D
// PORT: Fixed ROM slots 7848.
                                if slot <> 7848 or instruction <> 22659 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22659, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7849 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:510
//		TS	PRIORITY +24D
// PORT: Fixed ROM slots 7849.
                                if slot <> 7849 or instruction <> 22671 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22671, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:511
//		TS	PRIORITY +36D
// PORT: Fixed ROM slots 7850.
                                if slot <> 7850 or instruction <> 22683 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22683, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7852 {
                            if slot <= 7851 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:512
//		TS	PRIORITY +48D
// PORT: Fixed ROM slots 7851.
                                if slot <> 7851 or instruction <> 22695 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22695, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:513
//		TS	PRIORITY +60D
// PORT: Fixed ROM slots 7852.
                                if slot <> 7852 or instruction <> 22707 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22707, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7853 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:514
//		TS	PRIORITY +72D
// PORT: Fixed ROM slots 7853.
                                if slot <> 7853 or instruction <> 22719 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22719, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:515
//		TS	PRIORITY +84D
// PORT: Fixed ROM slots 7854.
                                if slot <> 7854 or instruction <> 22731 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22731, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7858 {
                        if slot <= 7856 {
                            if slot <= 7855 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:516
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:517
//		TS	DSRUPTSW
// PORT: Fixed ROM slots 7855.
                                if slot <> 7855 or instruction <> 23243 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23243, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:518
//		TS	NEWJOB		# SHOWS NO ACTIVE JOBS.
// PORT: Fixed ROM slots 7856.
                                if slot <> 7856 or instruction <> 22583 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22583, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7857 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:519
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:520
//		CAF	VAC1ADRC	# MAKE ALL VAC AREAS AVAILABLE.
// PORT: Fixed ROM slots 7857.
                                if slot <> 7857 or instruction <> 14059 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1771), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:521
//		TS	VAC1USE
// PORT: Fixed ROM slots 7858.
                                if slot <> 7858 or instruction <> 22784 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22784, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7860 {
                            if slot <= 7859 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:522
//		AD	LTHVACA
// PORT: Fixed ROM slots 7859.
                                if slot <> 7859 or instruction <> 26349 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1773), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:523
//		TS	VAC2USE
// PORT: Fixed ROM slots 7860.
                                if slot <> 7860 or instruction <> 22828 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22828, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 7861 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:524
//		AD	LTHVACA
// PORT: Fixed ROM slots 7861.
                                if slot <> 7861 or instruction <> 26349 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1773), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:525
//		TS	VAC3USE
// PORT: Fixed ROM slots 7862.
                                if slot <> 7862 or instruction <> 22872 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22872, words[0], readEffective).
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
set agcAotRoutes[442] to agcAotUnit442@.

// PORT: Physical bank 05. Shared continuation entries, slots 7863–7870.
function agcAotUnit443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7866 {
        if slot <= 7864 {
            if slot <= 7863 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:526
//		AD	LTHVACA
// PORT: Fixed ROM slots 7863.
                if slot <> 7863 or instruction <> 26349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1773), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:527
//		TS	VAC4USE
// PORT: Fixed ROM slots 7864.
                if slot <> 7864 or instruction <> 22916 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22916, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7865 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:528
//		AD	LTHVACA
// PORT: Fixed ROM slots 7865.
                if slot <> 7865 or instruction <> 26349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1773), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:529
//		TS	VAC5USE
// PORT: Fixed ROM slots 7866.
                if slot <> 7866 or instruction <> 22960 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22960, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7868 {
            if slot <= 7867 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:530
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:531
//		CAF	TEN
// PORT: Fixed ROM slots 7867.
                if slot <> 7867 or instruction <> 14579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:532
//DSPOFF		TS	MPAC		# R1, R2, R3
// PORT: Fixed ROM slots 7868.
                if slot <> 7868 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7869 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:533
//		CS	BIT12
// PORT: Fixed ROM slots 7869.
                if slot <> 7869 or instruction <> 18912 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:534
//		INDEX	MPAC
// PORT: Fixed ROM slots 7870.
                if slot <> 7870 or instruction <> 20588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[443] to agcAotUnit443@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:535
//		TS	DSPTAB
// PORT: Fixed ROM slots 7871.
    7871, 46118
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7872–7909.
function agcAotUnit444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7890 {
        if slot <= 7880 {
            if slot <= 7875 {
                if slot <= 7873 {
                    if slot <= 7872 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:536
//		CCS	MPAC
// PORT: Fixed ROM slots 7872.
                        if slot <> 7872 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:537
//		TCF	DSPOFF
// PORT: Fixed ROM slots 7873.
                        if slot <> 7873 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7874 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:538
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:539
//# Page 222
// PORT: SOURCE FRESH_START_AND_RESTART.agc:540
//		TS	DELAYLOC
// PORT: Fixed ROM slots 7874.
                        if slot <> 7874 or instruction <> 23254 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23254, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:541
//		TS	DELAYLOC +1
// PORT: Fixed ROM slots 7875.
                        if slot <> 7875 or instruction <> 23255 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23255, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7877 {
                    if slot <= 7876 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:542
//		TS	DELAYLOC +2
// PORT: Fixed ROM slots 7876.
                        if slot <> 7876 or instruction <> 23256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23256, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:543
//		TS	R1SAVE
// PORT: Fixed ROM slots 7877.
                        if slot <> 7877 or instruction <> 23100 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23100, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7878 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:544
//		TS	INLINK
// PORT: Fixed ROM slots 7878.
                        if slot <> 7878 or instruction <> 22565 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22565, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7879 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:545
//		TS	DSPCNT
// PORT: Fixed ROM slots 7879.
                            if slot <> 7879 or instruction <> 23038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:546
//		TS	CADRSTOR
// PORT: Fixed ROM slots 7880.
                            if slot <> 7880 or instruction <> 23074 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23074, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7885 {
                if slot <= 7882 {
                    if slot <= 7881 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:547
//		TS	REQRET
// PORT: Fixed ROM slots 7881.
                        if slot <> 7881 or instruction <> 23051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23051, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:548
//		TS	CLPASS
// PORT: Fixed ROM slots 7882.
                        if slot <> 7882 or instruction <> 23053 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23053, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7883 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:549
//		TS	DSPLOCK
// PORT: Fixed ROM slots 7883.
                        if slot <> 7883 or instruction <> 23050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7884 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:550
//		TS	MONSAVE		# KILL MONITOR
// PORT: Fixed ROM slots 7884.
                            if slot <> 7884 or instruction <> 23056 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23056, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:551
//		TS	MONSAVE1
// PORT: Fixed ROM slots 7885.
                            if slot <> 7885 or instruction <> 23057 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23057, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7887 {
                    if slot <= 7886 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:552
//		TS	VERBREG
// PORT: Fixed ROM slots 7886.
                        if slot <> 7886 or instruction <> 23041 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23041, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:553
//		TS	NOUNREG
// PORT: Fixed ROM slots 7887.
                        if slot <> 7887 or instruction <> 23042 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23042, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7888 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:554
//		TS	DSPLIST
// PORT: Fixed ROM slots 7888.
                        if slot <> 7888 or instruction <> 23075 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23075, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7889 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:555
//		TS	MARKSTAT
// PORT: Fixed ROM slots 7889.
                            if slot <> 7889 or instruction <> 23242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23242, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:556
//		TS	EXTVBACT	# MAKE EXTENDED VERBS AVAILABLE
// PORT: Fixed ROM slots 7890.
                            if slot <> 7890 or instruction <> 23076 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23076, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 7899 {
            if slot <= 7894 {
                if slot <= 7892 {
                    if slot <= 7891 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:557
//		TS	IMUCADR
// PORT: Fixed ROM slots 7891.
                        if slot <> 7891 or instruction <> 23236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23236, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:558
//		TS	OPTCADR
// PORT: Fixed ROM slots 7892.
                        if slot <> 7892 or instruction <> 23237 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23237, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7893 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:559
//		TS	RADCADR
// PORT: Fixed ROM slots 7893.
                        if slot <> 7893 or instruction <> 23238 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23238, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:560
//		TS	ATTCADR
// PORT: Fixed ROM slots 7894.
                        if slot <> 7894 or instruction <> 23239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23239, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7896 {
                    if slot <= 7895 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:561
//		TS	LGYRO
// PORT: Fixed ROM slots 7895.
                        if slot <> 7895 or instruction <> 23244 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23244, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:562
//		TS	FLAGWRD4	# KILL INTERFACE DISPLAYS
// PORT: Fixed ROM slots 7896.
                        if slot <> 7896 or instruction <> 22592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22592, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7897 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:563
//		CAF	NOUTCON
// PORT: Fixed ROM slots 7897.
                        if slot <> 7897 or instruction <> 14832 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2544), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7898 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:564
//		TS	NOUT
// PORT: Fixed ROM slots 7898.
                            if slot <> 7898 or instruction <> 23054 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23054, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:565
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:566
//		CS	ONE
// PORT: Fixed ROM slots 7899.
                            if slot <> 7899 or instruction <> 18923 { return choose false if checkOnly else -1. }
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
            if slot <= 7904 {
                if slot <= 7901 {
                    if slot <= 7900 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:567
//		TS	SAMPLIM
// PORT: Fixed ROM slots 7900.
                        if slot <> 7900 or instruction <> 23104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:568
//		CAF	BIT6
// PORT: Fixed ROM slots 7901.
                        if slot <> 7901 or instruction <> 14822 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7902 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:569
//		MASK	IMODES33	# LEAVE BIT 6 UNCHANGED
// PORT: Fixed ROM slots 7902.
                        if slot <> 7902 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7903 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:570
//		AD	IM33INIT	# NO PIP OR TM FAILS.  BIT6=0 IN THIS WORD.
// PORT: Fixed ROM slots 7903.
                            if slot <> 7903 or instruction <> 27158 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2582), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:571
//		TS	IMODES33
// PORT: Fixed ROM slots 7904.
                            if slot <> 7904 or instruction <> 23235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23235, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7906 {
                    if slot <= 7905 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:572
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:573
//		CAF	LESCHK		# SELF CHECK GO-TO REGISTER.
// PORT: Fixed ROM slots 7905.
                        if slot <> 7905 or instruction <> 14058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1770), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:574
//		TS	SELFRET
// PORT: Fixed ROM slots 7906.
                        if slot <> 7906 or instruction <> 23281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23281, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7907 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:575
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:576
//		CS	VD1
// PORT: Fixed ROM slots 7907.
                        if slot <> 7907 or instruction <> 18672 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2288), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7908 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:577
//		TS	DSPCOUNT
// PORT: Fixed ROM slots 7908.
                            if slot <> 7908 or instruction <> 23039 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23039, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:578
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:579
//		TC	Q
// PORT: Fixed ROM slots 7909.
                            if slot <> 7909 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[444] to agcAotUnit444@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:580
//		EBANK=	AOSQ
// PORT: SOURCE FRESH_START_AND_RESTART.agc:581
//IDLEADR		2CADR	DAPIDLER
// PORT: Fixed ROM slots 7910 7911.
    7910, 2088, 7911, 28780,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:582
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:583
//IFAILINH	OCT	435
// PORT: Fixed ROM slots 7912.
    7912, 570,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:584
//LDNPHAS1	GENADR	DNPHASE1
// PORT: Fixed ROM slots 7913.
    7913, 3738,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:585
//LESCHK		GENADR	SELFCHK
// PORT: Fixed ROM slots 7914.
    7914, 3516,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:586
//VAC1ADRC	ADRES	VAC1USE
// PORT: Fixed ROM slots 7915.
    7915, 512,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:587
//OCT32001	OCT	32001
// PORT: Fixed ROM slots 7916.
    7916, 26626,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:588
//LTHVACA		DEC	44
// PORT: Fixed ROM slots 7917.
    7917, 88,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:589
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:590
//# Page 223
// PORT: SOURCE FRESH_START_AND_RESTART.agc:591
//OCT27470	OCT	27470
// PORT: Fixed ROM slots 7918.
    7918, 24176,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:592
//OCT74160	OCT	74160
// PORT: Fixed ROM slots 7919.
    7919, 61664,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:593
//OCT30001	OCT	30001
// PORT: Fixed ROM slots 7920.
    7920, 24578,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:594
//STARTEB		EQUALS	EBANK3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:595
//NUMGRPS		EQUALS	FIVE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:596
//-ELR		OCT	-22		# -ERROR LIGHT RESET KEY CODE.
// PORT: Fixed ROM slots 7921.
    7921, 65498,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:597
//IM30INIF	OCT	37411		# INHIBITS IMU FAIL FOR 5 SEC AND PIP ISSW
// PORT: Fixed ROM slots 7922.
    7922, 32274,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:598
//IM30INIR	OCT	37000
// PORT: Fixed ROM slots 7923.
    7923, 31744,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:599
//IM33INIT	=	PRIO16		# NO PIP OR TM FAIL SIGNALS.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:600
//9,6,4		OCT	450
// PORT: Fixed ROM slots 7924.
    7924, 592,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:601
//RMODINIT	OCT	00102
// PORT: Fixed ROM slots 7925.
    7925, 132,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:602
//SWINIT		OCT	0
// PORT: Fixed ROM slots 7926.
    7926, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:603
//		OCT	0
// PORT: Fixed ROM slots 7927.
    7927, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:604
//		OCT	0
// PORT: Fixed ROM slots 7928.
    7928, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:605
//		OCT	02000		# BIT 11 = NOR29FLG
// PORT: Fixed ROM slots 7929.
    7929, 2048,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:606
//		OCT	0
// PORT: Fixed ROM slots 7930.
    7930, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:607
//		OCT	0
// PORT: Fixed ROM slots 7931.
    7931, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:608
//		OCT	0
// PORT: Fixed ROM slots 7932.
    7932, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:609
//		OCT	00100
// PORT: Fixed ROM slots 7933.
    7933, 128,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:610
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:611
//		OCT	0
// PORT: Fixed ROM slots 7934.
    7934, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:612
//		OCT	0
// PORT: Fixed ROM slots 7935.
    7935, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:613
//		OCT	0
// PORT: Fixed ROM slots 7936.
    7936, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:614
//		OCT	40000		# BIT 15 = LRBYPASS.
// PORT: Fixed ROM slots 7937.
    7937, 32768
)).

// PORT: Physical bank 03. Shared continuation entries, slots 5121–5125.
function agcAotUnit250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5122 {
        if slot <= 5121 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:615
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:616
//# Page 224
// PORT: SOURCE FRESH_START_AND_RESTART.agc:617
//# PROGRAM NAME		GOTOPOOH		ASSEMBLY SUNDANCE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:618
//# LOG SECTION		FRESH START AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:619
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:620
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:621
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:622
//#	FLASH V 37 ON DSKY MM CHANGE REQUEST
// PORT: SOURCE FRESH_START_AND_RESTART.agc:623
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:624
//# INPUT/OUTPUT INFORMATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:625
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:626
//#	A. CALLING SEQUENCE			TC GOTOPOOH
// PORT: SOURCE FRESH_START_AND_RESTART.agc:627
//#	B. ERASABLE INITIALIZATION		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:628
//#	C. OUTPUT FLASH V 37 ON DSKY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:629
//#	D. DEBRIS				L
// PORT: SOURCE FRESH_START_AND_RESTART.agc:630
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:631
//# PROGRAM ANALYSIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:632
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:633
//#	A. SUBROUTINES CALLED			PRIODSPR, LINUS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:634
//#	B. NORMAL EXIT				TCF ENDOFJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:635
//#	C. ALARM AND ABORT EXITS		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:636
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:637
//		BLOCK	03
// PORT: SOURCE FRESH_START_AND_RESTART.agc:638
//		SETLOC	FFTAG5
// PORT: SOURCE FRESH_START_AND_RESTART.agc:639
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:640
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:641
//		COUNT*	$$/P00
// PORT: SOURCE FRESH_START_AND_RESTART.agc:642
//GOTOPOOH	CAF	OCT33			# 4.33 SPOT FOR GOP00FIX
// PORT: Fixed ROM slots 5121.
            if slot <> 5121 or instruction <> 14836 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2548), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:643
//		TS	L
// PORT: Fixed ROM slots 5122.
            if slot <> 5122 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5123 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:644
//		COM
// PORT: Fixed ROM slots 5123.
            if slot <> 5123 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 5124 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:645
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 5124.
                if slot <> 5124 or instruction <> 22001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:646
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:647
//		TC	POSTJUMP
// PORT: Fixed ROM slots 5125.
                if slot <> 5125 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[250] to agcAotUnit250@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:648
//		CADR	GOP00FIX
// PORT: Fixed ROM slots 5126.
    5126, 8232,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:649
//OCT24		MM	20
// PORT: Fixed ROM slots 5127.
    5127, 40,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:650
//OCT31		MM	25
// PORT: Fixed ROM slots 5128.
    5128, 50
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6164–6164.
function agcAotUnit357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:651
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:652
//		BANK	20
// PORT: SOURCE FRESH_START_AND_RESTART.agc:653
//		SETLOC	VERB37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:654
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:655
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:656
//		COUNT*	$$/P00			# VERB 37 AND P00 IN BANK 4.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:657
//GOP00FIX	TC	DOWNFLAG		# ALLOW X-AXIS OVERRIDE
// PORT: Fixed ROM slots 6164.
    if slot <> 6164 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[357] to agcAotUnit357@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:658
//		ADRES	XOVINFLG
// PORT: Fixed ROM slots 6165.
    6165, 402
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6166–6166.
function agcAotUnit358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:659
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:660
//		TC	DOWNFLAG		# INSURE THAT ULLAGE IS OFF
// PORT: Fixed ROM slots 6166.
    if slot <> 6166 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[358] to agcAotUnit358@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:661
//		ADRES	ULLAGFLG
// PORT: Fixed ROM slots 6167.
    6167, 408
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6168–6170.
function agcAotUnit359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6168 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:662
//# Page 225
// PORT: SOURCE FRESH_START_AND_RESTART.agc:663
//		TC	CLEARMRK +2		# RELEASE MARK DISPLAY SYSTEM.
// PORT: Fixed ROM slots 6168.
        if slot <> 6168 or instruction <> 2878 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2878, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6169 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:664
//		CAF	V37N99
// PORT: Fixed ROM slots 6169.
            if slot <> 6169 or instruction <> 13343 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1055), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:665
//		TC	BANKCALL
// PORT: Fixed ROM slots 6170.
            if slot <> 6170 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[359] to agcAotUnit359@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:666
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6171.
    6171, 17020
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6172–6174.
function agcAotUnit360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6172 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:667
//		TCF	-3
// PORT: Fixed ROM slots 6172.
        if slot <> 6172 or instruction <> 5145 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5145, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6173 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:668
//		TCF	-4
// PORT: Fixed ROM slots 6173.
            if slot <> 6173 or instruction <> 5145 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5145, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:669
//		TCF	-5
// PORT: Fixed ROM slots 6174.
            if slot <> 6174 or instruction <> 5145 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5145, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[360] to agcAotUnit360@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:670
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:671
//V37N99		VN	3799
// PORT: Fixed ROM slots 6175.
    6175, 9670
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6176–6197.
function agcAotUnit361 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6186 {
        if slot <= 6180 {
            if slot <= 6177 {
                if slot <= 6176 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:672
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:673
//# Page 226
// PORT: SOURCE FRESH_START_AND_RESTART.agc:674
//# PROGRAM NAME		V37			ASSEMBLY SUNDANCE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:675
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:676
//# LOG SECTION		FRESH START AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:677
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:678
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:679
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:680
//#	1. CHECK IF NEW PROGRAM ALLOWED.  IF BIT 1 OF FLAGWRD2 (NODOFLAG) IS SET, AN ALARM 1520 IS CALLED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:681
//#	2. CHECK FOR VALIDITY OF PROGRAM SELECTED.  IF AN INVALID PROGRAM IS SELECTED, THE OPERATOR ERROR LIGHT IS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:682
//#	   SET AND CURRENT ACTIVITY, IF ANY, CONTINUE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:683
//#	3. SERVICER IS TERMINATED IF IT HAS BEEN RUNNING.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:684
//#	4. INSTALL IS EXECUTED TO AVOID INTERRUPTING INTEGRATION.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:685
//#	5. THE ENGINE IS TURNED OFF AND THE DAP IS INITIALIZED FOR COAST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:686
//#	6. TRACK AND UPDATE FLAGS ARE SET TO ZERO.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:687
//#	7. DISPLAY SYSTEM IS RELEASED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:688
//#	8. THE FOLLOWING ARE PERFORMED FOR EACH OF THE THREE CASES.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:689
//#		A. PROGRAM SELECTED IS P00
// PORT: SOURCE FRESH_START_AND_RESTART.agc:690
//#			1. RENDEZVOUS AND P25 FLAGS ARE RESET.  (KILL P20 AND P25)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:691
//#			2. STATINT1 IS SCHEDULED BY SETTING RESTART GROUP 2.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:692
//#			3. MAJOR MODE 00 IS STORED IN THE MODE REGISTER (MODREG).
// PORT: SOURCE FRESH_START_AND_RESTART.agc:693
//#			4. SUPERBANK 3 IS SELECTED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:694
//#			5. NODOFLAG IS RESET.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:695
//#			6. ALL RESTART GROUPS EXCEPT GROUP2 ARE CLEARED. CONTROL IS TRANSFERRED TO RESTART PROGRAM (GOPROG2)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:696
//#			   WHICH CAUSES ALL CURRENT ACTIVITY TO BE DISCONTINUED AND A 9 MINUTE INTEGRATION CYCLE TO BE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:697
//#			   INITIATED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:698
//#		B. PROGRAM SELECTES IS P20 OR P25.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:699
//#			1. IF THE CURRENT MAJOR MODE IS THE SAME AS THE SELECTED NEWPROGRAM.  THE PROGRAM IS RE-INITIALIZED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:700
//#			   VIA V37XEQ, ALL RESTART GROUPS, EXCEPT GROUP 4 ARE CLEARED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:701
//#			2. IF THE CURRENT MAJOR MODE IS NOT EQUAL TO THE NEW REQUEST, A CHECK IS MADE TO SEE IF THE REQUEST-
// PORT: SOURCE FRESH_START_AND_RESTART.agc:702
//#			   ED MAJOR MODE HAS BEEN RUNNING THE BACKGROUND,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:703
//#			   AND IF IT HAS, NO NEW PROGRAM IS SCHEDULED, THE EXISTING
// PORT: SOURCE FRESH_START_AND_RESTART.agc:704
//#			   P20 OR P25 IS RESTARTED TO CONTINUE, AND ITS MM IS SET.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:705
//#			3. CONTROL IS TRANSFERRED TO GOPROG2.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:706
//#		C. PROGRAM SELECTED IS NEITHER P00, P20, NOR P25
// PORT: SOURCE FRESH_START_AND_RESTART.agc:707
//#			1. V37XEQ IS SCHEDULED (AS A JOB) BY SETTING RESTART GROUP 4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:708
//#			2. ALL CURRENT ACTIVITY EXCEPT RENDEZVOUS AND TRACKING IS DISCONTINUED BY CLEARING ALL RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:709
//#			   GROUPS.  IF THE RENDEZVOUS OR THE P25 FLAG IS ON, GROUP 2 IS NOT CLEARED, ALLOWING THESE PROGRAMS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:710
//#			   TO CONTINUE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:711
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:712
//# INPUT/OUTPUT INFORMATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:713
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:714
//#	A. CALLING SEQUENCE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:715
//#		CONTROL IS DIRECTED TO V37 BY THE VERBFAN ROUTINE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:716
//#		VERBFAN GOES TO C(VERBTAB+C(VERBREG)). VERB 37 = MMCHANG.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:717
//#		MMCHANG EXECUTES A `TC POSTJUMP', CADR V37.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:718
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:719
//#	B. ERASABLE INITIALIZATION		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:720
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:721
//# 	C. OUTPUT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:722
//# Page 227
// PORT: SOURCE FRESH_START_AND_RESTART.agc:723
//#		MAJOR MOD CHANGE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:724
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:725
//#	D. DEBRIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:726
//#		MMNUMBER, MPAC +1, MINDEX, BASETEMP +C(MINDEX), FLAGWRD0, FLAGWRD1, FLAGWRD2, MODREG, GOLOC -1,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:727
//#		GOLOC, GOLOC +1, GOLOC +2, BASETEMP, -PHASE2, PHASE2, -PHASE4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:728
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:729
//# PROGRAM ANALYSIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:730
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:731
//#	A. SUBROUTINES CALLED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:732
//#		ALARM, RELDSP, PINBRNCH, INTSTALL, ENGINOF2, ALLCOAST, V37KLEAN, GOPROG2, FALTON, FINDVAC, SUPERSW,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:733
//#		DSPMM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:734
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:735
//#	B. NORMAL EXIT				TC ENDOFJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:736
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:737
//#	C. ALARMS				1520 (MAJOR MODE CHANGE NOT PERMITTED)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:738
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:739
//V37		TS	MMNUMBER		# SAVE MAJOR MODE
// PORT: Fixed ROM slots 6176.
                    if slot <> 6176 or instruction <> 23037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:740
//		CAF	PRIO30			# RESTART AT PINBALL PRIORITY
// PORT: Fixed ROM slots 6177.
                    if slot <> 6177 or instruction <> 14573 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6178 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:741
//		TS	RESTREG
// PORT: Fixed ROM slots 6178.
                    if slot <> 6178 or instruction <> 22774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22774, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6179 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:742
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:743
//		CA	IMODES30		# IS IMU BEING INITIALIZED
// PORT: Fixed ROM slots 6179.
                        if slot <> 6179 or instruction <> 12994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 706).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:744
//		MASK	BIT6
// PORT: Fixed ROM slots 6180.
                        if slot <> 6180 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 6183 {
                if slot <= 6181 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:745
//		CCS	A
// PORT: Fixed ROM slots 6181.
                    if slot <> 6181 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6182 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:746
//		TCF	CANTROD
// PORT: Fixed ROM slots 6182.
                        if slot <> 6182 or instruction <> 5173 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5173, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:747
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:748
//		CS	MMNUMBER		# IS P70 REQUESTED?
// PORT: Fixed ROM slots 6183.
                        if slot <> 6183 or instruction <> 16893 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 509).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6184 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:749
//		AD	DEC70
// PORT: Fixed ROM slots 6184.
                    if slot <> 6184 or instruction <> 25856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1280), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6185 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:750
//		EXTEND
// PORT: Fixed ROM slots 6185.
                        if slot <> 6185 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:751
//		BZF	SETUP70			# YES
// PORT: Fixed ROM slots 6186.
                        if slot <> 6186 or instruction <> 5371 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5371, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6191 {
            if slot <= 6188 {
                if slot <= 6187 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:752
//		AD	ONE			# IS P71 REQUESTED?
// PORT: Fixed ROM slots 6187.
                    if slot <> 6187 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:753
//		EXTEND
// PORT: Fixed ROM slots 6188.
                    if slot <> 6188 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6189 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:754
//		BZF	SETUP71			# YES
// PORT: Fixed ROM slots 6189.
                    if slot <> 6189 or instruction <> 5370 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5370, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6190 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:755
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:756
//		CA	MMNUMBER		# IS NEW REQUEST P00
// PORT: Fixed ROM slots 6190.
                        if slot <> 6190 or instruction <> 12797 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 509).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:757
//		EXTEND
// PORT: Fixed ROM slots 6191.
                        if slot <> 6191 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6194 {
                if slot <= 6192 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:758
//		BZF	ISSERVON		# YES, CHECK SERVICER STATUS
// PORT: Fixed ROM slots 6192.
                    if slot <> 6192 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6193 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:759
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:760
//		CS	FLAGWRD2		# NO, IS NODO V37 FLAG SET
// PORT: Fixed ROM slots 6193.
                        if slot <> 6193 or instruction <> 16446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 62).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:761
//		MASK	NODOBIT
// PORT: Fixed ROM slots 6194.
                        if slot <> 6194 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 6195 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:762
//		CCS	A
// PORT: Fixed ROM slots 6195.
                    if slot <> 6195 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6196 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:763
//		TCF	CHECKTAB		# NO
// PORT: Fixed ROM slots 6196.
                        if slot <> 6196 or instruction <> 5178 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5178, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:764
//CANTROD		TC	ALARM
// PORT: Fixed ROM slots 6197.
                        if slot <> 6197 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[361] to agcAotUnit361@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:765
//		OCT	1520
// PORT: Fixed ROM slots 6198.
    6198, 1696
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6199–6200.
function agcAotUnit362 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6199 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:766
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:767
//V37BAD		TC	RELDSP			# RELEASES DISPLAY FROM ASTRONAUT
// PORT: Fixed ROM slots 6199.
        if slot <> 6199 or instruction <> 2351 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2351, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:768
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:769
//		TC	POSTJUMP		# BRING BACK LAST NORMAL DISPLAY IF THERE
// PORT: Fixed ROM slots 6200.
        if slot <> 6200 or instruction <> 2461 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2461, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[362] to agcAotUnit362@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:770
//		CADR	PINBRNCH		# WAS ONE.  OTHERWISE DO AN EOJ.
// PORT: Fixed ROM slots 6201.
    6201, 17488
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6202–6204.
function agcAotUnit363 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6202 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:771
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:772
//CHECKTAB	CA	NOV37MM			# INDEX FOR MM TABLES.
// PORT: Fixed ROM slots 6202.
        if slot <> 6202 or instruction <> 13631 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1343), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6203 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:773
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:774
//# Page 228
// PORT: SOURCE FRESH_START_AND_RESTART.agc:775
//AGAINMM		TS	MPAC +1
// PORT: Fixed ROM slots 6203.
            if slot <> 6203 or instruction <> 22637 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22637, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:776
//		NDX	MPAC +1
// PORT: Fixed ROM slots 6204.
            if slot <> 6204 or instruction <> 20589 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20589, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[363] to agcAotUnit363@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:777
//		CA	PREMM1			# OBTAIN WHICH MM THIS IS FOR
// PORT: Fixed ROM slots 6205.
    6205, 27202
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6206–6219.
function agcAotUnit364 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6212 {
        if slot <= 6208 {
            if slot <= 6206 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:778
//		MASK	LOW7
// PORT: Fixed ROM slots 6206.
                if slot <> 6206 or instruction <> 31804 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                    if fixedOperand = 127 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6207 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:779
//		COM
// PORT: Fixed ROM slots 6207.
                    if slot <> 6207 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:780
//		AD	MMNUMBER
// PORT: Fixed ROM slots 6208.
                    if slot <> 6208 or instruction <> 25085 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6210 {
                if slot <= 6209 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:781
//		CCS	A
// PORT: Fixed ROM slots 6209.
                    if slot <> 6209 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:782
//		CCS	MPAC +1			# IF GR, SEE IF ANY MORE IN LIST
// PORT: Fixed ROM slots 6210.
                    if slot <> 6210 or instruction <> 4205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 109).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6211 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:783
//		TCF	AGAINMM			# YES, GET NEXT ONE
// PORT: Fixed ROM slots 6211.
                    if slot <> 6211 or instruction <> 5179 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5179, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:784
//		TCF	V37NONO			# LAST TIME OR PASSED MM
// PORT: Fixed ROM slots 6212.
                    if slot <> 6212 or instruction <> 5330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5330, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6215 {
            if slot <= 6213 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:785
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:786
//		CA	MPAC +1
// PORT: Fixed ROM slots 6213.
                if slot <> 6213 or instruction <> 12397 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 109).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6214 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:787
//		TS	MINDEX			# SAVE INDEX FOR LATER
// PORT: Fixed ROM slots 6214.
                    if slot <> 6214 or instruction <> 23036 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23036, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:788
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:789
//ISSERVON	CS	FLAGWRD7		# V37 FLAG SET -- I.E., IS SERVICER GOING
// PORT: Fixed ROM slots 6215.
                    if slot <> 6215 or instruction <> 16451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 67).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6217 {
                if slot <= 6216 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:790
//		MASK	V37FLBIT
// PORT: Fixed ROM slots 6216.
                    if slot <> 6216 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:791
//		CCS	A
// PORT: Fixed ROM slots 6217.
                    if slot <> 6217 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6218 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:792
//		TCF	CANV37			# NO
// PORT: Fixed ROM slots 6218.
                    if slot <> 6218 or instruction <> 5212 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5212, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:793
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:794
//		TC	DOWNFLAG		# YES, TURN OFF THE AVERAGE FLAG AND
// PORT: Fixed ROM slots 6219.
                    if slot <> 6219 or instruction <> 2894 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[364] to agcAotUnit364@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:795
//		ADRES	AVEGFLAG		# WAIT FOR SERVICER TO RETURN TO CANV37
// PORT: Fixed ROM slots 6220.
    6220, 230
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6221–6241.
function agcAotUnit365 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6230 {
        if slot <= 6225 {
            if slot <= 6222 {
                if slot <= 6221 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:796
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:797
//		CAF	V37RETAD
// PORT: Fixed ROM slots 6221.
                    if slot <> 6221 or instruction <> 13558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1270), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:798
//		TS	OUTROUTE
// PORT: Fixed ROM slots 6222.
                    if slot <> 6222 or instruction <> 23216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23216, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6223 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:799
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:800
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 6223.
                    if slot <> 6223 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6224 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:801
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:802
//V37RET		CS	FLAGWRD0		# IS P20 OR P22 RUNNING?
// PORT: Fixed ROM slots 6224.
                        if slot <> 6224 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:803
//		MASK	RNDVZBIT
// PORT: Fixed ROM slots 6225.
                        if slot <> 6225 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 6227 {
                if slot <= 6226 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:804
//		CCS	A
// PORT: Fixed ROM slots 6226.
                    if slot <> 6226 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:805
//		TCF	+2			# NO. CHECK FOR P25.
// PORT: Fixed ROM slots 6227.
                    if slot <> 6227 or instruction <> 5205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5205, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6228 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:806
//		TCF	2.7SPT			# YES. DO 2.7SPOT
// PORT: Fixed ROM slots 6228.
                    if slot <> 6228 or instruction <> 5210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5210, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6229 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:807
//		CS	FLAGWRD0		# IS P25 RUNNING?
// PORT: Fixed ROM slots 6229.
                        if slot <> 6229 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:808
//		MASK	P25FLBIT
// PORT: Fixed ROM slots 6230.
                        if slot <> 6230 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 6235 {
            if slot <= 6232 {
                if slot <= 6231 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:809
//		CCS	A
// PORT: Fixed ROM slots 6231.
                    if slot <> 6231 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:810
//2.0SPT		CA	OCT37667
// PORT: Fixed ROM slots 6232.
                    if slot <> 6232 or instruction <> 13559 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1271), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6233 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:811
//2.11SPT		AD	BIT5
// PORT: Fixed ROM slots 6233.
                    if slot <> 6233 or instruction <> 27111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6234 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:812
//2.7SPT		AD	OCT40072
// PORT: Fixed ROM slots 6234.
                        if slot <> 6234 or instruction <> 25848 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1272), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:813
//		TC	PHSCHNGA
// PORT: Fixed ROM slots 6235.
                        if slot <> 6235 or instruction <> 2799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6238 {
                if slot <= 6236 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:814
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:815
//CANV37		CAF	ZERO
// PORT: Fixed ROM slots 6236.
                    if slot <> 6236 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6237 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:816
//		EXTEND
// PORT: Fixed ROM slots 6237.
                        if slot <> 6237 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:817
//		WRITE	SUPERBNK
// PORT: Fixed ROM slots 6238.
                        if slot <> 6238 or instruction <> 519 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6239 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:818
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:819
//		CAF	R00AD
// PORT: Fixed ROM slots 6239.
                    if slot <> 6239 or instruction <> 13557 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1269), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6240 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:820
//		TS	TEMPFLSH
// PORT: Fixed ROM slots 6240.
                        if slot <> 6240 or instruction <> 22780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22780, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:821
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:822
//		TC	PHASCHNG
// PORT: Fixed ROM slots 6241.
                        if slot <> 6241 or instruction <> 2795 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2795, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[365] to agcAotUnit365@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:823
//		OCT	14
// PORT: Fixed ROM slots 6242.
    6242, 24
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6243–6243.
function agcAotUnit366 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:824
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:825
//# Page 229
// PORT: SOURCE FRESH_START_AND_RESTART.agc:826
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:827
//R00		TC	INTPRET
// PORT: Fixed ROM slots 6243.
    if slot <> 6243 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[366] to agcAotUnit366@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:828
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:829
//		CALL				# WAIT FOR INTEGRATION TO FINISH
// PORT: Fixed ROM slots 6244.
    6244, 65320,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:830
//			INTSTALL
// PORT: Fixed ROM slots 6245.
    6245, 24088,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:831
//DUMMYAD		EXIT
// PORT: Fixed ROM slots 6246.
    6246, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6247–6247.
function agcAotUnit367 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:832
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:833
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 6247.
    if slot <> 6247 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[367] to agcAotUnit367@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:834
//		ADRES	3AXISFLG		# RESET 3-AXIT FLAG
// PORT: Fixed ROM slots 6248.
    6248, 168
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6249–6251.
function agcAotUnit368 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6249 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:835
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:836
//		CAF	LRBYBIT			# CLEAN UP THE R12 FLAGWORD.
// PORT: Fixed ROM slots 6249.
        if slot <> 6249 or instruction <> 14813 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6250 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:837
//		TS	FLGWRD11
// PORT: Fixed ROM slots 6250.
            if slot <> 6250 or instruction <> 22599 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22599, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:838
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:839
//		TC	DOWNFLAG		# INSURE THAT THE R04FLAG IS CLEAR.
// PORT: Fixed ROM slots 6251.
            if slot <> 6251 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[368] to agcAotUnit368@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:840
//		ADRES	R04FLAG
// PORT: Fixed ROM slots 6252.
    6252, 102
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6253–6253.
function agcAotUnit369 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:841
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:842
//		TC	DOWNFLAG		# INSURE MUNFLAG IS CLEAR.
// PORT: Fixed ROM slots 6253.
    if slot <> 6253 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[369] to agcAotUnit369@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:843
//		ADRES	MUNFLAG
// PORT: Fixed ROM slots 6254.
    6254, 194
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6255–6255.
function agcAotUnit370 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:844
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:845
//		TC	DOWNFLAG		# ALLOW X-AXIS OVERRIDE.
// PORT: Fixed ROM slots 6255.
    if slot <> 6255 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[370] to agcAotUnit370@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:846
//		ADRES	XOVINFLG
// PORT: Fixed ROM slots 6256.
    6256, 402
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6257–6276.
function agcAotUnit371 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6266 {
        if slot <= 6261 {
            if slot <= 6258 {
                if slot <= 6257 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:847
//		CCS	MMNUMBER		# IS THIS A POOH REQUEST
// PORT: Fixed ROM slots 6257.
                    if slot <> 6257 or instruction <> 4605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:848
//		TCF	NOUVEAU			# NO, PICK UP NEW PROGRAM
// PORT: Fixed ROM slots 6258.
                    if slot <> 6258 or instruction <> 5320 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5320, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6259 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:849
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:850
//POOH		TC	RELDSP			# RELEASE DISPLAY SYSTEM
// PORT: Fixed ROM slots 6259.
                    if slot <> 6259 or instruction <> 2351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2351, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6260 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:851
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:852
//		CAF	PRIO5			# SET VARIABLE RESTART PRIORITY FOR
// PORT: Fixed ROM slots 6260.
                        if slot <> 6260 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:853
//		TS	PHSPRDT2		# P00 INTEGRATION.
// PORT: Fixed ROM slots 6261.
                        if slot <> 6261 or instruction <> 23086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6263 {
                if slot <= 6262 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:854
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:855
//		TC	CLRADMOD		# CLRADMOD DOES AN INHINT.
// PORT: Fixed ROM slots 6262.
                    if slot <> 6262 or instruction <> 3081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3081, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:856
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:857
//		CS	NODOBIT			# TURN OFF NODOFLAG.
// PORT: Fixed ROM slots 6263.
                    if slot <> 6263 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6264 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:858
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 6264.
                    if slot <> 6264 or instruction <> 28734 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 62).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6265 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:859
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 6265.
                        if slot <> 6265 or instruction <> 22590 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22590, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:860
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:861
//		CA	FIVE			# SET RESTART FOR STATEINT1
// PORT: Fixed ROM slots 6266.
                        if slot <> 6266 or instruction <> 14830 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6271 {
            if slot <= 6268 {
                if slot <= 6267 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:862
//		TS	L
// PORT: Fixed ROM slots 6267.
                    if slot <> 6267 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:863
//		COM
// PORT: Fixed ROM slots 6268.
                    if slot <> 6268 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6269 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:864
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 6269.
                    if slot <> 6269 or instruction <> 21997 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6270 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:865
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:866
//		CS	OCT700			# TURN OFF P20, P25, IMU IN USE FLAG
// PORT: Fixed ROM slots 6270.
                        if slot <> 6270 or instruction <> 17657 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1273), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:867
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6271.
                        if slot <> 6271 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6273 {
                if slot <= 6272 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:868
//		TS	FLAGWRD0		#			 REMDFLG
// PORT: Fixed ROM slots 6272.
                    if slot <> 6272 or instruction <> 22588 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22588, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:869
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:870
//		CAF	DNLADP00
// PORT: Fixed ROM slots 6273.
                    if slot <> 6273 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 6274 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:871
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:872
//SEUDOP00	TS	DNLSTCOD		# SET UP APPROPRIATE DOWNLIST CODE
// PORT: Fixed ROM slots 6274.
                    if slot <> 6274 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6275 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:873
//		TS	AGSWORD			#   (CURRENT LIST WILL BE COMPLETED BEFORE
// PORT: Fixed ROM slots 6275.
                        if slot <> 6275 or instruction <> 23252 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23252, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:874
//						#     NEW ONE IS STARTED)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:875
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6276.
                        if slot <> 6276 or instruction <> 2492 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2492, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[371] to agcAotUnit371@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:876
//		CADR	ENGINOF1
// PORT: Fixed ROM slots 6277.
    6277, 63194
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6278–6278.
function agcAotUnit372 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:877
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:878
//# Page 230
// PORT: SOURCE FRESH_START_AND_RESTART.agc:879
//		TC	IBNKCALL		# INSURE ALLCOAST.
// PORT: Fixed ROM slots 6278.
    if slot <> 6278 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[372] to agcAotUnit372@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:880
//		CADR	ALLCOAST		# DOES A RESTORDB.
// PORT: Fixed ROM slots 6279.
    6279, 33032
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6280–6284.
function agcAotUnit373 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6281 {
        if slot <= 6280 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:881
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:882
//		CS	OCT120			# TURN OFF TRACK, UPDATE FLAGS
// PORT: Fixed ROM slots 6280.
            if slot <> 6280 or instruction <> 18941 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2557), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:883
//		TS	EBANKTEM
// PORT: Fixed ROM slots 6281.
            if slot <> 6281 or instruction <> 23098 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23098, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6282 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:884
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 6282.
            if slot <> 6282 or instruction <> 28733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6283 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:885
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 6283.
                if slot <> 6283 or instruction <> 22589 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22589, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:886
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:887
//		TC	IBNKCALL		# KILL GROUPS 1,3,5,6
// PORT: Fixed ROM slots 6284.
                if slot <> 6284 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[373] to agcAotUnit373@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:888
//		CADR	V37KLEAN
// PORT: Fixed ROM slots 6285.
    6285, 11092
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6286–6288.
function agcAotUnit374 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6286 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:889
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:890
//		CCS	MMNUMBER		# IS IT POOH
// PORT: Fixed ROM slots 6286.
        if slot <> 6286 or instruction <> 4605 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 509).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6287 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:891
//		TCF	RENDV00			# NO
// PORT: Fixed ROM slots 6287.
            if slot <> 6287 or instruction <> 5270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5270, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:892
//GOMOD		TC	IBNKCALL		# REDUNDANT EXCEPT FOR GROUP 4
// PORT: Fixed ROM slots 6288.
            if slot <> 6288 or instruction <> 2492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[374] to agcAotUnit374@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:893
//		CADR	P00KLEAN
// PORT: Fixed ROM slots 6289.
    6289, 11086
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6290–6292.
function agcAotUnit375 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6290 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:894
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:895
//		CA	MMNUMBER
// PORT: Fixed ROM slots 6290.
        if slot <> 6290 or instruction <> 12797 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 509).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6291 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:896
//		TS	MODREG
// PORT: Fixed ROM slots 6291.
            if slot <> 6291 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:897
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:898
//GOGOPROG	TC	POSTJUMP
// PORT: Fixed ROM slots 6292.
            if slot <> 6292 or instruction <> 2461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[375] to agcAotUnit375@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:899
//		CADR	GOPROG2
// PORT: Fixed ROM slots 6293.
    6293, 11248
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6294–6312.
function agcAotUnit376 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6302 {
        if slot <= 6297 {
            if slot <= 6295 {
                if slot <= 6294 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:900
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:901
//RENDV00		CS	MODREG			# IS CURRENT PROGRAM 22
// PORT: Fixed ROM slots 6294.
                    if slot <> 6294 or instruction <> 16905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 521).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:902
//		AD	OCT26
// PORT: Fixed ROM slots 6295.
                    if slot <> 6295 or instruction <> 25814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1238), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6296 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:903
//		EXTEND
// PORT: Fixed ROM slots 6296.
                    if slot <> 6296 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:904
//		BZF	RESET22			# YES -- CLEAR RENDEZVOUS FLAG
// PORT: Fixed ROM slots 6297.
                    if slot <> 6297 or instruction <> 5288 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5288, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6299 {
                if slot <= 6298 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:905
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:906
//		CS	MMNUMBER		# IS NE PROGRAM P22
// PORT: Fixed ROM slots 6298.
                    if slot <> 6298 or instruction <> 16893 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 509).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:907
//		AD	OCT26
// PORT: Fixed ROM slots 6299.
                    if slot <> 6299 or instruction <> 25814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1238), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6300 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:908
//		EXTEND
// PORT: Fixed ROM slots 6300.
                    if slot <> 6300 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6301 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:909
//		BZF	RESET22
// PORT: Fixed ROM slots 6301.
                        if slot <> 6301 or instruction <> 5288 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5288, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:910
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:911
//		AD	NEG2			# IS NEW PROGRAM = P20 OR P25
// PORT: Fixed ROM slots 6302.
                        if slot <> 6302 or instruction <> 28646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6307 {
            if slot <= 6304 {
                if slot <= 6303 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:912
//		EXTEND
// PORT: Fixed ROM slots 6303.
                    if slot <> 6303 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:913
//		BZF	RENDN00			# YES
// PORT: Fixed ROM slots 6304.
                    if slot <> 6304 or instruction <> 5298 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5298, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6305 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:914
//		AD	FIVE			# 25
// PORT: Fixed ROM slots 6305.
                    if slot <> 6305 or instruction <> 27118 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6306 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:915
//		EXTEND
// PORT: Fixed ROM slots 6306.
                        if slot <> 6306 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:916
//		BZF	RENDN00			# YES
// PORT: Fixed ROM slots 6307.
                        if slot <> 6307 or instruction <> 5298 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5298, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6309 {
                if slot <= 6308 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:917
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:918
//		CA	OCT500			# NO, IS EITHER P20 OR P25 RUNNING
// PORT: Fixed ROM slots 6308.
                    if slot <> 6308 or instruction <> 13524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1236), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:919
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6309.
                    if slot <> 6309 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6310 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:920
//		CCS	A
// PORT: Fixed ROM slots 6310.
                    if slot <> 6310 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6311 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:921
//		TCF	P00FIZZ			# YES, LEAVE GROUP 2 TO PICK UP P20 OR P25
// PORT: Fixed ROM slots 6311.
                        if slot <> 6311 or instruction <> 5295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:922
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:923
//RESET22		CS	OCT700			# CLEAR RENDEZVOUS, P25
// PORT: Fixed ROM slots 6312.
                        if slot <> 6312 or instruction <> 17657 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1273), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[376] to agcAotUnit376@.

// PORT: Physical bank 04. Shared continuation entries, slots 6313–6348.
function agcAotUnit377 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6330 {
        if slot <= 6321 {
            if slot <= 6316 {
                if slot <= 6314 {
                    if slot <= 6313 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:924
//		MASK	FLAGWRD0		# AND IMU IN USE FLAGS
// PORT: Fixed ROM slots 6313.
                        if slot <> 6313 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:925
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 6314.
                        if slot <> 6314 or instruction <> 22588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6315 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:926
//		TC	CLRADMOD
// PORT: Fixed ROM slots 6315.
                        if slot <> 6315 or instruction <> 3081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:927
//# Page 231
// PORT: SOURCE FRESH_START_AND_RESTART.agc:928
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:929
//KILL2		EXTEND				# NO, KILL 2
// PORT: Fixed ROM slots 6316.
                        if slot <> 6316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6318 {
                    if slot <= 6317 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:930
//		DCA	NEG0
// PORT: Fixed ROM slots 6317.
                        if slot <> 6317 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:931
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 6318.
                        if slot <> 6318 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6319 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:932
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:933
//P00FIZZ		CAF	V37QCAD			# RESTART POINT FOR V37XEQ
// PORT: Fixed ROM slots 6319.
                        if slot <> 6319 or instruction <> 13556 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1268), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6320 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:934
//		TS	TEMPFLSH
// PORT: Fixed ROM slots 6320.
                            if slot <> 6320 or instruction <> 22780 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22780, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:935
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:936
//		TCF	GOGOPROG
// PORT: Fixed ROM slots 6321.
                            if slot <> 6321 or instruction <> 5268 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5268, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 6325 {
                if slot <= 6323 {
                    if slot <= 6322 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:937
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:938
//RENDN00		CS	MODREG
// PORT: Fixed ROM slots 6322.
                        if slot <> 6322 or instruction <> 16905 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 521).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:939
//		AD	OCT24
// PORT: Fixed ROM slots 6323.
                        if slot <> 6323 or instruction <> 27655 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6324 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:940
//		EXTEND
// PORT: Fixed ROM slots 6324.
                        if slot <> 6324 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:941
//		BZF	KILL2			# P20 OR P25 ON TOP OF P20 OR P25 --
// PORT: Fixed ROM slots 6325.
                        if slot <> 6325 or instruction <> 5292 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6327 {
                    if slot <= 6326 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:942
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:943
//		AD	FIVE
// PORT: Fixed ROM slots 6326.
                        if slot <> 6326 or instruction <> 27118 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:944
//		EXTEND
// PORT: Fixed ROM slots 6327.
                        if slot <> 6327 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6328 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:945
//		BZF	KILL2
// PORT: Fixed ROM slots 6328.
                        if slot <> 6328 or instruction <> 5292 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6329 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:946
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:947
//		CA	OCT500
// PORT: Fixed ROM slots 6329.
                            if slot <> 6329 or instruction <> 13524 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1236), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:948
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6330.
                            if slot <> 6330 or instruction <> 28732 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 60).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 6339 {
            if slot <= 6334 {
                if slot <= 6332 {
                    if slot <= 6331 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:949
//		AD	MMNUMBER
// PORT: Fixed ROM slots 6331.
                        if slot <> 6331 or instruction <> 25085 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 509).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:950
//		COM
// PORT: Fixed ROM slots 6332.
                        if slot <> 6332 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6333 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:951
//		AD	P20REG			# IS IT 20 AND IS RENDEZVOUS FLAG ON
// PORT: Fixed ROM slots 6333.
                        if slot <> 6333 or instruction <> 25815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1239), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:952
//		EXTEND
// PORT: Fixed ROM slots 6334.
                        if slot <> 6334 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6336 {
                    if slot <= 6335 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:953
//		BZF	STATQUO			# YES
// PORT: Fixed ROM slots 6335.
                        if slot <> 6335 or instruction <> 5316 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5316, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:954
//		AD	OCT305			# IS IT 25 AND IS P25 BIT ON
// PORT: Fixed ROM slots 6336.
                        if slot <> 6336 or instruction <> 25813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1237), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6337 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:955
//		EXTEND
// PORT: Fixed ROM slots 6337.
                        if slot <> 6337 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6338 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:956
//		BZF	STATQUO			# YES, LEAVE AS IS
// PORT: Fixed ROM slots 6338.
                            if slot <> 6338 or instruction <> 5316 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:957
//		TCF	KILL2
// PORT: Fixed ROM slots 6339.
                            if slot <> 6339 or instruction <> 5292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5292, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 6343 {
                if slot <= 6341 {
                    if slot <= 6340 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:958
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:959
//STATQUO		CS	FLAGWRD1		# SET TRACKFLAG
// PORT: Fixed ROM slots 6340.
                        if slot <> 6340 or instruction <> 16445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 61).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:960
//		MASK	OCT120			#	UPDATE FLAG
// PORT: Fixed ROM slots 6341.
                        if slot <> 6341 or instruction <> 31229 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2557), 32768).
                            if fixedOperand = 80 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16 + mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6342 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:961
//		ADS	FLAGWRD1
// PORT: Fixed ROM slots 6342.
                        if slot <> 6342 or instruction <> 11325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:962
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:963
//		TCF	GOMOD
// PORT: Fixed ROM slots 6343.
                        if slot <> 6343 or instruction <> 5264 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5264, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6345 {
                    if slot <= 6344 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:964
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:965
//NOUVEAU		CAF	OCT500			# IS P20 OR P25 FLAG SET
// PORT: Fixed ROM slots 6344.
                        if slot <> 6344 or instruction <> 13524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1236), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:966
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6345.
                        if slot <> 6345 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6346 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:967
//		CCS	A
// PORT: Fixed ROM slots 6346.
                        if slot <> 6346 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 6347 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:968
//		TCF	+3			# YES
// PORT: Fixed ROM slots 6347.
                            if slot <> 6347 or instruction <> 5326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:969
//		TC	DOWNFLAG		# NO, RESET IMUINUSE FLAG
// PORT: Fixed ROM slots 6348.
                            if slot <> 6348 or instruction <> 2894 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[377] to agcAotUnit377@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:970
//		ADRES	IMUSE
// PORT: Fixed ROM slots 6349.
    6349, 14
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6350–6350.
function agcAotUnit378 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:971
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:972
//		INDEX	MINDEX
// PORT: Fixed ROM slots 6350.
    if slot <> 6350 or instruction <> 20988 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20988, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20988, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[378] to agcAotUnit378@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:973
//		CAF	DNLADMM1		# OBTAIN APPROPIRATE DOWNLIST ADDRESS
// PORT: Fixed ROM slots 6351.
    6351, 27264
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6352–6355.
function agcAotUnit379 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6353 {
        if slot <= 6352 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:974
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:975
//		INHINT
// PORT: Fixed ROM slots 6352.
            if slot <> 6352 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:976
//		TCF	SEUDOP00
// PORT: Fixed ROM slots 6353.
            if slot <> 6353 or instruction <> 5250 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5250, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6354 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:977
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:978
//V37NONO		TC	FALTON			# COME HERE IF MM REQUESTED DOESN'T EXIST
// PORT: Fixed ROM slots 6354.
            if slot <> 6354 or instruction <> 2292 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2292, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:979
//# Page 232
// PORT: SOURCE FRESH_START_AND_RESTART.agc:980
//		TCF	V37BAD
// PORT: Fixed ROM slots 6355.
            if slot <> 6355 or instruction <> 5175 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5175, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[379] to agcAotUnit379@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:981
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:982
//OCT00010	EQUALS	BIT4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:983
//OCT500		OCT	500			# BITS 7 AND 9
// PORT: Fixed ROM slots 6356.
    6356, 640,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:984
//OCT305		OCT	305
// PORT: Fixed ROM slots 6357.
    6357, 394,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:985
//OCT26		OCT	26
// PORT: Fixed ROM slots 6358.
    6358, 44,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:986
//P20REG		OCT	124
// PORT: Fixed ROM slots 6359.
    6359, 168
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6360–6361.
function agcAotUnit380 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6360 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:987
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:988
//V37XEQ		INHINT
// PORT: Fixed ROM slots 6360.
        if slot <> 6360 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:989
//		INDEX	MINDEX
// PORT: Fixed ROM slots 6361.
        if slot <> 6361 or instruction <> 20988 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20988, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20988, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[380] to agcAotUnit380@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:990
//		CAF	PREMM1			# OBTAIN PRIO, EBANK, AND MM
// PORT: Fixed ROM slots 6362.
    6362, 27202
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6363–6374.
function agcAotUnit381 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6368 {
        if slot <= 6365 {
            if slot <= 6363 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:991
//		TS	MMTEMP
// PORT: Fixed ROM slots 6363.
                if slot <> 6363 or instruction <> 23088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23088, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6364 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:992
//		TS	CYR			# SHIFT RIGHT TO BITS 14-10
// PORT: Fixed ROM slots 6364.
                    if slot <> 6364 or instruction <> 22544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:993
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:994
//		CA	CYR
// PORT: Fixed ROM slots 6365.
                    if slot <> 6365 or instruction <> 12304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 16).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6366 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:995
//		MASK	PRIO37
// PORT: Fixed ROM slots 6366.
                if slot <> 6366 or instruction <> 32725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4053), 32768).
                    if fixedOperand = 15872 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 32) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6367 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:996
//		TS	PHSPRDT4		# PRESET GROUP 4 RESTART PRIORITY
// PORT: Fixed ROM slots 6367.
                    if slot <> 6367 or instruction <> 23090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:997
//		TS	NEWPRIO			# STORE PRIO FOR SPVAC
// PORT: Fixed ROM slots 6368.
                    if slot <> 6368 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6371 {
            if slot <= 6369 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:998
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:999
//		CA	MMTEMP			# OBTAIN EBANK -- BITS 8, 9, 10 OF MMTEMP.
// PORT: Fixed ROM slots 6369.
                if slot <> 6369 or instruction <> 12848 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 560).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6370 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1000
//		EXTEND
// PORT: Fixed ROM slots 6370.
                    if slot <> 6370 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1001
//		MP	BIT8
// PORT: Fixed ROM slots 6371.
                    if slot <> 6371 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2532, readEffective:call(words, 2532)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6372 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1002
//		MASK	LOW3
// PORT: Fixed ROM slots 6372.
                if slot <> 6372 or instruction <> 31215 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    if fixedOperand = 7 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6373 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1003
//		TS	L
// PORT: Fixed ROM slots 6373.
                    if slot <> 6373 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1004
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1005
//		INDEX	MINDEX
// PORT: Fixed ROM slots 6374.
                    if slot <> 6374 or instruction <> 20988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20988, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[381] to agcAotUnit381@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1006
//		CAF	FCADRMM1
// PORT: Fixed ROM slots 6375.
    6375, 27142
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6376–6387.
function agcAotUnit382 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6381 {
        if slot <= 6378 {
            if slot <= 6376 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1007
//		TS	BASETEMP		# MAKE BBCON BY ADDING HI5 OR FCADR
// PORT: Fixed ROM slots 6376.
                if slot <> 6376 or instruction <> 23089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6377 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1008
//		MASK	HI5
// PORT: Fixed ROM slots 6377.
                    if slot <> 6377 or instruction <> 30952 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1009
//		ADS	L
// PORT: Fixed ROM slots 6378.
                    if slot <> 6378 or instruction <> 11265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6379 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1010
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1011
//		CA	BASETEMP		# OBTAIN GENADR PORTION OF 2CADR.
// PORT: Fixed ROM slots 6379.
                if slot <> 6379 or instruction <> 12849 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 561).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6380 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1012
//		MASK	LOW10
// PORT: Fixed ROM slots 6380.
                    if slot <> 6380 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        if fixedOperand = 1023 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1013
//		AD	BIT11
// PORT: Fixed ROM slots 6381.
                    if slot <> 6381 or instruction <> 27105 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 6384 {
            if slot <= 6382 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1014
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1015
//		TC	SPVAC
// PORT: Fixed ROM slots 6382.
                if slot <> 6382 or instruction <> 2638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6383 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1016
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1017
//V37XEQC		CA	MMTEMP			# UPON RETURN FROM FINDVAC PLACE THE
// PORT: Fixed ROM slots 6383.
                    if slot <> 6383 or instruction <> 12848 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 560).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1018
//		MASK	LOW7			# NEW MM IN MODREG (THE LOW 7 BITS OF
// PORT: Fixed ROM slots 6384.
                    if slot <> 6384 or instruction <> 31804 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 3132), 32768).
                        if fixedOperand = 127 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6385 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1019
//		TC	NEWMODEA		# PHSPRDT1)
// PORT: Fixed ROM slots 6385.
                if slot <> 6385 or instruction <> 2764 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2764, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6386 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1020
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1021
//		TC	RELDSP			# RELEASE DISPLAY
// PORT: Fixed ROM slots 6386.
                    if slot <> 6386 or instruction <> 2351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2351, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1022
//		TC	ENDOFJOB		# AND EXIT
// PORT: Fixed ROM slots 6387.
                    if slot <> 6387 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[382] to agcAotUnit382@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1023
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1024
//NEG7		EQUALS	OCT77770
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1025
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1026
//MMTEMP		EQUALS	PHSPRDT3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1027
//BASETEMP	EQUALS	TBASE4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1028
//V37QCAD		CADR	V37XEQ +3
// PORT: Fixed ROM slots 6388.
    6388, 8630,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1029
//R00AD		CADR	DUMMYAD
// PORT: Fixed ROM slots 6389.
    6389, 8396,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1030
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1031
//# Page 233
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1032
//V37RETAD	CADR	V37RET
// PORT: Fixed ROM slots 6390.
    6390, 8352,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1033
//OCT37667	OCT	37667
// PORT: Fixed ROM slots 6391.
    6391, 32622,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1034
//OCT40072	OCT	40072
// PORT: Fixed ROM slots 6392.
    6392, 32884,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1035
//OCT700		OCT	700
// PORT: Fixed ROM slots 6393.
    6393, 896
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6394–6399.
function agcAotUnit383 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6396 {
        if slot <= 6394 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1036
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1037
//SETUP71		CAF	THREE
// PORT: Fixed ROM slots 6394.
            if slot <> 6394 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6395 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1038
//SETUP70		TS	Q
// PORT: Fixed ROM slots 6395.
                if slot <> 6395 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1039
//		EXTEND
// PORT: Fixed ROM slots 6396.
                if slot <> 6396 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6397 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1040
//		DCA	P70CADR
// PORT: Fixed ROM slots 6397.
            if slot <> 6397 or instruction <> 13570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1282, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6398 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1041
//		AD	Q
// PORT: Fixed ROM slots 6398.
                if slot <> 6398 or instruction <> 24578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1042
//		DTCB
// PORT: Fixed ROM slots 6399.
                if slot <> 6399 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[383] to agcAotUnit383@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1043
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1044
//DEC70		DEC	70
// PORT: Fixed ROM slots 6400.
    6400, 140,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1045
//		EBANK=	R
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1046
//P70CADR		2CADR	P70
// PORT: Fixed ROM slots 6401 6402.
    6401, 2164, 6402, 34926,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1047
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1048
//# FOR VERB 37 TWO TABLES ARE MAINTAINED.  EACH TABLE HAS AN ETRY FOR EACH
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1049
//# MAJOR MODE THAT CAN BE STARTED FROM THE KEYBOARD.  THE ENTRIES ARE PUT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1050
//# INTO THE TABLE WITH THE ENTRY FOR THE HIGHEST MAJOR MODE COMING FIRST,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1051
//# TO THE LOWEST MAJOR MODE WHICH IS THE LAST ENTRY IN EACH TABLE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1052
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1053
//# THE FCADRMM TABLE CONTAINS THE FCADR OF THE STARTING JOB OF
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1054
//# THE MAJOR MODE.  FOR EXAMPLE,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1055
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1056
//#	FCADRMM1	FCADR	P79		# START OF P 79
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1057
//#			FCADR	PROG18		# START OF P 18
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1058
//#			FCADR	P01		# START OF P 01
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1059
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1060
//# NOTE:		THE FIRST ENTRY MUST BE LABELED FCADRMM1.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1061
//# -----
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1062
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1063
//FCADRMM1	FCADR	P79
// PORT: Fixed ROM slots 6403.
    6403, 59052,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1064
//		FCADR	P78
// PORT: Fixed ROM slots 6404.
    6404, 58744,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1065
//		FCADR	P76
// PORT: Fixed ROM slots 6405.
    6405, 22798,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1066
//		FCADR	P75
// PORT: Fixed ROM slots 6406.
    6406, 60338,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1067
//		FCADR	P74
// PORT: Fixed ROM slots 6407.
    6407, 60110,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1068
//		FCADR	P73
// PORT: Fixed ROM slots 6408.
    6408, 59680,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1069
//		FCADR	P72
// PORT: Fixed ROM slots 6409.
    6409, 59442,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1070
//		FCADR	LANDJUNK
// PORT: Fixed ROM slots 6410.
    6410, 51400,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1071
//		FCADR	P63LM
// PORT: Fixed ROM slots 6411.
    6411, 54268,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1072
//		FCADR	P57
// PORT: Fixed ROM slots 6412.
    6412, 28056,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1073
//		FCADR	PROG52
// PORT: Fixed ROM slots 6413.
    6413, 26704,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1074
//		FCADR	P51
// PORT: Fixed ROM slots 6414.
    6414, 26158,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1075
//		FCADR	P47LM
// PORT: Fixed ROM slots 6415.
    6415, 63036,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1076
//		FCADR	P42LM
// PORT: Fixed ROM slots 6416.
    6416, 62992,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1077
//		FCADR	P41LM
// PORT: Fixed ROM slots 6417.
    6417, 62836,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1078
//		FCADR	P40LM
// PORT: Fixed ROM slots 6418.
    6418, 62670,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1079
//		FCADR	P39
// PORT: Fixed ROM slots 6419.
    6419, 59042,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1080
//		FCADR	P38
// PORT: Fixed ROM slots 6420.
    6420, 58738,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1081
//# Page 234
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1082
//		FCADR	P35
// PORT: Fixed ROM slots 6421.
    6421, 60330,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1083
//		FCADR	P34
// PORT: Fixed ROM slots 6422.
    6422, 60106,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1084
//		FCADR	P33
// PORT: Fixed ROM slots 6423.
    6423, 59676,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1085
//		FCADR	P32
// PORT: Fixed ROM slots 6424.
    6424, 59438,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1086
//		FCADR	P31
// PORT: Fixed ROM slots 6425.
    6425, 59984,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1087
//		FCADR	P30
// PORT: Fixed ROM slots 6426.
    6426, 59392,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1088
//		FCADR	PROG25
// PORT: Fixed ROM slots 6427.
    6427, 41480,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1089
//		FCADR	PROG22
// PORT: Fixed ROM slots 6428.
    6428, 40960,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1090
//		FCADR	PROG21
// PORT: Fixed ROM slots 6429.
    6429, 42634,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1091
//		FCADR	PROG20
// PORT: Fixed ROM slots 6430.
    6430, 40960,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1092
//		FCADR	P12LM
// PORT: Fixed ROM slots 6431.
    6431, 49250,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1093
//		FCADR	P06
// PORT: Fixed ROM slots 6432.
    6432, 65370,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1094
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1095
//# THE PREMM TABLE CONTAINS THE E-BANK, MAJOR MODE, AND PRIORITY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1096
//# INFORMATION, IT IS IN THE FOLLOWING FORM,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1097
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1098
//#	PPP PPE EEM MMM MMM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1099
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1100
//#	WHERE THE	7 M BITS CONTAIN THE MAJOR MODE NUMBER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1101
//#			3 E BITS CONTAIN THE E-BANK NUMBER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1102
//#			5 P BITS CONTAIN THE PRIORITY AT WHICH THE JOB IS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1103
//#			    TO BE STARTED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1104
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1105
//#	FOR EXAMPLE,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1106
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1107
//#		PREMM1		OCT	67213		# PRIORITY	33
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1108
//#							# E-BANK	5
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1109
//#							# MAJOR MODE	11
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1110
//#				OCT	25437		# PRIORITY	12
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1111
//#							# E-BANK	6
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1112
//#							# MAJOR MODE	31
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1113
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1114
//# NOTE:		THE FIRST ENTRY MUST BE LABELED PREMM1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1115
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1116
//PREMM1		OCT	27717		# MM 79		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6433.
    6433, 24478,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1117
//		OCT	27716		# MM 78		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6434.
    6434, 24476,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1118
//		OCT	27714		# MM 76		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6435.
    6435, 24472,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1119
//		OCT	27713		# MM 75		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6436.
    6436, 24470,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1120
//		OCT	27712		# MM 74		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6437.
    6437, 24468,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1121
//		OCT	27711		# MM 73		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6438.
    6438, 24466,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1122
//		OCT	27710		# MM 72		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6439.
    6439, 24464,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1123
//		OCT	27704		# MM 68		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6440.
    6440, 24456,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1124
//		OCT	27677		# MM 63		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6441.
    6441, 24446,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1125
//		OCT	27271		# MM 57		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6442.
    6442, 23922,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1126
//		OCT	27264		# MM 52		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6443.
    6443, 23912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1127
//		OCT	27263		# MM 51		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6444.
    6444, 23910,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1128
//		OCT	27657		# MM 47		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6445.
    6445, 24414,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1129
//		OCT	27652		# MM 42		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6446.
    6446, 24404,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1130
//		OCT	27651		# MM 41		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6447.
    6447, 24402,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1131
//		OCT	27650		# MM 40		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6448.
    6448, 24400,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1132
//		OCT	27647		# MM 39		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6449.
    6449, 24398,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1133
//		OCT	27646		# MM 38		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6450.
    6450, 24396,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1134
//# Page 235
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1135
//		OCT	27643		# MM 35		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6451.
    6451, 24390,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1136
//		OCT	27642		# MM 34		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6452.
    6452, 24388,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1137
//		OCT	27641		# MM 33		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6453.
    6453, 24386,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1138
//		OCT	27640		# MM 32		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6454.
    6454, 24384,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1139
//		OCT	27637		#
// PORT: Fixed ROM slots 6455.
    6455, 24382,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1140
//		OCT	27636		# MM 30		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6456.
    6456, 24380,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1141
//		OCT	27631		# MM 25		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6457.
    6457, 24370,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1142
//		OCT	27626		# MM 22		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6458.
    6458, 24364,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1143
//		OCT	27625		# MM 21		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6459.
    6459, 24362,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1144
//		OCT	27624		# MM 20		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6460.
    6460, 24360,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1145
//		OCT	27614		# MM 12		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6461.
    6461, 24344,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1146
//		OCT	27006		# MM 06		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6462.
    6462, 23564,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1147
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1148
//# NOTE:		THE FOLLOWING CONSTANT IS THE NUMBER OF ENTRIES IN EACH OF
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1149
//# -----		THE ABOVE LISTS-1 (I.E., THE NUMBER OF MAJOR MODES (EXCEPT P00)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1150
//#		THAT CAN BE CALLED FROM THE KEYBOARD MINUS ONE)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1151
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1152
//NOV37MM		DEC	29		# MM'S -1
// PORT: Fixed ROM slots 6463.
    6463, 58,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1153
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1154
//DNLADMM1	ADRES	RENDEZVU	# P79
// PORT: Fixed ROM slots 6464.
    6464, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1155
//		ADRES	RENDEZVU	# P78
// PORT: Fixed ROM slots 6465.
    6465, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1156
//		ADRES	RENDEZVU
// PORT: Fixed ROM slots 6466.
    6466, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1157
//		ADRES	RENDEZVU	# P75
// PORT: Fixed ROM slots 6467.
    6467, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1158
//		ADRES	RENDEZVU	# P74
// PORT: Fixed ROM slots 6468.
    6468, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1159
//		ADRES	RENDEZVU	# P73
// PORT: Fixed ROM slots 6469.
    6469, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1160
//		ADRES	RENDEZVU	# P72
// PORT: Fixed ROM slots 6470.
    6470, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1161
//		ADRES	DESASCNT	# P68
// PORT: Fixed ROM slots 6471.
    6471, 8,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1162
//		ADRES	DESASCNT	# P63
// PORT: Fixed ROM slots 6472.
    6472, 8,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1163
//		ADRES	LUNRSALN	# P57
// PORT: Fixed ROM slots 6473.
    6473, 10,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1164
//		ADRES	COSTALIN	# P52
// PORT: Fixed ROM slots 6474.
    6474, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1165
//		ADRES	COSTALIN	# P51
// PORT: Fixed ROM slots 6475.
    6475, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1166
//		ADRES	ORBMANUV	# P47
// PORT: Fixed ROM slots 6476.
    6476, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1167
//		ADRES	ORBMANUV	# P42
// PORT: Fixed ROM slots 6477.
    6477, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1168
//		ADRES	ORBMANUV	# P41
// PORT: Fixed ROM slots 6478.
    6478, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1169
//		ADRES	ORBMANUV	# P40
// PORT: Fixed ROM slots 6479.
    6479, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1170
//		ADRES	RENDEZVU	# P39
// PORT: Fixed ROM slots 6480.
    6480, 4
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1171
//		ADRES	RENDEZVU	# P38
// PORT: Fixed ROM slots 6481.
    6481, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1172
//		ADRES	RENDEZVU	# P35
// PORT: Fixed ROM slots 6482.
    6482, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1173
//		ADRES	RENDEZVU	# P34
// PORT: Fixed ROM slots 6483.
    6483, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1174
//		ADRES	RENDEZVU	# P33
// PORT: Fixed ROM slots 6484.
    6484, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1175
//		ADRES	RENDEZVU	# P32
// PORT: Fixed ROM slots 6485.
    6485, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1176
//		ADRES   RENDEZVU	# P31LM
// PORT: Fixed ROM slots 6486.
    6486, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1177
//		ADRES	RENDEZVU	# P30
// PORT: Fixed ROM slots 6487.
    6487, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1178
//		ADRES	RENDEZVU	# P25
// PORT: Fixed ROM slots 6488.
    6488, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1179
//		ADRES	LUNRSALN	# P22
// PORT: Fixed ROM slots 6489.
    6489, 10,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1180
//		ADRES	RENDEZVU	# P21
// PORT: Fixed ROM slots 6490.
    6490, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1181
//		ADRES	RENDEZVU	# P20
// PORT: Fixed ROM slots 6491.
    6491, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1182
//		ADRES	DESASCNT	# P12
// PORT: Fixed ROM slots 6492.
    6492, 8,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1183
//		ADRES	COSTALIN	# P06
// PORT: Fixed ROM slots 6493.
    6493, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1184
//DNLADP00	=	ZERO
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1185
//COSTALIN	=	0
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1186
//# Page 236
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1187
//AGSUPDAT	=	1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1188
//RENDEZVU	=	2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1189
//ORBMANUV	=	3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1190
//DESASCNT	=	4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1191
//LUNRSALN	=	5
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1192
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1193
//		BANK	13
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1194
//		SETLOC	INTINIT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1195
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1196
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1197
//		COUNT*	$$/INTIN
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1198
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1199
//		EBANK=	RRECTCSM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1200
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1201
//# THIS ROUTINE DOES THE P00 INTEGRATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1202
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1203
//STATEUP		SET	BOF		# EXTRAPOLATE CM STATE VECTOR
// PORT: Fixed ROM slots 13334.
    13334, 35864,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1204
//			VINTFLAG
// PORT: Fixed ROM slots 13335.
    13335, 1656,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1205
//			SURFFLAG	# ALSO 6X6 W-MATRIX IF LM ON LUNAR
// PORT: Fixed ROM slots 13336.
    13336, 4558,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1206
//			DOINT		# 	SURFACE AND W-MATRIX VALID
// PORT: Fixed ROM slots 13337.
    13337, 22588,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1207
//		BOF	SET		#	FOR RENDEZVOUS NAVIGATION.
// PORT: Fixed ROM slots 13338.
    13338, 35864,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1208
//			RENDWFLG
// PORT: Fixed ROM slots 13339.
    13339, 3036,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1209
//			DOINT
// PORT: Fixed ROM slots 13340.
    13340, 22588,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1210
//			DIM0FLAG
// PORT: Fixed ROM slots 13341.
    13341, 1660,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1211
//DOINT		CLEAR	CALL
// PORT: Fixed ROM slots 13342.
    13342, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1212
//			PRECIFLG	# ENGAGES 4-TIME STEP LOGIC IN INTEGRATION
// PORT: Fixed ROM slots 13343.
    13343, 1902,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1213
//			INTEGRV		# WHEN MODREG = 0
// PORT: Fixed ROM slots 13344.
    13344, 23736,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1214
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1215
//		BON	DLOAD
// PORT: Fixed ROM slots 13345.
    13345, 58648,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1216
//			SURFFLAG
// PORT: Fixed ROM slots 13346.
    13346, 4494,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1217
//			NO-INT
// PORT: Fixed ROM slots 13347.
    13347, 22630,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1218
//			TETCSM
// PORT: Fixed ROM slots 13348.
    13348, 1778,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1219
//		STCALL	TDEC1
// PORT: Fixed ROM slots 13349.
    13349, 28738,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1220
//			INTSTALL
// PORT: Fixed ROM slots 13350.
    13350, 24088,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1221
//		CLEAR	CALL		# EXTRAPOLATE LM STATE VECTOR
// PORT: Fixed ROM slots 13351.
    13351, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1222
//			VINTFLAG
// PORT: Fixed ROM slots 13352.
    13352, 1912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1223
//			SETIFLGS
// PORT: Fixed ROM slots 13353.
    13353, 23368,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1224
//		BOF			# ALSO 9X9 W-MATRIX IF W IS VALID
// PORT: Fixed ROM slots 13354.
    13354, 65304,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1225
//			RENDWFLG
// PORT: Fixed ROM slots 13355.
    13355, 3036,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1226
//			DOINT2
// PORT: Fixed ROM slots 13356.
    13356, 22624,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1227
//		SET	SET
// PORT: Fixed ROM slots 13357.
    13357, 35864,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1228
//			DIM0FLAG
// PORT: Fixed ROM slots 13358.
    13358, 1660,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1229
//			D6OR9FLG
// PORT: Fixed ROM slots 13359.
    13359, 1658,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1230
//DOINT2		SET	CALL
// PORT: Fixed ROM slots 13360.
    13360, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1231
//			PRECIFLG	# DISENGAGE 4 TIME STEP LOGIC IN INTEG.
// PORT: Fixed ROM slots 13361.
    13361, 1646,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1232
//			INTEGRV
// PORT: Fixed ROM slots 13362.
    13362, 23736,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1233
//NO-INT		CLRGO
// PORT: Fixed ROM slots 13363.
    13363, 65304,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1234
//			NODOFLAG
// PORT: Fixed ROM slots 13364.
    13364, 1340,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1235
//			ENDINT
// PORT: Fixed ROM slots 13365.
    13365, 23348,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1236
//# Page 237
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1237
//# THISVINT IS CALLED BY MIDTOAV1 AND 2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1238
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1239
//THISVINT	CLEAR	RVQ
// PORT: Fixed ROM slots 13366.
    13366, 36376,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1240
//			VINTFLAG
// PORT: Fixed ROM slots 13367.
    13367, 1912
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1241
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1242
//
