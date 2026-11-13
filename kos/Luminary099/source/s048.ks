// P-AXIS_RCS_AUTOPILOT.agc
// bank 16, slots 16523-16529
function agcAotUnit1002 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16525 {
        if slot <= 16523 {
// P-AXIS_RCS_AUTOPILOT.agc:1
//# Copyright:	Public domain.
// P-AXIS_RCS_AUTOPILOT.agc:2
//# Filename:	P-AXIS_RCS_AUTOPILOT.agc
// P-AXIS_RCS_AUTOPILOT.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P-AXIS_RCS_AUTOPILOT.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// P-AXIS_RCS_AUTOPILOT.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P-AXIS_RCS_AUTOPILOT.agc:6
//# Assembler:	yaYUL
// P-AXIS_RCS_AUTOPILOT.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// P-AXIS_RCS_AUTOPILOT.agc:8
//# Website:	www.ibiblio.org/apollo.
// P-AXIS_RCS_AUTOPILOT.agc:9
//# Pages:	1421-1441
// P-AXIS_RCS_AUTOPILOT.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// P-AXIS_RCS_AUTOPILOT.agc:11
//#				Luminary131 file, using page
// P-AXIS_RCS_AUTOPILOT.agc:12
//#				images from Luminary 1A.
// P-AXIS_RCS_AUTOPILOT.agc:13
//#		2009-06-05 RSB	Corrected a relative jump from
// P-AXIS_RCS_AUTOPILOT.agc:14
//#				+8 to +8D.
// P-AXIS_RCS_AUTOPILOT.agc:15
//#		2009-06-07 RSB	Corrected a typo.
// P-AXIS_RCS_AUTOPILOT.agc:16
//#
// P-AXIS_RCS_AUTOPILOT.agc:17
//# This source code has been transcribed or otherwise adapted from
// P-AXIS_RCS_AUTOPILOT.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P-AXIS_RCS_AUTOPILOT.agc:19
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// P-AXIS_RCS_AUTOPILOT.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P-AXIS_RCS_AUTOPILOT.agc:21
//# in storage size and consequent reduction in image quality as well) are
// P-AXIS_RCS_AUTOPILOT.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P-AXIS_RCS_AUTOPILOT.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// P-AXIS_RCS_AUTOPILOT.agc:24
//# about getting access to the (much) higher-quality images which Paul
// P-AXIS_RCS_AUTOPILOT.agc:25
//# actually created.
// P-AXIS_RCS_AUTOPILOT.agc:26
//#
// P-AXIS_RCS_AUTOPILOT.agc:27
//# Notations on the hardcopy document read, in part:
// P-AXIS_RCS_AUTOPILOT.agc:28
//#
// P-AXIS_RCS_AUTOPILOT.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P-AXIS_RCS_AUTOPILOT.agc:30
//#	16:27 JULY 14, 1969
// P-AXIS_RCS_AUTOPILOT.agc:31
//
// P-AXIS_RCS_AUTOPILOT.agc:32
//# Page 1421
// P-AXIS_RCS_AUTOPILOT.agc:33
//		BANK	16
// P-AXIS_RCS_AUTOPILOT.agc:34
//		SETLOC	DAPS1
// P-AXIS_RCS_AUTOPILOT.agc:35
//		BANK
// P-AXIS_RCS_AUTOPILOT.agc:36
//
// P-AXIS_RCS_AUTOPILOT.agc:37
//		EBANK=	PERROR
// P-AXIS_RCS_AUTOPILOT.agc:38
//		COUNT*	$$/DAPP
// P-AXIS_RCS_AUTOPILOT.agc:39
//
// P-AXIS_RCS_AUTOPILOT.agc:40
//# THE FOLLOWING T5RUPT ENTRY BEGINS THE PROGRAM WHICH CONTROLS THE P-AXIS ACTION OF THE LEM USING THE RCS JETS.
// P-AXIS_RCS_AUTOPILOT.agc:41
//# THE NOMINAL TIME BETWEEN THE P-AXIS RUPTS IS 100 MS IN ALL NON-IDLING MODES OF THE DAP.
// P-AXIS_RCS_AUTOPILOT.agc:42
//
// P-AXIS_RCS_AUTOPILOT.agc:43
//PAXIS		CA	MS100
// slot 16523
            if slot <> 16523 or instruction <> 16343 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 4055), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16524 {
// P-AXIS_RCS_AUTOPILOT.agc:44
//		ADS	TIME5		# *** NECESSARY IN ORDER TO ALLOW
// slot 16524
                if slot <> 16524 or instruction <> 11288 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 24).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:45
//					# SYNCHRONIZATION WITH OTHER INTERRUPTS ***
// P-AXIS_RCS_AUTOPILOT.agc:46
//
// P-AXIS_RCS_AUTOPILOT.agc:47
//		LXCH	BANKRUPT	# INTERRUPT LEAD IN (CONTINUED)
// slot 16525
                if slot <> 16525 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16527 {
            if slot <= 16526 {
// P-AXIS_RCS_AUTOPILOT.agc:48
//		EXTEND
// slot 16526
                if slot <> 16526 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:49
//		QXCH	QRUPT
// slot 16527
                if slot <> 16527 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16528 {
// P-AXIS_RCS_AUTOPILOT.agc:50
//
// P-AXIS_RCS_AUTOPILOT.agc:51
//# CHECK IF DAP PASS IS PERMISSIBLE
// P-AXIS_RCS_AUTOPILOT.agc:52
//
// P-AXIS_RCS_AUTOPILOT.agc:53
//		CCS	DAPZRUPT	# IF DAPZRUPT POSITIVE, DAP (JASK) IS
// slot 16528
                if slot <> 16528 or instruction <> 5103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 1007).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:54
//		TC	BAILOUT		# STILL IN PROGRESS AND A RESTART IS
// slot 16529
                if slot <> 16529 or instruction <> 2972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2972, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1002] to agcAotUnit1002@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:55
//		OCT	02000		# CALLED FOR.  IT IS NEVER ZERO
// slot 16530
    16530, 2048
)).

// bank 16, slots 16531-16586
function agcAotUnit1003 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16558 {
        if slot <= 16544 {
            if slot <= 16537 {
                if slot <= 16533 {
                    if slot <= 16531 {
// P-AXIS_RCS_AUTOPILOT.agc:56
//
// P-AXIS_RCS_AUTOPILOT.agc:57
//		TC	CHEKBITS	# RETURN IS TC I+1 IF DAP SHOULD STAY ON.
// slot 16531
                        if slot <> 16531 or instruction <> 1024 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1024, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16532 {
// P-AXIS_RCS_AUTOPILOT.agc:58
//
// P-AXIS_RCS_AUTOPILOT.agc:59
//		CA	CDUX		# READ AND STORE CDU'S
// slot 16532
                            if slot <> 16532 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:60
//		TS	DAPTREG4
// slot 16533
                            if slot <> 16533 or instruction <> 23528 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23528, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16535 {
                        if slot <= 16534 {
// P-AXIS_RCS_AUTOPILOT.agc:61
//		CA	CDUY
// slot 16534
                            if slot <> 16534 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:62
//		TS	DAPTREG5
// slot 16535
                            if slot <> 16535 or instruction <> 23529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16536 {
// P-AXIS_RCS_AUTOPILOT.agc:63
//		CA	CDUZ
// slot 16536
                            if slot <> 16536 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:64
//		TS	DAPTREG6
// slot 16537
                            if slot <> 16537 or instruction <> 23530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16540 {
                    if slot <= 16538 {
// P-AXIS_RCS_AUTOPILOT.agc:65
//
// P-AXIS_RCS_AUTOPILOT.agc:66
//# ***** KALCMANU-DAP AND "RATE-HOLD"-DAP INTERFACE *****
// P-AXIS_RCS_AUTOPILOT.agc:67
//#
// P-AXIS_RCS_AUTOPILOT.agc:68
//# THE FOLLOWING SECTION IS EXECUTED EVERY 100 MS (10 TIMES A SECOND) WITHIN THE P-AXIS REACTION CONTROL SYSTEM
// P-AXIS_RCS_AUTOPILOT.agc:69
//# AUTOPILOT (WHENEVER THE DAP IS IN OPERATION).
// P-AXIS_RCS_AUTOPILOT.agc:70
//
// P-AXIS_RCS_AUTOPILOT.agc:71
//		CA	CDUXD
// slot 16538
                        if slot <> 16538 or instruction <> 13213 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 925).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16539 {
// P-AXIS_RCS_AUTOPILOT.agc:72
//		EXTEND
// slot 16539
                            if slot <> 16539 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:73
//		MSU	DELCDUX
// slot 16540
                            if slot <> 16540 or instruction <> 9120 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 928).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16542 {
                        if slot <= 16541 {
// P-AXIS_RCS_AUTOPILOT.agc:74
//		TC	1STOTWOS
// slot 16541
                            if slot <> 16541 or instruction <> 1198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1198, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:75
//		TS	CDUXD
// slot 16542
                            if slot <> 16542 or instruction <> 23453 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23453, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16543 {
// P-AXIS_RCS_AUTOPILOT.agc:76
//		CA	CDUYD
// slot 16543
                            if slot <> 16543 or instruction <> 13214 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 926).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:77
//		EXTEND
// slot 16544
                            if slot <> 16544 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 16551 {
                if slot <= 16547 {
                    if slot <= 16545 {
// P-AXIS_RCS_AUTOPILOT.agc:78
//		MSU	DELCDUY
// slot 16545
                        if slot <> 16545 or instruction <> 9121 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 929).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16546 {
// P-AXIS_RCS_AUTOPILOT.agc:79
//		TC	1STOTWOS
// slot 16546
                            if slot <> 16546 or instruction <> 1198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1198, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:80
//		TS	CDUYD
// slot 16547
                            if slot <> 16547 or instruction <> 23454 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23454, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16549 {
                        if slot <= 16548 {
// P-AXIS_RCS_AUTOPILOT.agc:81
//		CA	CDUZD
// slot 16548
                            if slot <> 16548 or instruction <> 13215 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 927).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:82
//		EXTEND
// slot 16549
                            if slot <> 16549 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16550 {
// P-AXIS_RCS_AUTOPILOT.agc:83
//		MSU	DELCDUZ
// slot 16550
                            if slot <> 16550 or instruction <> 9122 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 930).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:84
//# Page 1422
// P-AXIS_RCS_AUTOPILOT.agc:85
//		TC	1STOTWOS
// slot 16551
                            if slot <> 16551 or instruction <> 1198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1198, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16554 {
                    if slot <= 16552 {
// P-AXIS_RCS_AUTOPILOT.agc:86
//		TS	CDUZD
// slot 16552
                        if slot <> 16552 or instruction <> 23455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23455, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16553 {
// P-AXIS_RCS_AUTOPILOT.agc:87
//		EXTEND			# DIMINISH MANUAL CONTROL DIRECT RATE
// slot 16553
                            if slot <> 16553 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:88
//		DIM	TCP		# TIME COUNTERS.
// slot 16554
                            if slot <> 16554 or instruction <> 12069 { return choose false if checkOnly else -1. }
                            if extended {
                                local operandSlot is agcAddressSlot(805, words[3], words[4], words["channel7"]).
                                if operandSlot >= 16 and operandSlot <= 19 and
                                    (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDIM(words, 805).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16556 {
                        if slot <= 16555 {
// P-AXIS_RCS_AUTOPILOT.agc:89
//		EXTEND
// slot 16555
                            if slot <> 16555 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:90
//		DIM	TCQR
// slot 16556
                            if slot <> 16556 or instruction <> 12079 { return choose false if checkOnly else -1. }
                            if extended {
                                local operandSlot is agcAddressSlot(815, words[3], words[4], words["channel7"]).
                                if operandSlot >= 16 and operandSlot <= 19 and
                                    (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDIM(words, 815).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16557 {
// P-AXIS_RCS_AUTOPILOT.agc:91
//
// P-AXIS_RCS_AUTOPILOT.agc:92
//# RATFLOOP COMPUTES JETRATEQ, JRATER, AND 1JACC*NO. PJEETS IN ITEMP1.
// P-AXIS_RCS_AUTOPILOT.agc:93
//# RETURNS TO BACKP.
// P-AXIS_RCS_AUTOPILOT.agc:94
//#
// P-AXIS_RCS_AUTOPILOT.agc:95
//# JETRATE = 1JACC*NO.PJETS*TJP		(NOTE TJ IS THE TIME FIRED DURING CSP)
// P-AXIS_RCS_AUTOPILOT.agc:96
//# JETRATEQ = 1JACCQ(TJU*NO.UJETS - TJV*NO.VJETS)
// P-AXIS_RCS_AUTOPILOT.agc:97
//# JETRATER = 1JACCR(TJU*NO.UJETS + TJV*NO.VJETS)
// P-AXIS_RCS_AUTOPILOT.agc:98
//
// P-AXIS_RCS_AUTOPILOT.agc:99
//		TCF	PAXFILT		# PROCEEDS TO RATELOOP AFTER SUPERJOB
// slot 16557
                            if slot <> 16557 or instruction <> 5543 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5543, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:100
//1STOTWOS	CCS	A
// slot 16558
                            if slot <> 16558 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 16572 {
            if slot <= 16565 {
                if slot <= 16561 {
                    if slot <= 16559 {
// P-AXIS_RCS_AUTOPILOT.agc:101
//		AD	ONE
// slot 16559
                        if slot <> 16559 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                        if slot <= 16560 {
// P-AXIS_RCS_AUTOPILOT.agc:102
//		TC	Q
// slot 16560
                            if slot <> 16560 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:103
//		CS	A
// slot 16561
                            if slot <> 16561 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16563 {
                        if slot <= 16562 {
// P-AXIS_RCS_AUTOPILOT.agc:104
//		TC	Q
// slot 16562
                            if slot <> 16562 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:105
//SUBDIVDE	EXTEND			# OVERFLOW PROTECTION ROUTINE TO GIVE
// slot 16563
                            if slot <> 16563 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16564 {
// P-AXIS_RCS_AUTOPILOT.agc:106
//		MP	DAPTEMP3	# POSMAX OR NEGMAX IF THE DIVIDE WOULD
// slot 16564
                            if slot <> 16564 or instruction <> 29665 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 993, readEffective:call(words, 993)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:107
//		DAS	OMEGAU		# OVERFLOW
// slot 16565
                            if slot <> 16565 or instruction <> 8983 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 791) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16568 {
                    if slot <= 16566 {
// P-AXIS_RCS_AUTOPILOT.agc:108
//
// P-AXIS_RCS_AUTOPILOT.agc:109
// +3		EXTEND
// slot 16566
                        if slot <> 16566 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16567 {
// P-AXIS_RCS_AUTOPILOT.agc:110
//		DCA	OMEGAU
// slot 16567
                            if slot <> 16567 or instruction <> 13079 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:111
//		DXCH	DAPTEMP5
// slot 16568
                            if slot <> 16568 or instruction <> 22500 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 996, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16570 {
                        if slot <= 16569 {
// P-AXIS_RCS_AUTOPILOT.agc:112
//		CCS	OMEGAU
// slot 16569
                            if slot <> 16569 or instruction <> 4886 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 790).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:113
//		TCF	+2
// slot 16570
                            if slot <> 16570 or instruction <> 5308 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5308, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16571 {
// P-AXIS_RCS_AUTOPILOT.agc:114
//		TCF	DIVIDER
// slot 16571
                            if slot <> 16571 or instruction <> 5316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:115
//		AD	-OCT630
// slot 16572
                            if slot <> 16572 or instruction <> 25805 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1229), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16579 {
                if slot <= 16575 {
                    if slot <= 16573 {
// P-AXIS_RCS_AUTOPILOT.agc:116
//		EXTEND
// slot 16573
                        if slot <> 16573 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16574 {
// P-AXIS_RCS_AUTOPILOT.agc:117
//		BZMF	DIVIDER
// slot 16574
                            if slot <> 16574 or instruction <> 25796 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25796, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:118
//
// P-AXIS_RCS_AUTOPILOT.agc:119
//		CCS	OMEGAU
// slot 16575
                            if slot <> 16575 or instruction <> 4886 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 790).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16577 {
                        if slot <= 16576 {
// P-AXIS_RCS_AUTOPILOT.agc:120
//		CA	POSMAX		# 45 DEG/SEC
// slot 16576
                            if slot <> 16576 or instruction <> 14811 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:121
//		TC	Q
// slot 16577
                            if slot <> 16577 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16578 {
// P-AXIS_RCS_AUTOPILOT.agc:122
//		CS	POSMAX
// slot 16578
                            if slot <> 16578 or instruction <> 18907 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:123
//		TC	Q
// slot 16579
                            if slot <> 16579 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16582 {
                    if slot <= 16580 {
// P-AXIS_RCS_AUTOPILOT.agc:124
//
// P-AXIS_RCS_AUTOPILOT.agc:125
//DIVIDER		DXCH	OMEGAU
// slot 16580
                        if slot <> 16580 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16581 {
// P-AXIS_RCS_AUTOPILOT.agc:126
//		EXTEND
// slot 16581
                            if slot <> 16581 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:127
//		DV	DAPTREG4
// slot 16582
                            if slot <> 16582 or instruction <> 5096 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 1000, readEffective:call(words, 1000)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16584 {
                        if slot <= 16583 {
// P-AXIS_RCS_AUTOPILOT.agc:128
//		TC	Q
// slot 16583
                            if slot <> 16583 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:129
//
// P-AXIS_RCS_AUTOPILOT.agc:130
//OVERSUB		TS	7		# RETURNS A UNCHANGED OR LIMITED TO
// slot 16584
                            if slot <> 16584 or instruction <> 22535 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22535, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16585 {
// P-AXIS_RCS_AUTOPILOT.agc:131
//		TC	Q		# POSMAX OR NEGMAX IF A HAS OVERFLOW
// slot 16585
                            if slot <> 16585 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:132
//		INDEX	A
// slot 16586
                            if slot <> 16586 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1003] to agcAotUnit1003@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:133
//		CS	BIT15 	-1
// slot 16587
    16587, 37816
)).

// bank 16, slots 16588-16588
function agcAotUnit1004 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P-AXIS_RCS_AUTOPILOT.agc:134
//# Page 1423
// P-AXIS_RCS_AUTOPILOT.agc:135
//		TC	Q
// slot 16588
    if slot <> 16588 or instruction <> 2 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1004] to agcAotUnit1004@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:136
//
// P-AXIS_RCS_AUTOPILOT.agc:137
//-OCT630		OCT	77147
// slot 16589
    16589, 64718
)).

// bank 16, slots 16590-16653
function agcAotUnit1005 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16621 {
        if slot <= 16605 {
            if slot <= 16597 {
                if slot <= 16593 {
                    if slot <= 16591 {
                        if slot <= 16590 {
// P-AXIS_RCS_AUTOPILOT.agc:138
//
// P-AXIS_RCS_AUTOPILOT.agc:139
//BACKP		CA	DAPTEMP1
// slot 16590
                            if slot <> 16590 or instruction <> 13279 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:140
//		EXTEND
// slot 16591
                            if slot <> 16591 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16592 {
// P-AXIS_RCS_AUTOPILOT.agc:141
//		MP	1JACC
// slot 16592
                            if slot <> 16592 or instruction <> 29528 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 856, readEffective:call(words, 856)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:142
//		TS	JETRATE
// slot 16593
                            if slot <> 16593 or instruction <> 23525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23525, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16595 {
                        if slot <= 16594 {
// P-AXIS_RCS_AUTOPILOT.agc:143
//
// P-AXIS_RCS_AUTOPILOT.agc:144
//# BEGINNING OF THE RATE DERIVATION
// P-AXIS_RCS_AUTOPILOT.agc:145
//#	OMEGAP,Q,R	BODY RATES SCALED AT PI/4
// P-AXIS_RCS_AUTOPILOT.agc:146
//#	TRAPEDP,Q,R	BODY ANGLE ERRORS FROM PREDICTED ANGLE (PI/40)
// P-AXIS_RCS_AUTOPILOT.agc:147
//#	NP(QR)TRAPS	NUMBER OF TIMES ANGLE ERROR HAS BEEN ACCUMULATED
// P-AXIS_RCS_AUTOPILOT.agc:148
//#	AOSQ(R)TERM	CHANGE IN RATE DUE TO OFFSET ACCELERATION.  (PI/4)
// P-AXIS_RCS_AUTOPILOT.agc:149
//#	JETRATE,Q,R	CHANGE IN RATE DUE TO  JET   ACCELERATION.  (PI/4)
// P-AXIS_RCS_AUTOPILOT.agc:150
//#	TRAPSIZE	NEGATIVE LIMIT OF MAGNITUDE OF TRAPEDP, ETC.
// P-AXIS_RCS_AUTOPILOT.agc:151
//#	OMEGAU		DP-TEMPORARY STORAGE
// P-AXIS_RCS_AUTOPILOT.agc:152
//# OMEGA = OMEGA + JETRATE + AOSTERM (+TRAPED/NTRAPS IF TRAPED BIG)
// P-AXIS_RCS_AUTOPILOT.agc:153
//
// P-AXIS_RCS_AUTOPILOT.agc:154
//		CAE	DAPTREG4	# CDUX IS STORED HERE
// slot 16594
                            if slot <> 16594 or instruction <> 13288 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1000).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:155
//		TS	L
// slot 16595
                            if slot <> 16595 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16596 {
// P-AXIS_RCS_AUTOPILOT.agc:156
//		EXTEND
// slot 16596
                            if slot <> 16596 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:157
//		MSU	OLDXFORP	# SCALED AT PI
// slot 16597
                            if slot <> 16597 or instruction <> 8992 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 800).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16601 {
                    if slot <= 16599 {
                        if slot <= 16598 {
// P-AXIS_RCS_AUTOPILOT.agc:158
//		LXCH	OLDXFORP
// slot 16598
                            if slot <> 16598 or instruction <> 10016 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 800, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:159
//		TS	DAPTEMP1
// slot 16599
                            if slot <> 16599 or instruction <> 23519 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23519, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16600 {
// P-AXIS_RCS_AUTOPILOT.agc:160
//		CA	1/40
// slot 16600
                            if slot <> 16600 or instruction <> 14224 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1936), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:161
//		TS	DAPTREG4
// slot 16601
                            if slot <> 16601 or instruction <> 23528 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23528, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16603 {
                        if slot <= 16602 {
// P-AXIS_RCS_AUTOPILOT.agc:162
//		CS	JETRATE
// slot 16602
                            if slot <> 16602 or instruction <> 17381 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 997).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:163
//		EXTEND
// slot 16603
                            if slot <> 16603 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16604 {
// P-AXIS_RCS_AUTOPILOT.agc:164
//		MP	BIT14
// slot 16604
                            if slot <> 16604 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:165
//		ADS	TRAPEDP
// slot 16605
                            if slot <> 16605 or instruction <> 12056 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 792).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16613 {
                if slot <= 16609 {
                    if slot <= 16607 {
                        if slot <= 16606 {
// P-AXIS_RCS_AUTOPILOT.agc:166
//		CA	JETRATEQ
// slot 16606
                            if slot <> 16606 or instruction <> 13286 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 998).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:167
//		AD	AOSQTERM
// slot 16607
                            if slot <> 16607 or instruction <> 25445 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 869).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16608 {
// P-AXIS_RCS_AUTOPILOT.agc:168
//		EXTEND
// slot 16608
                            if slot <> 16608 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:169
//		MP	-BIT14
// slot 16609
                            if slot <> 16609 or instruction <> 32734 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 4062, readEffective:call(words, 4062)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16611 {
                        if slot <= 16610 {
// P-AXIS_RCS_AUTOPILOT.agc:170
//		ADS	TRAPEDQ
// slot 16610
                            if slot <> 16610 or instruction <> 12057 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 793).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:171
//		CA	JETRATER
// slot 16611
                            if slot <> 16611 or instruction <> 13287 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 999).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16612 {
// P-AXIS_RCS_AUTOPILOT.agc:172
//		AD	AOSRTERM
// slot 16612
                            if slot <> 16612 or instruction <> 25446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 870).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:173
//		EXTEND
// slot 16613
                            if slot <> 16613 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16617 {
                    if slot <= 16615 {
                        if slot <= 16614 {
// P-AXIS_RCS_AUTOPILOT.agc:174
//		MP	-BIT14
// slot 16614
                            if slot <> 16614 or instruction <> 32734 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 4062, readEffective:call(words, 4062)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:175
//		ADS	TRAPEDR
// slot 16615
                            if slot <> 16615 or instruction <> 12058 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 794).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16616 {
// P-AXIS_RCS_AUTOPILOT.agc:176
//
// P-AXIS_RCS_AUTOPILOT.agc:177
//		CA	DAPTREG5	# CDUY IS STORED HERE
// slot 16616
                            if slot <> 16616 or instruction <> 13289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1001).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:178
//		TS	L
// slot 16617
                            if slot <> 16617 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16619 {
                        if slot <= 16618 {
// P-AXIS_RCS_AUTOPILOT.agc:179
//		EXTEND
// slot 16618
                            if slot <> 16618 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:180
//		MSU	OLDYFORP	# SCALED AT PI
// slot 16619
                            if slot <> 16619 or instruction <> 8993 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 801).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16620 {
// P-AXIS_RCS_AUTOPILOT.agc:181
//		LXCH	OLDYFORP
// slot 16620
                            if slot <> 16620 or instruction <> 10017 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 801, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:182
//		TS	DAPTEMP2
// slot 16621
                            if slot <> 16621 or instruction <> 23520 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23520, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16637 {
            if slot <= 16629 {
                if slot <= 16625 {
                    if slot <= 16623 {
                        if slot <= 16622 {
// P-AXIS_RCS_AUTOPILOT.agc:183
//		EXTEND
// slot 16622
                            if slot <> 16622 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:184
//		MP	M11		# M11 SCALED AT 1
// slot 16623
                            if slot <> 16623 or instruction <> 29452 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 780, readEffective:call(words, 780)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16624 {
// P-AXIS_RCS_AUTOPILOT.agc:185
//# Page 1424
// P-AXIS_RCS_AUTOPILOT.agc:186
//		AD	DAPTEMP1
// slot 16624
                            if slot <> 16624 or instruction <> 25567 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 991).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:187
//		DXCH	OMEGAU
// slot 16625
                            if slot <> 16625 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16627 {
                        if slot <= 16626 {
// P-AXIS_RCS_AUTOPILOT.agc:188
//
// P-AXIS_RCS_AUTOPILOT.agc:189
//		TC	SUBDIVDE +3	# RETURNS WITH CDU-RATE AT PI/4
// slot 16626
                            if slot <> 16626 or instruction <> 1206 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1206, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:190
//
// P-AXIS_RCS_AUTOPILOT.agc:191
//		EXTEND
// slot 16627
                            if slot <> 16627 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16628 {
// P-AXIS_RCS_AUTOPILOT.agc:192
//		SU	OMEGAP
// slot 16628
                            if slot <> 16628 or instruction <> 25361 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 785).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:193
//		ADS	TRAPEDP
// slot 16629
                            if slot <> 16629 or instruction <> 12056 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 792).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16633 {
                    if slot <= 16631 {
                        if slot <= 16630 {
// P-AXIS_RCS_AUTOPILOT.agc:194
//		TC	OVERSUB
// slot 16630
                            if slot <> 16630 or instruction <> 1224 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1224, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:195
//		TS	TRAPEDP
// slot 16631
                            if slot <> 16631 or instruction <> 23320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23320, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16632 {
// P-AXIS_RCS_AUTOPILOT.agc:196
//		EXTEND
// slot 16632
                            if slot <> 16632 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:197
//		DCA	DAPTEMP5
// slot 16633
                            if slot <> 16633 or instruction <> 13284 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 996, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16635 {
                        if slot <= 16634 {
// P-AXIS_RCS_AUTOPILOT.agc:198
//		DAS	DXERROR
// slot 16634
                            if slot <> 16634 or instruction <> 8999 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 807) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:199
//		CS	PLAST
// slot 16635
                            if slot <> 16635 or instruction <> 17196 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 812).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16636 {
// P-AXIS_RCS_AUTOPILOT.agc:200
//		EXTEND
// slot 16636
                            if slot <> 16636 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:201
//		MP	1/40
// slot 16637
                            if slot <> 16637 or instruction <> 30608 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1936, readEffective:call(words, 1936)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16645 {
                if slot <= 16641 {
                    if slot <= 16639 {
                        if slot <= 16638 {
// P-AXIS_RCS_AUTOPILOT.agc:202
//		DAS	DXERROR		# MANUAL MODE X-ATTITUDE ERROR (DP)
// slot 16638
                            if slot <> 16638 or instruction <> 8999 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 807) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:203
//		CA	DAPTREG6	# CDUZ IS STORED HERE
// slot 16639
                            if slot <> 16639 or instruction <> 13290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1002).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16640 {
// P-AXIS_RCS_AUTOPILOT.agc:204
//		TS	L
// slot 16640
                            if slot <> 16640 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:205
//		EXTEND
// slot 16641
                            if slot <> 16641 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16643 {
                        if slot <= 16642 {
// P-AXIS_RCS_AUTOPILOT.agc:206
//		MSU	OLDZFORQ
// slot 16642
                            if slot <> 16642 or instruction <> 8994 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMSU(words, 802).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:207
//		TS	DAPTEMP3
// slot 16643
                            if slot <> 16643 or instruction <> 23521 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23521, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16644 {
// P-AXIS_RCS_AUTOPILOT.agc:208
//		LXCH	OLDZFORQ
// slot 16644
                            if slot <> 16644 or instruction <> 10018 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 802, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:209
//		CA	M21
// slot 16645
                            if slot <> 16645 or instruction <> 13069 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 781).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16649 {
                    if slot <= 16647 {
                        if slot <= 16646 {
// P-AXIS_RCS_AUTOPILOT.agc:210
//		EXTEND
// slot 16646
                            if slot <> 16646 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:211
//		MP	DAPTEMP2
// slot 16647
                            if slot <> 16647 or instruction <> 29664 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 992, readEffective:call(words, 992)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16648 {
// P-AXIS_RCS_AUTOPILOT.agc:212
//		DXCH	OMEGAU
// slot 16648
                            if slot <> 16648 or instruction <> 22295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:213
//		CA	M22
// slot 16649
                            if slot <> 16649 or instruction <> 13071 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 783).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16651 {
                        if slot <= 16650 {
// P-AXIS_RCS_AUTOPILOT.agc:214
//		TC	SUBDIVDE
// slot 16650
                            if slot <> 16650 or instruction <> 1203 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1203, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:215
//
// P-AXIS_RCS_AUTOPILOT.agc:216
//		EXTEND
// slot 16651
                            if slot <> 16651 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16652 {
// P-AXIS_RCS_AUTOPILOT.agc:217
//		SU	OMEGAQ
// slot 16652
                            if slot <> 16652 or instruction <> 25362 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 786).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:218
//		ADS	TRAPEDQ
// slot 16653
                            if slot <> 16653 or instruction <> 12057 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 793).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1005] to agcAotUnit1005@.

// bank 16, slots 16654-16781
function agcAotUnit1006 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16717 {
        if slot <= 16685 {
            if slot <= 16669 {
                if slot <= 16661 {
                    if slot <= 16657 {
                        if slot <= 16655 {
                            if slot <= 16654 {
// P-AXIS_RCS_AUTOPILOT.agc:219
//		TC	OVERSUB
// slot 16654
                                if slot <> 16654 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:220
//		TS	TRAPEDQ
// slot 16655
                                if slot <> 16655 or instruction <> 23321 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23321, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16656 {
// P-AXIS_RCS_AUTOPILOT.agc:221
//		EXTEND
// slot 16656
                                if slot <> 16656 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:222
//		DCA	DAPTEMP5
// slot 16657
                                if slot <> 16657 or instruction <> 13284 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 996, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16659 {
                            if slot <= 16658 {
// P-AXIS_RCS_AUTOPILOT.agc:223
//		DAS	DYERROR
// slot 16658
                                if slot <> 16658 or instruction <> 9001 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 809) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:224
//		CS	QLAST
// slot 16659
                                if slot <> 16659 or instruction <> 17197 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 813).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16660 {
// P-AXIS_RCS_AUTOPILOT.agc:225
//		EXTEND
// slot 16660
                                if slot <> 16660 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:226
//		MP	1/40
// slot 16661
                                if slot <> 16661 or instruction <> 30608 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1936, readEffective:call(words, 1936)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16665 {
                        if slot <= 16663 {
                            if slot <= 16662 {
// P-AXIS_RCS_AUTOPILOT.agc:227
//		DAS	DYERROR		# MANUAL MODE Y-ATTITUDE ERROR (DP)
// slot 16662
                                if slot <> 16662 or instruction <> 9001 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 809) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:228
//		CA	M31
// slot 16663
                                if slot <> 16663 or instruction <> 13070 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 782).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16664 {
// P-AXIS_RCS_AUTOPILOT.agc:229
//		EXTEND
// slot 16664
                                if slot <> 16664 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:230
//		MP	DAPTEMP2
// slot 16665
                                if slot <> 16665 or instruction <> 29664 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 992, readEffective:call(words, 992)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16667 {
                            if slot <= 16666 {
// P-AXIS_RCS_AUTOPILOT.agc:231
//		DXCH	OMEGAU
// slot 16666
                                if slot <> 16666 or instruction <> 22295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:232
//		CA	M32
// slot 16667
                                if slot <> 16667 or instruction <> 13072 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 784).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16668 {
// P-AXIS_RCS_AUTOPILOT.agc:233
//
// P-AXIS_RCS_AUTOPILOT.agc:234
//		TC	SUBDIVDE
// slot 16668
                                if slot <> 16668 or instruction <> 1203 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1203, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:235
//# Page 1425
// P-AXIS_RCS_AUTOPILOT.agc:236
//		EXTEND
// slot 16669
                                if slot <> 16669 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 16677 {
                    if slot <= 16673 {
                        if slot <= 16671 {
                            if slot <= 16670 {
// P-AXIS_RCS_AUTOPILOT.agc:237
//		SU	OMEGAR
// slot 16670
                                if slot <> 16670 or instruction <> 25363 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreSU(words, 787).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:238
//		ADS	TRAPEDR
// slot 16671
                                if slot <> 16671 or instruction <> 12058 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 794).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16672 {
// P-AXIS_RCS_AUTOPILOT.agc:239
//		TC	OVERSUB
// slot 16672
                                if slot <> 16672 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:240
//		TS	TRAPEDR		# TRAPEDS HAVE ALL BEEN COMPUTED
// slot 16673
                                if slot <> 16673 or instruction <> 23322 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23322, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16675 {
                            if slot <= 16674 {
// P-AXIS_RCS_AUTOPILOT.agc:241
//
// P-AXIS_RCS_AUTOPILOT.agc:242
//		EXTEND
// slot 16674
                                if slot <> 16674 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:243
//		DCA	DAPTEMP5
// slot 16675
                                if slot <> 16675 or instruction <> 13284 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 996, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16676 {
// P-AXIS_RCS_AUTOPILOT.agc:244
//		DAS	DZERROR
// slot 16676
                                if slot <> 16676 or instruction <> 9003 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 811) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:245
//		CS	RLAST
// slot 16677
                                if slot <> 16677 or instruction <> 17198 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 814).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16681 {
                        if slot <= 16679 {
                            if slot <= 16678 {
// P-AXIS_RCS_AUTOPILOT.agc:246
//		EXTEND
// slot 16678
                                if slot <> 16678 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:247
//		MP	1/40
// slot 16679
                                if slot <> 16679 or instruction <> 30608 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1936, readEffective:call(words, 1936)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16680 {
// P-AXIS_RCS_AUTOPILOT.agc:248
//		DAS	DZERROR		# MANUAL MODE Z-ATTITUDE ERROR (DP)
// slot 16680
                                if slot <> 16680 or instruction <> 9003 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 811) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:249
//		CA	DAPBOOLS	# PICK UP PAD LOADED STATE ESTIMATOR GAINS
// slot 16681
                                if slot <> 16681 or instruction <> 12361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 73).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16683 {
                            if slot <= 16682 {
// P-AXIS_RCS_AUTOPILOT.agc:250
//		MASK	CSMDOCKD
// slot 16682
                                if slot <> 16682 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:251
//		EXTEND
// slot 16683
                                if slot <> 16683 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16684 {
// P-AXIS_RCS_AUTOPILOT.agc:252
//		BZF	LMONLY
// slot 16684
                                if slot <> 16684 or instruction <> 5426 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5426, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:253
//		EXTEND			# DOCKED
// slot 16685
                                if slot <> 16685 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 16701 {
                if slot <= 16693 {
                    if slot <= 16689 {
                        if slot <= 16687 {
                            if slot <= 16686 {
// P-AXIS_RCS_AUTOPILOT.agc:254
//		DCA	DKOMEGAN
// slot 16686
                                if slot <> 16686 or instruction <> 13061 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 773, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:255
//		DXCH	DAPTREG4
// slot 16687
                                if slot <> 16687 or instruction <> 22505 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 1001, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16688 {
// P-AXIS_RCS_AUTOPILOT.agc:256
//		CA	DKTRAP
// slot 16688
                                if slot <> 16688 or instruction <> 13059 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 771).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:257
//		TCF	+5
// slot 16689
                                if slot <> 16689 or instruction <> 5430 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5430, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16691 {
                            if slot <= 16690 {
// P-AXIS_RCS_AUTOPILOT.agc:258
//LMONLY		EXTEND			# UNDOCKED
// slot 16690
                                if slot <> 16690 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:259
//		DCA	LMOMEGAN
// slot 16691
                                if slot <> 16691 or instruction <> 13064 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 776, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16692 {
// P-AXIS_RCS_AUTOPILOT.agc:260
//		DXCH	DAPTREG4
// slot 16692
                                if slot <> 16692 or instruction <> 22505 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 1001, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:261
//		CA	LMTRAP
// slot 16693
                                if slot <> 16693 or instruction <> 13062 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 774).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16697 {
                        if slot <= 16695 {
                            if slot <= 16694 {
// P-AXIS_RCS_AUTOPILOT.agc:262
// +5		TS	DAPTREG6
// slot 16694
                                if slot <> 16694 or instruction <> 23530 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23530, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:263
//		CCS	TRAPEDP
// slot 16695
                                if slot <> 16695 or instruction <> 4888 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 792).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16696 {
// P-AXIS_RCS_AUTOPILOT.agc:264
//		TCF	+2
// slot 16696
                                if slot <> 16696 or instruction <> 5434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:265
//		TCF	SMALPDIF
// slot 16697
                                if slot <> 16697 or instruction <> 5447 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5447, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16699 {
                            if slot <= 16698 {
// P-AXIS_RCS_AUTOPILOT.agc:266
//		AD	DAPTREG6	# TRAPSIZE > ABOUT 77001 %-1.4DEG/SEC"
// slot 16698
                                if slot <> 16698 or instruction <> 25578 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1002).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:267
//		EXTEND
// slot 16699
                                if slot <> 16699 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16700 {
// P-AXIS_RCS_AUTOPILOT.agc:268
//		BZMF	SMALPDIF
// slot 16700
                                if slot <> 16700 or instruction <> 25927 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25927, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:269
//		ZL
// slot 16701
                                if slot <> 16701 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16709 {
                    if slot <= 16705 {
                        if slot <= 16703 {
                            if slot <= 16702 {
// P-AXIS_RCS_AUTOPILOT.agc:270
//		LXCH	TRAPEDP
// slot 16702
                                if slot <> 16702 or instruction <> 10008 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 792, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:271
//		CA	ZERO
// slot 16703
                                if slot <> 16703 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                            if slot <= 16704 {
// P-AXIS_RCS_AUTOPILOT.agc:272
//		EXTEND
// slot 16704
                                if slot <> 16704 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:273
//		DV	NPTRAPS
// slot 16705
                                if slot <> 16705 or instruction <> 4891 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 795, readEffective:call(words, 795)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16707 {
                            if slot <= 16706 {
// P-AXIS_RCS_AUTOPILOT.agc:274
//		ADS	OMEGAP
// slot 16706
                                if slot <> 16706 or instruction <> 12049 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 785).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:275
//		TC	OVERSUB
// slot 16707
                                if slot <> 16707 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16708 {
// P-AXIS_RCS_AUTOPILOT.agc:276
//		TS	OMEGAP
// slot 16708
                                if slot <> 16708 or instruction <> 23313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:277
//		CA	DAPTREG4	ABOUT 10 OR 0 FOR DOCKED OR UNDOCKED
// slot 16709
                                if slot <> 16709 or instruction <> 13288 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1000).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16713 {
                        if slot <= 16711 {
                            if slot <= 16710 {
// P-AXIS_RCS_AUTOPILOT.agc:278
//		TS	NPTRAPS
// slot 16710
                                if slot <> 16710 or instruction <> 23323 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23323, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:279
//SMALPDIF	INCR	NPTRAPS
// slot 16711
                                if slot <> 16711 or instruction <> 11035 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 795).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16712 {
// P-AXIS_RCS_AUTOPILOT.agc:280
//P-RATE		CA	JETRATE
// slot 16712
                                if slot <> 16712 or instruction <> 13285 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 997).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:281
//		ADS	OMEGAP
// slot 16713
                                if slot <> 16713 or instruction <> 12049 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 785).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16715 {
                            if slot <= 16714 {
// P-AXIS_RCS_AUTOPILOT.agc:282
//		TC	OVERSUB
// slot 16714
                                if slot <> 16714 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:283
//		TS	OMEGAP
// slot 16715
                                if slot <> 16715 or instruction <> 23313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16716 {
// P-AXIS_RCS_AUTOPILOT.agc:284
//
// P-AXIS_RCS_AUTOPILOT.agc:285
//		CCS	TRAPEDQ
// slot 16716
                                if slot <> 16716 or instruction <> 4889 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 793).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:286
//# Page 1426
// P-AXIS_RCS_AUTOPILOT.agc:287
//		TCF	+2
// slot 16717
                                if slot <> 16717 or instruction <> 5455 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5455, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16749 {
            if slot <= 16733 {
                if slot <= 16725 {
                    if slot <= 16721 {
                        if slot <= 16719 {
                            if slot <= 16718 {
// P-AXIS_RCS_AUTOPILOT.agc:288
//		TCF	Q-RATE
// slot 16718
                                if slot <> 16718 or instruction <> 5476 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5476, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:289
//		AD	DAPTREG6	# TRAPSIZE > ABOUT 77001 %-1.4DEG/SEC"
// slot 16719
                                if slot <> 16719 or instruction <> 25578 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1002).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16720 {
// P-AXIS_RCS_AUTOPILOT.agc:290
//		EXTEND
// slot 16720
                                if slot <> 16720 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:291
//		BZMF	Q-RATE
// slot 16721
                                if slot <> 16721 or instruction <> 25956 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25956, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16723 {
                            if slot <= 16722 {
// P-AXIS_RCS_AUTOPILOT.agc:292
//		ZL
// slot 16722
                                if slot <> 16722 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:293
//		LXCH	TRAPEDQ
// slot 16723
                                if slot <> 16723 or instruction <> 10009 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 793, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16724 {
// P-AXIS_RCS_AUTOPILOT.agc:294
//		CA	ZERO
// slot 16724
                                if slot <> 16724 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:295
//		EXTEND
// slot 16725
                                if slot <> 16725 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16729 {
                        if slot <= 16727 {
                            if slot <= 16726 {
// P-AXIS_RCS_AUTOPILOT.agc:296
//		DV	NQTRAPS
// slot 16726
                                if slot <> 16726 or instruction <> 4892 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 796, readEffective:call(words, 796)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:297
//		TS	DAPTEMP1	# SAVE FOR OFFSET ESTIMATE
// slot 16727
                                if slot <> 16727 or instruction <> 23519 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16728 {
// P-AXIS_RCS_AUTOPILOT.agc:298
//		ADS	OMEGAQ
// slot 16728
                                if slot <> 16728 or instruction <> 12050 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 786).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:299
//		TC	OVERSUB
// slot 16729
                                if slot <> 16729 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16731 {
                            if slot <= 16730 {
// P-AXIS_RCS_AUTOPILOT.agc:300
//		TS	OMEGAQ
// slot 16730
                                if slot <> 16730 or instruction <> 23314 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23314, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:301
//		CA	DAPTREG4	# ABOUT 10 OR 0 FOR DOCKED OR UNDOCKED
// slot 16731
                                if slot <> 16731 or instruction <> 13288 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1000).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16732 {
// P-AXIS_RCS_AUTOPILOT.agc:302
//		XCH	NQTRAPS
// slot 16732
                                if slot <> 16732 or instruction <> 24348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 796, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:303
//		AD	DAPTREG5	# KAOS > ABOUT 60D %N/N_60"
// slot 16733
                                if slot <> 16733 or instruction <> 25577 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1001).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16741 {
                    if slot <= 16737 {
                        if slot <= 16735 {
                            if slot <= 16734 {
// P-AXIS_RCS_AUTOPILOT.agc:304
//		XCH	DAPTEMP1
// slot 16734
                                if slot <> 16734 or instruction <> 24543 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 991, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:305
//		EXTEND
// slot 16735
                                if slot <> 16735 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16736 {
// P-AXIS_RCS_AUTOPILOT.agc:306
//		MP	FIVE
// slot 16736
                                if slot <> 16736 or instruction <> 31214 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2542, readEffective:call(words, 2542)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:307
//		EXTEND
// slot 16737
                                if slot <> 16737 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16739 {
                            if slot <= 16738 {
// P-AXIS_RCS_AUTOPILOT.agc:308
//		DV	DAPTEMP1
// slot 16738
                                if slot <> 16738 or instruction <> 5087 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 991, readEffective:call(words, 991)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:309
//		ADS	AOSQ
// slot 16739
                                if slot <> 16739 or instruction <> 12127 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 863).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16740 {
// P-AXIS_RCS_AUTOPILOT.agc:310
//Q-RATE		INCR	NQTRAPS
// slot 16740
                                if slot <> 16740 or instruction <> 11036 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 796).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:311
//		CA	JETRATEQ
// slot 16741
                                if slot <> 16741 or instruction <> 13286 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 998).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16745 {
                        if slot <= 16743 {
                            if slot <= 16742 {
// P-AXIS_RCS_AUTOPILOT.agc:312
//		AD	AOSQTERM
// slot 16742
                                if slot <> 16742 or instruction <> 25445 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 869).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:313
//		ADS	OMEGAQ
// slot 16743
                                if slot <> 16743 or instruction <> 12050 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 786).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16744 {
// P-AXIS_RCS_AUTOPILOT.agc:314
//		TC	OVERSUB
// slot 16744
                                if slot <> 16744 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:315
//		TS	OMEGAQ
// slot 16745
                                if slot <> 16745 or instruction <> 23314 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23314, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16747 {
                            if slot <= 16746 {
// P-AXIS_RCS_AUTOPILOT.agc:316
//
// P-AXIS_RCS_AUTOPILOT.agc:317
//		CCS	TRAPEDR
// slot 16746
                                if slot <> 16746 or instruction <> 4890 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 794).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:318
//		TCF	+2
// slot 16747
                                if slot <> 16747 or instruction <> 5485 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5485, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16748 {
// P-AXIS_RCS_AUTOPILOT.agc:319
//		TCF	R-RATE
// slot 16748
                                if slot <> 16748 or instruction <> 5506 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5506, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:320
//		AD	DAPTREG6	# TRAPSIZE > ABOUT 77001 %-1.4DEG/SEC"
// slot 16749
                                if slot <> 16749 or instruction <> 25578 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1002).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16765 {
                if slot <= 16757 {
                    if slot <= 16753 {
                        if slot <= 16751 {
                            if slot <= 16750 {
// P-AXIS_RCS_AUTOPILOT.agc:321
//		EXTEND
// slot 16750
                                if slot <> 16750 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:322
//		BZMF	R-RATE
// slot 16751
                                if slot <> 16751 or instruction <> 25986 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16752 {
// P-AXIS_RCS_AUTOPILOT.agc:323
//		ZL
// slot 16752
                                if slot <> 16752 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:324
//		LXCH	TRAPEDR
// slot 16753
                                if slot <> 16753 or instruction <> 10010 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 794, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16755 {
                            if slot <= 16754 {
// P-AXIS_RCS_AUTOPILOT.agc:325
//		CA	ZERO
// slot 16754
                                if slot <> 16754 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:326
//		EXTEND
// slot 16755
                                if slot <> 16755 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16756 {
// P-AXIS_RCS_AUTOPILOT.agc:327
//		DV	NRTRAPS
// slot 16756
                                if slot <> 16756 or instruction <> 4893 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 797, readEffective:call(words, 797)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:328
//		TS	DAPTEMP2	# SAVE FOR OFFSET ESTIMATE
// slot 16757
                                if slot <> 16757 or instruction <> 23520 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23520, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16761 {
                        if slot <= 16759 {
                            if slot <= 16758 {
// P-AXIS_RCS_AUTOPILOT.agc:329
//		ADS	OMEGAR
// slot 16758
                                if slot <> 16758 or instruction <> 12051 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 787).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:330
//		TC	OVERSUB
// slot 16759
                                if slot <> 16759 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16760 {
// P-AXIS_RCS_AUTOPILOT.agc:331
//		TS	OMEGAR
// slot 16760
                                if slot <> 16760 or instruction <> 23315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:332
//		CA	DAPTREG4	# ABOUT 10 OR 0 FOR DOCKED OR UNDOCKED
// slot 16761
                                if slot <> 16761 or instruction <> 13288 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1000).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16763 {
                            if slot <= 16762 {
// P-AXIS_RCS_AUTOPILOT.agc:333
//		XCH	NRTRAPS
// slot 16762
                                if slot <> 16762 or instruction <> 24349 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 797, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:334
//		AD	DAPTREG5	# KAOS > ABOUT 60D %N/N_60"
// slot 16763
                                if slot <> 16763 or instruction <> 25577 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 1001).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16764 {
// P-AXIS_RCS_AUTOPILOT.agc:335
//		XCH	DAPTEMP2
// slot 16764
                                if slot <> 16764 or instruction <> 24544 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 992, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:336
//		EXTEND
// slot 16765
                                if slot <> 16765 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 16773 {
                    if slot <= 16769 {
                        if slot <= 16767 {
                            if slot <= 16766 {
// P-AXIS_RCS_AUTOPILOT.agc:337
//# Page 1427
// P-AXIS_RCS_AUTOPILOT.agc:338
//		MP	FIVE
// slot 16766
                                if slot <> 16766 or instruction <> 31214 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2542, readEffective:call(words, 2542)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:339
//		EXTEND
// slot 16767
                                if slot <> 16767 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16768 {
// P-AXIS_RCS_AUTOPILOT.agc:340
//		DV	DAPTEMP2
// slot 16768
                                if slot <> 16768 or instruction <> 5088 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 992, readEffective:call(words, 992)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:341
//		ADS	AOSR
// slot 16769
                                if slot <> 16769 or instruction <> 12129 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 865).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16771 {
                            if slot <= 16770 {
// P-AXIS_RCS_AUTOPILOT.agc:342
//R-RATE		INCR	NRTRAPS
// slot 16770
                                if slot <> 16770 or instruction <> 11037 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 797).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:343
//		CA	JETRATER
// slot 16771
                                if slot <> 16771 or instruction <> 13287 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 999).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16772 {
// P-AXIS_RCS_AUTOPILOT.agc:344
//		AD	AOSRTERM
// slot 16772
                                if slot <> 16772 or instruction <> 25446 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 870).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:345
//		ADS	OMEGAR
// slot 16773
                                if slot <> 16773 or instruction <> 12051 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 787).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16777 {
                        if slot <= 16775 {
                            if slot <= 16774 {
// P-AXIS_RCS_AUTOPILOT.agc:346
//		TC	OVERSUB
// slot 16774
                                if slot <> 16774 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:347
//		TS	OMEGAR
// slot 16775
                                if slot <> 16775 or instruction <> 23315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16776 {
// P-AXIS_RCS_AUTOPILOT.agc:348
//
// P-AXIS_RCS_AUTOPILOT.agc:349
//# END OF RATE DERIVATION
// P-AXIS_RCS_AUTOPILOT.agc:350
//#	BEGIN OFFSET ESTIMATER
// P-AXIS_RCS_AUTOPILOT.agc:351
//#		IN POWERED FLIGHT, AOSTASK WILL BE CALLED EVERY 2 SECONDS.
// P-AXIS_RCS_AUTOPILOT.agc:352
//#			AOS = AOS + K*SUMRATE
// P-AXIS_RCS_AUTOPILOT.agc:353
//
// P-AXIS_RCS_AUTOPILOT.agc:354
//		CS	DAPBOOLS
// slot 16776
                                if slot <> 16776 or instruction <> 16457 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 73).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:355
//		MASK 	DRIFTBIT
// slot 16777
                                if slot <> 16777 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
                            }
                        }
                    } else {
                        if slot <= 16779 {
                            if slot <= 16778 {
// P-AXIS_RCS_AUTOPILOT.agc:356
//		CCS	A
// slot 16778
                                if slot <> 16778 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:357
//		TCF	WORKTIME
// slot 16779
                                if slot <> 16779 or instruction <> 5524 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5524, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 16780 {
// P-AXIS_RCS_AUTOPILOT.agc:358
//		TS	ALPHAQ		# ZERO THE OFFSET ACCELERATION VALUES.
// slot 16780
                                if slot <> 16780 or instruction <> 23316 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23316, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:359
//		TS	ALPHAR
// slot 16781
                                if slot <> 16781 or instruction <> 23317 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23317, words[0], readEffective).
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
set agcAotRoutes[1006] to agcAotUnit1006@.

// bank 16, slots 16782-16786
function agcAotUnit1007 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16783 {
        if slot <= 16782 {
// P-AXIS_RCS_AUTOPILOT.agc:360
//		TS	AOSQTERM
// slot 16782
            if slot <> 16782 or instruction <> 23397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23397, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P-AXIS_RCS_AUTOPILOT.agc:361
//		TS	AOSRTERM
// slot 16783
            if slot <> 16783 or instruction <> 23398 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23398, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 16784 {
// P-AXIS_RCS_AUTOPILOT.agc:362
//		TS	AOSQ
// slot 16784
            if slot <> 16784 or instruction <> 23391 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23391, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16785 {
// P-AXIS_RCS_AUTOPILOT.agc:363
//		TS	AOSR
// slot 16785
                if slot <> 16785 or instruction <> 23393 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:364
//		TCF	PRETIMCK
// slot 16786
                if slot <> 16786 or instruction <> 5559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1007] to agcAotUnit1007@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:365
//KAOS		DEC	60
// slot 16787
    16787, 120
)).

// bank 16, slots 16788-16820
function agcAotUnit1008 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16803 {
        if slot <= 16795 {
            if slot <= 16791 {
                if slot <= 16789 {
                    if slot <= 16788 {
// P-AXIS_RCS_AUTOPILOT.agc:366
//WORKTIME	CA	QACCDOT
// slot 16788
                        if slot <> 16788 or instruction <> 13128 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 840).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:367
//		EXTEND
// slot 16789
                        if slot <> 16789 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16790 {
// P-AXIS_RCS_AUTOPILOT.agc:368
//		MP	CALLCODE	# OCTAL 00032 IS DECIMAL .1 AT 2(6).
// slot 16790
                        if slot <> 16790 or instruction <> 31222 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2550, readEffective:call(words, 2550)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:369
//		DAS	AOSQ
// slot 16791
                        if slot <> 16791 or instruction <> 9056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 864) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16793 {
                    if slot <= 16792 {
// P-AXIS_RCS_AUTOPILOT.agc:370
//		CA	AOSQ
// slot 16792
                        if slot <> 16792 or instruction <> 13151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 863).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:371
//		TS	ALPHAQ
// slot 16793
                        if slot <> 16793 or instruction <> 23316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23316, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16794 {
// P-AXIS_RCS_AUTOPILOT.agc:372
//		EXTEND
// slot 16794
                        if slot <> 16794 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:373
//		MP	200MS		# .2 AT 1
// slot 16795
                        if slot <> 16795 or instruction <> 30606 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1934, readEffective:call(words, 1934)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16799 {
                if slot <= 16797 {
                    if slot <= 16796 {
// P-AXIS_RCS_AUTOPILOT.agc:374
//		TS	AOSQTERM
// slot 16796
                        if slot <> 16796 or instruction <> 23397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23397, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:375
//		CA	RACCDOT
// slot 16797
                        if slot <> 16797 or instruction <> 13130 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 842).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16798 {
// P-AXIS_RCS_AUTOPILOT.agc:376
//		EXTEND
// slot 16798
                        if slot <> 16798 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:377
//		MP	CALLCODE	# OCTAL 00032 IS DECIMAL .1 AT 2(6).
// slot 16799
                        if slot <> 16799 or instruction <> 31222 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2550, readEffective:call(words, 2550)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16801 {
                    if slot <= 16800 {
// P-AXIS_RCS_AUTOPILOT.agc:378
//		DAS	AOSR
// slot 16800
                        if slot <> 16800 or instruction <> 9058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 866) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:379
//		CA	AOSR
// slot 16801
                        if slot <> 16801 or instruction <> 13153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 865).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16802 {
// P-AXIS_RCS_AUTOPILOT.agc:380
//		TS	ALPHAR
// slot 16802
                        if slot <> 16802 or instruction <> 23317 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23317, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:381
//		EXTEND
// slot 16803
                        if slot <> 16803 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 16811 {
            if slot <= 16807 {
                if slot <= 16805 {
                    if slot <= 16804 {
// P-AXIS_RCS_AUTOPILOT.agc:382
//		MP	200MS		# .2 AT 1
// slot 16804
                        if slot <> 16804 or instruction <> 30606 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1934, readEffective:call(words, 1934)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:383
//		TS	AOSRTERM
// slot 16805
                        if slot <> 16805 or instruction <> 23398 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23398, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16806 {
// P-AXIS_RCS_AUTOPILOT.agc:384
//		TCF	PRETIMCK
// slot 16806
                        if slot <> 16806 or instruction <> 5559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:385
//
// P-AXIS_RCS_AUTOPILOT.agc:386
//# Page 1428
// P-AXIS_RCS_AUTOPILOT.agc:387
//PAXFILT		CA	CALLGMBL	# EXECUTE ACDT+C12, IF NEEDED.
// slot 16807
                        if slot <> 16807 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16809 {
                    if slot <= 16808 {
// P-AXIS_RCS_AUTOPILOT.agc:388
//		MASK	RCSFLAGS
// slot 16808
                        if slot <> 16808 or instruction <> 29371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:389
//		CCS	A		# CALLGMBL IS NOT BIT15, SO THIS TEST IS
// slot 16809
                        if slot <> 16809 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16810 {
// P-AXIS_RCS_AUTOPILOT.agc:390
//		TC	ACDT+C12	# VALID.
// slot 16810
                        if slot <> 16810 or instruction <> 2014 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2014, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:391
//
// P-AXIS_RCS_AUTOPILOT.agc:392
//		DXCH	ARUPT
// slot 16811
                        if slot <> 16811 or instruction <> 21513 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16815 {
                if slot <= 16813 {
                    if slot <= 16812 {
// P-AXIS_RCS_AUTOPILOT.agc:393
//		DXCH	DAPARUPT
// slot 16812
                        if slot <> 16812 or instruction <> 22508 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1004, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:394
//		CA	SUPERJOB	# SETTING UP THE SUPERJOB
// slot 16813
                        if slot <> 16813 or instruction <> 13750 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1462), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16814 {
// P-AXIS_RCS_AUTOPILOT.agc:395
//		XCH	BRUPT
// slot 16814
                        if slot <> 16814 or instruction <> 23567 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 15, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:396
//		LXCH	QRUPT
// slot 16815
                        if slot <> 16815 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16817 {
                    if slot <= 16816 {
// P-AXIS_RCS_AUTOPILOT.agc:397
//		DXCH	DAPBQRPT
// slot 16816
                        if slot <> 16816 or instruction <> 22510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1006, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:398
//		CA	SUPERADR
// slot 16817
                        if slot <> 16817 or instruction <> 13749 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1461), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 16818 {
// P-AXIS_RCS_AUTOPILOT.agc:399
//		DXCH	ZRUPT
// slot 16818
                        if slot <> 16818 or instruction <> 21518 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 14, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16819 {
// P-AXIS_RCS_AUTOPILOT.agc:400
//		DXCH	DAPZRUPT
// slot 16819
                            if slot <> 16819 or instruction <> 22512 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1008, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:401
//		TCF	NOQBRSM +1	# RELINT (JUST IN CASE) AND RESUME, IN THE
// slot 16820
                            if slot <> 16820 or instruction <> 6845 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6845, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1008] to agcAotUnit1008@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:402
//					# 	FORM OF A JASK, AT SUPERJOB.
// P-AXIS_RCS_AUTOPILOT.agc:403
//
// P-AXIS_RCS_AUTOPILOT.agc:404
//SUPERADR	GENADR	SUPERJOB +1
// slot 16821
    16821, 2926
)).

// bank 16, slots 16822-16872
function agcAotUnit1009 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16846 {
        if slot <= 16833 {
            if slot <= 16827 {
                if slot <= 16824 {
                    if slot <= 16822 {
// P-AXIS_RCS_AUTOPILOT.agc:405
//
// P-AXIS_RCS_AUTOPILOT.agc:406
//# COUNT DOWN GIMBAL DRIVE TIMERS AND TURN OFF DRIVES IF REQUIRED.
// P-AXIS_RCS_AUTOPILOT.agc:407
//
// P-AXIS_RCS_AUTOPILOT.agc:408
//SUPERJOB	TCF	RATELOOP
// slot 16822
                        if slot <> 16822 or instruction <> 6049 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6049, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16823 {
// P-AXIS_RCS_AUTOPILOT.agc:409
//PRETIMCK	CCS	QGIMTIMR
// slot 16823
                            if slot <> 16823 or instruction <> 5018 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 922).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:410
//		TCF	DECQTIMR	# POSITIVE -- COUNTING DOWN
// slot 16824
                            if slot <> 16824 or instruction <> 5576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5576, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16825 {
// P-AXIS_RCS_AUTOPILOT.agc:411
//		TCF	TURNOFFQ	# NEGATIVE -- DRIVE SHOULD BE ENDED
// slot 16825
                        if slot <> 16825 or instruction <> 5580 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5580, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16826 {
// P-AXIS_RCS_AUTOPILOT.agc:412
//CHKRTIMR	CCS	RGIMTIMR	# NEGATIVE -- INACTIVE
// slot 16826
                            if slot <> 16826 or instruction <> 5020 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 924).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:413
//		TCF	DECRTIMR	# (NEG ZERO -- IMPOSSIBLE)
// slot 16827
                            if slot <> 16827 or instruction <> 5578 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5578, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16830 {
                    if slot <= 16828 {
// P-AXIS_RCS_AUTOPILOT.agc:414
//		TCF	TURNOFFR	# REPEATED (ABOVE) FOR R AXIS.
// slot 16828
                        if slot <> 16828 or instruction <> 5588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16829 {
// P-AXIS_RCS_AUTOPILOT.agc:415
//
// P-AXIS_RCS_AUTOPILOT.agc:416
//		EXTEND			# DECREMENT DOCKED JET INHIBITION COUNTERS
// slot 16829
                            if slot <> 16829 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:417
//		DIM	PJETCTR
// slot 16830
                            if slot <> 16830 or instruction <> 12279 { return choose false if checkOnly else -1. }
                            if extended {
                                local operandSlot is agcAddressSlot(1015, words[3], words[4], words["channel7"]).
                                if operandSlot >= 16 and operandSlot <= 19 and
                                    (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDIM(words, 1015).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16831 {
// P-AXIS_RCS_AUTOPILOT.agc:418
//		EXTEND
// slot 16831
                        if slot <> 16831 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16832 {
// P-AXIS_RCS_AUTOPILOT.agc:419
//		DIM	UJETCTR
// slot 16832
                            if slot <> 16832 or instruction <> 12280 { return choose false if checkOnly else -1. }
                            if extended {
                                local operandSlot is agcAddressSlot(1016, words[3], words[4], words["channel7"]).
                                if operandSlot >= 16 and operandSlot <= 19 and
                                    (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDIM(words, 1016).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:420
//		EXTEND
// slot 16833
                            if slot <> 16833 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 16839 {
                if slot <= 16836 {
                    if slot <= 16834 {
// P-AXIS_RCS_AUTOPILOT.agc:421
//		DIM	VJETCTR
// slot 16834
                        if slot <> 16834 or instruction <> 12281 { return choose false if checkOnly else -1. }
                        if extended {
                            local operandSlot is agcAddressSlot(1017, words[3], words[4], words["channel7"]).
                            if operandSlot >= 16 and operandSlot <= 19 and
                                (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDIM(words, 1017).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16835 {
// P-AXIS_RCS_AUTOPILOT.agc:422
//		CA	BIT12
// slot 16835
                            if slot <> 16835 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:423
//		MASK	RCSFLAGS
// slot 16836
                            if slot <> 16836 or instruction <> 29371 { return choose false if checkOnly else -1. }
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
                    if slot <= 16837 {
// P-AXIS_RCS_AUTOPILOT.agc:424
//		EXTEND
// slot 16837
                        if slot <> 16837 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16838 {
// P-AXIS_RCS_AUTOPILOT.agc:425
//		BZF	SKIPPAXS
// slot 16838
                            if slot <> 16838 or instruction <> 5596 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5596, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:426
//		TC	CHKVISFZ
// slot 16839
                            if slot <> 16839 or instruction <> 1504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1504, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16842 {
                    if slot <= 16840 {
// P-AXIS_RCS_AUTOPILOT.agc:427
//DECQTIMR	TS	QGIMTIMR	# COUNT TIMERS DOWN TO POS ZERO.
// slot 16840
                        if slot <> 16840 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16841 {
// P-AXIS_RCS_AUTOPILOT.agc:428
//		TCF	CHKRTIMR
// slot 16841
                            if slot <> 16841 or instruction <> 5562 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5562, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:429
//DECRTIMR	TS	RGIMTIMR
// slot 16842
                            if slot <> 16842 or instruction <> 23452 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23452, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16844 {
                        if slot <= 16843 {
// P-AXIS_RCS_AUTOPILOT.agc:430
//		TCF	CHKRTIMR +3
// slot 16843
                            if slot <> 16843 or instruction <> 5565 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5565, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:431
//
// P-AXIS_RCS_AUTOPILOT.agc:432
//TURNOFFQ	TS	NEGUQ		# HALT DRIVES.
// slot 16844
                            if slot <> 16844 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16845 {
// P-AXIS_RCS_AUTOPILOT.agc:433
//		TS	QACCDOT
// slot 16845
                            if slot <> 16845 or instruction <> 23368 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23368, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:434
//		CS	QGIMBITS
// slot 16846
                            if slot <> 16846 or instruction <> 18951 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2567), 32768).
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
        if slot <= 16859 {
            if slot <= 16852 {
                if slot <= 16849 {
                    if slot <= 16847 {
// P-AXIS_RCS_AUTOPILOT.agc:435
//		EXTEND
// slot 16847
                        if slot <> 16847 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16848 {
// P-AXIS_RCS_AUTOPILOT.agc:436
//# Page 1429
// P-AXIS_RCS_AUTOPILOT.agc:437
//		WAND	CHAN12
// slot 16848
                            if slot <> 16848 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:438
//		CAF	NEGMAX
// slot 16849
                            if slot <> 16849 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
                    if slot <= 16850 {
// P-AXIS_RCS_AUTOPILOT.agc:439
//		TS	QGIMTIMR
// slot 16850
                        if slot <> 16850 or instruction <> 23450 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23450, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16851 {
// P-AXIS_RCS_AUTOPILOT.agc:440
//		TCF	CHKRTIMR
// slot 16851
                            if slot <> 16851 or instruction <> 5562 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5562, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:441
//TURNOFFR	TS	NEGUR
// slot 16852
                            if slot <> 16852 or instruction <> 23363 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23363, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 16855 {
                    if slot <= 16853 {
// P-AXIS_RCS_AUTOPILOT.agc:442
//		TS	RACCDOT
// slot 16853
                        if slot <> 16853 or instruction <> 23370 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23370, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16854 {
// P-AXIS_RCS_AUTOPILOT.agc:443
//		CS	RGIMBITS
// slot 16854
                            if slot <> 16854 or instruction <> 18960 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:444
//		EXTEND
// slot 16855
                            if slot <> 16855 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16857 {
                        if slot <= 16856 {
// P-AXIS_RCS_AUTOPILOT.agc:445
//		WAND	CHAN12
// slot 16856
                            if slot <> 16856 or instruction <> 1546 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:446
//		CAF	NEGMAX
// slot 16857
                            if slot <> 16857 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
                        if slot <= 16858 {
// P-AXIS_RCS_AUTOPILOT.agc:447
//		TS	RGIMTIMR
// slot 16858
                            if slot <> 16858 or instruction <> 23452 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23452, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:448
//		TCF	CHKRTIMR +3
// slot 16859
                            if slot <> 16859 or instruction <> 5565 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5565, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 16865 {
                if slot <= 16862 {
                    if slot <= 16860 {
// P-AXIS_RCS_AUTOPILOT.agc:449
//QGIMBITS	EQUALS	OCT1400		# BITS 9 AND 10 (OF CHANNEL 12).
// P-AXIS_RCS_AUTOPILOT.agc:450
//RGIMBITS	EQUALS	PRIO6		# BITS 11 AND 12 (OF CHANNEL 12).
// P-AXIS_RCS_AUTOPILOT.agc:451
//
// P-AXIS_RCS_AUTOPILOT.agc:452
//SKIPPAXS	CS	RCSFLAGS
// slot 16860
                        if slot <> 16860 or instruction <> 17083 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 699).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16861 {
// P-AXIS_RCS_AUTOPILOT.agc:453
//		MASK	BIT12
// slot 16861
                            if slot <> 16861 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:454
//		ADS	RCSFLAGS	# BIT 12 SET TO 1.
// slot 16862
                            if slot <> 16862 or instruction <> 11963 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16863 {
// P-AXIS_RCS_AUTOPILOT.agc:455
//		TCF	QRAXIS		# GO TO QRAXIS OR TO CTS.
// slot 16863
                        if slot <> 16863 or instruction <> 6036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16864 {
// P-AXIS_RCS_AUTOPILOT.agc:456
//
// P-AXIS_RCS_AUTOPILOT.agc:457
//# Y-X TRANSLATION
// P-AXIS_RCS_AUTOPILOT.agc:458
//#
// P-AXIS_RCS_AUTOPILOT.agc:459
//# INPUT:	BITS 9-12 OF CH31 (FROM TRANSLATION CONTROLLER)
// P-AXIS_RCS_AUTOPILOT.agc:460
//#
// P-AXIS_RCS_AUTOPILOT.agc:461
//# OUTPUT:	NEXTP
// P-AXIS_RCS_AUTOPILOT.agc:462
//#
// P-AXIS_RCS_AUTOPILOT.agc:463
//#		NEXTP IS THE CHANNEL 6 CODE OF JETS FOR THE DESIRED TRANSLATION.
// P-AXIS_RCS_AUTOPILOT.agc:464
//#		IF THERE ARE FAILURES IN THE DESIRED POLICY, THEN
// P-AXIS_RCS_AUTOPILOT.agc:465
//#		(1) FOR DIAGONAL TRANS:		UNFAILED PAIR
// P-AXIS_RCS_AUTOPILOT.agc:466
//#						ALARM (IF NO PAIR)
// P-AXIS_RCS_AUTOPILOT.agc:467
//#		(2) FOR PRINCIPAL TRANS:	TRY TO TACK WITH DIAGONAL PAIRS
// P-AXIS_RCS_AUTOPILOT.agc:468
//#						ALARM (IF DIAGONAL PAIRS ARE FAILED)
// P-AXIS_RCS_AUTOPILOT.agc:469
//
// P-AXIS_RCS_AUTOPILOT.agc:470
//CHKVISFZ	EXTEND
// slot 16864
                            if slot <> 16864 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:471
//		READ	CHAN31
// slot 16865
                            if slot <> 16865 or instruction <> 25 { return choose false if checkOnly else -1. }
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
                if slot <= 16868 {
                    if slot <= 16866 {
// P-AXIS_RCS_AUTOPILOT.agc:472
//		CS	A
// slot 16866
                        if slot <> 16866 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 16867 {
// P-AXIS_RCS_AUTOPILOT.agc:473
//		MASK	07400OCT
// slot 16867
                            if slot <> 16867 or instruction <> 30603 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1931), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:474
//		EXTEND
// slot 16868
                            if slot <> 16868 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16870 {
                        if slot <= 16869 {
// P-AXIS_RCS_AUTOPILOT.agc:475
//		BZF	TSNEXTP
// slot 16869
                            if slot <> 16869 or instruction <> 5644 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5644, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:476
//		EXTEND
// slot 16870
                            if slot <> 16870 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16871 {
// P-AXIS_RCS_AUTOPILOT.agc:477
//		MP	BIT7
// slot 16871
                            if slot <> 16871 or instruction <> 31205 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2533, readEffective:call(words, 2533)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:478
//		INDEX	A
// slot 16872
                            if slot <> 16872 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1009] to agcAotUnit1009@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:479
//		CA	INDXYZ
// slot 16873
    16873, 28404
)).

// bank 16, slots 16874-16889
function agcAotUnit1010 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16881 {
        if slot <= 16877 {
            if slot <= 16875 {
                if slot <= 16874 {
// P-AXIS_RCS_AUTOPILOT.agc:480
//		TS	ROTINDEX
// slot 16874
                    if slot <> 16874 or instruction <> 23524 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23524, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:481
//TRYUORV		CA	SIX
// slot 16875
                    if slot <> 16875 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16876 {
// P-AXIS_RCS_AUTOPILOT.agc:482
//		TC	SELECTYZ
// slot 16876
                    if slot <> 16876 or instruction <> 1897 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1897, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:483
//		CS	SIX
// slot 16877
                    if slot <> 16877 or instruction <> 19618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16879 {
                if slot <= 16878 {
// P-AXIS_RCS_AUTOPILOT.agc:484
//		AD	NUMBERT
// slot 16878
                    if slot <> 16878 or instruction <> 25571 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 995).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:485
//		EXTEND
// slot 16879
                    if slot <> 16879 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16880 {
// P-AXIS_RCS_AUTOPILOT.agc:486
//# Page 1430
// P-AXIS_RCS_AUTOPILOT.agc:487
//		BZF	TSNEXTP -1
// slot 16880
                    if slot <> 16880 or instruction <> 5643 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5643, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:488
//		CS	FIVE
// slot 16881
                    if slot <> 16881 or instruction <> 18926 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16885 {
            if slot <= 16883 {
                if slot <= 16882 {
// P-AXIS_RCS_AUTOPILOT.agc:489
//		AD	ROTINDEX
// slot 16882
                    if slot <> 16882 or instruction <> 25572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 996).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:490
//		EXTEND
// slot 16883
                    if slot <> 16883 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16884 {
// P-AXIS_RCS_AUTOPILOT.agc:491
//		BZMF	ALTERYZ
// slot 16884
                    if slot <> 16884 or instruction <> 26114 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26114, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:492
//		CS	NUMBERT
// slot 16885
                    if slot <> 16885 or instruction <> 17379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 995).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16887 {
                if slot <= 16886 {
// P-AXIS_RCS_AUTOPILOT.agc:493
//		AD	FOUR
// slot 16886
                    if slot <> 16886 or instruction <> 27113 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:494
//		EXTEND
// slot 16887
                    if slot <> 16887 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16888 {
// P-AXIS_RCS_AUTOPILOT.agc:495
//		BZMF	TSNEXTP -1
// slot 16888
                    if slot <> 16888 or instruction <> 26123 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26123, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:496
//ABORTYZ		TC	ALARM
// slot 16889
                    if slot <> 16889 or instruction <> 2935 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1010] to agcAotUnit1010@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:497
//		OCT	02001
// slot 16890
    16890, 2050
)).

// bank 16, slots 16891-16913
function agcAotUnit1011 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16901 {
        if slot <= 16895 {
            if slot <= 16892 {
                if slot <= 16891 {
// P-AXIS_RCS_AUTOPILOT.agc:498
//		CA	BIT1		# INVERT BIT 1 OF RCSFLAGS.
// slot 16891
                    if slot <> 16891 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:499
//		LXCH	RCSFLAGS
// slot 16892
                    if slot <> 16892 or instruction <> 9915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 699, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16893 {
// P-AXIS_RCS_AUTOPILOT.agc:500
//		EXTEND
// slot 16893
                    if slot <> 16893 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16894 {
// P-AXIS_RCS_AUTOPILOT.agc:501
//		RXOR	1
// slot 16894
                        if slot <> 16894 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:502
//		TS	RCSFLAGS
// slot 16895
                        if slot <> 16895 or instruction <> 23227 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23227, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16898 {
                if slot <= 16896 {
// P-AXIS_RCS_AUTOPILOT.agc:503
//		CA	ZERO
// slot 16896
                    if slot <> 16896 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16897 {
// P-AXIS_RCS_AUTOPILOT.agc:504
//		TCF	TSNEXTP
// slot 16897
                        if slot <> 16897 or instruction <> 5644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:505
//ALTERYZ		CA	BIT1		# INVERT BIT 1 OF RCSFLAGS.
// slot 16898
                        if slot <> 16898 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                if slot <= 16899 {
// P-AXIS_RCS_AUTOPILOT.agc:506
//		LXCH	RCSFLAGS
// slot 16899
                    if slot <> 16899 or instruction <> 9915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 699, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16900 {
// P-AXIS_RCS_AUTOPILOT.agc:507
//		EXTEND
// slot 16900
                        if slot <> 16900 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:508
//		RXOR	1
// slot 16901
                        if slot <> 16901 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 16907 {
            if slot <= 16904 {
                if slot <= 16902 {
// P-AXIS_RCS_AUTOPILOT.agc:509
//		TS	RCSFLAGS
// slot 16902
                    if slot <> 16902 or instruction <> 23227 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23227, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16903 {
// P-AXIS_RCS_AUTOPILOT.agc:510
//		MASK	BIT1
// slot 16903
                        if slot <> 16903 or instruction <> 31211 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:511
//		AD	FOUR
// slot 16904
                        if slot <> 16904 or instruction <> 27113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16905 {
// P-AXIS_RCS_AUTOPILOT.agc:512
//		ADS	ROTINDEX
// slot 16905
                    if slot <> 16905 or instruction <> 12260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 996).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16906 {
// P-AXIS_RCS_AUTOPILOT.agc:513
//		TCF	TRYUORV
// slot 16906
                        if slot <> 16906 or instruction <> 5611 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5611, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:514
//		CA	POLYTEMP
// slot 16907
                        if slot <> 16907 or instruction <> 13281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 993).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 16910 {
                if slot <= 16908 {
// P-AXIS_RCS_AUTOPILOT.agc:515
//TSNEXTP		TS	NEXTP
// slot 16908
                    if slot <> 16908 or instruction <> 23354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16909 {
// P-AXIS_RCS_AUTOPILOT.agc:516
//
// P-AXIS_RCS_AUTOPILOT.agc:517
//# STATE LOGIC
// P-AXIS_RCS_AUTOPILOT.agc:518
//#	CHECK IN ORDER:		IF ON
// P-AXIS_RCS_AUTOPILOT.agc:519
//#	LPDPHASE		GO TO PURGENCY
// P-AXIS_RCS_AUTOPILOT.agc:520
//#	PULSES			MINIMUM PULSE LOTIC
// P-AXIS_RCS_AUTOPILOT.agc:521
//#	DETENT(BIT15 CH31)	RATE COMMAND
// P-AXIS_RCS_AUTOPILOT.agc:522
//#	GOTO TO PURGENCY
// P-AXIS_RCS_AUTOPILOT.agc:523
//
// P-AXIS_RCS_AUTOPILOT.agc:524
//		CA	BIT13		# CHECK STICK IF IN ATT. HOLD.
// slot 16909
                        if slot <> 16909 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:525
//		EXTEND
// slot 16910
                        if slot <> 16910 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 16911 {
// P-AXIS_RCS_AUTOPILOT.agc:526
//		RAND	CHAN31
// slot 16911
                    if slot <> 16911 or instruction <> 1049 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16912 {
// P-AXIS_RCS_AUTOPILOT.agc:527
//		EXTEND
// slot 16912
                        if slot <> 16912 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:528
//		BZF	MANMODE
// slot 16913
                        if slot <> 16913 or instruction <> 5655 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5655, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1011] to agcAotUnit1011@.

// bank 16, slots 16914-16985
function agcAotUnit1012 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16949 {
        if slot <= 16931 {
            if slot <= 16922 {
                if slot <= 16917 {
                    if slot <= 16915 {
                        if slot <= 16914 {
// P-AXIS_RCS_AUTOPILOT.agc:529
//
// P-AXIS_RCS_AUTOPILOT.agc:530
//		CA	DAPBOOLS
// slot 16914
                            if slot <> 16914 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:531
//		MASK	XOVINHIB
// slot 16915
                            if slot <> 16915 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
                    } else {
                        if slot <= 16916 {
// P-AXIS_RCS_AUTOPILOT.agc:532
//		CCS	A
// slot 16916
                            if slot <> 16916 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:533
//		TCF	PURGENCY	# ATTITUDE STEER DURING VISIBILITY PHASE
// slot 16917
                            if slot <> 16917 or instruction <> 5939 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5939, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16919 {
                        if slot <= 16918 {
// P-AXIS_RCS_AUTOPILOT.agc:534
//
// P-AXIS_RCS_AUTOPILOT.agc:535
//		TCF	DETENTCK
// slot 16918
                            if slot <> 16918 or instruction <> 5689 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5689, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:536
//MANMODE		CA	PULSES		# PULSES IS ONE FOR PULSE MODE
// slot 16919
                            if slot <> 16919 or instruction <> 14813 { return choose false if checkOnly else -1. }
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
                        if slot <= 16920 {
// P-AXIS_RCS_AUTOPILOT.agc:537
//		MASK	DAPBOOLS
// slot 16920
                            if slot <> 16920 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16921 {
// P-AXIS_RCS_AUTOPILOT.agc:538
//# Page 1431
// P-AXIS_RCS_AUTOPILOT.agc:539
//		EXTEND
// slot 16921
                                if slot <> 16921 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:540
//		BZF	DETENTCK	# BRANCH FOR RATE COMMAND
// slot 16922
                                if slot <> 16922 or instruction <> 5689 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5689, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16926 {
                    if slot <= 16924 {
                        if slot <= 16923 {
// P-AXIS_RCS_AUTOPILOT.agc:541
//
// P-AXIS_RCS_AUTOPILOT.agc:542
//		CA	ZERO
// slot 16923
                            if slot <> 16923 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:543
//		TS	PERROR
// slot 16924
                            if slot <> 16924 or instruction <> 23348 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23348, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16925 {
// P-AXIS_RCS_AUTOPILOT.agc:544
//
// P-AXIS_RCS_AUTOPILOT.agc:545
//# MINIMUM IMPULSE MODE
// P-AXIS_RCS_AUTOPILOT.agc:546
//
// P-AXIS_RCS_AUTOPILOT.agc:547
//		CA	CDUX
// slot 16925
                            if slot <> 16925 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:548
//		TS	CDUXD
// slot 16926
                            if slot <> 16926 or instruction <> 23453 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23453, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16928 {
                        if slot <= 16927 {
// P-AXIS_RCS_AUTOPILOT.agc:549
//
// P-AXIS_RCS_AUTOPILOT.agc:550
//		CCS	OLDPMIN
// slot 16927
                            if slot <> 16927 or instruction <> 4912 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 816).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:551
//		TCF	CHECKP
// slot 16928
                            if slot <> 16928 or instruction <> 5676 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5676, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16929 {
// P-AXIS_RCS_AUTOPILOT.agc:552
//
// P-AXIS_RCS_AUTOPILOT.agc:553
//FIREP		CA	BIT3
// slot 16929
                            if slot <> 16929 or instruction <> 14825 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16930 {
// P-AXIS_RCS_AUTOPILOT.agc:554
//		EXTEND
// slot 16930
                                if slot <> 16930 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:555
//		RAND	CHAN31
// slot 16931
                                if slot <> 16931 or instruction <> 1049 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 16940 {
                if slot <= 16935 {
                    if slot <= 16933 {
                        if slot <= 16932 {
// P-AXIS_RCS_AUTOPILOT.agc:556
//		EXTEND
// slot 16932
                            if slot <> 16932 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:557
//		BZF	+XMIN
// slot 16933
                            if slot <> 16933 or instruction <> 5684 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5684, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16934 {
// P-AXIS_RCS_AUTOPILOT.agc:558
//
// P-AXIS_RCS_AUTOPILOT.agc:559
//		CA	BIT4
// slot 16934
                            if slot <> 16934 or instruction <> 14824 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:560
//		EXTEND
// slot 16935
                            if slot <> 16935 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16937 {
                        if slot <= 16936 {
// P-AXIS_RCS_AUTOPILOT.agc:561
//		RAND	CHAN31
// slot 16936
                            if slot <> 16936 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:562
//		EXTEND
// slot 16937
                            if slot <> 16937 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16938 {
// P-AXIS_RCS_AUTOPILOT.agc:563
//		BZF	-XMIN
// slot 16938
                            if slot <> 16938 or instruction <> 5682 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5682, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16939 {
// P-AXIS_RCS_AUTOPILOT.agc:564
//
// P-AXIS_RCS_AUTOPILOT.agc:565
//		TCF	JETSOFF
// slot 16939
                                if slot <> 16939 or instruction <> 5922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5922, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:566
//
// P-AXIS_RCS_AUTOPILOT.agc:567
//CHECKP		EXTEND
// slot 16940
                                if slot <> 16940 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 16944 {
                    if slot <= 16942 {
                        if slot <= 16941 {
// P-AXIS_RCS_AUTOPILOT.agc:568
//		READ	CHAN31
// slot 16941
                            if slot <> 16941 or instruction <> 25 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:569
//		CS	A
// slot 16942
                            if slot <> 16942 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16943 {
// P-AXIS_RCS_AUTOPILOT.agc:570
//		MASK	OCT14
// slot 16943
                            if slot <> 16943 or instruction <> 31721 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3049), 32768).
                                if fixedOperand = 12 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4), 4) * 4).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:571
//		TS	OLDPMIN
// slot 16944
                            if slot <> 16944 or instruction <> 23344 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23344, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16946 {
                        if slot <= 16945 {
// P-AXIS_RCS_AUTOPILOT.agc:572
//		TCF	JETSOFF
// slot 16945
                            if slot <> 16945 or instruction <> 5922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5922, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:573
//
// P-AXIS_RCS_AUTOPILOT.agc:574
//-XMIN		CS	TEN		# ANYTHING LESS THAN 14MS. CORRECTED
// slot 16946
                            if slot <> 16946 or instruction <> 18675 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16947 {
// P-AXIS_RCS_AUTOPILOT.agc:575
//		TCF	+2		#	IN JET SELECTION ROUTINE
// slot 16947
                            if slot <> 16947 or instruction <> 5685 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5685, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16948 {
// P-AXIS_RCS_AUTOPILOT.agc:576
//+XMIN		CA	TEN
// slot 16948
                                if slot <> 16948 or instruction <> 14579 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:577
//		TS	TJP
// slot 16949
                                if slot <> 16949 or instruction <> 23380 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23380, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16967 {
            if slot <= 16958 {
                if slot <= 16953 {
                    if slot <= 16951 {
                        if slot <= 16950 {
// P-AXIS_RCS_AUTOPILOT.agc:578
//		CA	ONE
// slot 16950
                            if slot <> 16950 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:579
//		TS	OLDPMIN
// slot 16951
                            if slot <> 16951 or instruction <> 23344 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23344, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16952 {
// P-AXIS_RCS_AUTOPILOT.agc:580
//		TCF	PJETSLEC -6
// slot 16952
                            if slot <> 16952 or instruction <> 5864 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5864, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:581
//
// P-AXIS_RCS_AUTOPILOT.agc:582
//# 					MANUAL RATE COMMAND MODE
// P-AXIS_RCS_AUTOPILOT.agc:583
//# 					========================
// P-AXIS_RCS_AUTOPILOT.agc:584
//# 					  BY ROBERT F. STENGEL
// P-AXIS_RCS_AUTOPILOT.agc:585
//#
// P-AXIS_RCS_AUTOPILOT.agc:586
//# THIS MODE PROVIDES RCAH MANUAL CONTROL THRU 2 CONTROL LAWS:  1) DIRECT RATE AND 2) PSEUDO-AUTO.
// P-AXIS_RCS_AUTOPILOT.agc:587
//# THE DIRECT RATE MODE AFFORDS IMMEDIATE CONTROL WITHOUT OVERSHOOT.  THE PSEUDO-AUTO MODE PROVIDES PRECISE
// P-AXIS_RCS_AUTOPILOT.agc:588
//# RATE CONTROL AND ATTITUDE HOLD.
// P-AXIS_RCS_AUTOPILOT.agc:589
//#
// P-AXIS_RCS_AUTOPILOT.agc:590
//# Page 1432
// P-AXIS_RCS_AUTOPILOT.agc:591
//# IN DIRECT RATE, JETS ARE FIRED WHEN STICK POSITION CHANGES BY A FIXED NUMBER OF INCREMENTS IN ONE DAP CYCLE.
// P-AXIS_RCS_AUTOPILOT.agc:592
//# THE `BREAKOUT LEVEL' IS .6 D/S FOR LM-ONLY AND .3 D/S FOR CSM-DOCKED.  THIS LAW NULLS THE RATE ERROR TO WITHIN
// P-AXIS_RCS_AUTOPILOT.agc:593
//# THE `TARGET DEADBAND', WHICH EQUALS THE BREAKOUT LEVEL.
// P-AXIS_RCS_AUTOPILOT.agc:594
//#
// P-AXIS_RCS_AUTOPILOT.agc:595
//# IN PSEUDO-AUTO, BODY-FIXED RATE AND ATTITUDE ERRORS ARE SUPPLIED TO TJETLAW, WHICH EXERCISES CONTROL.
// P-AXIS_RCS_AUTOPILOT.agc:596
//# CONTROL SWITCHES FROM DIRECT RATE TO PSEUDO-AUTO IF THE TARGET DB IS ACHIEVED OR IF TIME IN (1) EXCEEDS 4 SEC.
// P-AXIS_RCS_AUTOPILOT.agc:597
//# IF THE INITIAL COMMAND DOES NOT EXCEED THE BREAKOUT LEVEL, CONTROL GOES TO PSEUDO-AUTO IMMEDIATELY.
// P-AXIS_RCS_AUTOPILOT.agc:598
//#
// P-AXIS_RCS_AUTOPILOT.agc:599
//# SINCE P-AXIS CONTROL IS SEPARATE FROM Q,R AXES CONTROL, IT IS POSSIBLE TO USE (1) IN P-AXIS AND (2) IN Q,R AXES,
// P-AXIS_RCS_AUTOPILOT.agc:600
//# OR VICE VERSA.  THIS ALLOWS A DEGREE OF ATTITUDE HOLD IN UNCONTROLLED AXES.  DUE TO U,V CONTROL, HOWEVER, Q AND
// P-AXIS_RCS_AUTOPILOT.agc:601
//# R AXES ARE COUPLED AND MUST USE THE SAME CONTROL LAW.
// P-AXIS_RCS_AUTOPILOT.agc:602
//#
// P-AXIS_RCS_AUTOPILOT.agc:603
//# HAND CONTROLLER COMMANDS ARE SCALED BY A LINEAR/QUADRATIC LAW.  FOR THE LM-ALONE, MAXIMUM COMMANDED RATES ARE 20
// P-AXIS_RCS_AUTOPILOT.agc:604
//# AND 4 D/S IN NORMAL AND FINE SCALING; HOWEVER, STICK SENSITIVITY AT ZERO COUNTS (OBTAINED AT A STICK DEFLECTION
// P-AXIS_RCS_AUTOPILOT.agc:605
//# OF 2 DEGREES FROM THE CENTERED POSITION) IS .5 OR .1 D/S PER DEGREE.  NORMAL AND FINE SCALINGS FOR THE CSM-DOCKED
// P-AXIS_RCS_AUTOPILOT.agc:606
//# CASE IS AUTOMATICALLY SET TO 1/10 THE ABOVE VALUES.  SCALING IS DETERMINED IN ROUTINE 3.
// P-AXIS_RCS_AUTOPILOT.agc:607
//#
// P-AXIS_RCS_AUTOPILOT.agc:608
//# ZEROENBL	ENABLES COUNTERS SO THEY CAN BE READ NEXT TIME
// P-AXIS_RCS_AUTOPILOT.agc:609
//# JUSTOUT	FIRST DETECTION OF OUT OF DETENT (BY OURRCBIT)
// P-AXIS_RCS_AUTOPILOT.agc:610
//
// P-AXIS_RCS_AUTOPILOT.agc:611
//DETENTCK	EXTEND
// slot 16953
                            if slot <> 16953 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16955 {
                        if slot <= 16954 {
// P-AXIS_RCS_AUTOPILOT.agc:612
//		READ	CHAN31
// slot 16954
                            if slot <> 16954 or instruction <> 25 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 0, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:613
//		TS	CH31TEMP
// slot 16955
                            if slot <> 16955 or instruction <> 23331 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23331, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16956 {
// P-AXIS_RCS_AUTOPILOT.agc:614
//		MASK	BIT15		# CHECK OUT-OF-DETENT BIT.
// slot 16956
                            if slot <> 16956 or instruction <> 31197 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                if fixedOperand = 16384 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16957 {
// P-AXIS_RCS_AUTOPILOT.agc:615
//		EXTEND
// slot 16957
                                if slot <> 16957 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:616
//		BZF	RHCMOVED	# BRANCH IF OUT OF DETENT.
// slot 16958
                                if slot <> 16958 or instruction <> 5779 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5779, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16962 {
                    if slot <= 16960 {
                        if slot <= 16959 {
// P-AXIS_RCS_AUTOPILOT.agc:617
//		CAF	OURRCBIT	# IN DETENT.  CHECK THE RATE COMMAND BIT.
// slot 16959
                            if slot <> 16959 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:618
//		MASK	DAPBOOLS
// slot 16960
                            if slot <> 16960 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16961 {
// P-AXIS_RCS_AUTOPILOT.agc:619
//		EXTEND
// slot 16961
                            if slot <> 16961 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:620
//		BZF	PURGENCY	# BRANCH IF NOT IN RATE COMMAND LAST PASS.
// slot 16962
                            if slot <> 16962 or instruction <> 5939 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5939, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16964 {
                        if slot <= 16963 {
// P-AXIS_RCS_AUTOPILOT.agc:621
//
// P-AXIS_RCS_AUTOPILOT.agc:622
//# ................................................................................
// P-AXIS_RCS_AUTOPILOT.agc:623
//
// P-AXIS_RCS_AUTOPILOT.agc:624
//		CA	BIT9		# JUST IN DETENT??
// slot 16963
                            if slot <> 16963 or instruction <> 14819 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:625
//		MASK	RCSFLAGS
// slot 16964
                            if slot <> 16964 or instruction <> 29371 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16965 {
// P-AXIS_RCS_AUTOPILOT.agc:626
//		EXTEND
// slot 16965
                            if slot <> 16965 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16966 {
// P-AXIS_RCS_AUTOPILOT.agc:627
//		BZF	RUTH
// slot 16966
                                if slot <> 16966 or instruction <> 5712 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5712, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:628
//		CAF	BIT13		# CHECK FOR ATTITUDE HOLD.
// slot 16967
                                if slot <> 16967 or instruction <> 14815 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
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
            if slot <= 16976 {
                if slot <= 16971 {
                    if slot <= 16969 {
                        if slot <= 16968 {
// P-AXIS_RCS_AUTOPILOT.agc:629
//		EXTEND
// slot 16968
                            if slot <> 16968 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:630
//		RAND	CHAN31
// slot 16969
                            if slot <> 16969 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16970 {
// P-AXIS_RCS_AUTOPILOT.agc:631
//		EXTEND
// slot 16970
                            if slot <> 16970 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:632
//		BZF	RATEDAMP	# BRANCH IF IN ATTITUDE HOLD.
// slot 16971
                            if slot <> 16971 or instruction <> 5776 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5776, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16973 {
                        if slot <= 16972 {
// P-AXIS_RCS_AUTOPILOT.agc:633
//
// P-AXIS_RCS_AUTOPILOT.agc:634
//		CS	BITS9,11	# IN AUTO.
// slot 16972
                            if slot <> 16972 or instruction <> 18956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:635
//		MASK	RCSFLAGS	# (X-AXIS OVERRIDE)
// slot 16973
                            if slot <> 16973 or instruction <> 29371 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16974 {
// P-AXIS_RCS_AUTOPILOT.agc:636
//		TS	RCSFLAGS	# ZERO ORBIT (BIT 11) AND JUST-IN BIT (9).
// slot 16974
                            if slot <> 16974 or instruction <> 23227 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23227, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16975 {
// P-AXIS_RCS_AUTOPILOT.agc:637
//		TCF	RATEDAMP
// slot 16975
                                if slot <> 16975 or instruction <> 5776 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5776, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:638
//
// P-AXIS_RCS_AUTOPILOT.agc:639
//RUTH		CA	RCSFLAGS
// slot 16976
                                if slot <> 16976 or instruction <> 12987 { return choose false if checkOnly else -1. }
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
                if slot <= 16980 {
                    if slot <= 16978 {
                        if slot <= 16977 {
// P-AXIS_RCS_AUTOPILOT.agc:640
//		MASK	PBIT		# IN ATTITUDE HOLD.
// slot 16977
                            if slot <> 16977 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:641
//		EXTEND
// slot 16978
                            if slot <> 16978 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16979 {
// P-AXIS_RCS_AUTOPILOT.agc:642
//		BZF	+2		# BRANCH IF P-RATE DAMPING IS FINISHED.
// slot 16979
                            if slot <> 16979 or instruction <> 5717 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5717, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:643
//		TCF	RATEDAMP
// slot 16980
                            if slot <> 16980 or instruction <> 5776 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5776, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 16982 {
                        if slot <= 16981 {
// P-AXIS_RCS_AUTOPILOT.agc:644
//
// P-AXIS_RCS_AUTOPILOT.agc:645
//# Page 1433
// P-AXIS_RCS_AUTOPILOT.agc:646
//		CA	RCSFLAGS
// slot 16981
                            if slot <> 16981 or instruction <> 12987 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 699).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:647
//		MASK	QRBIT
// slot 16982
                            if slot <> 16982 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
                    } else {
                        if slot <= 16983 {
// P-AXIS_RCS_AUTOPILOT.agc:648
//		EXTEND
// slot 16983
                            if slot <> 16983 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16984 {
// P-AXIS_RCS_AUTOPILOT.agc:649
//		BZF	RATEDONE	# BRANCH IF Q,R RATE DAMPING IS FINISHED.
// slot 16984
                                if slot <> 16984 or instruction <> 5726 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5726, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:650
//		TCF	RATEDAMP
// slot 16985
                                if slot <> 16985 or instruction <> 5776 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5776, words[0], readEffective).
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
set agcAotRoutes[1012] to agcAotUnit1012@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:651
//
// P-AXIS_RCS_AUTOPILOT.agc:652
//# ============================================
// P-AXIS_RCS_AUTOPILOT.agc:653
//
// P-AXIS_RCS_AUTOPILOT.agc:654
//1/10SEC		OCT	1
// slot 16986
    16986, 2,
// P-AXIS_RCS_AUTOPILOT.agc:655
//40CYC		OCT	50
// slot 16987
    16987, 80,
// P-AXIS_RCS_AUTOPILOT.agc:656
//PQRBIT		OCT	74777
// slot 16988
    16988, 62462,
// P-AXIS_RCS_AUTOPILOT.agc:657
//BITS9,11	EQUALS	EBANK5
// P-AXIS_RCS_AUTOPILOT.agc:658
//LINRATP		DEC	46
// slot 16989
    16989, 92
)).

// bank 16, slots 16990-17002
function agcAotUnit1013 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16995 {
        if slot <= 16992 {
            if slot <= 16990 {
// P-AXIS_RCS_AUTOPILOT.agc:659
//
// P-AXIS_RCS_AUTOPILOT.agc:660
//# ============================================
// P-AXIS_RCS_AUTOPILOT.agc:661
//
// P-AXIS_RCS_AUTOPILOT.agc:662
//RATEDONE	CS	OURRCBIT	# MANUAL COMMAND AND DAMPING COMPLETED IN
// slot 16990
                if slot <> 16990 or instruction <> 18912 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16991 {
// P-AXIS_RCS_AUTOPILOT.agc:663
//		INHINT			# ALL AXES.
// slot 16991
                    if slot <> 16991 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:664
//		MASK	DAPBOOLS
// slot 16992
                    if slot <> 16992 or instruction <> 28745 { return choose false if checkOnly else -1. }
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
            if slot <= 16993 {
// P-AXIS_RCS_AUTOPILOT.agc:665
//		TS	DAPBOOLS
// slot 16993
                if slot <> 16993 or instruction <> 22601 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22601, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16994 {
// P-AXIS_RCS_AUTOPILOT.agc:666
//
// P-AXIS_RCS_AUTOPILOT.agc:667
//# READ CDUS INTO CDU DESIRED REGISTERS
// P-AXIS_RCS_AUTOPILOT.agc:668
//
// P-AXIS_RCS_AUTOPILOT.agc:669
//		CAF	BIT13
// slot 16994
                    if slot <> 16994 or instruction <> 14815 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:670
//		EXTEND
// slot 16995
                    if slot <> 16995 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16998 {
            if slot <= 16996 {
// P-AXIS_RCS_AUTOPILOT.agc:671
//		RAND	CHAN31
// slot 16996
                if slot <> 16996 or instruction <> 1049 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16997 {
// P-AXIS_RCS_AUTOPILOT.agc:672
//		EXTEND
// slot 16997
                    if slot <> 16997 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:673
//		BZF	+4
// slot 16998
                    if slot <> 16998 or instruction <> 5738 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5738, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17000 {
                if slot <= 16999 {
// P-AXIS_RCS_AUTOPILOT.agc:674
//		CA	CDUX		# (X-AXIS OVERRIDE)
// slot 16999
                    if slot <> 16999 or instruction <> 12314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 26).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:675
//		TS	CDUXD
// slot 17000
                    if slot <> 17000 or instruction <> 23453 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23453, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17001 {
// P-AXIS_RCS_AUTOPILOT.agc:676
//		TC	+3
// slot 17001
                    if slot <> 17001 or instruction <> 1644 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1644, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:677
//		TC	IBNKCALL
// slot 17002
                    if slot <> 17002 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1013] to agcAotUnit1013@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:678
//		FCADR	ZATTEROR
// slot 17003
    17003, 32982
)).

// bank 16, slots 17004-17046
function agcAotUnit1014 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17024 {
        if slot <= 17013 {
            if slot <= 17008 {
                if slot <= 17005 {
                    if slot <= 17004 {
// P-AXIS_RCS_AUTOPILOT.agc:679
//		RELINT
// slot 17004
                        if slot <> 17004 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:680
//		TCF	PURGENCY
// slot 17005
                        if slot <> 17005 or instruction <> 5939 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5939, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17006 {
// P-AXIS_RCS_AUTOPILOT.agc:681
//
// P-AXIS_RCS_AUTOPILOT.agc:682
//		TS	PERROR
// slot 17006
                        if slot <> 17006 or instruction <> 23348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23348, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17007 {
// P-AXIS_RCS_AUTOPILOT.agc:683
//JUSTOUT		CA	OURRCBIT	# INITIALIZATION -- FIRST MANUAL PASS.
// slot 17007
                            if slot <> 17007 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:684
//		ADS	DAPBOOLS
// slot 17008
                            if slot <> 17008 or instruction <> 11337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17010 {
                    if slot <= 17009 {
// P-AXIS_RCS_AUTOPILOT.agc:685
//		CA	ZERO
// slot 17009
                        if slot <> 17009 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:686
//		TS	DXERROR
// slot 17010
                        if slot <> 17010 or instruction <> 23334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23334, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17011 {
// P-AXIS_RCS_AUTOPILOT.agc:687
//		TS	DXERROR +1
// slot 17011
                        if slot <> 17011 or instruction <> 23335 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23335, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17012 {
// P-AXIS_RCS_AUTOPILOT.agc:688
//		TS	DYERROR
// slot 17012
                            if slot <> 17012 or instruction <> 23336 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23336, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:689
//		TS	DYERROR +1
// slot 17013
                            if slot <> 17013 or instruction <> 23337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23337, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17018 {
                if slot <= 17015 {
                    if slot <= 17014 {
// P-AXIS_RCS_AUTOPILOT.agc:690
//		TS	DZERROR
// slot 17014
                        if slot <> 17014 or instruction <> 23338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:691
//		TS	DZERROR +1
// slot 17015
                        if slot <> 17015 or instruction <> 23339 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23339, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17016 {
// P-AXIS_RCS_AUTOPILOT.agc:692
//		TS	PLAST
// slot 17016
                        if slot <> 17016 or instruction <> 23340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23340, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17017 {
// P-AXIS_RCS_AUTOPILOT.agc:693
//		TS	QLAST
// slot 17017
                            if slot <> 17017 or instruction <> 23341 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23341, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:694
//		TS	RLAST
// slot 17018
                            if slot <> 17018 or instruction <> 23342 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23342, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17021 {
                    if slot <= 17019 {
// P-AXIS_RCS_AUTOPILOT.agc:695
//		TS	Q-RHCCTR
// slot 17019
                        if slot <> 17019 or instruction <> 22562 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22562, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17020 {
// P-AXIS_RCS_AUTOPILOT.agc:696
//		TS	R-RHCCTR
// slot 17020
                            if slot <> 17020 or instruction <> 22564 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22564, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:697
//		CA	PQRBIT
// slot 17021
                            if slot <> 17021 or instruction <> 13916 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1628), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17022 {
// P-AXIS_RCS_AUTOPILOT.agc:698
//		MASK	RCSFLAGS
// slot 17022
                        if slot <> 17022 or instruction <> 29371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17023 {
// P-AXIS_RCS_AUTOPILOT.agc:699
//		TS	RCSFLAGS	# BITS 10 AND 11 OF RCSFLAGS ARE 0.
// slot 17023
                            if slot <> 17023 or instruction <> 23227 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23227, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:700
//# Page 1434
// P-AXIS_RCS_AUTOPILOT.agc:701
//		CS	RCSFLAGS	# SET 'JUST-IN' BIT TO 1.
// slot 17024
                            if slot <> 17024 or instruction <> 17083 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 17035 {
            if slot <= 17029 {
                if slot <= 17026 {
                    if slot <= 17025 {
// P-AXIS_RCS_AUTOPILOT.agc:702
//		MASK	BIT9
// slot 17025
                        if slot <> 17025 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:703
//		ADS	RCSFLAGS
// slot 17026
                        if slot <> 17026 or instruction <> 11963 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 699).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17027 {
// P-AXIS_RCS_AUTOPILOT.agc:704
//		TC	ZEROENBL
// slot 17027
                        if slot <> 17027 or instruction <> 1669 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1669, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17028 {
// P-AXIS_RCS_AUTOPILOT.agc:705
//		TCF	JETSOFF
// slot 17028
                            if slot <> 17028 or instruction <> 5922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5922, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:706
//ZEROENBL	LXCH	R-RHCCTR
// slot 17029
                            if slot <> 17029 or instruction <> 9252 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 36, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17032 {
                    if slot <= 17030 {
// P-AXIS_RCS_AUTOPILOT.agc:707
//		CA	Q-RHCCTR
// slot 17030
                        if slot <> 17030 or instruction <> 12322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 34).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17031 {
// P-AXIS_RCS_AUTOPILOT.agc:708
//		DXCH	SAVEHAND
// slot 17031
                            if slot <> 17031 or instruction <> 22323 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 819, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:709
//		CA	ZERO
// slot 17032
                            if slot <> 17032 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 17033 {
// P-AXIS_RCS_AUTOPILOT.agc:710
//		TS	P-RHCCTR
// slot 17033
                        if slot <> 17033 or instruction <> 22563 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22563, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17034 {
// P-AXIS_RCS_AUTOPILOT.agc:711
//		TS	Q-RHCCTR
// slot 17034
                            if slot <> 17034 or instruction <> 22562 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22562, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:712
//		TS	R-RHCCTR
// slot 17035
                            if slot <> 17035 or instruction <> 22564 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22564, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17040 {
                if slot <= 17037 {
                    if slot <= 17036 {
// P-AXIS_RCS_AUTOPILOT.agc:713
//		CA	BITS8,9
// slot 17036
                        if slot <> 17036 or instruction <> 14223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1935), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:714
//		EXTEND
// slot 17037
                        if slot <> 17037 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17038 {
// P-AXIS_RCS_AUTOPILOT.agc:715
//		WOR	CHAN13		# COUNTERS ZEROED AND ENABLED
// slot 17038
                        if slot <> 17038 or instruction <> 2571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17039 {
// P-AXIS_RCS_AUTOPILOT.agc:716
//		TC	Q
// slot 17039
                            if slot <> 17039 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:717
//RATEDAMP	CA	ZERO
// slot 17040
                            if slot <> 17040 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 17043 {
                    if slot <= 17041 {
// P-AXIS_RCS_AUTOPILOT.agc:718
//		TS	P-RHCCTR
// slot 17041
                        if slot <> 17041 or instruction <> 22563 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22563, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17042 {
// P-AXIS_RCS_AUTOPILOT.agc:719
//		TCF	RATERROR
// slot 17042
                            if slot <> 17042 or instruction <> 5783 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5783, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:720
//
// P-AXIS_RCS_AUTOPILOT.agc:721
//RHCMOVED	CA	OURRCBIT	# P CONTROL
// slot 17043
                            if slot <> 17043 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17044 {
// P-AXIS_RCS_AUTOPILOT.agc:722
//		MASK	DAPBOOLS
// slot 17044
                        if slot <> 17044 or instruction <> 28745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17045 {
// P-AXIS_RCS_AUTOPILOT.agc:723
//		EXTEND
// slot 17045
                            if slot <> 17045 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:724
//		BZF	JUSTOUT -1
// slot 17046
                            if slot <> 17046 or instruction <> 5742 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5742, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1014] to agcAotUnit1014@.

// bank 16, slots 17047-17163
function agcAotUnit1015 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17104 {
        if slot <= 17075 {
            if slot <= 17060 {
                if slot <= 17053 {
                    if slot <= 17049 {
                        if slot <= 17047 {
// P-AXIS_RCS_AUTOPILOT.agc:725
//RATERROR	CA	CDUX		# FINDCDUW REQUIRES THAT CDUXD=CDUX DURING
// slot 17047
                            if slot <> 17047 or instruction <> 12314 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 26).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17048 {
// P-AXIS_RCS_AUTOPILOT.agc:726
//		TS	CDUXD		# X-AXIS OVERRIDE
// slot 17048
                                if slot <> 17048 or instruction <> 23453 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23453, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:727
//		CCS	P-RHCCTR
// slot 17049
                                if slot <> 17049 or instruction <> 4131 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 35).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17051 {
                            if slot <= 17050 {
// P-AXIS_RCS_AUTOPILOT.agc:728
//		TCF	+3
// slot 17050
                                if slot <> 17050 or instruction <> 5789 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5789, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:729
//		TCF	+2
// slot 17051
                                if slot <> 17051 or instruction <> 5789 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5789, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17052 {
// P-AXIS_RCS_AUTOPILOT.agc:730
//		TCF	+1
// slot 17052
                                if slot <> 17052 or instruction <> 5789 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5789, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:731
//		DOUBLE			# LINEAR/QUADRATIC CONTROLLER SCALING
// slot 17053
                                if slot <> 17053 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
                    if slot <= 17056 {
                        if slot <= 17054 {
// P-AXIS_RCS_AUTOPILOT.agc:732
//		DOUBLE			# (SEE EXPLANATION OF Q,R-AXES RCS
// slot 17054
                            if slot <> 17054 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17055 {
// P-AXIS_RCS_AUTOPILOT.agc:733
//		AD	LINRATP		# AUTOPILOT)
// slot 17055
                                if slot <> 17055 or instruction <> 26205 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1629), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:734
//		EXTEND
// slot 17056
                                if slot <> 17056 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17058 {
                            if slot <= 17057 {
// P-AXIS_RCS_AUTOPILOT.agc:735
//		MP	P-RHCCTR
// slot 17057
                                if slot <> 17057 or instruction <> 28707 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 35, readEffective:call(words, 35)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:736
//		CA	L
// slot 17058
                                if slot <> 17058 or instruction <> 12289 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 1).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17059 {
// P-AXIS_RCS_AUTOPILOT.agc:737
//		EXTEND
// slot 17059
                                if slot <> 17059 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:738
//		MP	STIKSENS
// slot 17060
                                if slot <> 17060 or instruction <> 29476 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 804, readEffective:call(words, 804)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17067 {
                    if slot <= 17063 {
                        if slot <= 17061 {
// P-AXIS_RCS_AUTOPILOT.agc:739
//		XCH	PLAST
// slot 17061
                            if slot <> 17061 or instruction <> 24364 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 812, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17062 {
// P-AXIS_RCS_AUTOPILOT.agc:740
//		COM
// slot 17062
                                if slot <> 17062 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:741
//		AD	PLAST
// slot 17063
                                if slot <> 17063 or instruction <> 25388 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 812).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17065 {
                            if slot <= 17064 {
// P-AXIS_RCS_AUTOPILOT.agc:742
//		TS	DAPTEMP1
// slot 17064
                                if slot <> 17064 or instruction <> 23519 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:743
//		TC	ZEROENBL	# INTERVAL.  ZERO AND ENABLE ACA COUNTERS.
// slot 17065
                                if slot <> 17065 or instruction <> 1669 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1669, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17066 {
// P-AXIS_RCS_AUTOPILOT.agc:744
//		CS	PLAST
// slot 17066
                                if slot <> 17066 or instruction <> 17196 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 812).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:745
//		AD	OMEGAP
// slot 17067
                                if slot <> 17067 or instruction <> 25361 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 785).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17071 {
                        if slot <= 17069 {
                            if slot <= 17068 {
// P-AXIS_RCS_AUTOPILOT.agc:746
//		TS	EDOTP
// slot 17068
                                if slot <> 17068 or instruction <> 23319 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:747
//		CCS	DAPTEMP1	# IF P COMMAND CHANGE EXCEEDS BREAKOUT
// slot 17069
                                if slot <> 17069 or instruction <> 5087 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 991).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17070 {
// P-AXIS_RCS_AUTOPILOT.agc:748
//		TCF	+3		# LEVEL, GO TO DIRECT RATE CONTROL.  IF NOT
// slot 17070
                                if slot <> 17070 or instruction <> 5809 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5809, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:749
//		TCF	+8D		# CHECK FOR DIRECT RATE CONTROL LAST TIME.
// slot 17071
                                if slot <> 17071 or instruction <> 5815 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5815, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17073 {
                            if slot <= 17072 {
// P-AXIS_RCS_AUTOPILOT.agc:750
//		TCF	+1
// slot 17072
                                if slot <> 17072 or instruction <> 5809 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5809, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:751
//# Page 1435
// P-AXIS_RCS_AUTOPILOT.agc:752
//		AD	-RATEDB
// slot 17073
                                if slot <> 17073 or instruction <> 25406 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 830).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17074 {
// P-AXIS_RCS_AUTOPILOT.agc:753
//		EXTEND
// slot 17074
                                if slot <> 17074 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:754
//		BZMF	+4
// slot 17075
                                if slot <> 17075 or instruction <> 26295 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26295, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 17089 {
                if slot <= 17082 {
                    if slot <= 17078 {
                        if slot <= 17076 {
// P-AXIS_RCS_AUTOPILOT.agc:755
//		CA	40CYC
// slot 17076
                            if slot <> 17076 or instruction <> 13915 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1627), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17077 {
// P-AXIS_RCS_AUTOPILOT.agc:756
//		TS	TCP
// slot 17077
                                if slot <> 17077 or instruction <> 23333 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23333, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:757
//		TC	PEGI
// slot 17078
                                if slot <> 17078 or instruction <> 1728 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1728, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17080 {
                            if slot <= 17079 {
// P-AXIS_RCS_AUTOPILOT.agc:758
//		CA	RCSFLAGS	# CHECK FOR DIRECT RATE COMMAND LAST TIME.
// slot 17079
                                if slot <> 17079 or instruction <> 12987 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:759
//		MASK	PBIT
// slot 17080
                                if slot <> 17080 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
                        } else {
                            if slot <= 17081 {
// P-AXIS_RCS_AUTOPILOT.agc:760
//		EXTEND
// slot 17081
                                if slot <> 17081 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:761
//		BZF	+2
// slot 17082
                                if slot <> 17082 or instruction <> 5820 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5820, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17085 {
                        if slot <= 17083 {
// P-AXIS_RCS_AUTOPILOT.agc:762
//		TC	PEGI		# TO PURE RATE COMMAND
// slot 17083
                            if slot <> 17083 or instruction <> 1728 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1728, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17084 {
// P-AXIS_RCS_AUTOPILOT.agc:763
//		CA	DXERROR		# PSEUDO-AUTO CONTROL.
// slot 17084
                                if slot <> 17084 or instruction <> 13094 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 806).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:764
//		TS	E		# X-ATTITUDE ERROR (SP)
// slot 17085
                                if slot <> 17085 or instruction <> 23530 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23530, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17087 {
                            if slot <= 17086 {
// P-AXIS_RCS_AUTOPILOT.agc:765
//		TS	PERROR		# LOAD P-AXIS ERROR FOR MODE1 FDAI DISPLAY
// slot 17086
                                if slot <> 17086 or instruction <> 23348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23348, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:766
//		TC	PURGENCY +4
// slot 17087
                                if slot <> 17087 or instruction <> 1847 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1847, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17088 {
// P-AXIS_RCS_AUTOPILOT.agc:767
//PEGI		CA	CDUX		# DIRECT RATE CONTROL.
// slot 17088
                                if slot <> 17088 or instruction <> 12314 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 26).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:768
//		TS	CDUXD
// slot 17089
                                if slot <> 17089 or instruction <> 23453 { return choose false if checkOnly else -1. }
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
                if slot <= 17096 {
                    if slot <= 17092 {
                        if slot <= 17090 {
// P-AXIS_RCS_AUTOPILOT.agc:769
//		CA	ZERO
// slot 17090
                            if slot <> 17090 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17091 {
// P-AXIS_RCS_AUTOPILOT.agc:770
//		TS	DXERROR
// slot 17091
                                if slot <> 17091 or instruction <> 23334 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23334, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:771
//		TS	DXERROR +1
// slot 17092
                                if slot <> 17092 or instruction <> 23335 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17094 {
                            if slot <= 17093 {
// P-AXIS_RCS_AUTOPILOT.agc:772
//		TS	PERROR		# ZERO P-AXIS ERROR FOR MODE1 FDAI DISPLAY
// slot 17093
                                if slot <> 17093 or instruction <> 23348 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23348, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:773
//		CCS	EDOTP
// slot 17094
                                if slot <> 17094 or instruction <> 4887 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 791).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17095 {
// P-AXIS_RCS_AUTOPILOT.agc:774
//		TC	+3
// slot 17095
                                if slot <> 17095 or instruction <> 1738 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1738, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:775
//		TC	+2
// slot 17096
                                if slot <> 17096 or instruction <> 1738 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1738, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17100 {
                        if slot <= 17098 {
                            if slot <= 17097 {
// P-AXIS_RCS_AUTOPILOT.agc:776
//		TC	+1
// slot 17097
                                if slot <> 17097 or instruction <> 1738 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1738, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:777
//		TS	ABSEDOTP
// slot 17098
                                if slot <> 17098 or instruction <> 23519 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17099 {
// P-AXIS_RCS_AUTOPILOT.agc:778
//		AD	TARGETDB
// slot 17099
                                if slot <> 17099 or instruction <> 25406 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 830).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:779
//		EXTEND			# IF RATE ERROR IS LESS THAN DEADBANK,
// slot 17100
                                if slot <> 17100 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17102 {
                            if slot <= 17101 {
// P-AXIS_RCS_AUTOPILOT.agc:780
//		BZMF	LAST		# FIRE, AN SWITCH TO PSEUDO-AUTO.
// slot 17101
                                if slot <> 17101 or instruction <> 26325 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26325, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:781
//		CA	TCP
// slot 17102
                                if slot <> 17102 or instruction <> 13093 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 805).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17103 {
// P-AXIS_RCS_AUTOPILOT.agc:782
//		EXTEND			# IF TIME IN RATE COMMAND EXCEEDS 4 SEC.
// slot 17103
                                if slot <> 17103 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:783
//		BZMF	LAST
// slot 17104
                                if slot <> 17104 or instruction <> 26325 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26325, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17133 {
            if slot <= 17118 {
                if slot <= 17111 {
                    if slot <= 17107 {
                        if slot <= 17105 {
// P-AXIS_RCS_AUTOPILOT.agc:784
//		CS	RCSFLAGS
// slot 17105
                            if slot <> 17105 or instruction <> 17083 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 699).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17106 {
// P-AXIS_RCS_AUTOPILOT.agc:785
//		MASK	PBIT
// slot 17106
                                if slot <> 17106 or instruction <> 31202 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:786
//		ADS	RCSFLAGS	# BIT 10 IS 1.
// slot 17107
                                if slot <> 17107 or instruction <> 11963 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17109 {
                            if slot <= 17108 {
// P-AXIS_RCS_AUTOPILOT.agc:787
//		TCF	+4
// slot 17108
                                if slot <> 17108 or instruction <> 5848 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5848, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:788
//LAST		CS	PBIT
// slot 17109
                                if slot <> 17109 or instruction <> 18914 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17110 {
// P-AXIS_RCS_AUTOPILOT.agc:789
//		MASK	RCSFLAGS
// slot 17110
                                if slot <> 17110 or instruction <> 29371 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 699).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:790
//		TS	RCSFLAGS	# BIT 10 IS 0.
// slot 17111
                                if slot <> 17111 or instruction <> 23227 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23227, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17114 {
                        if slot <= 17112 {
// P-AXIS_RCS_AUTOPILOT.agc:791
//		CS	EDOTP
// slot 17112
                            if slot <> 17112 or instruction <> 17175 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 791).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17113 {
// P-AXIS_RCS_AUTOPILOT.agc:792
//		EXTEND
// slot 17113
                                if slot <> 17113 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:793
//		MP	1/ANETP		# 1/2JTACC SCALED AT 2EXP(7)/PI
// slot 17114
                                if slot <> 17114 or instruction <> 29545 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 873, readEffective:call(words, 873)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17116 {
                            if slot <= 17115 {
// P-AXIS_RCS_AUTOPILOT.agc:794
//		DAS	A
// slot 17115
                                if slot <> 17115 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:795
//		TC	OVERSUB
// slot 17116
                                if slot <> 17116 or instruction <> 1224 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17117 {
// P-AXIS_RCS_AUTOPILOT.agc:796
//		EXTEND
// slot 17117
                                if slot <> 17117 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:797
//		MP	25/32		# A CONTAINS TJET SCALED AT 2EXP(4)(16/25)
// slot 17118
                                if slot <> 17118 or instruction <> 32718 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 4046, readEffective:call(words, 4046)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17125 {
                    if slot <= 17121 {
                        if slot <= 17119 {
// P-AXIS_RCS_AUTOPILOT.agc:798
//		TS	TJP		# 4.JET TIME
// slot 17119
                            if slot <> 17119 or instruction <> 23380 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23380, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17120 {
// P-AXIS_RCS_AUTOPILOT.agc:799
//		CA	ABSEDOTP
// slot 17120
                                if slot <> 17120 or instruction <> 13279 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 991).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:800
//		AD	-2JETLIM	# COMPARING DELTA RATE WITH 2 JET LIMIT
// slot 17121
                                if slot <> 17121 or instruction <> 25405 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 829).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17123 {
                            if slot <= 17122 {
// P-AXIS_RCS_AUTOPILOT.agc:801
//		EXTEND
// slot 17122
                                if slot <> 17122 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:802
//# Page 1436
// P-AXIS_RCS_AUTOPILOT.agc:803
//		BZMF	+3
// slot 17123
                                if slot <> 17123 or instruction <> 26342 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26342, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17124 {
// P-AXIS_RCS_AUTOPILOT.agc:804
//
// P-AXIS_RCS_AUTOPILOT.agc:805
//		CA	SIX
// slot 17124
                                if slot <> 17124 or instruction <> 15522 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:806
//		TCF	+8D
// slot 17125
                                if slot <> 17125 or instruction <> 5869 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5869, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17129 {
                        if slot <= 17127 {
                            if slot <= 17126 {
// P-AXIS_RCS_AUTOPILOT.agc:807
//		CA	TJP
// slot 17126
                                if slot <> 17126 or instruction <> 13140 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 852).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:808
//		ADS	TJP
// slot 17127
                                if slot <> 17127 or instruction <> 12116 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 852).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17128 {
// P-AXIS_RCS_AUTOPILOT.agc:809
//
// P-AXIS_RCS_AUTOPILOT.agc:810
//# GOES TO PJETSLEC FOR TWO JETS
// P-AXIS_RCS_AUTOPILOT.agc:811
//# P-JET-SELECTION-ROUTINE (ROTATION)
// P-AXIS_RCS_AUTOPILOT.agc:812
//#
// P-AXIS_RCS_AUTOPILOT.agc:813
//# INPUT:	NUMBERT		4,5,6 FOR WHICH PAIR OR 4 JETS
// P-AXIS_RCS_AUTOPILOT.agc:814
//#		TJP		+ FOR +P ROTATION
// P-AXIS_RCS_AUTOPILOT.agc:815
//#
// P-AXIS_RCS_AUTOPILOT.agc:816
//# OUTPUT:	CHANNEL 6
// P-AXIS_RCS_AUTOPILOT.agc:817
//#		PJUMPADR	FOR P-AXIS SKIP
// P-AXIS_RCS_AUTOPILOT.agc:818
//#		(JTLST CALL)	(SMALL TJP)
// P-AXIS_RCS_AUTOPILOT.agc:819
//#
// P-AXIS_RCS_AUTOPILOT.agc:820
//# ORDER OF POLICIES TRIED IN CASE OF FAILURE.
// P-AXIS_RCS_AUTOPILOT.agc:821
//#	+P	-P
// P-AXIS_RCS_AUTOPILOT.agc:822
//#	7,15	8,16
// P-AXIS_RCS_AUTOPILOT.agc:823
//#	4,12	3,11
// P-AXIS_RCS_AUTOPILOT.agc:824
//#	4,7	8,11
// P-AXIS_RCS_AUTOPILOT.agc:825
//#	7,12	11,16
// P-AXIS_RCS_AUTOPILOT.agc:826
//#	12,15	3,16
// P-AXIS_RCS_AUTOPILOT.agc:827
//#	4,15	3,8
// P-AXIS_RCS_AUTOPILOT.agc:828
//#	ALARM	ALARM
// P-AXIS_RCS_AUTOPILOT.agc:829
//
// P-AXIS_RCS_AUTOPILOT.agc:830
//		CA	AORBSYST
// slot 17128
                                if slot <> 17128 or instruction <> 14823 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:831
//		MASK	DAPBOOLS
// slot 17129
                                if slot <> 17129 or instruction <> 28745 { return choose false if checkOnly else -1. }
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
                        if slot <= 17131 {
                            if slot <= 17130 {
// P-AXIS_RCS_AUTOPILOT.agc:832
//		CCS	A
// slot 17130
                                if slot <> 17130 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:833
//		CA	ONE
// slot 17131
                                if slot <> 17131 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                            if slot <= 17132 {
// P-AXIS_RCS_AUTOPILOT.agc:834
//		AD	FOUR
// slot 17132
                                if slot <> 17132 or instruction <> 27113 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:835
//		TS	NUMBERT
// slot 17133
                                if slot <> 17133 or instruction <> 23523 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23523, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 17148 {
                if slot <= 17140 {
                    if slot <= 17136 {
                        if slot <= 17134 {
// P-AXIS_RCS_AUTOPILOT.agc:836
//PJETSLEC	CA	ONE
// slot 17134
                            if slot <> 17134 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17135 {
// P-AXIS_RCS_AUTOPILOT.agc:837
//		TS	L
// slot 17135
                                if slot <> 17135 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:838
//		CCS	TJP
// slot 17136
                                if slot <> 17136 or instruction <> 4948 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 852).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17138 {
                            if slot <= 17137 {
// P-AXIS_RCS_AUTOPILOT.agc:839
//		TCF	+5
// slot 17137
                                if slot <> 17137 or instruction <> 5878 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5878, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:840
//		TCF	JETSOFF
// slot 17138
                                if slot <> 17138 or instruction <> 5922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5922, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17139 {
// P-AXIS_RCS_AUTOPILOT.agc:841
//		TCF	+2
// slot 17139
                                if slot <> 17139 or instruction <> 5877 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5877, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:842
//		TCF	JETSOFF
// slot 17140
                                if slot <> 17140 or instruction <> 5922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5922, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17144 {
                        if slot <= 17142 {
                            if slot <= 17141 {
// P-AXIS_RCS_AUTOPILOT.agc:843
//		ZL
// slot 17141
                                if slot <> 17141 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:844
//		AD	ONE
// slot 17142
                                if slot <> 17142 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                            if slot <= 17143 {
// P-AXIS_RCS_AUTOPILOT.agc:845
//		TS	ABSTJ
// slot 17143
                                if slot <> 17143 or instruction <> 23519 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23519, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:846
//		LXCH	ROTINDEX
// slot 17144
                                if slot <> 17144 or instruction <> 10212 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 996, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17146 {
                            if slot <= 17145 {
// P-AXIS_RCS_AUTOPILOT.agc:847
//		TC	SELECTP
// slot 17145
                                if slot <> 17145 or instruction <> 1881 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1881, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:848
//		CS	SIX
// slot 17146
                                if slot <> 17146 or instruction <> 19618 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17147 {
// P-AXIS_RCS_AUTOPILOT.agc:849
//		AD	NUMBERT
// slot 17147
                                if slot <> 17147 or instruction <> 25571 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 995).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:850
//		EXTEND
// slot 17148
                                if slot <> 17148 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 17155 {
                    if slot <= 17151 {
                        if slot <= 17149 {
// P-AXIS_RCS_AUTOPILOT.agc:851
//		BZF	+2
// slot 17149
                            if slot <> 17149 or instruction <> 5887 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5887, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17150 {
// P-AXIS_RCS_AUTOPILOT.agc:852
//
// P-AXIS_RCS_AUTOPILOT.agc:853
//		CS	TWO
// slot 17150
                                if slot <> 17150 or instruction <> 18922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:854
//
// P-AXIS_RCS_AUTOPILOT.agc:855
//# Page 1437
// P-AXIS_RCS_AUTOPILOT.agc:856
//		AD	FOUR
// slot 17151
                                if slot <> 17151 or instruction <> 27113 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17153 {
                            if slot <= 17152 {
// P-AXIS_RCS_AUTOPILOT.agc:857
//		TS	NO.PJETS
// slot 17152
                                if slot <> 17152 or instruction <> 23377 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23377, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:858
//		CA	POLYTEMP
// slot 17153
                                if slot <> 17153 or instruction <> 13281 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 993).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17154 {
// P-AXIS_RCS_AUTOPILOT.agc:859
//		TC	WRITEP
// slot 17154
                                if slot <> 17154 or instruction <> 3052 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 3052, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:860
//		CS	ABSTJ
// slot 17155
                                if slot <> 17155 or instruction <> 17375 { return choose false if checkOnly else -1. }
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
                    if slot <= 17159 {
                        if slot <= 17157 {
                            if slot <= 17156 {
// P-AXIS_RCS_AUTOPILOT.agc:861
//		AD	+150MST6
// slot 17156
                                if slot <> 17156 or instruction <> 26506 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1930), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:862
//		EXTEND
// slot 17157
                                if slot <> 17157 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17158 {
// P-AXIS_RCS_AUTOPILOT.agc:863
//		BZMF	QRAXIS		# GO TO QRAXIS OR TO GTS.
// slot 17158
                                if slot <> 17158 or instruction <> 26516 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26516, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:864
//
// P-AXIS_RCS_AUTOPILOT.agc:865
//		AD	-136MST6
// slot 17159
                                if slot <> 17159 or instruction <> 26490 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1914), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17161 {
                            if slot <= 17160 {
// P-AXIS_RCS_AUTOPILOT.agc:866
//		EXTEND
// slot 17160
                                if slot <> 17160 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:867
//		BZMF	+5
// slot 17161
                                if slot <> 17161 or instruction <> 26382 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26382, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17162 {
// P-AXIS_RCS_AUTOPILOT.agc:868
//
// P-AXIS_RCS_AUTOPILOT.agc:869
//		ADS	ABSTJ
// slot 17162
                                if slot <> 17162 or instruction <> 12255 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 991).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// P-AXIS_RCS_AUTOPILOT.agc:870
//		INDEX	ROTINDEX
// slot 17163
                                if slot <> 17163 or instruction <> 21476 { return choose false if checkOnly else -1. }
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
            }
        }
    }
}
set agcAotRoutes[1015] to agcAotUnit1015@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:871
//		CA	MINTIMES
// slot 17164
    17164, 28450
)).

// bank 16, slots 17165-17170
function agcAotUnit1016 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17167 {
        if slot <= 17165 {
// P-AXIS_RCS_AUTOPILOT.agc:872
//		TS	TJP
// slot 17165
            if slot <> 17165 or instruction <> 23380 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23380, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17166 {
// P-AXIS_RCS_AUTOPILOT.agc:873
//
// P-AXIS_RCS_AUTOPILOT.agc:874
//		CA	ABSTJ
// slot 17166
                if slot <> 17166 or instruction <> 13279 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 991).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:875
//		ZL
// slot 17167
                if slot <> 17167 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
        if slot <= 17168 {
// P-AXIS_RCS_AUTOPILOT.agc:876
//		INHINT
// slot 17168
            if slot <> 17168 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17169 {
// P-AXIS_RCS_AUTOPILOT.agc:877
//		DXCH	T6FURTHA
// slot 17169
                if slot <> 17169 or instruction <> 22329 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 825, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:878
//		TC	IBNKCALL
// slot 17170
                if slot <> 17170 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1016] to agcAotUnit1016@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:879
//		CADR	JTLST
// slot 17171
    17171, 31896
)).

// bank 16, slots 17172-17176
function agcAotUnit1017 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17173 {
        if slot <= 17172 {
// P-AXIS_RCS_AUTOPILOT.agc:880
//		CS	BIT12
// slot 17172
            if slot <> 17172 or instruction <> 18912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P-AXIS_RCS_AUTOPILOT.agc:881
//		MASK	RCSFLAGS
// slot 17173
            if slot <> 17173 or instruction <> 29371 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 699).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17174 {
// P-AXIS_RCS_AUTOPILOT.agc:882
//		TS	RCSFLAGS	# BIT 12 SET TO 0.
// slot 17174
            if slot <> 17174 or instruction <> 23227 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23227, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17175 {
// P-AXIS_RCS_AUTOPILOT.agc:883
//		TC	ALTSYST
// slot 17175
                if slot <> 17175 or instruction <> 1817 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1817, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:884
//		TCF	QRAXIS
// slot 17176
                if slot <> 17176 or instruction <> 6036 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6036, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1017] to agcAotUnit1017@.

// bank 16, slots 17177-17214
function agcAotUnit1018 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17195 {
        if slot <= 17185 {
            if slot <= 17180 {
                if slot <= 17178 {
                    if slot <= 17177 {
// P-AXIS_RCS_AUTOPILOT.agc:885
//
// P-AXIS_RCS_AUTOPILOT.agc:886
//ALTSYST		CA	DAPBOOLS	# ALTERNATE P-AXIS JETS
// slot 17177
                        if slot <> 17177 or instruction <> 12361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:887
//		TS	L
// slot 17178
                        if slot <> 17178 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17179 {
// P-AXIS_RCS_AUTOPILOT.agc:888
//		CA	AORBSYST
// slot 17179
                        if slot <> 17179 or instruction <> 14823 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:889
//		EXTEND
// slot 17180
                        if slot <> 17180 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17182 {
                    if slot <= 17181 {
// P-AXIS_RCS_AUTOPILOT.agc:890
//		RXOR	LCHAN
// slot 17181
                        if slot <> 17181 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:891
//		TS	DAPBOOLS
// slot 17182
                        if slot <> 17182 or instruction <> 22601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22601, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17183 {
// P-AXIS_RCS_AUTOPILOT.agc:892
//		RELINT
// slot 17183
                        if slot <> 17183 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17184 {
// P-AXIS_RCS_AUTOPILOT.agc:893
//		TC	Q
// slot 17184
                            if slot <> 17184 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:894
//
// P-AXIS_RCS_AUTOPILOT.agc:895
//DKALT		TC	ALTSYST
// slot 17185
                            if slot <> 17185 or instruction <> 1817 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1817, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17190 {
                if slot <= 17187 {
                    if slot <= 17186 {
// P-AXIS_RCS_AUTOPILOT.agc:896
//
// P-AXIS_RCS_AUTOPILOT.agc:897
//JETSOFF		TC	WRITEP 	-1
// slot 17186
                        if slot <> 17186 or instruction <> 3051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3051, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:898
//		CA	ZERO
// slot 17187
                        if slot <> 17187 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 17188 {
// P-AXIS_RCS_AUTOPILOT.agc:899
//		TS	TJP
// slot 17188
                        if slot <> 17188 or instruction <> 23380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23380, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17189 {
// P-AXIS_RCS_AUTOPILOT.agc:900
//		TCF	QRAXIS
// slot 17189
                            if slot <> 17189 or instruction <> 6036 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6036, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:901
//
// P-AXIS_RCS_AUTOPILOT.agc:902
//# (NOTE -- M13 = 1 IDENTICALLY IMPLIES NULL MULTIPLICATION.)
// P-AXIS_RCS_AUTOPILOT.agc:903
//
// P-AXIS_RCS_AUTOPILOT.agc:904
//CALCPERR	CA	CDUY		# P-ERROR CALCULATION.
// slot 17190
                            if slot <> 17190 or instruction <> 12315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 27).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17192 {
                    if slot <= 17191 {
// P-AXIS_RCS_AUTOPILOT.agc:905
//		EXTEND
// slot 17191
                        if slot <> 17191 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:906
//		MSU	CDUYD		# CDU VALUE -- ANGLE DESIRED (Y-AXIS)
// slot 17192
                        if slot <> 17192 or instruction <> 9118 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17193 {
// P-AXIS_RCS_AUTOPILOT.agc:907
//# Page 1438
// P-AXIS_RCS_AUTOPILOT.agc:908
//		EXTEND
// slot 17193
                        if slot <> 17193 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17194 {
// P-AXIS_RCS_AUTOPILOT.agc:909
//		MP	M11		# (CDUY-CDUYD)M11 SCALED AT PI RADIANS
// slot 17194
                            if slot <> 17194 or instruction <> 29452 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 780, readEffective:call(words, 780)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:910
//		XCH	E		# SAVE FIRST TERM (OF TWO)
// slot 17195
                            if slot <> 17195 or instruction <> 24554 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 1002, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17204 {
            if slot <= 17199 {
                if slot <= 17197 {
                    if slot <= 17196 {
// P-AXIS_RCS_AUTOPILOT.agc:911
//		CA	CDUX		# THIRD COMPONENT
// slot 17196
                        if slot <> 17196 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:912
//		EXTEND
// slot 17197
                        if slot <> 17197 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17198 {
// P-AXIS_RCS_AUTOPILOT.agc:913
//		MSU	CDUXD		# CDU VALUE -- ANGLE DESIRED (X-AXIS)
// slot 17198
                        if slot <> 17198 or instruction <> 9117 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 925).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:914
//#		EXTEND
// P-AXIS_RCS_AUTOPILOT.agc:915
//#		MP	M13
// P-AXIS_RCS_AUTOPILOT.agc:916
//		AD	DELPEROR	# KALCMANU INTERFACE ERROR.
// slot 17199
                        if slot <> 17199 or instruction <> 25279 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 703).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17201 {
                    if slot <= 17200 {
// P-AXIS_RCS_AUTOPILOT.agc:917
//		ADS	E		# SAVE SUM OF TERMS.  COULD BE OVERFLOW.
// slot 17200
                        if slot <> 17200 or instruction <> 12266 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:918
//		XCH	PERROR		# SAVE P-ERROR FOR EIGHT-BALL DISPLAY.
// slot 17201
                        if slot <> 17201 or instruction <> 24372 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 820, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17202 {
// P-AXIS_RCS_AUTOPILOT.agc:919
//		TC	Q		# RETURN TO CALLER
// slot 17202
                        if slot <> 17202 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17203 {
// P-AXIS_RCS_AUTOPILOT.agc:920
//
// P-AXIS_RCS_AUTOPILOT.agc:921
//# P-AXIS URGENCY FUNCTION CALCULATION.
// P-AXIS_RCS_AUTOPILOT.agc:922
//
// P-AXIS_RCS_AUTOPILOT.agc:923
//PURGENCY	TC	CALCPERR	# CALCULATE P-AXIS ERRORS.
// slot 17203
                            if slot <> 17203 or instruction <> 1830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1830, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:924
//		CS	OMEGAPD		# THIS CODING IS COMMON TO BOTH LM DAP AND
// slot 17204
                            if slot <> 17204 or instruction <> 17315 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 931).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17209 {
                if slot <= 17206 {
                    if slot <= 17205 {
// P-AXIS_RCS_AUTOPILOT.agc:925
//		AD	OMEGAP		# SPS-BACKUP MODE.
// slot 17205
                        if slot <> 17205 or instruction <> 25361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 785).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P-AXIS_RCS_AUTOPILOT.agc:926
//		TS	EDOTP		# EDOTP = OMEGAP - OMEGAPD AT PI/4 RAD/SEC
// slot 17206
                        if slot <> 17206 or instruction <> 23319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17207 {
// P-AXIS_RCS_AUTOPILOT.agc:927
//
// P-AXIS_RCS_AUTOPILOT.agc:928
//		CS	ONE
// slot 17207
                        if slot <> 17207 or instruction <> 18923 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17208 {
// P-AXIS_RCS_AUTOPILOT.agc:929
//		TS	AXISCTR
// slot 17208
                            if slot <> 17208 or instruction <> 23365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:930
//		CA	DAPBOOLS
// slot 17209
                            if slot <> 17209 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17211 {
                    if slot <= 17210 {
// P-AXIS_RCS_AUTOPILOT.agc:931
//		MASK	CSMDOCKD
// slot 17210
                        if slot <> 17210 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// P-AXIS_RCS_AUTOPILOT.agc:932
//		EXTEND
// slot 17211
                        if slot <> 17211 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17212 {
// P-AXIS_RCS_AUTOPILOT.agc:933
//		BZF	HEADTJET
// slot 17212
                        if slot <> 17212 or instruction <> 5957 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5957, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17213 {
// P-AXIS_RCS_AUTOPILOT.agc:934
//		INHINT			# IF CSMDOCKD = 1, GOT TO DOCKED RCS LOGIC
// slot 17213
                            if slot <> 17213 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// P-AXIS_RCS_AUTOPILOT.agc:935
//		TC	IBNKCALL
// slot 17214
                            if slot <> 17214 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1018] to agcAotUnit1018@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:936
//		CADR	SPSRCS
// slot 17215
    17215, 36782
)).

// bank 16, slots 17216-17224
function agcAotUnit1019 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17219 {
        if slot <= 17217 {
            if slot <= 17216 {
// P-AXIS_RCS_AUTOPILOT.agc:937
//
// P-AXIS_RCS_AUTOPILOT.agc:938
//		CA	TJP
// slot 17216
                if slot <> 17216 or instruction <> 13140 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 852).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:939
//		EXTEND
// slot 17217
                if slot <> 17217 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17218 {
// P-AXIS_RCS_AUTOPILOT.agc:940
//		BZF	DKALT		# IF TJP = ZERO, CHANGE AORBSYST.
// slot 17218
                if slot <> 17218 or instruction <> 5921 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5921, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:941
//		RELINT
// slot 17219
                if slot <> 17219 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17221 {
            if slot <= 17220 {
// P-AXIS_RCS_AUTOPILOT.agc:942
//		TCF	PJETSLEC -6	# SELECT AORBSYST AND USE TWO JETS.
// slot 17220
                if slot <> 17220 or instruction <> 5864 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5864, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:943
//HEADTJET	CA	ZERO
// slot 17221
                if slot <> 17221 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 17222 {
// P-AXIS_RCS_AUTOPILOT.agc:944
//		TS	SENSETYP
// slot 17222
                if slot <> 17222 or instruction <> 23360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23360, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17223 {
// P-AXIS_RCS_AUTOPILOT.agc:945
//		INHINT
// slot 17223
                    if slot <> 17223 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:946
//		TC	IBNKCALL
// slot 17224
                    if slot <> 17224 or instruction <> 2492 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1019] to agcAotUnit1019@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:947
//		CADR	TJETLAW
// slot 17225
    17225, 32084
)).

// bank 16, slots 17226-17238
function agcAotUnit1020 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17231 {
        if slot <= 17228 {
            if slot <= 17226 {
// P-AXIS_RCS_AUTOPILOT.agc:948
//		RELINT
// slot 17226
                if slot <> 17226 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17227 {
// P-AXIS_RCS_AUTOPILOT.agc:949
//
// P-AXIS_RCS_AUTOPILOT.agc:950
//		CS	FIREFCT
// slot 17227
                    if slot <> 17227 or instruction <> 17377 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 993).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:951
//		AD	-FOURDEG
// slot 17228
                    if slot <> 17228 or instruction <> 26456 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1880), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17229 {
// P-AXIS_RCS_AUTOPILOT.agc:952
//		EXTEND
// slot 17229
                if slot <> 17229 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17230 {
// P-AXIS_RCS_AUTOPILOT.agc:953
//		BZMF	PJETSLEC -6
// slot 17230
                    if slot <> 17230 or instruction <> 26344 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26344, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:954
//		CCS	TJP
// slot 17231
                    if slot <> 17231 or instruction <> 4948 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 852).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17234 {
            if slot <= 17232 {
// P-AXIS_RCS_AUTOPILOT.agc:955
//		TCF	+2
// slot 17232
                if slot <> 17232 or instruction <> 5970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17233 {
// P-AXIS_RCS_AUTOPILOT.agc:956
//		TCF	JETSOFF
// slot 17233
                    if slot <> 17233 or instruction <> 5922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5922, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:957
//# Page 1439
// P-AXIS_RCS_AUTOPILOT.agc:958
//		AD	-160MST6
// slot 17234
                    if slot <> 17234 or instruction <> 26455 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1879), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17236 {
                if slot <= 17235 {
// P-AXIS_RCS_AUTOPILOT.agc:959
//		EXTEND
// slot 17235
                    if slot <> 17235 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:960
//		BZMF	PJETSLEC -6
// slot 17236
                    if slot <> 17236 or instruction <> 26344 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26344, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17237 {
// P-AXIS_RCS_AUTOPILOT.agc:961
//		CA	SIX
// slot 17237
                    if slot <> 17237 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:962
//		TCF	PJETSLEC -1
// slot 17238
                    if slot <> 17238 or instruction <> 5869 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5869, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1020] to agcAotUnit1020@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:963
//-160MST6	DEC	-256
// slot 17239
    17239, 65022,
// P-AXIS_RCS_AUTOPILOT.agc:964
//-FOURDEG	DEC	-.08888
// slot 17240
    17240, 62622
)).

// bank 16, slots 17241-17243
function agcAotUnit1021 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17241 {
// P-AXIS_RCS_AUTOPILOT.agc:965
//
// P-AXIS_RCS_AUTOPILOT.agc:966
//# Page 1440
// P-AXIS_RCS_AUTOPILOT.agc:967
//# JET POLICY CONSTRUCTION SUBROUTINE
// P-AXIS_RCS_AUTOPILOT.agc:968
//#
// P-AXIS_RCS_AUTOPILOT.agc:969
//# INPUT:	ROTINDEX, NUMBERT
// P-AXIS_RCS_AUTOPILOT.agc:970
//#
// P-AXIS_RCS_AUTOPILOT.agc:971
//# OUTPUT:	POLYTEMP (JET POLICY)
// P-AXIS_RCS_AUTOPILOT.agc:972
//#
// P-AXIS_RCS_AUTOPILOT.agc:973
//# THIS SUBROUTINE SELECT A SUBSET OF THE DESIRED JETS WHICH HAS NO FAILURE
// P-AXIS_RCS_AUTOPILOT.agc:974
//
// P-AXIS_RCS_AUTOPILOT.agc:975
//SELECTP		CA	SIX
// slot 17241
        if slot <> 17241 or instruction <> 15522 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17242 {
// P-AXIS_RCS_AUTOPILOT.agc:976
//		TS	TEMPNUM
// slot 17242
            if slot <> 17242 or instruction <> 23522 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23522, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P-AXIS_RCS_AUTOPILOT.agc:977
//		INDEX	NUMBERT
// slot 17243
            if slot <> 17243 or instruction <> 21475 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1021] to agcAotUnit1021@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:978
//		CA	TYPEP
// slot 17244
    17244, 28390
)).

// bank 16, slots 17245-17245
function agcAotUnit1022 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P-AXIS_RCS_AUTOPILOT.agc:979
//		INDEX	ROTINDEX
// slot 17245
    if slot <> 17245 or instruction <> 21476 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1022] to agcAotUnit1022@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:980
//		MASK	JETSALL
// slot 17246
    17246, 61144
)).

// bank 16, slots 17247-17254
function agcAotUnit1023 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17250 {
        if slot <= 17248 {
            if slot <= 17247 {
// P-AXIS_RCS_AUTOPILOT.agc:981
//		TS	POLYTEMP
// slot 17247
                if slot <> 17247 or instruction <> 23521 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23521, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:982
//		MASK	CH6MASK
// slot 17248
                if slot <> 17248 or instruction <> 29363 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 691).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17249 {
// P-AXIS_RCS_AUTOPILOT.agc:983
//		CCS	A
// slot 17249
                if slot <> 17249 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:984
//		TCF	+2
// slot 17250
                if slot <> 17250 or instruction <> 5988 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5988, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17252 {
            if slot <= 17251 {
// P-AXIS_RCS_AUTOPILOT.agc:985
//		TC	Q
// slot 17251
                if slot <> 17251 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:986
//		CCS	TEMPNUM
// slot 17252
                if slot <> 17252 or instruction <> 5090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 994).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17253 {
// P-AXIS_RCS_AUTOPILOT.agc:987
//		TCF	+4
// slot 17253
                if slot <> 17253 or instruction <> 5993 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5993, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:988
//		TC	ALARM
// slot 17254
                if slot <> 17254 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1023] to agcAotUnit1023@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:989
//		OCT	02003
// slot 17255
    17255, 2054
)).

// bank 16, slots 17256-17259
function agcAotUnit1024 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17257 {
        if slot <= 17256 {
// P-AXIS_RCS_AUTOPILOT.agc:990
//		TCF	JETSOFF		# ********** TCF ALARMJET **********
// slot 17256
            if slot <> 17256 or instruction <> 5922 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5922, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P-AXIS_RCS_AUTOPILOT.agc:991
//SELECTYZ	TS	NUMBERT
// slot 17257
            if slot <> 17257 or instruction <> 23523 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23523, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17258 {
// P-AXIS_RCS_AUTOPILOT.agc:992
//		TCF	SELECTP	+1
// slot 17258
            if slot <> 17258 or instruction <> 5978 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5978, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P-AXIS_RCS_AUTOPILOT.agc:993
// -1		TCF	ABORTYZ +2
// slot 17259
            if slot <> 17259 or instruction <> 5627 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5627, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1024] to agcAotUnit1024@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:994
//JETSALL		OCT	00252
// slot 17260
    17260, 340,
// P-AXIS_RCS_AUTOPILOT.agc:995
//		OCT	00125		# +P
// slot 17261
    17261, 170,
// P-AXIS_RCS_AUTOPILOT.agc:996
//		OCT	00140		# -Y
// slot 17262
    17262, 192,
// P-AXIS_RCS_AUTOPILOT.agc:997
//		OCT	00006		# -Z
// slot 17263
    17263, 12,
// P-AXIS_RCS_AUTOPILOT.agc:998
//		OCT	00220		# +Y
// slot 17264
    17264, 288,
// P-AXIS_RCS_AUTOPILOT.agc:999
//		OCT	00011		# +Z
// slot 17265
    17265, 18,
// P-AXIS_RCS_AUTOPILOT.agc:1000
//		OCT	00151		# +V
// slot 17266
    17266, 210,
// P-AXIS_RCS_AUTOPILOT.agc:1001
//TYPEP		OCT	00146		# -U
// slot 17267
    17267, 204,
// P-AXIS_RCS_AUTOPILOT.agc:1002
//		OCT	00226		# -V
// slot 17268
    17268, 300,
// P-AXIS_RCS_AUTOPILOT.agc:1003
//		OCT	00231		# +U
// slot 17269
    17269, 306,
// P-AXIS_RCS_AUTOPILOT.agc:1004
//		OCT	00151		# +V
// slot 17270
    17270, 210,
// P-AXIS_RCS_AUTOPILOT.agc:1005
//		OCT	00132		# 1-3
// slot 17271
    17271, 180,
// P-AXIS_RCS_AUTOPILOT.agc:1006
//		OCT	00245		# 2-4
// slot 17272
    17272, 330,
// P-AXIS_RCS_AUTOPILOT.agc:1007
//		OCT	00377		# ALL
// slot 17273
    17273, 510,
// P-AXIS_RCS_AUTOPILOT.agc:1008
//INDXYZ		=	-136MST6
// P-AXIS_RCS_AUTOPILOT.agc:1009
//-136MST6	DEC	-218
// slot 17274
    17274, 65098,
// P-AXIS_RCS_AUTOPILOT.agc:1010
//		DEC	4
// slot 17275
    17275, 8,
// P-AXIS_RCS_AUTOPILOT.agc:1011
//		DEC	2
// slot 17276
    17276, 4,
// P-AXIS_RCS_AUTOPILOT.agc:1012
//		OCT	07776
// slot 17277
    17277, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1013
//		DEC	5
// slot 17278
    17278, 10,
// P-AXIS_RCS_AUTOPILOT.agc:1014
//		DEC	9
// slot 17279
    17279, 18,
// P-AXIS_RCS_AUTOPILOT.agc:1015
//		DEC	10
// slot 17280
    17280, 20,
// P-AXIS_RCS_AUTOPILOT.agc:1016
//		OCT	07776
// slot 17281
    17281, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1017
//		DEC	3
// slot 17282
    17282, 6,
// P-AXIS_RCS_AUTOPILOT.agc:1018
//# Page 1441
// P-AXIS_RCS_AUTOPILOT.agc:1019
//		DEC	8
// slot 17283
    17283, 16,
// P-AXIS_RCS_AUTOPILOT.agc:1020
//		DEC	7
// slot 17284
    17284, 14,
// P-AXIS_RCS_AUTOPILOT.agc:1021
//		OCT	07776		# THESE INDEXES OF MASK JETSALL WILL
// slot 17285
    17285, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1022
//		OCT	07776		# CHANGE THE INSTRUCTION AT SELECTP +4
// slot 17286
    17286, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1023
//		OCT	07776		# TO BE		TC JETSALL -1
// slot 17287
    17287, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1024
//		OCT	07776		# ONLY USED FOR TRANSLATION FAILURE
// slot 17288
    17288, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1025
//		OCT	07776
// slot 17289
    17289, 8188,
// P-AXIS_RCS_AUTOPILOT.agc:1026
//+150MST6	DEC	240
// slot 17290
    17290, 480,
// P-AXIS_RCS_AUTOPILOT.agc:1027
//07400OCT	OCT	07400
// slot 17291
    17291, 7680,
// P-AXIS_RCS_AUTOPILOT.agc:1028
//
// P-AXIS_RCS_AUTOPILOT.agc:1029
//# T-JET LAW FIXED CONSTANTS
// P-AXIS_RCS_AUTOPILOT.agc:1030
//
// P-AXIS_RCS_AUTOPILOT.agc:1031
//NORMSCL		OCT	266
// slot 17292
    17292, 364,
// P-AXIS_RCS_AUTOPILOT.agc:1032
//-100MS		DEC	-.1
// slot 17293
    17293, 62258,
// P-AXIS_RCS_AUTOPILOT.agc:1033
//200MS		DEC	.2
// slot 17294
    17294, 6554,
// P-AXIS_RCS_AUTOPILOT.agc:1034
//25/32		=	PRIO31		# (DEC .78125)
// P-AXIS_RCS_AUTOPILOT.agc:1035
//BITS8,9		OCTAL	00600
// slot 17295
    17295, 768,
// P-AXIS_RCS_AUTOPILOT.agc:1036
//1/40		DEC	.02500
// slot 17296
    17296, 820,
// P-AXIS_RCS_AUTOPILOT.agc:1037
//MINTIMES	DEC	-22
// slot 17297
    17297, 65490,
// P-AXIS_RCS_AUTOPILOT.agc:1038
//		DEC	22
// slot 17298
    17298, 44,
// P-AXIS_RCS_AUTOPILOT.agc:1039
//PSKIPADR	GENADR	SKIPPAXS
// slot 17299
    17299, 3000
)).

// bank 16, slots 17300-17310
function agcAotUnit1025 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17304 {
        if slot <= 17301 {
            if slot <= 17300 {
// P-AXIS_RCS_AUTOPILOT.agc:1040
//
// P-AXIS_RCS_AUTOPILOT.agc:1041
//# GOES TO Q,R-AXES RCS AUTOPILOT
// P-AXIS_RCS_AUTOPILOT.agc:1042
//
// P-AXIS_RCS_AUTOPILOT.agc:1043
//QRAXIS		CS	OMEGARD
// slot 17300
                if slot <> 17300 or instruction <> 17317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 933).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P-AXIS_RCS_AUTOPILOT.agc:1044
//		AD	OMEGAR
// slot 17301
                if slot <> 17301 or instruction <> 25363 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 787).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17302 {
// P-AXIS_RCS_AUTOPILOT.agc:1045
//		TC	OVERSUB
// slot 17302
                if slot <> 17302 or instruction <> 1224 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1224, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17303 {
// P-AXIS_RCS_AUTOPILOT.agc:1046
//		TS	EDOTR
// slot 17303
                    if slot <> 17303 or instruction <> 23327 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23327, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:1047
//		CS	OMEGAQD
// slot 17304
                    if slot <> 17304 or instruction <> 17316 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 932).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17307 {
            if slot <= 17305 {
// P-AXIS_RCS_AUTOPILOT.agc:1048
//		AD	OMEGAQ
// slot 17305
                if slot <> 17305 or instruction <> 25362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 786).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17306 {
// P-AXIS_RCS_AUTOPILOT.agc:1049
//		TC	OVERSUB
// slot 17306
                    if slot <> 17306 or instruction <> 1224 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1224, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:1050
//		TS	EDOTQ
// slot 17307
                    if slot <> 17307 or instruction <> 23326 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23326, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17308 {
// P-AXIS_RCS_AUTOPILOT.agc:1051
//		EXTEND
// slot 17308
                if slot <> 17308 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17309 {
// P-AXIS_RCS_AUTOPILOT.agc:1052
//		DCA	QERRCALL
// slot 17309
                    if slot <> 17309 or instruction <> 14240 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1952, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P-AXIS_RCS_AUTOPILOT.agc:1053
//		DTCB
// slot 17310
                    if slot <> 17310 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1025] to agcAotUnit1025@.

agcAotInstallSourceRope(list(
// P-AXIS_RCS_AUTOPILOT.agc:1054
//
// P-AXIS_RCS_AUTOPILOT.agc:1055
//		EBANK=	AOSQ
// P-AXIS_RCS_AUTOPILOT.agc:1056
//QERRCALL	2CADR	CALLQERR
// slot 17311 17312
    17311, 2164, 17312, 30860
)).

