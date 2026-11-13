// PORT: Original source unit WAITLIST.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4731–4743.
function agcAotUnit190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4736 {
        if slot <= 4733 {
            if slot <= 4731 {
// PORT: SOURCE WAITLIST.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE WAITLIST.agc:2
//# Filename:	WAITLIST.agc
// PORT: SOURCE WAITLIST.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE WAITLIST.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE WAITLIST.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE WAITLIST.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE WAITLIST.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE WAITLIST.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE WAITLIST.agc:9
//# Pages:	1117-1132
// PORT: SOURCE WAITLIST.agc:10
//# Mod history:	2009-05-25 RSB	Adapted from the corresponding
// PORT: SOURCE WAITLIST.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE WAITLIST.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE WAITLIST.agc:13
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE WAITLIST.agc:14
//#		2011-05-07 JL	Removed workarounds.
// PORT: SOURCE WAITLIST.agc:15
//#
// PORT: SOURCE WAITLIST.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE WAITLIST.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE WAITLIST.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE WAITLIST.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE WAITLIST.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE WAITLIST.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE WAITLIST.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE WAITLIST.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE WAITLIST.agc:24
//# actually created.
// PORT: SOURCE WAITLIST.agc:25
//#
// PORT: SOURCE WAITLIST.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE WAITLIST.agc:27
//#
// PORT: SOURCE WAITLIST.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE WAITLIST.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE WAITLIST.agc:30
//
// PORT: SOURCE WAITLIST.agc:31
//# Page 1117
// PORT: SOURCE WAITLIST.agc:32
//# PROGRAM DESCRIPTION								DATE -- 10 OCTOBER 1966
// PORT: SOURCE WAITLIST.agc:33
//# MOD NO -- 2									LOG SECTION -- WAITLIST
// PORT: SOURCE WAITLIST.agc:34
//# MOD BY -- MILLER	(DTMAX INCREASED TO 162.5 SEC)				ASSEMBLY -- SUNBURST REV 5
// PORT: SOURCE WAITLIST.agc:35
//# MOD 3 BY KERNAN	(INHINT INSERTED AT WAITLIST) 2/28/68 SKIPPER REV 4
// PORT: SOURCE WAITLIST.agc:36
//# MOD 4 BY KERNAN	(TWIDDLE IN 54) 3/28/68 SKIPPER REV 13.
// PORT: SOURCE WAITLIST.agc:37
//#
// PORT: SOURCE WAITLIST.agc:38
//# FUNCTIONAL DESCRIPTION --
// PORT: SOURCE WAITLIST.agc:39
//#	PART OF A SECTION OF PROGRAMS -- WAITLIST, TASKOVER, T3RUPT, USED TO CALL A PROGRAM (CALLED A TASK),
// PORT: SOURCE WAITLIST.agc:40
//#	WHICH IS TO BEGIN IN C(A) CENTISECONDS.  WAITLIST UPDATES TIME3, LST1, AND LST2.  THE MEANING OF THESE LISTS
// PORT: SOURCE WAITLIST.agc:41
//#	FOLLOW.
// PORT: SOURCE WAITLIST.agc:42
//#
// PORT: SOURCE WAITLIST.agc:43
//#		C(TIME3) = 16384 -(T1-T) CENTISECONDS, (T=PRESENT TIME, T1-TIME FOR TASK1)
// PORT: SOURCE WAITLIST.agc:44
//#
// PORT: SOURCE WAITLIST.agc:45
//#			C(LST1)		=	-(T2-T1)+1
// PORT: SOURCE WAITLIST.agc:46
//#			C(LST1 +1)	=	-(T3-T2)+1
// PORT: SOURCE WAITLIST.agc:47
//#			C(LST1 +2)	=	-(T4-T3)+1
// PORT: SOURCE WAITLIST.agc:48
//#				       ...
// PORT: SOURCE WAITLIST.agc:49
//#			C(LST1 +6)	=	-(T8-T7)+1
// PORT: SOURCE WAITLIST.agc:50
//#			C(LST1 +7)	=	-(T9-T8)+1
// PORT: SOURCE WAITLIST.agc:51
//#
// PORT: SOURCE WAITLIST.agc:52
//#			C(LST2)		=	2CADR OF TASK1
// PORT: SOURCE WAITLIST.agc:53
//#			C(LST2 +2)	=	2CADR OF TASK2
// PORT: SOURCE WAITLIST.agc:54
//#				       ...
// PORT: SOURCE WAITLIST.agc:55
//#			C(LST2 +14)	=	2CADR OF TASK8
// PORT: SOURCE WAITLIST.agc:56
//#			C(LST2 +16)	=	2CADR OF TASK9
// PORT: SOURCE WAITLIST.agc:57
//#
// PORT: SOURCE WAITLIST.agc:58
//# WARNINGS --
// PORT: SOURCE WAITLIST.agc:59
//#	1)	1 <= C(A) <= 16250D (1 CENTISECOND TO 162.5 SEC)
// PORT: SOURCE WAITLIST.agc:60
//#	2)	9 TASKS MAXIMUM
// PORT: SOURCE WAITLIST.agc:61
//#	3)	TASKS CALLED UNDER INTERRUPT INHIBITED
// PORT: SOURCE WAITLIST.agc:62
//#	4)	TASKS END BY TC TASKOVER
// PORT: SOURCE WAITLIST.agc:63
//#
// PORT: SOURCE WAITLIST.agc:64
//# CALLING SEQUENCE --
// PORT: SOURCE WAITLIST.agc:65
//#	L-1	CA	DELTAT 	(TIME IN CENTISECONDS TO TASK START)
// PORT: SOURCE WAITLIST.agc:66
//#	L	TC	WAITLIST
// PORT: SOURCE WAITLIST.agc:67
//#	L+1	2CADR	DESIRED TASK.
// PORT: SOURCE WAITLIST.agc:68
//#	L+2	(MINOR OF 2CADR)
// PORT: SOURCE WAITLIST.agc:69
//#	L+3	RELINT		(RETURNS HERE)
// PORT: SOURCE WAITLIST.agc:70
//#
// PORT: SOURCE WAITLIST.agc:71
//# TWIDDLE --
// PORT: SOURCE WAITLIST.agc:72
//#	TWIDDLE IS FOR USE WHEN THE TASK BEING SET UP IS IN THE SAME EBANK AND FBANK AS THE USER.  IN
// PORT: SOURCE WAITLIST.agc:73
//#	SUCH CASES, IT IMPROVES UPON WAITLIST BY ELIMINATING THE NEED FOR THE BBCON HALF OF THE 2CADR,
// PORT: SOURCE WAITLIST.agc:74
//# Page 1118
// PORT: SOURCE WAITLIST.agc:75
//#	SAVING A WORD.  TWIDDLE IS LIKE WAITLIST IN EVERY RESPECT EXCEPT CALLING SEQUENCE, TO WIT,
// PORT: SOURCE WAITLIST.agc:76
//#		L-1	CA	DELTAT
// PORT: SOURCE WAITLIST.agc:77
//#		L	TC	TWIDDLE
// PORT: SOURCE WAITLIST.agc:78
//#		L+1	ADRES	DESIRED TASK
// PORT: SOURCE WAITLIST.agc:79
//#		L+2	RELINT		(RETURNS HERE)
// PORT: SOURCE WAITLIST.agc:80
//#
// PORT: SOURCE WAITLIST.agc:81
//# NORMAL EXIT MODES --
// PORT: SOURCE WAITLIST.agc:82
//#	AT L+3 OF CALLING SEQUENCE.
// PORT: SOURCE WAITLIST.agc:83
//#
// PORT: SOURCE WAITLIST.agc:84
//# ALARM OR ABORT EXIT MODES --
// PORT: SOURCE WAITLIST.agc:85
//#	TC	ABORT
// PORT: SOURCE WAITLIST.agc:86
//#	OCT	1203	(WAITLIST OVERFLOW -- TOO MANY TASKS)
// PORT: SOURCE WAITLIST.agc:87
//#
// PORT: SOURCE WAITLIST.agc:88
//# ERASABLE INITIALIZATION REQUIRED --
// PORT: SOURCE WAITLIST.agc:89
//#	ACCOMPLISHED BY FRESH START --	LST2, ..., LST2 +16 = ENDTASK
// PORT: SOURCE WAITLIST.agc:90
//#					LST1, ..., LST1 +7  = NEG1/2
// PORT: SOURCE WAITLIST.agc:91
//#
// PORT: SOURCE WAITLIST.agc:92
//# OUTPUT --
// PORT: SOURCE WAITLIST.agc:93
//#	LST1 AND LST2 UPDATED WTIH NEW TASK AND ASSOCIATED TIME.
// PORT: SOURCE WAITLIST.agc:94
//#
// PORT: SOURCE WAITLIST.agc:95
//# DEBRIS --
// PORT: SOURCE WAITLIST.agc:96
//#	CENTRALS -- A,Q,L
// PORT: SOURCE WAITLIST.agc:97
//#	OTHER    -- WAITEXIT, WAITADR, WAITTEMP, WAITBANK
// PORT: SOURCE WAITLIST.agc:98
//#
// PORT: SOURCE WAITLIST.agc:99
//# DETAILED ANALYSIS OF TIMING --
// PORT: SOURCE WAITLIST.agc:100
//#	CONTROL WILL NOT BE RETURNED TO THE SPECIFIED ADDRESS (2CADR) IN EXACTLY DELTA T CENTISECONDS.
// PORT: SOURCE WAITLIST.agc:101
//#	THE APPROXIMATE TIME MAY BE CALCULATED AS FOLLOWS:
// PORT: SOURCE WAITLIST.agc:102
//#		LET T0 = THE TIME OF THE TC WAITLIST
// PORT: SOURCE WAITLIST.agc:103
//#		LET TS = T0 +147U + COUNTER INCREMENTS (SET UP TIME)
// PORT: SOURCE WAITLIST.agc:104
//#		LET X  = TS -(100TS)/100  (VARIANCE FROM COUNTERS)
// PORT: SOURCE WAITLIST.agc:105
//#		LET Y  = LENGTH OF TIME OF INHIBIT INTERRUPT AFTER T3RUPT
// PORT: SOURCE WAITLIST.agc:106
//#		LET Z  = LENGTH OF TIME TO PROCESS TASKS WHICH ARE DUE THIS T3RUPT BUT DISPATCHED EARLIER.
// PORT: SOURCE WAITLIST.agc:107
//#			 (Z=0, USUALLY).
// PORT: SOURCE WAITLIST.agc:108
//#		LET DELTD  = THE ACTUAL TIME TAKEN TO GIVE CONTROL TO 2CADR
// PORT: SOURCE WAITLIST.agc:109
//#		THEN DELTD = TS+DELTA T -X +Y +Z +1.05MS* +COUNTERS*
// PORT: SOURCE WAITLIST.agc:110
//#		*THE TIME TAKEN BY WAITLIST ITSELF AND THE COUNTER TICKING DURING THIS WAITLIST TIME.
// PORT: SOURCE WAITLIST.agc:111
//#	IN SHORT, THE ACTUAL TIME TO RETURN CONTROL TO A 2CADR IS AUGMENTED BY THE TIME TO SET UP THE TASK'S
// PORT: SOURCE WAITLIST.agc:112
//# 	INTERRUPT, ALL COUNTERS TICKING, THE T3RUPT PROCESSING TIME, THE WAITLIST PROCESSING TIME AND THE POSSIBILITY
// PORT: SOURCE WAITLIST.agc:113
//#	OF OTHER TASKS INHIBITING THE INTERRUPT.
// PORT: SOURCE WAITLIST.agc:114
//
// PORT: SOURCE WAITLIST.agc:115
//		BLOCK	02
// PORT: SOURCE WAITLIST.agc:116
//# Page 1119
// PORT: SOURCE WAITLIST.agc:117
//		EBANK=	LST1		# TASK LISTS IN SWITCHED E BANK.
// PORT: SOURCE WAITLIST.agc:118
//
// PORT: SOURCE WAITLIST.agc:119
//		COUNT*	$$/WAIT
// PORT: SOURCE WAITLIST.agc:120
//TWIDDLE		INHINT
// PORT: Fixed ROM slots 4731.
                if slot <> 4731 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4732 {
// PORT: SOURCE WAITLIST.agc:121
//		TS	L		# SAVE DELAY TIME IN L
// PORT: Fixed ROM slots 4732.
                    if slot <> 4732 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:122
//		CA	POSMAX
// PORT: Fixed ROM slots 4733.
                    if slot <> 4733 or instruction <> 14811 { return choose false if checkOnly else -1. }
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
            if slot <= 4734 {
// PORT: SOURCE WAITLIST.agc:123
//		ADS	Q		# CREATING OVERFLOW AND Q-1 IN Q
// PORT: Fixed ROM slots 4734.
                if slot <> 4734 or instruction <> 11266 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4735 {
// PORT: SOURCE WAITLIST.agc:124
//		CA	BBANK
// PORT: Fixed ROM slots 4735.
                    if slot <> 4735 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:125
//		EXTEND
// PORT: Fixed ROM slots 4736.
                    if slot <> 4736 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4739 {
            if slot <= 4737 {
// PORT: SOURCE WAITLIST.agc:126
//		ROR	SUPERBNK
// PORT: Fixed ROM slots 4737.
                if slot <> 4737 or instruction <> 2055 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4738 {
// PORT: SOURCE WAITLIST.agc:127
//		XCH	L
// PORT: Fixed ROM slots 4738.
                    if slot <> 4738 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:128
//
// PORT: SOURCE WAITLIST.agc:129
//WAITLIST	INHINT
// PORT: Fixed ROM slots 4739.
                    if slot <> 4739 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4741 {
                if slot <= 4740 {
// PORT: SOURCE WAITLIST.agc:130
//		XCH	Q		# SAVE DELTA T IN Q AND RETURN IN
// PORT: Fixed ROM slots 4740.
                    if slot <> 4740 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:131
//		TS	WAITEXIT	# WAITEXIT.
// PORT: Fixed ROM slots 4741.
                    if slot <> 4741 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4742 {
// PORT: SOURCE WAITLIST.agc:132
//		EXTEND
// PORT: Fixed ROM slots 4742.
                    if slot <> 4742 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:133
//		INDEX	WAITEXIT	# IF TWIDDLING, THE TS SKIPS TO HERE
// PORT: Fixed ROM slots 4743.
                    if slot <> 4743 or instruction <> 20529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[190] to agcAotUnit190@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:134
//		DCA	0		# PICK UP 2CADR OF TASK.
// PORT: Fixed ROM slots 4744.
    4744, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4745–4751.
function agcAotUnit191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4747 {
        if slot <= 4745 {
// PORT: SOURCE WAITLIST.agc:135
// -1		TS	WAITADR		# BBCON WILL REMAIN IN L
// PORT: Fixed ROM slots 4745.
            if slot <> 4745 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4746 {
// PORT: SOURCE WAITLIST.agc:136
//DLY2		CAF	WAITBB		# ENTRY FROM FIXDELAY AND VARDELAY.
// PORT: Fixed ROM slots 4746.
                if slot <> 4746 or instruction <> 14992 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2704), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE WAITLIST.agc:137
//		XCH	BBANK
// PORT: Fixed ROM slots 4747.
                if slot <> 4747 or instruction <> 23558 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 6, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4749 {
            if slot <= 4748 {
// PORT: SOURCE WAITLIST.agc:138
//		TCF	WAIT2
// PORT: Fixed ROM slots 4748.
                if slot <> 4748 or instruction <> 5785 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5785, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE WAITLIST.agc:139
//
// PORT: SOURCE WAITLIST.agc:140
//# RETURN TO CALLER AFTER TASK INSERTION:
// PORT: SOURCE WAITLIST.agc:141
//
// PORT: SOURCE WAITLIST.agc:142
//LVWTLIST	DXCH	WAITEXIT
// PORT: Fixed ROM slots 4749.
                if slot <> 4749 or instruction <> 21554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4750 {
// PORT: SOURCE WAITLIST.agc:143
//		AD	TWO
// PORT: Fixed ROM slots 4750.
                if slot <> 4750 or instruction <> 27114 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:144
//		DTCB
// PORT: Fixed ROM slots 4751.
                if slot <> 4751 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[191] to agcAotUnit191@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:145
//
// PORT: SOURCE WAITLIST.agc:146
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:147
//WAITBB		BBCON	WAIT2
// PORT: Fixed ROM slots 4752.
    4752, 2150
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4753–4753.
function agcAotUnit192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE WAITLIST.agc:148
//
// PORT: SOURCE WAITLIST.agc:149
//# RETURN TO CALLER +2 AFTER WAITING DT SPECIFIED AT CALLER +1.
// PORT: SOURCE WAITLIST.agc:150
//
// PORT: SOURCE WAITLIST.agc:151
//FIXDELAY	INDEX	Q		# BOTH ROUTINES MUST BE CALLED UNDER
// PORT: Fixed ROM slots 4753.
    if slot <> 4753 or instruction <> 20482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20482, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[192] to agcAotUnit192@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:152
//		CAF	0		# WAITLIST CONTROL AND TERMINATE THE TASK
// PORT: Fixed ROM slots 4754.
    4754, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4755–4765.
function agcAotUnit193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4759 {
        if slot <= 4756 {
            if slot <= 4755 {
// PORT: SOURCE WAITLIST.agc:153
//		INCR	Q		# IN WHICH THEY WERE CALLED.
// PORT: Fixed ROM slots 4755.
                if slot <> 4755 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE WAITLIST.agc:154
//
// PORT: SOURCE WAITLIST.agc:155
//# RETURN TO CALLER +1 AFTER WAITING THE DT AS ARRIVING IN A.
// PORT: SOURCE WAITLIST.agc:156
//
// PORT: SOURCE WAITLIST.agc:157
//VARDELAY	XCH	Q		# DT TO Q.  TASK ADRES TO WAITADR.
// PORT: Fixed ROM slots 4756.
                if slot <> 4756 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4757 {
// PORT: SOURCE WAITLIST.agc:158
//		TS	WAITADR
// PORT: Fixed ROM slots 4757.
                if slot <> 4757 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4758 {
// PORT: SOURCE WAITLIST.agc:159
//		CA	BBANK		# BBANK IS SAVED DURING DELAY.
// PORT: Fixed ROM slots 4758.
                    if slot <> 4758 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:160
//		EXTEND
// PORT: Fixed ROM slots 4759.
                    if slot <> 4759 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4762 {
            if slot <= 4760 {
// PORT: SOURCE WAITLIST.agc:161
//		ROR	SUPERBNK	# ADD SBANK TO BBCON.
// PORT: Fixed ROM slots 4760.
                if slot <> 4760 or instruction <> 2055 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4761 {
// PORT: SOURCE WAITLIST.agc:162
//		TS	L
// PORT: Fixed ROM slots 4761.
                    if slot <> 4761 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:163
//		CAF	DELAYEX
// PORT: Fixed ROM slots 4762.
                    if slot <> 4762 or instruction <> 15005 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2717), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4763 {
// PORT: SOURCE WAITLIST.agc:164
//		TS	WAITEXIT	# GO TO TASKOVER AFTER TASK ENTRY.
// PORT: Fixed ROM slots 4763.
                if slot <> 4763 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4764 {
// PORT: SOURCE WAITLIST.agc:165
//		TCF	DLY2
// PORT: Fixed ROM slots 4764.
                    if slot <> 4764 or instruction <> 6794 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6794, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:166
//
// PORT: SOURCE WAITLIST.agc:167
//# Page 1120
// PORT: SOURCE WAITLIST.agc:168
//DELAYEX		TCF	TASKOVER -2	# RETURNS TO TASKOVER.
// PORT: Fixed ROM slots 4765.
                    if slot <> 4765 or instruction <> 6831 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6831, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[193] to agcAotUnit193@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:169
//
// PORT: SOURCE WAITLIST.agc:170
//# Page 1121
// PORT: SOURCE WAITLIST.agc:171
//# ENDTASK MUST ENTERED IN FIXED-FIXED SO IT IS DISTINGUISHABLE BY ITS ADRES ALONE.
// PORT: SOURCE WAITLIST.agc:172
//
// PORT: SOURCE WAITLIST.agc:173
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:174
//ENDTASK		-2CADR	SVCT3
// PORT: Fixed ROM slots 4766 4767.
    4766, 60094, 4767, 61336
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4768–4778.
function agcAotUnit194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4772 {
        if slot <= 4769 {
            if slot <= 4768 {
// PORT: SOURCE WAITLIST.agc:175
//
// PORT: SOURCE WAITLIST.agc:176
//SVCT3		CCS	FLAGWRD2	# DRIFT FLAG
// PORT: Fixed ROM slots 4768.
                if slot <> 4768 or instruction <> 4158 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE WAITLIST.agc:177
//		TCF	TASKOVER
// PORT: Fixed ROM slots 4769.
                if slot <> 4769 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4770 {
// PORT: SOURCE WAITLIST.agc:178
//		TCF	TASKOVER
// PORT: Fixed ROM slots 4770.
                if slot <> 4770 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4771 {
// PORT: SOURCE WAITLIST.agc:179
//		TCF	+1
// PORT: Fixed ROM slots 4771.
                    if slot <> 4771 or instruction <> 6820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6820, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:180
//
// PORT: SOURCE WAITLIST.agc:181
//CKIMUSE		CCS	IMUCADR		# DON'T DO NBDONLY IF SOMEONE ELSE IS IN
// PORT: Fixed ROM slots 4772.
                    if slot <> 4772 or instruction <> 4804 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 708).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4775 {
            if slot <= 4773 {
// PORT: SOURCE WAITLIST.agc:182
//		TCF	SVCT3X		# IMUSTALL.
// PORT: Fixed ROM slots 4773.
                if slot <> 4773 or instruction <> 6830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6830, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4774 {
// PORT: SOURCE WAITLIST.agc:183
//		TCF	+3
// PORT: Fixed ROM slots 4774.
                    if slot <> 4774 or instruction <> 6825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6825, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:184
//		TCF	SVCT3X
// PORT: Fixed ROM slots 4775.
                    if slot <> 4775 or instruction <> 6830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6830, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4776 {
// PORT: SOURCE WAITLIST.agc:185
//		TCF	SVCT3X
// PORT: Fixed ROM slots 4776.
                if slot <> 4776 or instruction <> 6830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6830, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4777 {
// PORT: SOURCE WAITLIST.agc:186
//
// PORT: SOURCE WAITLIST.agc:187
// +3		CAF	PRIO35		# COMPENSATE FOR NBD COEFFICIENTS ONLY.
// PORT: Fixed ROM slots 4777.
                    if slot <> 4777 or instruction <> 16339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4051), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:188
//		TC	NOVAC		#	ENABLE EVERY 81.93 SECONDS
// PORT: Fixed ROM slots 4778.
                    if slot <> 4778 or instruction <> 2618 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[194] to agcAotUnit194@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:189
//		EBANK=	NBDX
// PORT: SOURCE WAITLIST.agc:190
//		2CADR	NBDONLY
// PORT: Fixed ROM slots 4779 4780.
    4779, 3802, 4780, 12390
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4781–4782.
function agcAotUnit195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4781 {
// PORT: SOURCE WAITLIST.agc:191
//
// PORT: SOURCE WAITLIST.agc:192
//		TCF	TASKOVER
// PORT: Fixed ROM slots 4781.
        if slot <> 4781 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE WAITLIST.agc:193
//
// PORT: SOURCE WAITLIST.agc:194
//SVCT3X		TC	FIXDELAY	# DELAY MAX OF 2 TIMES FOR IMUZERO.
// PORT: Fixed ROM slots 4782.
        if slot <> 4782 or instruction <> 2705 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2705, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[195] to agcAotUnit195@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:195
//		DEC	500
// PORT: Fixed ROM slots 4783.
    4783, 1000
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4784–4784.
function agcAotUnit196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE WAITLIST.agc:196
//		TC	SVCT3		# CHECK DRIFT FLAG AGAIN.
// PORT: Fixed ROM slots 4784.
    if slot <> 4784 or instruction <> 2720 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2720, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[196] to agcAotUnit196@.

// PORT: Physical bank 01. Shared continuation entries, slots 3737–3769.
function agcAotUnit111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3752 {
        if slot <= 3744 {
            if slot <= 3740 {
                if slot <= 3738 {
                    if slot <= 3737 {
// PORT: SOURCE WAITLIST.agc:197
//
// PORT: SOURCE WAITLIST.agc:198
//# Page 1122
// PORT: SOURCE WAITLIST.agc:199
//# BEGIN TASK INSERTION.
// PORT: SOURCE WAITLIST.agc:200
//
// PORT: SOURCE WAITLIST.agc:201
//		BANK	01
// PORT: SOURCE WAITLIST.agc:202
//		COUNT*	$$/WAIT
// PORT: SOURCE WAITLIST.agc:203
//WAIT2		TS	WAITBANK	# BBANK OF CALLING PROGRAM.
// PORT: Fixed ROM slots 3737.
                        if slot <> 3737 or instruction <> 22578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:204
//		CA	Q
// PORT: Fixed ROM slots 3738.
                        if slot <> 3738 or instruction <> 12290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3739 {
// PORT: SOURCE WAITLIST.agc:205
//		EXTEND
// PORT: Fixed ROM slots 3739.
                        if slot <> 3739 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:206
//		BZMF	WAITPOOH
// PORT: Fixed ROM slots 3740.
                        if slot <> 3740 or instruction <> 26451 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26451, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3742 {
                    if slot <= 3741 {
// PORT: SOURCE WAITLIST.agc:207
//
// PORT: SOURCE WAITLIST.agc:208
//		CS	TIME3
// PORT: Fixed ROM slots 3741.
                        if slot <> 3741 or instruction <> 16406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 22).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:209
//		AD	BIT8		# BIT 8 = OCT 200
// PORT: Fixed ROM slots 3742.
                        if slot <> 3742 or instruction <> 27108 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3743 {
// PORT: SOURCE WAITLIST.agc:210
//		CCS	A		# TEST 200 - C(TIME3).  IF POSITIVE,
// PORT: Fixed ROM slots 3743.
                        if slot <> 3743 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:211
//					# IT MEANS THAT TIME3 OVERFLOW HAS OCCURRED PRIOR TO CS TIME3 AND THAT
// PORT: SOURCE WAITLIST.agc:212
//					# C(TIME3) = T - T1, INSTEAD OF 1.0 - (T1 - T).  THE FOLLOWING FOUR
// PORT: SOURCE WAITLIST.agc:213
//					# ORDERS SET C(A) = TD - T1 + 1 IN EITHER CASE.
// PORT: SOURCE WAITLIST.agc:214
//
// PORT: SOURCE WAITLIST.agc:215
//		AD	OCT40001	# OVERFLOW HAS OCCURRED.  SET C(A) =
// PORT: Fixed ROM slots 3744.
                        if slot <> 3744 or instruction <> 27719 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 3143), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3748 {
                if slot <= 3746 {
                    if slot <= 3745 {
// PORT: SOURCE WAITLIST.agc:216
//		CS	A		# T - T1 + 1.0 - 201
// PORT: Fixed ROM slots 3745.
                        if slot <> 3745 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:217
//
// PORT: SOURCE WAITLIST.agc:218
//# NORMAL CASE (C(A) NNZ) YIELDS SAME C(A):  -( -(1.0-(T1-T)) + 200) - 1
// PORT: SOURCE WAITLIST.agc:219
//
// PORT: SOURCE WAITLIST.agc:220
//		AD	OCT40201
// PORT: Fixed ROM slots 3746.
                        if slot <> 3746 or instruction <> 26360 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1784), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3747 {
// PORT: SOURCE WAITLIST.agc:221
//		AD	Q		# RESULT = TD - T1 + 1.
// PORT: Fixed ROM slots 3747.
                        if slot <> 3747 or instruction <> 24578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:222
//
// PORT: SOURCE WAITLIST.agc:223
//		CCS	A		# TEST TD - T1 + 1.
// PORT: Fixed ROM slots 3748.
                        if slot <> 3748 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 3750 {
                    if slot <= 3749 {
// PORT: SOURCE WAITLIST.agc:224
//
// PORT: SOURCE WAITLIST.agc:225
//		AD	LST1		# IF TD - T1 POS, GO TO WTLST5 WITH
// PORT: Fixed ROM slots 3749.
                        if slot <> 3749 or instruction <> 25344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 768).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:226
//		TCF	WTLST5		# C(A) = (TD - T1) + C(LST1) = TD-T2+1
// PORT: Fixed ROM slots 3750.
                        if slot <> 3750 or instruction <> 5832 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5832, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3751 {
// PORT: SOURCE WAITLIST.agc:227
//
// PORT: SOURCE WAITLIST.agc:228
//		NOOP
// PORT: Fixed ROM slots 3751.
                        if slot <> 3751 or instruction <> 5800 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5800, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:229
//		CS	Q
// PORT: Fixed ROM slots 3752.
                        if slot <> 3752 or instruction <> 16386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 2).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3760 {
            if slot <= 3756 {
                if slot <= 3754 {
                    if slot <= 3753 {
// PORT: SOURCE WAITLIST.agc:230
//
// PORT: SOURCE WAITLIST.agc:231
//# NOTE THAT THIS PROGRAM SECTION IS NEVER ENTERED WHEN T-T1 G/E -1,
// PORT: SOURCE WAITLIST.agc:232
//# SINCE TD-T1+1 = (TD-T) + (T-T1+1), AND DELTA T = TD-T G/E +1.  (G/E
// PORT: SOURCE WAITLIST.agc:233
//# SYMBOL MEANS GREATER THAN OR EQUAL TO).  THUS THERE NEED BE NO CON-
// PORT: SOURCE WAITLIST.agc:234
//# CERN OVER A PREVIOUS OR IMMINENT OVEFLOW OF TIME3 HERE.
// PORT: SOURCE WAITLIST.agc:235
//
// PORT: SOURCE WAITLIST.agc:236
//		AD	POS1/2		# WHEN TD IS NEXT, FORM QUANTITY
// PORT: Fixed ROM slots 3753.
                        if slot <> 3753 or instruction <> 27102 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:237
//		AD	POS1/2		#	1.0 - DELTA T = 1.0 - (TD - T)
// PORT: Fixed ROM slots 3754.
                        if slot <> 3754 or instruction <> 27102 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3755 {
// PORT: SOURCE WAITLIST.agc:238
//		XCH	TIME3
// PORT: Fixed ROM slots 3755.
                        if slot <> 3755 or instruction <> 23574 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 22, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:239
//		AD	NEGMAX
// PORT: Fixed ROM slots 3756.
                        if slot <> 3756 or instruction <> 27101 { return choose false if checkOnly else -1. }
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
                if slot <= 3758 {
                    if slot <= 3757 {
// PORT: SOURCE WAITLIST.agc:240
//		AD	Q		# 1.0 - DELTAT T NOW COMPLETE.
// PORT: Fixed ROM slots 3757.
                        if slot <> 3757 or instruction <> 24578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:241
//		EXTEND			# ZERO INDEX Q.
// PORT: Fixed ROM slots 3758.
                        if slot <> 3758 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3759 {
// PORT: SOURCE WAITLIST.agc:242
//		QXCH	7		# (ZQ)
// PORT: Fixed ROM slots 3759.
                        if slot <> 3759 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:243
//
// PORT: SOURCE WAITLIST.agc:244
//# Page 1123
// PORT: SOURCE WAITLIST.agc:245
//WTLST4		XCH	LST1
// PORT: Fixed ROM slots 3760.
                        if slot <> 3760 or instruction <> 24320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 768, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3764 {
                if slot <= 3762 {
                    if slot <= 3761 {
// PORT: SOURCE WAITLIST.agc:246
//		XCH	LST1 	+1
// PORT: Fixed ROM slots 3761.
                        if slot <> 3761 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:247
//		XCH	LST1 	+2
// PORT: Fixed ROM slots 3762.
                        if slot <> 3762 or instruction <> 24322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 770, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3763 {
// PORT: SOURCE WAITLIST.agc:248
//		XCH	LST1 	+3
// PORT: Fixed ROM slots 3763.
                        if slot <> 3763 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:249
//		XCH	LST1 	+4
// PORT: Fixed ROM slots 3764.
                        if slot <> 3764 or instruction <> 24324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 772, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3766 {
                    if slot <= 3765 {
// PORT: SOURCE WAITLIST.agc:250
//		XCH	LST1 	+5
// PORT: Fixed ROM slots 3765.
                        if slot <> 3765 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:251
//		XCH	LST1 	+6
// PORT: Fixed ROM slots 3766.
                        if slot <> 3766 or instruction <> 24326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 774, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3767 {
// PORT: SOURCE WAITLIST.agc:252
//		XCH	LST1 	+7
// PORT: Fixed ROM slots 3767.
                        if slot <> 3767 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3768 {
// PORT: SOURCE WAITLIST.agc:253
//
// PORT: SOURCE WAITLIST.agc:254
//		CA	WAITADR		# (MINOR PART OF TASK CADR HAS BEEN IN L.)
// PORT: Fixed ROM slots 3768.
                            if slot <> 3768 or instruction <> 12339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 51).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE WAITLIST.agc:255
//		INDEX	Q
// PORT: Fixed ROM slots 3769.
                            if slot <> 3769 or instruction <> 20482 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20482, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20482, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[111] to agcAotUnit111@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:256
//		TCF	+1
// PORT: Fixed ROM slots 3770.
    3770, 11638
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3771–3788.
function agcAotUnit112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3779 {
        if slot <= 3774 {
            if slot <= 3772 {
                if slot <= 3771 {
// PORT: SOURCE WAITLIST.agc:257
//
// PORT: SOURCE WAITLIST.agc:258
//		DXCH	LST2
// PORT: Fixed ROM slots 3771.
                    if slot <> 3771 or instruction <> 22281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 777, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:259
//		DXCH	LST2 	+2
// PORT: Fixed ROM slots 3772.
                    if slot <> 3772 or instruction <> 22283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3773 {
// PORT: SOURCE WAITLIST.agc:260
//		DXCH	LST2 	+4
// PORT: Fixed ROM slots 3773.
                    if slot <> 3773 or instruction <> 22285 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 781, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:261
//		DXCH	LST2 	+6
// PORT: Fixed ROM slots 3774.
                    if slot <> 3774 or instruction <> 22287 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 783, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3776 {
                if slot <= 3775 {
// PORT: SOURCE WAITLIST.agc:262
//		DXCH	LST2 	+8D
// PORT: Fixed ROM slots 3775.
                    if slot <> 3775 or instruction <> 22289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:263
//		DXCH	LST2 	+10D	# AT END, CHECK THAT C(LST2 +10) IS STD
// PORT: Fixed ROM slots 3776.
                    if slot <> 3776 or instruction <> 22291 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 787, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3777 {
// PORT: SOURCE WAITLIST.agc:264
//		DXCH	LST2 	+12D
// PORT: Fixed ROM slots 3777.
                    if slot <> 3777 or instruction <> 22293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 789, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3778 {
// PORT: SOURCE WAITLIST.agc:265
//		DXCH	LST2 	+14D
// PORT: Fixed ROM slots 3778.
                        if slot <> 3778 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:266
//		DXCH	LST2 	+16D
// PORT: Fixed ROM slots 3779.
                        if slot <> 3779 or instruction <> 22297 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 793, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3783 {
            if slot <= 3781 {
                if slot <= 3780 {
// PORT: SOURCE WAITLIST.agc:267
//		AD	ENDTASK		# END ITEM, AS CHECK FOR EXCEEDING
// PORT: Fixed ROM slots 3780.
                    if slot <> 3780 or instruction <> 27294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2718), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:268
//					# THE LENGTH OF THE LIST.
// PORT: SOURCE WAITLIST.agc:269
//		EXTEND			# DUMMY TASK ADRES SHOULD BE IN FIXED-
// PORT: Fixed ROM slots 3781.
                    if slot <> 3781 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3782 {
// PORT: SOURCE WAITLIST.agc:270
//		BZF	LVWTLIST	# FIXED SO ITS ADRES ALONE DISTINGUISHES
// PORT: Fixed ROM slots 3782.
                    if slot <> 3782 or instruction <> 6797 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6797, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:271
//		TCF	WTABORT		# IT.
// PORT: Fixed ROM slots 3783.
                    if slot <> 3783 or instruction <> 5875 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5875, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3785 {
                if slot <= 3784 {
// PORT: SOURCE WAITLIST.agc:272
//
// PORT: SOURCE WAITLIST.agc:273
//# Page 1124
// PORT: SOURCE WAITLIST.agc:274
//WTLST5		CCS	A		# TEST TD - T2 + 1
// PORT: Fixed ROM slots 3784.
                    if slot <> 3784 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:275
//		AD	LST1 	+1
// PORT: Fixed ROM slots 3785.
                    if slot <> 3785 or instruction <> 25345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 769).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3786 {
// PORT: SOURCE WAITLIST.agc:276
//		TCF	+4
// PORT: Fixed ROM slots 3786.
                    if slot <> 3786 or instruction <> 5838 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5838, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3787 {
// PORT: SOURCE WAITLIST.agc:277
//		AD	ONE
// PORT: Fixed ROM slots 3787.
                        if slot <> 3787 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:278
//		TC	WTLST2
// PORT: Fixed ROM slots 3788.
                        if slot <> 3788 or instruction <> 1788 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1788, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[112] to agcAotUnit112@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:279
//		OCT	1
// PORT: Fixed ROM slots 3789.
    3789, 2
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3790–3794.
function agcAotUnit113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3791 {
        if slot <= 3790 {
// PORT: SOURCE WAITLIST.agc:280
//
// PORT: SOURCE WAITLIST.agc:281
// +4		CCS	A		# TEST TD - T3 + 1
// PORT: Fixed ROM slots 3790.
            if slot <> 3790 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:282
//		AD	LST1 	+2
// PORT: Fixed ROM slots 3791.
            if slot <> 3791 or instruction <> 25346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 770).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3792 {
// PORT: SOURCE WAITLIST.agc:283
//		TCF	+4
// PORT: Fixed ROM slots 3792.
            if slot <> 3792 or instruction <> 5844 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5844, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3793 {
// PORT: SOURCE WAITLIST.agc:284
//		AD	ONE
// PORT: Fixed ROM slots 3793.
                if slot <> 3793 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:285
//		TC	WTLST2
// PORT: Fixed ROM slots 3794.
                if slot <> 3794 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[113] to agcAotUnit113@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:286
//		OCT	2
// PORT: Fixed ROM slots 3795.
    3795, 4
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3796–3800.
function agcAotUnit114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3797 {
        if slot <= 3796 {
// PORT: SOURCE WAITLIST.agc:287
//
// PORT: SOURCE WAITLIST.agc:288
// +4		CCS	A		# TEST TD - T4 + 1
// PORT: Fixed ROM slots 3796.
            if slot <> 3796 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:289
//		AD	LST1 	+3
// PORT: Fixed ROM slots 3797.
            if slot <> 3797 or instruction <> 25347 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 771).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3798 {
// PORT: SOURCE WAITLIST.agc:290
//		TCF	+4
// PORT: Fixed ROM slots 3798.
            if slot <> 3798 or instruction <> 5850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5850, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3799 {
// PORT: SOURCE WAITLIST.agc:291
//		AD	ONE
// PORT: Fixed ROM slots 3799.
                if slot <> 3799 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:292
//		TC	WTLST2
// PORT: Fixed ROM slots 3800.
                if slot <> 3800 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[114] to agcAotUnit114@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:293
//		OCT	3
// PORT: Fixed ROM slots 3801.
    3801, 6
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3802–3806.
function agcAotUnit115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3803 {
        if slot <= 3802 {
// PORT: SOURCE WAITLIST.agc:294
//
// PORT: SOURCE WAITLIST.agc:295
// +4		CCS	A		# TEST TD - T5 + 1
// PORT: Fixed ROM slots 3802.
            if slot <> 3802 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:296
//		AD	LST1 	+4
// PORT: Fixed ROM slots 3803.
            if slot <> 3803 or instruction <> 25348 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 772).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3804 {
// PORT: SOURCE WAITLIST.agc:297
//		TCF	+4
// PORT: Fixed ROM slots 3804.
            if slot <> 3804 or instruction <> 5856 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5856, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3805 {
// PORT: SOURCE WAITLIST.agc:298
//		AD	ONE
// PORT: Fixed ROM slots 3805.
                if slot <> 3805 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:299
//		TC	WTLST2
// PORT: Fixed ROM slots 3806.
                if slot <> 3806 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[115] to agcAotUnit115@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:300
//		OCT	4
// PORT: Fixed ROM slots 3807.
    3807, 8
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3808–3812.
function agcAotUnit116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3809 {
        if slot <= 3808 {
// PORT: SOURCE WAITLIST.agc:301
//
// PORT: SOURCE WAITLIST.agc:302
// +4		CCS	A		# TEST TD - T6 + 1
// PORT: Fixed ROM slots 3808.
            if slot <> 3808 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:303
//		AD	LST1 	+5
// PORT: Fixed ROM slots 3809.
            if slot <> 3809 or instruction <> 25349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 773).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3810 {
// PORT: SOURCE WAITLIST.agc:304
//		TCF	+4
// PORT: Fixed ROM slots 3810.
            if slot <> 3810 or instruction <> 5862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5862, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3811 {
// PORT: SOURCE WAITLIST.agc:305
//		AD	ONE
// PORT: Fixed ROM slots 3811.
                if slot <> 3811 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:306
//		TC	WTLST2
// PORT: Fixed ROM slots 3812.
                if slot <> 3812 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[116] to agcAotUnit116@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:307
//		OCT	5
// PORT: Fixed ROM slots 3813.
    3813, 10
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3814–3818.
function agcAotUnit117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3815 {
        if slot <= 3814 {
// PORT: SOURCE WAITLIST.agc:308
//
// PORT: SOURCE WAITLIST.agc:309
// +4		CCS	A		# TEST TD - T7 + 1
// PORT: Fixed ROM slots 3814.
            if slot <> 3814 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:310
//		AD	LST1 	+6
// PORT: Fixed ROM slots 3815.
            if slot <> 3815 or instruction <> 25350 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 774).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3816 {
// PORT: SOURCE WAITLIST.agc:311
//		TCF	+4
// PORT: Fixed ROM slots 3816.
            if slot <> 3816 or instruction <> 5868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3817 {
// PORT: SOURCE WAITLIST.agc:312
//		AD	ONE
// PORT: Fixed ROM slots 3817.
                if slot <> 3817 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:313
//		TC	WTLST2
// PORT: Fixed ROM slots 3818.
                if slot <> 3818 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[117] to agcAotUnit117@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:314
//		OCT	6
// PORT: Fixed ROM slots 3819.
    3819, 12
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3820–3824.
function agcAotUnit118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3821 {
        if slot <= 3820 {
// PORT: SOURCE WAITLIST.agc:315
//
// PORT: SOURCE WAITLIST.agc:316
//# Page 1125
// PORT: SOURCE WAITLIST.agc:317
// +4		CCS	A		# TEST TD - T2 + 1
// PORT: Fixed ROM slots 3820.
            if slot <> 3820 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:318
//		AD	LST1 	+7
// PORT: Fixed ROM slots 3821.
            if slot <> 3821 or instruction <> 25351 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 775).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3822 {
// PORT: SOURCE WAITLIST.agc:319
//		TCF	+4
// PORT: Fixed ROM slots 3822.
            if slot <> 3822 or instruction <> 5874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3823 {
// PORT: SOURCE WAITLIST.agc:320
//		AD	ONE
// PORT: Fixed ROM slots 3823.
                if slot <> 3823 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:321
//		TC	WTLST2
// PORT: Fixed ROM slots 3824.
                if slot <> 3824 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[118] to agcAotUnit118@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:322
//		OCT	7
// PORT: Fixed ROM slots 3825.
    3825, 14
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3826–3830.
function agcAotUnit119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3827 {
        if slot <= 3826 {
// PORT: SOURCE WAITLIST.agc:323
//
// PORT: SOURCE WAITLIST.agc:324
// +4		CCS	A
// PORT: Fixed ROM slots 3826.
            if slot <> 3826 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:325
//WTABORT		TC	FILLED
// PORT: Fixed ROM slots 3827.
            if slot <> 3827 or instruction <> 1785 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1785, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3828 {
// PORT: SOURCE WAITLIST.agc:326
//		NOOP			# CAN'T GET HERE
// PORT: Fixed ROM slots 3828.
            if slot <> 3828 or instruction <> 5877 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5877, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3829 {
// PORT: SOURCE WAITLIST.agc:327
//		AD	ONE
// PORT: Fixed ROM slots 3829.
                if slot <> 3829 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE WAITLIST.agc:328
//		TC	WTLST2
// PORT: Fixed ROM slots 3830.
                if slot <> 3830 or instruction <> 1788 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1788, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[119] to agcAotUnit119@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:329
//		OCT	10
// PORT: Fixed ROM slots 3831.
    3831, 16,
// PORT: SOURCE WAITLIST.agc:330
//
// PORT: SOURCE WAITLIST.agc:331
//OCT40201	OCT	40201
// PORT: Fixed ROM slots 3832.
    3832, 33026
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3833–3834.
function agcAotUnit120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3833 {
// PORT: SOURCE WAITLIST.agc:332
//
// PORT: SOURCE WAITLIST.agc:333
//# Page 1126
// PORT: SOURCE WAITLIST.agc:334
//FILLED		DXCH	WAITEXIT
// PORT: Fixed ROM slots 3833.
        if slot <> 3833 or instruction <> 21554 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE WAITLIST.agc:335
//		TC	BAILOUT1	# NO ROOM IN THE INN
// PORT: Fixed ROM slots 3834.
        if slot <> 3834 or instruction <> 3022 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3022, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[120] to agcAotUnit120@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:336
//		OCT	01203
// PORT: Fixed ROM slots 3835.
    3835, 1286
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3836–3837.
function agcAotUnit121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3836 {
// PORT: SOURCE WAITLIST.agc:337
//
// PORT: SOURCE WAITLIST.agc:338
//# Page 1127
// PORT: SOURCE WAITLIST.agc:339
//# THE ENTRY TC WTLST2 JUST PRECEDING OCT N IS FOR T  LE TD LE T   -1.
// PORT: SOURCE WAITLIST.agc:340
//#                                                  N           N+1
// PORT: SOURCE WAITLIST.agc:341
//# (LE MEANS LESS THAN OR EQUAL TO).  AT ENTRY, C(A) = -(TD - T   + 1)
// PORT: SOURCE WAITLIST.agc:342
//#                                                             N+1
// PORT: SOURCE WAITLIST.agc:343
//# THE LST1 ENTRY -(T   -T +1) IS TO BE REPLACED BY -(TD - T  + 1), AND
// PORT: SOURCE WAITLIST.agc:344
//#                   N+1  N                                 N
// PORT: SOURCE WAITLIST.agc:345
//# THE ENTRY -(T   - TD + 1) IS TO BE INSERTED IMMEDIATELY FOLLOWING.
// PORT: SOURCE WAITLIST.agc:346
//#              N+1
// PORT: SOURCE WAITLIST.agc:347
//
// PORT: SOURCE WAITLIST.agc:348
//WTLST2		TS	WAITTEMP	# C(A) = -(TD - T + 1)
// PORT: Fixed ROM slots 3836.
        if slot <> 3836 or instruction <> 22580 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22580, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE WAITLIST.agc:349
//		INDEX	Q
// PORT: Fixed ROM slots 3837.
        if slot <> 3837 or instruction <> 20482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20482, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[121] to agcAotUnit121@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:350
//		CAF	0
// PORT: Fixed ROM slots 3838.
    3838, 24576
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3839–3842.
function agcAotUnit122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3840 {
        if slot <= 3839 {
// PORT: SOURCE WAITLIST.agc:351
//		TS	Q		# INDEX VALUE INTO Q.
// PORT: Fixed ROM slots 3839.
            if slot <> 3839 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:352
//
// PORT: SOURCE WAITLIST.agc:353
//		CAF	ONE
// PORT: Fixed ROM slots 3840.
            if slot <> 3840 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        if slot <= 3841 {
// PORT: SOURCE WAITLIST.agc:354
//		AD	WAITTEMP
// PORT: Fixed ROM slots 3841.
            if slot <> 3841 or instruction <> 24628 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 52).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:355
//		INDEX	Q		# C(A) = -(TD - T ) + 1.
// PORT: Fixed ROM slots 3842.
            if slot <> 3842 or instruction <> 20482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[122] to agcAotUnit122@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:356
//		ADS	LST1 	-1	#                N
// PORT: Fixed ROM slots 3843.
    3843, 24062
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3844–3845.
function agcAotUnit123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3844 {
// PORT: SOURCE WAITLIST.agc:357
//
// PORT: SOURCE WAITLIST.agc:358
//		CS	WAITTEMP
// PORT: Fixed ROM slots 3844.
        if slot <> 3844 or instruction <> 16436 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 52).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE WAITLIST.agc:359
//		INDEX	Q
// PORT: Fixed ROM slots 3845.
        if slot <> 3845 or instruction <> 20482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20482, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[123] to agcAotUnit123@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:360
//		TCF	WTLST4
// PORT: Fixed ROM slots 3846.
    3846, 11616
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3847–3878.
function agcAotUnit124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3862 {
        if slot <= 3854 {
            if slot <= 3850 {
                if slot <= 3848 {
                    if slot <= 3847 {
// PORT: SOURCE WAITLIST.agc:361
//
// PORT: SOURCE WAITLIST.agc:362
//# 	C(TIME3) 	=	1.0 - (T1 - T)
// PORT: SOURCE WAITLIST.agc:363
//#
// PORT: SOURCE WAITLIST.agc:364
//# 	C(LST1)		=	- (T2 - T1) + 1
// PORT: SOURCE WAITLIST.agc:365
//# 	C(LST1+1)	=	- (T3 - T2) + 1
// PORT: SOURCE WAITLIST.agc:366
//# 	C(LST1+2)	=	- (T4 - T3) + 1
// PORT: SOURCE WAITLIST.agc:367
//#	C(LST1+3)	=	- (T5 - T4) + 1
// PORT: SOURCE WAITLIST.agc:368
//# 	C(LST1+4)	=	- (T6 - T5) + 1
// PORT: SOURCE WAITLIST.agc:369
//#
// PORT: SOURCE WAITLIST.agc:370
//#	C(LST2)		=	2CADR TASK1
// PORT: SOURCE WAITLIST.agc:371
//#	C(LST2+2)	=	2CADR TASK2
// PORT: SOURCE WAITLIST.agc:372
//#	C(LST2+4)	=	2CADR TASK3
// PORT: SOURCE WAITLIST.agc:373
//#	C(LST2+6)	=	2CADR TASK4
// PORT: SOURCE WAITLIST.agc:374
//#	C(LST2+8)	=	2CADR TASK5
// PORT: SOURCE WAITLIST.agc:375
//#	C(LST2+10)	=	2CADR TASK6
// PORT: SOURCE WAITLIST.agc:376
//
// PORT: SOURCE WAITLIST.agc:377
//# Page 1128
// PORT: SOURCE WAITLIST.agc:378
//# ENTERS HERE ON T3 RUPT TO DISPATCH WAITLISTED TASK.
// PORT: SOURCE WAITLIST.agc:379
//
// PORT: SOURCE WAITLIST.agc:380
//T3RUPT		EXTEND
// PORT: Fixed ROM slots 3847.
                        if slot <> 3847 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:381
//		ROR	SUPERBNK	# READ CURRENT SUPERBANK VALUE AND
// PORT: Fixed ROM slots 3848.
                        if slot <> 3848 or instruction <> 2055 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3849 {
// PORT: SOURCE WAITLIST.agc:382
//		TS	BANKRUPT	# SAVE WITH E AND F BANK VALUES.
// PORT: Fixed ROM slots 3849.
                        if slot <> 3849 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:383
//		EXTEND
// PORT: Fixed ROM slots 3850.
                        if slot <> 3850 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3852 {
                    if slot <= 3851 {
// PORT: SOURCE WAITLIST.agc:384
//		QXCH	QRUPT
// PORT: Fixed ROM slots 3851.
                        if slot <> 3851 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:385
//
// PORT: SOURCE WAITLIST.agc:386
//T3RUPT2		CAF	NEG1/2		# DISPATCH WAITLIST TASK.
// PORT: Fixed ROM slots 3852.
                        if slot <> 3852 or instruction <> 14812 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2524), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3853 {
// PORT: SOURCE WAITLIST.agc:387
//		XCH	LST1 	+7
// PORT: Fixed ROM slots 3853.
                        if slot <> 3853 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:388
//		XCH	LST1 	+6
// PORT: Fixed ROM slots 3854.
                        if slot <> 3854 or instruction <> 24326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 774, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3858 {
                if slot <= 3856 {
                    if slot <= 3855 {
// PORT: SOURCE WAITLIST.agc:389
//		XCH	LST1 	+5
// PORT: Fixed ROM slots 3855.
                        if slot <> 3855 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:390
//		XCH	LST1 	+4	# 1. MOVE UP LST1 CONTENTS, ENTERING
// PORT: Fixed ROM slots 3856.
                        if slot <> 3856 or instruction <> 24324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 772, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3857 {
// PORT: SOURCE WAITLIST.agc:391
//		XCH	LST1 	+3	#    A VALUE OF 1/2 +1 AT THE BOTTOM
// PORT: Fixed ROM slots 3857.
                        if slot <> 3857 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:392
//		XCH	LST1 	+2	#    FOR T6-T5, CORRESPONDING TO THE
// PORT: Fixed ROM slots 3858.
                        if slot <> 3858 or instruction <> 24322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 770, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3860 {
                    if slot <= 3859 {
// PORT: SOURCE WAITLIST.agc:393
//		XCH	LST1 	+1	#    INTERVAL 81.91 SEC FOR ENDTASK.
// PORT: Fixed ROM slots 3859.
                        if slot <> 3859 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:394
//		XCH	LST1
// PORT: Fixed ROM slots 3860.
                        if slot <> 3860 or instruction <> 24320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 768, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3861 {
// PORT: SOURCE WAITLIST.agc:395
//		AD	POSMAX		# 2. SET T3 = 1.0 - T2 - T USING LIST 1.
// PORT: Fixed ROM slots 3861.
                        if slot <> 3861 or instruction <> 27099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:396
//		ADS	TIME3		#    SO T3 WON'T TICK DURING UPDATE.
// PORT: Fixed ROM slots 3862.
                        if slot <> 3862 or instruction <> 11286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 22).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3870 {
            if slot <= 3866 {
                if slot <= 3864 {
                    if slot <= 3863 {
// PORT: SOURCE WAITLIST.agc:397
//		TS	RUPTAGN
// PORT: Fixed ROM slots 3863.
                        if slot <> 3863 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:398
//		CS	ZERO
// PORT: Fixed ROM slots 3864.
                        if slot <> 3864 or instruction <> 18925 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3865 {
// PORT: SOURCE WAITLIST.agc:399
//		TS	RUPTAGN		# SETS RUPTAGN TO +1 ON OVERFLOW.
// PORT: Fixed ROM slots 3865.
                        if slot <> 3865 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:400
//
// PORT: SOURCE WAITLIST.agc:401
//		EXTEND			# DISPATCH TASK.
// PORT: Fixed ROM slots 3866.
                        if slot <> 3866 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3868 {
                    if slot <= 3867 {
// PORT: SOURCE WAITLIST.agc:402
//		DCS	ENDTASK
// PORT: Fixed ROM slots 3867.
                        if slot <> 3867 or instruction <> 19103 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 2719, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:403
//		DXCH	LST2 	+16D
// PORT: Fixed ROM slots 3868.
                        if slot <> 3868 or instruction <> 22297 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 793, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3869 {
// PORT: SOURCE WAITLIST.agc:404
//		DXCH	LST2 	+14D
// PORT: Fixed ROM slots 3869.
                        if slot <> 3869 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:405
//		DXCH	LST2 	+12D
// PORT: Fixed ROM slots 3870.
                        if slot <> 3870 or instruction <> 22293 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 789, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3874 {
                if slot <= 3872 {
                    if slot <= 3871 {
// PORT: SOURCE WAITLIST.agc:406
//		DXCH	LST2 	+10D
// PORT: Fixed ROM slots 3871.
                        if slot <> 3871 or instruction <> 22291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 787, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:407
//		DXCH	LST2 	+8D
// PORT: Fixed ROM slots 3872.
                        if slot <> 3872 or instruction <> 22289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3873 {
// PORT: SOURCE WAITLIST.agc:408
//		DXCH	LST2 	+6
// PORT: Fixed ROM slots 3873.
                        if slot <> 3873 or instruction <> 22287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 783, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:409
//		DXCH	LST2 	+4
// PORT: Fixed ROM slots 3874.
                        if slot <> 3874 or instruction <> 22285 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 781, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3876 {
                    if slot <= 3875 {
// PORT: SOURCE WAITLIST.agc:410
//		DXCH	LST2 	+2
// PORT: Fixed ROM slots 3875.
                        if slot <> 3875 or instruction <> 22283 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:411
//		DXCH	LST2
// PORT: Fixed ROM slots 3876.
                        if slot <> 3876 or instruction <> 22281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 777, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3877 {
// PORT: SOURCE WAITLIST.agc:412
//
// PORT: SOURCE WAITLIST.agc:413
//		XCH	L
// PORT: Fixed ROM slots 3877.
                        if slot <> 3877 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:414
//		EXTEND
// PORT: Fixed ROM slots 3878.
                        if slot <> 3878 or instruction <> 6 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[124] to agcAotUnit124@.

// PORT: Physical bank 01. Shared continuation entries, slots 3879–3881.
function agcAotUnit125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3879 {
// PORT: SOURCE WAITLIST.agc:415
//		WRITE 	SUPERBNK	# SET SUPERBANK FROM BBCON OF 2CADR
// PORT: Fixed ROM slots 3879.
        if slot <> 3879 or instruction <> 519 { return choose false if checkOnly else -1. }
        if extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreChannelInstruction(words, 1, 7, channelAdapter).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3880 {
// PORT: SOURCE WAITLIST.agc:416
//		XCH	L		# RESTORE TO L FOR DXCH Z.
// PORT: Fixed ROM slots 3880.
            if slot <> 3880 or instruction <> 23553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 1, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:417
//		DTCB
// PORT: Fixed ROM slots 3881.
            if slot <> 3881 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[125] to agcAotUnit125@.

// PORT: Physical bank 02. Shared continuation entries, slots 4785–4801.
function agcAotUnit197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4792 {
        if slot <= 4788 {
            if slot <= 4786 {
                if slot <= 4785 {
// PORT: SOURCE WAITLIST.agc:418
//
// PORT: SOURCE WAITLIST.agc:419
//# Page 1129
// PORT: SOURCE WAITLIST.agc:420
//# RETURN, AFTER EXECUTION OF T3 OVERFLOW TASK:
// PORT: SOURCE WAITLIST.agc:421
//
// PORT: SOURCE WAITLIST.agc:422
//		BLOCK	02
// PORT: SOURCE WAITLIST.agc:423
//		COUNT*	$$/WAIT
// PORT: SOURCE WAITLIST.agc:424
//TASKOVER	CCS	RUPTAGN		# IF +1 RETURN TO T3RUPT, IF -0 RESUME.
// PORT: Fixed ROM slots 4785.
                    if slot <> 4785 or instruction <> 4572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 476).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:425
//		CAF	WAITBB
// PORT: Fixed ROM slots 4786.
                    if slot <> 4786 or instruction <> 14992 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2704), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4787 {
// PORT: SOURCE WAITLIST.agc:426
//		TS	BBANK
// PORT: Fixed ROM slots 4787.
                    if slot <> 4787 or instruction <> 22534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:427
//		TCF	T3RUPT2		# DISPATCH NEXT TASK IF IT WAS DUE.
// PORT: Fixed ROM slots 4788.
                    if slot <> 4788 or instruction <> 5900 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5900, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4790 {
                if slot <= 4789 {
// PORT: SOURCE WAITLIST.agc:428
//
// PORT: SOURCE WAITLIST.agc:429
//		CA	BANKRUPT
// PORT: Fixed ROM slots 4789.
                    if slot <> 4789 or instruction <> 12302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 14).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:430
//		EXTEND
// PORT: Fixed ROM slots 4790.
                    if slot <> 4790 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4791 {
// PORT: SOURCE WAITLIST.agc:431
//		WRITE	SUPERBNK	# RESTORE SUPERBANK BEFORE RESUME IS DONE
// PORT: Fixed ROM slots 4791.
                    if slot <> 4791 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:432
//
// PORT: SOURCE WAITLIST.agc:433
//RESUME		EXTEND
// PORT: Fixed ROM slots 4792.
                    if slot <> 4792 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4796 {
            if slot <= 4794 {
                if slot <= 4793 {
// PORT: SOURCE WAITLIST.agc:434
//		QXCH	QRUPT
// PORT: Fixed ROM slots 4793.
                    if slot <> 4793 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:435
//NOQRSM		CA	BANKRUPT
// PORT: Fixed ROM slots 4794.
                    if slot <> 4794 or instruction <> 12302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 14).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4795 {
// PORT: SOURCE WAITLIST.agc:436
//		XCH	BBANK
// PORT: Fixed ROM slots 4795.
                    if slot <> 4795 or instruction <> 23558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 6, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:437
//NOQBRSM		DXCH	ARUPT
// PORT: Fixed ROM slots 4796.
                    if slot <> 4796 or instruction <> 21513 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4798 {
                if slot <= 4797 {
// PORT: SOURCE WAITLIST.agc:438
//		RELINT
// PORT: Fixed ROM slots 4797.
                    if slot <> 4797 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:439
//		RESUME
// PORT: Fixed ROM slots 4798.
                    if slot <> 4798 or instruction <> 20495 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20495, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4799 {
// PORT: SOURCE WAITLIST.agc:440
//
// PORT: SOURCE WAITLIST.agc:441
//# Page 1130
// PORT: SOURCE WAITLIST.agc:442
//# LONGCALL
// PORT: SOURCE WAITLIST.agc:443
//# PROGRAM DESCRIPTION				DATE -- 17 MARCH 1967
// PORT: SOURCE WAITLIST.agc:444
//# PROGRAM WRITTEN BY W.H.VANDEVER		LOG SECTION WAITLIST
// PORT: SOURCE WAITLIST.agc:445
//# MOD BY -- R. MELANSON TO ADD DOCUMENTATION	ASSEMBLY SUNDISK REV. 100
// PORT: SOURCE WAITLIST.agc:446
//#
// PORT: SOURCE WAITLIST.agc:447
//# FUNCTIONAL DESCRIPTION --
// PORT: SOURCE WAITLIST.agc:448
//#	LONGCALL IS CALLED WITH THE DELTA TIME ARRIVING IN A,L SCALED AS TIME2,TIME1 WITH THE 2CADR OF THE TASK
// PORT: SOURCE WAITLIST.agc:449
//#	IMMEDIATELY FOLLOWING THE TC LONGCALL.  FOR EXAMPLE, IT MIGHT BE DONE AS FOLLOWS WHERE TIMELOC IS THE NAME OF
// PORT: SOURCE WAITLIST.agc:450
//# 	A DP REGISTER CONTAINING A DELTA TIME AND WHERE TASKTODO IS THE NAME OF THE LOCATION AT WHICH LONGCALL IS TO
// PORT: SOURCE WAITLIST.agc:451
//# 	START.
// PORT: SOURCE WAITLIST.agc:452
//# CALLING SEQUENCE --
// PORT: SOURCE WAITLIST.agc:453
//#		EXTEND
// PORT: SOURCE WAITLIST.agc:454
//#		DCA	TIMELOC
// PORT: SOURCE WAITLIST.agc:455
//#		TC	LONGCALL
// PORT: SOURCE WAITLIST.agc:456
//#		2CADR	TASKTODO
// PORT: SOURCE WAITLIST.agc:457
//# NORMAL EXIT MODE --
// PORT: SOURCE WAITLIST.agc:458
//#	1)	TC	WAITLIST
// PORT: SOURCE WAITLIST.agc:459
//#	2)	DTCB	(TC L+3 OF CALLING ROUTINE 1ST PASS THRU LONGCYCL)
// PORT: SOURCE WAITLIST.agc:460
//#	3)	DTCB	(TO TASKOVER ON SUBSEQUENT PASSES THRU LONGCYCL)
// PORT: SOURCE WAITLIST.agc:461
//# ALARM OR ABORT EXIT MODE --
// PORT: SOURCE WAITLIST.agc:462
//#	NONE
// PORT: SOURCE WAITLIST.agc:463
//# OUTPUT --
// PORT: SOURCE WAITLIST.agc:464
//#	LONGTIME AND LONGTIME+1 = DELTA TIME
// PORT: SOURCE WAITLIST.agc:465
//#	LONGEXIT AND LONGEXIT+1 = RETURN 2CADR
// PORT: SOURCE WAITLIST.agc:466
//#	LONGCADR AND LONGCADR+1 = TASK 2CADR
// PORT: SOURCE WAITLIST.agc:467
//#	A = SINGLE PRECISION TIME FOR WAITLIST
// PORT: SOURCE WAITLIST.agc:468
//# ERASABLE INITIALIZATION --
// PORT: SOURCE WAITLIST.agc:469
//#	A = MOST SIGNIFICANT PART OF DELTA TIME
// PORT: SOURCE WAITLIST.agc:470
//#	L = LEAST SIGNIFICANT PART OF DELTA TIME
// PORT: SOURCE WAITLIST.agc:471
//#	Q = ADDRESS OF 2CADR TASK VALUE
// PORT: SOURCE WAITLIST.agc:472
//# DEBRIS --
// PORT: SOURCE WAITLIST.agc:473
//#	A,Q,L
// PORT: SOURCE WAITLIST.agc:474
//#	LONGCADR AND LONGCADR+1
// PORT: SOURCE WAITLIST.agc:475
//#	LONGEXIT AND LONGEXIT+1
// PORT: SOURCE WAITLIST.agc:476
//#	LONGTIME AND LONGTIME+1
// PORT: SOURCE WAITLIST.agc:477
//# *** THE FOLLOWING IS TO BE IN FIXED-FIXED AND UNSWITCHED ERRASIBLE **
// PORT: SOURCE WAITLIST.agc:478
//
// PORT: SOURCE WAITLIST.agc:479
//		BLOCK	02
// PORT: SOURCE WAITLIST.agc:480
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:481
//LONGCALL	DXCH	LONGTIME	# OBTAIN THE DELTA TIME
// PORT: Fixed ROM slots 4799.
                    if slot <> 4799 or instruction <> 22124 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 620, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4800 {
// PORT: SOURCE WAITLIST.agc:482
//
// PORT: SOURCE WAITLIST.agc:483
//		EXTEND			# OBTAIN THE 2CADR
// PORT: Fixed ROM slots 4800.
                        if slot <> 4800 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:484
//# Page 1131
// PORT: SOURCE WAITLIST.agc:485
//		NDX	Q
// PORT: Fixed ROM slots 4801.
                        if slot <> 4801 or instruction <> 20482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20482, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[197] to agcAotUnit197@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:486
//		DCA	0
// PORT: Fixed ROM slots 4802.
    4802, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4803–4806.
function agcAotUnit198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4804 {
        if slot <= 4803 {
// PORT: SOURCE WAITLIST.agc:487
//		DXCH	LONGCADR
// PORT: Fixed ROM slots 4803.
            if slot <> 4803 or instruction <> 22120 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 616, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:488
//
// PORT: SOURCE WAITLIST.agc:489
//		EXTEND			# NOW GO TO THE APPROPRIATE SWITCHED BANK
// PORT: Fixed ROM slots 4804.
            if slot <> 4804 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4805 {
// PORT: SOURCE WAITLIST.agc:490
//		DCA	LGCL2CDR	# FOR THE REST OF LONGCALL
// PORT: Fixed ROM slots 4805.
            if slot <> 4805 or instruction <> 15048 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2760, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:491
//		DTCB
// PORT: Fixed ROM slots 4806.
            if slot <> 4806 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[198] to agcAotUnit198@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:492
//
// PORT: SOURCE WAITLIST.agc:493
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:494
//LGCL2CDR	2CADR	LNGCALL2
// PORT: Fixed ROM slots 4807 4808.
    4807, 3668, 4808, 2150
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3882–3902.
function agcAotUnit126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3891 {
        if slot <= 3886 {
            if slot <= 3883 {
                if slot <= 3882 {
// PORT: SOURCE WAITLIST.agc:495
//
// PORT: SOURCE WAITLIST.agc:496
//# *** THE FOLLOWING MAY BE IN A SWITCHED BANK, INCLUDING ITS ERASABLE ***
// PORT: SOURCE WAITLIST.agc:497
//
// PORT: SOURCE WAITLIST.agc:498
//		BANK	01
// PORT: SOURCE WAITLIST.agc:499
//		COUNT*	$$/WAIT
// PORT: SOURCE WAITLIST.agc:500
//LNGCALL2	LXCH	LONGEXIT +1	# SAVE THE CORRECT BB FOR RETURN
// PORT: Fixed ROM slots 3882.
                    if slot <> 3882 or instruction <> 10013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 797, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:501
//		CA	TWO		# OBTAIN THE RETURN ADDRESS
// PORT: Fixed ROM slots 3883.
                    if slot <> 3883 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                if slot <= 3884 {
// PORT: SOURCE WAITLIST.agc:502
//		ADS	Q
// PORT: Fixed ROM slots 3884.
                    if slot <> 3884 or instruction <> 11266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3885 {
// PORT: SOURCE WAITLIST.agc:503
//		TS	LONGEXIT
// PORT: Fixed ROM slots 3885.
                        if slot <> 3885 or instruction <> 23324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23324, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:504
//
// PORT: SOURCE WAITLIST.agc:505
//		CA	LONGTIME	# CHECK FOR LEGITIMATE DELTA-TIME
// PORT: Fixed ROM slots 3886.
                        if slot <> 3886 or instruction <> 12907 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 619).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3888 {
                if slot <= 3887 {
// PORT: SOURCE WAITLIST.agc:506
//		CCS	A
// PORT: Fixed ROM slots 3887.
                    if slot <> 3887 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:507
//		TCF	LONGCYCL	# HI-ORDER OK --> ALL IS OK.
// PORT: Fixed ROM slots 3888.
                    if slot <> 3888 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3889 {
// PORT: SOURCE WAITLIST.agc:508
//		TCF	+2		# HI-ORDER ZERO --> CHECK LO-ORDER.
// PORT: Fixed ROM slots 3889.
                    if slot <> 3889 or instruction <> 5939 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5939, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3890 {
// PORT: SOURCE WAITLIST.agc:509
//		TCF	LONGPOOH	# HI-ORDER NEG. --> NEG. DT
// PORT: Fixed ROM slots 3890.
                        if slot <> 3890 or instruction <> 5969 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5969, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:510
// +2		CA	LONGTIME +1	# CHECK LO-ORDER FOR ZERO OR NEGATIVE.
// PORT: Fixed ROM slots 3891.
                        if slot <> 3891 or instruction <> 12908 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 620).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3896 {
            if slot <= 3893 {
                if slot <= 3892 {
// PORT: SOURCE WAITLIST.agc:511
//		EXTEND
// PORT: Fixed ROM slots 3892.
                    if slot <> 3892 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE WAITLIST.agc:512
//		BZMF	LONGPOOH	# BAD DELTA-TIME.  ABORT
// PORT: Fixed ROM slots 3893.
                    if slot <> 3893 or instruction <> 26449 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3894 {
// PORT: SOURCE WAITLIST.agc:513
//
// PORT: SOURCE WAITLIST.agc:514
//# *** WAITLIST TASK LONGCYCL ***
// PORT: SOURCE WAITLIST.agc:515
//
// PORT: SOURCE WAITLIST.agc:516
//LONGCYCL	EXTEND			# CAN WE SUCCESFULLY TAKE ABOUT 1.25
// PORT: Fixed ROM slots 3894.
                    if slot <> 3894 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3895 {
// PORT: SOURCE WAITLIST.agc:517
//		DCS	DPBIT14		# MINUTES OFF OF LONGTIME
// PORT: Fixed ROM slots 3895.
                        if slot <> 3895 or instruction <> 18240 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 1856, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:518
//		DAS	LONGTIME
// PORT: Fixed ROM slots 3896.
                        if slot <> 3896 or instruction <> 8812 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 620) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3899 {
                if slot <= 3897 {
// PORT: SOURCE WAITLIST.agc:519
//
// PORT: SOURCE WAITLIST.agc:520
//		CCS	LONGTIME +1	# THE REASONING BEHIND THIS PART IS
// PORT: Fixed ROM slots 3897.
                    if slot <> 3897 or instruction <> 4716 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 620).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3898 {
// PORT: SOURCE WAITLIST.agc:521
//		TCF	MUCHTIME	# INVOLVED, TAKING INTO ACCOUNT THAT THE
// PORT: Fixed ROM slots 3898.
                        if slot <> 3898 or instruction <> 5961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5961, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:522
//					# WORDS MAY NOT BE SIGNED CORRECTED (DP
// PORT: SOURCE WAITLIST.agc:523
//					# BASIC INSTRUCTIONS
// PORT: SOURCE WAITLIST.agc:524
//					# DO NOT SIGN CORRECT) AND THAT WE SUBTRAC-
// PORT: SOURCE WAITLIST.agc:525
//					# TED BIT14 (1 OVER HALF THE POS. VALUE
// PORT: SOURCE WAITLIST.agc:526
//					# REPRESENTABLE IN SINGLE WORD)
// PORT: SOURCE WAITLIST.agc:527
//		NOOP			# CAN'T GET HERE *************
// PORT: Fixed ROM slots 3899.
                        if slot <> 3899 or instruction <> 5948 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5948, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3900 {
// PORT: SOURCE WAITLIST.agc:528
//		TCF	+1
// PORT: Fixed ROM slots 3900.
                    if slot <> 3900 or instruction <> 5949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5949, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3901 {
// PORT: SOURCE WAITLIST.agc:529
//		CCS	LONGTIME
// PORT: Fixed ROM slots 3901.
                        if slot <> 3901 or instruction <> 4715 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 619).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE WAITLIST.agc:530
//		TCF	MUCHTIME
// PORT: Fixed ROM slots 3902.
                        if slot <> 3902 or instruction <> 5961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5961, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[126] to agcAotUnit126@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:531
//DPBIT14		OCT	00000
// PORT: Fixed ROM slots 3903.
    3903, 0,
// PORT: SOURCE WAITLIST.agc:532
//		OCT	20000
// PORT: Fixed ROM slots 3904.
    3904, 16384
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3905–3907.
function agcAotUnit127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3905 {
// PORT: SOURCE WAITLIST.agc:533
//
// PORT: SOURCE WAITLIST.agc:534
//					# LONGCALL
// PORT: SOURCE WAITLIST.agc:535
//# Page 1132
// PORT: SOURCE WAITLIST.agc:536
//LASTTIME	CA	BIT14		# GET BACK THE CORRECT DELTA T FOR WAITLIST
// PORT: Fixed ROM slots 3905.
        if slot <> 3905 or instruction <> 14814 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3906 {
// PORT: SOURCE WAITLIST.agc:537
//		ADS	LONGTIME +1
// PORT: Fixed ROM slots 3906.
            if slot <> 3906 or instruction <> 11884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 620).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:538
//		TC	WAITLIST
// PORT: Fixed ROM slots 3907.
            if slot <> 3907 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[127] to agcAotUnit127@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:539
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:540
//		2CADR	GETCADR		# THE ENTRY TO OUR LONGCADR
// PORT: Fixed ROM slots 3908 3909.
    3908, 3740, 3909, 2150
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3910–3914.
function agcAotUnit128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3911 {
        if slot <= 3910 {
// PORT: SOURCE WAITLIST.agc:541
//
// PORT: SOURCE WAITLIST.agc:542
//LONGRTRN	CA	TSKOVCDR	# SET IT UP SO THAT ONLY THE FIRST EXIT IS
// PORT: Fixed ROM slots 3910.
            if slot <> 3910 or instruction <> 14160 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1872), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:543
//		DXCH	LONGEXIT	# TO THE CALLER OF LONGCALL
// PORT: Fixed ROM slots 3911.
            if slot <> 3911 or instruction <> 22301 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 797, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3912 {
// PORT: SOURCE WAITLIST.agc:544
//		DTCB			# THE REST ARE TO TASKOVER
// PORT: Fixed ROM slots 3912.
            if slot <> 3912 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3913 {
// PORT: SOURCE WAITLIST.agc:545
//
// PORT: SOURCE WAITLIST.agc:546
//MUCHTIME	CA	BIT14		# WE HAVE OVER OUR ABOUT 1.25 MINUTES
// PORT: Fixed ROM slots 3913.
                if slot <> 3913 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE WAITLIST.agc:547
//		TC	WAITLIST	# SO SET UP FOR ANOTHER CYCLE THROUGH HERE
// PORT: Fixed ROM slots 3914.
                if slot <> 3914 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[128] to agcAotUnit128@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:548
//		EBANK=	LST1
// PORT: SOURCE WAITLIST.agc:549
//		2CADR	LONGCYCL
// PORT: Fixed ROM slots 3915 3916.
    3915, 3692, 3916, 2150
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3917–3919.
function agcAotUnit129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3917 {
// PORT: SOURCE WAITLIST.agc:550
//
// PORT: SOURCE WAITLIST.agc:551
//		TCF	LONGRTRN	# NOW EXIT PROPERLY
// PORT: Fixed ROM slots 3917.
        if slot <> 3917 or instruction <> 5958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5958, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3918 {
// PORT: SOURCE WAITLIST.agc:552
//
// PORT: SOURCE WAITLIST.agc:553
//# *** WAITLIST TASK GETCADR ***
// PORT: SOURCE WAITLIST.agc:554
//
// PORT: SOURCE WAITLIST.agc:555
//GETCADR		DXCH	LONGCADR	# GET THE LONGCALL THAT WE WISHED TO START
// PORT: Fixed ROM slots 3918.
            if slot <> 3918 or instruction <> 22120 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 616, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:556
//		DTCB			# AND TRANSFER CONTROL TO IT
// PORT: Fixed ROM slots 3919.
            if slot <> 3919 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[129] to agcAotUnit129@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:557
//
// PORT: SOURCE WAITLIST.agc:558
//TSKOVCDR	GENADR	TASKOVER
// PORT: Fixed ROM slots 3920.
    3920, 5474
)).

// PORT: Physical bank 01. Shared continuation entries, slots 3921–3924.
function agcAotUnit130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3922 {
        if slot <= 3921 {
// PORT: SOURCE WAITLIST.agc:559
//LONGPOOH	DXCH	LONGEXIT
// PORT: Fixed ROM slots 3921.
            if slot <> 3921 or instruction <> 22301 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 797, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:560
//		TCF	+2
// PORT: Fixed ROM slots 3922.
            if slot <> 3922 or instruction <> 5972 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5972, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3923 {
// PORT: SOURCE WAITLIST.agc:561
//WAITPOOH	DXCH	WAITEXIT
// PORT: Fixed ROM slots 3923.
            if slot <> 3923 or instruction <> 21554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE WAITLIST.agc:562
// +2		TC	POODOO1
// PORT: Fixed ROM slots 3924.
            if slot <> 3924 or instruction <> 3030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3030, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[130] to agcAotUnit130@.

agcAotInstallSourceRope(list(
// PORT: SOURCE WAITLIST.agc:563
//		OCT	01204
// PORT: Fixed ROM slots 3925.
    3925, 1288
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE WAITLIST.agc:564
//
