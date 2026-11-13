// DOWN_TELEMETRY_PROGRAM.agc
// bank 05, slots 8006-8020
function agcAotUnit447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8012 {
        if slot <= 8008 {
            if slot <= 8006 {
// DOWN_TELEMETRY_PROGRAM.agc:1
//# Copyright:	Public domain.
// DOWN_TELEMETRY_PROGRAM.agc:2
//# Filename:	DOWN_TELEMETRY_PROGRAM.agc
// DOWN_TELEMETRY_PROGRAM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// DOWN_TELEMETRY_PROGRAM.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// DOWN_TELEMETRY_PROGRAM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// DOWN_TELEMETRY_PROGRAM.agc:6
//# Assembler:	yaYUL
// DOWN_TELEMETRY_PROGRAM.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// DOWN_TELEMETRY_PROGRAM.agc:8
//# Website:	www.ibiblio.org/apollo.
// DOWN_TELEMETRY_PROGRAM.agc:9
//# Pages:	988-997
// DOWN_TELEMETRY_PROGRAM.agc:10
//# Mod history:	2009-05-24 RSB	Adapted from the corresponding
// DOWN_TELEMETRY_PROGRAM.agc:11
//#				Luminary131 file, using page
// DOWN_TELEMETRY_PROGRAM.agc:12
//#				images from Luminary 1A.
// DOWN_TELEMETRY_PROGRAM.agc:13
//#
// DOWN_TELEMETRY_PROGRAM.agc:14
//# This source code has been transcribed or otherwise adapted from
// DOWN_TELEMETRY_PROGRAM.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// DOWN_TELEMETRY_PROGRAM.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// DOWN_TELEMETRY_PROGRAM.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// DOWN_TELEMETRY_PROGRAM.agc:18
//# in storage size and consequent reduction in image quality as well) are
// DOWN_TELEMETRY_PROGRAM.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// DOWN_TELEMETRY_PROGRAM.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// DOWN_TELEMETRY_PROGRAM.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// DOWN_TELEMETRY_PROGRAM.agc:22
//# actually created.
// DOWN_TELEMETRY_PROGRAM.agc:23
//#
// DOWN_TELEMETRY_PROGRAM.agc:24
//# Notations on the hardcopy document read, in part:
// DOWN_TELEMETRY_PROGRAM.agc:25
//#
// DOWN_TELEMETRY_PROGRAM.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// DOWN_TELEMETRY_PROGRAM.agc:27
//#	16:27 JULY 14, 1969
// DOWN_TELEMETRY_PROGRAM.agc:28
//
// DOWN_TELEMETRY_PROGRAM.agc:29
//# Page 988
// DOWN_TELEMETRY_PROGRAM.agc:30
//# PROGRAM NAME -- DOWN TELEMETRY PROGRAM
// DOWN_TELEMETRY_PROGRAM.agc:31
//# MOD NO. -- 0		TO COMPLETELY REWRITE THE DOWN TELEMETRY PROGRAM AND DOWNLINK ERASABLE DUMP PROGRAM FOR THE
// DOWN_TELEMETRY_PROGRAM.agc:32
//#			PURPOSE OF SAVING APPROXIMATELY 150 WORDS OF CORE STORAGE.
// DOWN_TELEMETRY_PROGRAM.agc:33
//#			THIS CHANGE REQUIRES AN ENTIRELY NEW METHOD OF SPECIFYING DOWNLINK LISTS.  REFER TO DOWNLINK
// DOWN_TELEMETRY_PROGRAM.agc:34
//#			LISTS LOG SECTION FOR MORE DETAILS.  HOWEVER THIS CHANGE WILL NOT AFFECT THE GROUND PROCESSING
// DOWN_TELEMETRY_PROGRAM.agc:35
//#			OF DOWN TELEMETRY DATA.
// DOWN_TELEMETRY_PROGRAM.agc:36
//# MOD BY -- KILROY KERMAN, SMITH KERMAN, DEWITT KERMAN
// DOWN_TELEMETRY_PROGRAM.agc:37
//# DATE -- 02 OCT 67
// DOWN_TELEMETRY_PROGRAM.agc:38
//# AUTHORS -- KILROY KERMAN, SMITH KERMAN, DWWITT KERMAN, DEWOLF KERMAN, FAGIN KERMAN
// DOWN_TELEMETRY_PROGRAM.agc:39
//# LOG SECTION -- DOWN-TELEMETRY PROGRAM
// DOWN_TELEMETRY_PROGRAM.agc:40
//#
// DOWN_TELEMETRY_PROGRAM.agc:41
//# FUNCTIONAL DESCRIPTION -- THIS ROUTINE IS INITIATED BY TELEMETRY END
// DOWN_TELEMETRY_PROGRAM.agc:42
//#	PULSE FROM THE DOWNLINK TELEMETRY CONVERTER.  THIS PULSE OCCURS
// DOWN_TELEMETRY_PROGRAM.agc:43
//#	AT 50 TIMES PER SEC (EVERY 20 MS) THEREFORE DODOWNTM IS
// DOWN_TELEMETRY_PROGRAM.agc:44
//#	EXECUTED AT THESE RATES.  THIS ROUTINE SELECTS THE APPROPRIATE
// DOWN_TELEMETRY_PROGRAM.agc:45
//#	AGC DATA TO BE TRANSMITTED DOWNLINK AND LOADS IT INTO OUTPUT
// DOWN_TELEMETRY_PROGRAM.agc:46
//#	CHANNELS 34 AND 35.  THE INFORMATION IS THEN GATED OUT FROM THE
// DOWN_TELEMETRY_PROGRAM.agc:47
//#	LGC IN SERIAL FASHION.
// DOWN_TELEMETRY_PROGRAM.agc:48
//#
// DOWN_TELEMETRY_PROGRAM.agc:49
//#	THIS PROGRAM IS CODED FOR A 2 SECOND DOWNLIST.  SINCE DOWNRUPTS
// DOWN_TELEMETRY_PROGRAM.agc:50
//#	OCCUR EVERY 20 MS AND 2 AGC COMPUTER WORDS CAN BE PLACED IN
// DOWN_TELEMETRY_PROGRAM.agc:51
//#	CHANNELS 34 AND 35 DURING EACH DOWNRUPT THE PROGRAM IS CAPABLE
// DOWN_TELEMETRY_PROGRAM.agc:52
//# 	OF SENDING 200 AGC WORDS EVERY 2 SECONDS.
// DOWN_TELEMETRY_PROGRAM.agc:53
//#
// DOWN_TELEMETRY_PROGRAM.agc:54
//# CALLING SEQUENCE -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:55
//#	PROGRAM IS ENTERED VIA TCF DODOWNTM WHICH IS EXECUTED AS A
// DOWN_TELEMETRY_PROGRAM.agc:56
//#	RESULT OF A DOWNRUPT.  CONTROL IS RETURNED VIA TCF RESUME WHICH
// DOWN_TELEMETRY_PROGRAM.agc:57
//#	IN EFFECT IS A RESUME.
// DOWN_TELEMETRY_PROGRAM.agc:58
//#
// DOWN_TELEMETRY_PROGRAM.agc:59
//# SUBROUTINES CALLED -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:60
//#
// DOWN_TELEMETRY_PROGRAM.agc:61
//# NORMAL EXIT MODE -- TCF RESUME
// DOWN_TELEMETRY_PROGRAM.agc:62
//#
// DOWN_TELEMETRY_PROGRAM.agc:63
//# ALARM OR ABORT EXIT MODE -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:64
//#
// DOWN_TELEMETRY_PROGRAM.agc:65
//# RESTART PROTECTION:
// DOWN_TELEMETRY_PROGRAM.agc:66
//#	ON A FRESH START AND RESTART THE `STARTSUB' SUBROUTINE WILL INITIALIZE THE DOWNLIST POINTER (ACTUALLY
// DOWN_TELEMETRY_PROGRAM.agc:67
//#	DNTMGOTO) TO THE BEGINNING OF THE CURRENT DOWNLIST (I.E., CURRENT CONTENTS OF DNLSTADR).  THIS HAS THE
// DOWN_TELEMETRY_PROGRAM.agc:68
//#	EFFECT OF IGNORING THE REMAINDER OF THE DOWNLIST WHICH THE DOWN-TELEMETRY PROGRAM WAS WORKING ON WHEN
// DOWN_TELEMETRY_PROGRAM.agc:69
//#	THE RESTART (OR FRESH START) OCCURRED AND RESUME DOWN TELEMETRY FROM THE BEGINNING OF THE CURRENT
// DOWN_TELEMETRY_PROGRAM.agc:70
//#	DOWNLIST.
// DOWN_TELEMETRY_PROGRAM.agc:71
//#
// DOWN_TELEMETRY_PROGRAM.agc:72
//#	ALSO OF INTEREST IS THE FACT THAT ON A RESTART THE AGC WILL ZERO DOWNLINK CHANNELS 13, 34 AND 35.
// DOWN_TELEMETRY_PROGRAM.agc:73
//#
// DOWN_TELEMETRY_PROGRAM.agc:74
//# DOWNLINK LIST SELECTION:
// DOWN_TELEMETRY_PROGRAM.agc:75
//#	THE APPROPRIATE DOWNLINK LISTS ARE SELECTED BY THE FOLLOWING:
// DOWN_TELEMETRY_PROGRAM.agc:76
//#	1.	FRESH START
// DOWN_TELEMETRY_PROGRAM.agc:77
//#	2.	V37EXXE WHERE XX = THE MAJOR MODE BEING SELECTED.
// DOWN_TELEMETRY_PROGRAM.agc:78
//#	3.	UPDATE PROGRAM (P27)
// DOWN_TELEMETRY_PROGRAM.agc:79
//#	4.	NON-V37 SELECTABLE TYPE PROGRAMS (E.G., AGS INITIALIZATION (SUNDANCE, LUMINARY) AND P61-P62
// DOWN_TELEMETRY_PROGRAM.agc:80
//#		TRANSITION (COLOSSUS) ETC.).
// DOWN_TELEMETRY_PROGRAM.agc:81
//#
// DOWN_TELEMETRY_PROGRAM.agc:82
//# DOWNLINK LIST RULES AND LIMITATIONS:
// DOWN_TELEMETRY_PROGRAM.agc:83
//#	READ SECTION(S) WHICH FOLLOW `DEBRIS' WRITEUP.
// DOWN_TELEMETRY_PROGRAM.agc:84
//#
// DOWN_TELEMETRY_PROGRAM.agc:85
//# OUTPUT -- EVERY 2 SECONDS 100 DOUBLE PRECISION WORDS (I.E., 200 LGC
// DOWN_TELEMETRY_PROGRAM.agc:86
//#	COMPUTER WORDS) ARE TRANSMITTED VIA DOWNLINK.
// DOWN_TELEMETRY_PROGRAM.agc:87
//#
// DOWN_TELEMETRY_PROGRAM.agc:88
//# ERASABLE INITIALIZATION REQUIRED -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:89
//#	`DNTMGOTO' AND `DNLSTADR' ARE INITIALIZED BY THE FRESH START PROGRAM.
// DOWN_TELEMETRY_PROGRAM.agc:90
//#
// DOWN_TELEMETRY_PROGRAM.agc:91
//# DEBRIS (ERASABLE LOCATIONS DESTROYED BY THIS PROGRAM) --
// DOWN_TELEMETRY_PROGRAM.agc:92
//#	LDATALST, DNTMBUFF TO DNTMBUFF +21D, TMINDEX, DNQ.
// DOWN_TELEMETRY_PROGRAM.agc:93
//# Page 989 (empty page)
// DOWN_TELEMETRY_PROGRAM.agc:94
//# Page 990
// DOWN_TELEMETRY_PROGRAM.agc:95
//# DODOWNTM IS ENTERED EVERY 20 MS BY AN INTERRUPT TRIGGERED BY THE
// DOWN_TELEMETRY_PROGRAM.agc:96
//# RECEIPT OF AN ENDPULSE FROM THE SPACECRAFT TELEMETRY PROGRAMMER.
// DOWN_TELEMETRY_PROGRAM.agc:97
//#
// DOWN_TELEMETRY_PROGRAM.agc:98
//# NOTES REGARDING DOWNLINK LISTS ASSOCIATED WITH THIS PROGRAM:
// DOWN_TELEMETRY_PROGRAM.agc:99
//# 1.	DOWNLISTS.  DOWNLISTS MUST BE COMPILED IN THE SAME BANK AS THE
// DOWN_TELEMETRY_PROGRAM.agc:100
//#	DOWN-TELEMETRY PROGRAM.  THIS IS DONE FOR EASE OF CODING, FASTER
// DOWN_TELEMETRY_PROGRAM.agc:101
//#	EXECUTION.
// DOWN_TELEMETRY_PROGRAM.agc:102
//# 2.	EACH DOWNLINK LIST CONSISTS OF A CONTROL LIST AND A NUMBER OF
// DOWN_TELEMETRY_PROGRAM.agc:103
//#	SUBLISTS.
// DOWN_TELEMETRY_PROGRAM.agc:104
//# 3.	A SUBLIST REFERS TO A SNAPSHOT OR DATA COMMON TO THE SAME OR OTHER
// DOWN_TELEMETRY_PROGRAM.agc:105
//#	DOWNLINK LISTS.  ANY SUBLIST CONTAINING COMMON DATA NEEDS TO BE
// DOWN_TELEMETRY_PROGRAM.agc:106
//#	CODED ONLY ONCE FOR THE APPLICABLE DOWNLINK LISTS.
// DOWN_TELEMETRY_PROGRAM.agc:107
//# 4.	SNAPSHOT SUBLISTS REFER SPECIFICALLY TO HOMOGENEOUS DATA WHICH MUST BE
// DOWN_TELEMETRY_PROGRAM.agc:108
//#	SAVED IN A BUFFER DURING ONE DOWNRUPT.
// DOWN_TELEMETRY_PROGRAM.agc:109
//# 5.	THE 1DNADR FOR THE 1ST WORD OF SNAPSHOT DATA IS FOUND AT THE END
// DOWN_TELEMETRY_PROGRAM.agc:110
//#	OF EACH SNAPSHOT SUBLIST, SINCE THE PROGRAM CODING SENDS THIS DP WORD
// DOWN_TELEMETRY_PROGRAM.agc:111
//#	IMMEDIATELY AFTER STORING THE OTHERS IN THE SNAPSHOT BUFFER.
// DOWN_TELEMETRY_PROGRAM.agc:112
//# 6.	ALL LISTS ARE COMBINATIONS OF CODED ERASABLE ADDRESS CONSTANTS
// DOWN_TELEMETRY_PROGRAM.agc:113
//#	CREATED FOR THE DOWNLIST PROGRAM.
// DOWN_TELEMETRY_PROGRAM.agc:114
//#	A.	1DNADR			1-WORD DOWNLIST ADDRESS.
// DOWN_TELEMETRY_PROGRAM.agc:115
//#		SAME AS ECADR, BUT USED WHEN THE WORD ADDRESSED IS THE LEFT
// DOWN_TELEMETRY_PROGRAM.agc:116
//#		HALF OF A DOUBLE-PRECISION WORD FOR DOWN TELEMETRY.
// DOWN_TELEMETRY_PROGRAM.agc:117
//#	B.	2DNADR - 6DNADR		N-WORD DOWNLIST ADDRESS, N = 2 - 6.
// DOWN_TELEMETRY_PROGRAM.agc:118
//#		SAME AS 1DNADR, BUT WITH THE 4 UNUSED BITS OF THE ECADR FORMAT
// DOWN_TELEMETRY_PROGRAM.agc:119
//#		FILLED IN WITH 0001-0101.  USED TO POINT TO A LIST OF N DOUBLE-
// DOWN_TELEMETRY_PROGRAM.agc:120
//#		PRECISION WORDS, STORED CONSECUTIVELY, FOR DOWN TELEMETRY.
// DOWN_TELEMETRY_PROGRAM.agc:121
//#	C.	DNCHAN			DOWNLIST CHANNEL ADDRESS.
// DOWN_TELEMETRY_PROGRAM.agc:122
//#		SAME AS 1DNADR, BUT WITH PREFIX BITS 0111.  USED TO POINT TO
// DOWN_TELEMETRY_PROGRAM.agc:123
//#		A PAIR OF CHANNELS FOR DOWN TELEMETRY.
// DOWN_TELEMETRY_PROGRAM.agc:124
//#	D.	DNPTR			DOWN-TELEMETRY SUBLIST POINTER.
// DOWN_TELEMETRY_PROGRAM.agc:125
//#		SAME AS CAF BUT TAGGED AS A CONSTANT.  USED IN CONTROL LIST TO POINT TO A SUBLIST.
// DOWN_TELEMETRY_PROGRAM.agc:126
//#		CAUTION --- A DNPTR CANNOT BE USED IN A SUBLIST.
// DOWN_TELEMETRY_PROGRAM.agc:127
//# 7.	THE WORD ORDER CODE IS SET TO ZERO AT THE BEGINNING OF EACH DOWNLIST (I.E., CONTROL LIST) AND WHEN
// DOWN_TELEMETRY_PROGRAM.agc:128
//#	A `1DNADR TIME2' IS DETECTED IN THE CONTROL LIST (ONLY).
// DOWN_TELEMETRY_PROGRAM.agc:129
//# 8.	IN THE SNAPSHOT SUBLIST ONLY, THE DNADR'S CANNOT POINT TO THE FIRST WORD OF ANY EBANK.
// DOWN_TELEMETRY_PROGRAM.agc:130
//#
// DOWN_TELEMETRY_PROGRAM.agc:131
//# DOWNLIST LIST RESTRICTIONS:
// DOWN_TELEMETRY_PROGRAM.agc:132
//# (THE FOLLOWING POINTS MAY BE LISTED ELSEWHERE BUT ARE LISTED HERE SO IT IS CLEAR THAT THESE THINGS CANNOT BE
// DOWN_TELEMETRY_PROGRAM.agc:133
//# DONE)
// DOWN_TELEMETRY_PROGRAM.agc:134
//# 1.	SNAPSHOT DOWNLIST:
// DOWN_TELEMETRY_PROGRAM.agc:135
//#	(A) CANNOT CONTAIN THE FOLLOWING ECADRS (I.E., 1DNADR'S): Q, 400, 1000, 1400, 2000, 2400, 3000, 3400.
// DOWN_TELEMETRY_PROGRAM.agc:136
//#	(B) CAN CONTAIN ONLY 1DNADR'S
// DOWN_TELEMETRY_PROGRAM.agc:137
//# 2.	ALL DOWNLINKED DATA (EXCEPT CHANNELS) IS PICKED UP BY A DCA SO DOWNLINK LISTS CANNOT CONTAIN THE
// DOWN_TELEMETRY_PROGRAM.agc:138
//#	EQUIVALENT OF THE FOLLOWING ECADRS (I.E., 1DNADRS): 377, 777, 1377, 1777, 2377, 2777, 3377, 3777.
// DOWN_TELEMETRY_PROGRAM.agc:139
//# 	(NOTE: THE TERM `EQUIVALENT' MEANT THAT THE 1DNADR TO 6DNADR WILL BE PROCESSED LIKE 1 TO 6 ECADRS)
// DOWN_TELEMETRY_PROGRAM.agc:140
//# 3.	CONTROL LISTS AND SUBLISTS CANNOT HAVE ENTRIES = OCTAL 00000 OR OCTAL 77777
// DOWN_TELEMETRY_PROGRAM.agc:141
//# Page 991
// DOWN_TELEMETRY_PROGRAM.agc:142
//# 4.	THE `1DNADR TIME2' WHICH WILL CAUSE THE DOWNLINK PROGRAM TO SET THE WORDER CODE TO 3 MUST APPEAR IN THE
// DOWN_TELEMETRY_PROGRAM.agc:143
//#	CONTROL SECTION OF THE DOWNLIST.
// DOWN_TELEMETRY_PROGRAM.agc:144
//# 5.	`DNCHAN 0' CANNOT BE USED.
// DOWN_TELEMETRY_PROGRAM.agc:145
//# 6.	`DNPTR 0' CANNOT BE USED.
// DOWN_TELEMETRY_PROGRAM.agc:146
//# 7.	DNPTR CANNOT APPEAR IN A SUBLIST.
// DOWN_TELEMETRY_PROGRAM.agc:147
//#
// DOWN_TELEMETRY_PROGRAM.agc:148
//# EBANK SETTINGS
// DOWN_TELEMETRY_PROGRAM.agc:149
//#	IN THE PROCESS OF SETTING THE EBANK (WHEN PICKING UP DOWNLINK DATA) THE DOWN TELEMETRY PROGRAM PUTS
// DOWN_TELEMETRY_PROGRAM.agc:150
//#	`GARBAGE' INTO BITS15-12 OF EBANK.  BLAIR-SMITH KERMAN WARNS US THAT BITS15-12 OF EBANK MAY BECOME
// DOWN_TELEMETRY_PROGRAM.agc:151
//#	SIGNIFICANT SOMEDAY IN THE FUTURE.  IF/WHEN THAT HAPPENS, THE PROGRAM SHOULD INSURE (BY MASKING ETC.)
// DOWN_TELEMETRY_PROGRAM.agc:152
//#	THAT BITS 15-12 OF EBANK ARE ZERO.
// DOWN_TELEMETRY_PROGRAM.agc:153
//#
// DOWN_TELEMETRY_PROGRAM.agc:154
//# INITIALIZATION REQUIRED -- TO INTERRUPT CURRENT LIST AND START A NEW ONE.
// DOWN_TELEMETRY_PROGRAM.agc:155
//#	1. ADRES OF DOWNLINK LIST INTO DNLSTADR
// DOWN_TELEMETRY_PROGRAM.agc:156
//#	2. NEGONE INTO SUBLIST
// DOWN_TELEMETRY_PROGRAM.agc:157
//#	3. NEGONE INTO DNECADR
// DOWN_TELEMETRY_PROGRAM.agc:158
//
// DOWN_TELEMETRY_PROGRAM.agc:159
//		BANK	22
// DOWN_TELEMETRY_PROGRAM.agc:160
//		SETLOC	DOWNTELM
// DOWN_TELEMETRY_PROGRAM.agc:161
//		BANK
// DOWN_TELEMETRY_PROGRAM.agc:162
//
// DOWN_TELEMETRY_PROGRAM.agc:163
//		EBANK=	DNTMBUFF
// DOWN_TELEMETRY_PROGRAM.agc:164
//
// DOWN_TELEMETRY_PROGRAM.agc:165
//		COUNT*	$$/DPROG
// DOWN_TELEMETRY_PROGRAM.agc:166
//DODOWNTM	TS	BANKRUPT
// slot 8006
                if slot <> 8006 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8007 {
// DOWN_TELEMETRY_PROGRAM.agc:167
//		EXTEND
// slot 8007
                    if slot <> 8007 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:168
//		QXCH	QRUPT		# SAVE Q
// slot 8008
                    if slot <> 8008 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8010 {
                if slot <= 8009 {
// DOWN_TELEMETRY_PROGRAM.agc:169
//		TCF	WOTEST
// slot 8009
                    if slot <> 8009 or instruction <> 6131 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6131, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:170
//WO1		EXTEND			# SET WORD ORDER BIT TO 1 ONLY IF IT
// slot 8010
                    if slot <> 8010 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8011 {
// DOWN_TELEMETRY_PROGRAM.agc:171
//		WOR	CHAN13		# ALREADY ISN'T
// slot 8011
                    if slot <> 8011 or instruction <> 2571 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:172
//		TC	DNTMGOTO	# GOTO APPROPRIATE PHASE OF PROGRAM
// slot 8012
                    if slot <> 8012 or instruction <> 221 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 221, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8016 {
            if slot <= 8014 {
                if slot <= 8013 {
// DOWN_TELEMETRY_PROGRAM.agc:173
//
// DOWN_TELEMETRY_PROGRAM.agc:174
//DNPHASE1	CA	NEGONE		# INITIALIZE ALL CONTROL WORDS
// slot 8013
                    if slot <> 8013 or instruction <> 16359 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:175
//		TS	SUBLIST		# WORDS TO MINUS ONE
// slot 8014
                    if slot <> 8014 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8015 {
// DOWN_TELEMETRY_PROGRAM.agc:176
//		TS	DNECADR
// slot 8015
                    if slot <> 8015 or instruction <> 22750 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22750, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:177
//		CA	LDNPHAS2	# SET DNTMGOTO = 0 ALL SUSEQUENT DOWRUPTS
// slot 8016
                    if slot <> 8016 or instruction <> 14240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1952), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8018 {
                if slot <= 8017 {
// DOWN_TELEMETRY_PROGRAM.agc:178
//		TS	DNTMGOTO	# GO TO DNPHASE2
// slot 8017
                    if slot <> 8017 or instruction <> 22749 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22749, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:179
//		TCF	NEWLIST
// slot 8018
                    if slot <> 8018 or instruction <> 5982 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5982, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8019 {
// DOWN_TELEMETRY_PROGRAM.agc:180
//DNPHASE2	CCS	DNECADR		# SENDING OF DATA IN PROGRESS
// slot 8019
                    if slot <> 8019 or instruction <> 4318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 222).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:181
//DODNADR		TC	FETCH2WD	# YES -- THEN FETCH THE NEXT 2 SP WORDS
// slot 8020
                    if slot <> 8020 or instruction <> 1963 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1963, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[447] to agcAotUnit447@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:182
//MINTIME2	-1DNADR	TIME2		# NEGATIVE OF TIME2 1DNADR
// slot 8021
    8021, 65494
)).

// bank 05, slots 8022-8024
function agcAotUnit448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8022 {
// DOWN_TELEMETRY_PROGRAM.agc:183
//		TCF	+1		# (ECADR OF 3776 + 74001 = 77777)
// slot 8022
        if slot <> 8022 or instruction <> 5975 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5975, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8023 {
// DOWN_TELEMETRY_PROGRAM.agc:184
//
// DOWN_TELEMETRY_PROGRAM.agc:185
//		CCS	SUBLIST		# IS THE SUBLIST IN CONTROL
// slot 8023
            if slot <> 8023 or instruction <> 4319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 223).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:186
//		TCF	NEXTINSL	# YES
// slot 8024
            if slot <> 8024 or instruction <> 6070 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6070, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[448] to agcAotUnit448@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:187
//# Page 992
// DOWN_TELEMETRY_PROGRAM.agc:188
//DNADRDCR	OCT	74001		# DNADR COUNT AND ECADR DECREMENTER
// slot 8025
    8025, 61442
)).

// bank 05, slots 8026-8030
function agcAotUnit449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8027 {
        if slot <= 8026 {
// DOWN_TELEMETRY_PROGRAM.agc:189
//
// DOWN_TELEMETRY_PROGRAM.agc:190
//CHKLIST		CA	CTLIST
// slot 8026
            if slot <> 8026 or instruction <> 12508 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 220).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:191
//		EXTEND
// slot 8027
            if slot <> 8027 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8028 {
// DOWN_TELEMETRY_PROGRAM.agc:192
//		BZMF	NEWLIST		# IT WILL BE NEGATIVE AT END OF LIST
// slot 8028
            if slot <> 8028 or instruction <> 26462 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8029 {
// DOWN_TELEMETRY_PROGRAM.agc:193
//		TCF	NEXTINCL
// slot 8029
                if slot <> 8029 or instruction <> 5987 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5987, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:194
//NEWLIST		INDEX	DNLSTCOD
// slot 8030
                if slot <> 8030 or instruction <> 20698 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20698, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20698, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[449] to agcAotUnit449@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:195
//		CA	DNTABLE		# INITIALIZE CTLIST WITH
// slot 8031
    8031, 27202
)).

// bank 05, slots 8032-8035
function agcAotUnit450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8033 {
        if slot <= 8032 {
// DOWN_TELEMETRY_PROGRAM.agc:196
//		TS	CTLIST		#	STARTING ADDRESS OF NEW LIST
// slot 8032
            if slot <> 8032 or instruction <> 22748 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22748, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:197
//		CS	DNLSTCOD
// slot 8033
            if slot <> 8033 or instruction <> 16602 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 218).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8034 {
// DOWN_TELEMETRY_PROGRAM.agc:198
//		TCF	SENDID 	+3
// slot 8034
            if slot <> 8034 or instruction <> 6126 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6126, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:199
//NEXTINCL	INDEX	CTLIST
// slot 8035
            if slot <> 8035 or instruction <> 20700 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20700, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20700, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[450] to agcAotUnit450@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:200
//		CA	0
// slot 8036
    8036, 24576
)).

// bank 05, slots 8037-8047
function agcAotUnit451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8041 {
        if slot <= 8038 {
            if slot <= 8037 {
// DOWN_TELEMETRY_PROGRAM.agc:201
//		CCS	A
// slot 8037
                if slot <> 8037 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:202
//		INCR	CTLIST		# SET POINTER TO PICK UP NEXT CTLIST WORD
// slot 8038
                if slot <> 8038 or instruction <> 10460 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 220).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8039 {
// DOWN_TELEMETRY_PROGRAM.agc:203
//		TCF	+4		# ON NEXT ENTRY TO PROG.  (A SHOULD NOT =0)
// slot 8039
                if slot <> 8039 or instruction <> 5995 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5995, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8040 {
// DOWN_TELEMETRY_PROGRAM.agc:204
//		XCH	CTLIST		# SET CTLIST TO NEGATIVE AND PLACE(CODING)
// slot 8040
                    if slot <> 8040 or instruction <> 23772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 220, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:205
//		COM			# UNCOMPLEMENTED DNADR INTO A.    (FOR LA)
// slot 8041
                    if slot <> 8041 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8044 {
            if slot <= 8042 {
// DOWN_TELEMETRY_PROGRAM.agc:206
//		XCH	CTLIST		#                                 (ST IN )
// slot 8042
                if slot <> 8042 or instruction <> 23772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 220, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8043 {
// DOWN_TELEMETRY_PROGRAM.agc:207
// +4		INCR	A		#                                 (CTLIST)
// slot 8043
                    if slot <> 8043 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:208
// 		TS	DNECADR		# SAVE DNADR
// slot 8044
                    if slot <> 8044 or instruction <> 22750 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22750, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8045 {
// DOWN_TELEMETRY_PROGRAM.agc:209
//		AD	MINTIME2	# TEST FOR TIME2 (NEG. OF ECADR)
// slot 8045
                if slot <> 8045 or instruction <> 26453 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1877), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8046 {
// DOWN_TELEMETRY_PROGRAM.agc:210
//		CCS	A
// slot 8046
                    if slot <> 8046 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:211
//		TCF	SETWO	+1	# DON'T SET WORD ORDER CODE
// slot 8047
                    if slot <> 8047 or instruction <> 6003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6003, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[451] to agcAotUnit451@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:212
//MINB1314	OCT	47777		# MINUS BIT 13 AND 14 (CAN'T GET HERE)
// slot 8048
    8048, 40958
)).

// bank 05, slots 8049-8059
function agcAotUnit452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8053 {
        if slot <= 8050 {
            if slot <= 8049 {
// DOWN_TELEMETRY_PROGRAM.agc:213
//		TCF	SETWO 	+1	# DON'T SET WORD ORDER CODE
// slot 8049
                if slot <> 8049 or instruction <> 6003 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6003, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:214
//SETWO		TC	WOZERO		# GO SET WORD ORDER CODE TO ZERO.
// slot 8050
                if slot <> 8050 or instruction <> 1925 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1925, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8051 {
// DOWN_TELEMETRY_PROGRAM.agc:215
// +1		CA	DNECADR		# RELOAD A WITH THE DNADR.
// slot 8051
                if slot <> 8051 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8052 {
// DOWN_TELEMETRY_PROGRAM.agc:216
// +2		AD	MINB1314	# IS THIS A REGULAR DNADR?
// slot 8052
                    if slot <> 8052 or instruction <> 26480 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1904), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:217
// 		EXTEND
// slot 8053
                    if slot <> 8053 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8056 {
            if slot <= 8054 {
// DOWN_TELEMETRY_PROGRAM.agc:218
//		BZMF	FETCH2WD	# YES.  (A MUST NEVER BE ZERO)
// slot 8054
                if slot <> 8054 or instruction <> 26539 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26539, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8055 {
// DOWN_TELEMETRY_PROGRAM.agc:219
//		AD	MINB12		# NO.  IS IT A POINTER (DNPTR) OR A
// slot 8055
                    if slot <> 8055 or instruction <> 28641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4065), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:220
//		EXTEND			#	CHANNEL(DNCHAN)
// slot 8056
                    if slot <> 8056 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8057 {
// DOWN_TELEMETRY_PROGRAM.agc:221
//		BZMF	DODNPTR		# IT'S A POINTER.  (A MUST NEVER BE ZERO)
// slot 8057
                if slot <> 8057 or instruction <> 26505 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26505, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8058 {
// DOWN_TELEMETRY_PROGRAM.agc:222
//
// DOWN_TELEMETRY_PROGRAM.agc:223
//DODNCHAN	TC	6		# (EXECUTED AS EXTEND)  IT'S A CHANNEL
// slot 8058
                    if slot <> 8058 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:224
//		INDEX	DNECADR
// slot 8059
                    if slot <> 8059 or instruction <> 20702 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20702, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20702, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[452] to agcAotUnit452@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:225
//		INDEX	0 	-4000	# (EXECUTED AS READ)
// slot 8060
    8060, 36864,
// DOWN_TELEMETRY_PROGRAM.agc:226
//		TS	L
// slot 8061
    8061, 45058
)).

// bank 05, slots 8062-8063
function agcAotUnit453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8062 {
// DOWN_TELEMETRY_PROGRAM.agc:227
//		TC	6		# (EXECUTED AS EXTEND)
// slot 8062
        if slot <> 8062 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// DOWN_TELEMETRY_PROGRAM.agc:228
//		INDEX	DNECADR
// slot 8063
        if slot <> 8063 or instruction <> 20702 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20702, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20702, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[453] to agcAotUnit453@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:229
//		INDEX	0 	-4001	# (EXECUTED AS READ)
// slot 8064
    8064, 36862,
// DOWN_TELEMETRY_PROGRAM.agc:230
//		TS	DNECADR		# SET DNECADR
// slot 8065
    8065, 45500
)).

// bank 05, slots 8066-8073
function agcAotUnit454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8069 {
        if slot <= 8067 {
            if slot <= 8066 {
// DOWN_TELEMETRY_PROGRAM.agc:231
//		CA	NEGONE		#	TO MINUS
// slot 8066
                if slot <> 8066 or instruction <> 16359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:232
//		XCH	DNECADR		#		WHILE PRESERVING A.
// slot 8067
                if slot <> 8067 or instruction <> 23774 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 222, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8068 {
// DOWN_TELEMETRY_PROGRAM.agc:233
//		TCF	DNTMEXIT	# GO SEND CHANNELS
// slot 8068
                if slot <> 8068 or instruction <> 6081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:234
//
// DOWN_TELEMETRY_PROGRAM.agc:235
//WOZERO		CS	BIT7
// slot 8069
                if slot <> 8069 or instruction <> 18917 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8071 {
            if slot <= 8070 {
// DOWN_TELEMETRY_PROGRAM.agc:236
//		EXTEND
// slot 8070
                if slot <> 8070 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:237
//		WAND	CHAN13		# SET WORD ORDER CODE TO ZERO
// slot 8071
                if slot <> 8071 or instruction <> 1547 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8072 {
// DOWN_TELEMETRY_PROGRAM.agc:238
//# Page 993
// DOWN_TELEMETRY_PROGRAM.agc:239
//		TC	Q		# RETURN TO CALLER
// slot 8072
                if slot <> 8072 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:240
//
// DOWN_TELEMETRY_PROGRAM.agc:241
//DODNPTR		INDEX	DNECADR		# DNECADR CONTAINS ADRES OF SUBLIST
// slot 8073
                if slot <> 8073 or instruction <> 20702 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20702, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20702, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[454] to agcAotUnit454@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:242
//		0	0		# CLEAR AND ADD LIST ENTRY INTO A.
// slot 8074
    8074, 0
)).

// bank 05, slots 8075-8085
function agcAotUnit455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8079 {
        if slot <= 8076 {
            if slot <= 8075 {
// DOWN_TELEMETRY_PROGRAM.agc:243
//		CCS	A		# IS THIS A SNAPSHOT SUBLIST
// slot 8075
                if slot <> 8075 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:244
//		CA	DNECADR		# NO, IT IS A REGULAR SUBLIST.
// slot 8076
                if slot <> 8076 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8077 {
// DOWN_TELEMETRY_PROGRAM.agc:245
//		TCF	DOSUBLST	# A MUST NOT BE ZERO.
// slot 8077
                if slot <> 8077 or instruction <> 6069 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6069, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8078 {
// DOWN_TELEMETRY_PROGRAM.agc:246
//
// DOWN_TELEMETRY_PROGRAM.agc:247
//		XCH	DNECADR		# YES.  IT IS A SNAPSHOT SUBLIST.
// slot 8078
                    if slot <> 8078 or instruction <> 23774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 222, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:248
//		TS	SUBLIST		# C(DNECADR) INTO SUBLIST
// slot 8079
                    if slot <> 8079 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8082 {
            if slot <= 8080 {
// DOWN_TELEMETRY_PROGRAM.agc:249
//		CAF	ZERO		#	A    INTO     A
// slot 8080
                if slot <> 8080 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8081 {
// DOWN_TELEMETRY_PROGRAM.agc:250
//		XCH	TMINDEX		# (NOTE:  TMINDEX = DNECADR)
// slot 8081
                    if slot <> 8081 or instruction <> 23774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 222, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:251
//
// DOWN_TELEMETRY_PROGRAM.agc:252
//# THE FOLLOWING CODING (FROM SNAPLOOP TO SNAPEND) IS FOR THE PURPOSE OF TAKING A SNAPSHOT OF 12 DP REGISTERS.
// DOWN_TELEMETRY_PROGRAM.agc:253
//# THIS IS DONE BY SAVING 11 DP REGISTERS IN DNTMBUFF AND SENDING THE FIRST DP WORD IMMEDIATELY.
// DOWN_TELEMETRY_PROGRAM.agc:254
//# THE SNAPSHOT PROCESSING IS THE MOST TIME CONSUMING AND THEREFORE THE CODING AND LIST STRUCTURE WERE DESIGNED
// DOWN_TELEMETRY_PROGRAM.agc:255
//# TO MINIMIZE TIME.  THE TIME OPTIMIZATION RESULTS IN RULES UNIQUE TO THE SNAPSHOT PORTION OF THE DOWNLIST.
// DOWN_TELEMETRY_PROGRAM.agc:256
//# THESE RULES ARE ......
// DOWN_TELEMETRY_PROGRAM.agc:257
//#	1.	ONLY 1DNADR'S CAN APPEAR IN THE SNAPSHOT SUBLIST
// DOWN_TELEMETRY_PROGRAM.agc:258
//#	2.	THE 1DNADR'S CANNOT REFER TO THE FIRST LOCATION IN ANY BANK.
// DOWN_TELEMETRY_PROGRAM.agc:259
//
// DOWN_TELEMETRY_PROGRAM.agc:260
//SNAPLOOP	TS	EBANK		# SET EBANK
// slot 8082
                    if slot <> 8082 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8083 {
// DOWN_TELEMETRY_PROGRAM.agc:261
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// slot 8083
                if slot <> 8083 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
                if slot <= 8084 {
// DOWN_TELEMETRY_PROGRAM.agc:262
//		EXTEND
// slot 8084
                    if slot <> 8084 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:263
//		INDEX	A
// slot 8085
                    if slot <> 8085 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[455] to agcAotUnit455@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:264
//		EBANK=	1401
// DOWN_TELEMETRY_PROGRAM.agc:265
//		DCA	1401		# PICK UP 2 SNAPSHOT WORDS.
// slot 8086
    8086, 26116
)).

// bank 05, slots 8087-8087
function agcAotUnit456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// DOWN_TELEMETRY_PROGRAM.agc:266
//		EBANK=	DNTMBUFF
// DOWN_TELEMETRY_PROGRAM.agc:267
//		INDEX	TMINDEX
// slot 8087
    if slot <> 8087 or instruction <> 20702 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20702, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20702, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[456] to agcAotUnit456@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:268
//		DXCH	DNTMBUFF	# STORE 2 SNAPSHOT WORDS IN BUFFER
// slot 8088
    8088, 43458
)).

// bank 05, slots 8089-8092
function agcAotUnit457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8090 {
        if slot <= 8089 {
// DOWN_TELEMETRY_PROGRAM.agc:269
//		INCR	TMINDEX		# SET BUFFER INDEX FOR NEXT 2 WORDS.
// slot 8089
            if slot <> 8089 or instruction <> 10462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 222).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:270
//		INCR	TMINDEX
// slot 8090
            if slot <> 8090 or instruction <> 10462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 222).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8091 {
// DOWN_TELEMETRY_PROGRAM.agc:271
//SNAPAGN		INCR	SUBLIST		# SET POINTER TO NEXT 2 WORDS OF SNAPSHOT
// slot 8091
            if slot <> 8091 or instruction <> 10463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 223).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:272
//		INDEX	SUBLIST
// slot 8092
            if slot <> 8092 or instruction <> 20703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20703, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[457] to agcAotUnit457@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:273
//		0	0		# = CA SSSS (SSSS = NEXT ENTRY IN SUBLIST)
// slot 8093
    8093, 0
)).

// bank 05, slots 8094-8095
function agcAotUnit458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8094 {
// DOWN_TELEMETRY_PROGRAM.agc:274
//		CCS	A		# TEST FOR LAST TWO WORDS OF SNAPSHOT.
// slot 8094
        if slot <> 8094 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// DOWN_TELEMETRY_PROGRAM.agc:275
//		TCF	SNAPLOOP	# NOT LAST TWO.
// slot 8095
        if slot <> 8095 or instruction <> 6034 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6034, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[458] to agcAotUnit458@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:276
//LDNPHAS2	GENADR	DNPHASE2
// slot 8096
    8096, 3750
)).

// bank 05, slots 8097-8104
function agcAotUnit459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8100 {
        if slot <= 8098 {
            if slot <= 8097 {
// DOWN_TELEMETRY_PROGRAM.agc:277
//		TS	SUBLIST		# YES, LAST.  SAVE A.
// slot 8097
                if slot <> 8097 or instruction <> 22751 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22751, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:278
//		CA	NEGONE		# SET DNECADR AND
// slot 8098
                if slot <> 8098 or instruction <> 16359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8099 {
// DOWN_TELEMETRY_PROGRAM.agc:279
//		TS	DNECADR		#	SUBLIST POINTERS
// slot 8099
                if slot <> 8099 or instruction <> 22750 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22750, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:280
//		XCH	SUBLIST		#		TO NEGATIVE VALUES
// slot 8100
                if slot <> 8100 or instruction <> 23775 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 223, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8102 {
            if slot <= 8101 {
// DOWN_TELEMETRY_PROGRAM.agc:281
//		TS	EBANK
// slot 8101
                if slot <> 8101 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:282
//		MASK	LOW8
// slot 8102
                if slot <> 8102 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 8103 {
// DOWN_TELEMETRY_PROGRAM.agc:283
//		EXTEND
// slot 8103
                if slot <> 8103 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:284
//		INDEX	A
// slot 8104
                if slot <> 8104 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[459] to agcAotUnit459@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:285
//		EBANK=	1401
// DOWN_TELEMETRY_PROGRAM.agc:286
//		DCA	1401		# PICK UP FIRST 2 WORDS OF SNAPSHOT.
// slot 8105
    8105, 26116
)).

// bank 05, slots 8106-8114
function agcAotUnit460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8109 {
        if slot <= 8107 {
            if slot <= 8106 {
// DOWN_TELEMETRY_PROGRAM.agc:287
//# Page 994
// DOWN_TELEMETRY_PROGRAM.agc:288
//		EBANK=	DNTMBUFF
// DOWN_TELEMETRY_PROGRAM.agc:289
//SNAPEND		TCF	DNTMEXIT	# NOW TO SEND THEM.
// slot 8106
                if slot <> 8106 or instruction <> 6081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:290
//
// DOWN_TELEMETRY_PROGRAM.agc:291
//FETCH2WD	CA	DNECADR
// slot 8107
                if slot <> 8107 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8108 {
// DOWN_TELEMETRY_PROGRAM.agc:292
//		TS	EBANK		# SET EBANK
// slot 8108
                if slot <> 8108 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:293
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// slot 8109
                if slot <> 8109 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 8111 {
            if slot <= 8110 {
// DOWN_TELEMETRY_PROGRAM.agc:294
//		TS	L
// slot 8110
                if slot <> 8110 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:295
//		CA	DNADRDCR	# DECREMENT COUNT AND ECADR
// slot 8111
                if slot <> 8111 or instruction <> 14169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1881), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8112 {
// DOWN_TELEMETRY_PROGRAM.agc:296
//		ADS	DNECADR
// slot 8112
                if slot <> 8112 or instruction <> 11486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8113 {
// DOWN_TELEMETRY_PROGRAM.agc:297
//		EXTEND
// slot 8113
                    if slot <> 8113 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:298
//		INDEX	L
// slot 8114
                    if slot <> 8114 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[460] to agcAotUnit460@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:299
//		EBANK=	1400
// DOWN_TELEMETRY_PROGRAM.agc:300
//		DCA	1400		# PICK UP 2 DATA WORDS
// slot 8115
    8115, 26114
)).

// bank 05, slots 8116-8118
function agcAotUnit461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8116 {
// DOWN_TELEMETRY_PROGRAM.agc:301
//		EBANK=	DNTMBUFF
// DOWN_TELEMETRY_PROGRAM.agc:302
//		TCF	DNTMEXIT	# NOW GO SEND THEM.
// slot 8116
        if slot <> 8116 or instruction <> 6081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8117 {
// DOWN_TELEMETRY_PROGRAM.agc:303
//
// DOWN_TELEMETRY_PROGRAM.agc:304
//DOSUBLST	TS	SUBLIST		# SET SUBLIST POINTER
// slot 8117
            if slot <> 8117 or instruction <> 22751 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22751, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// DOWN_TELEMETRY_PROGRAM.agc:305
//NEXTINSL	INDEX	SUBLIST
// slot 8118
            if slot <> 8118 or instruction <> 20703 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20703, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20703, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[461] to agcAotUnit461@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:306
//		0	0		# = CA SSSS (SSSS = NEXT ENTRY IN SUBLIST)
// slot 8119
    8119, 0
)).

// bank 05, slots 8120-8143
function agcAotUnit462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8131 {
        if slot <= 8125 {
            if slot <= 8122 {
                if slot <= 8120 {
// DOWN_TELEMETRY_PROGRAM.agc:307
//		CCS	A		# IS IT THE END OF THE SUBLIST
// slot 8120
                    if slot <> 8120 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8121 {
// DOWN_TELEMETRY_PROGRAM.agc:308
//		INCR	SUBLIST		# NO --
// slot 8121
                        if slot <> 8121 or instruction <> 10463 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 223).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:309
//		TCF	+4
// slot 8122
                        if slot <> 8122 or instruction <> 6078 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6078, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8123 {
// DOWN_TELEMETRY_PROGRAM.agc:310
//		TS	SUBLIST		# SAVE A.
// slot 8123
                    if slot <> 8123 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8124 {
// DOWN_TELEMETRY_PROGRAM.agc:311
//		CA	NEGONE		# SET SUBLIST TO MINUS
// slot 8124
                        if slot <> 8124 or instruction <> 16359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:312
//		XCH	SUBLIST		# RETRIEVE A.
// slot 8125
                        if slot <> 8125 or instruction <> 23775 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 223, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8128 {
                if slot <= 8126 {
// DOWN_TELEMETRY_PROGRAM.agc:313
// +4		INCR	A
// slot 8126
                    if slot <> 8126 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8127 {
// DOWN_TELEMETRY_PROGRAM.agc:314
// 		TS	DNECADR		# SAVE DNADR
// slot 8127
                        if slot <> 8127 or instruction <> 22750 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22750, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:315
//		TCF	SETWO +2	# GO USE COMMON CODING (PROLEMS WOULD
// slot 8128
                        if slot <> 8128 or instruction <> 6004 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6004, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8129 {
// DOWN_TELEMETRY_PROGRAM.agc:316
//					# OCCUR IF THE PROGRAM ENCOUNTERED A
// DOWN_TELEMETRY_PROGRAM.agc:317
//					# DNPTR NOW)
// DOWN_TELEMETRY_PROGRAM.agc:318
//
// DOWN_TELEMETRY_PROGRAM.agc:319
//DNTMEXIT	EXTEND			# DOWN-TELEMETRY EXIT
// slot 8129
                    if slot <> 8129 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8130 {
// DOWN_TELEMETRY_PROGRAM.agc:320
//		WRITE	DNTM1		# TO SEND A + L TO CHANNELS 34 + 35
// slot 8130
                        if slot <> 8130 or instruction <> 540 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 28, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:321
//		CA	L		# RESPECTIVELY
// slot 8131
                        if slot <> 8131 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8137 {
            if slot <= 8134 {
                if slot <= 8132 {
// DOWN_TELEMETRY_PROGRAM.agc:322
//TMEXITL		EXTEND
// slot 8132
                    if slot <> 8132 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8133 {
// DOWN_TELEMETRY_PROGRAM.agc:323
//		WRITE	DNTM2
// slot 8133
                        if slot <> 8133 or instruction <> 541 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 29, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:324
//TMRESUME	TCF	RESUME		# EXIT TELEMETRY PROGRAM VIA RESUME.
// slot 8134
                        if slot <> 8134 or instruction <> 6840 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8135 {
// DOWN_TELEMETRY_PROGRAM.agc:325
//
// DOWN_TELEMETRY_PROGRAM.agc:326
//MINB12		EQUALS	-1/8
// DOWN_TELEMETRY_PROGRAM.agc:327
//DNECADR		EQUALS	TMINDEX
// DOWN_TELEMETRY_PROGRAM.agc:328
//CTLIST		EQUALS	LDATALST
// DOWN_TELEMETRY_PROGRAM.agc:329
//SUBLIST		EQUALS 	DNQ
// DOWN_TELEMETRY_PROGRAM.agc:330
//
// DOWN_TELEMETRY_PROGRAM.agc:331
//# Page 995
// DOWN_TELEMETRY_PROGRAM.agc:332
//# SUBROUTINE NAME -- DNDUMP
// DOWN_TELEMETRY_PROGRAM.agc:333
//#
// DOWN_TELEMETRY_PROGRAM.agc:334
//# FUNCTIONAL DESCRIPTION -- TO SEND (DUMP) ALL ERASABLE STORAGE 'N' TIMES. (N=1 TO 4).  BANKS ARE SENT ONE AT A TIME
// DOWN_TELEMETRY_PROGRAM.agc:335
//#	EACH BANK IS PRECEDED BY AN ID WORD, SYNCH BITS, ECADR AND TIME1 FOLLOWED BY THE 256D WORDS OF EACH
// DOWN_TELEMETRY_PROGRAM.agc:336
//#	EBANK.  EBANKS ARE DUMPED IN ORDER (I.E., EBANK 0 FIRST, THEN EBANK1 ETC.)
// DOWN_TELEMETRY_PROGRAM.agc:337
//#
// DOWN_TELEMETRY_PROGRAM.agc:338
//# CALLING SEQUENCE -- THE GROUND OR BOB BY KEYING V74E CAN INITIALIZE THE DUMP.
// DOWN_TELEMETRY_PROGRAM.agc:339
//#	AFTER KEYING IN V74E THE CURRENT DOWNLIST WILL BE IMMEDIATELY TERMINATED AND THE DOWNLINK ERASABLE DUMP
// DOWN_TELEMETRY_PROGRAM.agc:340
//#	WILL BEGIN.
// DOWN_TELEMETRY_PROGRAM.agc:341
//#
// DOWN_TELEMETRY_PROGRAM.agc:342
//#	ONCE INITIATED THE DOWNLINK ERASABLE DUMP CAN BE TERMINATED (AND INTERRUPTED DOWNLIST REINSTATED) ONLY
// DOWN_TELEMETRY_PROGRAM.agc:343
//#	BY THE FOLLOWING:
// DOWN_TELEMETRY_PROGRAM.agc:344
//#
// DOWN_TELEMETRY_PROGRAM.agc:345
//#	1.	A FRESH START
// DOWN_TELEMETRY_PROGRAM.agc:346
//#	2.	COMPLETION OF ALL DOWNLINK DUMPS REQUESTED (ACCORDING TO BITS SET IN DUMPCNT).  NOTE THAT DUMPCNT
// DOWN_TELEMETRY_PROGRAM.agc:347
//#		CAN BE ALTERED BY A V21N01.
// DOWN_TELEMETRY_PROGRAM.agc:348
//#	3.	AND INVOLUNTARILY BY A RESTART.
// DOWN_TELEMETRY_PROGRAM.agc:349
//#
// DOWN_TELEMETRY_PROGRAM.agc:350
//# NORMAL EXIT MODE -- TCF DNPHASE1
// DOWN_TELEMETRY_PROGRAM.agc:351
//#
// DOWN_TELEMETRY_PROGRAM.agc:352
//# ALARM OR ABORT MODE -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:353
//#
// DOWN_TELEMETRY_PROGRAM.agc:354
//# *SUBROUTINES CALLED -- NONE
// DOWN_TELEMETRY_PROGRAM.agc:355
//#
// DOWN_TELEMETRY_PROGRAM.agc:356
//# ERASABLE INITIALIZATION REQUIRED --
// DOWN_TELEMETRY_PROGRAM.agc:357
//#	DUMPCNT		OCT 20000	IF 4 COMPLETE ERASABLE DUMPS ARE DESIRED
// DOWN_TELEMETRY_PROGRAM.agc:358
//#	DUMPCNT		OCT 10000	IF 2 COMPLETE ERASABLE DUMPS ARE DESIRED
// DOWN_TELEMETRY_PROGRAM.agc:359
//#	DUMPCNT		OCT 04000	IF 1 COMPLETE ERASABLE DUMP  IS  DESIRED
// DOWN_TELEMETRY_PROGRAM.agc:360
//#
// DOWN_TELEMETRY_PROGRAM.agc:361
//# DEBRIS -- DUMPLOC, DUMPSW, DNTMGOTO, EBANK, AND CENTRAL REGISTERS
// DOWN_TELEMETRY_PROGRAM.agc:362
//#
// DOWN_TELEMETRY_PROGRAM.agc:363
//# TIMING --	TIME (IN SECS) = ((NO.DUMPS)*(NO.EBANKS)*(WDSPEREBANK + NO.IDWDS)) / NO.WDSPERSEC
// DOWN_TELEMETRY_PROGRAM.agc:364
//#		TIME (IN SECS) =  (   4    )*(    8    )*(    256     +     4   )  /     100
// DOWN_TELEMETRY_PROGRAM.agc:365
//#		THUS TIME (IN SECS TO SEND DUMP OF ERASABLE 4 TIMES VIA DOWNLINK) = 83.2 SECONDS
// DOWN_TELEMETRY_PROGRAM.agc:366
//#
// DOWN_TELEMETRY_PROGRAM.agc:367
//# STRUCTURE OF ONE EBANK AS IT IS SENT BY DOWNLINK PROGRAM --
// DOWN_TELEMETRY_PROGRAM.agc:368
//#	(REMINDER -- THIS ONLY DESCRIBES ONE OF THE 8 EBANKS X 4 (DUMPS) = 32 EBANKS WHICH WILL BE SENT BY DNDUMP)
// DOWN_TELEMETRY_PROGRAM.agc:369
//#
// DOWN_TELEMETRY_PROGRAM.agc:370
//#	DOWNLIST				W
// DOWN_TELEMETRY_PROGRAM.agc:371
//#	  WORD	TAKEN FROM CONTENTS OF	EXAMPLE	O	COMMENTS
// DOWN_TELEMETRY_PROGRAM.agc:372
//#	    1	ERASID			 0177X	0	DOWNLIST I.D. FOR DOWNLINK ERASABLE DUMP (X=7 CSM, 6 LM)
// DOWN_TELEMETRY_PROGRAM.agc:373
//#	    2	LOWIDCOD		 77340 	1	DOWNLINK SYNCH BITS.  (SAME ONE USED IN ALL OTHER DOWNLISTS)
// DOWN_TELEMETRY_PROGRAM.agc:374
//#	    3	DUMPLOC			 13400	1	(SEE NOTES ON DUMPLOC) 1 = 3RD ERAS DUMP, 3400=ECADR OF 5TH WD
// DOWN_TELEMETRY_PROGRAM.agc:375
//#	    4	TIME1			 14120	1	TIME IN CENTISECONDS
// DOWN_TELEMETRY_PROGRAM.agc:376
//#	    5	FIRST WORD OF EBANK X	 03400	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1400 (ECADR 3400)
// DOWN_TELEMETRY_PROGRAM.agc:377
//#	    6	2ND   WORD OF EBANK X	 00142	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1401 (ECADR 3401)
// DOWN_TELEMETRY_PROGRAM.agc:378
//#	    7   3RD   WORD OF EBANK X	 00142	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1402 (ECADR 3402)
// DOWN_TELEMETRY_PROGRAM.agc:379
//#	    .
// DOWN_TELEMETRY_PROGRAM.agc:380
//#	    .
// DOWN_TELEMETRY_PROGRAM.agc:381
//#	    .
// DOWN_TELEMETRY_PROGRAM.agc:382
//#	 260D	256TH WORD OF EBANK X	 03777	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1777 (ECADR 3777)
// DOWN_TELEMETRY_PROGRAM.agc:383
//#
// DOWN_TELEMETRY_PROGRAM.agc:384
//# NOTE --	DUMPLOC CONTAINS THE COUNTER AND ECADR FOR EACH WORD BEING SENT.
// DOWN_TELEMETRY_PROGRAM.agc:385
//#		THE BIT STRUCTURE OF DUMPLOC IS FOLLOW --
// DOWN_TELEMETRY_PROGRAM.agc:386
//#						X = NOT USED
// DOWN_TELEMETRY_PROGRAM.agc:387
//#		X ABC EEE RRRRRRRR	      ABC = ERASABLE DUMP COUNTER (I.E. ABC = 0,1,2, OR 3 WHICH MEANS THAT
// DOWN_TELEMETRY_PROGRAM.agc:388
//#						    COMPLETE ERASABLE DUMP NUMBER 1,2,3, OR 4 RESPECTIVELY IS IN PROGRESS)
// DOWN_TELEMETRY_PROGRAM.agc:389
//#					      EEE = EBANK BITS
// DOWN_TELEMETRY_PROGRAM.agc:390
//#					 RRRRRRRR = RELATIVE ADDRESS WITHIN AN EBANK
// DOWN_TELEMETRY_PROGRAM.agc:391
//
// DOWN_TELEMETRY_PROGRAM.agc:392
//# Page 996
// DOWN_TELEMETRY_PROGRAM.agc:393
//DNDUMPI		CA	ZERO		# INITIALIZE DOWNLINK
// slot 8135
                    if slot <> 8135 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8136 {
// DOWN_TELEMETRY_PROGRAM.agc:394
//		TS	DUMPLOC		# ERASABLE DUMP
// slot 8136
                        if slot <> 8136 or instruction <> 22750 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22750, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:395
// +2		TC	SENDID		# GO SEND ID AND SYNCH BITS
// slot 8137
                        if slot <> 8137 or instruction <> 2027 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2027, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8140 {
                if slot <= 8138 {
// DOWN_TELEMETRY_PROGRAM.agc:396
//		CA	LDNDUMP1	# SET DNTMGOTO
// slot 8138
                    if slot <> 8138 or instruction <> 14289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2001), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8139 {
// DOWN_TELEMETRY_PROGRAM.agc:397
//		TS	DNTMGOTO	# TO LOCATION FOR NEXT PASS
// slot 8139
                        if slot <> 8139 or instruction <> 22749 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22749, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:398
//		CA	TIME1		# PLACE TIME1
// slot 8140
                        if slot <> 8140 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8141 {
// DOWN_TELEMETRY_PROGRAM.agc:399
//		XCH	L		# INTO L
// slot 8141
                    if slot <> 8141 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8142 {
// DOWN_TELEMETRY_PROGRAM.agc:400
//		CA	DUMPLOC		# AND ECADR OF THIS EBANK INTO A
// slot 8142
                        if slot <> 8142 or instruction <> 12510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 222).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// DOWN_TELEMETRY_PROGRAM.agc:401
//		TCF	DNTMEXIT	# SEND DUMPLOC AND TIME1
// slot 8143
                        if slot <> 8143 or instruction <> 6081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[462] to agcAotUnit462@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:402
//
// DOWN_TELEMETRY_PROGRAM.agc:403
//LDNDUMP		ADRES	DNDUMP
// slot 8144
    8144, 4004,
// DOWN_TELEMETRY_PROGRAM.agc:404
//LDNDUMP1	ADRES	DNDUMP1
// slot 8145
    8145, 4026
)).

// bank 05, slots 8146-8152
function agcAotUnit463 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8148 {
        if slot <= 8146 {
// DOWN_TELEMETRY_PROGRAM.agc:405
//
// DOWN_TELEMETRY_PROGRAM.agc:406
//DNDUMP		CA	TWO		# INCREMENT ECADR IN DUMPLOC
// slot 8146
            if slot <> 8146 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8147 {
// DOWN_TELEMETRY_PROGRAM.agc:407
//		ADS	DUMPLOC		# TO NEXT DP WORD TO BE
// slot 8147
                if slot <> 8147 or instruction <> 11486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:408
//		MASK	LOW8		# DUMPED AND SAVE IT.
// slot 8148
                if slot <> 8148 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 8150 {
            if slot <= 8149 {
// DOWN_TELEMETRY_PROGRAM.agc:409
//		CCS	A		# IS THIS THE BEGINNING OF A NEW EBANK
// slot 8149
                if slot <> 8149 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:410
//		TCF	DNDUMP2		# NO -- THEN CONTINUE DUMPING
// slot 8150
                if slot <> 8150 or instruction <> 6111 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6111, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8151 {
// DOWN_TELEMETRY_PROGRAM.agc:411
//		CA	DUMPLOC		# YES -- IS THIS THE END OF THE
// slot 8151
                if slot <> 8151 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// DOWN_TELEMETRY_PROGRAM.agc:412
//		MASK	DUMPCNT		# N TH (N = 1 TO 4) COMPLETE ERASABLE
// slot 8152
                if slot <> 8152 or instruction <> 28891 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 219).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[463] to agcAotUnit463@.

// bank 05, slots 8153-8165
function agcAotUnit464 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8158 {
        if slot <= 8155 {
            if slot <= 8153 {
// DOWN_TELEMETRY_PROGRAM.agc:413
//		MASK	PRIO34		# DUMP (BIT14 FOR 4, BIT13 FOR 2 OR BIT12
// slot 8153
                if slot <> 8153 or instruction <> 32722 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4050), 32768).
                    if fixedOperand = 14336 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 8) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8154 {
// DOWN_TELEMETRY_PROGRAM.agc:414
//		CCS	A		# FOR 1 COMPLETE ERASABLE DUMP(S)).
// slot 8154
                    if slot <> 8154 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:415
//		TCF	DNPHASE1	# YES -- START SENDING INTERRUPTED DOWNLIST
// slot 8155
                    if slot <> 8155 or instruction <> 5965 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5965, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8156 {
// DOWN_TELEMETRY_PROGRAM.agc:416
//					# AGAIN
// DOWN_TELEMETRY_PROGRAM.agc:417
//		TCF	DNDUMPI	+2	# NO -- GO BACK AND INITIALIZE NEXT BANK
// slot 8156
                if slot <> 8156 or instruction <> 6089 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6089, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8157 {
// DOWN_TELEMETRY_PROGRAM.agc:418
//
// DOWN_TELEMETRY_PROGRAM.agc:419
//DNDUMP1		CA	LDNDUMP		# SET DNTMGOTO
// slot 8157
                    if slot <> 8157 or instruction <> 14288 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2000), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:420
//		TS	DNTMGOTO	# FOR WORDS 3 TO 256D OF CURRENT EBANK
// slot 8158
                    if slot <> 8158 or instruction <> 22749 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22749, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8161 {
            if slot <= 8159 {
// DOWN_TELEMETRY_PROGRAM.agc:421
//
// DOWN_TELEMETRY_PROGRAM.agc:422
//DNDUMP2		CA	DUMPLOC
// slot 8159
                if slot <> 8159 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8160 {
// DOWN_TELEMETRY_PROGRAM.agc:423
//		TS	EBANK		# SET EBANK
// slot 8160
                    if slot <> 8160 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:424
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS.
// slot 8161
                    if slot <> 8161 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 8163 {
                if slot <= 8162 {
// DOWN_TELEMETRY_PROGRAM.agc:425
//		TS	Q		# (NOTE: MASK INSTRUCTION IS USED TO PICK
// slot 8162
                    if slot <> 8162 or instruction <> 22530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:426
//		CA	NEG0		# UP ERASABLE REGISTERS SO THAT EDITING
// slot 8163
                    if slot <> 8163 or instruction <> 14828 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2540), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8164 {
// DOWN_TELEMETRY_PROGRAM.agc:427
//		TS	L		# REGISTERS 20-23 WILL NOT BE ALTERED.)
// slot 8164
                    if slot <> 8164 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:428
//		INDEX	Q
// slot 8165
                    if slot <> 8165 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[464] to agcAotUnit464@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:429
//		EBANK=	1400		# PICK UP LOW ORDER REGISTER OF PAIR
// DOWN_TELEMETRY_PROGRAM.agc:430
//		MASK	1401		# OF ERASABLE REGISTERS.
// slot 8166
    8166, 58882
)).

// bank 05, slots 8167-8168
function agcAotUnit465 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8167 {
// DOWN_TELEMETRY_PROGRAM.agc:431
//		XCH	L
// slot 8167
        if slot <> 8167 or instruction <> 23553 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 1, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// DOWN_TELEMETRY_PROGRAM.agc:432
//		INDEX	Q		# PICK UP HIGH ORDER REGISTER OF PAIR
// slot 8168
        if slot <> 8168 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[465] to agcAotUnit465@.

agcAotInstallSourceRope(list(
// DOWN_TELEMETRY_PROGRAM.agc:433
//		MASK	1400		# OF ERASABLE REGISTERS.
// slot 8169
    8169, 58880
)).

// bank 05, slots 8170-8185
function agcAotUnit466 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8177 {
        if slot <= 8173 {
            if slot <= 8171 {
                if slot <= 8170 {
// DOWN_TELEMETRY_PROGRAM.agc:434
//		EBANK=	DNTMBUFF
// DOWN_TELEMETRY_PROGRAM.agc:435
//		TCF	DNTMEXIT	# GO SEND THEM
// slot 8170
                    if slot <> 8170 or instruction <> 6081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6081, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:436
//
// DOWN_TELEMETRY_PROGRAM.agc:437
//SENDID		EXTEND			# ** ENTRANCE USED BY ERASABLE DUMP PROG. **
// slot 8171
                    if slot <> 8171 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8172 {
// DOWN_TELEMETRY_PROGRAM.agc:438
//		QXCH	DNTMGOTO	# SET DNTMGOTO SO NEXT TIME PROG WILL GO
// slot 8172
                    if slot <> 8172 or instruction <> 9437 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 221, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:439
//		CAF	ERASID		# TO LOCATION FOLLOWING `TC SENDID'
// slot 8173
                    if slot <> 8173 or instruction <> 14857 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8175 {
                if slot <= 8174 {
// DOWN_TELEMETRY_PROGRAM.agc:440
//
// DOWN_TELEMETRY_PROGRAM.agc:441
//		TS	L		# ** ENTRANCE USED BY REGULAR DOWNLINK PG **
// slot 8174
                    if slot <> 8174 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:442
//# Page 997
// DOWN_TELEMETRY_PROGRAM.agc:443
//		TC	WOZERO		# GO SET WORD ORDER CODE TO ZERO
// slot 8175
                    if slot <> 8175 or instruction <> 1925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1925, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8176 {
// DOWN_TELEMETRY_PROGRAM.agc:444
//		CAF	LOWIDCOD	# PLACE SPECIAL ID CODE INTO L
// slot 8176
                    if slot <> 8176 or instruction <> 13365 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1077), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:445
//		XCH	L		# AND ID BACK INTO A
// slot 8177
                    if slot <> 8177 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8181 {
            if slot <= 8179 {
                if slot <= 8178 {
// DOWN_TELEMETRY_PROGRAM.agc:446
//		TCF	DNTMEXIT	# SEND DOWNLIST ID CODE(S).
// slot 8178
                    if slot <> 8178 or instruction <> 6081 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6081, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:447
//
// DOWN_TELEMETRY_PROGRAM.agc:448
//WOTEST		CA	BIT7		# AT THE BEGINNING OF THE LIST THE WORD
// slot 8179
                    if slot <> 8179 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8180 {
// DOWN_TELEMETRY_PROGRAM.agc:449
//		EXTEND			# ORDER BIT WILL BE SET BACK TO ZERO
// slot 8180
                    if slot <> 8180 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:450
//		RAND	CHAN13
// slot 8181
                    if slot <> 8181 or instruction <> 1035 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8183 {
                if slot <= 8182 {
// DOWN_TELEMETRY_PROGRAM.agc:451
//		CCS	A
// slot 8182
                    if slot <> 8182 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:452
//		TC	DNTMGOTO
// slot 8183
                    if slot <> 8183 or instruction <> 221 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 221, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8184 {
// DOWN_TELEMETRY_PROGRAM.agc:453
//		CA	BIT7
// slot 8184
                    if slot <> 8184 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// DOWN_TELEMETRY_PROGRAM.agc:454
//		TCF	WO1
// slot 8185
                    if slot <> 8185 or instruction <> 5962 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5962, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[466] to agcAotUnit466@.

// no code for the lines below
// DOWN_TELEMETRY_PROGRAM.agc:455
//
