// PORT: Original source unit UPDATE_PROGRAM.agc.
// PORT: Physical bank 43. Shared continuation entries, slots 38868–38880.
function agcAotUnit2650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38873 {
        if slot <= 38870 {
            if slot <= 38868 {
// PORT: SOURCE UPDATE_PROGRAM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE UPDATE_PROGRAM.agc:2
//# Filename:	UPDATE_PROGRAM.agc
// PORT: SOURCE UPDATE_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE UPDATE_PROGRAM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE UPDATE_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE UPDATE_PROGRAM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE UPDATE_PROGRAM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE UPDATE_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE UPDATE_PROGRAM.agc:9
//# Pages:	1386-1396
// PORT: SOURCE UPDATE_PROGRAM.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE UPDATE_PROGRAM.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE UPDATE_PROGRAM.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE UPDATE_PROGRAM.agc:13
//#		2009-06-07 RSB	Added an SBANK= to account for incompatibilities
// PORT: SOURCE UPDATE_PROGRAM.agc:14
//#				between YUL and yaYUL.
// PORT: SOURCE UPDATE_PROGRAM.agc:15
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE UPDATE_PROGRAM.agc:16
//#		2011-05-07 JL	Flag SBANK= workaround.
// PORT: SOURCE UPDATE_PROGRAM.agc:17
//
// PORT: SOURCE UPDATE_PROGRAM.agc:18
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE UPDATE_PROGRAM.agc:19
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE UPDATE_PROGRAM.agc:20
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE UPDATE_PROGRAM.agc:21
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE UPDATE_PROGRAM.agc:22
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE UPDATE_PROGRAM.agc:23
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE UPDATE_PROGRAM.agc:24
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE UPDATE_PROGRAM.agc:25
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE UPDATE_PROGRAM.agc:26
//# actually created.
// PORT: SOURCE UPDATE_PROGRAM.agc:27
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:28
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE UPDATE_PROGRAM.agc:29
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:30
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE UPDATE_PROGRAM.agc:31
//#	16:27 JULY 14, 1969
// PORT: SOURCE UPDATE_PROGRAM.agc:32
//
// PORT: SOURCE UPDATE_PROGRAM.agc:33
//# Page 1386
// PORT: SOURCE UPDATE_PROGRAM.agc:34
//# PROGRAM NAME:     P27
// PORT: SOURCE UPDATE_PROGRAM.agc:35
//# WRITTEN BY:       KILROY/ DE WOLF
// PORT: SOURCE UPDATE_PROGRAM.agc:36
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:37
//# MOD NO:           6
// PORT: SOURCE UPDATE_PROGRAM.agc:38
//# MOD BY:           KILROY
// PORT: SOURCE UPDATE_PROGRAM.agc:39
//# DATE:             01DEC67
// PORT: SOURCE UPDATE_PROGRAM.agc:40
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:41
//# LOG SECTION:      UPDATE PROGRAM.
// PORT: SOURCE UPDATE_PROGRAM.agc:42
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:43
//# FUNCT. DESCR:     P27 (THE UPDATE PROGRAM) PROCESSES COMMANDS AND DATA
// PORT: SOURCE UPDATE_PROGRAM.agc:44
//#                       INSERTIONS REQUESTED BY THE GROUND VIA UPLINK.
// PORT: SOURCE UPDATE_PROGRAM.agc:45
//#                       THE P27 PROGRAM WILL ACCEPT UPDATES
// PORT: SOURCE UPDATE_PROGRAM.agc:46
//#                       ONLY DURING P00 FOR THE LM, AND ONLY DURING P00,
// PORT: SOURCE UPDATE_PROGRAM.agc:47
//#                   P02, AND FRESH START FOR THE CSM
// PORT: SOURCE UPDATE_PROGRAM.agc:48
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:49
//# CALLING SEQ:      PROGRAM IS INITIATED BY UPLINK ENTRY OF VERBS 70, 71, 72 AND 73.
// PORT: SOURCE UPDATE_PROGRAM.agc:50
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:51
//# SUBROUTINES:      TESTXACT, NEWMODEX, NEWMODEX +3, GOXDSPF, BANKCALL, FINDVAC, INTPRET, INTSTALL, TPAGREE,
// PORT: SOURCE UPDATE_PROGRAM.agc:52
//#                   INTWAKEU, ENDEXT, POSTJUMP, FALTON, NEWPHASE, PHASCHNG
// PORT: SOURCE UPDATE_PROGRAM.agc:53
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:54
//# NORMAL EXIT:      TC ENDEXT
// PORT: SOURCE UPDATE_PROGRAM.agc:55
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:56
//# ALARM/ABORT:      TC FALTON FOLLOWED BY TC ENDEXT
// PORT: SOURCE UPDATE_PROGRAM.agc:57
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:58
//# RESTARTS:         P27 IS RESTART PROTECTED IN TWO WAYS...
// PORT: SOURCE UPDATE_PROGRAM.agc:59
//#                   1. PRIOR TO VERIFLAG INVERSION(WHICH IS CAUSED BY THE GROUND/ASTRONAUT'S VERIFICATION OF UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:60
//#                      DATA BY SENDING A V33E WHEN V21N02 IS FLASHING)---
// PORT: SOURCE UPDATE_PROGRAM.agc:61
//#                      NO PROTECTION EXCEPT PRE-P27 MODE IS RESTORED, COAST + ALIGN DOWNLIST IS SELECTED AND UPLINK
// PORT: SOURCE UPDATE_PROGRAM.agc:62
//#                      ACTIVITY LIGHT IS TURNED OFF.(JUST AS IF A V34E WAS SENT DURING P27 DATA LOADS).
// PORT: SOURCE UPDATE_PROGRAM.agc:63
//#                      V70,V71,V72 OR V73 WILL HAVE TO BE COMPLETELY RESENT BY USER.
// PORT: SOURCE UPDATE_PROGRAM.agc:64
//#                   2. AFTER VERIFLAG INVERSION(WHEN UPDATE OF THE SPECIFIED ERASABLES IS BEING PERFORMED)---
// PORT: SOURCE UPDATE_PROGRAM.agc:65
//#                      PROTECTED AGAINST RESTARTS.
// PORT: SOURCE UPDATE_PROGRAM.agc:66
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:67
//# DEBRIS:           UPBUFF   (20D)  TEMP STORAGE FOR ADDRESSES AND CONTENTS.
// PORT: SOURCE UPDATE_PROGRAM.agc:68
//#                   UPVERB   (1)    VERB NUMBER MINUS 70D (E.G., FOR V72, UPVERB = 72D - 70D = 2)
// PORT: SOURCE UPDATE_PROGRAM.agc:69
//#                   UPOLDMOD (1)    FOR MAJOR MODE INTERRUPTED BY P27.
// PORT: SOURCE UPDATE_PROGRAM.agc:70
//#                   COMPNUMB (1)    TOTAL NUMBER OF COMPONENTS TO BE TRANSMITTED.
// PORT: SOURCE UPDATE_PROGRAM.agc:71
//#                   UPCOUNT  (1)    ACTUAL NUMBER OF COMPONENTS RECEIVED.
// PORT: SOURCE UPDATE_PROGRAM.agc:72
//#                   UPTEMP   (1)    SCRATCH, BUT USUALLY CONTAINS COMPONENT NUMBER TO BE CHANGED DURING VERIFY CYCLE
// PORT: SOURCE UPDATE_PROGRAM.agc:73
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:74
//# INPUT:
// PORT: SOURCE UPDATE_PROGRAM.agc:75
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:76
//#  ENTRY:             DESCRIPTION
// PORT: SOURCE UPDATE_PROGRAM.agc:77
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:78
//#  V70EXXXXXEXXXXXE   (LIFTOFF TIME INCREMENT) DOUBLE PRECISION OCTAL TIME INCREMENT, XXXXX XXXXX,
// PORT: SOURCE UPDATE_PROGRAM.agc:79
//#                     IS ADDED TO TEPHEM, SUBTRACTED FROM AGC CLOCK(TIME2,TIME1), SUBTRACTED FROM CSM STATE
// PORT: SOURCE UPDATE_PROGRAM.agc:80
//#                     VECTOR TIME(TETCSM) AND SUBTRACTED FROM LEM STATE VECTOR TIME(TETLEM).
// PORT: SOURCE UPDATE_PROGRAM.agc:81
//#                     THE DP OCTAL TIME INCREMENT IS SCALED AT 2(28).
// PORT: SOURCE UPDATE_PROGRAM.agc:82
//# Page 1387
// PORT: SOURCE UPDATE_PROGRAM.agc:83
//#  V71EIIEAAAAE     (CONTIGUOUS BLOCK UPDATE) II-2 OCTAL COMPONENTS,XXXXX,
// PORT: SOURCE UPDATE_PROGRAM.agc:84
//#  XXXXXE           ARE LOADED INTO ERASABLE STARTING AT ECADR, AAAA.
// PORT: SOURCE UPDATE_PROGRAM.agc:85
//# XXXXXE            IT IS .GE. 3 .AND. .LE. 200.,
// PORT: SOURCE UPDATE_PROGRAM.agc:86
//#                   AND (AAAA + II - 3) DOES NOT PRODUCE AN ADDRESS IN THE
// PORT: SOURCE UPDATE_PROGRAM.agc:87
//# 9 NEXT BANK.
// PORT: SOURCE UPDATE_PROGRAM.agc:88
//#   .               SCALING IS SAME AS INTERNAL REGISTERS.
// PORT: SOURCE UPDATE_PROGRAM.agc:89
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:90
//#  V72EIIE          (SCATTER UPDATE) (II-1)/2 OCTAL COMPONENTS,XXXXX, ARE
// PORT: SOURCE UPDATE_PROGRAM.agc:91
//#  AAAAEXXXXXE      LOADED INTO ERASABLE LOCATIONS, AAAA.
// PORT: SOURCE UPDATE_PROGRAM.agc:92
//#  AAAAEXXXXXE      II IS .GE. 3 .AND. .LE. 19D, AND MUST BE ODD.
// PORT: SOURCE UPDATE_PROGRAM.agc:93
//#   .               SCALING IS SAME AS INTERNAL REGISTERS.
// PORT: SOURCE UPDATE_PROGRAM.agc:94
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:95
//#  V73EXXXXXEXXXXXE (OCTAL CLOCK INCREMENT) DOUBLE PRECISION OCTAL TIME
// PORT: SOURCE UPDATE_PROGRAM.agc:96
//#                   INCREMENT XXXXX XXXXX, IS ADDED TO THE AGC CLOCK, IN
// PORT: SOURCE UPDATE_PROGRAM.agc:97
//#                   CENTISECONDS SCALED AT (2)28.
// PORT: SOURCE UPDATE_PROGRAM.agc:98
//#                   THIS LOAD IS THE OCTAL EQUIVALENT OF V55.
// PORT: SOURCE UPDATE_PROGRAM.agc:99
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:100
//# OUTPUT:         IN ADDITION TO THE ABOVE REGISTER LOADS, ALL UPDATES
// PORT: SOURCE UPDATE_PROGRAM.agc:101
//#                 COMPLEMENT BIT3 OF FLAGWORD7.
// PORT: SOURCE UPDATE_PROGRAM.agc:102
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:103
//# ADDITIONAL NOTES: VERB 71, JUST DEFINED ABOVE WILL BE USED TO PERFORM BUT NOT LIMITED TO THE FOLLOWING UPDATES--
// PORT: SOURCE UPDATE_PROGRAM.agc:104
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:105
//#                 1. CSM/LM STATE VECTOR UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:106
//#                 2. REFSMMAT UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:107
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:108
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:109
//#          THE FOLLOWING COMMENTS DELINEATE EACH SPECIAL UPDATE----
// PORT: SOURCE UPDATE_PROGRAM.agc:110
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:111
//# 1. CSM/LM STATE VECTOR UPDATE(ALL DATA ENTRIES IN OCTAL)
// PORT: SOURCE UPDATE_PROGRAM.agc:112
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:113
//# ENTRIES:        DATA DEFINITION:                                        SCALE FACTORS:
// PORT: SOURCE UPDATE_PROGRAM.agc:114
//# V71E            CONTIGUOUS BLOCK UPDATE VERB
// PORT: SOURCE UPDATE_PROGRAM.agc:115
//#    21E          NUMBER OF COMPONENTS FOR STATE VECTOR UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:116
//#  AAAAE          ECADR OF 'UPSVFLAG'
// PORT: SOURCE UPDATE_PROGRAM.agc:117
//# XXXXXE          STATE VECTOR IDENTIFIER: 00001 FOR CSM, 77776 FOR LEM - EARTH SPHERE OF INFLUENCE SCALING
// PORT: SOURCE UPDATE_PROGRAM.agc:118
//#                                          00002 FOR CSM, 77775 FOR LEM - LUNAR SPHERE OF INFLUENCE SCALING
// PORT: SOURCE UPDATE_PROGRAM.agc:119
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:120
//# XXXXXEXXXXXE    X POSITION
// PORT: SOURCE UPDATE_PROGRAM.agc:121
//# XXXXXEXXXXXE    Y POSITION
// PORT: SOURCE UPDATE_PROGRAM.agc:122
//# XXXXXEXXXXXE    Z POSITION
// PORT: SOURCE UPDATE_PROGRAM.agc:123
//# XXXXXEXXXXXE    X VELOCITY
// PORT: SOURCE UPDATE_PROGRAM.agc:124
//# XXXXXEXXXXXE    Y VELOCITY
// PORT: SOURCE UPDATE_PROGRAM.agc:125
//# XXXXXEXXXXXE    Z VELOCITY
// PORT: SOURCE UPDATE_PROGRAM.agc:126
//# XXXXXEXXXXXE    TIME FROM AGC CLOCK ZERO
// PORT: SOURCE UPDATE_PROGRAM.agc:127
//# V33E            VERB 33 TO SIGNAL THAT THE STATE VECTOR IS READY TO BE STORED.
// PORT: SOURCE UPDATE_PROGRAM.agc:128
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:129
//#
// PORT: SOURCE UPDATE_PROGRAM.agc:130
//# 2. REFSMMAT(ALL DATA ENTRIES IN OCTAL)
// PORT: SOURCE UPDATE_PROGRAM.agc:131
//# ENTRIES:        DATA DEFINITITIONS:                                     SCALE FACTORS:
// PORT: SOURCE UPDATE_PROGRAM.agc:132
//# Page 1388
// PORT: SOURCE UPDATE_PROGRAM.agc:133
//# V71E            CONTIGUOUS BLOCK UPDATE VERB
// PORT: SOURCE UPDATE_PROGRAM.agc:134
//#    24E          NUMBER OF COMPONENTS FOR REFSMMAT UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:135
//#  AAAAE          ECADR OF 'REFSMMAT'
// PORT: SOURCE UPDATE_PROGRAM.agc:136
//# XXXXXEXXXXXE    ROW 1 COLUMN 1                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:137
//# XXXXXEXXXXXE    ROW 1 COLUMN 2                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:138
//# XXXXXEXXXXXE    ROW 1 COLUMN 3                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:139
//# XXXXXEXXXXXE    ROW 2 COLUMN 1                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:140
//# XXXXXEXXXXXE    ROW 2 COLUMN 2                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:141
//# XXXXXEXXXXXE    ROW 2 COLUMN 3                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:142
//# XXXXXEXXXXXE    ROW 3 COLUMN 1                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:143
//# XXXXXEXXXXXE    ROW 3 COLUMN 2                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:144
//# XXXXXEXXXXXE    ROW 3 COLUMN 3                                          2(-1)
// PORT: SOURCE UPDATE_PROGRAM.agc:145
//# V33E            VERB 33 TO SIGNAL THAT REFSMMAT IS READY TO BE STORED.
// PORT: SOURCE UPDATE_PROGRAM.agc:146
//
// PORT: SOURCE UPDATE_PROGRAM.agc:147
//
// PORT: SOURCE UPDATE_PROGRAM.agc:148
//		BANK	07
// PORT: SOURCE UPDATE_PROGRAM.agc:149
//		SETLOC	EXTVERBS
// PORT: SOURCE UPDATE_PROGRAM.agc:150
//		BANK
// PORT: SOURCE UPDATE_PROGRAM.agc:151
//
// PORT: SOURCE UPDATE_PROGRAM.agc:152
//		EBANK=	TEPHEM
// PORT: SOURCE UPDATE_PROGRAM.agc:153
//
// PORT: SOURCE UPDATE_PROGRAM.agc:154
//		COUNT*	$$/P27
// PORT: SOURCE UPDATE_PROGRAM.agc:155
//V70UPDAT	CAF	UP70		# COMES HERE ON V70E
// PORT: Fixed ROM slots 38868.
                if slot <> 38868 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38869 {
// PORT: SOURCE UPDATE_PROGRAM.agc:156
//		TCF	V73UPDAT +1
// PORT: Fixed ROM slots 38869.
                    if slot <> 38869 or instruction <> 6107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6107, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:157
//
// PORT: SOURCE UPDATE_PROGRAM.agc:158
//
// PORT: SOURCE UPDATE_PROGRAM.agc:159
//V71UPDAT	CAF	UP71		# COMES HERE ON V71E
// PORT: Fixed ROM slots 38870.
                    if slot <> 38870 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 38871 {
// PORT: SOURCE UPDATE_PROGRAM.agc:160
//		TCF	V73UPDAT +1
// PORT: Fixed ROM slots 38871.
                if slot <> 38871 or instruction <> 6107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6107, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38872 {
// PORT: SOURCE UPDATE_PROGRAM.agc:161
//
// PORT: SOURCE UPDATE_PROGRAM.agc:162
//
// PORT: SOURCE UPDATE_PROGRAM.agc:163
//V72UPDAT	CAF	UP72		# COMES HERE ON V72E
// PORT: Fixed ROM slots 38872.
                    if slot <> 38872 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:164
//		TCF	V73UPDAT +1
// PORT: Fixed ROM slots 38873.
                    if slot <> 38873 or instruction <> 6107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6107, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38876 {
            if slot <= 38874 {
// PORT: SOURCE UPDATE_PROGRAM.agc:165
//
// PORT: SOURCE UPDATE_PROGRAM.agc:166
//
// PORT: SOURCE UPDATE_PROGRAM.agc:167
//V73UPDAT	CAF	UP73		# COMES HERE ON V73E
// PORT: Fixed ROM slots 38874.
                if slot <> 38874 or instruction <> 15525 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38875 {
// PORT: SOURCE UPDATE_PROGRAM.agc:168
//
// PORT: SOURCE UPDATE_PROGRAM.agc:169
// +1		TS	UPVERBSV	# SAVE UPVERB UNTIL IT'S OK TO ENTER P27
// PORT: Fixed ROM slots 38875.
                    if slot <> 38875 or instruction <> 23158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23158, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:170
//
// PORT: SOURCE UPDATE_PROGRAM.agc:171
//		TC	TESTXACT	# GRAB DISPLAY IF AVAILABLE, OTHERWISE
// PORT: Fixed ROM slots 38876.
                    if slot <> 38876 or instruction <> 1086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38878 {
                if slot <= 38877 {
// PORT: SOURCE UPDATE_PROGRAM.agc:172
//					# TURN*OPERATOR ERROR* ON AND TERMINATEJOB
// PORT: SOURCE UPDATE_PROGRAM.agc:173
//
// PORT: SOURCE UPDATE_PROGRAM.agc:174
//		CA	MODREG		# CHECK IF UPDATE ALLOWED
// PORT: Fixed ROM slots 38877.
                    if slot <> 38877 or instruction <> 12809 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:175
//		EXTEND			# FIRST CHECK FOR MODREG = +0, -0
// PORT: Fixed ROM slots 38878.
                    if slot <> 38878 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38879 {
// PORT: SOURCE UPDATE_PROGRAM.agc:176
//		BZF	+3		# (+0 = P00, -0 = FRESHSTART)
// PORT: Fixed ROM slots 38879.
                    if slot <> 38879 or instruction <> 6114 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6114, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:177
//UPERROR		TC	POSTJUMP	# TURN ON 'OPERATOR ERROR' LIGHT
// PORT: Fixed ROM slots 38880.
                    if slot <> 38880 or instruction <> 2461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2461, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2650] to agcAotUnit2650@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:178
//		CADR	UPERROUT +2	# GO TO COMMON UPDATE PROGRAM EXIT
// PORT: Fixed ROM slots 38881.
    38881, 10212
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38882–38888.
function agcAotUnit2651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38884 {
        if slot <= 38882 {
// PORT: SOURCE UPDATE_PROGRAM.agc:179
//
// PORT: SOURCE UPDATE_PROGRAM.agc:180
//		CAE	MODREG		# UPDATE ALLOWED.
// PORT: Fixed ROM slots 38882.
            if slot <> 38882 or instruction <> 12809 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38883 {
// PORT: SOURCE UPDATE_PROGRAM.agc:181
//CKMDMORE	=	UPERROR
// PORT: SOURCE UPDATE_PROGRAM.agc:182
//		TS	UPOLDMOD	# SAVE CURRENT MAJOR MODE
// PORT: Fixed ROM slots 38883.
                if slot <> 38883 or instruction <> 23161 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23161, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:183
//# Page 1389
// PORT: SOURCE UPDATE_PROGRAM.agc:184
//		CAE	UPVERBSV	# SET UPVERB TO INDICDATE TO P27
// PORT: Fixed ROM slots 38884.
                if slot <> 38884 or instruction <> 12918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 630).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38886 {
            if slot <= 38885 {
// PORT: SOURCE UPDATE_PROGRAM.agc:185
//		TS	UPVERB		# WHICH EXTENDED VERB CALLED IT.
// PORT: Fixed ROM slots 38885.
                if slot <> 38885 or instruction <> 23162 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23162, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:186
//
// PORT: SOURCE UPDATE_PROGRAM.agc:187
//		CAF	ONE
// PORT: Fixed ROM slots 38886.
                if slot <> 38886 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 38887 {
// PORT: SOURCE UPDATE_PROGRAM.agc:188
//		TS	UPCOUNT		# INITIALIZE UPCOUNT TO 1
// PORT: Fixed ROM slots 38887.
                if slot <> 38887 or instruction <> 23163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23163, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:189
//
// PORT: SOURCE UPDATE_PROGRAM.agc:190
//		TC	POSTJUMP	# LEAVE EXTENDED VERB BANK AND
// PORT: Fixed ROM slots 38888.
                if slot <> 38888 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2651] to agcAotUnit2651@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:191
//		CADR	UPPART2		# GO TO UPDATE PROGRAM(P27) BANK.
// PORT: Fixed ROM slots 38889.
    38889, 9730
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6913–6913.
function agcAotUnit408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE UPDATE_PROGRAM.agc:192
//
// PORT: SOURCE UPDATE_PROGRAM.agc:193
//
// PORT: SOURCE UPDATE_PROGRAM.agc:194
//UP70		EQUALS	ZERO
// PORT: SOURCE UPDATE_PROGRAM.agc:195
//UP71		EQUALS	ONE
// PORT: SOURCE UPDATE_PROGRAM.agc:196
//UP72		EQUALS	TWO
// PORT: SOURCE UPDATE_PROGRAM.agc:197
//UP73		EQUALS	THREE
// PORT: SOURCE UPDATE_PROGRAM.agc:198
//
// PORT: SOURCE UPDATE_PROGRAM.agc:199
//
// PORT: SOURCE UPDATE_PROGRAM.agc:200
//		BANK	04
// PORT: SOURCE UPDATE_PROGRAM.agc:201
//		SETLOC	UPDATE2
// PORT: SOURCE UPDATE_PROGRAM.agc:202
//		BANK
// PORT: SOURCE UPDATE_PROGRAM.agc:203
//
// PORT: SOURCE UPDATE_PROGRAM.agc:204
//		COUNT*	$$/P27
// PORT: SOURCE UPDATE_PROGRAM.agc:205
//
// PORT: SOURCE UPDATE_PROGRAM.agc:206
//UPPART2		EQUALS			# UPDATE PROGRAM - PART 2
// PORT: SOURCE UPDATE_PROGRAM.agc:207
//
// PORT: SOURCE UPDATE_PROGRAM.agc:208
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO RESTORE OLD MODE
// PORT: Fixed ROM slots 6913.
    if slot <> 6913 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[408] to agcAotUnit408@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:209
//		OCT	07026		# AND DOWNLIST AND EXIT IF RESTART OCCURS.
// PORT: Fixed ROM slots 6914.
    6914, 7212,
// PORT: SOURCE UPDATE_PROGRAM.agc:210
//		OCT	30000		# PRIORITY SAME AS CHRPRIO
// PORT: Fixed ROM slots 6915.
    6915, 24576,
// PORT: SOURCE UPDATE_PROGRAM.agc:211
//		EBANK=	UPBUFF
// PORT: SOURCE UPDATE_PROGRAM.agc:212
//		2CADR	UPOUT +1
// PORT: Fixed ROM slots 6916 6917.
    6916, 3988, 6917, 8324
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6918–6920.
function agcAotUnit409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6918 {
// PORT: SOURCE UPDATE_PROGRAM.agc:213
//
// PORT: SOURCE UPDATE_PROGRAM.agc:214
//
// PORT: SOURCE UPDATE_PROGRAM.agc:215
//		CAF	ONE
// PORT: Fixed ROM slots 6918.
        if slot <> 6918 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6919 {
// PORT: SOURCE UPDATE_PROGRAM.agc:216
//		TS	DNLSTCOD	# DOWNLIST
// PORT: Fixed ROM slots 6919.
            if slot <> 6919 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:217
//
// PORT: SOURCE UPDATE_PROGRAM.agc:218
//		TC	NEWMODEX	# SET MAJOR MODE = 27
// PORT: Fixed ROM slots 6920.
            if slot <> 6920 or instruction <> 2761 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2761, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[409] to agcAotUnit409@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:219
//		DEC	27
// PORT: Fixed ROM slots 6921.
    6921, 54
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6922–6922.
function agcAotUnit410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE UPDATE_PROGRAM.agc:220
//
// PORT: SOURCE UPDATE_PROGRAM.agc:221
//		INDEX	UPVERB		# BRANCH DEPENDING ON WHETHER THE UPDATE
// PORT: Fixed ROM slots 6922.
    if slot <> 6922 or instruction <> 21114 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21114, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21114, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[410] to agcAotUnit410@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:222
//		TCF	+1		# VERB REQUIRES A FIXED OR VARIABLE NUMBER
// PORT: Fixed ROM slots 6923.
    6923, 11800
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6924–6933.
function agcAotUnit411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6928 {
        if slot <= 6925 {
            if slot <= 6924 {
// PORT: SOURCE UPDATE_PROGRAM.agc:223
//		TCF	+3		# V70 FIXED.               (OF COMPONENTS.
// PORT: Fixed ROM slots 6924.
                if slot <> 6924 or instruction <> 5903 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5903, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:224
//		TCF	OHWELL1		# V71 VARIABLE - GO GET NO. OF COMPONENTS
// PORT: Fixed ROM slots 6925.
                if slot <> 6925 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6926 {
// PORT: SOURCE UPDATE_PROGRAM.agc:225
//		TCF	OHWELL1		# V72 VARIABLE - GO GET NO. OF COMPONENTS
// PORT: Fixed ROM slots 6926.
                if slot <> 6926 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6927 {
// PORT: SOURCE UPDATE_PROGRAM.agc:226
//		CA	TWO		# V73 (AND V70) FIXED
// PORT: Fixed ROM slots 6927.
                    if slot <> 6927 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:227
//		TS	COMPNUMB	# SET NUMBER OF COMPONENTS TO 2.
// PORT: Fixed ROM slots 6928.
                    if slot <> 6928 or instruction <> 23160 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23160, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6930 {
            if slot <= 6929 {
// PORT: SOURCE UPDATE_PROGRAM.agc:228
//		TCF	OHWELL2		# GO GET THE TWO UPDATE COMPONENTS
// PORT: Fixed ROM slots 6929.
                if slot <> 6929 or instruction <> 5925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5925, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:229
//
// PORT: SOURCE UPDATE_PROGRAM.agc:230
//OHWELL1		CAF	ADUPBUFF	# * REQUEST USER TO SEND NUMBER *
// PORT: Fixed ROM slots 6930.
                if slot <> 6930 or instruction <> 14157 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1869), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6931 {
// PORT: SOURCE UPDATE_PROGRAM.agc:231
//		TS	MPAC +2		# * OF COMPONENTS PARAMETER(II).*
// PORT: Fixed ROM slots 6931.
                if slot <> 6931 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6932 {
// PORT: SOURCE UPDATE_PROGRAM.agc:232
// +2		CAF	UPLOADNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// PORT: Fixed ROM slots 6932.
                    if slot <> 6932 or instruction <> 14158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1870), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:233
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// PORT: Fixed ROM slots 6933.
                    if slot <> 6933 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[411] to agcAotUnit411@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:234
//# Page 1390
// PORT: SOURCE UPDATE_PROGRAM.agc:235
//		CADR	GOXDSPF		# TO REQUEST II.
// PORT: Fixed ROM slots 6934.
    6934, 16824
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6935–6953.
function agcAotUnit412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6943 {
        if slot <= 6938 {
            if slot <= 6936 {
                if slot <= 6935 {
// PORT: SOURCE UPDATE_PROGRAM.agc:236
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// PORT: Fixed ROM slots 6935.
                    if slot <> 6935 or instruction <> 6090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:237
//		TCF	OHWELL1 +2
// PORT: Fixed ROM slots 6936.
                    if slot <> 6936 or instruction <> 5908 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6937 {
// PORT: SOURCE UPDATE_PROGRAM.agc:238
//		TC	CK4V32		# DATA OR V32 RETURN
// PORT: Fixed ROM slots 6937.
                    if slot <> 6937 or instruction <> 1862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:239
//		CS	BIT2
// PORT: Fixed ROM slots 6938.
                    if slot <> 6938 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6940 {
                if slot <= 6939 {
// PORT: SOURCE UPDATE_PROGRAM.agc:240
//		AD	UPBUFF		# IS II(NUMBER OF COMPONENTS PARAMETER)
// PORT: Fixed ROM slots 6939.
                    if slot <> 6939 or instruction <> 25212 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 636).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:241
//		EXTEND			# .GE. 3 AND .LE. 20D.
// PORT: Fixed ROM slots 6940.
                    if slot <> 6940 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6941 {
// PORT: SOURCE UPDATE_PROGRAM.agc:242
//		BZMF	OHWELL1 +2
// PORT: Fixed ROM slots 6941.
                    if slot <> 6941 or instruction <> 26388 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6942 {
// PORT: SOURCE UPDATE_PROGRAM.agc:243
//		CS	UPBUFF
// PORT: Fixed ROM slots 6942.
                        if slot <> 6942 or instruction <> 17020 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 636).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:244
//		AD	UP21
// PORT: Fixed ROM slots 6943.
                        if slot <> 6943 or instruction <> 26866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6948 {
            if slot <= 6945 {
                if slot <= 6944 {
// PORT: SOURCE UPDATE_PROGRAM.agc:245
//		EXTEND
// PORT: Fixed ROM slots 6944.
                    if slot <> 6944 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:246
//		BZMF	OHWELL1 +2
// PORT: Fixed ROM slots 6945.
                    if slot <> 6945 or instruction <> 26388 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6946 {
// PORT: SOURCE UPDATE_PROGRAM.agc:247
//		CAE	UPBUFF
// PORT: Fixed ROM slots 6946.
                    if slot <> 6946 or instruction <> 12924 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 636).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6947 {
// PORT: SOURCE UPDATE_PROGRAM.agc:248
//		TS	COMPNUMB	# SAVE II IN COMPNUMB
// PORT: Fixed ROM slots 6947.
                        if slot <> 6947 or instruction <> 23160 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23160, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:249
//
// PORT: SOURCE UPDATE_PROGRAM.agc:250
//# UPBUFF LOADING SEQUENCE
// PORT: SOURCE UPDATE_PROGRAM.agc:251
//
// PORT: SOURCE UPDATE_PROGRAM.agc:252
//		INCR	UPCOUNT		# INCREMENT COUNT OF COMPONENTS RECEIVED.
// PORT: Fixed ROM slots 6948.
                        if slot <> 6948 or instruction <> 10875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 635).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6950 {
                if slot <= 6949 {
// PORT: SOURCE UPDATE_PROGRAM.agc:253
//OHWELL2		CAF	ADUPBFM1	# CALCULATE LOCATION(ECADR) IN UPBUFF
// PORT: Fixed ROM slots 6949.
                    if slot <> 6949 or instruction <> 14258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1970), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:254
//		AD	UPCOUNT		# WHERE NEXT COMPONENT SHOULD BE STORED.
// PORT: Fixed ROM slots 6950.
                    if slot <> 6950 or instruction <> 25211 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 635).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6951 {
// PORT: SOURCE UPDATE_PROGRAM.agc:255
// +2		TS	MPAC +2		# PLACE ECADR INTO R3.
// PORT: Fixed ROM slots 6951.
                    if slot <> 6951 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6952 {
// PORT: SOURCE UPDATE_PROGRAM.agc:256
// +3		CAF	UPLOADNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// PORT: Fixed ROM slots 6952.
                        if slot <> 6952 or instruction <> 14158 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1870), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:257
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// PORT: Fixed ROM slots 6953.
                        if slot <> 6953 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[412] to agcAotUnit412@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:258
//		CADR	GOXDSPF		# TO REQUEST DATA.
// PORT: Fixed ROM slots 6954.
    6954, 16824
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6955–6966.
function agcAotUnit413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6960 {
        if slot <= 6957 {
            if slot <= 6955 {
// PORT: SOURCE UPDATE_PROGRAM.agc:259
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN.
// PORT: Fixed ROM slots 6955.
                if slot <> 6955 or instruction <> 6090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6090, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6956 {
// PORT: SOURCE UPDATE_PROGRAM.agc:260
//		TCF	OHWELL2 +3	# V33 PROCEED RETURN
// PORT: Fixed ROM slots 6956.
                    if slot <> 6956 or instruction <> 5928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:261
//		TC	CK4V32		# DATA OR V32 RETURN
// PORT: Fixed ROM slots 6957.
                    if slot <> 6957 or instruction <> 1862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6958 {
// PORT: SOURCE UPDATE_PROGRAM.agc:262
//		CS	UPCOUNT		# HAVE WE FINISHED RECEIVING ALL
// PORT: Fixed ROM slots 6958.
                if slot <> 6958 or instruction <> 17019 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 635).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6959 {
// PORT: SOURCE UPDATE_PROGRAM.agc:263
//		AD	COMPNUMB	# THE DATA WE EXPECTED.
// PORT: Fixed ROM slots 6959.
                    if slot <> 6959 or instruction <> 25208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 632).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:264
//		EXTEND
// PORT: Fixed ROM slots 6960.
                    if slot <> 6960 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6963 {
            if slot <= 6961 {
// PORT: SOURCE UPDATE_PROGRAM.agc:265
//		BZMF	UPVERIFY	# YES- GO TO VERIFICATION SEQUENCE
// PORT: Fixed ROM slots 6961.
                if slot <> 6961 or instruction <> 26419 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6962 {
// PORT: SOURCE UPDATE_PROGRAM.agc:266
//		TCF	OHWELL2 -1	# NO- REQUEST ADDITIONAL DATA.
// PORT: Fixed ROM slots 6962.
                    if slot <> 6962 or instruction <> 5924 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5924, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:267
//
// PORT: SOURCE UPDATE_PROGRAM.agc:268
//# VERIFY SEQUENCE
// PORT: SOURCE UPDATE_PROGRAM.agc:269
//
// PORT: SOURCE UPDATE_PROGRAM.agc:270
//UPVERIFY	CAF	ADUPTEMP	# PLACE ECADR WHERE COMPONENT NO. INDEX
// PORT: Fixed ROM slots 6963.
                    if slot <> 6963 or instruction <> 14156 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1868), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6964 {
// PORT: SOURCE UPDATE_PROGRAM.agc:271
//		TS	MPAC +2		# IS TO BE STORED INTO R3.
// PORT: Fixed ROM slots 6964.
                if slot <> 6964 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6965 {
// PORT: SOURCE UPDATE_PROGRAM.agc:272
//		CAF	UPVRFYNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// PORT: Fixed ROM slots 6965.
                    if slot <> 6965 or instruction <> 14159 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1871), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:273
//		TC	BANKCALL	# DISPLAY A FLASHING V21N02 TO REQUEST
// PORT: Fixed ROM slots 6966.
                    if slot <> 6966 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[413] to agcAotUnit413@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:274
//		CADR	GOXDSPF		# DATA CORRECTION OR VERIFICATION.
// PORT: Fixed ROM slots 6967.
    6967, 16824
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6968–6986.
function agcAotUnit414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6976 {
        if slot <= 6971 {
            if slot <= 6969 {
                if slot <= 6968 {
// PORT: SOURCE UPDATE_PROGRAM.agc:275
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// PORT: Fixed ROM slots 6968.
                    if slot <> 6968 or instruction <> 6090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:276
//		TCF	UPSTORE		# V33 DATA SENT IS GOOD. GO STORE IT.
// PORT: Fixed ROM slots 6969.
                    if slot <> 6969 or instruction <> 5968 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5968, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6970 {
// PORT: SOURCE UPDATE_PROGRAM.agc:277
//		TC	CK4V32		# COMPONENT NO. INDEX OR V32 RETURN
// PORT: Fixed ROM slots 6970.
                    if slot <> 6970 or instruction <> 1862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:278
//		CA	UPTEMP		# DOES THE COMPONENT NO. INDEX JUST SENT
// PORT: Fixed ROM slots 6971.
                    if slot <> 6971 or instruction <> 12919 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 631).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6973 {
                if slot <= 6972 {
// PORT: SOURCE UPDATE_PROGRAM.agc:279
//		EXTEND			# SPECIFY A LEGAL COMPONENT NUMBER?
// PORT: Fixed ROM slots 6972.
                    if slot <> 6972 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:280
//		BZMF	UPVERIFY	# NO, IT IS NOT POSITIVE NONZERO
// PORT: Fixed ROM slots 6973.
                    if slot <> 6973 or instruction <> 26419 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26419, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6974 {
// PORT: SOURCE UPDATE_PROGRAM.agc:281
//		CS	UPTEMP
// PORT: Fixed ROM slots 6974.
                    if slot <> 6974 or instruction <> 17015 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 631).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6975 {
// PORT: SOURCE UPDATE_PROGRAM.agc:282
//		AD	COMPNUMB
// PORT: Fixed ROM slots 6975.
                        if slot <> 6975 or instruction <> 25208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 632).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:283
//# Page 1391
// PORT: SOURCE UPDATE_PROGRAM.agc:284
//		AD	BIT1
// PORT: Fixed ROM slots 6976.
                        if slot <> 6976 or instruction <> 27115 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6981 {
            if slot <= 6978 {
                if slot <= 6977 {
// PORT: SOURCE UPDATE_PROGRAM.agc:285
//		EXTEND
// PORT: Fixed ROM slots 6977.
                    if slot <> 6977 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:286
//		BZMF	UPVERIFY	# NO
// PORT: Fixed ROM slots 6978.
                    if slot <> 6978 or instruction <> 26419 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26419, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6979 {
// PORT: SOURCE UPDATE_PROGRAM.agc:287
//		CAF	ADUPBFM1	# YES- BASED ON THE COMPONENT NO. INDEX
// PORT: Fixed ROM slots 6979.
                    if slot <> 6979 or instruction <> 14258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1970), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6980 {
// PORT: SOURCE UPDATE_PROGRAM.agc:288
//		AD	UPTEMP		# CALCULATE THE ECADR OF LOCATION IN
// PORT: Fixed ROM slots 6980.
                        if slot <> 6980 or instruction <> 25207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 631).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:289
//		TCF	OHWELL2 +2	# UPBUFF WHICH USER WANTS TO CHANGE.
// PORT: Fixed ROM slots 6981.
                        if slot <> 6981 or instruction <> 5927 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5927, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6983 {
                if slot <= 6982 {
// PORT: SOURCE UPDATE_PROGRAM.agc:290
//
// PORT: SOURCE UPDATE_PROGRAM.agc:291
//UPOUT4		EQUALS	UPOUT +1	# COMES HERE ON V34 TO TERMINATE UPDATE
// PORT: SOURCE UPDATE_PROGRAM.agc:292
//
// PORT: SOURCE UPDATE_PROGRAM.agc:293
//# CHECK FOR VERB 32 SEQUENCE
// PORT: SOURCE UPDATE_PROGRAM.agc:294
//
// PORT: SOURCE UPDATE_PROGRAM.agc:295
//CK4V32		CS	MPAC		# ON DATA RETURN FROM 'GOXDSPF'
// PORT: Fixed ROM slots 6982.
                    if slot <> 6982 or instruction <> 16492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 108).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:296
//		MASK	BIT6		# ON DATA RETURN FROM "GOXDSP"& THE CON-
// PORT: Fixed ROM slots 6983.
                    if slot <> 6983 or instruction <> 31206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6984 {
// PORT: SOURCE UPDATE_PROGRAM.agc:297
//		CCS	A		# TENTS OF MPAC = VERB.  SO TEST FOR V32.
// PORT: Fixed ROM slots 6984.
                    if slot <> 6984 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6985 {
// PORT: SOURCE UPDATE_PROGRAM.agc:298
//		TC	Q		# IT'S NOT A V32, IT'S DATA.  PROCEED.
// PORT: Fixed ROM slots 6985.
                        if slot <> 6985 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:299
//		INDEX	Q
// PORT: Fixed ROM slots 6986.
                        if slot <> 6986 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[414] to agcAotUnit414@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:300
//		TC	0 -6		# V32 ENCOUNTERED - GO BACK AND GET DATA
// PORT: Fixed ROM slots 6987.
    6987, 65522,
// PORT: SOURCE UPDATE_PROGRAM.agc:301
//
// PORT: SOURCE UPDATE_PROGRAM.agc:302
//ADUPTEMP	ADRES	UPTEMP		# ADDRESS OF TEMP STORAGE FOR CORRECTIONS
// PORT: Fixed ROM slots 6988.
    6988, 1262,
// PORT: SOURCE UPDATE_PROGRAM.agc:303
//ADUPBUFF	ADRES	UPBUFF		# ADDRESS OF UPDATE DATA STORAGE BUFFER
// PORT: Fixed ROM slots 6989.
    6989, 1272,
// PORT: SOURCE UPDATE_PROGRAM.agc:304
//UPLOADNV	VN	2101		# VERB 21 NOUN 01
// PORT: Fixed ROM slots 6990.
    6990, 5378,
// PORT: SOURCE UPDATE_PROGRAM.agc:305
//UPVRFYNV	VN	2102		# VERB 21 NOUN 02
// PORT: Fixed ROM slots 6991.
    6991, 5380
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6992–6999.
function agcAotUnit415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6995 {
        if slot <= 6993 {
            if slot <= 6992 {
// PORT: SOURCE UPDATE_PROGRAM.agc:306
//UP21		=	MD1		# DEC 21 = MAX NO OF COMPONENTS +1
// PORT: SOURCE UPDATE_PROGRAM.agc:307
//UPDTPHAS	EQUALS	FIVE
// PORT: SOURCE UPDATE_PROGRAM.agc:308
//
// PORT: SOURCE UPDATE_PROGRAM.agc:309
//# PRE-STORE AND FAN TO APPROPRIATE BRANCH SEQUENCE
// PORT: SOURCE UPDATE_PROGRAM.agc:310
//
// PORT: SOURCE UPDATE_PROGRAM.agc:311
//UPSTORE		EQUALS			# GROUND HAS VERIFIED UPDATE.  STORE DATA.
// PORT: SOURCE UPDATE_PROGRAM.agc:312
//
// PORT: SOURCE UPDATE_PROGRAM.agc:313
//		INHINT
// PORT: Fixed ROM slots 6992.
                if slot <> 6992 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:314
//
// PORT: SOURCE UPDATE_PROGRAM.agc:315
//		CAE	FLAGWRD7	# INVERT VERIFLAG(BIT3 OF FLAGWRD7) TO
// PORT: Fixed ROM slots 6993.
                if slot <> 6993 or instruction <> 12355 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6994 {
// PORT: SOURCE UPDATE_PROGRAM.agc:316
//		XCH	L		# INDICATE TO THE GROUND(VIA DOWNLINK)
// PORT: Fixed ROM slots 6994.
                if slot <> 6994 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:317
//		CAF	VERIFBIT	# THAT THE V33 (WHICH THE GROUND SENT TO
// PORT: Fixed ROM slots 6995.
                if slot <> 6995 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6997 {
            if slot <= 6996 {
// PORT: SOURCE UPDATE_PROGRAM.agc:318
//		EXTEND			# VERIFY THE UPDATE) HAS BEEN SUCCESSFULLY
// PORT: Fixed ROM slots 6996.
                if slot <> 6996 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:319
//		RXOR	LCHAN		# RECEIVED BY THE UPDATE PROGRAM
// PORT: Fixed ROM slots 6997.
                if slot <> 6997 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6998 {
// PORT: SOURCE UPDATE_PROGRAM.agc:320
//		TS	FLAGWRD7
// PORT: Fixed ROM slots 6998.
                if slot <> 6998 or instruction <> 22595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:321
//
// PORT: SOURCE UPDATE_PROGRAM.agc:322
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO REDO THE UPDATE
// PORT: Fixed ROM slots 6999.
                if slot <> 6999 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[415] to agcAotUnit415@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:323
//		OCT	04026		# DATA STORE IF A RESTART OCCURS.
// PORT: Fixed ROM slots 7000.
    7000, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7001–7013.
function agcAotUnit416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7006 {
        if slot <= 7003 {
            if slot <= 7001 {
// PORT: SOURCE UPDATE_PROGRAM.agc:324
//		INHINT			# (BECAUSE PHASCHNG DID A RELINT)
// PORT: Fixed ROM slots 7001.
                if slot <> 7001 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7002 {
// PORT: SOURCE UPDATE_PROGRAM.agc:325
//
// PORT: SOURCE UPDATE_PROGRAM.agc:326
//		CS	TWO		# GO TO UPFNDVAC IF INSTALL IS REQUIRED.
// PORT: Fixed ROM slots 7002.
                    if slot <> 7002 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:327
//		AD	UPVERB		# THAT IS, IF IT'S A V70 - V72.
// PORT: Fixed ROM slots 7003.
                    if slot <> 7003 or instruction <> 25210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 634).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7004 {
// PORT: SOURCE UPDATE_PROGRAM.agc:328
//		EXTEND			# GO TO UPEND73 IF IT'S A V73.
// PORT: Fixed ROM slots 7004.
                if slot <> 7004 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7005 {
// PORT: SOURCE UPDATE_PROGRAM.agc:329
//		BZMF	UPFNDVAC
// PORT: Fixed ROM slots 7005.
                    if slot <> 7005 or instruction <> 26468 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:330
//
// PORT: SOURCE UPDATE_PROGRAM.agc:331
//# VERB 73 BRANCH
// PORT: SOURCE UPDATE_PROGRAM.agc:332
//# Page 1392
// PORT: SOURCE UPDATE_PROGRAM.agc:333
//UPEND73		EXTEND			# V73-PERFORM DP OCTAL AGC CLOCK INCREMENT
// PORT: Fixed ROM slots 7006.
                    if slot <> 7006 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7009 {
            if slot <= 7007 {
// PORT: SOURCE UPDATE_PROGRAM.agc:334
//
// PORT: SOURCE UPDATE_PROGRAM.agc:335
//		DCA	UPBUFF
// PORT: Fixed ROM slots 7007.
                if slot <> 7007 or instruction <> 12925 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 637, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7008 {
// PORT: SOURCE UPDATE_PROGRAM.agc:336
//		DXCH	UPBUFF +8D
// PORT: Fixed ROM slots 7008.
                    if slot <> 7008 or instruction <> 22149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 645, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:337
//		TC	TIMEDIDL
// PORT: Fixed ROM slots 7009.
                    if slot <> 7009 or instruction <> 1911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1911, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7011 {
                if slot <= 7010 {
// PORT: SOURCE UPDATE_PROGRAM.agc:338
//		TC	FALTON		# ERROR- TURN ON *OPERATOR ERROR* LIGHT
// PORT: Fixed ROM slots 7010.
                    if slot <> 7010 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:339
//		TC	UPOUT +1	# GO TO COMMON UPDATE PROGRAM EXIT
// PORT: Fixed ROM slots 7011.
                    if slot <> 7011 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7012 {
// PORT: SOURCE UPDATE_PROGRAM.agc:340
//
// PORT: SOURCE UPDATE_PROGRAM.agc:341
//UPFNDVAC	CAF	CHRPRIO		# (USE EXTENDED VERB PRIORITY)
// PORT: Fixed ROM slots 7012.
                    if slot <> 7012 or instruction <> 14573 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:342
//		TC	FINDVAC		# GET VAC AREA FOR 'CALL INTSTALL'
// PORT: Fixed ROM slots 7013.
                    if slot <> 7013 or instruction <> 2629 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2629, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[416] to agcAotUnit416@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:343
//		EBANK=	TEPHEM
// PORT: SOURCE UPDATE_PROGRAM.agc:344
//		2CADR	UPJOB		# (NOTE: THIS WILL ALSO SET EBANK FOR
// PORT: Fixed ROM slots 7014 7015.
    7014, 3794, 7015, 8326
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7016–7017.
function agcAotUnit417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7016 {
// PORT: SOURCE UPDATE_PROGRAM.agc:345
//
// PORT: SOURCE UPDATE_PROGRAM.agc:346
//		TC	ENDOFJOB	# 'TEPHEM' UPDATE BY V70)
// PORT: Fixed ROM slots 7016.
        if slot <> 7016 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:347
//
// PORT: SOURCE UPDATE_PROGRAM.agc:348
//UPJOB		TC	INTPRET		# THIS COULD BE A STATE VECTOR UPDATE--SO
// PORT: Fixed ROM slots 7017.
        if slot <> 7017 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[417] to agcAotUnit417@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:349
//		CALL			# WAIT(PUT JOB TO SLEEP) IF ORBIT INT(OI)
// PORT: Fixed ROM slots 7018.
    7018, 65320,
// PORT: SOURCE UPDATE_PROGRAM.agc:350
//			INTSTALL	# IS IN PROGRESS--OR--GRAB OI AND RETURN
// PORT: Fixed ROM slots 7019.
    7019, 24088,
// PORT: SOURCE UPDATE_PROGRAM.agc:351
//					# TO UPWAKE IF OI IS NOT IN PROGRESS.
// PORT: SOURCE UPDATE_PROGRAM.agc:352
//
// PORT: SOURCE UPDATE_PROGRAM.agc:353
//UPWAKE		EXIT
// PORT: Fixed ROM slots 7020.
    7020, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7021–7021.
function agcAotUnit418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE UPDATE_PROGRAM.agc:354
//
// PORT: SOURCE UPDATE_PROGRAM.agc:355
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// PORT: Fixed ROM slots 7021.
    if slot <> 7021 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[418] to agcAotUnit418@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:356
//		OCT	04026
// PORT: Fixed ROM slots 7022.
    7022, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7023–7023.
function agcAotUnit419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE UPDATE_PROGRAM.agc:357
//
// PORT: SOURCE UPDATE_PROGRAM.agc:358
//		TC	UPFLAG		# SET INTEGRATION RESTART BIT
// PORT: Fixed ROM slots 7023.
    if slot <> 7023 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[419] to agcAotUnit419@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:359
//		ADRES	REINTFLG
// PORT: Fixed ROM slots 7024.
    7024, 316
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7025–7026.
function agcAotUnit420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7025 {
// PORT: SOURCE UPDATE_PROGRAM.agc:360
//		INHINT
// PORT: Fixed ROM slots 7025.
        if slot <> 7025 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:361
//UPPART3		EQUALS
// PORT: SOURCE UPDATE_PROGRAM.agc:362
//
// PORT: SOURCE UPDATE_PROGRAM.agc:363
//		INDEX	UPVERB		# BRANCH TO THE APPROPRIATE UPDATE VERB
// PORT: Fixed ROM slots 7026.
        if slot <> 7026 or instruction <> 21114 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21114, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21114, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[420] to agcAotUnit420@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:364
//		TCF	+1		# ROUTINE TO ACTUALLY PERFORM THE UPDATE
// PORT: Fixed ROM slots 7027.
    7027, 12008
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7028–7055.
function agcAotUnit421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7041 {
        if slot <= 7034 {
            if slot <= 7030 {
                if slot <= 7028 {
// PORT: SOURCE UPDATE_PROGRAM.agc:365
//		TCF	UPEND70		# V70
// PORT: Fixed ROM slots 7028.
                    if slot <> 7028 or instruction <> 6099 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6099, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7029 {
// PORT: SOURCE UPDATE_PROGRAM.agc:366
//		TCF	UPEND71		# V71
// PORT: Fixed ROM slots 7029.
                        if slot <> 7029 or instruction <> 6042 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6042, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:367
//		TCF	UPEND72		# V72
// PORT: Fixed ROM slots 7030.
                        if slot <> 7030 or instruction <> 6068 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6068, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7032 {
                    if slot <= 7031 {
// PORT: SOURCE UPDATE_PROGRAM.agc:368
//
// PORT: SOURCE UPDATE_PROGRAM.agc:369
//# ROUTINE TO INCREMENT CLOCK(TIME2,TIME1) WITH CONTENTS OF DP WORD AT UPBUFF.
// PORT: SOURCE UPDATE_PROGRAM.agc:370
//
// PORT: SOURCE UPDATE_PROGRAM.agc:371
//TIMEDIDL	EXTEND
// PORT: Fixed ROM slots 7031.
                        if slot <> 7031 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:372
//		QXCH	UPTEMP		# SAVE Q FOR RETURN
// PORT: Fixed ROM slots 7032.
                        if slot <> 7032 or instruction <> 9847 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 631, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7033 {
// PORT: SOURCE UPDATE_PROGRAM.agc:373
//		CAF	ZERO		# ZERO AND SAVE TIME2,TIME1
// PORT: Fixed ROM slots 7033.
                        if slot <> 7033 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:374
//		ZL
// PORT: Fixed ROM slots 7034.
                        if slot <> 7034 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7037 {
                if slot <= 7035 {
// PORT: SOURCE UPDATE_PROGRAM.agc:375
//		DXCH	TIME2
// PORT: Fixed ROM slots 7035.
                    if slot <> 7035 or instruction <> 21525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7036 {
// PORT: SOURCE UPDATE_PROGRAM.agc:376
//		DXCH	UPBUFF +18D	# STORE IN CASE OF OVERFLOW
// PORT: Fixed ROM slots 7036.
                        if slot <> 7036 or instruction <> 22159 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 655, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:377
//
// PORT: SOURCE UPDATE_PROGRAM.agc:378
//		CAF	UPDTPHAS	# DO
// PORT: Fixed ROM slots 7037.
                        if slot <> 7037 or instruction <> 14830 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7039 {
                    if slot <= 7038 {
// PORT: SOURCE UPDATE_PROGRAM.agc:379
//		TS	L		# A
// PORT: Fixed ROM slots 7038.
                        if slot <> 7038 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:380
//		COM			# QUICK
// PORT: Fixed ROM slots 7039.
                        if slot <> 7039 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7040 {
// PORT: SOURCE UPDATE_PROGRAM.agc:381
//		DXCH	-PHASE6		# PHASCHNG
// PORT: Fixed ROM slots 7040.
                        if slot <> 7040 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:382
//# Page 1393
// PORT: SOURCE UPDATE_PROGRAM.agc:383
//TIMEDIDR	INHINT
// PORT: Fixed ROM slots 7041.
                        if slot <> 7041 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7048 {
            if slot <= 7044 {
                if slot <= 7042 {
// PORT: SOURCE UPDATE_PROGRAM.agc:384
//
// PORT: SOURCE UPDATE_PROGRAM.agc:385
//		CAF	ZERO
// PORT: Fixed ROM slots 7042.
                    if slot <> 7042 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7043 {
// PORT: SOURCE UPDATE_PROGRAM.agc:386
//		ZL			# PICK UP INCREMENTER(AND ZERO
// PORT: Fixed ROM slots 7043.
                        if slot <> 7043 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:387
//		TS	MPAC +2		# IT IN CASE OF RESTARTS) AND
// PORT: Fixed ROM slots 7044.
                        if slot <> 7044 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7046 {
                    if slot <= 7045 {
// PORT: SOURCE UPDATE_PROGRAM.agc:388
//		DXCH	UPBUFF +8D	# STORE IT
// PORT: Fixed ROM slots 7045.
                        if slot <> 7045 or instruction <> 22149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 645, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:389
//		DXCH	MPAC		# INTO MPAC FOR TPAGREE.
// PORT: Fixed ROM slots 7046.
                        if slot <> 7046 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7047 {
// PORT: SOURCE UPDATE_PROGRAM.agc:390
//
// PORT: SOURCE UPDATE_PROGRAM.agc:391
//		EXTEND
// PORT: Fixed ROM slots 7047.
                        if slot <> 7047 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:392
//		DCA	UPBUFF +18D
// PORT: Fixed ROM slots 7048.
                        if slot <> 7048 or instruction <> 12943 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 655, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7051 {
                if slot <= 7049 {
// PORT: SOURCE UPDATE_PROGRAM.agc:393
//		DAS	MPAC		# FORM SUM IN MPAC
// PORT: Fixed ROM slots 7049.
                    if slot <> 7049 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7050 {
// PORT: SOURCE UPDATE_PROGRAM.agc:394
//		EXTEND
// PORT: Fixed ROM slots 7050.
                        if slot <> 7050 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:395
//		BZF	DELTATOK	# TEST FOR OVERFLOW
// PORT: Fixed ROM slots 7051.
                        if slot <> 7051 or instruction <> 6034 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6034, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7053 {
                    if slot <= 7052 {
// PORT: SOURCE UPDATE_PROGRAM.agc:396
//		CAF	ZERO
// PORT: Fixed ROM slots 7052.
                        if slot <> 7052 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:397
//		DXCH	UPBUFF +18D	# OVERFLOW, RESTORE OLD VALUE OF CLOCK
// PORT: Fixed ROM slots 7053.
                        if slot <> 7053 or instruction <> 22159 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 655, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7054 {
// PORT: SOURCE UPDATE_PROGRAM.agc:398
//		DAS	TIME2		# AND TURN ON OPERATOR ERROR
// PORT: Fixed ROM slots 7054.
                        if slot <> 7054 or instruction <> 8213 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 21) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:399
//
// PORT: SOURCE UPDATE_PROGRAM.agc:400
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// PORT: Fixed ROM slots 7055.
                        if slot <> 7055 or instruction <> 2795 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2795, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[421] to agcAotUnit421@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:401
//		OCT	04026
// PORT: Fixed ROM slots 7056.
    7056, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7057–7061.
function agcAotUnit422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7058 {
        if slot <= 7057 {
// PORT: SOURCE UPDATE_PROGRAM.agc:402
//
// PORT: SOURCE UPDATE_PROGRAM.agc:403
//		TC	UPTEMP		# GO TO ERROR EXIT
// PORT: Fixed ROM slots 7057.
            if slot <> 7057 or instruction <> 631 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 631, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:404
//
// PORT: SOURCE UPDATE_PROGRAM.agc:405
//DELTATOK	TC	TPAGREE		# FORCE SIGN AGREEMENT
// PORT: Fixed ROM slots 7058.
            if slot <> 7058 or instruction <> 3759 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3759, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7059 {
// PORT: SOURCE UPDATE_PROGRAM.agc:406
//		DXCH	MPAC
// PORT: Fixed ROM slots 7059.
            if slot <> 7059 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7060 {
// PORT: SOURCE UPDATE_PROGRAM.agc:407
//		DAS	TIME2		# INCREMENT TIME2,TIME1
// PORT: Fixed ROM slots 7060.
                if slot <> 7060 or instruction <> 8213 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 21) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:408
//
// PORT: SOURCE UPDATE_PROGRAM.agc:409
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// PORT: Fixed ROM slots 7061.
                if slot <> 7061 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[422] to agcAotUnit422@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:410
//		OCT	04026
// PORT: Fixed ROM slots 7062.
    7062, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7063–7064.
function agcAotUnit423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7063 {
// PORT: SOURCE UPDATE_PROGRAM.agc:411
//
// PORT: SOURCE UPDATE_PROGRAM.agc:412
//		INHINT
// PORT: Fixed ROM slots 7063.
        if slot <> 7063 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:413
//		INDEX	UPTEMP		# (CODED THIS WAY FOR RESTART PROTECTION)
// PORT: Fixed ROM slots 7064.
        if slot <> 7064 or instruction <> 21111 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[423] to agcAotUnit423@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:414
//		TC	1		# NORMAL RETURN
// PORT: Fixed ROM slots 7065.
    7065, 2
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7066–7066.
function agcAotUnit424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE UPDATE_PROGRAM.agc:415
//
// PORT: SOURCE UPDATE_PROGRAM.agc:416
//# VERB 71 BRANCH
// PORT: SOURCE UPDATE_PROGRAM.agc:417
//
// PORT: SOURCE UPDATE_PROGRAM.agc:418
//UPEND71		CAE	UPBUFF +1	# SET EBANK
// PORT: Fixed ROM slots 7066.
    if slot <> 7066 or instruction <> 12925 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 637).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[424] to agcAotUnit424@.

// PORT: Physical bank 04. Shared continuation entries, slots 7067–7080.
function agcAotUnit425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7073 {
        if slot <= 7069 {
            if slot <= 7067 {
// PORT: SOURCE UPDATE_PROGRAM.agc:419
//		TS	EBANK		#    AND
// PORT: Fixed ROM slots 7067.
                if slot <> 7067 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7068 {
// PORT: SOURCE UPDATE_PROGRAM.agc:420
//		MASK	LOW8		# CALCULATE
// PORT: Fixed ROM slots 7068.
                    if slot <> 7068 or instruction <> 30959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                        if fixedOperand = 255 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:421
//		TS	UPTEMP		# S-REG VALUE OF RECEIVING AREA
// PORT: Fixed ROM slots 7069.
                    if slot <> 7069 or instruction <> 23159 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23159, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7071 {
                if slot <= 7070 {
// PORT: SOURCE UPDATE_PROGRAM.agc:422
//
// PORT: SOURCE UPDATE_PROGRAM.agc:423
//		AD	NEG3		# IN THE PROCESS OF
// PORT: Fixed ROM slots 7070.
                    if slot <> 7070 or instruction <> 28645 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:424
//		AD	COMPNUMB	# PERFORMING
// PORT: Fixed ROM slots 7071.
                    if slot <> 7071 or instruction <> 25208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 632).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7072 {
// PORT: SOURCE UPDATE_PROGRAM.agc:425
//		EXTEND			# THIS UPDATE
// PORT: Fixed ROM slots 7072.
                    if slot <> 7072 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:426
//		BZF	STORLP71	# WILL WE
// PORT: Fixed ROM slots 7073.
                    if slot <> 7073 or instruction <> 6055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6055, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7076 {
            if slot <= 7074 {
// PORT: SOURCE UPDATE_PROGRAM.agc:427
//		MASK	BIT9		# OVERFLOW
// PORT: Fixed ROM slots 7074.
                if slot <> 7074 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7075 {
// PORT: SOURCE UPDATE_PROGRAM.agc:428
//		CCS	A		# INTO THE NEXT EBANK....
// PORT: Fixed ROM slots 7075.
                    if slot <> 7075 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:429
//		TCF	UPERROUT	# YES
// PORT: Fixed ROM slots 7076.
                    if slot <> 7076 or instruction <> 6128 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6128, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7078 {
                if slot <= 7077 {
// PORT: SOURCE UPDATE_PROGRAM.agc:430
//
// PORT: SOURCE UPDATE_PROGRAM.agc:431
//		CA	NEG3		# NO- CALCULATE NUMBER OF
// PORT: Fixed ROM slots 7077.
                    if slot <> 7077 or instruction <> 16357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4069), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:432
//		AD	COMPNUMB	# WORDS TO BE STORED MINUS ONE
// PORT: Fixed ROM slots 7078.
                    if slot <> 7078 or instruction <> 25208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 632).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7079 {
// PORT: SOURCE UPDATE_PROGRAM.agc:433
//STORLP71	TS	MPAC		# SAVE NO. OF WORDS REMAINING MINUS ONE
// PORT: Fixed ROM slots 7079.
                    if slot <> 7079 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:434
//# Page 1394
// PORT: SOURCE UPDATE_PROGRAM.agc:435
//		INDEX	A		# TAKE NEXT UPDATE WORD FROM
// PORT: Fixed ROM slots 7080.
                    if slot <> 7080 or instruction <> 20480 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20480, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20480, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[425] to agcAotUnit425@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:436
//		CA	UPBUFF +2	# UPBUFF AND
// PORT: Fixed ROM slots 7081.
    7081, 25852
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7082–7085.
function agcAotUnit426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7083 {
        if slot <= 7082 {
// PORT: SOURCE UPDATE_PROGRAM.agc:437
//		TS	L		# SAVE IT IN L
// PORT: Fixed ROM slots 7082.
            if slot <> 7082 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:438
//		CA	MPAC		# CALCULATE NEXT
// PORT: Fixed ROM slots 7083.
            if slot <> 7083 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7084 {
// PORT: SOURCE UPDATE_PROGRAM.agc:439
//		AD	UPTEMP		# RECEIVING ADDRESS
// PORT: Fixed ROM slots 7084.
            if slot <> 7084 or instruction <> 25207 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 631).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:440
//		INDEX	A
// PORT: Fixed ROM slots 7085.
            if slot <> 7085 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[426] to agcAotUnit426@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:441
//		EBANK=	1400
// PORT: SOURCE UPDATE_PROGRAM.agc:442
//		LXCH	1400		# UPDATE THE REGISTER  BY CONTENTS OF L
// PORT: Fixed ROM slots 7086.
    7086, 19968
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7087–7089.
function agcAotUnit427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7087 {
// PORT: SOURCE UPDATE_PROGRAM.agc:443
//		EBANK=	TEPHEM
// PORT: SOURCE UPDATE_PROGRAM.agc:444
//		CCS	MPAC		# ARE THERE ANY WORDS LEFT TO BE STORED
// PORT: Fixed ROM slots 7087.
        if slot <> 7087 or instruction <> 4204 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 108).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 7088 {
// PORT: SOURCE UPDATE_PROGRAM.agc:445
//		TCF	STORLP71	# YES
// PORT: Fixed ROM slots 7088.
            if slot <> 7088 or instruction <> 6055 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6055, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:446
//		TCF	UPOUT		# NO- THEN EXIT UPDATE PROGRAM
// PORT: Fixed ROM slots 7089.
            if slot <> 7089 or instruction <> 6089 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6089, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[427] to agcAotUnit427@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:447
//ADUPBFM1	ADRES	UPBUFF -1	# SAME AS ADUPBUFF BUT LESS 1 (DON'T MOVE)
// PORT: Fixed ROM slots 7090.
    7090, 1270
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7091–7100.
function agcAotUnit428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7095 {
        if slot <= 7092 {
            if slot <= 7091 {
// PORT: SOURCE UPDATE_PROGRAM.agc:448
//		TCF	UPOUT		# NO- EXIT UPDATE(HERE WHEN COMPNUMB = 3)
// PORT: Fixed ROM slots 7091.
                if slot <> 7091 or instruction <> 6089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:449
//
// PORT: SOURCE UPDATE_PROGRAM.agc:450
//# VERB 72 BRANCH
// PORT: SOURCE UPDATE_PROGRAM.agc:451
//
// PORT: SOURCE UPDATE_PROGRAM.agc:452
//UPEND72		CAF	BIT1		# HAVE AN ODD NO. OF COMPONENTS
// PORT: Fixed ROM slots 7092.
                if slot <> 7092 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
            if slot <= 7093 {
// PORT: SOURCE UPDATE_PROGRAM.agc:453
//		MASK	COMPNUMB	# BEEN SENT FOR A V72 UPDATE...
// PORT: Fixed ROM slots 7093.
                if slot <> 7093 or instruction <> 29304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 632).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7094 {
// PORT: SOURCE UPDATE_PROGRAM.agc:454
//		CCS	A
// PORT: Fixed ROM slots 7094.
                    if slot <> 7094 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:455
//		TCF	+2		# YES
// PORT: Fixed ROM slots 7095.
                    if slot <> 7095 or instruction <> 6073 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6073, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7097 {
            if slot <= 7096 {
// PORT: SOURCE UPDATE_PROGRAM.agc:456
//		TCF	UPERROUT	# ERROR- SHOULD BE ODD NO. OF COMPONENTS
// PORT: Fixed ROM slots 7096.
                if slot <> 7096 or instruction <> 6128 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6128, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:457
//		CS	BIT2
// PORT: Fixed ROM slots 7097.
                if slot <> 7097 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7098 {
// PORT: SOURCE UPDATE_PROGRAM.agc:458
//		AD	COMPNUMB
// PORT: Fixed ROM slots 7098.
                if slot <> 7098 or instruction <> 25208 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 632).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7099 {
// PORT: SOURCE UPDATE_PROGRAM.agc:459
//LDLOOP72	TS	MPAC		# NOW PERFORM THE UPDATE
// PORT: Fixed ROM slots 7099.
                    if slot <> 7099 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:460
//		INDEX	A
// PORT: Fixed ROM slots 7100.
                    if slot <> 7100 or instruction <> 20480 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20480, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20480, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[428] to agcAotUnit428@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:461
//		CAE	UPBUFF +1	# PICK UP NEXT UPDATE WORD
// PORT: Fixed ROM slots 7101.
    7101, 25850
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7102–7105.
function agcAotUnit429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7103 {
        if slot <= 7102 {
// PORT: SOURCE UPDATE_PROGRAM.agc:462
//		LXCH	A
// PORT: Fixed ROM slots 7102.
            if slot <> 7102 or instruction <> 9216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 0, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:463
//		CCS	MPAC		# SET POINTER TO ECADR(MUST BE CCS)
// PORT: Fixed ROM slots 7103.
            if slot <> 7103 or instruction <> 4204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7104 {
// PORT: SOURCE UPDATE_PROGRAM.agc:464
//		TS	MPAC
// PORT: Fixed ROM slots 7104.
            if slot <> 7104 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:465
//		INDEX	A
// PORT: Fixed ROM slots 7105.
            if slot <> 7105 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[429] to agcAotUnit429@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:466
//		CAE	UPBUFF +1	# PICK UP NEXT ECADR OF REG TO BE UPDATED
// PORT: Fixed ROM slots 7106.
    7106, 25850
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7107–7109.
function agcAotUnit430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7107 {
// PORT: SOURCE UPDATE_PROGRAM.agc:467
//		TS	EBANK		# SET EBANK
// PORT: Fixed ROM slots 7107.
        if slot <> 7107 or instruction <> 22531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22531, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 7108 {
// PORT: SOURCE UPDATE_PROGRAM.agc:468
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// PORT: Fixed ROM slots 7108.
            if slot <> 7108 or instruction <> 30959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                if fixedOperand = 255 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:469
//		INDEX	A
// PORT: Fixed ROM slots 7109.
            if slot <> 7109 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[430] to agcAotUnit430@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:470
//		EBANK=	1400
// PORT: SOURCE UPDATE_PROGRAM.agc:471
//		LXCH	1400		# UPDATE THE REGISTER BY CONTENTS OF L
// PORT: Fixed ROM slots 7110.
    7110, 19968
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7111–7134.
function agcAotUnit431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7122 {
        if slot <= 7116 {
            if slot <= 7113 {
                if slot <= 7111 {
// PORT: SOURCE UPDATE_PROGRAM.agc:472
//		EBANK=	TEPHEM
// PORT: SOURCE UPDATE_PROGRAM.agc:473
//		CCS	MPAC		# ARE WE THORUGH THE V72 UPDATE...
// PORT: Fixed ROM slots 7111.
                    if slot <> 7111 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7112 {
// PORT: SOURCE UPDATE_PROGRAM.agc:474
//		TCF	LDLOOP72	# NO
// PORT: Fixed ROM slots 7112.
                        if slot <> 7112 or instruction <> 6075 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6075, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:475
//
// PORT: SOURCE UPDATE_PROGRAM.agc:476
//# NORMAL FINISH OF P27
// PORT: SOURCE UPDATE_PROGRAM.agc:477
//
// PORT: SOURCE UPDATE_PROGRAM.agc:478
//UPOUT		EQUALS
// PORT: SOURCE UPDATE_PROGRAM.agc:479
//		TC	INTWAKEU	# RELEASE  GRAB  OF ORBITAL INTEGRATION
// PORT: Fixed ROM slots 7113.
                        if slot <> 7113 or instruction <> 1653 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1653, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7114 {
// PORT: SOURCE UPDATE_PROGRAM.agc:480
// +1		CAE	UPOLDMOD	# RESTORE PRIOR P27 MODE
// PORT: Fixed ROM slots 7114.
                    if slot <> 7114 or instruction <> 12921 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 633).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7115 {
// PORT: SOURCE UPDATE_PROGRAM.agc:481
//		TC	NEWMODEX +3
// PORT: Fixed ROM slots 7115.
                        if slot <> 7115 or instruction <> 2764 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2764, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:482
//		CAF	ZERO
// PORT: Fixed ROM slots 7116.
                        if slot <> 7116 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7119 {
                if slot <= 7117 {
// PORT: SOURCE UPDATE_PROGRAM.agc:483
//# Page 1395
// PORT: SOURCE UPDATE_PROGRAM.agc:484
//		TS	DNLSTCOD
// PORT: Fixed ROM slots 7117.
                    if slot <> 7117 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7118 {
// PORT: SOURCE UPDATE_PROGRAM.agc:485
//		TC	UPACTOFF	# TURN OFF 'UPLINK ACTIVITY' LIGHT
// PORT: Fixed ROM slots 7118.
                        if slot <> 7118 or instruction <> 2037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2037, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:486
//
// PORT: SOURCE UPDATE_PROGRAM.agc:487
//		EXTEND			# KILL GROUP 6.
// PORT: Fixed ROM slots 7119.
                        if slot <> 7119 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7120 {
// PORT: SOURCE UPDATE_PROGRAM.agc:488
//		DCA	NEG0
// PORT: Fixed ROM slots 7120.
                    if slot <> 7120 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7121 {
// PORT: SOURCE UPDATE_PROGRAM.agc:489
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 7121.
                        if slot <> 7121 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:490
//
// PORT: SOURCE UPDATE_PROGRAM.agc:491
//		TC	ENDEXT		# EXTENDED VERB EXIT
// PORT: Fixed ROM slots 7122.
                        if slot <> 7122 or instruction <> 2874 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2874, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7128 {
            if slot <= 7125 {
                if slot <= 7123 {
// PORT: SOURCE UPDATE_PROGRAM.agc:492
//
// PORT: SOURCE UPDATE_PROGRAM.agc:493
//# VERB 7O BRANCH
// PORT: SOURCE UPDATE_PROGRAM.agc:494
//
// PORT: SOURCE UPDATE_PROGRAM.agc:495
//UPEND70		EXTEND			# V70 DOES THE FOLLOWING WITH DP DELTA
// PORT: Fixed ROM slots 7123.
                    if slot <> 7123 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7124 {
// PORT: SOURCE UPDATE_PROGRAM.agc:496
//		DCS	UPBUFF		# TIME IN UPBUFF
// PORT: Fixed ROM slots 7124.
                        if slot <> 7124 or instruction <> 17021 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 637, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:497
//		DXCH	UPBUFF +8D
// PORT: Fixed ROM slots 7125.
                        if slot <> 7125 or instruction <> 22149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 645, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7126 {
// PORT: SOURCE UPDATE_PROGRAM.agc:498
//		TC	TIMEDIDL	# DECREMENT AGC CLOCK
// PORT: Fixed ROM slots 7126.
                    if slot <> 7126 or instruction <> 1911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1911, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7127 {
// PORT: SOURCE UPDATE_PROGRAM.agc:499
//
// PORT: SOURCE UPDATE_PROGRAM.agc:500
//		TC	UPERROUT	# ERROR WHILE DECREMENTING CLOCK -- EXIT
// PORT: Fixed ROM slots 7127.
                        if slot <> 7127 or instruction <> 2032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:501
//
// PORT: SOURCE UPDATE_PROGRAM.agc:502
//		EBANK=	TEPHEM
// PORT: SOURCE UPDATE_PROGRAM.agc:503
//		EXTEND
// PORT: Fixed ROM slots 7128.
                        if slot <> 7128 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7131 {
                if slot <= 7129 {
// PORT: SOURCE UPDATE_PROGRAM.agc:504
//		DCS	UPBUFF		# COPY DECREMENTERS FOR
// PORT: Fixed ROM slots 7129.
                    if slot <> 7129 or instruction <> 17021 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 637, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7130 {
// PORT: SOURCE UPDATE_PROGRAM.agc:505
//		DXCH	UPBUFF +10D	# RESTART PROTECTION
// PORT: Fixed ROM slots 7130.
                        if slot <> 7130 or instruction <> 22151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 647, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:506
//		EXTEND
// PORT: Fixed ROM slots 7131.
                        if slot <> 7131 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7132 {
// PORT: SOURCE UPDATE_PROGRAM.agc:507
//		DCS	UPBUFF
// PORT: Fixed ROM slots 7132.
                    if slot <> 7132 or instruction <> 17021 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 637, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7133 {
// PORT: SOURCE UPDATE_PROGRAM.agc:508
//		DXCH	UPBUFF +12D
// PORT: Fixed ROM slots 7133.
                        if slot <> 7133 or instruction <> 22153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 649, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:509
//
// PORT: SOURCE UPDATE_PROGRAM.agc:510
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// PORT: Fixed ROM slots 7134.
                        if slot <> 7134 or instruction <> 2795 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2795, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[431] to agcAotUnit431@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:511
//		OCT	04026
// PORT: Fixed ROM slots 7135.
    7135, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7136–7149.
function agcAotUnit432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7142 {
        if slot <= 7138 {
            if slot <= 7136 {
// PORT: SOURCE UPDATE_PROGRAM.agc:512
//
// PORT: SOURCE UPDATE_PROGRAM.agc:513
//		CAF	ZERO
// PORT: Fixed ROM slots 7136.
                if slot <> 7136 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7137 {
// PORT: SOURCE UPDATE_PROGRAM.agc:514
//		ZL
// PORT: Fixed ROM slots 7137.
                    if slot <> 7137 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:515
//		DXCH	UPBUFF +10D	# DECREMENT CSM STATE VECTOR TIME
// PORT: Fixed ROM slots 7138.
                    if slot <> 7138 or instruction <> 22151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 647, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7140 {
                if slot <= 7139 {
// PORT: SOURCE UPDATE_PROGRAM.agc:516
//		DAS	TETCSM
// PORT: Fixed ROM slots 7139.
                    if slot <> 7139 or instruction <> 9081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 889) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:517
//
// PORT: SOURCE UPDATE_PROGRAM.agc:518
//		CAF	ZERO
// PORT: Fixed ROM slots 7140.
                    if slot <> 7140 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7141 {
// PORT: SOURCE UPDATE_PROGRAM.agc:519
//		ZL
// PORT: Fixed ROM slots 7141.
                    if slot <> 7141 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:520
//		DXCH	UPBUFF +12D	# DECREMENT LEM STATE VECTOR TIME
// PORT: Fixed ROM slots 7142.
                    if slot <> 7142 or instruction <> 22153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 649, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7145 {
            if slot <= 7143 {
// PORT: SOURCE UPDATE_PROGRAM.agc:521
//		DAS	TETLEM
// PORT: Fixed ROM slots 7143.
                if slot <> 7143 or instruction <> 9123 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 931) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7144 {
// PORT: SOURCE UPDATE_PROGRAM.agc:522
//
// PORT: SOURCE UPDATE_PROGRAM.agc:523
//		CAF	ZERO
// PORT: Fixed ROM slots 7144.
                    if slot <> 7144 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:524
//		ZL
// PORT: Fixed ROM slots 7145.
                    if slot <> 7145 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7147 {
                if slot <= 7146 {
// PORT: SOURCE UPDATE_PROGRAM.agc:525
//		DXCH	UPBUFF
// PORT: Fixed ROM slots 7146.
                    if slot <> 7146 or instruction <> 22141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 637, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:526
//		DAS	TEPHEM +1	# INCREMENT TP TEPHEM
// PORT: Fixed ROM slots 7147.
                    if slot <> 7147 or instruction <> 9160 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 968) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7148 {
// PORT: SOURCE UPDATE_PROGRAM.agc:527
//		ADS	TEPHEM
// PORT: Fixed ROM slots 7148.
                    if slot <> 7148 or instruction <> 12230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 966).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:528
//
// PORT: SOURCE UPDATE_PROGRAM.agc:529
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// PORT: Fixed ROM slots 7149.
                    if slot <> 7149 or instruction <> 2795 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2795, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[432] to agcAotUnit432@.

agcAotInstallSourceRope(list(
// PORT: SOURCE UPDATE_PROGRAM.agc:530
//		OCT 	04026
// PORT: Fixed ROM slots 7150.
    7150, 4140
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7151–7160.
function agcAotUnit433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7155 {
        if slot <= 7152 {
            if slot <= 7151 {
// PORT: SOURCE UPDATE_PROGRAM.agc:531
//
// PORT: SOURCE UPDATE_PROGRAM.agc:532
//		EBANK=	UPBUFF
// PORT: SOURCE UPDATE_PROGRAM.agc:533
//# Page 1396
// PORT: SOURCE UPDATE_PROGRAM.agc:534
//		TC	UPOUT		# GO TO STANDARD UPDATE PROGRAM EXIT
// PORT: Fixed ROM slots 7151.
                if slot <> 7151 or instruction <> 1993 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1993, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:535
//
// PORT: SOURCE UPDATE_PROGRAM.agc:536
//
// PORT: SOURCE UPDATE_PROGRAM.agc:537
//# ERROR SEQUENCE
// PORT: SOURCE UPDATE_PROGRAM.agc:538
//
// PORT: SOURCE UPDATE_PROGRAM.agc:539
//UPERROUT	TC	FALTON		# TURN ON *OPERATOR ERROR* LIGHT
// PORT: Fixed ROM slots 7152.
                if slot <> 7152 or instruction <> 2292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2292, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7153 {
// PORT: SOURCE UPDATE_PROGRAM.agc:540
//		TCF	UPOUT		# GO TO COMMON UPDATE PROGRAM EXIT
// PORT: Fixed ROM slots 7153.
                if slot <> 7153 or instruction <> 6089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7154 {
// PORT: SOURCE UPDATE_PROGRAM.agc:541
//
// PORT: SOURCE UPDATE_PROGRAM.agc:542
// +2		TC	FALTON		# TURN ON 'OPERATOR ERROR' LIGHT
// PORT: Fixed ROM slots 7154.
                    if slot <> 7154 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:543
//		TC	UPACTOFF	# TURN OFF'UPLINK ACTIVITY'LIGHT
// PORT: Fixed ROM slots 7155.
                    if slot <> 7155 or instruction <> 2037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7157 {
            if slot <= 7156 {
// PORT: SOURCE UPDATE_PROGRAM.agc:544
//		TC	ENDEXT		# EXTENDED VERB EXIT
// PORT: Fixed ROM slots 7156.
                if slot <> 7156 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:545
//					# (THE PURPOSE OF UPERROUT +2 EXIT IS
// PORT: SOURCE UPDATE_PROGRAM.agc:546
//					# TO PROVIDE AN ERROR EXIT WHICH DOES NOT
// PORT: SOURCE UPDATE_PROGRAM.agc:547
//					# RESET ANY RESTART GROUPS)
// PORT: SOURCE UPDATE_PROGRAM.agc:548
//
// PORT: SOURCE UPDATE_PROGRAM.agc:549
//
// PORT: SOURCE UPDATE_PROGRAM.agc:550
//# :UPACTOFF: IS A ROUTINE TO TURN OFF UPLINK ACTIVITY LIGHT ON ALL EXITS FROM UPDATE PROGRAM(P27).
// PORT: SOURCE UPDATE_PROGRAM.agc:551
//
// PORT: SOURCE UPDATE_PROGRAM.agc:552
//UPACTOFF	CS	BIT3
// PORT: Fixed ROM slots 7157.
                if slot <> 7157 or instruction <> 18921 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7158 {
// PORT: SOURCE UPDATE_PROGRAM.agc:553
//		EXTEND			# TURN OFF UPLINK ACTIVITY LIGHT
// PORT: Fixed ROM slots 7158.
                if slot <> 7158 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7159 {
// PORT: SOURCE UPDATE_PROGRAM.agc:554
//		WAND	DSALMOUT	# (BIT 3 OF CHANNEL 11)
// PORT: Fixed ROM slots 7159.
                    if slot <> 7159 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE UPDATE_PROGRAM.agc:555
//		TC	Q
// PORT: Fixed ROM slots 7160.
                    if slot <> 7160 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[433] to agcAotUnit433@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE UPDATE_PROGRAM.agc:556
//
