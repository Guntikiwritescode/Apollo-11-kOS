// SYSTEM_TEST_STANDARD_LEAD_INS.agc
// bank 13, slots 13342-13348
function agcAotUnit726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13344 {
        if slot <= 13342 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:1
//# Copyright:	Public domain.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:2
//# Filename:	SYSTEM_TEST_STANDARD_LEAD_INS.agc
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:6
//# Assembler:	yaYUL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:7
//# Reference:	pp. 420-422
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:8
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:9
//# Website:	www.ibiblio.org/apollo.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:10
//# Mod history:	05/07/09 OH	Transcription Batch 1 Assignment
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:11
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:12
//# The contents of the "Comanche055" files, in general, are transcribed
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:13
//# from scanned documents.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:14
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:15
//#	Assemble revision 055 of AGC program Comanche by NASA
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:16
//#	2021113-051.  April 1, 1969.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:17
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:18
//#	This AGC program shall also be referred to as Colossus 2A
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:19
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:20
//#	Prepared by
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:21
//#			Massachusetts Institute of Technology
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:22
//#			75 Cambridge Parkway
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:23
//#			Cambridge, Massachusetts
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:24
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:25
//#	under NASA contract NAS 9-4065.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:26
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:27
//# Refer directly to the online document mentioned above for further information.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:28
//# Please report any errors to info@sandroid.org.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:29
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:30
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:31
//# Page 420
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:32
//		EBANK=	XSM
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:33
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:34
//		BANK	33
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:35
//		SETLOC	E/PROG1
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:36
//		BANK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:37
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:38
//		COUNT*	$$/P07
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:39
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:40
//# SPECIAL PROGRAMS TO EASE THE PANGS OF ERASABLE MEMORY PROGRAMS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:41
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:42
//# E/BKCALL	FOR DOING BANKCALLS FROM AND RETURNING TO ERASABLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:43
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:44
//# THIS ROUTINE IS CALLABLE FROM ERASABLE OR FIXED.  LIKE BANKCALL, HOWEVER, SWITCHING BETWEEN S3 AND S4
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:45
//# IS NOT POSSIBLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:46
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:47
//# THE CALLING SEQUENCE IS:
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:48
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:49
//#	TC	BANKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:50
//#	CADR	E/BKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:51
//#	CADR	ROUTINE		# WHERE YOU WANT TO GO IN FIXED.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:52
//#	RETURN HERE FROM DISPLAY TERMINATE, BAD STALL OR TC Q.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:53
//#	RETURN HERE FROM DISPLAY PROCEED OR GOOD RETURN FROM STALL.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:54
//#	RETURN HERE FROM DISPLAY ENTER OR RECYCLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:55
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:56
//# THIS ROUTINE REQUIRES TWO ERASABLES (EBUF2, +1) IN UNSWITCHED WHICH ARE UNSHARED BY INTERRUPTS AND
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:57
//# OTHER EMEMORY PROGRAMS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:58
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:59
//# A + L ARE PRESERVED THROUGH BANKCALL AND E/BKCALL.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:60
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:61
//E/BKCALL	DXCH	BUF2		# SAVE A,L AND GET DP RETURN.
// slot 13342
            if slot <> 13342 or instruction <> 21596 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 13343 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:62
//		DXCH	EBUF2		# SAVE DP RETURN.
// slot 13343
                if slot <> 13343 or instruction <> 21749 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 245, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:63
//		INCR	EBUF2		# RETURN +1 BECAUSE DOUBLE CADR.
// slot 13344
                if slot <> 13344 or instruction <> 10484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 244).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 13346 {
            if slot <= 13345 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:64
//		CA	BBANK
// slot 13345
                if slot <> 13345 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:65
//		MASK	LOW10		# GET CURRENT EBANK.  (SBANK SOMEDAY)
// slot 13346
                if slot <> 13346 or instruction <> 31276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
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
            if slot <= 13347 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:66
//		ADS	EBUF2	+1	# FORM BBCON.  (WAS FBANK)
// slot 13347
                if slot <> 13347 or instruction <> 11509 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 245).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:67
//		NDX	EBUF2
// slot 13348
                if slot <> 13348 or instruction <> 20724 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20724, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20724, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[726] to agcAotUnit726@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:68
//		CA	0 -1		# GET CADR OF ROUTINE.
// slot 13349
    13349, 24574
)).

// bank 13, slots 13350-13358
function agcAotUnit727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13353 {
        if slot <= 13351 {
            if slot <= 13350 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:69
//		TC	SWCALL		# GO TO ROUTINE, SETTING Q TO SWRETURN
// slot 13350
                if slot <> 13350 or instruction <> 2486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2486, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:70
//					# AND RESTORING A + L.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:71
//		TC	+4		# TX Q, V34, OR BAD STALL RETURN.
// slot 13351
                if slot <> 13351 or instruction <> 1067 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1067, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 13352 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:72
//		TC	+2		# PROCEED OR GOOD STALL RETURN.
// slot 13352
                if slot <> 13352 or instruction <> 1066 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1066, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:73
//		INCR	EBUF2		# ENTER OR RECYCLE RETURN.
// slot 13353
                if slot <> 13353 or instruction <> 10484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 244).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 13355 {
            if slot <= 13354 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:74
//		INCR	EBUF2
// slot 13354
                if slot <> 13354 or instruction <> 10484 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 244).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:75
//E/SWITCH	DXCH	EBUF2
// slot 13355
                if slot <> 13355 or instruction <> 21749 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 245, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 13356 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:76
//		DTCB
// slot 13356
                if slot <> 13356 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 13357 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:77
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:78
//# Page 421
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:79
//# E/CALL	FOR CALLING A FIXED MEMORY INTERPRETIVE SUBROUTINE FROM ERASABLE AND RETURNING TO ERASABLE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:80
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:81
//# THE CALLING SEQUENCE IS...
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:82
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:83
//#	RTB
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:84
//#		E/CALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:85
//#	CADR	ROUTINE			# THE INTERPRETIVE SUBROUTINE YOU WANT.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:86
//#					# RETURNS HERE IN INTERPRETIVE.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:87
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:88
//E/CALL		LXCH	LOC		# ADRES -1 OF CADR.
// slot 13357
                    if slot <> 13357 or instruction <> 9332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 116, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:89
//		INDEX	L
// slot 13358
                    if slot <> 13358 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[727] to agcAotUnit727@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:90
//		CA	L		# CADR IN A.
// slot 13359
    13359, 24578
)).

// bank 13, slots 13360-13363
function agcAotUnit728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13361 {
        if slot <= 13360 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:91
//		INCR	L
// slot 13360
            if slot <> 13360 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:92
//		INCR	L		# RETURN ADRES IN L.
// slot 13361
            if slot <> 13361 or instruction <> 10241 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 13362 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:93
//		DXCH	EBUF2		# STORE CADR AND RETURN.
// slot 13362
            if slot <> 13362 or instruction <> 21749 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 245, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:94
//		TC	INTPRET
// slot 13363
            if slot <> 13363 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[728] to agcAotUnit728@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:95
//		CALL
// slot 13364
    13364, 65320,
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:96
//			EBUF2		# INDIRECTLY EXECUTE ROUTING.  IT MUST
// slot 13365
    13365, 488,
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:97
//		EXIT			# LEAVE VIA RVQ OR EQUIVALENT.
// slot 13366
    13366, 65532
)).

// bank 13, slots 13367-13368
function agcAotUnit729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13367 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:98
//		LXCH	EBUF2 +1	# PICK UP RETURN.
// slot 13367
        if slot <> 13367 or instruction <> 9461 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 245, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:99
//		TCF	INTPRET +2	# SET LOC AND RETURB TO CALLER
// slot 13368
        if slot <> 13368 or instruction <> 7176 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7176, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[729] to agcAotUnit729@.

// bank 04, slots 6534-6536
function agcAotUnit391 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6534 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:100
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:101
//# Page 422
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:102
//# E/JOBWAK	FOR WAKING UP ERASABLE MEMORY JOBS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:103
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:104
//# THIS ROUTINE MUST BE CALLED IN INTERRUPT OR WITH INTERRUPTS INHIBITED.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:105
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:106
//# THE CALLING SEQUENCE IS:
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:107
//#
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:108
//#	INHINT
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:109
//#	  .
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:110
//#	  .
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:111
//#	CA	WAKEADR		# ADDRESS OF SLEEPING JOB
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:112
//#	TC	IBNKCALL
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:113
//#	CADR	E/JOBWAK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:114
//#	  .			# RETURNS HERE
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:115
//#	  .
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:116
//#	  .
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:117
//#	RELINT			# IF YOU DID AN INHINT.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:118
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:119
//		BANK	33
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:120
//		SETLOC	E/PROG
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:121
//		BANK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:122
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:123
//		COUNT*	 $$/P07
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:124
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:125
//E/JOBWAK	TC	JOBWAKE		# ARRIVE IWTH ADRES IN A.
// slot 6534
        if slot <> 6534 or instruction <> 2689 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2689, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6535 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:126
//		CS	BIT11
// slot 6535
            if slot <> 6535 or instruction <> 18949 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:127
//		NDX	LOCCTR
// slot 6536
            if slot <> 6536 or instruction <> 20532 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[391] to agcAotUnit391@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:128
//		ADS	LOC		# KNOCK FIXED MEMORY BIT OUT OF ADRES.
// slot 6537
    6537, 22760
)).

// bank 04, slots 6538-6538
function agcAotUnit392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:129
//		TC	RUPTREG3	# RETURN
// slot 6538
    if slot <> 6538 or instruction <> 58 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 58, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[392] to agcAotUnit392@.

// bank 33, slots 29696-29698
function agcAotUnit1627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29696 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:130
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:131
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:132
//# THESE PROGRAMS ARE PROVIDED TO ALLOW OVERLAY OF BANKS 30 THRU 33 OF THE 205 VERSIONS OF SYSTEM TESTS AND
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:133
//# PRELAUNCH ALIGN.  THE INTENT IS TO ALLOW THE STG AND HYBRID LABS TO RUN ALL THE TESTS WITH COLOSSUS.
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:134
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:135
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:136
//		BANK	33
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:137
//		SETLOC	TESTLEAD
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:138
//		BANK
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:139
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:140
//		COUNT	33/COMST
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:141
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:142
//		EBANK=	QPLACE
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:143
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:144
//COMPVER		TC	GCOMPVER	# MUST BE 33,2000.
// slot 29696
        if slot <> 29696 or instruction <> 1822 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1822, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29697 {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:145
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:146
//GTSCPSS1	TC	GTSCPSS		# MUST BE AT 33,2001
// slot 29697
            if slot <> 29697 or instruction <> 1625 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1625, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:147
//
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:148
//REDO		TC	NEWMODEX	# DISPLAY MM 07.
// slot 29698
            if slot <> 29698 or instruction <> 2796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1627] to agcAotUnit1627@.

agcAotInstallSourceRope(list(
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:149
//		MM	07		# FALL INTO IMUTEST
// slot 29699
    29699, 14
)).

// no code for the lines below
// SYSTEM_TEST_STANDARD_LEAD_INS.agc:150
//
