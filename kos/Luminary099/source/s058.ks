// PHASE_TABLE_MAINTENANCE.agc
// bank 02, slots 4809-4809
function agcAotUnit199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:1
//# Copyright:	Public domain.
// PHASE_TABLE_MAINTENANCE.agc:2
//# Filename:	PHASE_TABLE_MAINTENANCE.agc
// PHASE_TABLE_MAINTENANCE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PHASE_TABLE_MAINTENANCE.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// PHASE_TABLE_MAINTENANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PHASE_TABLE_MAINTENANCE.agc:6
//# Assembler:	yaYUL
// PHASE_TABLE_MAINTENANCE.agc:7
//# Contact:	Hommes Kerman <ohommes@cmu.edu>.
// PHASE_TABLE_MAINTENANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PHASE_TABLE_MAINTENANCE.agc:9
//# Pages:	1294-1302
// PHASE_TABLE_MAINTENANCE.agc:10
//# Mod history:	2009-05-26 OH	Transcribed from page images.
// PHASE_TABLE_MAINTENANCE.agc:11
//#		2009-06-05 RSB	A few lines at the bottom of page image
// PHASE_TABLE_MAINTENANCE.agc:12
//#				1294 were truncated.  I've fixed the page
// PHASE_TABLE_MAINTENANCE.agc:13
//#				image and added those missing lines here.
// PHASE_TABLE_MAINTENANCE.agc:14
//#		2011-05-07 JL	Flagged SBANK= workaround for future
// PHASE_TABLE_MAINTENANCE.agc:15
//#				removal.
// PHASE_TABLE_MAINTENANCE.agc:16
//
// PHASE_TABLE_MAINTENANCE.agc:17
//# This source code has been transcribed or otherwise adapted from
// PHASE_TABLE_MAINTENANCE.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PHASE_TABLE_MAINTENANCE.agc:19
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// PHASE_TABLE_MAINTENANCE.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PHASE_TABLE_MAINTENANCE.agc:21
//# in storage size and consequent reduction in image quality as well) are
// PHASE_TABLE_MAINTENANCE.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PHASE_TABLE_MAINTENANCE.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// PHASE_TABLE_MAINTENANCE.agc:24
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// PHASE_TABLE_MAINTENANCE.agc:25
//# actually created.
// PHASE_TABLE_MAINTENANCE.agc:26
//#
// PHASE_TABLE_MAINTENANCE.agc:27
//# Notations on the hardcopy document read, in part:
// PHASE_TABLE_MAINTENANCE.agc:28
//#
// PHASE_TABLE_MAINTENANCE.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PHASE_TABLE_MAINTENANCE.agc:30
//#	16:27 JULY 14, 1969
// PHASE_TABLE_MAINTENANCE.agc:31
//
// PHASE_TABLE_MAINTENANCE.agc:32
//# Page 1294
// PHASE_TABLE_MAINTENANCE.agc:33
//# SUBROUTINE TO UPDATE THE PROGRAM NUMBER DISPLAY ON THE DSKY.
// PHASE_TABLE_MAINTENANCE.agc:34
//
// PHASE_TABLE_MAINTENANCE.agc:35
//		COUNT*	$$/PHASE
// PHASE_TABLE_MAINTENANCE.agc:36
//		BLOCK	02
// PHASE_TABLE_MAINTENANCE.agc:37
//		SETLOC	FFTAG1
// PHASE_TABLE_MAINTENANCE.agc:38
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:39
//
// PHASE_TABLE_MAINTENANCE.agc:40
//NEWMODEX	INDEX	Q		# UPDATE MODREG.  ENTRY FOR MODE IN FIXED.
// slot 4809
    if slot <> 4809 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PHASE_TABLE_MAINTENANCE.agc:41
//		CAF	0
// slot 4810
    4810, 24576
)).

// bank 02, slots 4811-4815
function agcAotUnit200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4812 {
        if slot <= 4811 {
// PHASE_TABLE_MAINTENANCE.agc:42
//		INCR	Q
// slot 4811
            if slot <> 4811 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:43
//
// PHASE_TABLE_MAINTENANCE.agc:44
//NEWMODEA	TS	MODREG		# ENTRY FOR MODE IN A.
// slot 4812
            if slot <> 4812 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4813 {
// PHASE_TABLE_MAINTENANCE.agc:45
//MMDSPLAY	CAF	+3		# DISPLAY MAJOR MODE.
// slot 4813
            if slot <> 4813 or instruction <> 15056 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2768), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4814 {
// PHASE_TABLE_MAINTENANCE.agc:46
//PREBJUMP	LXCH	BBANK		# PUTS BBANK IN L
// slot 4814
                if slot <> 4814 or instruction <> 9222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 6, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:47
//		TCF	BANKJUMP	# PUTS Q INTO A
// slot 4815
                if slot <> 4815 or instruction <> 6560 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6560, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[200] to agcAotUnit200@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:48
//		CADR	SETUPDSP
// slot 4816
    4816, 16662
)).

// bank 02, slots 4817-4817
function agcAotUnit201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:49
//
// PHASE_TABLE_MAINTENANCE.agc:50
//# RETURN TO CALLER +3 IF MODE = THAT AT CALLER +1.  OTHERWISE RETURN TO CALLER +2.
// PHASE_TABLE_MAINTENANCE.agc:51
//
// PHASE_TABLE_MAINTENANCE.agc:52
//CHECKMM		INDEX	Q
// slot 4817
    if slot <> 4817 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PHASE_TABLE_MAINTENANCE.agc:53
//		CS	0
// slot 4818
    4818, 32768
)).

// bank 02, slots 4819-4822
function agcAotUnit202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4820 {
        if slot <= 4819 {
// PHASE_TABLE_MAINTENANCE.agc:54
//		AD	MODREG
// slot 4819
            if slot <> 4819 or instruction <> 25097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:55
//		EXTEND
// slot 4820
            if slot <> 4820 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4821 {
// PHASE_TABLE_MAINTENANCE.agc:56
//		BZF	Q+2
// slot 4821
            if slot <> 4821 or instruction <> 7649 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7649, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:57
//		TCF	Q+1		# NO MATCH
// slot 4822
            if slot <> 4822 or instruction <> 7647 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7647, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[202] to agcAotUnit202@.

// bank 10, slots 10379-10382
function agcAotUnit657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10380 {
        if slot <= 10379 {
// PHASE_TABLE_MAINTENANCE.agc:58
//
// PHASE_TABLE_MAINTENANCE.agc:59
//TCQ		=	Q+2 +1
// PHASE_TABLE_MAINTENANCE.agc:60
//
// PHASE_TABLE_MAINTENANCE.agc:61
//		BANK	14
// PHASE_TABLE_MAINTENANCE.agc:62
//		SETLOC	PHASETAB
// PHASE_TABLE_MAINTENANCE.agc:63
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:64
//
// PHASE_TABLE_MAINTENANCE.agc:65
//		COUNT*	$$/PHASE
// PHASE_TABLE_MAINTENANCE.agc:66
//SETUPDSP	INHINT
// slot 10379
            if slot <> 10379 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:67
//		DXCH	RUPTREG1	# SAVE CALLER'S RETURN 2CADR
// slot 10380
            if slot <> 10380 or instruction <> 21561 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10381 {
// PHASE_TABLE_MAINTENANCE.agc:68
//		CAF	PRIO30		# 	EITHER A TASK OR JOB CAN COME TO
// slot 10381
            if slot <> 10381 or instruction <> 14573 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:69
//		TC	NOVAC		#	NEWMODE X
// slot 10382
            if slot <> 10382 or instruction <> 2618 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2618, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[657] to agcAotUnit657@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:70
//		EBANK=	MODREG
// PHASE_TABLE_MAINTENANCE.agc:71
//		2CADR	DSPMMJOB
// slot 10383 10384
    10383, 3768, 10384, 49284
)).

// bank 10, slots 10385-10387
function agcAotUnit658 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10385 {
// PHASE_TABLE_MAINTENANCE.agc:72
//
// PHASE_TABLE_MAINTENANCE.agc:73
//		DXCH	RUPTREG1
// slot 10385
        if slot <> 10385 or instruction <> 21561 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10386 {
// PHASE_TABLE_MAINTENANCE.agc:74
//		RELINT
// slot 10386
            if slot <> 10386 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:75
//		DXCH	Z		# RETURN
// slot 10387
            if slot <> 10387 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[658] to agcAotUnit658@.

// bank 02, slots 4823-4824
function agcAotUnit203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4823 {
// PHASE_TABLE_MAINTENANCE.agc:76
//
// PHASE_TABLE_MAINTENANCE.agc:77
//DSPMMJOB	EQUALS	DSPMMJB
// PHASE_TABLE_MAINTENANCE.agc:78
//
// PHASE_TABLE_MAINTENANCE.agc:79
//		BLOCK	02
// PHASE_TABLE_MAINTENANCE.agc:80
//		SETLOC	FFTAG1
// PHASE_TABLE_MAINTENANCE.agc:81
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:82
//
// PHASE_TABLE_MAINTENANCE.agc:83
//# Page 1295
// PHASE_TABLE_MAINTENANCE.agc:84
//# PHASCHNG IS THE MAIN WAY OF MAKING PHASE CHANGES FOR RESTARTS.  THERE ARE THREE FORMS OF PHASCHNG, KNOWN AS TYPE
// PHASE_TABLE_MAINTENANCE.agc:85
//# A, TYPE B, AND TYPE C.  THEY ARE ALL CALLED AS FOLLOWS, WHERE OCT XXXXX CONTAINS THE PHASE INFORMATION,
// PHASE_TABLE_MAINTENANCE.agc:86
//#		TC	PHASCHNG
// PHASE_TABLE_MAINTENANCE.agc:87
//#		OCT	XXXXX
// PHASE_TABLE_MAINTENANCE.agc:88
//# TYPE A IS CONCERNED WITH FIXED PHASE CHANGES, THAT IS, PHASE INFORMATION THAT IS STORED PERMANENTLY.  THESE
// PHASE_TABLE_MAINTENANCE.agc:89
//# OPTIONS ARE, WHERE G STANDS FOR A GROUP AND .X FOR THE PHASE,
// PHASE_TABLE_MAINTENANCE.agc:90
//#	G.0		INACTIVE, WILL NOT PERMIT A GROUP G RESTART
// PHASE_TABLE_MAINTENANCE.agc:91
//#	G.1		WILL CAUSE THE LAST DISPLAY TO BE REACTIVATED, USED MAINLY IN MANNED FLIGHTS
// PHASE_TABLE_MAINTENANCE.agc:92
//#	G.EVEN		A DOUBLE TABLE RESTART, CAN CAUSE ANY COMBINATION OF TWO JOBS, TASKS, AND/OR
// PHASE_TABLE_MAINTENANCE.agc:93
//#			LONGCALL TO BE RESTARTED.
// PHASE_TABLE_MAINTENANCE.agc:94
//#	G.ODD NOT .1	A SINGLE TABLE RESTART, CAN CAUSE EITHER A JOB, TASK, OR LONGCALL RESTART.
// PHASE_TABLE_MAINTENANCE.agc:95
//#
// PHASE_TABLE_MAINTENANCE.agc:96
//# THIS INFORMATION IS PUT INTO THE OCTAL WORD AFTER TC PHASCHNG AS FOLLOWS
// PHASE_TABLE_MAINTENANCE.agc:97
//#	TL0 00P PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:98
//# WHERE EACH LETTER OR NUMBER STANTS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1-7, THE P'S FOR THE PHASE,
// PHASE_TABLE_MAINTENANCE.agc:99
//# OCTAL 0 - 127.  0'S MUST BE 0.  IF ONE WISHES TO HAVE THE TBASE OF GROUP G TO BE SET AT THIS TIME,
// PHASE_TABLE_MAINTENANCE.agc:100
//# T IS SET TO 1, OTHERWISE IT IS SET TO 0.  SIMILARLY IF ONE WISHES TO SET LONGBASE, THEN L IS SET TO 1, OTHERWISE
// PHASE_TABLE_MAINTENANCE.agc:101
//# IT IS SET TO 0.  SOME EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:102
//#		TC	PHASCHNG	# THIS WILL CAUSE GROUP 3 TO BE SET TO 0,
// PHASE_TABLE_MAINTENANCE.agc:103
//#		OCT	00003		# MAKING GROUP 3 INACTIVE
// PHASE_TABLE_MAINTENANCE.agc:104
//#
// PHASE_TABLE_MAINTENANCE.agc:105
//#		TC	PHASCHNG	# IF A RESTART OCCURS THIS WOULD CAUSE
// PHASE_TABLE_MAINTENANCE.agc:106
//#		OCT	00012		# GROUP 2 TO RESTART THE LAST DISPLAY
// PHASE_TABLE_MAINTENANCE.agc:107
//#
// PHASE_TABLE_MAINTENANCE.agc:108
//#		TC	PHASCHNG	# THIS SETS THE TBASE OF GROUP 4 AND IN
// PHASE_TABLE_MAINTENANCE.agc:109
//#		OCT	40064		# CASE OF A RESTART WOULD START UP THE TWO
// PHASE_TABLE_MAINTENANCE.agc:110
//#					# THINGS LOCATED IN THE DOUBLE 4.6 RESTART
// PHASE_TABLE_MAINTENANCE.agc:111
//#					# LOCATION.
// PHASE_TABLE_MAINTENANCE.agc:112
//#
// PHASE_TABLE_MAINTENANCE.agc:113
//#		TC	PHASCHNG	# THIS SETS LONGBASE AND UPON A RESTART
// PHASE_TABLE_MAINTENANCE.agc:114
//#		OCT	20135		# CAUSES 5.13 TO BE RESTARTED (SINCE
// PHASE_TABLE_MAINTENANCE.agc:115
//#					# LONGBASE WAS SET THIS SINGLE ENTRY
// PHASE_TABLE_MAINTENANCE.agc:116
//#					# SHOULD BE A LONGCALL)
// PHASE_TABLE_MAINTENANCE.agc:117
//#
// PHASE_TABLE_MAINTENANCE.agc:118
//#		TC	PHASCHNG	# SINCE BOTH TBASE4 AND LONGBASE ARE SET,
// PHASE_TABLE_MAINTENANCE.agc:119
//#		OCT	60124		# 4.12 SHOULD CONTAIN BOTH A TASK AND A
// PHASE_TABLE_MAINTENANCE.agc:120
//#					# LONGCALL TO BE RESTARTED
// PHASE_TABLE_MAINTENANCE.agc:121
//#
// PHASE_TABLE_MAINTENANCE.agc:122
//# TYPE C PHASCHNG CONTAINS THE VARIABLE TYPE OF PHASCHNG INFORMATION.  INSTEAD OF THE INFORMATION BEING IN A
// PHASE_TABLE_MAINTENANCE.agc:123
//# PERMANENT FORM, ONE STORES THE DESIRED RESTART INFORMATION IN A VARIABLE LOCATION.  THE BITS ARE AS FOLLOWS,
// PHASE_TABLE_MAINTENANCE.agc:124
//#	TL0 1AD XXX CJW GGG
// PHASE_TABLE_MAINTENANCE.agc:125
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1 - 7.  IF THE RESTART IS TO
// PHASE_TABLE_MAINTENANCE.agc:126
//# BE BY WAITLIST, W IS SET TO 1, IF IT IS A JOB, J IS SET TO 1, IF IT IS A LONGCALL, C IS SET TO 1.  ONLY ONE OF
// PHASE_TABLE_MAINTENANCE.agc:127
//# THESE THREE BITS MAY BE SET.  X'S ARE IGNORED, 1 MUST BE 1, AND 0 MUST BE 0.  AGAIN T STANDS FOR THE TBASE,
// PHASE_TABLE_MAINTENANCE.agc:128
//# Page 1296
// PHASE_TABLE_MAINTENANCE.agc:129
//# AND L FOR LONGBASE.  THE BITS A AND D ARE CONCERNED WITH THE VARIABLE INFORMATION.  IF D IS SET TO 1, A PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:130
//# OR DELTA TIME WILL BE READ FROM THE NEXT LOCATION AFTER THE OCTAL INFORMATION., IF THIS IS TO BE INDIRECT, THAT
// PHASE_TABLE_MAINTENANCE.agc:131
//# IS, THE NAME OF A LOCATION CONTAINING THE INFORMATION (DELTA TIME ONLY), THEN THIS IS GIVEN AS THE -GENADR OF
// PHASE_TABLE_MAINTENANCE.agc:132
//# THAT LOCATION WHICH CONTAINS THE DELTA TIME.  IF THE OLD PRIORITY OR DELTA TIME IS TO BE USED, THAT WHICH IS
// PHASE_TABLE_MAINTENANCE.agc:133
//# ALREADY IN THE VARIABLE STORAGE, THEN D IS SET TO 0.  NEXT THE A BIT IS USED.  IF IT IS SET TO 0, THE ADDRESS
// PHASE_TABLE_MAINTENANCE.agc:134
//# THAT WOULD BE RESTARTED DURING A RESTART IS THE NEXT LOCATION AFTER THE PHASE INFORMATION, THAT IS, EITHER
// PHASE_TABLE_MAINTENANCE.agc:135
//# (TC PHASCHNG) +2 OR +3, DEPENDING ON WHETHER D HAD BEEN SET OR NOT.  IF A IS SET TO 1, THEN THE ADDRESS THAT
// PHASE_TABLE_MAINTENANCE.agc:136
//# WOULD BE RESTARTED IS THE 2CADR THAT IS READ FROM THE NEXT TWO LOCATION.  EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:137
//#	AD	TC	PHASCHNG	# THIS WOULD CAUSE LOCATION AD +3 TO BE
// PHASE_TABLE_MAINTENANCE.agc:138
//#	AD+1	OCT	05023		# RESTARTED BY GROUP THREE WITH A PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:139
//#	AD+2	OCT	23000		# OF 23.  NOTE UPON RETURNING IT WOULD
// PHASE_TABLE_MAINTENANCE.agc:140
//#	AD+3				# ALSO GO TO AD+3
// PHASE_TABLE_MAINTENANCE.agc:141
//#
// PHASE_TABLE_MAINTENANCE.agc:142
//#	AD	TC	PHASCHNG	# GROUP 1 WOULD CAUSE CALLCALL TO BE
// PHASE_TABLE_MAINTENANCE.agc:143
//#	AD+1	OCT	27441		# BE STARTED AS A LONGCALL FROM THE TIME
// PHASE_TABLE_MAINTENANCE.agc:144
//#	AD+2	-GENADR	DELTIME		# STORED IN LONGBASE (LONGBASE WAS SET) BY
// PHASE_TABLE_MAINTENANCE.agc:145
//#	AD+3	2CADR	CALLCALL	# A DELTA TIME STORED IN DELTIME.  THE
// PHASE_TABLE_MAINTENANCE.agc:146
//#	AD+4				# BBCON OF THE 2CADR SHOULD CONTAIN THE E
// PHASE_TABLE_MAINTENANCE.agc:147
//#	AD+5				# BANK OF DELTIME.  PHASCHNG RETURNS TO
// PHASE_TABLE_MAINTENANCE.agc:148
//#					# LOCATION AD+5
// PHASE_TABLE_MAINTENANCE.agc:149
//#
// PHASE_TABLE_MAINTENANCE.agc:150
//# NOTE THAT IF A VARIABLE PRIORITY IS GIVEN FOR A JOB, THE JOB WILL BE RESTARTED AS A NOVAC IF THE PRIORITY IS
// PHASE_TABLE_MAINTENANCE.agc:151
//# NEGATIVE, AS A FINDVAC IF THE PRIORITY IS POSITIVE.
// PHASE_TABLE_MAINTENANCE.agc:152
//#
// PHASE_TABLE_MAINTENANCE.agc:153
//# TYPE B PHASCHNG IS A COMBINATION OF VARIABLE AND FIXED PHASE CHANGES.  IT WILL START UP A JOB AS INDICATED
// PHASE_TABLE_MAINTENANCE.agc:154
//# BELOW AND ALSO START UP ONE FIXED RESTART, THAT IS EITHER AN G.1 OR A G.ODD OR THE FIRST ENTRY OF G.EVEN
// PHASE_TABLE_MAINTENANCE.agc:155
//# DOUBLE ENTRY.  THE BIT INFORMATION IS AS FOLLOW,
// PHASE_TABLE_MAINTENANCE.agc:156
//#	TL1 DAP PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:157
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1 - 7, THE P'S FOR THE FIXED
// PHASE_TABLE_MAINTENANCE.agc:158
//# PHASE INFORMATION, OCTAL 0 - 127.  1 MUST BE 1.  AND AGAIN T STANDS FOR THE TBASE AND L FOR LONGBASE.  D THIS
// PHASE_TABLE_MAINTENANCE.agc:159
//# TIME STANDS ONLY FOR PRIORITY SINCE THIS WILL BE CONSIDERED A JOB, AND IT MUST BE GIVEN DIRECTLY IF GIVEN.
// PHASE_TABLE_MAINTENANCE.agc:160
//# AGAIN A STANDS FOR THE ADDRESS OF THE LOCATION TO BE RESTARTED, 1 IF THE 2CADR IS GIVEN, OR 0 IF IT IS TO BE
// PHASE_TABLE_MAINTENANCE.agc:161
//# THE NEXT LOCATION.  (THE RETURN LOCATION OF PHASCHNG) EXAMPLES,
// PHASE_TABLE_MAINTENANCE.agc:162
//#	AD	TC	PHASCHNG	# TBASE IS SET AND A RESTART CAUSE GROUP 3
// PHASE_TABLE_MAINTENANCE.agc:163
//#	AD+1	OCT	56043		# TO START THE JOB AJOBAJOB WITH PRIORITY
// PHASE_TABLE_MAINTENANCE.agc:164
//#	AD+2	OCT	31000		# 31 AND THE FIRST ENTRY OF 3.4SPOT (WE CAN
// PHASE_TABLE_MAINTENANCE.agc:165
//#	AD+3	2CADR	AJOBAJOB	# ASSUME IT IS A TASK SINCE WE SET TBASE3)
// PHASE_TABLE_MAINTENANCE.agc:166
//#	AD+4				# UPON RETURN FROM PHASCHNG CONTROL WOULD
// PHASE_TABLE_MAINTENANCE.agc:167
//#	AD+5				# GO TO AD+5
// PHASE_TABLE_MAINTENANCE.agc:168
//#
// PHASE_TABLE_MAINTENANCE.agc:169
//#	AD	TC	PHASCHNG	# UPON A RESTART THE LAST DISPLAY WOULD BE
// PHASE_TABLE_MAINTENANCE.agc:170
//#	AD+1	OCT	10015		# RESTARTED AND A JOB WITH THE PREVIOUSLY
// PHASE_TABLE_MAINTENANCE.agc:171
//#	AD+2				# STORED PRIORITY WOULD BE BEGUN AT AD+2
// PHASE_TABLE_MAINTENANCE.agc:172
//#					# BY MEANS OF GROUP 5
// PHASE_TABLE_MAINTENANCE.agc:173
//# Page 1297
// PHASE_TABLE_MAINTENANCE.agc:174
//# THE NOVAC-FINDVAC CHOICE FOR JOBS HOLDS HERE ALSO -- NEGATIVE PRIORITY CAUSES A NOVAC CALL, POSITIVE A FINDVAC.
// PHASE_TABLE_MAINTENANCE.agc:175
//
// PHASE_TABLE_MAINTENANCE.agc:176
//# SUMMARY OF BITS:
// PHASE_TABLE_MAINTENANCE.agc:177
//#	TYPE A		TL0 00P PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:178
//#	TYPE B		TL1 DAP PPP PPP GGG
// PHASE_TABLE_MAINTENANCE.agc:179
//#	TYPE C		TL0 1AD XXX CJW GGG
// PHASE_TABLE_MAINTENANCE.agc:180
//
// PHASE_TABLE_MAINTENANCE.agc:181
//# Page 1298
// PHASE_TABLE_MAINTENANCE.agc:182
//# 2PHSCHNG IS USED WHEN ONE WISHES TO START UP A GROUP OR CHANGE A GROUP WHILE UNDER THE CONTROL OF A DIFFERENT
// PHASE_TABLE_MAINTENANCE.agc:183
//# GROUP.  FOR EXAMPLE, CHANGE THE PHASE OF GROUP 3 WHILE THE PORTION OF THE PROGRAM IS UNDER GROUP 5.  ALL 2PHSCHNG
// PHASE_TABLE_MAINTENANCE.agc:184
//# CALLS ARE MADE IN THE FOLLOWING MANNER,
// PHASE_TABLE_MAINTENANCE.agc:185
//#		TC	2PHSCHNG
// PHASE_TABLE_MAINTENANCE.agc:186
//#		OCT	XXXXX
// PHASE_TABLE_MAINTENANCE.agc:187
//#		OCT	YYYYY
// PHASE_TABLE_MAINTENANCE.agc:188
//# WHERE OCT XXXXX MUST BE OF TYPE A AND OCT YYYYY MAY BE OF EITHER TYPE A OR TYPE B OR TYPE C.  THERE IS ONE
// PHASE_TABLE_MAINTENANCE.agc:189
//# DIFFERENCE --- NOTE: IF LONGBASE IS TO BE SET THIS INFORMATION IS GIVEN IN THE OCT YYYYY INFORMATION, IT WILL
// PHASE_TABLE_MAINTENANCE.agc:190
//# BE DISREGARDED IF GIVEN WITH THE OCT XXXXX INFORMATION.  A COUPLE OF EXAMPLES MAY HELP,
// PHASE_TABLE_MAINTENANCE.agc:191
//#	AD	TC	2PHACHNG	# SET TBASE3 AND IF A RESTART OCCURS START
// PHASE_TABLE_MAINTENANCE.agc:192
//#	AD+1	OCT	40083		# THE TWO ENTRIES IN 3.8 TABLE LOCATION
// PHASE_TABLE_MAINTENANCE.agc:193
//#	AD+2	OCT	05025		# THIS IS OF TYPE C, SET THE JOB TO BE
// PHASE_TABLE_MAINTENANCE.agc:194
//#	AD+3	OCT	18000		# TO BE LOCATION AD+4, WITH A PRIORITY 18,
// PHASE_TABLE_MAINTENANCE.agc:195
//#	AD+4				# FOR GROUP 5 PHASE INFORMATION.
// PHASE_TABLE_MAINTENANCE.agc:196
//
// PHASE_TABLE_MAINTENANCE.agc:197
//## [WORKAROUND] RSB 2004
// PHASE_TABLE_MAINTENANCE.agc:198
//		SBANK=	PINSUPER
// PHASE_TABLE_MAINTENANCE.agc:199
//## [WORKAROUND]
// PHASE_TABLE_MAINTENANCE.agc:200
//
// PHASE_TABLE_MAINTENANCE.agc:201
//		COUNT*	$$/PHASE
// PHASE_TABLE_MAINTENANCE.agc:202
//2PHSCHNG	INHINT			# THE ENTRY FOR A DOUBLE PHASE CHANGE
// slot 4823
        if slot <> 4823 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PHASE_TABLE_MAINTENANCE.agc:203
//		NDX	Q
// slot 4824
        if slot <> 4824 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PHASE_TABLE_MAINTENANCE.agc:204
//		CA	0
// slot 4825
    4825, 24576
)).

// bank 02, slots 4826-4838
function agcAotUnit204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4831 {
        if slot <= 4828 {
            if slot <= 4826 {
// PHASE_TABLE_MAINTENANCE.agc:205
//		INCR	Q
// slot 4826
                if slot <> 4826 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4827 {
// PHASE_TABLE_MAINTENANCE.agc:206
//		TS	TEMPP2
// slot 4827
                    if slot <> 4827 or instruction <> 22586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:207
//
// PHASE_TABLE_MAINTENANCE.agc:208
//		MASK	OCT7
// slot 4828
                    if slot <> 4828 or instruction <> 31215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4829 {
// PHASE_TABLE_MAINTENANCE.agc:209
//		DOUBLE
// slot 4829
                if slot <> 4829 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4830 {
// PHASE_TABLE_MAINTENANCE.agc:210
//		TS	TEMPG2
// slot 4830
                    if slot <> 4830 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:211
//
// PHASE_TABLE_MAINTENANCE.agc:212
//		CA	TEMPP2
// slot 4831
                    if slot <> 4831 or instruction <> 12346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 58).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4834 {
            if slot <= 4832 {
// PHASE_TABLE_MAINTENANCE.agc:213
//		MASK	OCT17770	# NEED ONLY 1770, BUT WHY GET A NEW CONST.
// slot 4832
                if slot <> 4832 or instruction <> 31256 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2584), 32768).
                    if fixedOperand = 8184 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 1024) * 8).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4833 {
// PHASE_TABLE_MAINTENANCE.agc:214
//		EXTEND
// slot 4833
                    if slot <> 4833 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:215
//		MP	BIT12
// slot 4834
                    if slot <> 4834 or instruction <> 31200 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2528, readEffective:call(words, 2528)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4836 {
                if slot <= 4835 {
// PHASE_TABLE_MAINTENANCE.agc:216
//		XCH	TEMPP2
// slot 4835
                    if slot <> 4835 or instruction <> 23610 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 58, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:217
//
// PHASE_TABLE_MAINTENANCE.agc:218
//		MASK	BIT15
// slot 4836
                    if slot <> 4836 or instruction <> 31197 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 4837 {
// PHASE_TABLE_MAINTENANCE.agc:219
//		TS	TEMPSW2		# INDICATES WHETHER TO SET TBASE OR NOT
// slot 4837
                    if slot <> 4837 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:220
//
// PHASE_TABLE_MAINTENANCE.agc:221
//		INDEX	Q
// slot 4838
                    if slot <> 4838 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[204] to agcAotUnit204@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:222
//		CA	0
// slot 4839
    4839, 24576
)).

// bank 02, slots 4840-4844
function agcAotUnit205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4841 {
        if slot <= 4840 {
// PHASE_TABLE_MAINTENANCE.agc:223
//		INCR	Q
// slot 4840
            if slot <> 4840 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:224
//		TS	TEMPSW
// slot 4841
            if slot <> 4841 or instruction <> 22581 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22581, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4842 {
// PHASE_TABLE_MAINTENANCE.agc:225
//
// PHASE_TABLE_MAINTENANCE.agc:226
//		TCF	PHASJUMP
// slot 4842
            if slot <> 4842 or instruction <> 6899 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6899, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4843 {
// PHASE_TABLE_MAINTENANCE.agc:227
//
// PHASE_TABLE_MAINTENANCE.agc:228
//PHASCHNG	INHINT			# NORMAL PHASCHNG ENTRY POINT.
// slot 4843
                if slot <> 4843 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:229
//		INDEX	Q
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
        }
    }
}
set agcAotRoutes[205] to agcAotUnit205@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:230
//		CA	0
// slot 4845
    4845, 24576
)).

// bank 02, slots 4846-4853
function agcAotUnit206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4849 {
        if slot <= 4847 {
            if slot <= 4846 {
// PHASE_TABLE_MAINTENANCE.agc:231
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
// PHASE_TABLE_MAINTENANCE.agc:232
//PHSCHNGA	INHINT			# FIRST OCTAL PARAMETER IN A.
// slot 4847
                if slot <> 4847 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4848 {
// PHASE_TABLE_MAINTENANCE.agc:233
//# Page 1299
// PHASE_TABLE_MAINTENANCE.agc:234
//		TS	TEMPSW
// slot 4848
                if slot <> 4848 or instruction <> 22581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22581, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:235
//		CA	ONE
// slot 4849
                if slot <> 4849 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
        if slot <= 4851 {
            if slot <= 4850 {
// PHASE_TABLE_MAINTENANCE.agc:236
//		TS	TEMPSW2
// slot 4850
                if slot <> 4850 or instruction <> 22582 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22582, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:237
//PHASJUMP	EXTEND
// slot 4851
                if slot <> 4851 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4852 {
// PHASE_TABLE_MAINTENANCE.agc:238
//		DCA	ADRPCHN2	# OFF TO SWITCHED BANK
// slot 4852
                if slot <> 4852 or instruction <> 15095 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2807, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:239
//		DTCB
// slot 4853
                if slot <> 4853 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[206] to agcAotUnit206@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:240
//
// PHASE_TABLE_MAINTENANCE.agc:241
//		EBANK=	LST1
// PHASE_TABLE_MAINTENANCE.agc:242
//ADRPCHN2	2CADR	PHSCHNG2
// slot 4854 4855
    4854, 2344, 4855, 16518
)).

// bank 02, slots 4856-4866
function agcAotUnit207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4860 {
        if slot <= 4857 {
            if slot <= 4856 {
// PHASE_TABLE_MAINTENANCE.agc:243
//
// PHASE_TABLE_MAINTENANCE.agc:244
//ONEORTWO	LXCH	TEMPBBCN
// slot 4856
                if slot <> 4856 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:245
//		LXCH	BBANK
// slot 4857
                if slot <> 4857 or instruction <> 9222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 6, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4858 {
// PHASE_TABLE_MAINTENANCE.agc:246
//		LXCH	TEMPBBCN
// slot 4858
                if slot <> 4858 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4859 {
// PHASE_TABLE_MAINTENANCE.agc:247
//
// PHASE_TABLE_MAINTENANCE.agc:248
//		MASK	OCT14000	# SEE WHAT KIND OF PHASE CHANGE IT IS
// slot 4859
                    if slot <> 4859 or instruction <> 31252 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                        if fixedOperand = 6144 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 4) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:249
//		CCS	A
// slot 4860
                    if slot <> 4860 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 4863 {
            if slot <= 4861 {
// PHASE_TABLE_MAINTENANCE.agc:250
//		TCF	CHECKB		# IT IS OF TYPE `B'.
// slot 4861
                if slot <> 4861 or instruction <> 8168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8168, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4862 {
// PHASE_TABLE_MAINTENANCE.agc:251
//
// PHASE_TABLE_MAINTENANCE.agc:252
//		CA	TEMPP
// slot 4862
                    if slot <> 4862 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:253
//		MASK	BIT7
// slot 4863
                    if slot <> 4863 or instruction <> 31205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
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
            if slot <= 4864 {
// PHASE_TABLE_MAINTENANCE.agc:254
//		CCS	A		# SHALL WE USE THE OLD PRIORITY
// slot 4864
                if slot <> 4864 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4865 {
// PHASE_TABLE_MAINTENANCE.agc:255
//		TCF	GETPRIO		# NO GET A NEW PRIORITY (OR DELTA T)
// slot 4865
                    if slot <> 4865 or instruction <> 6931 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:256
//
// PHASE_TABLE_MAINTENANCE.agc:257
//OLDPRIO		NDX	TEMPG		# USE THE OLD PRIORITY (OR DELTA T)
// slot 4866
                    if slot <> 4866 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[207] to agcAotUnit207@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:258
//		CA	PHSPRDT1 -2
// slot 4867
    4867, 25684
)).

// bank 02, slots 4868-4881
function agcAotUnit208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4874 {
        if slot <= 4870 {
            if slot <= 4868 {
// PHASE_TABLE_MAINTENANCE.agc:259
//		TS	TEMPPR
// slot 4868
                if slot <> 4868 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4869 {
// PHASE_TABLE_MAINTENANCE.agc:260
//
// PHASE_TABLE_MAINTENANCE.agc:261
//CON1		CA	TEMPP		# SEE IF A 2CADR IS GIVEN
// slot 4869
                    if slot <> 4869 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:262
//		MASK 	BIT8
// slot 4870
                    if slot <> 4870 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
            if slot <= 4872 {
                if slot <= 4871 {
// PHASE_TABLE_MAINTENANCE.agc:263
//		CCS	A
// slot 4871
                    if slot <> 4871 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:264
//		TCF	GETNEWNM
// slot 4872
                    if slot <> 4872 or instruction <> 6935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4873 {
// PHASE_TABLE_MAINTENANCE.agc:265
//
// PHASE_TABLE_MAINTENANCE.agc:266
//		CA	Q
// slot 4873
                    if slot <> 4873 or instruction <> 12290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:267
//		TS	TEMPNM
// slot 4874
                    if slot <> 4874 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4877 {
            if slot <= 4875 {
// PHASE_TABLE_MAINTENANCE.agc:268
//		CA	BB
// slot 4875
                if slot <> 4875 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4876 {
// PHASE_TABLE_MAINTENANCE.agc:269
//		EXTEND			# PICK UP USER'S SUPERBANK
// slot 4876
                    if slot <> 4876 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:270
//		ROR	SUPERBNK
// slot 4877
                    if slot <> 4877 or instruction <> 2055 { return choose false if checkOnly else -1. }
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
            if slot <= 4879 {
                if slot <= 4878 {
// PHASE_TABLE_MAINTENANCE.agc:271
//		TS	TEMPBB
// slot 4878
                    if slot <> 4878 or instruction <> 22580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22580, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:272
//
// PHASE_TABLE_MAINTENANCE.agc:273
//TOCON2		CA	CON2ADR		# BACK TO SWITCHED BANK
// slot 4879
                    if slot <> 4879 or instruction <> 15122 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2834), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4880 {
// PHASE_TABLE_MAINTENANCE.agc:274
//		LXCH	TEMPBBCN
// slot 4880
                    if slot <> 4880 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:275
//		DTCB
// slot 4881
                    if slot <> 4881 or instruction <> 21510 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[208] to agcAotUnit208@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:276
//
// PHASE_TABLE_MAINTENANCE.agc:277
//CON2ADR		GENADR	CON2
// slot 4882
    4882, 2452
)).

// bank 02, slots 4883-4883
function agcAotUnit209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:278
//
// PHASE_TABLE_MAINTENANCE.agc:279
//GETPRIO		NDX	Q		# DON'T CARE IF DIRECT OR INDIRECT
// slot 4883
    if slot <> 4883 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[209] to agcAotUnit209@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:280
//		CA	0		# LEAVE THAT DECISION TO RESTARTS
// slot 4884
    4884, 24576
)).

// bank 02, slots 4885-4888
function agcAotUnit210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4886 {
        if slot <= 4885 {
// PHASE_TABLE_MAINTENANCE.agc:281
//		INCR	Q		# OBTAIN RETURN ADDRESS
// slot 4885
            if slot <> 4885 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:282
//# Page 1300
// PHASE_TABLE_MAINTENANCE.agc:283
//		TCF	CON1 -1
// slot 4886
            if slot <> 4886 or instruction <> 6916 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6916, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4887 {
// PHASE_TABLE_MAINTENANCE.agc:284
//
// PHASE_TABLE_MAINTENANCE.agc:285
//GETNEWNM	EXTEND
// slot 4887
            if slot <> 4887 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:286
//		INDEX	Q
// slot 4888
            if slot <> 4888 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[210] to agcAotUnit210@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:287
//		DCA	0
// slot 4889
    4889, 24578
)).

// bank 02, slots 4890-4893
function agcAotUnit211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4891 {
        if slot <= 4890 {
// PHASE_TABLE_MAINTENANCE.agc:288
//		DXCH	TEMPNM
// slot 4890
            if slot <> 4890 or instruction <> 21556 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:289
//		CA	TWO
// slot 4891
            if slot <> 4891 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
        if slot <= 4892 {
// PHASE_TABLE_MAINTENANCE.agc:290
//		ADS	Q		# OBTAIN RETURN ADDRESS
// slot 4892
            if slot <> 4892 or instruction <> 11266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:291
//
// PHASE_TABLE_MAINTENANCE.agc:292
//		TCF	TOCON2
// slot 4893
            if slot <> 4893 or instruction <> 6927 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6927, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[211] to agcAotUnit211@.

// bank 10, slots 10388-10405
function agcAotUnit659 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10396 {
        if slot <= 10391 {
            if slot <= 10389 {
                if slot <= 10388 {
// PHASE_TABLE_MAINTENANCE.agc:293
//
// PHASE_TABLE_MAINTENANCE.agc:294
//OCT14000	EQUALS	PRIO14
// PHASE_TABLE_MAINTENANCE.agc:295
//TEMPG		EQUALS	ITEMP1
// PHASE_TABLE_MAINTENANCE.agc:296
//TEMPP		EQUALS	ITEMP2
// PHASE_TABLE_MAINTENANCE.agc:297
//TEMPNM		EQUALS	ITEMP3
// PHASE_TABLE_MAINTENANCE.agc:298
//TEMPBB		EQUALS	ITEMP4
// PHASE_TABLE_MAINTENANCE.agc:299
//TEMPSW		EQUALS	ITEMP5
// PHASE_TABLE_MAINTENANCE.agc:300
//TEMPSW2		EQUALS	ITEMP6
// PHASE_TABLE_MAINTENANCE.agc:301
//TEMPPR		EQUALS	RUPTREG1
// PHASE_TABLE_MAINTENANCE.agc:302
//TEMPG2		EQUALS	RUPTREG2
// PHASE_TABLE_MAINTENANCE.agc:303
//TEMPP2		EQUALS	RUPTREG3
// PHASE_TABLE_MAINTENANCE.agc:304
//
// PHASE_TABLE_MAINTENANCE.agc:305
//TEMPBBCN	EQUALS	RUPTREG4
// PHASE_TABLE_MAINTENANCE.agc:306
//BB		EQUALS	BBANK
// PHASE_TABLE_MAINTENANCE.agc:307
//
// PHASE_TABLE_MAINTENANCE.agc:308
//		BANK	14
// PHASE_TABLE_MAINTENANCE.agc:309
//		SETLOC	PHASETAB
// PHASE_TABLE_MAINTENANCE.agc:310
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:311
//
// PHASE_TABLE_MAINTENANCE.agc:312
//		EBANK=	PHSNAME1
// PHASE_TABLE_MAINTENANCE.agc:313
//		COUNT*	$$/PHASE
// PHASE_TABLE_MAINTENANCE.agc:314
//PHSCHNG2	LXCH	TEMPBBCN
// slot 10388
                    if slot <> 10388 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:315
//		CA	TEMPSW
// slot 10389
                    if slot <> 10389 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10390 {
// PHASE_TABLE_MAINTENANCE.agc:316
//		MASK	OCT7
// slot 10390
                    if slot <> 10390 or instruction <> 31215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                        if fixedOperand = 7 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:317
//		DOUBLE
// slot 10391
                    if slot <> 10391 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
            if slot <= 10393 {
                if slot <= 10392 {
// PHASE_TABLE_MAINTENANCE.agc:318
//		TS	TEMPG
// slot 10392
                    if slot <> 10392 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:319
//
// PHASE_TABLE_MAINTENANCE.agc:320
//		CA	TEMPSW
// slot 10393
                    if slot <> 10393 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10394 {
// PHASE_TABLE_MAINTENANCE.agc:321
//		MASK	OCT17770
// slot 10394
                    if slot <> 10394 or instruction <> 31256 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2584), 32768).
                        if fixedOperand = 8184 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 1024) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10395 {
// PHASE_TABLE_MAINTENANCE.agc:322
//		EXTEND
// slot 10395
                        if slot <> 10395 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PHASE_TABLE_MAINTENANCE.agc:323
//		MP	BIT12
// slot 10396
                        if slot <> 10396 or instruction <> 31200 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2528, readEffective:call(words, 2528)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 10400 {
            if slot <= 10398 {
                if slot <= 10397 {
// PHASE_TABLE_MAINTENANCE.agc:324
//		TS	TEMPP
// slot 10397
                    if slot <> 10397 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:325
//
// PHASE_TABLE_MAINTENANCE.agc:326
//		CA	TEMPSW
// slot 10398
                    if slot <> 10398 or instruction <> 12341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10399 {
// PHASE_TABLE_MAINTENANCE.agc:327
//		MASK	OCT60000
// slot 10399
                    if slot <> 10399 or instruction <> 30785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2113), 32768).
                        if fixedOperand = 24576 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 4) * 8192).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:328
//		XCH	TEMPSW
// slot 10400
                    if slot <> 10400 or instruction <> 23605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 53, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 10402 {
                if slot <= 10401 {
// PHASE_TABLE_MAINTENANCE.agc:329
//		MASK	OCT14000
// slot 10401
                    if slot <> 10401 or instruction <> 31252 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                        if fixedOperand = 6144 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 4) * 2048).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PHASE_TABLE_MAINTENANCE.agc:330
//		CCS	A
// slot 10402
                    if slot <> 10402 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 10403 {
// PHASE_TABLE_MAINTENANCE.agc:331
//# Page 1301
// PHASE_TABLE_MAINTENANCE.agc:332
//		TCF	ONEORTWO
// slot 10403
                    if slot <> 10403 or instruction <> 6904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6904, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10404 {
// PHASE_TABLE_MAINTENANCE.agc:333
//
// PHASE_TABLE_MAINTENANCE.agc:334
//		CA	TEMPP		# START STORING THE PHASE INFORMATION
// slot 10404
                        if slot <> 10404 or instruction <> 12338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 50).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PHASE_TABLE_MAINTENANCE.agc:335
//		NDX	TEMPG
// slot 10405
                        if slot <> 10405 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[659] to agcAotUnit659@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:336
//		TS	PHASE1 -2
// slot 10406
    10406, 46034
)).

// bank 10, slots 10407-10412
function agcAotUnit660 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10409 {
        if slot <= 10407 {
// PHASE_TABLE_MAINTENANCE.agc:337
//
// PHASE_TABLE_MAINTENANCE.agc:338
//BELOW1		CCS	TEMPSW2		# IS IT A PHASCHNG OR A 2PHSCHNG
// slot 10407
            if slot <> 10407 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10408 {
// PHASE_TABLE_MAINTENANCE.agc:339
//		TCF	BELOW2		# IT'S A PHASCHNG
// slot 10408
                if slot <> 10408 or instruction <> 5300 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5300, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:340
//
// PHASE_TABLE_MAINTENANCE.agc:341
//		TCF	+1		# IT'S A 2PHSCHNG
// slot 10409
                if slot <> 10409 or instruction <> 5290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5290, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10410 {
// PHASE_TABLE_MAINTENANCE.agc:342
//		CS	TEMPP2
// slot 10410
            if slot <> 10410 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10411 {
// PHASE_TABLE_MAINTENANCE.agc:343
//		LXCH	TEMPP2
// slot 10411
                if slot <> 10411 or instruction <> 9274 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 58, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:344
//		NDX	TEMPG2
// slot 10412
                if slot <> 10412 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[660] to agcAotUnit660@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:345
//		DXCH	-PHASE1 -2
// slot 10413
    10413, 43986
)).

// bank 10, slots 10414-10418
function agcAotUnit661 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10415 {
        if slot <= 10414 {
// PHASE_TABLE_MAINTENANCE.agc:346
//
// PHASE_TABLE_MAINTENANCE.agc:347
//		CCS	TEMPSW2
// slot 10414
            if slot <> 10414 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:348
//		NOOP			# CAN'T GET HERE
// slot 10415
            if slot <> 10415 or instruction <> 5296 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5296, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10416 {
// PHASE_TABLE_MAINTENANCE.agc:349
//		TCF	BELOW2
// slot 10416
            if slot <> 10416 or instruction <> 5300 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5300, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10417 {
// PHASE_TABLE_MAINTENANCE.agc:350
//
// PHASE_TABLE_MAINTENANCE.agc:351
//		CS	TIME1
// slot 10417
                if slot <> 10417 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:352
//		NDX	TEMPG2
// slot 10418
                if slot <> 10418 or instruction <> 20537 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[661] to agcAotUnit661@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:353
//		TS	TBASE1 -2
// slot 10419
    10419, 46162
)).

// bank 10, slots 10420-10424
function agcAotUnit662 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10421 {
        if slot <= 10420 {
// PHASE_TABLE_MAINTENANCE.agc:354
//
// PHASE_TABLE_MAINTENANCE.agc:355
//BELOW2		CCS	TEMPSW		# SEE IF WE SHOULD SET TBASE OR LONGBASE
// slot 10420
            if slot <> 10420 or instruction <> 4149 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:356
//		TCF	BELOW3		# SET LONGBASE ONLY
// slot 10421
            if slot <> 10421 or instruction <> 5312 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5312, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10422 {
// PHASE_TABLE_MAINTENANCE.agc:357
//		TCF	BELOW4		# SET NEITHER
// slot 10422
            if slot <> 10422 or instruction <> 5315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10423 {
// PHASE_TABLE_MAINTENANCE.agc:358
//
// PHASE_TABLE_MAINTENANCE.agc:359
//		CS	TIME1		# SET TBASE TO BEGIN WITH
// slot 10423
                if slot <> 10423 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:360
//		NDX	TEMPG
// slot 10424
                if slot <> 10424 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[662] to agcAotUnit662@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:361
//		TS	TBASE1 -2
// slot 10425
    10425, 46162
)).

// bank 10, slots 10426-10429
function agcAotUnit663 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10427 {
        if slot <= 10426 {
// PHASE_TABLE_MAINTENANCE.agc:362
//
// PHASE_TABLE_MAINTENANCE.agc:363
//		CA	TEMPSW		# SHALL WE NOW SET LONGBASE
// slot 10426
            if slot <> 10426 or instruction <> 12341 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:364
//		AD	BIT14COM
// slot 10427
            if slot <> 10427 or instruction <> 25790 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1214), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10428 {
// PHASE_TABLE_MAINTENANCE.agc:365
//		CCS	A
// slot 10428
            if slot <> 10428 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:366
//		NOOP			# ***** CAN'T GET HERE *****
// slot 10429
            if slot <> 10429 or instruction <> 5310 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5310, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[663] to agcAotUnit663@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:367
//BIT14COM	OCT	17777		# ***** CAN'T GET HERE *****
// slot 10430
    10430, 16382
)).

// bank 10, slots 10431-10436
function agcAotUnit664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10433 {
        if slot <= 10431 {
// PHASE_TABLE_MAINTENANCE.agc:368
//		TCF	BELOW4		# NO WE NEED ONLY SET TBASE
// slot 10431
            if slot <> 10431 or instruction <> 5315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10432 {
// PHASE_TABLE_MAINTENANCE.agc:369
//
// PHASE_TABLE_MAINTENANCE.agc:370
//BELOW3		EXTEND			# SET LONGBASE
// slot 10432
                if slot <> 10432 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:371
//		DCA	TIME2
// slot 10433
                if slot <> 10433 or instruction <> 12309 { return choose false if checkOnly else -1. }
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
        if slot <= 10434 {
// PHASE_TABLE_MAINTENANCE.agc:372
//		DXCH	LONGBASE
// slot 10434
            if slot <> 10434 or instruction <> 22122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 618, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10435 {
// PHASE_TABLE_MAINTENANCE.agc:373
//
// PHASE_TABLE_MAINTENANCE.agc:374
//BELOW4		CS	TEMPP		# AND STORE THE FINAL PART OF THE PHASE
// slot 10435
                if slot <> 10435 or instruction <> 16434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 50).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:375
//		NDX	TEMPG
// slot 10436
                if slot <> 10436 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[664] to agcAotUnit664@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:376
//		TS	-PHASE1 -2
// slot 10437
    10437, 46032
)).

// bank 10, slots 10438-10444
function agcAotUnit665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10440 {
        if slot <= 10438 {
// PHASE_TABLE_MAINTENANCE.agc:377
//
// PHASE_TABLE_MAINTENANCE.agc:378
//		CA	Q
// slot 10438
            if slot <> 10438 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10439 {
// PHASE_TABLE_MAINTENANCE.agc:379
//		LXCH	TEMPBBCN
// slot 10439
                if slot <> 10439 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:380
//		RELINT
// slot 10440
                if slot <> 10440 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 10442 {
            if slot <= 10441 {
// PHASE_TABLE_MAINTENANCE.agc:381
//		DTCB
// slot 10441
                if slot <> 10441 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:382
//# Page 1302
// PHASE_TABLE_MAINTENANCE.agc:383
//CON2		LXCH	TEMPBBCN
// slot 10442
                if slot <> 10442 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 10443 {
// PHASE_TABLE_MAINTENANCE.agc:384
//
// PHASE_TABLE_MAINTENANCE.agc:385
//		CA	TEMPP
// slot 10443
                if slot <> 10443 or instruction <> 12338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PHASE_TABLE_MAINTENANCE.agc:386
//		NDX	TEMPG
// slot 10444
                if slot <> 10444 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[665] to agcAotUnit665@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:387
//		TS	PHASE1 -2
// slot 10445
    10445, 46034
)).

// bank 10, slots 10446-10447
function agcAotUnit666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10446 {
// PHASE_TABLE_MAINTENANCE.agc:388
//
// PHASE_TABLE_MAINTENANCE.agc:389
//		CA	TEMPPR
// slot 10446
        if slot <> 10446 or instruction <> 12344 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 56).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PHASE_TABLE_MAINTENANCE.agc:390
//		NDX	TEMPG
// slot 10447
        if slot <> 10447 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[666] to agcAotUnit666@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:391
//		TS	PHSPRDT1 -2
// slot 10448
    10448, 46164
)).

// bank 10, slots 10449-10451
function agcAotUnit667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10449 {
// PHASE_TABLE_MAINTENANCE.agc:392
//
// PHASE_TABLE_MAINTENANCE.agc:393
//		EXTEND
// slot 10449
        if slot <> 10449 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10450 {
// PHASE_TABLE_MAINTENANCE.agc:394
//		DCA	TEMPNM
// slot 10450
            if slot <> 10450 or instruction <> 12340 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:395
//		NDX	TEMPG
// slot 10451
            if slot <> 10451 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[667] to agcAotUnit667@.

agcAotInstallSourceRope(list(
// PHASE_TABLE_MAINTENANCE.agc:396
//		DXCH	PHSNAME1 -2
// slot 10452
    10452, 44602
)).

// bank 10, slots 10453-10453
function agcAotUnit668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PHASE_TABLE_MAINTENANCE.agc:397
//
// PHASE_TABLE_MAINTENANCE.agc:398
//		TCF	BELOW1
// slot 10453
    if slot <> 10453 or instruction <> 5287 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5287, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[668] to agcAotUnit668@.

// bank 03, slots 6120-6123
function agcAotUnit355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6121 {
        if slot <= 6120 {
// PHASE_TABLE_MAINTENANCE.agc:399
//
// PHASE_TABLE_MAINTENANCE.agc:400
//		BLOCK	03
// PHASE_TABLE_MAINTENANCE.agc:401
//		SETLOC	FFTAG6
// PHASE_TABLE_MAINTENANCE.agc:402
//		BANK
// PHASE_TABLE_MAINTENANCE.agc:403
//
// PHASE_TABLE_MAINTENANCE.agc:404
//		COUNT*	$$/PHASE
// PHASE_TABLE_MAINTENANCE.agc:405
//CHECKB		MASK	BIT12		# SINCE THIS IS OF TYPE B, THIS BIT WOULD
// slot 6120
            if slot <> 6120 or instruction <> 31200 { return choose false if checkOnly else -1. }
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
// PHASE_TABLE_MAINTENANCE.agc:406
//		CCS	A		# BE HERE IF WE ARE TO GET A NEW PRIORITY
// slot 6121
            if slot <> 6121 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6122 {
// PHASE_TABLE_MAINTENANCE.agc:407
//		TCF	GETPRIO		# IT IS, SO GET NEW PRIORITY
// slot 6122
            if slot <> 6122 or instruction <> 6931 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6931, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PHASE_TABLE_MAINTENANCE.agc:408
//
// PHASE_TABLE_MAINTENANCE.agc:409
//		TCF	OLDPRIO		# IT ISN'T, USE THE OLD PRIORITY.
// slot 6123
            if slot <> 6123 or instruction <> 6914 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6914, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[355] to agcAotUnit355@.

// no code for the lines below
// PHASE_TABLE_MAINTENANCE.agc:410
//
// PHASE_TABLE_MAINTENANCE.agc:411
//
