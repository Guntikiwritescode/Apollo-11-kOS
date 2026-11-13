// AGC_BLOCK_TWO_SELF_CHECK.agc
agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:1
//# Copyright:	Public domain.
// AGC_BLOCK_TWO_SELF_CHECK.agc:2
//# Filename:	AGC_BLOCK_TWO_SELF_CHECK.agc
// AGC_BLOCK_TWO_SELF_CHECK.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// AGC_BLOCK_TWO_SELF_CHECK.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// AGC_BLOCK_TWO_SELF_CHECK.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// AGC_BLOCK_TWO_SELF_CHECK.agc:6
//# Assembler:	yaYUL
// AGC_BLOCK_TWO_SELF_CHECK.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// AGC_BLOCK_TWO_SELF_CHECK.agc:8
//# Website:	www.ibiblio.org/apollo.
// AGC_BLOCK_TWO_SELF_CHECK.agc:9
//# Pages:	1284-1293
// AGC_BLOCK_TWO_SELF_CHECK.agc:10
//# Mod history:	2009-05-27 OH	Transcribed from page images.
// AGC_BLOCK_TWO_SELF_CHECK.agc:11
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:12
//# This source code has been transcribed or otherwise adapted from
// AGC_BLOCK_TWO_SELF_CHECK.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// AGC_BLOCK_TWO_SELF_CHECK.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// AGC_BLOCK_TWO_SELF_CHECK.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// AGC_BLOCK_TWO_SELF_CHECK.agc:16
//# in storage size and consequent reduction in image quality as well) are
// AGC_BLOCK_TWO_SELF_CHECK.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// AGC_BLOCK_TWO_SELF_CHECK.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// AGC_BLOCK_TWO_SELF_CHECK.agc:19
//# about getting access to the (much) higher-quality images which Paul
// AGC_BLOCK_TWO_SELF_CHECK.agc:20
//# actually created.
// AGC_BLOCK_TWO_SELF_CHECK.agc:21
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:22
//# Notations on the hardcopy document read, in part:
// AGC_BLOCK_TWO_SELF_CHECK.agc:23
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// AGC_BLOCK_TWO_SELF_CHECK.agc:25
//#	16:27 JULY 14, 1969
// AGC_BLOCK_TWO_SELF_CHECK.agc:26
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:27
//# Page 1284
// AGC_BLOCK_TWO_SELF_CHECK.agc:28
//# PROGRAM DESCRIPTION				DATE:  20 DECEMBER 1967
// AGC_BLOCK_TWO_SELF_CHECK.agc:29
//# PROGRAM NAME -- SELF-CHECK			LOG SECTION:  AGC BLOCK TWO SELF-CHECK
// AGC_BLOCK_TWO_SELF_CHECK.agc:30
//# MOD NO -- 1					ASSEMBLY SUBROUTINE UTILITYM REV 25
// AGC_BLOCK_TWO_SELF_CHECK.agc:31
//# MOD BY -- GAUNTT
// AGC_BLOCK_TWO_SELF_CHECK.agc:32
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:33
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:34
//# FUNCTIONAL DESCRIPTION
// AGC_BLOCK_TWO_SELF_CHECK.agc:35
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:36
//#	PROGRAM HAS TWO MAIN PARTS.  THE FIRST IS SELF-CHECK WHICH RUNS AS A ZERO PRIORITY JOB WITH NO CORE SET, AS
// AGC_BLOCK_TWO_SELF_CHECK.agc:37
//#	PART OF THE BACK-UP IDLE LOOP.  THE SECOND IS SHOW-BANKSUM WHICH RUNS AS A REGULAR EXECUTIVE JOB WITH ITS OWN
// AGC_BLOCK_TWO_SELF_CHECK.agc:38
//# 	STARTING VERB.
// AGC_BLOCK_TWO_SELF_CHECK.agc:39
//#	THE PURPOSE OF SELF-CHECK IS TO CHECK OUT VARIOUS PARTS OF THE COMPUTER AS OUTLINED BELOW IN THE OPTIONS.
// AGC_BLOCK_TWO_SELF_CHECK.agc:40
//#	THE PURPOSE OF SHOW-BANKSUM IS TO DISPLAY THE SUM OF EACH BANK, ONE AT A TIME.
// AGC_BLOCK_TWO_SELF_CHECK.agc:41
//#	IN ALL THERE ARE 7 POSSIBLE OPTIONS IN THIS BLOCK II VERSION OF SELF-CHECK.  MORE DETAIL DESCRIPTION MAY BE
// AGC_BLOCK_TWO_SELF_CHECK.agc:42
//#	FOUND IN E-2065 BLOCK II AGC SELF-CHECK AND SHOW BANKSUM BY EDWIN D. SMALLY DECEMBER 1966, AND ADDENDA 2 AND 3.
// AGC_BLOCK_TWO_SELF_CHECK.agc:43
//#	THE DIFFERENT OPTIONS ARE CONTROLLED BY PUTTING DIFFERENT NUMBERS IN THE SMODE REGISTER (NOUN 27).  BELOW IS
// AGC_BLOCK_TWO_SELF_CHECK.agc:44
//# 	A DESCRIPTION OF WHAT PARTS OF THE COMPUTER THAT ARE CHECKED BY THE OPTIONS, AND THE CORRESPONDING NUMBER, IN
// AGC_BLOCK_TWO_SELF_CHECK.agc:45
//#	OCTAL, TO LOAD INTO SMODE.
// AGC_BLOCK_TWO_SELF_CHECK.agc:46
//#		+-4		ERASABLE MEMORY
// AGC_BLOCK_TWO_SELF_CHECK.agc:47
//#		+-5		FIXED MEMORY
// AGC_BLOCK_TWO_SELF_CHECK.agc:48
//#		+-1,2,3,6,7,10	EVERYTHING IN OPTIONS 4 AND 5.
// AGC_BLOCK_TWO_SELF_CHECK.agc:49
//#		-0		SAME AS +-10 UNTIL AN ERROR IS DETECTED.
// AGC_BLOCK_TWO_SELF_CHECK.agc:50
//#		+0		NO CHECK, PUTS COMPUTER INTO THE BACKUP IDLE LOOP.
// AGC_BLOCK_TWO_SELF_CHECK.agc:51
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:52
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:53
//# WARNINGS
// AGC_BLOCK_TWO_SELF_CHECK.agc:54
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:55
//#	USE OF E MEMORY RESERVED FOR SELF-CHECK (EVEN IN IDLE LOOP) AS TEMP STORAGE BY OTHER PROGRAMS IS DANGEROUS.
// AGC_BLOCK_TWO_SELF_CHECK.agc:56
//#	SMODE SET GREATER THAN OCT 10 PUTS COMPUTER INTO BACKUP IDLE LOOP.
// AGC_BLOCK_TWO_SELF_CHECK.agc:57
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:58
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:59
//# CALLING SEQUENCE
// AGC_BLOCK_TWO_SELF_CHECK.agc:60
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:61
//#	TO CALL SELF-CHECK KEY IN
// AGC_BLOCK_TWO_SELF_CHECK.agc:62
//#		V 21 N 27 E	OPTION NUMBER E
// AGC_BLOCK_TWO_SELF_CHECK.agc:63
//#	TO CALL SHOW-BANKSUM KEY IN
// AGC_BLOCK_TWO_SELF_CHECK.agc:64
//#		V 91 E		DISPLAYS FIRST BANK
// AGC_BLOCK_TWO_SELF_CHECK.agc:65
//#		V 33 E		PROCEED, DISPLAYS NEXT BANK
// AGC_BLOCK_TWO_SELF_CHECK.agc:66
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:67
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:68
//# EXIT MODES, NORMAL AND ALARM
// AGC_BLOCK_TWO_SELF_CHECK.agc:69
//#	SELF-CHECK NORMALLY CONTINUES INDEFINITELY UNLESS THERE IS AN ERROR DETECTED.  IF SO + OPTION NUMBERS PUT
// AGC_BLOCK_TWO_SELF_CHECK.agc:70
//#	COMPUTER INTO BACKUP IDLE LOOP, - OPTION NUMBERS RESTART THE OPTION.
// AGC_BLOCK_TWO_SELF_CHECK.agc:71
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:72
//#	THE -0 OPTION PROCEEDS FROM THE LINE FOLLOWING THE LINE WHERE THE ERROR WAS DETECTED.
// AGC_BLOCK_TWO_SELF_CHECK.agc:73
//#	SHOW-BANKSUM PROCEEDS UNTIL A TERMINATE IS KEYED IN (V 34 E).  THE COMPUTER IS PUT INTO THE BACKUP IDLE LOOP.
// AGC_BLOCK_TWO_SELF_CHECK.agc:74
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:75
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:76
//# OUTPUT
// AGC_BLOCK_TWO_SELF_CHECK.agc:77
//# Page 1285
// AGC_BLOCK_TWO_SELF_CHECK.agc:78
//#	SELF-CHECK UPON DETECTING AN ERROR LOADS THE SELF-CHECK ALARM CONSTANT (01102) INTO THE FAILREG SET AND
// AGC_BLOCK_TWO_SELF_CHECK.agc:79
//#	TURNS ON THE ALARM LIGHT.  THE OPERATOR MAY THEN DISPLAY THE THREE FAILREGS BY KEYING IN V 05 N 09 E.  FOR FURTHER
// AGC_BLOCK_TWO_SELF_CHECK.agc:80
//# 	INFORMATION HE MAY KEY IN V 05 N 08 E, THE DSKY DISPLAY IN R1 WILL BE ADDRESS+1 OF WHERE THE ERROR WAS DETECTED,
// AGC_BLOCK_TWO_SELF_CHECK.agc:81
//#	IN R2 THE BBCON OF SELF-CHECK, AND IN R3 THE TOTAL NUMBER OF ERRORS DETECTED BY SELF-CHECK SINCE THE LAST MAN
// AGC_BLOCK_TWO_SELF_CHECK.agc:82
//#	INITIATED FRESH START (SLAP1).
// AGC_BLOCK_TWO_SELF_CHECK.agc:83
//#	SHOW-BANKSUM STARTING WITH BANK 0 DISPLAYS IN R1 THE BANK SUM (A +-NUMBER EQUAL TO THE BANK NUMBER), IN R2
// AGC_BLOCK_TWO_SELF_CHECK.agc:84
//#	THE BANK NUMBER, AND IN R3 THE BUGGER WORD.
// AGC_BLOCK_TWO_SELF_CHECK.agc:85
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:86
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:87
//# ERASABLE INITIALIZATION REQUIRED
// AGC_BLOCK_TWO_SELF_CHECK.agc:88
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:89
//#	ACCOMPLISHED BY FRESH START
// AGC_BLOCK_TWO_SELF_CHECK.agc:90
//#		SMODE SET TO +0
// AGC_BLOCK_TWO_SELF_CHECK.agc:91
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:92
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:93
//# DEBRIS
// AGC_BLOCK_TWO_SELF_CHECK.agc:94
//#
// AGC_BLOCK_TWO_SELF_CHECK.agc:95
//#	ALL EXITS FROM THE CHECK OF ERASABLE (ERASCHK) RESTORE ORIGINAL CONTENTS TO REGISTERS UNDER CHECK.
// AGC_BLOCK_TWO_SELF_CHECK.agc:96
//#	EXCEPTION IS A RESTART.  RESTART THAT OCCURS DURING ERASCHK RESTORES ERASABLE, UNLESS THERE IS EVIDENCE TO DOUBT
// AGC_BLOCK_TWO_SELF_CHECK.agc:97
//#	E MEMORY, IN WHICH CASE PROGRAM THEN DOES A FRESH START (DOFSTART).
// AGC_BLOCK_TWO_SELF_CHECK.agc:98
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:99
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:100
//		BANK	25
// AGC_BLOCK_TWO_SELF_CHECK.agc:101
//		SETLOC	SELFCHEC
// AGC_BLOCK_TWO_SELF_CHECK.agc:102
//		BANK
// AGC_BLOCK_TWO_SELF_CHECK.agc:103
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:104
//		COUNT*	$$/SELF
// AGC_BLOCK_TWO_SELF_CHECK.agc:105
//SBIT1		EQUALS	BIT1
// AGC_BLOCK_TWO_SELF_CHECK.agc:106
//SBIT2		EQUALS	BIT2
// AGC_BLOCK_TWO_SELF_CHECK.agc:107
//SBIT3		EQUALS	BIT3
// AGC_BLOCK_TWO_SELF_CHECK.agc:108
//SBIT4		EQUALS	BIT4
// AGC_BLOCK_TWO_SELF_CHECK.agc:109
//SBIT5		EQUALS	BIT5
// AGC_BLOCK_TWO_SELF_CHECK.agc:110
//SBIT6		EQUALS	BIT6
// AGC_BLOCK_TWO_SELF_CHECK.agc:111
//SBIT7		EQUALS	BIT7
// AGC_BLOCK_TWO_SELF_CHECK.agc:112
//SBIT8		EQUALS	BIT8
// AGC_BLOCK_TWO_SELF_CHECK.agc:113
//SBIT9		EQUALS	BIT9
// AGC_BLOCK_TWO_SELF_CHECK.agc:114
//SBIT10		EQUALS	BIT10
// AGC_BLOCK_TWO_SELF_CHECK.agc:115
//SBIT11		EQUALS	BIT11
// AGC_BLOCK_TWO_SELF_CHECK.agc:116
//SBIT12		EQUALS	BIT12
// AGC_BLOCK_TWO_SELF_CHECK.agc:117
//SBIT13		EQUALS	BIT13
// AGC_BLOCK_TWO_SELF_CHECK.agc:118
//SBIT14		EQUALS	BIT14
// AGC_BLOCK_TWO_SELF_CHECK.agc:119
//SBIT15		EQUALS	BIT15
// AGC_BLOCK_TWO_SELF_CHECK.agc:120
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:121
//S+ZERO		EQUALS	ZERO
// AGC_BLOCK_TWO_SELF_CHECK.agc:122
//S+1		EQUALS	BIT1
// AGC_BLOCK_TWO_SELF_CHECK.agc:123
//S+2		EQUALS	BIT2
// AGC_BLOCK_TWO_SELF_CHECK.agc:124
//S+3		EQUALS	THREE
// AGC_BLOCK_TWO_SELF_CHECK.agc:125
//S+4		EQUALS	FOUR
// AGC_BLOCK_TWO_SELF_CHECK.agc:126
//S+5		EQUALS	FIVE
// AGC_BLOCK_TWO_SELF_CHECK.agc:127
//S+6		EQUALS	SIX
// AGC_BLOCK_TWO_SELF_CHECK.agc:128
//# Page 1286
// AGC_BLOCK_TWO_SELF_CHECK.agc:129
//S+7		EQUALS	SEVEN
// AGC_BLOCK_TWO_SELF_CHECK.agc:130
//S8BITS		EQUALS	LOW8		# 00377
// AGC_BLOCK_TWO_SELF_CHECK.agc:131
//CNTRCON		=	OCT50		# USED IN CNTRCHK
// AGC_BLOCK_TWO_SELF_CHECK.agc:132
//ERASCON1	OCTAL	00061		# USED IN ERASCHK
// slot 38554
    38554, 98
)).

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:133
//ERASCON2	OCTAL	01373		# USED IN ERASCHK
// slot 38555
    38555, 1526,
// AGC_BLOCK_TWO_SELF_CHECK.agc:134
//ERASCON6	=	OCT1400		# USED IN ERASCHK
// AGC_BLOCK_TWO_SELF_CHECK.agc:135
//ERASCON3	OCTAL	01461		# USED IN ERASCHK
// slot 38556
    38556, 1634,
// AGC_BLOCK_TWO_SELF_CHECK.agc:136
//ERASCON4	OCTAL	01773		# USED IN ERASCHK
// slot 38557
    38557, 2038,
// AGC_BLOCK_TWO_SELF_CHECK.agc:137
//S10BITS		EQUALS	LOW10		# 01777, USED IN ERASCHK
// AGC_BLOCK_TWO_SELF_CHECK.agc:138
//SBNK03		EQUALS	PRIO6		# 06000, USED IN ROPECHK
// AGC_BLOCK_TWO_SELF_CHECK.agc:139
//-MAXADRS	=	HI5		# FOR ROPECHK
// AGC_BLOCK_TWO_SELF_CHECK.agc:140
//SIXTY		OCTAL	00060
// slot 38558
    38558, 96,
// AGC_BLOCK_TWO_SELF_CHECK.agc:141
//SUPRCON		OCTAL	60017		# USED IN ROPECHK
// slot 38559
    38559, 49182,
// AGC_BLOCK_TWO_SELF_CHECK.agc:142
//S13BITS		OCTAL	17777
// slot 38560
    38560, 16382,
// AGC_BLOCK_TWO_SELF_CHECK.agc:143
//CONC+S1		OCTAL	25252		# USED IN CYCLSHFT
// slot 38561
    38561, 21844,
// AGC_BLOCK_TWO_SELF_CHECK.agc:144
//CONC+S2		OCTAL	52400		# USED IN CYCLSHFT
// slot 38562
    38562, 43520,
// AGC_BLOCK_TWO_SELF_CHECK.agc:145
//ERASCON5	OCTAL	76777
// slot 38563
    38563, 64510,
// AGC_BLOCK_TWO_SELF_CHECK.agc:146
//S-7		=	OCT77770
// AGC_BLOCK_TWO_SELF_CHECK.agc:147
//S-4		EQUALS	NEG4
// AGC_BLOCK_TWO_SELF_CHECK.agc:148
//S-3		EQUALS	NEG3
// AGC_BLOCK_TWO_SELF_CHECK.agc:149
//S-2		EQUALS	NEG2
// AGC_BLOCK_TWO_SELF_CHECK.agc:150
//S-1		EQUALS	NEGONE
// AGC_BLOCK_TWO_SELF_CHECK.agc:151
//S-ZERO		EQUALS	NEG0
// AGC_BLOCK_TWO_SELF_CHECK.agc:152
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:153
//		EBANK=	LST1
// AGC_BLOCK_TWO_SELF_CHECK.agc:154
//ADRS1		ADRES	SKEEP1
// slot 38564
    38564, 1522,
// AGC_BLOCK_TWO_SELF_CHECK.agc:155
//SELFADRS	ADRES	SELFCHK		# SELFCHK RETURN ADDRESS.  SHOULD BE PUT
// slot 38565
    38565, 3516
)).

// bank 43, slots 38566-38571
function agcAotUnit2632 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38568 {
        if slot <= 38566 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:156
//					# IN SELFRET WHEN GOING FROM SELFCHK TO
// AGC_BLOCK_TWO_SELF_CHECK.agc:157
//					# SHOWSUM AND PUT IN SKEEP1 WHEN GOING
// AGC_BLOCK_TWO_SELF_CHECK.agc:158
//					# FROM SHOWSUM TO SELF-CHECK.
// AGC_BLOCK_TWO_SELF_CHECK.agc:159
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:160
//PRERRORS	CA	ERESTORE	# IS IT NECESSARY TO RESTORE ERASABLE
// slot 38566
            if slot <> 38566 or instruction <> 13040 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 752).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38567 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:161
//		EXTEND
// slot 38567
                if slot <> 38567 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:162
//		BZF	ERRORS		# NO
// slot 38568
                if slot <> 38568 or instruction <> 5807 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5807, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38569 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:163
//		EXTEND
// slot 38569
            if slot <> 38569 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38570 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:164
//		DCA	SKEEP5
// slot 38570
                if slot <> 38570 or instruction <> 13054 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:165
//		INDEX	SKEEP7
// slot 38571
                if slot <> 38571 or instruction <> 21247 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2632] to agcAotUnit2632@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:166
//		DXCH	0000		# RESTORE THE TWO ERASABLE REGISTERS
// slot 38572
    38572, 43010
)).

// bank 43, slots 38573-38580
function agcAotUnit2633 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38576 {
        if slot <= 38574 {
            if slot <= 38573 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:167
//		CA	S+ZERO
// slot 38573
                if slot <> 38573 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:168
//		TS	ERESTORE
// slot 38574
                if slot <> 38574 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38575 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:169
//ERRORS		INHINT
// slot 38575
                if slot <> 38575 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:170
//		CA	Q
// slot 38576
                if slot <> 38576 or instruction <> 12290 { return choose false if checkOnly else -1. }
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
        if slot <= 38578 {
            if slot <= 38577 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:171
//		TS	SFAIL		# SAVE Q FOR FAILURE LOCATION
// slot 38577
                if slot <> 38577 or instruction <> 23279 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23279, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:172
//		TS	ALMCADR		# FOR DISPLAY WITH BBANK AND ERCOUNT
// slot 38578
                if slot <> 38578 or instruction <> 23283 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23283, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38579 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:173
//		INCR	ERCOUNT		# KEEP TRACK OF NUMBER OF MALFUNCTIONS.
// slot 38579
                if slot <> 38579 or instruction <> 10997 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 757).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:174
//TCALARM2	TC	ALARM2
// slot 38580
                if slot <> 38580 or instruction <> 2937 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2937, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2633] to agcAotUnit2633@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:175
//		OCT	01102		# SELF-CHECK MALFUNCTION INDICATOR
// slot 38581
    38581, 1156
)).

// bank 43, slots 38582-38608
function agcAotUnit2634 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38594 {
        if slot <= 38587 {
            if slot <= 38584 {
                if slot <= 38582 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:176
//		CCS	SMODE
// slot 38582
                    if slot <> 38582 or instruction <> 4850 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 754).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38583 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:177
//SIDLOOP		CA	S+ZERO
// slot 38583
                        if slot <> 38583 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:178
//		TS	SMODE
// slot 38584
                        if slot <> 38584 or instruction <> 23282 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23282, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38585 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:179
//# Page 1287
// AGC_BLOCK_TWO_SELF_CHECK.agc:180
//		TC	SELFCHK		# GO TO IDLE LOOP
// slot 38585
                    if slot <> 38585 or instruction <> 1758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1758, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38586 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:181
//		TC	SFAIL		# CONTINUE WITH SELF-CHECK
// slot 38586
                        if slot <> 38586 or instruction <> 751 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 751, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:182
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:183
//-1CHK		CCS	A
// slot 38587
                        if slot <> 38587 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 38590 {
                if slot <= 38588 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:184
//		TCF	PRERRORS
// slot 38588
                    if slot <> 38588 or instruction <> 5798 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5798, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38589 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:185
//		TCF	PRERRORS
// slot 38589
                        if slot <> 38589 or instruction <> 5798 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5798, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:186
//		CCS	A
// slot 38590
                        if slot <> 38590 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 38592 {
                    if slot <= 38591 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:187
//		TCF	PRERRORS
// slot 38591
                        if slot <> 38591 or instruction <> 5798 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5798, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:188
//		TC	Q
// slot 38592
                        if slot <> 38592 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38593 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:189
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:190
//SMODECHK	EXTEND
// slot 38593
                        if slot <> 38593 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:191
//		QXCH	SKEEP1
// slot 38594
                        if slot <> 38594 or instruction <> 9977 { return choose false if checkOnly else -1. }
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
        if slot <= 38601 {
            if slot <= 38597 {
                if slot <= 38595 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:192
//		TC	CHECKNJ		# CHECK FOR NEW JOB
// slot 38595
                    if slot <> 38595 or instruction <> 1754 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1754, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38596 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:193
//		CCS	SMODE
// slot 38596
                        if slot <> 38596 or instruction <> 4850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 754).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:194
//		TC	SOPTIONS
// slot 38597
                        if slot <> 38597 or instruction <> 1738 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1738, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38599 {
                    if slot <= 38598 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:195
//		TC	SMODECHK +2	# TO BACKUP IDLE LOOP
// slot 38598
                        if slot <> 38598 or instruction <> 1731 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1731, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:196
//		TC	SOPTIONS
// slot 38599
                        if slot <> 38599 or instruction <> 1738 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1738, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38600 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:197
//		INCR	SCOUNT
// slot 38600
                        if slot <> 38600 or instruction <> 10998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 758).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:198
//		TC	SKEEP1		# CONTINUE WITH SELF-CHECK
// slot 38601
                        if slot <> 38601 or instruction <> 761 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 761, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38604 {
                if slot <= 38602 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:199
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:200
//SOPTIONS	AD	S-7
// slot 38602
                    if slot <> 38602 or instruction <> 27568 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2992), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38603 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:201
//		EXTEND
// slot 38603
                        if slot <> 38603 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:202
//		BZMF	+2		# FOR OPTIONS BELOW NINE.
// slot 38604
                        if slot <> 38604 or instruction <> 26318 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26318, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38606 {
                    if slot <= 38605 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:203
//BNKOPTN		TC	SIDLOOP		# ILLEGAL OPTION.  GO TO IDLE LOOP.
// slot 38605
                        if slot <> 38605 or instruction <> 1719 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1719, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:204
//		INCR	SCOUNT		# FOR OPTIONS BELOW NINE.
// slot 38606
                        if slot <> 38606 or instruction <> 10998 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 758).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38607 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:205
//		AD	S+7
// slot 38607
                        if slot <> 38607 or instruction <> 27119 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:206
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:207
//		INDEX	A
// slot 38608
                        if slot <> 38608 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2634] to agcAotUnit2634@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:208
//		TC	SOPTION1
// slot 38609
    38609, 3492
)).

// bank 43, slots 38610-38620
function agcAotUnit2635 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38614 {
        if slot <= 38611 {
            if slot <= 38610 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:209
//SOPTION1	TC	SKEEP1		# WAS TC+TCF
// slot 38610
                if slot <> 38610 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:210
//SOPTION2	TC	SKEEP1		# WAS IN:OUT1
// slot 38611
                if slot <> 38611 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38612 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:211
//SOPTION3	TC	SKEEP1		# WAS COUNTCHK
// slot 38612
                if slot <> 38612 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38613 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:212
//SOPTION4	TC	ERASCHK
// slot 38613
                    if slot <> 38613 or instruction <> 1759 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1759, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:213
//SOPTION5	TC	ROPECHK
// slot 38614
                    if slot <> 38614 or instruction <> 1872 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1872, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38617 {
            if slot <= 38615 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:214
//SOPTION6	TC	SKEEP1
// slot 38615
                if slot <> 38615 or instruction <> 761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38616 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:215
//SOPTION7	TC	SKEEP1
// slot 38616
                    if slot <> 38616 or instruction <> 761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:216
//SOPTON10	TC	SKEEP1		# CONTINUE WITH SELF-CHECK
// slot 38617
                    if slot <> 38617 or instruction <> 761 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 761, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38618 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:217
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:218
//CHECKNJ		EXTEND
// slot 38618
                if slot <> 38618 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38619 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:219
//		QXCH	SELFRET		# SAVE RETURN ADDRESS WHILE TESTING NEWJOB
// slot 38619
                    if slot <> 38619 or instruction <> 9969 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 753, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:220
//		TC	POSTJUMP	# TO SEE IF ANY JOBS HAVE BECOME ACTIVE.
// slot 38620
                    if slot <> 38620 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2635] to agcAotUnit2635@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:221
//		CADR	ADVAN
// slot 38621
    38621, 3352
)).

// bank 43, slots 38622-38651
function agcAotUnit2636 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38636 {
        if slot <= 38628 {
            if slot <= 38624 {
                if slot <= 38622 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:222
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:223
//SELFCHK		TC	SMODECHK	# ** CHARLEY, COME IN HERE
// slot 38622
                    if slot <> 38622 or instruction <> 1729 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1729, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38623 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:224
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:225
//# SKEEP7 HOLDS LOWEST OF TWO ADDRESSES BEING CHECKED.
// AGC_BLOCK_TWO_SELF_CHECK.agc:226
//# SKEEP6 HOLDS B(X+1).
// AGC_BLOCK_TWO_SELF_CHECK.agc:227
//# SKEEP5 HOLDS B(X).
// AGC_BLOCK_TWO_SELF_CHECK.agc:228
//# SKEEP4 HOLDS C(EBANK) DURING ERASLOOP AND CHECKNJ.
// AGC_BLOCK_TWO_SELF_CHECK.agc:229
//# SKEEP3 HOLDS LAST ADDRESS BEING CHECKED (HIGHEST ADDRESS).
// AGC_BLOCK_TWO_SELF_CHECK.agc:230
//# Page 1288
// AGC_BLOCK_TWO_SELF_CHECK.agc:231
//# SKEEP2 CONTROLS CHECKING OF NON-SWITCHABLE ERASABLE MEMORY WITH BANK NUMBERS IN EB.
// AGC_BLOCK_TWO_SELF_CHECK.agc:232
//# ERASCHK TAKES APPROXMATELY 7 SECONDS
// AGC_BLOCK_TWO_SELF_CHECK.agc:233
//ERASCHK		CA	S+1
// slot 38623
                        if slot <> 38623 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:234
//		TS	SKEEP2
// slot 38624
                        if slot <> 38624 or instruction <> 23290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38626 {
                    if slot <= 38625 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:235
//0EBANK		CA	S+ZERO
// slot 38625
                        if slot <> 38625 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:236
//		TS	EBANK
// slot 38626
                        if slot <> 38626 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38627 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:237
//		CA	ERASCON3	# 01461
// slot 38627
                        if slot <> 38627 or instruction <> 13980 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1692), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:238
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38628
                        if slot <> 38628 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38632 {
                if slot <= 38630 {
                    if slot <= 38629 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:239
//		CA	S10BITS		# 01777
// slot 38629
                        if slot <> 38629 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:240
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38630
                        if slot <> 38630 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38631 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:241
//		TC	ERASLOOP
// slot 38631
                        if slot <> 38631 or instruction <> 1783 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1783, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:242
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:243
//E134567B	CA	ERASCON6	# 01400
// slot 38632
                        if slot <> 38632 or instruction <> 14855 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38634 {
                    if slot <= 38633 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:244
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38633
                        if slot <> 38633 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:245
//		CA	S10BITS		# 01777
// slot 38634
                        if slot <> 38634 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38635 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:246
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38635
                        if slot <> 38635 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:247
//		TC	ERASLOOP
// slot 38636
                        if slot <> 38636 or instruction <> 1783 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1783, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38643 {
            if slot <= 38639 {
                if slot <= 38637 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:248
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:249
//2EBANK		CA	ERASCON6	# 01400
// slot 38637
                    if slot <> 38637 or instruction <> 14855 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38638 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:250
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38638
                        if slot <> 38638 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:251
//		CA	ERASCON4	# 01773
// slot 38639
                        if slot <> 38639 or instruction <> 13981 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1693), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38641 {
                    if slot <= 38640 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:252
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38640
                        if slot <> 38640 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:253
//		TC	ERASLOOP
// slot 38641
                        if slot <> 38641 or instruction <> 1783 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1783, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38642 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:254
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:255
//NOEBANK		TS	SKEEP2		# +0
// slot 38642
                        if slot <> 38642 or instruction <> 23290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23290, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:256
//		CA	ERASCON1	# 00061
// slot 38643
                        if slot <> 38643 or instruction <> 13978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1690), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38647 {
                if slot <= 38645 {
                    if slot <= 38644 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:257
//		TS	SKEEP7		# STARTING ADDRESS
// slot 38644
                        if slot <> 38644 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:258
//		CA	ERASCON2	# 01373
// slot 38645
                        if slot <> 38645 or instruction <> 13979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1691), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38646 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:259
//		TS	SKEEP3		# LAST ADDRESS CHECKED
// slot 38646
                        if slot <> 38646 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:260
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:261
//ERASLOOP	INHINT
// slot 38647
                        if slot <> 38647 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38649 {
                    if slot <= 38648 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:262
//		CA	EBANK		# STORES C(EBANK)
// slot 38648
                        if slot <> 38648 or instruction <> 12291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 3).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:263
//		TS	SKEEP4
// slot 38649
                        if slot <> 38649 or instruction <> 23292 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23292, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38650 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:264
//		EXTEND
// slot 38650
                        if slot <> 38650 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:265
//		NDX	SKEEP7
// slot 38651
                        if slot <> 38651 or instruction <> 21247 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2636] to agcAotUnit2636@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:266
//		DCA	0000
// slot 38652
    38652, 24578
)).

// bank 43, slots 38653-38658
function agcAotUnit2637 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38655 {
        if slot <= 38653 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:267
//		DXCH	SKEEP5		# STORES C(X) AND C(X+1) IN SKEEP6 AND 5.
// slot 38653
            if slot <> 38653 or instruction <> 22270 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 766, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38654 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:268
//		CA	SKEEP7
// slot 38654
                if slot <> 38654 or instruction <> 13055 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 767).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:269
//		TS	ERESTORE	# IF RESTART, RESTORE C(X) AND C(X+1)
// slot 38655
                if slot <> 38655 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38656 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:270
//		TS	L
// slot 38656
            if slot <> 38656 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38657 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:271
//		INCR	L
// slot 38657
                if slot <> 38657 or instruction <> 10241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:272
//		NDX	A
// slot 38658
                if slot <> 38658 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2637] to agcAotUnit2637@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:273
//		DXCH	0000		# PUTS OWN ADDRESS IN X AND X +1
// slot 38659
    38659, 43010
)).

// bank 43, slots 38660-38660
function agcAotUnit2638 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF_CHECK.agc:274
//		NDX	SKEEP7
// slot 38660
    if slot <> 38660 or instruction <> 21247 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2638] to agcAotUnit2638@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:275
//		CS	0001		# CS X+1
// slot 38661
    38661, 32770
)).

// bank 43, slots 38662-38662
function agcAotUnit2639 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF_CHECK.agc:276
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
set agcAotRoutes[2639] to agcAotUnit2639@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:277
//		AD	0000		# AD X
// slot 38663
    38663, 49152
)).

// bank 43, slots 38664-38669
function agcAotUnit2640 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38666 {
        if slot <= 38664 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:278
//		TC	-1CHK
// slot 38664
            if slot <> 38664 or instruction <> 1723 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1723, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38665 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:279
//		CA	ERESTORE	# HAS ERASABLE BEEN RESTORED
// slot 38665
                if slot <> 38665 or instruction <> 13040 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 752).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:280
//		EXTEND
// slot 38666
                if slot <> 38666 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38667 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:281
//# Page 1289
// AGC_BLOCK_TWO_SELF_CHECK.agc:282
//		BZF	ELOOPFIN	# YES, EXIT ERASLOOP.
// slot 38667
            if slot <> 38667 or instruction <> 5919 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5919, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38668 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:283
//		EXTEND
// slot 38668
                if slot <> 38668 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:284
//		NDX	SKEEP7
// slot 38669
                if slot <> 38669 or instruction <> 21247 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2640] to agcAotUnit2640@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:285
//		DCS	0000		# COMPLEMENT OF ADDRESS OF X AND X+1
// slot 38670
    38670, 32770
)).

// bank 43, slots 38671-38671
function agcAotUnit2641 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF_CHECK.agc:286
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
set agcAotRoutes[2641] to agcAotUnit2641@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:287
//		DXCH	0000		# PUT COMPLEMENT OF ADDRESS OF X AND X+1
// slot 38672
    38672, 43010
)).

// bank 43, slots 38673-38673
function agcAotUnit2642 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF_CHECK.agc:288
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
set agcAotRoutes[2642] to agcAotUnit2642@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:289
//		CS	0000		# CS X
// slot 38674
    38674, 32768
)).

// bank 43, slots 38675-38675
function agcAotUnit2643 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// AGC_BLOCK_TWO_SELF_CHECK.agc:290
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
set agcAotRoutes[2643] to agcAotUnit2643@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:291
//		AD	0001		# AD X+1
// slot 38676
    38676, 49154
)).

// bank 43, slots 38677-38683
function agcAotUnit2644 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38679 {
        if slot <= 38677 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:292
//		TC	-1CHK
// slot 38677
            if slot <> 38677 or instruction <> 1723 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1723, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38678 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:293
//		CA	ERESTORE	# HAS ERASABLE BEEN RESTORED
// slot 38678
                if slot <> 38678 or instruction <> 13040 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 752).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:294
//		EXTEND
// slot 38679
                if slot <> 38679 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38681 {
            if slot <= 38680 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:295
//		BZF	ELOOPFIN	# YES, EXIT ERASLOOP.
// slot 38680
                if slot <> 38680 or instruction <> 5919 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5919, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:296
//		EXTEND
// slot 38681
                if slot <> 38681 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38682 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:297
//		DCA	SKEEP5
// slot 38682
                if slot <> 38682 or instruction <> 13054 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:298
//		NDX	SKEEP7
// slot 38683
                if slot <> 38683 or instruction <> 21247 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2644] to agcAotUnit2644@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:299
//		DXCH	0000		# PUT B(X) AND B(X+1) BACK INTO X AND X+1
// slot 38684
    38684, 43010
)).

// bank 43, slots 38685-38706
function agcAotUnit2645 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38695 {
        if slot <= 38689 {
            if slot <= 38686 {
                if slot <= 38685 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:300
//		CA	S+ZERO
// slot 38685
                    if slot <> 38685 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:301
//		TS	ERESTORE	# IF RESTART, DO NOT RESTORE C(X), C(X+1)
// slot 38686
                    if slot <> 38686 or instruction <> 23280 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23280, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38687 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:302
//ELOOPFIN	RELINT
// slot 38687
                    if slot <> 38687 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38688 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:303
//		TC	CHECKNJ		# CHECK FOR NEW JOB
// slot 38688
                        if slot <> 38688 or instruction <> 1754 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1754, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:304
//		CA	SKEEP4		# REPLACES B(EBANK)
// slot 38689
                        if slot <> 38689 or instruction <> 13052 { return choose false if checkOnly else -1. }
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
            if slot <= 38692 {
                if slot <= 38690 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:305
//		TS	EBANK
// slot 38690
                    if slot <> 38690 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38691 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:306
//		INCR	SKEEP7
// slot 38691
                        if slot <> 38691 or instruction <> 11007 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 767).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:307
//		CS	SKEEP7
// slot 38692
                        if slot <> 38692 or instruction <> 17151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 767).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38693 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:308
//		AD	SKEEP3
// slot 38693
                    if slot <> 38693 or instruction <> 25339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 763).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38694 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:309
//		EXTEND
// slot 38694
                        if slot <> 38694 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:310
//		BZF	+2
// slot 38695
                        if slot <> 38695 or instruction <> 5929 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5929, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38700 {
            if slot <= 38697 {
                if slot <= 38696 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:311
//		TC	ERASLOOP	# GO TO NEXT ADDRESS IN SAME BANK
// slot 38696
                    if slot <> 38696 or instruction <> 1783 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1783, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:312
//		CCS	SKEEP2
// slot 38697
                    if slot <> 38697 or instruction <> 4858 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 762).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38698 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:313
//		TC	NOEBANK
// slot 38698
                    if slot <> 38698 or instruction <> 1778 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1778, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38699 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:314
//		INCR	SKEEP2		# PUT +1 IN SKEEP2.
// slot 38699
                        if slot <> 38699 or instruction <> 11002 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 762).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:315
//		CA	EBANK
// slot 38700
                        if slot <> 38700 or instruction <> 12291 { return choose false if checkOnly else -1. }
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
            if slot <= 38703 {
                if slot <= 38701 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:316
//		AD	SBIT9
// slot 38701
                    if slot <> 38701 or instruction <> 27107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38702 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:317
//		TS	EBANK
// slot 38702
                        if slot <> 38702 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:318
//		AD	ERASCON5	# 76777, CHECK FOR BANK E2
// slot 38703
                        if slot <> 38703 or instruction <> 26275 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1699), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38704 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:319
//		EXTEND
// slot 38704
                    if slot <> 38704 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38705 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:320
//		BZF	2EBANK
// slot 38705
                        if slot <> 38705 or instruction <> 5869 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5869, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:321
//		CCS	EBANK
// slot 38706
                        if slot <> 38706 or instruction <> 4099 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2645] to agcAotUnit2645@.

// bank 43, slots 38707-38713
function agcAotUnit2646 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38709 {
        if slot <= 38707 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:322
//		TC	E134567B	# GO TO EBANKS 1,3,4,5,6, AND 7
// slot 38707
            if slot <> 38707 or instruction <> 1768 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1768, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38708 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:323
//		CA	ERASCON6	# END OF ERASCHK
// slot 38708
                if slot <> 38708 or instruction <> 14855 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:324
//		TS	EBANK
// slot 38709
                if slot <> 38709 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38711 {
            if slot <= 38710 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:325
//# CNTRCHK PERFORMS A CS OF ALL REGISTERS FROM OCT. 60 THROUGH OCT. 10.
// AGC_BLOCK_TWO_SELF_CHECK.agc:326
//# INCLUDED ARE ALL COUNTERS, T6-1, CYCLE AND SHIFT, AND ALL RUPT REGISTERS
// AGC_BLOCK_TWO_SELF_CHECK.agc:327
//CNTRCHK		CA	CNTRCON		# 00050
// slot 38710
                if slot <> 38710 or instruction <> 14841 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:328
//CNTRLOOP	TS	SKEEP2
// slot 38711
                if slot <> 38711 or instruction <> 23290 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23290, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38712 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:329
//		AD	SBIT4		# +10 OCTAL
// slot 38712
                if slot <> 38712 or instruction <> 27112 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:330
//		INDEX	A
// slot 38713
                if slot <> 38713 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2646] to agcAotUnit2646@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:331
//		CS	0000
// slot 38714
    38714, 32768
)).

// bank 43, slots 38715-38767
function agcAotUnit2647 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38740 {
        if slot <= 38727 {
            if slot <= 38720 {
                if slot <= 38717 {
                    if slot <= 38715 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:332
//# Page 1290
// AGC_BLOCK_TWO_SELF_CHECK.agc:333
//		CCS	SKEEP2
// slot 38715
                        if slot <> 38715 or instruction <> 4858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 762).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38716 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:334
//		TC	CNTRLOOP
// slot 38716
                            if slot <> 38716 or instruction <> 1847 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1847, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:335
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:336
//# CYCLSHFT CHECKS THE CYCLE AND SHIFT REGISTERS
// AGC_BLOCK_TWO_SELF_CHECK.agc:337
//CYCLSHFT	CA	CONC+S1		# 25252
// slot 38717
                            if slot <> 38717 or instruction <> 13985 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1697), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38718 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:338
//		TS	CYR		# C(CYR) = 12525
// slot 38718
                        if slot <> 38718 or instruction <> 22544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38719 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:339
//		TS	CYL		# C(CYL) = 52524
// slot 38719
                            if slot <> 38719 or instruction <> 22546 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22546, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:340
//		TS	SR		# C(SR) = 12525
// slot 38720
                            if slot <> 38720 or instruction <> 22545 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22545, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38723 {
                    if slot <= 38721 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:341
//		TS	EDOP		# C(EDOP) = 00125
// slot 38721
                        if slot <> 38721 or instruction <> 22547 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22547, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38722 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:342
//		AD	CYR		# 37777		C(CYR) = 45252
// slot 38722
                            if slot <> 38722 or instruction <> 24592 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 16).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:343
//		AD	CYL		# 00-12524	C(CYL) = 25251
// slot 38723
                            if slot <> 38723 or instruction <> 24594 { return choose false if checkOnly else -1. }
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
                    if slot <= 38725 {
                        if slot <= 38724 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:344
//		AD	SR		# 00-25251	C(SR) = 05252
// slot 38724
                            if slot <> 38724 or instruction <> 24593 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 17).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:345
//		AD	EDOP		# 00-25376	C(EDOP) = +0
// slot 38725
                            if slot <> 38725 or instruction <> 24595 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 19).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38726 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:346
//		AD	CONC+S2		# C(CONC+S2) = 52400
// slot 38726
                            if slot <> 38726 or instruction <> 26274 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1698), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:347
//		TC	-1CHK
// slot 38727
                            if slot <> 38727 or instruction <> 1723 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1723, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 38733 {
                if slot <= 38730 {
                    if slot <= 38728 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:348
//		AD	CYR		# 45252
// slot 38728
                        if slot <> 38728 or instruction <> 24592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 16).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38729 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:349
//		AD	CYL		# 72523
// slot 38729
                            if slot <> 38729 or instruction <> 24594 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 18).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:350
//		AD	SR		# 77775
// slot 38730
                            if slot <> 38730 or instruction <> 24593 { return choose false if checkOnly else -1. }
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
                    if slot <= 38731 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:351
//		AD	EDOP		# 77775
// slot 38731
                        if slot <> 38731 or instruction <> 24595 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 19).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38732 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:352
//		AD	S+1		# 77776
// slot 38732
                            if slot <> 38732 or instruction <> 27115 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:353
//		TC	-1CHK
// slot 38733
                            if slot <> 38733 or instruction <> 1723 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1723, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38736 {
                    if slot <= 38734 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:354
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:355
//		INCR	SCOUNT +1
// slot 38734
                        if slot <> 38734 or instruction <> 10999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 759).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38735 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:356
//		TC	SMODECHK
// slot 38735
                            if slot <> 38735 or instruction <> 1729 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1729, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:357
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:358
//# SKEEP1 HOLDS SUM
// AGC_BLOCK_TWO_SELF_CHECK.agc:359
//# SKEEP2 HOLDS PRESENT CONTENTS OF ADDRESS IN ROPECHK AND SHOWSUM ROUTINES
// AGC_BLOCK_TWO_SELF_CHECK.agc:360
//# SKEEP2 HOLDS BANK NUMBER IN LOW ORDER BITS DURING SHOWSUM DISPLAY
// AGC_BLOCK_TWO_SELF_CHECK.agc:361
//# SKEEP3 HOLDS PRESENT ADDRESS (00000 TO 01777 IN COMMON FIXED BANKS)
// AGC_BLOCK_TWO_SELF_CHECK.agc:362
//#			       (04000 TO 07777 IN FXFX BANKS)
// AGC_BLOCK_TWO_SELF_CHECK.agc:363
//# SKEEP3 HOLDS BUGGER WORD DURING SHOWSUM DISPLAY
// AGC_BLOCK_TWO_SELF_CHECK.agc:364
//# SKEEP4 HOLDS BANK NUMBER AND SUPER BANK NUMBER
// AGC_BLOCK_TWO_SELF_CHECK.agc:365
//# SKEEP5 COUNTS 2 SUCCESSIVE TC SELF WORDS
// AGC_BLOCK_TWO_SELF_CHECK.agc:366
//# SKEEP6 CONTROLS ROPECHK OR SHOWSUM OPTION
// AGC_BLOCK_TWO_SELF_CHECK.agc:367
//# SKEEP7 CONTROLS WHEN ROUNTINE IS IN COMMON FIXED OR FIXED FIXED BANKS
// AGC_BLOCK_TWO_SELF_CHECK.agc:368
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:369
//ROPECHK		CA	S-ZERO		# *
// slot 38736
                            if slot <> 38736 or instruction <> 14828 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2540), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38738 {
                        if slot <= 38737 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:370
//		TS	SKEEP6		# * -0 FOR ROPECHK.
// slot 38737
                            if slot <> 38737 or instruction <> 23294 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:371
//STSHOSUM	CA	S+ZERO		# * SHOULD BE ROPECHK
// slot 38738
                            if slot <> 38738 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                        if slot <= 38739 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:372
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:373
//		TS	SKEEP4		# BANK NUMBER
// slot 38739
                            if slot <> 38739 or instruction <> 23292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23292, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:374
//		CA	S+1
// slot 38740
                            if slot <> 38740 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                }
            }
        }
    } else {
        if slot <= 38753 {
            if slot <= 38746 {
                if slot <= 38743 {
                    if slot <= 38741 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:375
//COMMFX		TS	SKEEP7
// slot 38741
                        if slot <> 38741 or instruction <> 23295 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23295, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38742 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:376
//		CA	S+ZERO
// slot 38742
                            if slot <> 38742 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:377
//		TS	SKEEP1
// slot 38743
                            if slot <> 38743 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38744 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:378
//		TS	SKEEP3
// slot 38744
                        if slot <> 38744 or instruction <> 23291 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23291, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38745 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:379
//		CA	S+1
// slot 38745
                            if slot <> 38745 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:380
//		TS	SKEEP5		# COUNTS DOWN 2 TC SELF WORDS
// slot 38746
                            if slot <> 38746 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38749 {
                    if slot <= 38747 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:381
//COMADRS		CA	SKEEP4
// slot 38747
                        if slot <> 38747 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38748 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:382
//		TS	L		# TO SET SUPER BANK
// slot 38748
                            if slot <> 38748 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:383
//		MASK	HI5
// slot 38749
                            if slot <> 38749 or instruction <> 30952 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2280), 32768).
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
                    if slot <= 38751 {
                        if slot <= 38750 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:384
//# Page 1291
// AGC_BLOCK_TWO_SELF_CHECK.agc:385
//		AD	SKEEP3
// slot 38750
                            if slot <> 38750 or instruction <> 25339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:386
//		TC	SUPDACAL	# SUPER DATA CALL
// slot 38751
                            if slot <> 38751 or instruction <> 2473 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2473, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38752 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:387
//		TC	ADSUM
// slot 38752
                            if slot <> 38752 or instruction <> 1907 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1907, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:388
//		AD	SBIT11		# 02000
// slot 38753
                            if slot <> 38753 or instruction <> 27105 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 38760 {
                if slot <= 38756 {
                    if slot <= 38754 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:389
//		TC	ADRSCHK
// slot 38754
                        if slot <> 38754 or instruction <> 1916 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1916, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38755 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:390
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:391
//FXFX		CS	A
// slot 38755
                            if slot <> 38755 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:392
//		TS	SKEEP7
// slot 38756
                            if slot <> 38756 or instruction <> 23295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23295, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38758 {
                        if slot <= 38757 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:393
//		EXTEND
// slot 38757
                            if slot <> 38757 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:394
//		BZF	+3
// slot 38758
                            if slot <> 38758 or instruction <> 5993 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5993, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38759 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:395
//		CA	SBIT12		# 04000, STARTING ADDRESS OF BANK 02
// slot 38759
                            if slot <> 38759 or instruction <> 14816 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:396
//		TC	+2
// slot 38760
                            if slot <> 38760 or instruction <> 1898 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1898, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38763 {
                    if slot <= 38761 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:397
//		CA	SBNK03		# 06000, STARTING ADDRESS OF BANK 03
// slot 38761
                        if slot <> 38761 or instruction <> 14864 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 38762 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:398
//		TS	SKEEP3
// slot 38762
                            if slot <> 38762 or instruction <> 23291 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23291, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:399
//		CA	S+ZERO
// slot 38763
                            if slot <> 38763 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 38765 {
                        if slot <= 38764 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:400
//		TS	SKEEP1
// slot 38764
                            if slot <> 38764 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:401
//		CA	S+1
// slot 38765
                            if slot <> 38765 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                        if slot <= 38766 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:402
//		TS	SKEEP5		# COUNTS DOWN 2 TC SELF WORDS
// slot 38766
                            if slot <> 38766 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:403
//FXADRS		INDEX	SKEEP3
// slot 38767
                            if slot <> 38767 or instruction <> 21243 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2647] to agcAotUnit2647@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:404
//		CA	0000
// slot 38768
    38768, 24576
)).

// bank 43, slots 38769-38836
function agcAotUnit2648 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38802 {
        if slot <= 38785 {
            if slot <= 38776 {
                if slot <= 38772 {
                    if slot <= 38770 {
                        if slot <= 38769 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:405
//		TC	ADSUM
// slot 38769
                            if slot <> 38769 or instruction <> 1907 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1907, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:406
//		TC	ADRSCHK
// slot 38770
                            if slot <> 38770 or instruction <> 1916 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1916, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38771 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:407
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:408
//ADSUM		TS	SKEEP2
// slot 38771
                            if slot <> 38771 or instruction <> 23290 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23290, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:409
//		AD	SKEEP1
// slot 38772
                            if slot <> 38772 or instruction <> 25337 { return choose false if checkOnly else -1. }
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
                    if slot <= 38774 {
                        if slot <= 38773 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:410
//		TS	SKEEP1
// slot 38773
                            if slot <> 38773 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:411
//		CAF	S+ZERO
// slot 38774
                            if slot <> 38774 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                        if slot <= 38775 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:412
//		AD	SKEEP1
// slot 38775
                            if slot <> 38775 or instruction <> 25337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 761).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:413
//		TS	SKEEP1
// slot 38776
                            if slot <> 38776 or instruction <> 23289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23289, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38780 {
                    if slot <= 38778 {
                        if slot <= 38777 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:414
//		CS	SKEEP2
// slot 38777
                            if slot <> 38777 or instruction <> 17146 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 762).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:415
//		AD	SKEEP3
// slot 38778
                            if slot <> 38778 or instruction <> 25339 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38779 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:416
//		TC	Q
// slot 38779
                            if slot <> 38779 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:417
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:418
//ADRSCHK		LXCH	A
// slot 38780
                            if slot <> 38780 or instruction <> 9216 { return choose false if checkOnly else -1. }
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
                    if slot <= 38782 {
                        if slot <= 38781 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:419
//		CA	SKEEP3
// slot 38781
                            if slot <> 38781 or instruction <> 13051 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:420
//		MASK	LOW10		# RELATIVE ADDRESS
// slot 38782
                            if slot <> 38782 or instruction <> 31242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2570), 32768).
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
                        if slot <= 38783 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:421
//		AD	-MAXADRS	# SUBTRACT MAX RELATIVE ADDRESS = 1777.
// slot 38783
                            if slot <> 38783 or instruction <> 26856 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38784 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:422
//		EXTEND
// slot 38784
                                if slot <> 38784 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:423
//		BZF	SOPTION		# CHECKSUM FINISHED IF LAST ADDRESS.
// slot 38785
                                if slot <> 38785 or instruction <> 6072 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6072, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 38793 {
                if slot <= 38789 {
                    if slot <= 38787 {
                        if slot <= 38786 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:424
//		CCS	SKEEP5		# IS CHECKSUM FINISHED
// slot 38786
                            if slot <> 38786 or instruction <> 4861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 765).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:425
//		TC	+3		# NO
// slot 38787
                            if slot <> 38787 or instruction <> 1926 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1926, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38788 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:426
//		TC	+2		# NO
// slot 38788
                            if slot <> 38788 or instruction <> 1926 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1926, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:427
//		TC	SOPTION		# GO TO ROPECHK SHOWSUM OPTION
// slot 38789
                            if slot <> 38789 or instruction <> 1976 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1976, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38791 {
                        if slot <= 38790 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:428
//		CCS	L		# -0 MEANS A TC SELF WORD.
// slot 38790
                            if slot <> 38790 or instruction <> 4097 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:429
//		TC	CONTINU
// slot 38791
                            if slot <> 38791 or instruction <> 1934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1934, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38792 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:430
//		TC	CONTINU
// slot 38792
                            if slot <> 38792 or instruction <> 1934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1934, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:431
//		TC	CONTINU
// slot 38793
                            if slot <> 38793 or instruction <> 1934 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1934, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38797 {
                    if slot <= 38795 {
                        if slot <= 38794 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:432
//		CCS	SKEEP5
// slot 38794
                            if slot <> 38794 or instruction <> 4861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 765).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:433
//		TC	CONTINU +1
// slot 38795
                            if slot <> 38795 or instruction <> 1935 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1935, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38796 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:434
//		CA	S-1
// slot 38796
                            if slot <> 38796 or instruction <> 16359 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:435
//# Page 1292
// AGC_BLOCK_TWO_SELF_CHECK.agc:436
//		TC	CONTINU +1	# AD IN THE BUGGER WORD
// slot 38797
                            if slot <> 38797 or instruction <> 1935 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1935, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38799 {
                        if slot <= 38798 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:437
//CONTINU		CA	S+1		# MAKE SURE TWO CONSECUTIVE TC SELF WORDS
// slot 38798
                            if slot <> 38798 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:438
//		TS	SKEEP5
// slot 38799
                            if slot <> 38799 or instruction <> 23293 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23293, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38800 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:439
//		CCS	SKEEP6		# *
// slot 38800
                            if slot <> 38800 or instruction <> 4862 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 766).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38801 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:440
//		CCS	NEWJOB		# * +1, SHOWSUM
// slot 38801
                                if slot <> 38801 or instruction <> 4151 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 55).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:441
//		TC	CHANG1		# *
// slot 38802
                                if slot <> 38802 or instruction <> 2642 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2642, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 38819 {
            if slot <= 38810 {
                if slot <= 38806 {
                    if slot <= 38804 {
                        if slot <= 38803 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:442
//		TC	+2		# *
// slot 38803
                            if slot <> 38803 or instruction <> 1941 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1941, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:443
//		TC	CHECKNJ		# -0 IN SKEEP6 FOR ROPECHK
// slot 38804
                            if slot <> 38804 or instruction <> 1754 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1754, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38805 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:444
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:445
//ADRS+1		INCR	SKEEP3
// slot 38805
                            if slot <> 38805 or instruction <> 11003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 763).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:446
//		CCS	SKEEP7
// slot 38806
                            if slot <> 38806 or instruction <> 4863 { return choose false if checkOnly else -1. }
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
                    if slot <= 38808 {
                        if slot <= 38807 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:447
//		TC	COMADRS
// slot 38807
                            if slot <> 38807 or instruction <> 1883 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1883, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:448
//		TC	COMADRS
// slot 38808
                            if slot <> 38808 or instruction <> 1883 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1883, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38809 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:449
//		TC	FXADRS
// slot 38809
                            if slot <> 38809 or instruction <> 1903 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1903, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:450
//		TC	FXADRS
// slot 38810
                            if slot <> 38810 or instruction <> 1903 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1903, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38814 {
                    if slot <= 38812 {
                        if slot <= 38811 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:451
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:452
//NXTBNK		CS	SKEEP4
// slot 38811
                            if slot <> 38811 or instruction <> 17148 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 764).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:453
//		AD	LSTBNKCH	# LAST BANK TO BE CHECKED
// slot 38812
                            if slot <> 38812 or instruction <> 26579 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2003), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38813 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:454
//		EXTEND
// slot 38813
                            if slot <> 38813 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:455
//		BZF	ENDSUMS		# END OF SUMMING OF BANKS.
// slot 38814
                            if slot <> 38814 or instruction <> 5721 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5721, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38816 {
                        if slot <= 38815 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:456
//		CA	SKEEP4
// slot 38815
                            if slot <> 38815 or instruction <> 13052 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:457
//		AD	SBIT11
// slot 38816
                            if slot <> 38816 or instruction <> 27105 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38817 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:458
//		TS	SKEEP4		# 37 TO 40 INCRMTS SKEEP4 BY END RND CARRY
// slot 38817
                            if slot <> 38817 or instruction <> 23292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23292, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38818 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:459
//		TC	CHKSUPR
// slot 38818
                                if slot <> 38818 or instruction <> 1958 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1958, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:460
//17TO20		CA	SBIT15
// slot 38819
                                if slot <> 38819 or instruction <> 14813 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
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
            if slot <= 38827 {
                if slot <= 38823 {
                    if slot <= 38821 {
                        if slot <= 38820 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:461
//		ADS	SKEEP4		# SET FOR BANK 20
// slot 38820
                            if slot <> 38820 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:462
//		TC	GONXTBNK
// slot 38821
                            if slot <> 38821 or instruction <> 1970 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1970, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38822 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:463
//CHKSUPR		MASK	HI5
// slot 38822
                            if slot <> 38822 or instruction <> 30952 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                                if fixedOperand = 31744 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:464
//		EXTEND
// slot 38823
                            if slot <> 38823 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38825 {
                        if slot <= 38824 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:465
//		BZF	NXTSUPR		# INCREMENT SUPER BANK
// slot 38824
                            if slot <> 38824 or instruction <> 6064 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6064, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:466
//27TO30		AD	S13BITS
// slot 38825
                            if slot <> 38825 or instruction <> 26272 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1696), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38826 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:467
//		EXTEND
// slot 38826
                            if slot <> 38826 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:468
//		BZF	+2		# BANK SET FOR 30
// slot 38827
                            if slot <> 38827 or instruction <> 6061 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6061, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 38831 {
                    if slot <= 38829 {
                        if slot <= 38828 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:469
//		TC	GONXTBNK
// slot 38828
                            if slot <> 38828 or instruction <> 1970 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1970, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:470
//		CA	SIXTY		# FIRST SUPER BANK
// slot 38829
                            if slot <> 38829 or instruction <> 13982 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1694), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38830 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:471
//		ADS	SKEEP4
// slot 38830
                            if slot <> 38830 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:472
//		TC	GONXTBNK
// slot 38831
                            if slot <> 38831 or instruction <> 1970 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1970, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 38833 {
                        if slot <= 38832 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:473
//NXTSUPR		AD	SUPRCON		# SET BNK 30 + INCR SUPR BNK AND CANCEL
// slot 38832
                            if slot <> 38832 or instruction <> 26271 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1695), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:474
//		ADS	SKEEP4		# ERC BIT OF THE 37 TO 40 ADVANCE.
// slot 38833
                            if slot <> 38833 or instruction <> 12028 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 764).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 38834 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:475
//GONXTBNK	CCS	SKEEP7
// slot 38834
                            if slot <> 38834 or instruction <> 4863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 767).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 38835 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:476
//		TC	COMMFX
// slot 38835
                                if slot <> 38835 or instruction <> 1877 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1877, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:477
//		CA	S+1
// slot 38836
                                if slot <> 38836 or instruction <> 14827 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2648] to agcAotUnit2648@.

// bank 43, slots 38837-38866
function agcAotUnit2649 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38851 {
        if slot <= 38843 {
            if slot <= 38839 {
                if slot <= 38837 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:478
//		TC	FXFX
// slot 38837
                    if slot <> 38837 or instruction <> 1891 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1891, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38838 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:479
//		CA	SBIT7		# HAS TO BE LARGER THAN NO OF FXSW BANKS.
// slot 38838
                        if slot <> 38838 or instruction <> 14821 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:480
//		TC	COMMFX
// slot 38839
                        if slot <> 38839 or instruction <> 1877 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1877, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38841 {
                    if slot <= 38840 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:481
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:482
//SOPTION		CA	SKEEP4
// slot 38840
                        if slot <> 38840 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:483
//		MASK	HI5		# = BANK BITS
// slot 38841
                        if slot <> 38841 or instruction <> 30952 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2280), 32768).
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
                    if slot <= 38842 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:484
//		TC	LEFT5
// slot 38842
                        if slot <> 38842 or instruction <> 2265 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2265, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:485
//		TS	L		# BANK NUMBER BEFORE SUPER BANK
// slot 38843
                        if slot <> 38843 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38847 {
                if slot <= 38845 {
                    if slot <= 38844 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:486
//# Page 1293
// AGC_BLOCK_TWO_SELF_CHECK.agc:487
//		CA	SKEEP4
// slot 38844
                        if slot <> 38844 or instruction <> 13052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 764).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:488
//		MASK	S8BITS		# = SUPER BANK BITS
// slot 38845
                        if slot <> 38845 or instruction <> 30959 { return choose false if checkOnly else -1. }
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
                    if slot <= 38846 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:489
//		EXTEND
// slot 38846
                        if slot <> 38846 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:490
//		BZF	SOPT		# BEFORE SUPER BANK
// slot 38847
                        if slot <> 38847 or instruction <> 6085 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6085, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38849 {
                    if slot <= 38848 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:491
//		TS	SR		# SUPER BANK NECESSARY
// slot 38848
                        if slot <> 38848 or instruction <> 22545 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22545, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:492
//		CA	L
// slot 38849
                        if slot <> 38849 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38850 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:493
//		MASK	SEVEN
// slot 38850
                        if slot <> 38850 or instruction <> 31215 { return choose false if checkOnly else -1. }
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
// AGC_BLOCK_TWO_SELF_CHECK.agc:494
//		AD	SR
// slot 38851
                        if slot <> 38851 or instruction <> 24593 { return choose false if checkOnly else -1. }
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
        if slot <= 38858 {
            if slot <= 38854 {
                if slot <= 38852 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:495
//		TS	L		# BANK NUMBER WITH SUPER BANK
// slot 38852
                    if slot <> 38852 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38853 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:496
//SOPT		CA	SKEEP6		# *
// slot 38853
                        if slot <> 38853 or instruction <> 13054 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 766).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:497
//		EXTEND			# *
// slot 38854
                        if slot <> 38854 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38856 {
                    if slot <= 38855 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:498
//		BZF	+2		# * ON -0 CONTINUE WITH ROPE CHECK.
// slot 38855
                        if slot <> 38855 or instruction <> 6089 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6089, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:499
//		TC	SDISPLAY	# * ON +1 GO TO DISPLAY OF SUM.
// slot 38856
                        if slot <> 38856 or instruction <> 1611 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1611, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38857 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:500
//		CCS	SKEEP1		# FORCE SUM TO ABSOLUTE VALUE.
// slot 38857
                        if slot <> 38857 or instruction <> 4857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 761).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:501
//		TC	+2
// slot 38858
                        if slot <> 38858 or instruction <> 1996 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1996, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38862 {
                if slot <= 38860 {
                    if slot <= 38859 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:502
//		TC	+2
// slot 38859
                        if slot <> 38859 or instruction <> 1997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1997, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:503
//		AD	S+1
// slot 38860
                        if slot <> 38860 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 38861 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:504
//		TS	SKEEP1
// slot 38861
                        if slot <> 38861 or instruction <> 23289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23289, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:505
//BNKCHK		CS	L		# = - BANK NUMBER
// slot 38862
                        if slot <> 38862 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38864 {
                    if slot <= 38863 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:506
//		AD	SKEEP1
// slot 38863
                        if slot <> 38863 or instruction <> 25337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 761).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:507
//		AD	S-1
// slot 38864
                        if slot <> 38864 or instruction <> 28647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38865 {
// AGC_BLOCK_TWO_SELF_CHECK.agc:508
//		TC	-1CHK		# CHECK SUM
// slot 38865
                        if slot <> 38865 or instruction <> 1723 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1723, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// AGC_BLOCK_TWO_SELF_CHECK.agc:509
//		TC	NXTBNK
// slot 38866
                        if slot <> 38866 or instruction <> 1947 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1947, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2649] to agcAotUnit2649@.

agcAotInstallSourceRope(list(
// AGC_BLOCK_TWO_SELF_CHECK.agc:510
//
// AGC_BLOCK_TWO_SELF_CHECK.agc:511
//		EBANK=	NEWJOB
// AGC_BLOCK_TWO_SELF_CHECK.agc:512
//LSTBNKCH	BBCON*			# * CONSTANT, LAST BANK.
// slot 38867
    38867, 55424
)).

// no code for the lines below
// AGC_BLOCK_TWO_SELF_CHECK.agc:513
//
