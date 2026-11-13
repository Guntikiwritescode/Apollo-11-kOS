// PORT: Original source unit SYSTEM_TEST_STANDARD_LEAD_INS.agc.
// PORT: Physical bank 04. Shared continuation entries, slots 6526–6532.
function agcAotUnit384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6528 {
        if slot <= 6526 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:2
//# Filename:	SYSTEM_TEST_STANDARD_LEAD_INS.agc
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:9
//# Pages:	370-372
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:13
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:22
//# actually created.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:23
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:25
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:28
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:29
//# Page 370
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:30
//		EBANK=	XSM
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:31
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:32
//		BANK	33
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:33
//		SETLOC	E/PROG
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:34
//		BANK
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:35
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:36
//		COUNT*	$$/P07
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:37
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:38
//# SPECIAL PROGRAMS TO EASE THE PANGS OF ERASABLE MEMORY PROGRAMS.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:39
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:40
//# E/BKCALL	FOR DOING BANKCALLS FROM AND RETURNING TO ERASABLE.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:41
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:42
//# THIS ROUTINE IS CALLABLE FROM ERASABLE OR FIXED.  LIKE BANKCALL, HOWEVER, SWITCHING BETWEEN S3 AND S4
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:43
//# IS NOT POSSIBLE.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:44
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:45
//# THE CALLING SEQUENCE IS:
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:46
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:47
//#	TC	BANKCALL
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:48
//#	CADR	E/BKCALL
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:49
//#	CADR	ROUTINE		# WHERE TO WANT TO GO IN FIXED.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:50
//#	RETURN HERE FROM DISPLAY TERMINATE, BAD STALL OR TC Q.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:51
//#	RETURN HERE FROM DISPLAY PROCEED OR GOOD RETURN FROM STALL.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:52
//#	RETURN HERE FROM DISPLAY ENTER OR RECYCLE.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:53
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:54
//# THIS ROUTINE REQUIRES TWO ERASABLES (EBUF2, +1) IN UNSWITCHED WHICH ARE UNSHARED BY INTERRUPTS AND
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:55
//# OTHER EMEMORY PROGRAMS.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:56
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:57
//# A + L ARE PRESERVED THROUGH BANKCALL AND E/BKCALL.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:58
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:59
//E/BKCALL	DXCH	BUF2		# SAVE A,L AND GET DP RETURN.
// PORT: Fixed ROM slots 6526.
            if slot <> 6526 or instruction <> 21596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6527 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:60
//		DXCH	EBUF2		# SAVE DP RETURN.
// PORT: Fixed ROM slots 6527.
                if slot <> 6527 or instruction <> 22136 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 632, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:61
//		INCR	EBUF2		# RETURN +1 BECAUSE DOUBLE CADR.
// PORT: Fixed ROM slots 6528.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:62
//		CA	BBANK
// PORT: Fixed ROM slots 6529.
                if slot <> 6529 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:63
//		MASK	LOW10		# GET CURRENT EBANK.  (SBANK SOMEDAY)
// PORT: Fixed ROM slots 6530.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:64
//		ADS	EBUF2	+1	# FORM BBCON.  (WAS FBANK)
// PORT: Fixed ROM slots 6531.
                if slot <> 6531 or instruction <> 11896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 632).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:65
//		NDX	EBUF2
// PORT: Fixed ROM slots 6532.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:66
//		CA	0 	-1	# GET CADR OF ROUTINE.
// PORT: Fixed ROM slots 6533.
    6533, 24574
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6534–6542.
function agcAotUnit385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6537 {
        if slot <= 6535 {
            if slot <= 6534 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:67
//		TC	SWCALL		# GO TO ROUTINE, SETTING Q TO SWRETURN
// PORT: Fixed ROM slots 6534.
                if slot <> 6534 or instruction <> 2450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2450, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:68
//					# AND RESTORING A + L.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:69
//		TC	+4		# TX Q, V34, OR BAD STALL RETURN.
// PORT: Fixed ROM slots 6535.
                if slot <> 6535 or instruction <> 1419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6536 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:70
//		TC	+2		# PROCEED OR GOOD STALL RETURN.
// PORT: Fixed ROM slots 6536.
                if slot <> 6536 or instruction <> 1418 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1418, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:71
//		INCR	EBUF2		# ENTER OR RECYCLE RETURN.
// PORT: Fixed ROM slots 6537.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:72
//		INCR	EBUF2
// PORT: Fixed ROM slots 6538.
                if slot <> 6538 or instruction <> 10871 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 631).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:73
//E/SWITCH	DXCH	EBUF2
// PORT: Fixed ROM slots 6539.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:74
//		DTCB
// PORT: Fixed ROM slots 6540.
                if slot <> 6540 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6541 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:75
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:76
//# Page 371
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:77
//# E/CALL	FOR CALLING A FIXED MEMORY INTERPRETIVE SUBROUTINE FROM ERASABLE AND RETURNING TO ERASABLE.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:78
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:79
//# THE CALLING SEQUENCE IS...
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:80
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:81
//#	RTB
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:82
//#		E/CALL
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:83
//#	CADR	ROUTINE			# THE INTERPRETIVE SUBROUTINE YOU WANT.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:84
//#					# RETURNS HERE IN INTERPRETIVE.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:85
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:86
//E/CALL		LXCH	LOC		# ADRES -1 OF CADR.
// PORT: Fixed ROM slots 6541.
                    if slot <> 6541 or instruction <> 9332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 116, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:87
//		INDEX	L
// PORT: Fixed ROM slots 6542.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:88
//		CA	L		# CADR IN A.
// PORT: Fixed ROM slots 6543.
    6543, 24578
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6544–6547.
function agcAotUnit386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6545 {
        if slot <= 6544 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:89
//		INCR	L
// PORT: Fixed ROM slots 6544.
            if slot <> 6544 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:90
//		INCR	L		# RETURN ADRES IN L.
// PORT: Fixed ROM slots 6545.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:91
//		DXCH	EBUF2		# STORE CADR AND RETURN
// PORT: Fixed ROM slots 6546.
            if slot <> 6546 or instruction <> 22136 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 632, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:92
//		TC	INTPRET
// PORT: Fixed ROM slots 6547.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:93
//		CALL
// PORT: Fixed ROM slots 6548.
    6548, 65320,
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:94
//			EBUF2		# INDIRECTLY EXECUTE ROUTINE.  IT MUST
// PORT: Fixed ROM slots 6549.
    6549, 1262,
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:95
//		EXIT			# LEAVE VIA RVQ OR EQUIVALENT.
// PORT: Fixed ROM slots 6550.
    6550, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6551–6555.
function agcAotUnit387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6552 {
        if slot <= 6551 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:96
//		LXCH	EBUF2	+1	# PICK UP RETURN.
// PORT: Fixed ROM slots 6551.
            if slot <> 6551 or instruction <> 9848 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 632, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:97
//		TCF	INTPRET	+2	# SET LOC AND RETURN TO CALLER.
// PORT: Fixed ROM slots 6552.
            if slot <> 6552 or instruction <> 7201 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7201, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6553 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:98
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:99
//# Page 372
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:100
//# E/JOBWAK	FOR WAKING UP ERASABLE MEMORY JOBS.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:101
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:102
//# THIS ROUTINE MUST BE CALLED IN INTERRUPT OR WITH INTERRUPTS INHIBITED.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:103
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:104
//# THE CALLING SEQUENCE IS:
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:105
//#
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:106
//#	INHINT
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:107
//#	...
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:108
//#	CA	WAKEADR		# ADDRESS OF SLEEPING JOB
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:109
//#	TC	IBNKCALL
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:110
//#	CADR	E/JOBWAK
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:111
//#	...			# RETURNS HERE
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:112
//#	RELINT			# IF YOU DID AND INHINT.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:113
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:114
//		BANK	33
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:115
//		SETLOC	E/PROG
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:116
//		BANK
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:117
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:118
//		COUNT*	 $$/P07
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:119
//
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:120
//E/JOBWAK	TC	JOBWAKE		# ARRIVE IWTH ADRES IN A.
// PORT: Fixed ROM slots 6553.
            if slot <> 6553 or instruction <> 2655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6554 {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:121
//		CS	BIT11
// PORT: Fixed ROM slots 6554.
                if slot <> 6554 or instruction <> 18913 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:122
//		NDX	LOCCTR
// PORT: Fixed ROM slots 6555.
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
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:123
//		ADS	LOC		# KNOCK FIXED MEMORY BIT OUT OF ADRES.
// PORT: Fixed ROM slots 6556.
    6556, 22760
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6557–6557.
function agcAotUnit388 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:124
//		TC	RUPTREG3	# RETURN
// PORT: Fixed ROM slots 6557.
    if slot <> 6557 or instruction <> 58 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 58, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[388] to agcAotUnit388@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE SYSTEM_TEST_STANDARD_LEAD_INS.agc:125
//
