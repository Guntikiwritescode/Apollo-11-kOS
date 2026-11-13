// Q_R-AXIS_RCS_AUTOPILOT.agc
// bank 17, slots 17466-17528
function agcAotUnit1044 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17496 {
        if slot <= 17480 {
            if slot <= 17472 {
                if slot <= 17468 {
                    if slot <= 17466 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// Q_R-AXIS_RCS_AUTOPILOT.agc:2
//# Filename:	Q_R-AXIS_RCS_AUTOPILOT.agc
// Q_R-AXIS_RCS_AUTOPILOT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// Q_R-AXIS_RCS_AUTOPILOT.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// Q_R-AXIS_RCS_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// Q_R-AXIS_RCS_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// Q_R-AXIS_RCS_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// Q_R-AXIS_RCS_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// Q_R-AXIS_RCS_AUTOPILOT.agc:9
//# Pages:	1442-1459
// Q_R-AXIS_RCS_AUTOPILOT.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// Q_R-AXIS_RCS_AUTOPILOT.agc:11
//#				Luminary131 file, using page
// Q_R-AXIS_RCS_AUTOPILOT.agc:12
//#				images from Luminary 1A.
// Q_R-AXIS_RCS_AUTOPILOT.agc:13
//#		2009-06-07 RSB	Corrected "DEC 96.0" to "DEC 96", since
// Q_R-AXIS_RCS_AUTOPILOT.agc:14
//#				the former is not compatible with yaYUL.
// Q_R-AXIS_RCS_AUTOPILOT.agc:15
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:16
//# This source code has been transcribed or otherwise adapted from
// Q_R-AXIS_RCS_AUTOPILOT.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// Q_R-AXIS_RCS_AUTOPILOT.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// Q_R-AXIS_RCS_AUTOPILOT.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// Q_R-AXIS_RCS_AUTOPILOT.agc:20
//# in storage size and consequent reduction in image quality as well) are
// Q_R-AXIS_RCS_AUTOPILOT.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// Q_R-AXIS_RCS_AUTOPILOT.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// Q_R-AXIS_RCS_AUTOPILOT.agc:23
//# about getting access to the (much) higher-quality images which Paul
// Q_R-AXIS_RCS_AUTOPILOT.agc:24
//# actually created.
// Q_R-AXIS_RCS_AUTOPILOT.agc:25
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:26
//# Notations on the hardcopy document read, in part:
// Q_R-AXIS_RCS_AUTOPILOT.agc:27
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// Q_R-AXIS_RCS_AUTOPILOT.agc:29
//#	16:27 JULY 14, 1969
// Q_R-AXIS_RCS_AUTOPILOT.agc:30
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:31
//# Page 1442
// Q_R-AXIS_RCS_AUTOPILOT.agc:32
//		BANK	17
// Q_R-AXIS_RCS_AUTOPILOT.agc:33
//		SETLOC	DAPS2
// Q_R-AXIS_RCS_AUTOPILOT.agc:34
//		BANK
// Q_R-AXIS_RCS_AUTOPILOT.agc:35
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:36
//		EBANK=	CDUXD
// Q_R-AXIS_RCS_AUTOPILOT.agc:37
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:38
//		COUNT*	$$/DAPQR
// Q_R-AXIS_RCS_AUTOPILOT.agc:39
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:40
//CALLQERR	CA	BIT13		# CALCULATE Q,R ERRORS UNLESS THESE AXES
// slot 17466
                        if slot <> 17466 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17467 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:41
//		EXTEND			# ARE IN MANUAL RATE COMMAND.
// slot 17467
                            if slot <> 17467 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:42
//		RAND	CHAN31
// slot 17468
                            if slot <> 17468 or instruction <> 1049 { return choose false if checkOnly else -1. }
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
                    if slot <= 17470 {
                        if slot <= 17469 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:43
//		CCS	A
// slot 17469
                            if slot <> 17469 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:44
//		TCF	+5		# IN AUTO COMPUTE Q,R ERRORS
// slot 17470
                            if slot <> 17470 or instruction <> 5187 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5187, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17471 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:45
//		CS	DAPBOOLS	# IN MANUAL RATE COMMAND?
// slot 17471
                            if slot <> 17471 or instruction <> 16457 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 73).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:46
//		MASK	OURRCBIT
// slot 17472
                            if slot <> 17472 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
                if slot <= 17476 {
                    if slot <= 17474 {
                        if slot <= 17473 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:47
//		EXTEND
// slot 17473
                            if slot <> 17473 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:48
//		BZF	Q,RORGTS	# IF SO BYPASS CALCULATION OF ERRORS.
// slot 17474
                            if slot <> 17474 or instruction <> 5188 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17475 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:49
//		TC	QERRCALC
// slot 17475
                            if slot <> 17475 or instruction <> 1430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1430, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:50
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:51
//Q,RORGTS	CCS	COTROLER	# CHOOSE CONTROL SYSTEM FOR THIS DAP PASS:
// slot 17476
                            if slot <> 17476 or instruction <> 5017 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 921).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17478 {
                        if slot <= 17477 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:52
//		TCF	GOTOGTS		#	GTS (ALTERNATES WITH RCS WHEN DOCKED)
// slot 17477
                            if slot <> 17477 or instruction <> 5511 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5511, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:53
//		TCF	TRYGTS		#	GTS IF ALLOWED, OTHERWISE RCS
// slot 17478
                            if slot <> 17478 or instruction <> 5500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5500, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17479 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:54
//RCS		CAF	ZERO		#	RCS (TRYGTS MAY BRANCH TO HERE)
// slot 17479
                            if slot <> 17479 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:55
//		TS	COTROLER
// slot 17480
                            if slot <> 17480 or instruction <> 23449 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23449, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17488 {
                if slot <= 17484 {
                    if slot <= 17482 {
                        if slot <= 17481 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:56
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:57
//		DXCH	EDOTQ
// slot 17481
                            if slot <> 17481 or instruction <> 22303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 799, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:58
//		TC	ROT-TOUV
// slot 17482
                            if slot <> 17482 or instruction <> 1638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17483 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:59
//		DXCH	OMEGAU
// slot 17483
                            if slot <> 17483 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:60
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:61
//# X - TRANSLATION
// Q_R-AXIS_RCS_AUTOPILOT.agc:62
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:63
//# INPUT:	BITS 7,8 OF CH31 (TRANSLATION CONTROLLER)
// Q_R-AXIS_RCS_AUTOPILOT.agc:64
//#		ULLAGER
// Q_R-AXIS_RCS_AUTOPILOT.agc:65
//#		APSFLAG, DRIFTBIT
// Q_R-AXIS_RCS_AUTOPILOT.agc:66
//#		ACC40R2X, ACRBTRAN
// Q_R-AXIS_RCS_AUTOPILOT.agc:67
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:68
//# OUTPUT:	NEXTU, NEXTV	CODES OF TRANSLATION FOR AFTER ROTATION
// Q_R-AXIS_RCS_AUTOPILOT.agc:69
//#		SENSETYP	TELL ROTATION DIRECTION AND DESIRE
// Q_R-AXIS_RCS_AUTOPILOT.agc:70
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:71
//# X-TRANS POLICIES ARE EITHER 4 JETS OR A DIAGONAL PAIR.  IN 2-JET TRANSLATION THE SYSTEM IS SPECIFIED.  A FAILURE
// Q_R-AXIS_RCS_AUTOPILOT.agc:72
//# WILL OVERRIDE THIS SPECIFICATION.  AN ALARM RESULTS WHEN NO POLICY IS AVAILABLE BECAUSE OF FAILURES.
// Q_R-AXIS_RCS_AUTOPILOT.agc:73
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:74
//SENSEGET	CA	BIT7		# INPUT BITS OVERRIDE THE INTERNAL BITS
// slot 17484
                            if slot <> 17484 or instruction <> 14821 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17486 {
                        if slot <= 17485 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:75
//		EXTEND			# SENSETYP WILL NOT OPPOSE ANYTRANS
// slot 17485
                            if slot <> 17485 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:76
//		RAND	CHAN31
// slot 17486
                            if slot <> 17486 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17487 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:77
//		EXTEND
// slot 17487
                            if slot <> 17487 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:78
//		BZF	+X0RULGE
// slot 17488
                            if slot <> 17488 or instruction <> 5222 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5222, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17492 {
                    if slot <= 17490 {
                        if slot <= 17489 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:79
//# Page 1443
// Q_R-AXIS_RCS_AUTOPILOT.agc:80
//		CA	BIT8
// slot 17489
                            if slot <> 17489 or instruction <> 14820 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:81
//		EXTEND
// slot 17490
                            if slot <> 17490 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17491 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:82
//		RAND	CHAN31
// slot 17491
                            if slot <> 17491 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:83
//		EXTEND
// slot 17492
                            if slot <> 17492 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17494 {
                        if slot <= 17493 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:84
//		BZF	-XTRANS
// slot 17493
                            if slot <> 17493 or instruction <> 5223 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5223, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:85
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:86
//		CA	ULLAGER
// slot 17494
                            if slot <> 17494 or instruction <> 14822 { return choose false if checkOnly else -1. }
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
                        if slot <= 17495 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:87
//		MASK	DAPBOOLS
// slot 17495
                            if slot <> 17495 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:88
//		CCS	A
// slot 17496
                            if slot <> 17496 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 17512 {
            if slot <= 17504 {
                if slot <= 17500 {
                    if slot <= 17498 {
                        if slot <= 17497 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:89
//		TCF	+X0RULGE
// slot 17497
                            if slot <> 17497 or instruction <> 5222 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5222, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:90
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:91
//		TS	NEXTU		# STORE NULL TRANSLATION POLICIES
// slot 17498
                            if slot <> 17498 or instruction <> 23355 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23355, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17499 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:92
//		TS	NEXTV
// slot 17499
                            if slot <> 17499 or instruction <> 23356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:93
//		CS	DAPBOOLS	# BURNING OR DRIFTING?
// slot 17500
                            if slot <> 17500 or instruction <> 16457 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 73).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17502 {
                        if slot <= 17501 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:94
//		MASK	DRIFTBIT
// slot 17501
                            if slot <> 17501 or instruction <> 31204 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                if fixedOperand = 128 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:95
//		EXTEND
// slot 17502
                            if slot <> 17502 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17503 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:96
//		BZF	TSENSE
// slot 17503
                            if slot <> 17503 or instruction <> 5220 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5220, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:97
//		CA	FLGWRD10	# DPS (INCLUDING DOCKED) OR APS?
// slot 17504
                            if slot <> 17504 or instruction <> 12358 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 70).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17508 {
                    if slot <= 17506 {
                        if slot <= 17505 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:98
//		MASK	APSFLBIT
// slot 17505
                            if slot <> 17505 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:99
//		CCS	A
// slot 17506
                            if slot <> 17506 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17507 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:100
//		CAF	TWO		# FAVOR +X JETS DURING AN APS BURN.
// slot 17507
                            if slot <> 17507 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:101
//TSENSE		TS	SENSETYP
// slot 17508
                            if slot <> 17508 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17510 {
                        if slot <= 17509 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:102
//		TCF	QRCONTRL
// slot 17509
                            if slot <> 17509 or instruction <> 5248 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5248, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:103
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:104
//+X0RULGE	CAF	ONE
// slot 17510
                            if slot <> 17510 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17511 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:105
//-XTRANS		AD	FOUR
// slot 17511
                            if slot <> 17511 or instruction <> 27113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:106
//		TS	ROTINDEX
// slot 17512
                            if slot <> 17512 or instruction <> 23524 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23524, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17520 {
                if slot <= 17516 {
                    if slot <= 17514 {
                        if slot <= 17513 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:107
//		AD	NEG3
// slot 17513
                            if slot <> 17513 or instruction <> 28645 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:108
//		TS	SENSETYP	# FAVOR APPROPRIATE JETS DURING TRANS.
// slot 17514
                            if slot <> 17514 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17515 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:109
//		CA	DAPBOOLS
// slot 17515
                            if slot <> 17515 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:110
//		MASK	ACC4OR2X
// slot 17516
                            if slot <> 17516 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
                    if slot <= 17518 {
                        if slot <= 17517 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:111
//		CCS	A
// slot 17517
                            if slot <> 17517 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:112
//		TCF	TRANS4
// slot 17518
                            if slot <> 17518 or instruction <> 5329 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5329, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17519 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:113
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:114
//		CA	DAPBOOLS
// slot 17519
                            if slot <> 17519 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:115
//		MASK	AORBTRAN
// slot 17520
                            if slot <> 17520 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
                    }
                }
            } else {
                if slot <= 17524 {
                    if slot <= 17522 {
                        if slot <= 17521 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:116
//		CCS	A
// slot 17521
                            if slot <> 17521 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:117
//		CA	ONE		# THREE FOR B
// slot 17522
                            if slot <> 17522 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17523 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:118
//		AD	TWO		# TWO FOR A SYSTEM 2 JET X TRANS
// slot 17523
                            if slot <> 17523 or instruction <> 27114 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:119
//TSNUMBRT	TS	NUMBERT
// slot 17524
                            if slot <> 17524 or instruction <> 23523 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23523, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17526 {
                        if slot <= 17525 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:120
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:121
//		TC	SELCTSUB
// slot 17525
                            if slot <> 17525 or instruction <> 1659 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1659, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:122
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:123
//		CCS	POLYTEMP
// slot 17526
                            if slot <> 17526 or instruction <> 5089 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 993).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17527 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:124
//		TCF	+3
// slot 17527
                            if slot <> 17527 or instruction <> 5242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5242, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:125
//		TC	ALARM
// slot 17528
                            if slot <> 17528 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1044] to agcAotUnit1044@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:126
//		OCT	02002
// slot 17529
    17529, 2052
)).

// bank 17, slots 17530-17546
function agcAotUnit1045 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17537 {
        if slot <= 17533 {
            if slot <= 17531 {
                if slot <= 17530 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:127
//		CA	00314OCT
// slot 17530
                    if slot <> 17530 or instruction <> 15356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3068), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:128
//		MASK	POLYTEMP
// slot 17531
                    if slot <> 17531 or instruction <> 29665 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 993).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17532 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:129
//TSNEXTS		TS	NEXTU
// slot 17532
                    if slot <> 17532 or instruction <> 23355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23355, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:130
//# Page 1444
// Q_R-AXIS_RCS_AUTOPILOT.agc:131
//		CS	00314OCT
// slot 17533
                    if slot <> 17533 or instruction <> 19452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3068), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17535 {
                if slot <= 17534 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:132
//		MASK	POLYTEMP
// slot 17534
                    if slot <> 17534 or instruction <> 29665 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 993).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:133
//		TS	NEXTV
// slot 17535
                    if slot <> 17535 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17536 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:134
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:135
//# Q,R-AXES RCS CONTROL MODE SELECTION
// Q_R-AXIS_RCS_AUTOPILOT.agc:136
//#	SWITCHES	INDICATION WHEN SET
// Q_R-AXIS_RCS_AUTOPILOT.agc:137
//#	BIT13/CHAN31	AUTO, GO TO ATTSTEER
// Q_R-AXIS_RCS_AUTOPILOT.agc:138
//#	PULSES		MINIMUM IMPULSE MODE
// Q_R-AXIS_RCS_AUTOPILOT.agc:139
//#	(OTHERWISE)	RATE COMMAND/ATTITUDE HOLD MODE
// Q_R-AXIS_RCS_AUTOPILOT.agc:140
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:141
//QRCONTRL	CA	BIT13		# CHECK MODE SELECT SWITCH.
// slot 17536
                    if slot <> 17536 or instruction <> 14815 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:142
//		EXTEND
// slot 17537
                    if slot <> 17537 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17541 {
            if slot <= 17539 {
                if slot <= 17538 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:143
//		RAND	CHAN31		# BITS INVERTED
// slot 17538
                    if slot <> 17538 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:144
//		CCS	A
// slot 17539
                    if slot <> 17539 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17540 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:145
//		TCF	ATTSTEER
// slot 17540
                    if slot <> 17540 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:146
//CHKBIT10	CAF	PULSES		# PULSES = 1 FOR MIN IMP USE OF RHC
// slot 17541
                    if slot <> 17541 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
            if slot <= 17543 {
                if slot <= 17542 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:147
//		MASK	DAPBOOLS
// slot 17542
                    if slot <> 17542 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:148
//		EXTEND
// slot 17543
                    if slot <> 17543 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17544 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:149
//		BZF	CHEKSTIK	# IN ATT-HOLD/RATE-COMMAND IF BIT10=0
// slot 17544
                    if slot <> 17544 or instruction <> 5331 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5331, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17545 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:150
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:151
//# MINIMUM IMPULSE MODE
// Q_R-AXIS_RCS_AUTOPILOT.agc:152
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:153
//		INHINT
// slot 17545
                        if slot <> 17545 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:154
//		TC	IBNKCALL
// slot 17546
                        if slot <> 17546 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1045] to agcAotUnit1045@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:155
//		CADR	ZATTEROR
// slot 17547
    17547, 32982
)).

// bank 17, slots 17548-17595
function agcAotUnit1046 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17571 {
        if slot <= 17559 {
            if slot <= 17553 {
                if slot <= 17550 {
                    if slot <= 17548 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:156
//		CA	ZERO
// slot 17548
                        if slot <> 17548 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17549 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:157
//		TS	QERROR
// slot 17549
                            if slot <> 17549 or instruction <> 23336 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23336, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:158
//		TS	RERROR		# FOR DISPLAYS
// slot 17550
                            if slot <> 17550 or instruction <> 23338 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23338, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17551 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:159
//		RELINT
// slot 17551
                        if slot <> 17551 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17552 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:160
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:161
//		EXTEND
// slot 17552
                            if slot <> 17552 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:162
//		READ	CHAN31
// slot 17553
                            if slot <> 17553 or instruction <> 25 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17556 {
                    if slot <= 17554 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:163
//		TS	TEMP31		# IS EQUAL TO DAPTEMP1
// slot 17554
                        if slot <> 17554 or instruction <> 23519 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23519, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17555 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:164
//		CCS	OLDQRMIN
// slot 17555
                            if slot <> 17555 or instruction <> 4913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 817).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:165
//		TCF	CHECKIN
// slot 17556
                            if slot <> 17556 or instruction <> 5286 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5286, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17557 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:166
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:167
//FIREQR		CA	TEMP31
// slot 17557
                        if slot <> 17557 or instruction <> 13279 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 991).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17558 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:168
//		MASK	BIT1
// slot 17558
                            if slot <> 17558 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:169
//		EXTEND
// slot 17559
                            if slot <> 17559 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 17565 {
                if slot <= 17562 {
                    if slot <= 17560 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:170
//		BZF	+QMIN
// slot 17560
                        if slot <> 17560 or instruction <> 5290 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17561 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:171
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:172
//		CA	TEMP31
// slot 17561
                            if slot <> 17561 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:173
//		MASK	BIT2
// slot 17562
                            if slot <> 17562 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
                        }
                    }
                } else {
                    if slot <= 17563 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:174
//		EXTEND
// slot 17563
                        if slot <> 17563 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17564 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:175
//		BZF	-QMIN
// slot 17564
                            if slot <> 17564 or instruction <> 5294 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:176
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:177
//		CA	TEMP31
// slot 17565
                            if slot <> 17565 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17568 {
                    if slot <= 17566 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:178
//		MASK	BIT5
// slot 17566
                        if slot <> 17566 or instruction <> 31207 { return choose false if checkOnly else -1. }
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
                        if slot <= 17567 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:179
//# Page 1445
// Q_R-AXIS_RCS_AUTOPILOT.agc:180
//		EXTEND
// slot 17567
                            if slot <> 17567 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:181
//		BZF	+RMIN
// slot 17568
                            if slot <> 17568 or instruction <> 5298 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5298, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17569 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:182
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:183
//		CA	TEMP31
// slot 17569
                        if slot <> 17569 or instruction <> 13279 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 991).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17570 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:184
//		MASK	BIT6
// slot 17570
                            if slot <> 17570 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:185
//		EXTEND
// slot 17571
                            if slot <> 17571 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 17583 {
            if slot <= 17577 {
                if slot <= 17574 {
                    if slot <= 17572 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:186
//		BZF	-RMIN
// slot 17572
                        if slot <> 17572 or instruction <> 5300 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5300, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17573 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:187
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:188
//		TCF	XTRANS
// slot 17573
                            if slot <> 17573 or instruction <> 5683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:189
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:190
//CHECKIN		CS	TEMP31
// slot 17574
                            if slot <> 17574 or instruction <> 17375 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 991).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17575 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:191
//		MASK	OCT63
// slot 17575
                        if slot <> 17575 or instruction <> 29904 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1232), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17576 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:192
//		TS	OLDQRMIN
// slot 17576
                            if slot <> 17576 or instruction <> 23345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:193
//		TCF	XTRANS
// slot 17577
                            if slot <> 17577 or instruction <> 5683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17580 {
                    if slot <= 17578 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:194
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:195
//+QMIN		CA	14MS
// slot 17578
                        if slot <> 17578 or instruction <> 13895 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17579 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:196
//		TS	TJU
// slot 17579
                            if slot <> 17579 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:197
//		CS	14MS
// slot 17580
                            if slot <> 17580 or instruction <> 17991 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17581 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:198
//		TCF	MINQR
// slot 17581
                        if slot <> 17581 or instruction <> 5302 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5302, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17582 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:199
//-QMIN		CS	14MS
// slot 17582
                            if slot <> 17582 or instruction <> 17991 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:200
//		TS	TJU
// slot 17583
                            if slot <> 17583 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17589 {
                if slot <= 17586 {
                    if slot <= 17584 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:201
//		CA	14MS
// slot 17584
                        if slot <> 17584 or instruction <> 13895 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17585 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:202
//		TCF	MINQR
// slot 17585
                            if slot <> 17585 or instruction <> 5302 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5302, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:203
//+RMIN		CA	14MS
// slot 17586
                            if slot <> 17586 or instruction <> 13895 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17587 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:204
//		TCF	+2
// slot 17587
                        if slot <> 17587 or instruction <> 5301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5301, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17588 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:205
//-RMIN		CS	14MS
// slot 17588
                            if slot <> 17588 or instruction <> 17991 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:206
//		TS	TJU
// slot 17589
                            if slot <> 17589 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17592 {
                    if slot <= 17590 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:207
//MINQR		TS	TJV
// slot 17590
                        if slot <> 17590 or instruction <> 23382 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23382, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17591 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:208
//		CA	MINADR
// slot 17591
                            if slot <> 17591 or instruction <> 13519 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1231), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:209
//		TS	RETJADR
// slot 17592
                            if slot <> 17592 or instruction <> 23359 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23359, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17593 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:210
//		CA	ONE
// slot 17593
                        if slot <> 17593 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17594 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:211
//		TS	OLDQRMIN
// slot 17594
                            if slot <> 17594 or instruction <> 23345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:212
//MINRTN		TS	AXISCTR
// slot 17595
                            if slot <> 17595 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1046] to agcAotUnit1046@.

// bank 17, slots 17596-17600
function agcAotUnit1047 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17597 {
        if slot <= 17596 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:213
//		CA	DAPBOOLS
// slot 17596
            if slot <> 17596 or instruction <> 12361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 73).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:214
//		MASK	CSMDOCKD
// slot 17597
            if slot <> 17597 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
        if slot <= 17598 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:215
//		EXTEND
// slot 17598
            if slot <> 17598 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17599 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:216
//		BZF	MIMRET
// slot 17599
                if slot <> 17599 or instruction <> 5319 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:217
//		INDEX	AXISCTR		# IF DOCKED, USE 60MS MINIMUM IMPULSE
// slot 17600
                if slot <> 17600 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1047] to agcAotUnit1047@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:218
//		CCS	TJU
// slot 17601
    17601, 9898
)).

// bank 17, slots 17602-17605
function agcAotUnit1048 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17603 {
        if slot <= 17602 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:219
//		CA	60MS
// slot 17602
            if slot <> 17602 or instruction <> 13518 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1230), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:220
//		TCF	+2
// slot 17603
            if slot <> 17603 or instruction <> 5317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17604 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:221
//		CS	60MS
// slot 17604
            if slot <> 17604 or instruction <> 17614 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1230), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:222
//		INDEX	AXISCTR
// slot 17605
            if slot <> 17605 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1048] to agcAotUnit1048@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:223
//		TS	TJU
// slot 17606
    17606, 46762
)).

// bank 17, slots 17607-17613
function agcAotUnit1049 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17609 {
        if slot <= 17607 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:224
//MIMRET		CA	DAPBOOLS
// slot 17607
            if slot <> 17607 or instruction <> 12361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 73).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17608 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:225
//		MASK	AORBTRAN
// slot 17608
                if slot <> 17608 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:226
//		CCS	A
// slot 17609
                if slot <> 17609 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 17611 {
            if slot <= 17610 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:227
//		CA	ONE
// slot 17610
                if slot <> 17610 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:228
//		AD	TWO
// slot 17611
                if slot <> 17611 or instruction <> 27114 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17612 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:229
//		TS	NUMBERT
// slot 17612
                if slot <> 17612 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:230
//# Page 1446
// Q_R-AXIS_RCS_AUTOPILOT.agc:231
//		TCF	AFTERTJ
// slot 17613
                if slot <> 17613 or instruction <> 5591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5591, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1049] to agcAotUnit1049@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:232
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:233
//60MS		DEC	96		# RSB 2009 -- was 96.0.
// slot 17614
    17614, 192,
// Q_R-AXIS_RCS_AUTOPILOT.agc:234
//MINADR		GENADR	MINRTN
// slot 17615
    17615, 2422,
// Q_R-AXIS_RCS_AUTOPILOT.agc:235
//OCT63		OCT	63
// slot 17616
    17616, 102
)).

// bank 17, slots 17617-17633
function agcAotUnit1050 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17624 {
        if slot <= 17620 {
            if slot <= 17618 {
                if slot <= 17617 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:236
//14MS		=	+TJMINT6
// Q_R-AXIS_RCS_AUTOPILOT.agc:237
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:238
//TRANS4		CA	FOUR
// slot 17617
                    if slot <> 17617 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:239
//		TCF	TSNUMBRT
// slot 17618
                    if slot <> 17618 or instruction <> 5236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5236, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17619 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:240
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:241
//# RATE COMMAND MODE:
// Q_R-AXIS_RCS_AUTOPILOT.agc:242
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:243
//# DESCRIPTION (SAME AS P-AXIS)
// Q_R-AXIS_RCS_AUTOPILOT.agc:244
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:245
//CHEKSTIK	TS	INGTS		# NOT IN GTS WHEN IN ATT HOLD
// slot 17619
                    if slot <> 17619 or instruction <> 23451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23451, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:246
//		CS	ONE		# 1/ACCS WILL DO THE NULLING DRIVES
// slot 17620
                    if slot <> 17620 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17622 {
                if slot <= 17621 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:247
//		TS	COTROLER	# COME BACK TO RCS NEXT TIME
// slot 17621
                    if slot <> 17621 or instruction <> 23449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:248
//		CA	BIT15
// slot 17622
                    if slot <> 17622 or instruction <> 14813 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17623 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:249
//		MASK	CH31TEMP
// slot 17623
                    if slot <> 17623 or instruction <> 29475 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 803).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:250
//		EXTEND
// slot 17624
                    if slot <> 17624 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17628 {
            if slot <= 17626 {
                if slot <= 17625 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:251
//		BZF	RHCACTIV	# BRANCH IF OUT OF DETENT.
// slot 17625
                    if slot <> 17625 or instruction <> 5352 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5352, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:252
//		CA	OURRCBIT	# ***********
// slot 17626
                    if slot <> 17626 or instruction <> 14816 { return choose false if checkOnly else -1. }
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
                if slot <= 17627 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:253
//		MASK	DAPBOOLS	# *IN DETENT*	CHECK FOR MANUAL CONTROL
// slot 17627
                    if slot <> 17627 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:254
//		EXTEND			# ***********	LAST TIME.
// slot 17628
                    if slot <> 17628 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17630 {
                if slot <= 17629 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:255
//		BZF	STILLRCS
// slot 17629
                    if slot <> 17629 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:256
//		CS	BIT9
// slot 17630
                    if slot <> 17630 or instruction <> 18915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17631 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:257
//		MASK	RCSFLAGS
// slot 17631
                    if slot <> 17631 or instruction <> 29371 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 699).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17632 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:258
//		TS	RCSFLAGS	# BIT 9 IS 0.
// slot 17632
                        if slot <> 17632 or instruction <> 23227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:259
//		TCF	DAMPING
// slot 17633
                        if slot <> 17633 or instruction <> 5349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1050] to agcAotUnit1050@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:260
//40CYCL		OCT	50
// slot 17634
    17634, 80,
// Q_R-AXIS_RCS_AUTOPILOT.agc:261
//1/10S		OCT	1
// slot 17635
    17635, 2,
// Q_R-AXIS_RCS_AUTOPILOT.agc:262
//LINRAT		DEC	46
// slot 17636
    17636, 92
)).

// bank 17, slots 17637-17706
function agcAotUnit1051 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17671 {
        if slot <= 17653 {
            if slot <= 17644 {
                if slot <= 17640 {
                    if slot <= 17638 {
                        if slot <= 17637 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:263
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:264
//# ===========================================================
// Q_R-AXIS_RCS_AUTOPILOT.agc:265
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:266
//DAMPING		CA	ZERO
// slot 17637
                            if slot <> 17637 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:267
//		TS	SAVEHAND
// slot 17638
                            if slot <> 17638 or instruction <> 23346 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23346, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17639 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:268
//		TS	SAVEHAND +1
// slot 17639
                            if slot <> 17639 or instruction <> 23347 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23347, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:269
//RHCACTIV	CCS	SAVEHAND	# ******************
// slot 17640
                            if slot <> 17640 or instruction <> 4914 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 818).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17642 {
                        if slot <= 17641 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:270
//		TCF	+3		# Q,R MANUAL CONTROL	WC = A*(B+|D|)*D
// slot 17641
                            if slot <> 17641 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:271
//		TCF	+2		# ******************
// slot 17642
                            if slot <> 17642 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17643 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:272
//		TCF	+1
// slot 17643
                            if slot <> 17643 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:273
//		DOUBLE			# WHERE
// slot 17644
                            if slot <> 17644 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17648 {
                    if slot <= 17646 {
                        if slot <= 17645 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:274
//		DOUBLE			#
// slot 17645
                            if slot <> 17645 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:275
//		AD	LINRAT		# 	WC  = COMMANDED ROTATIONAL RATE
// slot 17646
                            if slot <> 17646 or instruction <> 25828 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1252), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17647 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:276
//		EXTEND			#	A   = QUADRATIC SENSITIVITY FACTOR
// slot 17647
                            if slot <> 17647 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:277
//		MP	SAVEHAND	#	B   = LINEAR/QUADRATIC SENSITIVITY
// slot 17648
                            if slot <> 17648 or instruction <> 29490 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 818, readEffective:call(words, 818)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17650 {
                        if slot <= 17649 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:278
//		CA	L		#	|D| = ABS. VALUE OF DEFLECTION
// slot 17649
                            if slot <> 17649 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:279
//		EXTEND			#	D   = HAND CONTROLLER DEFLECTION
// slot 17650
                            if slot <> 17650 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17651 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:280
//		MP	STIKSENS
// slot 17651
                            if slot <> 17651 or instruction <> 29476 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 804, readEffective:call(words, 804)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17652 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:281
//		XCH	QLAST		# COMMAND Q RATE, SCALED 45 DEG/SEC
// slot 17652
                                if slot <> 17652 or instruction <> 24365 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 813, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:282
//		COM
// slot 17653
                                if slot <> 17653 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 17662 {
                if slot <= 17657 {
                    if slot <= 17655 {
                        if slot <= 17654 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:283
//# Page 1447
// Q_R-AXIS_RCS_AUTOPILOT.agc:284
//		AD	QLAST
// slot 17654
                            if slot <> 17654 or instruction <> 25389 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 813).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:285
//		TS	DAPTEMP3
// slot 17655
                            if slot <> 17655 or instruction <> 23521 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23521, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17656 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:286
//		CCS	SAVEHAND +1
// slot 17656
                            if slot <> 17656 or instruction <> 4915 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 819).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:287
//		TCF	+3
// slot 17657
                            if slot <> 17657 or instruction <> 5372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17659 {
                        if slot <= 17658 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:288
//		TCF	+2
// slot 17658
                            if slot <> 17658 or instruction <> 5372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:289
//		TCF	+1
// slot 17659
                            if slot <> 17659 or instruction <> 5372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17660 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:290
//		DOUBLE
// slot 17660
                            if slot <> 17660 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17661 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:291
//		DOUBLE
// slot 17661
                                if slot <> 17661 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:292
//		AD	LINRAT
// slot 17662
                                if slot <> 17662 or instruction <> 25828 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1252), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17666 {
                    if slot <= 17664 {
                        if slot <= 17663 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:293
//		EXTEND
// slot 17663
                            if slot <> 17663 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:294
//		MP	SAVEHAND +1
// slot 17664
                            if slot <> 17664 or instruction <> 29491 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 819, readEffective:call(words, 819)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17665 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:295
//		CA	L
// slot 17665
                            if slot <> 17665 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:296
//		EXTEND
// slot 17666
                            if slot <> 17666 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17668 {
                        if slot <= 17667 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:297
//		MP	STIKSENS
// slot 17667
                            if slot <> 17667 or instruction <> 29476 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 804, readEffective:call(words, 804)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:298
//		XCH	RLAST
// slot 17668
                            if slot <> 17668 or instruction <> 24366 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 814, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17669 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:299
//		COM
// slot 17669
                            if slot <> 17669 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17670 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:300
//		AD	RLAST
// slot 17670
                                if slot <> 17670 or instruction <> 25390 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 814).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:301
//		TS	DAPTEMP4
// slot 17671
                                if slot <> 17671 or instruction <> 23522 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23522, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17688 {
            if slot <= 17679 {
                if slot <= 17675 {
                    if slot <= 17673 {
                        if slot <= 17672 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:302
//		CS	QLAST		# INTERVAL.
// slot 17672
                            if slot <> 17672 or instruction <> 17197 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 813).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:303
//		AD	OMEGAQ
// slot 17673
                            if slot <> 17673 or instruction <> 25362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 786).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17674 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:304
//		TS	QRATEDIF
// slot 17674
                            if slot <> 17674 or instruction <> 23326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:305
//		CS	RLAST
// slot 17675
                            if slot <> 17675 or instruction <> 17198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 814).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17677 {
                        if slot <= 17676 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:306
//		AD	OMEGAR
// slot 17676
                            if slot <> 17676 or instruction <> 25363 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 787).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:307
//		TS	RRATEDIF
// slot 17677
                            if slot <> 17677 or instruction <> 23327 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23327, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17678 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:308
//ENTERQR		DXCH	QRATEDIF	# TRANSFORM RATES FROM Q,R TO U,V AXES
// slot 17678
                            if slot <> 17678 or instruction <> 22303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 799, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:309
//		TC	ROT-TOUV
// slot 17679
                            if slot <> 17679 or instruction <> 1638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17683 {
                    if slot <= 17681 {
                        if slot <= 17680 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:310
//		DXCH	URATEDIF
// slot 17680
                            if slot <> 17680 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:311
//		CCS	DAPTEMP3	# CHECK IF Q COMMAND CHANGE EXCEEDS
// slot 17681
                            if slot <> 17681 or instruction <> 5089 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 993).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17682 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:312
//		TC	+3		# BREAKOUT LEVEL.  IF NOT, CHECK R.
// slot 17682
                            if slot <> 17682 or instruction <> 1301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1301, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:313
//		TC	+2
// slot 17683
                            if slot <> 17683 or instruction <> 1301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1301, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17685 {
                        if slot <= 17684 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:314
//		TC	+1
// slot 17684
                            if slot <> 17684 or instruction <> 1301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1301, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:315
//		AD	-RATEDB
// slot 17685
                            if slot <> 17685 or instruction <> 25406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 830).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17686 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:316
//		EXTEND
// slot 17686
                            if slot <> 17686 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17687 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:317
//		BZMF	+2
// slot 17687
                                if slot <> 17687 or instruction <> 25881 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25881, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:318
//		TCF	ENTERUV -2	# BREAKOUT LEVEL EXCEEDED.  DIRECT RATE.
// slot 17688
                                if slot <> 17688 or instruction <> 5415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 17697 {
                if slot <= 17692 {
                    if slot <= 17690 {
                        if slot <= 17689 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:319
//		CCS	DAPTEMP4	# R COMMAND BREAKOUT CHECK.
// slot 17689
                            if slot <> 17689 or instruction <> 5090 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:320
//		TC	+3
// slot 17690
                            if slot <> 17690 or instruction <> 1309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17691 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:321
//		TC	+2
// slot 17691
                            if slot <> 17691 or instruction <> 1309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:322
//		TC	+1
// slot 17692
                            if slot <> 17692 or instruction <> 1309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17694 {
                        if slot <= 17693 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:323
//		AD	-RATEDB
// slot 17693
                            if slot <> 17693 or instruction <> 25406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 830).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:324
//		EXTEND
// slot 17694
                            if slot <> 17694 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17695 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:325
//		BZMF	+2
// slot 17695
                            if slot <> 17695 or instruction <> 25889 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25889, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17696 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:326
//		TCF	ENTERUV -2	# BREAKOUT LEVEL EXCEEDED.  DIRECT RATE.
// slot 17696
                                if slot <> 17696 or instruction <> 5415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:327
//		CA	RCSFLAGS	# BREAKOUT LEVEL NOT EXCEEDED.  CHECK FOR
// slot 17697
                                if slot <> 17697 or instruction <> 12987 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17701 {
                    if slot <= 17699 {
                        if slot <= 17698 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:328
//		MASK	QRBIT		# DIRECT RATE CONTROL LAST TIME.
// slot 17698
                            if slot <> 17698 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:329
//		EXTEND
// slot 17699
                            if slot <> 17699 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17700 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:330
//		BZF	+2
// slot 17700
                            if slot <> 17700 or instruction <> 5414 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5414, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:331
//		TCF	ENTERUV		# CONTINUE DIRECT RATE CONTROL.
// slot 17701
                            if slot <> 17701 or instruction <> 5417 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5417, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17703 {
                        if slot <= 17702 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:332
//		TCF	STILLRCS	# PSEUDO-AUTO CONTROL.
// slot 17702
                            if slot <> 17702 or instruction <> 5553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5553, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:333
//		CA	40CYCL
// slot 17703
                            if slot <> 17703 or instruction <> 13538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1250), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17704 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:334
//# Page 1448
// Q_R-AXIS_RCS_AUTOPILOT.agc:335
//		TS	TCQR
// slot 17704
                            if slot <> 17704 or instruction <> 23343 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23343, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17705 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:336
//ENTERUV		INHINT			# DIRECT RATE CONTROL
// slot 17705
                                if slot <> 17705 or instruction <> 4 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:337
//		TC	IBNKCALL
// slot 17706
                                if slot <> 17706 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1051] to agcAotUnit1051@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:338
//		FCADR	ZATTEROR
// slot 17707
    17707, 32982
)).

// bank 17, slots 17708-17732
function agcAotUnit1052 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17719 {
        if slot <= 17713 {
            if slot <= 17710 {
                if slot <= 17708 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:339
//		RELINT
// slot 17708
                    if slot <> 17708 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17709 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:340
//		CA	ZERO
// slot 17709
                        if slot <> 17709 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:341
//		TS	DYERROR
// slot 17710
                        if slot <> 17710 or instruction <> 23336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23336, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17711 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:342
//		TS	DYERROR +1
// slot 17711
                    if slot <> 17711 or instruction <> 23337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17712 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:343
//		TS	DZERROR
// slot 17712
                        if slot <> 17712 or instruction <> 23338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:344
//		TS	DZERROR +1
// slot 17713
                        if slot <> 17713 or instruction <> 23339 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23339, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17716 {
                if slot <= 17714 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:345
//		CCS	URATEDIF
// slot 17714
                    if slot <> 17714 or instruction <> 4886 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 790).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17715 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:346
//		TCF	+3
// slot 17715
                        if slot <> 17715 or instruction <> 5430 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5430, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:347
//		TCF	+2
// slot 17716
                        if slot <> 17716 or instruction <> 5430 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5430, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17717 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:348
//		TCF	+1
// slot 17717
                    if slot <> 17717 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17718 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:349
//		AD	TARGETDB	# IF TARGET DB IS EXCEEDED, CONTINUE
// slot 17718
                        if slot <> 17718 or instruction <> 25406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 830).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:350
//		EXTEND			# DIRECT RATE CONTROL.
// slot 17719
                        if slot <> 17719 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 17725 {
            if slot <= 17722 {
                if slot <= 17720 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:351
//		BZMF	VDB
// slot 17720
                    if slot <> 17720 or instruction <> 25924 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25924, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17721 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:352
//		CCS	VRATEDIF
// slot 17721
                        if slot <> 17721 or instruction <> 4887 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:353
//		TCF	+3
// slot 17722
                        if slot <> 17722 or instruction <> 5437 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5437, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17723 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:354
//		TCF	+2
// slot 17723
                    if slot <> 17723 or instruction <> 5437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5437, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17724 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:355
//		TCF	+1
// slot 17724
                        if slot <> 17724 or instruction <> 5437 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5437, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:356
//		AD	TARGETDB
// slot 17725
                        if slot <> 17725 or instruction <> 25406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 830).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17728 {
                if slot <= 17726 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:357
//		EXTEND
// slot 17726
                    if slot <> 17726 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17727 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:358
//		BZMF	+2
// slot 17727
                        if slot <> 17727 or instruction <> 25921 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25921, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:359
//		TCF	QRTIME
// slot 17728
                        if slot <> 17728 or instruction <> 5453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5453, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17730 {
                    if slot <= 17729 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:360
//		CA	ZERO
// slot 17729
                        if slot <> 17729 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:361
//		TS	VRATEDIF
// slot 17730
                        if slot <> 17730 or instruction <> 23319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17731 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:362
//		TCF	QRTIME
// slot 17731
                        if slot <> 17731 or instruction <> 5453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5453, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:363
//VDB		CCS	VRATEDIF
// slot 17732
                        if slot <> 17732 or instruction <> 4887 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1052] to agcAotUnit1052@.

// bank 17, slots 17733-17757
function agcAotUnit1053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17744 {
        if slot <= 17738 {
            if slot <= 17735 {
                if slot <= 17733 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:364
//		TC	+3
// slot 17733
                    if slot <> 17733 or instruction <> 1352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1352, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17734 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:365
//		TC	+2
// slot 17734
                        if slot <> 17734 or instruction <> 1352 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1352, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:366
//		TC	+1
// slot 17735
                        if slot <> 17735 or instruction <> 1352 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1352, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17736 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:367
//		AD	TARGETDB	# IF TARGET DB IS EXCEEDED, CONTINUE
// slot 17736
                    if slot <> 17736 or instruction <> 25406 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 830).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17737 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:368
//		EXTEND			# DIRECT RATE CONTROL.  IF NOT, FIRE AND
// slot 17737
                        if slot <> 17737 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:369
//		BZMF	TOPSEUDO	# SWITCH TO PSEUDO-AUTO CONTROL ON NEXT
// slot 17738
                        if slot <> 17738 or instruction <> 25940 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25940, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17741 {
                if slot <= 17739 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:370
//		CA	ZERO		# PASS.
// slot 17739
                    if slot <> 17739 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17740 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:371
//		TS	URATEDIF
// slot 17740
                        if slot <> 17740 or instruction <> 23318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23318, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:372
//QRTIME		CA	TCQR		# DIRECT RATE TIME CHECK.
// slot 17741
                        if slot <> 17741 or instruction <> 13103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 815).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17742 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:373
//		EXTEND
// slot 17742
                    if slot <> 17742 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17743 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:374
//		BZMF	+5		# BRANCH IF TIME EXCEEDS 4 SEC.
// slot 17743
                        if slot <> 17743 or instruction <> 25940 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25940, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:375
//		CS	RCSFLAGS
// slot 17744
                        if slot <> 17744 or instruction <> 17083 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 699).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17750 {
            if slot <= 17747 {
                if slot <= 17745 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:376
//		MASK	QRBIT
// slot 17745
                    if slot <> 17745 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
                    if slot <= 17746 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:377
//		ADS	RCSFLAGS	# BIT 11 IS 1.
// slot 17746
                        if slot <> 17746 or instruction <> 11963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:378
//		TC	+4
// slot 17747
                        if slot <> 17747 or instruction <> 1367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1367, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17748 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:379
//TOPSEUDO	CS	QRBIT
// slot 17748
                    if slot <> 17748 or instruction <> 18913 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17749 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:380
//		MASK	RCSFLAGS
// slot 17749
                        if slot <> 17749 or instruction <> 29371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:381
//		TS	RCSFLAGS	# BIT 11 IS 0.
// slot 17750
                        if slot <> 17750 or instruction <> 23227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17753 {
                if slot <= 17751 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:382
//		CA	HANDADR
// slot 17751
                    if slot <> 17751 or instruction <> 13691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1403), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17752 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:383
//		TS	RETJADR
// slot 17752
                        if slot <> 17752 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:384
//		CA	ONE
// slot 17753
                        if slot <> 17753 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                if slot <= 17755 {
                    if slot <= 17754 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:385
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:386
//# Page 1449
// Q_R-AXIS_RCS_AUTOPILOT.agc:387
//BACKHAND	TS	AXISCTR
// slot 17754
                        if slot <> 17754 or instruction <> 23365 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23365, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:388
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:389
//		CA	FOUR
// slot 17755
                        if slot <> 17755 or instruction <> 14825 { return choose false if checkOnly else -1. }
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
                    if slot <= 17756 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:390
//		TS	NUMBERT
// slot 17756
                        if slot <> 17756 or instruction <> 23523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23523, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:391
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:392
//		INDEX	AXISCTR
// slot 17757
                        if slot <> 17757 or instruction <> 21317 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21317, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21317, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1053] to agcAotUnit1053@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:393
//		INDEX	SKIPU
// slot 17758
    17758, 42682,
// Q_R-AXIS_RCS_AUTOPILOT.agc:394
//		TCF	+1
// slot 17759
    17759, 10944
)).

// bank 17, slots 17760-17761
function agcAotUnit1054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17760 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:395
//		CA	FOUR
// slot 17760
        if slot <> 17760 or instruction <> 14825 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:396
//		INDEX	AXISCTR
// slot 17761
        if slot <> 17761 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1054] to agcAotUnit1054@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:397
//		TS	SKIPU
// slot 17762
    17762, 46778
)).

// bank 17, slots 17763-17764
function agcAotUnit1055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17763 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:398
//		TCF	LOOPER
// slot 17763
        if slot <> 17763 or instruction <> 5637 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5637, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:399
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:400
//		INDEX	AXISCTR
// slot 17764
        if slot <> 17764 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1055] to agcAotUnit1055@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:401
//		CCS	URATEDIF	#	INDEX	AXIS	QUANTITY
// slot 17765
    17765, 9772
)).

// bank 17, slots 17766-17769
function agcAotUnit1056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17767 {
        if slot <= 17766 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:402
//		CA	ZERO		#	0	-U	1/JETACC-AOSU
// slot 17766
            if slot <> 17766 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:403
//		TCF	+2		#	1	+U	1/JETACC+AOSU
// slot 17767
            if slot <> 17767 or instruction <> 5481 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5481, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17768 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:404
//		CA	ONE		#	16	-V	1/JETACC-AOSV
// slot 17768
            if slot <> 17768 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:405
//		INDEX	AXISCTR		#	17	+V	1/JETACC+AOSV
// slot 17769
            if slot <> 17769 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1056] to agcAotUnit1056@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:406
//		AD	AXISDIFF	# JETACC = 2 JET ACCELERATION (1 FOR FAIL)
// slot 17770
    17770, 53156
)).

// bank 17, slots 17771-17771
function agcAotUnit1057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:407
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:408
//		INDEX	A
// slot 17771
    if slot <> 17771 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1057] to agcAotUnit1057@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:409
//		CS	1/ANET2 +1
// slot 17772
    17772, 34546
)).

// bank 17, slots 17773-17774
function agcAotUnit1058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17773 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:410
//		EXTEND
// slot 17773
        if slot <> 17773 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:411
//		INDEX	AXISCTR		# UPRATEDIF IS SCALED AT PI/4 RAD/SEC
// slot 17774
        if slot <> 17774 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1058] to agcAotUnit1058@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:412
//		MP	URATEDIF	# JET TIME IN A, SCALED 32 SEC
// slot 17775
    17775, 58924
)).

// bank 17, slots 17776-17782
function agcAotUnit1059 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17778 {
        if slot <= 17776 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:413
//		TS	Q
// slot 17776
            if slot <> 17776 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17777 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:414
//		DAS	A
// slot 17777
                if slot <> 17777 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:415
//		AD	Q
// slot 17778
                if slot <> 17778 or instruction <> 24578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17780 {
            if slot <= 17779 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:416
//		TS	A		# OVERFLOW SKIP
// slot 17779
                if slot <> 17779 or instruction <> 22528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:417
//		TCF	+2
// slot 17780
                if slot <> 17780 or instruction <> 5494 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5494, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17781 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:418
//		CA	Q		# RIGHT SIGN AND BIGGER THAN 150MS
// slot 17781
                if slot <> 17781 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:419
//SETTIME		INDEX	AXISCTR
// slot 17782
                if slot <> 17782 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1059] to agcAotUnit1059@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:420
//		TS	TJU		# SCALED AT 10.67 WHICH IS CLOSE TO 10.24
// slot 17783
    17783, 46762
)).

// bank 17, slots 17784-17786
function agcAotUnit1060 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17784 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:421
//		TCF	AFTERTJ
// slot 17784
        if slot <> 17784 or instruction <> 5591 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5591, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17785 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:422
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:423
//ZEROTJ		CA	ZERO
// slot 17785
            if slot <> 17785 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:424
//		TCF	SETTIME
// slot 17786
            if slot <> 17786 or instruction <> 5494 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5494, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1060] to agcAotUnit1060@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:425
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:426
//HANDADR		GENADR	BACKHAND
// slot 17787
    17787, 2740
)).

// bank 17, slots 17788-17806
function agcAotUnit1061 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17796 {
        if slot <= 17791 {
            if slot <= 17789 {
                if slot <= 17788 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:427
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:428
//# GTS WILL BE TRIED IF
// Q_R-AXIS_RCS_AUTOPILOT.agc:429
//#	1. USEQRJTS = 0,
// Q_R-AXIS_RCS_AUTOPILOT.agc:430
//#	2. ALLOWGTS POS,
// Q_R-AXIS_RCS_AUTOPILOT.agc:431
//#	3. JETS ARE OFF (Q,R-AXES)
// Q_R-AXIS_RCS_AUTOPILOT.agc:432
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:433
//TRYGTS		CAF	USEQRJTS	# IS JET USE MANDATORY.		(AS LONG AS
// slot 17788
                    if slot <> 17788 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:434
//		MASK	DAPBOOLS	# USEQRJTS BIT IS NOT BIT 15, CCS IS SAFE.)
// slot 17789
                    if slot <> 17789 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17790 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:435
//		CCS	A
// slot 17790
                    if slot <> 17790 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:436
//		TCF	RCS
// slot 17791
                    if slot <> 17791 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17793 {
                if slot <= 17792 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:437
//		CCS	ALLOWGTS	# NO.  DOES AOSTASK OK CONTROL FOR GTS?
// slot 17792
                    if slot <> 17792 or instruction <> 4930 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 834).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:438
//# Page 1450
// Q_R-AXIS_RCS_AUTOPILOT.agc:439
//		TCF	+2
// slot 17793
                    if slot <> 17793 or instruction <> 5507 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5507, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17794 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:440
//		TCF	RCS
// slot 17794
                    if slot <> 17794 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17795 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:441
//		EXTEND
// slot 17795
                        if slot <> 17795 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:442
//		READ	CHAN5
// slot 17796
                        if slot <> 17796 or instruction <> 5 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 0, 5, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17801 {
            if slot <= 17798 {
                if slot <= 17797 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:443
//		CCS	A
// slot 17797
                    if slot <> 17797 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:444
//		TCF	CHKINGTS
// slot 17798
                    if slot <> 17798 or instruction <> 5514 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5514, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17799 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:445
//GOTOGTS		EXTEND
// slot 17799
                    if slot <> 17799 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17800 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:446
//		DCA	GTSCADR
// slot 17800
                        if slot <> 17800 or instruction <> 13717 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1429, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:447
//		DTCB
// slot 17801
                        if slot <> 17801 or instruction <> 21510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17803 {
                if slot <= 17802 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:448
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:449
//CHKINGTS	CCS	INGTS		# WAS THE TRIM GIMBAL CONTROLLING
// slot 17802
                    if slot <> 17802 or instruction <> 5019 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 923).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:450
//		TCF	+2		#	YES.  SET UP A DAMPED NULLING DRIVE.
// slot 17803
                    if slot <> 17803 or instruction <> 5517 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5517, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17804 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:451
//		TCF	RCS		#	NO.  NULLING WAS SET UP BEFORE.  DO RCS.
// slot 17804
                    if slot <> 17804 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17805 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:452
//		INHINT
// slot 17805
                        if slot <> 17805 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:453
//		TC	IBNKCALL
// slot 17806
                        if slot <> 17806 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1061] to agcAotUnit1061@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:454
//		CADR	TIMEGMBL
// slot 17807
    17807, 36272
)).

// bank 17, slots 17808-17811
function agcAotUnit1062 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17809 {
        if slot <= 17808 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:455
//		RELINT
// slot 17808
            if slot <> 17808 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:456
//		CAF	ZERO
// slot 17809
            if slot <> 17809 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
        if slot <= 17810 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:457
//		TS	INGTS
// slot 17810
            if slot <> 17810 or instruction <> 23451 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23451, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:458
//		TCF	RCS
// slot 17811
            if slot <> 17811 or instruction <> 5191 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5191, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1062] to agcAotUnit1062@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:459
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:460
//		EBANK=	CDUXD
// Q_R-AXIS_RCS_AUTOPILOT.agc:461
//GTSCADR		2CADR	GTS
// slot 17812 17813
    17812, 3198, 17813, 34956
)).

// bank 17, slots 17814-17850
function agcAotUnit1063 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17831 {
        if slot <= 17822 {
            if slot <= 17817 {
                if slot <= 17815 {
                    if slot <= 17814 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:462
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:463
//# Page 1451
// Q_R-AXIS_RCS_AUTOPILOT.agc:464
//# SUBROUTINE TO COMPUTE Q,R-AXES ATTITUDE ERRORS FOR USE IN THE RCS AND GTS CONTROL LAWS AND THE DISPLAYS.
// Q_R-AXIS_RCS_AUTOPILOT.agc:465
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:466
//QERRCALC	CAE	CDUY		# Q-ERROR CALCULATION
// slot 17814
                        if slot <> 17814 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:467
//		EXTEND
// slot 17815
                        if slot <> 17815 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17816 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:468
//		MSU	CDUYD		# CDU ANGLE -- ANGLE DESIRED (Y-AXIS)
// slot 17816
                        if slot <> 17816 or instruction <> 9118 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:469
//		TS	DAPTEMP1	# SAVE FOR RERRCALC
// slot 17817
                        if slot <> 17817 or instruction <> 23519 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23519, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17819 {
                    if slot <= 17818 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:470
//		EXTEND
// slot 17818
                        if slot <> 17818 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:471
//		MP	M21		# (CDUY-CDUYD)*M21 SCALED AT PI RADIANS
// slot 17819
                        if slot <> 17819 or instruction <> 29453 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 781, readEffective:call(words, 781)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17820 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:472
//		TS	E
// slot 17820
                        if slot <> 17820 or instruction <> 23530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17821 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:473
//		CAE	CDUZ		# SECOND TERM CALCULATION:
// slot 17821
                            if slot <> 17821 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:474
//		EXTEND
// slot 17822
                            if slot <> 17822 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 17826 {
                if slot <= 17824 {
                    if slot <= 17823 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:475
//		MSU	CDUZD		# CDU ANGLE -ANGLE DESIRED (Z-AXIS)
// slot 17823
                        if slot <> 17823 or instruction <> 9119 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 927).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:476
//		TS	DAPTEMP2	# SAVE FOR RERRCALC
// slot 17824
                        if slot <> 17824 or instruction <> 23520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17825 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:477
//		EXTEND
// slot 17825
                        if slot <> 17825 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:478
//		MP	M22		# (CDUZ-CDUZD)*M22 SCALED AT PI RADIANS
// slot 17826
                        if slot <> 17826 or instruction <> 29455 { return choose false if checkOnly else -1. }
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
                if slot <= 17828 {
                    if slot <= 17827 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:479
//		AD	DELQEROR	# KALCMANU INERFACE ERROR
// slot 17827
                        if slot <> 17827 or instruction <> 25280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 704).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:480
//		AD	E
// slot 17828
                        if slot <> 17828 or instruction <> 25578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17829 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:481
//		XCH	QERROR		# SAVE Q-ERROR FOR EIGHT-BALL DISPLAY.
// slot 17829
                        if slot <> 17829 or instruction <> 24360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 808, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17830 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:482
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:483
//RERRCALC	CAE	DAPTEMP1	# R-ERROR CALCULATION:
// slot 17830
                            if slot <> 17830 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:484
//		EXTEND			# CDU ANGLE -ANGLE DESIRED (Y-AXIS)
// slot 17831
                            if slot <> 17831 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 17840 {
            if slot <= 17835 {
                if slot <= 17833 {
                    if slot <= 17832 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:485
//		MP	M31		# (CDUY-CDUYD)*M31 SCALED AT PI RADIANS
// slot 17832
                        if slot <> 17832 or instruction <> 29454 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 782, readEffective:call(words, 782)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:486
//		TS	E
// slot 17833
                        if slot <> 17833 or instruction <> 23530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17834 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:487
//		CAE	DAPTEMP2	# SECOND TERM CALCULATION:
// slot 17834
                        if slot <> 17834 or instruction <> 13280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:488
//		EXTEND			# CDU ANGLE -ANGLE DESIRED (Z-AXIS)
// slot 17835
                        if slot <> 17835 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17837 {
                    if slot <= 17836 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:489
//		MP	M32		# (CDUZ-CDUZD)*M32 SCALED AT PI RADIANS
// slot 17836
                        if slot <> 17836 or instruction <> 29456 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 784, readEffective:call(words, 784)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:490
//		AD	DELREROR	# KALCMANU INERFACE ERROR
// slot 17837
                        if slot <> 17837 or instruction <> 25281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 705).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17838 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:491
//		AD	E
// slot 17838
                        if slot <> 17838 or instruction <> 25578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17839 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:492
//		XCH	RERROR		# SAVE R-ERROR FOR EIGHT-BALL DISPLAY.
// slot 17839
                            if slot <> 17839 or instruction <> 24362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 810, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:493
//		TC	Q
// slot 17840
                            if slot <> 17840 or instruction <> 2 { return choose false if checkOnly else -1. }
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
            if slot <= 17845 {
                if slot <= 17842 {
                    if slot <= 17841 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:494
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:495
//# Page 1452
// Q_R-AXIS_RCS_AUTOPILOT.agc:496
//# "ATTSTEER" IS THE ENTRY POINT FOR Q,R-AXES (U,V-AXES) ATTITUDE CONTROL USING THE REACTION CONTROL SYSTEM
// Q_R-AXIS_RCS_AUTOPILOT.agc:497
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:498
//ATTSTEER	EQUALS	STILLRCS	# "STILLRCS" IS THE RCS EXIT FROM TRYGTS.
// Q_R-AXIS_RCS_AUTOPILOT.agc:499
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:500
//STILLRCS	CA	RERROR
// slot 17841
                        if slot <> 17841 or instruction <> 13098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 810).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:501
//		LXCH	A
// slot 17842
                        if slot <> 17842 or instruction <> 9216 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 0, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17843 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:502
//		CA	QERROR
// slot 17843
                        if slot <> 17843 or instruction <> 13096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 808).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17844 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:503
//		TC	ROT-TOUV
// slot 17844
                            if slot <> 17844 or instruction <> 1638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:504
//		DXCH	UERROR
// slot 17845
                            if slot <> 17845 or instruction <> 22506 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1002, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17847 {
                    if slot <= 17846 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:505
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:506
//# PREPARES CALL TO TJETLAW (OR SPSRCS(DOCKED))
// Q_R-AXIS_RCS_AUTOPILOT.agc:507
//# PREFORMS SKIP LOGIC ON U OR Y AXIS IF NEEDED.
// Q_R-AXIS_RCS_AUTOPILOT.agc:508
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:509
//TJLAW		CA	TJLAWADR
// slot 17846
                        if slot <> 17846 or instruction <> 13899 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1611), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:510
//		TS	RETJADR
// slot 17847
                        if slot <> 17847 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17848 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:511
//		CA	ONE
// slot 17848
                        if slot <> 17848 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17849 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:512
//		TS	AXISCTR
// slot 17849
                            if slot <> 17849 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:513
//		INDEX	AXISCTR
// slot 17850
                            if slot <> 17850 or instruction <> 21317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21317, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21317, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1063] to agcAotUnit1063@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:514
//		INDEX	SKIPU
// slot 17851
    17851, 42682,
// Q_R-AXIS_RCS_AUTOPILOT.agc:515
//		TCF	+1
// slot 17852
    17852, 11130
)).

// bank 17, slots 17853-17854
function agcAotUnit1064 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17853 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:516
//		CA	FOUR
// slot 17853
        if slot <> 17853 or instruction <> 14825 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:517
//		INDEX	AXISCTR
// slot 17854
        if slot <> 17854 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1064] to agcAotUnit1064@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:518
//		TS	SKIPU
// slot 17855
    17855, 46778
)).

// bank 17, slots 17856-17857
function agcAotUnit1065 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17856 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:519
//		TCF	LOOPER
// slot 17856
        if slot <> 17856 or instruction <> 5637 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5637, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:520
//		INDEX	AXISCTR
// slot 17857
        if slot <> 17857 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1065] to agcAotUnit1065@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:521
//		CA	UERROR
// slot 17858
    17858, 26578
)).

// bank 17, slots 17859-17860
function agcAotUnit1066 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17859 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:522
//		TS	E
// slot 17859
        if slot <> 17859 or instruction <> 23530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23530, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:523
//		INDEX	AXISCTR
// slot 17860
        if slot <> 17860 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1066] to agcAotUnit1066@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:524
//		CA	OMEGAU
// slot 17861
    17861, 26156
)).

// bank 17, slots 17862-17874
function agcAotUnit1067 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17867 {
        if slot <= 17864 {
            if slot <= 17862 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:525
//		TS	EDOT
// slot 17862
                if slot <> 17862 or instruction <> 23319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17863 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:526
//		CA	DAPBOOLS
// slot 17863
                    if slot <> 17863 or instruction <> 12361 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:527
//		MASK	CSMDOCKD
// slot 17864
                    if slot <> 17864 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 17865 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:528
//		CCS	A
// slot 17865
                if slot <> 17865 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17866 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:529
//		TCF	+3
// slot 17866
                    if slot <> 17866 or instruction <> 5581 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5581, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:530
//		TC	TJETLAW
// slot 17867
                    if slot <> 17867 or instruction <> 1706 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1706, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17870 {
            if slot <= 17868 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:531
//		TCF	AFTERTJ
// slot 17868
                if slot <> 17868 or instruction <> 5591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5591, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17869 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:532
// +3		CS	DAPBOOLS	# DOCKED.  IF GIMBAL USABLE DO GTS CONTROL
// slot 17869
                    if slot <> 17869 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:533
//		MASK	USEQRJTS	#	ON THE NEXT PASS.
// slot 17870
                    if slot <> 17870 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
            if slot <= 17872 {
                if slot <= 17871 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:534
//		CCS	A		# USEQRJTS BIT MUST NOT BE BIT 15.
// slot 17871
                    if slot <> 17871 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:535
//		TS	COTROLER	# GIMBAL USABLE.  STORE POSITIVE VALUE.
// slot 17872
                    if slot <> 17872 or instruction <> 23449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17873 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:536
//		INHINT
// slot 17873
                    if slot <> 17873 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:537
//		TC	IBNKCALL
// slot 17874
                    if slot <> 17874 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1067] to agcAotUnit1067@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:538
//		CADR	SPSRCS		# DETERMINE RCS CONTROL
// slot 17875
    17875, 36782
)).

// bank 17, slots 17876-17878
function agcAotUnit1068 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17876 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:539
//		RELINT
// slot 17876
        if slot <> 17876 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17877 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:540
//		CAF	FOUR		# ALWAYS CALL FOR 2-JET CONTROL ABOUT U,V.
// slot 17877
            if slot <> 17877 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:541
//		TS	NUMBERT		# FALL THROUGH TO JET SELECTION, ETC.
// slot 17878
            if slot <> 17878 or instruction <> 23523 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23523, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1068] to agcAotUnit1068@.

// bank 17, slots 17879-17893
function agcAotUnit1069 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17885 {
        if slot <= 17881 {
            if slot <= 17879 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:542
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:543
//# Q,R-JET-SELECTION-LOGIC
// Q_R-AXIS_RCS_AUTOPILOT.agc:544
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:545
//# INPUT:	AXISCTR		0,1 FOR U,V
// Q_R-AXIS_RCS_AUTOPILOT.agc:546
//#		SNUFFBIT	ZERO TJETU,V AND TRANS. ONLY IF SET IN A DPS BURN
// Q_R-AXIS_RCS_AUTOPILOT.agc:547
//# Page 1453
// Q_R-AXIS_RCS_AUTOPILOT.agc:548
//#		TJU,TJV		JET TIME SCALED 10.24 SEC.
// Q_R-AXIS_RCS_AUTOPILOT.agc:549
//#		NUMBERT		INDICATES NUMBER OF JETS AND TYPE OF POLICY
// Q_R-AXIS_RCS_AUTOPILOT.agc:550
//#		RETJADR		WHERE TO RETURN TO
// Q_R-AXIS_RCS_AUTOPILOT.agc:551
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:552
//# OUTPUT:	NO.U(V)JETS	RATE DERIVATION FEEDBACK
// Q_R-AXIS_RCS_AUTOPILOT.agc:553
//#		CHANNEL 5
// Q_R-AXIS_RCS_AUTOPILOT.agc:554
//#		SKIPU,SKIPV	FOR LESS THAN 150MS FIRING
// Q_R-AXIS_RCS_AUTOPILOT.agc:555
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:556
//# NOTES:	IN CASE OF FAILURE IN DESIRED ROTATION POLICY, "ALL" UNFAILED
// Q_R-AXIS_RCS_AUTOPILOT.agc:557
//#		JETS OF THE DESIRED POLICY ARE SELECTED.  SINCE THERE ARE ONLY
// Q_R-AXIS_RCS_AUTOPILOT.agc:558
//#		TWO JETS, THIS MEANS THE OTHER ONE OR NONE.  THE ALARM IS SENT
// Q_R-AXIS_RCS_AUTOPILOT.agc:559
//#		IF NONE CAN BE FOUND.
// Q_R-AXIS_RCS_AUTOPILOT.agc:560
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:561
//#		TIMES LESS THAN 14 MSEC ARE TAKEN TO CALL FOR A SINGLE-JET
// Q_R-AXIS_RCS_AUTOPILOT.agc:562
//#		MINIMUM IMPULSE, WITH THE JET CHOSEN SEMI-RANDOMLY.
// Q_R-AXIS_RCS_AUTOPILOT.agc:563
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:564
//AFTERTJ		CA	FLAGWRD5	# IF SNUFFBIT SET DURING A DPS BURN GO TO
// slot 17879
                if slot <> 17879 or instruction <> 12353 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17880 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:565
//		MASK	SNUFFBIT	# XTRANS; THAT IS, INHIBIT CONTROL.
// slot 17880
                    if slot <> 17880 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:566
//		EXTEND
// slot 17881
                    if slot <> 17881 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17883 {
                if slot <= 17882 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:567
//		BZF	DOROTAT
// slot 17882
                    if slot <> 17882 or instruction <> 5603 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5603, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:568
//		CS	FLGWRD10
// slot 17883
                    if slot <> 17883 or instruction <> 16454 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 70).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17884 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:569
//		MASK	APSFLBIT
// slot 17884
                    if slot <> 17884 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:570
//		EXTEND
// slot 17885
                    if slot <> 17885 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17889 {
            if slot <= 17887 {
                if slot <= 17886 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:571
//		BZF	DOROTAT
// slot 17886
                    if slot <> 17886 or instruction <> 5603 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5603, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:572
//		CA	DAPBOOLS
// slot 17887
                    if slot <> 17887 or instruction <> 12361 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17888 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:573
//		MASK	DRIFTBIT
// slot 17888
                    if slot <> 17888 or instruction <> 31204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        if fixedOperand = 128 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:574
//		EXTEND
// slot 17889
                    if slot <> 17889 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17891 {
                if slot <= 17890 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:575
//		BZF	XTRANS
// slot 17890
                    if slot <> 17890 or instruction <> 5683 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5683, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:576
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:577
//DOROTAT		CAF	TWO
// slot 17891
                    if slot <> 17891 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17892 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:578
//		TS	L
// slot 17892
                    if slot <> 17892 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:579
//		INDEX	AXISCTR
// slot 17893
                    if slot <> 17893 or instruction <> 21317 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1069] to agcAotUnit1069@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:580
//		CCS	TJU
// slot 17894
    17894, 9898
)).

// bank 17, slots 17895-17910
function agcAotUnit1070 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17902 {
        if slot <= 17898 {
            if slot <= 17896 {
                if slot <= 17895 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:581
//		TCF	+5
// slot 17895
                    if slot <> 17895 or instruction <> 5612 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5612, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:582
//		TCF	NOROTAT
// slot 17896
                    if slot <> 17896 or instruction <> 5631 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5631, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17897 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:583
//		TCF	+2
// slot 17897
                    if slot <> 17897 or instruction <> 5611 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5611, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:584
//		TCF	NOROTAT
// slot 17898
                    if slot <> 17898 or instruction <> 5631 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5631, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17900 {
                if slot <= 17899 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:585
//		ZL
// slot 17899
                    if slot <> 17899 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:586
//		AD	ONE
// slot 17900
                    if slot <> 17900 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 17901 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:587
//		TS	ABSTJ
// slot 17901
                    if slot <> 17901 or instruction <> 23519 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23519, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:588
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:589
//		CA	AXISCTR
// slot 17902
                    if slot <> 17902 or instruction <> 13125 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 837).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17906 {
            if slot <= 17904 {
                if slot <= 17903 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:590
//		AD	L
// slot 17903
                    if slot <> 17903 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:591
//		TS	ROTINDEX	# 0 1 2 3 = -U -V +U +V
// slot 17904
                    if slot <> 17904 or instruction <> 23524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23524, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17905 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:592
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:593
//		CA	ABSTJ
// slot 17905
                    if slot <> 17905 or instruction <> 13279 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 991).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:594
//		AD	-150MS
// slot 17906
                    if slot <> 17906 or instruction <> 26184 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1608), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17908 {
                if slot <= 17907 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:595
//		EXTEND
// slot 17907
                    if slot <> 17907 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:596
//		BZMF	DOSKIP
// slot 17908
                    if slot <> 17908 or instruction <> 26120 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26120, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17909 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:597
//# Page 1454
// Q_R-AXIS_RCS_AUTOPILOT.agc:598
//		TC	SELCTSUB
// slot 17909
                    if slot <> 17909 or instruction <> 1659 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1659, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:599
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:600
//		INDEX	AXISCTR
// slot 17910
                    if slot <> 17910 or instruction <> 21317 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1070] to agcAotUnit1070@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:601
//		CA	INDEXES
// slot 17911
    17911, 27786
)).

// bank 17, slots 17912-17915
function agcAotUnit1071 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17913 {
        if slot <= 17912 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:602
//		TS	L
// slot 17912
            if slot <> 17912 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:603
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:604
//		CA	POLYTEMP
// slot 17913
            if slot <> 17913 or instruction <> 13281 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 993).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17914 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:605
//		INHINT
// slot 17914
            if slot <> 17914 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:606
//		INDEX	L
// slot 17915
            if slot <> 17915 or instruction <> 20481 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20481, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20481, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1071] to agcAotUnit1071@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:607
//		TC	WRITEP
// slot 17916
    17916, 6104
)).

// bank 17, slots 17917-17919
function agcAotUnit1072 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17917 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:608
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:609
//		RELINT
// slot 17917
        if slot <> 17917 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17918 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:610
//		TCF	FEEDBACK
// slot 17918
            if slot <> 17918 or instruction <> 5673 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5673, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:611
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:612
//NOROTAT		INDEX	AXISCTR
// slot 17919
            if slot <> 17919 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1072] to agcAotUnit1072@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:613
//		CA	INDEXES
// slot 17920
    17920, 27786
)).

// bank 17, slots 17921-17922
function agcAotUnit1073 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17921 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:614
//		INHINT
// slot 17921
        if slot <> 17921 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:615
//		INDEX	A
// slot 17922
        if slot <> 17922 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1073] to agcAotUnit1073@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:616
//		TC	WRITEP 	-1
// slot 17923
    17923, 6102
)).

// bank 17, slots 17924-17933
function agcAotUnit1074 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17928 {
        if slot <= 17925 {
            if slot <= 17924 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:617
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:618
//		RELINT
// slot 17924
                if slot <> 17924 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:619
//LOOPER		CCS	AXISCTR
// slot 17925
                if slot <> 17925 or instruction <> 4933 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 837).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17926 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:620
//		TC	RETJADR
// slot 17926
                if slot <> 17926 or instruction <> 831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 831, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17927 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:621
//		TCF	CLOSEOUT
// slot 17927
                    if slot <> 17927 or instruction <> 5790 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5790, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:622
//DOSKIP		CS	ABSTJ
// slot 17928
                    if slot <> 17928 or instruction <> 17375 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 991).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17930 {
            if slot <= 17929 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:623
//		AD	+TJMINT6	# 14MS
// slot 17929
                if slot <> 17929 or instruction <> 26183 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:624
//		EXTEND
// slot 17930
                if slot <> 17930 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17931 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:625
//		BZMF	NOTMIN
// slot 17931
                if slot <> 17931 or instruction <> 26138 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26138, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17932 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:626
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:627
//		ADS	ABSTJ
// slot 17932
                    if slot <> 17932 or instruction <> 12255 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 991).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:628
//		INDEX	AXISCTR
// slot 17933
                    if slot <> 17933 or instruction <> 21317 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21317, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1074] to agcAotUnit1074@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:629
//		CCS	TJU
// slot 17934
    17934, 9898
)).

// bank 17, slots 17935-17938
function agcAotUnit1075 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17936 {
        if slot <= 17935 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:630
//		CA	+TJMINT6
// slot 17935
            if slot <> 17935 or instruction <> 13895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:631
//		TCF	+2
// slot 17936
            if slot <> 17936 or instruction <> 5650 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5650, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17937 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:632
//		CS	+TJMINT6
// slot 17937
            if slot <> 17937 or instruction <> 17991 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:633
//		INDEX	AXISCTR
// slot 17938
            if slot <> 17938 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1075] to agcAotUnit1075@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:634
//		TS	TJU
// slot 17939
    17939, 46762
)).

// bank 17, slots 17940-17947
function agcAotUnit1076 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17943 {
        if slot <= 17941 {
            if slot <= 17940 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:635
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:636
//		CCS	SENSETYP	# ENSURE MIN-IMPULSE NOT AGAINST TRANS
// slot 17940
                if slot <> 17940 or instruction <> 4928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 832).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:637
//		TCF	NOTMIN 	-1
// slot 17941
                if slot <> 17941 or instruction <> 5657 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5657, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17942 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:638
//		EXTEND
// slot 17942
                if slot <> 17942 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:639
//		READ	LOSCALAR
// slot 17943
                if slot <> 17943 or instruction <> 4 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 0, 4, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17945 {
            if slot <= 17944 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:640
//		MASK	ONE
// slot 17944
                if slot <> 17944 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
// Q_R-AXIS_RCS_AUTOPILOT.agc:641
//		TS	NUMBERT
// slot 17945
                if slot <> 17945 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17946 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:642
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:643
//NOTMIN		TC	SELCTSUB
// slot 17946
                if slot <> 17946 or instruction <> 1659 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1659, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:644
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:645
//		INDEX	AXISCTR
// slot 17947
                if slot <> 17947 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1076] to agcAotUnit1076@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:646
//		CA	INDEXES
// slot 17948
    17948, 27786
)).

// bank 17, slots 17949-17952
function agcAotUnit1077 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17950 {
        if slot <= 17949 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:647
//		INHINT
// slot 17949
            if slot <> 17949 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:648
//# Page 1455
// Q_R-AXIS_RCS_AUTOPILOT.agc:649
//		TS	T6FURTHA +1
// slot 17950
            if slot <> 17950 or instruction <> 23353 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23353, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17951 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:650
//		CA	POLYTEMP
// slot 17951
            if slot <> 17951 or instruction <> 13281 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 993).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:651
//		INDEX	T6FURTHA +1
// slot 17952
            if slot <> 17952 or instruction <> 21305 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21305, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21305, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1077] to agcAotUnit1077@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:652
//		TC	WRITEP
// slot 17953
    17953, 6104
)).

// bank 17, slots 17954-17959
function agcAotUnit1078 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17956 {
        if slot <= 17954 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:653
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:654
//		CA	ABSTJ
// slot 17954
            if slot <> 17954 or instruction <> 13279 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 991).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17955 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:655
//		TS	T6FURTHA
// slot 17955
                if slot <> 17955 or instruction <> 23352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23352, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:656
//		TC	JTLST		# IN QR BANK BY NOW
// slot 17956
                if slot <> 17956 or instruction <> 1612 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1612, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17957 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:657
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:658
//		RELINT
// slot 17957
            if slot <> 17957 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17958 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:659
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:660
//		CA	ZERO
// slot 17958
                if slot <> 17958 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:661
//		INDEX	AXISCTR
// slot 17959
                if slot <> 17959 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1078] to agcAotUnit1078@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:662
//		TS	SKIPU
// slot 17960
    17960, 46778
)).

// bank 17, slots 17961-17968
function agcAotUnit1079 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17964 {
        if slot <= 17962 {
            if slot <= 17961 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:663
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:664
//FEEDBACK	CS	THREE
// slot 17961
                if slot <> 17961 or instruction <> 19621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:665
//		AD	NUMBERT
// slot 17962
                if slot <> 17962 or instruction <> 25571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 995).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17963 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:666
//		EXTEND
// slot 17963
                if slot <> 17963 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:667
//		BZMF	+3
// slot 17964
                if slot <> 17964 or instruction <> 26159 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26159, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17966 {
            if slot <= 17965 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:668
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:669
//		CA	TWO
// slot 17965
                if slot <> 17965 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:670
//		TCF	+2
// slot 17966
                if slot <> 17966 or instruction <> 5680 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5680, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17967 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:671
//		CA	ONE
// slot 17967
                if slot <> 17967 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:672
//		INDEX	AXISCTR
// slot 17968
                if slot <> 17968 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1079] to agcAotUnit1079@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:673
//		TS	NO.UJETS
// slot 17969
    17969, 46756
)).

// bank 17, slots 17970-17988
function agcAotUnit1080 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17978 {
        if slot <= 17973 {
            if slot <= 17971 {
                if slot <= 17970 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:674
//		TCF	LOOPER
// slot 17970
                    if slot <> 17970 or instruction <> 5637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:675
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:676
//XTRANS		CA	ZERO
// slot 17971
                    if slot <> 17971 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 17972 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:677
//		TS	TJU
// slot 17972
                    if slot <> 17972 or instruction <> 23381 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23381, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:678
//		TS	TJV
// slot 17973
                    if slot <> 17973 or instruction <> 23382 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23382, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17975 {
                if slot <= 17974 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:679
//		CA	FOUR
// slot 17974
                    if slot <> 17974 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:680
//		INHINT
// slot 17975
                    if slot <> 17975 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17976 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:681
//		XCH	SKIPU
// slot 17976
                    if slot <> 17976 or instruction <> 24413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 861, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17977 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:682
//		EXTEND
// slot 17977
                        if slot <> 17977 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:683
//		BZF	+2
// slot 17978
                        if slot <> 17978 or instruction <> 5692 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5692, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17983 {
            if slot <= 17980 {
                if slot <= 17979 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:684
//		TC	WRITEU 	-1
// slot 17979
                    if slot <> 17979 or instruction <> 3055 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3055, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:685
//		CA	FOUR
// slot 17980
                    if slot <> 17980 or instruction <> 14825 { return choose false if checkOnly else -1. }
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
                if slot <= 17981 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:686
//		XCH	SKIPV
// slot 17981
                    if slot <> 17981 or instruction <> 24414 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 862, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17982 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:687
//		RELINT
// slot 17982
                        if slot <> 17982 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:688
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:689
//		EXTEND
// slot 17983
                        if slot <> 17983 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17985 {
                if slot <= 17984 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:690
//		BZF	CLOSEOUT
// slot 17984
                    if slot <> 17984 or instruction <> 5790 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5790, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:691
//		INHINT
// slot 17985
                    if slot <> 17985 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17986 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:692
//		TC	WRITEV 	-1
// slot 17986
                    if slot <> 17986 or instruction <> 3064 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3064, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17987 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:693
//		RELINT
// slot 17987
                        if slot <> 17987 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:694
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:695
//		TCF	CLOSEOUT
// slot 17988
                        if slot <> 17988 or instruction <> 5790 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5790, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1080] to agcAotUnit1080@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:696
//INDEXES		DEC	4
// slot 17989
    17989, 8,
// Q_R-AXIS_RCS_AUTOPILOT.agc:697
//		DEC	13
// slot 17990
    17990, 26,
// Q_R-AXIS_RCS_AUTOPILOT.agc:698
//+TJMINT6	DEC	22
// slot 17991
    17991, 44,
// Q_R-AXIS_RCS_AUTOPILOT.agc:699
//# Page 1456
// Q_R-AXIS_RCS_AUTOPILOT.agc:700
//-150MS		DEC	-240
// slot 17992
    17992, 65054,
// Q_R-AXIS_RCS_AUTOPILOT.agc:701
//BIT8,9		OCT	00600
// slot 17993
    17993, 768,
// Q_R-AXIS_RCS_AUTOPILOT.agc:702
//SCLNORM		OCT	266
// slot 17994
    17994, 364,
// Q_R-AXIS_RCS_AUTOPILOT.agc:703
//TJLAWADR	GENADR	TJLAW 	+3	# RETURN ADDRESS FOR RCS ATTITUDE CONTROL
// slot 17995
    17995, 2930
)).

// bank 17, slots 17996-18024
function agcAotUnit1081 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18009 {
        if slot <= 18002 {
            if slot <= 17998 {
                if slot <= 17996 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:704
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:705
//# THE JET LIST:
// Q_R-AXIS_RCS_AUTOPILOT.agc:706
//# THIS IS A WAITLIST FOR T6RUPTS.
// Q_R-AXIS_RCS_AUTOPILOT.agc:707
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:708
//# CALLED BY:
// Q_R-AXIS_RCS_AUTOPILOT.agc:709
//#		CA	TJ		# TIME WHEN NEXT JETS WILL BE WRITTEN
// Q_R-AXIS_RCS_AUTOPILOT.agc:710
//#		TS	T6FURTHA
// Q_R-AXIS_RCS_AUTOPILOT.agc:711
//#		CA	INDEX		# AXIS TO BE WRITTEN AT TJ (FROM NOW)
// Q_R-AXIS_RCS_AUTOPILOT.agc:712
//#		TS	T6FURTHA +1
// Q_R-AXIS_RCS_AUTOPILOT.agc:713
//#		TC	JTLST
// Q_R-AXIS_RCS_AUTOPILOT.agc:714
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:715
//# EXAMPLE -- U-AXIS AUTOPILOT WILL WRITE ITS ROTATION CODE OF
// Q_R-AXIS_RCS_AUTOPILOT.agc:716
//# JETS INTO CHANNEL 5.  IF IT DESIRES TO TURN OFF THIS POLICY WITHIN
// Q_R-AXIS_RCS_AUTOPILOT.agc:717
//# 150MS AND THEN FIRE NEXTU, A CALL TO JTLST IS MADE WITH T6FURTHA
// Q_R-AXIS_RCS_AUTOPILOT.agc:718
//# CONTAINING THE TIME TO TURN OFF THE POLICY, T6FURTHA +1 THE INDEX
// Q_R-AXIS_RCS_AUTOPILOT.agc:719
//# OF THE U-AXIS(4), AND NEXTU WILL CONTAIN THE "U-TRANS" POLICY OR ZERO.
// Q_R-AXIS_RCS_AUTOPILOT.agc:720
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:721
//# THE LIST IS EXACTLY 3 LONG.  (THIS LEADS UP TO SKIP LOGIC AND 150MS LIMIT)
// Q_R-AXIS_RCS_AUTOPILOT.agc:722
//# THE INPUT IS THE LAST MEMBER OF THE LIST.
// Q_R-AXIS_RCS_AUTOPILOT.agc:723
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:724
//# RETURNS BY:
// Q_R-AXIS_RCS_AUTOPILOT.agc:725
//#	+	TC	Q
// Q_R-AXIS_RCS_AUTOPILOT.agc:726
//#
// Q_R-AXIS_RCS_AUTOPILOT.agc:727
//# DEFINITIONS:  (OUTPUT)
// Q_R-AXIS_RCS_AUTOPILOT.agc:728
//#	TIME6		TIME OF NEXT RUPT
// Q_R-AXIS_RCS_AUTOPILOT.agc:729
//#	T6NEXT		DELTA TIME TO NEXT RUPT
// Q_R-AXIS_RCS_AUTOPILOT.agc:730
//#	T6FURTHA	DELTA TIME FROM 2ND TO LAST RUPT
// Q_R-AXIS_RCS_AUTOPILOT.agc:731
//#	NXT6ADR		AXIS INDEX	0 -- P-AXIS
// Q_R-AXIS_RCS_AUTOPILOT.agc:732
//#	T6NEXT +1	AXIS INDEX	4 -- U-AXIS
// Q_R-AXIS_RCS_AUTOPILOT.agc:733
//#	T6FURTHA +1	AXIS INDEX	13 -- V-AXIS
// Q_R-AXIS_RCS_AUTOPILOT.agc:734
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:735
//JTLST		CS	T6FURTHA
// slot 17996
                    if slot <> 17996 or instruction <> 17208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 824).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17997 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:736
//		AD	TIME6
// slot 17997
                        if slot <> 17997 or instruction <> 24601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 25).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:737
//		EXTEND
// slot 17998
                        if slot <> 17998 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18000 {
                    if slot <= 17999 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:738
//		BZMF	MIDORLST	# TIME6 -- TI IS IN A
// slot 17999
                        if slot <> 17999 or instruction <> 26201 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26201, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:739
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:740
//		LXCH	NXT6ADR
// slot 18000
                        if slot <> 18000 or instruction <> 10037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 821, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18001 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:741
//		DXCH	T6NEXT
// slot 18001
                        if slot <> 18001 or instruction <> 22327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 823, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:742
//		DXCH	T6FURTHA
// slot 18002
                        if slot <> 18002 or instruction <> 22329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 825, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18005 {
                if slot <= 18003 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:743
//		TS	TIME6
// slot 18003
                    if slot <> 18003 or instruction <> 22553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18004 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:744
//		LXCH	NXT6ADR
// slot 18004
                        if slot <> 18004 or instruction <> 10037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 821, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:745
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:746
//TURNON		CA	BIT15
// slot 18005
                        if slot <> 18005 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
                if slot <= 18007 {
                    if slot <= 18006 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:747
//		EXTEND
// slot 18006
                        if slot <> 18006 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:748
//		WOR	CHAN13
// slot 18007
                        if slot <> 18007 or instruction <> 2571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18008 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:749
//		TC	Q
// slot 18008
                        if slot <> 18008 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:750
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:751
//# Page 1457
// Q_R-AXIS_RCS_AUTOPILOT.agc:752
//MIDORLST	AD	T6NEXT
// slot 18009
                        if slot <> 18009 or instruction <> 25398 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18016 {
            if slot <= 18012 {
                if slot <= 18010 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:753
//		EXTEND
// slot 18010
                    if slot <> 18010 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18011 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:754
//		BZMF	LASTCHG		# TIME6 + T6NEXT - T IS IN A
// slot 18011
                        if slot <> 18011 or instruction <> 26210 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26210, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:755
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:756
//		LXCH	T6NEXT 	+1
// slot 18012
                        if slot <> 18012 or instruction <> 10039 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 823, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18014 {
                    if slot <= 18013 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:757
//		DXCH	T6FURTHA
// slot 18013
                        if slot <> 18013 or instruction <> 22329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 825, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:758
//		EXTEND
// slot 18014
                        if slot <> 18014 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18015 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:759
//		SU	TIME6
// slot 18015
                        if slot <> 18015 or instruction <> 24601 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreSU(words, 25).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:760
//		DXCH	T6NEXT
// slot 18016
                        if slot <> 18016 or instruction <> 22327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 823, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18020 {
                if slot <= 18018 {
                    if slot <= 18017 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:761
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:762
//		TC	Q
// slot 18017
                        if slot <> 18017 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:763
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:764
//LASTCHG		CS	A
// slot 18018
                        if slot <> 18018 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18019 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:765
//		AD	NEG0
// slot 18019
                        if slot <> 18019 or instruction <> 27116 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2540), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:766
//		TS	T6FURTHA
// slot 18020
                        if slot <> 18020 or instruction <> 23352 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23352, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18022 {
                    if slot <= 18021 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:767
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:768
//		TC	Q
// slot 18021
                        if slot <> 18021 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:769
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:770
//# ROT-TOUV IS ENTERED WITH THE Q-COMPONENT OF THE QUANTITY TO BE TRANSFORMED IN A AND THE R-COMPONENT IN L.
// Q_R-AXIS_RCS_AUTOPILOT.agc:771
//# ROT-TOUV TRANSFORMS THE QUANTITY INTO THE NON-ORTHOGONAL U-V AXIS SYSTEM.  IN THE U-V SYSTEM NO CROSS-COUPLING IS
// Q_R-AXIS_RCS_AUTOPILOT.agc:772
//# PRODUCED FROM RCS JET FIRINGS.  AT THE COMPLETION OF ROT-TOUV, THE U-COMPONENT OF THE TRANSFORMED QUANTITY IS IN
// Q_R-AXIS_RCS_AUTOPILOT.agc:773
//# A AND THE V-COMPONENT IS IN L.
// Q_R-AXIS_RCS_AUTOPILOT.agc:774
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:775
//ROT-TOUV	LXCH	ROTEMP2		# (R) IS PUT INTO ROTEMP2
// slot 18022
                        if slot <> 18022 or instruction <> 10208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 992, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18023 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:776
//		EXTEND
// slot 18023
                        if slot <> 18023 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:777
//		MP	COEFFQ
// slot 18024
                        if slot <> 18024 or instruction <> 29591 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 919, readEffective:call(words, 919)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1081] to agcAotUnit1081@.

// bank 17, slots 18025-18032
function agcAotUnit1082 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18028 {
        if slot <= 18026 {
            if slot <= 18025 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:778
//		XCH	ROTEMP2		# (R) GOES TO A AND COEFFQ.(Q) TO ROTEMP2
// slot 18025
                if slot <> 18025 or instruction <> 24544 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 992, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:779
//		EXTEND
// slot 18026
                if slot <> 18026 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18027 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:780
//		MP	COEFFR
// slot 18027
                if slot <> 18027 or instruction <> 29592 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 920, readEffective:call(words, 920)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:781
//		TS	L		# COEFFR.(R) IS PUT INTO L
// slot 18028
                if slot <> 18028 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18030 {
            if slot <= 18029 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:782
//		AD	ROTEMP2
// slot 18029
                if slot <> 18029 or instruction <> 25568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 992).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:783
//		TS	ROTEMP1		# COEFFQ.(Q)+COEFFR.(R) IS PUT IN ROTEMP1
// slot 18030
                if slot <> 18030 or instruction <> 23519 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18031 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:784
//		TCF	+4
// slot 18031
                if slot <> 18031 or instruction <> 5747 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5747, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:785
//		INDEX	A		# COEFFQ.(Q) + COEFFR.(R) HAS OVERFLOWED
// slot 18032
                if slot <> 18032 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1082] to agcAotUnit1082@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:786
//		CS	LIMITS		# AND IS LIMITED TO POSMAX OR NEGMAX
// slot 18033
    18033, 37816
)).

// bank 17, slots 18034-18039
function agcAotUnit1083 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18036 {
        if slot <= 18034 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:787
//		TS	ROTEMP1
// slot 18034
            if slot <> 18034 or instruction <> 23519 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23519, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18035 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:788
//		CS	ROTEMP2
// slot 18035
                if slot <> 18035 or instruction <> 17376 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 992).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:789
//		AD	L		# -COEFFQ.(Q) + COEFFR.(R) IS NOW IN A
// slot 18036
                if slot <> 18036 or instruction <> 24577 { return choose false if checkOnly else -1. }
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
        if slot <= 18037 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:790
//		TS	7
// slot 18037
            if slot <> 18037 or instruction <> 22535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18038 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:791
//		TCF	+3
// slot 18038
                if slot <> 18038 or instruction <> 5753 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5753, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:792
//		INDEX	A		# -COEFFQ.(Q) + COEFFR.(R) HAS OVERFLOWED
// slot 18039
                if slot <> 18039 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1083] to agcAotUnit1083@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:793
//		CS	LIMITS		# AND IS LIMITED TO POSMAX OR NEGMAX
// slot 18040
    18040, 37816
)).

// bank 17, slots 18041-18043
function agcAotUnit1084 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18041 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:794
//		LXCH	ROTEMP1		# COEFFQ.(Q) + COEFFR.(R) IS PUT INTO L
// slot 18041
        if slot <> 18041 or instruction <> 10207 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 991, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18042 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:795
//		TC	Q
// slot 18042
            if slot <> 18042 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:796
//SELCTSUB	INDEX	ROTINDEX
// slot 18043
            if slot <> 18043 or instruction <> 21476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1084] to agcAotUnit1084@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:797
//		CA	ALLJETS
// slot 18044
    18044, 27946
)).

// bank 17, slots 18045-18045
function agcAotUnit1085 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:798
//		INDEX	NUMBERT
// slot 18045
    if slot <> 18045 or instruction <> 21475 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21475, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21475, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1085] to agcAotUnit1085@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:799
//		MASK	TYPEPOLY
// slot 18046
    18046, 60722
)).

// bank 17, slots 18047-18054
function agcAotUnit1086 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18050 {
        if slot <= 18048 {
            if slot <= 18047 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:800
//		TS	POLYTEMP
// slot 18047
                if slot <> 18047 or instruction <> 23521 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23521, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:801
//# Page 1458
// Q_R-AXIS_RCS_AUTOPILOT.agc:802
//		MASK	CH5MASK
// slot 18048
                if slot <> 18048 or instruction <> 29362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 690).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18049 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:803
//		CCS	A
// slot 18049
                if slot <> 18049 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:804
//		TCF	+2
// slot 18050
                if slot <> 18050 or instruction <> 5764 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5764, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18052 {
            if slot <= 18051 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:805
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:806
//		TC	Q
// slot 18051
                if slot <> 18051 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:807
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:808
//		CA	THREE
// slot 18052
                if slot <> 18052 or instruction <> 15525 { return choose false if checkOnly else -1. }
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
            if slot <= 18053 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:809
//FAILOOP		TS	NUMBERT
// slot 18053
                if slot <> 18053 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:810
//		INDEX	ROTINDEX
// slot 18054
                if slot <> 18054 or instruction <> 21476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1086] to agcAotUnit1086@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:811
//		CA	ALLJETS
// slot 18055
    18055, 27946
)).

// bank 17, slots 18056-18056
function agcAotUnit1087 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:812
//		INDEX	NUMBERT
// slot 18056
    if slot <> 18056 or instruction <> 21475 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21475, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21475, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1087] to agcAotUnit1087@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:813
//		MASK	TYPEPOLY
// slot 18057
    18057, 60722
)).

// bank 17, slots 18058-18064
function agcAotUnit1088 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18060 {
        if slot <= 18058 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:814
//		TS	POLYTEMP
// slot 18058
            if slot <> 18058 or instruction <> 23521 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23521, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18059 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:815
//		MASK	CH5MASK
// slot 18059
                if slot <> 18059 or instruction <> 29362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 690).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:816
//		EXTEND
// slot 18060
                if slot <> 18060 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18062 {
            if slot <= 18061 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:817
//		BZF	FAILOOP -2
// slot 18061
                if slot <> 18061 or instruction <> 5763 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5763, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:818
//		CCS	NUMBERT
// slot 18062
                if slot <> 18062 or instruction <> 5091 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 995).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18063 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:819
//		TCF	FAILOOP
// slot 18063
                if slot <> 18063 or instruction <> 5765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:820
//		INDEX	AXISCTR
// slot 18064
                if slot <> 18064 or instruction <> 21317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1088] to agcAotUnit1088@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:821
//		TS	TJU
// slot 18065
    18065, 46762
)).

// bank 17, slots 18066-18066
function agcAotUnit1089 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:822
//		TC	ALARM
// slot 18066
    if slot <> 18066 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1089] to agcAotUnit1089@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:823
//		OCT	02004
// slot 18067
    18067, 2056
)).

// bank 17, slots 18068-18068
function agcAotUnit1090 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:824
//		TCF	NOROTAT
// slot 18068
    if slot <> 18068 or instruction <> 5631 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5631, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1090] to agcAotUnit1090@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:825
//ALLJETS		OCT	00110		#	-U	6 13
// slot 18069
    18069, 144,
// Q_R-AXIS_RCS_AUTOPILOT.agc:826
//		OCT	00022		#	-V	2 9
// slot 18070
    18070, 36,
// Q_R-AXIS_RCS_AUTOPILOT.agc:827
//		OCT	00204		#	+U	5 14
// slot 18071
    18071, 264,
// Q_R-AXIS_RCS_AUTOPILOT.agc:828
//		OCT	00041		# 	+V	1 10
// slot 18072
    18072, 66,
// Q_R-AXIS_RCS_AUTOPILOT.agc:829
//TYPEPOLY	OCT	00125		#	-X	1 5 9 13
// slot 18073
    18073, 170,
// Q_R-AXIS_RCS_AUTOPILOT.agc:830
//		OCT	00252		#	+X	2 6 10 14
// slot 18074
    18074, 340,
// Q_R-AXIS_RCS_AUTOPILOT.agc:831
//		OCT	00146		#	A	2 5 10 13
// slot 18075
    18075, 204,
// Q_R-AXIS_RCS_AUTOPILOT.agc:832
//		OCT	00231		#	B	1 6 9 14
// slot 18076
    18076, 306,
// Q_R-AXIS_RCS_AUTOPILOT.agc:833
//		OCT	00377		#	ALL	1 2 5 6 9 10 13 14
// slot 18077
    18077, 510
)).

// bank 17, slots 18078-18079
function agcAotUnit1091 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18078 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:834
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:835
//# THE FOLLOWING SETS THE INTERRUPT FLIP-FLOP AS SOON AS POSSIBLE, WHICH PERMITS A RETURN TO THE INTERRUPTED JOB.
// Q_R-AXIS_RCS_AUTOPILOT.agc:836
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:837
//CLOSEOUT	CA	ADRRUPT
// slot 18078
        if slot <> 18078 or instruction <> 13984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1696), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:838
//		TC	MAKERUPT
// slot 18079
        if slot <> 18079 or instruction <> 4076 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4076, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1091] to agcAotUnit1091@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:839
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:840
//ADRRUPT		ADRES	ENDJASK
// slot 18080
    18080, 3394
)).

// bank 17, slots 18081-18089
function agcAotUnit1092 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18084 {
        if slot <= 18082 {
            if slot <= 18081 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:841
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:842
//ENDJASK		DXCH	DAPARUPT
// slot 18081
                if slot <> 18081 or instruction <> 22508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1004, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:843
//		DXCH	ARUPT
// slot 18082
                if slot <> 18082 or instruction <> 21513 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18083 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:844
//		DXCH	DAPBQRPT
// slot 18083
                if slot <> 18083 or instruction <> 22510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1006, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:845
//		XCH	BRUPT
// slot 18084
                if slot <> 18084 or instruction <> 23567 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 15, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18086 {
            if slot <= 18085 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:846
//		LXCH	Q
// slot 18085
                if slot <> 18085 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:847
//		CAF	NEGMAX		# NEGATIVE DAPZRUPT SIGNALS JASK IS OVER.
// slot 18086
                if slot <> 18086 or instruction <> 14813 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18087 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:848
//		DXCH	DAPZRUPT
// slot 18087
                if slot <> 18087 or instruction <> 22512 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1008, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18088 {
// Q_R-AXIS_RCS_AUTOPILOT.agc:849
//		DXCH	ZRUPT
// slot 18088
                    if slot <> 18088 or instruction <> 21518 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 14, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// Q_R-AXIS_RCS_AUTOPILOT.agc:850
//		TCF	NOQRSM
// slot 18089
                    if slot <> 18089 or instruction <> 6842 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6842, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1092] to agcAotUnit1092@.

// bank 03, slots 6124-6124
function agcAotUnit356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// Q_R-AXIS_RCS_AUTOPILOT.agc:851
//# Page 1459
// Q_R-AXIS_RCS_AUTOPILOT.agc:852
//		BLOCK	3
// Q_R-AXIS_RCS_AUTOPILOT.agc:853
//		SETLOC	FFTAG6
// Q_R-AXIS_RCS_AUTOPILOT.agc:854
//		BANK
// Q_R-AXIS_RCS_AUTOPILOT.agc:855
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:856
//		COUNT*	$$/DAP
// Q_R-AXIS_RCS_AUTOPILOT.agc:857
//
// Q_R-AXIS_RCS_AUTOPILOT.agc:858
//MAKERUPT	EXTEND
// slot 6124
    if slot <> 6124 or instruction <> 6 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[356] to agcAotUnit356@.

agcAotInstallSourceRope(list(
// Q_R-AXIS_RCS_AUTOPILOT.agc:859
//		EDRUPT	MAKERUPT
// slot 6125
    6125, 8152
)).

// no code for the lines below
// Q_R-AXIS_RCS_AUTOPILOT.agc:860
//
