// AGC_BLOCK_TWO_SELF-CHECK.agc
agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:1
//# Copyright:	Public domain.
// AGC_BLOCK_TWO_SELF-CHECK.agc:2
//# Filename:	AGC_BLOCK_TWO_SELF-CHECK.agc
// AGC_BLOCK_TWO_SELF-CHECK.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// AGC_BLOCK_TWO_SELF-CHECK.agc:4
//#		It is part of the source code for the Command Module's (CM)
// AGC_BLOCK_TWO_SELF-CHECK.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// AGC_BLOCK_TWO_SELF-CHECK.agc:6
//# Assembler:	yaYUL
// AGC_BLOCK_TWO_SELF-CHECK.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// AGC_BLOCK_TWO_SELF-CHECK.agc:8
//# Website:	www.ibiblio.org/apollo.
// AGC_BLOCK_TWO_SELF-CHECK.agc:9
//# Pages:	1394-1403
// AGC_BLOCK_TWO_SELF-CHECK.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// AGC_BLOCK_TWO_SELF-CHECK.agc:11
//#				from the Colossus249/ file of the same
// AGC_BLOCK_TWO_SELF-CHECK.agc:12
//#				name, using Comanche055 page images.
// AGC_BLOCK_TWO_SELF-CHECK.agc:13
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// AGC_BLOCK_TWO_SELF-CHECK.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// AGC_BLOCK_TWO_SELF-CHECK.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// AGC_BLOCK_TWO_SELF-CHECK.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// AGC_BLOCK_TWO_SELF-CHECK.agc:18
//# consequent reduction in image quality as well) are available online at
// AGC_BLOCK_TWO_SELF-CHECK.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// AGC_BLOCK_TWO_SELF-CHECK.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// AGC_BLOCK_TWO_SELF-CHECK.agc:21
//# (much) higher-quality images which Paul actually created.
// AGC_BLOCK_TWO_SELF-CHECK.agc:22
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:23
//# Notations on the hardcopy document read, in part:
// AGC_BLOCK_TWO_SELF-CHECK.agc:24
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:25
//#    Assemble revision 055 of AGC program Comanche by NASA
// AGC_BLOCK_TWO_SELF-CHECK.agc:26
//#    2021113-051.  10:28 APR. 1, 1969
// AGC_BLOCK_TWO_SELF-CHECK.agc:27
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:28
//#    This AGC program shall also be referred to as
// AGC_BLOCK_TWO_SELF-CHECK.agc:29
//#            Colossus 2A
// AGC_BLOCK_TWO_SELF-CHECK.agc:30
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:31
//# Page 1394
// AGC_BLOCK_TWO_SELF-CHECK.agc:32
//# PROGRAM DESCRIPTION				DATE  20 DECEMBER 1967
// AGC_BLOCK_TWO_SELF-CHECK.agc:33
//# PROGRAM NAME - SELF-CHECK			LOG SECTION  AGC BLOCK TWO SELF-CHECK
// AGC_BLOCK_TWO_SELF-CHECK.agc:34
//# MOD NO -  1					ASSEMBLY SUBROUTINE UTILITYM REV 25
// AGC_BLOCK_TWO_SELF-CHECK.agc:35
//# MOD BY - GAUNTT
// AGC_BLOCK_TWO_SELF-CHECK.agc:36
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:37
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:38
//# FUNCTIONAL DESCRIPTION
// AGC_BLOCK_TWO_SELF-CHECK.agc:39
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:40
//# 	PROGRAM HAS TWO MAIN PARTS. THE FIRST IS SELF-CHECK WHICH RUNS AS A ZERO PRIORITY JOB WITH NO CORE SET, AS
// AGC_BLOCK_TWO_SELF-CHECK.agc:41
//# PART OF THE BACK-UP IDLE LOOP. THE SECOND IS SHOW-BANKSUM WHICH RUNS AS A REGULAR EXECUTIVE JOB WITH ITS OWN
// AGC_BLOCK_TWO_SELF-CHECK.agc:42
//# STARTING VERB.
// AGC_BLOCK_TWO_SELF-CHECK.agc:43
//# 	THE PURPOSE OF SELF-CHECK IS TO CHECK OUT VARIOUS PARTS OF THE COMPUTER AS OUTLINED BELOW IN THE OPTIONS.
// AGC_BLOCK_TWO_SELF-CHECK.agc:44
//# 	THE PURPOSE OF SHOW-BANKSUM IS TO DISPLAY THE SUM OF EACH BANK , ONE AT A TIME.
// AGC_BLOCK_TWO_SELF-CHECK.agc:45
//# 	IN ALL THERE ARE  7 POSSIBLE OPTIONS IN THIS BLOCK II VERSION OF SELF-CHECK. MORE DETAIL DESCRIPTION MAY BE
// AGC_BLOCK_TWO_SELF-CHECK.agc:46
//# FOUND IN E-2065 BLOCK II AGC SELF-CHECK AND SHOW BANKSUM BY EDWIN D. SMALLY DECEMBER 1966, AND ADDENDA 2 AND 3.
// AGC_BLOCK_TWO_SELF-CHECK.agc:47
//# 	THE DIFFERENT OPTIONS ARE CONTROLLED BY PUTTING DIFFERENT NUMBERS IN THE SMODE REGISTER (NOUN 27). BELOW IS
// AGC_BLOCK_TWO_SELF-CHECK.agc:48
//# A DESCRIPTION OF WHAT PARTS OF THE COMPUTER THAT ARE CHECKED BY THE OPTIONS, AND THE CORRESPONDING NUMBER, IN
// AGC_BLOCK_TWO_SELF-CHECK.agc:49
//# OCTAL, TO LOAD INTO SMODE.
// AGC_BLOCK_TWO_SELF-CHECK.agc:50
//# +-4	ERASABLE MEMORY
// AGC_BLOCK_TWO_SELF-CHECK.agc:51
//# +-5	FIXED MEMORY
// AGC_BLOCK_TWO_SELF-CHECK.agc:52
//# +-1,2,3,6,7,10   EVERYTHING IN OPTIONS 4 AND 5.
// AGC_BLOCK_TWO_SELF-CHECK.agc:53
//# -0	SAME AS +-10 UNTIL AN ERROR IS DETECTED.
// AGC_BLOCK_TWO_SELF-CHECK.agc:54
//# +0	NO CHECK, PUTS COMPUTER INTO THE BACKUP IDLE LOOP.
// AGC_BLOCK_TWO_SELF-CHECK.agc:55
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:56
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:57
//# WARNINGS
// AGC_BLOCK_TWO_SELF-CHECK.agc:58
//# 	USE OF E MEMORY RESERVED FOR SELF-CHECK (EVEN IN IDLE LOOP) AS TEMP STORAGE BY OTHER PROGRAMS IS DANGEROUS.
// AGC_BLOCK_TWO_SELF-CHECK.agc:59
//# 	SMODE SET GREATER THAN OCT 10 PUTS COMPUTER INTO BACKUP IDLE LOOP.
// AGC_BLOCK_TWO_SELF-CHECK.agc:60
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:61
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:62
//# CALLING SEQUENCE
// AGC_BLOCK_TWO_SELF-CHECK.agc:63
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:64
//# 	TO CALL SELF-CHECK KEY IN
// AGC_BLOCK_TWO_SELF-CHECK.agc:65
//# 	     V 21 N 27 E  OPTION NUMBER E
// AGC_BLOCK_TWO_SELF-CHECK.agc:66
//# 	TO CALL SHOW-BANKSUM KEY IN
// AGC_BLOCK_TWO_SELF-CHECK.agc:67
//# 	     V 91 E	    DISPLAYS FIRST BANK
// AGC_BLOCK_TWO_SELF-CHECK.agc:68
//# 	     V 33 E	    PROCEED, DISPLAYS NEXT BANK
// AGC_BLOCK_TWO_SELF-CHECK.agc:69
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:70
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:71
//# EXIT MODES, NORMAL AND ALARM
// AGC_BLOCK_TWO_SELF-CHECK.agc:72
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:73
//# 	SELF-CHECK NORMALLY CONTINUES INDEFINITELY UNLESS THERE IS AN ERROR DETECTED. IF SO + OPTION NUMBERS PUT
// AGC_BLOCK_TWO_SELF-CHECK.agc:74
//# COMPUTER INTO BACKUP IDLE LOOP, - OPTION NUMBERS RESTART THE OPTION.
// AGC_BLOCK_TWO_SELF-CHECK.agc:75
//# 	THE -0 OPTION PROCEEDS FROM THE LINE FOLLOWING THE LINE WHERE THE ERROR WAS DETECTED.
// AGC_BLOCK_TWO_SELF-CHECK.agc:76
//# 	SHOW-BANKSUM PROCEEDS UNTIL A TERMINATE IS KEYED IN (V 34 E). THE COMPUTER IS PUT INTO THE BACKUP IDLE LOOP
// AGC_BLOCK_TWO_SELF-CHECK.agc:77
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:78
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:79
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:80
//# OUTPUT
// AGC_BLOCK_TWO_SELF-CHECK.agc:81
//# Page 1395
// AGC_BLOCK_TWO_SELF-CHECK.agc:82
//# 	SELF-CHECK UPON DETECTING AN ERROR LOADS THE SELF-CHECK ALARM CONSTANT (01102) INTO THE FAILREG SET AND
// AGC_BLOCK_TWO_SELF-CHECK.agc:83
//# TURNS ON THE ALARM LIGHT. THE OPERATOR MAY THEN DISPLAY THE THREE FAILREGS BY KEYING IN V 05 N 09 E. FOR FURTHER
// AGC_BLOCK_TWO_SELF-CHECK.agc:84
//# INFORMATION HE MAY KEY IN V 05 N 08 E, THE DSKY DISPLAY IN R1 WILL BE ADDRESS+1 OF WHERE THE ERROR WAS DETECTED,
// AGC_BLOCK_TWO_SELF-CHECK.agc:85
//# IN R2 THE BBCON OF SELF-CHECK, AND IN R3 THE TOTAL NUMBER OF ERRORS DETECTED BY SELF-CHECK SINCE THE LAST MAN
// AGC_BLOCK_TWO_SELF-CHECK.agc:86
//# INITIATED FRESH START (SLAP1).
// AGC_BLOCK_TWO_SELF-CHECK.agc:87
//# 	SHOW-BANKSUM STARTING WITH BANK 0 DISPLAYS IN R1 THE BANK SUM (A +-NUMBER EQUAL TO THE BANK NUMBER), IN R2
// AGC_BLOCK_TWO_SELF-CHECK.agc:88
//# THE BANK NUMBER, AND IN R3 THE BUGGER WORD.
// AGC_BLOCK_TWO_SELF-CHECK.agc:89
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:90
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:91
//# ERASABLE INITIALIZATION REQUIRED
// AGC_BLOCK_TWO_SELF-CHECK.agc:92
//# 	ACCOMPLISHED BY FRESH START
// AGC_BLOCK_TWO_SELF-CHECK.agc:93
//# 		SMODE SET TO +0
// AGC_BLOCK_TWO_SELF-CHECK.agc:94
//#
// AGC_BLOCK_TWO_SELF-CHECK.agc:95
//# DEBRIS
// AGC_BLOCK_TWO_SELF-CHECK.agc:96
//# 	ALL EXITS FROM THE CHECK OF ERASABLE (ERASCHK) RESTORE ORIGINAL CONTENTS TO REGISTERS UNDER CHECK.
// AGC_BLOCK_TWO_SELF-CHECK.agc:97
//# EXCEPTION IS A RESTART. RESTART THAT OCCURS DURING ERASCHK RESTORES ERASABLE, UNLESS THERE IS EVIDENCE TO DOUBT
// AGC_BLOCK_TWO_SELF-CHECK.agc:98
//# E MEMORY, IN WHICH CASE PROGRAM THEN DOES A FRESH START (DOFSTART).
// AGC_BLOCK_TWO_SELF-CHECK.agc:99
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:100
//		BANK	25
// AGC_BLOCK_TWO_SELF-CHECK.agc:101
//		SETLOC	SELFCHEC
// AGC_BLOCK_TWO_SELF-CHECK.agc:102
//		BANK
// AGC_BLOCK_TWO_SELF-CHECK.agc:103
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:104
//		COUNT	43/SELF
// AGC_BLOCK_TWO_SELF-CHECK.agc:105
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:106
//SBIT1		EQUALS	BIT1
// AGC_BLOCK_TWO_SELF-CHECK.agc:107
//SBIT2		EQUALS	BIT2
// AGC_BLOCK_TWO_SELF-CHECK.agc:108
//SBIT3		EQUALS	BIT3
// AGC_BLOCK_TWO_SELF-CHECK.agc:109
//SBIT4		EQUALS	BIT4
// AGC_BLOCK_TWO_SELF-CHECK.agc:110
//SBIT5		EQUALS	BIT5
// AGC_BLOCK_TWO_SELF-CHECK.agc:111
//SBIT6		EQUALS	BIT6
// AGC_BLOCK_TWO_SELF-CHECK.agc:112
//SBIT7		EQUALS	BIT7
// AGC_BLOCK_TWO_SELF-CHECK.agc:113
//SBIT8		EQUALS	BIT8
// AGC_BLOCK_TWO_SELF-CHECK.agc:114
//SBIT9		EQUALS	BIT9
// AGC_BLOCK_TWO_SELF-CHECK.agc:115
//SBIT10		EQUALS	BIT10
// AGC_BLOCK_TWO_SELF-CHECK.agc:116
//SBIT11		EQUALS	BIT11
// AGC_BLOCK_TWO_SELF-CHECK.agc:117
//SBIT12		EQUALS	BIT12
// AGC_BLOCK_TWO_SELF-CHECK.agc:118
//SBIT13		EQUALS	BIT13
// AGC_BLOCK_TWO_SELF-CHECK.agc:119
//SBIT14		EQUALS	BIT14
// AGC_BLOCK_TWO_SELF-CHECK.agc:120
//SBIT15		EQUALS	BIT15
// AGC_BLOCK_TWO_SELF-CHECK.agc:121
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:122
//S+ZERO		EQUALS	ZERO
// AGC_BLOCK_TWO_SELF-CHECK.agc:123
//S+1		EQUALS	BIT1
// AGC_BLOCK_TWO_SELF-CHECK.agc:124
//S+2		EQUALS	BIT2
// AGC_BLOCK_TWO_SELF-CHECK.agc:125
//S+3		EQUALS	THREE
// AGC_BLOCK_TWO_SELF-CHECK.agc:126
//S+4		EQUALS	FOUR
// AGC_BLOCK_TWO_SELF-CHECK.agc:127
//S+5		EQUALS	FIVE
// AGC_BLOCK_TWO_SELF-CHECK.agc:128
//# Page 1396
// AGC_BLOCK_TWO_SELF-CHECK.agc:129
//S+6		EQUALS	SIX
// AGC_BLOCK_TWO_SELF-CHECK.agc:130
//S+7		EQUALS	SEVEN
// AGC_BLOCK_TWO_SELF-CHECK.agc:131
//S8BITS		EQUALS	LOW8		# 00377
// AGC_BLOCK_TWO_SELF-CHECK.agc:132
//CNTRCON		=	OCT50		# USED IN CNTRCHK
// AGC_BLOCK_TWO_SELF-CHECK.agc:133
//ERASCON1	OCTAL	00061		# USED IN ERASCHK
// slot 38556
    38556, 98
)).

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:134
//ERASCON2	OCTAL	01373		# USED IN ERASCHK
// slot 38557
    38557, 1526,
// AGC_BLOCK_TWO_SELF-CHECK.agc:135
//ERASCON6	=	OCT1400		# USED IN ERASCHK
// AGC_BLOCK_TWO_SELF-CHECK.agc:136
//ERASCON3	OCTAL	01461		# USED IN ERASCHK
// slot 38558
    38558, 1634,
// AGC_BLOCK_TWO_SELF-CHECK.agc:137
//ERASCON4	OCTAL	01773		# USED IN ERASCHK
// slot 38559
    38559, 2038,
// AGC_BLOCK_TWO_SELF-CHECK.agc:138
//S10BITS		EQUALS	LOW10		# 01777, USED IN ERASCHK
// AGC_BLOCK_TWO_SELF-CHECK.agc:139
//SBNK03		EQUALS	PRIO6		# 06000, USED IN ROPECHK
// AGC_BLOCK_TWO_SELF-CHECK.agc:140
//-MAXADRS	=	HI5		# FOR ROPECHK
// AGC_BLOCK_TWO_SELF-CHECK.agc:141
//SIXTY		OCTAL	00060
// slot 38560
    38560, 96,
// AGC_BLOCK_TWO_SELF-CHECK.agc:142
//SUPRCON		OCTAL	60017		# USED IN ROPECHK
// slot 38561
    38561, 49182,
// AGC_BLOCK_TWO_SELF-CHECK.agc:143
//S13BITS		OCTAL	17777
// slot 38562
    38562, 16382,
// AGC_BLOCK_TWO_SELF-CHECK.agc:144
//CONC+S1		OCTAL	25252		# USED IN CYCLSHFT
// slot 38563
    38563, 21844,
// AGC_BLOCK_TWO_SELF-CHECK.agc:145
//CONC+S2		OCTAL	52400		# USED IN CYCLSHFT
// slot 38564
    38564, 43520,
// AGC_BLOCK_TWO_SELF-CHECK.agc:146
//ERASCON5	OCTAL	76777
// slot 38565
    38565, 64510,
// AGC_BLOCK_TWO_SELF-CHECK.agc:147
//S-7		=	OCT77770
// AGC_BLOCK_TWO_SELF-CHECK.agc:148
//S-4		EQUALS	NEG4
// AGC_BLOCK_TWO_SELF-CHECK.agc:149
//S-3		EQUALS	NEG3
// AGC_BLOCK_TWO_SELF-CHECK.agc:150
//S-2		EQUALS	NEG2
// AGC_BLOCK_TWO_SELF-CHECK.agc:151
//S-1		EQUALS	NEGONE
// AGC_BLOCK_TWO_SELF-CHECK.agc:152
//S-ZERO		EQUALS	NEG0
// AGC_BLOCK_TWO_SELF-CHECK.agc:153
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:154
//		EBANK=	LST1
// AGC_BLOCK_TWO_SELF-CHECK.agc:155
//ADRS1		ADRES	SKEEP1
// slot 38566
    38566, 1522,
// AGC_BLOCK_TWO_SELF-CHECK.agc:156
//SELFADRS	ADRES	SELFCHK		# SELFCHK RETURN ADDRESS. SHOULD BE PUT
// slot 38567
    38567, 3520
)).

// bank 43, slots 38568-38573
function agcAotUnit2312 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38570 {
        if slot <= 38568 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:157
//					# IN SELFRET WHEN GOING FROM SELFCHK TO
// AGC_BLOCK_TWO_SELF-CHECK.agc:158
//					# SHOWSUM AND PUT IN SKEEP1 WHEN GOING
// AGC_BLOCK_TWO_SELF-CHECK.agc:159
//					# FROM SHOWSUM TO SELF-CHECK.
// AGC_BLOCK_TWO_SELF-CHECK.agc:160
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:161
//PRERRORS	CA	ERESTORE	# IS IT NECESSARY TO RESTORE ERASABLE
// slot 38568
            if slot <> 38568 or instruction <> 13040 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 752).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38569 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:162
//		EXTEND
// slot 38569
                if slot <> 38569 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:163
//		BZF	ERRORS		# NO
// slot 38570
                if slot <> 38570 or instruction <> 5809 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5809, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38571 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:164
//		EXTEND
// slot 38571
            if slot <> 38571 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38572 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:165
//		DCA	SKEEP5
// slot 38572
                if slot <> 38572 or instruction <> 13054 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:166
//		INDEX	SKEEP7
// slot 38573
                if slot <> 38573 or instruction <> 21247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2312] to agcAotUnit2312@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:167
//		DXCH	0000		# RESTORE THE TWO ERASABLE REGISTERS
// slot 38574
    38574, 43010
)).

// bank 43, slots 38575-38582
function agcAotUnit2313 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38578 {
        if slot <= 38576 {
            if slot <= 38575 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:168
//		CA	S+ZERO
// slot 38575
                if slot <> 38575 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:169
//		TS	ERESTORE
// slot 38576
                if slot <> 38576 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38577 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:170
//ERRORS		INHINT
// slot 38577
                if slot <> 38577 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:171
//		CA	Q
// slot 38578
                if slot <> 38578 or instruction <> 12290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38580 {
            if slot <= 38579 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:172
//		TS	SFAIL		# SAVE Q FOR FAILURE LOCATION
// slot 38579
                if slot <> 38579 or instruction <> 23279 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23279, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:173
//		TS	ALMCADR		# FOR DISPLAY WITH BBANK AND ERCOUNT
// slot 38580
                if slot <> 38580 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38581 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:174
//		INCR	ERCOUNT		# KEEP TRACK OF NUMBER OF MALFUNCTIONS.
// slot 38581
                if slot <> 38581 or instruction <> 10997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 757).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:175
//TCALARM2	TC	ALARM2
// slot 38582
                if slot <> 38582 or instruction <> 2986 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2986, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2313] to agcAotUnit2313@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:176
//		OCT	01102		# SELF-CHECK MALFUNCTION INDICATOR
// slot 38583
    38583, 1156
)).

// bank 43, slots 38584-38610
function agcAotUnit2314 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38596 {
        if slot <= 38589 {
            if slot <= 38586 {
                if slot <= 38584 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:177
//		CCS	SMODE
// slot 38584
                    if slot <> 38584 or instruction <> 4850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 754).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38585 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:178
//SIDLOOP		CA	S+ZERO
// slot 38585
                        if slot <> 38585 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:179
//# Page 1397
// AGC_BLOCK_TWO_SELF-CHECK.agc:180
//		TS	SMODE
// slot 38586
                        if slot <> 38586 or instruction <> 23282 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23282, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38587 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:181
//		TC	SELFCHK		# GO TO IDLE LOOP
// slot 38587
                    if slot <> 38587 or instruction <> 1760 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1760, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38588 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:182
//		TC	SFAIL		# CONTINUE WITH SELF-CHECK
// slot 38588
                        if slot <> 38588 or instruction <> 751 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 751, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:183
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:184
//-1CHK		CCS	A
// slot 38589
                        if slot <> 38589 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 38592 {
                if slot <= 38590 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:185
//		TCF	PRERRORS
// slot 38590
                    if slot <> 38590 or instruction <> 5800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5800, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38591 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:186
//		TCF	PRERRORS
// slot 38591
                        if slot <> 38591 or instruction <> 5800 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5800, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:187
//		CCS	A
// slot 38592
                        if slot <> 38592 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 38594 {
                    if slot <= 38593 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:188
//		TCF	PRERRORS
// slot 38593
                        if slot <> 38593 or instruction <> 5800 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5800, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:189
//		TC	Q
// slot 38594
                        if slot <> 38594 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38595 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:190
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:191
//SMODECHK	EXTEND
// slot 38595
                        if slot <> 38595 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:192
//		QXCH	SKEEP1
// slot 38596
                        if slot <> 38596 or instruction <> 9977 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 761, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38603 {
            if slot <= 38599 {
                if slot <= 38597 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:193
//		TC	CHECKNJ		# CHECK FOR NEW JOB
// slot 38597
                    if slot <> 38597 or instruction <> 1756 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1756, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38598 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:194
//		CCS	SMODE
// slot 38598
                        if slot <> 38598 or instruction <> 4850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 754).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:195
//		TC	SOPTIONS
// slot 38599
                        if slot <> 38599 or instruction <> 1740 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1740, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38601 {
                    if slot <= 38600 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:196
//		TC	SMODECHK +2	# TO BACKUP IDLE LOOP
// slot 38600
                        if slot <> 38600 or instruction <> 1733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1733, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:197
//		TC	SOPTIONS
// slot 38601
                        if slot <> 38601 or instruction <> 1740 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1740, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38602 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:198
//		INCR	SCOUNT
// slot 38602
                        if slot <> 38602 or instruction <> 10998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 758).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:199
//		TC	SKEEP1		# CONTINUE WITH SELF-CHECK
// slot 38603
                        if slot <> 38603 or instruction <> 761 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 761, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38606 {
                if slot <= 38604 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:200
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:201
//SOPTIONS	AD	S-7
// slot 38604
                    if slot <> 38604 or instruction <> 27609 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 3033), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38605 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:202
//		EXTEND
// slot 38605
                        if slot <> 38605 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:203
//		BZMF	+2		# FOR OPTIONS BELOW NINE.
// slot 38606
                        if slot <> 38606 or instruction <> 26320 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26320, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38608 {
                    if slot <= 38607 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:204
//BNKOPTN		TC	SIDLOOP		# ILLEGAL OPTION.  GO TO IDLE LOOP.
// slot 38607
                        if slot <> 38607 or instruction <> 1721 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1721, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:205
//		INCR	SCOUNT		# FOR OPTIONS BELOW NINE.
// slot 38608
                        if slot <> 38608 or instruction <> 10998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 758).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38609 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:206
//		AD	S+7
// slot 38609
                        if slot <> 38609 or instruction <> 27155 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:207
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:208
//		INDEX	A
// slot 38610
                        if slot <> 38610 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2314] to agcAotUnit2314@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:209
//		TC	SOPTION1
// slot 38611
    38611, 3496
)).

// bank 43, slots 38612-38622
function agcAotUnit2315 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38616 {
        if slot <= 38613 {
            if slot <= 38612 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:210
//SOPTION1	TC	SKEEP1		# WAS TC+TCF
// slot 38612
                if slot <> 38612 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:211
//SOPTION2	TC	SKEEP1		# WAS IN:OUT1
// slot 38613
                if slot <> 38613 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38614 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:212
//SOPTION3	TC	SKEEP1		# WAS COUNTCHK
// slot 38614
                if slot <> 38614 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38615 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:213
//SOPTION4	TC	ERASCHK
// slot 38615
                    if slot <> 38615 or instruction <> 1761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:214
//SOPTION5	TC	ROPECHK
// slot 38616
                    if slot <> 38616 or instruction <> 1874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1874, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38619 {
            if slot <= 38617 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:215
//SOPTION6	TC	SKEEP1
// slot 38617
                if slot <> 38617 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38618 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:216
//SOPTION7	TC	SKEEP1
// slot 38618
                    if slot <> 38618 or instruction <> 761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:217
//SOPTON10	TC	SKEEP1		# CONTINUE WITH SELF-CHECK
// slot 38619
                    if slot <> 38619 or instruction <> 761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38620 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:218
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:219
//CHECKNJ		EXTEND
// slot 38620
                if slot <> 38620 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38621 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:220
//		QXCH	SELFRET		# SAVE RETURN ADDRESS WHILE TESTING NEWJOB
// slot 38621
                    if slot <> 38621 or instruction <> 9969 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 753, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:221
//		TC	POSTJUMP	# TO SEE IF ANY JOBS HAVE BECOME ACTIVE.
// slot 38622
                    if slot <> 38622 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2315] to agcAotUnit2315@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:222
//		CADR	ADVAN
// slot 38623
    38623, 3378
)).

// bank 43, slots 38624-38653
function agcAotUnit2316 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38638 {
        if slot <= 38630 {
            if slot <= 38626 {
                if slot <= 38624 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:223
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:224
//SELFCHK		TC	SMODECHK	# ** CHARLEY, COME IN HERE
// slot 38624
                    if slot <> 38624 or instruction <> 1731 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1731, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38625 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:225
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:226
//# SKEEP7 HOLDS LOWEST OF TWO ADDRESSES BEING CHECKED.
// AGC_BLOCK_TWO_SELF-CHECK.agc:227
//# SKEEP6 HOLDS B(X+1).
// AGC_BLOCK_TWO_SELF-CHECK.agc:228
//# SKEEP5 HOLDS B(X).
// AGC_BLOCK_TWO_SELF-CHECK.agc:229
//# SKEEP4 HOLDS C(EBANK) DURING ERASLOOP AND CHECKNJ.
// AGC_BLOCK_TWO_SELF-CHECK.agc:230
//# Page 1398
// AGC_BLOCK_TWO_SELF-CHECK.agc:231
//# SKEEP3 HOLDS LAST ADDRESS BEING CHECKED (HIGHEST ADDRESS).
// AGC_BLOCK_TWO_SELF-CHECK.agc:232
//# SKEEP2 CONTROLS CHECKING OF NON-SWITCHABLE ERASABLE MEMORY WITH BANK NUMBERS IN EB.
// AGC_BLOCK_TWO_SELF-CHECK.agc:233
//# ERASCHK TAKES APPROXMATELY 7 SECONDS
// AGC_BLOCK_TWO_SELF-CHECK.agc:234
//ERASCHK		CA	S+1
// slot 38625
                        if slot <> 38625 or instruction <> 14863 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:235
//		TS	SKEEP2
// slot 38626
                        if slot <> 38626 or instruction <> 23290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38628 {
                    if slot <= 38627 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:236
//0EBANK		CA	S+ZERO
// slot 38627
                        if slot <> 38627 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:237
//		TS	EBANK
// slot 38628
                        if slot <> 38628 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38629 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:238
//		CA	ERASCON3	# 01461
// slot 38629
                        if slot <> 38629 or instruction <> 13982 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1694), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:239
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38630
                        if slot <> 38630 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38634 {
                if slot <= 38632 {
                    if slot <= 38631 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:240
//		CA	S10BITS		# 01777
// slot 38631
                        if slot <> 38631 or instruction <> 14892 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:241
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38632
                        if slot <> 38632 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38633 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:242
//		TC	ERASLOOP
// slot 38633
                        if slot <> 38633 or instruction <> 1785 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1785, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:243
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:244
//E134567B	CA	ERASCON6	# 01400
// slot 38634
                        if slot <> 38634 or instruction <> 14889 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38636 {
                    if slot <= 38635 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:245
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38635
                        if slot <> 38635 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:246
//		CA	S10BITS		# 01777
// slot 38636
                        if slot <> 38636 or instruction <> 14892 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38637 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:247
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38637
                        if slot <> 38637 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:248
//		TC	ERASLOOP
// slot 38638
                        if slot <> 38638 or instruction <> 1785 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1785, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38645 {
            if slot <= 38641 {
                if slot <= 38639 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:249
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:250
//2EBANK		CA	ERASCON6	# 01400
// slot 38639
                    if slot <> 38639 or instruction <> 14889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38640 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:251
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38640
                        if slot <> 38640 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:252
//		CA	ERASCON4	# 01773
// slot 38641
                        if slot <> 38641 or instruction <> 13983 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1695), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38643 {
                    if slot <= 38642 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:253
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38642
                        if slot <> 38642 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:254
//		TC	ERASLOOP
// slot 38643
                        if slot <> 38643 or instruction <> 1785 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1785, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38644 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:255
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:256
//NOEBANK		TS	SKEEP2		# +0
// slot 38644
                        if slot <> 38644 or instruction <> 23290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:257
//		CA	ERASCON1	# 00061
// slot 38645
                        if slot <> 38645 or instruction <> 13980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1692), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38649 {
                if slot <= 38647 {
                    if slot <= 38646 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:258
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38646
                        if slot <> 38646 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:259
//		CA	ERASCON2	# 01373
// slot 38647
                        if slot <> 38647 or instruction <> 13981 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1693), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38648 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:260
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38648
                        if slot <> 38648 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:261
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:262
//ERASLOOP	INHINT
// slot 38649
                        if slot <> 38649 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38651 {
                    if slot <= 38650 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:263
//		CA	EBANK		# STORES C(EBANK)
// slot 38650
                        if slot <> 38650 or instruction <> 12291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 3).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:264
//		TS	SKEEP4
// slot 38651
                        if slot <> 38651 or instruction <> 23292 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38652 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:265
//		EXTEND
// slot 38652
                        if slot <> 38652 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:266
//		NDX	SKEEP7
// slot 38653
                        if slot <> 38653 or instruction <> 21247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21247, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21247, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2316] to agcAotUnit2316@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:267
//		DCA	0000
// slot 38654
    38654, 24578
)).

// bank 43, slots 38655-38660
function agcAotUnit2317 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38657 {
        if slot <= 38655 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:268
//		DXCH	SKEEP5		# STORES C(X) AND C(X+1) IN SKEEP6 AND 5.
// slot 38655
            if slot <> 38655 or instruction <> 22270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 766, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38656 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:269
//		CA	SKEEP7
// slot 38656
                if slot <> 38656 or instruction <> 13055 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 767).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:270
//		TS	ERESTORE	# IF RESTART, RESTORE C(X) AND C(X+1)
// slot 38657
                if slot <> 38657 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38658 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:271
//		TS	L
// slot 38658
            if slot <> 38658 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38659 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:272
//		INCR	L
// slot 38659
                if slot <> 38659 or instruction <> 10241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:273
//		NDX	A
// slot 38660
                if slot <> 38660 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2317] to agcAotUnit2317@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:274
//		DXCH	0000		# PUTS OWN ADDRESS IN X AND X +1
// slot 38661
    38661, 43010
)).

// bank 43, slots 38662-38662
function agcAotUnit2318 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF-CHECK.agc:275
//		NDX	SKEEP7
// slot 38662
    if slot <> 38662 or instruction <> 21247 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2318] to agcAotUnit2318@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:276
//		CS	0001		# CS X+1
// slot 38663
    38663, 32770
)).

// bank 43, slots 38664-38664
function agcAotUnit2319 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF-CHECK.agc:277
//		NDX	SKEEP7
// slot 38664
    if slot <> 38664 or instruction <> 21247 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2319] to agcAotUnit2319@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:278
//		AD	0000		# AD X
// slot 38665
    38665, 49152
)).

// bank 43, slots 38666-38671
function agcAotUnit2320 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38668 {
        if slot <= 38666 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:279
//		TC	-1CHK
// slot 38666
            if slot <> 38666 or instruction <> 1725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38667 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:280
//		CA	ERESTORE	# HAS ERASABLE BEEN RESTORED
// slot 38667
                if slot <> 38667 or instruction <> 13040 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 752).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:281
//# Page 1399
// AGC_BLOCK_TWO_SELF-CHECK.agc:282
//		EXTEND
// slot 38668
                if slot <> 38668 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38669 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:283
//		BZF	ELOOPFIN	# YES, EXIT ERASLOOP.
// slot 38669
            if slot <> 38669 or instruction <> 5921 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5921, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38670 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:284
//		EXTEND
// slot 38670
                if slot <> 38670 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:285
//		NDX	SKEEP7
// slot 38671
                if slot <> 38671 or instruction <> 21247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2320] to agcAotUnit2320@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:286
//		DCS	0000		# COMPLEMENT OF ADDRESS OF X AND X+1
// slot 38672
    38672, 32770
)).

// bank 43, slots 38673-38673
function agcAotUnit2321 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF-CHECK.agc:287
//		NDX	SKEEP7
// slot 38673
    if slot <> 38673 or instruction <> 21247 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2321] to agcAotUnit2321@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:288
//		DXCH	0000		# PUT COMPLEMENT OF ADDRESS OF X AND X+1
// slot 38674
    38674, 43010
)).

// bank 43, slots 38675-38675
function agcAotUnit2322 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF-CHECK.agc:289
//		NDX	SKEEP7
// slot 38675
    if slot <> 38675 or instruction <> 21247 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2322] to agcAotUnit2322@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:290
//		CS	0000		# CS X
// slot 38676
    38676, 32768
)).

// bank 43, slots 38677-38677
function agcAotUnit2323 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF-CHECK.agc:291
//		NDX	SKEEP7
// slot 38677
    if slot <> 38677 or instruction <> 21247 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21247, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2323] to agcAotUnit2323@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:292
//		AD	0001		# AD X+1
// slot 38678
    38678, 49154
)).

// bank 43, slots 38679-38685
function agcAotUnit2324 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38681 {
        if slot <= 38679 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:293
//		TC	-1CHK
// slot 38679
            if slot <> 38679 or instruction <> 1725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38680 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:294
//		CA	ERESTORE	# HAS ERASABLE BEEN RESTORED
// slot 38680
                if slot <> 38680 or instruction <> 13040 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 752).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:295
//		EXTEND
// slot 38681
                if slot <> 38681 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38683 {
            if slot <= 38682 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:296
//		BZF	ELOOPFIN	# YES, EXIT ERASLOOP.
// slot 38682
                if slot <> 38682 or instruction <> 5921 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5921, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:297
//		EXTEND
// slot 38683
                if slot <> 38683 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38684 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:298
//		DCA	SKEEP5
// slot 38684
                if slot <> 38684 or instruction <> 13054 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:299
//		NDX	SKEEP7
// slot 38685
                if slot <> 38685 or instruction <> 21247 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21247, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2324] to agcAotUnit2324@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:300
//		DXCH	0000		# PUT B(X) AND B(X+1) BACK INTO X AND X+1
// slot 38686
    38686, 43010
)).

// bank 43, slots 38687-38708
function agcAotUnit2325 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38697 {
        if slot <= 38691 {
            if slot <= 38688 {
                if slot <= 38687 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:301
//		CA	S+ZERO
// slot 38687
                    if slot <> 38687 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:302
//		TS	ERESTORE	# IF RESTART, DO NOT RESTORE C(X), C(X+1)
// slot 38688
                    if slot <> 38688 or instruction <> 23280 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23280, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38689 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:303
//ELOOPFIN	RELINT
// slot 38689
                    if slot <> 38689 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38690 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:304
//		TC	CHECKNJ		# CHECK FOR NEW JOB
// slot 38690
                        if slot <> 38690 or instruction <> 1756 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1756, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:305
//		CA	SKEEP4		# REPLACES B(EBANK)
// slot 38691
                        if slot <> 38691 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38694 {
                if slot <= 38692 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:306
//		TS	EBANK
// slot 38692
                    if slot <> 38692 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38693 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:307
//		INCR	SKEEP7
// slot 38693
                        if slot <> 38693 or instruction <> 11007 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 767).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:308
//		CS	SKEEP7
// slot 38694
                        if slot <> 38694 or instruction <> 17151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 767).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38695 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:309
//		AD	SKEEP3
// slot 38695
                    if slot <> 38695 or instruction <> 25339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 763).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38696 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:310
//		EXTEND
// slot 38696
                        if slot <> 38696 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:311
//		BZF	+2
// slot 38697
                        if slot <> 38697 or instruction <> 5931 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5931, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38702 {
            if slot <= 38699 {
                if slot <= 38698 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:312
//		TC	ERASLOOP	# GO TO NEXT ADDRESS IN SAME BANK
// slot 38698
                    if slot <> 38698 or instruction <> 1785 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1785, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:313
//		CCS	SKEEP2
// slot 38699
                    if slot <> 38699 or instruction <> 4858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 762).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38700 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:314
//		TC	NOEBANK
// slot 38700
                    if slot <> 38700 or instruction <> 1780 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1780, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38701 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:315
//		INCR	SKEEP2		# PUT +1 IN SKEEP2.
// slot 38701
                        if slot <> 38701 or instruction <> 11002 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 762).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:316
//		CA	EBANK
// slot 38702
                        if slot <> 38702 or instruction <> 12291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 3).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38705 {
                if slot <= 38703 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:317
//		AD	SBIT9
// slot 38703
                    if slot <> 38703 or instruction <> 27143 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38704 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:318
//		TS	EBANK
// slot 38704
                        if slot <> 38704 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:319
//		AD	ERASCON5	# 76777, CHECK FOR BANK E2
// slot 38705
                        if slot <> 38705 or instruction <> 26277 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1701), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38706 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:320
//		EXTEND
// slot 38706
                    if slot <> 38706 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38707 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:321
//		BZF	2EBANK
// slot 38707
                        if slot <> 38707 or instruction <> 5871 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5871, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:322
//		CCS	EBANK
// slot 38708
                        if slot <> 38708 or instruction <> 4099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 3).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2325] to agcAotUnit2325@.

// bank 43, slots 38709-38715
function agcAotUnit2326 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38711 {
        if slot <= 38709 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:323
//		TC	E134567B	# GO TO EBANKS 1,3,4,5,6, AND 7
// slot 38709
            if slot <> 38709 or instruction <> 1770 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1770, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38710 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:324
//		CA	ERASCON6	# END OF ERASCHK
// slot 38710
                if slot <> 38710 or instruction <> 14889 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:325
//		TS	EBANK
// slot 38711
                if slot <> 38711 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38713 {
            if slot <= 38712 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:326
//# CNTRCHK PERFORMS A CS OF ALL REGISTERS FROM OCT. 60 THROUGH OCT. 10.
// AGC_BLOCK_TWO_SELF-CHECK.agc:327
//# INCLUDED ARE ALL COUNTERS, T6-1, CYCLE AND SHIFT, AND ALL RUPT REGISTERS
// AGC_BLOCK_TWO_SELF-CHECK.agc:328
//CNTRCHK		CA	CNTRCON		# 00050
// slot 38712
                if slot <> 38712 or instruction <> 14875 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:329
//CNTRLOOP	TS	SKEEP2
// slot 38713
                if slot <> 38713 or instruction <> 23290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23290, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38714 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:330
//		AD	SBIT4		# +10 OCTAL
// slot 38714
                if slot <> 38714 or instruction <> 27148 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:331
//		INDEX	A
// slot 38715
                if slot <> 38715 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2326] to agcAotUnit2326@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:332
//# Page 1400
// AGC_BLOCK_TWO_SELF-CHECK.agc:333
//		CS	0000
// slot 38716
    38716, 32768
)).

// bank 43, slots 38717-38769
function agcAotUnit2327 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38742 {
        if slot <= 38729 {
            if slot <= 38722 {
                if slot <= 38719 {
                    if slot <= 38717 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:334
//		CCS	SKEEP2
// slot 38717
                        if slot <> 38717 or instruction <> 4858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 762).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38718 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:335
//		TC	CNTRLOOP
// slot 38718
                            if slot <> 38718 or instruction <> 1849 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1849, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:336
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:337
//# CYCLSHFT CHECKS THE CYCLE AND SHIFT REGISTERS
// AGC_BLOCK_TWO_SELF-CHECK.agc:338
//CYCLSHFT	CA	CONC+S1		# 25252
// slot 38719
                            if slot <> 38719 or instruction <> 13987 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1699), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38720 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:339
//		TS	CYR		# C(CYR) = 12525
// slot 38720
                        if slot <> 38720 or instruction <> 22544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38721 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:340
//		TS	CYL		# C(CYL) = 52524
// slot 38721
                            if slot <> 38721 or instruction <> 22546 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22546, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:341
//		TS	SR		# C(SR) = 12525
// slot 38722
                            if slot <> 38722 or instruction <> 22545 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22545, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38725 {
                    if slot <= 38723 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:342
//		TS	EDOP		# C(EDOP) = 00125
// slot 38723
                        if slot <> 38723 or instruction <> 22547 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22547, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38724 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:343
//		AD	CYR		# 37777		C(CYR) = 45252
// slot 38724
                            if slot <> 38724 or instruction <> 24592 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 16).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:344
//		AD	CYL		# 00-12524	C(CYL) = 25251
// slot 38725
                            if slot <> 38725 or instruction <> 24594 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 18).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38727 {
                        if slot <= 38726 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:345
//		AD	SR		# 00-25251	C(SR) = 05252
// slot 38726
                            if slot <> 38726 or instruction <> 24593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 17).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:346
//		AD	EDOP		# 00-25376	C(EDOP) = +0
// slot 38727
                            if slot <> 38727 or instruction <> 24595 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 19).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38728 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:347
//		AD	CONC+S2		# C(CONC+S2) = 52400
// slot 38728
                            if slot <> 38728 or instruction <> 26276 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1700), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:348
//		TC	-1CHK
// slot 38729
                            if slot <> 38729 or instruction <> 1725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1725, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 38735 {
                if slot <= 38732 {
                    if slot <= 38730 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:349
//		AD	CYR		# 45252
// slot 38730
                        if slot <> 38730 or instruction <> 24592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 16).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38731 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:350
//		AD	CYL		# 72523
// slot 38731
                            if slot <> 38731 or instruction <> 24594 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 18).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:351
//		AD	SR		# 77775
// slot 38732
                            if slot <> 38732 or instruction <> 24593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 17).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38733 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:352
//		AD	EDOP		# 77775
// slot 38733
                        if slot <> 38733 or instruction <> 24595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 19).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38734 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:353
//		AD	S+1		# 77776
// slot 38734
                            if slot <> 38734 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// AGC_BLOCK_TWO_SELF-CHECK.agc:354
//		TC	-1CHK
// slot 38735
                            if slot <> 38735 or instruction <> 1725 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1725, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38738 {
                    if slot <= 38736 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:355
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:356
//		INCR	SCOUNT +1
// slot 38736
                        if slot <> 38736 or instruction <> 10999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 759).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38737 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:357
//		TC	SMODECHK
// slot 38737
                            if slot <> 38737 or instruction <> 1731 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1731, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:358
//# SKEEP1 HOLDS SUM
// AGC_BLOCK_TWO_SELF-CHECK.agc:359
//# SKEEP2 HOLDS PRESENT CONTENTS OF ADDRESS IN ROPECHK AND SHOWSUM ROUTINES
// AGC_BLOCK_TWO_SELF-CHECK.agc:360
//# SKEEP2 HOLDS BANK NUMBER IN LOW ORDER BITS DURING SHOWSUM DISPLAY
// AGC_BLOCK_TWO_SELF-CHECK.agc:361
//# SKEEP3 HOLDS PRESENT ADDRESS (00000 TO 01777 IN COMMON FIXED BANKS)
// AGC_BLOCK_TWO_SELF-CHECK.agc:362
//#			       (04000 TO 07777 IN FXFX BANKS)
// AGC_BLOCK_TWO_SELF-CHECK.agc:363
//# SKEEP3 HOLDS BUGGER WORD DURING SHOWSUM DISPLAY
// AGC_BLOCK_TWO_SELF-CHECK.agc:364
//# SKEEP4 HOLDS BANK NUMBER AND SUPER BANK NUMBER
// AGC_BLOCK_TWO_SELF-CHECK.agc:365
//# SKEEP5 COUNTS 2 SUCCESSIVE TC SELF WORDS
// AGC_BLOCK_TWO_SELF-CHECK.agc:366
//# SKEEP6 CONTROLS ROPECHK OR SHOWSUM OPTION
// AGC_BLOCK_TWO_SELF-CHECK.agc:367
//# SKEEP7 CONTROLS WHEN ROUNTINE IS IN COMMON FIXED OR FIXED FIXED BANKS
// AGC_BLOCK_TWO_SELF-CHECK.agc:368
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:369
//ROPECHK		CA	S-ZERO		# *
// slot 38738
                            if slot <> 38738 or instruction <> 14864 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38740 {
                        if slot <= 38739 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:370
//		TS	SKEEP6		# * -0 FOR ROPECHK.
// slot 38739
                            if slot <> 38739 or instruction <> 23294 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:371
//STSHOSUM	CA	S+ZERO		# * SHOULD BE ROPECHK
// slot 38740
                            if slot <> 38740 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 38741 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:372
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:373
//		TS	SKEEP4		# BANK NUMBER
// slot 38741
                            if slot <> 38741 or instruction <> 23292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23292, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:374
//		CA	S+1
// slot 38742
                            if slot <> 38742 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 38755 {
            if slot <= 38748 {
                if slot <= 38745 {
                    if slot <= 38743 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:375
//COMMFX		TS	SKEEP7
// slot 38743
                        if slot <> 38743 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38744 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:376
//		CA	S+ZERO
// slot 38744
                            if slot <> 38744 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:377
//		TS	SKEEP1
// slot 38745
                            if slot <> 38745 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38746 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:378
//		TS	SKEEP3
// slot 38746
                        if slot <> 38746 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38747 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:379
//		CA	S+1
// slot 38747
                            if slot <> 38747 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:380
//		TS	SKEEP5		# COUNTS DOWN 2 TC SELF WORDS
// slot 38748
                            if slot <> 38748 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38751 {
                    if slot <= 38749 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:381
//COMADRS		CA	SKEEP4
// slot 38749
                        if slot <> 38749 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38750 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:382
//		TS	L		# TO SET SUPER BANK
// slot 38750
                            if slot <> 38750 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:383
//# Page 1401
// AGC_BLOCK_TWO_SELF-CHECK.agc:384
//		MASK	HI5
// slot 38751
                            if slot <> 38751 or instruction <> 30964 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                                if fixedOperand = 31744 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38753 {
                        if slot <= 38752 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:385
//		AD	SKEEP3
// slot 38752
                            if slot <> 38752 or instruction <> 25339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:386
//		TC	SUPDACAL	# SUPER DATA CALL
// slot 38753
                            if slot <> 38753 or instruction <> 2509 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2509, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38754 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:387
//		TC	ADSUM
// slot 38754
                            if slot <> 38754 or instruction <> 1909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1909, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:388
//		AD	SBIT11		# 02000
// slot 38755
                            if slot <> 38755 or instruction <> 27141 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 38762 {
                if slot <= 38758 {
                    if slot <= 38756 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:389
//		TC	ADRSCHK
// slot 38756
                        if slot <> 38756 or instruction <> 1918 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1918, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38757 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:390
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:391
//FXFX		CS	A
// slot 38757
                            if slot <> 38757 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:392
//		TS	SKEEP7
// slot 38758
                            if slot <> 38758 or instruction <> 23295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23295, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38760 {
                        if slot <= 38759 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:393
//		EXTEND
// slot 38759
                            if slot <> 38759 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:394
//		BZF	+3
// slot 38760
                            if slot <> 38760 or instruction <> 5995 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5995, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38761 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:395
//		CA	SBIT12		# 04000, STARTING ADDRESS OF BANK 02
// slot 38761
                            if slot <> 38761 or instruction <> 14852 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:396
//		TC	+2
// slot 38762
                            if slot <> 38762 or instruction <> 1900 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1900, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38765 {
                    if slot <= 38763 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:397
//		CA	SBNK03		# 06000, STARTING ADDRESS OF BANK 03
// slot 38763
                        if slot <> 38763 or instruction <> 14898 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2610), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38764 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:398
//		TS	SKEEP3
// slot 38764
                            if slot <> 38764 or instruction <> 23291 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23291, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:399
//		CA	S+ZERO
// slot 38765
                            if slot <> 38765 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 38767 {
                        if slot <= 38766 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:400
//		TS	SKEEP1
// slot 38766
                            if slot <> 38766 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:401
//		CA	S+1
// slot 38767
                            if slot <> 38767 or instruction <> 14863 { return choose false if checkOnly else -1. }
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
                        if slot <= 38768 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:402
//		TS	SKEEP5		# COUNTS DOWN 2 TC SELF WORDS
// slot 38768
                            if slot <> 38768 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:403
//FXADRS		INDEX	SKEEP3
// slot 38769
                            if slot <> 38769 or instruction <> 21243 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21243, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21243, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2327] to agcAotUnit2327@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:404
//		CA	0000
// slot 38770
    38770, 24576
)).

// bank 43, slots 38771-38838
function agcAotUnit2328 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38804 {
        if slot <= 38787 {
            if slot <= 38778 {
                if slot <= 38774 {
                    if slot <= 38772 {
                        if slot <= 38771 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:405
//		TC	ADSUM
// slot 38771
                            if slot <> 38771 or instruction <> 1909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1909, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:406
//		TC	ADRSCHK
// slot 38772
                            if slot <> 38772 or instruction <> 1918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1918, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38773 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:407
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:408
//ADSUM		TS	SKEEP2
// slot 38773
                            if slot <> 38773 or instruction <> 23290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23290, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:409
//		AD	SKEEP1
// slot 38774
                            if slot <> 38774 or instruction <> 25337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 761).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38776 {
                        if slot <= 38775 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:410
//		TS	SKEEP1
// slot 38775
                            if slot <> 38775 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:411
//		CAF	S+ZERO
// slot 38776
                            if slot <> 38776 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 38777 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:412
//		AD	SKEEP1
// slot 38777
                            if slot <> 38777 or instruction <> 25337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 761).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:413
//		TS	SKEEP1
// slot 38778
                            if slot <> 38778 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38782 {
                    if slot <= 38780 {
                        if slot <= 38779 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:414
//		CS	SKEEP2
// slot 38779
                            if slot <> 38779 or instruction <> 17146 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 762).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:415
//		AD	SKEEP3
// slot 38780
                            if slot <> 38780 or instruction <> 25339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38781 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:416
//		TC	Q
// slot 38781
                            if slot <> 38781 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:417
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:418
//ADRSCHK		LXCH	A
// slot 38782
                            if slot <> 38782 or instruction <> 9216 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 0, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38784 {
                        if slot <= 38783 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:419
//		CA	SKEEP3
// slot 38783
                            if slot <> 38783 or instruction <> 13051 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:420
//		MASK	LOW10		# RELATIVE ADDRESS
// slot 38784
                            if slot <> 38784 or instruction <> 31276 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                                if fixedOperand = 1023 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38785 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:421
//		AD	-MAXADRS	# SUBTRACT MAX RELATIVE ADDRESS = 1777.
// slot 38785
                            if slot <> 38785 or instruction <> 26868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38786 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:422
//		EXTEND
// slot 38786
                                if slot <> 38786 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:423
//		BZF	SOPTION		# CHECKSUM FINISHED IF LAST ADDRESS.
// slot 38787
                                if slot <> 38787 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 38795 {
                if slot <= 38791 {
                    if slot <= 38789 {
                        if slot <= 38788 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:424
//		CCS	SKEEP5		# IS CHECKSUM FINISHED
// slot 38788
                            if slot <> 38788 or instruction <> 4861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 765).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:425
//		TC	+3		# NO
// slot 38789
                            if slot <> 38789 or instruction <> 1928 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1928, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38790 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:426
//		TC	+2		# NO
// slot 38790
                            if slot <> 38790 or instruction <> 1928 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1928, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:427
//		TC	SOPTION		# GO TO ROPECHK SHOWSUM OPTION
// slot 38791
                            if slot <> 38791 or instruction <> 1978 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1978, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38793 {
                        if slot <= 38792 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:428
//		CCS	L		# -0 MEANS A TC SELF WORD.
// slot 38792
                            if slot <> 38792 or instruction <> 4097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:429
//		TC	CONTINU
// slot 38793
                            if slot <> 38793 or instruction <> 1936 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1936, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38794 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:430
//		TC	CONTINU
// slot 38794
                            if slot <> 38794 or instruction <> 1936 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1936, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:431
//		TC	CONTINU
// slot 38795
                            if slot <> 38795 or instruction <> 1936 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1936, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38799 {
                    if slot <= 38797 {
                        if slot <= 38796 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:432
//		CCS	SKEEP5
// slot 38796
                            if slot <> 38796 or instruction <> 4861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 765).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:433
//		TC	CONTINU +1
// slot 38797
                            if slot <> 38797 or instruction <> 1937 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1937, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38798 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:434
//# Page 1402
// AGC_BLOCK_TWO_SELF-CHECK.agc:435
//		CA	S-1
// slot 38798
                            if slot <> 38798 or instruction <> 16334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:436
//		TC	CONTINU +1	# AD IN THE BUGGER WORD
// slot 38799
                            if slot <> 38799 or instruction <> 1937 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1937, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38801 {
                        if slot <= 38800 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:437
//CONTINU		CA	S+1		# MAKE SURE TWO CONSECUTIVE TC SELF WORDS
// slot 38800
                            if slot <> 38800 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:438
//		TS	SKEEP5
// slot 38801
                            if slot <> 38801 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38802 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:439
//		CCS	SKEEP6		# *
// slot 38802
                            if slot <> 38802 or instruction <> 4862 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 766).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38803 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:440
//		CCS	NEWJOB		# * +1, SHOWSUM
// slot 38803
                                if slot <> 38803 or instruction <> 4151 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 55).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:441
//		TC	CHANG1		# *
// slot 38804
                                if slot <> 38804 or instruction <> 2676 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2676, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 38821 {
            if slot <= 38812 {
                if slot <= 38808 {
                    if slot <= 38806 {
                        if slot <= 38805 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:442
//		TC	+2		# *
// slot 38805
                            if slot <> 38805 or instruction <> 1943 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1943, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:443
//		TC	CHECKNJ		# -0 IN SKEEP6 FOR ROPECHK
// slot 38806
                            if slot <> 38806 or instruction <> 1756 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1756, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38807 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:444
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:445
//ADRS+1		INCR	SKEEP3
// slot 38807
                            if slot <> 38807 or instruction <> 11003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:446
//		CCS	SKEEP7
// slot 38808
                            if slot <> 38808 or instruction <> 4863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 767).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38810 {
                        if slot <= 38809 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:447
//		TC	COMADRS
// slot 38809
                            if slot <> 38809 or instruction <> 1885 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1885, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:448
//		TC	COMADRS
// slot 38810
                            if slot <> 38810 or instruction <> 1885 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1885, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38811 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:449
//		TC	FXADRS
// slot 38811
                            if slot <> 38811 or instruction <> 1905 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1905, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:450
//		TC	FXADRS
// slot 38812
                            if slot <> 38812 or instruction <> 1905 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1905, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38816 {
                    if slot <= 38814 {
                        if slot <= 38813 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:451
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:452
//NXTBNK		CS	SKEEP4
// slot 38813
                            if slot <> 38813 or instruction <> 17148 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 764).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:453
//		AD	LSTBNKCH	# LAST BANK TO BE CHECKED
// slot 38814
                            if slot <> 38814 or instruction <> 26581 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2005), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38815 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:454
//		EXTEND
// slot 38815
                            if slot <> 38815 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:455
//		BZF	ENDSUMS		# END OF SUMMING OF BANKS.
// slot 38816
                            if slot <> 38816 or instruction <> 5641 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5641, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38818 {
                        if slot <= 38817 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:456
//		CA	SKEEP4
// slot 38817
                            if slot <> 38817 or instruction <> 13052 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:457
//		AD	SBIT11
// slot 38818
                            if slot <> 38818 or instruction <> 27141 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38819 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:458
//		TS	SKEEP4		# 37 TO 40 INCRMTS SKEEP4 BY END RND CARRY
// slot 38819
                            if slot <> 38819 or instruction <> 23292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23292, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38820 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:459
//		TC	CHKSUPR
// slot 38820
                                if slot <> 38820 or instruction <> 1960 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1960, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:460
//17TO20		CA	SBIT15
// slot 38821
                                if slot <> 38821 or instruction <> 14849 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 38829 {
                if slot <= 38825 {
                    if slot <= 38823 {
                        if slot <= 38822 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:461
//		ADS	SKEEP4		# SET FOR BANK 20
// slot 38822
                            if slot <> 38822 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:462
//		TC	GONXTBNK
// slot 38823
                            if slot <> 38823 or instruction <> 1972 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1972, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38824 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:463
//CHKSUPR		MASK	HI5
// slot 38824
                            if slot <> 38824 or instruction <> 30964 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                                if fixedOperand = 31744 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:464
//		EXTEND
// slot 38825
                            if slot <> 38825 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38827 {
                        if slot <= 38826 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:465
//		BZF	NXTSUPR		# INCREMENT SUPER BANK
// slot 38826
                            if slot <> 38826 or instruction <> 6066 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6066, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:466
//27TO30		AD	S13BITS
// slot 38827
                            if slot <> 38827 or instruction <> 26274 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1698), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38828 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:467
//		EXTEND
// slot 38828
                            if slot <> 38828 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:468
//		BZF	+2		# BANK SET FOR 30
// slot 38829
                            if slot <> 38829 or instruction <> 6063 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6063, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38833 {
                    if slot <= 38831 {
                        if slot <= 38830 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:469
//		TC	GONXTBNK
// slot 38830
                            if slot <> 38830 or instruction <> 1972 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1972, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:470
//		CA	SIXTY		# FIRST SUPER BANK
// slot 38831
                            if slot <> 38831 or instruction <> 13984 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1696), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38832 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:471
//		ADS	SKEEP4
// slot 38832
                            if slot <> 38832 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:472
//		TC	GONXTBNK
// slot 38833
                            if slot <> 38833 or instruction <> 1972 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1972, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38835 {
                        if slot <= 38834 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:473
//NXTSUPR		AD	SUPRCON		# SET BNK 30 + INCR SUPR BNK AND CANCEL
// slot 38834
                            if slot <> 38834 or instruction <> 26273 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1697), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:474
//		ADS	SKEEP4		# ERC BIT OF THE 37 TO 40 ADVANCE.
// slot 38835
                            if slot <> 38835 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38836 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:475
//GONXTBNK	CCS	SKEEP7
// slot 38836
                            if slot <> 38836 or instruction <> 4863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 767).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38837 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:476
//		TC	COMMFX
// slot 38837
                                if slot <> 38837 or instruction <> 1879 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1879, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:477
//		CA	S+1
// slot 38838
                                if slot <> 38838 or instruction <> 14863 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2328] to agcAotUnit2328@.

// bank 43, slots 38839-38868
function agcAotUnit2329 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38853 {
        if slot <= 38845 {
            if slot <= 38841 {
                if slot <= 38839 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:478
//		TC	FXFX
// slot 38839
                    if slot <> 38839 or instruction <> 1893 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1893, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38840 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:479
//		CA	SBIT7		# HAS TO BE LARGER THAN NO OF FXSW BANKS.
// slot 38840
                        if slot <> 38840 or instruction <> 14857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:480
//		TC	COMMFX
// slot 38841
                        if slot <> 38841 or instruction <> 1879 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1879, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38843 {
                    if slot <= 38842 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:481
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:482
//SOPTION		CA	SKEEP4
// slot 38842
                        if slot <> 38842 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:483
//		MASK	HI5		# = BANK BITS
// slot 38843
                        if slot <> 38843 or instruction <> 30964 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                            if fixedOperand = 31744 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38844 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:484
//		TC	LEFT5
// slot 38844
                        if slot <> 38844 or instruction <> 2277 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2277, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:485
//# Page 1403
// AGC_BLOCK_TWO_SELF-CHECK.agc:486
//		TS	L		# BANK NUMBER BEFORE SUPER BANK
// slot 38845
                        if slot <> 38845 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38849 {
                if slot <= 38847 {
                    if slot <= 38846 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:487
//		CA	SKEEP4
// slot 38846
                        if slot <> 38846 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:488
//		MASK	S8BITS		# = SUPER BANK BITS
// slot 38847
                        if slot <> 38847 or instruction <> 30971 { return choose false if checkOnly else -1. }
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
                    if slot <= 38848 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:489
//		EXTEND
// slot 38848
                        if slot <> 38848 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:490
//		BZF	SOPT		# BEFORE SUPER BANK
// slot 38849
                        if slot <> 38849 or instruction <> 6087 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6087, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38851 {
                    if slot <= 38850 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:491
//		TS	SR		# SUPER BANK NECESSARY
// slot 38850
                        if slot <> 38850 or instruction <> 22545 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22545, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:492
//		CA	L
// slot 38851
                        if slot <> 38851 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38852 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:493
//		MASK	SEVEN
// slot 38852
                        if slot <> 38852 or instruction <> 31251 { return choose false if checkOnly else -1. }
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
// AGC_BLOCK_TWO_SELF-CHECK.agc:494
//		AD	SR
// slot 38853
                        if slot <> 38853 or instruction <> 24593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 17).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38860 {
            if slot <= 38856 {
                if slot <= 38854 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:495
//		TS	L		# BANK NUMBER WITH SUPER BANK
// slot 38854
                    if slot <> 38854 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38855 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:496
//SOPT		CA	SKEEP6		# *
// slot 38855
                        if slot <> 38855 or instruction <> 13054 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 766).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:497
//		EXTEND			# *
// slot 38856
                        if slot <> 38856 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38858 {
                    if slot <= 38857 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:498
//		BZF	+2		# * ON -0 CONTINUE WITH ROPE CHECK.
// slot 38857
                        if slot <> 38857 or instruction <> 6091 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6091, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:499
//		TC	SDISPLAY	# * ON +1 GO TO DISPLAY OF SUM.
// slot 38858
                        if slot <> 38858 or instruction <> 1531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38859 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:500
//		CCS	SKEEP1		# FORCE SUM TO ABSOLUTE VALUE.
// slot 38859
                        if slot <> 38859 or instruction <> 4857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 761).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:501
//		TC	+2
// slot 38860
                        if slot <> 38860 or instruction <> 1998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1998, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38864 {
                if slot <= 38862 {
                    if slot <= 38861 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:502
//		TC	+2
// slot 38861
                        if slot <> 38861 or instruction <> 1999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1999, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:503
//		AD	S+1
// slot 38862
                        if slot <> 38862 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 38863 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:504
//		TS	SKEEP1
// slot 38863
                        if slot <> 38863 or instruction <> 23289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23289, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:505
//BNKCHK		CS	L		# = - BANK NUMBER
// slot 38864
                        if slot <> 38864 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38866 {
                    if slot <= 38865 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:506
//		AD	SKEEP1
// slot 38865
                        if slot <> 38865 or instruction <> 25337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 761).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:507
//		AD	S-1
// slot 38866
                        if slot <> 38866 or instruction <> 28622 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38867 {
// AGC_BLOCK_TWO_SELF-CHECK.agc:508
//		TC	-1CHK		# CHECK SUM
// slot 38867
                        if slot <> 38867 or instruction <> 1725 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1725, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF-CHECK.agc:509
//		TC	NXTBNK
// slot 38868
                        if slot <> 38868 or instruction <> 1949 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1949, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2329] to agcAotUnit2329@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF-CHECK.agc:510
//
// AGC_BLOCK_TWO_SELF-CHECK.agc:511
//		EBANK=	NEWJOB
// AGC_BLOCK_TWO_SELF-CHECK.agc:512
//LSTBNKCH	BBCON*			# * CONSTANT, LAST BANK.
// slot 38869
    38869, 55424
)).

// no code for the lines below
// AGC_BLOCK_TWO_SELF-CHECK.agc:513
//		SBANK=	LOWSUPER
