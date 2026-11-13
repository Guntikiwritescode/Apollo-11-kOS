// UPDATE_PROGRAM.agc
// bank 43, slots 38870-38889
function agcAotUnit2330 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38879 {
        if slot <= 38874 {
            if slot <= 38871 {
                if slot <= 38870 {
// UPDATE_PROGRAM.agc:1
//# Copyright:    Public domain.
// UPDATE_PROGRAM.agc:2
//# Filename:     UPDATE_PROGRAM.agc
// UPDATE_PROGRAM.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// UPDATE_PROGRAM.agc:4
//#               is part of the source code for the Command Module's
// UPDATE_PROGRAM.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// UPDATE_PROGRAM.agc:6
//# Assembler:    yaYUL
// UPDATE_PROGRAM.agc:7
//# Reference:    pp. 1497-1507
// UPDATE_PROGRAM.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// UPDATE_PROGRAM.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// UPDATE_PROGRAM.agc:10
//# Mod history:  2009-05-07 RSB	Adapted from Colossus249/UPDATE_PROGRAM.agc
// UPDATE_PROGRAM.agc:11
//#				and page images. Corrected various typos
// UPDATE_PROGRAM.agc:12
//#				in the transcription of program comments,
// UPDATE_PROGRAM.agc:13
//#				and these should be back-ported to
// UPDATE_PROGRAM.agc:14
//#				Colossus249.
// UPDATE_PROGRAM.agc:15
//#
// UPDATE_PROGRAM.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// UPDATE_PROGRAM.agc:17
//# from scanned documents.
// UPDATE_PROGRAM.agc:18
//#
// UPDATE_PROGRAM.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// UPDATE_PROGRAM.agc:20
//#       2021113-051.  April 1, 1969.
// UPDATE_PROGRAM.agc:21
//#
// UPDATE_PROGRAM.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// UPDATE_PROGRAM.agc:23
//#
// UPDATE_PROGRAM.agc:24
//#       Prepared by
// UPDATE_PROGRAM.agc:25
//#                       Massachusetts Institute of Technology
// UPDATE_PROGRAM.agc:26
//#                       75 Cambridge Parkway
// UPDATE_PROGRAM.agc:27
//#                       Cambridge, Massachusetts
// UPDATE_PROGRAM.agc:28
//#
// UPDATE_PROGRAM.agc:29
//#       under NASA contract NAS 9-4065.
// UPDATE_PROGRAM.agc:30
//#
// UPDATE_PROGRAM.agc:31
//# Refer directly to the online document mentioned above for further
// UPDATE_PROGRAM.agc:32
//# information.  Please report any errors to info@sandroid.org.
// UPDATE_PROGRAM.agc:33
//
// UPDATE_PROGRAM.agc:34
//# Page 1497
// UPDATE_PROGRAM.agc:35
//# PROGRAM NAME:		P27
// UPDATE_PROGRAM.agc:36
//# WRITTEN BY:		KILROY/ DE WOLF
// UPDATE_PROGRAM.agc:37
//#
// UPDATE_PROGRAM.agc:38
//# MOD NO:		0
// UPDATE_PROGRAM.agc:39
//# MOD BY:		KILROY
// UPDATE_PROGRAM.agc:40
//# DATE:			01DEC67
// UPDATE_PROGRAM.agc:41
//#
// UPDATE_PROGRAM.agc:42
//# LOG SECTION:		UPDATE PROGRAM.
// UPDATE_PROGRAM.agc:43
//#
// UPDATE_PROGRAM.agc:44
//# FUNCT. DESCR.:	P27 (THE UPDATE PROGRAM) PROCESSES COMMANDS AND DATA
// UPDATE_PROGRAM.agc:45
//#			INSERTIONS REQUESTED BY THE GROUND VIA UPLINK.
// UPDATE_PROGRAM.agc:46
//#			THE P27 PROGRAM WILL ACCEPT UPDATES
// UPDATE_PROGRAM.agc:47
//#			ONLY DURING P00 FOR THE LM, AND ONLY DURING P00,
// UPDATE_PROGRAM.agc:48
//#			P02, AND FRESH START FOR THE CSM.
// UPDATE_PROGRAM.agc:49
//#
// UPDATE_PROGRAM.agc:50
//# CALLING SEQ:		PROGRAM IS INITIATED BY UPLINK ENTRY OF VERBS 70, 71, 72, AND 73.
// UPDATE_PROGRAM.agc:51
//#
// UPDATE_PROGRAM.agc:52
//# SUBROUTINES:		TESTXACT, NEWMODEX, NEWMODEX +3, GOXDSPF, BANKCALL, FINDVAC, INTPRET, INTSTALL, TPAGREE,
// UPDATE_PROGRAM.agc:53
//#			INTWAKEU, ENDEXT, POSTJUMP, FALTON, NEWPHASE, PHASCHNG
// UPDATE_PROGRAM.agc:54
//#
// UPDATE_PROGRAM.agc:55
//# NORMAL EXIT:		TC ENDEXT
// UPDATE_PROGRAM.agc:56
//#
// UPDATE_PROGRAM.agc:57
//# ALARM/ABORT:		TC FALTON FOLLOWED BY TC ENDEXT
// UPDATE_PROGRAM.agc:58
//#
// UPDATE_PROGRAM.agc:59
//# RESTARTS:		P27 IS RESTART PROTECTED IN TWO WAYS ...
// UPDATE_PROGRAM.agc:60
//#			1.	PRIOR TO VERIFLAG INVERSION(WHICH IS CAUSED BY THE GROUND/ASTRONAUT'S VERIFICATION OF UPDATE
// UPDATE_PROGRAM.agc:61
//#				DATA BY SENDING A V33E WHEN V21N02 IS FLASHING)---
// UPDATE_PROGRAM.agc:62
//#				NO PROTECTION EXCEPT PRE-P27 MODE IS RESTORED, COAST + ALIGN DOWNLIST IS SELECTED AND UPLINE
// UPDATE_PROGRAM.agc:63
//#				ACTIVITY LIGHT IS TURNED OFF.(JUST AS IF A V34E WAS SENT DURING P27 DATA LOADS).
// UPDATE_PROGRAM.agc:64
//#				V70,V71,V72 OR V73 WILL HAVE TO BE COMPLETELY RESENT BY USER.
// UPDATE_PROGRAM.agc:65
//#			2.	AFTER VERIFLAG INVERSION(WHEN UPDATE OF THE SPECIFIED ERASABLES IS BEING PERFORMED)---
// UPDATE_PROGRAM.agc:66
//#				PROTECTED AGAINST RESTARTS.
// UPDATE_PROGRAM.agc:67
//#
// UPDATE_PROGRAM.agc:68
//# DEBRIS:		UPBUFF	(20D)	TEMP STORAGE FOR ADDRESSES AND CONTENTS.
// UPDATE_PROGRAM.agc:69
//#			UPVERB	(1)	VERB NUMBER MINUS 70D (E.G. FOR V72, UPVERB = 72D - 70D = 2)
// UPDATE_PROGRAM.agc:70
//#			UPOLDMOD(1)	FOR MAJOR MODE INTERRUPTED BY P27.
// UPDATE_PROGRAM.agc:71
//#			COMPNUMB(1)	TOTAL NUMBER OF COMPONENTS TO BE TRANSMITTED.
// UPDATE_PROGRAM.agc:72
//#			UPCOUNT	(1)	ACTUAL NUMBER OF COMPONENTS RECEIVED.
// UPDATE_PROGRAM.agc:73
//#			UPTEMP	(1)	SCRATCH, BUT USUALLY CONTAINS COMPONENT NUMBER TO BE CHANGED DURING VERIFY CYCLE
// UPDATE_PROGRAM.agc:74
//#
// UPDATE_PROGRAM.agc:75
//# INPUT:
// UPDATE_PROGRAM.agc:76
//#
// UPDATE_PROGRAM.agc:77
//#	ENTRY:			DESCRIPTION
// UPDATE_PROGRAM.agc:78
//#
// UPDATE_PROGRAM.agc:79
//#	V70EXXXXXEXXXXXE	(LIFTOFF TIME INCREMENT) DOUBLE PRECISION OCTAL TIME INCREMENT, XXXXX XXXXX,
// UPDATE_PROGRAM.agc:80
//#				IS ADDED TO TEPHEM, SUBTRACTED FROM AGC CLOCK(TIME2,TIME1), SUBTRACTED FROM CSM STATE
// UPDATE_PROGRAM.agc:81
//#				VECTOR TIME(TETCSM) AND SUBTRACTED FROM LEM STATE VECTOR TIME(TETLEM).
// UPDATE_PROGRAM.agc:82
//#				THE DP OCTAL TIME INCREMENT IS SCALED AT 2(28).
// UPDATE_PROGRAM.agc:83
//# Page 1498
// UPDATE_PROGRAM.agc:84
//#	V71EIIEAAAAE		(CONTIGUOUS BLOCK UPDATE) II-2 OCTAL COMPONENTS,XXXXX,
// UPDATE_PROGRAM.agc:85
//#	XXXXXE			ARE LOADED INTO ERASABLE STARTING AT ECADR, AAAA.
// UPDATE_PROGRAM.agc:86
//#	XXXXXE			IT IS .GE. 3 .AND. .LE. 20D.,
// UPDATE_PROGRAM.agc:87
//#				AND (AAAA + II -3) DOES NOT PRODUCE AN ADDRESS IN THE
// UPDATE_PROGRAM.agc:88
//#				NEXT BANK.
// UPDATE_PROGRAM.agc:89
//#	  .			SCALING IS SAME AS INTERNAL REGISTERS.
// UPDATE_PROGRAM.agc:90
//#
// UPDATE_PROGRAM.agc:91
//#	V72EIIE			(SCATTER UPDATE) (II-1)/2 OCTAL COMPONENTS,XXXXX, ARE
// UPDATE_PROGRAM.agc:92
//#	AAAAEXXXXXE		LOADED INTO ERASABLE LOCATIONS, AAAA.
// UPDATE_PROGRAM.agc:93
//#	AAAAEXXXXXE		II IS .GE. 3 .AND. .LE. 19D, AND MUST BE ODD.
// UPDATE_PROGRAM.agc:94
//#	  .			SCALING IS SAME AS INTERNAL REGISTERS.
// UPDATE_PROGRAM.agc:95
//#
// UPDATE_PROGRAM.agc:96
//#	V73EXXXXXEXXXXXE	(OCTAL CLOCK INCREMENT) DOUBLE PRECISION OCTAL TIME
// UPDATE_PROGRAM.agc:97
//#				INCREMENT XXXXX XXXXX, IS ADDED TO THE AGC CLOCK, IN
// UPDATE_PROGRAM.agc:98
//#				CENTISECONDS SCALED AT (2)28.
// UPDATE_PROGRAM.agc:99
//#				THIS LOAD IS THE OCTAL EQUIVALENT OF V55.
// UPDATE_PROGRAM.agc:100
//#
// UPDATE_PROGRAM.agc:101
//# OUTPUT:		IN ADDITION TO THE ABOVE REGISTER LOADS, ALL UPDATES
// UPDATE_PROGRAM.agc:102
//#			COMPLEMENT BIT3 OF FLAGWORD7.
// UPDATE_PROGRAM.agc:103
//#
// UPDATE_PROGRAM.agc:104
//# ADDITIONAL NOTES:	VERB 71, JUST DEFINED ABOVE WILL BE USED TO PERFORM BUT NOT LIMITED TO THE FOLLOWING UPDATES --
// UPDATE_PROGRAM.agc:105
//#			1.  CSM/LM STATE VECTOR UPDATE
// UPDATE_PROGRAM.agc:106
//#			2.  REFSMMAT UPDATE
// UPDATE_PROGRAM.agc:107
//#
// UPDATE_PROGRAM.agc:108
//#	THE FOLLOWING COMMENTS DELINEATE EACH SPECIAL UPDATE ---
// UPDATE_PROGRAM.agc:109
//#
// UPDATE_PROGRAM.agc:110
//#	1.  CSM/LM STATE VECTOR UPDATE(ALL DATA ENTRIES IN OCTAL)
// UPDATE_PROGRAM.agc:111
//#		ENTRIES:	DATA DEFINITION:				SCALE FACTORS:
// UPDATE_PROGRAM.agc:112
//#		V71E		CONTIGUOUS BLOCK UPDATE VERB
// UPDATE_PROGRAM.agc:113
//#		   21E		NUMBER OF COMPONENTS FOR STATE VECTOR UPDATE
// UPDATE_PROGRAM.agc:114
//#		 AAAAE		ECADR OF 'UPSVFLAG'
// UPDATE_PROGRAM.agc:115
//#		XXXXXE		STATE VECTOR IDENTIFIER: 00001 FOR CSM, 77776 FOR LEM - EARTH SPHERE OF INFLUENCE SCALING
// UPDATE_PROGRAM.agc:116
//#							 00002 FOR CSM, 77775 FOR LEM - LUNAR SPHERE OF INFLUENCE SCALING
// UPDATE_PROGRAM.agc:117
//#		XXXXXEXXXXXE	X POSITION
// UPDATE_PROGRAM.agc:118
//#		XXXXXEXXXXXE	Y POSITION
// UPDATE_PROGRAM.agc:119
//#		XXXXXEXXXXXE	Z POSITION
// UPDATE_PROGRAM.agc:120
//#		XXXXXEXXXXXE	X VELOCITY
// UPDATE_PROGRAM.agc:121
//#		XXXXXEXXXXXE	Y VELOCITY
// UPDATE_PROGRAM.agc:122
//#		XXXXXEXXXXXE	Z VELOCITY
// UPDATE_PROGRAM.agc:123
//#		XXXXXEXXXXXE	TIME FROM AGC CLOCK ZERO
// UPDATE_PROGRAM.agc:124
//#		V33E		VERB 33 TO SIGNAL THAT THE STATE VECTOR IS READY TO BE STORED.
// UPDATE_PROGRAM.agc:125
//#
// UPDATE_PROGRAM.agc:126
//#	2.  REFSMMAT(ALL DATA ENTRIES IN OCTAL)
// UPDATE_PROGRAM.agc:127
//#		ENTRIES:	DATA DEFINITIONS:				SCALE FACTORS:
// UPDATE_PROGRAM.agc:128
//# Page 1499
// UPDATE_PROGRAM.agc:129
//#		V71E		CONTIGUOUS BLOCK UPDATE VERB
// UPDATE_PROGRAM.agc:130
//#		   24E		NUMBER OF COMPONENTS FOR REFSMMAT UPDATE
// UPDATE_PROGRAM.agc:131
//#		 AAAAE		ECADR OF 'REFSMMAT'
// UPDATE_PROGRAM.agc:132
//#		XXXXXEXXXXXE	ROW 1 COLUMN 1					2(-1)
// UPDATE_PROGRAM.agc:133
//#		XXXXXEXXXXXE	ROW 1 COLUMN 2					2(-1)
// UPDATE_PROGRAM.agc:134
//#		XXXXXEXXXXXE	ROW 1 COLUMN 3					2(-1)
// UPDATE_PROGRAM.agc:135
//#		XXXXXEXXXXXE	ROW 2 COLUMN 1					2(-1)
// UPDATE_PROGRAM.agc:136
//#		XXXXXEXXXXXE	ROW 2 COLUMN 2					2(-1)
// UPDATE_PROGRAM.agc:137
//#		XXXXXEXXXXXE	ROW 2 COLUMN 3					2(-1)
// UPDATE_PROGRAM.agc:138
//#		XXXXXEXXXXXE	ROW 3 COLUMN 1					2(-1)
// UPDATE_PROGRAM.agc:139
//#		XXXXXEXXXXXE	ROW 3 COLUMN 2					2(-1)
// UPDATE_PROGRAM.agc:140
//#		XXXXXEXXXXXE	ROW 3 COLUMN 3					2(-1)
// UPDATE_PROGRAM.agc:141
//#		V33E		VERB 33 TO SIGNAL THAT REFSMMAT IS READY TO BE STORED.
// UPDATE_PROGRAM.agc:142
//
// UPDATE_PROGRAM.agc:143
//		BANK	07
// UPDATE_PROGRAM.agc:144
//		SETLOC	EXTVERBS
// UPDATE_PROGRAM.agc:145
//		BANK
// UPDATE_PROGRAM.agc:146
//
// UPDATE_PROGRAM.agc:147
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:148
//
// UPDATE_PROGRAM.agc:149
//		COUNT*	$$/P27
// UPDATE_PROGRAM.agc:150
//V70UPDAT	CAF	UP70		# COMES HERE ON V70E
// slot 38870
                    if slot <> 38870 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:151
//		TCF	V73UPDAT +1
// slot 38871
                    if slot <> 38871 or instruction <> 6109 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6109, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38872 {
// UPDATE_PROGRAM.agc:152
//
// UPDATE_PROGRAM.agc:153
//V71UPDAT	CAF	UP71		# COMES HERE ON V71E
// slot 38872
                    if slot <> 38872 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38873 {
// UPDATE_PROGRAM.agc:154
//		TCF	V73UPDAT +1
// slot 38873
                        if slot <> 38873 or instruction <> 6109 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6109, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:155
//
// UPDATE_PROGRAM.agc:156
//V72UPDAT	CAF	UP72		# COMES HERE ON V72E
// slot 38874
                        if slot <> 38874 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38876 {
                if slot <= 38875 {
// UPDATE_PROGRAM.agc:157
//		TCF	V73UPDAT +1
// slot 38875
                    if slot <> 38875 or instruction <> 6109 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6109, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:158
//
// UPDATE_PROGRAM.agc:159
//V73UPDAT	CAF	UP73		# COMES HERE ON V73E
// slot 38876
                    if slot <> 38876 or instruction <> 15500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38877 {
// UPDATE_PROGRAM.agc:160
//
// UPDATE_PROGRAM.agc:161
// 	+1	TS	UPVERBSV	# SAVE UPVERB UNTIL IT'S OK TO ENTER P27
// slot 38877
                    if slot <> 38877 or instruction <> 22745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22745, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38878 {
// UPDATE_PROGRAM.agc:162
//
// UPDATE_PROGRAM.agc:163
//		TC	TESTXACT	# GRAB DISPLAY IF AVAILABLE, OTHERWISE
// slot 38878
                        if slot <> 38878 or instruction <> 1086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:164
//					# TURN*OPERATOR ERROR* ON AND TERMINATE JOB
// UPDATE_PROGRAM.agc:165
//
// UPDATE_PROGRAM.agc:166
//		CA	MODREG		# CHECK IF UPDATE ALLOWED
// slot 38879
                        if slot <> 38879 or instruction <> 12809 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 521).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38884 {
            if slot <= 38881 {
                if slot <= 38880 {
// UPDATE_PROGRAM.agc:167
//		EXTEND			# FIRST CHECK FOR MODREG = +0, -0
// slot 38880
                    if slot <> 38880 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:168
//		BZF	+2		# (+0 = P00, -0 = FRESH START)
// slot 38881
                    if slot <> 38881 or instruction <> 6115 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6115, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38882 {
// UPDATE_PROGRAM.agc:169
//		TC	CKMDMORE	# NOW CHECK FOR PROGRAM WHICH CAN BE
// slot 38882
                    if slot <> 38882 or instruction <> 2027 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2027, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38883 {
// UPDATE_PROGRAM.agc:170
//					# INTERRUPTED BY P27.
// UPDATE_PROGRAM.agc:171
//
// UPDATE_PROGRAM.agc:172
//		CAE	MODREG		# UPDATE ALLOWED.
// slot 38883
                        if slot <> 38883 or instruction <> 12809 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 521).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:173
//		TS	UPOLDMOD	# SAVE CURRENT MAJOR MODE
// slot 38884
                        if slot <> 38884 or instruction <> 22721 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22721, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38886 {
                if slot <= 38885 {
// UPDATE_PROGRAM.agc:174
//# Page 1500
// UPDATE_PROGRAM.agc:175
//		CAE	UPVERBSV	# SET UPVERB TO INDICDATE TO P27
// slot 38885
                    if slot <> 38885 or instruction <> 12505 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 217).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:176
//		TS	UPVERB		# WHICH EXTENDED VERB CALLED IT.
// slot 38886
                    if slot <> 38886 or instruction <> 22722 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22722, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38887 {
// UPDATE_PROGRAM.agc:177
//
// UPDATE_PROGRAM.agc:178
//		CAF	ONE
// slot 38887
                    if slot <> 38887 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38888 {
// UPDATE_PROGRAM.agc:179
//		TS	UPCOUNT		# INITIALIZE UPCOUNT TO 1
// slot 38888
                        if slot <> 38888 or instruction <> 22723 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22723, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:180
//
// UPDATE_PROGRAM.agc:181
//		TC	POSTJUMP	# LEAVE EXTENDED VERB BANK AND
// slot 38889
                        if slot <> 38889 or instruction <> 2497 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2497, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2330] to agcAotUnit2330@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:182
//		CADR	UPPART2		# GO TO UPDATE PROGRAM(P27) BANK.
// slot 38890
    38890, 48630
)).

// bank 43, slots 38891-38900
function agcAotUnit2331 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38895 {
        if slot <= 38892 {
            if slot <= 38891 {
// UPDATE_PROGRAM.agc:183
//
// UPDATE_PROGRAM.agc:184
//CKMDMORE	CS	FLAGWRD5
// slot 38891
                if slot <> 38891 or instruction <> 16449 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 65).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:185
//		MASK	BIT8		# CHECK IF COMPUTER IS LGC
// slot 38892
                if slot <> 38892 or instruction <> 31240 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 38893 {
// UPDATE_PROGRAM.agc:186
//		CCS	A		# IS COMPUER LGC OR AGC
// slot 38893
                if slot <> 38893 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38894 {
// UPDATE_PROGRAM.agc:187
//UPERLEM		TCF	UPERROR		# ERROR- IT'S THE LEM + MODE IS NOT P00.
// slot 38894
                    if slot <> 38894 or instruction <> 6132 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6132, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:188
//		CS	TWO
// slot 38895
                    if slot <> 38895 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38897 {
            if slot <= 38896 {
// UPDATE_PROGRAM.agc:189
//		MASK	MODREG
// slot 38896
                if slot <> 38896 or instruction <> 29193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 521).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:190
//		CCS	A
// slot 38897
                if slot <> 38897 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38898 {
// UPDATE_PROGRAM.agc:191
//UPERCMC		TCF	UPERROR		# ERROR- IT'S THE CMC AND MODE IS NOT
// slot 38898
                if slot <> 38898 or instruction <> 6132 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6132, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38899 {
// UPDATE_PROGRAM.agc:192
//					# P00 OR P02.
// UPDATE_PROGRAM.agc:193
//		TC	Q		# ALLOW UPDATE TO PROCEED
// slot 38899
                    if slot <> 38899 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:194
//
// UPDATE_PROGRAM.agc:195
//UPERROR		TC	POSTJUMP	# TURN ON 'OPERATOR ERROR' LIGHT
// slot 38900
                    if slot <> 38900 or instruction <> 2497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2331] to agcAotUnit2331@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:196
//		CADR	UPERROUT +2	# GO TO COMMON UPDATE PROGRAM EXIT
// slot 38901
    38901, 49112
)).

// bank 27, slots 26363-26363
function agcAotUnit1518 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:197
//
// UPDATE_PROGRAM.agc:198
//		SBANK=	LOWSUPER
// UPDATE_PROGRAM.agc:199
//UP70		EQUALS	ZERO
// UPDATE_PROGRAM.agc:200
//UP71		EQUALS	ONE
// UPDATE_PROGRAM.agc:201
//UP72		EQUALS	TWO
// UPDATE_PROGRAM.agc:202
//UP73		EQUALS	THREE
// UPDATE_PROGRAM.agc:203
//
// UPDATE_PROGRAM.agc:204
//		BANK	04
// UPDATE_PROGRAM.agc:205
//		SETLOC	UPDATE2
// UPDATE_PROGRAM.agc:206
//		BANK
// UPDATE_PROGRAM.agc:207
//
// UPDATE_PROGRAM.agc:208
//		COUNT*	$$/P27
// UPDATE_PROGRAM.agc:209
//
// UPDATE_PROGRAM.agc:210
//UPPART2		EQUALS			# UPDATE PROGRAM - PART 2
// UPDATE_PROGRAM.agc:211
//
// UPDATE_PROGRAM.agc:212
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO RESTORE OLD MODE
// slot 26363
    if slot <> 26363 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1518] to agcAotUnit1518@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:213
//		OCT	07026		# AND DOWNLIST AND EXIT IF RESTART OCCURS.
// slot 26364
    26364, 7212,
// UPDATE_PROGRAM.agc:214
//		OCT	30000		# PRIORITY SAME AS CHRPRIO
// slot 26365
    26365, 24576,
// UPDATE_PROGRAM.agc:215
//		EBANK=	UPBUFF
// UPDATE_PROGRAM.agc:216
//		2CADR	UPOUT +1
// slot 26366 26367
    26366, 3976, 26367, 47200
)).

// bank 27, slots 26368-26370
function agcAotUnit1519 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26368 {
// UPDATE_PROGRAM.agc:217
//
// UPDATE_PROGRAM.agc:218
//		CAF	ONE
// slot 26368
        if slot <> 26368 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 26369 {
// UPDATE_PROGRAM.agc:219
//		TS	DNLSTCOD	# DOWNLIST
// slot 26369
            if slot <> 26369 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:220
//
// UPDATE_PROGRAM.agc:221
//		TC	NEWMODEX	# SET MAJOR MODE = 27
// slot 26370
            if slot <> 26370 or instruction <> 2796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1519] to agcAotUnit1519@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:222
//# Page 1501
// UPDATE_PROGRAM.agc:223
//		DEC	27
// slot 26371
    26371, 54
)).

// bank 27, slots 26372-26372
function agcAotUnit1520 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:224
//
// UPDATE_PROGRAM.agc:225
//		INDEX	UPVERB		# BRANCH DEPENDING ON WHETHER THE UPDATE
// slot 26372
    if slot <> 26372 or instruction <> 20674 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20674, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20674, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1520] to agcAotUnit1520@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:226
//		TCF	+1		# VERB REQUIRES A FIXED OR VARIABLE NUMBER
// slot 26373
    26373, 11788
)).

// bank 27, slots 26374-26383
function agcAotUnit1521 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26378 {
        if slot <= 26375 {
            if slot <= 26374 {
// UPDATE_PROGRAM.agc:227
//		TCF	+3		# V70 FIXED.		   (OF COMPONENTS.
// slot 26374
                if slot <> 26374 or instruction <> 5897 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5897, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:228
//		TCF	OHWELL1		# V71 VARIABLE - GO GET NO. OF COMPONENTS
// slot 26375
                if slot <> 26375 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26376 {
// UPDATE_PROGRAM.agc:229
//		TCF	OHWELL1		# V72 VARIABLE - GO GET NO. OF COMPONENTS
// slot 26376
                if slot <> 26376 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26377 {
// UPDATE_PROGRAM.agc:230
//		CA	TWO		# V73 (AND V70) FIXED
// slot 26377
                    if slot <> 26377 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:231
//		TS	COMPNUMB	# SET NUMBER OF COMPONENTS TO 2.
// slot 26378
                    if slot <> 26378 or instruction <> 22720 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22720, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26380 {
            if slot <= 26379 {
// UPDATE_PROGRAM.agc:232
//		TCF	OHWELL2		# GO GET THE TWO UPDATE COMPONENTS
// slot 26379
                if slot <> 26379 or instruction <> 5919 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5919, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:233
//
// UPDATE_PROGRAM.agc:234
//OHWELL1		CAF	ADUPBUFF	# * REQUEST USER TO SEND NUMBER  *
// slot 26380
                if slot <> 26380 or instruction <> 14151 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1863), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26381 {
// UPDATE_PROGRAM.agc:235
//		TS	MPAC +2		# * OF COMPONENTS PARAMETER(II). *
// slot 26381
                if slot <> 26381 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26382 {
// UPDATE_PROGRAM.agc:236
//	+2	CAF	UPLOADNV	# (CKV432 RETURNS HERE IF V32 ENCOUNTERED)
// slot 26382
                    if slot <> 26382 or instruction <> 14152 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1864), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:237
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// slot 26383
                    if slot <> 26383 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1521] to agcAotUnit1521@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:238
//		CADR	GOXDSPF		# TO REQUEST II.
// slot 26384
    26384, 17122
)).

// bank 27, slots 26385-26403
function agcAotUnit1522 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26393 {
        if slot <= 26388 {
            if slot <= 26386 {
                if slot <= 26385 {
// UPDATE_PROGRAM.agc:239
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// slot 26385
                    if slot <> 26385 or instruction <> 6084 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6084, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:240
//		TCF	OHWELL1 +2
// slot 26386
                    if slot <> 26386 or instruction <> 5902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26387 {
// UPDATE_PROGRAM.agc:241
//		TC	CK4V32		# DATA OR V32 RETURN
// slot 26387
                    if slot <> 26387 or instruction <> 1856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1856, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:242
//		CS	BIT2
// slot 26388
                    if slot <> 26388 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26390 {
                if slot <= 26389 {
// UPDATE_PROGRAM.agc:243
//		AD	UPBUFF		# IS II(NUMBER OF COMPONENTS PARAMETER)
// slot 26389
                    if slot <> 26389 or instruction <> 24772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 196).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:244
//		EXTEND			# .GE. 3 AND .LE. 20D.
// slot 26390
                    if slot <> 26390 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26391 {
// UPDATE_PROGRAM.agc:245
//		BZMF	OHWELL1 +2
// slot 26391
                    if slot <> 26391 or instruction <> 26382 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26382, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26392 {
// UPDATE_PROGRAM.agc:246
//		CS	UPBUFF
// slot 26392
                        if slot <> 26392 or instruction <> 16580 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 196).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:247
//		AD	UP21
// slot 26393
                        if slot <> 26393 or instruction <> 26878 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2302), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 26398 {
            if slot <= 26395 {
                if slot <= 26394 {
// UPDATE_PROGRAM.agc:248
//		EXTEND
// slot 26394
                    if slot <> 26394 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:249
//		BZMF	OHWELL1 +2
// slot 26395
                    if slot <> 26395 or instruction <> 26382 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26382, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26396 {
// UPDATE_PROGRAM.agc:250
//		CAE	UPBUFF
// slot 26396
                    if slot <> 26396 or instruction <> 12484 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 196).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26397 {
// UPDATE_PROGRAM.agc:251
//		TS	COMPNUMB	# SAVE II IN COMPNUMB
// slot 26397
                        if slot <> 26397 or instruction <> 22720 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22720, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:252
//
// UPDATE_PROGRAM.agc:253
//# UPBUFF LOADING SEQUENCE
// UPDATE_PROGRAM.agc:254
//
// UPDATE_PROGRAM.agc:255
//		INCR	UPCOUNT		# INCREMENT COUNT OF COMPONENTS RECEIVED.
// slot 26398
                        if slot <> 26398 or instruction <> 10435 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 195).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26400 {
                if slot <= 26399 {
// UPDATE_PROGRAM.agc:256
//OHWELL2		CAF	ADUPBFM1	# CALCULATE LOCATION(ECADR) IN UPBUFF
// slot 26399
                    if slot <> 26399 or instruction <> 14252 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1964), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:257
//		AD	UPCOUNT		# WHERE NEXT COMPONENT SHOULD BE STORED.
// slot 26400
                    if slot <> 26400 or instruction <> 24771 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 195).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26401 {
// UPDATE_PROGRAM.agc:258
//	+2	TS	MPAC +2		# PLACE ECADR INTO R3.
// slot 26401
                    if slot <> 26401 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26402 {
// UPDATE_PROGRAM.agc:259
//	+3	CAF	UPLOADNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// slot 26402
                        if slot <> 26402 or instruction <> 14152 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1864), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:260
//		TC	BANKCALL	# DISPLAY A FLASHING V21N01
// slot 26403
                        if slot <> 26403 or instruction <> 2482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1522] to agcAotUnit1522@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:261
//		CADR	GOXDSPF		# TO REQUEST DATA.
// slot 26404
    26404, 17122
)).

// bank 27, slots 26405-26416
function agcAotUnit1523 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26410 {
        if slot <= 26407 {
            if slot <= 26405 {
// UPDATE_PROGRAM.agc:262
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN.
// slot 26405
                if slot <> 26405 or instruction <> 6084 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6084, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26406 {
// UPDATE_PROGRAM.agc:263
//		TCF	OHWELL2 +3	# V33 PROCEED RETURN
// slot 26406
                    if slot <> 26406 or instruction <> 5922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5922, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:264
//		TC	CK4V32		# DATA OR V32 RETURN
// slot 26407
                    if slot <> 26407 or instruction <> 1856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1856, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26408 {
// UPDATE_PROGRAM.agc:265
//		CS	UPCOUNT		# HAVE WE FINISHED RECEIVING ALL
// slot 26408
                if slot <> 26408 or instruction <> 16579 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 195).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26409 {
// UPDATE_PROGRAM.agc:266
//		AD	COMPNUMB	# THE DATA WE EXPECTED.
// slot 26409
                    if slot <> 26409 or instruction <> 24768 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 192).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:267
//		EXTEND
// slot 26410
                    if slot <> 26410 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26413 {
            if slot <= 26411 {
// UPDATE_PROGRAM.agc:268
//		BZMF	UPVERIFY	# YES- GO TO VERIFICATION SEQUENCE
// slot 26411
                if slot <> 26411 or instruction <> 26413 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26413, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26412 {
// UPDATE_PROGRAM.agc:269
//		TCF	OHWELL2 -1	# NO- REQUEST ADDITIONAL DATA.
// slot 26412
                    if slot <> 26412 or instruction <> 5918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5918, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:270
//
// UPDATE_PROGRAM.agc:271
//# Page 1502
// UPDATE_PROGRAM.agc:272
//# VERIFY SEQUENCE
// UPDATE_PROGRAM.agc:273
//UPVERIFY	CAF	ADUPTEMP	# PLACE ECADR WHERE COMPONENT NO. INDEX
// slot 26413
                    if slot <> 26413 or instruction <> 14150 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1862), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26414 {
// UPDATE_PROGRAM.agc:274
//		TS	MPAC +2		# IS TO BE STORED INTO R3.
// slot 26414
                if slot <> 26414 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26415 {
// UPDATE_PROGRAM.agc:275
//		CAF	UPVRFYNV	# (CK4V32 RETURNS HERE IF V32 ENCOUNTERED)
// slot 26415
                    if slot <> 26415 or instruction <> 14153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1865), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:276
//		TC	BANKCALL	# DISPLAY A FLASHING V21N02 TO REQUEST
// slot 26416
                    if slot <> 26416 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1523] to agcAotUnit1523@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:277
//		CADR	GOXDSPF		# DATA CORRECTION OR VERIFICATION.
// slot 26417
    26417, 17122
)).

// bank 27, slots 26418-26436
function agcAotUnit1524 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26426 {
        if slot <= 26421 {
            if slot <= 26419 {
                if slot <= 26418 {
// UPDATE_PROGRAM.agc:278
//		TCF	UPOUT4		# V34 TERMINATE UPDATE(P27) RETURN
// slot 26418
                    if slot <> 26418 or instruction <> 6084 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6084, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:279
//		TCF	UPSTORE		# V33 DATA SENT IS GOOD.  GO STORE IT.
// slot 26419
                    if slot <> 26419 or instruction <> 5962 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5962, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26420 {
// UPDATE_PROGRAM.agc:280
//		TC	CK4V32		# COMPONENT NO. INDEX OR V32 RETURN
// slot 26420
                    if slot <> 26420 or instruction <> 1856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1856, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:281
//		CA	UPTEMP		# DOES THE COMPONENT NO. INDEX JUST SENT
// slot 26421
                    if slot <> 26421 or instruction <> 12504 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 216).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26423 {
                if slot <= 26422 {
// UPDATE_PROGRAM.agc:282
//		EXTEND			# SPECIFY A LEGAL COMPONENT NUMBER?
// slot 26422
                    if slot <> 26422 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:283
//		BZMF	UPVERIFY	# NO, IT IS NOT POSITIVE NONZERO
// slot 26423
                    if slot <> 26423 or instruction <> 26413 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26413, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26424 {
// UPDATE_PROGRAM.agc:284
//		CS	UPTEMP
// slot 26424
                    if slot <> 26424 or instruction <> 16600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 216).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26425 {
// UPDATE_PROGRAM.agc:285
//		AD	COMPNUMB
// slot 26425
                        if slot <> 26425 or instruction <> 24768 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 192).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:286
//		AD	BIT1
// slot 26426
                        if slot <> 26426 or instruction <> 27151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 26431 {
            if slot <= 26428 {
                if slot <= 26427 {
// UPDATE_PROGRAM.agc:287
//		EXTEND
// slot 26427
                    if slot <> 26427 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:288
//		BZMF	UPVERIFY	# NO
// slot 26428
                    if slot <> 26428 or instruction <> 26413 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26413, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26429 {
// UPDATE_PROGRAM.agc:289
//		CAF	ADUPBFM1	# YES- BASED ON THE COMPONENT NO. INDEX
// slot 26429
                    if slot <> 26429 or instruction <> 14252 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1964), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26430 {
// UPDATE_PROGRAM.agc:290
//		AD	UPTEMP		# CALCULATE THE ECADR OF LOCATION IN
// slot 26430
                        if slot <> 26430 or instruction <> 24792 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 216).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:291
//		TCF	OHWELL2 +2	# UPBUFF WHICH USER WANTS TO CHANGE.
// slot 26431
                        if slot <> 26431 or instruction <> 5921 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5921, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26433 {
                if slot <= 26432 {
// UPDATE_PROGRAM.agc:292
//
// UPDATE_PROGRAM.agc:293
//UPOUT4		EQUALS	UPOUT +1	# COMES HERE ON V34 TC TERMINATE UPDATE
// UPDATE_PROGRAM.agc:294
//
// UPDATE_PROGRAM.agc:295
//# CHECK FOR VERB 32 SEQUENCE
// UPDATE_PROGRAM.agc:296
//
// UPDATE_PROGRAM.agc:297
//CK4V32		CS	MPAC		# ON DATA RETURN FROM 'GOXDSPF'
// slot 26432
                    if slot <> 26432 or instruction <> 16492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 108).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:298
//		MASK	BIT6		# ON DATA RETURN FROM "GOXDSP"& THE CON-
// slot 26433
                    if slot <> 26433 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
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
                if slot <= 26434 {
// UPDATE_PROGRAM.agc:299
//		CCS	A		# TENTS OF MPAC = VERB.  SO TEST FOR V32.
// slot 26434
                    if slot <> 26434 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26435 {
// UPDATE_PROGRAM.agc:300
//		TC	Q		# IT'S NOT A V32, IT'S DATA.  PROCEED.
// slot 26435
                        if slot <> 26435 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:301
//		INDEX	Q
// slot 26436
                        if slot <> 26436 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1524] to agcAotUnit1524@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:302
//		TC	0 -6		# V32 ENCOUNTERED - GO BACK AND GET DATA
// slot 26437
    26437, 65522,
// UPDATE_PROGRAM.agc:303
//
// UPDATE_PROGRAM.agc:304
//ADUPTEMP	ADRES	UPTEMP		# ADDRESS OF TEMP STORAGE FOR CORRECTIONS
// slot 26438
    26438, 432,
// UPDATE_PROGRAM.agc:305
//ADUPBUFF	ADRES	UPBUFF		# ADDRESS OF UPDATE DATA STORAGE BUFFER
// slot 26439
    26439, 392,
// UPDATE_PROGRAM.agc:306
//UPLOADNV	VN	2101		# VERB 21 NOUN 01
// slot 26440
    26440, 5378,
// UPDATE_PROGRAM.agc:307
//UPVRFYNV	VN	2102		# VERB 21 NOUN 02
// slot 26441
    26441, 5380
)).

// bank 27, slots 26442-26449
function agcAotUnit1525 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26445 {
        if slot <= 26443 {
            if slot <= 26442 {
// UPDATE_PROGRAM.agc:308
//UP21		=	MD1		# DEC 21 = MAX NO OF COMPONENTS +1
// UPDATE_PROGRAM.agc:309
//UPDTPHAS	EQUALS	FIVE
// UPDATE_PROGRAM.agc:310
//
// UPDATE_PROGRAM.agc:311
//# PRE-STORE AND FAN TO APPROPRIATE BRANCH SEQUENCE
// UPDATE_PROGRAM.agc:312
//
// UPDATE_PROGRAM.agc:313
//UPSTORE		EQUALS			# GROUND HAS VERIFIED UPDATE. STORE DATA.
// UPDATE_PROGRAM.agc:314
//
// UPDATE_PROGRAM.agc:315
//		INHINT
// slot 26442
                if slot <> 26442 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:316
//
// UPDATE_PROGRAM.agc:317
//		CAE	FLAGWRD7	# INVERT VERIFLAG(BIT3 OF FLAGWRD7) TO
// slot 26443
                if slot <> 26443 or instruction <> 12355 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26444 {
// UPDATE_PROGRAM.agc:318
//		XCH	L		# INDICATE TO THE GROUND(VIA DOWNLINK)
// slot 26444
                if slot <> 26444 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:319
//		CAF	BIT3		# THAT THE V33(WHICH THE GROUND SENT TO
// slot 26445
                if slot <> 26445 or instruction <> 14861 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26447 {
            if slot <= 26446 {
// UPDATE_PROGRAM.agc:320
//# Page 1503
// UPDATE_PROGRAM.agc:321
//		EXTEND			# VERIFY THE UPDATE) HAS BEEN SUCCESSFULLY
// slot 26446
                if slot <> 26446 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:322
//		RXOR	LCHAN		# RECEIVED BY THE UPDATE PROGRAM
// slot 26447
                if slot <> 26447 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26448 {
// UPDATE_PROGRAM.agc:323
//		TS	FLAGWRD7
// slot 26448
                if slot <> 26448 or instruction <> 22595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:324
//
// UPDATE_PROGRAM.agc:325
//		TC	PHASCHNG	# SET RESTART GROUP 6 TO REDO THE UPDATE
// slot 26449
                if slot <> 26449 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1525] to agcAotUnit1525@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:326
//		OCT	04026		# DATA STORE IF A RESTART OCCURS.
// slot 26450
    26450, 4140
)).

// bank 27, slots 26451-26463
function agcAotUnit1526 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26456 {
        if slot <= 26453 {
            if slot <= 26451 {
// UPDATE_PROGRAM.agc:327
//		INHINT			# (BECAUSE PHASCHNG DID A RELINT)
// slot 26451
                if slot <> 26451 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26452 {
// UPDATE_PROGRAM.agc:328
//
// UPDATE_PROGRAM.agc:329
//		CS	TWO		# GO TO UPFNDVAC IF INSTALL IS REQUIRED,
// slot 26452
                    if slot <> 26452 or instruction <> 18958 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:330
//		AD	UPVERB		# THAT IS, IF IT'S A V70 - V72.
// slot 26453
                    if slot <> 26453 or instruction <> 24770 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 194).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26454 {
// UPDATE_PROGRAM.agc:331
//		EXTEND			# GO TO UPEND73 IF IT'S A V73.
// slot 26454
                if slot <> 26454 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26455 {
// UPDATE_PROGRAM.agc:332
//		BZMF	UPFNDVAC
// slot 26455
                    if slot <> 26455 or instruction <> 26462 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26462, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:333
//
// UPDATE_PROGRAM.agc:334
//# VERB 73 BRANCH
// UPDATE_PROGRAM.agc:335
//
// UPDATE_PROGRAM.agc:336
//UPEND73		EXTEND			# V73-PERFORM DP OCTAL AGC CLOCK INCREMENT
// slot 26456
                    if slot <> 26456 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26459 {
            if slot <= 26457 {
// UPDATE_PROGRAM.agc:337
//		DCA	UPBUFF
// slot 26457
                if slot <> 26457 or instruction <> 12485 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 197, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26458 {
// UPDATE_PROGRAM.agc:338
//		DXCH	UPBUFF +8D
// slot 26458
                    if slot <> 26458 or instruction <> 21709 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 205, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:339
//		TC	TIMEDIDL
// slot 26459
                    if slot <> 26459 or instruction <> 1905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1905, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26461 {
                if slot <= 26460 {
// UPDATE_PROGRAM.agc:340
//		TC	FALTON		# ERROR- TURN ON *OPERATOR ERROR* LIGHT
// slot 26460
                    if slot <> 26460 or instruction <> 2304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2304, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:341
//		TC	UPOUT +1	# GO TO COMMON UPDATE PROGRAM EXIT
// slot 26461
                    if slot <> 26461 or instruction <> 1988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26462 {
// UPDATE_PROGRAM.agc:342
//
// UPDATE_PROGRAM.agc:343
//UPFNDVAC	CAF	CHRPRIO		# (USE EXTENDED VERB PRIORITY)
// slot 26462
                    if slot <> 26462 or instruction <> 14585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:344
//		TC	FINDVAC		# GET VAC AREA FOR 'CALL INTSTALL'
// slot 26463
                    if slot <> 26463 or instruction <> 2663 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2663, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1526] to agcAotUnit1526@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:345
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:346
//		2CADR	UPJOB		# (NOTE:  THIS WILL ALSO SET EBANK FOR
// slot 26464 26465
    26464, 3782, 26465, 47206
)).

// bank 27, slots 26466-26467
function agcAotUnit1527 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26466 {
// UPDATE_PROGRAM.agc:347
//		TC	ENDOFJOB	# 'TEPHEM' UPDATE BY V70)
// slot 26466
        if slot <> 26466 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:348
//
// UPDATE_PROGRAM.agc:349
//UPJOB		TC	INTPRET		# THIS COULD BE A STATE VECTOR UPDATE--SO
// slot 26467
        if slot <> 26467 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1527] to agcAotUnit1527@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:350
//		CALL			# WAIT(PUT JOB TO SLEEP) IF ORBIT INT(OI)
// slot 26468
    26468, 65320,
// UPDATE_PROGRAM.agc:351
//			INTSTALL	# IS IN PROGRESS--OR--GRAB OI AND RETURN
// slot 26469
    26469, 24132,
// UPDATE_PROGRAM.agc:352
//					# TO UPWAKE IF OI IS NOT IN PROGRESS.
// UPDATE_PROGRAM.agc:353
//
// UPDATE_PROGRAM.agc:354
//UPWAKE		EXIT
// slot 26470
    26470, 65532
)).

// bank 27, slots 26471-26471
function agcAotUnit1528 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:355
//
// UPDATE_PROGRAM.agc:356
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 26471
    if slot <> 26471 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1528] to agcAotUnit1528@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:357
//		OCT	04026
// slot 26472
    26472, 4140
)).

// bank 27, slots 26473-26473
function agcAotUnit1529 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:358
//
// UPDATE_PROGRAM.agc:359
//		TC	UPFLAG		# SET INTEGRATION RESTART BIT
// slot 26473
    if slot <> 26473 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1529] to agcAotUnit1529@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:360
//		ADRES	REINTFLG
// slot 26474
    26474, 316
)).

// bank 27, slots 26475-26476
function agcAotUnit1530 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26475 {
// UPDATE_PROGRAM.agc:361
//		INHINT
// slot 26475
        if slot <> 26475 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:362
//UPPART3		EQUALS
// UPDATE_PROGRAM.agc:363
//
// UPDATE_PROGRAM.agc:364
//		INDEX	UPVERB		# BRANCH TO THE APPROPRIATE UPDATE VERB
// slot 26476
        if slot <> 26476 or instruction <> 20674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20674, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20674, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1530] to agcAotUnit1530@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:365
//		TCF	+1		# ROUTINE TO ACTUALLY PERFORM THE UPDATE
// slot 26477
    26477, 11996
)).

// bank 27, slots 26478-26505
function agcAotUnit1531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26491 {
        if slot <= 26484 {
            if slot <= 26480 {
                if slot <= 26478 {
// UPDATE_PROGRAM.agc:366
//		TCF	UPEND70		# V70
// slot 26478
                    if slot <> 26478 or instruction <> 6093 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6093, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26479 {
// UPDATE_PROGRAM.agc:367
//		TCF	UPEND71		# V71
// slot 26479
                        if slot <> 26479 or instruction <> 6036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:368
//		TCF	UPEND72		# V72
// slot 26480
                        if slot <> 26480 or instruction <> 6062 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6062, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26482 {
                    if slot <= 26481 {
// UPDATE_PROGRAM.agc:369
//
// UPDATE_PROGRAM.agc:370
//# Page 1504
// UPDATE_PROGRAM.agc:371
//# ROUTINE TO INCREMENT CLOCK(TIME2,TIME1) WITH CONTENTS OF DP WORD AT UPBUFF.
// UPDATE_PROGRAM.agc:372
//TIMEDIDL	EXTEND
// slot 26481
                        if slot <> 26481 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:373
//		QXCH	UPTEMP		# SAVE Q FOR RETURN
// slot 26482
                        if slot <> 26482 or instruction <> 9432 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 216, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26483 {
// UPDATE_PROGRAM.agc:374
//		CAF	ZERO		# ZERO AND SAVE TIME2,TIME1
// slot 26483
                        if slot <> 26483 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:375
//		ZL
// slot 26484
                        if slot <> 26484 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
            if slot <= 26487 {
                if slot <= 26485 {
// UPDATE_PROGRAM.agc:376
//		DXCH	TIME2
// slot 26485
                    if slot <> 26485 or instruction <> 21525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26486 {
// UPDATE_PROGRAM.agc:377
//		DXCH	UPBUFF +18D	# STORE IN CASE OF OVERFLOW
// slot 26486
                        if slot <> 26486 or instruction <> 21719 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 215, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:378
//
// UPDATE_PROGRAM.agc:379
//		CAF	UPDTPHAS	# DO
// slot 26487
                        if slot <> 26487 or instruction <> 14866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26489 {
                    if slot <= 26488 {
// UPDATE_PROGRAM.agc:380
//		TS	L		# A
// slot 26488
                        if slot <> 26488 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:381
//		COM			# QUICK
// slot 26489
                        if slot <> 26489 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26490 {
// UPDATE_PROGRAM.agc:382
//		DXCH	-PHASE6		# PHASCHNG
// slot 26490
                        if slot <> 26490 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:383
//
// UPDATE_PROGRAM.agc:384
//TIMEDIDR	INHINT
// slot 26491
                        if slot <> 26491 or instruction <> 4 { return choose false if checkOnly else -1. }
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
        if slot <= 26498 {
            if slot <= 26494 {
                if slot <= 26492 {
// UPDATE_PROGRAM.agc:385
//		CAF	ZERO
// slot 26492
                    if slot <> 26492 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26493 {
// UPDATE_PROGRAM.agc:386
//		ZL			# PICK UP INCREMENTER(AND ZERO
// slot 26493
                        if slot <> 26493 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
// slot 26494
                        if slot <> 26494 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26496 {
                    if slot <= 26495 {
// UPDATE_PROGRAM.agc:388
//		DXCH	UPBUFF +8D	# STORE IT
// slot 26495
                        if slot <> 26495 or instruction <> 21709 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 205, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:389
//		DXCH	MPAC		# INTO MPAC FOR TPAGREE.
// slot 26496
                        if slot <> 26496 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26497 {
// UPDATE_PROGRAM.agc:390
//
// UPDATE_PROGRAM.agc:391
//		EXTEND
// slot 26497
                        if slot <> 26497 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:392
//		DCA	UPBUFF +18D
// slot 26498
                        if slot <> 26498 or instruction <> 12503 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 215, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26501 {
                if slot <= 26499 {
// UPDATE_PROGRAM.agc:393
//		DAS	MPAC		# FORM SUM IN MPAC
// slot 26499
                    if slot <> 26499 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26500 {
// UPDATE_PROGRAM.agc:394
//		EXTEND
// slot 26500
                        if slot <> 26500 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:395
//		BZF	DELTATOK	# TEST FOR OVERFLOW
// slot 26501
                        if slot <> 26501 or instruction <> 6028 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6028, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26503 {
                    if slot <= 26502 {
// UPDATE_PROGRAM.agc:396
//		CAF	ZERO
// slot 26502
                        if slot <> 26502 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:397
//		DXCH	UPBUFF +18D	# OVERFLOW, RESTORE OLD VALUE OF CLOCK
// slot 26503
                        if slot <> 26503 or instruction <> 21719 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 215, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 26504 {
// UPDATE_PROGRAM.agc:398
//		DAS	TIME2		# AND TURN ON OPERATOR ERROR
// slot 26504
                        if slot <> 26504 or instruction <> 8213 { return choose false if checkOnly else -1. }
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
// slot 26505
                        if slot <> 26505 or instruction <> 2826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2826, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1531] to agcAotUnit1531@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:401
//		OCT	04026
// slot 26506
    26506, 4140
)).

// bank 27, slots 26507-26511
function agcAotUnit1532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26508 {
        if slot <= 26507 {
// UPDATE_PROGRAM.agc:402
//
// UPDATE_PROGRAM.agc:403
//		TC	UPTEMP		# GO TO ERROR EXIT
// slot 26507
            if slot <> 26507 or instruction <> 216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 216, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:404
//
// UPDATE_PROGRAM.agc:405
//DELTATOK	TC	TPAGREE		# FORCE SIGN AGREEMENT
// slot 26508
            if slot <> 26508 or instruction <> 3734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26509 {
// UPDATE_PROGRAM.agc:406
//		DXCH	MPAC
// slot 26509
            if slot <> 26509 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26510 {
// UPDATE_PROGRAM.agc:407
//		DAS	TIME2		# INCREMENT TIME2,TIME1
// slot 26510
                if slot <> 26510 or instruction <> 8213 { return choose false if checkOnly else -1. }
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
// slot 26511
                if slot <> 26511 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1532] to agcAotUnit1532@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:410
//		OCT	04026
// slot 26512
    26512, 4140
)).

// bank 27, slots 26513-26514
function agcAotUnit1533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26513 {
// UPDATE_PROGRAM.agc:411
//
// UPDATE_PROGRAM.agc:412
//		INHINT
// slot 26513
        if slot <> 26513 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// UPDATE_PROGRAM.agc:413
//		INDEX	UPTEMP		# (CODED THIS WAY FOR RESTART PROTECTION)
// slot 26514
        if slot <> 26514 or instruction <> 20696 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20696, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20696, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1533] to agcAotUnit1533@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:414
//		TC	1		# NORMAL RETURN
// slot 26515
    26515, 2
)).

// bank 27, slots 26516-26516
function agcAotUnit1534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// UPDATE_PROGRAM.agc:415
//
// UPDATE_PROGRAM.agc:416
//# VERB 71 BRANCH
// UPDATE_PROGRAM.agc:417
//
// UPDATE_PROGRAM.agc:418
//UPEND71		CAE	UPBUFF +1	# SET EBANK
// slot 26516
    if slot <> 26516 or instruction <> 12485 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 197).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1534] to agcAotUnit1534@.

// bank 27, slots 26517-26530
function agcAotUnit1535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26523 {
        if slot <= 26519 {
            if slot <= 26517 {
// UPDATE_PROGRAM.agc:419
//		TS	EBANK		#	AND
// slot 26517
                if slot <> 26517 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26518 {
// UPDATE_PROGRAM.agc:420
//# Page 1505
// UPDATE_PROGRAM.agc:421
//		MASK	LOW8		# CALCULATE
// slot 26518
                    if slot <> 26518 or instruction <> 30971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2299), 32768).
                        if fixedOperand = 255 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:422
//		TS	UPTEMP		# S-REG VALUE OF RECEIVING AREA
// slot 26519
                    if slot <> 26519 or instruction <> 22744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22744, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26521 {
                if slot <= 26520 {
// UPDATE_PROGRAM.agc:423
//
// UPDATE_PROGRAM.agc:424
//		AD	NEG3		# IN THE PROCESS OF
// slot 26520
                    if slot <> 26520 or instruction <> 28620 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:425
//		AD	COMPNUMB	# PERFORMING
// slot 26521
                    if slot <> 26521 or instruction <> 24768 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 192).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26522 {
// UPDATE_PROGRAM.agc:426
//		EXTEND			# THIS UPDATE
// slot 26522
                    if slot <> 26522 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:427
//		BZF	STORLP71	# WILL WE
// slot 26523
                    if slot <> 26523 or instruction <> 6049 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6049, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26526 {
            if slot <= 26524 {
// UPDATE_PROGRAM.agc:428
//		MASK	BIT9		# OVERFLOW
// slot 26524
                if slot <> 26524 or instruction <> 31239 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26525 {
// UPDATE_PROGRAM.agc:429
//		CCS	A		# INTO THE NEXT EBANK....
// slot 26525
                    if slot <> 26525 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:430
//		TCF	UPERROUT	# YES
// slot 26526
                    if slot <> 26526 or instruction <> 6122 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6122, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26528 {
                if slot <= 26527 {
// UPDATE_PROGRAM.agc:431
//
// UPDATE_PROGRAM.agc:432
//		CA	NEG3		# NO- CALCULATE NUMBER OF
// slot 26527
                    if slot <> 26527 or instruction <> 16332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4044), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:433
//		AD	COMPNUMB	# WORDS TO BE STORED MINUS ONE
// slot 26528
                    if slot <> 26528 or instruction <> 24768 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 192).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26529 {
// UPDATE_PROGRAM.agc:434
//STORLP71	TS	MPAC		# SAVE NO. OF WORDS REMAINING MINUS ONE
// slot 26529
                    if slot <> 26529 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:435
//		INDEX	A		# TAKE NEXT UPDATE WORD FROM
// slot 26530
                    if slot <> 26530 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1535] to agcAotUnit1535@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:436
//		CA	UPBUFF +2	# UPBUFF AND
// slot 26531
    26531, 24972
)).

// bank 27, slots 26532-26535
function agcAotUnit1536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26533 {
        if slot <= 26532 {
// UPDATE_PROGRAM.agc:437
//		TS	L		# SAVE IT IN L
// slot 26532
            if slot <> 26532 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:438
//		CA	MPAC		# CALCULATE NEXT
// slot 26533
            if slot <> 26533 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26534 {
// UPDATE_PROGRAM.agc:439
//		AD	UPTEMP		# RECEIVING ADDRESS
// slot 26534
            if slot <> 26534 or instruction <> 24792 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 216).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:440
//		INDEX	A
// slot 26535
            if slot <> 26535 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1536] to agcAotUnit1536@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:441
//		EBANK=	1400
// UPDATE_PROGRAM.agc:442
//		LXCH	1400		# UPDATE THE REGISTER  BY CONTENTS OF L
// slot 26536
    26536, 19968
)).

// bank 27, slots 26537-26539
function agcAotUnit1537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26537 {
// UPDATE_PROGRAM.agc:443
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:444
//		CCS	MPAC		# ARE THERE ANY WORDS LEFT TO BE STORED
// slot 26537
        if slot <> 26537 or instruction <> 4204 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 108).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 26538 {
// UPDATE_PROGRAM.agc:445
//		TCF	STORLP71	# YES
// slot 26538
            if slot <> 26538 or instruction <> 6049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:446
//		TCF	UPOUT		# NO- THEN EXIT UPDATE PROGRAM
// slot 26539
            if slot <> 26539 or instruction <> 6083 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6083, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1537] to agcAotUnit1537@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:447
//ADUPBFM1	ADRES	UPBUFF -1	# SAME AS ADUPBUFF BUT LESS 1 (DON'T MOVE)
// slot 26540
    26540, 390
)).

// bank 27, slots 26541-26550
function agcAotUnit1538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26545 {
        if slot <= 26542 {
            if slot <= 26541 {
// UPDATE_PROGRAM.agc:448
//		TCF	UPOUT		# NO- EXIT UPDATE(HERE WHEN COMPNUMB = 3)
// slot 26541
                if slot <> 26541 or instruction <> 6083 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6083, words[0], readEffective).
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
// slot 26542
                if slot <> 26542 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
            if slot <= 26543 {
// UPDATE_PROGRAM.agc:453
//		MASK	COMPNUMB	# BEEN SENT FOR A V72 UPDATE...
// slot 26543
                if slot <> 26543 or instruction <> 28864 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 192).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26544 {
// UPDATE_PROGRAM.agc:454
//		CCS	A
// slot 26544
                    if slot <> 26544 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
// slot 26545
                    if slot <> 26545 or instruction <> 6067 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6067, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26547 {
            if slot <= 26546 {
// UPDATE_PROGRAM.agc:456
//		TCF	UPERROUT	# ERROR- SHOULD BE ODD NO. OF COMPONENTS
// slot 26546
                if slot <> 26546 or instruction <> 6122 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:457
//		CS	BIT2
// slot 26547
                if slot <> 26547 or instruction <> 18958 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26548 {
// UPDATE_PROGRAM.agc:458
//		AD	COMPNUMB
// slot 26548
                if slot <> 26548 or instruction <> 24768 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 192).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26549 {
// UPDATE_PROGRAM.agc:459
//LDLOOP72	TS	MPAC		# NOW PERFORM THE UPDATE
// slot 26549
                    if slot <> 26549 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:460
//		INDEX	A
// slot 26550
                    if slot <> 26550 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1538] to agcAotUnit1538@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:461
//		CAE	UPBUFF +1	# PICK UP NEXT UPDATE WORD
// slot 26551
    26551, 24970
)).

// bank 27, slots 26552-26555
function agcAotUnit1539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26553 {
        if slot <= 26552 {
// UPDATE_PROGRAM.agc:462
//		LXCH	A
// slot 26552
            if slot <> 26552 or instruction <> 9216 { return choose false if checkOnly else -1. }
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
// slot 26553
            if slot <> 26553 or instruction <> 4204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26554 {
// UPDATE_PROGRAM.agc:464
//		TS	MPAC
// slot 26554
            if slot <> 26554 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// UPDATE_PROGRAM.agc:465
//		INDEX	A
// slot 26555
            if slot <> 26555 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1539] to agcAotUnit1539@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:466
//		CAE	UPBUFF +1	# PICK UP NEXT ECADR OF REG TO BE UPDATED
// slot 26556
    26556, 24970
)).

// bank 27, slots 26557-26559
function agcAotUnit1540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26557 {
// UPDATE_PROGRAM.agc:467
//		TS	EBANK		# SET EBANK
// slot 26557
        if slot <> 26557 or instruction <> 22531 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22531, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 26558 {
// UPDATE_PROGRAM.agc:468
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// slot 26558
            if slot <> 26558 or instruction <> 30971 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2299), 32768).
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
// slot 26559
            if slot <> 26559 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1540] to agcAotUnit1540@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:470
//
// UPDATE_PROGRAM.agc:471
//# Page 1506
// UPDATE_PROGRAM.agc:472
//		EBANK=	1400
// UPDATE_PROGRAM.agc:473
//		LXCH	1400		# UPDATE THE REGISTER BY CONTENTS OF L
// slot 26560
    26560, 19968
)).

// bank 27, slots 26561-26584
function agcAotUnit1541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26572 {
        if slot <= 26566 {
            if slot <= 26563 {
                if slot <= 26561 {
// UPDATE_PROGRAM.agc:474
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:475
//		CCS	MPAC		# ARE WE THORUGH THE V72 UPDATE...
// slot 26561
                    if slot <> 26561 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26562 {
// UPDATE_PROGRAM.agc:476
//		TCF	LDLOOP72	# NO
// slot 26562
                        if slot <> 26562 or instruction <> 6069 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6069, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:477
//
// UPDATE_PROGRAM.agc:478
//# NORMAL FINISH OF P27
// UPDATE_PROGRAM.agc:479
//
// UPDATE_PROGRAM.agc:480
//UPOUT		EQUALS
// UPDATE_PROGRAM.agc:481
//		TC	INTWAKEU	# RELEASE  GRAB  OF ORBITAL INTEGRATION
// slot 26563
                        if slot <> 26563 or instruction <> 1465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26564 {
// UPDATE_PROGRAM.agc:482
//	+1	CAE	UPOLDMOD	# RESTORE PRIOR P27 MODE
// slot 26564
                    if slot <> 26564 or instruction <> 12481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 193).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26565 {
// UPDATE_PROGRAM.agc:483
//		TC	NEWMODEX +3
// slot 26565
                        if slot <> 26565 or instruction <> 2799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:484
//		CAF	ZERO
// slot 26566
                        if slot <> 26566 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26569 {
                if slot <= 26567 {
// UPDATE_PROGRAM.agc:485
//		TS	DNLSTCOD
// slot 26567
                    if slot <> 26567 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26568 {
// UPDATE_PROGRAM.agc:486
//		TC	UPACTOFF	# TURN OFF 'UPLINK ACTIVITY' LIGHT
// slot 26568
                        if slot <> 26568 or instruction <> 2031 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2031, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:487
//
// UPDATE_PROGRAM.agc:488
//		EXTEND			# KILL GROUP 6
// slot 26569
                        if slot <> 26569 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26570 {
// UPDATE_PROGRAM.agc:489
//		DCA	NEG0
// slot 26570
                    if slot <> 26570 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26571 {
// UPDATE_PROGRAM.agc:490
//		DXCH	-PHASE6
// slot 26571
                        if slot <> 26571 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:491
//
// UPDATE_PROGRAM.agc:492
//		TC	ENDEXT		# EXTENDED VERB EXIT
// slot 26572
                        if slot <> 26572 or instruction <> 2908 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2908, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 26578 {
            if slot <= 26575 {
                if slot <= 26573 {
// UPDATE_PROGRAM.agc:493
//
// UPDATE_PROGRAM.agc:494
//# VERB 70 BRANCH
// UPDATE_PROGRAM.agc:495
//
// UPDATE_PROGRAM.agc:496
//UPEND70		EXTEND			# V70 DOES THE FOLLOWING WITH DP DELTA
// slot 26573
                    if slot <> 26573 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26574 {
// UPDATE_PROGRAM.agc:497
//		DCS	UPBUFF		# TIME IN UPBUFF
// slot 26574
                        if slot <> 26574 or instruction <> 16581 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 197, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:498
//		DXCH	UPBUFF +8D
// slot 26575
                        if slot <> 26575 or instruction <> 21709 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 205, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26576 {
// UPDATE_PROGRAM.agc:499
//		TC	TIMEDIDL	# DECREMENT AGC CLOCK
// slot 26576
                    if slot <> 26576 or instruction <> 1905 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1905, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26577 {
// UPDATE_PROGRAM.agc:500
//
// UPDATE_PROGRAM.agc:501
//		TC	UPERROUT	# ERROR WHILE DECREMENTING CLOCK -- EXIT
// slot 26577
                        if slot <> 26577 or instruction <> 2026 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2026, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:502
//
// UPDATE_PROGRAM.agc:503
//		EBANK=	TEPHEM
// UPDATE_PROGRAM.agc:504
//		EXTEND
// slot 26578
                        if slot <> 26578 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 26581 {
                if slot <= 26579 {
// UPDATE_PROGRAM.agc:505
//		DCS	UPBUFF		# COPY DECREMENTERS FOR
// slot 26579
                    if slot <> 26579 or instruction <> 16581 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 197, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26580 {
// UPDATE_PROGRAM.agc:506
//		DXCH	UPBUFF +10D	# RESTART PROTECTION
// slot 26580
                        if slot <> 26580 or instruction <> 21711 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 207, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:507
//		EXTEND
// slot 26581
                        if slot <> 26581 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 26582 {
// UPDATE_PROGRAM.agc:508
//		DCS	UPBUFF
// slot 26582
                    if slot <> 26582 or instruction <> 16581 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 197, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 26583 {
// UPDATE_PROGRAM.agc:509
//		DXCH	UPBUFF +12D
// slot 26583
                        if slot <> 26583 or instruction <> 21713 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 209, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// UPDATE_PROGRAM.agc:510
//
// UPDATE_PROGRAM.agc:511
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 26584
                        if slot <> 26584 or instruction <> 2826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2826, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1541] to agcAotUnit1541@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:512
//		OCT	04026
// slot 26585
    26585, 4140
)).

// bank 27, slots 26586-26599
function agcAotUnit1542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26592 {
        if slot <= 26588 {
            if slot <= 26586 {
// UPDATE_PROGRAM.agc:513
//
// UPDATE_PROGRAM.agc:514
//		CAF	ZERO
// slot 26586
                if slot <> 26586 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26587 {
// UPDATE_PROGRAM.agc:515
//		ZL
// slot 26587
                    if slot <> 26587 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:516
//		DXCH	UPBUFF +10D	# DECREMENT CSM STATE VECTOR TIME
// slot 26588
                    if slot <> 26588 or instruction <> 21711 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 207, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 26590 {
                if slot <= 26589 {
// UPDATE_PROGRAM.agc:517
//		DAS	TETCSM
// slot 26589
                    if slot <> 26589 or instruction <> 9081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 889) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:518
//
// UPDATE_PROGRAM.agc:519
//		CAF	ZERO
// slot 26590
                    if slot <> 26590 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26591 {
// UPDATE_PROGRAM.agc:520
//# Page 1507
// UPDATE_PROGRAM.agc:521
//		ZL
// slot 26591
                    if slot <> 26591 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:522
//		DXCH	UPBUFF +12D	# DECREMENT LEM STATE VECTOR TIME
// slot 26592
                    if slot <> 26592 or instruction <> 21713 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 209, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26595 {
            if slot <= 26593 {
// UPDATE_PROGRAM.agc:523
//		DAS	TETLEM
// slot 26593
                if slot <> 26593 or instruction <> 9123 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 931) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26594 {
// UPDATE_PROGRAM.agc:524
//
// UPDATE_PROGRAM.agc:525
//		CAF	ZERO
// slot 26594
                    if slot <> 26594 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:526
//		ZL
// slot 26595
                    if slot <> 26595 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
            if slot <= 26597 {
                if slot <= 26596 {
// UPDATE_PROGRAM.agc:527
//		DXCH	UPBUFF
// slot 26596
                    if slot <> 26596 or instruction <> 21701 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 197, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:528
//		DAS	TEPHEM +1	# INCREMENT TP TEPHEM
// slot 26597
                    if slot <> 26597 or instruction <> 9160 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 968) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 26598 {
// UPDATE_PROGRAM.agc:529
//		ADS	TEPHEM
// slot 26598
                    if slot <> 26598 or instruction <> 12230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 966).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:530
//
// UPDATE_PROGRAM.agc:531
//		TC	PHASCHNG	# RESTART PROTECT(GROUP 6)
// slot 26599
                    if slot <> 26599 or instruction <> 2826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2826, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1542] to agcAotUnit1542@.

agcAotInstallSourceRope(list(
// UPDATE_PROGRAM.agc:532
//		OCT 	04026
// slot 26600
    26600, 4140
)).

// bank 27, slots 26601-26610
function agcAotUnit1543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26605 {
        if slot <= 26602 {
            if slot <= 26601 {
// UPDATE_PROGRAM.agc:533
//
// UPDATE_PROGRAM.agc:534
//		EBANK=	UPBUFF
// UPDATE_PROGRAM.agc:535
//
// UPDATE_PROGRAM.agc:536
//		TC	UPOUT		# GO TO STANDARD UPDATE PROGRAM EXIT
// slot 26601
                if slot <> 26601 or instruction <> 1987 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1987, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:537
//
// UPDATE_PROGRAM.agc:538
//# ERROR SEQUENCE
// UPDATE_PROGRAM.agc:539
//
// UPDATE_PROGRAM.agc:540
//UPERROUT	TC	FALTON		# TURN ON *OPERATOR ERROR* LIGHT
// slot 26602
                if slot <> 26602 or instruction <> 2304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26603 {
// UPDATE_PROGRAM.agc:541
//		TCF	UPOUT		# GO TO COMMON UPDATE PROGRAM EXIT
// slot 26603
                if slot <> 26603 or instruction <> 6083 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6083, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26604 {
// UPDATE_PROGRAM.agc:542
//
// UPDATE_PROGRAM.agc:543
//	+2	TC	FALTON		# TURN ON 'OPERATOR ERROR' LIGHT
// slot 26604
                    if slot <> 26604 or instruction <> 2304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2304, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// UPDATE_PROGRAM.agc:544
//		TC	UPACTOFF	# TURN OFF'UPLINK ACTIVITY'LIGHT
// slot 26605
                    if slot <> 26605 or instruction <> 2031 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2031, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 26607 {
            if slot <= 26606 {
// UPDATE_PROGRAM.agc:545
//		TC	ENDEXT		# EXTENDED VERB EXIT
// slot 26606
                if slot <> 26606 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// UPDATE_PROGRAM.agc:546
//					# (THE PURPOSE OF UPERROUT +2 EXIT IS
// UPDATE_PROGRAM.agc:547
//					# TO PROVIDE AN ERROR EXIT WHICH DOES NOT
// UPDATE_PROGRAM.agc:548
//					# RESET ANY RESTART GROUPS)
// UPDATE_PROGRAM.agc:549
//
// UPDATE_PROGRAM.agc:550
//# :UPACTOFF: IS A ROUTINE TO TURN OFF UPLINK ACTIVITY LIGHT ON ALL EXITS FROM UPDATE PROGRAM(P27).
// UPDATE_PROGRAM.agc:551
//
// UPDATE_PROGRAM.agc:552
//UPACTOFF	CS	BIT3
// slot 26607
                if slot <> 26607 or instruction <> 18957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26608 {
// UPDATE_PROGRAM.agc:553
//		EXTEND			# TURN OFF UPLINK ACTIVITY LIGHT
// slot 26608
                if slot <> 26608 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 26609 {
// UPDATE_PROGRAM.agc:554
//		WAND	DSALMOUT	# (BIT 3 OF CHANNEL 11)
// slot 26609
                    if slot <> 26609 or instruction <> 1545 { return choose false if checkOnly else -1. }
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
// slot 26610
                    if slot <> 26610 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1543] to agcAotUnit1543@.

