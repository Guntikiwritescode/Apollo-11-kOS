// DAPIDLER_PROGRAM.agc
// bank 16, slots 16384-16414
function agcAotUnit995 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16398 {
        if slot <= 16390 {
            if slot <= 16386 {
                if slot <= 16384 {
// DAPIDLER_PROGRAM.agc:1
//# Copyright:	Public domain.
// DAPIDLER_PROGRAM.agc:2
//# Filename:	DAPIDLER_PROGRAM.agc
// DAPIDLER_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// DAPIDLER_PROGRAM.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// DAPIDLER_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// DAPIDLER_PROGRAM.agc:6
//# Assembler:	yaYUL
// DAPIDLER_PROGRAM.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// DAPIDLER_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// DAPIDLER_PROGRAM.agc:9
//# Pages:	1410-1420
// DAPIDLER_PROGRAM.agc:10
//# Mod history:  2009-05-10 SN   (Navarro Kerman).  Started adapting
// DAPIDLER_PROGRAM.agc:11
//#				from the Luminary131/ file of the same
// DAPIDLER_PROGRAM.agc:12
//#				name, using Luminary099 page images.
// DAPIDLER_PROGRAM.agc:13
//#
// DAPIDLER_PROGRAM.agc:14
//# This source code has been transcribed or otherwise adapted from
// DAPIDLER_PROGRAM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// DAPIDLER_PROGRAM.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// DAPIDLER_PROGRAM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// DAPIDLER_PROGRAM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// DAPIDLER_PROGRAM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// DAPIDLER_PROGRAM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// DAPIDLER_PROGRAM.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// DAPIDLER_PROGRAM.agc:22
//# actually created.
// DAPIDLER_PROGRAM.agc:23
//#
// DAPIDLER_PROGRAM.agc:24
//# Notations on the hardcopy document read, in part:
// DAPIDLER_PROGRAM.agc:25
//#
// DAPIDLER_PROGRAM.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// DAPIDLER_PROGRAM.agc:27
//#	16:27 JULY 14, 1969
// DAPIDLER_PROGRAM.agc:28
//
// DAPIDLER_PROGRAM.agc:29
//# Page 1410
// DAPIDLER_PROGRAM.agc:30
//# THE DAPIDLER PROGRAM IS STARTED BY FRESH START AND RESTART.		  THE DAPIDLER PROGRAM IS DONE 10 TIMES
// DAPIDLER_PROGRAM.agc:31
//# PER SECOND UNTIL BOB DESIRES THE DAP TO WAKE UP, AND THE IMU AND CDUS ARE READY FOR USE BY THE DAP.
// DAPIDLER_PROGRAM.agc:32
//# THE NECESSARY INITIALIZATION OF THE DAP IS DONE BY THE DAPIDLER PROGRAM.
// DAPIDLER_PROGRAM.agc:33
//		BANK	16
// DAPIDLER_PROGRAM.agc:34
//		SETLOC	DAPS1
// DAPIDLER_PROGRAM.agc:35
//		BANK
// DAPIDLER_PROGRAM.agc:36
//
// DAPIDLER_PROGRAM.agc:37
//		EBANK=	AOSQ
// DAPIDLER_PROGRAM.agc:38
//
// DAPIDLER_PROGRAM.agc:39
//		COUNT*	$$/DAPID
// DAPIDLER_PROGRAM.agc:40
//
// DAPIDLER_PROGRAM.agc:41
//CHEKBITS	EXTEND
// slot 16384
                    if slot <> 16384 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16385 {
// DAPIDLER_PROGRAM.agc:42
//		READ	CHAN31		# IF BOTH BIT13 AND BIT14 ARE ONE, THEN
// slot 16385
                        if slot <> 16385 or instruction <> 25 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:43
//		COM			# THE MODE SELECT SWITCH IS IN THE OFF
// slot 16386
                        if slot <> 16386 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16388 {
                    if slot <= 16387 {
// DAPIDLER_PROGRAM.agc:44
//		MASK	BIT13-14	# POSITION, AND SO THE DAP SHOULD BE OFF,
// slot 16387
                        if slot <> 16387 or instruction <> 30957 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                            if fixedOperand = 12288 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:45
//		EXTEND			# WITH NO ATTITUDE ERROR DISPLAY.
// slot 16388
                        if slot <> 16388 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16389 {
// DAPIDLER_PROGRAM.agc:46
//		BZF	MOREIDLE
// slot 16389
                        if slot <> 16389 or instruction <> 5231 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5231, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:47
//
// DAPIDLER_PROGRAM.agc:48
//		CS	IMODES33
// slot 16390
                        if slot <> 16390 or instruction <> 17091 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 707).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16394 {
                if slot <= 16392 {
                    if slot <= 16391 {
// DAPIDLER_PROGRAM.agc:49
//		MASK	BIT6
// slot 16391
                        if slot <> 16391 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
// DAPIDLER_PROGRAM.agc:50
//		CCS	A
// slot 16392
                        if slot <> 16392 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16393 {
// DAPIDLER_PROGRAM.agc:51
//		TCF	JUMPDSP
// slot 16393
                        if slot <> 16393 or instruction <> 5254 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5254, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:52
//		CS	RCSFLAGS	# IMU NOT USABLE.  SET UP INITIALIZATION
// slot 16394
                        if slot <> 16394 or instruction <> 17083 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 699).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16396 {
                    if slot <= 16395 {
// DAPIDLER_PROGRAM.agc:53
//		MASK	BIT3		# FLAG FOR ATT ERROR DISPLAY ROUTINE.
// slot 16395
                        if slot <> 16395 or instruction <> 31209 { return choose false if checkOnly else -1. }
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
                    } else {
// DAPIDLER_PROGRAM.agc:54
//		ADS	RCSFLAGS
// slot 16396
                        if slot <> 16396 or instruction <> 11963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16397 {
// DAPIDLER_PROGRAM.agc:55
//		TCF	SHUTDOWN
// slot 16397
                        if slot <> 16397 or instruction <> 5235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:56
//
// DAPIDLER_PROGRAM.agc:57
//CHEKMORE	CAF	BIT10		# BIT 10 OF 30 IS PGNCS CONTROL OF S/C
// slot 16398
                        if slot <> 16398 or instruction <> 14818 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 16406 {
            if slot <= 16402 {
                if slot <= 16400 {
                    if slot <= 16399 {
// DAPIDLER_PROGRAM.agc:58
//		EXTEND
// slot 16399
                        if slot <> 16399 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:59
//		RAND	CHAN30		# BITS IN 30 ARE INVERTED
// slot 16400
                        if slot <> 16400 or instruction <> 1048 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 24, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16401 {
// DAPIDLER_PROGRAM.agc:60
//		CCS	A
// slot 16401
                        if slot <> 16401 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:61
//		TCF	MOREIDLE
// slot 16402
                        if slot <> 16402 or instruction <> 5231 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5231, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16404 {
                    if slot <= 16403 {
// DAPIDLER_PROGRAM.agc:62
//
// DAPIDLER_PROGRAM.agc:63
//		RETURN
// slot 16403
                        if slot <> 16403 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:64
//
// DAPIDLER_PROGRAM.agc:65
//# Page 1411
// DAPIDLER_PROGRAM.agc:66
//# DAPIDLER ENTRY.
// DAPIDLER_PROGRAM.agc:67
//
// DAPIDLER_PROGRAM.agc:68
//DAPIDLER	LXCH	BANKRUPT	# INTERRUPT LEAD INS (CONTINUED)
// slot 16404
                        if slot <> 16404 or instruction <> 9230 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 14, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16405 {
// DAPIDLER_PROGRAM.agc:69
//		EXTEND
// slot 16405
                        if slot <> 16405 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:70
//		QXCH	QRUPT
// slot 16406
                        if slot <> 16406 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16410 {
                if slot <= 16408 {
                    if slot <= 16407 {
// DAPIDLER_PROGRAM.agc:71
//
// DAPIDLER_PROGRAM.agc:72
//		CA	RCSFLAGS
// slot 16407
                        if slot <> 16407 or instruction <> 12987 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:73
//		MASK	BIT13
// slot 16408
                        if slot <> 16408 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 16409 {
// DAPIDLER_PROGRAM.agc:74
//		CCS	A		# CHECK IF 1/ACCJOB HAS BEEN SET UP SINCE
// slot 16409
                        if slot <> 16409 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:75
//		TCF	CHECKUP		# THE LAST FRESH START OR RESTART.
// slot 16410
                        if slot <> 16410 or instruction <> 5153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5153, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16412 {
                    if slot <= 16411 {
// DAPIDLER_PROGRAM.agc:76
//		CA	BIT13
// slot 16411
                        if slot <> 16411 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:77
//		ADS	RCSFLAGS	# BIT 13 IS 1.
// slot 16412
                        if slot <> 16412 or instruction <> 11963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16413 {
// DAPIDLER_PROGRAM.agc:78
//		CAF	PRIO27
// slot 16413
                        if slot <> 16413 or instruction <> 16333 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DAPIDLER_PROGRAM.agc:79
//		TC	NOVAC		# SET UP JOB TO DO A LITTLE INITIALIZATION
// slot 16414
                        if slot <> 16414 or instruction <> 2618 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[995] to agcAotUnit995@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:80
//		EBANK=	AOSQ		#   AND EXECUTE 1/ACCS.
// DAPIDLER_PROGRAM.agc:81
//		2CADR	1/ACCSET	# (WILL BRANCH TO MOREIDLE ON ACCSOKAY)
// slot 16415 16416
    16415, 2638, 16416, 32908
)).

// bank 16, slots 16417-16422
function agcAotUnit996 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16419 {
        if slot <= 16417 {
// DAPIDLER_PROGRAM.agc:82
//
// DAPIDLER_PROGRAM.agc:83
//CHECKUP		TC	CHEKBITS	# CHECK TO SEE IF LM DAP IS TO GO ON AND
// slot 16417
            if slot <> 16417 or instruction <> 1024 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1024, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16418 {
// DAPIDLER_PROGRAM.agc:84
//					#   DO ERROR DISPLAY.
// DAPIDLER_PROGRAM.agc:85
//
// DAPIDLER_PROGRAM.agc:86
//		CAE	DAPBOOLS	# IF 1/ACCS HAS NOT BEEN COMPLETED, IDLE.
// slot 16418
                if slot <> 16418 or instruction <> 12361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 73).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:87
//		MASK	ACCSOKAY	#   NOTE: ONLY FRESH START AND RESTART
// slot 16419
                if slot <> 16419 or instruction <> 31209 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 16420 {
// DAPIDLER_PROGRAM.agc:88
//		EXTEND			# 	  KNOCK THIS BIT DOWN.
// slot 16420
            if slot <> 16420 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16421 {
// DAPIDLER_PROGRAM.agc:89
//		BZF	MOREIDLE
// slot 16421
                if slot <> 16421 or instruction <> 5231 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5231, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:90
//
// DAPIDLER_PROGRAM.agc:91
//STARTDAP	TC	IBNKCALL	# ZERO ATTITUDE ERROR AND DESIRED RATES.
// slot 16422
                if slot <> 16422 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[996] to agcAotUnit996@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:92
//		FCADR	ZATTEROR
// slot 16423
    16423, 32982
)).

// bank 16, slots 16424-16492
function agcAotUnit997 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16457 {
        if slot <= 16440 {
            if slot <= 16431 {
                if slot <= 16427 {
                    if slot <= 16425 {
                        if slot <= 16424 {
// DAPIDLER_PROGRAM.agc:93
//		CAF	ZERO		# ********** INITIALIZE: **********
// slot 16424
                            if slot <> 16424 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:94
//		TS	TJP
// slot 16425
                            if slot <> 16425 or instruction <> 23380 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23380, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16426 {
// DAPIDLER_PROGRAM.agc:95
//		TS	TJU
// slot 16426
                            if slot <> 16426 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:96
//		TS	TJV
// slot 16427
                            if slot <> 16427 or instruction <> 23382 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23382, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16429 {
                        if slot <= 16428 {
// DAPIDLER_PROGRAM.agc:97
//		TS	OMEGAP		# RATES IN BODY (PILOT) COORDINATES.
// slot 16428
                            if slot <> 16428 or instruction <> 23313 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23313, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:98
//		TS	OMEGAQ
// slot 16429
                            if slot <> 16429 or instruction <> 23314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23314, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16430 {
// DAPIDLER_PROGRAM.agc:99
//		TS	OMEGAR
// slot 16430
                            if slot <> 16430 or instruction <> 23315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23315, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:100
//		TS	TRAPEDP
// slot 16431
                            if slot <> 16431 or instruction <> 23320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23320, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16435 {
                    if slot <= 16433 {
                        if slot <= 16432 {
// DAPIDLER_PROGRAM.agc:101
//		TS	TRAPEDQ
// slot 16432
                            if slot <> 16432 or instruction <> 23321 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23321, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:102
//		TS	TRAPEDR
// slot 16433
                            if slot <> 16433 or instruction <> 23322 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23322, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16434 {
// DAPIDLER_PROGRAM.agc:103
//		TS	AOSQ		# OFFSET ACCELERATION ESTIMATES.
// slot 16434
                            if slot <> 16434 or instruction <> 23391 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23391, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:104
//		TS	AOSQ +1
// slot 16435
                            if slot <> 16435 or instruction <> 23392 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23392, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16437 {
                        if slot <= 16436 {
// DAPIDLER_PROGRAM.agc:105
//		TS	AOSR
// slot 16436
                            if slot <> 16436 or instruction <> 23393 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23393, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:106
//		TS	AOSR +1
// slot 16437
                            if slot <> 16437 or instruction <> 23394 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23394, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16438 {
// DAPIDLER_PROGRAM.agc:107
//		TS	ALPHAQ		# COPIES OF OFFSET ESTIMATES FOR DOWNLIST.
// slot 16438
                            if slot <> 16438 or instruction <> 23316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16439 {
// DAPIDLER_PROGRAM.agc:108
//		TS	ALPHAR
// slot 16439
                                if slot <> 16439 or instruction <> 23317 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23317, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:109
//		TS	NEGUQ
// slot 16440
                                if slot <> 16440 or instruction <> 23361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23361, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16448 {
                if slot <= 16444 {
                    if slot <= 16442 {
                        if slot <= 16441 {
// DAPIDLER_PROGRAM.agc:110
//		TS	NEGUR
// slot 16441
                            if slot <> 16441 or instruction <> 23363 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23363, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:111
//		TS	AOSQTERM	# QRAXIS RATE DERIVATION TERMS AND KALMAN
// slot 16442
                            if slot <> 16442 or instruction <> 23397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23397, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16443 {
// DAPIDLER_PROGRAM.agc:112
//		TS	AOSRTERM	# FILTER INITIALIZATION TERMS.
// slot 16443
                            if slot <> 16443 or instruction <> 23398 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23398, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:113
//		TS	QACCDOT		# DESCENT ACCELERATION DERIVATIVE EST.
// slot 16444
                            if slot <> 16444 or instruction <> 23368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16446 {
                        if slot <= 16445 {
// DAPIDLER_PROGRAM.agc:114
//		TS	RACCDOT
// slot 16445
                            if slot <> 16445 or instruction <> 23370 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23370, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:115
//# Page 1412
// DAPIDLER_PROGRAM.agc:116
//		TS	ALLOWGTS	# AOSTASK FLAG FOR QRAXIS RCS CONTROL USE.
// slot 16446
                            if slot <> 16446 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16447 {
// DAPIDLER_PROGRAM.agc:117
//		TS	COTROLER	# DO TRYGTS ON FIRST PASS (WILL GO TO RCS)
// slot 16447
                            if slot <> 16447 or instruction <> 23449 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23449, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:118
//		TS	INGTS		# RECOGNIZE FIRST GTS PASS AS SUCH.
// slot 16448
                            if slot <> 16448 or instruction <> 23451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23451, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16452 {
                    if slot <= 16450 {
                        if slot <= 16449 {
// DAPIDLER_PROGRAM.agc:119
//		TS	QGIMTIMR	# STOP GIMBAL DRIVES.  (PROBABLY WOULD BE
// slot 16449
                            if slot <> 16449 or instruction <> 23450 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23450, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:120
//		TS	RGIMTIMR	#   GOOD ENOUGH JUST TO INACTIVATE TIMERS)
// slot 16450
                            if slot <> 16450 or instruction <> 23452 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23452, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16451 {
// DAPIDLER_PROGRAM.agc:121
//		TS	OLDPMIN		# MINIMUM IMPULSE MODE ERASABLES
// slot 16451
                            if slot <> 16451 or instruction <> 23344 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23344, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:122
//		TS	OLDQRMIN
// slot 16452
                            if slot <> 16452 or instruction <> 23345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16454 {
                        if slot <= 16453 {
// DAPIDLER_PROGRAM.agc:123
//		TS	PJETCTR		# INITIALIZE DOCKED JET INHIBITION
// slot 16453
                            if slot <> 16453 or instruction <> 23543 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23543, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:124
//		TS	UJETCTR		# COUNTERS
// slot 16454
                            if slot <> 16454 or instruction <> 23544 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23544, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16455 {
// DAPIDLER_PROGRAM.agc:125
//		TS	VJETCTR
// slot 16455
                            if slot <> 16455 or instruction <> 23545 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23545, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16456 {
// DAPIDLER_PROGRAM.agc:126
//CALLGMBL	EQUALS	BIT5		# RCSFLAGS INITIALIZATION.
// DAPIDLER_PROGRAM.agc:127
//		CS	MANFLAG
// slot 16456
                                if slot <> 16456 or instruction <> 17538 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1154), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:128
//		MASK	RCSFLAGS	# NEGUQ(R) HAVE BEEN GENERATED.
// slot 16457
                                if slot <> 16457 or instruction <> 29371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 699).
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
        if slot <= 16474 {
            if slot <= 16465 {
                if slot <= 16461 {
                    if slot <= 16459 {
                        if slot <= 16458 {
// DAPIDLER_PROGRAM.agc:129
//		TS	RCSFLAGS
// slot 16458
                            if slot <> 16458 or instruction <> 23227 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23227, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:130
//
// DAPIDLER_PROGRAM.agc:131
//# SET UP "OLD" MEASURED CDU ANGLES:
// DAPIDLER_PROGRAM.agc:132
//
// DAPIDLER_PROGRAM.agc:133
//		EXTEND
// slot 16459
                            if slot <> 16459 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16460 {
// DAPIDLER_PROGRAM.agc:134
//		DCA	CDUX		# OLDXFORP AND OLDYFORP
// slot 16460
                            if slot <> 16460 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 27, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:135
//		DXCH	OLDXFORP
// slot 16461
                            if slot <> 16461 or instruction <> 22305 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 801, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16463 {
                        if slot <= 16462 {
// DAPIDLER_PROGRAM.agc:136
//		CA	CDUZ
// slot 16462
                            if slot <> 16462 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:137
//		TS	OLDZFORQ
// slot 16463
                            if slot <> 16463 or instruction <> 23330 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23330, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16464 {
// DAPIDLER_PROGRAM.agc:138
//		CS	RCSFLAGS
// slot 16464
                            if slot <> 16464 or instruction <> 17083 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 699).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:139
//		MASK	BIT12
// slot 16465
                            if slot <> 16465 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            } else {
                if slot <= 16469 {
                    if slot <= 16467 {
                        if slot <= 16466 {
// DAPIDLER_PROGRAM.agc:140
//		ADS	RCSFLAGS	# BIT 12 SET TO 1.
// slot 16466
                            if slot <> 16466 or instruction <> 11963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:141
//		CA	FOUR
// slot 16467
                            if slot <> 16467 or instruction <> 14825 { return choose false if checkOnly else -1. }
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
                        if slot <= 16468 {
// DAPIDLER_PROGRAM.agc:142
//		TS	SKIPU
// slot 16468
                            if slot <> 16468 or instruction <> 23389 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23389, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:143
//		TS	SKIPV
// slot 16469
                            if slot <> 16469 or instruction <> 23390 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23390, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16471 {
                        if slot <= 16470 {
// DAPIDLER_PROGRAM.agc:144
//		CA	POSMAX
// slot 16470
                            if slot <> 16470 or instruction <> 14811 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:145
//		TS	TIME6
// slot 16471
                            if slot <> 16471 or instruction <> 22553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22553, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16472 {
// DAPIDLER_PROGRAM.agc:146
//		TS	T6NEXT
// slot 16472
                            if slot <> 16472 or instruction <> 23350 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23350, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16473 {
// DAPIDLER_PROGRAM.agc:147
//		TS	T6FURTHA
// slot 16473
                                if slot <> 16473 or instruction <> 23352 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23352, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:148
//		CA	ZERO
// slot 16474
                                if slot <> 16474 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 16483 {
                if slot <= 16478 {
                    if slot <= 16476 {
                        if slot <= 16475 {
// DAPIDLER_PROGRAM.agc:149
//		TS	T6NEXT +1
// slot 16475
                            if slot <> 16475 or instruction <> 23351 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23351, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:150
//		TS	T6FURTHA +1
// slot 16476
                            if slot <> 16476 or instruction <> 23353 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23353, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16477 {
// DAPIDLER_PROGRAM.agc:151
//		TS	NXT6ADR
// slot 16477
                            if slot <> 16477 or instruction <> 23349 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23349, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:152
//		TS	NEXTP
// slot 16478
                            if slot <> 16478 or instruction <> 23354 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23354, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16480 {
                        if slot <= 16479 {
// DAPIDLER_PROGRAM.agc:153
//		TS	NEXTU
// slot 16479
                            if slot <> 16479 or instruction <> 23355 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23355, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:154
//		TS	NEXTV
// slot 16480
                            if slot <> 16480 or instruction <> 23356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16481 {
// DAPIDLER_PROGRAM.agc:155
//		CS	TEN
// slot 16481
                            if slot <> 16481 or instruction <> 18675 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16482 {
// DAPIDLER_PROGRAM.agc:156
//		TS	DAPZRUPT	# JASK NOT IN PROGRESS, INITIALIZE NEG.
// slot 16482
                                if slot <> 16482 or instruction <> 23535 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23535, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:157
//		CA	TWO
// slot 16483
                                if slot <> 16483 or instruction <> 14826 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16487 {
                    if slot <= 16485 {
                        if slot <= 16484 {
// DAPIDLER_PROGRAM.agc:158
//		TS	NPTRAPS
// slot 16484
                            if slot <> 16484 or instruction <> 23323 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23323, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:159
//		TS	NQTRAPS
// slot 16485
                            if slot <> 16485 or instruction <> 23324 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23324, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16486 {
// DAPIDLER_PROGRAM.agc:160
//		TS	NRTRAPS
// slot 16486
                            if slot <> 16486 or instruction <> 23325 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23325, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:161
//		EXTEND
// slot 16487
                            if slot <> 16487 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16489 {
                        if slot <= 16488 {
// DAPIDLER_PROGRAM.agc:162
//		DCA	PAXADIDL
// slot 16488
                            if slot <> 16488 or instruction <> 13445 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1157, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// DAPIDLER_PROGRAM.agc:163
//		DXCH	T5ADR
// slot 16489
                            if slot <> 16489 or instruction <> 22205 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 701, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16490 {
// DAPIDLER_PROGRAM.agc:164
//SETTIME5	CAF	MS100
// slot 16490
                            if slot <> 16490 or instruction <> 16343 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4055), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16491 {
// DAPIDLER_PROGRAM.agc:165
//		TS	TIME5
// slot 16491
                                if slot <> 16491 or instruction <> 22552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:166
//# Page 1413
// DAPIDLER_PROGRAM.agc:167
//		TCF	RESUME
// slot 16492
                                if slot <> 16492 or instruction <> 6840 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6840, words[0], readEffective).
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
set agcAotRoutes[997] to agcAotUnit997@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:168
//		EBANK=	AOSQ
// DAPIDLER_PROGRAM.agc:169
//IDLERADR	2CADR	DAPIDLER
// slot 16493 16494
    16493, 2088, 16494, 28812
)).

// bank 16, slots 16495-16495
function agcAotUnit998 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// DAPIDLER_PROGRAM.agc:170
//
// DAPIDLER_PROGRAM.agc:171
//MOREIDLE	TC	IBNKCALL	# CALCULATE Q,R-AXES ATTITUDE ERRORS.
// slot 16495
    if slot <> 16495 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[998] to agcAotUnit998@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:172
//		CADR	QERRCALC
// slot 16496
    16496, 31532
)).

// bank 16, slots 16497-16497
function agcAotUnit999 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// DAPIDLER_PROGRAM.agc:173
//
// DAPIDLER_PROGRAM.agc:174
//		TC	IBNKCALL
// slot 16497
    if slot <> 16497 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[999] to agcAotUnit999@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:175
//		CADR	CALCPERR	# CALCULATE P AXIS ATTITUDE ERRORS.
// slot 16498
    16498, 30284
)).

// bank 16, slots 16499-16513
function agcAotUnit1000 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16505 {
        if slot <= 16501 {
            if slot <= 16499 {
// DAPIDLER_PROGRAM.agc:176
//
// DAPIDLER_PROGRAM.agc:177
//SHUTDOWN	EXTEND
// slot 16499
                if slot <> 16499 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16500 {
// DAPIDLER_PROGRAM.agc:178
//		DCA	IDLERADR
// slot 16500
                    if slot <> 16500 or instruction <> 13422 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1134, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:179
//		DXCH	T5ADR
// slot 16501
                    if slot <> 16501 or instruction <> 22205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 701, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16503 {
                if slot <= 16502 {
// DAPIDLER_PROGRAM.agc:180
//
// DAPIDLER_PROGRAM.agc:181
//		CAF	ZERO		# KILL ANY POSSIBLE JET REQUESTS
// slot 16502
                    if slot <> 16502 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:182
//		TS	NEXTP
// slot 16503
                    if slot <> 16503 or instruction <> 23354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16504 {
// DAPIDLER_PROGRAM.agc:183
//		TS	NEXTU
// slot 16504
                    if slot <> 16504 or instruction <> 23355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23355, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:184
//		TS	NEXTV
// slot 16505
                    if slot <> 16505 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16509 {
            if slot <= 16507 {
                if slot <= 16506 {
// DAPIDLER_PROGRAM.agc:185
//		EXTEND			# COMMAND JETS OFF.
// slot 16506
                    if slot <> 16506 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:186
//		WRITE	CHAN5
// slot 16507
                    if slot <> 16507 or instruction <> 517 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16508 {
// DAPIDLER_PROGRAM.agc:187
//		EXTEND
// slot 16508
                    if slot <> 16508 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:188
//		WRITE	CHAN6
// slot 16509
                    if slot <> 16509 or instruction <> 518 { return choose false if checkOnly else -1. }
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
            if slot <= 16511 {
                if slot <= 16510 {
// DAPIDLER_PROGRAM.agc:189
//		CS	BGIM23		# TURN TRIM GIMBAL OFF
// slot 16510
                    if slot <> 16510 or instruction <> 17539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1155), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:190
//		EXTEND
// slot 16511
                    if slot <> 16511 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16512 {
// DAPIDLER_PROGRAM.agc:191
//		WAND	CHAN12
// slot 16512
                    if slot <> 16512 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:192
//		TCF	SETTIME5	# RETURN IN 100 MSEC.
// slot 16513
                    if slot <> 16513 or instruction <> 5226 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5226, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1000] to agcAotUnit1000@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:193
//
// DAPIDLER_PROGRAM.agc:194
//MANFLAG		OCT	03021
// slot 16514
    16514, 3106,
// DAPIDLER_PROGRAM.agc:195
//BGIM23		OCTAL	07400
// slot 16515
    16515, 7680,
// DAPIDLER_PROGRAM.agc:196
//		EBANK=	OMEGAP
// DAPIDLER_PROGRAM.agc:197
//PAXADIDL	2CADR	PAXIS
// slot 16516 16517
    16516, 2326, 16517, 28812
)).

// bank 16, slots 16518-16520
function agcAotUnit1001 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16518 {
// DAPIDLER_PROGRAM.agc:198
//
// DAPIDLER_PROGRAM.agc:199
//MS100		=	OCT37766
// DAPIDLER_PROGRAM.agc:200
//COSMG		=	ITEMP1
// DAPIDLER_PROGRAM.agc:201
//JUMPDSP		EXTEND			# TRANSFER TO BANK 20
// slot 16518
        if slot <> 16518 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 16519 {
// DAPIDLER_PROGRAM.agc:202
//		DCA	DSPCADR		# FOR ATTITUDE ERROR DISPLAYS
// slot 16519
            if slot <> 16519 or instruction <> 13450 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1162, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DAPIDLER_PROGRAM.agc:203
//		DTCB
// slot 16520
            if slot <> 16520 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1001] to agcAotUnit1001@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:204
//
// DAPIDLER_PROGRAM.agc:205
//		EBANK=	AK
// DAPIDLER_PROGRAM.agc:206
//DSPCADR		2CADR	ALTDSPLY
// slot 16521 16522
    16521, 2348, 16522, 32908
)).

// bank 20, slots 18582-18687
function agcAotUnit1121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18634 {
        if slot <= 18607 {
            if slot <= 18594 {
                if slot <= 18587 {
                    if slot <= 18584 {
                        if slot <= 18582 {
// DAPIDLER_PROGRAM.agc:207
//
// DAPIDLER_PROGRAM.agc:208
//# Page 1414
// DAPIDLER_PROGRAM.agc:209
//		BANK	20
// DAPIDLER_PROGRAM.agc:210
//		SETLOC	DAPS3
// DAPIDLER_PROGRAM.agc:211
//		BANK
// DAPIDLER_PROGRAM.agc:212
//		COUNT*	$$/NEEDL
// DAPIDLER_PROGRAM.agc:213
//
// DAPIDLER_PROGRAM.agc:214
//# PROGRAM: ALTDSPLY
// DAPIDLER_PROGRAM.agc:215
//#
// DAPIDLER_PROGRAM.agc:216
//# MOD 0.  6 DEC 1967
// DAPIDLER_PROGRAM.agc:217
//#
// DAPIDLER_PROGRAM.agc:218
//# AUTHOR:  WORK KERMAN, KEENE KERMAN, MIT IL
// DAPIDLER_PROGRAM.agc:219
//#
// DAPIDLER_PROGRAM.agc:220
//# MOD 3 BY KEENE KERMAN AUG 1, 1968 MOVED PROGRAM TO BANK 20
// DAPIDLER_PROGRAM.agc:221
//#
// DAPIDLER_PROGRAM.agc:222
//# PROGRAM DESCRIPTION:
// DAPIDLER_PROGRAM.agc:223
//#
// DAPIDLER_PROGRAM.agc:224
//# ALTDSPLY REVERSES THE DSPLYALT BIT OF RCSFLAGS EACH TIME IT IS CALLED, WHICH IS PRESUMABLY EVERY 100 MS.
// DAPIDLER_PROGRAM.agc:225
//# IF THE REVERSED BIT IS ONE, NEEDLER IS CALLED TO DISPLAY ATTITUDE ERRORS.  IF THE BIT IS ZERO, THE ATTITUDE ERR-
// DAPIDLER_PROGRAM.agc:226
//# ORS ARE CALCULATED AS 1) DAP FOLLOWING ERRORS, IF NEEDLFLG = 0, AND 2) TOTAL ATTITUDE ERRORS FOR NEEDLFLG = 1.
// DAPIDLER_PROGRAM.agc:227
//#
// DAPIDLER_PROGRAM.agc:228
//# WARNING:  ALTDSPLY MAY ONLY BE CALLED WITH INTERRUPT INHIBITED.
// DAPIDLER_PROGRAM.agc:229
//#
// DAPIDLER_PROGRAM.agc:230
//# WARNING:  EBANK MUST BE SET TO 6 WHEN USING THIS ROUTINE.
// DAPIDLER_PROGRAM.agc:231
//#
// DAPIDLER_PROGRAM.agc:232
//# INPUT:  RCSFLAGS AND 1) IF NEEDLFLG=0, INPUT PERROR,QERROR,RERROR.
// DAPIDLER_PROGRAM.agc:233
//# 		       2) IF NEEDLFLG=1, INPUT CPHI,CTHETA,CPSI,CDUX,CDUY,CDUZ,M11,M21,M32,M22,M32. (GPMATRIX)
// DAPIDLER_PROGRAM.agc:234
//#
// DAPIDLER_PROGRAM.agc:235
//# OUTPUTS:  RCSFLAGS WITH DSPLYALT REVERSED,AK,AK1,AK2,+ NEEDLER OUTPUTS.
// DAPIDLER_PROGRAM.agc:236
//#
// DAPIDLER_PROGRAM.agc:237
//# ENTRY:   TCF    ALTDSPLY
// DAPIDLER_PROGRAM.agc:238
//#
// DAPIDLER_PROGRAM.agc:239
//# EXIT:    TCF    CHEKMORE
// DAPIDLER_PROGRAM.agc:240
//#
// DAPIDLER_PROGRAM.agc:241
//# ALARM OR ABORT EXITS:  NONE
// DAPIDLER_PROGRAM.agc:242
//#
// DAPIDLER_PROGRAM.agc:243
//# SUBPROGRAMS CALLED: NEEDLER, OVERSUB2
// DAPIDLER_PROGRAM.agc:244
//#
// DAPIDLER_PROGRAM.agc:245
//# DEBRIS:  A,L,AND NEEDLER DEBRIS.
// DAPIDLER_PROGRAM.agc:246
//
// DAPIDLER_PROGRAM.agc:247
//ALTDSPLY	CA	RCSFLAGS	# INVERT THE DISPLAY ALTERNATION BIT.
// slot 18582
                            if slot <> 18582 or instruction <> 12987 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18583 {
// DAPIDLER_PROGRAM.agc:248
//		TS	L
// slot 18583
                                if slot <> 18583 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:249
//		CA	DSPLYALT
// slot 18584
                                if slot <> 18584 or instruction <> 14824 { return choose false if checkOnly else -1. }
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
                        if slot <= 18585 {
// DAPIDLER_PROGRAM.agc:250
//		EXTEND
// slot 18585
                            if slot <> 18585 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18586 {
// DAPIDLER_PROGRAM.agc:251
//		RXOR	LCHAN
// slot 18586
                                if slot <> 18586 or instruction <> 3073 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:252
//		TS	RCSFLAGS
// slot 18587
                                if slot <> 18587 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18590 {
                        if slot <= 18588 {
// DAPIDLER_PROGRAM.agc:253
//
// DAPIDLER_PROGRAM.agc:254
//		MASK	DSPLYALT
// slot 18588
                            if slot <> 18588 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
                            if slot <= 18589 {
// DAPIDLER_PROGRAM.agc:255
//		CCS	A		# IS ALTERNATION FLAG ZERO?
// slot 18589
                                if slot <> 18589 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:256
//		TCF	NEEDLER
// slot 18590
                                if slot <> 18590 or instruction <> 5330 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5330, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18592 {
                            if slot <= 18591 {
// DAPIDLER_PROGRAM.agc:257
//
// DAPIDLER_PROGRAM.agc:258
//		CAE	FLAGWRD0	# NEEDLFLG WILL INDICATE TOTAL OR DAP AT-
// slot 18591
                                if slot <> 18591 or instruction <> 12348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 60).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:259
//# Page 1415
// DAPIDLER_PROGRAM.agc:260
//		MASK	NEEDLBIT	# TITUDE ERROR DISPLAY REQUEST.
// slot 18592
                                if slot <> 18592 or instruction <> 31208 { return choose false if checkOnly else -1. }
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
                            }
                        } else {
                            if slot <= 18593 {
// DAPIDLER_PROGRAM.agc:261
//		CCS	A
// slot 18593
                                if slot <> 18593 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:262
//		TCF	DSPLYTOT	# TOTAL ERROR IS NEEDED IN AK,AK +1,AK +2
// slot 18594
                                if slot <> 18594 or instruction <> 5290 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5290, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18600 {
                    if slot <= 18597 {
                        if slot <= 18595 {
// DAPIDLER_PROGRAM.agc:263
//
// DAPIDLER_PROGRAM.agc:264
//		CS	QERROR		# YES. DISPLAY ATT ERRORS ON THE ,-BALL.
// slot 18595
                            if slot <> 18595 or instruction <> 17192 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 808).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18596 {
// DAPIDLER_PROGRAM.agc:265
//		TS	AK +1		# ERROR COMPLEMENTS ARE INPUT TO NEEDLER.
// slot 18596
                                if slot <> 18596 or instruction <> 23538 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23538, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:266
//		CS	RERROR
// slot 18597
                                if slot <> 18597 or instruction <> 17194 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 810).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18598 {
// DAPIDLER_PROGRAM.agc:267
//		TS	AK +2
// slot 18598
                            if slot <> 18598 or instruction <> 23539 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23539, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18599 {
// DAPIDLER_PROGRAM.agc:268
//		CS	PERROR
// slot 18599
                                if slot <> 18599 or instruction <> 17204 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 820).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:269
//		XCH	AK
// slot 18600
                                if slot <> 18600 or instruction <> 24561 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 1009, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18603 {
                        if slot <= 18601 {
// DAPIDLER_PROGRAM.agc:270
//
// DAPIDLER_PROGRAM.agc:271
//		TCF	RETNMORE	# DISPLAY THESE THE NEXT TIME THROUGH
// slot 18601
                            if slot <> 18601 or instruction <> 5410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5410, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18602 {
// DAPIDLER_PROGRAM.agc:272
//
// DAPIDLER_PROGRAM.agc:273
//# CALCULATE GIMBAL ANGLE TOTAL ERRORS, RESOLVE INTO PILOT AXES, STORE TOTAL ERRORS FOR NEEDLER.  Q-AXIS FIRST.
// DAPIDLER_PROGRAM.agc:274
//
// DAPIDLER_PROGRAM.agc:275
//DSPLYTOT	EXTEND
// slot 18602
                                if slot <> 18602 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:276
//		QXCH	ITEMP1		# SAVE Q FOR CHEKBITS RETURN.
// slot 18603
                                if slot <> 18603 or instruction <> 9265 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 49, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18605 {
                            if slot <= 18604 {
// DAPIDLER_PROGRAM.agc:277
//
// DAPIDLER_PROGRAM.agc:278
//		CA	CTHETA		# DESIRED ATTITUDE, Y-AXIS, 2'S COMP.
// slot 18604
                                if slot <> 18604 or instruction <> 12498 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 210).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:279
//		EXTEND			# SUBTRACT CURRENT ATTITUDE.
// slot 18605
                                if slot <> 18605 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18606 {
// DAPIDLER_PROGRAM.agc:280
//		MSU	CDUY		# DIFFERENCE SCALED AT PI, 1'S COMP.
// slot 18606
                                if slot <> 18606 or instruction <> 8219 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMSU(words, 27).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:281
//		TS	AK		# SAVE FOR R-ERROR CALCULATION.
// slot 18607
                                if slot <> 18607 or instruction <> 23537 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23537, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 18620 {
                if slot <= 18613 {
                    if slot <= 18610 {
                        if slot <= 18608 {
// DAPIDLER_PROGRAM.agc:282
//		EXTEND
// slot 18608
                            if slot <> 18608 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18609 {
// DAPIDLER_PROGRAM.agc:283
//		MP	M21		# (CHTETA-CDUY)*M21 SCALED AT PI RADIANS.
// slot 18609
                                if slot <> 18609 or instruction <> 29453 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 781, readEffective:call(words, 781)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:284
//		XCH	AK +1		# STORE FIRST TERM OF Q ERROR.
// slot 18610
                                if slot <> 18610 or instruction <> 24562 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 1010, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18611 {
// DAPIDLER_PROGRAM.agc:285
//		CA	CPSI		# DESIRED ATTITUDE,Z-AXIS, 2'S COMP.
// slot 18611
                            if slot <> 18611 or instruction <> 12499 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 211).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18612 {
// DAPIDLER_PROGRAM.agc:286
//		EXTEND			# SUBTRACT CURRENT ATTITUDE.
// slot 18612
                                if slot <> 18612 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:287
//		MSU	CDUZ		# DIFFERENCE SCALED AT PI, 1'S COMP.
// slot 18613
                                if slot <> 18613 or instruction <> 8220 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMSU(words, 28).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18616 {
                        if slot <= 18614 {
// DAPIDLER_PROGRAM.agc:288
//		TS	AK +2		# SAVE Z-AXIS TERM FOR R ERROR CALCULATION
// slot 18614
                            if slot <> 18614 or instruction <> 23539 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23539, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18615 {
// DAPIDLER_PROGRAM.agc:289
//		EXTEND
// slot 18615
                                if slot <> 18615 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:290
//		MP	M22		# (CPSI-CDUZ)*M22, SCALED AT PI RADIANS.
// slot 18616
                                if slot <> 18616 or instruction <> 29455 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 783, readEffective:call(words, 783)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18618 {
                            if slot <= 18617 {
// DAPIDLER_PROGRAM.agc:291
//		AD	AK +1		# Q ERROR COMPLETE	   , AT PI RAD.
// slot 18617
                                if slot <> 18617 or instruction <> 25586 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1010).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:292
//		TC	OVERSUB2	# PIN NEEDLES IN CASE OF OVERFLOW
// slot 18618
                                if slot <> 18618 or instruction <> 1309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1309, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18619 {
// DAPIDLER_PROGRAM.agc:293
//		TS	AK +1
// slot 18619
                                if slot <> 18619 or instruction <> 23538 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23538, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:294
//
// DAPIDLER_PROGRAM.agc:295
//# R ERROR CALCULATION NEXT.
// DAPIDLER_PROGRAM.agc:296
//
// DAPIDLER_PROGRAM.agc:297
//		CA	AK		# Y-AXIS DIFFERENCE STORED BY Q-AXIS CALC.
// slot 18620
                                if slot <> 18620 or instruction <> 13297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1009).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18627 {
                    if slot <= 18623 {
                        if slot <= 18621 {
// DAPIDLER_PROGRAM.agc:298
//		EXTEND
// slot 18621
                            if slot <> 18621 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18622 {
// DAPIDLER_PROGRAM.agc:299
//		MP	M31		# (CTHETA-CDUY)*M31, SCALED AT PI RADIANS.
// slot 18622
                                if slot <> 18622 or instruction <> 29454 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 782, readEffective:call(words, 782)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:300
//		XCH	AK +2		# FIRST TERM OF R ERROR.
// slot 18623
                                if slot <> 18623 or instruction <> 24563 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 1011, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18625 {
                            if slot <= 18624 {
// DAPIDLER_PROGRAM.agc:301
//					# Z-AXIS DIFFERENCE, STORED BY A CALC. IS
// DAPIDLER_PROGRAM.agc:302
//		EXTEND			# RECOVERED BY THE EXCHANGE.
// slot 18624
                                if slot <> 18624 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:303
//		MP	M32		# (CPSI-CDUZ)*M32, SCALED AT PI RADIANS.
// slot 18625
                                if slot <> 18625 or instruction <> 29456 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 784, readEffective:call(words, 784)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18626 {
// DAPIDLER_PROGRAM.agc:304
//		AD	AK +2		# R ERROR COMPLETE	   , AT PI RAD.
// slot 18626
                                if slot <> 18626 or instruction <> 25587 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1011).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:305
//		TC	OVERSUB2	# PIN NEEDLES IN CASE OF OVERFLOW.
// slot 18627
                                if slot <> 18627 or instruction <> 1309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1309, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18630 {
                        if slot <= 18628 {
// DAPIDLER_PROGRAM.agc:306
//		TS	AK +2
// slot 18628
                            if slot <> 18628 or instruction <> 23539 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23539, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18629 {
// DAPIDLER_PROGRAM.agc:307
//
// DAPIDLER_PROGRAM.agc:308
//# NOW CALCULATE P ERROR.  (NOTE THAT M13 = 1, SCALED AT 1, SO THE MULTIPLICATION IS BY-PASSED.)
// DAPIDLER_PROGRAM.agc:309
//# Page 1416
// DAPIDLER_PROGRAM.agc:310
//		CA	AK		# Y-AXIS DIFFERENCE STORED BY Q AXIS CALC.
// slot 18629
                                if slot <> 18629 or instruction <> 13297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1009).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:311
//		EXTEND
// slot 18630
                                if slot <> 18630 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18632 {
                            if slot <= 18631 {
// DAPIDLER_PROGRAM.agc:312
//		MP	M11		# (CTHETA-CDUY)*M11 SCALED AT PI RADIANS.
// slot 18631
                                if slot <> 18631 or instruction <> 29452 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 780, readEffective:call(words, 780)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:313
//		XCH	AK		# FIRST TERM OF P ERROR IN AK, AT PI RAD.
// slot 18632
                                if slot <> 18632 or instruction <> 24561 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 1009, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18633 {
// DAPIDLER_PROGRAM.agc:314
//		CAE	CPHI		# DESIRED ATTITUDE, X-AXIS, 2'S COMP.
// slot 18633
                                if slot <> 18633 or instruction <> 12497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 209).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:315
//		EXTEND			# SUBTRACT CURRENT X ATTITUDE.
// slot 18634
                                if slot <> 18634 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18660 {
            if slot <= 18647 {
                if slot <= 18640 {
                    if slot <= 18637 {
                        if slot <= 18635 {
// DAPIDLER_PROGRAM.agc:316
//		MSU	CDUX		# X-AXIS DIFFERENCE, 1'S COMP, AT PI RAD.
// slot 18635
                            if slot <> 18635 or instruction <> 8218 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18636 {
// DAPIDLER_PROGRAM.agc:317
//
// DAPIDLER_PROGRAM.agc:318
//# M13 = 1, SO BYPASS THE MULTIPLICATION.
// DAPIDLER_PROGRAM.agc:319
//#		EXTEND
// DAPIDLER_PROGRAM.agc:320
//#		MP	M13		  (CPHI-CDUX)*M13 SCALED AT PI RADIANS.
// DAPIDLER_PROGRAM.agc:321
//
// DAPIDLER_PROGRAM.agc:322
//		AD	AK		# P ERROR COMPLETE	, SCALED AT PI RAD
// slot 18636
                                if slot <> 18636 or instruction <> 25585 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1009).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:323
//		TC	OVERSUB2	# PIN NEEDLES IN CASE OF OVERFLOW.
// slot 18637
                                if slot <> 18637 or instruction <> 1309 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1309, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18638 {
// DAPIDLER_PROGRAM.agc:324
//		TS	AK
// slot 18638
                            if slot <> 18638 or instruction <> 23537 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23537, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18639 {
// DAPIDLER_PROGRAM.agc:325
//
// DAPIDLER_PROGRAM.agc:326
//		EXTEND
// slot 18639
                                if slot <> 18639 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:327
//		QXCH	ITEMP1		# RESTORE Q FOR CHEKBITS RETURN.
// slot 18640
                                if slot <> 18640 or instruction <> 9265 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 49, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18643 {
                        if slot <= 18641 {
// DAPIDLER_PROGRAM.agc:328
//
// DAPIDLER_PROGRAM.agc:329
//		TCF	RETNMORE	# DISPLAY THESE THE NEXT TIME THROUGH
// slot 18641
                            if slot <> 18641 or instruction <> 5410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5410, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18642 {
// DAPIDLER_PROGRAM.agc:330
//
// DAPIDLER_PROGRAM.agc:331
//# Page 1417
// DAPIDLER_PROGRAM.agc:332
//# FDAI ATTITUDE ERROR DISPLAY SUBROUTINE
// DAPIDLER_PROGRAM.agc:333
//#
// DAPIDLER_PROGRAM.agc:334
//# PROGRAM DESCRIPTION:    KEENE KERMAN   5/24/67
// DAPIDLER_PROGRAM.agc:335
//#
// DAPIDLER_PROGRAM.agc:336
//# MOD 1 BY WORK KERMAN, 12 DEC 67
// DAPIDLER_PROGRAM.agc:337
//#
// DAPIDLER_PROGRAM.agc:338
//# MOD 2 BY WORK KERMAN, 6 APRIL 68 CONVERTS ATTITUDE ERROR DISPLAY SCALING FROM 16 7/8 DEG. TO 42 3/16 DEGREES.
// DAPIDLER_PROGRAM.agc:339
//#
// DAPIDLER_PROGRAM.agc:340
//#     THIS SUBROUTINE IS USED TO DISPLAY ATTITUDE ERRORS ON THE FDAI VIA THE DIGITAL TO ANALOG CONVERTERS (DACS)
// DAPIDLER_PROGRAM.agc:341
//# IN THE CDUS.  CARE IS TAKEN TO METER OUT THE APPROPRIATE NUMBER OF PULSES TO THE IMU ERROR COUNTERS AND PREVENT
// DAPIDLER_PROGRAM.agc:342
//# OVERFLOW, TO CONTROL THE RELAY SEQUENCING, AND TO AVOID INTERFERENCE WITH THE COARSE ALIGN LOOP WHICH ALSO USES
// DAPIDLER_PROGRAM.agc:343
//# THE DACS.
// DAPIDLER_PROGRAM.agc:344
//#
// DAPIDLER_PROGRAM.agc:345
//#
// DAPIDLER_PROGRAM.agc:346
//# CALLING SEQUENCE:
// DAPIDLER_PROGRAM.agc:347
//#
// DAPIDLER_PROGRAM.agc:348
//#     DURING THE INITIALIZATION SECTION OF THE USER'S PROGRAM, BIT3 OF RCSFLAGS SHOULD BE SET TO INITIATE THE
// DAPIDLER_PROGRAM.agc:349
//# TURN-ON SEQUENCE WITHIN THE NEEDLES PROGRAM:
// DAPIDLER_PROGRAM.agc:350
//#
// DAPIDLER_PROGRAM.agc:351
//#	   CS	  RCSFLAGS	  IN EBANK6
// DAPIDLER_PROGRAM.agc:352
//#	   MASK	  BIT3
// DAPIDLER_PROGRAM.agc:353
//#	   ADS	  RCSFLAGS
// DAPIDLER_PROGRAM.agc:354
//#
// DAPIDLER_PROGRAM.agc:355
//# THEREAFTER, THE ATTITUDE ERRORS GENERATED BY THE USER SHOULD BE TRANSFERRED TO THE FOLLOWING LOCATIONS IN EBANK6:
// DAPIDLER_PROGRAM.agc:356
//#
// DAPIDLER_PROGRAM.agc:357
//#	   AK	  SCALED 180 DEGREES  NOTE: THESE LOCATIONS ARE SUBJECT
// DAPIDLER_PROGRAM.agc:358
//#	   AK1	  SCALED 180 DEGREES	    TO CHANGE
// DAPIDLER_PROGRAM.agc:359
//#	   AK2	  SCALED 180 DEGREES
// DAPIDLER_PROGRAM.agc:360
//#
// DAPIDLER_PROGRAM.agc:361
//# FULL SCALED DEFLECTION OF THE NEEDLES CORRESPONDS TO 5 1/16 DEGREES, WHILE 384 BITS IN THE IMU ERROR COUNTER
// DAPIDLER_PROGRAM.agc:362
//# CORRESPONDS TO 42 3/16 DEGREES.  (DAC MAXIMUM CAPACITY IS 384 BITS.) 46 BITS EFFECTIVELY PIN THE NEEDLES.
// DAPIDLER_PROGRAM.agc:363
//#
// DAPIDLER_PROGRAM.agc:364
//# A CALL TO NEEDLER WILL THEN UPDATE THE DISPLAY:
// DAPIDLER_PROGRAM.agc:365
//#
// DAPIDLER_PROGRAM.agc:366
//#	   INHINT
// DAPIDLER_PROGRAM.agc:367
//#	   TC	  IBNKCALL	 NOTE: EBANK SHOULD BE SET TO E6
// DAPIDLER_PROGRAM.agc:368
//#	   CADR	  NEEDLER
// DAPIDLER_PROGRAM.agc:369
//#	   RELINT
// DAPIDLER_PROGRAM.agc:370
//#
// DAPIDLER_PROGRAM.agc:371
//#     THIS PROCESS SHOULD BE REPEATED EACH TIME THE ERRORS ARE UPDATED.  AT LEAST 3 PASSES THRU THE PROGRAM ARE
// DAPIDLER_PROGRAM.agc:372
//# REQUIRED BEFORE ANYTHING IS ACTUALLY DISPLAYED ON THE ERROR METERS.
// DAPIDLER_PROGRAM.agc:373
//# NOTE: EACH CALL TO NEEDLER MUST BE SEPARATED BY AT LEAST 50MS TO ASSURE PROPER RELAY SEQUENCING.
// DAPIDLER_PROGRAM.agc:374
//#
// DAPIDLER_PROGRAM.agc:375
//# ERASABLES USED:
// DAPIDLER_PROGRAM.agc:376
//#		       AK	  CDUXCMD
// DAPIDLER_PROGRAM.agc:377
//#		       AK1	  CDUYCMD
// DAPIDLER_PROGRAM.agc:378
//#		       AK2	  CDUZCMD
// DAPIDLER_PROGRAM.agc:379
//#		       EDRIVEX	  A,L,Q
// DAPIDLER_PROGRAM.agc:380
//#		       EDRIVEY	  T5TEMP
// DAPIDLER_PROGRAM.agc:381
//#		       EDRIVEZ	  DINDX
// DAPIDLER_PROGRAM.agc:382
//# Page 1418
// DAPIDLER_PROGRAM.agc:383
//#
// DAPIDLER_PROGRAM.agc:384
//# SWITCHES:	       RCSFLAGS	  BITS 3,2
// DAPIDLER_PROGRAM.agc:385
//#
// DAPIDLER_PROGRAM.agc:386
//# I/O CHANNELS:	       CHAN12	  BIT 4 (COARSE ALIGN - READ ONLY)
// DAPIDLER_PROGRAM.agc:387
//#		       CHAN12	  BIT 6 (IMU ERROR COUNTER ENABLE)
// DAPIDLER_PROGRAM.agc:388
//#		       CHAN14	  BIT 13,14,15 (DAC ACTIVITY)
// DAPIDLER_PROGRAM.agc:389
//#
// DAPIDLER_PROGRAM.agc:390
//#
// DAPIDLER_PROGRAM.agc:391
//# SIGN CONVENTION<   AK = THETAC - THETA
// DAPIDLER_PROGRAM.agc:392
//#	    WHERE    THETAC = COMMAND ANGLE
// DAPIDLER_PROGRAM.agc:393
//#		     THETA  = PRESENT ANGLE
// DAPIDLER_PROGRAM.agc:394
//
// DAPIDLER_PROGRAM.agc:395
//
// DAPIDLER_PROGRAM.agc:396
//NEEDLER		CA	RCSFLAGS
// slot 18642
                                if slot <> 18642 or instruction <> 12987 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:397
//		MASK	SIX
// slot 18643
                                if slot <> 18643 or instruction <> 31906 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                    if fixedOperand = 6 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18645 {
                            if slot <= 18644 {
// DAPIDLER_PROGRAM.agc:398
//		EXTEND
// slot 18644
                                if slot <> 18644 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:399
//		BZF	NEEDLES3
// slot 18645
                                if slot <> 18645 or instruction <> 5362 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5362, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18646 {
// DAPIDLER_PROGRAM.agc:400
//		MASK	BIT3
// slot 18646
                                if slot <> 18646 or instruction <> 31209 { return choose false if checkOnly else -1. }
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
                            } else {
// DAPIDLER_PROGRAM.agc:401
//		EXTEND
// slot 18647
                                if slot <> 18647 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 18653 {
                    if slot <= 18650 {
                        if slot <= 18648 {
// DAPIDLER_PROGRAM.agc:402
//		BZF	NEEDLER2	# BIT3 = 0, BIT2 = 1
// slot 18648
                            if slot <> 18648 or instruction <> 5355 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5355, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18649 {
// DAPIDLER_PROGRAM.agc:403
//
// DAPIDLER_PROGRAM.agc:404
//		CS	BIT6		# FIRST PASS BIT3 = 1
// slot 18649
                                if slot <> 18649 or instruction <> 18918 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:405
//		EXTEND			# DISABLE IMU ERROR COUNTER TO ZERO DACS
// slot 18650
                                if slot <> 18650 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18651 {
// DAPIDLER_PROGRAM.agc:406
//		WAND	CHAN12		# MUST WAIT AT LEAST 60 MS BEFORE
// slot 18651
                            if slot <> 18651 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18652 {
// DAPIDLER_PROGRAM.agc:407
//NEEDLE11	CS	ZERO		# ENABLING COUNTERS.
// slot 18652
                                if slot <> 18652 or instruction <> 18925 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:408
//		TS	AK		# ZERO THE INPUTS ON FIRST PASS
// slot 18653
                                if slot <> 18653 or instruction <> 23537 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23537, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18656 {
                        if slot <= 18654 {
// DAPIDLER_PROGRAM.agc:409
//		TS	AK1
// slot 18654
                            if slot <> 18654 or instruction <> 23538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18655 {
// DAPIDLER_PROGRAM.agc:410
//		TS	AK2
// slot 18655
                                if slot <> 18655 or instruction <> 23539 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23539, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:411
//		TS	EDRIVEX		# ZERO THE DISPLAY REGISTERS
// slot 18656
                                if slot <> 18656 or instruction <> 23540 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23540, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18658 {
                            if slot <= 18657 {
// DAPIDLER_PROGRAM.agc:412
//		TS	EDRIVEY
// slot 18657
                                if slot <> 18657 or instruction <> 23541 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23541, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:413
//		TS	EDRIVEZ
// slot 18658
                                if slot <> 18658 or instruction <> 23542 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23542, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18659 {
// DAPIDLER_PROGRAM.agc:414
//		TS	CDUXCMD		# ZERO THE OUT COUNTERS
// slot 18659
                                if slot <> 18659 or instruction <> 22568 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22568, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:415
//		TS	CDUYCMD
// slot 18660
                                if slot <> 18660 or instruction <> 22569 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22569, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 18673 {
                if slot <= 18666 {
                    if slot <= 18663 {
                        if slot <= 18661 {
// DAPIDLER_PROGRAM.agc:416
//		TS	CDUZCMD
// slot 18661
                            if slot <> 18661 or instruction <> 22570 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22570, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18662 {
// DAPIDLER_PROGRAM.agc:417
//		CS	SIX		# RESET RCSFLAGS FOR PASS2
// slot 18662
                                if slot <> 18662 or instruction <> 19618 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:418
//		MASK	RCSFLAGS
// slot 18663
                                if slot <> 18663 or instruction <> 29371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18664 {
// DAPIDLER_PROGRAM.agc:419
//		AD	BIT2
// slot 18664
                            if slot <> 18664 or instruction <> 27114 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18665 {
// DAPIDLER_PROGRAM.agc:420
//		TS	RCSFLAGS
// slot 18665
                                if slot <> 18665 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:421
//		TCF	RETNMORE
// slot 18666
                                if slot <> 18666 or instruction <> 5410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5410, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18669 {
                        if slot <= 18667 {
// DAPIDLER_PROGRAM.agc:422
//
// DAPIDLER_PROGRAM.agc:423
//NEEDLER2	CAF	BIT6		# ENABLE IMU ERROR COUNTERS
// slot 18667
                            if slot <> 18667 or instruction <> 14822 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18668 {
// DAPIDLER_PROGRAM.agc:424
//		EXTEND
// slot 18668
                                if slot <> 18668 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:425
//		WOR	CHAN12
// slot 18669
                                if slot <> 18669 or instruction <> 2570 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18671 {
                            if slot <= 18670 {
// DAPIDLER_PROGRAM.agc:426
//		CS	SIX		# RESET RCSFLAGS TO DISPLAY ATTITUDE
// slot 18670
                                if slot <> 18670 or instruction <> 19618 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:427
//		MASK	RCSFLAGS	# ERRORS    WAIT ATLEAST 4 MS FOR
// slot 18671
                                if slot <> 18671 or instruction <> 29371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18672 {
// DAPIDLER_PROGRAM.agc:428
//		TS	RCSFLAGS	# RELAY CLOSURE
// slot 18672
                                if slot <> 18672 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:429
//		TCF	RETNMORE
// slot 18673
                                if slot <> 18673 or instruction <> 5410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5410, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18680 {
                    if slot <= 18676 {
                        if slot <= 18674 {
// DAPIDLER_PROGRAM.agc:430
//
// DAPIDLER_PROGRAM.agc:431
//NEEDLES3	CAF	BIT6		# CHECK TO SEE IF IMU ERROR COUNTER
// slot 18674
                            if slot <> 18674 or instruction <> 14822 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18675 {
// DAPIDLER_PROGRAM.agc:432
//		EXTEND			# IS ENABLED
// slot 18675
                                if slot <> 18675 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:433
//		RAND	CHAN12
// slot 18676
                                if slot <> 18676 or instruction <> 1034 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18678 {
                            if slot <= 18677 {
// DAPIDLER_PROGRAM.agc:434
//# Page 1419
// DAPIDLER_PROGRAM.agc:435
//		CCS	A		# IF NOT, RE-INITIALIZE NEEDLER.
// slot 18677
                                if slot <> 18677 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:436
//		TCF	NEEDLES
// slot 18678
                                if slot <> 18678 or instruction <> 5371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5371, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18679 {
// DAPIDLER_PROGRAM.agc:437
//
// DAPIDLER_PROGRAM.agc:438
//		CS	RCSFLAGS	# SET UP INITIALIZATION FLAG IN RCSFLAGS.
// slot 18679
                                if slot <> 18679 or instruction <> 17083 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 699).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:439
//		MASK	BIT3
// slot 18680
                                if slot <> 18680 or instruction <> 31209 { return choose false if checkOnly else -1. }
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
                    if slot <= 18683 {
                        if slot <= 18681 {
// DAPIDLER_PROGRAM.agc:440
//		ADS	RCSFLAGS
// slot 18681
                            if slot <> 18681 or instruction <> 11963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 18682 {
// DAPIDLER_PROGRAM.agc:441
//		TCF	RETNMORE
// slot 18682
                                if slot <> 18682 or instruction <> 5410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5410, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:442
//
// DAPIDLER_PROGRAM.agc:443
//NEEDLES		CAF	TWO
// slot 18683
                                if slot <> 18683 or instruction <> 14826 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18685 {
                            if slot <= 18684 {
// DAPIDLER_PROGRAM.agc:444
//DACLOOP		TS	DINDX
// slot 18684
                                if slot <> 18684 or instruction <> 22579 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:445
//		CS	ONETENTH	# RESCALE INPUTS TO + OR - 1800 DEGREES.
// slot 18685
                                if slot <> 18685 or instruction <> 17692 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1308), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18686 {
// DAPIDLER_PROGRAM.agc:446
//		EXTEND
// slot 18686
                                if slot <> 18686 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// DAPIDLER_PROGRAM.agc:447
//		INDEX	DINDX
// slot 18687
                                if slot <> 18687 or instruction <> 20531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 20531, words[0], readEffective).
                                }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 20531, words[0], readEffective).
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
set agcAotRoutes[1121] to agcAotUnit1121@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:448
//		MP	AK
// slot 18688
    18688, 59362
)).

// bank 20, slots 18689-18697
function agcAotUnit1122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18692 {
        if slot <= 18690 {
            if slot <= 18689 {
// DAPIDLER_PROGRAM.agc:449
//		TS	L
// slot 18689
                if slot <> 18689 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:450
//		CCS	A
// slot 18690
                if slot <> 18690 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18691 {
// DAPIDLER_PROGRAM.agc:451
//		CA	DACLIMIT
// slot 18691
                if slot <> 18691 or instruction <> 13594 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1306), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:452
//		TCF	+2
// slot 18692
                if slot <> 18692 or instruction <> 5382 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5382, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18694 {
            if slot <= 18693 {
// DAPIDLER_PROGRAM.agc:453
//		CS	DACLIMIT
// slot 18693
                if slot <> 18693 or instruction <> 17690 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1306), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:454
//		AD	L
// slot 18694
                if slot <> 18694 or instruction <> 24577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18695 {
// DAPIDLER_PROGRAM.agc:455
//		TS	T5TEMP		# OVFLO CHK
// slot 18695
                if slot <> 18695 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18696 {
// DAPIDLER_PROGRAM.agc:456
//		TCF	+4
// slot 18696
                    if slot <> 18696 or instruction <> 5388 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DAPIDLER_PROGRAM.agc:457
//		INDEX	A		# ON OVERFLOW LIMIT OUTPUT TO +-384
// slot 18697
                    if slot <> 18697 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1122] to agcAotUnit1122@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:458
//		CAF	DACLIMIT
// slot 18698
    18698, 27188
)).

// bank 20, slots 18699-18700
function agcAotUnit1123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18699 {
// DAPIDLER_PROGRAM.agc:459
//		TS	L
// slot 18699
        if slot <> 18699 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// DAPIDLER_PROGRAM.agc:460
//		INDEX	DINDX
// slot 18700
        if slot <> 18700 or instruction <> 20531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20531, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20531, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1123] to agcAotUnit1123@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:461
//		CS	EDRIVEX		# CURRENT VALUE OF DAC
// slot 18701
    18701, 34792
)).

// bank 20, slots 18702-18703
function agcAotUnit1124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18702 {
// DAPIDLER_PROGRAM.agc:462
//		AD	L
// slot 18702
        if slot <> 18702 or instruction <> 24577 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// DAPIDLER_PROGRAM.agc:463
//		INDEX	DINDX
// slot 18703
        if slot <> 18703 or instruction <> 20531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20531, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20531, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1124] to agcAotUnit1124@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:464
//		ADS	CDUXCMD
// slot 18704
    18704, 22608
)).

// bank 20, slots 18705-18705
function agcAotUnit1125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// DAPIDLER_PROGRAM.agc:465
//		INDEX	DINDX
// slot 18705
    if slot <> 18705 or instruction <> 20531 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20531, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20531, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1125] to agcAotUnit1125@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:466
//		LXCH	EDRIVEX
// slot 18706
    18706, 20456
)).

// bank 20, slots 18707-18712
function agcAotUnit1126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18709 {
        if slot <= 18707 {
// DAPIDLER_PROGRAM.agc:467
//		CCS	DINDX
// slot 18707
            if slot <> 18707 or instruction <> 4147 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 51).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18708 {
// DAPIDLER_PROGRAM.agc:468
//		TCF	DACLOOP
// slot 18708
                if slot <> 18708 or instruction <> 5372 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5372, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:469
//		CAF	13,14,15
// slot 18709
                if slot <> 18709 or instruction <> 16352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4064), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18710 {
// DAPIDLER_PROGRAM.agc:470
//		EXTEND
// slot 18710
            if slot <> 18710 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18711 {
// DAPIDLER_PROGRAM.agc:471
//		WOR	CHAN14		# SET DAC ACTIVITY BITS
// slot 18711
                if slot <> 18711 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DAPIDLER_PROGRAM.agc:472
//		TCF	RETNMORE
// slot 18712
                if slot <> 18712 or instruction <> 5410 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5410, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1126] to agcAotUnit1126@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:473
//
// DAPIDLER_PROGRAM.agc:474
//		DEC	-384
// slot 18713
    18713, 64766,
// DAPIDLER_PROGRAM.agc:475
//DACLIMIT	DEC	16000
// slot 18714
    18714, 32000,
// DAPIDLER_PROGRAM.agc:476
//		DEC	384
// slot 18715
    18715, 768,
// DAPIDLER_PROGRAM.agc:477
//
// DAPIDLER_PROGRAM.agc:478
//ONETENTH	OCT	03146		# DECIMAL +0.1, SCALED AT 1.
// slot 18716
    18716, 3276
)).

// bank 20, slots 18717-18718
function agcAotUnit1127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18717 {
// DAPIDLER_PROGRAM.agc:479
//DSPLYALT	EQUALS	BIT4		# 100 MS ALTERNATION BIT IN RCSFLAGS
// DAPIDLER_PROGRAM.agc:480
//
// DAPIDLER_PROGRAM.agc:481
//OVERSUB2	TS	7		# RETURNS  A  UNCHANGED  OR LIMITED TO
// slot 18717
        if slot <> 18717 or instruction <> 22535 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22535, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// DAPIDLER_PROGRAM.agc:482
//		TC	Q		# POSMAX OR NEGMAX IF A HAS OVERFLOW
// slot 18718
        if slot <> 18718 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1127] to agcAotUnit1127@.

// bank 20, slots 18719-18719
function agcAotUnit1128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// DAPIDLER_PROGRAM.agc:483
//		INDEX	A
// slot 18719
    if slot <> 18719 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1128] to agcAotUnit1128@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:484
//# Page 1420
// DAPIDLER_PROGRAM.agc:485
//		CS	LIMITS		# DUPLICATE CODING IN  BANK 16
// slot 18720
    18720, 37816
)).

// bank 20, slots 18721-18724
function agcAotUnit1129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18722 {
        if slot <= 18721 {
// DAPIDLER_PROGRAM.agc:486
//		TC	Q
// slot 18721
            if slot <> 18721 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// DAPIDLER_PROGRAM.agc:487
//
// DAPIDLER_PROGRAM.agc:488
//RETNMORE	EXTEND			# RETURN TO CHEKMORE
// slot 18722
            if slot <> 18722 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18723 {
// DAPIDLER_PROGRAM.agc:489
//		DCA	MORECADR
// slot 18723
            if slot <> 18723 or instruction <> 13606 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1318, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DAPIDLER_PROGRAM.agc:490
//		DTCB
// slot 18724
            if slot <> 18724 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1129] to agcAotUnit1129@.

agcAotInstallSourceRope(list(
// DAPIDLER_PROGRAM.agc:491
//
// DAPIDLER_PROGRAM.agc:492
//		EBANK=	AOSQ
// DAPIDLER_PROGRAM.agc:493
//MORECADR	2CADR	CHEKMORE
// slot 18725 18726
    18725, 2076, 18726, 28812
)).

// no code for the lines below
// DAPIDLER_PROGRAM.agc:494
//
