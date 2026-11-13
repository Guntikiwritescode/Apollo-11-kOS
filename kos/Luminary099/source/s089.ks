// WAITLIST.agc
// bank 02, slots 4731-4743
function agcAotUnit190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4736 {
        if slot <= 4733 {
            if slot <= 4731 {
// WAITLIST.agc:1
//# Copyright:	Public domain.
// WAITLIST.agc:2
//# Filename:	WAITLIST.agc
// WAITLIST.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// WAITLIST.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// WAITLIST.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// WAITLIST.agc:6
//# Assembler:	yaYUL
// WAITLIST.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// WAITLIST.agc:8
//# Website:	www.ibiblio.org/apollo.
// WAITLIST.agc:9
//# Pages:	1117-1132
// WAITLIST.agc:10
//# Mod history:	2009-05-25 RSB	Adapted from the corresponding
// WAITLIST.agc:11
//#				Luminary131 file, using page
// WAITLIST.agc:12
//#				images from Luminary 1A.
// WAITLIST.agc:13
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// WAITLIST.agc:14
//#		2011-05-07 JL	Removed workarounds.
// WAITLIST.agc:15
//#
// WAITLIST.agc:16
//# This source code has been transcribed or otherwise adapted from
// WAITLIST.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// WAITLIST.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// WAITLIST.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// WAITLIST.agc:20
//# in storage size and consequent reduction in image quality as well) are
// WAITLIST.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// WAITLIST.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// WAITLIST.agc:23
//# about getting access to the (much) higher-quality images which Paul
// WAITLIST.agc:24
//# actually created.
// WAITLIST.agc:25
//#
// WAITLIST.agc:26
//# Notations on the hardcopy document read, in part:
// WAITLIST.agc:27
//#
// WAITLIST.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// WAITLIST.agc:29
//#	16:27 JULY 14, 1969
// WAITLIST.agc:30
//
// WAITLIST.agc:31
//# Page 1117
// WAITLIST.agc:32
//# PROGRAM DESCRIPTION								DATE -- 10 OCTOBER 1966
// WAITLIST.agc:33
//# MOD NO -- 2									LOG SECTION -- WAITLIST
// WAITLIST.agc:34
//# MOD BY -- MILLER	(DTMAX INCREASED TO 162.5 SEC)				ASSEMBLY -- SUNBURST REV 5
// WAITLIST.agc:35
//# MOD 3 BY KERNAN	(INHINT INSERTED AT WAITLIST) 2/28/68 SKIPPER REV 4
// WAITLIST.agc:36
//# MOD 4 BY KERNAN	(TWIDDLE IN 54) 3/28/68 SKIPPER REV 13.
// WAITLIST.agc:37
//#
// WAITLIST.agc:38
//# FUNCTIONAL DESCRIPTION --
// WAITLIST.agc:39
//#	PART OF A SECTION OF PROGRAMS -- WAITLIST, TASKOVER, T3RUPT, USED TO CALL A PROGRAM (CALLED A TASK),
// WAITLIST.agc:40
//#	WHICH IS TO BEGIN IN C(A) CENTISECONDS.  WAITLIST UPDATES TIME3, LST1, AND LST2.  THE MEANING OF THESE LISTS
// WAITLIST.agc:41
//#	FOLLOW.
// WAITLIST.agc:42
//#
// WAITLIST.agc:43
//#		C(TIME3) = 16384 -(T1-T) CENTISECONDS, (T=PRESENT TIME, T1-TIME FOR TASK1)
// WAITLIST.agc:44
//#
// WAITLIST.agc:45
//#			C(LST1)		=	-(T2-T1)+1
// WAITLIST.agc:46
//#			C(LST1 +1)	=	-(T3-T2)+1
// WAITLIST.agc:47
//#			C(LST1 +2)	=	-(T4-T3)+1
// WAITLIST.agc:48
//#				       ...
// WAITLIST.agc:49
//#			C(LST1 +6)	=	-(T8-T7)+1
// WAITLIST.agc:50
//#			C(LST1 +7)	=	-(T9-T8)+1
// WAITLIST.agc:51
//#
// WAITLIST.agc:52
//#			C(LST2)		=	2CADR OF TASK1
// WAITLIST.agc:53
//#			C(LST2 +2)	=	2CADR OF TASK2
// WAITLIST.agc:54
//#				       ...
// WAITLIST.agc:55
//#			C(LST2 +14)	=	2CADR OF TASK8
// WAITLIST.agc:56
//#			C(LST2 +16)	=	2CADR OF TASK9
// WAITLIST.agc:57
//#
// WAITLIST.agc:58
//# WARNINGS --
// WAITLIST.agc:59
//#	1)	1 <= C(A) <= 16250D (1 CENTISECOND TO 162.5 SEC)
// WAITLIST.agc:60
//#	2)	9 TASKS MAXIMUM
// WAITLIST.agc:61
//#	3)	TASKS CALLED UNDER INTERRUPT INHIBITED
// WAITLIST.agc:62
//#	4)	TASKS END BY TC TASKOVER
// WAITLIST.agc:63
//#
// WAITLIST.agc:64
//# CALLING SEQUENCE --
// WAITLIST.agc:65
//#	L-1	CA	DELTAT 	(TIME IN CENTISECONDS TO TASK START)
// WAITLIST.agc:66
//#	L	TC	WAITLIST
// WAITLIST.agc:67
//#	L+1	2CADR	DESIRED TASK.
// WAITLIST.agc:68
//#	L+2	(MINOR OF 2CADR)
// WAITLIST.agc:69
//#	L+3	RELINT		(RETURNS HERE)
// WAITLIST.agc:70
//#
// WAITLIST.agc:71
//# TWIDDLE --
// WAITLIST.agc:72
//#	TWIDDLE IS FOR USE WHEN THE TASK BEING SET UP IS IN THE SAME EBANK AND FBANK AS THE USER.  IN
// WAITLIST.agc:73
//#	SUCH CASES, IT IMPROVES UPON WAITLIST BY ELIMINATING THE NEED FOR THE BBCON HALF OF THE 2CADR,
// WAITLIST.agc:74
//# Page 1118
// WAITLIST.agc:75
//#	SAVING A WORD.  TWIDDLE IS LIKE WAITLIST IN EVERY RESPECT EXCEPT CALLING SEQUENCE, TO WIT,
// WAITLIST.agc:76
//#		L-1	CA	DELTAT
// WAITLIST.agc:77
//#		L	TC	TWIDDLE
// WAITLIST.agc:78
//#		L+1	ADRES	DESIRED TASK
// WAITLIST.agc:79
//#		L+2	RELINT		(RETURNS HERE)
// WAITLIST.agc:80
//#
// WAITLIST.agc:81
//# NORMAL EXIT MODES --
// WAITLIST.agc:82
//#	AT L+3 OF CALLING SEQUENCE.
// WAITLIST.agc:83
//#
// WAITLIST.agc:84
//# ALARM OR ABORT EXIT MODES --
// WAITLIST.agc:85
//#	TC	ABORT
// WAITLIST.agc:86
//#	OCT	1203	(WAITLIST OVERFLOW -- TOO MANY TASKS)
// WAITLIST.agc:87
//#
// WAITLIST.agc:88
//# ERASABLE INITIALIZATION REQUIRED --
// WAITLIST.agc:89
//#	ACCOMPLISHED BY FRESH START --	LST2, ..., LST2 +16 = ENDTASK
// WAITLIST.agc:90
//#					LST1, ..., LST1 +7  = NEG1/2
// WAITLIST.agc:91
//#
// WAITLIST.agc:92
//# OUTPUT --
// WAITLIST.agc:93
//#	LST1 AND LST2 UPDATED WTIH NEW TASK AND ASSOCIATED TIME.
// WAITLIST.agc:94
//#
// WAITLIST.agc:95
//# DEBRIS --
// WAITLIST.agc:96
//#	CENTRALS -- A,Q,L
// WAITLIST.agc:97
//#	OTHER    -- WAITEXIT, WAITADR, WAITTEMP, WAITBANK
// WAITLIST.agc:98
//#
// WAITLIST.agc:99
//# DETAILED ANALYSIS OF TIMING --
// WAITLIST.agc:100
//#	CONTROL WILL NOT BE RETURNED TO THE SPECIFIED ADDRESS (2CADR) IN EXACTLY DELTA T CENTISECONDS.
// WAITLIST.agc:101
//#	THE APPROXIMATE TIME MAY BE CALCULATED AS FOLLOWS:
// WAITLIST.agc:102
//#		LET T0 = THE TIME OF THE TC WAITLIST
// WAITLIST.agc:103
//#		LET TS = T0 +147U + COUNTER INCREMENTS (SET UP TIME)
// WAITLIST.agc:104
//#		LET X  = TS -(100TS)/100  (VARIANCE FROM COUNTERS)
// WAITLIST.agc:105
//#		LET Y  = LENGTH OF TIME OF INHIBIT INTERRUPT AFTER T3RUPT
// WAITLIST.agc:106
//#		LET Z  = LENGTH OF TIME TO PROCESS TASKS WHICH ARE DUE THIS T3RUPT BUT DISPATCHED EARLIER.
// WAITLIST.agc:107
//#			 (Z=0, USUALLY).
// WAITLIST.agc:108
//#		LET DELTD  = THE ACTUAL TIME TAKEN TO GIVE CONTROL TO 2CADR
// WAITLIST.agc:109
//#		THEN DELTD = TS+DELTA T -X +Y +Z +1.05MS* +COUNTERS*
// WAITLIST.agc:110
//#		*THE TIME TAKEN BY WAITLIST ITSELF AND THE COUNTER TICKING DURING THIS WAITLIST TIME.
// WAITLIST.agc:111
//#	IN SHORT, THE ACTUAL TIME TO RETURN CONTROL TO A 2CADR IS AUGMENTED BY THE TIME TO SET UP THE TASK'S
// WAITLIST.agc:112
//# 	INTERRUPT, ALL COUNTERS TICKING, THE T3RUPT PROCESSING TIME, THE WAITLIST PROCESSING TIME AND THE POSSIBILITY
// WAITLIST.agc:113
//#	OF OTHER TASKS INHIBITING THE INTERRUPT.
// WAITLIST.agc:114
//
// WAITLIST.agc:115
//		BLOCK	02
// WAITLIST.agc:116
//# Page 1119
// WAITLIST.agc:117
//		EBANK=	LST1		# TASK LISTS IN SWITCHED E BANK.
// WAITLIST.agc:118
//
// WAITLIST.agc:119
//		COUNT*	$$/WAIT
// WAITLIST.agc:120
//TWIDDLE		INHINT
// slot 4731
                if slot <> 4731 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4732 {
// WAITLIST.agc:121
//		TS	L		# SAVE DELAY TIME IN L
// slot 4732
                    if slot <> 4732 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:122
//		CA	POSMAX
// slot 4733
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
// WAITLIST.agc:123
//		ADS	Q		# CREATING OVERFLOW AND Q-1 IN Q
// slot 4734
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
// WAITLIST.agc:124
//		CA	BBANK
// slot 4735
                    if slot <> 4735 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:125
//		EXTEND
// slot 4736
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
// WAITLIST.agc:126
//		ROR	SUPERBNK
// slot 4737
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
// WAITLIST.agc:127
//		XCH	L
// slot 4738
                    if slot <> 4738 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:128
//
// WAITLIST.agc:129
//WAITLIST	INHINT
// slot 4739
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
// WAITLIST.agc:130
//		XCH	Q		# SAVE DELTA T IN Q AND RETURN IN
// slot 4740
                    if slot <> 4740 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:131
//		TS	WAITEXIT	# WAITEXIT.
// slot 4741
                    if slot <> 4741 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4742 {
// WAITLIST.agc:132
//		EXTEND
// slot 4742
                    if slot <> 4742 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:133
//		INDEX	WAITEXIT	# IF TWIDDLING, THE TS SKIPS TO HERE
// slot 4743
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
// WAITLIST.agc:134
//		DCA	0		# PICK UP 2CADR OF TASK.
// slot 4744
    4744, 24578
)).

// bank 02, slots 4745-4751
function agcAotUnit191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4747 {
        if slot <= 4745 {
// WAITLIST.agc:135
// -1		TS	WAITADR		# BBCON WILL REMAIN IN L
// slot 4745
            if slot <> 4745 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4746 {
// WAITLIST.agc:136
//DLY2		CAF	WAITBB		# ENTRY FROM FIXDELAY AND VARDELAY.
// slot 4746
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
// WAITLIST.agc:137
//		XCH	BBANK
// slot 4747
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
// WAITLIST.agc:138
//		TCF	WAIT2
// slot 4748
                if slot <> 4748 or instruction <> 5785 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5785, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:139
//
// WAITLIST.agc:140
//# RETURN TO CALLER AFTER TASK INSERTION:
// WAITLIST.agc:141
//
// WAITLIST.agc:142
//LVWTLIST	DXCH	WAITEXIT
// slot 4749
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
// WAITLIST.agc:143
//		AD	TWO
// slot 4750
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
// WAITLIST.agc:144
//		DTCB
// slot 4751
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
// WAITLIST.agc:145
//
// WAITLIST.agc:146
//		EBANK=	LST1
// WAITLIST.agc:147
//WAITBB		BBCON	WAIT2
// slot 4752
    4752, 2150
)).

// bank 02, slots 4753-4753
function agcAotUnit192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:148
//
// WAITLIST.agc:149
//# RETURN TO CALLER +2 AFTER WAITING DT SPECIFIED AT CALLER +1.
// WAITLIST.agc:150
//
// WAITLIST.agc:151
//FIXDELAY	INDEX	Q		# BOTH ROUTINES MUST BE CALLED UNDER
// slot 4753
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
// WAITLIST.agc:152
//		CAF	0		# WAITLIST CONTROL AND TERMINATE THE TASK
// slot 4754
    4754, 24576
)).

// bank 02, slots 4755-4765
function agcAotUnit193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4759 {
        if slot <= 4756 {
            if slot <= 4755 {
// WAITLIST.agc:153
//		INCR	Q		# IN WHICH THEY WERE CALLED.
// slot 4755
                if slot <> 4755 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:154
//
// WAITLIST.agc:155
//# RETURN TO CALLER +1 AFTER WAITING THE DT AS ARRIVING IN A.
// WAITLIST.agc:156
//
// WAITLIST.agc:157
//VARDELAY	XCH	Q		# DT TO Q.  TASK ADRES TO WAITADR.
// slot 4756
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
// WAITLIST.agc:158
//		TS	WAITADR
// slot 4757
                if slot <> 4757 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4758 {
// WAITLIST.agc:159
//		CA	BBANK		# BBANK IS SAVED DURING DELAY.
// slot 4758
                    if slot <> 4758 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:160
//		EXTEND
// slot 4759
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
// WAITLIST.agc:161
//		ROR	SUPERBNK	# ADD SBANK TO BBCON.
// slot 4760
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
// WAITLIST.agc:162
//		TS	L
// slot 4761
                    if slot <> 4761 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:163
//		CAF	DELAYEX
// slot 4762
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
// WAITLIST.agc:164
//		TS	WAITEXIT	# GO TO TASKOVER AFTER TASK ENTRY.
// slot 4763
                if slot <> 4763 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4764 {
// WAITLIST.agc:165
//		TCF	DLY2
// slot 4764
                    if slot <> 4764 or instruction <> 6794 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6794, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:166
//
// WAITLIST.agc:167
//# Page 1120
// WAITLIST.agc:168
//DELAYEX		TCF	TASKOVER -2	# RETURNS TO TASKOVER.
// slot 4765
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
// WAITLIST.agc:169
//
// WAITLIST.agc:170
//# Page 1121
// WAITLIST.agc:171
//# ENDTASK MUST ENTERED IN FIXED-FIXED SO IT IS DISTINGUISHABLE BY ITS ADRES ALONE.
// WAITLIST.agc:172
//
// WAITLIST.agc:173
//		EBANK=	LST1
// WAITLIST.agc:174
//ENDTASK		-2CADR	SVCT3
// slot 4766 4767
    4766, 60094, 4767, 61336
)).

// bank 02, slots 4768-4778
function agcAotUnit194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4772 {
        if slot <= 4769 {
            if slot <= 4768 {
// WAITLIST.agc:175
//
// WAITLIST.agc:176
//SVCT3		CCS	FLAGWRD2	# DRIFT FLAG
// slot 4768
                if slot <> 4768 or instruction <> 4158 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:177
//		TCF	TASKOVER
// slot 4769
                if slot <> 4769 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4770 {
// WAITLIST.agc:178
//		TCF	TASKOVER
// slot 4770
                if slot <> 4770 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4771 {
// WAITLIST.agc:179
//		TCF	+1
// slot 4771
                    if slot <> 4771 or instruction <> 6820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6820, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:180
//
// WAITLIST.agc:181
//CKIMUSE		CCS	IMUCADR		# DON'T DO NBDONLY IF SOMEONE ELSE IS IN
// slot 4772
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
// WAITLIST.agc:182
//		TCF	SVCT3X		# IMUSTALL.
// slot 4773
                if slot <> 4773 or instruction <> 6830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6830, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4774 {
// WAITLIST.agc:183
//		TCF	+3
// slot 4774
                    if slot <> 4774 or instruction <> 6825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6825, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:184
//		TCF	SVCT3X
// slot 4775
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
// WAITLIST.agc:185
//		TCF	SVCT3X
// slot 4776
                if slot <> 4776 or instruction <> 6830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6830, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4777 {
// WAITLIST.agc:186
//
// WAITLIST.agc:187
// +3		CAF	PRIO35		# COMPENSATE FOR NBD COEFFICIENTS ONLY.
// slot 4777
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
// WAITLIST.agc:188
//		TC	NOVAC		#	ENABLE EVERY 81.93 SECONDS
// slot 4778
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
// WAITLIST.agc:189
//		EBANK=	NBDX
// WAITLIST.agc:190
//		2CADR	NBDONLY
// slot 4779 4780
    4779, 3802, 4780, 12390
)).

// bank 02, slots 4781-4782
function agcAotUnit195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4781 {
// WAITLIST.agc:191
//
// WAITLIST.agc:192
//		TCF	TASKOVER
// slot 4781
        if slot <> 4781 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:193
//
// WAITLIST.agc:194
//SVCT3X		TC	FIXDELAY	# DELAY MAX OF 2 TIMES FOR IMUZERO.
// slot 4782
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
// WAITLIST.agc:195
//		DEC	500
// slot 4783
    4783, 1000
)).

// bank 02, slots 4784-4784
function agcAotUnit196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:196
//		TC	SVCT3		# CHECK DRIFT FLAG AGAIN.
// slot 4784
    if slot <> 4784 or instruction <> 2720 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2720, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[196] to agcAotUnit196@.

// bank 01, slots 3737-3769
function agcAotUnit111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3752 {
        if slot <= 3744 {
            if slot <= 3740 {
                if slot <= 3738 {
                    if slot <= 3737 {
// WAITLIST.agc:197
//
// WAITLIST.agc:198
//# Page 1122
// WAITLIST.agc:199
//# BEGIN TASK INSERTION.
// WAITLIST.agc:200
//
// WAITLIST.agc:201
//		BANK	01
// WAITLIST.agc:202
//		COUNT*	$$/WAIT
// WAITLIST.agc:203
//WAIT2		TS	WAITBANK	# BBANK OF CALLING PROGRAM.
// slot 3737
                        if slot <> 3737 or instruction <> 22578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:204
//		CA	Q
// slot 3738
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
// WAITLIST.agc:205
//		EXTEND
// slot 3739
                        if slot <> 3739 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:206
//		BZMF	WAITPOOH
// slot 3740
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
// WAITLIST.agc:207
//
// WAITLIST.agc:208
//		CS	TIME3
// slot 3741
                        if slot <> 3741 or instruction <> 16406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 22).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:209
//		AD	BIT8		# BIT 8 = OCT 200
// slot 3742
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
// WAITLIST.agc:210
//		CCS	A		# TEST 200 - C(TIME3).  IF POSITIVE,
// slot 3743
                        if slot <> 3743 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:211
//					# IT MEANS THAT TIME3 OVERFLOW HAS OCCURRED PRIOR TO CS TIME3 AND THAT
// WAITLIST.agc:212
//					# C(TIME3) = T - T1, INSTEAD OF 1.0 - (T1 - T).  THE FOLLOWING FOUR
// WAITLIST.agc:213
//					# ORDERS SET C(A) = TD - T1 + 1 IN EITHER CASE.
// WAITLIST.agc:214
//
// WAITLIST.agc:215
//		AD	OCT40001	# OVERFLOW HAS OCCURRED.  SET C(A) =
// slot 3744
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
// WAITLIST.agc:216
//		CS	A		# T - T1 + 1.0 - 201
// slot 3745
                        if slot <> 3745 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:217
//
// WAITLIST.agc:218
//# NORMAL CASE (C(A) NNZ) YIELDS SAME C(A):  -( -(1.0-(T1-T)) + 200) - 1
// WAITLIST.agc:219
//
// WAITLIST.agc:220
//		AD	OCT40201
// slot 3746
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
// WAITLIST.agc:221
//		AD	Q		# RESULT = TD - T1 + 1.
// slot 3747
                        if slot <> 3747 or instruction <> 24578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:222
//
// WAITLIST.agc:223
//		CCS	A		# TEST TD - T1 + 1.
// slot 3748
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
// WAITLIST.agc:224
//
// WAITLIST.agc:225
//		AD	LST1		# IF TD - T1 POS, GO TO WTLST5 WITH
// slot 3749
                        if slot <> 3749 or instruction <> 25344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 768).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:226
//		TCF	WTLST5		# C(A) = (TD - T1) + C(LST1) = TD-T2+1
// slot 3750
                        if slot <> 3750 or instruction <> 5832 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5832, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3751 {
// WAITLIST.agc:227
//
// WAITLIST.agc:228
//		NOOP
// slot 3751
                        if slot <> 3751 or instruction <> 5800 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5800, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:229
//		CS	Q
// slot 3752
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
// WAITLIST.agc:230
//
// WAITLIST.agc:231
//# NOTE THAT THIS PROGRAM SECTION IS NEVER ENTERED WHEN T-T1 G/E -1,
// WAITLIST.agc:232
//# SINCE TD-T1+1 = (TD-T) + (T-T1+1), AND DELTA T = TD-T G/E +1.  (G/E
// WAITLIST.agc:233
//# SYMBOL MEANS GREATER THAN OR EQUAL TO).  THUS THERE NEED BE NO CON-
// WAITLIST.agc:234
//# CERN OVER A PREVIOUS OR IMMINENT OVEFLOW OF TIME3 HERE.
// WAITLIST.agc:235
//
// WAITLIST.agc:236
//		AD	POS1/2		# WHEN TD IS NEXT, FORM QUANTITY
// slot 3753
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
// WAITLIST.agc:237
//		AD	POS1/2		#	1.0 - DELTA T = 1.0 - (TD - T)
// slot 3754
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
// WAITLIST.agc:238
//		XCH	TIME3
// slot 3755
                        if slot <> 3755 or instruction <> 23574 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 22, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:239
//		AD	NEGMAX
// slot 3756
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
// WAITLIST.agc:240
//		AD	Q		# 1.0 - DELTAT T NOW COMPLETE.
// slot 3757
                        if slot <> 3757 or instruction <> 24578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:241
//		EXTEND			# ZERO INDEX Q.
// slot 3758
                        if slot <> 3758 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3759 {
// WAITLIST.agc:242
//		QXCH	7		# (ZQ)
// slot 3759
                        if slot <> 3759 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:243
//
// WAITLIST.agc:244
//# Page 1123
// WAITLIST.agc:245
//WTLST4		XCH	LST1
// slot 3760
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
// WAITLIST.agc:246
//		XCH	LST1 	+1
// slot 3761
                        if slot <> 3761 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:247
//		XCH	LST1 	+2
// slot 3762
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
// WAITLIST.agc:248
//		XCH	LST1 	+3
// slot 3763
                        if slot <> 3763 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:249
//		XCH	LST1 	+4
// slot 3764
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
// WAITLIST.agc:250
//		XCH	LST1 	+5
// slot 3765
                        if slot <> 3765 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:251
//		XCH	LST1 	+6
// slot 3766
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
// WAITLIST.agc:252
//		XCH	LST1 	+7
// slot 3767
                        if slot <> 3767 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3768 {
// WAITLIST.agc:253
//
// WAITLIST.agc:254
//		CA	WAITADR		# (MINOR PART OF TASK CADR HAS BEEN IN L.)
// slot 3768
                            if slot <> 3768 or instruction <> 12339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 51).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// WAITLIST.agc:255
//		INDEX	Q
// slot 3769
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
// WAITLIST.agc:256
//		TCF	+1
// slot 3770
    3770, 11638
)).

// bank 01, slots 3771-3788
function agcAotUnit112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3779 {
        if slot <= 3774 {
            if slot <= 3772 {
                if slot <= 3771 {
// WAITLIST.agc:257
//
// WAITLIST.agc:258
//		DXCH	LST2
// slot 3771
                    if slot <> 3771 or instruction <> 22281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 777, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:259
//		DXCH	LST2 	+2
// slot 3772
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
// WAITLIST.agc:260
//		DXCH	LST2 	+4
// slot 3773
                    if slot <> 3773 or instruction <> 22285 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 781, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:261
//		DXCH	LST2 	+6
// slot 3774
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
// WAITLIST.agc:262
//		DXCH	LST2 	+8D
// slot 3775
                    if slot <> 3775 or instruction <> 22289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:263
//		DXCH	LST2 	+10D	# AT END, CHECK THAT C(LST2 +10) IS STD
// slot 3776
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
// WAITLIST.agc:264
//		DXCH	LST2 	+12D
// slot 3777
                    if slot <> 3777 or instruction <> 22293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 789, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3778 {
// WAITLIST.agc:265
//		DXCH	LST2 	+14D
// slot 3778
                        if slot <> 3778 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:266
//		DXCH	LST2 	+16D
// slot 3779
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
// WAITLIST.agc:267
//		AD	ENDTASK		# END ITEM, AS CHECK FOR EXCEEDING
// slot 3780
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
// WAITLIST.agc:268
//					# THE LENGTH OF THE LIST.
// WAITLIST.agc:269
//		EXTEND			# DUMMY TASK ADRES SHOULD BE IN FIXED-
// slot 3781
                    if slot <> 3781 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3782 {
// WAITLIST.agc:270
//		BZF	LVWTLIST	# FIXED SO ITS ADRES ALONE DISTINGUISHES
// slot 3782
                    if slot <> 3782 or instruction <> 6797 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6797, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:271
//		TCF	WTABORT		# IT.
// slot 3783
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
// WAITLIST.agc:272
//
// WAITLIST.agc:273
//# Page 1124
// WAITLIST.agc:274
//WTLST5		CCS	A		# TEST TD - T2 + 1
// slot 3784
                    if slot <> 3784 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:275
//		AD	LST1 	+1
// slot 3785
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
// WAITLIST.agc:276
//		TCF	+4
// slot 3786
                    if slot <> 3786 or instruction <> 5838 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5838, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3787 {
// WAITLIST.agc:277
//		AD	ONE
// slot 3787
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
// WAITLIST.agc:278
//		TC	WTLST2
// slot 3788
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
// WAITLIST.agc:279
//		OCT	1
// slot 3789
    3789, 2
)).

// bank 01, slots 3790-3794
function agcAotUnit113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3791 {
        if slot <= 3790 {
// WAITLIST.agc:280
//
// WAITLIST.agc:281
// +4		CCS	A		# TEST TD - T3 + 1
// slot 3790
            if slot <> 3790 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:282
//		AD	LST1 	+2
// slot 3791
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
// WAITLIST.agc:283
//		TCF	+4
// slot 3792
            if slot <> 3792 or instruction <> 5844 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5844, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3793 {
// WAITLIST.agc:284
//		AD	ONE
// slot 3793
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
// WAITLIST.agc:285
//		TC	WTLST2
// slot 3794
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
// WAITLIST.agc:286
//		OCT	2
// slot 3795
    3795, 4
)).

// bank 01, slots 3796-3800
function agcAotUnit114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3797 {
        if slot <= 3796 {
// WAITLIST.agc:287
//
// WAITLIST.agc:288
// +4		CCS	A		# TEST TD - T4 + 1
// slot 3796
            if slot <> 3796 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:289
//		AD	LST1 	+3
// slot 3797
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
// WAITLIST.agc:290
//		TCF	+4
// slot 3798
            if slot <> 3798 or instruction <> 5850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5850, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3799 {
// WAITLIST.agc:291
//		AD	ONE
// slot 3799
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
// WAITLIST.agc:292
//		TC	WTLST2
// slot 3800
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
// WAITLIST.agc:293
//		OCT	3
// slot 3801
    3801, 6
)).

// bank 01, slots 3802-3806
function agcAotUnit115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3803 {
        if slot <= 3802 {
// WAITLIST.agc:294
//
// WAITLIST.agc:295
// +4		CCS	A		# TEST TD - T5 + 1
// slot 3802
            if slot <> 3802 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:296
//		AD	LST1 	+4
// slot 3803
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
// WAITLIST.agc:297
//		TCF	+4
// slot 3804
            if slot <> 3804 or instruction <> 5856 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5856, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3805 {
// WAITLIST.agc:298
//		AD	ONE
// slot 3805
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
// WAITLIST.agc:299
//		TC	WTLST2
// slot 3806
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
// WAITLIST.agc:300
//		OCT	4
// slot 3807
    3807, 8
)).

// bank 01, slots 3808-3812
function agcAotUnit116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3809 {
        if slot <= 3808 {
// WAITLIST.agc:301
//
// WAITLIST.agc:302
// +4		CCS	A		# TEST TD - T6 + 1
// slot 3808
            if slot <> 3808 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:303
//		AD	LST1 	+5
// slot 3809
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
// WAITLIST.agc:304
//		TCF	+4
// slot 3810
            if slot <> 3810 or instruction <> 5862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5862, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3811 {
// WAITLIST.agc:305
//		AD	ONE
// slot 3811
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
// WAITLIST.agc:306
//		TC	WTLST2
// slot 3812
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
// WAITLIST.agc:307
//		OCT	5
// slot 3813
    3813, 10
)).

// bank 01, slots 3814-3818
function agcAotUnit117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3815 {
        if slot <= 3814 {
// WAITLIST.agc:308
//
// WAITLIST.agc:309
// +4		CCS	A		# TEST TD - T7 + 1
// slot 3814
            if slot <> 3814 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:310
//		AD	LST1 	+6
// slot 3815
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
// WAITLIST.agc:311
//		TCF	+4
// slot 3816
            if slot <> 3816 or instruction <> 5868 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5868, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3817 {
// WAITLIST.agc:312
//		AD	ONE
// slot 3817
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
// WAITLIST.agc:313
//		TC	WTLST2
// slot 3818
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
// WAITLIST.agc:314
//		OCT	6
// slot 3819
    3819, 12
)).

// bank 01, slots 3820-3824
function agcAotUnit118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3821 {
        if slot <= 3820 {
// WAITLIST.agc:315
//
// WAITLIST.agc:316
//# Page 1125
// WAITLIST.agc:317
// +4		CCS	A		# TEST TD - T2 + 1
// slot 3820
            if slot <> 3820 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:318
//		AD	LST1 	+7
// slot 3821
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
// WAITLIST.agc:319
//		TCF	+4
// slot 3822
            if slot <> 3822 or instruction <> 5874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3823 {
// WAITLIST.agc:320
//		AD	ONE
// slot 3823
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
// WAITLIST.agc:321
//		TC	WTLST2
// slot 3824
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
// WAITLIST.agc:322
//		OCT	7
// slot 3825
    3825, 14
)).

// bank 01, slots 3826-3830
function agcAotUnit119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3827 {
        if slot <= 3826 {
// WAITLIST.agc:323
//
// WAITLIST.agc:324
// +4		CCS	A
// slot 3826
            if slot <> 3826 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:325
//WTABORT		TC	FILLED
// slot 3827
            if slot <> 3827 or instruction <> 1785 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1785, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3828 {
// WAITLIST.agc:326
//		NOOP			# CAN'T GET HERE
// slot 3828
            if slot <> 3828 or instruction <> 5877 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5877, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3829 {
// WAITLIST.agc:327
//		AD	ONE
// slot 3829
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
// WAITLIST.agc:328
//		TC	WTLST2
// slot 3830
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
// WAITLIST.agc:329
//		OCT	10
// slot 3831
    3831, 16,
// WAITLIST.agc:330
//
// WAITLIST.agc:331
//OCT40201	OCT	40201
// slot 3832
    3832, 33026
)).

// bank 01, slots 3833-3834
function agcAotUnit120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3833 {
// WAITLIST.agc:332
//
// WAITLIST.agc:333
//# Page 1126
// WAITLIST.agc:334
//FILLED		DXCH	WAITEXIT
// slot 3833
        if slot <> 3833 or instruction <> 21554 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:335
//		TC	BAILOUT1	# NO ROOM IN THE INN
// slot 3834
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
// WAITLIST.agc:336
//		OCT	01203
// slot 3835
    3835, 1286
)).

// bank 01, slots 3836-3837
function agcAotUnit121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3836 {
// WAITLIST.agc:337
//
// WAITLIST.agc:338
//# Page 1127
// WAITLIST.agc:339
//# THE ENTRY TC WTLST2 JUST PRECEDING OCT N IS FOR T  LE TD LE T   -1.
// WAITLIST.agc:340
//#                                                  N           N+1
// WAITLIST.agc:341
//# (LE MEANS LESS THAN OR EQUAL TO).  AT ENTRY, C(A) = -(TD - T   + 1)
// WAITLIST.agc:342
//#                                                             N+1
// WAITLIST.agc:343
//# THE LST1 ENTRY -(T   -T +1) IS TO BE REPLACED BY -(TD - T  + 1), AND
// WAITLIST.agc:344
//#                   N+1  N                                 N
// WAITLIST.agc:345
//# THE ENTRY -(T   - TD + 1) IS TO BE INSERTED IMMEDIATELY FOLLOWING.
// WAITLIST.agc:346
//#              N+1
// WAITLIST.agc:347
//
// WAITLIST.agc:348
//WTLST2		TS	WAITTEMP	# C(A) = -(TD - T + 1)
// slot 3836
        if slot <> 3836 or instruction <> 22580 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22580, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:349
//		INDEX	Q
// slot 3837
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
// WAITLIST.agc:350
//		CAF	0
// slot 3838
    3838, 24576
)).

// bank 01, slots 3839-3842
function agcAotUnit122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3840 {
        if slot <= 3839 {
// WAITLIST.agc:351
//		TS	Q		# INDEX VALUE INTO Q.
// slot 3839
            if slot <> 3839 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:352
//
// WAITLIST.agc:353
//		CAF	ONE
// slot 3840
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
// WAITLIST.agc:354
//		AD	WAITTEMP
// slot 3841
            if slot <> 3841 or instruction <> 24628 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 52).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:355
//		INDEX	Q		# C(A) = -(TD - T ) + 1.
// slot 3842
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
// WAITLIST.agc:356
//		ADS	LST1 	-1	#                N
// slot 3843
    3843, 24062
)).

// bank 01, slots 3844-3845
function agcAotUnit123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3844 {
// WAITLIST.agc:357
//
// WAITLIST.agc:358
//		CS	WAITTEMP
// slot 3844
        if slot <> 3844 or instruction <> 16436 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 52).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:359
//		INDEX	Q
// slot 3845
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
// WAITLIST.agc:360
//		TCF	WTLST4
// slot 3846
    3846, 11616
)).

// bank 01, slots 3847-3878
function agcAotUnit124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3862 {
        if slot <= 3854 {
            if slot <= 3850 {
                if slot <= 3848 {
                    if slot <= 3847 {
// WAITLIST.agc:361
//
// WAITLIST.agc:362
//# 	C(TIME3) 	=	1.0 - (T1 - T)
// WAITLIST.agc:363
//#
// WAITLIST.agc:364
//# 	C(LST1)		=	- (T2 - T1) + 1
// WAITLIST.agc:365
//# 	C(LST1+1)	=	- (T3 - T2) + 1
// WAITLIST.agc:366
//# 	C(LST1+2)	=	- (T4 - T3) + 1
// WAITLIST.agc:367
//#	C(LST1+3)	=	- (T5 - T4) + 1
// WAITLIST.agc:368
//# 	C(LST1+4)	=	- (T6 - T5) + 1
// WAITLIST.agc:369
//#
// WAITLIST.agc:370
//#	C(LST2)		=	2CADR TASK1
// WAITLIST.agc:371
//#	C(LST2+2)	=	2CADR TASK2
// WAITLIST.agc:372
//#	C(LST2+4)	=	2CADR TASK3
// WAITLIST.agc:373
//#	C(LST2+6)	=	2CADR TASK4
// WAITLIST.agc:374
//#	C(LST2+8)	=	2CADR TASK5
// WAITLIST.agc:375
//#	C(LST2+10)	=	2CADR TASK6
// WAITLIST.agc:376
//
// WAITLIST.agc:377
//# Page 1128
// WAITLIST.agc:378
//# ENTERS HERE ON T3 RUPT TO DISPATCH WAITLISTED TASK.
// WAITLIST.agc:379
//
// WAITLIST.agc:380
//T3RUPT		EXTEND
// slot 3847
                        if slot <> 3847 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:381
//		ROR	SUPERBNK	# READ CURRENT SUPERBANK VALUE AND
// slot 3848
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
// WAITLIST.agc:382
//		TS	BANKRUPT	# SAVE WITH E AND F BANK VALUES.
// slot 3849
                        if slot <> 3849 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:383
//		EXTEND
// slot 3850
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
// WAITLIST.agc:384
//		QXCH	QRUPT
// slot 3851
                        if slot <> 3851 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:385
//
// WAITLIST.agc:386
//T3RUPT2		CAF	NEG1/2		# DISPATCH WAITLIST TASK.
// slot 3852
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
// WAITLIST.agc:387
//		XCH	LST1 	+7
// slot 3853
                        if slot <> 3853 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:388
//		XCH	LST1 	+6
// slot 3854
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
// WAITLIST.agc:389
//		XCH	LST1 	+5
// slot 3855
                        if slot <> 3855 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:390
//		XCH	LST1 	+4	# 1. MOVE UP LST1 CONTENTS, ENTERING
// slot 3856
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
// WAITLIST.agc:391
//		XCH	LST1 	+3	#    A VALUE OF 1/2 +1 AT THE BOTTOM
// slot 3857
                        if slot <> 3857 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:392
//		XCH	LST1 	+2	#    FOR T6-T5, CORRESPONDING TO THE
// slot 3858
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
// WAITLIST.agc:393
//		XCH	LST1 	+1	#    INTERVAL 81.91 SEC FOR ENDTASK.
// slot 3859
                        if slot <> 3859 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:394
//		XCH	LST1
// slot 3860
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
// WAITLIST.agc:395
//		AD	POSMAX		# 2. SET T3 = 1.0 - T2 - T USING LIST 1.
// slot 3861
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
// WAITLIST.agc:396
//		ADS	TIME3		#    SO T3 WON'T TICK DURING UPDATE.
// slot 3862
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
// WAITLIST.agc:397
//		TS	RUPTAGN
// slot 3863
                        if slot <> 3863 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:398
//		CS	ZERO
// slot 3864
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
// WAITLIST.agc:399
//		TS	RUPTAGN		# SETS RUPTAGN TO +1 ON OVERFLOW.
// slot 3865
                        if slot <> 3865 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:400
//
// WAITLIST.agc:401
//		EXTEND			# DISPATCH TASK.
// slot 3866
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
// WAITLIST.agc:402
//		DCS	ENDTASK
// slot 3867
                        if slot <> 3867 or instruction <> 19103 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 2719, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:403
//		DXCH	LST2 	+16D
// slot 3868
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
// WAITLIST.agc:404
//		DXCH	LST2 	+14D
// slot 3869
                        if slot <> 3869 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:405
//		DXCH	LST2 	+12D
// slot 3870
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
// WAITLIST.agc:406
//		DXCH	LST2 	+10D
// slot 3871
                        if slot <> 3871 or instruction <> 22291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 787, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:407
//		DXCH	LST2 	+8D
// slot 3872
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
// WAITLIST.agc:408
//		DXCH	LST2 	+6
// slot 3873
                        if slot <> 3873 or instruction <> 22287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 783, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:409
//		DXCH	LST2 	+4
// slot 3874
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
// WAITLIST.agc:410
//		DXCH	LST2 	+2
// slot 3875
                        if slot <> 3875 or instruction <> 22283 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:411
//		DXCH	LST2
// slot 3876
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
// WAITLIST.agc:412
//
// WAITLIST.agc:413
//		XCH	L
// slot 3877
                        if slot <> 3877 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:414
//		EXTEND
// slot 3878
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

// bank 01, slots 3879-3881
function agcAotUnit125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3879 {
// WAITLIST.agc:415
//		WRITE 	SUPERBNK	# SET SUPERBANK FROM BBCON OF 2CADR
// slot 3879
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
// WAITLIST.agc:416
//		XCH	L		# RESTORE TO L FOR DXCH Z.
// slot 3880
            if slot <> 3880 or instruction <> 23553 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 1, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:417
//		DTCB
// slot 3881
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

// bank 02, slots 4785-4801
function agcAotUnit197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4792 {
        if slot <= 4788 {
            if slot <= 4786 {
                if slot <= 4785 {
// WAITLIST.agc:418
//
// WAITLIST.agc:419
//# Page 1129
// WAITLIST.agc:420
//# RETURN, AFTER EXECUTION OF T3 OVERFLOW TASK:
// WAITLIST.agc:421
//
// WAITLIST.agc:422
//		BLOCK	02
// WAITLIST.agc:423
//		COUNT*	$$/WAIT
// WAITLIST.agc:424
//TASKOVER	CCS	RUPTAGN		# IF +1 RETURN TO T3RUPT, IF -0 RESUME.
// slot 4785
                    if slot <> 4785 or instruction <> 4572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 476).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:425
//		CAF	WAITBB
// slot 4786
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
// WAITLIST.agc:426
//		TS	BBANK
// slot 4787
                    if slot <> 4787 or instruction <> 22534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:427
//		TCF	T3RUPT2		# DISPATCH NEXT TASK IF IT WAS DUE.
// slot 4788
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
// WAITLIST.agc:428
//
// WAITLIST.agc:429
//		CA	BANKRUPT
// slot 4789
                    if slot <> 4789 or instruction <> 12302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 14).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:430
//		EXTEND
// slot 4790
                    if slot <> 4790 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4791 {
// WAITLIST.agc:431
//		WRITE	SUPERBNK	# RESTORE SUPERBANK BEFORE RESUME IS DONE
// slot 4791
                    if slot <> 4791 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:432
//
// WAITLIST.agc:433
//RESUME		EXTEND
// slot 4792
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
// WAITLIST.agc:434
//		QXCH	QRUPT
// slot 4793
                    if slot <> 4793 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:435
//NOQRSM		CA	BANKRUPT
// slot 4794
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
// WAITLIST.agc:436
//		XCH	BBANK
// slot 4795
                    if slot <> 4795 or instruction <> 23558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 6, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:437
//NOQBRSM		DXCH	ARUPT
// slot 4796
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
// WAITLIST.agc:438
//		RELINT
// slot 4797
                    if slot <> 4797 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:439
//		RESUME
// slot 4798
                    if slot <> 4798 or instruction <> 20495 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20495, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4799 {
// WAITLIST.agc:440
//
// WAITLIST.agc:441
//# Page 1130
// WAITLIST.agc:442
//# LONGCALL
// WAITLIST.agc:443
//# PROGRAM DESCRIPTION				DATE -- 17 MARCH 1967
// WAITLIST.agc:444
//# PROGRAM WRITTEN BY W.H.VANDEVER		LOG SECTION WAITLIST
// WAITLIST.agc:445
//# MOD BY -- R. MELANSON TO ADD DOCUMENTATION	ASSEMBLY SUNDISK REV. 100
// WAITLIST.agc:446
//#
// WAITLIST.agc:447
//# FUNCTIONAL DESCRIPTION --
// WAITLIST.agc:448
//#	LONGCALL IS CALLED WITH THE DELTA TIME ARRIVING IN A,L SCALED AS TIME2,TIME1 WITH THE 2CADR OF THE TASK
// WAITLIST.agc:449
//#	IMMEDIATELY FOLLOWING THE TC LONGCALL.  FOR EXAMPLE, IT MIGHT BE DONE AS FOLLOWS WHERE TIMELOC IS THE NAME OF
// WAITLIST.agc:450
//# 	A DP REGISTER CONTAINING A DELTA TIME AND WHERE TASKTODO IS THE NAME OF THE LOCATION AT WHICH LONGCALL IS TO
// WAITLIST.agc:451
//# 	START.
// WAITLIST.agc:452
//# CALLING SEQUENCE --
// WAITLIST.agc:453
//#		EXTEND
// WAITLIST.agc:454
//#		DCA	TIMELOC
// WAITLIST.agc:455
//#		TC	LONGCALL
// WAITLIST.agc:456
//#		2CADR	TASKTODO
// WAITLIST.agc:457
//# NORMAL EXIT MODE --
// WAITLIST.agc:458
//#	1)	TC	WAITLIST
// WAITLIST.agc:459
//#	2)	DTCB	(TC L+3 OF CALLING ROUTINE 1ST PASS THRU LONGCYCL)
// WAITLIST.agc:460
//#	3)	DTCB	(TO TASKOVER ON SUBSEQUENT PASSES THRU LONGCYCL)
// WAITLIST.agc:461
//# ALARM OR ABORT EXIT MODE --
// WAITLIST.agc:462
//#	NONE
// WAITLIST.agc:463
//# OUTPUT --
// WAITLIST.agc:464
//#	LONGTIME AND LONGTIME+1 = DELTA TIME
// WAITLIST.agc:465
//#	LONGEXIT AND LONGEXIT+1 = RETURN 2CADR
// WAITLIST.agc:466
//#	LONGCADR AND LONGCADR+1 = TASK 2CADR
// WAITLIST.agc:467
//#	A = SINGLE PRECISION TIME FOR WAITLIST
// WAITLIST.agc:468
//# ERASABLE INITIALIZATION --
// WAITLIST.agc:469
//#	A = MOST SIGNIFICANT PART OF DELTA TIME
// WAITLIST.agc:470
//#	L = LEAST SIGNIFICANT PART OF DELTA TIME
// WAITLIST.agc:471
//#	Q = ADDRESS OF 2CADR TASK VALUE
// WAITLIST.agc:472
//# DEBRIS --
// WAITLIST.agc:473
//#	A,Q,L
// WAITLIST.agc:474
//#	LONGCADR AND LONGCADR+1
// WAITLIST.agc:475
//#	LONGEXIT AND LONGEXIT+1
// WAITLIST.agc:476
//#	LONGTIME AND LONGTIME+1
// WAITLIST.agc:477
//# *** THE FOLLOWING IS TO BE IN FIXED-FIXED AND UNSWITCHED ERRASIBLE **
// WAITLIST.agc:478
//
// WAITLIST.agc:479
//		BLOCK	02
// WAITLIST.agc:480
//		EBANK=	LST1
// WAITLIST.agc:481
//LONGCALL	DXCH	LONGTIME	# OBTAIN THE DELTA TIME
// slot 4799
                    if slot <> 4799 or instruction <> 22124 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 620, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4800 {
// WAITLIST.agc:482
//
// WAITLIST.agc:483
//		EXTEND			# OBTAIN THE 2CADR
// slot 4800
                        if slot <> 4800 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:484
//# Page 1131
// WAITLIST.agc:485
//		NDX	Q
// slot 4801
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
// WAITLIST.agc:486
//		DCA	0
// slot 4802
    4802, 24578
)).

// bank 02, slots 4803-4806
function agcAotUnit198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4804 {
        if slot <= 4803 {
// WAITLIST.agc:487
//		DXCH	LONGCADR
// slot 4803
            if slot <> 4803 or instruction <> 22120 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 616, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:488
//
// WAITLIST.agc:489
//		EXTEND			# NOW GO TO THE APPROPRIATE SWITCHED BANK
// slot 4804
            if slot <> 4804 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4805 {
// WAITLIST.agc:490
//		DCA	LGCL2CDR	# FOR THE REST OF LONGCALL
// slot 4805
            if slot <> 4805 or instruction <> 15048 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2760, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:491
//		DTCB
// slot 4806
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
// WAITLIST.agc:492
//
// WAITLIST.agc:493
//		EBANK=	LST1
// WAITLIST.agc:494
//LGCL2CDR	2CADR	LNGCALL2
// slot 4807 4808
    4807, 3668, 4808, 2150
)).

// bank 01, slots 3882-3902
function agcAotUnit126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3891 {
        if slot <= 3886 {
            if slot <= 3883 {
                if slot <= 3882 {
// WAITLIST.agc:495
//
// WAITLIST.agc:496
//# *** THE FOLLOWING MAY BE IN A SWITCHED BANK, INCLUDING ITS ERASABLE ***
// WAITLIST.agc:497
//
// WAITLIST.agc:498
//		BANK	01
// WAITLIST.agc:499
//		COUNT*	$$/WAIT
// WAITLIST.agc:500
//LNGCALL2	LXCH	LONGEXIT +1	# SAVE THE CORRECT BB FOR RETURN
// slot 3882
                    if slot <> 3882 or instruction <> 10013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 797, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:501
//		CA	TWO		# OBTAIN THE RETURN ADDRESS
// slot 3883
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
// WAITLIST.agc:502
//		ADS	Q
// slot 3884
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
// WAITLIST.agc:503
//		TS	LONGEXIT
// slot 3885
                        if slot <> 3885 or instruction <> 23324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23324, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:504
//
// WAITLIST.agc:505
//		CA	LONGTIME	# CHECK FOR LEGITIMATE DELTA-TIME
// slot 3886
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
// WAITLIST.agc:506
//		CCS	A
// slot 3887
                    if slot <> 3887 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:507
//		TCF	LONGCYCL	# HI-ORDER OK --> ALL IS OK.
// slot 3888
                    if slot <> 3888 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3889 {
// WAITLIST.agc:508
//		TCF	+2		# HI-ORDER ZERO --> CHECK LO-ORDER.
// slot 3889
                    if slot <> 3889 or instruction <> 5939 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5939, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3890 {
// WAITLIST.agc:509
//		TCF	LONGPOOH	# HI-ORDER NEG. --> NEG. DT
// slot 3890
                        if slot <> 3890 or instruction <> 5969 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5969, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:510
// +2		CA	LONGTIME +1	# CHECK LO-ORDER FOR ZERO OR NEGATIVE.
// slot 3891
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
// WAITLIST.agc:511
//		EXTEND
// slot 3892
                    if slot <> 3892 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:512
//		BZMF	LONGPOOH	# BAD DELTA-TIME.  ABORT
// slot 3893
                    if slot <> 3893 or instruction <> 26449 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3894 {
// WAITLIST.agc:513
//
// WAITLIST.agc:514
//# *** WAITLIST TASK LONGCYCL ***
// WAITLIST.agc:515
//
// WAITLIST.agc:516
//LONGCYCL	EXTEND			# CAN WE SUCCESFULLY TAKE ABOUT 1.25
// slot 3894
                    if slot <> 3894 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3895 {
// WAITLIST.agc:517
//		DCS	DPBIT14		# MINUTES OFF OF LONGTIME
// slot 3895
                        if slot <> 3895 or instruction <> 18240 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 1856, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:518
//		DAS	LONGTIME
// slot 3896
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
// WAITLIST.agc:519
//
// WAITLIST.agc:520
//		CCS	LONGTIME +1	# THE REASONING BEHIND THIS PART IS
// slot 3897
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
// WAITLIST.agc:521
//		TCF	MUCHTIME	# INVOLVED, TAKING INTO ACCOUNT THAT THE
// slot 3898
                        if slot <> 3898 or instruction <> 5961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5961, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:522
//					# WORDS MAY NOT BE SIGNED CORRECTED (DP
// WAITLIST.agc:523
//					# BASIC INSTRUCTIONS
// WAITLIST.agc:524
//					# DO NOT SIGN CORRECT) AND THAT WE SUBTRAC-
// WAITLIST.agc:525
//					# TED BIT14 (1 OVER HALF THE POS. VALUE
// WAITLIST.agc:526
//					# REPRESENTABLE IN SINGLE WORD)
// WAITLIST.agc:527
//		NOOP			# CAN'T GET HERE *************
// slot 3899
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
// WAITLIST.agc:528
//		TCF	+1
// slot 3900
                    if slot <> 3900 or instruction <> 5949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5949, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3901 {
// WAITLIST.agc:529
//		CCS	LONGTIME
// slot 3901
                        if slot <> 3901 or instruction <> 4715 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 619).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:530
//		TCF	MUCHTIME
// slot 3902
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
// WAITLIST.agc:531
//DPBIT14		OCT	00000
// slot 3903
    3903, 0,
// WAITLIST.agc:532
//		OCT	20000
// slot 3904
    3904, 16384
)).

// bank 01, slots 3905-3907
function agcAotUnit127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3905 {
// WAITLIST.agc:533
//
// WAITLIST.agc:534
//					# LONGCALL
// WAITLIST.agc:535
//# Page 1132
// WAITLIST.agc:536
//LASTTIME	CA	BIT14		# GET BACK THE CORRECT DELTA T FOR WAITLIST
// slot 3905
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
// WAITLIST.agc:537
//		ADS	LONGTIME +1
// slot 3906
            if slot <> 3906 or instruction <> 11884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 620).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:538
//		TC	WAITLIST
// slot 3907
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
// WAITLIST.agc:539
//		EBANK=	LST1
// WAITLIST.agc:540
//		2CADR	GETCADR		# THE ENTRY TO OUR LONGCADR
// slot 3908 3909
    3908, 3740, 3909, 2150
)).

// bank 01, slots 3910-3914
function agcAotUnit128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3911 {
        if slot <= 3910 {
// WAITLIST.agc:541
//
// WAITLIST.agc:542
//LONGRTRN	CA	TSKOVCDR	# SET IT UP SO THAT ONLY THE FIRST EXIT IS
// slot 3910
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
// WAITLIST.agc:543
//		DXCH	LONGEXIT	# TO THE CALLER OF LONGCALL
// slot 3911
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
// WAITLIST.agc:544
//		DTCB			# THE REST ARE TO TASKOVER
// slot 3912
            if slot <> 3912 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3913 {
// WAITLIST.agc:545
//
// WAITLIST.agc:546
//MUCHTIME	CA	BIT14		# WE HAVE OVER OUR ABOUT 1.25 MINUTES
// slot 3913
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
// WAITLIST.agc:547
//		TC	WAITLIST	# SO SET UP FOR ANOTHER CYCLE THROUGH HERE
// slot 3914
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
// WAITLIST.agc:548
//		EBANK=	LST1
// WAITLIST.agc:549
//		2CADR	LONGCYCL
// slot 3915 3916
    3915, 3692, 3916, 2150
)).

// bank 01, slots 3917-3919
function agcAotUnit129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3917 {
// WAITLIST.agc:550
//
// WAITLIST.agc:551
//		TCF	LONGRTRN	# NOW EXIT PROPERLY
// slot 3917
        if slot <> 3917 or instruction <> 5958 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5958, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3918 {
// WAITLIST.agc:552
//
// WAITLIST.agc:553
//# *** WAITLIST TASK GETCADR ***
// WAITLIST.agc:554
//
// WAITLIST.agc:555
//GETCADR		DXCH	LONGCADR	# GET THE LONGCALL THAT WE WISHED TO START
// slot 3918
            if slot <> 3918 or instruction <> 22120 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 616, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:556
//		DTCB			# AND TRANSFER CONTROL TO IT
// slot 3919
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
// WAITLIST.agc:557
//
// WAITLIST.agc:558
//TSKOVCDR	GENADR	TASKOVER
// slot 3920
    3920, 5474
)).

// bank 01, slots 3921-3924
function agcAotUnit130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3922 {
        if slot <= 3921 {
// WAITLIST.agc:559
//LONGPOOH	DXCH	LONGEXIT
// slot 3921
            if slot <> 3921 or instruction <> 22301 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 797, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:560
//		TCF	+2
// slot 3922
            if slot <> 3922 or instruction <> 5972 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5972, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3923 {
// WAITLIST.agc:561
//WAITPOOH	DXCH	WAITEXIT
// slot 3923
            if slot <> 3923 or instruction <> 21554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:562
// +2		TC	POODOO1
// slot 3924
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
// WAITLIST.agc:563
//		OCT	01204
// slot 3925
    3925, 1288
)).

// no code for the lines below
// WAITLIST.agc:564
//
