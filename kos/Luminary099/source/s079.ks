// SYSTEM_TEST_STANDARD_LEAD_INS.agc
// bank 04, slots 6526-6532
function agcAotUnit384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6528 {
        if slot <= 6526 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:1
//# Copyright:	Public domain.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:2
//# Filename:	SYSTEM_TEST_STANDARD_LEAD_INS.agc
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:6
//# Assembler:	yaYUL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:8
//# Website:	www.ibiblio.org/apollo.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:9
//# Pages:	370-372
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:11
//#				Luminary131 file, using page
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:12
//#				images from Luminary 1A.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:13
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:14
//# This source code has been transcribed or otherwise adapted from
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:18
//# in storage size and consequent reduction in image quality as well) are
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:21
//# about getting access to the (much) higher-quality images which Paul
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:22
//# actually created.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:23
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:24
//# Notations on the hardcopy document read, in part:
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:25
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:27
//#	16:27 JULY 14, 1969
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:28
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:29
//# Page 370
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:30
//		EBANK=	XSM
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:31
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:32
//		BANK	33
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:33
//		SETLOC	E/PROG
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:34
//		BANK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:35
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:36
//		COUNT*	$$/P07
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:37
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:38
//# SPECIAL PROGRAMS TO EASE THE PANGS OF ERASABLE MEMORY PROGRAMS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:39
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:40
//# E/BKCALL	FOR DOING BANKCALLS FROM AND RETURNING TO ERASABLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:41
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:42
//# THIS ROUTINE IS CALLABLE FROM ERASABLE OR FIXED.  LIKE BANKCALL, HOWEVER, SWITCHING BETWEEN S3 AND S4
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:43
//# IS NOT POSSIBLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:44
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:45
//# THE CALLING SEQUENCE IS:
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:46
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:47
//#	TC	BANKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:48
//#	CADR	E/BKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:49
//#	CADR	ROUTINE		# WHERE TO WANT TO GO IN FIXED.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:50
//#	RETURN HERE FROM DISPLAY TERMINATE, BAD STALL OR TC Q.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:51
//#	RETURN HERE FROM DISPLAY PROCEED OR GOOD RETURN FROM STALL.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:52
//#	RETURN HERE FROM DISPLAY ENTER OR RECYCLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:53
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:54
//# THIS ROUTINE REQUIRES TWO ERASABLES (EBUF2, +1) IN UNSWITCHED WHICH ARE UNSHARED BY INTERRUPTS AND
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:55
//# OTHER EMEMORY PROGRAMS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:56
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:57
//# A + L ARE PRESERVED THROUGH BANKCALL AND E/BKCALL.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:58
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:59
//E/BKCALL	DXCH	BUF2		# SAVE A,L AND GET DP RETURN.
// slot 6526
            if slot <> 6526 or instruction <> 21596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6527 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:60
//		DXCH	EBUF2		# SAVE DP RETURN.
// slot 6527
                if slot <> 6527 or instruction <> 22136 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 632, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:61
//		INCR	EBUF2		# RETURN +1 BECAUSE DOUBLE CADR.
// slot 6528
                if slot <> 6528 or instruction <> 10871 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 631).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6530 {
            if slot <= 6529 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:62
//		CA	BBANK
// slot 6529
                if slot <> 6529 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:63
//		MASK	LOW10		# GET CURRENT EBANK.  (SBANK SOMEDAY)
// slot 6530
                if slot <> 6530 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 6531 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:64
//		ADS	EBUF2	+1	# FORM BBCON.  (WAS FBANK)
// slot 6531
                if slot <> 6531 or instruction <> 11896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 632).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:65
//		NDX	EBUF2
// slot 6532
                if slot <> 6532 or instruction <> 21111 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21111, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21111, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[384] to agcAotUnit384@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:66
//		CA	0 	-1	# GET CADR OF ROUTINE.
// slot 6533
    6533, 24574
)).

// bank 04, slots 6534-6542
function agcAotUnit385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6537 {
        if slot <= 6535 {
            if slot <= 6534 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:67
//		TC	SWCALL		# GO TO ROUTINE, SETTING Q TO SWRETURN
// slot 6534
                if slot <> 6534 or instruction <> 2450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2450, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:68
//					# AND RESTORING A + L.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:69
//		TC	+4		# TX Q, V34, OR BAD STALL RETURN.
// slot 6535
                if slot <> 6535 or instruction <> 1419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6536 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:70
//		TC	+2		# PROCEED OR GOOD STALL RETURN.
// slot 6536
                if slot <> 6536 or instruction <> 1418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1418, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:71
//		INCR	EBUF2		# ENTER OR RECYCLE RETURN.
// slot 6537
                if slot <> 6537 or instruction <> 10871 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 631).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6539 {
            if slot <= 6538 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:72
//		INCR	EBUF2
// slot 6538
                if slot <> 6538 or instruction <> 10871 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 631).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:73
//E/SWITCH	DXCH	EBUF2
// slot 6539
                if slot <> 6539 or instruction <> 22136 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 632, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6540 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:74
//		DTCB
// slot 6540
                if slot <> 6540 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6541 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:75
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:76
//# Page 371
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:77
//# E/CALL	FOR CALLING A FIXED MEMORY INTERPRETIVE SUBROUTINE FROM ERASABLE AND RETURNING TO ERASABLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:78
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:79
//# THE CALLING SEQUENCE IS...
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:80
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:81
//#	RTB
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:82
//#		E/CALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:83
//#	CADR	ROUTINE			# THE INTERPRETIVE SUBROUTINE YOU WANT.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:84
//#					# RETURNS HERE IN INTERPRETIVE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:85
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:86
//E/CALL		LXCH	LOC		# ADRES -1 OF CADR.
// slot 6541
                    if slot <> 6541 or instruction <> 9332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 116, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:87
//		INDEX	L
// slot 6542
                    if slot <> 6542 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[385] to agcAotUnit385@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:88
//		CA	L		# CADR IN A.
// slot 6543
    6543, 24578
)).

// bank 04, slots 6544-6547
function agcAotUnit386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6545 {
        if slot <= 6544 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:89
//		INCR	L
// slot 6544
            if slot <> 6544 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:90
//		INCR	L		# RETURN ADRES IN L.
// slot 6545
            if slot <> 6545 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6546 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:91
//		DXCH	EBUF2		# STORE CADR AND RETURN
// slot 6546
            if slot <> 6546 or instruction <> 22136 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 632, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:92
//		TC	INTPRET
// slot 6547
            if slot <> 6547 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[386] to agcAotUnit386@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:93
//		CALL
// slot 6548
    6548, 65320,
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:94
//			EBUF2		# INDIRECTLY EXECUTE ROUTINE.  IT MUST
// slot 6549
    6549, 1262,
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:95
//		EXIT			# LEAVE VIA RVQ OR EQUIVALENT.
// slot 6550
    6550, 65532
)).

// bank 04, slots 6551-6555
function agcAotUnit387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6552 {
        if slot <= 6551 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:96
//		LXCH	EBUF2	+1	# PICK UP RETURN.
// slot 6551
            if slot <> 6551 or instruction <> 9848 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 632, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:97
//		TCF	INTPRET	+2	# SET LOC AND RETURN TO CALLER.
// slot 6552
            if slot <> 6552 or instruction <> 7201 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7201, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6553 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:98
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:99
//# Page 372
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:100
//# E/JOBWAK	FOR WAKING UP ERASABLE MEMORY JOBS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:101
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:102
//# THIS ROUTINE MUST BE CALLED IN INTERRUPT OR WITH INTERRUPTS INHIBITED.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:103
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:104
//# THE CALLING SEQUENCE IS:
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:105
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:106
//#	INHINT
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:107
//#	...
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:108
//#	CA	WAKEADR		# ADDRESS OF SLEEPING JOB
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:109
//#	TC	IBNKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:110
//#	CADR	E/JOBWAK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:111
//#	...			# RETURNS HERE
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:112
//#	RELINT			# IF YOU DID AND INHINT.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:113
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:114
//		BANK	33
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:115
//		SETLOC	E/PROG
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:116
//		BANK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:117
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:118
//		COUNT*	 $$/P07
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:119
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:120
//E/JOBWAK	TC	JOBWAKE		# ARRIVE IWTH ADRES IN A.
// slot 6553
            if slot <> 6553 or instruction <> 2655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6554 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:121
//		CS	BIT11
// slot 6554
                if slot <> 6554 or instruction <> 18913 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:122
//		NDX	LOCCTR
// slot 6555
                if slot <> 6555 or instruction <> 20532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[387] to agcAotUnit387@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:123
//		ADS	LOC		# KNOCK FIXED MEMORY BIT OUT OF ADRES.
// slot 6556
    6556, 22760
)).

// bank 04, slots 6557-6557
function agcAotUnit388 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:124
//		TC	RUPTREG3	# RETURN
// slot 6557
    if slot <> 6557 or instruction <> 58 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 58, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[388] to agcAotUnit388@.

// no code for the lines below
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:125
//
