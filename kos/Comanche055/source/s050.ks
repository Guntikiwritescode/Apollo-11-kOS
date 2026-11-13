// PHASE_TABLE_MAINTENANCE.agc
// bank 02, slots 4844-4844
function agcAotUnit199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:1
//# Copyright:	Public domain.
// PHASE_TABLE_MAINTENANCE.agc:2
//# Filename:	PHASE_TABLE_MAINTENANCE.agc
// PHASE_TABLE_MAINTENANCE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PHASE_TABLE_MAINTENANCE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PHASE_TABLE_MAINTENANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PHASE_TABLE_MAINTENANCE.agc:6
//# Assembler:	yaYUL
// PHASE_TABLE_MAINTENANCE.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// PHASE_TABLE_MAINTENANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PHASE_TABLE_MAINTENANCE.agc:9
//# Pages:	1404-1413
// PHASE_TABLE_MAINTENANCE.agc:10
//# Mod history:  2009-05-10 SN   (Navarro Kerman).  Started adapting
// PHASE_TABLE_MAINTENANCE.agc:11
//#				from the Colossus249/ file of the same
// PHASE_TABLE_MAINTENANCE.agc:12
//#				name, using Comanche055 page images.
// PHASE_TABLE_MAINTENANCE.agc:13
//#
// PHASE_TABLE_MAINTENANCE.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// PHASE_TABLE_MAINTENANCE.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PHASE_TABLE_MAINTENANCE.agc:16
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// PHASE_TABLE_MAINTENANCE.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// PHASE_TABLE_MAINTENANCE.agc:18
//# consequent reduction in image quality as well) are available online at
// PHASE_TABLE_MAINTENANCE.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PHASE_TABLE_MAINTENANCE.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// PHASE_TABLE_MAINTENANCE.agc:21
//# (much) higher-quality images which Fjeld Kerman actually created.
// PHASE_TABLE_MAINTENANCE.agc:22
//#
// PHASE_TABLE_MAINTENANCE.agc:23
//# Notations on the hardcopy document read, in part:
// PHASE_TABLE_MAINTENANCE.agc:24
//#
// PHASE_TABLE_MAINTENANCE.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// PHASE_TABLE_MAINTENANCE.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// PHASE_TABLE_MAINTENANCE.agc:27
//#
// PHASE_TABLE_MAINTENANCE.agc:28
//#    This AGC program shall also be referred to as
// PHASE_TABLE_MAINTENANCE.agc:29
//#            Colossus 2A
// PHASE_TABLE_MAINTENANCE.agc:30
//
// PHASE_TABLE_MAINTENANCE.agc:31
//# Page 1404
// PHASE_TABLE_MAINTENANCE.agc:32
//# SUBROUTINE TO UPDATE THE PROGRAM NUMBER DISPLAY ON THE DSKY.
// PHASE_TABLE_MAINTENANCE.agc:33
//
// PHASE_TABLE_MAINTENANCE.agc:34
//		COUNT	02/PHASE
// PHASE_TABLE_MAINTENANCE.agc:35
//		BLOCK	02
// PHASE_TABLE_MAINTENANCE.agc:36
//		SETLOC	FFTAG1
// PHASE_TABLE_MAINTENANCE.agc:37
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:38
//
// PHASE_TABLE_MAINTENANCE.agc:39
//NEWMODEX	INDEX	Q		# UPDATE MODREG.  ENTRY FOR MODE IN FIXED.
// slot 4844
    if slot <> 4844 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[199] to agcAotUnit199@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:40
//		CAF	0
// slot 4845
    4845, 24576
)).

// bank 02, slots 4846-4850
function agcAotUnit200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4847 {
        if slot <= 4846 {
// PHASE_TABLE_MAINTENANCE.agc:41
//		INCR	Q
// slot 4846
            if slot <> 4846 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:42
//
// PHASE_TABLE_MAINTENANCE.agc:43
//NEWMODEA	TS	MODREG		# ENTRY FOR MODE IN A.
// slot 4847
            if slot <> 4847 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4848 {
// PHASE_TABLE_MAINTENANCE.agc:44
//MMDSPLAY	CAF	+3		# DISPLAY MAJOR MODE.
// slot 4848
            if slot <> 4848 or instruction <> 15091 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2803), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4849 {
// PHASE_TABLE_MAINTENANCE.agc:45
//PREBJUMP	LXCH	BBANK		# PUTS BBANK IN L
// slot 4849
                if slot <> 4849 or instruction <> 9222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 6, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:46
//		TCF	BANKJUMP	# PUTS Q INTO A
// slot 4850
                if slot <> 4850 or instruction <> 6596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6596, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[200] to agcAotUnit200@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:47
//		CADR	SETUPDSP
// slot 4851
    4851, 16960
)).

// bank 02, slots 4852-4852
function agcAotUnit201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:48
//
// PHASE_TABLE_MAINTENANCE.agc:49
//# RETURN TO CALLER +3 IF MODE = THAT AT CALLER +1.  OTHERWISE RETURN TO CALLER +2.
// PHASE_TABLE_MAINTENANCE.agc:50
//
// PHASE_TABLE_MAINTENANCE.agc:51
//CHECKMM		INDEX	Q
// slot 4852
    if slot <> 4852 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[201] to agcAotUnit201@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:52
//		CS	0
// slot 4853
    4853, 32768
)).

// bank 02, slots 4854-4857
function agcAotUnit202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4855 {
        if slot <= 4854 {
// PHASE_TABLE_MAINTENANCE.agc:53
//		AD	MODREG
// slot 4854
            if slot <> 4854 or instruction <> 25097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:54
//		EXTEND
// slot 4855
            if slot <> 4855 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4856 {
// PHASE_TABLE_MAINTENANCE.agc:55
//		BZF	Q+2
// slot 4856
            if slot <> 4856 or instruction <> 7624 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7624, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:56
//		TCF	Q+1		# NO MATCH
// slot 4857
            if slot <> 4857 or instruction <> 7622 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7622, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[202] to agcAotUnit202@.

// bank 10, slots 10528-10531
function agcAotUnit646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10529 {
        if slot <= 10528 {
// PHASE_TABLE_MAINTENANCE.agc:57
//
// PHASE_TABLE_MAINTENANCE.agc:58
//TCQ		=	Q+2 +1
// PHASE_TABLE_MAINTENANCE.agc:59
//
// PHASE_TABLE_MAINTENANCE.agc:60
//		BANK	14
// PHASE_TABLE_MAINTENANCE.agc:61
//		SETLOC	PHASETAB
// PHASE_TABLE_MAINTENANCE.agc:62
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:63
//
// PHASE_TABLE_MAINTENANCE.agc:64
//		COUNT	10/PHASE
// PHASE_TABLE_MAINTENANCE.agc:65
//
// PHASE_TABLE_MAINTENANCE.agc:66
//SETUPDSP	INHINT
// slot 10528
            if slot <> 10528 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:67
//		DXCH	RUPTREG1	# SAVE CALLER-S RETURN 2CADR
// slot 10529
            if slot <> 10529 or instruction <> 21561 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10530 {
// PHASE_TABLE_MAINTENANCE.agc:68
//		CAF	PRIO30		# 	EITHER A TASK OR JOB CAN COME TO
// slot 10530
            if slot <> 10530 or instruction <> 14585 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:69
//		TC	NOVAC		#	NEWMODEX
// slot 10531
            if slot <> 10531 or instruction <> 2652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[646] to agcAotUnit646@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:70
//		EBANK=	MODREG
// PHASE_TABLE_MAINTENANCE.agc:71
//		2CADR	DSPMMJOB
// slot 10532 10533
    10532, 3650, 10533, 49284
)).

// bank 10, slots 10534-10536
function agcAotUnit647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10534 {
// PHASE_TABLE_MAINTENANCE.agc:72
//
// PHASE_TABLE_MAINTENANCE.agc:73
//		DXCH	RUPTREG1
// slot 10534
        if slot <> 10534 or instruction <> 21561 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10535 {
// PHASE_TABLE_MAINTENANCE.agc:74
//		RELINT
// slot 10535
            if slot <> 10535 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:75
//		DXCH	Z		# RETURN
// slot 10536
            if slot <> 10536 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[647] to agcAotUnit647@.

// bank 02, slots 4858-4859
function agcAotUnit203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4858 {
// PHASE_TABLE_MAINTENANCE.agc:76
//
// PHASE_TABLE_MAINTENANCE.agc:77
//DSPMMJOB	EQUALS	DSPMMJB
// PHASE_TABLE_MAINTENANCE.agc:78
//
// PHASE_TABLE_MAINTENANCE.agc:79
//		BLOCK	02
// PHASE_TABLE_MAINTENANCE.agc:80
//# Page 1405
// PHASE_TABLE_MAINTENANCE.agc:81
//		SETLOC	FFTAG1
// PHASE_TABLE_MAINTENANCE.agc:82
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:83
//
// PHASE_TABLE_MAINTENANCE.agc:84
//# Page 1406
// PHASE_TABLE_MAINTENANCE.agc:85
//# PHASCHNG IS THE MAIN WAY OF MAKING PHASE CHANGES FOR RESTARTS.  THERE ARE THREE FORMS OF PHASCHNG, KNOWN AS TYPE
// PHASE_TABLE_MAINTENANCE.agc:86
//# A, TYPE B, AND TYPE C.  THEY ARE ALL CALLED AS FOLLOWS, WHERE OCT XXXXX CONTAINS THE PHASE INFORMATION,
// PHASE_TABLE_MAINTENANCE.agc:87
//#
// PHASE_TABLE_MAINTENANCE.agc:88
//#		TC	PHASCHNG
// PHASE_TABLE_MAINTENANCE.agc:89
//#		OCT	XXXXX
// PHASE_TABLE_MAINTENANCE.agc:90
//#
// PHASE_TABLE_MAINTENANCE.agc:91
//# TYPE A IS CONCERNED WITH FIXED PHASE CHANGES, THAT IS, PHASE INFORMATION THAT IS STORED PERMANENTLY.  THESE
// PHASE_TABLE_MAINTENANCE.agc:92
//# OPTIONS ARE, WHERE G STANDS FOR A GROUP AND .X FOR THE PHASE,
// PHASE_TABLE_MAINTENANCE.agc:93
//#
// PHASE_TABLE_MAINTENANCE.agc:94
//#	G.0		INACTIVE, WILL NOT PERMIT A GROUP G RESTART
// PHASE_TABLE_MAINTENANCE.agc:95
//#	G.1		WILL CAUSE THE LAST DISPLAY TO BE REACTIVATED, USED MAINLY IN MANNED FLIGHTS
// PHASE_TABLE_MAINTENANCE.agc:96
//#	G.EVEN		A DOUBLE TABLE RESTART, CAN CAUSE ANY COMBINATION OF TWO JOBS, TASKS, AND/OR
// PHASE_TABLE_MAINTENANCE.agc:97
//#			LONGCALL TO BE RESTARTED.
// PHASE_TABLE_MAINTENANCE.agc:98
//#	G.ODD NOT .1	A SINGLE TABLE RESTART, CAN CAUSE EITHER A JOB, TASK, OR LONGCALL RESTART.
// PHASE_TABLE_MAINTENANCE.agc:99
//#
// PHASE_TABLE_MAINTENANCE.agc:100
//# THIS INFORMATION IS PUT INTO THE OCTAL WORD AFTER TC PHASCHNG AS FOLLOWS
// PHASE_TABLE_MAINTENANCE.agc:101
//#
// PHASE_TABLE_MAINTENANCE.agc:102
//#	TL0 00P PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:103
//#
// PHASE_TABLE_MAINTENANCE.agc:104
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G:S STAND FOR THE GROUP, OCTAL 1-7, THE P:S FOR THE PHASE,
// PHASE_TABLE_MAINTENANCE.agc:105
//# OCTAL 0 - 127.  0:S MUST BE 0.  IF ONE WISHES TO HAVE THE TBASE OF GROUP G TO BE SET AT THIS TIME,
// PHASE_TABLE_MAINTENANCE.agc:106
//# T IS SET TO 1, OTHERWISE IT IS SET TO 0.  SIMILARLY IF ONE WISHES TO SET LONGBASE, THEN L IS SET TO 1, OTHERWISE
// PHASE_TABLE_MAINTENANCE.agc:107
//# IT IS SET TO 0.  SOME EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:108
//#
// PHASE_TABLE_MAINTENANCE.agc:109
//#		TC	PHASCHNG	# THIS WILL CAUSE GROUP 3 TO BE SET TO 0,
// PHASE_TABLE_MAINTENANCE.agc:110
//#		OCT	00003		# MAKING GROUP 3 INACTIVE
// PHASE_TABLE_MAINTENANCE.agc:111
//#
// PHASE_TABLE_MAINTENANCE.agc:112
//#		TC	PHASCHNG	# IF A RESTART OCCURS THIS WOULD CAUSE
// PHASE_TABLE_MAINTENANCE.agc:113
//#		OCT	00012		# GROUP 2 TO RESTART THE LAST DISPLAY
// PHASE_TABLE_MAINTENANCE.agc:114
//#
// PHASE_TABLE_MAINTENANCE.agc:115
//#		TC	PHASCHNG	# THIS SETS THE TBASE OF GROUP 4 AND IN
// PHASE_TABLE_MAINTENANCE.agc:116
//#		OCT	40064		# CASE OF A RESTART WOULD START UP THE TWO
// PHASE_TABLE_MAINTENANCE.agc:117
//#					# THINGS LOCATED IN THE DOUBLE 4.6 RESTART
// PHASE_TABLE_MAINTENANCE.agc:118
//#					# LOCATION.
// PHASE_TABLE_MAINTENANCE.agc:119
//#		TC	PHASCHNG	# THIS SETS LONGBASE AND UPON A RESTART
// PHASE_TABLE_MAINTENANCE.agc:120
//#		OCT	20135		# CAUSES 5.13 TO BE RESTARTED (SINCE
// PHASE_TABLE_MAINTENANCE.agc:121
//#					# LONGBASE WAS SET THIS SINGLE ENTRY
// PHASE_TABLE_MAINTENANCE.agc:122
//#					# SHOULD BE A LONGCALL)
// PHASE_TABLE_MAINTENANCE.agc:123
//#		TC	PHASCHNG	# SINCE BOTH TBASE4 AND LONGBASE ARE SET,
// PHASE_TABLE_MAINTENANCE.agc:124
//#		OCT	60124		# 4.12 SHOULD CONTAIN BOTH A TASK AND A
// PHASE_TABLE_MAINTENANCE.agc:125
//#					# LONGCALL TO BE RESTARTED
// PHASE_TABLE_MAINTENANCE.agc:126
//#
// PHASE_TABLE_MAINTENANCE.agc:127
//# TYPE C PHASCHNG CONTAINS THE VARIABLE TYPE OF PHASCHNG INFORMATION.  INSTEAD OF THE INFORMATION BEING IN A
// PHASE_TABLE_MAINTENANCE.agc:128
//# PERMANENT FORM, ONE STORES THE DESIRED RESTART INFORMATION IN A VARIABKE LOCATION.  THE BITS ARE AS FOLLOWS,
// PHASE_TABLE_MAINTENANCE.agc:129
//#
// PHASE_TABLE_MAINTENANCE.agc:130
//#	TL0 1AD XXX CJW GGG
// PHASE_TABLE_MAINTENANCE.agc:131
//#
// PHASE_TABLE_MAINTENANCE.agc:132
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G:S STAND FOR THE GROUP, OCTAL 1 - 7.  IF THE RESTART IS TO
// PHASE_TABLE_MAINTENANCE.agc:133
//# BE BY WAITLIST, W IS SET TO 1, IF IT IS A JOB, J IS SET TO 1, IF IT IS A LONGCALL, C IS SET TO 1.  ONLY ONE OF
// PHASE_TABLE_MAINTENANCE.agc:134
//# THESE THREE BITS MAY BE SET.  X:S ARE IGNORED  1 MUST BE 1, AND 0 MUST BE 0.  AGAIN T STANDS FOR THE TBASE,
// PHASE_TABLE_MAINTENANCE.agc:135
//# Page 1407
// PHASE_TABLE_MAINTENANCE.agc:136
//# AND L FOR LONGBASE.  THE BITS A AND D ARE CONCERNED WITH THE VARIABLE INFORMATION.  IF D IS SET TO 1, A PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:137
//# OR DELTA TIME WILL BE READ FROM THE NEXT LOCATION AFTER THE OCTAL INFORMATION, IF THIS IS TO BE INDIRECT, THAT
// PHASE_TABLE_MAINTENANCE.agc:138
//# IS, THE NAME OF A LOCATION COMT+INING THE INFORMATION (DELTA TIME ONLY), THEN THIS IS GIVEN AS THE -GENADR OF
// PHASE_TABLE_MAINTENANCE.agc:139
//# THAT LOCATION WHICH CONTAINS THE DELTA TIME.  IF THE OLD PRIORITY OR DELTA TIME IS TO BE USED, THAT WHICH IS
// PHASE_TABLE_MAINTENANCE.agc:140
//# ALREADY IN THE VARIABLE STORAGE, THEN D IS SET TO 0.  NEXT THE A BIT IS USED.  IF IT IS SET TO 0, THE ADDRESS
// PHASE_TABLE_MAINTENANCE.agc:141
//# THAT WOULD BE RESTARTED DURING A RESTART IS THE NEXT LOCATION AFTER THE PHASE INFORMATION, THAT IS, EITHER
// PHASE_TABLE_MAINTENANCE.agc:142
//# (TC PHASCHNG) +2 OR +3, DEPENDING ON WHETHER D HAD BEEN SET OR NOT.  IF A IS SET TO 1, THEN THE ADDRESS THAT
// PHASE_TABLE_MAINTENANCE.agc:143
//# WOULD BE RESTARTED IS THE 2CADR THAT IS READ FROM THE NEXT TWO LOCATIONS.  EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:144
//#
// PHASE_TABLE_MAINTENANCE.agc:145
//#	AD	TC	PHASCHNG	# THIS WOULD CAUSE LOCATION AD +3 TO BE
// PHASE_TABLE_MAINTENANCE.agc:146
//#	AD+1	OCT	05023		# RESTARTED BY GROUP THREE WITHA PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:147
//#	AD+2	OCT	23000		# OF 23.  NOTE UPON RETURNING IT WOULD
// PHASE_TABLE_MAINTENANCE.agc:148
//#	AD+3				# ALSO GO TO AD+3
// PHASE_TABLE_MAINTENANCE.agc:149
//#
// PHASE_TABLE_MAINTENANCE.agc:150
//#	AD	TC	PHASCHNG	# GROUP 1 WOULD CAUSE CALLCALL TO BE
// PHASE_TABLE_MAINTENANCE.agc:151
//#	AD+1	OCT	27441		# BE STARTED AS A LONGCALL FROM THE TIME
// PHASE_TABLE_MAINTENANCE.agc:152
//#	AD+2	-GENADR	DELTIME		# STORED IN LONGBASE (LONGBASE WAS SET) BY
// PHASE_TABLE_MAINTENANCE.agc:153
//#	AD+3	2CADR	CALLCALL	# A DELTATIME STORED IN DELTIME.  THE
// PHASE_TABLE_MAINTENANCE.agc:154
//#	AD+4				# BBCON OF THE 2CADR SHOULD CONTAIN THE E
// PHASE_TABLE_MAINTENANCE.agc:155
//#	AD+5				# BANK OF DELTIME.  PHASCHNG RETURNS TO
// PHASE_TABLE_MAINTENANCE.agc:156
//#					# LOCATION AD+5
// PHASE_TABLE_MAINTENANCE.agc:157
//#
// PHASE_TABLE_MAINTENANCE.agc:158
//# NOTE THAT IF A VARIABLE PRIORITY IS GIVEN FOR A JOB, THE JOB WILL BE RESTARTED AS A NOVAC IF THE PRIORITY IS
// PHASE_TABLE_MAINTENANCE.agc:159
//# NEGATIVE, AS A FINDVAC IF THE PRIORITY IS POSITIVE.
// PHASE_TABLE_MAINTENANCE.agc:160
//#
// PHASE_TABLE_MAINTENANCE.agc:161
//# TYPE B PHASCHNG IS A COMBINATION OF VARIABLE AND FIXED PHASE CHANGES.  IT WILL START UP A JOB AS INDICATED
// PHASE_TABLE_MAINTENANCE.agc:162
//# BELOW AND ALSO START UP ONE FIXED RESTART, THAT IS EITHER AN G.1 OR A G.ODD OR THE FIRST ENTRY OF G.EVEN
// PHASE_TABLE_MAINTENANCE.agc:163
//# DOUBLE ENTRY.  THE BIT INFORMATION IS AS FOLLOWS,
// PHASE_TABLE_MAINTENANCE.agc:164
//#
// PHASE_TABLE_MAINTENANCE.agc:165
//#	TL1 DAP PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:166
//#
// PHASE_TABLE_MAINTENANCE.agc:167
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G:S STAND FOR THE GROUP, OCTAL 1 - 7. THE P:S FOR THE FIXED
// PHASE_TABLE_MAINTENANCE.agc:168
//# PHASE INFORMATION, OCTAL 0 - 127.  1 MUST BE 1.  AND AGAIN T STANDS FOR THE TBASE AND L FOR LONGBASE.  D THIS
// PHASE_TABLE_MAINTENANCE.agc:169
//# TIME STANDS ONLY FOR PRIORITY SINCE THIS WILL BE CONSIDERED A JOB, AND IT MUST BE GIVEN DIRECTLY IF GIVEN.
// PHASE_TABLE_MAINTENANCE.agc:170
//# AGAIN A STANDS FOR THE ADDRESS OF THE LOCATION TO BE RESTARTED, 1 IF THE 2CADR IS GIVEN, OR 0 IF IT IS TO BE
// PHASE_TABLE_MAINTENANCE.agc:171
//# THE NEXT LOCATION.(THE RETURN LOCATION OF PHASCHNG) EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:172
//#	AD	TC	PHASCHNG	# TBASE IS SET AND A RESTART CAUSE GROUP 3
// PHASE_TABLE_MAINTENANCE.agc:173
//#	AD+1	OCT	56043		# TO START THE JOB AJOBAJOB WITH PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:174
//#	AD+2	OCT	31000		# 31 AND THE FIRST ENTRY OF 3.4SPOT (WE CAN
// PHASE_TABLE_MAINTENANCE.agc:175
//#	AD+3	2CADR	AJOBAJOB	# ASSUME IT IS A TASK SINCE WE SET TBASE3)
// PHASE_TABLE_MAINTENANCE.agc:176
//#	AD+4				# UPON RETURN FROM PHASCHNG CONTROL WOULD
// PHASE_TABLE_MAINTENANCE.agc:177
//#	AD+5				# GO TO AD+5
// PHASE_TABLE_MAINTENANCE.agc:178
//#
// PHASE_TABLE_MAINTENANCE.agc:179
//#	AD	TC	PHASCHNG	# UPON A RESTART THE LAST DISPLAY WOULD BE
// PHASE_TABLE_MAINTENANCE.agc:180
//#	AD+1	OCT	10015		# RESTARTED AND A JOB WITH THE PREVIOUSLY
// PHASE_TABLE_MAINTENANCE.agc:181
//#	AD+2				# STORED PRIORITY WOULD BE BEGUN AT AD+2
// PHASE_TABLE_MAINTENANCE.agc:182
//#					# BY MEANS OF GROUP 5
// PHASE_TABLE_MAINTENANCE.agc:183
//# Page 1408
// PHASE_TABLE_MAINTENANCE.agc:184
//# THE NOVAC-FINDVAC CHOICE FOR JOBS HOLDS HERE ALSO - NEGATIVE PRIORITY CAUSES A NOVAC CALL, POSITIVE A FINDVAC.
// PHASE_TABLE_MAINTENANCE.agc:185
//
// PHASE_TABLE_MAINTENANCE.agc:186
//
// PHASE_TABLE_MAINTENANCE.agc:187
//# SUMMARY OF BITS:
// PHASE_TABLE_MAINTENANCE.agc:188
//#	TYPE A		TL0 00P PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:189
//#	TYPE B		TL1 DAP PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:190
//#	TYPE C		TL0 1AD XXX CJW GGG
// PHASE_TABLE_MAINTENANCE.agc:191
//
// PHASE_TABLE_MAINTENANCE.agc:192
//# Page 1409
// PHASE_TABLE_MAINTENANCE.agc:193
//# 2PHSCHNG IS USED WHEN ONE WISHES TO START UP A GROUP OR CHANGE A GROUP WHILE UNDER THE CONTROL OF A DIFFERENT
// PHASE_TABLE_MAINTENANCE.agc:194
//# GROUP.  FOR EXAMPLE, CHANGE THE PHASE OF GROUP 3 WHILE THE PORTION OF THE PROGRAM IS UNDER GROUP 5.  ALL 2PHSCHNG
// PHASE_TABLE_MAINTENANCE.agc:195
//# CALLS ARE MADE IN THE FOLLOWING MANNER,
// PHASE_TABLE_MAINTENANCE.agc:196
//
// PHASE_TABLE_MAINTENANCE.agc:197
//#		TC	2PHSCHNG
// PHASE_TABLE_MAINTENANCE.agc:198
//#		OCT	XXXXX
// PHASE_TABLE_MAINTENANCE.agc:199
//#		OCT	YYYYY
// PHASE_TABLE_MAINTENANCE.agc:200
//
// PHASE_TABLE_MAINTENANCE.agc:201
//# WHERE OCT XXXXX MUST BE OF TYPE A AND OCT YYYYY MAY BE OF EITHER TYPE A OR TYPE B OR TYPEC.  THERE IS ONE
// PHASE_TABLE_MAINTENANCE.agc:202
//# DIFFERENCE --- NOTE- IF LONGBASE IS TO BE SET THIS INFORMATION IS GIVEN IN THE OCT YYYYY INFORMATION, IT WILL
// PHASE_TABLE_MAINTENANCE.agc:203
//# BE DISREGARDED IF GIVEN WITH THE OCT XXXXX INFORMATION.  A COUPLE OF EXAMPLES MAY HELP.
// PHASE_TABLE_MAINTENANCE.agc:204
//
// PHASE_TABLE_MAINTENANCE.agc:205
//#	AD	TC	2PHACHNG	# SET TBASE3 AND IF A RESTART OCCURS START
// PHASE_TABLE_MAINTENANCE.agc:206
//#	AD+1	OCT	40083		# THE TWO ENTRIES IN 3.8 TABLE LOCATION
// PHASE_TABLE_MAINTENANCE.agc:207
//#	AD+2	OCT	05025		# THIS IS OF TYPE C. SET THE JOB TO BE
// PHASE_TABLE_MAINTENANCE.agc:208
//#	AD+3	OCT	18000		# TO BE LOCATION AD+4, WITH A PRIORITY 18,
// PHASE_TABLE_MAINTENANCE.agc:209
//#	AD+4				# FOR GROUP 5 PHASE INFORMATION.
// PHASE_TABLE_MAINTENANCE.agc:210
//
// PHASE_TABLE_MAINTENANCE.agc:211
//		COUNT	02/PHASE
// PHASE_TABLE_MAINTENANCE.agc:212
//
// PHASE_TABLE_MAINTENANCE.agc:213
//2PHSCHNG	INHINT			# THE ENTRY FOR A DOUBLE PHASE CHANGE
// slot 4858
        if slot <> 4858 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PHASE_TABLE_MAINTENANCE.agc:214
//		NDX	Q
// slot 4859
        if slot <> 4859 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[203] to agcAotUnit203@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:215
//		CA	0
// slot 4860
    4860, 24576
)).

// bank 02, slots 4861-4877
function agcAotUnit204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4868 {
        if slot <= 4864 {
            if slot <= 4862 {
                if slot <= 4861 {
// PHASE_TABLE_MAINTENANCE.agc:216
//		INCR	Q
// slot 4861
                    if slot <> 4861 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:217
//		TS	TEMPP2
// slot 4862
                    if slot <> 4862 or instruction <> 22586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4863 {
// PHASE_TABLE_MAINTENANCE.agc:218
//
// PHASE_TABLE_MAINTENANCE.agc:219
//		MASK	OCT7
// slot 4863
                    if slot <> 4863 or instruction <> 31251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:220
//		DOUBLE
// slot 4864
                    if slot <> 4864 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4866 {
                if slot <= 4865 {
// PHASE_TABLE_MAINTENANCE.agc:221
//		TS	TEMPG2
// slot 4865
                    if slot <> 4865 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:222
//
// PHASE_TABLE_MAINTENANCE.agc:223
//		CA	TEMPP2
// slot 4866
                    if slot <> 4866 or instruction <> 12346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 58).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4867 {
// PHASE_TABLE_MAINTENANCE.agc:224
//		MASK	OCT17770	# NEED ONLY 1770, BUT WHY GET A NEW CONST.
// slot 4867
                    if slot <> 4867 or instruction <> 31290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2618), 32768).
                        if fixedOperand = 8184 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 1024) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:225
//		EXTEND
// slot 4868
                    if slot <> 4868 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4872 {
            if slot <= 4870 {
                if slot <= 4869 {
// PHASE_TABLE_MAINTENANCE.agc:226
//		MP	BIT12
// slot 4869
                    if slot <> 4869 or instruction <> 31236 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2564, readEffective:call(words, 2564)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:227
//		XCH	TEMPP2
// slot 4870
                    if slot <> 4870 or instruction <> 23610 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 58, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4871 {
// PHASE_TABLE_MAINTENANCE.agc:228
//
// PHASE_TABLE_MAINTENANCE.agc:229
//		MASK	BIT15
// slot 4871
                    if slot <> 4871 or instruction <> 31233 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        if fixedOperand = 16384 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:230
//		TS	TEMPSW2		# INDICATES WHETHER TO SET TBASE OR NOT
// slot 4872
                    if slot <> 4872 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4874 {
                if slot <= 4873 {
// PHASE_TABLE_MAINTENANCE.agc:231
//
// PHASE_TABLE_MAINTENANCE.agc:232
//		TCF	PHASCHNG +3
// slot 4873
                    if slot <> 4873 or instruction <> 6925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6925, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:233
//
// PHASE_TABLE_MAINTENANCE.agc:234
//PHASCHNG	INHINT
// slot 4874
                    if slot <> 4874 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4875 {
// PHASE_TABLE_MAINTENANCE.agc:235
//		CA	ONE		# INDICATESWE CAME FROM A PHASCHNG ENTRY
// slot 4875
                    if slot <> 4875 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4876 {
// PHASE_TABLE_MAINTENANCE.agc:236
//		TS	TEMPSW2
// slot 4876
                        if slot <> 4876 or instruction <> 22582 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22582, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PHASE_TABLE_MAINTENANCE.agc:237
//
// PHASE_TABLE_MAINTENANCE.agc:238
//		NDX	Q
// slot 4877
                        if slot <> 4877 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[204] to agcAotUnit204@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:239
//		CA	0
// slot 4878
    4878, 24576
)).

// bank 02, slots 4879-4883
function agcAotUnit205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4880 {
        if slot <= 4879 {
// PHASE_TABLE_MAINTENANCE.agc:240
//		INCR	Q
// slot 4879
            if slot <> 4879 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:241
//		TS	TEMPSW
// slot 4880
            if slot <> 4880 or instruction <> 22581 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22581, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4881 {
// PHASE_TABLE_MAINTENANCE.agc:242
//# Page 1410
// PHASE_TABLE_MAINTENANCE.agc:243
//		EXTEND
// slot 4881
            if slot <> 4881 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4882 {
// PHASE_TABLE_MAINTENANCE.agc:244
//		DCA	ADRPCHN2	# OFF TO SWITCHED BANK
// slot 4882
                if slot <> 4882 or instruction <> 15125 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2837, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:245
//		DTCB
// slot 4883
                if slot <> 4883 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[205] to agcAotUnit205@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:246
//
// PHASE_TABLE_MAINTENANCE.agc:247
//		EBANK=	LST1
// PHASE_TABLE_MAINTENANCE.agc:248
//ADRPCHN2	2CADR	PHSCHNG2
// slot 4884 4885
    4884, 2642, 4885, 16486
)).

// bank 02, slots 4886-4896
function agcAotUnit206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4890 {
        if slot <= 4887 {
            if slot <= 4886 {
// PHASE_TABLE_MAINTENANCE.agc:249
//
// PHASE_TABLE_MAINTENANCE.agc:250
//ONEORTWO	LXCH	TEMPBBCN
// slot 4886
                if slot <> 4886 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:251
//		LXCH	BBANK
// slot 4887
                if slot <> 4887 or instruction <> 9222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 6, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4888 {
// PHASE_TABLE_MAINTENANCE.agc:252
//		LXCH	TEMPBBCN
// slot 4888
                if slot <> 4888 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4889 {
// PHASE_TABLE_MAINTENANCE.agc:253
//
// PHASE_TABLE_MAINTENANCE.agc:254
//		MASK	OCT14000	# SEE WHAT KIND OF PHASE CHANGE IT IS
// slot 4889
                    if slot <> 4889 or instruction <> 31286 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                        if fixedOperand = 6144 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 4) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:255
//		CCS	A
// slot 4890
                    if slot <> 4890 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 4893 {
            if slot <= 4891 {
// PHASE_TABLE_MAINTENANCE.agc:256
//		TCF	CHECKB		# IT IS OF TYPE :B:
// slot 4891
                if slot <> 4891 or instruction <> 6972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6972, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4892 {
// PHASE_TABLE_MAINTENANCE.agc:257
//
// PHASE_TABLE_MAINTENANCE.agc:258
//		CA	TEMPP
// slot 4892
                    if slot <> 4892 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:259
//		MASK	BIT7
// slot 4893
                    if slot <> 4893 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4894 {
// PHASE_TABLE_MAINTENANCE.agc:260
//		CCS	A		# SHALL WE USE THE OLD PRIORITY
// slot 4894
                if slot <> 4894 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4895 {
// PHASE_TABLE_MAINTENANCE.agc:261
//		TCF	GETPRIO		# NO GET A NEW PRIORITY (OR DELTA T)
// slot 4895
                    if slot <> 4895 or instruction <> 6961 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6961, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:262
//
// PHASE_TABLE_MAINTENANCE.agc:263
//OLDPRIO		NDX	TEMPG		# USE THE OLD PRIORITY (OR DELTA T)
// slot 4896
                    if slot <> 4896 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[206] to agcAotUnit206@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:264
//		CA	PHSPRDT1 -2
// slot 4897
    4897, 25684
)).

// bank 02, slots 4898-4911
function agcAotUnit207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4904 {
        if slot <= 4900 {
            if slot <= 4898 {
// PHASE_TABLE_MAINTENANCE.agc:265
//		TS	TEMPPR
// slot 4898
                if slot <> 4898 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4899 {
// PHASE_TABLE_MAINTENANCE.agc:266
//
// PHASE_TABLE_MAINTENANCE.agc:267
//CON1		CA	TEMPP		# SEE IF A 2CADR IS GIVEN
// slot 4899
                    if slot <> 4899 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:268
//		MASK 	BIT8
// slot 4900
                    if slot <> 4900 or instruction <> 31240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2568), 32768).
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
            if slot <= 4902 {
                if slot <= 4901 {
// PHASE_TABLE_MAINTENANCE.agc:269
//		CCS	A
// slot 4901
                    if slot <> 4901 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:270
//		TCF	GETNEWNM
// slot 4902
                    if slot <> 4902 or instruction <> 6965 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6965, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4903 {
// PHASE_TABLE_MAINTENANCE.agc:271
//
// PHASE_TABLE_MAINTENANCE.agc:272
//		CA	Q
// slot 4903
                    if slot <> 4903 or instruction <> 12290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:273
//		TS	TEMPNM
// slot 4904
                    if slot <> 4904 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4907 {
            if slot <= 4905 {
// PHASE_TABLE_MAINTENANCE.agc:274
//		CA	BB
// slot 4905
                if slot <> 4905 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4906 {
// PHASE_TABLE_MAINTENANCE.agc:275
//		EXTEND			# PICK UP USERS SUPERBANK
// slot 4906
                    if slot <> 4906 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:276
//		ROR	SUPERBNK
// slot 4907
                    if slot <> 4907 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4909 {
                if slot <= 4908 {
// PHASE_TABLE_MAINTENANCE.agc:277
//		TS	TEMPBB
// slot 4908
                    if slot <> 4908 or instruction <> 22580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22580, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:278
//
// PHASE_TABLE_MAINTENANCE.agc:279
//TOCON2		CA	CON2ADR		# BACK TO SWITCHED BANK
// slot 4909
                    if slot <> 4909 or instruction <> 15152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2864), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4910 {
// PHASE_TABLE_MAINTENANCE.agc:280
//		LXCH	TEMPBBCN
// slot 4910
                    if slot <> 4910 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:281
//		DTCB
// slot 4911
                    if slot <> 4911 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[207] to agcAotUnit207@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:282
//
// PHASE_TABLE_MAINTENANCE.agc:283
//CON2ADR		GENADR	CON2
// slot 4912
    4912, 2750
)).

// bank 02, slots 4913-4913
function agcAotUnit208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:284
//
// PHASE_TABLE_MAINTENANCE.agc:285
//GETPRIO		NDX	Q		# DON:T CARE IF DIRECT OR INDIRECT
// slot 4913
    if slot <> 4913 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[208] to agcAotUnit208@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:286
//		CA	0		# LEAVE THAT DECISION TO RESTARTS
// slot 4914
    4914, 24576
)).

// bank 02, slots 4915-4918
function agcAotUnit209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4916 {
        if slot <= 4915 {
// PHASE_TABLE_MAINTENANCE.agc:287
//		INCR	Q		# OBTAIN RETURN ADDRESS
// slot 4915
            if slot <> 4915 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:288
//		TCF	CON1 -1
// slot 4916
            if slot <> 4916 or instruction <> 6946 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6946, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4917 {
// PHASE_TABLE_MAINTENANCE.agc:289
//
// PHASE_TABLE_MAINTENANCE.agc:290
//GETNEWNM	EXTEND
// slot 4917
            if slot <> 4917 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:291
//# Page 1411
// PHASE_TABLE_MAINTENANCE.agc:292
//		INDEX	Q
// slot 4918
            if slot <> 4918 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[209] to agcAotUnit209@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:293
//		DCA	0
// slot 4919
    4919, 24578
)).

// bank 02, slots 4920-4923
function agcAotUnit210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4921 {
        if slot <= 4920 {
// PHASE_TABLE_MAINTENANCE.agc:294
//		DXCH	TEMPNM
// slot 4920
            if slot <> 4920 or instruction <> 21556 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:295
//		CA	TWO
// slot 4921
            if slot <> 4921 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4922 {
// PHASE_TABLE_MAINTENANCE.agc:296
//		ADS	Q		# OBTAIN RETURN ADDRESS
// slot 4922
            if slot <> 4922 or instruction <> 11266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:297
//
// PHASE_TABLE_MAINTENANCE.agc:298
//		TCF	TOCON2
// slot 4923
            if slot <> 4923 or instruction <> 6957 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6957, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[210] to agcAotUnit210@.

// bank 10, slots 10537-10554
function agcAotUnit648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10545 {
        if slot <= 10540 {
            if slot <= 10538 {
                if slot <= 10537 {
// PHASE_TABLE_MAINTENANCE.agc:299
//
// PHASE_TABLE_MAINTENANCE.agc:300
//OCT14000	EQUALS	PRIO14
// PHASE_TABLE_MAINTENANCE.agc:301
//TEMPG		EQUALS	ITEMP1
// PHASE_TABLE_MAINTENANCE.agc:302
//TEMPP		EQUALS	ITEMP2
// PHASE_TABLE_MAINTENANCE.agc:303
//TEMPNM		EQUALS	ITEMP3
// PHASE_TABLE_MAINTENANCE.agc:304
//TEMPBB		EQUALS	ITEMP4
// PHASE_TABLE_MAINTENANCE.agc:305
//TEMPSW		EQUALS	ITEMP5
// PHASE_TABLE_MAINTENANCE.agc:306
//TEMPSW2		EQUALS	ITEMP6
// PHASE_TABLE_MAINTENANCE.agc:307
//TEMPPR		EQUALS	RUPTREG1
// PHASE_TABLE_MAINTENANCE.agc:308
//TEMPG2		EQUALS	RUPTREG2
// PHASE_TABLE_MAINTENANCE.agc:309
//TEMPP2		EQUALS	RUPTREG3
// PHASE_TABLE_MAINTENANCE.agc:310
//
// PHASE_TABLE_MAINTENANCE.agc:311
//TEMPBBCN	EQUALS	RUPTREG4
// PHASE_TABLE_MAINTENANCE.agc:312
//BB		EQUALS	BBANK
// PHASE_TABLE_MAINTENANCE.agc:313
//
// PHASE_TABLE_MAINTENANCE.agc:314
//		BANK	14
// PHASE_TABLE_MAINTENANCE.agc:315
//		SETLOC	PHASETAB
// PHASE_TABLE_MAINTENANCE.agc:316
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:317
//
// PHASE_TABLE_MAINTENANCE.agc:318
//		EBANK=	PHSNAME1
// PHASE_TABLE_MAINTENANCE.agc:319
//		COUNT	10/PHASE
// PHASE_TABLE_MAINTENANCE.agc:320
//
// PHASE_TABLE_MAINTENANCE.agc:321
//PHSCHNG2	LXCH	TEMPBBCN
// slot 10537
                    if slot <> 10537 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:322
//		CA	TEMPSW
// slot 10538
                    if slot <> 10538 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10539 {
// PHASE_TABLE_MAINTENANCE.agc:323
//		MASK	OCT7
// slot 10539
                    if slot <> 10539 or instruction <> 31251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:324
//		DOUBLE
// slot 10540
                    if slot <> 10540 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10542 {
                if slot <= 10541 {
// PHASE_TABLE_MAINTENANCE.agc:325
//		TS	TEMPG
// slot 10541
                    if slot <> 10541 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:326
//
// PHASE_TABLE_MAINTENANCE.agc:327
//		CA	TEMPSW
// slot 10542
                    if slot <> 10542 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10543 {
// PHASE_TABLE_MAINTENANCE.agc:328
//		MASK	OCT17770
// slot 10543
                    if slot <> 10543 or instruction <> 31290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2618), 32768).
                        if fixedOperand = 8184 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 1024) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10544 {
// PHASE_TABLE_MAINTENANCE.agc:329
//		EXTEND
// slot 10544
                        if slot <> 10544 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PHASE_TABLE_MAINTENANCE.agc:330
//		MP	BIT12
// slot 10545
                        if slot <> 10545 or instruction <> 31236 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2564, readEffective:call(words, 2564)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 10549 {
            if slot <= 10547 {
                if slot <= 10546 {
// PHASE_TABLE_MAINTENANCE.agc:331
//		TS	TEMPP
// slot 10546
                    if slot <> 10546 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:332
//
// PHASE_TABLE_MAINTENANCE.agc:333
//		CA	TEMPSW
// slot 10547
                    if slot <> 10547 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10548 {
// PHASE_TABLE_MAINTENANCE.agc:334
//		MASK	OCT60000
// slot 10548
                    if slot <> 10548 or instruction <> 30789 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        if fixedOperand = 24576 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 4) * 8192).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:335
//		XCH	TEMPSW
// slot 10549
                    if slot <> 10549 or instruction <> 23605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 53, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10551 {
                if slot <= 10550 {
// PHASE_TABLE_MAINTENANCE.agc:336
//		MASK	OCT14000
// slot 10550
                    if slot <> 10550 or instruction <> 31286 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2614), 32768).
                        if fixedOperand = 6144 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 4) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:337
//		CCS	A
// slot 10551
                    if slot <> 10551 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10552 {
// PHASE_TABLE_MAINTENANCE.agc:338
//		TCF	ONEORTWO
// slot 10552
                    if slot <> 10552 or instruction <> 6934 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6934, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10553 {
// PHASE_TABLE_MAINTENANCE.agc:339
//
// PHASE_TABLE_MAINTENANCE.agc:340
//# Page 1412
// PHASE_TABLE_MAINTENANCE.agc:341
//		CA	TEMPP		# START STORING THE PHASE INFORMATION
// slot 10553
                        if slot <> 10553 or instruction <> 12338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 50).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PHASE_TABLE_MAINTENANCE.agc:342
//		NDX	TEMPG
// slot 10554
                        if slot <> 10554 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[648] to agcAotUnit648@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:343
//		TS	PHASE1 -2
// slot 10555
    10555, 46034
)).

// bank 10, slots 10556-10561
function agcAotUnit649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10558 {
        if slot <= 10556 {
// PHASE_TABLE_MAINTENANCE.agc:344
//
// PHASE_TABLE_MAINTENANCE.agc:345
//BELOW1		CCS	TEMPSW2		# IS IT A PHASCHNG OR A 2PHSCHNG
// slot 10556
            if slot <> 10556 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10557 {
// PHASE_TABLE_MAINTENANCE.agc:346
//		TCF	BELOW2		# IT:S A PHASCHNG
// slot 10557
                if slot <> 10557 or instruction <> 5449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5449, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:347
//
// PHASE_TABLE_MAINTENANCE.agc:348
//		TCF	+1		# IT:S A 2PHSCHNG
// slot 10558
                if slot <> 10558 or instruction <> 5439 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5439, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10559 {
// PHASE_TABLE_MAINTENANCE.agc:349
//		CS	TEMPP2
// slot 10559
            if slot <> 10559 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10560 {
// PHASE_TABLE_MAINTENANCE.agc:350
//		LXCH	TEMPP2
// slot 10560
                if slot <> 10560 or instruction <> 9274 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 58, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:351
//		NDX	TEMPG2
// slot 10561
                if slot <> 10561 or instruction <> 20537 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[649] to agcAotUnit649@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:352
//		DXCH	-PHASE1 -2
// slot 10562
    10562, 43986
)).

// bank 10, slots 10563-10567
function agcAotUnit650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10564 {
        if slot <= 10563 {
// PHASE_TABLE_MAINTENANCE.agc:353
//
// PHASE_TABLE_MAINTENANCE.agc:354
//		CCS	TEMPSW2
// slot 10563
            if slot <> 10563 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:355
//		NOOP			# CAN:T GET HERE
// slot 10564
            if slot <> 10564 or instruction <> 5445 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5445, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10565 {
// PHASE_TABLE_MAINTENANCE.agc:356
//		TCF	BELOW2
// slot 10565
            if slot <> 10565 or instruction <> 5449 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5449, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10566 {
// PHASE_TABLE_MAINTENANCE.agc:357
//
// PHASE_TABLE_MAINTENANCE.agc:358
//		CS	TIME1
// slot 10566
                if slot <> 10566 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:359
//		NDX	TEMPG2
// slot 10567
                if slot <> 10567 or instruction <> 20537 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20537, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[650] to agcAotUnit650@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:360
//		TS	TBASE1 -2
// slot 10568
    10568, 46162
)).

// bank 10, slots 10569-10573
function agcAotUnit651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10570 {
        if slot <= 10569 {
// PHASE_TABLE_MAINTENANCE.agc:361
//
// PHASE_TABLE_MAINTENANCE.agc:362
//BELOW2		CCS	TEMPSW		# SEE IF WE SHOULD SET TBASE OR LONGBASE
// slot 10569
            if slot <> 10569 or instruction <> 4149 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:363
//		TCF	BELOW3		# SET LONGBASE ONLY
// slot 10570
            if slot <> 10570 or instruction <> 5461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10571 {
// PHASE_TABLE_MAINTENANCE.agc:364
//		TCF	BELOW4		# SET NEITHER
// slot 10571
            if slot <> 10571 or instruction <> 5464 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5464, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10572 {
// PHASE_TABLE_MAINTENANCE.agc:365
//
// PHASE_TABLE_MAINTENANCE.agc:366
//		CS	TIME1		# SET TBASE TO BEGIN WITH
// slot 10572
                if slot <> 10572 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:367
//		NDX	TEMPG
// slot 10573
                if slot <> 10573 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[651] to agcAotUnit651@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:368
//		TS	TBASE1 -2
// slot 10574
    10574, 46162
)).

// bank 10, slots 10575-10578
function agcAotUnit652 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10576 {
        if slot <= 10575 {
// PHASE_TABLE_MAINTENANCE.agc:369
//
// PHASE_TABLE_MAINTENANCE.agc:370
//		CA	TEMPSW		# SHALL WE NOW SET LONGBASE
// slot 10575
            if slot <> 10575 or instruction <> 12341 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:371
//		AD	BIT14COM
// slot 10576
            if slot <> 10576 or instruction <> 25939 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1363), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10577 {
// PHASE_TABLE_MAINTENANCE.agc:372
//		CCS	A
// slot 10577
            if slot <> 10577 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:373
//		NOOP			# ***** CAN'T GET HERE *****
// slot 10578
            if slot <> 10578 or instruction <> 5459 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5459, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[652] to agcAotUnit652@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:374
//BIT14COM	OCT	17777		# ***** CAN'T GET HERE *****
// slot 10579
    10579, 16382
)).

// bank 10, slots 10580-10585
function agcAotUnit653 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10582 {
        if slot <= 10580 {
// PHASE_TABLE_MAINTENANCE.agc:375
//		TCF	BELOW4		# NO WE NEED ONLY SET TBASE
// slot 10580
            if slot <> 10580 or instruction <> 5464 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5464, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10581 {
// PHASE_TABLE_MAINTENANCE.agc:376
//
// PHASE_TABLE_MAINTENANCE.agc:377
//BELOW3		EXTEND			# SET LONGBASE
// slot 10581
                if slot <> 10581 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:378
//		DCA	TIME2
// slot 10582
                if slot <> 10582 or instruction <> 12309 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10583 {
// PHASE_TABLE_MAINTENANCE.agc:379
//		DXCH	LONGBASE
// slot 10583
            if slot <> 10583 or instruction <> 22110 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 606, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10584 {
// PHASE_TABLE_MAINTENANCE.agc:380
//
// PHASE_TABLE_MAINTENANCE.agc:381
//BELOW4		CS	TEMPP		# AND STORE THE FINAL PART OF THE PHASE
// slot 10584
                if slot <> 10584 or instruction <> 16434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 50).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:382
//		NDX	TEMPG
// slot 10585
                if slot <> 10585 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[653] to agcAotUnit653@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:383
//		TS	-PHASE1 -2
// slot 10586
    10586, 46032
)).

// bank 10, slots 10587-10593
function agcAotUnit654 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10589 {
        if slot <= 10587 {
// PHASE_TABLE_MAINTENANCE.agc:384
//
// PHASE_TABLE_MAINTENANCE.agc:385
//		CA	Q
// slot 10587
            if slot <> 10587 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10588 {
// PHASE_TABLE_MAINTENANCE.agc:386
//		LXCH	TEMPBBCN
// slot 10588
                if slot <> 10588 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:387
//		RELINT
// slot 10589
                if slot <> 10589 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10591 {
            if slot <= 10590 {
// PHASE_TABLE_MAINTENANCE.agc:388
//		DTCB
// slot 10590
                if slot <> 10590 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:389
//CON2		LXCH	TEMPBBCN
// slot 10591
                if slot <> 10591 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10592 {
// PHASE_TABLE_MAINTENANCE.agc:390
//# Page 1413
// PHASE_TABLE_MAINTENANCE.agc:391
//		CA	TEMPP
// slot 10592
                if slot <> 10592 or instruction <> 12338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:392
//		NDX	TEMPG
// slot 10593
                if slot <> 10593 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[654] to agcAotUnit654@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:393
//		TS	PHASE1 -2
// slot 10594
    10594, 46034
)).

// bank 10, slots 10595-10596
function agcAotUnit655 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10595 {
// PHASE_TABLE_MAINTENANCE.agc:394
//
// PHASE_TABLE_MAINTENANCE.agc:395
//		CA	TEMPPR
// slot 10595
        if slot <> 10595 or instruction <> 12344 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 56).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PHASE_TABLE_MAINTENANCE.agc:396
//		NDX	TEMPG
// slot 10596
        if slot <> 10596 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[655] to agcAotUnit655@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:397
//		TS	PHSPRDT1 -2
// slot 10597
    10597, 46164
)).

// bank 10, slots 10598-10600
function agcAotUnit656 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10598 {
// PHASE_TABLE_MAINTENANCE.agc:398
//
// PHASE_TABLE_MAINTENANCE.agc:399
//		EXTEND
// slot 10598
        if slot <> 10598 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10599 {
// PHASE_TABLE_MAINTENANCE.agc:400
//		DCA	TEMPNM
// slot 10599
            if slot <> 10599 or instruction <> 12340 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:401
//		NDX	TEMPG
// slot 10600
            if slot <> 10600 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[656] to agcAotUnit656@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:402
//		DXCH	PHSNAME1 -2
// slot 10601
    10601, 44602
)).

// bank 10, slots 10602-10602
function agcAotUnit657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:403
//
// PHASE_TABLE_MAINTENANCE.agc:404
//		TCF	BELOW1
// slot 10602
    if slot <> 10602 or instruction <> 5436 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5436, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[657] to agcAotUnit657@.

// bank 02, slots 4924-4927
function agcAotUnit211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4925 {
        if slot <= 4924 {
// PHASE_TABLE_MAINTENANCE.agc:405
//
// PHASE_TABLE_MAINTENANCE.agc:406
//		BLOCK	02
// PHASE_TABLE_MAINTENANCE.agc:407
//		SETLOC	FFTAG1
// PHASE_TABLE_MAINTENANCE.agc:408
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:409
//
// PHASE_TABLE_MAINTENANCE.agc:410
//		COUNT	02/PHASE
// PHASE_TABLE_MAINTENANCE.agc:411
//
// PHASE_TABLE_MAINTENANCE.agc:412
//CHECKB		MASK	BIT12		# SINCE THIS IS OF TYPE B, THIS BIT SHOULD
// slot 4924
            if slot <> 4924 or instruction <> 31236 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                if fixedOperand = 2048 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:413
//		CCS	A		# BE HERE IF WE ARE TO GET A NEW PRIORITY
// slot 4925
            if slot <> 4925 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4926 {
// PHASE_TABLE_MAINTENANCE.agc:414
//		TCF	GETPRIO		# IT IS, SO GET NEW PRIORITY
// slot 4926
            if slot <> 4926 or instruction <> 6961 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6961, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:415
//
// PHASE_TABLE_MAINTENANCE.agc:416
//		TCF	OLDPRIO		# IT ISN:T, USE THE OLD PRIORITY
// slot 4927
            if slot <> 4927 or instruction <> 6944 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6944, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[211] to agcAotUnit211@.

