// PORT: Original source unit Q_R-AXIS_RCS_AUTOPILOT.agc.
// PORT: Physical bank 17. Shared continuation entries, slots 17466–17528.
function agcAotUnit1044 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17496 {
        if slot <= 17480 {
            if slot <= 17472 {
                if slot <= 17468 {
                    if slot <= 17466 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:2
//# Filename:	Q_R-AXIS_RCS_AUTOPILOT.agc
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:9
//# Pages:	1442-1459
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:13
//#		2009-06-07 RSB	Corrected "DEC 96.0" to "DEC 96", since
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:14
//#				the former is not compatible with yaYUL.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:15
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:24
//# actually created.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:25
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:27
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:30
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:31
//# Page 1442
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:32
//		BANK	17
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:33
//		SETLOC	DAPS2
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:34
//		BANK
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:35
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:36
//		EBANK=	CDUXD
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:37
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:38
//		COUNT*	$$/DAPQR
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:39
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:40
//CALLQERR	CA	BIT13		# CALCULATE Q,R ERRORS UNLESS THESE AXES
// PORT: Fixed ROM slots 17466.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:41
//		EXTEND			# ARE IN MANUAL RATE COMMAND.
// PORT: Fixed ROM slots 17467.
                            if slot <> 17467 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:42
//		RAND	CHAN31
// PORT: Fixed ROM slots 17468.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:43
//		CCS	A
// PORT: Fixed ROM slots 17469.
                            if slot <> 17469 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:44
//		TCF	+5		# IN AUTO COMPUTE Q,R ERRORS
// PORT: Fixed ROM slots 17470.
                            if slot <> 17470 or instruction <> 5187 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5187, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17471 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:45
//		CS	DAPBOOLS	# IN MANUAL RATE COMMAND?
// PORT: Fixed ROM slots 17471.
                            if slot <> 17471 or instruction <> 16457 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 73).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:46
//		MASK	OURRCBIT
// PORT: Fixed ROM slots 17472.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:47
//		EXTEND
// PORT: Fixed ROM slots 17473.
                            if slot <> 17473 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:48
//		BZF	Q,RORGTS	# IF SO BYPASS CALCULATION OF ERRORS.
// PORT: Fixed ROM slots 17474.
                            if slot <> 17474 or instruction <> 5188 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17475 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:49
//		TC	QERRCALC
// PORT: Fixed ROM slots 17475.
                            if slot <> 17475 or instruction <> 1430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1430, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:50
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:51
//Q,RORGTS	CCS	COTROLER	# CHOOSE CONTROL SYSTEM FOR THIS DAP PASS:
// PORT: Fixed ROM slots 17476.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:52
//		TCF	GOTOGTS		#	GTS (ALTERNATES WITH RCS WHEN DOCKED)
// PORT: Fixed ROM slots 17477.
                            if slot <> 17477 or instruction <> 5511 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5511, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:53
//		TCF	TRYGTS		#	GTS IF ALLOWED, OTHERWISE RCS
// PORT: Fixed ROM slots 17478.
                            if slot <> 17478 or instruction <> 5500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5500, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17479 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:54
//RCS		CAF	ZERO		#	RCS (TRYGTS MAY BRANCH TO HERE)
// PORT: Fixed ROM slots 17479.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:55
//		TS	COTROLER
// PORT: Fixed ROM slots 17480.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:56
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:57
//		DXCH	EDOTQ
// PORT: Fixed ROM slots 17481.
                            if slot <> 17481 or instruction <> 22303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 799, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:58
//		TC	ROT-TOUV
// PORT: Fixed ROM slots 17482.
                            if slot <> 17482 or instruction <> 1638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17483 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:59
//		DXCH	OMEGAU
// PORT: Fixed ROM slots 17483.
                            if slot <> 17483 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:60
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:61
//# X - TRANSLATION
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:62
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:63
//# INPUT:	BITS 7,8 OF CH31 (TRANSLATION CONTROLLER)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:64
//#		ULLAGER
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:65
//#		APSFLAG, DRIFTBIT
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:66
//#		ACC40R2X, ACRBTRAN
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:67
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:68
//# OUTPUT:	NEXTU, NEXTV	CODES OF TRANSLATION FOR AFTER ROTATION
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:69
//#		SENSETYP	TELL ROTATION DIRECTION AND DESIRE
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:70
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:71
//# X-TRANS POLICIES ARE EITHER 4 JETS OR A DIAGONAL PAIR.  IN 2-JET TRANSLATION THE SYSTEM IS SPECIFIED.  A FAILURE
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:72
//# WILL OVERRIDE THIS SPECIFICATION.  AN ALARM RESULTS WHEN NO POLICY IS AVAILABLE BECAUSE OF FAILURES.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:73
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:74
//SENSEGET	CA	BIT7		# INPUT BITS OVERRIDE THE INTERNAL BITS
// PORT: Fixed ROM slots 17484.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:75
//		EXTEND			# SENSETYP WILL NOT OPPOSE ANYTRANS
// PORT: Fixed ROM slots 17485.
                            if slot <> 17485 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:76
//		RAND	CHAN31
// PORT: Fixed ROM slots 17486.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:77
//		EXTEND
// PORT: Fixed ROM slots 17487.
                            if slot <> 17487 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:78
//		BZF	+X0RULGE
// PORT: Fixed ROM slots 17488.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:79
//# Page 1443
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:80
//		CA	BIT8
// PORT: Fixed ROM slots 17489.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:81
//		EXTEND
// PORT: Fixed ROM slots 17490.
                            if slot <> 17490 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17491 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:82
//		RAND	CHAN31
// PORT: Fixed ROM slots 17491.
                            if slot <> 17491 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:83
//		EXTEND
// PORT: Fixed ROM slots 17492.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:84
//		BZF	-XTRANS
// PORT: Fixed ROM slots 17493.
                            if slot <> 17493 or instruction <> 5223 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5223, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:85
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:86
//		CA	ULLAGER
// PORT: Fixed ROM slots 17494.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:87
//		MASK	DAPBOOLS
// PORT: Fixed ROM slots 17495.
                            if slot <> 17495 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:88
//		CCS	A
// PORT: Fixed ROM slots 17496.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:89
//		TCF	+X0RULGE
// PORT: Fixed ROM slots 17497.
                            if slot <> 17497 or instruction <> 5222 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5222, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:90
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:91
//		TS	NEXTU		# STORE NULL TRANSLATION POLICIES
// PORT: Fixed ROM slots 17498.
                            if slot <> 17498 or instruction <> 23355 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23355, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17499 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:92
//		TS	NEXTV
// PORT: Fixed ROM slots 17499.
                            if slot <> 17499 or instruction <> 23356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:93
//		CS	DAPBOOLS	# BURNING OR DRIFTING?
// PORT: Fixed ROM slots 17500.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:94
//		MASK	DRIFTBIT
// PORT: Fixed ROM slots 17501.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:95
//		EXTEND
// PORT: Fixed ROM slots 17502.
                            if slot <> 17502 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17503 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:96
//		BZF	TSENSE
// PORT: Fixed ROM slots 17503.
                            if slot <> 17503 or instruction <> 5220 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5220, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:97
//		CA	FLGWRD10	# DPS (INCLUDING DOCKED) OR APS?
// PORT: Fixed ROM slots 17504.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:98
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 17505.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:99
//		CCS	A
// PORT: Fixed ROM slots 17506.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:100
//		CAF	TWO		# FAVOR +X JETS DURING AN APS BURN.
// PORT: Fixed ROM slots 17507.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:101
//TSENSE		TS	SENSETYP
// PORT: Fixed ROM slots 17508.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:102
//		TCF	QRCONTRL
// PORT: Fixed ROM slots 17509.
                            if slot <> 17509 or instruction <> 5248 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5248, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:103
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:104
//+X0RULGE	CAF	ONE
// PORT: Fixed ROM slots 17510.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:105
//-XTRANS		AD	FOUR
// PORT: Fixed ROM slots 17511.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:106
//		TS	ROTINDEX
// PORT: Fixed ROM slots 17512.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:107
//		AD	NEG3
// PORT: Fixed ROM slots 17513.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:108
//		TS	SENSETYP	# FAVOR APPROPRIATE JETS DURING TRANS.
// PORT: Fixed ROM slots 17514.
                            if slot <> 17514 or instruction <> 23360 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23360, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17515 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:109
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 17515.
                            if slot <> 17515 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:110
//		MASK	ACC4OR2X
// PORT: Fixed ROM slots 17516.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:111
//		CCS	A
// PORT: Fixed ROM slots 17517.
                            if slot <> 17517 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:112
//		TCF	TRANS4
// PORT: Fixed ROM slots 17518.
                            if slot <> 17518 or instruction <> 5329 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5329, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17519 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:113
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:114
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 17519.
                            if slot <> 17519 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:115
//		MASK	AORBTRAN
// PORT: Fixed ROM slots 17520.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:116
//		CCS	A
// PORT: Fixed ROM slots 17521.
                            if slot <> 17521 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:117
//		CA	ONE		# THREE FOR B
// PORT: Fixed ROM slots 17522.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:118
//		AD	TWO		# TWO FOR A SYSTEM 2 JET X TRANS
// PORT: Fixed ROM slots 17523.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:119
//TSNUMBRT	TS	NUMBERT
// PORT: Fixed ROM slots 17524.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:120
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:121
//		TC	SELCTSUB
// PORT: Fixed ROM slots 17525.
                            if slot <> 17525 or instruction <> 1659 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1659, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:122
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:123
//		CCS	POLYTEMP
// PORT: Fixed ROM slots 17526.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:124
//		TCF	+3
// PORT: Fixed ROM slots 17527.
                            if slot <> 17527 or instruction <> 5242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5242, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:125
//		TC	ALARM
// PORT: Fixed ROM slots 17528.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:126
//		OCT	02002
// PORT: Fixed ROM slots 17529.
    17529, 2052
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17530–17546.
function agcAotUnit1045 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17537 {
        if slot <= 17533 {
            if slot <= 17531 {
                if slot <= 17530 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:127
//		CA	00314OCT
// PORT: Fixed ROM slots 17530.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:128
//		MASK	POLYTEMP
// PORT: Fixed ROM slots 17531.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:129
//TSNEXTS		TS	NEXTU
// PORT: Fixed ROM slots 17532.
                    if slot <> 17532 or instruction <> 23355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23355, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:130
//# Page 1444
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:131
//		CS	00314OCT
// PORT: Fixed ROM slots 17533.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:132
//		MASK	POLYTEMP
// PORT: Fixed ROM slots 17534.
                    if slot <> 17534 or instruction <> 29665 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 993).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:133
//		TS	NEXTV
// PORT: Fixed ROM slots 17535.
                    if slot <> 17535 or instruction <> 23356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23356, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17536 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:134
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:135
//# Q,R-AXES RCS CONTROL MODE SELECTION
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:136
//#	SWITCHES	INDICATION WHEN SET
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:137
//#	BIT13/CHAN31	AUTO, GO TO ATTSTEER
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:138
//#	PULSES		MINIMUM IMPULSE MODE
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:139
//#	(OTHERWISE)	RATE COMMAND/ATTITUDE HOLD MODE
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:140
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:141
//QRCONTRL	CA	BIT13		# CHECK MODE SELECT SWITCH.
// PORT: Fixed ROM slots 17536.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:142
//		EXTEND
// PORT: Fixed ROM slots 17537.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:143
//		RAND	CHAN31		# BITS INVERTED
// PORT: Fixed ROM slots 17538.
                    if slot <> 17538 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:144
//		CCS	A
// PORT: Fixed ROM slots 17539.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:145
//		TCF	ATTSTEER
// PORT: Fixed ROM slots 17540.
                    if slot <> 17540 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:146
//CHKBIT10	CAF	PULSES		# PULSES = 1 FOR MIN IMP USE OF RHC
// PORT: Fixed ROM slots 17541.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:147
//		MASK	DAPBOOLS
// PORT: Fixed ROM slots 17542.
                    if slot <> 17542 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:148
//		EXTEND
// PORT: Fixed ROM slots 17543.
                    if slot <> 17543 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17544 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:149
//		BZF	CHEKSTIK	# IN ATT-HOLD/RATE-COMMAND IF BIT10=0
// PORT: Fixed ROM slots 17544.
                    if slot <> 17544 or instruction <> 5331 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5331, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17545 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:150
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:151
//# MINIMUM IMPULSE MODE
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:152
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:153
//		INHINT
// PORT: Fixed ROM slots 17545.
                        if slot <> 17545 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:154
//		TC	IBNKCALL
// PORT: Fixed ROM slots 17546.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:155
//		CADR	ZATTEROR
// PORT: Fixed ROM slots 17547.
    17547, 32982
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17548–17595.
function agcAotUnit1046 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17571 {
        if slot <= 17559 {
            if slot <= 17553 {
                if slot <= 17550 {
                    if slot <= 17548 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:156
//		CA	ZERO
// PORT: Fixed ROM slots 17548.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:157
//		TS	QERROR
// PORT: Fixed ROM slots 17549.
                            if slot <> 17549 or instruction <> 23336 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23336, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:158
//		TS	RERROR		# FOR DISPLAYS
// PORT: Fixed ROM slots 17550.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:159
//		RELINT
// PORT: Fixed ROM slots 17551.
                        if slot <> 17551 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17552 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:160
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:161
//		EXTEND
// PORT: Fixed ROM slots 17552.
                            if slot <> 17552 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:162
//		READ	CHAN31
// PORT: Fixed ROM slots 17553.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:163
//		TS	TEMP31		# IS EQUAL TO DAPTEMP1
// PORT: Fixed ROM slots 17554.
                        if slot <> 17554 or instruction <> 23519 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23519, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17555 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:164
//		CCS	OLDQRMIN
// PORT: Fixed ROM slots 17555.
                            if slot <> 17555 or instruction <> 4913 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 817).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:165
//		TCF	CHECKIN
// PORT: Fixed ROM slots 17556.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:166
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:167
//FIREQR		CA	TEMP31
// PORT: Fixed ROM slots 17557.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:168
//		MASK	BIT1
// PORT: Fixed ROM slots 17558.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:169
//		EXTEND
// PORT: Fixed ROM slots 17559.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:170
//		BZF	+QMIN
// PORT: Fixed ROM slots 17560.
                        if slot <> 17560 or instruction <> 5290 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17561 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:171
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:172
//		CA	TEMP31
// PORT: Fixed ROM slots 17561.
                            if slot <> 17561 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:173
//		MASK	BIT2
// PORT: Fixed ROM slots 17562.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:174
//		EXTEND
// PORT: Fixed ROM slots 17563.
                        if slot <> 17563 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17564 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:175
//		BZF	-QMIN
// PORT: Fixed ROM slots 17564.
                            if slot <> 17564 or instruction <> 5294 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:176
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:177
//		CA	TEMP31
// PORT: Fixed ROM slots 17565.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:178
//		MASK	BIT5
// PORT: Fixed ROM slots 17566.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:179
//# Page 1445
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:180
//		EXTEND
// PORT: Fixed ROM slots 17567.
                            if slot <> 17567 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:181
//		BZF	+RMIN
// PORT: Fixed ROM slots 17568.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:182
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:183
//		CA	TEMP31
// PORT: Fixed ROM slots 17569.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:184
//		MASK	BIT6
// PORT: Fixed ROM slots 17570.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:185
//		EXTEND
// PORT: Fixed ROM slots 17571.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:186
//		BZF	-RMIN
// PORT: Fixed ROM slots 17572.
                        if slot <> 17572 or instruction <> 5300 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5300, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17573 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:187
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:188
//		TCF	XTRANS
// PORT: Fixed ROM slots 17573.
                            if slot <> 17573 or instruction <> 5683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:189
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:190
//CHECKIN		CS	TEMP31
// PORT: Fixed ROM slots 17574.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:191
//		MASK	OCT63
// PORT: Fixed ROM slots 17575.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:192
//		TS	OLDQRMIN
// PORT: Fixed ROM slots 17576.
                            if slot <> 17576 or instruction <> 23345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:193
//		TCF	XTRANS
// PORT: Fixed ROM slots 17577.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:194
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:195
//+QMIN		CA	14MS
// PORT: Fixed ROM slots 17578.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:196
//		TS	TJU
// PORT: Fixed ROM slots 17579.
                            if slot <> 17579 or instruction <> 23381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23381, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:197
//		CS	14MS
// PORT: Fixed ROM slots 17580.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:198
//		TCF	MINQR
// PORT: Fixed ROM slots 17581.
                        if slot <> 17581 or instruction <> 5302 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5302, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17582 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:199
//-QMIN		CS	14MS
// PORT: Fixed ROM slots 17582.
                            if slot <> 17582 or instruction <> 17991 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:200
//		TS	TJU
// PORT: Fixed ROM slots 17583.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:201
//		CA	14MS
// PORT: Fixed ROM slots 17584.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:202
//		TCF	MINQR
// PORT: Fixed ROM slots 17585.
                            if slot <> 17585 or instruction <> 5302 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5302, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:203
//+RMIN		CA	14MS
// PORT: Fixed ROM slots 17586.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:204
//		TCF	+2
// PORT: Fixed ROM slots 17587.
                        if slot <> 17587 or instruction <> 5301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5301, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17588 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:205
//-RMIN		CS	14MS
// PORT: Fixed ROM slots 17588.
                            if slot <> 17588 or instruction <> 17991 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:206
//		TS	TJU
// PORT: Fixed ROM slots 17589.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:207
//MINQR		TS	TJV
// PORT: Fixed ROM slots 17590.
                        if slot <> 17590 or instruction <> 23382 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23382, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17591 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:208
//		CA	MINADR
// PORT: Fixed ROM slots 17591.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:209
//		TS	RETJADR
// PORT: Fixed ROM slots 17592.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:210
//		CA	ONE
// PORT: Fixed ROM slots 17593.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:211
//		TS	OLDQRMIN
// PORT: Fixed ROM slots 17594.
                            if slot <> 17594 or instruction <> 23345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:212
//MINRTN		TS	AXISCTR
// PORT: Fixed ROM slots 17595.
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

// PORT: Physical bank 17. Shared continuation entries, slots 17596–17600.
function agcAotUnit1047 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17597 {
        if slot <= 17596 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:213
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 17596.
            if slot <> 17596 or instruction <> 12361 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 73).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:214
//		MASK	CSMDOCKD
// PORT: Fixed ROM slots 17597.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:215
//		EXTEND
// PORT: Fixed ROM slots 17598.
            if slot <> 17598 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17599 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:216
//		BZF	MIMRET
// PORT: Fixed ROM slots 17599.
                if slot <> 17599 or instruction <> 5319 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:217
//		INDEX	AXISCTR		# IF DOCKED, USE 60MS MINIMUM IMPULSE
// PORT: Fixed ROM slots 17600.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:218
//		CCS	TJU
// PORT: Fixed ROM slots 17601.
    17601, 9898
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17602–17605.
function agcAotUnit1048 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17603 {
        if slot <= 17602 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:219
//		CA	60MS
// PORT: Fixed ROM slots 17602.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:220
//		TCF	+2
// PORT: Fixed ROM slots 17603.
            if slot <> 17603 or instruction <> 5317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17604 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:221
//		CS	60MS
// PORT: Fixed ROM slots 17604.
            if slot <> 17604 or instruction <> 17614 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1230), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:222
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17605.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:223
//		TS	TJU
// PORT: Fixed ROM slots 17606.
    17606, 46762
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17607–17613.
function agcAotUnit1049 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17609 {
        if slot <= 17607 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:224
//MIMRET		CA	DAPBOOLS
// PORT: Fixed ROM slots 17607.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:225
//		MASK	AORBTRAN
// PORT: Fixed ROM slots 17608.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:226
//		CCS	A
// PORT: Fixed ROM slots 17609.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:227
//		CA	ONE
// PORT: Fixed ROM slots 17610.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:228
//		AD	TWO
// PORT: Fixed ROM slots 17611.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:229
//		TS	NUMBERT
// PORT: Fixed ROM slots 17612.
                if slot <> 17612 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:230
//# Page 1446
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:231
//		TCF	AFTERTJ
// PORT: Fixed ROM slots 17613.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:232
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:233
//60MS		DEC	96		# RSB 2009 -- was 96.0.
// PORT: Fixed ROM slots 17614.
    17614, 192,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:234
//MINADR		GENADR	MINRTN
// PORT: Fixed ROM slots 17615.
    17615, 2422,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:235
//OCT63		OCT	63
// PORT: Fixed ROM slots 17616.
    17616, 102
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17617–17633.
function agcAotUnit1050 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17624 {
        if slot <= 17620 {
            if slot <= 17618 {
                if slot <= 17617 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:236
//14MS		=	+TJMINT6
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:237
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:238
//TRANS4		CA	FOUR
// PORT: Fixed ROM slots 17617.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:239
//		TCF	TSNUMBRT
// PORT: Fixed ROM slots 17618.
                    if slot <> 17618 or instruction <> 5236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5236, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17619 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:240
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:241
//# RATE COMMAND MODE:
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:242
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:243
//# DESCRIPTION (SAME AS P-AXIS)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:244
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:245
//CHEKSTIK	TS	INGTS		# NOT IN GTS WHEN IN ATT HOLD
// PORT: Fixed ROM slots 17619.
                    if slot <> 17619 or instruction <> 23451 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23451, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:246
//		CS	ONE		# 1/ACCS WILL DO THE NULLING DRIVES
// PORT: Fixed ROM slots 17620.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:247
//		TS	COTROLER	# COME BACK TO RCS NEXT TIME
// PORT: Fixed ROM slots 17621.
                    if slot <> 17621 or instruction <> 23449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:248
//		CA	BIT15
// PORT: Fixed ROM slots 17622.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:249
//		MASK	CH31TEMP
// PORT: Fixed ROM slots 17623.
                    if slot <> 17623 or instruction <> 29475 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 803).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:250
//		EXTEND
// PORT: Fixed ROM slots 17624.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:251
//		BZF	RHCACTIV	# BRANCH IF OUT OF DETENT.
// PORT: Fixed ROM slots 17625.
                    if slot <> 17625 or instruction <> 5352 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5352, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:252
//		CA	OURRCBIT	# ***********
// PORT: Fixed ROM slots 17626.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:253
//		MASK	DAPBOOLS	# *IN DETENT*	CHECK FOR MANUAL CONTROL
// PORT: Fixed ROM slots 17627.
                    if slot <> 17627 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:254
//		EXTEND			# ***********	LAST TIME.
// PORT: Fixed ROM slots 17628.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:255
//		BZF	STILLRCS
// PORT: Fixed ROM slots 17629.
                    if slot <> 17629 or instruction <> 5553 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:256
//		CS	BIT9
// PORT: Fixed ROM slots 17630.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:257
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 17631.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:258
//		TS	RCSFLAGS	# BIT 9 IS 0.
// PORT: Fixed ROM slots 17632.
                        if slot <> 17632 or instruction <> 23227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:259
//		TCF	DAMPING
// PORT: Fixed ROM slots 17633.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:260
//40CYCL		OCT	50
// PORT: Fixed ROM slots 17634.
    17634, 80,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:261
//1/10S		OCT	1
// PORT: Fixed ROM slots 17635.
    17635, 2,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:262
//LINRAT		DEC	46
// PORT: Fixed ROM slots 17636.
    17636, 92
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17637–17706.
function agcAotUnit1051 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17671 {
        if slot <= 17653 {
            if slot <= 17644 {
                if slot <= 17640 {
                    if slot <= 17638 {
                        if slot <= 17637 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:263
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:264
//# ===========================================================
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:265
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:266
//DAMPING		CA	ZERO
// PORT: Fixed ROM slots 17637.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:267
//		TS	SAVEHAND
// PORT: Fixed ROM slots 17638.
                            if slot <> 17638 or instruction <> 23346 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23346, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17639 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:268
//		TS	SAVEHAND +1
// PORT: Fixed ROM slots 17639.
                            if slot <> 17639 or instruction <> 23347 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23347, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:269
//RHCACTIV	CCS	SAVEHAND	# ******************
// PORT: Fixed ROM slots 17640.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:270
//		TCF	+3		# Q,R MANUAL CONTROL	WC = A*(B+|D|)*D
// PORT: Fixed ROM slots 17641.
                            if slot <> 17641 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:271
//		TCF	+2		# ******************
// PORT: Fixed ROM slots 17642.
                            if slot <> 17642 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17643 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:272
//		TCF	+1
// PORT: Fixed ROM slots 17643.
                            if slot <> 17643 or instruction <> 5356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5356, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:273
//		DOUBLE			# WHERE
// PORT: Fixed ROM slots 17644.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:274
//		DOUBLE			#
// PORT: Fixed ROM slots 17645.
                            if slot <> 17645 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:275
//		AD	LINRAT		# 	WC  = COMMANDED ROTATIONAL RATE
// PORT: Fixed ROM slots 17646.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:276
//		EXTEND			#	A   = QUADRATIC SENSITIVITY FACTOR
// PORT: Fixed ROM slots 17647.
                            if slot <> 17647 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:277
//		MP	SAVEHAND	#	B   = LINEAR/QUADRATIC SENSITIVITY
// PORT: Fixed ROM slots 17648.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:278
//		CA	L		#	|D| = ABS. VALUE OF DEFLECTION
// PORT: Fixed ROM slots 17649.
                            if slot <> 17649 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:279
//		EXTEND			#	D   = HAND CONTROLLER DEFLECTION
// PORT: Fixed ROM slots 17650.
                            if slot <> 17650 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17651 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:280
//		MP	STIKSENS
// PORT: Fixed ROM slots 17651.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:281
//		XCH	QLAST		# COMMAND Q RATE, SCALED 45 DEG/SEC
// PORT: Fixed ROM slots 17652.
                                if slot <> 17652 or instruction <> 24365 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 813, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:282
//		COM
// PORT: Fixed ROM slots 17653.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:283
//# Page 1447
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:284
//		AD	QLAST
// PORT: Fixed ROM slots 17654.
                            if slot <> 17654 or instruction <> 25389 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 813).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:285
//		TS	DAPTEMP3
// PORT: Fixed ROM slots 17655.
                            if slot <> 17655 or instruction <> 23521 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23521, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17656 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:286
//		CCS	SAVEHAND +1
// PORT: Fixed ROM slots 17656.
                            if slot <> 17656 or instruction <> 4915 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 819).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:287
//		TCF	+3
// PORT: Fixed ROM slots 17657.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:288
//		TCF	+2
// PORT: Fixed ROM slots 17658.
                            if slot <> 17658 or instruction <> 5372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:289
//		TCF	+1
// PORT: Fixed ROM slots 17659.
                            if slot <> 17659 or instruction <> 5372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5372, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17660 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:290
//		DOUBLE
// PORT: Fixed ROM slots 17660.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:291
//		DOUBLE
// PORT: Fixed ROM slots 17661.
                                if slot <> 17661 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:292
//		AD	LINRAT
// PORT: Fixed ROM slots 17662.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:293
//		EXTEND
// PORT: Fixed ROM slots 17663.
                            if slot <> 17663 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:294
//		MP	SAVEHAND +1
// PORT: Fixed ROM slots 17664.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:295
//		CA	L
// PORT: Fixed ROM slots 17665.
                            if slot <> 17665 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:296
//		EXTEND
// PORT: Fixed ROM slots 17666.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:297
//		MP	STIKSENS
// PORT: Fixed ROM slots 17667.
                            if slot <> 17667 or instruction <> 29476 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 804, readEffective:call(words, 804)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:298
//		XCH	RLAST
// PORT: Fixed ROM slots 17668.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:299
//		COM
// PORT: Fixed ROM slots 17669.
                            if slot <> 17669 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17670 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:300
//		AD	RLAST
// PORT: Fixed ROM slots 17670.
                                if slot <> 17670 or instruction <> 25390 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 814).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:301
//		TS	DAPTEMP4
// PORT: Fixed ROM slots 17671.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:302
//		CS	QLAST		# INTERVAL.
// PORT: Fixed ROM slots 17672.
                            if slot <> 17672 or instruction <> 17197 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 813).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:303
//		AD	OMEGAQ
// PORT: Fixed ROM slots 17673.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:304
//		TS	QRATEDIF
// PORT: Fixed ROM slots 17674.
                            if slot <> 17674 or instruction <> 23326 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23326, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:305
//		CS	RLAST
// PORT: Fixed ROM slots 17675.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:306
//		AD	OMEGAR
// PORT: Fixed ROM slots 17676.
                            if slot <> 17676 or instruction <> 25363 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 787).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:307
//		TS	RRATEDIF
// PORT: Fixed ROM slots 17677.
                            if slot <> 17677 or instruction <> 23327 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23327, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17678 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:308
//ENTERQR		DXCH	QRATEDIF	# TRANSFORM RATES FROM Q,R TO U,V AXES
// PORT: Fixed ROM slots 17678.
                            if slot <> 17678 or instruction <> 22303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 799, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:309
//		TC	ROT-TOUV
// PORT: Fixed ROM slots 17679.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:310
//		DXCH	URATEDIF
// PORT: Fixed ROM slots 17680.
                            if slot <> 17680 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:311
//		CCS	DAPTEMP3	# CHECK IF Q COMMAND CHANGE EXCEEDS
// PORT: Fixed ROM slots 17681.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:312
//		TC	+3		# BREAKOUT LEVEL.  IF NOT, CHECK R.
// PORT: Fixed ROM slots 17682.
                            if slot <> 17682 or instruction <> 1301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1301, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:313
//		TC	+2
// PORT: Fixed ROM slots 17683.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:314
//		TC	+1
// PORT: Fixed ROM slots 17684.
                            if slot <> 17684 or instruction <> 1301 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1301, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:315
//		AD	-RATEDB
// PORT: Fixed ROM slots 17685.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:316
//		EXTEND
// PORT: Fixed ROM slots 17686.
                            if slot <> 17686 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17687 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:317
//		BZMF	+2
// PORT: Fixed ROM slots 17687.
                                if slot <> 17687 or instruction <> 25881 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25881, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:318
//		TCF	ENTERUV -2	# BREAKOUT LEVEL EXCEEDED.  DIRECT RATE.
// PORT: Fixed ROM slots 17688.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:319
//		CCS	DAPTEMP4	# R COMMAND BREAKOUT CHECK.
// PORT: Fixed ROM slots 17689.
                            if slot <> 17689 or instruction <> 5090 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:320
//		TC	+3
// PORT: Fixed ROM slots 17690.
                            if slot <> 17690 or instruction <> 1309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17691 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:321
//		TC	+2
// PORT: Fixed ROM slots 17691.
                            if slot <> 17691 or instruction <> 1309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:322
//		TC	+1
// PORT: Fixed ROM slots 17692.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:323
//		AD	-RATEDB
// PORT: Fixed ROM slots 17693.
                            if slot <> 17693 or instruction <> 25406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 830).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:324
//		EXTEND
// PORT: Fixed ROM slots 17694.
                            if slot <> 17694 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17695 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:325
//		BZMF	+2
// PORT: Fixed ROM slots 17695.
                            if slot <> 17695 or instruction <> 25889 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25889, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17696 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:326
//		TCF	ENTERUV -2	# BREAKOUT LEVEL EXCEEDED.  DIRECT RATE.
// PORT: Fixed ROM slots 17696.
                                if slot <> 17696 or instruction <> 5415 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5415, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:327
//		CA	RCSFLAGS	# BREAKOUT LEVEL NOT EXCEEDED.  CHECK FOR
// PORT: Fixed ROM slots 17697.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:328
//		MASK	QRBIT		# DIRECT RATE CONTROL LAST TIME.
// PORT: Fixed ROM slots 17698.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:329
//		EXTEND
// PORT: Fixed ROM slots 17699.
                            if slot <> 17699 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 17700 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:330
//		BZF	+2
// PORT: Fixed ROM slots 17700.
                            if slot <> 17700 or instruction <> 5414 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5414, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:331
//		TCF	ENTERUV		# CONTINUE DIRECT RATE CONTROL.
// PORT: Fixed ROM slots 17701.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:332
//		TCF	STILLRCS	# PSEUDO-AUTO CONTROL.
// PORT: Fixed ROM slots 17702.
                            if slot <> 17702 or instruction <> 5553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5553, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:333
//		CA	40CYCL
// PORT: Fixed ROM slots 17703.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:334
//# Page 1448
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:335
//		TS	TCQR
// PORT: Fixed ROM slots 17704.
                            if slot <> 17704 or instruction <> 23343 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23343, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17705 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:336
//ENTERUV		INHINT			# DIRECT RATE CONTROL
// PORT: Fixed ROM slots 17705.
                                if slot <> 17705 or instruction <> 4 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:337
//		TC	IBNKCALL
// PORT: Fixed ROM slots 17706.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:338
//		FCADR	ZATTEROR
// PORT: Fixed ROM slots 17707.
    17707, 32982
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17708–17732.
function agcAotUnit1052 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17719 {
        if slot <= 17713 {
            if slot <= 17710 {
                if slot <= 17708 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:339
//		RELINT
// PORT: Fixed ROM slots 17708.
                    if slot <> 17708 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17709 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:340
//		CA	ZERO
// PORT: Fixed ROM slots 17709.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:341
//		TS	DYERROR
// PORT: Fixed ROM slots 17710.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:342
//		TS	DYERROR +1
// PORT: Fixed ROM slots 17711.
                    if slot <> 17711 or instruction <> 23337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17712 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:343
//		TS	DZERROR
// PORT: Fixed ROM slots 17712.
                        if slot <> 17712 or instruction <> 23338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:344
//		TS	DZERROR +1
// PORT: Fixed ROM slots 17713.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:345
//		CCS	URATEDIF
// PORT: Fixed ROM slots 17714.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:346
//		TCF	+3
// PORT: Fixed ROM slots 17715.
                        if slot <> 17715 or instruction <> 5430 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5430, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:347
//		TCF	+2
// PORT: Fixed ROM slots 17716.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:348
//		TCF	+1
// PORT: Fixed ROM slots 17717.
                    if slot <> 17717 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17718 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:349
//		AD	TARGETDB	# IF TARGET DB IS EXCEEDED, CONTINUE
// PORT: Fixed ROM slots 17718.
                        if slot <> 17718 or instruction <> 25406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 830).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:350
//		EXTEND			# DIRECT RATE CONTROL.
// PORT: Fixed ROM slots 17719.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:351
//		BZMF	VDB
// PORT: Fixed ROM slots 17720.
                    if slot <> 17720 or instruction <> 25924 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25924, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17721 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:352
//		CCS	VRATEDIF
// PORT: Fixed ROM slots 17721.
                        if slot <> 17721 or instruction <> 4887 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:353
//		TCF	+3
// PORT: Fixed ROM slots 17722.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:354
//		TCF	+2
// PORT: Fixed ROM slots 17723.
                    if slot <> 17723 or instruction <> 5437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5437, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17724 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:355
//		TCF	+1
// PORT: Fixed ROM slots 17724.
                        if slot <> 17724 or instruction <> 5437 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5437, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:356
//		AD	TARGETDB
// PORT: Fixed ROM slots 17725.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:357
//		EXTEND
// PORT: Fixed ROM slots 17726.
                    if slot <> 17726 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17727 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:358
//		BZMF	+2
// PORT: Fixed ROM slots 17727.
                        if slot <> 17727 or instruction <> 25921 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25921, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:359
//		TCF	QRTIME
// PORT: Fixed ROM slots 17728.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:360
//		CA	ZERO
// PORT: Fixed ROM slots 17729.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:361
//		TS	VRATEDIF
// PORT: Fixed ROM slots 17730.
                        if slot <> 17730 or instruction <> 23319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17731 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:362
//		TCF	QRTIME
// PORT: Fixed ROM slots 17731.
                        if slot <> 17731 or instruction <> 5453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5453, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:363
//VDB		CCS	VRATEDIF
// PORT: Fixed ROM slots 17732.
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

// PORT: Physical bank 17. Shared continuation entries, slots 17733–17757.
function agcAotUnit1053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17744 {
        if slot <= 17738 {
            if slot <= 17735 {
                if slot <= 17733 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:364
//		TC	+3
// PORT: Fixed ROM slots 17733.
                    if slot <> 17733 or instruction <> 1352 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1352, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17734 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:365
//		TC	+2
// PORT: Fixed ROM slots 17734.
                        if slot <> 17734 or instruction <> 1352 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1352, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:366
//		TC	+1
// PORT: Fixed ROM slots 17735.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:367
//		AD	TARGETDB	# IF TARGET DB IS EXCEEDED, CONTINUE
// PORT: Fixed ROM slots 17736.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:368
//		EXTEND			# DIRECT RATE CONTROL.  IF NOT, FIRE AND
// PORT: Fixed ROM slots 17737.
                        if slot <> 17737 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:369
//		BZMF	TOPSEUDO	# SWITCH TO PSEUDO-AUTO CONTROL ON NEXT
// PORT: Fixed ROM slots 17738.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:370
//		CA	ZERO		# PASS.
// PORT: Fixed ROM slots 17739.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:371
//		TS	URATEDIF
// PORT: Fixed ROM slots 17740.
                        if slot <> 17740 or instruction <> 23318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23318, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:372
//QRTIME		CA	TCQR		# DIRECT RATE TIME CHECK.
// PORT: Fixed ROM slots 17741.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:373
//		EXTEND
// PORT: Fixed ROM slots 17742.
                    if slot <> 17742 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17743 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:374
//		BZMF	+5		# BRANCH IF TIME EXCEEDS 4 SEC.
// PORT: Fixed ROM slots 17743.
                        if slot <> 17743 or instruction <> 25940 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25940, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:375
//		CS	RCSFLAGS
// PORT: Fixed ROM slots 17744.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:376
//		MASK	QRBIT
// PORT: Fixed ROM slots 17745.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:377
//		ADS	RCSFLAGS	# BIT 11 IS 1.
// PORT: Fixed ROM slots 17746.
                        if slot <> 17746 or instruction <> 11963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:378
//		TC	+4
// PORT: Fixed ROM slots 17747.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:379
//TOPSEUDO	CS	QRBIT
// PORT: Fixed ROM slots 17748.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:380
//		MASK	RCSFLAGS
// PORT: Fixed ROM slots 17749.
                        if slot <> 17749 or instruction <> 29371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:381
//		TS	RCSFLAGS	# BIT 11 IS 0.
// PORT: Fixed ROM slots 17750.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:382
//		CA	HANDADR
// PORT: Fixed ROM slots 17751.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:383
//		TS	RETJADR
// PORT: Fixed ROM slots 17752.
                        if slot <> 17752 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:384
//		CA	ONE
// PORT: Fixed ROM slots 17753.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:385
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:386
//# Page 1449
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:387
//BACKHAND	TS	AXISCTR
// PORT: Fixed ROM slots 17754.
                        if slot <> 17754 or instruction <> 23365 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23365, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:388
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:389
//		CA	FOUR
// PORT: Fixed ROM slots 17755.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:390
//		TS	NUMBERT
// PORT: Fixed ROM slots 17756.
                        if slot <> 17756 or instruction <> 23523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23523, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:391
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:392
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17757.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:393
//		INDEX	SKIPU
// PORT: Fixed ROM slots 17758.
    17758, 42682,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:394
//		TCF	+1
// PORT: Fixed ROM slots 17759.
    17759, 10944
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17760–17761.
function agcAotUnit1054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17760 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:395
//		CA	FOUR
// PORT: Fixed ROM slots 17760.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:396
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17761.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:397
//		TS	SKIPU
// PORT: Fixed ROM slots 17762.
    17762, 46778
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17763–17764.
function agcAotUnit1055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17763 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:398
//		TCF	LOOPER
// PORT: Fixed ROM slots 17763.
        if slot <> 17763 or instruction <> 5637 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5637, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:399
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:400
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17764.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:401
//		CCS	URATEDIF	#	INDEX	AXIS	QUANTITY
// PORT: Fixed ROM slots 17765.
    17765, 9772
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17766–17769.
function agcAotUnit1056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17767 {
        if slot <= 17766 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:402
//		CA	ZERO		#	0	-U	1/JETACC-AOSU
// PORT: Fixed ROM slots 17766.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:403
//		TCF	+2		#	1	+U	1/JETACC+AOSU
// PORT: Fixed ROM slots 17767.
            if slot <> 17767 or instruction <> 5481 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5481, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17768 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:404
//		CA	ONE		#	16	-V	1/JETACC-AOSV
// PORT: Fixed ROM slots 17768.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:405
//		INDEX	AXISCTR		#	17	+V	1/JETACC+AOSV
// PORT: Fixed ROM slots 17769.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:406
//		AD	AXISDIFF	# JETACC = 2 JET ACCELERATION (1 FOR FAIL)
// PORT: Fixed ROM slots 17770.
    17770, 53156
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17771–17771.
function agcAotUnit1057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:407
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:408
//		INDEX	A
// PORT: Fixed ROM slots 17771.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:409
//		CS	1/ANET2 +1
// PORT: Fixed ROM slots 17772.
    17772, 34546
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17773–17774.
function agcAotUnit1058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17773 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:410
//		EXTEND
// PORT: Fixed ROM slots 17773.
        if slot <> 17773 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:411
//		INDEX	AXISCTR		# UPRATEDIF IS SCALED AT PI/4 RAD/SEC
// PORT: Fixed ROM slots 17774.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:412
//		MP	URATEDIF	# JET TIME IN A, SCALED 32 SEC
// PORT: Fixed ROM slots 17775.
    17775, 58924
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17776–17782.
function agcAotUnit1059 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17778 {
        if slot <= 17776 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:413
//		TS	Q
// PORT: Fixed ROM slots 17776.
            if slot <> 17776 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17777 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:414
//		DAS	A
// PORT: Fixed ROM slots 17777.
                if slot <> 17777 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:415
//		AD	Q
// PORT: Fixed ROM slots 17778.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:416
//		TS	A		# OVERFLOW SKIP
// PORT: Fixed ROM slots 17779.
                if slot <> 17779 or instruction <> 22528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:417
//		TCF	+2
// PORT: Fixed ROM slots 17780.
                if slot <> 17780 or instruction <> 5494 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5494, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17781 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:418
//		CA	Q		# RIGHT SIGN AND BIGGER THAN 150MS
// PORT: Fixed ROM slots 17781.
                if slot <> 17781 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:419
//SETTIME		INDEX	AXISCTR
// PORT: Fixed ROM slots 17782.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:420
//		TS	TJU		# SCALED AT 10.67 WHICH IS CLOSE TO 10.24
// PORT: Fixed ROM slots 17783.
    17783, 46762
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17784–17786.
function agcAotUnit1060 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17784 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:421
//		TCF	AFTERTJ
// PORT: Fixed ROM slots 17784.
        if slot <> 17784 or instruction <> 5591 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5591, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17785 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:422
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:423
//ZEROTJ		CA	ZERO
// PORT: Fixed ROM slots 17785.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:424
//		TCF	SETTIME
// PORT: Fixed ROM slots 17786.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:425
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:426
//HANDADR		GENADR	BACKHAND
// PORT: Fixed ROM slots 17787.
    17787, 2740
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17788–17806.
function agcAotUnit1061 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17796 {
        if slot <= 17791 {
            if slot <= 17789 {
                if slot <= 17788 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:427
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:428
//# GTS WILL BE TRIED IF
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:429
//#	1. USEQRJTS = 0,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:430
//#	2. ALLOWGTS POS,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:431
//#	3. JETS ARE OFF (Q,R-AXES)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:432
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:433
//TRYGTS		CAF	USEQRJTS	# IS JET USE MANDATORY.		(AS LONG AS
// PORT: Fixed ROM slots 17788.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:434
//		MASK	DAPBOOLS	# USEQRJTS BIT IS NOT BIT 15, CCS IS SAFE.)
// PORT: Fixed ROM slots 17789.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:435
//		CCS	A
// PORT: Fixed ROM slots 17790.
                    if slot <> 17790 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:436
//		TCF	RCS
// PORT: Fixed ROM slots 17791.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:437
//		CCS	ALLOWGTS	# NO.  DOES AOSTASK OK CONTROL FOR GTS?
// PORT: Fixed ROM slots 17792.
                    if slot <> 17792 or instruction <> 4930 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 834).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:438
//# Page 1450
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:439
//		TCF	+2
// PORT: Fixed ROM slots 17793.
                    if slot <> 17793 or instruction <> 5507 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5507, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17794 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:440
//		TCF	RCS
// PORT: Fixed ROM slots 17794.
                    if slot <> 17794 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17795 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:441
//		EXTEND
// PORT: Fixed ROM slots 17795.
                        if slot <> 17795 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:442
//		READ	CHAN5
// PORT: Fixed ROM slots 17796.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:443
//		CCS	A
// PORT: Fixed ROM slots 17797.
                    if slot <> 17797 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:444
//		TCF	CHKINGTS
// PORT: Fixed ROM slots 17798.
                    if slot <> 17798 or instruction <> 5514 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5514, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17799 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:445
//GOTOGTS		EXTEND
// PORT: Fixed ROM slots 17799.
                    if slot <> 17799 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17800 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:446
//		DCA	GTSCADR
// PORT: Fixed ROM slots 17800.
                        if slot <> 17800 or instruction <> 13717 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1429, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:447
//		DTCB
// PORT: Fixed ROM slots 17801.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:448
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:449
//CHKINGTS	CCS	INGTS		# WAS THE TRIM GIMBAL CONTROLLING
// PORT: Fixed ROM slots 17802.
                    if slot <> 17802 or instruction <> 5019 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 923).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:450
//		TCF	+2		#	YES.  SET UP A DAMPED NULLING DRIVE.
// PORT: Fixed ROM slots 17803.
                    if slot <> 17803 or instruction <> 5517 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5517, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17804 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:451
//		TCF	RCS		#	NO.  NULLING WAS SET UP BEFORE.  DO RCS.
// PORT: Fixed ROM slots 17804.
                    if slot <> 17804 or instruction <> 5191 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5191, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17805 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:452
//		INHINT
// PORT: Fixed ROM slots 17805.
                        if slot <> 17805 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:453
//		TC	IBNKCALL
// PORT: Fixed ROM slots 17806.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:454
//		CADR	TIMEGMBL
// PORT: Fixed ROM slots 17807.
    17807, 36272
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17808–17811.
function agcAotUnit1062 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17809 {
        if slot <= 17808 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:455
//		RELINT
// PORT: Fixed ROM slots 17808.
            if slot <> 17808 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:456
//		CAF	ZERO
// PORT: Fixed ROM slots 17809.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:457
//		TS	INGTS
// PORT: Fixed ROM slots 17810.
            if slot <> 17810 or instruction <> 23451 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23451, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:458
//		TCF	RCS
// PORT: Fixed ROM slots 17811.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:459
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:460
//		EBANK=	CDUXD
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:461
//GTSCADR		2CADR	GTS
// PORT: Fixed ROM slots 17812 17813.
    17812, 3198, 17813, 34956
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17814–17850.
function agcAotUnit1063 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17831 {
        if slot <= 17822 {
            if slot <= 17817 {
                if slot <= 17815 {
                    if slot <= 17814 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:462
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:463
//# Page 1451
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:464
//# SUBROUTINE TO COMPUTE Q,R-AXES ATTITUDE ERRORS FOR USE IN THE RCS AND GTS CONTROL LAWS AND THE DISPLAYS.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:465
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:466
//QERRCALC	CAE	CDUY		# Q-ERROR CALCULATION
// PORT: Fixed ROM slots 17814.
                        if slot <> 17814 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:467
//		EXTEND
// PORT: Fixed ROM slots 17815.
                        if slot <> 17815 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17816 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:468
//		MSU	CDUYD		# CDU ANGLE -- ANGLE DESIRED (Y-AXIS)
// PORT: Fixed ROM slots 17816.
                        if slot <> 17816 or instruction <> 9118 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:469
//		TS	DAPTEMP1	# SAVE FOR RERRCALC
// PORT: Fixed ROM slots 17817.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:470
//		EXTEND
// PORT: Fixed ROM slots 17818.
                        if slot <> 17818 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:471
//		MP	M21		# (CDUY-CDUYD)*M21 SCALED AT PI RADIANS
// PORT: Fixed ROM slots 17819.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:472
//		TS	E
// PORT: Fixed ROM slots 17820.
                        if slot <> 17820 or instruction <> 23530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17821 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:473
//		CAE	CDUZ		# SECOND TERM CALCULATION:
// PORT: Fixed ROM slots 17821.
                            if slot <> 17821 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:474
//		EXTEND
// PORT: Fixed ROM slots 17822.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:475
//		MSU	CDUZD		# CDU ANGLE -ANGLE DESIRED (Z-AXIS)
// PORT: Fixed ROM slots 17823.
                        if slot <> 17823 or instruction <> 9119 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 927).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:476
//		TS	DAPTEMP2	# SAVE FOR RERRCALC
// PORT: Fixed ROM slots 17824.
                        if slot <> 17824 or instruction <> 23520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17825 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:477
//		EXTEND
// PORT: Fixed ROM slots 17825.
                        if slot <> 17825 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:478
//		MP	M22		# (CDUZ-CDUZD)*M22 SCALED AT PI RADIANS
// PORT: Fixed ROM slots 17826.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:479
//		AD	DELQEROR	# KALCMANU INERFACE ERROR
// PORT: Fixed ROM slots 17827.
                        if slot <> 17827 or instruction <> 25280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 704).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:480
//		AD	E
// PORT: Fixed ROM slots 17828.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:481
//		XCH	QERROR		# SAVE Q-ERROR FOR EIGHT-BALL DISPLAY.
// PORT: Fixed ROM slots 17829.
                        if slot <> 17829 or instruction <> 24360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 808, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17830 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:482
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:483
//RERRCALC	CAE	DAPTEMP1	# R-ERROR CALCULATION:
// PORT: Fixed ROM slots 17830.
                            if slot <> 17830 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:484
//		EXTEND			# CDU ANGLE -ANGLE DESIRED (Y-AXIS)
// PORT: Fixed ROM slots 17831.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:485
//		MP	M31		# (CDUY-CDUYD)*M31 SCALED AT PI RADIANS
// PORT: Fixed ROM slots 17832.
                        if slot <> 17832 or instruction <> 29454 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 782, readEffective:call(words, 782)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:486
//		TS	E
// PORT: Fixed ROM slots 17833.
                        if slot <> 17833 or instruction <> 23530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17834 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:487
//		CAE	DAPTEMP2	# SECOND TERM CALCULATION:
// PORT: Fixed ROM slots 17834.
                        if slot <> 17834 or instruction <> 13280 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:488
//		EXTEND			# CDU ANGLE -ANGLE DESIRED (Z-AXIS)
// PORT: Fixed ROM slots 17835.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:489
//		MP	M32		# (CDUZ-CDUZD)*M32 SCALED AT PI RADIANS
// PORT: Fixed ROM slots 17836.
                        if slot <> 17836 or instruction <> 29456 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 784, readEffective:call(words, 784)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:490
//		AD	DELREROR	# KALCMANU INERFACE ERROR
// PORT: Fixed ROM slots 17837.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:491
//		AD	E
// PORT: Fixed ROM slots 17838.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:492
//		XCH	RERROR		# SAVE R-ERROR FOR EIGHT-BALL DISPLAY.
// PORT: Fixed ROM slots 17839.
                            if slot <> 17839 or instruction <> 24362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 810, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:493
//		TC	Q
// PORT: Fixed ROM slots 17840.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:494
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:495
//# Page 1452
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:496
//# "ATTSTEER" IS THE ENTRY POINT FOR Q,R-AXES (U,V-AXES) ATTITUDE CONTROL USING THE REACTION CONTROL SYSTEM
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:497
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:498
//ATTSTEER	EQUALS	STILLRCS	# "STILLRCS" IS THE RCS EXIT FROM TRYGTS.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:499
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:500
//STILLRCS	CA	RERROR
// PORT: Fixed ROM slots 17841.
                        if slot <> 17841 or instruction <> 13098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 810).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:501
//		LXCH	A
// PORT: Fixed ROM slots 17842.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:502
//		CA	QERROR
// PORT: Fixed ROM slots 17843.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:503
//		TC	ROT-TOUV
// PORT: Fixed ROM slots 17844.
                            if slot <> 17844 or instruction <> 1638 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1638, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:504
//		DXCH	UERROR
// PORT: Fixed ROM slots 17845.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:505
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:506
//# PREPARES CALL TO TJETLAW (OR SPSRCS(DOCKED))
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:507
//# PREFORMS SKIP LOGIC ON U OR Y AXIS IF NEEDED.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:508
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:509
//TJLAW		CA	TJLAWADR
// PORT: Fixed ROM slots 17846.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:510
//		TS	RETJADR
// PORT: Fixed ROM slots 17847.
                        if slot <> 17847 or instruction <> 23359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23359, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17848 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:511
//		CA	ONE
// PORT: Fixed ROM slots 17848.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:512
//		TS	AXISCTR
// PORT: Fixed ROM slots 17849.
                            if slot <> 17849 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:513
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17850.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:514
//		INDEX	SKIPU
// PORT: Fixed ROM slots 17851.
    17851, 42682,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:515
//		TCF	+1
// PORT: Fixed ROM slots 17852.
    17852, 11130
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17853–17854.
function agcAotUnit1064 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17853 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:516
//		CA	FOUR
// PORT: Fixed ROM slots 17853.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:517
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17854.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:518
//		TS	SKIPU
// PORT: Fixed ROM slots 17855.
    17855, 46778
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17856–17857.
function agcAotUnit1065 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17856 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:519
//		TCF	LOOPER
// PORT: Fixed ROM slots 17856.
        if slot <> 17856 or instruction <> 5637 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5637, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:520
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17857.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:521
//		CA	UERROR
// PORT: Fixed ROM slots 17858.
    17858, 26578
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17859–17860.
function agcAotUnit1066 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17859 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:522
//		TS	E
// PORT: Fixed ROM slots 17859.
        if slot <> 17859 or instruction <> 23530 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23530, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:523
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17860.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:524
//		CA	OMEGAU
// PORT: Fixed ROM slots 17861.
    17861, 26156
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17862–17874.
function agcAotUnit1067 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17867 {
        if slot <= 17864 {
            if slot <= 17862 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:525
//		TS	EDOT
// PORT: Fixed ROM slots 17862.
                if slot <> 17862 or instruction <> 23319 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17863 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:526
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 17863.
                    if slot <> 17863 or instruction <> 12361 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:527
//		MASK	CSMDOCKD
// PORT: Fixed ROM slots 17864.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:528
//		CCS	A
// PORT: Fixed ROM slots 17865.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:529
//		TCF	+3
// PORT: Fixed ROM slots 17866.
                    if slot <> 17866 or instruction <> 5581 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5581, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:530
//		TC	TJETLAW
// PORT: Fixed ROM slots 17867.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:531
//		TCF	AFTERTJ
// PORT: Fixed ROM slots 17868.
                if slot <> 17868 or instruction <> 5591 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5591, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17869 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:532
// +3		CS	DAPBOOLS	# DOCKED.  IF GIMBAL USABLE DO GTS CONTROL
// PORT: Fixed ROM slots 17869.
                    if slot <> 17869 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:533
//		MASK	USEQRJTS	#	ON THE NEXT PASS.
// PORT: Fixed ROM slots 17870.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:534
//		CCS	A		# USEQRJTS BIT MUST NOT BE BIT 15.
// PORT: Fixed ROM slots 17871.
                    if slot <> 17871 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:535
//		TS	COTROLER	# GIMBAL USABLE.  STORE POSITIVE VALUE.
// PORT: Fixed ROM slots 17872.
                    if slot <> 17872 or instruction <> 23449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17873 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:536
//		INHINT
// PORT: Fixed ROM slots 17873.
                    if slot <> 17873 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:537
//		TC	IBNKCALL
// PORT: Fixed ROM slots 17874.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:538
//		CADR	SPSRCS		# DETERMINE RCS CONTROL
// PORT: Fixed ROM slots 17875.
    17875, 36782
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17876–17878.
function agcAotUnit1068 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17876 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:539
//		RELINT
// PORT: Fixed ROM slots 17876.
        if slot <> 17876 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17877 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:540
//		CAF	FOUR		# ALWAYS CALL FOR 2-JET CONTROL ABOUT U,V.
// PORT: Fixed ROM slots 17877.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:541
//		TS	NUMBERT		# FALL THROUGH TO JET SELECTION, ETC.
// PORT: Fixed ROM slots 17878.
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

// PORT: Physical bank 17. Shared continuation entries, slots 17879–17893.
function agcAotUnit1069 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17885 {
        if slot <= 17881 {
            if slot <= 17879 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:542
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:543
//# Q,R-JET-SELECTION-LOGIC
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:544
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:545
//# INPUT:	AXISCTR		0,1 FOR U,V
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:546
//#		SNUFFBIT	ZERO TJETU,V AND TRANS. ONLY IF SET IN A DPS BURN
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:547
//# Page 1453
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:548
//#		TJU,TJV		JET TIME SCALED 10.24 SEC.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:549
//#		NUMBERT		INDICATES NUMBER OF JETS AND TYPE OF POLICY
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:550
//#		RETJADR		WHERE TO RETURN TO
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:551
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:552
//# OUTPUT:	NO.U(V)JETS	RATE DERIVATION FEEDBACK
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:553
//#		CHANNEL 5
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:554
//#		SKIPU,SKIPV	FOR LESS THAN 150MS FIRING
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:555
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:556
//# NOTES:	IN CASE OF FAILURE IN DESIRED ROTATION POLICY, "ALL" UNFAILED
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:557
//#		JETS OF THE DESIRED POLICY ARE SELECTED.  SINCE THERE ARE ONLY
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:558
//#		TWO JETS, THIS MEANS THE OTHER ONE OR NONE.  THE ALARM IS SENT
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:559
//#		IF NONE CAN BE FOUND.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:560
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:561
//#		TIMES LESS THAN 14 MSEC ARE TAKEN TO CALL FOR A SINGLE-JET
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:562
//#		MINIMUM IMPULSE, WITH THE JET CHOSEN SEMI-RANDOMLY.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:563
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:564
//AFTERTJ		CA	FLAGWRD5	# IF SNUFFBIT SET DURING A DPS BURN GO TO
// PORT: Fixed ROM slots 17879.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:565
//		MASK	SNUFFBIT	# XTRANS; THAT IS, INHIBIT CONTROL.
// PORT: Fixed ROM slots 17880.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:566
//		EXTEND
// PORT: Fixed ROM slots 17881.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:567
//		BZF	DOROTAT
// PORT: Fixed ROM slots 17882.
                    if slot <> 17882 or instruction <> 5603 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5603, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:568
//		CS	FLGWRD10
// PORT: Fixed ROM slots 17883.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:569
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 17884.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:570
//		EXTEND
// PORT: Fixed ROM slots 17885.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:571
//		BZF	DOROTAT
// PORT: Fixed ROM slots 17886.
                    if slot <> 17886 or instruction <> 5603 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5603, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:572
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 17887.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:573
//		MASK	DRIFTBIT
// PORT: Fixed ROM slots 17888.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:574
//		EXTEND
// PORT: Fixed ROM slots 17889.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:575
//		BZF	XTRANS
// PORT: Fixed ROM slots 17890.
                    if slot <> 17890 or instruction <> 5683 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5683, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:576
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:577
//DOROTAT		CAF	TWO
// PORT: Fixed ROM slots 17891.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:578
//		TS	L
// PORT: Fixed ROM slots 17892.
                    if slot <> 17892 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:579
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17893.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:580
//		CCS	TJU
// PORT: Fixed ROM slots 17894.
    17894, 9898
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17895–17910.
function agcAotUnit1070 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17902 {
        if slot <= 17898 {
            if slot <= 17896 {
                if slot <= 17895 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:581
//		TCF	+5
// PORT: Fixed ROM slots 17895.
                    if slot <> 17895 or instruction <> 5612 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5612, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:582
//		TCF	NOROTAT
// PORT: Fixed ROM slots 17896.
                    if slot <> 17896 or instruction <> 5631 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5631, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17897 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:583
//		TCF	+2
// PORT: Fixed ROM slots 17897.
                    if slot <> 17897 or instruction <> 5611 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5611, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:584
//		TCF	NOROTAT
// PORT: Fixed ROM slots 17898.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:585
//		ZL
// PORT: Fixed ROM slots 17899.
                    if slot <> 17899 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:586
//		AD	ONE
// PORT: Fixed ROM slots 17900.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:587
//		TS	ABSTJ
// PORT: Fixed ROM slots 17901.
                    if slot <> 17901 or instruction <> 23519 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23519, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:588
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:589
//		CA	AXISCTR
// PORT: Fixed ROM slots 17902.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:590
//		AD	L
// PORT: Fixed ROM slots 17903.
                    if slot <> 17903 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:591
//		TS	ROTINDEX	# 0 1 2 3 = -U -V +U +V
// PORT: Fixed ROM slots 17904.
                    if slot <> 17904 or instruction <> 23524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23524, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17905 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:592
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:593
//		CA	ABSTJ
// PORT: Fixed ROM slots 17905.
                    if slot <> 17905 or instruction <> 13279 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 991).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:594
//		AD	-150MS
// PORT: Fixed ROM slots 17906.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:595
//		EXTEND
// PORT: Fixed ROM slots 17907.
                    if slot <> 17907 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:596
//		BZMF	DOSKIP
// PORT: Fixed ROM slots 17908.
                    if slot <> 17908 or instruction <> 26120 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26120, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17909 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:597
//# Page 1454
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:598
//		TC	SELCTSUB
// PORT: Fixed ROM slots 17909.
                    if slot <> 17909 or instruction <> 1659 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1659, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:599
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:600
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17910.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:601
//		CA	INDEXES
// PORT: Fixed ROM slots 17911.
    17911, 27786
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17912–17915.
function agcAotUnit1071 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17913 {
        if slot <= 17912 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:602
//		TS	L
// PORT: Fixed ROM slots 17912.
            if slot <> 17912 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:603
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:604
//		CA	POLYTEMP
// PORT: Fixed ROM slots 17913.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:605
//		INHINT
// PORT: Fixed ROM slots 17914.
            if slot <> 17914 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:606
//		INDEX	L
// PORT: Fixed ROM slots 17915.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:607
//		TC	WRITEP
// PORT: Fixed ROM slots 17916.
    17916, 6104
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17917–17919.
function agcAotUnit1072 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17917 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:608
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:609
//		RELINT
// PORT: Fixed ROM slots 17917.
        if slot <> 17917 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17918 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:610
//		TCF	FEEDBACK
// PORT: Fixed ROM slots 17918.
            if slot <> 17918 or instruction <> 5673 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5673, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:611
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:612
//NOROTAT		INDEX	AXISCTR
// PORT: Fixed ROM slots 17919.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:613
//		CA	INDEXES
// PORT: Fixed ROM slots 17920.
    17920, 27786
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17921–17922.
function agcAotUnit1073 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17921 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:614
//		INHINT
// PORT: Fixed ROM slots 17921.
        if slot <> 17921 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:615
//		INDEX	A
// PORT: Fixed ROM slots 17922.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:616
//		TC	WRITEP 	-1
// PORT: Fixed ROM slots 17923.
    17923, 6102
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17924–17933.
function agcAotUnit1074 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17928 {
        if slot <= 17925 {
            if slot <= 17924 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:617
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:618
//		RELINT
// PORT: Fixed ROM slots 17924.
                if slot <> 17924 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:619
//LOOPER		CCS	AXISCTR
// PORT: Fixed ROM slots 17925.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:620
//		TC	RETJADR
// PORT: Fixed ROM slots 17926.
                if slot <> 17926 or instruction <> 831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 831, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17927 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:621
//		TCF	CLOSEOUT
// PORT: Fixed ROM slots 17927.
                    if slot <> 17927 or instruction <> 5790 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5790, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:622
//DOSKIP		CS	ABSTJ
// PORT: Fixed ROM slots 17928.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:623
//		AD	+TJMINT6	# 14MS
// PORT: Fixed ROM slots 17929.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:624
//		EXTEND
// PORT: Fixed ROM slots 17930.
                if slot <> 17930 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17931 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:625
//		BZMF	NOTMIN
// PORT: Fixed ROM slots 17931.
                if slot <> 17931 or instruction <> 26138 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26138, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17932 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:626
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:627
//		ADS	ABSTJ
// PORT: Fixed ROM slots 17932.
                    if slot <> 17932 or instruction <> 12255 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 991).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:628
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17933.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:629
//		CCS	TJU
// PORT: Fixed ROM slots 17934.
    17934, 9898
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17935–17938.
function agcAotUnit1075 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17936 {
        if slot <= 17935 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:630
//		CA	+TJMINT6
// PORT: Fixed ROM slots 17935.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:631
//		TCF	+2
// PORT: Fixed ROM slots 17936.
            if slot <> 17936 or instruction <> 5650 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5650, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17937 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:632
//		CS	+TJMINT6
// PORT: Fixed ROM slots 17937.
            if slot <> 17937 or instruction <> 17991 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1607), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:633
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17938.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:634
//		TS	TJU
// PORT: Fixed ROM slots 17939.
    17939, 46762
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17940–17947.
function agcAotUnit1076 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17943 {
        if slot <= 17941 {
            if slot <= 17940 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:635
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:636
//		CCS	SENSETYP	# ENSURE MIN-IMPULSE NOT AGAINST TRANS
// PORT: Fixed ROM slots 17940.
                if slot <> 17940 or instruction <> 4928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 832).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:637
//		TCF	NOTMIN 	-1
// PORT: Fixed ROM slots 17941.
                if slot <> 17941 or instruction <> 5657 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5657, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17942 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:638
//		EXTEND
// PORT: Fixed ROM slots 17942.
                if slot <> 17942 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:639
//		READ	LOSCALAR
// PORT: Fixed ROM slots 17943.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:640
//		MASK	ONE
// PORT: Fixed ROM slots 17944.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:641
//		TS	NUMBERT
// PORT: Fixed ROM slots 17945.
                if slot <> 17945 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17946 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:642
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:643
//NOTMIN		TC	SELCTSUB
// PORT: Fixed ROM slots 17946.
                if slot <> 17946 or instruction <> 1659 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1659, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:644
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:645
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17947.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:646
//		CA	INDEXES
// PORT: Fixed ROM slots 17948.
    17948, 27786
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17949–17952.
function agcAotUnit1077 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17950 {
        if slot <= 17949 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:647
//		INHINT
// PORT: Fixed ROM slots 17949.
            if slot <> 17949 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:648
//# Page 1455
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:649
//		TS	T6FURTHA +1
// PORT: Fixed ROM slots 17950.
            if slot <> 17950 or instruction <> 23353 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23353, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17951 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:650
//		CA	POLYTEMP
// PORT: Fixed ROM slots 17951.
            if slot <> 17951 or instruction <> 13281 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 993).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:651
//		INDEX	T6FURTHA +1
// PORT: Fixed ROM slots 17952.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:652
//		TC	WRITEP
// PORT: Fixed ROM slots 17953.
    17953, 6104
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17954–17959.
function agcAotUnit1078 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17956 {
        if slot <= 17954 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:653
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:654
//		CA	ABSTJ
// PORT: Fixed ROM slots 17954.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:655
//		TS	T6FURTHA
// PORT: Fixed ROM slots 17955.
                if slot <> 17955 or instruction <> 23352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23352, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:656
//		TC	JTLST		# IN QR BANK BY NOW
// PORT: Fixed ROM slots 17956.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:657
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:658
//		RELINT
// PORT: Fixed ROM slots 17957.
            if slot <> 17957 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17958 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:659
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:660
//		CA	ZERO
// PORT: Fixed ROM slots 17958.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:661
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17959.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:662
//		TS	SKIPU
// PORT: Fixed ROM slots 17960.
    17960, 46778
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17961–17968.
function agcAotUnit1079 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17964 {
        if slot <= 17962 {
            if slot <= 17961 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:663
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:664
//FEEDBACK	CS	THREE
// PORT: Fixed ROM slots 17961.
                if slot <> 17961 or instruction <> 19621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:665
//		AD	NUMBERT
// PORT: Fixed ROM slots 17962.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:666
//		EXTEND
// PORT: Fixed ROM slots 17963.
                if slot <> 17963 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:667
//		BZMF	+3
// PORT: Fixed ROM slots 17964.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:668
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:669
//		CA	TWO
// PORT: Fixed ROM slots 17965.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:670
//		TCF	+2
// PORT: Fixed ROM slots 17966.
                if slot <> 17966 or instruction <> 5680 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5680, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17967 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:671
//		CA	ONE
// PORT: Fixed ROM slots 17967.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:672
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 17968.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:673
//		TS	NO.UJETS
// PORT: Fixed ROM slots 17969.
    17969, 46756
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17970–17988.
function agcAotUnit1080 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17978 {
        if slot <= 17973 {
            if slot <= 17971 {
                if slot <= 17970 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:674
//		TCF	LOOPER
// PORT: Fixed ROM slots 17970.
                    if slot <> 17970 or instruction <> 5637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:675
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:676
//XTRANS		CA	ZERO
// PORT: Fixed ROM slots 17971.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:677
//		TS	TJU
// PORT: Fixed ROM slots 17972.
                    if slot <> 17972 or instruction <> 23381 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23381, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:678
//		TS	TJV
// PORT: Fixed ROM slots 17973.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:679
//		CA	FOUR
// PORT: Fixed ROM slots 17974.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:680
//		INHINT
// PORT: Fixed ROM slots 17975.
                    if slot <> 17975 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17976 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:681
//		XCH	SKIPU
// PORT: Fixed ROM slots 17976.
                    if slot <> 17976 or instruction <> 24413 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 861, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17977 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:682
//		EXTEND
// PORT: Fixed ROM slots 17977.
                        if slot <> 17977 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:683
//		BZF	+2
// PORT: Fixed ROM slots 17978.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:684
//		TC	WRITEU 	-1
// PORT: Fixed ROM slots 17979.
                    if slot <> 17979 or instruction <> 3055 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3055, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:685
//		CA	FOUR
// PORT: Fixed ROM slots 17980.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:686
//		XCH	SKIPV
// PORT: Fixed ROM slots 17981.
                    if slot <> 17981 or instruction <> 24414 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 862, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17982 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:687
//		RELINT
// PORT: Fixed ROM slots 17982.
                        if slot <> 17982 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:688
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:689
//		EXTEND
// PORT: Fixed ROM slots 17983.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:690
//		BZF	CLOSEOUT
// PORT: Fixed ROM slots 17984.
                    if slot <> 17984 or instruction <> 5790 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5790, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:691
//		INHINT
// PORT: Fixed ROM slots 17985.
                    if slot <> 17985 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17986 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:692
//		TC	WRITEV 	-1
// PORT: Fixed ROM slots 17986.
                    if slot <> 17986 or instruction <> 3064 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3064, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17987 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:693
//		RELINT
// PORT: Fixed ROM slots 17987.
                        if slot <> 17987 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:694
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:695
//		TCF	CLOSEOUT
// PORT: Fixed ROM slots 17988.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:696
//INDEXES		DEC	4
// PORT: Fixed ROM slots 17989.
    17989, 8,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:697
//		DEC	13
// PORT: Fixed ROM slots 17990.
    17990, 26,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:698
//+TJMINT6	DEC	22
// PORT: Fixed ROM slots 17991.
    17991, 44,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:699
//# Page 1456
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:700
//-150MS		DEC	-240
// PORT: Fixed ROM slots 17992.
    17992, 65054,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:701
//BIT8,9		OCT	00600
// PORT: Fixed ROM slots 17993.
    17993, 768,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:702
//SCLNORM		OCT	266
// PORT: Fixed ROM slots 17994.
    17994, 364,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:703
//TJLAWADR	GENADR	TJLAW 	+3	# RETURN ADDRESS FOR RCS ATTITUDE CONTROL
// PORT: Fixed ROM slots 17995.
    17995, 2930
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17996–18024.
function agcAotUnit1081 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18009 {
        if slot <= 18002 {
            if slot <= 17998 {
                if slot <= 17996 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:704
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:705
//# THE JET LIST:
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:706
//# THIS IS A WAITLIST FOR T6RUPTS.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:707
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:708
//# CALLED BY:
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:709
//#		CA	TJ		# TIME WHEN NEXT JETS WILL BE WRITTEN
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:710
//#		TS	T6FURTHA
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:711
//#		CA	INDEX		# AXIS TO BE WRITTEN AT TJ (FROM NOW)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:712
//#		TS	T6FURTHA +1
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:713
//#		TC	JTLST
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:714
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:715
//# EXAMPLE -- U-AXIS AUTOPILOT WILL WRITE ITS ROTATION CODE OF
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:716
//# JETS INTO CHANNEL 5.  IF IT DESIRES TO TURN OFF THIS POLICY WITHIN
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:717
//# 150MS AND THEN FIRE NEXTU, A CALL TO JTLST IS MADE WITH T6FURTHA
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:718
//# CONTAINING THE TIME TO TURN OFF THE POLICY, T6FURTHA +1 THE INDEX
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:719
//# OF THE U-AXIS(4), AND NEXTU WILL CONTAIN THE "U-TRANS" POLICY OR ZERO.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:720
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:721
//# THE LIST IS EXACTLY 3 LONG.  (THIS LEADS UP TO SKIP LOGIC AND 150MS LIMIT)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:722
//# THE INPUT IS THE LAST MEMBER OF THE LIST.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:723
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:724
//# RETURNS BY:
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:725
//#	+	TC	Q
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:726
//#
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:727
//# DEFINITIONS:  (OUTPUT)
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:728
//#	TIME6		TIME OF NEXT RUPT
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:729
//#	T6NEXT		DELTA TIME TO NEXT RUPT
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:730
//#	T6FURTHA	DELTA TIME FROM 2ND TO LAST RUPT
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:731
//#	NXT6ADR		AXIS INDEX	0 -- P-AXIS
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:732
//#	T6NEXT +1	AXIS INDEX	4 -- U-AXIS
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:733
//#	T6FURTHA +1	AXIS INDEX	13 -- V-AXIS
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:734
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:735
//JTLST		CS	T6FURTHA
// PORT: Fixed ROM slots 17996.
                    if slot <> 17996 or instruction <> 17208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 824).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17997 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:736
//		AD	TIME6
// PORT: Fixed ROM slots 17997.
                        if slot <> 17997 or instruction <> 24601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 25).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:737
//		EXTEND
// PORT: Fixed ROM slots 17998.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:738
//		BZMF	MIDORLST	# TIME6 -- TI IS IN A
// PORT: Fixed ROM slots 17999.
                        if slot <> 17999 or instruction <> 26201 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26201, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:739
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:740
//		LXCH	NXT6ADR
// PORT: Fixed ROM slots 18000.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:741
//		DXCH	T6NEXT
// PORT: Fixed ROM slots 18001.
                        if slot <> 18001 or instruction <> 22327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 823, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:742
//		DXCH	T6FURTHA
// PORT: Fixed ROM slots 18002.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:743
//		TS	TIME6
// PORT: Fixed ROM slots 18003.
                    if slot <> 18003 or instruction <> 22553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22553, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18004 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:744
//		LXCH	NXT6ADR
// PORT: Fixed ROM slots 18004.
                        if slot <> 18004 or instruction <> 10037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 821, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:745
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:746
//TURNON		CA	BIT15
// PORT: Fixed ROM slots 18005.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:747
//		EXTEND
// PORT: Fixed ROM slots 18006.
                        if slot <> 18006 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:748
//		WOR	CHAN13
// PORT: Fixed ROM slots 18007.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:749
//		TC	Q
// PORT: Fixed ROM slots 18008.
                        if slot <> 18008 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:750
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:751
//# Page 1457
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:752
//MIDORLST	AD	T6NEXT
// PORT: Fixed ROM slots 18009.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:753
//		EXTEND
// PORT: Fixed ROM slots 18010.
                    if slot <> 18010 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18011 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:754
//		BZMF	LASTCHG		# TIME6 + T6NEXT - T IS IN A
// PORT: Fixed ROM slots 18011.
                        if slot <> 18011 or instruction <> 26210 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26210, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:755
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:756
//		LXCH	T6NEXT 	+1
// PORT: Fixed ROM slots 18012.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:757
//		DXCH	T6FURTHA
// PORT: Fixed ROM slots 18013.
                        if slot <> 18013 or instruction <> 22329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 825, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:758
//		EXTEND
// PORT: Fixed ROM slots 18014.
                        if slot <> 18014 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18015 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:759
//		SU	TIME6
// PORT: Fixed ROM slots 18015.
                        if slot <> 18015 or instruction <> 24601 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreSU(words, 25).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:760
//		DXCH	T6NEXT
// PORT: Fixed ROM slots 18016.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:761
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:762
//		TC	Q
// PORT: Fixed ROM slots 18017.
                        if slot <> 18017 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:763
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:764
//LASTCHG		CS	A
// PORT: Fixed ROM slots 18018.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:765
//		AD	NEG0
// PORT: Fixed ROM slots 18019.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:766
//		TS	T6FURTHA
// PORT: Fixed ROM slots 18020.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:767
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:768
//		TC	Q
// PORT: Fixed ROM slots 18021.
                        if slot <> 18021 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:769
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:770
//# ROT-TOUV IS ENTERED WITH THE Q-COMPONENT OF THE QUANTITY TO BE TRANSFORMED IN A AND THE R-COMPONENT IN L.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:771
//# ROT-TOUV TRANSFORMS THE QUANTITY INTO THE NON-ORTHOGONAL U-V AXIS SYSTEM.  IN THE U-V SYSTEM NO CROSS-COUPLING IS
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:772
//# PRODUCED FROM RCS JET FIRINGS.  AT THE COMPLETION OF ROT-TOUV, THE U-COMPONENT OF THE TRANSFORMED QUANTITY IS IN
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:773
//# A AND THE V-COMPONENT IS IN L.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:774
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:775
//ROT-TOUV	LXCH	ROTEMP2		# (R) IS PUT INTO ROTEMP2
// PORT: Fixed ROM slots 18022.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:776
//		EXTEND
// PORT: Fixed ROM slots 18023.
                        if slot <> 18023 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:777
//		MP	COEFFQ
// PORT: Fixed ROM slots 18024.
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

// PORT: Physical bank 17. Shared continuation entries, slots 18025–18032.
function agcAotUnit1082 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18028 {
        if slot <= 18026 {
            if slot <= 18025 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:778
//		XCH	ROTEMP2		# (R) GOES TO A AND COEFFQ.(Q) TO ROTEMP2
// PORT: Fixed ROM slots 18025.
                if slot <> 18025 or instruction <> 24544 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 992, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:779
//		EXTEND
// PORT: Fixed ROM slots 18026.
                if slot <> 18026 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18027 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:780
//		MP	COEFFR
// PORT: Fixed ROM slots 18027.
                if slot <> 18027 or instruction <> 29592 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 920, readEffective:call(words, 920)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:781
//		TS	L		# COEFFR.(R) IS PUT INTO L
// PORT: Fixed ROM slots 18028.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:782
//		AD	ROTEMP2
// PORT: Fixed ROM slots 18029.
                if slot <> 18029 or instruction <> 25568 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 992).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:783
//		TS	ROTEMP1		# COEFFQ.(Q)+COEFFR.(R) IS PUT IN ROTEMP1
// PORT: Fixed ROM slots 18030.
                if slot <> 18030 or instruction <> 23519 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18031 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:784
//		TCF	+4
// PORT: Fixed ROM slots 18031.
                if slot <> 18031 or instruction <> 5747 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5747, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:785
//		INDEX	A		# COEFFQ.(Q) + COEFFR.(R) HAS OVERFLOWED
// PORT: Fixed ROM slots 18032.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:786
//		CS	LIMITS		# AND IS LIMITED TO POSMAX OR NEGMAX
// PORT: Fixed ROM slots 18033.
    18033, 37816
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18034–18039.
function agcAotUnit1083 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18036 {
        if slot <= 18034 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:787
//		TS	ROTEMP1
// PORT: Fixed ROM slots 18034.
            if slot <> 18034 or instruction <> 23519 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23519, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18035 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:788
//		CS	ROTEMP2
// PORT: Fixed ROM slots 18035.
                if slot <> 18035 or instruction <> 17376 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 992).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:789
//		AD	L		# -COEFFQ.(Q) + COEFFR.(R) IS NOW IN A
// PORT: Fixed ROM slots 18036.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:790
//		TS	7
// PORT: Fixed ROM slots 18037.
            if slot <> 18037 or instruction <> 22535 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22535, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18038 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:791
//		TCF	+3
// PORT: Fixed ROM slots 18038.
                if slot <> 18038 or instruction <> 5753 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5753, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:792
//		INDEX	A		# -COEFFQ.(Q) + COEFFR.(R) HAS OVERFLOWED
// PORT: Fixed ROM slots 18039.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:793
//		CS	LIMITS		# AND IS LIMITED TO POSMAX OR NEGMAX
// PORT: Fixed ROM slots 18040.
    18040, 37816
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18041–18043.
function agcAotUnit1084 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18041 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:794
//		LXCH	ROTEMP1		# COEFFQ.(Q) + COEFFR.(R) IS PUT INTO L
// PORT: Fixed ROM slots 18041.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:795
//		TC	Q
// PORT: Fixed ROM slots 18042.
            if slot <> 18042 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:796
//SELCTSUB	INDEX	ROTINDEX
// PORT: Fixed ROM slots 18043.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:797
//		CA	ALLJETS
// PORT: Fixed ROM slots 18044.
    18044, 27946
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18045–18045.
function agcAotUnit1085 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:798
//		INDEX	NUMBERT
// PORT: Fixed ROM slots 18045.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:799
//		MASK	TYPEPOLY
// PORT: Fixed ROM slots 18046.
    18046, 60722
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18047–18054.
function agcAotUnit1086 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18050 {
        if slot <= 18048 {
            if slot <= 18047 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:800
//		TS	POLYTEMP
// PORT: Fixed ROM slots 18047.
                if slot <> 18047 or instruction <> 23521 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23521, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:801
//# Page 1458
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:802
//		MASK	CH5MASK
// PORT: Fixed ROM slots 18048.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:803
//		CCS	A
// PORT: Fixed ROM slots 18049.
                if slot <> 18049 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:804
//		TCF	+2
// PORT: Fixed ROM slots 18050.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:805
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:806
//		TC	Q
// PORT: Fixed ROM slots 18051.
                if slot <> 18051 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:807
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:808
//		CA	THREE
// PORT: Fixed ROM slots 18052.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:809
//FAILOOP		TS	NUMBERT
// PORT: Fixed ROM slots 18053.
                if slot <> 18053 or instruction <> 23523 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:810
//		INDEX	ROTINDEX
// PORT: Fixed ROM slots 18054.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:811
//		CA	ALLJETS
// PORT: Fixed ROM slots 18055.
    18055, 27946
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18056–18056.
function agcAotUnit1087 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:812
//		INDEX	NUMBERT
// PORT: Fixed ROM slots 18056.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:813
//		MASK	TYPEPOLY
// PORT: Fixed ROM slots 18057.
    18057, 60722
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18058–18064.
function agcAotUnit1088 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18060 {
        if slot <= 18058 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:814
//		TS	POLYTEMP
// PORT: Fixed ROM slots 18058.
            if slot <> 18058 or instruction <> 23521 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23521, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18059 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:815
//		MASK	CH5MASK
// PORT: Fixed ROM slots 18059.
                if slot <> 18059 or instruction <> 29362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 690).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:816
//		EXTEND
// PORT: Fixed ROM slots 18060.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:817
//		BZF	FAILOOP -2
// PORT: Fixed ROM slots 18061.
                if slot <> 18061 or instruction <> 5763 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5763, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:818
//		CCS	NUMBERT
// PORT: Fixed ROM slots 18062.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:819
//		TCF	FAILOOP
// PORT: Fixed ROM slots 18063.
                if slot <> 18063 or instruction <> 5765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:820
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 18064.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:821
//		TS	TJU
// PORT: Fixed ROM slots 18065.
    18065, 46762
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18066–18066.
function agcAotUnit1089 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:822
//		TC	ALARM
// PORT: Fixed ROM slots 18066.
    if slot <> 18066 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1089] to agcAotUnit1089@.

agcAotInstallSourceRope(list(
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:823
//		OCT	02004
// PORT: Fixed ROM slots 18067.
    18067, 2056
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18068–18068.
function agcAotUnit1090 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:824
//		TCF	NOROTAT
// PORT: Fixed ROM slots 18068.
    if slot <> 18068 or instruction <> 5631 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5631, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1090] to agcAotUnit1090@.

agcAotInstallSourceRope(list(
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:825
//ALLJETS		OCT	00110		#	-U	6 13
// PORT: Fixed ROM slots 18069.
    18069, 144,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:826
//		OCT	00022		#	-V	2 9
// PORT: Fixed ROM slots 18070.
    18070, 36,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:827
//		OCT	00204		#	+U	5 14
// PORT: Fixed ROM slots 18071.
    18071, 264,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:828
//		OCT	00041		# 	+V	1 10
// PORT: Fixed ROM slots 18072.
    18072, 66,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:829
//TYPEPOLY	OCT	00125		#	-X	1 5 9 13
// PORT: Fixed ROM slots 18073.
    18073, 170,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:830
//		OCT	00252		#	+X	2 6 10 14
// PORT: Fixed ROM slots 18074.
    18074, 340,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:831
//		OCT	00146		#	A	2 5 10 13
// PORT: Fixed ROM slots 18075.
    18075, 204,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:832
//		OCT	00231		#	B	1 6 9 14
// PORT: Fixed ROM slots 18076.
    18076, 306,
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:833
//		OCT	00377		#	ALL	1 2 5 6 9 10 13 14
// PORT: Fixed ROM slots 18077.
    18077, 510
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18078–18079.
function agcAotUnit1091 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18078 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:834
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:835
//# THE FOLLOWING SETS THE INTERRUPT FLIP-FLOP AS SOON AS POSSIBLE, WHICH PERMITS A RETURN TO THE INTERRUPTED JOB.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:836
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:837
//CLOSEOUT	CA	ADRRUPT
// PORT: Fixed ROM slots 18078.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:838
//		TC	MAKERUPT
// PORT: Fixed ROM slots 18079.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:839
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:840
//ADRRUPT		ADRES	ENDJASK
// PORT: Fixed ROM slots 18080.
    18080, 3394
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18081–18089.
function agcAotUnit1092 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18084 {
        if slot <= 18082 {
            if slot <= 18081 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:841
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:842
//ENDJASK		DXCH	DAPARUPT
// PORT: Fixed ROM slots 18081.
                if slot <> 18081 or instruction <> 22508 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1004, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:843
//		DXCH	ARUPT
// PORT: Fixed ROM slots 18082.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:844
//		DXCH	DAPBQRPT
// PORT: Fixed ROM slots 18083.
                if slot <> 18083 or instruction <> 22510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1006, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:845
//		XCH	BRUPT
// PORT: Fixed ROM slots 18084.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:846
//		LXCH	Q
// PORT: Fixed ROM slots 18085.
                if slot <> 18085 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:847
//		CAF	NEGMAX		# NEGATIVE DAPZRUPT SIGNALS JASK IS OVER.
// PORT: Fixed ROM slots 18086.
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
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:848
//		DXCH	DAPZRUPT
// PORT: Fixed ROM slots 18087.
                if slot <> 18087 or instruction <> 22512 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1008, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18088 {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:849
//		DXCH	ZRUPT
// PORT: Fixed ROM slots 18088.
                    if slot <> 18088 or instruction <> 21518 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 14, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:850
//		TCF	NOQRSM
// PORT: Fixed ROM slots 18089.
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

// PORT: Physical bank 03. Shared continuation entries, slots 6124–6124.
function agcAotUnit356 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:851
//# Page 1459
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:852
//		BLOCK	3
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:853
//		SETLOC	FFTAG6
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:854
//		BANK
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:855
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:856
//		COUNT*	$$/DAP
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:857
//
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:858
//MAKERUPT	EXTEND
// PORT: Fixed ROM slots 6124.
    if slot <> 6124 or instruction <> 6 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[356] to agcAotUnit356@.

agcAotInstallSourceRope(list(
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:859
//		EDRUPT	MAKERUPT
// PORT: Fixed ROM slots 6125.
    6125, 8152
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE Q_R-AXIS_RCS_AUTOPILOT.agc:860
//
