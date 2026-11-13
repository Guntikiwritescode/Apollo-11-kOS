// PORT: Original source unit DOWN-TELEMETRY_PROGRAM.agc.
// PORT: Physical bank 05. Shared continuation entries, slots 8017–8031.
function agcAotUnit443 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8023 {
        if slot <= 8019 {
            if slot <= 8017 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:2
//# Filename:     DOWN-TELEMETRY_PROGRAM.agc
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:7
//# Reference:    pp. 1093-1102
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:10
//# Mod history:  2009-05-08 RSB	Adapted from Colossus249/ file of same name
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:11
//#				and page images. Corrected various typos
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:12
//#				in the transcription of program comments,
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:13
//#				and these should be back-ported to
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:14
//#				Colossus249.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:15
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:17
//# from scanned documents.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:18
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:21
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:23
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:24
//#       Prepared by
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:28
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:30
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:33
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:34
//# Page 1093
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:35
//# PROGRAM NAME- DOWN TELEMETRY PROGRAM
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:36
//# MOD NO.- 0		TO COMPLETELY REWRITE THE DOWN TELEMETRY PROGRAM AND DOWNLINK ERASABLE DUMP PROGRAM FOR THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:37
//#			PURPOSE OF SAVING APPROXIMATELY 150 WORDS OF CORE STORAGE.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:38
//#			THIS CHANGE REQUIRES AN ENTIRELY NEW METHOD OF SPECIFYING DOWNLINK LISTS.  REFER TO DOWNLINK
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:39
//#			LISTS LOG SECTION FOR MORE DETAILS.  HOWEVER THIS CHANGES WILL NOT AFFECT THE GROUND PROCESSING
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:40
//#			OF DOWN TELEMETRY DATA.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:41
//# MOD BY-  KILROY, SMITH, DEWITT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:42
//# DATE-	   02OCT67
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:43
//# AUTHORS- KILROY, SMITH, DWWITT, DEWOLF, FAGIN
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:44
//# LOG SECTION- DOWN-TELEMETRY PROGRAM
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:45
//# FUNCTIONAL DESCRIPTION- THIS ROUTINE IS INITIATED BY TELEMETRY END
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:46
//#	PULSE FROM THE DOWNLINK TELEMETRY CONVERTER.  THIS PULSE OCCURS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:47
//#	AT 50 TIMES PER SEC(EVERY 20 MS) THEREFORE DODOWNTM IS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:48
//#	EXECUTED AT THESE RATES.  THIS ROUTINE SELECTS THE APPROPRIATE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:49
//#	AGC DATA TO BE TRANSMITTED DOWNLINK AND LOADS IT INTO OUTPUT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:50
//#	CHANNELS 34 AND 35.  THE INFORMATION IS THEN GATED OUT FROM THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:51
//#	LGC IN SERIAL FASHION.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:52
//#	THIS PROGRAM IS CODED FOR A 2 SECOND DOWNLIST.  SINCE DOWNRUPTS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:53
//#	OCCUR EVERY 20MS AND 2 AGC COMPUTER WORDS CAN BE PLACED IN
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:54
//#	CHANNELS 34 AND 35 DURING EACH DOWNRUPT THE PROGRAM IS CAPABLE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:55
//# 	OF SENDING 200 AGC WORDS EVERY 2 SECONDS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:56
//# CALLING SEQUENCE- NONE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:57
//#	PROGRAM IS ENTERED VIA TCF DODOWNTM WHICH IS EXECUTED AS A
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:58
//#	RESULT OF A DOWNRUPT.  CONTROL IS RETURNED VIA TCF RESUME WHICH
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:59
//#	IN EFFECT IS A RESUME.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:60
//# SUBROUTINES CALLED- NONE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:61
//# NORMAL EXIT MODE- TCF RESUME
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:62
//# ALARM OR ABORT EXIT MODE- NONE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:63
//# RESTART PROTECTION:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:64
//#	ON A FRESH START AND RESTART THE 'STARTSUB' SUBROUTINE WILL INITIALIZE THE DOWNLIST POINTER(ACTUALLY
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:65
//#	DNTMGOTO) TO THE BEGINNING OF THE CURRENT DOWNLIST(I.E., CURRENT CONTENTS OF DNLSTADR).  THIS HAS THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:66
//#	EFFECT OF IGNORING THE REMAINDER OF THE DOWNLIST WHICH THE DOWN-TELEMETRY PROGRAM WAS WORKING ON WHEN
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:67
//#	THE RESTART(OR FRESH START) OCCURRED AND RESUME DOWN TELEMETRY FROM THE BEGINNING OF THE CURRENT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:68
//#	DOWNLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:69
//#	ALSO OF INTEREST IS THE FACT THAT ON A RESTART THE AGC WILL ZERO DOWNLINK CHANNELS 13, 34 AND 35.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:70
//# DOWNLINK LIST SELECTION:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:71
//#	THE APPROPRIATE DOWNLINK LISTS ARE SELECTED BY THE FOLLOWING:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:72
//#	1. FRESH START
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:73
//#	2. V37EXXE WHERE XX = THE MAJOR MODE BEING SELECTED.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:74
//#	3. UPDATE PROGRAM(P27)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:75
//#	4.	NON-V37 SELECTABLE TYPE PROGRAMS(E.G. AGS INITIALIZATION(SUNDANCE,LUMINARY) AND P61-P62
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:76
//#		TRANSITION(COLOSSUS) ETC.).
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:77
//# DOWNLINK LIST RULES AND LIMITATIONS:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:78
//#	READ SECTION(S) WHICH FOLLOW 'DEBRIS' WRITEUP.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:79
//# OUTPUT- EVERY 2 SECONDS 100 DOUBLE PRECISION WORDS(I.E. 200 LGC
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:80
//#	COMPUTER WORDS) ARE TRANSMITTED VIA DOWNLINK.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:81
//# ERASABLE INITIALIZATION REQUIRED- NONE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:82
//#	'DNTMGOTO' AND 'DNLSTADR' ARE INITIALIZED BY THE FRESH START PROGRAM.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:83
//# DEBRIS(ERASABLE LOCATIONS DESTROYED BY THIS PROGRAM)-
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:84
//#	LDATALST,DNTMBUFF TO DNTMBUFF +21D,TMINDEX,DNQ.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:85
//# Page 1094
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:86
//# (No source on this page of the original assembly listing.)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:87
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:88
//# Page 1095
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:89
//# DODOWNTM IS ENTERED EVERY 20 MS BY AN INTERRUPT TRIGGERED BY THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:90
//# RECEIPT OF AN ENDPULSE FROM THE SPACECRAFT TELEMETRY PROGRAMMER.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:91
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:92
//# NOTES REGARDING DOWNLINK LISTS ASSOCIATED WITH THIS PROGRAM:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:93
//# 1. DOWNLISTS.  - DOWNLISTS MUST BE COMPILED IN THE SAME BANK AS THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:94
//#    DOWN-TELEMETRY PROGRAM.  THIS IS DONE FOR EASE OF CODING, FASTER
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:95
//#    EXECUTION.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:96
//# 2. EACH DOWNLINK LIST CONSISTS OF A CONTROL LIST AND A NUMBER OF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:97
//#    SUBLISTS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:98
//# 3. A SUBLIST REFERS TO A SNAPSHOT OR DATA COMMON TO THE SAME OR OTHER
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:99
//#    DOWNLINK LISTS.  ANY SUBLIST CONTAINING COMMON DATA NEEDS TO BE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:100
//#    CODED ONLY ONCE FOR THE APPLICABLE DOWNLINK LISTS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:101
//# 4. SNAPSHOT SUBLISTS REFER SPECIFICALLY TO HOMOGENOUS DATA WHICH MUST BE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:102
//#    SAVED IN A BUFFER DURING ONE DOWNRUPT.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:103
//# 5. THE 1DNADR FOR THE 1ST WORD OF SNAPSHOT DATA IS FOUND AT THE END
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:104
//#    OF EACH SNAPSHOT SUBLIST, SINCE THE PROGRAM CODING SENDS THIS DP WORD
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:105
//#    IMMEDIATELY AFTER STORING THE OTHERS IN THE SNAPSHOT BUFFER.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:106
//# 6. ALL LISTS ARE COMBINATIONS OF CODED ERASABLE ADDRESS CONSTANTS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:107
//#    CREATED FOR THE DOWNLIST PROGRAM.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:108
//#    A. 1DNADR			1-WORD DOWNLIST ADDRESS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:109
//#	SAME AS ECADR, BUT USED WHEN THE WORD ADDRESSED IS THE LEFT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:110
//#	HALF OF A DOUBLE-PRECISION WORD FOR DOWN TELEMETRY.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:111
//#    B. 2DNADR - 6DNADR		N-WORD DOWNLIST ADDRESS, N = 2 - 6.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:112
//#	SAME AS 1DNADR, BUT WITH THE 4 UNUSED BITS OF THE ECADR FORMAT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:113
//#	FILLED IN WITH 0001-0101.  USED TO POINT TO A LIST OF N DOUBLE-
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:114
//#	PRECISION WORDS, STORED CONSECUTIVELY, FOR DOWN TELEMETRY.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:115
//#    C. DNCHAN			DOWNLIST CHANNEL ADDRESS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:116
//#	SAME AS 1DNADR, BUT WITH PREFIX BITS 0111.  USED TO POINT TO
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:117
//#	A PAIR OF CHANNELS FOR DOWN TELEMETRY.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:118
//#    D. DNPTR			DOWN TELEMETRY SUBLIST POINTER.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:119
//#	SAME AS CAF BUT TAGGES AS A CONSTANT.  USED IN CONTROL LIST TO POINT TO A SUBLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:120
//#	CAUTION--- A DNPTR CANNOT BE USED IN A SUBLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:121
//# 7. THE WORD ORDER CODE IS SET TO ZERO AT THE BEGINNING OF EACH DOWNLIST (I.E., CONTROL LIST) AND WHEN
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:122
//#    A '1DNADR TIME2' IS DETECTED IN THE CONTROL LIST(ONLY).
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:123
//# 8. IN THE SNAPSHOT SUBLIST ONLY, THE DNADR'S CANNOT POINT TO THE FIRST WORD OF ANY EBANK.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:124
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:125
//# DOWNLINK LIST RESTRICTIONS:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:126
//# (THE FOLLOWING POINTS MAY BE LISTED ELSEWHERE BUT ARE LISTED HERE SO IT IS CLEAR THAT THESE THINGS CANNOT BE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:127
//# DONE)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:128
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:129
//# 1. SNAPSHOT DOWNLIST:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:130
//#    (A) CANNOT CONTAIN THE FOLLOWING ECADRS(I.E. 1DNADR'S): 0, 400, 1000, 1400, 2000, 2400, 3000, 3400.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:131
//#    (B) CAN CONTAIN ONLY 1DNADR'S
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:132
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:133
//# 2. ALL DOWNLINKED DATA(EXCEPT CHANNELS) IS PICKED UP BY A <DCA<SO DOWNLINK LISTS CANNOT CONTAIN THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:134
//#    EQUIVALENT OF THE FOLLOWING ECADRS(I.E. IDNADRS): 377, 777, 1377, 1777, 2377, 2777, 3377, 3777.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:135
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:136
//#    (NOTE: THE TERM EQUIVALENT ' MEANT THAT THE IDNADR TO 6DNADR WILL BE PROCESSED LIKE 1 TO 6 ECADRS)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:137
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:138
//# 3. CONTROL LISTS AND SUBLISTS CANNOT HAVE ENTRIES = OCTAL 00000 OR OCTAL 77777
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:139
//# Page 1096
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:140
//# 4. THE '1DNADR TIME2' WHICH WILL CAUSE THE DOWNLINK PROGRAM TO SET THE WORDER CODE TO 3 MUST APPEAR IN THE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:141
//#    CONTROL SECTION OF THE DOWNLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:142
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:143
//# 5. 'DNCHAN 0' CANNOT BE USED.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:144
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:145
//# 6. 'DNPTR 0' CANNOT BE USED.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:146
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:147
//# 7. DNPTR CANNOT APPEAR IN A SUBLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:148
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:149
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:150
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:151
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:152
//# EBANK SETTINGS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:153
//#	IN THE PROCESS OF SETTING THE EBANK(WHEN PICKING UP DOWNLINK DATA) THE DOWN TELEMETRY PROGRAM PUTS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:154
//#	'GARBAGE' INTO BITS15-12 OF EBANK.  HUGH BLAIR-SMITH WARNS US THAT BITS15-12 OF EBANK MAY BECOME
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:155
//#	SIGNIFICANT SOMEDAY IN THE FUTURE.  IF/WHEN THAT HAPPENS, THE PROGRAM SHOULD INSURE(BY MASKING ETC.)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:156
//#	THAT BITS 15-12 OF EBANK ARE ZERO.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:157
//# INITIALIZATION REQUIRED- TO INTERRUPT CURRENT LIST AND START A NEW ONE..
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:158
//#	1. ADRES OF DOWNLINK LIST INTO DNLSTADR
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:159
//#	2. NEGONE INTO SUBLIST
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:160
//#	3. NEGONE INTO DNECADR
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:161
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:162
//		BANK	22
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:163
//		SETLOC	DOWNTELM
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:164
//		BANK
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:165
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:166
//		EBANK=	DNTMBUFF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:167
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:168
//		COUNT	05/DPROG
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:169
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:170
//DODOWNTM	TS	BANKRUPT
// PORT: Fixed ROM slots 8017.
                if slot <> 8017 or instruction <> 22542 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22542, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8018 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:171
//		EXTEND
// PORT: Fixed ROM slots 8018.
                    if slot <> 8018 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:172
//		QXCH	QRUPT		# SAVE Q
// PORT: Fixed ROM slots 8019.
                    if slot <> 8019 or instruction <> 9226 { return choose false if checkOnly else -1. }
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
            if slot <= 8021 {
                if slot <= 8020 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:173
//		CA	BIT7		# SET WORD ORDER CODE TO 1.  EXCEPTION- AT
// PORT: Fixed ROM slots 8020.
                    if slot <> 8020 or instruction <> 14857 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:174
//		EXTEND			# THE BEGINNING OF EACH LIST THE WORD
// PORT: Fixed ROM slots 8021.
                    if slot <> 8021 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8022 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:175
//		WOR	CHAN13		# CODE WILL BE SET BACK TO 0.
// PORT: Fixed ROM slots 8022.
                    if slot <> 8022 or instruction <> 2571 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:176
//		TC	DNTMGOTO	# GO TO APPROPRIATE PHASE OF PROGRAM
// PORT: Fixed ROM slots 8023.
                    if slot <> 8023 or instruction <> 221 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 221, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8027 {
            if slot <= 8025 {
                if slot <= 8024 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:177
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:178
//DNPHASE1	CA	NEGONE		# INITIALIZE ALL CONTROL WORDS
// PORT: Fixed ROM slots 8024.
                    if slot <> 8024 or instruction <> 16334 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:179
//		TS	SUBLIST		# WORDS TO MINUS ONE
// PORT: Fixed ROM slots 8025.
                    if slot <> 8025 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8026 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:180
//		TS	DNECADR
// PORT: Fixed ROM slots 8026.
                    if slot <> 8026 or instruction <> 22750 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22750, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:181
//		CA	LDNPHAS2	# SET DNTMGOTO =0 ALL SUBSEQUENT DOWNRUPTS
// PORT: Fixed ROM slots 8027.
                    if slot <> 8027 or instruction <> 14251 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1963), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8029 {
                if slot <= 8028 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:182
//		TS	DNTMGOTO	# GO TO DNPHASE2
// PORT: Fixed ROM slots 8028.
                    if slot <> 8028 or instruction <> 22749 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22749, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:183
//		TCF	NEWLIST
// PORT: Fixed ROM slots 8029.
                    if slot <> 8029 or instruction <> 5993 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5993, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8030 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:184
//DNPHASE2	CCS	DNECADR		# SENDING OF DATA IN PROGRESS
// PORT: Fixed ROM slots 8030.
                    if slot <> 8030 or instruction <> 4318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 222).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:185
//DODNADR		TC	FETCH2WD	# YES - THEN FETCH THE NEXT 2 SP WORDS
// PORT: Fixed ROM slots 8031.
                    if slot <> 8031 or instruction <> 1974 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1974, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[443] to agcAotUnit443@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:186
//MINTIME2	-1DNADR	TIME2		# NEGATIVE OF TIME2 1DNADR
// PORT: Fixed ROM slots 8032.
    8032, 65494
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8033–8035.
function agcAotUnit444 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8033 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:187
//		TCF	+1		# (ECADR OF 3776 + 74001 = 77777)
// PORT: Fixed ROM slots 8033.
        if slot <> 8033 or instruction <> 5986 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5986, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8034 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:188
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:189
//		CCS	SUBLIST		# IS THE SUBLIST IN CONTROL
// PORT: Fixed ROM slots 8034.
            if slot <> 8034 or instruction <> 4319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 223).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:190
//# Page 1097
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:191
//		TCF	NEXTINSL	# YES
// PORT: Fixed ROM slots 8035.
            if slot <> 8035 or instruction <> 6081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[444] to agcAotUnit444@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:192
//DNADRDCR	OCT	74001		# DNADR COUNT AND ECADR DECREMENTER
// PORT: Fixed ROM slots 8036.
    8036, 61442
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8037–8041.
function agcAotUnit445 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8038 {
        if slot <= 8037 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:193
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:194
//CHKLIST		CA	CTLIST
// PORT: Fixed ROM slots 8037.
            if slot <> 8037 or instruction <> 12508 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 220).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:195
//		EXTEND
// PORT: Fixed ROM slots 8038.
            if slot <> 8038 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8039 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:196
//		BZMF	NEWLIST		# IT WILL BE NEGATIVE AT END OF LIST
// PORT: Fixed ROM slots 8039.
            if slot <> 8039 or instruction <> 26473 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26473, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8040 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:197
//		TCF	NEXTINCL
// PORT: Fixed ROM slots 8040.
                if slot <> 8040 or instruction <> 5998 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5998, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:198
//NEWLIST		INDEX	DNLSTCOD
// PORT: Fixed ROM slots 8041.
                if slot <> 8041 or instruction <> 20698 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[445] to agcAotUnit445@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:199
//		CA	DNTABLE		# INITIALIZE CTLIST WITH
// PORT: Fixed ROM slots 8042.
    8042, 27066
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8043–8046.
function agcAotUnit446 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8044 {
        if slot <= 8043 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:200
//		TS	CTLIST		#	STARTING ADDRESS OF NEW LIST
// PORT: Fixed ROM slots 8043.
            if slot <> 8043 or instruction <> 22748 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22748, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:201
//		CS	DNLSTCOD
// PORT: Fixed ROM slots 8044.
            if slot <> 8044 or instruction <> 16602 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 218).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8045 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:202
//		TCF	SENDID +3
// PORT: Fixed ROM slots 8045.
            if slot <> 8045 or instruction <> 6137 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6137, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:203
//NEXTINCL	INDEX	CTLIST
// PORT: Fixed ROM slots 8046.
            if slot <> 8046 or instruction <> 20700 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[446] to agcAotUnit446@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:204
//		CA	0
// PORT: Fixed ROM slots 8047.
    8047, 24576
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8048–8058.
function agcAotUnit447 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8052 {
        if slot <= 8049 {
            if slot <= 8048 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:205
//		CCS	A
// PORT: Fixed ROM slots 8048.
                if slot <> 8048 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:206
//		INCR	CTLIST		# SET POINTER TO PICK UP NEXT CTLIST WORD
// PORT: Fixed ROM slots 8049.
                if slot <> 8049 or instruction <> 10460 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 220).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8050 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:207
//		TCF	+4		# ON NEXT ENTRY TO PROG.  (A SHOULD NOT =0)
// PORT: Fixed ROM slots 8050.
                if slot <> 8050 or instruction <> 6006 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6006, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8051 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:208
//		XCH	CTLIST		# SET CTLIST TO NEGATIVE AND PLACE(CODING)
// PORT: Fixed ROM slots 8051.
                    if slot <> 8051 or instruction <> 23772 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 220, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:209
//		COM			# UNCOMPLEMENTED DNADR INTO A.    (FOR LA)
// PORT: Fixed ROM slots 8052.
                    if slot <> 8052 or instruction <> 16384 { return choose false if checkOnly else -1. }
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
        if slot <= 8055 {
            if slot <= 8053 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:210
//		XCH	CTLIST		#                                 (ST IN )
// PORT: Fixed ROM slots 8053.
                if slot <> 8053 or instruction <> 23772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 220, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8054 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:211
//	+4	INCR	A		#                                 (CTLIST)
// PORT: Fixed ROM slots 8054.
                    if slot <> 8054 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:212
// 		TS	DNECADR		# SAVE DNADR
// PORT: Fixed ROM slots 8055.
                    if slot <> 8055 or instruction <> 22750 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22750, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8056 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:213
//		AD	MINTIME2	# TEST FOR TIME2 (NEG. OF ECADR)
// PORT: Fixed ROM slots 8056.
                if slot <> 8056 or instruction <> 26464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1888), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8057 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:214
//		CCS	A
// PORT: Fixed ROM slots 8057.
                    if slot <> 8057 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:215
//		TCF	SETWO +1	# DON'T SET WORD ORDER CODE
// PORT: Fixed ROM slots 8058.
                    if slot <> 8058 or instruction <> 6014 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6014, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[447] to agcAotUnit447@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:216
//MINB1314	OCT	47777		# MINUS BIT 13 AND 14 (CAN'T GET HERE)
// PORT: Fixed ROM slots 8059.
    8059, 40958
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8060–8070.
function agcAotUnit448 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8064 {
        if slot <= 8061 {
            if slot <= 8060 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:217
//		TCF	SETWO +1	# DON'T SET WORD ORDER CODE
// PORT: Fixed ROM slots 8060.
                if slot <> 8060 or instruction <> 6014 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6014, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:218
//SETWO		TC	WOZERO		# GO SET WORD ORDER CODE TO ZERO.
// PORT: Fixed ROM slots 8061.
                if slot <> 8061 or instruction <> 1936 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8062 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:219
// 	+1	CA	DNECADR		# RELOAD A WITH THE DNADR.
// PORT: Fixed ROM slots 8062.
                if slot <> 8062 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8063 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:220
// 	+2	AD	MINB1314	# IS THIS A REGULAR DNADR?
// PORT: Fixed ROM slots 8063.
                    if slot <> 8063 or instruction <> 26491 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1915), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:221
// 		EXTEND
// PORT: Fixed ROM slots 8064.
                    if slot <> 8064 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8067 {
            if slot <= 8065 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:222
//		BZMF	FETCH2WD	# YES.  (A MUST NEVER BE ZERO)
// PORT: Fixed ROM slots 8065.
                if slot <> 8065 or instruction <> 26550 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26550, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8066 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:223
//		AD	MINB12		# NO-	IS IT A POINTER (DNPTR) OR A
// PORT: Fixed ROM slots 8066.
                    if slot <> 8066 or instruction <> 28616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:224
//		EXTEND			# 	CHANNEL(DNCHAN)
// PORT: Fixed ROM slots 8067.
                    if slot <> 8067 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8068 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:225
//		BZMF	DODNPTR		# IT'S A POINTER.  (A MUST NEVER BE ZERO)
// PORT: Fixed ROM slots 8068.
                if slot <> 8068 or instruction <> 26516 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26516, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8069 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:226
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:227
//DODNCHAN	TC	6		# (EXECUTED AS EXTEND)  IT S A CHANNEL
// PORT: Fixed ROM slots 8069.
                    if slot <> 8069 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:228
//		INDEX	DNECADR
// PORT: Fixed ROM slots 8070.
                    if slot <> 8070 or instruction <> 20702 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[448] to agcAotUnit448@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:229
//		INDEX	0 -4000		# (EXECUTED AS READ)
// PORT: Fixed ROM slots 8071.
    8071, 36864,
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:230
//		TS	L
// PORT: Fixed ROM slots 8072.
    8072, 45058
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8073–8074.
function agcAotUnit449 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8073 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:231
//		TC	6		# (EXECUTED AS EXTEND)
// PORT: Fixed ROM slots 8073.
        if slot <> 8073 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:232
//		INDEX	DNECADR
// PORT: Fixed ROM slots 8074.
        if slot <> 8074 or instruction <> 20702 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[449] to agcAotUnit449@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:233
//		INDEX	0 -4001		# (EXECUTED AS READ)
// PORT: Fixed ROM slots 8075.
    8075, 36862,
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:234
//		TS	DNECADR		# SET DNECADR
// PORT: Fixed ROM slots 8076.
    8076, 45500
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8077–8084.
function agcAotUnit450 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8080 {
        if slot <= 8078 {
            if slot <= 8077 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:235
//		CA	NEGONE		#	TO MINUS
// PORT: Fixed ROM slots 8077.
                if slot <> 8077 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:236
//		XCH	DNECADR		#		WHILE PRESERVING A.
// PORT: Fixed ROM slots 8078.
                if slot <> 8078 or instruction <> 23774 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 222, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8079 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:237
//		TCF	DNTMEXIT	# GO SEND CHANNELS
// PORT: Fixed ROM slots 8079.
                if slot <> 8079 or instruction <> 6092 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6092, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:238
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:239
//WOZERO		CS	BIT7
// PORT: Fixed ROM slots 8080.
                if slot <> 8080 or instruction <> 18953 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8082 {
            if slot <= 8081 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:240
//		EXTEND
// PORT: Fixed ROM slots 8081.
                if slot <> 8081 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:241
//# Page 1098
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:242
//		WAND	CHAN13		# SET WORD ORDER CODE TO ZERO
// PORT: Fixed ROM slots 8082.
                if slot <> 8082 or instruction <> 1547 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8083 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:243
//		TC	Q		# RETURN TO CALLER
// PORT: Fixed ROM slots 8083.
                if slot <> 8083 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:244
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:245
//DODNPTR		INDEX	DNECADR		# DNECADR CONTAINS ADRES OF SUBLIST
// PORT: Fixed ROM slots 8084.
                if slot <> 8084 or instruction <> 20702 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[450] to agcAotUnit450@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:246
//		0	0		# CLEAR AND ADD LIST ENTRY INTO A.
// PORT: Fixed ROM slots 8085.
    8085, 0
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8086–8096.
function agcAotUnit451 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8090 {
        if slot <= 8087 {
            if slot <= 8086 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:247
//		CCS	A		# IS THIS A SNAPSHOT SUBLIST
// PORT: Fixed ROM slots 8086.
                if slot <> 8086 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:248
//		CA	DNECADR		# NO, IT IS A REGULAR SUBLIST.
// PORT: Fixed ROM slots 8087.
                if slot <> 8087 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8088 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:249
//		TCF	DOSUBLST	# A MUST NOT BE ZERO.
// PORT: Fixed ROM slots 8088.
                if slot <> 8088 or instruction <> 6080 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6080, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8089 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:250
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:251
//		XCH	DNECADR		# YES, IT IS A SNAPSHOT SUBLIST.
// PORT: Fixed ROM slots 8089.
                    if slot <> 8089 or instruction <> 23774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 222, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:252
//		TS	SUBLIST		# C(DNECADR) INTO SUBLIST
// PORT: Fixed ROM slots 8090.
                    if slot <> 8090 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8093 {
            if slot <= 8091 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:253
//		CAF	ZERO		#	A    INTO     A
// PORT: Fixed ROM slots 8091.
                if slot <> 8091 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8092 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:254
//		XCH	TMINDEX		# (NOTE.. TMINDEX = DNECADR)
// PORT: Fixed ROM slots 8092.
                    if slot <> 8092 or instruction <> 23774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 222, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:255
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:256
//# THE FOLLOWING CODING (FROM SNAPLOOP TO SNAPEND)IS FOR THE PURPOSE OF TAKING A SNAPSHOT OF 12 DP REGISTERS.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:257
//# THIS IS DONE BY SAVING 11 DP REGISTERS IN DNTMBUFF AND SENDING THE FIRST DP WORD IMMEDIATELY.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:258
//# THE SNAPSHOT PROCESSING IS THE MOST TIME CONSUMING AND THEREFORE THE CODING AND LIST STRUCTURE WERE DESIGNED
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:259
//# TO MINIMIZE TIME.  THE TIME OPTIMIZATION RESULTS IN RULES UNIQUE TO THE SNAPSHOT PORTION OF THE DOWNLIST.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:260
//# THESE RULES ARE......
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:261
//#	1.	ONLY 1DNADR'S CAN APPEAR IN THE SNAPSHOT SUBLIST
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:262
//#	2.	THE 1DNADR'S CANNOT REFER TO THE FIRST LOCATION IN ANY BANK.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:263
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:264
//SNAPLOOP	TS	EBANK		# SET EBANK
// PORT: Fixed ROM slots 8093.
                    if slot <> 8093 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8094 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:265
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// PORT: Fixed ROM slots 8094.
                if slot <> 8094 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
                if slot <= 8095 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:266
//		EXTEND
// PORT: Fixed ROM slots 8095.
                    if slot <> 8095 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:267
//		INDEX	A
// PORT: Fixed ROM slots 8096.
                    if slot <> 8096 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[451] to agcAotUnit451@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:268
//		EBANK=	1401
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:269
//		DCA	1401		# PICK UP 2 SNAPSHOT WORDS.
// PORT: Fixed ROM slots 8097.
    8097, 26116
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8098–8098.
function agcAotUnit452 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:270
//		EBANK=	DNTMBUFF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:271
//		INDEX	TMINDEX
// PORT: Fixed ROM slots 8098.
    if slot <> 8098 or instruction <> 20702 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[452] to agcAotUnit452@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:272
//		DXCH	DNTMBUFF	# STORE 2 SNAPSHOT WORDS IN BUFFER
// PORT: Fixed ROM slots 8099.
    8099, 43458
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8100–8103.
function agcAotUnit453 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8101 {
        if slot <= 8100 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:273
//		INCR	TMINDEX		# SET BUFFER INDEX FOR NEXT 2 WORDS.
// PORT: Fixed ROM slots 8100.
            if slot <> 8100 or instruction <> 10462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 222).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:274
//		INCR	TMINDEX
// PORT: Fixed ROM slots 8101.
            if slot <> 8101 or instruction <> 10462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 222).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8102 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:275
//SNAPAGN		INCR	SUBLIST		# SET POINTER TO NEXT 2 WORDS OF SNAPSHOT
// PORT: Fixed ROM slots 8102.
            if slot <> 8102 or instruction <> 10463 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 223).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:276
//		INDEX	SUBLIST
// PORT: Fixed ROM slots 8103.
            if slot <> 8103 or instruction <> 20703 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[453] to agcAotUnit453@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:277
//		0	0		# = CA SSSS (SSSS = NEXT ENTRY IN SUBLIST)
// PORT: Fixed ROM slots 8104.
    8104, 0
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8105–8106.
function agcAotUnit454 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8105 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:278
//		CCS	A		# TEST FOR LAST TWO WORDS OF SNAPSHOT.
// PORT: Fixed ROM slots 8105.
        if slot <> 8105 or instruction <> 4096 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:279
//		TCF	SNAPLOOP	# NOT LAST TWO.
// PORT: Fixed ROM slots 8106.
        if slot <> 8106 or instruction <> 6045 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6045, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[454] to agcAotUnit454@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:280
//LDNPHAS2	GENADR	DNPHASE2
// PORT: Fixed ROM slots 8107.
    8107, 3772
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8108–8115.
function agcAotUnit455 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8111 {
        if slot <= 8109 {
            if slot <= 8108 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:281
//		TS	SUBLIST		# YES, LAST.  SAVE A.
// PORT: Fixed ROM slots 8108.
                if slot <> 8108 or instruction <> 22751 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22751, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:282
//		CA	NEGONE		# SET DNECADR AND
// PORT: Fixed ROM slots 8109.
                if slot <> 8109 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8110 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:283
//		TS	DNECADR		#	SUBLIST POINTERS
// PORT: Fixed ROM slots 8110.
                if slot <> 8110 or instruction <> 22750 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22750, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:284
//		XCH	SUBLIST		#		TO NEGATIVE VALUES.
// PORT: Fixed ROM slots 8111.
                if slot <> 8111 or instruction <> 23775 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 223, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8113 {
            if slot <= 8112 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:285
//		TS	EBANK
// PORT: Fixed ROM slots 8112.
                if slot <> 8112 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:286
//		MASK	LOW8
// PORT: Fixed ROM slots 8113.
                if slot <> 8113 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 8114 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:287
//		EXTEND
// PORT: Fixed ROM slots 8114.
                if slot <> 8114 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:288
//		INDEX	A
// PORT: Fixed ROM slots 8115.
                if slot <> 8115 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[455] to agcAotUnit455@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:289
//		EBANK=	1401
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:290
//# Page 1099
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:291
//		DCA	1401		# PICK UP FIRST 2 WORDS OF SNAPSHOT.
// PORT: Fixed ROM slots 8116.
    8116, 26116
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8117–8125.
function agcAotUnit456 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8120 {
        if slot <= 8118 {
            if slot <= 8117 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:292
//		EBANK=	DNTMBUFF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:293
//SNAPEND		TCF	DNTMEXIT	# 	NOW GO SEND THEM.
// PORT: Fixed ROM slots 8117.
                if slot <> 8117 or instruction <> 6092 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6092, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:294
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:295
//FETCH2WD	CA	DNECADR
// PORT: Fixed ROM slots 8118.
                if slot <> 8118 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8119 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:296
//		TS	EBANK		# SET EBANK
// PORT: Fixed ROM slots 8119.
                if slot <> 8119 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:297
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS
// PORT: Fixed ROM slots 8120.
                if slot <> 8120 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 8122 {
            if slot <= 8121 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:298
//		TS	L
// PORT: Fixed ROM slots 8121.
                if slot <> 8121 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:299
//		CA	DNADRDCR	# DECREMENT COUNT AND ECADR
// PORT: Fixed ROM slots 8122.
                if slot <> 8122 or instruction <> 14180 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1892), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8123 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:300
//		ADS	DNECADR
// PORT: Fixed ROM slots 8123.
                if slot <> 8123 or instruction <> 11486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8124 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:301
//		EXTEND
// PORT: Fixed ROM slots 8124.
                    if slot <> 8124 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:302
//		INDEX	L
// PORT: Fixed ROM slots 8125.
                    if slot <> 8125 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[456] to agcAotUnit456@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:303
//		EBANK=	1400
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:304
//		DCA	1400		# PICK UP 2 DATA WORDS
// PORT: Fixed ROM slots 8126.
    8126, 26114
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8127–8129.
function agcAotUnit457 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8127 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:305
//		EBANK=	DNTMBUFF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:306
//		TCF	DNTMEXIT	# 	NOW GO SEND THEM.
// PORT: Fixed ROM slots 8127.
        if slot <> 8127 or instruction <> 6092 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6092, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8128 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:307
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:308
//DOSUBLST	TS	SUBLIST		# SET SUBLIST POINTER
// PORT: Fixed ROM slots 8128.
            if slot <> 8128 or instruction <> 22751 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22751, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:309
//NEXTINSL	INDEX	SUBLIST
// PORT: Fixed ROM slots 8129.
            if slot <> 8129 or instruction <> 20703 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:310
//		0	0		# = CA SSSS (SSSS = NEXT ENTRY IN SUBLIST)
// PORT: Fixed ROM slots 8130.
    8130, 0
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8131–8154.
function agcAotUnit458 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8142 {
        if slot <= 8136 {
            if slot <= 8133 {
                if slot <= 8131 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:311
//		CCS	A		# IS IT THE END OF THE SUBLIST
// PORT: Fixed ROM slots 8131.
                    if slot <> 8131 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8132 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:312
//		INCR	SUBLIST		# NO-
// PORT: Fixed ROM slots 8132.
                        if slot <> 8132 or instruction <> 10463 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 223).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:313
//		TCF	+4
// PORT: Fixed ROM slots 8133.
                        if slot <> 8133 or instruction <> 6089 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6089, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8134 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:314
//		TS	SUBLIST		# SAVE A.
// PORT: Fixed ROM slots 8134.
                    if slot <> 8134 or instruction <> 22751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8135 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:315
//		CA	NEGONE		# SET SUBLIST TO MINUS
// PORT: Fixed ROM slots 8135.
                        if slot <> 8135 or instruction <> 16334 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:316
//		XCH	SUBLIST		# RETRIEVE A.
// PORT: Fixed ROM slots 8136.
                        if slot <> 8136 or instruction <> 23775 { return choose false if checkOnly else -1. }
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
            if slot <= 8139 {
                if slot <= 8137 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:317
//	+4	INCR	A
// PORT: Fixed ROM slots 8137.
                    if slot <> 8137 or instruction <> 10240 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8138 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:318
// 		TS	DNECADR		# SAVE DNADR
// PORT: Fixed ROM slots 8138.
                        if slot <> 8138 or instruction <> 22750 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22750, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:319
//		TCF	SETWO +2	# GO USE COMMON CODING(PROBLEMS WOULD
// PORT: Fixed ROM slots 8139.
                        if slot <> 8139 or instruction <> 6015 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6015, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8140 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:320
//					# OCCUR IF THE PROGRAM ENCOUNTERED A
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:321
//					# DNPTR NOW)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:322
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:323
//DNTMEXIT	EXTEND			# DOWN-TELEMETRY EXIT
// PORT: Fixed ROM slots 8140.
                    if slot <> 8140 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8141 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:324
//		WRITE	DNTM1		# TO SEND A + L TO CHANNELS 34 + 35
// PORT: Fixed ROM slots 8141.
                        if slot <> 8141 or instruction <> 540 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 28, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:325
//		CA	L		# RESPECTIVELY
// PORT: Fixed ROM slots 8142.
                        if slot <> 8142 or instruction <> 12289 { return choose false if checkOnly else -1. }
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
        if slot <= 8148 {
            if slot <= 8145 {
                if slot <= 8143 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:326
//TMEXITL		EXTEND
// PORT: Fixed ROM slots 8143.
                    if slot <> 8143 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8144 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:327
//		WRITE	DNTM2
// PORT: Fixed ROM slots 8144.
                        if slot <> 8144 or instruction <> 541 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 1, 29, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:328
//TMRESUME	TCF	RESUME		# EXIT TELEMETRY PROGRAM VIA RESUME.
// PORT: Fixed ROM slots 8145.
                        if slot <> 8145 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8146 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:329
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:330
//MINB12		EQUALS	-1/8
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:331
//DNECADR		EQUALS	TMINDEX
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:332
//CTLIST		EQUALS	LDATALST
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:333
//SUBLIST		EQUALS 	DNQ
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:334
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:335
//# Page 1100
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:336
//# SUBROUTINE NAME- DNDUMP
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:337
//# FUNCTIONAL DESCRIPTION - TO SEND(DUMP) ALL ERASABLE STORAGE 'N' TIMES.(N = 1 TO 4).  BANKS ARE SENT ONE AT A TIME
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:338
//#	EACH BANK IS PRECEDED BY AN ID WORD, SYNCH BITS, ECADR AND TIME1 FOLLOWED BY THE 256D WORDS OF EACH
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:339
//#	EBANK.  EBANKS ARE DUMPED IN ORDER(I.E. EBANK 0 FIRST, THEN EBANK1 ETC.)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:340
//# CALLING SEQUENCE- THE GROUND OR ASTRONAUT BY KEYING V74E CAN INITIALIZE THE DUMP.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:341
//#	AFTER KEYING IN V74E THE CURRENT DOWNLIST WILL BE IMMEDIATELY TERMINATED AND THE DOWNLINK ERASABLE DUMP
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:342
//#	WILL BEGIN.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:343
//#	ONCE INITIATED THE DOWNLINK ERASABLE DUMP CAN BE TERMINATED (AND INTERRUPTED DOWNLIST REINSTATED) ONLY
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:344
//#	BY THE FOLLOWING:
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:345
//#	1. A FRESH START
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:346
//#	2. COMPLETION OF ALL DOWNLINK DUMPS REQUESTED (ACCORDING TO BITS SET IN DUMPCNT).  NOTE THAT DUMPCNT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:347
//#	   CAN BE ALTERED BY A V21N01.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:348
//#	3. AND INVOLUNTARILY BY A RESTART.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:349
//# NORMAL EXIT MODE- TCF DNPHASE1
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:350
//# ALARM OR ABORT MODE- NONE
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:351
//# *SUBROUTINES CALLED- NONE.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:352
//# ERASABLE INITIALIZATION REQUIRED --
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:353
//#	DUMPCNT	OCT 20000	IF 4 COMPLETE ERASABLE DUMPS ARE DESIRED
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:354
//#	DUMPCNT OCT 10000	IF 2 COMPLETE ERASABLE DUMPS ARE DESIRED
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:355
//#	DUMPCNT	OCT 04000	IF 1 COMPLETE ERASABLE DUMP  IS  DESIRED
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:356
//# DEBRIS- DUMPLOC, DUMPSW, DNTMGOTO, EBANK AND CENTRAL REGISTERS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:357
//# TIMING-	TIME (IN SECS) = ((NO.DUMPS)*(NO.EBANKS)* (WDSPEREBANK + NO.IDWDS)) / NO.WDSPERSEC
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:358
//#		TIME (IN SECS) =  (   4    )*(    8    )* (    256     +     4   )  /     100
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:359
//#	   THUS TIME (IN SECS TO SEND DUMP OF ERASABLE 4 TIMES VIA DOWNLINK) = 83.2 SECONDS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:360
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:361
//# STRUCTURE OF ONE EBANK AS IT IS SENT BY DOWNLINK PROGRAM-
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:362
//#	(REMINDER-THIS ONLY DESCRIBES ONE OF THE 8 EBANKS X 4 (DUMPS) = 32 EBANKS WHICH WILL BE SENT BY DNDUMP)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:363
//#	 DOWNLIST				W
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:364
//#	  WORD	TAKEN FROM CONTENTS OF	EXAMPLE	O	COMMENTS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:365
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:366
//#	    1	ERASID			 0177X	0	DOWNLIST I.D. FOR DOWNLINK ERASABLE DUMP (X=7 CSM, 6 LM)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:367
//#	    2	LOWIDCOD		 77340 	1	DOWNLINK SYNCH BITS.(SAME ONE USED IN ALL OTHER DOWNLISTS)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:368
//#	    3	DUMPLOC			 13400	1	(SEE NOTES ON DUMPLOC)1= 3RD ERAS DUMP, 3400=ECADR OF 5TH WD
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:369
//#	    4	TIME1			 14120	1	TIME IN CENTISECONDS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:370
//#	    5	FIRST WORD OF EBANK X	 03400	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1400 (ECADR 3400)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:371
//#	    6	2ND   WORD OF EBANK X	 00142	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1401 (ECADR 3401)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:372
//#	    7.  3RD   WORD OF EBANK X	 00142	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1402 (ECADR 3402)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:373
//#	    .					1
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:374
//#	    .					1
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:375
//#	    .					1
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:376
//#	 260D	256TH WORD OF EBANK X	 03777	1	IN THIS EXAMPLE THIS WORD = CONTENTS OF E7,1777 (ECADR 3777)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:377
//#
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:378
//# NOTE-	DUMPLOC CONTAINS THE COUNTER AND ECADR FOR EACH WORD BEING SENT.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:379
//#	THE BIT STRUCTURE OF DUMPLOC IS FOLLOWS--
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:380
//#						X = NOT USED
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:381
//#		X ABC EEE RRRRRRRR	      ABC = ERASABLE DUMP COUNTER(I.E. ABC = 0,1,2, OR 3 WHICH MEANS THAT
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:382
//#						    COMPLETE ERASABLE DUMP NUMBER 1,2,3, OR 4 RESPECTIVELY IS IN PROGRESS)
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:383
//#					      EEE = EBANK BITS
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:384
//#					 RRRRRRRR = RELATIVE ADDRESS WITHIN AN EBANK.
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:385
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:386
//# Page 1101
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:387
//DNDUMPI		CA	ZERO		# INITIALIZE DOWNLINK
// PORT: Fixed ROM slots 8146.
                    if slot <> 8146 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8147 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:388
//		TS	DUMPLOC		# ERASABLE DUMP
// PORT: Fixed ROM slots 8147.
                        if slot <> 8147 or instruction <> 22750 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22750, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:389
//	+2	TC	SENDID		# GO SEND ID AND SYNCH BITS
// PORT: Fixed ROM slots 8148.
                        if slot <> 8148 or instruction <> 2038 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2038, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8151 {
                if slot <= 8149 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:390
//		CA	LDNDUMP1	# SET DNTMGOTO
// PORT: Fixed ROM slots 8149.
                    if slot <> 8149 or instruction <> 14300 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2012), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8150 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:391
//		TS	DNTMGOTO	# TO LOCATION FOR NEXT PASS
// PORT: Fixed ROM slots 8150.
                        if slot <> 8150 or instruction <> 22749 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22749, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:392
//		CA	TIME1		# PLACE TIME1
// PORT: Fixed ROM slots 8151.
                        if slot <> 8151 or instruction <> 12309 { return choose false if checkOnly else -1. }
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
                if slot <= 8152 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:393
//		XCH	L		# INTO L
// PORT: Fixed ROM slots 8152.
                    if slot <> 8152 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8153 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:394
//		CA	DUMPLOC		# AND ECADR OF THIS EBANK INTO A
// PORT: Fixed ROM slots 8153.
                        if slot <> 8153 or instruction <> 12510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 222).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:395
//		TCF	DNTMEXIT	# SEND DUMPLOC AND TIME1
// PORT: Fixed ROM slots 8154.
                        if slot <> 8154 or instruction <> 6092 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6092, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[458] to agcAotUnit458@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:396
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:397
//LDNDUMP		ADRES	DNDUMP
// PORT: Fixed ROM slots 8155.
    8155, 4026,
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:398
//LDNDUMP1	ADRES	DNDUMP1
// PORT: Fixed ROM slots 8156.
    8156, 4048
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8157–8163.
function agcAotUnit459 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8159 {
        if slot <= 8157 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:399
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:400
//DNDUMP		CA	TWO		# INCREMENT ECADR IN DUMPLOC
// PORT: Fixed ROM slots 8157.
            if slot <> 8157 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8158 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:401
//		ADS	DUMPLOC		# TO NEXT DP WORD TO BE
// PORT: Fixed ROM slots 8158.
                if slot <> 8158 or instruction <> 11486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:402
//		MASK	LOW8		# DUMPED AND SAVE IT.
// PORT: Fixed ROM slots 8159.
                if slot <> 8159 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 8161 {
            if slot <= 8160 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:403
//		CCS	A		# IS THIS THE BEGINNING OF A NEW EBANK
// PORT: Fixed ROM slots 8160.
                if slot <> 8160 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:404
//		TCF	DNDUMP2		# NO- THEN CONTINUE DUMPING
// PORT: Fixed ROM slots 8161.
                if slot <> 8161 or instruction <> 6122 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8162 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:405
//		CA	DUMPLOC		# YES- IS THIS THE END OF THE
// PORT: Fixed ROM slots 8162.
                if slot <> 8162 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:406
//		MASK	DUMPCNT		# N TH(N = 1 TO 4) COMPLETE ERASABLE
// PORT: Fixed ROM slots 8163.
                if slot <> 8163 or instruction <> 28891 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[459] to agcAotUnit459@.

// PORT: Physical bank 05. Shared continuation entries, slots 8164–8176.
function agcAotUnit460 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8169 {
        if slot <= 8166 {
            if slot <= 8164 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:407
//		MASK	PRIO34		# DUMP(BIT14 FOR 4, BIT13 FOR 2 OR BIT12
// PORT: Fixed ROM slots 8164.
                if slot <> 8164 or instruction <> 32697 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4025), 32768).
                    if fixedOperand = 14336 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 8) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8165 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:408
//		CCS	A		# FOR 1 COMPLETE ERASABLE DUMP(S)).
// PORT: Fixed ROM slots 8165.
                    if slot <> 8165 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:409
//		TCF	DNPHASE1	# YES- START SENDING INTERRUPTED DOWNLIST
// PORT: Fixed ROM slots 8166.
                    if slot <> 8166 or instruction <> 5976 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5976, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 8167 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:410
//					# AGAIN
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:411
//		TCF	DNDUMPI +2	# NO- GO BACK AND INITIALIZE NEXT BANK
// PORT: Fixed ROM slots 8167.
                if slot <> 8167 or instruction <> 6100 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6100, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8168 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:412
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:413
//DNDUMP1		CA	LDNDUMP		# SET DNTMGOTO
// PORT: Fixed ROM slots 8168.
                    if slot <> 8168 or instruction <> 14299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2011), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:414
//		TS	DNTMGOTO	# FOR WORDS 3 TO 256D OF CURRENT EBANK
// PORT: Fixed ROM slots 8169.
                    if slot <> 8169 or instruction <> 22749 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22749, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 8172 {
            if slot <= 8170 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:415
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:416
//DNDUMP2		CA	DUMPLOC
// PORT: Fixed ROM slots 8170.
                if slot <> 8170 or instruction <> 12510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 222).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8171 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:417
//		TS	EBANK		# SET EBANK
// PORT: Fixed ROM slots 8171.
                    if slot <> 8171 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:418
//		MASK	LOW8		# ISOLATE RELATIVE ADDRESS.
// PORT: Fixed ROM slots 8172.
                    if slot <> 8172 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 8174 {
                if slot <= 8173 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:419
//		TS	Q		# (NOTE: MASK INSTRUCTION IS USED TO PICK
// PORT: Fixed ROM slots 8173.
                    if slot <> 8173 or instruction <> 22530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:420
//		CA	NEG0		# UP ERASABLE REGISTERS SO THAT EDITING
// PORT: Fixed ROM slots 8174.
                    if slot <> 8174 or instruction <> 14864 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8175 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:421
//		TS	L		# REGISTERS 20-23 WILL NOT BE ALTERED.)
// PORT: Fixed ROM slots 8175.
                    if slot <> 8175 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:422
//		INDEX	Q
// PORT: Fixed ROM slots 8176.
                    if slot <> 8176 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[460] to agcAotUnit460@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:423
//		EBANK=	1400		# PICK UP LOW ORDER REGISTER OF PAIR
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:424
//		MASK	1401		# OF ERASABLE REGISTERS.
// PORT: Fixed ROM slots 8177.
    8177, 58882
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8178–8179.
function agcAotUnit461 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8178 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:425
//		XCH	L
// PORT: Fixed ROM slots 8178.
        if slot <> 8178 or instruction <> 23553 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreExchange(words, 0, 1, readPhysical).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:426
//		INDEX	Q		# PICK UP HIGH ORDER REGISTER OF PAIR
// PORT: Fixed ROM slots 8179.
        if slot <> 8179 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[461] to agcAotUnit461@.

agcAotInstallSourceRope(list(
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:427
//		MASK	1400		# OF ERASABLE REGISTERS.
// PORT: Fixed ROM slots 8180.
    8180, 58880
)).

// PORT: Physical bank 05. Shared continuation entries, slots 8181–8189.
function agcAotUnit462 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8184 {
        if slot <= 8182 {
            if slot <= 8181 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:428
//		EBANK=	DNTMBUFF
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:429
//		TCF	DNTMEXIT	# GO SEND THEM
// PORT: Fixed ROM slots 8181.
                if slot <> 8181 or instruction <> 6092 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6092, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:430
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:431
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:432
//SENDID		EXTEND			# **ENTRANCE USED BY ERASABLE DUMP PROG.**
// PORT: Fixed ROM slots 8182.
                if slot <> 8182 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8183 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:433
//		QXCH	DNTMGOTO	# SET DNTMGOTO SO NEXT TIME PROG WILL GO
// PORT: Fixed ROM slots 8183.
                if slot <> 8183 or instruction <> 9437 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 221, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:434
//		CAF	ERASID		# TO LOCATION FOLLOWING :TC SENDID:
// PORT: Fixed ROM slots 8184.
                if slot <> 8184 or instruction <> 14892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8186 {
            if slot <= 8185 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:435
//
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:436
//		TS	L		# **ENTRANCE USED BY REGULAR DOWNLINK PG**
// PORT: Fixed ROM slots 8185.
                if slot <> 8185 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:437
//# Page 1102
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:438
//		TC	WOZERO		# GO SET WORD ORDER CODE TO ZERO
// PORT: Fixed ROM slots 8186.
                if slot <> 8186 or instruction <> 1936 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1936, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8187 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:439
//		CAF	LOWIDCOD	# PLACE SPECIAL ID CODE INTO L
// PORT: Fixed ROM slots 8187.
                if slot <> 8187 or instruction <> 13312 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 8188 {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:440
//		XCH	L		# AND ID BACK INTO A
// PORT: Fixed ROM slots 8188.
                    if slot <> 8188 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE DOWN-TELEMETRY_PROGRAM.agc:441
//		TCF	DNTMEXIT	# SEND DOWNLIST ID CODE(S).
// PORT: Fixed ROM slots 8189.
                    if slot <> 8189 or instruction <> 6092 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6092, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[462] to agcAotUnit462@.

