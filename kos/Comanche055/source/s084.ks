// WAITLIST.agc
// bank 02, slots 4765-4779
function agcAotUnit190 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4771 {
        if slot <= 4767 {
            if slot <= 4765 {
// WAITLIST.agc:1
//# Copyright:	Public domain.
// WAITLIST.agc:2
//# Filename:	WAITLIST.agc
// WAITLIST.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// WAITLIST.agc:4
//#		It is part of the source code for the Command Module's (CM)
// WAITLIST.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// WAITLIST.agc:6
//# Assembler:	yaYUL
// WAITLIST.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// WAITLIST.agc:8
//# Website:	www.ibiblio.org/apollo.
// WAITLIST.agc:9
//# Pages:	1221-1235
// WAITLIST.agc:10
//# Mod history:	2009-05-14 RSB	Adapted from the Colossus249/ file of the
// WAITLIST.agc:11
//#				same name, using Comanche055 page images.
// WAITLIST.agc:12
//#
// WAITLIST.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// WAITLIST.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// WAITLIST.agc:15
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// WAITLIST.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// WAITLIST.agc:17
//# consequent reduction in image quality as well) are available online at
// WAITLIST.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// WAITLIST.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// WAITLIST.agc:20
//# (much) higher-quality images which Fjeld Kerman actually created.
// WAITLIST.agc:21
//#
// WAITLIST.agc:22
//# Notations on the hardcopy document read, in part:
// WAITLIST.agc:23
//#
// WAITLIST.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// WAITLIST.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// WAITLIST.agc:26
//#
// WAITLIST.agc:27
//#	This AGC program shall also be referred to as
// WAITLIST.agc:28
//#			Colossus 2A
// WAITLIST.agc:29
//
// WAITLIST.agc:30
//# Page 1221
// WAITLIST.agc:31
//# PROGRAM DESCRIPTION						DATE - 10 OCTOBER 1966
// WAITLIST.agc:32
//# MOD NO - 2							LOG SECTION - WAITLIST
// WAITLIST.agc:33
//# MOD BY - MILLER KERMAN	(DTMAX INCREASED TO 162.5 SEC)		ASSEMBLY SUNBURST REV 5
// WAITLIST.agc:34
//# MOD 3 BY KERNAN KERMAN	(INHINT INSERTED AT WAITLIST) 2/28/68 SKIPPER REV 4
// WAITLIST.agc:35
//# MOD 4BY KERNAN KERMAN	(TWIDDLE IN 54) 3/28/68 SKIPPER REV 13.
// WAITLIST.agc:36
//#
// WAITLIST.agc:37
//# FUNCTIONAL DESCRIPTION-
// WAITLIST.agc:38
//#	PART OF A SECTION OF PROGRAMS,-WAITLIST, TASKOVER, T3RUPT, USED TO CALL A PROGRAM, (CALLED A TASK),
// WAITLIST.agc:39
//#	WHICH IS TO BEGIN IN C(A) CENTISECONDS.  WAITLIST UPDATES TIME3, LST1 AND LST2. THE MEANING OF THESE LISTS
// WAITLIST.agc:40
//#	FOLLOW.
// WAITLIST.agc:41
//#
// WAITLIST.agc:42
//#		C(TIME3) = 16384 -(T1-T) CENTISECONDS, (T=PRESENT TIME, T1-TIME FOR TASK1)
// WAITLIST.agc:43
//#
// WAITLIST.agc:44
//#			C(LST1)		=	-(T2-T1)+1
// WAITLIST.agc:45
//#			C(LST1 +1)	=	-(T3-T2)+1
// WAITLIST.agc:46
//#			C(LST1 +2)	=	-(T4-T3)+1
// WAITLIST.agc:47
//#				       ...
// WAITLIST.agc:48
//#			C(LST1 +6)	=	-(T8-T7)+1
// WAITLIST.agc:49
//#			C(LST1 +7)	=	-(T9-T8)+1
// WAITLIST.agc:50
//#
// WAITLIST.agc:51
//#			C(LST2)		=	2CADR OF TASK1
// WAITLIST.agc:52
//#			C(LST2 +2)	=	2CADR OF TASK2
// WAITLIST.agc:53
//#				       ...
// WAITLIST.agc:54
//#			C(LST2 +14)	=	2CADR OF TASK8
// WAITLIST.agc:55
//#			C(LST2 +16)	=	2CADR OF TASK9
// WAITLIST.agc:56
//#
// WAITLIST.agc:57
//# WARNINGS-
// WAITLIST.agc:58
//# --------
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
//# CALLING SEQUENCE-
// WAITLIST.agc:65
//#
// WAITLIST.agc:66
//#	L-1	CA	DELTAT 	(TIME IN CENTISECONDS TO TASK START)
// WAITLIST.agc:67
//#	L	TC	WAITLIST
// WAITLIST.agc:68
//#	L+1	2CADR	DESIRED TASK
// WAITLIST.agc:69
//#	L+2	(MINOR OF 2CADR)
// WAITLIST.agc:70
//#	L+3	RELINT		(RETURNS HERE)
// WAITLIST.agc:71
//#
// WAITLIST.agc:72
//# TWIDDLE-
// WAITLIST.agc:73
//# -------
// WAITLIST.agc:74
//#	TWIDDLE IS FOR USE WHEN THE TASK BEING SET UP IS IN THE SAME EBANK AND FBANK AS THE USER.  IN
// WAITLIST.agc:75
//#	SUCH CASES, IT IMPROVES UPON WAITLIST BY ELIMINATING THE NEED FOR THE BBCON HALF OF THE 2CADR,
// WAITLIST.agc:76
//# Page 1222
// WAITLIST.agc:77
//#	SAVING A WORD.  TWIDDLE IS LIKE WAITLIST IN EVERY RESPECT EXCEPT CALLING SEQUENCE, TO WIT-
// WAITLIST.agc:78
//#
// WAITLIST.agc:79
//#		L-1	CA	DELTAT
// WAITLIST.agc:80
//#		L	TC	TWIDDLE
// WAITLIST.agc:81
//#		L+1	ADRES	DESIRED TASK
// WAITLIST.agc:82
//#		L+2	RELINT		(RETURNS HERE)
// WAITLIST.agc:83
//#
// WAITLIST.agc:84
//# NORMAL EXIT MODES-
// WAITLIST.agc:85
//#
// WAITLIST.agc:86
//#	AT L+3 OF CALLING SEQUENCE
// WAITLIST.agc:87
//#
// WAITLIST.agc:88
//# ALARM OR ABORT EXIT MODES-
// WAITLIST.agc:89
//#
// WAITLIST.agc:90
//#	TC	ABORT
// WAITLIST.agc:91
//#	OCT	1203	(WAITLIST OVERFLOW - TOO MANY TASKS)
// WAITLIST.agc:92
//#
// WAITLIST.agc:93
//# ERASABLE INITIALIZATION REQUIRED-
// WAITLIST.agc:94
//#
// WAITLIST.agc:95
//#	ACCOMPLISHED BY FRESH START,--	LST2,..., LST2 +16 =ENDTASK
// WAITLIST.agc:96
//#					LST1,..., LST1 +7  =NEG1/2
// WAITLIST.agc:97
//#
// WAITLIST.agc:98
//# OUTPUT--
// WAITLIST.agc:99
//#
// WAITLIST.agc:100
//#	LST1 AND LST2 UPDATED WITH NEW TASK AND ASSOCIATED TIME.
// WAITLIST.agc:101
//# DEBRIS-
// WAITLIST.agc:102
//#	CENTRALS- A,Q,L
// WAITLIST.agc:103
//#	OTHER   - WAITEXIT, WAITADR, WAITTEMP, WAITBANK
// WAITLIST.agc:104
//# DETAILED ANALYSIS OF TIMING-
// WAITLIST.agc:105
//#
// WAITLIST.agc:106
//#	CONTROL WILL NOT BE RETURNED TO THE SPECIFIED ADDRESS (2CADR) IN EXACTLY DELTA T CENTISECONDS.
// WAITLIST.agc:107
//#	THE APPROXIMATE TIME MAY BE CALCULATED AS FOLLOWS
// WAITLIST.agc:108
//#
// WAITLIST.agc:109
//#		LET T0 = THE TIME OF THE TC WAITLIST
// WAITLIST.agc:110
//#		LET TS = T0 +147U + COUNTER INCREMENTS (SET UP TIME)
// WAITLIST.agc:111
//#		LET X  = TS -(100TS)/100  (VARIANCE FROM COUNTERS)
// WAITLIST.agc:112
//#		LET Y  = LENGTH OF TIME OF INHIBIT INTERRUPT AFTER T3RUPT
// WAITLIST.agc:113
//#		LET Z  = LENGTH OF TIME TO PROCESS TASKS WHICH ARE DUE THIS T3RUPT BUT DISPATCHED EARLIER.
// WAITLIST.agc:114
//#	(Z=0, USUALLY)
// WAITLIST.agc:115
//#		LET DELTD = THE ACTUAL TIME TAKEN TO GIVE CONTROL TO 2CADR
// WAITLIST.agc:116
//#	       THEN DELTD = TS+DELTA T -X +Y +Z +1.05MS* +COUNTERS*
// WAITLIST.agc:117
//#	*THE TIME TAKEN BY WAITLIST ITSELF AND THE COUNTER TICKING DURING THIS WAITLIST TIME.
// WAITLIST.agc:118
//#
// WAITLIST.agc:119
//#	IN SHORT, THE ACTUAL TIME TO RETURN CONTROL TO A 2CADR IS AUGMENTED BY THE TIME TO SET UP THE TASK'S
// WAITLIST.agc:120
//# 	INTERRUPT, ALL COUNTERS TICKING, THE T3RUPT PROCESSING TIME, THE WAITLIST PROCESSING TIME AND THE POSSIBILITY
// WAITLIST.agc:121
//#	OF OTHER TASKS INHIBITING THE INTERRUPT.
// WAITLIST.agc:122
//
// WAITLIST.agc:123
//		BLOCK	02
// WAITLIST.agc:124
//# Page 1223
// WAITLIST.agc:125
//		EBANK=	LST1		# TASK LISTS IN SWITCHED E BANK.
// WAITLIST.agc:126
//
// WAITLIST.agc:127
//		COUNT	02/WAIT
// WAITLIST.agc:128
//
// WAITLIST.agc:129
//TWIDDLE		INHINT
// slot 4765
                if slot <> 4765 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4766 {
// WAITLIST.agc:130
//		TS	L		# SAVE DELAY TIME IN L
// slot 4766
                    if slot <> 4766 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:131
//		CA	POSMAX
// slot 4767
                    if slot <> 4767 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4769 {
                if slot <= 4768 {
// WAITLIST.agc:132
//		ADS	Q		# CREATING OVERFLOW AND Q-1 IN Q
// slot 4768
                    if slot <> 4768 or instruction <> 11266 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:133
//		CA	BBANK
// slot 4769
                    if slot <> 4769 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4770 {
// WAITLIST.agc:134
//		EXTEND
// slot 4770
                    if slot <> 4770 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:135
//		ROR	SUPERBNK
// slot 4771
                    if slot <> 4771 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4775 {
            if slot <= 4773 {
                if slot <= 4772 {
// WAITLIST.agc:136
//		XCH	L
// slot 4772
                    if slot <> 4772 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:137
//
// WAITLIST.agc:138
//WAITLIST	INHINT
// slot 4773
                    if slot <> 4773 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4774 {
// WAITLIST.agc:139
//		EXTEND
// slot 4774
                    if slot <> 4774 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:140
//		BZMF	WATLST0-
// slot 4775
                    if slot <> 4775 or instruction <> 27313 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 27313, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4777 {
                if slot <= 4776 {
// WAITLIST.agc:141
//		XCH	Q		# SAVE DELTA T IN Q AND RETURN IN
// slot 4776
                    if slot <> 4776 or instruction <> 23554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 2, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:142
//		TS	WAITEXIT	# WAITEXIT.
// slot 4777
                    if slot <> 4777 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4778 {
// WAITLIST.agc:143
//		EXTEND
// slot 4778
                    if slot <> 4778 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:144
//		INDEX	WAITEXIT	# IF TWIDDLING, THE TS SKIPS TO HERE
// slot 4779
                    if slot <> 4779 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
// WAITLIST.agc:145
//		DCA	0		# PICK UP 2CADR OF TASK.
// slot 4780
    4780, 24578
)).

// bank 02, slots 4781-4785
function agcAotUnit191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4782 {
        if slot <= 4781 {
// WAITLIST.agc:146
//	-1	TS	WAITADR		# BBCON WILL REMAIN IN L
// slot 4781
            if slot <> 4781 or instruction <> 22579 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22579, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:147
//DLY2		CAF	WAITBB		# ENTRY FROM FIXDELAY AND VARDELAY.
// slot 4782
            if slot <> 4782 or instruction <> 15030 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2742), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4783 {
// WAITLIST.agc:148
//		XCH	BBANK
// slot 4783
            if slot <> 4783 or instruction <> 23558 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 6, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4784 {
// WAITLIST.agc:149
//		TCF	WAIT2
// slot 4784
                if slot <> 4784 or instruction <> 5798 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5798, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:150
//
// WAITLIST.agc:151
//WATLST0-	TC	POODOO
// slot 4785
                if slot <> 4785 or instruction <> 3025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3025, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[191] to agcAotUnit191@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:152
//		OCT	1204		# WAITLIST CALL WITH ZERO OR NEG DT
// slot 4786
    4786, 1288
)).

// bank 02, slots 4787-4789
function agcAotUnit192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4787 {
// WAITLIST.agc:153
//
// WAITLIST.agc:154
//# RETURN TO CALLER AFTER TASK INSERTION:
// WAITLIST.agc:155
//
// WAITLIST.agc:156
//LVWTLIST	DXCH	WAITEXIT
// slot 4787
        if slot <> 4787 or instruction <> 21554 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 4788 {
// WAITLIST.agc:157
//		AD	TWO
// slot 4788
            if slot <> 4788 or instruction <> 27150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:158
//		DTCB
// slot 4789
            if slot <> 4789 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[192] to agcAotUnit192@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:159
//
// WAITLIST.agc:160
//		EBANK=	LST1
// WAITLIST.agc:161
//WAITBB		BBCON	WAIT2
// slot 4790
    4790, 2150
)).

// bank 02, slots 4791-4791
function agcAotUnit193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:162
//
// WAITLIST.agc:163
//# RETURN TO CALLER +2 AFTER WAITING DT SPECIFIED AT CALLER +1.
// WAITLIST.agc:164
//
// WAITLIST.agc:165
//FIXDELAY	INDEX	Q		# BOTH ROUTINES MUST BE CALLED UNDER
// slot 4791
    if slot <> 4791 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[193] to agcAotUnit193@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:166
//		CAF	0		# WAITLIST CONTROL AND TERMINATE THE TASK
// slot 4792
    4792, 24576
)).

// bank 02, slots 4793-4803
function agcAotUnit194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4797 {
        if slot <= 4794 {
            if slot <= 4793 {
// WAITLIST.agc:167
//		INCR	Q		# IN WHICH THEY WERE CALLED.
// slot 4793
                if slot <> 4793 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:168
//
// WAITLIST.agc:169
//# RETURN TO CALLER +1 AFTER WAITING THE DT AS ARRIVING IN A.
// WAITLIST.agc:170
//
// WAITLIST.agc:171
//VARDELAY	XCH	Q		# DT TO Q.  TASK ADRES TO WAITADR.
// slot 4794
                if slot <> 4794 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4795 {
// WAITLIST.agc:172
//		TS	WAITADR
// slot 4795
                if slot <> 4795 or instruction <> 22579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4796 {
// WAITLIST.agc:173
//		CA	BBANK		# BBANK IS SAVED DURING DELAY.
// slot 4796
                    if slot <> 4796 or instruction <> 12294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 6).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:174
//		EXTEND
// slot 4797
                    if slot <> 4797 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4800 {
            if slot <= 4798 {
// WAITLIST.agc:175
//# Page 1224
// WAITLIST.agc:176
//		ROR	SUPERBNK	# ADD SBANK TO BBCON.
// slot 4798
                if slot <> 4798 or instruction <> 2055 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4799 {
// WAITLIST.agc:177
//		TS	L
// slot 4799
                    if slot <> 4799 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:178
//		CAF	DELAYEX
// slot 4800
                    if slot <> 4800 or instruction <> 15043 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2755), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4801 {
// WAITLIST.agc:179
//		TS	WAITEXIT	# GO TO TASKOVER AFTER TASK ENTRY.
// slot 4801
                if slot <> 4801 or instruction <> 22577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4802 {
// WAITLIST.agc:180
//		TCF	DLY2
// slot 4802
                    if slot <> 4802 or instruction <> 6830 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6830, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:181
//
// WAITLIST.agc:182
//DELAYEX		TCF	TASKOVER -2	# RETURNS TO TASKOVER
// slot 4803
                    if slot <> 4803 or instruction <> 6866 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6866, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[194] to agcAotUnit194@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:183
//
// WAITLIST.agc:184
//# Page 1225
// WAITLIST.agc:185
//# ENDTASK MUST ENTERED IN FIXED-FIXED SO IT IS DISTINGUISHABLE BY ITS ADRES ALONE.
// WAITLIST.agc:186
//
// WAITLIST.agc:187
//		EBANK=	LST1
// WAITLIST.agc:188
//ENDTASK		-2CADR	SVCT3
// slot 4804 4805
    4804, 60018, 4805, 61336
)).

// bank 02, slots 4806-4816
function agcAotUnit195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4810 {
        if slot <= 4807 {
            if slot <= 4806 {
// WAITLIST.agc:189
//
// WAITLIST.agc:190
//
// WAITLIST.agc:191
//SVCT3		CCS	FLAGWRD2	# DRIFT FLAG
// slot 4806
                if slot <> 4806 or instruction <> 4158 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 62).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:192
//		TCF	TASKOVER
// slot 4807
                if slot <> 4807 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4808 {
// WAITLIST.agc:193
//		TCF	TASKOVER
// slot 4808
                if slot <> 4808 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4809 {
// WAITLIST.agc:194
//		TCF	+1
// slot 4809
                    if slot <> 4809 or instruction <> 6858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6858, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:195
//
// WAITLIST.agc:196
//		CCS	IMUCADR		# DON'T DO NBDONLY IF SOMEONE ELSE IS IN
// slot 4810
                    if slot <> 4810 or instruction <> 4818 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 722).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4813 {
            if slot <= 4811 {
// WAITLIST.agc:197
//		TCF	SVCT3X
// slot 4811
                if slot <> 4811 or instruction <> 8143 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8143, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4812 {
// WAITLIST.agc:198
//		TCF	+3
// slot 4812
                    if slot <> 4812 or instruction <> 6863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:199
//		TCF	SVCT3X
// slot 4813
                    if slot <> 4813 or instruction <> 8143 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 8143, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4814 {
// WAITLIST.agc:200
//		TCF	SVCT3X
// slot 4814
                if slot <> 4814 or instruction <> 8143 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8143, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4815 {
// WAITLIST.agc:201
//	+3	CAF	PRIO35		# COMPENSATE FOR NBD COEFFICIENTS ONLY.
// slot 4815
                    if slot <> 4815 or instruction <> 16314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4026), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:202
//		TC	NOVAC		#	ENABLE EVERY 81.93 SECONDS
// slot 4816
                    if slot <> 4816 or instruction <> 2652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2652, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[195] to agcAotUnit195@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:203
//		EBANK=	NBDX
// WAITLIST.agc:204
//		2CADR	NBDONLY
// slot 4817 4818
    4817, 3780, 4818, 12390
)).

// bank 02, slots 4819-4819
function agcAotUnit196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:205
//
// WAITLIST.agc:206
//		TCF	TASKOVER
// slot 4819
    if slot <> 4819 or instruction <> 6868 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6868, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[196] to agcAotUnit196@.

// bank 03, slots 6095-6095
function agcAotUnit346 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:207
//
// WAITLIST.agc:208
//		SETLOC	FFTAG6
// WAITLIST.agc:209
//		BANK
// WAITLIST.agc:210
//
// WAITLIST.agc:211
//SVCT3X		TC	FIXDELAY	# DELAY MAX OF 2 TIMES FOR IMU ZERO
// slot 6095
    if slot <> 6095 or instruction <> 2743 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2743, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[346] to agcAotUnit346@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:212
//		DEC	500
// slot 6096
    6096, 1000
)).

// bank 03, slots 6097-6097
function agcAotUnit347 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// WAITLIST.agc:213
//		TC	SVCT3		# CHECK DRIFT FLAG AGAIN
// slot 6097
    if slot <> 6097 or instruction <> 2758 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2758, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[347] to agcAotUnit347@.

// bank 01, slots 3750-3779
function agcAotUnit104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3764 {
        if slot <= 3756 {
            if slot <= 3752 {
                if slot <= 3750 {
// WAITLIST.agc:214
//
// WAITLIST.agc:215
//# Page 1226
// WAITLIST.agc:216
//# BEGIN TASK INSERTION.
// WAITLIST.agc:217
//
// WAITLIST.agc:218
//		BANK	01
// WAITLIST.agc:219
//		COUNT	01/WAIT
// WAITLIST.agc:220
//
// WAITLIST.agc:221
//WAIT2		TS	WAITBANK	# BBANK OF CALLING PROGRAM.
// slot 3750
                    if slot <> 3750 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3751 {
// WAITLIST.agc:222
//		CS	TIME3
// slot 3751
                        if slot <> 3751 or instruction <> 16406 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 22).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:223
//		AD	BIT8		# BIT 8 = OCT 200
// slot 3752
                        if slot <> 3752 or instruction <> 27144 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3754 {
                    if slot <= 3753 {
// WAITLIST.agc:224
//		CCS	A		# TEST 200 - C(TIME3).  IF POSITIVE,
// slot 3753
                        if slot <> 3753 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:225
//					# IT MEANS THAT TIME3 OVERFLOW HAS OCCURRED PRIOR TO CS TIME3 AND THAT
// WAITLIST.agc:226
//					# C(TIME3) = T - T1, INSTEAD OF 1.0 - (T1 - T).  THE FOLLOWING FOUR
// WAITLIST.agc:227
//					# ORDERS SET C(A) = TD - T1 + 1 IN EITHER CASE.
// WAITLIST.agc:228
//
// WAITLIST.agc:229
//		AD	OCT40001	# OVERFLOW HAS OCCURRED.  SET C(A) =
// slot 3754
                        if slot <> 3754 or instruction <> 27694 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 3118), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3755 {
// WAITLIST.agc:230
//		CS	A		# T - T1 + 1.0 - 201
// slot 3755
                        if slot <> 3755 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:231
//
// WAITLIST.agc:232
//# NORMAL CASE (C(A) NNZ) YIELDS SAME C(A):  -( -(1.0-(T1-T)) + 200) - 1
// WAITLIST.agc:233
//
// WAITLIST.agc:234
//		AD	OCT40201
// slot 3756
                        if slot <> 3756 or instruction <> 26370 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1794), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3760 {
                if slot <= 3758 {
                    if slot <= 3757 {
// WAITLIST.agc:235
//		AD	Q		# RESULT = TD - T1 + 1.
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
// WAITLIST.agc:236
//
// WAITLIST.agc:237
//		CCS	A		# TEST TD - T1 + 1
// slot 3758
                        if slot <> 3758 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3759 {
// WAITLIST.agc:238
//
// WAITLIST.agc:239
//		AD	LST1		# IF TD - T1 POS, GO TO WTLST5 WITH
// slot 3759
                        if slot <> 3759 or instruction <> 25344 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 768).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:240
//		TCF	WTLST5		# C(A) = (TD - T1) + C(LST1) = TD-T2+1
// slot 3760
                        if slot <> 3760 or instruction <> 5842 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5842, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3762 {
                    if slot <= 3761 {
// WAITLIST.agc:241
//
// WAITLIST.agc:242
//		NOOP
// slot 3761
                        if slot <> 3761 or instruction <> 5810 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5810, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:243
//		CS	Q
// slot 3762
                        if slot <> 3762 or instruction <> 16386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 2).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3763 {
// WAITLIST.agc:244
//
// WAITLIST.agc:245
//# NOTE THAT THIS PROGRAM SECTION IS NEVER ENTERED WHEN T-T1 G/E -1,
// WAITLIST.agc:246
//# SINCE TD-T1+1 = (TD-T) + (T-T1+1), AND DELTA T = TD-T G/E +1.  (G/E
// WAITLIST.agc:247
//# SYMBOL MEANS GREATER THAN OR EQUAL TO).  THUS THERE NEED BE NO CON-
// WAITLIST.agc:248
//# CERN OVER A PREVIOUS OR IMMINENT OVERFLOW OF TIME3 HERE.
// WAITLIST.agc:249
//
// WAITLIST.agc:250
//		AD	POS1/2		# WHEN TD IS NEXT, FORM QUANTITY
// slot 3763
                        if slot <> 3763 or instruction <> 27138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:251
//		AD	POS1/2		#	1.0 - DELTA T = 1.0 - (TD - T)
// slot 3764
                        if slot <> 3764 or instruction <> 27138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3771 {
            if slot <= 3767 {
                if slot <= 3765 {
// WAITLIST.agc:252
//		XCH	TIME3
// slot 3765
                    if slot <> 3765 or instruction <> 23574 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 22, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3766 {
// WAITLIST.agc:253
//		AD	NEGMAX
// slot 3766
                        if slot <> 3766 or instruction <> 27137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:254
//		AD	Q		# 1.0 - DELTAT T NOW COMPLETE.
// slot 3767
                        if slot <> 3767 or instruction <> 24578 { return choose false if checkOnly else -1. }
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
                if slot <= 3769 {
                    if slot <= 3768 {
// WAITLIST.agc:255
//		EXTEND			# ZERO INDEX Q.
// slot 3768
                        if slot <> 3768 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:256
//		QXCH	7		# (ZQ)
// slot 3769
                        if slot <> 3769 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3770 {
// WAITLIST.agc:257
//
// WAITLIST.agc:258
//# Page 1227
// WAITLIST.agc:259
//WTLST4		XCH	LST1
// slot 3770
                        if slot <> 3770 or instruction <> 24320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 768, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:260
//		XCH	LST1 	+1
// slot 3771
                        if slot <> 3771 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3775 {
                if slot <= 3773 {
                    if slot <= 3772 {
// WAITLIST.agc:261
//		XCH	LST1 	+2
// slot 3772
                        if slot <> 3772 or instruction <> 24322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 770, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:262
//		XCH	LST1 	+3
// slot 3773
                        if slot <> 3773 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3774 {
// WAITLIST.agc:263
//		XCH	LST1 	+4
// slot 3774
                        if slot <> 3774 or instruction <> 24324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 772, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:264
//		XCH	LST1 	+5
// slot 3775
                        if slot <> 3775 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3777 {
                    if slot <= 3776 {
// WAITLIST.agc:265
//		XCH	LST1 	+6
// slot 3776
                        if slot <> 3776 or instruction <> 24326 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 774, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:266
//		XCH	LST1 	+7
// slot 3777
                        if slot <> 3777 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3778 {
// WAITLIST.agc:267
//
// WAITLIST.agc:268
//		CA	WAITADR		# (MINOR PART OF TASK CADR HAS BEEN IN L.)
// slot 3778
                        if slot <> 3778 or instruction <> 12339 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 51).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:269
//		INDEX	Q
// slot 3779
                        if slot <> 3779 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[104] to agcAotUnit104@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:270
//		TCF	+1
// slot 3780
    3780, 11658
)).

// bank 01, slots 3781-3798
function agcAotUnit105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3789 {
        if slot <= 3784 {
            if slot <= 3782 {
                if slot <= 3781 {
// WAITLIST.agc:271
//
// WAITLIST.agc:272
//		DXCH	LST2
// slot 3781
                    if slot <> 3781 or instruction <> 22281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 777, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:273
//		DXCH	LST2 	+2
// slot 3782
                    if slot <> 3782 or instruction <> 22283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3783 {
// WAITLIST.agc:274
//		DXCH	LST2 	+4
// slot 3783
                    if slot <> 3783 or instruction <> 22285 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 781, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:275
//		DXCH	LST2 	+6
// slot 3784
                    if slot <> 3784 or instruction <> 22287 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 783, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3786 {
                if slot <= 3785 {
// WAITLIST.agc:276
//		DXCH	LST2 	+8D
// slot 3785
                    if slot <> 3785 or instruction <> 22289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:277
//		DXCH	LST2 	+10D	# AT END, CHECK THAT C(LST2 +10) IS STD
// slot 3786
                    if slot <> 3786 or instruction <> 22291 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 787, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3787 {
// WAITLIST.agc:278
//		DXCH	LST2 	+12D
// slot 3787
                    if slot <> 3787 or instruction <> 22293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 789, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3788 {
// WAITLIST.agc:279
//		DXCH	LST2 	+14D
// slot 3788
                        if slot <> 3788 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:280
//		DXCH	LST2 	+16D
// slot 3789
                        if slot <> 3789 or instruction <> 22297 { return choose false if checkOnly else -1. }
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
        if slot <= 3793 {
            if slot <= 3791 {
                if slot <= 3790 {
// WAITLIST.agc:281
//		AD	ENDTASK		# END ITEM, AS CHECK FOR EXCEEDING
// slot 3790
                    if slot <> 3790 or instruction <> 27332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2756), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:282
//					# THE LENGTH OF THE LIST.
// WAITLIST.agc:283
//		EXTEND			# DUMMY TASK ADRES SHOULD BE IN FIXED-
// slot 3791
                    if slot <> 3791 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3792 {
// WAITLIST.agc:284
//		BZF	LVWTLIST	# FIXED SO ITS ADRES ALONE DISTINGUISHES
// slot 3792
                    if slot <> 3792 or instruction <> 6835 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6835, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:285
//		TCF	WTABORT		# IT.
// slot 3793
                    if slot <> 3793 or instruction <> 5885 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5885, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 3795 {
                if slot <= 3794 {
// WAITLIST.agc:286
//
// WAITLIST.agc:287
//# Page 1228
// WAITLIST.agc:288
//WTLST5		CCS	A		# TEST TD - T2 + 1
// slot 3794
                    if slot <> 3794 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:289
//		AD	LST1 +1
// slot 3795
                    if slot <> 3795 or instruction <> 25345 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 769).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3796 {
// WAITLIST.agc:290
//		TCF	+4
// slot 3796
                    if slot <> 3796 or instruction <> 5848 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5848, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3797 {
// WAITLIST.agc:291
//		AD	ONE
// slot 3797
                        if slot <> 3797 or instruction <> 27151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:292
//		TC	WTLST2
// slot 3798
                        if slot <> 3798 or instruction <> 1795 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1795, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[105] to agcAotUnit105@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:293
//		OCT	1
// slot 3799
    3799, 2
)).

// bank 01, slots 3800-3804
function agcAotUnit106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3801 {
        if slot <= 3800 {
// WAITLIST.agc:294
//
// WAITLIST.agc:295
//	+4	CCS	A		# TEST TD - T3 + 1
// slot 3800
            if slot <> 3800 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:296
//		AD	LST1 +2
// slot 3801
            if slot <> 3801 or instruction <> 25346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 770).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3802 {
// WAITLIST.agc:297
//		TCF	+4
// slot 3802
            if slot <> 3802 or instruction <> 5854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5854, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3803 {
// WAITLIST.agc:298
//		AD	ONE
// slot 3803
                if slot <> 3803 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:299
//		TC	WTLST2
// slot 3804
                if slot <> 3804 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[106] to agcAotUnit106@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:300
//		OCT	2
// slot 3805
    3805, 4
)).

// bank 01, slots 3806-3810
function agcAotUnit107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3807 {
        if slot <= 3806 {
// WAITLIST.agc:301
//
// WAITLIST.agc:302
//	+4	CCS	A		# TEST TD - T4 + 1
// slot 3806
            if slot <> 3806 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:303
//		AD	LST1 +3
// slot 3807
            if slot <> 3807 or instruction <> 25347 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 771).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3808 {
// WAITLIST.agc:304
//		TCF	+4
// slot 3808
            if slot <> 3808 or instruction <> 5860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5860, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3809 {
// WAITLIST.agc:305
//		AD	ONE
// slot 3809
                if slot <> 3809 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:306
//		TC	WTLST2
// slot 3810
                if slot <> 3810 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[107] to agcAotUnit107@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:307
//		OCT	3
// slot 3811
    3811, 6
)).

// bank 01, slots 3812-3816
function agcAotUnit108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3813 {
        if slot <= 3812 {
// WAITLIST.agc:308
//
// WAITLIST.agc:309
//	+4	CCS	A		# TEST TD - T5 + 1
// slot 3812
            if slot <> 3812 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:310
//		AD	LST1 +4
// slot 3813
            if slot <> 3813 or instruction <> 25348 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 772).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3814 {
// WAITLIST.agc:311
//		TCF	+4
// slot 3814
            if slot <> 3814 or instruction <> 5866 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5866, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3815 {
// WAITLIST.agc:312
//		AD	ONE
// slot 3815
                if slot <> 3815 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:313
//		TC	WTLST2
// slot 3816
                if slot <> 3816 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[108] to agcAotUnit108@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:314
//		OCT	4
// slot 3817
    3817, 8
)).

// bank 01, slots 3818-3822
function agcAotUnit109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3819 {
        if slot <= 3818 {
// WAITLIST.agc:315
//
// WAITLIST.agc:316
//	+4	CCS	A		# TEST TD - T6 + 1
// slot 3818
            if slot <> 3818 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:317
//		AD	LST1 +5
// slot 3819
            if slot <> 3819 or instruction <> 25349 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 773).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3820 {
// WAITLIST.agc:318
//		TCF	+4
// slot 3820
            if slot <> 3820 or instruction <> 5872 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5872, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3821 {
// WAITLIST.agc:319
//		AD	ONE
// slot 3821
                if slot <> 3821 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:320
//		TC	WTLST2
// slot 3822
                if slot <> 3822 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[109] to agcAotUnit109@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:321
//		OCT	5
// slot 3823
    3823, 10
)).

// bank 01, slots 3824-3828
function agcAotUnit110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3825 {
        if slot <= 3824 {
// WAITLIST.agc:322
//
// WAITLIST.agc:323
//	+4	CCS	A		# TEST TD - T7 + 1
// slot 3824
            if slot <> 3824 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:324
//		AD	LST1 +6
// slot 3825
            if slot <> 3825 or instruction <> 25350 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 774).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3826 {
// WAITLIST.agc:325
//		TCF	+4
// slot 3826
            if slot <> 3826 or instruction <> 5878 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5878, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3827 {
// WAITLIST.agc:326
//		AD	ONE
// slot 3827
                if slot <> 3827 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:327
//		TC	WTLST2
// slot 3828
                if slot <> 3828 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[110] to agcAotUnit110@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:328
//		OCT	6
// slot 3829
    3829, 12
)).

// bank 01, slots 3830-3834
function agcAotUnit111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3831 {
        if slot <= 3830 {
// WAITLIST.agc:329
//
// WAITLIST.agc:330
//# Page 1229
// WAITLIST.agc:331
//	+4	CCS	A
// slot 3830
            if slot <> 3830 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:332
//		AD	LST1 +7
// slot 3831
            if slot <> 3831 or instruction <> 25351 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 775).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3832 {
// WAITLIST.agc:333
//		TCF	+4
// slot 3832
            if slot <> 3832 or instruction <> 5884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3833 {
// WAITLIST.agc:334
//		AD	ONE
// slot 3833
                if slot <> 3833 or instruction <> 27151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:335
//		TC	WTLST2
// slot 3834
                if slot <> 3834 or instruction <> 1795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[111] to agcAotUnit111@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:336
//		OCT	7
// slot 3835
    3835, 14
)).

// bank 01, slots 3836-3837
function agcAotUnit112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3836 {
// WAITLIST.agc:337
//
// WAITLIST.agc:338
//	+4	CCS	A
// slot 3836
        if slot <> 3836 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:339
//WTABORT		TC	BAILOUT		# NO ROOM IN THE INN.
// slot 3837
        if slot <> 3837 or instruction <> 4077 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4077, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[112] to agcAotUnit112@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:340
//		OCT	1203
// slot 3838
    3838, 1286
)).

// bank 01, slots 3839-3840
function agcAotUnit113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3839 {
// WAITLIST.agc:341
//
// WAITLIST.agc:342
//		AD	ONE
// slot 3839
        if slot <> 3839 or instruction <> 27151 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:343
//		TC	WTLST2
// slot 3840
        if slot <> 3840 or instruction <> 1795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[113] to agcAotUnit113@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:344
//		OCT	10
// slot 3841
    3841, 16,
// WAITLIST.agc:345
//
// WAITLIST.agc:346
//OCT40201	OCT	40201
// slot 3842
    3842, 33026
)).

// bank 01, slots 3843-3844
function agcAotUnit114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3843 {
// WAITLIST.agc:347
//
// WAITLIST.agc:348
//# Page 1230
// WAITLIST.agc:349
//# THE ENTRY TO WTLST2 JUST PRECEDING OCT N IS FOR T  LE TD LE T   -1.
// WAITLIST.agc:350
//#                                                  N           N+1
// WAITLIST.agc:351
//#
// WAITLIST.agc:352
//# (LE MEANS LESS THAN OR EQUAL TO).  AT ENTRY, C(A) = -(TD - T   + 1)
// WAITLIST.agc:353
//#                                                             N+1
// WAITLIST.agc:354
//#
// WAITLIST.agc:355
//# THE LST1 ENTRY-(T   -T +1) IS TO BE REPLACED BY -(TD - T  + 1), AND
// WAITLIST.agc:356
//#                  N+1  N                                 N
// WAITLIST.agc:357
//#
// WAITLIST.agc:358
//# THE ENTRY-(T   - TD + 1) IS TO BE INSERTED IMMEDIATELY FOLLOWING.
// WAITLIST.agc:359
//#             N+1
// WAITLIST.agc:360
//
// WAITLIST.agc:361
//WTLST2		TS	WAITTEMP	#	C(A) = -(TD - T + 1)
// slot 3843
        if slot <> 3843 or instruction <> 22580 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22580, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:362
//		INDEX	Q
// slot 3844
        if slot <> 3844 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[114] to agcAotUnit114@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:363
//		CAF	0
// slot 3845
    3845, 24576
)).

// bank 01, slots 3846-3849
function agcAotUnit115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3847 {
        if slot <= 3846 {
// WAITLIST.agc:364
//		TS	Q		# INDEX VALUE INTO Q.
// slot 3846
            if slot <> 3846 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:365
//
// WAITLIST.agc:366
//		CAF	ONE
// slot 3847
            if slot <> 3847 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3848 {
// WAITLIST.agc:367
//		AD	WAITTEMP
// slot 3848
            if slot <> 3848 or instruction <> 24628 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 52).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:368
//		INDEX	Q		# C(A) = -(TD - T ) + 1.
// slot 3849
            if slot <> 3849 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[115] to agcAotUnit115@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:369
//		ADS	LST1 -1		#                N
// slot 3850
    3850, 24062
)).

// bank 01, slots 3851-3852
function agcAotUnit116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3851 {
// WAITLIST.agc:370
//
// WAITLIST.agc:371
//		CS	WAITTEMP
// slot 3851
        if slot <> 3851 or instruction <> 16436 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 52).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// WAITLIST.agc:372
//		INDEX	Q
// slot 3852
        if slot <> 3852 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[116] to agcAotUnit116@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:373
//		TCF	WTLST4
// slot 3853
    3853, 11636
)).

// bank 01, slots 3854-3888
function agcAotUnit117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3870 {
        if slot <= 3861 {
            if slot <= 3857 {
                if slot <= 3855 {
                    if slot <= 3854 {
// WAITLIST.agc:374
//
// WAITLIST.agc:375
//# Page 1231
// WAITLIST.agc:376
//# ENTERS HERE ON T3 RUPT TO DISPATCH WAITLISTED TASK.
// WAITLIST.agc:377
//
// WAITLIST.agc:378
//T3RUPT		EXTEND
// slot 3854
                        if slot <> 3854 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:379
//		ROR	SUPERBNK	# READ CURRENT SUPERBANK VALUE AND
// slot 3855
                        if slot <> 3855 or instruction <> 2055 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3856 {
// WAITLIST.agc:380
//		TS	BANKRUPT	# SAVE WITH E AND F BANK VALUES.
// slot 3856
                        if slot <> 3856 or instruction <> 22542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:381
//		EXTEND
// slot 3857
                        if slot <> 3857 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3859 {
                    if slot <= 3858 {
// WAITLIST.agc:382
//		QXCH	QRUPT
// slot 3858
                        if slot <> 3858 or instruction <> 9226 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 10, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:383
//
// WAITLIST.agc:384
//T3RUPT2		CAF	NEG1/2		# DISPATCH WAITLIST TASK.
// slot 3859
                        if slot <> 3859 or instruction <> 14848 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3860 {
// WAITLIST.agc:385
//		XCH	LST1 +7
// slot 3860
                        if slot <> 3860 or instruction <> 24327 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 775, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:386
//		XCH	LST1 +6
// slot 3861
                        if slot <> 3861 or instruction <> 24326 { return choose false if checkOnly else -1. }
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
            if slot <= 3865 {
                if slot <= 3863 {
                    if slot <= 3862 {
// WAITLIST.agc:387
//		XCH	LST1 +5
// slot 3862
                        if slot <> 3862 or instruction <> 24325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 773, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:388
//		XCH	LST1 +4		# 1. MOVE UP LST1 CONTENTS, ENTERING
// slot 3863
                        if slot <> 3863 or instruction <> 24324 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 772, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3864 {
// WAITLIST.agc:389
//		XCH	LST1 +3		#    A VALUE OF 1/2 +1 AT THE BOTTOM
// slot 3864
                        if slot <> 3864 or instruction <> 24323 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 771, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:390
//		XCH	LST1 +2		#    FOR T6-T5, CORRESPONDING TO THE
// slot 3865
                        if slot <> 3865 or instruction <> 24322 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 770, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3867 {
                    if slot <= 3866 {
// WAITLIST.agc:391
//		XCH	LST1 +1		#    INTERVAL 81.91 SEC FOR ENDTASK.
// slot 3866
                        if slot <> 3866 or instruction <> 24321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 769, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:392
//		XCH	LST1
// slot 3867
                        if slot <> 3867 or instruction <> 24320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 768, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3868 {
// WAITLIST.agc:393
//		AD	POSMAX		# 2. SET T3 = 1.0 - T2 - T USING LIST 1.
// slot 3868
                        if slot <> 3868 or instruction <> 27135 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3869 {
// WAITLIST.agc:394
//		ADS	TIME3		#    SO T3 WONT TICK DURING UPDATE.
// slot 3869
                            if slot <> 3869 or instruction <> 11286 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 22).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// WAITLIST.agc:395
//		TS	RUPTAGN
// slot 3870
                            if slot <> 3870 or instruction <> 23004 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23004, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 3879 {
            if slot <= 3874 {
                if slot <= 3872 {
                    if slot <= 3871 {
// WAITLIST.agc:396
//		CS	ZERO
// slot 3871
                        if slot <> 3871 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:397
//		TS	RUPTAGN		# SETS RUPTAGN TO +1 ON OVERFLOW.
// slot 3872
                        if slot <> 3872 or instruction <> 23004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3873 {
// WAITLIST.agc:398
//
// WAITLIST.agc:399
//		EXTEND			# DISPATCH TASK.
// slot 3873
                        if slot <> 3873 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:400
//		DCS	ENDTASK
// slot 3874
                        if slot <> 3874 or instruction <> 19141 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 2757, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3876 {
                    if slot <= 3875 {
// WAITLIST.agc:401
//		DXCH	LST2 +16D
// slot 3875
                        if slot <> 3875 or instruction <> 22297 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 793, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:402
//		DXCH	LST2 +14D
// slot 3876
                        if slot <> 3876 or instruction <> 22295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 791, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3877 {
// WAITLIST.agc:403
//		DXCH	LST2 +12D
// slot 3877
                        if slot <> 3877 or instruction <> 22293 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 789, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3878 {
// WAITLIST.agc:404
//		DXCH	LST2 +10D
// slot 3878
                            if slot <> 3878 or instruction <> 22291 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 787, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// WAITLIST.agc:405
//		DXCH	LST2 +8D
// slot 3879
                            if slot <> 3879 or instruction <> 22289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 3883 {
                if slot <= 3881 {
                    if slot <= 3880 {
// WAITLIST.agc:406
//		DXCH	LST2 +6
// slot 3880
                        if slot <> 3880 or instruction <> 22287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 783, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:407
//		DXCH	LST2 +4
// slot 3881
                        if slot <> 3881 or instruction <> 22285 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 781, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3882 {
// WAITLIST.agc:408
//		DXCH	LST2 +2
// slot 3882
                        if slot <> 3882 or instruction <> 22283 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 779, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:409
//		DXCH	LST2
// slot 3883
                        if slot <> 3883 or instruction <> 22281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 777, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3885 {
                    if slot <= 3884 {
// WAITLIST.agc:410
//
// WAITLIST.agc:411
//		XCH	L
// slot 3884
                        if slot <> 3884 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:412
//		EXTEND
// slot 3885
                        if slot <> 3885 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 3886 {
// WAITLIST.agc:413
//		WRITE 	SUPERBNK	# SET SUPERBANK FROM BBCON OF 2CADR
// slot 3886
                        if slot <> 3886 or instruction <> 519 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 3887 {
// WAITLIST.agc:414
//		XCH	L		# RESTORE TO L FOR DXCH Z.
// slot 3887
                            if slot <> 3887 or instruction <> 23553 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 1, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// WAITLIST.agc:415
//		DTCB
// slot 3888
                            if slot <> 3888 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[117] to agcAotUnit117@.

// bank 02, slots 4820-4836
function agcAotUnit197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4827 {
        if slot <= 4823 {
            if slot <= 4821 {
                if slot <= 4820 {
// WAITLIST.agc:416
//
// WAITLIST.agc:417
//# Page 1232
// WAITLIST.agc:418
//# RETURN, AFTER EXECUTION OF T3 OVERFLOW TASK:
// WAITLIST.agc:419
//
// WAITLIST.agc:420
//		BLOCK	02
// WAITLIST.agc:421
//		COUNT	02/WAIT
// WAITLIST.agc:422
//
// WAITLIST.agc:423
//TASKOVER	CCS	RUPTAGN		# IF +1 RETURN TO T3RUPT, IF -0 RESUME.
// slot 4820
                    if slot <> 4820 or instruction <> 4572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 476).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:424
//		CAF	WAITBB
// slot 4821
                    if slot <> 4821 or instruction <> 15030 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2742), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4822 {
// WAITLIST.agc:425
//		TS	BBANK
// slot 4822
                    if slot <> 4822 or instruction <> 22534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:426
//		TCF	T3RUPT2		# DISPATCH NEXT TASK IF IT WAS DUE.
// slot 4823
                    if slot <> 4823 or instruction <> 5907 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5907, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4825 {
                if slot <= 4824 {
// WAITLIST.agc:427
//
// WAITLIST.agc:428
//		CA	BANKRUPT
// slot 4824
                    if slot <> 4824 or instruction <> 12302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 14).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:429
//		EXTEND
// slot 4825
                    if slot <> 4825 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4826 {
// WAITLIST.agc:430
//		WRITE	SUPERBNK	# RESTORE SUPERBANK BEFORE RESUME IS DONE
// slot 4826
                    if slot <> 4826 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:431
//
// WAITLIST.agc:432
//RESUME		EXTEND
// slot 4827
                    if slot <> 4827 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4831 {
            if slot <= 4829 {
                if slot <= 4828 {
// WAITLIST.agc:433
//		QXCH	QRUPT
// slot 4828
                    if slot <> 4828 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:434
//NOQRSM		CA	BANKRUPT
// slot 4829
                    if slot <> 4829 or instruction <> 12302 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 14).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4830 {
// WAITLIST.agc:435
//		XCH	BBANK
// slot 4830
                    if slot <> 4830 or instruction <> 23558 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 6, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:436
//NOQBRSM		DXCH	ARUPT
// slot 4831
                    if slot <> 4831 or instruction <> 21513 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4833 {
                if slot <= 4832 {
// WAITLIST.agc:437
//		RELINT
// slot 4832
                    if slot <> 4832 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:438
//		RESUME
// slot 4833
                    if slot <> 4833 or instruction <> 20495 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20495, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4834 {
// WAITLIST.agc:439
//
// WAITLIST.agc:440
//# Page 1233
// WAITLIST.agc:441
//# LONGCALL
// WAITLIST.agc:442
//#
// WAITLIST.agc:443
//# PROGRAM DESCRIPTION				      DATE- 17 MARCH 1967
// WAITLIST.agc:444
//# PROGRAM WRITTEN BY VANDEVER KERMAN		     LOG SECTION WAITLIST
// WAITLIST.agc:445
//# MOD BY- MELANSON KERMAN TO ADD DOCUMENTATION	ASSEMBLY SUNDISK REV. 100
// WAITLIST.agc:446
//#
// WAITLIST.agc:447
//# FUNCTIONAL DESCRIPTION-
// WAITLIST.agc:448
//# LONGCALL IS CALLED WITH THE DELTA TIME ARRIVING IN A,L SCALED AS TIME2,TIME1 WITH THE 2CADR OF THE TASK
// WAITLIST.agc:449
//# IMMEDIATELY FOLLOWING THE TC LONGCALL.  FOR EXAMPLE, IT MIGHT BE DONE AS FOLLOWS WHERE TIMELOC IS THE NAME OF
// WAITLIST.agc:450
//# A DP REGISTER CONTAINING A DELTA TIME AND WHERE TASKTODO IS THE NAME OF THE LOCATION AT WHICH LONGCALL IS TO
// WAITLIST.agc:451
//# START
// WAITLIST.agc:452
//#
// WAITLIST.agc:453
//# CALLING SEQUENCE-
// WAITLIST.agc:454
//#		EXTEND
// WAITLIST.agc:455
//#		DCA	TIMELOC
// WAITLIST.agc:456
//#		TC	LONGCALL
// WAITLIST.agc:457
//#		2CADR	TASKTODO
// WAITLIST.agc:458
//#
// WAITLIST.agc:459
//# NORMAL EXIT MODE-
// WAITLIST.agc:460
//#	1). TC		WAITLIST
// WAITLIST.agc:461
//#	2). DTCB	(TC L+3 OF CALLING ROUTINE 1ST PASS THRU LONGCYCL)
// WAITLIST.agc:462
//#	3). DTCB	(TO TASKOVER ON SUBSEQUENT PASSES THRU LONGCYCL)
// WAITLIST.agc:463
//#
// WAITLIST.agc:464
//# ALARM OR ABORT EXIT MODE-
// WAITLIST.agc:465
//#	NONE
// WAITLIST.agc:466
//#
// WAITLIST.agc:467
//# OUTPUT-
// WAITLIST.agc:468
//#	LONGTIME AND LONGTIME+1 = DELTA TIME
// WAITLIST.agc:469
//#	LONGEXIT AND LONGEXIT+1 = RETURN 2CADR
// WAITLIST.agc:470
//#	LONGCADR AND LONGCADR+1 = TASK 2CADR
// WAITLIST.agc:471
//#	A = SINGLE PRECISION TIME FOR WAITLIST
// WAITLIST.agc:472
//#
// WAITLIST.agc:473
//# ERASABLE INITIALIZATION-
// WAITLIST.agc:474
//#	A = MOST SIGNIFICANT PART OF DELTA TIME
// WAITLIST.agc:475
//#	L = LEAST SIGNIFICANT PART OF DELTA TIME
// WAITLIST.agc:476
//#	Q = ADDRESS OF 2CADR TASK VALUE
// WAITLIST.agc:477
//#
// WAITLIST.agc:478
//# DEBRIS-
// WAITLIST.agc:479
//#	A,Q,L
// WAITLIST.agc:480
//#	LONGCADR AND LONGCADR+1
// WAITLIST.agc:481
//#	LONGEXIT AND LONGEXIT+1
// WAITLIST.agc:482
//#	LONGTIME AND LONGTIME+1
// WAITLIST.agc:483
//#
// WAITLIST.agc:484
//# *** THE FOLLOWING IS TO BE IN FIXED-FIXED AND UNSWITCHED ERRASIBLE ***
// WAITLIST.agc:485
//
// WAITLIST.agc:486
//		BLOCK	02
// WAITLIST.agc:487
//		EBANK=	LST1
// WAITLIST.agc:488
//LONGCALL	DXCH	LONGTIME	# OBTAIN THE DELTA TIME
// slot 4834
                    if slot <> 4834 or instruction <> 22112 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 608, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4835 {
// WAITLIST.agc:489
//
// WAITLIST.agc:490
//		EXTEND			# OBTAIN THE 2CADR
// slot 4835
                        if slot <> 4835 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// WAITLIST.agc:491
//# Page 1234
// WAITLIST.agc:492
//		NDX	Q
// slot 4836
                        if slot <> 4836 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// WAITLIST.agc:493
//		DCA	0
// slot 4837
    4837, 24578
)).

// bank 02, slots 4838-4841
function agcAotUnit198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4839 {
        if slot <= 4838 {
// WAITLIST.agc:494
//		DXCH	LONGCADR
// slot 4838
            if slot <> 4838 or instruction <> 22108 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 604, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:495
//
// WAITLIST.agc:496
//		EXTEND			# NOW GO TO THE APPROPRIATE SWITCHED BANK
// slot 4839
            if slot <> 4839 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4840 {
// WAITLIST.agc:497
//		DCA	LGCL2CDR	# FOR THE REST OF LONGCALL
// slot 4840
            if slot <> 4840 or instruction <> 15083 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2795, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:498
//		DTCB
// slot 4841
            if slot <> 4841 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
// WAITLIST.agc:499
//
// WAITLIST.agc:500
//		EBANK=	LST1
// WAITLIST.agc:501
//LGCL2CDR	2CADR	LNGCALL2
// slot 4842 4843
    4842, 3682, 4843, 2150
)).

// bank 01, slots 3889-3891
function agcAotUnit118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3889 {
// WAITLIST.agc:502
//
// WAITLIST.agc:503
//# *** THE FOLLOWING MAY BE IN A SWITCHED BANK, INCLUDING ITS ERASABLE ***
// WAITLIST.agc:504
//
// WAITLIST.agc:505
//		BANK	01
// WAITLIST.agc:506
//		COUNT	01/WAIT
// WAITLIST.agc:507
//
// WAITLIST.agc:508
//LNGCALL2	LXCH	LONGEXIT +1	# SAVE THE CORRECT BB FOR RETURN
// slot 3889
        if slot <> 3889 or instruction <> 10013 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 797, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3890 {
// WAITLIST.agc:509
//		CA	TWO		# OBTAIN THE RETURN ADDRESS
// slot 3890
            if slot <> 3890 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:510
//		ADS	Q
// slot 3891
            if slot <> 3891 or instruction <> 11266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[118] to agcAotUnit118@.

// bank 01, slots 3892-3901
function agcAotUnit119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3896 {
        if slot <= 3893 {
            if slot <= 3892 {
// WAITLIST.agc:511
//		TS	LONGEXIT
// slot 3892
                if slot <> 3892 or instruction <> 23324 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23324, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:512
//
// WAITLIST.agc:513
//# *** WAITLIST TASK LONGCYCL ***
// WAITLIST.agc:514
//LONGCYCL	EXTEND			# CAN WE SUCCESFULLY TAKE ABOUT 1.25
// slot 3893
                if slot <> 3893 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3894 {
// WAITLIST.agc:515
//		DCS	DPBIT14		# MINUTES OFF OF LONGTIME
// slot 3894
                if slot <> 3894 or instruction <> 18239 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCS", 1855, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3895 {
// WAITLIST.agc:516
//		DAS	LONGTIME
// slot 3895
                    if slot <> 3895 or instruction <> 8800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 608) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:517
//
// WAITLIST.agc:518
//		CCS	LONGTIME +1	# THE REASONING BEHIND THIS PART IS
// slot 3896
                    if slot <> 3896 or instruction <> 4704 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 608).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 3898 {
            if slot <= 3897 {
// WAITLIST.agc:519
//		TCF	MUCHTIME	# INVOLVED, TAKING INTO ACCOUNT THAT THE
// slot 3897
                if slot <> 3897 or instruction <> 5960 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5960, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:520
//					# WORDS MAY NOT BE SIGNED CORRECTED (DP
// WAITLIST.agc:521
//					# BASIC INSTRUCTIONS
// WAITLIST.agc:522
//					# DO NOT SIGN CORRECT) AND THAT WE SUBTRAC-
// WAITLIST.agc:523
//					# TED BIT14 (1 OVER HALF THE POS. VALUE
// WAITLIST.agc:524
//					# REPRESENTABLE IN SINGLE WORD)
// WAITLIST.agc:525
//		NOOP			# CAN'T GET HERE **********
// slot 3898
                if slot <> 3898 or instruction <> 5947 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5947, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3899 {
// WAITLIST.agc:526
//		TCF	+1
// slot 3899
                if slot <> 3899 or instruction <> 5948 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5948, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3900 {
// WAITLIST.agc:527
//		CCS	LONGTIME
// slot 3900
                    if slot <> 3900 or instruction <> 4703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 607).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// WAITLIST.agc:528
//		TCF	MUCHTIME
// slot 3901
                    if slot <> 3901 or instruction <> 5960 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5960, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[119] to agcAotUnit119@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:529
//DPBIT14		OCT	00000
// slot 3902
    3902, 0,
// WAITLIST.agc:530
//		OCT	20000
// slot 3903
    3903, 16384
)).

// bank 01, slots 3904-3906
function agcAotUnit120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3904 {
// WAITLIST.agc:531
//
// WAITLIST.agc:532
//					# LONGCALL
// WAITLIST.agc:533
//LASTTIME	CA	BIT14		# GET BACK THE CORRECT DELTA TFOR WAITLIST
// slot 3904
        if slot <> 3904 or instruction <> 14850 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3905 {
// WAITLIST.agc:534
//		ADS	LONGTIME +1
// slot 3905
            if slot <> 3905 or instruction <> 11872 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 608).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:535
//		TC	WAITLIST
// slot 3906
            if slot <> 3906 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[120] to agcAotUnit120@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:536
//		EBANK=	LST1
// WAITLIST.agc:537
//		2CADR	GETCADR		# THE ENTRY TO OUR LONGCADR
// slot 3907 3908
    3907, 3738, 3908, 2150
)).

// bank 01, slots 3909-3913
function agcAotUnit121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3910 {
        if slot <= 3909 {
// WAITLIST.agc:538
//
// WAITLIST.agc:539
//LONGRTRN	CA	TSKOVCDR	# SET IT UP SO THAT ONLY THE FIRST EXIT IS
// slot 3909
            if slot <> 3909 or instruction <> 14159 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1871), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:540
//# Page 1235
// WAITLIST.agc:541
//		DXCH	LONGEXIT	# TO THE CALLER OF LONGCALL
// slot 3910
            if slot <> 3910 or instruction <> 22301 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 797, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 3911 {
// WAITLIST.agc:542
//		DTCB			# THE REST ARE TO TASKOVER
// slot 3911
            if slot <> 3911 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3912 {
// WAITLIST.agc:543
//
// WAITLIST.agc:544
//MUCHTIME	CA	BIT14		# WE HAVE OVER OUR ABOUT 1.25 MINUTES
// slot 3912
                if slot <> 3912 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// WAITLIST.agc:545
//		TC	WAITLIST	# SO SET UP FOR ANOTHER CYCLE THROUGH HERE
// slot 3913
                if slot <> 3913 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[121] to agcAotUnit121@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:546
//		EBANK=	LST1
// WAITLIST.agc:547
//		2CADR	LONGCYCL
// slot 3914 3915
    3914, 3690, 3915, 2150
)).

// bank 01, slots 3916-3918
function agcAotUnit122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3916 {
// WAITLIST.agc:548
//
// WAITLIST.agc:549
//
// WAITLIST.agc:550
//		TCF	LONGRTRN	# NOW EXIT PROPERLY
// slot 3916
        if slot <> 3916 or instruction <> 5957 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5957, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3917 {
// WAITLIST.agc:551
//
// WAITLIST.agc:552
//# *** WAITLIST TASK GETCADR ***
// WAITLIST.agc:553
//GETCADR		DXCH	LONGCADR	# GET THE LONGCALL THAT WE WISHED TO START
// slot 3917
            if slot <> 3917 or instruction <> 22108 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 604, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// WAITLIST.agc:554
//		DTCB			# AND TRANSFER CONTROL TO IT
// slot 3918
            if slot <> 3918 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[122] to agcAotUnit122@.

agcAotInstallSourceRope(list(
// WAITLIST.agc:555
//
// WAITLIST.agc:556
//TSKOVCDR	GENADR	TASKOVER
// slot 3919
    3919, 5544
)).

