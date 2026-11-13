// PORT: Original source unit T6-RUPT_PROGRAMS.agc.
// PORT: Physical bank 17. Shared continuation entries, slots 17431–17459.
function agcAotUnit1042 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17444 {
        if slot <= 17437 {
            if slot <= 17433 {
                if slot <= 17431 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:2
//# Filename:	T6-RUPT_PROGRAMS.agc
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:9
//# Pages:	1403-1405
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:13
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:22
//# actually created.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:23
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:25
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:28
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:29
//# Page 1403
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:30
//# PROGRAM NAMES:	(1) T6JOBCHK	MOD. NO. 5	OCTOBER 2, 1967
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:31
//#			(2) DOT6RUPT
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:32
//# MODIFICATION BY:	LOWELL G. HULL (A.C.ELECTRONICS)
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:33
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:34
//# THESE PROGRAMS ENABLE THE LM DAP TO CONTROL THE THRUST TIMES OF THE REACTION CONTROL SYSTEM JETS BY USING TIME6.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:35
//# SINCE THE LM DAP MAINTAINS EXCLUSIVE CONTROL OVER TIME6 AND ITS INTERRUPTS, THE FOLLOWING CONVENTIONS HAVE BEEN
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:36
//# ESTABLISHED AND MUST NOT BE TAMPERED WITH:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:37
//#	1.	NO NUMBER IS EVER PLACED INTO TIME6 EXCEPT BY LM DAP.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:38
//#	2.	NO PROGRAM OTHER THAN LM DAP ENABLES THE TIME6 COUNTER.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:39
//#	3.	TO USE TIME6, THE FOLLOWING SEQUENCE IS ALWAYS EMPLOYED:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:40
//#		A.	A POSITIVE (NON-ZERO) NUMBER IS STORED IN TIME6.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:41
//#		B.	THE TIME6 CLOCK IS ENABLED.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:42
//#		C.	TIME6 IS INTERROGATED AND IS:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:43
//#			I.	NEVER FOUND NEGATIVE (NON-ZERO) OR +0.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:44
//#			II.	SOMETIMES FOUND POSITIVE (BETWEEN 1 AND 240D) INDICATING THAT IT IS ACTIVE.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:45
//#			III.	SOMETIMES FOUND POSMAX INDICATING THAT IT IS INACTIVE AND NOT ENABLED.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:46
//#			IV.	SOMETIMES FOUND NEGATIVE ZERO INDICATING THAT:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:47
//#				A.	A T6RUPT IS ABOUT TO OCCUR AT THE NEXT DINC, OR
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:48
//#				B.	A T6RUPT IS WAITING IN THE PRIORITY CHAIN, OR
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:49
//#				C.	A T6RUPT IS IN PROCESS NOW.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:50
//#	4.	ALL PROGRAMS WHICH OPERATE IN EITHER INTERRUPT MODE OR WITH INTERRUPT INHIBITED MUST CALL T6JOBCHK
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:51
//#		EVERY 5 MILLISECONDS TO PROCESS A POSSIBLE WAITING T6RUPT BEFORE IT CAN BE HONORED BY THE HARDWARE.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:52
//#      (5.	PROGRAM JTLST, IN Q,R-AXES, HANDLES THE INPUT LIST.)
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:53
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:54
//# T6JOBCHK CALLING SEQUENCE:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:55
//#		L	TC	T6JOBCHK
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:56
//#		L+1	(RETURN)
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:57
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:58
//# DOT6RUPT CALLING SEQUENCE:
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:59
//#			DXCH	ARUPT		# T6RUPT LEAD IN AT LOCATION 4004.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:60
//#			EXTEND
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:61
//#			DCA	T6ADR
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:62
//#			DTCB
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:63
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:64
//# SUBROUTINES CALLED:	DOT6RUPT CALLS T6JOBCHK.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:65
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:66
//# NORMAL EXIT MODES:	T6JOBCHK RETURNS TO L +1.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:67
//#			DOT6RUPT TRANSFERS CONTROL TO RESUME.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:68
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:69
//# ALARM/ABORT MODES:	NONE.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:70
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:71
//# INPUT:	TIME6		NXT6ADR		OUTPUT:		TIME6		NXT6ADR		CHANNEL 5
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:72
//#		T6NEXT		T6NEXT +1			T6NEXT		T6NEXT +1	CHANNEL 6
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:73
//#		T6FURTHA	T6FURTHA +1			T6FURTHA	T6FURTHA +1	BIT15/CH13
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:74
//#
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:75
//# DEBRIS:	T6JOBCHK CLOBBERS A.  DOT6RUPT CLOBBERS NOTHING.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:76
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:77
//		BLOCK	02
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:78
//# Page 1404
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:79
//		BANK	17
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:80
//		SETLOC	DAPS2
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:81
//		BANK
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:82
//		EBANK=	T6NEXT
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:83
//		COUNT*	$$/DAPT6
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:84
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:85
//T6JOBCHK	CCS	TIME6		# CHECK TIME6 FOR WAITING T6RUPT:
// PORT: Fixed ROM slots 17431.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:86
//		TC	Q		# NONE: CLOCK COUNTING DOWN.
// PORT: Fixed ROM slots 17432.
                        if slot <> 17432 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:87
//		TC	CCSHOLE
// PORT: Fixed ROM slots 17433.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:88
//		TC	T6JOBCHK +3
// PORT: Fixed ROM slots 17434.
                        if slot <> 17434 or instruction <> 1050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:89
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:90
//# CONTROL PASSES TO T6JOB ONLY WHEN C(TIME6) = -0 (I.E., WHEN A T6RUPT MUST BE PROCESSED).
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:91
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:92
//T6JOB		CAF	POSMAX		# DISABLE CLOCK: NEEDED SINCE RUPT OCCURS
// PORT: Fixed ROM slots 17435.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:93
//		EXTEND			# 1 DINC AFTER T6 = 77777. FOR 625 MUSECS
// PORT: Fixed ROM slots 17436.
                        if slot <> 17436 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:94
//		WAND	CHAN13		# MUST NOT HAVE T6 = +0 WITH ENABLE SET
// PORT: Fixed ROM slots 17437.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:95
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:96
//		CA	POSMAX
// PORT: Fixed ROM slots 17438.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:97
//		ZL
// PORT: Fixed ROM slots 17439.
                        if slot <> 17439 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:98
//		DXCH	T6FURTHA
// PORT: Fixed ROM slots 17440.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:99
//		DXCH	T6NEXT
// PORT: Fixed ROM slots 17441.
                        if slot <> 17441 or instruction <> 22327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 823, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:100
//		LXCH	NXT6ADR
// PORT: Fixed ROM slots 17442.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:101
//		TS	TIME6
// PORT: Fixed ROM slots 17443.
                        if slot <> 17443 or instruction <> 22553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:102
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:103
//		AD	PRIO37
// PORT: Fixed ROM slots 17444.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:104
//		TS	A
// PORT: Fixed ROM slots 17445.
                    if slot <> 17445 or instruction <> 22528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17446 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:105
//		TCF	ENABLET6
// PORT: Fixed ROM slots 17446.
                        if slot <> 17446 or instruction <> 5162 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5162, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:106
//		CA	POSMAX
// PORT: Fixed ROM slots 17447.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:107
//		TS	TIME6
// PORT: Fixed ROM slots 17448.
                        if slot <> 17448 or instruction <> 22553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22553, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:108
//		TCF	GOCH56
// PORT: Fixed ROM slots 17449.
                        if slot <> 17449 or instruction <> 5171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5171, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17450 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:109
//ENABLET6	CA	BIT15
// PORT: Fixed ROM slots 17450.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:110
//		EXTEND
// PORT: Fixed ROM slots 17451.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:111
//		WOR	CHAN13
// PORT: Fixed ROM slots 17452.
                        if slot <> 17452 or instruction <> 2571 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:112
//		CA	T6NEXT
// PORT: Fixed ROM slots 17453.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:113
//		AD	PRIO37
// PORT: Fixed ROM slots 17454.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:114
//		TS	A
// PORT: Fixed ROM slots 17455.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:115
//		TCF	GOCH56
// PORT: Fixed ROM slots 17456.
                        if slot <> 17456 or instruction <> 5171 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5171, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:116
//		CA	POSMAX
// PORT: Fixed ROM slots 17457.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:117
//		TS	T6NEXT
// PORT: Fixed ROM slots 17458.
                        if slot <> 17458 or instruction <> 23350 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23350, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:118
//GOCH56		INDEX	L
// PORT: Fixed ROM slots 17459.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:119
//		TCF	WRITEP -1
// PORT: Fixed ROM slots 17460.
    17460, 14294
)).

// PORT: Physical bank 02. Shared continuation entries, slots 5099–5115.
function agcAotUnit249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5106 {
        if slot <= 5102 {
            if slot <= 5100 {
                if slot <= 5099 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:120
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:121
//		BLOCK	02
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:122
//		SETLOC	FFTAG9
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:123
//		BANK
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:124
//		EBANK=	CDUXD
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:125
//		COUNT*	$$/DAPT6
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:126
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:127
//		CA	NEXTP
// PORT: Fixed ROM slots 5099.
                    if slot <> 5099 or instruction <> 13114 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 826).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:128
//WRITEP		EXTEND
// PORT: Fixed ROM slots 5100.
                    if slot <> 5100 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5101 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:129
//		WRITE	CHAN6
// PORT: Fixed ROM slots 5101.
                    if slot <> 5101 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:130
//# Page 1405
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:131
//		TC	Q
// PORT: Fixed ROM slots 5102.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:132
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:133
//		CA	NEXTU
// PORT: Fixed ROM slots 5103.
                    if slot <> 5103 or instruction <> 13115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 827).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:134
//WRITEU		TS	L
// PORT: Fixed ROM slots 5104.
                    if slot <> 5104 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 5105 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:135
//		CS	00314OCT
// PORT: Fixed ROM slots 5105.
                    if slot <> 5105 or instruction <> 19452 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3068), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:136
//		EXTEND
// PORT: Fixed ROM slots 5106.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:137
//		RAND	CHAN5
// PORT: Fixed ROM slots 5107.
                    if slot <> 5107 or instruction <> 1029 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:138
//		AD	L
// PORT: Fixed ROM slots 5108.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:139
//		EXTEND
// PORT: Fixed ROM slots 5109.
                    if slot <> 5109 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:140
//		WRITE	CHAN5
// PORT: Fixed ROM slots 5110.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:141
//		TC	Q
// PORT: Fixed ROM slots 5111.
                    if slot <> 5111 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:142
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:143
//		CA	NEXTV
// PORT: Fixed ROM slots 5112.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:144
//WRITEV		TS	L
// PORT: Fixed ROM slots 5113.
                    if slot <> 5113 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 5114 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:145
//		CA	00314OCT
// PORT: Fixed ROM slots 5114.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:146
//		TCF	-9D
// PORT: Fixed ROM slots 5115.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:147
//00314OCT	OCT	00314
// PORT: Fixed ROM slots 5116.
    5116, 408
)).

// PORT: Physical bank 17. Shared continuation entries, slots 17461–17465.
function agcAotUnit1043 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17462 {
        if slot <= 17461 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:148
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:149
//		BANK	17
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:150
//		SETLOC	DAPS2
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:151
//		BANK
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:152
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:153
//		EBANK=	T6NEXT
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:154
//		COUNT*	$$/DAPT6
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:155
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:156
//DOT6RUPT	LXCH	BANKRUPT	# (INTERRUPT LEAD INS CONTINUED)
// PORT: Fixed ROM slots 17461.
            if slot <> 17461 or instruction <> 9230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 14, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:157
//		EXTEND
// PORT: Fixed ROM slots 17462.
            if slot <> 17462 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17463 {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:158
//		QXCH	QRUPT
// PORT: Fixed ROM slots 17463.
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
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:159
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:160
//		TC	T6JOBCHK	# CALL T6JOBCHK.
// PORT: Fixed ROM slots 17464.
                if slot <> 17464 or instruction <> 1047 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1047, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:161
//
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:162
//		TCF	RESUME		# END TIME6 INTERRUPT PROCESSOR.
// PORT: Fixed ROM slots 17465.
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

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE T6-RUPT_PROGRAMS.agc:163
//
