// T6-RUPT_PROGRAMS.agc
// bank 17, slots 17431-17459
function agcAotUnit1042 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17444 {
        if slot <= 17437 {
            if slot <= 17433 {
                if slot <= 17431 {
// T6-RUPT_PROGRAMS.agc:1
//# Copyright:	Public domain.
// T6-RUPT_PROGRAMS.agc:2
//# Filename:	T6-RUPT_PROGRAMS.agc
// T6-RUPT_PROGRAMS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// T6-RUPT_PROGRAMS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// T6-RUPT_PROGRAMS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// T6-RUPT_PROGRAMS.agc:6
//# Assembler:	yaYUL
// T6-RUPT_PROGRAMS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// T6-RUPT_PROGRAMS.agc:8
//# Website:	www.ibiblio.org/apollo.
// T6-RUPT_PROGRAMS.agc:9
//# Pages:	1403-1405
// T6-RUPT_PROGRAMS.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// T6-RUPT_PROGRAMS.agc:11
//#				from the Luminary131/ file of the same
// T6-RUPT_PROGRAMS.agc:12
//#				name, using Luminary099 page images.
// T6-RUPT_PROGRAMS.agc:13
//#
// T6-RUPT_PROGRAMS.agc:14
//# This source code has been transcribed or otherwise adapted from
// T6-RUPT_PROGRAMS.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// T6-RUPT_PROGRAMS.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// T6-RUPT_PROGRAMS.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// T6-RUPT_PROGRAMS.agc:18
//# in storage size and consequent reduction in image quality as well) are
// T6-RUPT_PROGRAMS.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// T6-RUPT_PROGRAMS.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// T6-RUPT_PROGRAMS.agc:21
//# about getting access to the (much) higher-quality images which Paul
// T6-RUPT_PROGRAMS.agc:22
//# actually created.
// T6-RUPT_PROGRAMS.agc:23
//#
// T6-RUPT_PROGRAMS.agc:24
//# Notations on the hardcopy document read, in part:
// T6-RUPT_PROGRAMS.agc:25
//#
// T6-RUPT_PROGRAMS.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// T6-RUPT_PROGRAMS.agc:27
//#	16:27 JULY 14, 1969
// T6-RUPT_PROGRAMS.agc:28
//
// T6-RUPT_PROGRAMS.agc:29
//# Page 1403
// T6-RUPT_PROGRAMS.agc:30
//# PROGRAM NAMES:	(1) T6JOBCHK	MOD. NO. 5	OCTOBER 2, 1967
// T6-RUPT_PROGRAMS.agc:31
//#			(2) DOT6RUPT
// T6-RUPT_PROGRAMS.agc:32
//# MODIFICATION BY:	LOWELL G. HULL (A.C.ELECTRONICS)
// T6-RUPT_PROGRAMS.agc:33
//#
// T6-RUPT_PROGRAMS.agc:34
//# THESE PROGRAMS ENABLE THE LM DAP TO CONTROL THE THRUST TIMES OF THE REACTION CONTROL SYSTEM JETS BY USING TIME6.
// T6-RUPT_PROGRAMS.agc:35
//# SINCE THE LM DAP MAINTAINS EXCLUSIVE CONTROL OVER TIME6 AND ITS INTERRUPTS, THE FOLLOWING CONVENTIONS HAVE BEEN
// T6-RUPT_PROGRAMS.agc:36
//# ESTABLISHED AND MUST NOT BE TAMPERED WITH:
// T6-RUPT_PROGRAMS.agc:37
//#	1.	NO NUMBER IS EVER PLACED INTO TIME6 EXCEPT BY LM DAP.
// T6-RUPT_PROGRAMS.agc:38
//#	2.	NO PROGRAM OTHER THAN LM DAP ENABLES THE TIME6 COUNTER.
// T6-RUPT_PROGRAMS.agc:39
//#	3.	TO USE TIME6, THE FOLLOWING SEQUENCE IS ALWAYS EMPLOYED:
// T6-RUPT_PROGRAMS.agc:40
//#		A.	A POSITIVE (NON-ZERO) NUMBER IS STORED IN TIME6.
// T6-RUPT_PROGRAMS.agc:41
//#		B.	THE TIME6 CLOCK IS ENABLED.
// T6-RUPT_PROGRAMS.agc:42
//#		C.	TIME6 IS INTERROGATED AND IS:
// T6-RUPT_PROGRAMS.agc:43
//#			I.	NEVER FOUND NEGATIVE (NON-ZERO) OR +0.
// T6-RUPT_PROGRAMS.agc:44
//#			II.	SOMETIMES FOUND POSITIVE (BETWEEN 1 AND 240D) INDICATING THAT IT IS ACTIVE.
// T6-RUPT_PROGRAMS.agc:45
//#			III.	SOMETIMES FOUND POSMAX INDICATING THAT IT IS INACTIVE AND NOT ENABLED.
// T6-RUPT_PROGRAMS.agc:46
//#			IV.	SOMETIMES FOUND NEGATIVE ZERO INDICATING THAT:
// T6-RUPT_PROGRAMS.agc:47
//#				A.	A T6RUPT IS ABOUT TO OCCUR AT THE NEXT DINC, OR
// T6-RUPT_PROGRAMS.agc:48
//#				B.	A T6RUPT IS WAITING IN THE PRIORITY CHAIN, OR
// T6-RUPT_PROGRAMS.agc:49
//#				C.	A T6RUPT IS IN PROCESS NOW.
// T6-RUPT_PROGRAMS.agc:50
//#	4.	ALL PROGRAMS WHICH OPERATE IN EITHER INTERRUPT MODE OR WITH INTERRUPT INHIBITED MUST CALL T6JOBCHK
// T6-RUPT_PROGRAMS.agc:51
//#		EVERY 5 MILLISECONDS TO PROCESS A POSSIBLE WAITING T6RUPT BEFORE IT CAN BE HONORED BY THE HARDWARE.
// T6-RUPT_PROGRAMS.agc:52
//#      (5.	PROGRAM JTLST, IN Q,R-AXES, HANDLES THE INPUT LIST.)
// T6-RUPT_PROGRAMS.agc:53
//#
// T6-RUPT_PROGRAMS.agc:54
//# T6JOBCHK CALLING SEQUENCE:
// T6-RUPT_PROGRAMS.agc:55
//#		L	TC	T6JOBCHK
// T6-RUPT_PROGRAMS.agc:56
//#		L+1	(RETURN)
// T6-RUPT_PROGRAMS.agc:57
//#
// T6-RUPT_PROGRAMS.agc:58
//# DOT6RUPT CALLING SEQUENCE:
// T6-RUPT_PROGRAMS.agc:59
//#			DXCH	ARUPT		# T6RUPT LEAD IN AT LOCATION 4004.
// T6-RUPT_PROGRAMS.agc:60
//#			EXTEND
// T6-RUPT_PROGRAMS.agc:61
//#			DCA	T6ADR
// T6-RUPT_PROGRAMS.agc:62
//#			DTCB
// T6-RUPT_PROGRAMS.agc:63
//#
// T6-RUPT_PROGRAMS.agc:64
//# SUBROUTINES CALLED:	DOT6RUPT CALLS T6JOBCHK.
// T6-RUPT_PROGRAMS.agc:65
//#
// T6-RUPT_PROGRAMS.agc:66
//# NORMAL EXIT MODES:	T6JOBCHK RETURNS TO L +1.
// T6-RUPT_PROGRAMS.agc:67
//#			DOT6RUPT TRANSFERS CONTROL TO RESUME.
// T6-RUPT_PROGRAMS.agc:68
//#
// T6-RUPT_PROGRAMS.agc:69
//# ALARM/ABORT MODES:	NONE.
// T6-RUPT_PROGRAMS.agc:70
//#
// T6-RUPT_PROGRAMS.agc:71
//# INPUT:	TIME6		NXT6ADR		OUTPUT:		TIME6		NXT6ADR		CHANNEL 5
// T6-RUPT_PROGRAMS.agc:72
//#		T6NEXT		T6NEXT +1			T6NEXT		T6NEXT +1	CHANNEL 6
// T6-RUPT_PROGRAMS.agc:73
//#		T6FURTHA	T6FURTHA +1			T6FURTHA	T6FURTHA +1	BIT15/CH13
// T6-RUPT_PROGRAMS.agc:74
//#
// T6-RUPT_PROGRAMS.agc:75
//# DEBRIS:	T6JOBCHK CLOBBERS A.  DOT6RUPT CLOBBERS NOTHING.
// T6-RUPT_PROGRAMS.agc:76
//
// T6-RUPT_PROGRAMS.agc:77
//		BLOCK	02
// T6-RUPT_PROGRAMS.agc:78
//# Page 1404
// T6-RUPT_PROGRAMS.agc:79
//		BANK	17
// T6-RUPT_PROGRAMS.agc:80
//		SETLOC	DAPS2
// T6-RUPT_PROGRAMS.agc:81
//		BANK
// T6-RUPT_PROGRAMS.agc:82
//		EBANK=	T6NEXT
// T6-RUPT_PROGRAMS.agc:83
//		COUNT*	$$/DAPT6
// T6-RUPT_PROGRAMS.agc:84
//
// T6-RUPT_PROGRAMS.agc:85
//T6JOBCHK	CCS	TIME6		# CHECK TIME6 FOR WAITING T6RUPT:
// slot 17431
                    if slot <> 17431 or instruction <> 4121 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 25).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17432 {
// T6-RUPT_PROGRAMS.agc:86
//		TC	Q		# NONE: CLOCK COUNTING DOWN.
// slot 17432
                        if slot <> 17432 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:87
//		TC	CCSHOLE
// slot 17433
                        if slot <> 17433 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17435 {
                    if slot <= 17434 {
// T6-RUPT_PROGRAMS.agc:88
//		TC	T6JOBCHK +3
// slot 17434
                        if slot <> 17434 or instruction <> 1050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:89
//
// T6-RUPT_PROGRAMS.agc:90
//# CONTROL PASSES TO T6JOB ONLY WHEN C(TIME6) = -0 (I.E., WHEN A T6RUPT MUST BE PROCESSED).
// T6-RUPT_PROGRAMS.agc:91
//
// T6-RUPT_PROGRAMS.agc:92
//T6JOB		CAF	POSMAX		# DISABLE CLOCK: NEEDED SINCE RUPT OCCURS
// slot 17435
                        if slot <> 17435 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17436 {
// T6-RUPT_PROGRAMS.agc:93
//		EXTEND			# 1 DINC AFTER T6 = 77777. FOR 625 MUSECS
// slot 17436
                        if slot <> 17436 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:94
//		WAND	CHAN13		# MUST NOT HAVE T6 = +0 WITH ENABLE SET
// slot 17437
                        if slot <> 17437 or instruction <> 1547 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17440 {
                if slot <= 17438 {
// T6-RUPT_PROGRAMS.agc:95
//
// T6-RUPT_PROGRAMS.agc:96
//		CA	POSMAX
// slot 17438
                    if slot <> 17438 or instruction <> 14811 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17439 {
// T6-RUPT_PROGRAMS.agc:97
//		ZL
// slot 17439
                        if slot <> 17439 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:98
//		DXCH	T6FURTHA
// slot 17440
                        if slot <> 17440 or instruction <> 22329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 825, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17442 {
                    if slot <= 17441 {
// T6-RUPT_PROGRAMS.agc:99
//		DXCH	T6NEXT
// slot 17441
                        if slot <> 17441 or instruction <> 22327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 823, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:100
//		LXCH	NXT6ADR
// slot 17442
                        if slot <> 17442 or instruction <> 10037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 821, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17443 {
// T6-RUPT_PROGRAMS.agc:101
//		TS	TIME6
// slot 17443
                        if slot <> 17443 or instruction <> 22553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:102
//
// T6-RUPT_PROGRAMS.agc:103
//		AD	PRIO37
// slot 17444
                        if slot <> 17444 or instruction <> 28629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4053), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 17451 {
            if slot <= 17447 {
                if slot <= 17445 {
// T6-RUPT_PROGRAMS.agc:104
//		TS	A
// slot 17445
                    if slot <> 17445 or instruction <> 22528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17446 {
// T6-RUPT_PROGRAMS.agc:105
//		TCF	ENABLET6
// slot 17446
                        if slot <> 17446 or instruction <> 5162 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5162, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:106
//		CA	POSMAX
// slot 17447
                        if slot <> 17447 or instruction <> 14811 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 17449 {
                    if slot <= 17448 {
// T6-RUPT_PROGRAMS.agc:107
//		TS	TIME6
// slot 17448
                        if slot <> 17448 or instruction <> 22553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:108
//		TCF	GOCH56
// slot 17449
                        if slot <> 17449 or instruction <> 5171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5171, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17450 {
// T6-RUPT_PROGRAMS.agc:109
//ENABLET6	CA	BIT15
// slot 17450
                        if slot <> 17450 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:110
//		EXTEND
// slot 17451
                        if slot <> 17451 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17455 {
                if slot <= 17453 {
                    if slot <= 17452 {
// T6-RUPT_PROGRAMS.agc:111
//		WOR	CHAN13
// slot 17452
                        if slot <> 17452 or instruction <> 2571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:112
//		CA	T6NEXT
// slot 17453
                        if slot <> 17453 or instruction <> 13110 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 822).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17454 {
// T6-RUPT_PROGRAMS.agc:113
//		AD	PRIO37
// slot 17454
                        if slot <> 17454 or instruction <> 28629 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4053), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:114
//		TS	A
// slot 17455
                        if slot <> 17455 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17457 {
                    if slot <= 17456 {
// T6-RUPT_PROGRAMS.agc:115
//		TCF	GOCH56
// slot 17456
                        if slot <> 17456 or instruction <> 5171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5171, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:116
//		CA	POSMAX
// slot 17457
                        if slot <> 17457 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17458 {
// T6-RUPT_PROGRAMS.agc:117
//		TS	T6NEXT
// slot 17458
                        if slot <> 17458 or instruction <> 23350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23350, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:118
//GOCH56		INDEX	L
// slot 17459
                        if slot <> 17459 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1042] to agcAotUnit1042@.

agcAotInstallSourceRope(list(
// T6-RUPT_PROGRAMS.agc:119
//		TCF	WRITEP -1
// slot 17460
    17460, 14294
)).

// bank 02, slots 5099-5115
function agcAotUnit249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5106 {
        if slot <= 5102 {
            if slot <= 5100 {
                if slot <= 5099 {
// T6-RUPT_PROGRAMS.agc:120
//
// T6-RUPT_PROGRAMS.agc:121
//		BLOCK	02
// T6-RUPT_PROGRAMS.agc:122
//		SETLOC	FFTAG9
// T6-RUPT_PROGRAMS.agc:123
//		BANK
// T6-RUPT_PROGRAMS.agc:124
//		EBANK=	CDUXD
// T6-RUPT_PROGRAMS.agc:125
//		COUNT*	$$/DAPT6
// T6-RUPT_PROGRAMS.agc:126
//
// T6-RUPT_PROGRAMS.agc:127
//		CA	NEXTP
// slot 5099
                    if slot <> 5099 or instruction <> 13114 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 826).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:128
//WRITEP		EXTEND
// slot 5100
                    if slot <> 5100 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5101 {
// T6-RUPT_PROGRAMS.agc:129
//		WRITE	CHAN6
// slot 5101
                    if slot <> 5101 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:130
//# Page 1405
// T6-RUPT_PROGRAMS.agc:131
//		TC	Q
// slot 5102
                    if slot <> 5102 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 5104 {
                if slot <= 5103 {
// T6-RUPT_PROGRAMS.agc:132
//
// T6-RUPT_PROGRAMS.agc:133
//		CA	NEXTU
// slot 5103
                    if slot <> 5103 or instruction <> 13115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 827).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:134
//WRITEU		TS	L
// slot 5104
                    if slot <> 5104 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5105 {
// T6-RUPT_PROGRAMS.agc:135
//		CS	00314OCT
// slot 5105
                    if slot <> 5105 or instruction <> 19452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3068), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:136
//		EXTEND
// slot 5106
                    if slot <> 5106 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 5110 {
            if slot <= 5108 {
                if slot <= 5107 {
// T6-RUPT_PROGRAMS.agc:137
//		RAND	CHAN5
// slot 5107
                    if slot <> 5107 or instruction <> 1029 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:138
//		AD	L
// slot 5108
                    if slot <> 5108 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5109 {
// T6-RUPT_PROGRAMS.agc:139
//		EXTEND
// slot 5109
                    if slot <> 5109 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:140
//		WRITE	CHAN5
// slot 5110
                    if slot <> 5110 or instruction <> 517 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 5112 {
                if slot <= 5111 {
// T6-RUPT_PROGRAMS.agc:141
//		TC	Q
// slot 5111
                    if slot <> 5111 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// T6-RUPT_PROGRAMS.agc:142
//
// T6-RUPT_PROGRAMS.agc:143
//		CA	NEXTV
// slot 5112
                    if slot <> 5112 or instruction <> 13116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 828).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5113 {
// T6-RUPT_PROGRAMS.agc:144
//WRITEV		TS	L
// slot 5113
                    if slot <> 5113 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5114 {
// T6-RUPT_PROGRAMS.agc:145
//		CA	00314OCT
// slot 5114
                        if slot <> 5114 or instruction <> 15356 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3068), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// T6-RUPT_PROGRAMS.agc:146
//		TCF	-9D
// slot 5115
                        if slot <> 5115 or instruction <> 7154 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 7154, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[249] to agcAotUnit249@.

agcAotInstallSourceRope(list(
// T6-RUPT_PROGRAMS.agc:147
//00314OCT	OCT	00314
// slot 5116
    5116, 408
)).

// bank 17, slots 17461-17465
function agcAotUnit1043 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17462 {
        if slot <= 17461 {
// T6-RUPT_PROGRAMS.agc:148
//
// T6-RUPT_PROGRAMS.agc:149
//		BANK	17
// T6-RUPT_PROGRAMS.agc:150
//		SETLOC	DAPS2
// T6-RUPT_PROGRAMS.agc:151
//		BANK
// T6-RUPT_PROGRAMS.agc:152
//
// T6-RUPT_PROGRAMS.agc:153
//		EBANK=	T6NEXT
// T6-RUPT_PROGRAMS.agc:154
//		COUNT*	$$/DAPT6
// T6-RUPT_PROGRAMS.agc:155
//
// T6-RUPT_PROGRAMS.agc:156
//DOT6RUPT	LXCH	BANKRUPT	# (INTERRUPT LEAD INS CONTINUED)
// slot 17461
            if slot <> 17461 or instruction <> 9230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 14, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// T6-RUPT_PROGRAMS.agc:157
//		EXTEND
// slot 17462
            if slot <> 17462 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17463 {
// T6-RUPT_PROGRAMS.agc:158
//		QXCH	QRUPT
// slot 17463
            if slot <> 17463 or instruction <> 9226 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 10, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17464 {
// T6-RUPT_PROGRAMS.agc:159
//
// T6-RUPT_PROGRAMS.agc:160
//		TC	T6JOBCHK	# CALL T6JOBCHK.
// slot 17464
                if slot <> 17464 or instruction <> 1047 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1047, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// T6-RUPT_PROGRAMS.agc:161
//
// T6-RUPT_PROGRAMS.agc:162
//		TCF	RESUME		# END TIME6 INTERRUPT PROCESSOR.
// slot 17465
                if slot <> 17465 or instruction <> 6840 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6840, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1043] to agcAotUnit1043@.

// no code for the lines below
// T6-RUPT_PROGRAMS.agc:163
//
