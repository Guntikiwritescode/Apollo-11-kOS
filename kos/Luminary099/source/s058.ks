// PORT: Original source unit PHASE_TABLE_MAINTENANCE.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4809–4809.
function agcAotUnit199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:2
//# Filename:	PHASE_TABLE_MAINTENANCE.agc
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:9
//# Pages:	1294-1302
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:10
//# Mod history:	2009-05-26 OH	Transcribed from page images.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:11
//#		2009-06-05 RSB	A few lines at the bottom of page image
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:12
//#				1294 were truncated.  I've fixed the page
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:13
//#				image and added those missing lines here.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:14
//#		2011-05-07 JL	Flagged SBANK= workaround for future
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:15
//#				removal.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:16
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:17
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:18
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:19
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:20
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:21
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:22
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:23
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:24
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:25
//# actually created.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:26
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:27
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:28
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:29
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:30
//#	16:27 JULY 14, 1969
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:31
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:32
//# Page 1294
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:33
//# SUBROUTINE TO UPDATE THE PROGRAM NUMBER DISPLAY ON THE DSKY.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:34
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:35
//		COUNT*	$$/PHASE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:36
//		BLOCK	02
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:37
//		SETLOC	FFTAG1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:38
//		BANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:39
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:40
//NEWMODEX	INDEX	Q		# UPDATE MODREG.  ENTRY FOR MODE IN FIXED.
// PORT: Fixed ROM slots 4809.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:41
//		CAF	0
// PORT: Fixed ROM slots 4810.
    4810, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4811–4815.
function agcAotUnit200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4812 {
        if slot <= 4811 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:42
//		INCR	Q
// PORT: Fixed ROM slots 4811.
            if slot <> 4811 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:43
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:44
//NEWMODEA	TS	MODREG		# ENTRY FOR MODE IN A.
// PORT: Fixed ROM slots 4812.
            if slot <> 4812 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4813 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:45
//MMDSPLAY	CAF	+3		# DISPLAY MAJOR MODE.
// PORT: Fixed ROM slots 4813.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:46
//PREBJUMP	LXCH	BBANK		# PUTS BBANK IN L
// PORT: Fixed ROM slots 4814.
                if slot <> 4814 or instruction <> 9222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 6, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:47
//		TCF	BANKJUMP	# PUTS Q INTO A
// PORT: Fixed ROM slots 4815.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:48
//		CADR	SETUPDSP
// PORT: Fixed ROM slots 4816.
    4816, 16662
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4817–4817.
function agcAotUnit201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:49
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:50
//# RETURN TO CALLER +3 IF MODE = THAT AT CALLER +1.  OTHERWISE RETURN TO CALLER +2.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:51
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:52
//CHECKMM		INDEX	Q
// PORT: Fixed ROM slots 4817.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:53
//		CS	0
// PORT: Fixed ROM slots 4818.
    4818, 32768
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4819–4822.
function agcAotUnit202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4820 {
        if slot <= 4819 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:54
//		AD	MODREG
// PORT: Fixed ROM slots 4819.
            if slot <> 4819 or instruction <> 25097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:55
//		EXTEND
// PORT: Fixed ROM slots 4820.
            if slot <> 4820 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4821 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:56
//		BZF	Q+2
// PORT: Fixed ROM slots 4821.
            if slot <> 4821 or instruction <> 7649 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7649, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:57
//		TCF	Q+1		# NO MATCH
// PORT: Fixed ROM slots 4822.
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

// PORT: Physical bank 10. Shared continuation entries, slots 10379–10382.
function agcAotUnit657 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10380 {
        if slot <= 10379 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:58
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:59
//TCQ		=	Q+2 +1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:60
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:61
//		BANK	14
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:62
//		SETLOC	PHASETAB
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:63
//		BANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:64
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:65
//		COUNT*	$$/PHASE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:66
//SETUPDSP	INHINT
// PORT: Fixed ROM slots 10379.
            if slot <> 10379 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:67
//		DXCH	RUPTREG1	# SAVE CALLER'S RETURN 2CADR
// PORT: Fixed ROM slots 10380.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:68
//		CAF	PRIO30		# 	EITHER A TASK OR JOB CAN COME TO
// PORT: Fixed ROM slots 10381.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:69
//		TC	NOVAC		#	NEWMODE X
// PORT: Fixed ROM slots 10382.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:70
//		EBANK=	MODREG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:71
//		2CADR	DSPMMJOB
// PORT: Fixed ROM slots 10383 10384.
    10383, 3768, 10384, 49284
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10385–10387.
function agcAotUnit658 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10385 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:72
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:73
//		DXCH	RUPTREG1
// PORT: Fixed ROM slots 10385.
        if slot <> 10385 or instruction <> 21561 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 57, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10386 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:74
//		RELINT
// PORT: Fixed ROM slots 10386.
            if slot <> 10386 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:75
//		DXCH	Z		# RETURN
// PORT: Fixed ROM slots 10387.
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

// PORT: Physical bank 02. Shared continuation entries, slots 4823–4824.
function agcAotUnit203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4823 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:76
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:77
//DSPMMJOB	EQUALS	DSPMMJB
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:78
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:79
//		BLOCK	02
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:80
//		SETLOC	FFTAG1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:81
//		BANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:82
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:83
//# Page 1295
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:84
//# PHASCHNG IS THE MAIN WAY OF MAKING PHASE CHANGES FOR RESTARTS.  THERE ARE THREE FORMS OF PHASCHNG, KNOWN AS TYPE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:85
//# A, TYPE B, AND TYPE C.  THEY ARE ALL CALLED AS FOLLOWS, WHERE OCT XXXXX CONTAINS THE PHASE INFORMATION,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:86
//#		TC	PHASCHNG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:87
//#		OCT	XXXXX
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:88
//# TYPE A IS CONCERNED WITH FIXED PHASE CHANGES, THAT IS, PHASE INFORMATION THAT IS STORED PERMANENTLY.  THESE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:89
//# OPTIONS ARE, WHERE G STANDS FOR A GROUP AND .X FOR THE PHASE,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:90
//#	G.0		INACTIVE, WILL NOT PERMIT A GROUP G RESTART
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:91
//#	G.1		WILL CAUSE THE LAST DISPLAY TO BE REACTIVATED, USED MAINLY IN MANNED FLIGHTS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:92
//#	G.EVEN		A DOUBLE TABLE RESTART, CAN CAUSE ANY COMBINATION OF TWO JOBS, TASKS, AND/OR
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:93
//#			LONGCALL TO BE RESTARTED.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:94
//#	G.ODD NOT .1	A SINGLE TABLE RESTART, CAN CAUSE EITHER A JOB, TASK, OR LONGCALL RESTART.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:95
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:96
//# THIS INFORMATION IS PUT INTO THE OCTAL WORD AFTER TC PHASCHNG AS FOLLOWS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:97
//#	TL0 00P PPP PPP GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:98
//# WHERE EACH LETTER OR NUMBER STANTS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1-7, THE P'S FOR THE PHASE,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:99
//# OCTAL 0 - 127.  0'S MUST BE 0.  IF ONE WISHES TO HAVE THE TBASE OF GROUP G TO BE SET AT THIS TIME,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:100
//# T IS SET TO 1, OTHERWISE IT IS SET TO 0.  SIMILARLY IF ONE WISHES TO SET LONGBASE, THEN L IS SET TO 1, OTHERWISE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:101
//# IT IS SET TO 0.  SOME EXAMPLES,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:102
//#		TC	PHASCHNG	# THIS WILL CAUSE GROUP 3 TO BE SET TO 0,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:103
//#		OCT	00003		# MAKING GROUP 3 INACTIVE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:104
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:105
//#		TC	PHASCHNG	# IF A RESTART OCCURS THIS WOULD CAUSE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:106
//#		OCT	00012		# GROUP 2 TO RESTART THE LAST DISPLAY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:107
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:108
//#		TC	PHASCHNG	# THIS SETS THE TBASE OF GROUP 4 AND IN
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:109
//#		OCT	40064		# CASE OF A RESTART WOULD START UP THE TWO
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:110
//#					# THINGS LOCATED IN THE DOUBLE 4.6 RESTART
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:111
//#					# LOCATION.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:112
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:113
//#		TC	PHASCHNG	# THIS SETS LONGBASE AND UPON A RESTART
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:114
//#		OCT	20135		# CAUSES 5.13 TO BE RESTARTED (SINCE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:115
//#					# LONGBASE WAS SET THIS SINGLE ENTRY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:116
//#					# SHOULD BE A LONGCALL)
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:117
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:118
//#		TC	PHASCHNG	# SINCE BOTH TBASE4 AND LONGBASE ARE SET,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:119
//#		OCT	60124		# 4.12 SHOULD CONTAIN BOTH A TASK AND A
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:120
//#					# LONGCALL TO BE RESTARTED
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:121
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:122
//# TYPE C PHASCHNG CONTAINS THE VARIABLE TYPE OF PHASCHNG INFORMATION.  INSTEAD OF THE INFORMATION BEING IN A
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:123
//# PERMANENT FORM, ONE STORES THE DESIRED RESTART INFORMATION IN A VARIABLE LOCATION.  THE BITS ARE AS FOLLOWS,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:124
//#	TL0 1AD XXX CJW GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:125
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1 - 7.  IF THE RESTART IS TO
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:126
//# BE BY WAITLIST, W IS SET TO 1, IF IT IS A JOB, J IS SET TO 1, IF IT IS A LONGCALL, C IS SET TO 1.  ONLY ONE OF
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:127
//# THESE THREE BITS MAY BE SET.  X'S ARE IGNORED, 1 MUST BE 1, AND 0 MUST BE 0.  AGAIN T STANDS FOR THE TBASE,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:128
//# Page 1296
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:129
//# AND L FOR LONGBASE.  THE BITS A AND D ARE CONCERNED WITH THE VARIABLE INFORMATION.  IF D IS SET TO 1, A PRIORITY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:130
//# OR DELTA TIME WILL BE READ FROM THE NEXT LOCATION AFTER THE OCTAL INFORMATION., IF THIS IS TO BE INDIRECT, THAT
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:131
//# IS, THE NAME OF A LOCATION CONTAINING THE INFORMATION (DELTA TIME ONLY), THEN THIS IS GIVEN AS THE -GENADR OF
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:132
//# THAT LOCATION WHICH CONTAINS THE DELTA TIME.  IF THE OLD PRIORITY OR DELTA TIME IS TO BE USED, THAT WHICH IS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:133
//# ALREADY IN THE VARIABLE STORAGE, THEN D IS SET TO 0.  NEXT THE A BIT IS USED.  IF IT IS SET TO 0, THE ADDRESS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:134
//# THAT WOULD BE RESTARTED DURING A RESTART IS THE NEXT LOCATION AFTER THE PHASE INFORMATION, THAT IS, EITHER
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:135
//# (TC PHASCHNG) +2 OR +3, DEPENDING ON WHETHER D HAD BEEN SET OR NOT.  IF A IS SET TO 1, THEN THE ADDRESS THAT
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:136
//# WOULD BE RESTARTED IS THE 2CADR THAT IS READ FROM THE NEXT TWO LOCATION.  EXAMPLES,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:137
//#	AD	TC	PHASCHNG	# THIS WOULD CAUSE LOCATION AD +3 TO BE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:138
//#	AD+1	OCT	05023		# RESTARTED BY GROUP THREE WITH A PRIORITY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:139
//#	AD+2	OCT	23000		# OF 23.  NOTE UPON RETURNING IT WOULD
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:140
//#	AD+3				# ALSO GO TO AD+3
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:141
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:142
//#	AD	TC	PHASCHNG	# GROUP 1 WOULD CAUSE CALLCALL TO BE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:143
//#	AD+1	OCT	27441		# BE STARTED AS A LONGCALL FROM THE TIME
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:144
//#	AD+2	-GENADR	DELTIME		# STORED IN LONGBASE (LONGBASE WAS SET) BY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:145
//#	AD+3	2CADR	CALLCALL	# A DELTA TIME STORED IN DELTIME.  THE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:146
//#	AD+4				# BBCON OF THE 2CADR SHOULD CONTAIN THE E
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:147
//#	AD+5				# BANK OF DELTIME.  PHASCHNG RETURNS TO
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:148
//#					# LOCATION AD+5
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:149
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:150
//# NOTE THAT IF A VARIABLE PRIORITY IS GIVEN FOR A JOB, THE JOB WILL BE RESTARTED AS A NOVAC IF THE PRIORITY IS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:151
//# NEGATIVE, AS A FINDVAC IF THE PRIORITY IS POSITIVE.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:152
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:153
//# TYPE B PHASCHNG IS A COMBINATION OF VARIABLE AND FIXED PHASE CHANGES.  IT WILL START UP A JOB AS INDICATED
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:154
//# BELOW AND ALSO START UP ONE FIXED RESTART, THAT IS EITHER AN G.1 OR A G.ODD OR THE FIRST ENTRY OF G.EVEN
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:155
//# DOUBLE ENTRY.  THE BIT INFORMATION IS AS FOLLOW,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:156
//#	TL1 DAP PPP PPP GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:157
//# WHERE EACH LETTER OR NUMBER STANDS FOR A BIT.  THE G'S STAND FOR THE GROUP, OCTAL 1 - 7, THE P'S FOR THE FIXED
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:158
//# PHASE INFORMATION, OCTAL 0 - 127.  1 MUST BE 1.  AND AGAIN T STANDS FOR THE TBASE AND L FOR LONGBASE.  D THIS
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:159
//# TIME STANDS ONLY FOR PRIORITY SINCE THIS WILL BE CONSIDERED A JOB, AND IT MUST BE GIVEN DIRECTLY IF GIVEN.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:160
//# AGAIN A STANDS FOR THE ADDRESS OF THE LOCATION TO BE RESTARTED, 1 IF THE 2CADR IS GIVEN, OR 0 IF IT IS TO BE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:161
//# THE NEXT LOCATION.  (THE RETURN LOCATION OF PHASCHNG) EXAMPLES,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:162
//#	AD	TC	PHASCHNG	# TBASE IS SET AND A RESTART CAUSE GROUP 3
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:163
//#	AD+1	OCT	56043		# TO START THE JOB AJOBAJOB WITH PRIORITY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:164
//#	AD+2	OCT	31000		# 31 AND THE FIRST ENTRY OF 3.4SPOT (WE CAN
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:165
//#	AD+3	2CADR	AJOBAJOB	# ASSUME IT IS A TASK SINCE WE SET TBASE3)
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:166
//#	AD+4				# UPON RETURN FROM PHASCHNG CONTROL WOULD
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:167
//#	AD+5				# GO TO AD+5
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:168
//#
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:169
//#	AD	TC	PHASCHNG	# UPON A RESTART THE LAST DISPLAY WOULD BE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:170
//#	AD+1	OCT	10015		# RESTARTED AND A JOB WITH THE PREVIOUSLY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:171
//#	AD+2				# STORED PRIORITY WOULD BE BEGUN AT AD+2
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:172
//#					# BY MEANS OF GROUP 5
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:173
//# Page 1297
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:174
//# THE NOVAC-FINDVAC CHOICE FOR JOBS HOLDS HERE ALSO -- NEGATIVE PRIORITY CAUSES A NOVAC CALL, POSITIVE A FINDVAC.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:175
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:176
//# SUMMARY OF BITS:
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:177
//#	TYPE A		TL0 00P PPP PPP GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:178
//#	TYPE B		TL1 DAP PPP PPP GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:179
//#	TYPE C		TL0 1AD XXX CJW GGG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:180
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:181
//# Page 1298
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:182
//# 2PHSCHNG IS USED WHEN ONE WISHES TO START UP A GROUP OR CHANGE A GROUP WHILE UNDER THE CONTROL OF A DIFFERENT
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:183
//# GROUP.  FOR EXAMPLE, CHANGE THE PHASE OF GROUP 3 WHILE THE PORTION OF THE PROGRAM IS UNDER GROUP 5.  ALL 2PHSCHNG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:184
//# CALLS ARE MADE IN THE FOLLOWING MANNER,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:185
//#		TC	2PHSCHNG
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:186
//#		OCT	XXXXX
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:187
//#		OCT	YYYYY
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:188
//# WHERE OCT XXXXX MUST BE OF TYPE A AND OCT YYYYY MAY BE OF EITHER TYPE A OR TYPE B OR TYPE C.  THERE IS ONE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:189
//# DIFFERENCE --- NOTE: IF LONGBASE IS TO BE SET THIS INFORMATION IS GIVEN IN THE OCT YYYYY INFORMATION, IT WILL
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:190
//# BE DISREGARDED IF GIVEN WITH THE OCT XXXXX INFORMATION.  A COUPLE OF EXAMPLES MAY HELP,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:191
//#	AD	TC	2PHACHNG	# SET TBASE3 AND IF A RESTART OCCURS START
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:192
//#	AD+1	OCT	40083		# THE TWO ENTRIES IN 3.8 TABLE LOCATION
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:193
//#	AD+2	OCT	05025		# THIS IS OF TYPE C, SET THE JOB TO BE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:194
//#	AD+3	OCT	18000		# TO BE LOCATION AD+4, WITH A PRIORITY 18,
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:195
//#	AD+4				# FOR GROUP 5 PHASE INFORMATION.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:196
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:197
//## [WORKAROUND] RSB 2004
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:198
//		SBANK=	PINSUPER
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:199
//## [WORKAROUND]
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:200
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:201
//		COUNT*	$$/PHASE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:202
//2PHSCHNG	INHINT			# THE ENTRY FOR A DOUBLE PHASE CHANGE
// PORT: Fixed ROM slots 4823.
        if slot <> 4823 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:203
//		NDX	Q
// PORT: Fixed ROM slots 4824.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:204
//		CA	0
// PORT: Fixed ROM slots 4825.
    4825, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4826–4838.
function agcAotUnit204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4831 {
        if slot <= 4828 {
            if slot <= 4826 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:205
//		INCR	Q
// PORT: Fixed ROM slots 4826.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:206
//		TS	TEMPP2
// PORT: Fixed ROM slots 4827.
                    if slot <> 4827 or instruction <> 22586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:207
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:208
//		MASK	OCT7
// PORT: Fixed ROM slots 4828.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:209
//		DOUBLE
// PORT: Fixed ROM slots 4829.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:210
//		TS	TEMPG2
// PORT: Fixed ROM slots 4830.
                    if slot <> 4830 or instruction <> 22585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22585, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:211
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:212
//		CA	TEMPP2
// PORT: Fixed ROM slots 4831.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:213
//		MASK	OCT17770	# NEED ONLY 1770, BUT WHY GET A NEW CONST.
// PORT: Fixed ROM slots 4832.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:214
//		EXTEND
// PORT: Fixed ROM slots 4833.
                    if slot <> 4833 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:215
//		MP	BIT12
// PORT: Fixed ROM slots 4834.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:216
//		XCH	TEMPP2
// PORT: Fixed ROM slots 4835.
                    if slot <> 4835 or instruction <> 23610 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 58, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:217
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:218
//		MASK	BIT15
// PORT: Fixed ROM slots 4836.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:219
//		TS	TEMPSW2		# INDICATES WHETHER TO SET TBASE OR NOT
// PORT: Fixed ROM slots 4837.
                    if slot <> 4837 or instruction <> 22582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22582, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:220
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:221
//		INDEX	Q
// PORT: Fixed ROM slots 4838.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:222
//		CA	0
// PORT: Fixed ROM slots 4839.
    4839, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4840–4844.
function agcAotUnit205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4841 {
        if slot <= 4840 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:223
//		INCR	Q
// PORT: Fixed ROM slots 4840.
            if slot <> 4840 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:224
//		TS	TEMPSW
// PORT: Fixed ROM slots 4841.
            if slot <> 4841 or instruction <> 22581 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22581, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4842 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:225
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:226
//		TCF	PHASJUMP
// PORT: Fixed ROM slots 4842.
            if slot <> 4842 or instruction <> 6899 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6899, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4843 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:227
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:228
//PHASCHNG	INHINT			# NORMAL PHASCHNG ENTRY POINT.
// PORT: Fixed ROM slots 4843.
                if slot <> 4843 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:229
//		INDEX	Q
// PORT: Fixed ROM slots 4844.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:230
//		CA	0
// PORT: Fixed ROM slots 4845.
    4845, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4846–4853.
function agcAotUnit206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4849 {
        if slot <= 4847 {
            if slot <= 4846 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:231
//		INCR	Q
// PORT: Fixed ROM slots 4846.
                if slot <> 4846 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:232
//PHSCHNGA	INHINT			# FIRST OCTAL PARAMETER IN A.
// PORT: Fixed ROM slots 4847.
                if slot <> 4847 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4848 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:233
//# Page 1299
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:234
//		TS	TEMPSW
// PORT: Fixed ROM slots 4848.
                if slot <> 4848 or instruction <> 22581 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22581, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:235
//		CA	ONE
// PORT: Fixed ROM slots 4849.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:236
//		TS	TEMPSW2
// PORT: Fixed ROM slots 4850.
                if slot <> 4850 or instruction <> 22582 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22582, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:237
//PHASJUMP	EXTEND
// PORT: Fixed ROM slots 4851.
                if slot <> 4851 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4852 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:238
//		DCA	ADRPCHN2	# OFF TO SWITCHED BANK
// PORT: Fixed ROM slots 4852.
                if slot <> 4852 or instruction <> 15095 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2807, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:239
//		DTCB
// PORT: Fixed ROM slots 4853.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:240
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:241
//		EBANK=	LST1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:242
//ADRPCHN2	2CADR	PHSCHNG2
// PORT: Fixed ROM slots 4854 4855.
    4854, 2344, 4855, 16518
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4856–4866.
function agcAotUnit207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4860 {
        if slot <= 4857 {
            if slot <= 4856 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:243
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:244
//ONEORTWO	LXCH	TEMPBBCN
// PORT: Fixed ROM slots 4856.
                if slot <> 4856 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:245
//		LXCH	BBANK
// PORT: Fixed ROM slots 4857.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:246
//		LXCH	TEMPBBCN
// PORT: Fixed ROM slots 4858.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:247
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:248
//		MASK	OCT14000	# SEE WHAT KIND OF PHASE CHANGE IT IS
// PORT: Fixed ROM slots 4859.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:249
//		CCS	A
// PORT: Fixed ROM slots 4860.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:250
//		TCF	CHECKB		# IT IS OF TYPE `B'.
// PORT: Fixed ROM slots 4861.
                if slot <> 4861 or instruction <> 8168 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 8168, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4862 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:251
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:252
//		CA	TEMPP
// PORT: Fixed ROM slots 4862.
                    if slot <> 4862 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:253
//		MASK	BIT7
// PORT: Fixed ROM slots 4863.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:254
//		CCS	A		# SHALL WE USE THE OLD PRIORITY
// PORT: Fixed ROM slots 4864.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:255
//		TCF	GETPRIO		# NO GET A NEW PRIORITY (OR DELTA T)
// PORT: Fixed ROM slots 4865.
                    if slot <> 4865 or instruction <> 6931 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6931, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:256
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:257
//OLDPRIO		NDX	TEMPG		# USE THE OLD PRIORITY (OR DELTA T)
// PORT: Fixed ROM slots 4866.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:258
//		CA	PHSPRDT1 -2
// PORT: Fixed ROM slots 4867.
    4867, 25684
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4868–4881.
function agcAotUnit208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4874 {
        if slot <= 4870 {
            if slot <= 4868 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:259
//		TS	TEMPPR
// PORT: Fixed ROM slots 4868.
                if slot <> 4868 or instruction <> 22584 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22584, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4869 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:260
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:261
//CON1		CA	TEMPP		# SEE IF A 2CADR IS GIVEN
// PORT: Fixed ROM slots 4869.
                    if slot <> 4869 or instruction <> 12338 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:262
//		MASK 	BIT8
// PORT: Fixed ROM slots 4870.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:263
//		CCS	A
// PORT: Fixed ROM slots 4871.
                    if slot <> 4871 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:264
//		TCF	GETNEWNM
// PORT: Fixed ROM slots 4872.
                    if slot <> 4872 or instruction <> 6935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4873 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:265
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:266
//		CA	Q
// PORT: Fixed ROM slots 4873.
                    if slot <> 4873 or instruction <> 12290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:267
//		TS	TEMPNM
// PORT: Fixed ROM slots 4874.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:268
//		CA	BB
// PORT: Fixed ROM slots 4875.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:269
//		EXTEND			# PICK UP USER'S SUPERBANK
// PORT: Fixed ROM slots 4876.
                    if slot <> 4876 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:270
//		ROR	SUPERBNK
// PORT: Fixed ROM slots 4877.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:271
//		TS	TEMPBB
// PORT: Fixed ROM slots 4878.
                    if slot <> 4878 or instruction <> 22580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22580, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:272
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:273
//TOCON2		CA	CON2ADR		# BACK TO SWITCHED BANK
// PORT: Fixed ROM slots 4879.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:274
//		LXCH	TEMPBBCN
// PORT: Fixed ROM slots 4880.
                    if slot <> 4880 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:275
//		DTCB
// PORT: Fixed ROM slots 4881.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:276
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:277
//CON2ADR		GENADR	CON2
// PORT: Fixed ROM slots 4882.
    4882, 2452
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4883–4883.
function agcAotUnit209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:278
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:279
//GETPRIO		NDX	Q		# DON'T CARE IF DIRECT OR INDIRECT
// PORT: Fixed ROM slots 4883.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:280
//		CA	0		# LEAVE THAT DECISION TO RESTARTS
// PORT: Fixed ROM slots 4884.
    4884, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4885–4888.
function agcAotUnit210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4886 {
        if slot <= 4885 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:281
//		INCR	Q		# OBTAIN RETURN ADDRESS
// PORT: Fixed ROM slots 4885.
            if slot <> 4885 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:282
//# Page 1300
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:283
//		TCF	CON1 -1
// PORT: Fixed ROM slots 4886.
            if slot <> 4886 or instruction <> 6916 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6916, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4887 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:284
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:285
//GETNEWNM	EXTEND
// PORT: Fixed ROM slots 4887.
            if slot <> 4887 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:286
//		INDEX	Q
// PORT: Fixed ROM slots 4888.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:287
//		DCA	0
// PORT: Fixed ROM slots 4889.
    4889, 24578
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4890–4893.
function agcAotUnit211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4891 {
        if slot <= 4890 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:288
//		DXCH	TEMPNM
// PORT: Fixed ROM slots 4890.
            if slot <> 4890 or instruction <> 21556 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:289
//		CA	TWO
// PORT: Fixed ROM slots 4891.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:290
//		ADS	Q		# OBTAIN RETURN ADDRESS
// PORT: Fixed ROM slots 4892.
            if slot <> 4892 or instruction <> 11266 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:291
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:292
//		TCF	TOCON2
// PORT: Fixed ROM slots 4893.
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

// PORT: Physical bank 10. Shared continuation entries, slots 10388–10405.
function agcAotUnit659 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10396 {
        if slot <= 10391 {
            if slot <= 10389 {
                if slot <= 10388 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:293
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:294
//OCT14000	EQUALS	PRIO14
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:295
//TEMPG		EQUALS	ITEMP1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:296
//TEMPP		EQUALS	ITEMP2
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:297
//TEMPNM		EQUALS	ITEMP3
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:298
//TEMPBB		EQUALS	ITEMP4
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:299
//TEMPSW		EQUALS	ITEMP5
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:300
//TEMPSW2		EQUALS	ITEMP6
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:301
//TEMPPR		EQUALS	RUPTREG1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:302
//TEMPG2		EQUALS	RUPTREG2
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:303
//TEMPP2		EQUALS	RUPTREG3
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:304
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:305
//TEMPBBCN	EQUALS	RUPTREG4
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:306
//BB		EQUALS	BBANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:307
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:308
//		BANK	14
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:309
//		SETLOC	PHASETAB
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:310
//		BANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:311
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:312
//		EBANK=	PHSNAME1
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:313
//		COUNT*	$$/PHASE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:314
//PHSCHNG2	LXCH	TEMPBBCN
// PORT: Fixed ROM slots 10388.
                    if slot <> 10388 or instruction <> 9275 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 59, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:315
//		CA	TEMPSW
// PORT: Fixed ROM slots 10389.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:316
//		MASK	OCT7
// PORT: Fixed ROM slots 10390.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:317
//		DOUBLE
// PORT: Fixed ROM slots 10391.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:318
//		TS	TEMPG
// PORT: Fixed ROM slots 10392.
                    if slot <> 10392 or instruction <> 22577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22577, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:319
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:320
//		CA	TEMPSW
// PORT: Fixed ROM slots 10393.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:321
//		MASK	OCT17770
// PORT: Fixed ROM slots 10394.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:322
//		EXTEND
// PORT: Fixed ROM slots 10395.
                        if slot <> 10395 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:323
//		MP	BIT12
// PORT: Fixed ROM slots 10396.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:324
//		TS	TEMPP
// PORT: Fixed ROM slots 10397.
                    if slot <> 10397 or instruction <> 22578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22578, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:325
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:326
//		CA	TEMPSW
// PORT: Fixed ROM slots 10398.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:327
//		MASK	OCT60000
// PORT: Fixed ROM slots 10399.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:328
//		XCH	TEMPSW
// PORT: Fixed ROM slots 10400.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:329
//		MASK	OCT14000
// PORT: Fixed ROM slots 10401.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:330
//		CCS	A
// PORT: Fixed ROM slots 10402.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:331
//# Page 1301
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:332
//		TCF	ONEORTWO
// PORT: Fixed ROM slots 10403.
                    if slot <> 10403 or instruction <> 6904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6904, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 10404 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:333
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:334
//		CA	TEMPP		# START STORING THE PHASE INFORMATION
// PORT: Fixed ROM slots 10404.
                        if slot <> 10404 or instruction <> 12338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 50).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:335
//		NDX	TEMPG
// PORT: Fixed ROM slots 10405.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:336
//		TS	PHASE1 -2
// PORT: Fixed ROM slots 10406.
    10406, 46034
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10407–10412.
function agcAotUnit660 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10409 {
        if slot <= 10407 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:337
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:338
//BELOW1		CCS	TEMPSW2		# IS IT A PHASCHNG OR A 2PHSCHNG
// PORT: Fixed ROM slots 10407.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:339
//		TCF	BELOW2		# IT'S A PHASCHNG
// PORT: Fixed ROM slots 10408.
                if slot <> 10408 or instruction <> 5300 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5300, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:340
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:341
//		TCF	+1		# IT'S A 2PHSCHNG
// PORT: Fixed ROM slots 10409.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:342
//		CS	TEMPP2
// PORT: Fixed ROM slots 10410.
            if slot <> 10410 or instruction <> 16442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 58).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10411 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:343
//		LXCH	TEMPP2
// PORT: Fixed ROM slots 10411.
                if slot <> 10411 or instruction <> 9274 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 58, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:344
//		NDX	TEMPG2
// PORT: Fixed ROM slots 10412.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:345
//		DXCH	-PHASE1 -2
// PORT: Fixed ROM slots 10413.
    10413, 43986
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10414–10418.
function agcAotUnit661 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10415 {
        if slot <= 10414 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:346
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:347
//		CCS	TEMPSW2
// PORT: Fixed ROM slots 10414.
            if slot <> 10414 or instruction <> 4150 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:348
//		NOOP			# CAN'T GET HERE
// PORT: Fixed ROM slots 10415.
            if slot <> 10415 or instruction <> 5296 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5296, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10416 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:349
//		TCF	BELOW2
// PORT: Fixed ROM slots 10416.
            if slot <> 10416 or instruction <> 5300 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5300, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10417 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:350
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:351
//		CS	TIME1
// PORT: Fixed ROM slots 10417.
                if slot <> 10417 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:352
//		NDX	TEMPG2
// PORT: Fixed ROM slots 10418.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:353
//		TS	TBASE1 -2
// PORT: Fixed ROM slots 10419.
    10419, 46162
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10420–10424.
function agcAotUnit662 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10421 {
        if slot <= 10420 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:354
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:355
//BELOW2		CCS	TEMPSW		# SEE IF WE SHOULD SET TBASE OR LONGBASE
// PORT: Fixed ROM slots 10420.
            if slot <> 10420 or instruction <> 4149 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:356
//		TCF	BELOW3		# SET LONGBASE ONLY
// PORT: Fixed ROM slots 10421.
            if slot <> 10421 or instruction <> 5312 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5312, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 10422 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:357
//		TCF	BELOW4		# SET NEITHER
// PORT: Fixed ROM slots 10422.
            if slot <> 10422 or instruction <> 5315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10423 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:358
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:359
//		CS	TIME1		# SET TBASE TO BEGIN WITH
// PORT: Fixed ROM slots 10423.
                if slot <> 10423 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:360
//		NDX	TEMPG
// PORT: Fixed ROM slots 10424.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:361
//		TS	TBASE1 -2
// PORT: Fixed ROM slots 10425.
    10425, 46162
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10426–10429.
function agcAotUnit663 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10427 {
        if slot <= 10426 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:362
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:363
//		CA	TEMPSW		# SHALL WE NOW SET LONGBASE
// PORT: Fixed ROM slots 10426.
            if slot <> 10426 or instruction <> 12341 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 53).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:364
//		AD	BIT14COM
// PORT: Fixed ROM slots 10427.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:365
//		CCS	A
// PORT: Fixed ROM slots 10428.
            if slot <> 10428 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:366
//		NOOP			# ***** CAN'T GET HERE *****
// PORT: Fixed ROM slots 10429.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:367
//BIT14COM	OCT	17777		# ***** CAN'T GET HERE *****
// PORT: Fixed ROM slots 10430.
    10430, 16382
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10431–10436.
function agcAotUnit664 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10433 {
        if slot <= 10431 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:368
//		TCF	BELOW4		# NO WE NEED ONLY SET TBASE
// PORT: Fixed ROM slots 10431.
            if slot <> 10431 or instruction <> 5315 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5315, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10432 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:369
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:370
//BELOW3		EXTEND			# SET LONGBASE
// PORT: Fixed ROM slots 10432.
                if slot <> 10432 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:371
//		DCA	TIME2
// PORT: Fixed ROM slots 10433.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:372
//		DXCH	LONGBASE
// PORT: Fixed ROM slots 10434.
            if slot <> 10434 or instruction <> 22122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 618, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 10435 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:373
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:374
//BELOW4		CS	TEMPP		# AND STORE THE FINAL PART OF THE PHASE
// PORT: Fixed ROM slots 10435.
                if slot <> 10435 or instruction <> 16434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 50).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:375
//		NDX	TEMPG
// PORT: Fixed ROM slots 10436.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:376
//		TS	-PHASE1 -2
// PORT: Fixed ROM slots 10437.
    10437, 46032
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10438–10444.
function agcAotUnit665 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10440 {
        if slot <= 10438 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:377
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:378
//		CA	Q
// PORT: Fixed ROM slots 10438.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:379
//		LXCH	TEMPBBCN
// PORT: Fixed ROM slots 10439.
                if slot <> 10439 or instruction <> 9275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 59, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:380
//		RELINT
// PORT: Fixed ROM slots 10440.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:381
//		DTCB
// PORT: Fixed ROM slots 10441.
                if slot <> 10441 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:382
//# Page 1302
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:383
//CON2		LXCH	TEMPBBCN
// PORT: Fixed ROM slots 10442.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:384
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:385
//		CA	TEMPP
// PORT: Fixed ROM slots 10443.
                if slot <> 10443 or instruction <> 12338 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 50).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:386
//		NDX	TEMPG
// PORT: Fixed ROM slots 10444.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:387
//		TS	PHASE1 -2
// PORT: Fixed ROM slots 10445.
    10445, 46034
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10446–10447.
function agcAotUnit666 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10446 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:388
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:389
//		CA	TEMPPR
// PORT: Fixed ROM slots 10446.
        if slot <> 10446 or instruction <> 12344 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 56).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:390
//		NDX	TEMPG
// PORT: Fixed ROM slots 10447.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:391
//		TS	PHSPRDT1 -2
// PORT: Fixed ROM slots 10448.
    10448, 46164
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10449–10451.
function agcAotUnit667 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 10449 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:392
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:393
//		EXTEND
// PORT: Fixed ROM slots 10449.
        if slot <> 10449 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 10450 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:394
//		DCA	TEMPNM
// PORT: Fixed ROM slots 10450.
            if slot <> 10450 or instruction <> 12340 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 52, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:395
//		NDX	TEMPG
// PORT: Fixed ROM slots 10451.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:396
//		DXCH	PHSNAME1 -2
// PORT: Fixed ROM slots 10452.
    10452, 44602
)).

// PORT: Physical bank 10. Shared continuation entries, slots 10453–10453.
function agcAotUnit668 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:397
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:398
//		TCF	BELOW1
// PORT: Fixed ROM slots 10453.
    if slot <> 10453 or instruction <> 5287 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5287, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[668] to agcAotUnit668@.

// PORT: Physical bank 03. Shared continuation entries, slots 6120–6123.
function agcAotUnit355 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6121 {
        if slot <= 6120 {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:399
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:400
//		BLOCK	03
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:401
//		SETLOC	FFTAG6
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:402
//		BANK
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:403
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:404
//		COUNT*	$$/PHASE
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:405
//CHECKB		MASK	BIT12		# SINCE THIS IS OF TYPE B, THIS BIT WOULD
// PORT: Fixed ROM slots 6120.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:406
//		CCS	A		# BE HERE IF WE ARE TO GET A NEW PRIORITY
// PORT: Fixed ROM slots 6121.
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
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:407
//		TCF	GETPRIO		# IT IS, SO GET NEW PRIORITY
// PORT: Fixed ROM slots 6122.
            if slot <> 6122 or instruction <> 6931 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6931, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:408
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:409
//		TCF	OLDPRIO		# IT ISN'T, USE THE OLD PRIORITY.
// PORT: Fixed ROM slots 6123.
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

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:410
//
// PORT: SOURCE PHASE_TABLE_MAINTENANCE.agc:411
//
