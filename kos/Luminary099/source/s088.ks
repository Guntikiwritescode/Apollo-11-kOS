// UPDATE_PROGRAM.agc
// bank 43, slots 38868-38880
function agcAotUnit2650 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38873 {
        if slot <= 38870 {
            if slot <= 38868 {
// UPDATE_PROGRAM.agc:1
//# Copyright:	Public domain.
// UPDATE_PROGRAM.agc:2
//# Filename:	UPDATE_PROGRAM.agc
// UPDATE_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// UPDATE_PROGRAM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// UPDATE_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// UPDATE_PROGRAM.agc:6
//# Assembler:	yaYUL
// UPDATE_PROGRAM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// UPDATE_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// UPDATE_PROGRAM.agc:9
//# Pages:	1386-1396
// UPDATE_PROGRAM.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// UPDATE_PROGRAM.agc:11
//#				from the Luminary131/ file of the same
// UPDATE_PROGRAM.agc:12
//#				name, using Luminary099 page images.
// UPDATE_PROGRAM.agc:13
//#		2009-06-07 RSB	Added an SBANK= to account for incompatibilities
// UPDATE_PROGRAM.agc:14
//#				between YUL and yaYUL.
// UPDATE_PROGRAM.agc:15
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// UPDATE_PROGRAM.agc:16
//#		2011-05-07 JL	Flag SBANK= workaround.
// UPDATE_PROGRAM.agc:17
//
// UPDATE_PROGRAM.agc:18
//# This source code has been transcribed or otherwise adapted from
// UPDATE_PROGRAM.agc:19
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// UPDATE_PROGRAM.agc:20
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// UPDATE_PROGRAM.agc:21
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// UPDATE_PROGRAM.agc:22
//# in storage size and consequent reduction in image quality as well) are
// UPDATE_PROGRAM.agc:23
//# available online at www.ibiblio.org/apollo.  If for some reason you
// UPDATE_PROGRAM.agc:24
//# find that the images are illegible, contact me at info@sandroid.org
// UPDATE_PROGRAM.agc:25
//# about getting access to the (much) higher-quality images which Paul
// UPDATE_PROGRAM.agc:26
//# actually created.
// UPDATE_PROGRAM.agc:27
//#
// UPDATE_PROGRAM.agc:28
//# Notations on the hardcopy document read, in part:
// UPDATE_PROGRAM.agc:29
//#
// UPDATE_PROGRAM.agc:30
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// UPDATE_PROGRAM.agc:31
//#	16:27 JULY 14, 1969
// UPDATE_PROGRAM.agc:32
//
// UPDATE_PROGRAM.agc:33
//# Page 1386
// UPDATE_PROGRAM.agc:34
//# PROGRAM NAME:     P27
// UPDATE_PROGRAM.agc:35
//# WRITTEN BY:       KILROY/ DE WOLF
// UPDATE_PROGRAM.agc:36
//#
// UPDATE_PROGRAM.agc:37
//# MOD NO:           6
// UPDATE_PROGRAM.agc:38
//# MOD BY:           KILROY
// UPDATE_PROGRAM.agc:39
//# DATE:             01DEC67
// UPDATE_PROGRAM.agc:40
//#
// UPDATE_PROGRAM.agc:41
//# LOG SECTION:      UPDATE PROGRAM.
// UPDATE_PROGRAM.agc:42
//#
// UPDATE_PROGRAM.agc:43
//# FUNCT. DESCR:     P27 (THE UPDATE PROGRAM) PROCESSES COMMANDS AND DATA
// UPDATE_PROGRAM.agc:44
//#                       INSERTIONS REQUESTED BY THE GROUND VIA UPLINK.
// UPDATE_PROGRAM.agc:45
//#                       THE P27 PROGRAM WILL ACCEPT UPDATES
// UPDATE_PROGRAM.agc:46
//#                       ONLY DURING P00 FOR THE LM, AND ONLY DURING P00,
// UPDATE_PROGRAM.agc:47
//#                   P02, AND FRESH START FOR THE CSM
// UPDATE_PROGRAM.agc:48
//#
// UPDATE_PROGRAM.agc:49
//# CALLING SEQ:      PROGRAM IS INITIATED BY UPLINK ENTRY OF VERBS 70, 71, 72 AND 73.
// UPDATE_PROGRAM.agc:50
//#
// UPDATE_PROGRAM.agc:51
//# SUBROUTINES:      TESTXACT, NEWMODEX, NEWMODEX +3, GOXDSPF, BANKCALL, FINDVAC, INTPRET, INTSTALL, TPAGREE,
// UPDATE_PROGRAM.agc:52
//#                   INTWAKEU, ENDEXT, POSTJUMP, FALTON, NEWPHASE, PHASCHNG
// UPDATE_PROGRAM.agc:53
//#
// UPDATE_PROGRAM.agc:54
//# NORMAL EXIT:      TC ENDEXT
// UPDATE_PROGRAM.agc:55
//#
// UPDATE_PROGRAM.agc:56
//# ALARM/ABORT:      TC FALTON FOLLOWED BY TC ENDEXT
// UPDATE_PROGRAM.agc:57
//#
// UPDATE_PROGRAM.agc:58
//# RESTARTS:         P27 IS RESTART PROTECTED IN TWO WAYS...
// UPDATE_PROGRAM.agc:59
//#                   1. PRIOR TO VERIFLAG INVERSION(WHICH IS CAUSED BY THE GROUND/ASTRONAUT'S VERIFICATION OF UPDATE
// UPDATE_PROGRAM.agc:60
//#                      DATA BY SENDING A V33E WHEN V21N02 IS FLASHING)---
// UPDATE_PROGRAM.agc:61
//#                      NO PROTECTION EXCEPT PRE-P27 MODE IS RESTORED, COAST + ALIGN DOWNLIST IS SELECTED AND UPLINK
// UPDATE_PROGRAM.agc:62
//#                      ACTIVITY LIGHT IS TURNED OFF.(JUST AS IF A V34E WAS SENT DURING P27 DATA LOADS).
// UPDATE_PROGRAM.agc:63
//#                      V70,V71,V72 OR V73 WILL HAVE TO BE COMPLETELY RESENT BY USER.
// UPDATE_PROGRAM.agc:64
//#                   2. AFTER VERIFLAG INVERSION(WHEN UPDATE OF THE SPECIFIED ERASABLES IS BEING PERFORMED)---
// UPDATE_PROGRAM.agc:65
//#                      PROTECTED AGAINST RESTARTS.
// UPDATE_PROGRAM.agc:66
//#
// UPDATE_PROGRAM.agc:67
//# DEBRIS:           UPBUFF   (20D)  TEMP STORAGE FOR ADDRESSES AND CONTENTS.
// UPDATE_PROGRAM.agc:68
//#                   UPVERB   (1)    VERB NUMBER MINUS 70D (E.G., FOR V72, UPVERB = 72D - 70D = 2)
// UPDATE_PROGRAM.agc:69
//#                   UPOLDMOD (1)    FOR MAJOR MODE INTERRUPTED BY P27.
// UPDATE_PROGRAM.agc:70
//#                   COMPNUMB (1)    TOTAL NUMBER OF COMPONENTS TO BE TRANSMITTED.
// UPDATE_PROGRAM.agc:71
//#                   UPCOUNT  (1)    ACTUAL NUMBER OF COMPONENTS RECEIVED.
// UPDATE_PROGRAM.agc:72
//#                   UPTEMP   (1)    SCRATCH, BUT USUALLY CONTAINS COMPONENT NUMBER TO BE CHANGED DURING VERIFY CYCLE
// UPDATE_PROGRAM.agc:73
//#
// UPDATE_PROGRAM.agc:74
//# INPUT:
// UPDATE_PROGRAM.agc:75
//#
// UPDATE_PROGRAM.agc:76
//#  ENTRY:             DESCRIPTION
// UPDATE_PROGRAM.agc:77
//#
// UPDATE_PROGRAM.agc:78
//#  V70EXXXXXEXXXXXE   (LIFTOFF TIME INCREMENT) DOUBLE PRECISION OCTAL TIME INCREMENT, XXXXX XXXXX,
// UPDATE_PROGRAM.agc:79
//#                     IS ADDED TO TEPHEM, SUBTRACTED FROM AGC CLOCK(TIME2,TIME1), SUBTRACTED FROM CSM STATE
// UPDATE_PROGRAM.agc:80
//#                     VECTOR TIME(TETCSM) AND SUBTRACTED FROM LEM STATE VECTOR TIME(TETLEM).
// UPDATE_PROGRAM.agc:81
//#                     THE DP OCTAL TIME INCREMENT IS SCALED AT 2(28).
// UPDATE_PROGRAM.agc:82
//# Page 1387
// UPDATE_PROGRAM.agc:83
//#  V71EIIEAAAAE     (CONTIGUOUS BLOCK UPDATE) II-2 OCTAL COMPONENTS,XXXXX,
// UPDATE_PROGRAM.agc:84
//#  XXXXXE           ARE LOADED INTO ERASABLE STARTING AT ECADR, AAAA.
// UPDATE_PROGRAM.agc:85
//# XXXXXE            IT IS .GE. 3 .AND. .LE. 200.,
// UPDATE_PROGRAM.agc:86
//#                   AND (AAAA + II - 3) DOES NOT PRODUCE AN ADDRESS IN THE
// UPDATE_PROGRAM.agc:87
//# 9 NEXT BANK.
// UPDATE_PROGRAM.agc:88
//#   .               SCALING IS SAME AS INTERNAL REGISTERS.
// UPDATE_PROGRAM.agc:89
//#
// UPDATE_PROGRAM.agc:90
//#  V72EIIE          (SCATTER UPDATE) (II-1)/2 OCTAL COMPONENTS,XXXXX, ARE
// UPDATE_PROGRAM.agc:91
//#  AAAAEXXXXXE      LOADED INTO ERASABLE LOCATIONS, AAAA.
// UPDATE_PROGRAM.agc:92
//#  AAAAEXXXXXE      II IS .GE. 3 .AND. .LE. 19D, AND MUST BE ODD.
// UPDATE_PROGRAM.agc:93
//#   .               SCALING IS SAME AS INTERNAL REGISTERS.
// UPDATE_PROGRAM.agc:94
//#
// UPDATE_PROGRAM.agc:95
//#  V73EXXXXXEXXXXXE (OCTAL CLOCK INCREMENT) DOUBLE PRECISION OCTAL TIME
// UPDATE_PROGRAM.agc:96
//#                   INCREMENT XXXXX XXXXX, IS ADDED TO THE AGC CLOCK, IN
// UPDATE_PROGRAM.agc:97
//#                   CENTISECONDS SCALED AT (2)28.
// UPDATE_PROGRAM.agc:98
//#                   THIS LOAD IS THE OCTAL EQUIVALENT OF V55.
// UPDATE_PROGRAM.agc:99
//#
// UPDATE_PROGRAM.agc:100
//# OUTPUT:         IN ADDITION TO THE ABOVE REGISTER LOADS, ALL UPDATES
// UPDATE_PROGRAM.agc:101
//#                 COMPLEMENT BIT3 OF FLAGWORD7.
// UPDATE_PROGRAM.agc:102
//#
// UPDATE_PROGRAM.agc:103
//# ADDITIONAL NOTES: VERB 71, JUST DEFINED ABOVE WILL BE USED TO PERFORM BUT NOT LIMITED TO THE FOLLOWING UPDATES--
// UPDATE_PROGRAM.agc:104
//#
// UPDATE_PROGRAM.agc:105
//#                 1. CSM/LM STATE VECTOR UPDATE
// UPDATE_PROGRAM.agc:106
//#                 2. REFSMMAT UPDATE
// UPDATE_PROGRAM.agc:107
//#
// UPDATE_PROGRAM.agc:108
//#
// UPDATE_PROGRAM.agc:109
//#          THE FOLLOWING COMMENTS DELINEATE EACH SPECIAL UPDATE----
// UPDATE_PROGRAM.agc:110
//#
// UPDATE_PROGRAM.agc:111
//# 1. CSM/LM STATE VECTOR UPDATE(ALL DATA ENTRIES IN OCTAL)
// UPDATE_PROGRAM.agc:112
//#
// UPDATE_PROGRAM.agc:113
//# ENTRIES:        DATA DEFINITION:                                        SCALE FACTORS:
// UPDATE_PROGRAM.agc:114
//# V71E            CONTIGUOUS BLOCK UPDATE VERB
// UPDATE_PROGRAM.agc:115
//#    21E          NUMBER OF COMPONENTS FOR STATE VECTOR UPDATE
// UPDATE_PROGRAM.agc:116
//#  AAAAE          ECADR OF 'UPSVFLAG'
// UPDATE_PROGRAM.agc:117
//# XXXXXE          STATE VECTOR IDENTIFIER: 00001 FOR CSM, 77776 FOR LEM - EARTH SPHERE OF INFLUENCE SCALING
// UPDATE_PROGRAM.agc:118
//#                                          00002 FOR CSM, 77775 FOR LEM - LUNAR SPHERE OF INFLUENCE SCALING
// UPDATE_PROGRAM.agc:119
//#
// UPDATE_PROGRAM.agc:120
//# XXXXXEXXXXXE    X POSITION
// UPDATE_PROGRAM.agc:121
//# XXXXXEXXXXXE    Y POSITION
// UPDATE_PROGRAM.agc:122
//# XXXXXEXXXXXE    Z POSITION
// UPDATE_PROGRAM.agc:123
//# XXXXXEXXXXXE    X VELOCITY
// UPDATE_PROGRAM.agc:124
//# XXXXXEXXXXXE    Y VELOCITY
// UPDATE_PROGRAM.agc:125
//# XXXXXEXXXXXE    Z VELOCITY
// UPDATE_PROGRAM.agc:126
//# XXXXXEXXXXXE    TIME FROM AGC CLOCK ZERO
// UPDATE_PROGRAM.agc:127
//# V33E            VERB 33 TO SIGNAL THAT THE STATE VECTOR IS READY TO BE STORED.
// UPDATE_PROGRAM.agc:128
//#
// UPDATE_PROGRAM.agc:129
//#
// UPDATE_PROGRAM.agc:130
//# 2. REFSMMAT(ALL DATA ENTRIES IN OCTAL)
// UPDATE_PROGRAM.agc:131
//# ENTRIES:        DATA DEFINITITIONS:                                     SCALE FACTORS:
// UPDATE_PROGRAM.agc:132
//# Page 1388
// UPDATE_PROGRAM.agc:133
//# V71E            CONTIGUOUS BLOCK UPDATE VERB
// UPDATE_PROGRAM.agc:134
//#    24E          NUMBER OF COMPONENTS FOR REFSMMAT UPDATE
// UPDATE_PROGRAM.agc:135
//#  AAAAE          ECADR OF 'REFSMMAT'
// UPDATE_PROGRAM.agc:136
//# XXXXXEXXXXXE    ROW 1 COLUMN 1                                          2(-1)
// UPDATE_PROGRAM.agc:137
//# XXXXXEXXXXXE    ROW 1 COLUMN 2                                          2(-1)
// UPDATE_PROGRAM.agc:138
//# XXXXXEXXXXXE    ROW 1 COLUMN 3                                          2(-1)
// UPDATE_PROGRAM.agc:139
//# XXXXXEXXXXXE    ROW 2 COLUMN 1                                          2(-1)
// UPDATE_PROGRAM.agc:140
//# XXXXXEXXXXXE    ROW 2 COLUMN 2                                          2(-1)
// UPDATE_PROGRAM.agc:141
//# XXXXXEXXXXXE    ROW 2 COLUMN 3                                          2(-1)
// UPDATE_PROGRAM.agc:142
//# XXXXXEXXXXXE    ROW 3 COLUMN 1                                          2(-1)
// UPDATE_PROGRAM.agc:143
//# XXXXXEXXXXXE    ROW 3 COLUMN 2                                          2(-1)
// UPDATE_PROGRAM.agc:144
//# XXXXXEXXXXXE    ROW 3 COLUMN 3                                          2(-1)
// UPDATE_PROGRAM.agc:145
//# V33E            VERB 33 TO SIGNAL THAT REFSMMAT IS READY TO BE STORED.
// UPDATE_PROGRAM.agc:146
//
// UPDATE_PROGRAM.agc:147
//
// UPDATE_PROGRAM.agc:148
//		BANK	07
// UPDATE_PROGRAM.agc:149
//		SETLOC	EXTVERBS
// UPDATE_PROGRAM.agc:150
//		BANK
// UPDATE_PROGRAM.agc:151
//
// UPDATE_PROGRAM.agc:152
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:153
//
// UPDATE_PROGRAM.agc:154
//		COUNT*	$$/P27
// UPDATE_PROGRAM.agc:155
//V70UPDAT	CAF	UP70		# COMES HERE ON V70E
// slot 38868
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
// UPDATE_PROGRAM.agc:156
//		TCF	V73UPDAT +1
// slot 38869
                    if slot <> 38869 or instruction <> 6107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6107, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:157
//
// UPDATE_PROGRAM.agc:158
//
// UPDATE_PROGRAM.agc:159
//V71UPDAT	CAF	UP71		# COMES HERE ON V71E
// slot 38870
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
// UPDATE_PROGRAM.agc:160
//		TCF	V73UPDAT +1
// slot 38871
                if slot <> 38871 or instruction <> 6107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6107, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38872 {
// UPDATE_PROGRAM.agc:161
//
// UPDATE_PROGRAM.agc:162
//
// UPDATE_PROGRAM.agc:163
//V72UPDAT	CAF	UP72		# COMES HERE ON V72E
// slot 38872
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
// UPDATE_PROGRAM.agc:164
//		TCF	V73UPDAT +1
// slot 38873
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
// UPDATE_PROGRAM.agc:165
//
// UPDATE_PROGRAM.agc:166
//
// UPDATE_PROGRAM.agc:167
//V73UPDAT	CAF	UP73		# COMES HERE ON V73E
// slot 38874
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
// UPDATE_PROGRAM.agc:168
//
// UPDATE_PROGRAM.agc:169
// +1		TS	UPVERBSV	# SAVE UPVERB UNTIL IT'S OK TO ENTER P27
// slot 38875
                    if slot <> 38875 or instruction <> 23158 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23158, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:170
//
// UPDATE_PROGRAM.agc:171
//		TC	TESTXACT	# GRAB DISPLAY IF AVAILABLE, OTHERWISE
// slot 38876
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
// UPDATE_PROGRAM.agc:172
//					# TURN*OPERATOR ERROR* ON AND TERMINATEJOB
// UPDATE_PROGRAM.agc:173
//
// UPDATE_PROGRAM.agc:174
//		CA	MODREG		# CHECK IF UPDATE ALLOWED
// slot 38877
                    if slot <> 38877 or instruction <> 12809 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:175
//		EXTEND			# FIRST CHECK FOR MODREG = +0, -0
// slot 38878
                    if slot <> 38878 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38879 {
// UPDATE_PROGRAM.agc:176
//		BZF	+3		# (+0 = P00, -0 = FRESHSTART)
// slot 38879
                    if slot <> 38879 or instruction <> 6114 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6114, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:177
//UPERROR		TC	POSTJUMP	# TURN ON 'OPERATOR ERROR' LIGHT
// slot 38880
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
// UPDATE_PROGRAM.agc:178
//		CADR	UPERROUT +2	# GO TO COMMON UPDATE PROGRAM EXIT
// slot 38881
    38881, 10212
)).

// bank 43, slots 38882-38888
function agcAotUnit2651 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38884 {
        if slot <= 38882 {
// UPDATE_PROGRAM.agc:179
//
// UPDATE_PROGRAM.agc:180
//		CAE	MODREG		# UPDATE ALLOWED.
// slot 38882
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
// UPDATE_PROGRAM.agc:181
//CKMDMORE	=	UPERROR
// UPDATE_PROGRAM.agc:182
//		TS	UPOLDMOD	# SAVE CURRENT MAJOR MODE
// slot 38883
                if slot <> 38883 or instruction <> 23161 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23161, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:183
//# Page 1389
// UPDATE_PROGRAM.agc:184
//		CAE	UPVERBSV	# SET UPVERB TO INDICDATE TO P27
// slot 38884
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
// UPDATE_PROGRAM.agc:185
//		TS	UPVERB		# WHICH EXTENDED VERB CALLED IT.
// slot 38885
                if slot <> 38885 or instruction <> 23162 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23162, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:186
//
// UPDATE_PROGRAM.agc:187
//		CAF	ONE
// slot 38886
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
// UPDATE_PROGRAM.agc:188
//		TS	UPCOUNT		# INITIALIZE UPCOUNT TO 1
// slot 38887
                if slot <> 38887 or instruction <> 23163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23163, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:189
//
// UPDATE_PROGRAM.agc:190
//		TC	POSTJUMP	# LEAVE EXTENDED VERB BANK AND
// slot 38888
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
// UPDATE_PROGRAM.agc:191
//		CADR	UPPART2		# GO TO UPDATE PROGRAM(P27) BANK.
// slot 38889
    38889, 9730
)).

// bank 04, slots 6913-6913
function agcAotUnit408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:192
//
// UPDATE_PROGRAM.agc:193
//
// UPDATE_PROGRAM.agc:194
//UP70		EQUALS	ZERO
// UPDATE_PROGRAM.agc:195
//UP71		EQUALS	ONE
// UPDATE_PROGRAM.agc:196
//UP72		EQUALS	TWO
// UPDATE_PROGRAM.agc:197
//UP73		EQUALS	THREE
// UPDATE_PROGRAM.agc:198
//
// UPDATE_PROGRAM.agc:199
//
// UPDATE_PROGRAM.agc:200
//		BANK	04
// UPDATE_PROGRAM.agc:201
//		SETLOC	UPDATE2
// UPDATE_PROGRAM.agc:202
//		BANK
// UPDATE_PROGRAM.agc:203
//
// UPDATE_PROGRAM.agc:204
//		COUNT*	$$/P27
// UPDATE_PROGRAM.agc:205
//
// UPDATE_PROGRAM.agc:206
//UPPART2		EQUALS			# UPDATE PROGRAM - PART 2
// UPDATE_PROGRAM.agc:207
//
// UPDATE_PROGRAM.agc:208
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO RESTORE OLD MODE
// slot 6913
    if slot <> 6913 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[408] to agcAotUnit408@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:209
//		OCT	07026		# AND DOWNLIST AND EXIT IF RESTART OCCURS.
// slot 6914
    6914, 7212,
// UPDATE_PROGRAM.agc:210
//		OCT	30000		# PRIORITY SAME AS CHRPRIO
// slot 6915
    6915, 24576,
// UPDATE_PROGRAM.agc:211
//		EBANK=	UPBUFF
// UPDATE_PROGRAM.agc:212
//		2CADR	UPOUT +1
// slot 6916 6917
    6916, 3988, 6917, 8324
)).

// bank 04, slots 6918-6920
function agcAotUnit409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6918 {
// UPDATE_PROGRAM.agc:213
//
// UPDATE_PROGRAM.agc:214
//
// UPDATE_PROGRAM.agc:215
//		CAF	ONE
// slot 6918
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
// UPDATE_PROGRAM.agc:216
//		TS	DNLSTCOD	# DOWNLIST
// slot 6919
            if slot <> 6919 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:217
//
// UPDATE_PROGRAM.agc:218
//		TC	NEWMODEX	# SET MAJOR MODE = 27
// slot 6920
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
// UPDATE_PROGRAM.agc:219
//		DEC	27
// slot 6921
    6921, 54
)).

// bank 04, slots 6922-6922
function agcAotUnit410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:220
//
// UPDATE_PROGRAM.agc:221
//		INDEX	UPVERB		# BRANCH DEPENDING ON WHETHER THE UPDATE
// slot 6922
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
// UPDATE_PROGRAM.agc:222
//		TCF	+1		# VERB REQUIRES A FIXED OR VARIABLE NUMBER
// slot 6923
    6923, 11800
)).

// bank 04, slots 6924-6933
function agcAotUnit411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6928 {
        if slot <= 6925 {
            if slot <= 6924 {
// UPDATE_PROGRAM.agc:223
//		TCF	+3		# V70 FIXED.               (OF COMPONENTS.
// slot 6924
                if slot <> 6924 or instruction <> 5903 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5903, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:224
//		TCF	OHWELL1		# V71 VARIABLE - GO GET NO. OF COMPONENTS
// slot 6925
                if slot <> 6925 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6926 {
// UPDATE_PROGRAM.agc:225
//		TCF	OHWELL1		# V72 VARIABLE - GO GET NO. OF COMPONENTS
// slot 6926
                if slot <> 6926 or instruction <> 5906 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5906, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6927 {
// UPDATE_PROGRAM.agc:226
//		CA	TWO		# V73 (AND V70) FIXED
// slot 6927
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
// UPDATE_PROGRAM.agc:227
//		TS	COMPNUMB	# SET NUMBER OF COMPONENTS TO 2.
// slot 6928
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
// UPDATE_PROGRAM.agc:228
//		TCF	OHWELL2		# GO GET THE TWO UPDATE COMPONENTS
// slot 6929
                if slot <> 6929 or instruction <> 5925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5925, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:229
//
// UPDATE_PROGRAM.agc:230
//OHWELL1		CAF	ADUPBUFF	# * REQUEST USER TO SEND NUMBER *
// slot 6930
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
// UPDATE_PROGRAM.agc:231
//		TS	MPAC +2		# * OF COMPONENTS PARAMETER(II).*
// slot 6931
                if slot <> 6931 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6932 {
// UPDATE_PROGRAM.agc:232
// +2		CAF	UPLOADNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// slot 6932
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
// UPDATE_PROGRAM.agc:233
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// slot 6933
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
// UPDATE_PROGRAM.agc:234
//# Page 1390
// UPDATE_PROGRAM.agc:235
//		CADR	GOXDSPF		# TO REQUEST II.
// slot 6934
    6934, 16824
)).

// bank 04, slots 6935-6953
function agcAotUnit412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6943 {
        if slot <= 6938 {
            if slot <= 6936 {
                if slot <= 6935 {
// UPDATE_PROGRAM.agc:236
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// slot 6935
                    if slot <> 6935 or instruction <> 6090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:237
//		TCF	OHWELL1 +2
// slot 6936
                    if slot <> 6936 or instruction <> 5908 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6937 {
// UPDATE_PROGRAM.agc:238
//		TC	CK4V32		# DATA OR V32 RETURN
// slot 6937
                    if slot <> 6937 or instruction <> 1862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:239
//		CS	BIT2
// slot 6938
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
// UPDATE_PROGRAM.agc:240
//		AD	UPBUFF		# IS II(NUMBER OF COMPONENTS PARAMETER)
// slot 6939
                    if slot <> 6939 or instruction <> 25212 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 636).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:241
//		EXTEND			# .GE. 3 AND .LE. 20D.
// slot 6940
                    if slot <> 6940 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6941 {
// UPDATE_PROGRAM.agc:242
//		BZMF	OHWELL1 +2
// slot 6941
                    if slot <> 6941 or instruction <> 26388 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6942 {
// UPDATE_PROGRAM.agc:243
//		CS	UPBUFF
// slot 6942
                        if slot <> 6942 or instruction <> 17020 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 636).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:244
//		AD	UP21
// slot 6943
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
// UPDATE_PROGRAM.agc:245
//		EXTEND
// slot 6944
                    if slot <> 6944 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:246
//		BZMF	OHWELL1 +2
// slot 6945
                    if slot <> 6945 or instruction <> 26388 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6946 {
// UPDATE_PROGRAM.agc:247
//		CAE	UPBUFF
// slot 6946
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
// UPDATE_PROGRAM.agc:248
//		TS	COMPNUMB	# SAVE II IN COMPNUMB
// slot 6947
                        if slot <> 6947 or instruction <> 23160 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23160, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:249
//
// UPDATE_PROGRAM.agc:250
//# UPBUFF LOADING SEQUENCE
// UPDATE_PROGRAM.agc:251
//
// UPDATE_PROGRAM.agc:252
//		INCR	UPCOUNT		# INCREMENT COUNT OF COMPONENTS RECEIVED.
// slot 6948
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
// UPDATE_PROGRAM.agc:253
//OHWELL2		CAF	ADUPBFM1	# CALCULATE LOCATION(ECADR) IN UPBUFF
// slot 6949
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
// UPDATE_PROGRAM.agc:254
//		AD	UPCOUNT		# WHERE NEXT COMPONENT SHOULD BE STORED.
// slot 6950
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
// UPDATE_PROGRAM.agc:255
// +2		TS	MPAC +2		# PLACE ECADR INTO R3.
// slot 6951
                    if slot <> 6951 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6952 {
// UPDATE_PROGRAM.agc:256
// +3		CAF	UPLOADNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// slot 6952
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
// UPDATE_PROGRAM.agc:257
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// slot 6953
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
// UPDATE_PROGRAM.agc:258
//		CADR	GOXDSPF		# TO REQUEST DATA.
// slot 6954
    6954, 16824
)).

// bank 04, slots 6955-6966
function agcAotUnit413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6960 {
        if slot <= 6957 {
            if slot <= 6955 {
// UPDATE_PROGRAM.agc:259
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN.
// slot 6955
                if slot <> 6955 or instruction <> 6090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6090, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6956 {
// UPDATE_PROGRAM.agc:260
//		TCF	OHWELL2 +3	# V33 PROCEED RETURN
// slot 6956
                    if slot <> 6956 or instruction <> 5928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:261
//		TC	CK4V32		# DATA OR V32 RETURN
// slot 6957
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
// UPDATE_PROGRAM.agc:262
//		CS	UPCOUNT		# HAVE WE FINISHED RECEIVING ALL
// slot 6958
                if slot <> 6958 or instruction <> 17019 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 635).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6959 {
// UPDATE_PROGRAM.agc:263
//		AD	COMPNUMB	# THE DATA WE EXPECTED.
// slot 6959
                    if slot <> 6959 or instruction <> 25208 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 632).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:264
//		EXTEND
// slot 6960
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
// UPDATE_PROGRAM.agc:265
//		BZMF	UPVERIFY	# YES- GO TO VERIFICATION SEQUENCE
// slot 6961
                if slot <> 6961 or instruction <> 26419 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6962 {
// UPDATE_PROGRAM.agc:266
//		TCF	OHWELL2 -1	# NO- REQUEST ADDITIONAL DATA.
// slot 6962
                    if slot <> 6962 or instruction <> 5924 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5924, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:267
//
// UPDATE_PROGRAM.agc:268
//# VERIFY SEQUENCE
// UPDATE_PROGRAM.agc:269
//
// UPDATE_PROGRAM.agc:270
//UPVERIFY	CAF	ADUPTEMP	# PLACE ECADR WHERE COMPONENT NO. INDEX
// slot 6963
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
// UPDATE_PROGRAM.agc:271
//		TS	MPAC +2		# IS TO BE STORED INTO R3.
// slot 6964
                if slot <> 6964 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6965 {
// UPDATE_PROGRAM.agc:272
//		CAF	UPVRFYNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// slot 6965
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
// UPDATE_PROGRAM.agc:273
//		TC	BANKCALL	# DISPLAY A FLASHING V21N02 TO REQUEST
// slot 6966
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
// UPDATE_PROGRAM.agc:274
//		CADR	GOXDSPF		# DATA CORRECTION OR VERIFICATION.
// slot 6967
    6967, 16824
)).

// bank 04, slots 6968-6986
function agcAotUnit414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6976 {
        if slot <= 6971 {
            if slot <= 6969 {
                if slot <= 6968 {
// UPDATE_PROGRAM.agc:275
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// slot 6968
                    if slot <> 6968 or instruction <> 6090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:276
//		TCF	UPSTORE		# V33 DATA SENT IS GOOD. GO STORE IT.
// slot 6969
                    if slot <> 6969 or instruction <> 5968 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5968, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6970 {
// UPDATE_PROGRAM.agc:277
//		TC	CK4V32		# COMPONENT NO. INDEX OR V32 RETURN
// slot 6970
                    if slot <> 6970 or instruction <> 1862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1862, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:278
//		CA	UPTEMP		# DOES THE COMPONENT NO. INDEX JUST SENT
// slot 6971
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
// UPDATE_PROGRAM.agc:279
//		EXTEND			# SPECIFY A LEGAL COMPONENT NUMBER?
// slot 6972
                    if slot <> 6972 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:280
//		BZMF	UPVERIFY	# NO, IT IS NOT POSITIVE NONZERO
// slot 6973
                    if slot <> 6973 or instruction <> 26419 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26419, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6974 {
// UPDATE_PROGRAM.agc:281
//		CS	UPTEMP
// slot 6974
                    if slot <> 6974 or instruction <> 17015 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 631).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6975 {
// UPDATE_PROGRAM.agc:282
//		AD	COMPNUMB
// slot 6975
                        if slot <> 6975 or instruction <> 25208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 632).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:283
//# Page 1391
// UPDATE_PROGRAM.agc:284
//		AD	BIT1
// slot 6976
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
// UPDATE_PROGRAM.agc:285
//		EXTEND
// slot 6977
                    if slot <> 6977 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:286
//		BZMF	UPVERIFY	# NO
// slot 6978
                    if slot <> 6978 or instruction <> 26419 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26419, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6979 {
// UPDATE_PROGRAM.agc:287
//		CAF	ADUPBFM1	# YES- BASED ON THE COMPONENT NO. INDEX
// slot 6979
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
// UPDATE_PROGRAM.agc:288
//		AD	UPTEMP		# CALCULATE THE ECADR OF LOCATION IN
// slot 6980
                        if slot <> 6980 or instruction <> 25207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 631).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:289
//		TCF	OHWELL2 +2	# UPBUFF WHICH USER WANTS TO CHANGE.
// slot 6981
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
// UPDATE_PROGRAM.agc:290
//
// UPDATE_PROGRAM.agc:291
//UPOUT4		EQUALS	UPOUT +1	# COMES HERE ON V34 TO TERMINATE UPDATE
// UPDATE_PROGRAM.agc:292
//
// UPDATE_PROGRAM.agc:293
//# CHECK FOR VERB 32 SEQUENCE
// UPDATE_PROGRAM.agc:294
//
// UPDATE_PROGRAM.agc:295
//CK4V32		CS	MPAC		# ON DATA RETURN FROM 'GOXDSPF'
// slot 6982
                    if slot <> 6982 or instruction <> 16492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 108).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:296
//		MASK	BIT6		# ON DATA RETURN FROM "GOXDSP"& THE CON-
// slot 6983
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
// UPDATE_PROGRAM.agc:297
//		CCS	A		# TENTS OF MPAC = VERB.  SO TEST FOR V32.
// slot 6984
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
// UPDATE_PROGRAM.agc:298
//		TC	Q		# IT'S NOT A V32, IT'S DATA.  PROCEED.
// slot 6985
                        if slot <> 6985 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:299
//		INDEX	Q
// slot 6986
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
// UPDATE_PROGRAM.agc:300
//		TC	0 -6		# V32 ENCOUNTERED - GO BACK AND GET DATA
// slot 6987
    6987, 65522,
// UPDATE_PROGRAM.agc:301
//
// UPDATE_PROGRAM.agc:302
//ADUPTEMP	ADRES	UPTEMP		# ADDRESS OF TEMP STORAGE FOR CORRECTIONS
// slot 6988
    6988, 1262,
// UPDATE_PROGRAM.agc:303
//ADUPBUFF	ADRES	UPBUFF		# ADDRESS OF UPDATE DATA STORAGE BUFFER
// slot 6989
    6989, 1272,
// UPDATE_PROGRAM.agc:304
//UPLOADNV	VN	2101		# VERB 21 NOUN 01
// slot 6990
    6990, 5378,
// UPDATE_PROGRAM.agc:305
//UPVRFYNV	VN	2102		# VERB 21 NOUN 02
// slot 6991
    6991, 5380
)).

// bank 04, slots 6992-6999
function agcAotUnit415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6995 {
        if slot <= 6993 {
            if slot <= 6992 {
// UPDATE_PROGRAM.agc:306
//UP21		=	MD1		# DEC 21 = MAX NO OF COMPONENTS +1
// UPDATE_PROGRAM.agc:307
//UPDTPHAS	EQUALS	FIVE
// UPDATE_PROGRAM.agc:308
//
// UPDATE_PROGRAM.agc:309
//# PRE-STORE AND FAN TO APPROPRIATE BRANCH SEQUENCE
// UPDATE_PROGRAM.agc:310
//
// UPDATE_PROGRAM.agc:311
//UPSTORE		EQUALS			# GROUND HAS VERIFIED UPDATE.  STORE DATA.
// UPDATE_PROGRAM.agc:312
//
// UPDATE_PROGRAM.agc:313
//		INHINT
// slot 6992
                if slot <> 6992 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:314
//
// UPDATE_PROGRAM.agc:315
//		CAE	FLAGWRD7	# INVERT VERIFLAG(BIT3 OF FLAGWRD7) TO
// slot 6993
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
// UPDATE_PROGRAM.agc:316
//		XCH	L		# INDICATE TO THE GROUND(VIA DOWNLINK)
// slot 6994
                if slot <> 6994 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:317
//		CAF	VERIFBIT	# THAT THE V33 (WHICH THE GROUND SENT TO
// slot 6995
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
// UPDATE_PROGRAM.agc:318
//		EXTEND			# VERIFY THE UPDATE) HAS BEEN SUCCESSFULLY
// slot 6996
                if slot <> 6996 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:319
//		RXOR	LCHAN		# RECEIVED BY THE UPDATE PROGRAM
// slot 6997
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
// UPDATE_PROGRAM.agc:320
//		TS	FLAGWRD7
// slot 6998
                if slot <> 6998 or instruction <> 22595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:321
//
// UPDATE_PROGRAM.agc:322
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO REDO THE UPDATE
// slot 6999
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
// UPDATE_PROGRAM.agc:323
//		OCT	04026		# DATA STORE IF A RESTART OCCURS.
// slot 7000
    7000, 4140
)).

// bank 04, slots 7001-7013
function agcAotUnit416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7006 {
        if slot <= 7003 {
            if slot <= 7001 {
// UPDATE_PROGRAM.agc:324
//		INHINT			# (BECAUSE PHASCHNG DID A RELINT)
// slot 7001
                if slot <> 7001 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7002 {
// UPDATE_PROGRAM.agc:325
//
// UPDATE_PROGRAM.agc:326
//		CS	TWO		# GO TO UPFNDVAC IF INSTALL IS REQUIRED.
// slot 7002
                    if slot <> 7002 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:327
//		AD	UPVERB		# THAT IS, IF IT'S A V70 - V72.
// slot 7003
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
// UPDATE_PROGRAM.agc:328
//		EXTEND			# GO TO UPEND73 IF IT'S A V73.
// slot 7004
                if slot <> 7004 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7005 {
// UPDATE_PROGRAM.agc:329
//		BZMF	UPFNDVAC
// slot 7005
                    if slot <> 7005 or instruction <> 26468 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26468, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:330
//
// UPDATE_PROGRAM.agc:331
//# VERB 73 BRANCH
// UPDATE_PROGRAM.agc:332
//# Page 1392
// UPDATE_PROGRAM.agc:333
//UPEND73		EXTEND			# V73-PERFORM DP OCTAL AGC CLOCK INCREMENT
// slot 7006
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
// UPDATE_PROGRAM.agc:334
//
// UPDATE_PROGRAM.agc:335
//		DCA	UPBUFF
// slot 7007
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
// UPDATE_PROGRAM.agc:336
//		DXCH	UPBUFF +8D
// slot 7008
                    if slot <> 7008 or instruction <> 22149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 645, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:337
//		TC	TIMEDIDL
// slot 7009
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
// UPDATE_PROGRAM.agc:338
//		TC	FALTON		# ERROR- TURN ON *OPERATOR ERROR* LIGHT
// slot 7010
                    if slot <> 7010 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:339
//		TC	UPOUT +1	# GO TO COMMON UPDATE PROGRAM EXIT
// slot 7011
                    if slot <> 7011 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7012 {
// UPDATE_PROGRAM.agc:340
//
// UPDATE_PROGRAM.agc:341
//UPFNDVAC	CAF	CHRPRIO		# (USE EXTENDED VERB PRIORITY)
// slot 7012
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
// UPDATE_PROGRAM.agc:342
//		TC	FINDVAC		# GET VAC AREA FOR 'CALL INTSTALL'
// slot 7013
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
// UPDATE_PROGRAM.agc:343
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:344
//		2CADR	UPJOB		# (NOTE: THIS WILL ALSO SET EBANK FOR
// slot 7014 7015
    7014, 3794, 7015, 8326
)).

// bank 04, slots 7016-7017
function agcAotUnit417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7016 {
// UPDATE_PROGRAM.agc:345
//
// UPDATE_PROGRAM.agc:346
//		TC	ENDOFJOB	# 'TEPHEM' UPDATE BY V70)
// slot 7016
        if slot <> 7016 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:347
//
// UPDATE_PROGRAM.agc:348
//UPJOB		TC	INTPRET		# THIS COULD BE A STATE VECTOR UPDATE--SO
// slot 7017
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
// UPDATE_PROGRAM.agc:349
//		CALL			# WAIT(PUT JOB TO SLEEP) IF ORBIT INT(OI)
// slot 7018
    7018, 65320,
// UPDATE_PROGRAM.agc:350
//			INTSTALL	# IS IN PROGRESS--OR--GRAB OI AND RETURN
// slot 7019
    7019, 24088,
// UPDATE_PROGRAM.agc:351
//					# TO UPWAKE IF OI IS NOT IN PROGRESS.
// UPDATE_PROGRAM.agc:352
//
// UPDATE_PROGRAM.agc:353
//UPWAKE		EXIT
// slot 7020
    7020, 65532
)).

// bank 04, slots 7021-7021
function agcAotUnit418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:354
//
// UPDATE_PROGRAM.agc:355
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 7021
    if slot <> 7021 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[418] to agcAotUnit418@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:356
//		OCT	04026
// slot 7022
    7022, 4140
)).

// bank 04, slots 7023-7023
function agcAotUnit419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:357
//
// UPDATE_PROGRAM.agc:358
//		TC	UPFLAG		# SET INTEGRATION RESTART BIT
// slot 7023
    if slot <> 7023 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[419] to agcAotUnit419@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:359
//		ADRES	REINTFLG
// slot 7024
    7024, 316
)).

// bank 04, slots 7025-7026
function agcAotUnit420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7025 {
// UPDATE_PROGRAM.agc:360
//		INHINT
// slot 7025
        if slot <> 7025 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:361
//UPPART3		EQUALS
// UPDATE_PROGRAM.agc:362
//
// UPDATE_PROGRAM.agc:363
//		INDEX	UPVERB		# BRANCH TO THE APPROPRIATE UPDATE VERB
// slot 7026
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
// UPDATE_PROGRAM.agc:364
//		TCF	+1		# ROUTINE TO ACTUALLY PERFORM THE UPDATE
// slot 7027
    7027, 12008
)).

// bank 04, slots 7028-7055
function agcAotUnit421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7041 {
        if slot <= 7034 {
            if slot <= 7030 {
                if slot <= 7028 {
// UPDATE_PROGRAM.agc:365
//		TCF	UPEND70		# V70
// slot 7028
                    if slot <> 7028 or instruction <> 6099 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6099, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7029 {
// UPDATE_PROGRAM.agc:366
//		TCF	UPEND71		# V71
// slot 7029
                        if slot <> 7029 or instruction <> 6042 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6042, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:367
//		TCF	UPEND72		# V72
// slot 7030
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
// UPDATE_PROGRAM.agc:368
//
// UPDATE_PROGRAM.agc:369
//# ROUTINE TO INCREMENT CLOCK(TIME2,TIME1) WITH CONTENTS OF DP WORD AT UPBUFF.
// UPDATE_PROGRAM.agc:370
//
// UPDATE_PROGRAM.agc:371
//TIMEDIDL	EXTEND
// slot 7031
                        if slot <> 7031 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:372
//		QXCH	UPTEMP		# SAVE Q FOR RETURN
// slot 7032
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
// UPDATE_PROGRAM.agc:373
//		CAF	ZERO		# ZERO AND SAVE TIME2,TIME1
// slot 7033
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
// UPDATE_PROGRAM.agc:374
//		ZL
// slot 7034
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
// UPDATE_PROGRAM.agc:375
//		DXCH	TIME2
// slot 7035
                    if slot <> 7035 or instruction <> 21525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7036 {
// UPDATE_PROGRAM.agc:376
//		DXCH	UPBUFF +18D	# STORE IN CASE OF OVERFLOW
// slot 7036
                        if slot <> 7036 or instruction <> 22159 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 655, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:377
//
// UPDATE_PROGRAM.agc:378
//		CAF	UPDTPHAS	# DO
// slot 7037
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
// UPDATE_PROGRAM.agc:379
//		TS	L		# A
// slot 7038
                        if slot <> 7038 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:380
//		COM			# QUICK
// slot 7039
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
// UPDATE_PROGRAM.agc:381
//		DXCH	-PHASE6		# PHASCHNG
// slot 7040
                        if slot <> 7040 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:382
//# Page 1393
// UPDATE_PROGRAM.agc:383
//TIMEDIDR	INHINT
// slot 7041
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
// UPDATE_PROGRAM.agc:384
//
// UPDATE_PROGRAM.agc:385
//		CAF	ZERO
// slot 7042
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
// UPDATE_PROGRAM.agc:386
//		ZL			# PICK UP INCREMENTER(AND ZERO
// slot 7043
                        if slot <> 7043 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:387
//		TS	MPAC +2		# IT IN CASE OF RESTARTS) AND
// slot 7044
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
// UPDATE_PROGRAM.agc:388
//		DXCH	UPBUFF +8D	# STORE IT
// slot 7045
                        if slot <> 7045 or instruction <> 22149 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 645, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:389
//		DXCH	MPAC		# INTO MPAC FOR TPAGREE.
// slot 7046
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
// UPDATE_PROGRAM.agc:390
//
// UPDATE_PROGRAM.agc:391
//		EXTEND
// slot 7047
                        if slot <> 7047 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:392
//		DCA	UPBUFF +18D
// slot 7048
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
// UPDATE_PROGRAM.agc:393
//		DAS	MPAC		# FORM SUM IN MPAC
// slot 7049
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
// UPDATE_PROGRAM.agc:394
//		EXTEND
// slot 7050
                        if slot <> 7050 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:395
//		BZF	DELTATOK	# TEST FOR OVERFLOW
// slot 7051
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
// UPDATE_PROGRAM.agc:396
//		CAF	ZERO
// slot 7052
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
// UPDATE_PROGRAM.agc:397
//		DXCH	UPBUFF +18D	# OVERFLOW, RESTORE OLD VALUE OF CLOCK
// slot 7053
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
// UPDATE_PROGRAM.agc:398
//		DAS	TIME2		# AND TURN ON OPERATOR ERROR
// slot 7054
                        if slot <> 7054 or instruction <> 8213 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 21) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:399
//
// UPDATE_PROGRAM.agc:400
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 7055
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
// UPDATE_PROGRAM.agc:401
//		OCT	04026
// slot 7056
    7056, 4140
)).

// bank 04, slots 7057-7061
function agcAotUnit422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7058 {
        if slot <= 7057 {
// UPDATE_PROGRAM.agc:402
//
// UPDATE_PROGRAM.agc:403
//		TC	UPTEMP		# GO TO ERROR EXIT
// slot 7057
            if slot <> 7057 or instruction <> 631 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 631, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:404
//
// UPDATE_PROGRAM.agc:405
//DELTATOK	TC	TPAGREE		# FORCE SIGN AGREEMENT
// slot 7058
            if slot <> 7058 or instruction <> 3759 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3759, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7059 {
// UPDATE_PROGRAM.agc:406
//		DXCH	MPAC
// slot 7059
            if slot <> 7059 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7060 {
// UPDATE_PROGRAM.agc:407
//		DAS	TIME2		# INCREMENT TIME2,TIME1
// slot 7060
                if slot <> 7060 or instruction <> 8213 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 21) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:408
//
// UPDATE_PROGRAM.agc:409
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 7061
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
// UPDATE_PROGRAM.agc:410
//		OCT	04026
// slot 7062
    7062, 4140
)).

// bank 04, slots 7063-7064
function agcAotUnit423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7063 {
// UPDATE_PROGRAM.agc:411
//
// UPDATE_PROGRAM.agc:412
//		INHINT
// slot 7063
        if slot <> 7063 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:413
//		INDEX	UPTEMP		# (CODED THIS WAY FOR RESTART PROTECTION)
// slot 7064
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
// UPDATE_PROGRAM.agc:414
//		TC	1		# NORMAL RETURN
// slot 7065
    7065, 2
)).

// bank 04, slots 7066-7066
function agcAotUnit424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:415
//
// UPDATE_PROGRAM.agc:416
//# VERB 71 BRANCH
// UPDATE_PROGRAM.agc:417
//
// UPDATE_PROGRAM.agc:418
//UPEND71		CAE	UPBUFF +1	# SET EBANK
// slot 7066
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

// bank 04, slots 7067-7080
function agcAotUnit425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7073 {
        if slot <= 7069 {
            if slot <= 7067 {
// UPDATE_PROGRAM.agc:419
//		TS	EBANK		#    AND
// slot 7067
                if slot <> 7067 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7068 {
// UPDATE_PROGRAM.agc:420
//		MASK	LOW8		# CALCULATE
// slot 7068
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
// UPDATE_PROGRAM.agc:421
//		TS	UPTEMP		# S-REG VALUE OF RECEIVING AREA
// slot 7069
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
// UPDATE_PROGRAM.agc:422
//
// UPDATE_PROGRAM.agc:423
//		AD	NEG3		# IN THE PROCESS OF
// slot 7070
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
// UPDATE_PROGRAM.agc:424
//		AD	COMPNUMB	# PERFORMING
// slot 7071
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
// UPDATE_PROGRAM.agc:425
//		EXTEND			# THIS UPDATE
// slot 7072
                    if slot <> 7072 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:426
//		BZF	STORLP71	# WILL WE
// slot 7073
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
// UPDATE_PROGRAM.agc:427
//		MASK	BIT9		# OVERFLOW
// slot 7074
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
// UPDATE_PROGRAM.agc:428
//		CCS	A		# INTO THE NEXT EBANK....
// slot 7075
                    if slot <> 7075 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:429
//		TCF	UPERROUT	# YES
// slot 7076
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
// UPDATE_PROGRAM.agc:430
//
// UPDATE_PROGRAM.agc:431
//		CA	NEG3		# NO- CALCULATE NUMBER OF
// slot 7077
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
// UPDATE_PROGRAM.agc:432
//		AD	COMPNUMB	# WORDS TO BE STORED MINUS ONE
// slot 7078
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
// UPDATE_PROGRAM.agc:433
//STORLP71	TS	MPAC		# SAVE NO. OF WORDS REMAINING MINUS ONE
// slot 7079
                    if slot <> 7079 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:434
//# Page 1394
// UPDATE_PROGRAM.agc:435
//		INDEX	A		# TAKE NEXT UPDATE WORD FROM
// slot 7080
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
// UPDATE_PROGRAM.agc:436
//		CA	UPBUFF +2	# UPBUFF AND
// slot 7081
    7081, 25852
)).

// bank 04, slots 7082-7085
function agcAotUnit426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7083 {
        if slot <= 7082 {
// UPDATE_PROGRAM.agc:437
//		TS	L		# SAVE IT IN L
// slot 7082
            if slot <> 7082 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:438
//		CA	MPAC		# CALCULATE NEXT
// slot 7083
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
// UPDATE_PROGRAM.agc:439
//		AD	UPTEMP		# RECEIVING ADDRESS
// slot 7084
            if slot <> 7084 or instruction <> 25207 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 631).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:440
//		INDEX	A
// slot 7085
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
// UPDATE_PROGRAM.agc:441
//		EBANK=	1400
// UPDATE_PROGRAM.agc:442
//		LXCH	1400		# UPDATE THE REGISTER  BY CONTENTS OF L
// slot 7086
    7086, 19968
)).

// bank 04, slots 7087-7089
function agcAotUnit427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7087 {
// UPDATE_PROGRAM.agc:443
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:444
//		CCS	MPAC		# ARE THERE ANY WORDS LEFT TO BE STORED
// slot 7087
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
// UPDATE_PROGRAM.agc:445
//		TCF	STORLP71	# YES
// slot 7088
            if slot <> 7088 or instruction <> 6055 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6055, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:446
//		TCF	UPOUT		# NO- THEN EXIT UPDATE PROGRAM
// slot 7089
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
// UPDATE_PROGRAM.agc:447
//ADUPBFM1	ADRES	UPBUFF -1	# SAME AS ADUPBUFF BUT LESS 1 (DON'T MOVE)
// slot 7090
    7090, 1270
)).

// bank 04, slots 7091-7100
function agcAotUnit428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7095 {
        if slot <= 7092 {
            if slot <= 7091 {
// UPDATE_PROGRAM.agc:448
//		TCF	UPOUT		# NO- EXIT UPDATE(HERE WHEN COMPNUMB = 3)
// slot 7091
                if slot <> 7091 or instruction <> 6089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:449
//
// UPDATE_PROGRAM.agc:450
//# VERB 72 BRANCH
// UPDATE_PROGRAM.agc:451
//
// UPDATE_PROGRAM.agc:452
//UPEND72		CAF	BIT1		# HAVE AN ODD NO. OF COMPONENTS
// slot 7092
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
// UPDATE_PROGRAM.agc:453
//		MASK	COMPNUMB	# BEEN SENT FOR A V72 UPDATE...
// slot 7093
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
// UPDATE_PROGRAM.agc:454
//		CCS	A
// slot 7094
                    if slot <> 7094 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:455
//		TCF	+2		# YES
// slot 7095
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
// UPDATE_PROGRAM.agc:456
//		TCF	UPERROUT	# ERROR- SHOULD BE ODD NO. OF COMPONENTS
// slot 7096
                if slot <> 7096 or instruction <> 6128 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6128, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:457
//		CS	BIT2
// slot 7097
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
// UPDATE_PROGRAM.agc:458
//		AD	COMPNUMB
// slot 7098
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
// UPDATE_PROGRAM.agc:459
//LDLOOP72	TS	MPAC		# NOW PERFORM THE UPDATE
// slot 7099
                    if slot <> 7099 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:460
//		INDEX	A
// slot 7100
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
// UPDATE_PROGRAM.agc:461
//		CAE	UPBUFF +1	# PICK UP NEXT UPDATE WORD
// slot 7101
    7101, 25850
)).

// bank 04, slots 7102-7105
function agcAotUnit429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7103 {
        if slot <= 7102 {
// UPDATE_PROGRAM.agc:462
//		LXCH	A
// slot 7102
            if slot <> 7102 or instruction <> 9216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 0, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:463
//		CCS	MPAC		# SET POINTER TO ECADR(MUST BE CCS)
// slot 7103
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
// UPDATE_PROGRAM.agc:464
//		TS	MPAC
// slot 7104
            if slot <> 7104 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:465
//		INDEX	A
// slot 7105
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
// UPDATE_PROGRAM.agc:466
//		CAE	UPBUFF +1	# PICK UP NEXT ECADR OF REG TO BE UPDATED
// slot 7106
    7106, 25850
)).

// bank 04, slots 7107-7109
function agcAotUnit430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7107 {
// UPDATE_PROGRAM.agc:467
//		TS	EBANK		# SET EBANK
// slot 7107
        if slot <> 7107 or instruction <> 22531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22531, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 7108 {
// UPDATE_PROGRAM.agc:468
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// slot 7108
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
// UPDATE_PROGRAM.agc:469
//		INDEX	A
// slot 7109
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
// UPDATE_PROGRAM.agc:470
//		EBANK=	1400
// UPDATE_PROGRAM.agc:471
//		LXCH	1400		# UPDATE THE REGISTER BY CONTENTS OF L
// slot 7110
    7110, 19968
)).

// bank 04, slots 7111-7134
function agcAotUnit431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7122 {
        if slot <= 7116 {
            if slot <= 7113 {
                if slot <= 7111 {
// UPDATE_PROGRAM.agc:472
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:473
//		CCS	MPAC		# ARE WE THORUGH THE V72 UPDATE...
// slot 7111
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
// UPDATE_PROGRAM.agc:474
//		TCF	LDLOOP72	# NO
// slot 7112
                        if slot <> 7112 or instruction <> 6075 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6075, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:475
//
// UPDATE_PROGRAM.agc:476
//# NORMAL FINISH OF P27
// UPDATE_PROGRAM.agc:477
//
// UPDATE_PROGRAM.agc:478
//UPOUT		EQUALS
// UPDATE_PROGRAM.agc:479
//		TC	INTWAKEU	# RELEASE  GRAB  OF ORBITAL INTEGRATION
// slot 7113
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
// UPDATE_PROGRAM.agc:480
// +1		CAE	UPOLDMOD	# RESTORE PRIOR P27 MODE
// slot 7114
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
// UPDATE_PROGRAM.agc:481
//		TC	NEWMODEX +3
// slot 7115
                        if slot <> 7115 or instruction <> 2764 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2764, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:482
//		CAF	ZERO
// slot 7116
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
// UPDATE_PROGRAM.agc:483
//# Page 1395
// UPDATE_PROGRAM.agc:484
//		TS	DNLSTCOD
// slot 7117
                    if slot <> 7117 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7118 {
// UPDATE_PROGRAM.agc:485
//		TC	UPACTOFF	# TURN OFF 'UPLINK ACTIVITY' LIGHT
// slot 7118
                        if slot <> 7118 or instruction <> 2037 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2037, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:486
//
// UPDATE_PROGRAM.agc:487
//		EXTEND			# KILL GROUP 6.
// slot 7119
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
// UPDATE_PROGRAM.agc:488
//		DCA	NEG0
// slot 7120
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
// UPDATE_PROGRAM.agc:489
//		DXCH	-PHASE6
// slot 7121
                        if slot <> 7121 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:490
//
// UPDATE_PROGRAM.agc:491
//		TC	ENDEXT		# EXTENDED VERB EXIT
// slot 7122
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
// UPDATE_PROGRAM.agc:492
//
// UPDATE_PROGRAM.agc:493
//# VERB 7O BRANCH
// UPDATE_PROGRAM.agc:494
//
// UPDATE_PROGRAM.agc:495
//UPEND70		EXTEND			# V70 DOES THE FOLLOWING WITH DP DELTA
// slot 7123
                    if slot <> 7123 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7124 {
// UPDATE_PROGRAM.agc:496
//		DCS	UPBUFF		# TIME IN UPBUFF
// slot 7124
                        if slot <> 7124 or instruction <> 17021 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 637, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:497
//		DXCH	UPBUFF +8D
// slot 7125
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
// UPDATE_PROGRAM.agc:498
//		TC	TIMEDIDL	# DECREMENT AGC CLOCK
// slot 7126
                    if slot <> 7126 or instruction <> 1911 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1911, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7127 {
// UPDATE_PROGRAM.agc:499
//
// UPDATE_PROGRAM.agc:500
//		TC	UPERROUT	# ERROR WHILE DECREMENTING CLOCK -- EXIT
// slot 7127
                        if slot <> 7127 or instruction <> 2032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:501
//
// UPDATE_PROGRAM.agc:502
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:503
//		EXTEND
// slot 7128
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
// UPDATE_PROGRAM.agc:504
//		DCS	UPBUFF		# COPY DECREMENTERS FOR
// slot 7129
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
// UPDATE_PROGRAM.agc:505
//		DXCH	UPBUFF +10D	# RESTART PROTECTION
// slot 7130
                        if slot <> 7130 or instruction <> 22151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 647, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:506
//		EXTEND
// slot 7131
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
// UPDATE_PROGRAM.agc:507
//		DCS	UPBUFF
// slot 7132
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
// UPDATE_PROGRAM.agc:508
//		DXCH	UPBUFF +12D
// slot 7133
                        if slot <> 7133 or instruction <> 22153 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 649, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:509
//
// UPDATE_PROGRAM.agc:510
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 7134
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
// UPDATE_PROGRAM.agc:511
//		OCT	04026
// slot 7135
    7135, 4140
)).

// bank 04, slots 7136-7149
function agcAotUnit432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7142 {
        if slot <= 7138 {
            if slot <= 7136 {
// UPDATE_PROGRAM.agc:512
//
// UPDATE_PROGRAM.agc:513
//		CAF	ZERO
// slot 7136
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
// UPDATE_PROGRAM.agc:514
//		ZL
// slot 7137
                    if slot <> 7137 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:515
//		DXCH	UPBUFF +10D	# DECREMENT CSM STATE VECTOR TIME
// slot 7138
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
// UPDATE_PROGRAM.agc:516
//		DAS	TETCSM
// slot 7139
                    if slot <> 7139 or instruction <> 9081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 889) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:517
//
// UPDATE_PROGRAM.agc:518
//		CAF	ZERO
// slot 7140
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
// UPDATE_PROGRAM.agc:519
//		ZL
// slot 7141
                    if slot <> 7141 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:520
//		DXCH	UPBUFF +12D	# DECREMENT LEM STATE VECTOR TIME
// slot 7142
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
// UPDATE_PROGRAM.agc:521
//		DAS	TETLEM
// slot 7143
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
// UPDATE_PROGRAM.agc:522
//
// UPDATE_PROGRAM.agc:523
//		CAF	ZERO
// slot 7144
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
// UPDATE_PROGRAM.agc:524
//		ZL
// slot 7145
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
// UPDATE_PROGRAM.agc:525
//		DXCH	UPBUFF
// slot 7146
                    if slot <> 7146 or instruction <> 22141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 637, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:526
//		DAS	TEPHEM +1	# INCREMENT TP TEPHEM
// slot 7147
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
// UPDATE_PROGRAM.agc:527
//		ADS	TEPHEM
// slot 7148
                    if slot <> 7148 or instruction <> 12230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 966).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:528
//
// UPDATE_PROGRAM.agc:529
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 7149
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
// UPDATE_PROGRAM.agc:530
//		OCT 	04026
// slot 7150
    7150, 4140
)).

// bank 04, slots 7151-7160
function agcAotUnit433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7155 {
        if slot <= 7152 {
            if slot <= 7151 {
// UPDATE_PROGRAM.agc:531
//
// UPDATE_PROGRAM.agc:532
//		EBANK=	UPBUFF
// UPDATE_PROGRAM.agc:533
//# Page 1396
// UPDATE_PROGRAM.agc:534
//		TC	UPOUT		# GO TO STANDARD UPDATE PROGRAM EXIT
// slot 7151
                if slot <> 7151 or instruction <> 1993 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1993, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:535
//
// UPDATE_PROGRAM.agc:536
//
// UPDATE_PROGRAM.agc:537
//# ERROR SEQUENCE
// UPDATE_PROGRAM.agc:538
//
// UPDATE_PROGRAM.agc:539
//UPERROUT	TC	FALTON		# TURN ON *OPERATOR ERROR* LIGHT
// slot 7152
                if slot <> 7152 or instruction <> 2292 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2292, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7153 {
// UPDATE_PROGRAM.agc:540
//		TCF	UPOUT		# GO TO COMMON UPDATE PROGRAM EXIT
// slot 7153
                if slot <> 7153 or instruction <> 6089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7154 {
// UPDATE_PROGRAM.agc:541
//
// UPDATE_PROGRAM.agc:542
// +2		TC	FALTON		# TURN ON 'OPERATOR ERROR' LIGHT
// slot 7154
                    if slot <> 7154 or instruction <> 2292 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2292, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:543
//		TC	UPACTOFF	# TURN OFF'UPLINK ACTIVITY'LIGHT
// slot 7155
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
// UPDATE_PROGRAM.agc:544
//		TC	ENDEXT		# EXTENDED VERB EXIT
// slot 7156
                if slot <> 7156 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:545
//					# (THE PURPOSE OF UPERROUT +2 EXIT IS
// UPDATE_PROGRAM.agc:546
//					# TO PROVIDE AN ERROR EXIT WHICH DOES NOT
// UPDATE_PROGRAM.agc:547
//					# RESET ANY RESTART GROUPS)
// UPDATE_PROGRAM.agc:548
//
// UPDATE_PROGRAM.agc:549
//
// UPDATE_PROGRAM.agc:550
//# :UPACTOFF: IS A ROUTINE TO TURN OFF UPLINK ACTIVITY LIGHT ON ALL EXITS FROM UPDATE PROGRAM(P27).
// UPDATE_PROGRAM.agc:551
//
// UPDATE_PROGRAM.agc:552
//UPACTOFF	CS	BIT3
// slot 7157
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
// UPDATE_PROGRAM.agc:553
//		EXTEND			# TURN OFF UPLINK ACTIVITY LIGHT
// slot 7158
                if slot <> 7158 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7159 {
// UPDATE_PROGRAM.agc:554
//		WAND	DSALMOUT	# (BIT 3 OF CHANNEL 11)
// slot 7159
                    if slot <> 7159 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:555
//		TC	Q
// slot 7160
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

// no code for the lines below
// UPDATE_PROGRAM.agc:556
//
