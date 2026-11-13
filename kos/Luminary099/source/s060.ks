// PINBALL_NOUN_TABLES.agc
// bank 42, slots 36931-36932
function agcAotUnit2499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36931 {
// PINBALL_NOUN_TABLES.agc:1
//# Copyright:	Public domain.
// PINBALL_NOUN_TABLES.agc:2
//# Filename:	PINBALL_NOUN_TABLES.agc
// PINBALL_NOUN_TABLES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PINBALL_NOUN_TABLES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PINBALL_NOUN_TABLES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PINBALL_NOUN_TABLES.agc:6
//# Assembler:	yaYUL
// PINBALL_NOUN_TABLES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PINBALL_NOUN_TABLES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PINBALL_NOUN_TABLES.agc:9
//# Pages:	301-319
// PINBALL_NOUN_TABLES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PINBALL_NOUN_TABLES.agc:11
//#				from the Luminary131/ file of the same
// PINBALL_NOUN_TABLES.agc:12
//#				name, using Luminary099 page images.
// PINBALL_NOUN_TABLES.agc:13
//#		2009-06-07 RSB	Corrected two typos.
// PINBALL_NOUN_TABLES.agc:14
//#
// PINBALL_NOUN_TABLES.agc:15
//# This source code has been transcribed or otherwise adapted from
// PINBALL_NOUN_TABLES.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PINBALL_NOUN_TABLES.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PINBALL_NOUN_TABLES.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PINBALL_NOUN_TABLES.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PINBALL_NOUN_TABLES.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PINBALL_NOUN_TABLES.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PINBALL_NOUN_TABLES.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PINBALL_NOUN_TABLES.agc:23
//# actually created.
// PINBALL_NOUN_TABLES.agc:24
//#
// PINBALL_NOUN_TABLES.agc:25
//# Notations on the hardcopy document read, in part:
// PINBALL_NOUN_TABLES.agc:26
//#
// PINBALL_NOUN_TABLES.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PINBALL_NOUN_TABLES.agc:28
//#	16:27 JULY 14, 1969
// PINBALL_NOUN_TABLES.agc:29
//
// PINBALL_NOUN_TABLES.agc:30
//# Page 301
// PINBALL_NOUN_TABLES.agc:31
//# THE FOLLOWING REFERS TO THE NOUN TABLES
// PINBALL_NOUN_TABLES.agc:32
//#
// PINBALL_NOUN_TABLES.agc:33
//# COMPONENT CODE NUMBER		INTERPRETATION
// PINBALL_NOUN_TABLES.agc:34
//#
// PINBALL_NOUN_TABLES.agc:35
//#	00000			1 COMPONENT
// PINBALL_NOUN_TABLES.agc:36
//#	00001			2 COMPONENT
// PINBALL_NOUN_TABLES.agc:37
//#	00010			3 COMPONENT
// PINBALL_NOUN_TABLES.agc:38
//#	X1XXX			BIT 4 = 1.  DECIMAL ONLY
// PINBALL_NOUN_TABLES.agc:39
//#	1XXXX			BIT 5 = 1.  NO LOAD
// PINBALL_NOUN_TABLES.agc:40
//# END OF COMPONENT CODE NUMBER
// PINBALL_NOUN_TABLES.agc:41
//#
// PINBALL_NOUN_TABLES.agc:42
//# SF ROUTINE CODE NUMBER	INTERPRETATION
// PINBALL_NOUN_TABLES.agc:43
//#
// PINBALL_NOUN_TABLES.agc:44
//# 	00000			OCTAL ONLY
// PINBALL_NOUN_TABLES.agc:45
//#	00001			STRAIGHT FRACTIONAL
// PINBALL_NOUN_TABLES.agc:46
//#	00010			CDU DEGREES (XXX.XX)
// PINBALL_NOUN_TABLES.agc:47
//#	00011			ARITHMETIC SF
// PINBALL_NOUN_TABLES.agc:48
//#	00100			ARITH DP1	OUT (MULT BY 2EXP14 AT END)	IN (STRAIGHT)
// PINBALL_NOUN_TABLES.agc:49
//#	00101			ARITH DP2	OUT (STRAIGHT)			IN (SL 7 AT END)
// PINBALL_NOUN_TABLES.agc:50
//#	00110			LANDING RADAR POSITION (+0000X)
// PINBALL_NOUN_TABLES.agc:51
//#	00111			ARITH DP3	OUT (SL 7 AT END)		IN (STRAIGHT)
// PINBALL_NOUN_TABLES.agc:52
//#	01000			WHOLE HOURS IN R1, WHOLE MINUES (MOD 60) IN R2,
// PINBALL_NOUN_TABLES.agc:53
//#					SECONDS (MOD 60) 0XX.XX IN R3.  *** ALARMS IF USED WITH OCTAL
// PINBALL_NOUN_TABLES.agc:54
//#	01001			MINUTES (MOD 60) IN D1D2, D3 BLANK, SECONDS (MOD 60) IN D4D5
// PINBALL_NOUN_TABLES.agc:55
//#					LIMITS TO 59B59 IF MAG EXCEEDS THIS VALUE.
// PINBALL_NOUN_TABLES.agc:56
//#					ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PINBALL_NOUN_TABLES.agc:57
//#	01010			ARITH DP4	OUT (STRAIGHT)			IN (SL 3 AT END)
// PINBALL_NOUN_TABLES.agc:58
//#	01011			ARITH1 SF	OUT (MULT BY 2EXP14 AT END)	IN (STRAIGHT)
// PINBALL_NOUN_TABLES.agc:59
//#	01100			2 INTEGERS IN D1D2, D4D5, D3 BLANK.
// PINBALL_NOUN_TABLES.agc:60
//#					ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PINBALL_NOUN_TABLES.agc:61
//#	01101			360-CDU DEGREES (XXX.XX)
// PINBALL_NOUN_TABLES.agc:62
//#
// PINBALL_NOUN_TABLES.agc:63
//# END OF SF ROUTINE CODE NUMBERS
// PINBALL_NOUN_TABLES.agc:64
//
// PINBALL_NOUN_TABLES.agc:65
//# SF CONSTANT CODE NUMBER	INTERPRETATION
// PINBALL_NOUN_TABLES.agc:66
//#
// PINBALL_NOUN_TABLES.agc:67
//#	00000			WHOLE				USE ARITH
// PINBALL_NOUN_TABLES.agc:68
//#	00000			DP TIME SEC (XXX.XX SEC)	USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:69
//#	00000			LR POSITION (+0000X)		USE LR POSITION
// PINBALL_NOUN_TABLES.agc:70
//#	00001			SPARE
// PINBALL_NOUN_TABLES.agc:71
//#	00010			CDU DEGREES			USE CDU DEGREES
// PINBALL_NOUN_TABLES.agc:72
//#	00010			360-CDU DEGREES			USE 360-CDU DEGREES
// PINBALL_NOUN_TABLES.agc:73
//#	00011			DP DEGREES (90 XX.XXX DEG	USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:74
//#	00100			DP DEGREES (360) XXX.XX DEG	USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:75
//#	00101			DEGREES (180) XXX.XX DEG	USE ARITH
// PINBALL_NOUN_TABLES.agc:76
//#	00101			OPTICAL TRACKER AZIMUTH ANGLE (XXX.XXDEG)
// PINBALL_NOUN_TABLES.agc:77
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:78
//#	00110			WEIGHT2 (XXXXX. LBS)		USE ARITH1
// PINBALL_NOUN_TABLES.agc:79
//# Page 302
// PINBALL_NOUN_TABLES.agc:80
//#	00111			POSITION5 (XXX.XX NAUTICAL MILES)
// PINBALL_NOUN_TABLES.agc:81
//#								USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:82
//#	01000			POSITION4 (XXXX.X NAUTICAL MILES)
// PINBALL_NOUN_TABLES.agc:83
//#								USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:84
//#	01001			VELOCITY2 (XXXXX. FT/SEC)	USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:85
//#	01010			VELOCITY3 (XXXX.X FT/SEC)	USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:86
//#	01011			ELEVATION DEGREES (89.999 MAX)	USE ARITH
// PINBALL_NOUN_TABLES.agc:87
//#	01100			RENDEZVOUS RADAR RANGE (XXX.XX NAUT MI)
// PINBALL_NOUN_TABLES.agc:88
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:89
//#	01101			RENDEZVOUS RADAR RANGE RATE (XXXXX.FT/SEC)
// PINBALL_NOUN_TABLES.agc:90
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:91
//#	01110			LANDING RADAR ALTITUDE (XXXXX.FEET)
// PINBALL_NOUN_TABLES.agc:92
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:93
//#	01111			INITIAL/FINAL ALTITUDE (XXXXX. FEET)
// PINBALL_NOUN_TABLES.agc:94
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:95
//#	10000			ALTITUDE RATE (XXXXX.FT/SEC)	USE ARITH
// PINBALL_NOUN_TABLES.agc:96
//#	10001			FORWARD/LATERAL VELOCITY (XXXXX.FEET/SEC)
// PINBALL_NOUN_TABLES.agc:97
//#								USE ARITH
// PINBALL_NOUN_TABLES.agc:98
//#	10010			ROTATIONAL HAND CONTROLLER ANGLE RATES
// PINBALL_NOUN_TABLES.agc:99
//#					XXXXX.DEG/SEC		USE ARITH
// PINBALL_NOUN_TABLES.agc:100
//#	10011			LANDING RADAR VELX (XXXXX.FEET/SEC)
// PINBALL_NOUN_TABLES.agc:101
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:102
//#	10100			LANDING RADAR VELY (XXXXX.FEET/SEC)
// PINBALL_NOUN_TABLES.agc:103
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:104
//#	10101			LANDING RADAR VELZ (XXXXX.FEET/SEC)
// PINBALL_NOUN_TABLES.agc:105
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:106
//#	10110			POSITION7 (XXXX.X NAUT MI)	USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:107
//#	10111			TRIM DEGREES2 (XXX.XX DEG)	USE ARITH
// PINBALL_NOUN_TABLES.agc:108
//#	11000			COMPUTED ALTITUDE (XXXXX. FEET)
// PINBALL_NOUN_TABLES.agc:109
//#								USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:110
//#	11001			DP DEGREES (XXXX.X DEG)		USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:111
//#	11010			POSITION9 (XXXX.X FT)		USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:112
//#	11011			VELOCITY4 (XXXX.X FT/SEC)	USE ARITHDP2
// PINBALL_NOUN_TABLES.agc:113
//#	11100			RADIANS (XXX.XXX RADIANS)	USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:114
//#
// PINBALL_NOUN_TABLES.agc:115
//# END OF SF CONSTANT CODE NUMBERS
// PINBALL_NOUN_TABLES.agc:116
//
// PINBALL_NOUN_TABLES.agc:117
//# FOR GREATER THAN SINGLE PRECISION SCALES, PUT ADDRESS OF MAJOR PART INTO
// PINBALL_NOUN_TABLES.agc:118
//# NOUN TABLES.
// PINBALL_NOUN_TABLES.agc:119
//
// PINBALL_NOUN_TABLES.agc:120
//# OCTAL LOADS PLACE +0 INTO MAJOR PART, DATA INTO MINOR PART.
// PINBALL_NOUN_TABLES.agc:121
//
// PINBALL_NOUN_TABLES.agc:122
//# OCTAL DISPLAYS SHOW MINOR PART ONLY.
// PINBALL_NOUN_TABLES.agc:123
//
// PINBALL_NOUN_TABLES.agc:124
//# TO GET AT BOTH MAJOR AND MINOR PARTS (IN OCTAL), USE NOUN 01.
// PINBALL_NOUN_TABLES.agc:125
//
// PINBALL_NOUN_TABLES.agc:126
//# A NOUN MAY BE DECLARED :DECIMAL ONLY: BY MAKING BIT4=1 OF ITS COMPONENT
// PINBALL_NOUN_TABLES.agc:127
//# CODE NUMBER.  IF THIS NOUN IS USED WITH ANY OCTAL DISPLAY VERB, OR IF
// PINBALL_NOUN_TABLES.agc:128
//# DATA IS LOADED IN OCTAL, IT ALARMS.
// PINBALL_NOUN_TABLES.agc:129
//
// PINBALL_NOUN_TABLES.agc:130
//
// PINBALL_NOUN_TABLES.agc:131
//# IN LOADING AN :HOURS, MINUTES, SECONDS: NOUN, ALL 3 WORDS MUST BE
// PINBALL_NOUN_TABLES.agc:132
//# LOADED, OR ALARM.
// PINBALL_NOUN_TABLES.agc:133
//
// PINBALL_NOUN_TABLES.agc:134
//# Page 303
// PINBALL_NOUN_TABLES.agc:135
//
// PINBALL_NOUN_TABLES.agc:136
//# ALARM IF AN ATTEMPT IS MADE TO LOAD :SPLIT MINUTES/SECONDS: (MMBSS).
// PINBALL_NOUN_TABLES.agc:137
//# THIS IS USED FOR DISPLAY ONLY.
// PINBALL_NOUN_TABLES.agc:138
//
// PINBALL_NOUN_TABLES.agc:139
//# Page 304
// PINBALL_NOUN_TABLES.agc:140
//# THE FOLLOWING ROUTINES ARE FOR READING THE NOUN TABLES AND THE SF TABLES
// PINBALL_NOUN_TABLES.agc:141
//# (WHICH ARE IN A SEPARATE BANK FROM THE REST OF PINBALL).  THESE READING
// PINBALL_NOUN_TABLES.agc:142
//# ROUTINES ARE IN THE SAME BANK AS THE TABLES.  THEY ARE CALLED BY DXCH Z.
// PINBALL_NOUN_TABLES.agc:143
//
// PINBALL_NOUN_TABLES.agc:144
//# LODNNTAB LOADS NNADTEM WITH THE NNADTAB ENTRY, NNTYPTEM WITH THE
// PINBALL_NOUN_TABLES.agc:145
//# NNTYPTAB ENTRY.  IF THE NOUN IS MIXED, IDADITEM IS LOADED WITH THE FIRST
// PINBALL_NOUN_TABLES.agc:146
//# IDADDTAB ENTRY, IDAD2TEM THE SECOND IDADDTAB ENTRY, IDAD3TEM THE THIRD
// PINBALL_NOUN_TABLES.agc:147
//# IDADDTAB ENTRY, RUTMXTEM WITH THE RUTMXTAB ENTRY.  MIXBR IS SET FOR
// PINBALL_NOUN_TABLES.agc:148
//# MIXED OR NORMAL NOUN.
// PINBALL_NOUN_TABLES.agc:149
//
// PINBALL_NOUN_TABLES.agc:150
//		BANK	6
// PINBALL_NOUN_TABLES.agc:151
//		SETLOC	PINBALL3
// PINBALL_NOUN_TABLES.agc:152
//		BANK
// PINBALL_NOUN_TABLES.agc:153
//		COUNT*	$$/NOUNS
// PINBALL_NOUN_TABLES.agc:154
//LODNNTAB	DXCH	IDAD2TEM		# SAVE RETURN INFO IN IDAD2TEM, IDAD3TEM.
// slot 36931
        if slot <> 36931 or instruction <> 21610 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PINBALL_NOUN_TABLES.agc:155
//		INDEX	NOUNREG
// slot 36932
        if slot <> 36932 or instruction <> 20994 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20994, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20994, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2499] to agcAotUnit2499@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:156
//		CAF	NNADTAB
// slot 36933
    36933, 26840
)).

// bank 42, slots 36934-36935
function agcAotUnit2500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36934 {
// PINBALL_NOUN_TABLES.agc:157
//		TS	NNADTEM
// slot 36934
        if slot <> 36934 or instruction <> 22630 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22630, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PINBALL_NOUN_TABLES.agc:158
//		INDEX	NOUNREG
// slot 36935
        if slot <> 36935 or instruction <> 20994 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20994, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20994, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2500] to agcAotUnit2500@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:159
//		CAF	NNTYPTAB
// slot 36936
    36936, 27040
)).

// bank 42, slots 36937-36947
function agcAotUnit2501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36941 {
        if slot <= 36938 {
            if slot <= 36937 {
// PINBALL_NOUN_TABLES.agc:160
//		TS	NNTYPTEM
// slot 36937
                if slot <> 36937 or instruction <> 22631 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22631, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:161
//		CS	NOUNREG
// slot 36938
                if slot <> 36938 or instruction <> 16898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 514).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36939 {
// PINBALL_NOUN_TABLES.agc:162
//		AD	MIXCON
// slot 36939
                if slot <> 36939 or instruction <> 27129 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2553), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36940 {
// PINBALL_NOUN_TABLES.agc:163
//		EXTEND
// slot 36940
                    if slot <> 36940 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:164
//		BZMF	LODMIXNN		# NOUN NUMBER G/E FIRST MIXED NOUN
// slot 36941
                    if slot <> 36941 or instruction <> 25681 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25681, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 36944 {
            if slot <= 36942 {
// PINBALL_NOUN_TABLES.agc:165
//		CAF	ONE			# NOUN NUMBER L/ FIRST MIXED NOUN
// slot 36942
                if slot <> 36942 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36943 {
// PINBALL_NOUN_TABLES.agc:166
//		TS	MIXBR			# NORMAL.  +1 INTO MIXBR
// slot 36943
                    if slot <> 36943 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:167
//		TC	LODNLV
// slot 36944
                    if slot <> 36944 or instruction <> 1119 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1119, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 36945 {
// PINBALL_NOUN_TABLES.agc:168
//LODMIXNN	CAF	TWO			# MIXED.  +2 INTO MIXBR.
// slot 36945
                if slot <> 36945 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36946 {
// PINBALL_NOUN_TABLES.agc:169
//		TS	MIXBR
// slot 36946
                    if slot <> 36946 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:170
//		INDEX	NOUNREG
// slot 36947
                    if slot <> 36947 or instruction <> 20994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20994, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2501] to agcAotUnit2501@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:171
//		CAF	RUTMXTAB -40D		# FIRST MIXED NOUN = 40.
// slot 36948
    36948, 27752
)).

// bank 42, slots 36949-36953
function agcAotUnit2502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36950 {
        if slot <= 36949 {
// PINBALL_NOUN_TABLES.agc:172
//		TS	RUTMXTEM
// slot 36949
            if slot <> 36949 or instruction <> 22635 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22635, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:173
//		CAF	LOW10
// slot 36950
            if slot <> 36950 or instruction <> 14858 { return choose false if checkOnly else -1. }
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
        if slot <= 36951 {
// PINBALL_NOUN_TABLES.agc:174
//		MASK	NNADTEM
// slot 36951
            if slot <> 36951 or instruction <> 28774 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 102).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36952 {
// PINBALL_NOUN_TABLES.agc:175
//		TS	Q			# TEMP
// slot 36952
                if slot <> 36952 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:176
//		INDEX	A
// slot 36953
                if slot <> 36953 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2502] to agcAotUnit2502@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:177
//		CAF	IDADDTAB
// slot 36954
    36954, 27472
)).

// bank 42, slots 36955-36957
function agcAotUnit2503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36955 {
// PINBALL_NOUN_TABLES.agc:178
//		TS	IDAD1TEM		# LOAD IDAD1TEM	WITH FIRST IDADDTAB ENTRY
// slot 36955
        if slot <> 36955 or instruction <> 22632 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22632, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 36956 {
// PINBALL_NOUN_TABLES.agc:179
//		EXTEND
// slot 36956
            if slot <> 36956 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:180
//		INDEX	Q			# LOAD IDAD2TEM WITH 2ND IDADDTAB ENTRY
// slot 36957
            if slot <> 36957 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2503] to agcAotUnit2503@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:181
//		DCA	IDADDTAB +1		# LOAD IDAD3TEM WITH 3RD IDADDTAB ENTRY.
// slot 36958
    36958, 27476
)).

// bank 42, slots 36959-36963
function agcAotUnit2504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36960 {
        if slot <= 36959 {
// PINBALL_NOUN_TABLES.agc:182
//LODNLV		DXCH	IDAD2TEM		# PUT RETURN INFO INTO A, L.
// slot 36959
            if slot <> 36959 or instruction <> 21610 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:183
//		DXCH	Z
// slot 36960
            if slot <> 36960 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36961 {
// PINBALL_NOUN_TABLES.agc:184
//
// PINBALL_NOUN_TABLES.agc:185
//MIXCON		=	OCT50			# (DEC 40)
// PINBALL_NOUN_TABLES.agc:186
//
// PINBALL_NOUN_TABLES.agc:187
//# GTSFOUT LOADS SFTEMP1, SFTEMP2 WTIH THE DP SFOUTAB ENTRIES.
// PINBALL_NOUN_TABLES.agc:188
//
// PINBALL_NOUN_TABLES.agc:189
//GTSFOUT		DXCH	SFTEMP1			# 2X(SFCONUM) ARRIVES IN SFTEMP1.
// slot 36961
            if slot <> 36961 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36962 {
// PINBALL_NOUN_TABLES.agc:190
//# Page 305
// PINBALL_NOUN_TABLES.agc:191
//		EXTEND
// slot 36962
                if slot <> 36962 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:192
//		INDEX	A
// slot 36963
                if slot <> 36963 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2504] to agcAotUnit2504@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:193
//		DCA	SFOUTAB
// slot 36964
    36964, 27358
)).

// bank 42, slots 36965-36969
function agcAotUnit2505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36966 {
        if slot <= 36965 {
// PINBALL_NOUN_TABLES.agc:194
//SFCOM		DXCH	SFTEMP1
// slot 36965
            if slot <> 36965 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:195
//		DXCH	Z
// slot 36966
            if slot <> 36966 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36967 {
// PINBALL_NOUN_TABLES.agc:196
//
// PINBALL_NOUN_TABLES.agc:197
//# GTSFIN LOADS SFTEMP1, SFTEMP2 WITH THE DP SFINTAB INTRIES.
// PINBALL_NOUN_TABLES.agc:198
//
// PINBALL_NOUN_TABLES.agc:199
//GTSFIN		DXCH	SFTEMP1			# 2X(SFCONUM) ARIVES IN SFTEMP1.
// slot 36967
            if slot <> 36967 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36968 {
// PINBALL_NOUN_TABLES.agc:200
//		EXTEND
// slot 36968
                if slot <> 36968 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:201
//		INDEX	A
// slot 36969
                if slot <> 36969 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2505] to agcAotUnit2505@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:202
//		DCA	SFINTAB
// slot 36970
    36970, 27242
)).

// bank 42, slots 36971-36971
function agcAotUnit2506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PINBALL_NOUN_TABLES.agc:203
//		TCF	SFCOM
// slot 36971
    if slot <> 36971 or instruction <> 5221 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5221, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2506] to agcAotUnit2506@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:204
//
// PINBALL_NOUN_TABLES.agc:205
//						# NN 	NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:206
//NNADTAB		OCT	00000			# 00 	NOT IN USE
// slot 36972
    36972, 0,
// PINBALL_NOUN_TABLES.agc:207
//		OCT	40000			# 01 	SPECIFY MACHINE ADDRESS (FRACTIONAL)
// slot 36973
    36973, 32768,
// PINBALL_NOUN_TABLES.agc:208
//		OCT	40000			# 02 	SPECIFY MACHINE ADDRESS (WHOLE)
// slot 36974
    36974, 32768,
// PINBALL_NOUN_TABLES.agc:209
//		OCT	40000			# 03	SPECIFY MACHINE ADDRESS (DEGREES)
// slot 36975
    36975, 32768,
// PINBALL_NOUN_TABLES.agc:210
//		ECADR	DSPTEM1			# 04	ANGULAR ERROR/DIFFERENCE
// slot 36976
    36976, 1098,
// PINBALL_NOUN_TABLES.agc:211
//		ECADR	DSPTEM1			# 05 	ANGULAR ERROR/DIFFERENCE
// slot 36977
    36977, 1098,
// PINBALL_NOUN_TABLES.agc:212
//		ECADR	OPTION1			# 06	OPTION CODE
// slot 36978
    36978, 1224,
// PINBALL_NOUN_TABLES.agc:213
//		ECADR	XREG			# 07	ECADR OF WORD TO BE MODIFIED
// slot 36979
    36979, 1030,
// PINBALL_NOUN_TABLES.agc:214
//						#	ONES FOR BITS TO BE MODIFIED
// PINBALL_NOUN_TABLES.agc:215
//						#	1 TO SET OR 0 TO RESET SELECTED BITS
// PINBALL_NOUN_TABLES.agc:216
//		ECADR	ALMCADR			# 08 	ALARM DATA
// slot 36980
    36980, 1510,
// PINBALL_NOUN_TABLES.agc:217
//		ECADR	FAILREG			# 09	ALARM CODES
// slot 36981
    36981, 506,
// PINBALL_NOUN_TABLES.agc:218
//		OCT	77776			# 10	CHANNEL TO BE SPECIFIED
// slot 36982
    36982, 65532,
// PINBALL_NOUN_TABLES.agc:219
//		ECADR	TCSI			# 11	TIG OF CSI (HRS,MIN,SEC)
// slot 36983
    36983, 3894,
// PINBALL_NOUN_TABLES.agc:220
//		ECADR	OPTIONX			# 12	OPTION CODE
// slot 36984
    36984, 1106,
// PINBALL_NOUN_TABLES.agc:221
//						#	(USED BY EXTENDED VERBS ONLY)
// PINBALL_NOUN_TABLES.agc:222
//		ECADR	TCDH			# 13	TIG OF CDH (HRS,MIN,SEC)
// slot 36985
    36985, 2044,
// PINBALL_NOUN_TABLES.agc:223
//		ECADR	DSPTEMX			# 14	CHECKLIST
// slot 36986
    36986, 1106,
// PINBALL_NOUN_TABLES.agc:224
//						#	(USED BY EXTENDED VERBS ONLY)
// PINBALL_NOUN_TABLES.agc:225
//		OCT	77777			# 15	INCREMENT MACHINE ADDRESS
// slot 36987
    36987, 65534,
// PINBALL_NOUN_TABLES.agc:226
//		ECADR	DSPTEMX			# 16	TIME OF EVENT (HRS,MIN,SEC)
// slot 36988
    36988, 1106,
// PINBALL_NOUN_TABLES.agc:227
//		OCT	00000			# 17	SPARE
// slot 36989
    36989, 0,
// PINBALL_NOUN_TABLES.agc:228
//		ECADR	FDAIX			# 18	AUTO MANEUVER BALL ANGLES
// slot 36990
    36990, 2504,
// PINBALL_NOUN_TABLES.agc:229
//		OCT	00000			# 19	SPARE
// slot 36991
    36991, 0,
// PINBALL_NOUN_TABLES.agc:230
//		ECADR	CDUX			# 20	ICDU ANGLES
// slot 36992
    36992, 52,
// PINBALL_NOUN_TABLES.agc:231
//		ECADR	PIPAX			# 21	PIPAS
// slot 36993
    36993, 62,
// PINBALL_NOUN_TABLES.agc:232
//		ECADR	THETAD			# 22	NEW ICDU ANGLES
// slot 36994
    36994, 418,
// PINBALL_NOUN_TABLES.agc:233
//		OCT	00000			# 23	SPARE
// slot 36995
    36995, 0,
// PINBALL_NOUN_TABLES.agc:234
//		ECADR	DSPTEM2 +1		# 24	DELTA TIME FOR AGC CLOCK (HRS,MIN,SEC)
// slot 36996
    36996, 1106,
// PINBALL_NOUN_TABLES.agc:235
//		ECADR	DSPTEM1			# 25	CHECKLIST
// slot 36997
    36997, 1098,
// PINBALL_NOUN_TABLES.agc:236
//						#	(USED WTIH PLEASE PERFORM ONLY)
// PINBALL_NOUN_TABLES.agc:237
//		ECADR	DSPTEM1			# 26	PRIO/DELAY, ADRES, BBCON
// slot 36998
    36998, 1098,
// PINBALL_NOUN_TABLES.agc:238
//		ECADR	SMODE			# 27	SELF TEST ON/OFF SWITCH
// slot 36999
    36999, 1508,
// PINBALL_NOUN_TABLES.agc:239
//# Page 306
// PINBALL_NOUN_TABLES.agc:240
//		OCT	00000			# 28	SPARE
// slot 37000
    37000, 0,
// PINBALL_NOUN_TABLES.agc:241
//		OCT	00000			# 29	SPARE
// slot 37001
    37001, 0,
// PINBALL_NOUN_TABLES.agc:242
//		OCT	0			# 30	SPARE
// slot 37002
    37002, 0,
// PINBALL_NOUN_TABLES.agc:243
//		OCT	0			# 31	SPARE
// slot 37003
    37003, 0,
// PINBALL_NOUN_TABLES.agc:244
//		ECADR	-TPER			# 32	TIME TO PERIGEE (HRS,MIN,SEC)
// slot 37004
    37004, 2244,
// PINBALL_NOUN_TABLES.agc:245
//		ECADR	TIG			# 33	TIME OF IGNITION (HRS,MIN,SEC)
// slot 37005
    37005, 3650,
// PINBALL_NOUN_TABLES.agc:246
//		ECADR	DSPTEM1			# 34	TIME OF EVENT (HRS,MIN,SEC)
// slot 37006
    37006, 1098,
// PINBALL_NOUN_TABLES.agc:247
//		ECADR	TTOGO			# 35	TIME TO GO TO EVENT (HRS,MIN,SEC)
// slot 37007
    37007, 3670,
// PINBALL_NOUN_TABLES.agc:248
//		ECADR	TIME2			# 36	TIME OF AGC CLOCK (HRS,MIN,SEC)
// slot 37008
    37008, 40,
// PINBALL_NOUN_TABLES.agc:249
//		ECADR	TTPI			# 37	TIG OF TPI (HRS,MIN,SEC)
// slot 37009
    37009, 3898,
// PINBALL_NOUN_TABLES.agc:250
//		ECADR	TET			# 38	TIME OF STATE BEING INTEGRATED
// slot 37010
    37010, 1692,
// PINBALL_NOUN_TABLES.agc:251
//		OCT	00000			# 39	SPARE
// slot 37011
    37011, 0,
// PINBALL_NOUN_TABLES.agc:252
//
// PINBALL_NOUN_TABLES.agc:253
//# END OF NNADTAB FOR NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:254
//
// PINBALL_NOUN_TABLES.agc:255
//						# NN	MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:256
//		OCT	64000			# 40	TIME TO IGNITION/CUTOFF
// slot 37012
    37012, 53248,
// PINBALL_NOUN_TABLES.agc:257
//						#	VG
// PINBALL_NOUN_TABLES.agc:258
//						#	DELTA V (ACCUMULATED)
// PINBALL_NOUN_TABLES.agc:259
//		OCT	02003			# 41	TARGET	AZIMUTH
// slot 37013
    37013, 2054,
// PINBALL_NOUN_TABLES.agc:260
//						#		ELEVATION
// PINBALL_NOUN_TABLES.agc:261
//		OCT	24006			# 42	APOGEE
// slot 37014
    37014, 20492,
// PINBALL_NOUN_TABLES.agc:262
//						#	PERIGEE
// PINBALL_NOUN_TABLES.agc:263
//						#	DELTA V (REQUIRED)
// PINBALL_NOUN_TABLES.agc:264
//		OCT	24011			# 43	LATITUDE
// slot 37015
    37015, 20498,
// PINBALL_NOUN_TABLES.agc:265
//						#	LONGITUDE
// PINBALL_NOUN_TABLES.agc:266
//						#	ALTITUDE
// PINBALL_NOUN_TABLES.agc:267
//		OCT	64014			# 44	APOGEE
// slot 37016
    37016, 53272,
// PINBALL_NOUN_TABLES.agc:268
//						#	PERIGEE
// PINBALL_NOUN_TABLES.agc:269
//						#	TFF
// PINBALL_NOUN_TABLES.agc:270
//		OCT	64017			# 45	MARKS
// slot 37017
    37017, 53278,
// PINBALL_NOUN_TABLES.agc:271
//						#	TTI OF NEXT BURN
// PINBALL_NOUN_TABLES.agc:272
//						#	MGA
// PINBALL_NOUN_TABLES.agc:273
//		OCT	00022			# 46	AUTOPILOT CONFIGURATION
// slot 37018
    37018, 36,
// PINBALL_NOUN_TABLES.agc:274
//		OCT	22025			# 47	LEM WEIGHT
// slot 37019
    37019, 18474,
// PINBALL_NOUN_TABLES.agc:275
//						#	CSM WEIGHT
// PINBALL_NOUN_TABLES.agc:276
//		OCT	22030			# 48	GIMBAL PITCH TRIM
// slot 37020
    37020, 18480,
// PINBALL_NOUN_TABLES.agc:277
//						#	GIMBAL ROLL TRIM
// PINBALL_NOUN_TABLES.agc:278
//		OCT	24033			# 49	DELTA R
// slot 37021
    37021, 20534,
// PINBALL_NOUN_TABLES.agc:279
//						#	DELTA V
// PINBALL_NOUN_TABLES.agc:280
//						#	RADAR DATA SOURCE CODE
// PINBALL_NOUN_TABLES.agc:281
//		OCT	0			# 50	SPARE
// slot 37022
    37022, 0,
// PINBALL_NOUN_TABLES.agc:282
//		OCT	22041			# 51	S-BAND ANTENNA	PITCH
// slot 37023
    37023, 18498,
// PINBALL_NOUN_TABLES.agc:283
//						#			YAW
// PINBALL_NOUN_TABLES.agc:284
//		OCT	00044			# 52	CENTRAL ANGLE OF ACTIVE VEHICLE
// slot 37024
    37024, 72,
// PINBALL_NOUN_TABLES.agc:285
//		OCT	00000			# 53	SPARE
// slot 37025
    37025, 0,
// PINBALL_NOUN_TABLES.agc:286
//		OCT	24052			# 54	RANGE
// slot 37026
    37026, 20564,
// PINBALL_NOUN_TABLES.agc:287
//						#	RANGE RATE
// PINBALL_NOUN_TABLES.agc:288
//						#	THETA
// PINBALL_NOUN_TABLES.agc:289
//		OCT	24055			# 55	NO. OF APSIDAL CROSSINGS
// slot 37027
    37027, 20570,
// PINBALL_NOUN_TABLES.agc:290
//# Page 307
// PINBALL_NOUN_TABLES.agc:291
//						#	ELEVATION ANGLE
// PINBALL_NOUN_TABLES.agc:292
//						#	CENTRAL ANGLE
// PINBALL_NOUN_TABLES.agc:293
//		OCT	02060			# 56	RR LOS	AZIMUTH
// slot 37028
    37028, 2144,
// PINBALL_NOUN_TABLES.agc:294
//						#		ELEVATION
// PINBALL_NOUN_TABLES.agc:295
//		OCT	20063			# 57	DELTA R
// slot 37029
    37029, 16486,
// PINBALL_NOUN_TABLES.agc:296
//		OCT	24066			# 58	PERIGEE ALT
// slot 37030
    37030, 20588,
// PINBALL_NOUN_TABLES.agc:297
//						#	DELTA V TPI
// PINBALL_NOUN_TABLES.agc:298
//						#	DELTA V TPF
// PINBALL_NOUN_TABLES.agc:299
//		OCT	24071			# 59	DELTA VELOCITY LOS
// slot 37031
    37031, 20594,
// PINBALL_NOUN_TABLES.agc:300
//		OCT	24074			# 60	HORIZONTAL VELOCITY
// slot 37032
    37032, 20600,
// PINBALL_NOUN_TABLES.agc:301
//						#	ALTITUDE RATE
// PINBALL_NOUN_TABLES.agc:302
//						#	COMPUTED ALTITUDE
// PINBALL_NOUN_TABLES.agc:303
//		OCT	64077			# 61	TIME TO GO IN BRAKING PHASE
// slot 37033
    37033, 53374,
// PINBALL_NOUN_TABLES.agc:304
//						#	TIME TO IGNITION
// PINBALL_NOUN_TABLES.agc:305
//						#	CROSS RANGE DISTANCE
// PINBALL_NOUN_TABLES.agc:306
//		OCT	64102			# 62	ABSOLUTE VALUE OF VELOCITY
// slot 37034
    37034, 53380,
// PINBALL_NOUN_TABLES.agc:307
//						#	TIME TO IGNITION
// PINBALL_NOUN_TABLES.agc:308
//						#	DELTA V (ACCUMULATED)
// PINBALL_NOUN_TABLES.agc:309
//		OCT	24105			# 63	ABSOLUTE VALUE OF VELOCITY
// slot 37035
    37035, 20618,
// PINBALL_NOUN_TABLES.agc:310
//						#	ALTITUDE RATE
// PINBALL_NOUN_TABLES.agc:311
//						#	COMPUTED ALTITUDE
// PINBALL_NOUN_TABLES.agc:312
//		OCT	64110			# 64	TIME LEFT FOR REDESIGNATION -- LPD ANGLE
// slot 37036
    37036, 53392,
// PINBALL_NOUN_TABLES.agc:313
//						#	ALTITUDE RATE
// PINBALL_NOUN_TABLES.agc:314
//						#	COMPUTED ALTITUDE
// PINBALL_NOUN_TABLES.agc:315
//		OCT	24113			# 65	SAMPLED AGC TIME (HRS,MIN,SEC)
// slot 37037
    37037, 20630,
// PINBALL_NOUN_TABLES.agc:316
//						#	(FETCHED IN INTERRUPT)
// PINBALL_NOUN_TABLES.agc:317
//		OCT	62116			# 66	LR	RANGE
// slot 37038
    37038, 51356,
// PINBALL_NOUN_TABLES.agc:318
//						#		POSITION
// PINBALL_NOUN_TABLES.agc:319
//		OCT	04121			# 67	LRVX
// slot 37039
    37039, 4258,
// PINBALL_NOUN_TABLES.agc:320
//						#	LRVY
// PINBALL_NOUN_TABLES.agc:321
//						#	LRVZ
// PINBALL_NOUN_TABLES.agc:322
//		OCT	64124			# 68	SLANT RANGE TO LANDING SIGHT
// slot 37040
    37040, 53416,
// PINBALL_NOUN_TABLES.agc:323
//						#	TIME TO GO IN BRAKING PHASE
// PINBALL_NOUN_TABLES.agc:324
//						#	LR ALTITUDE -- COMPUTED ALTITUDE
// PINBALL_NOUN_TABLES.agc:325
//		OCT	00000			# 69	SPARE
// slot 37041
    37041, 0,
// PINBALL_NOUN_TABLES.agc:326
//		OCT	04132			# 70	AOT DETENT CODE/STAR CODE
// slot 37042
    37042, 4276,
// PINBALL_NOUN_TABLES.agc:327
//		OCT	04135			# 71	AOT DETENT CODE/STAR CODE
// slot 37043
    37043, 4282,
// PINBALL_NOUN_TABLES.agc:328
//		OCT	02140			# 72	RR	360 -- TRUNNION ANGLE
// slot 37044
    37044, 2240,
// PINBALL_NOUN_TABLES.agc:329
//						#		SHAFT ANGLE
// PINBALL_NOUN_TABLES.agc:330
//		OCT	02143			# 73	NEW RR	360 -- TRUNNION ANGLE
// slot 37045
    37045, 2246,
// PINBALL_NOUN_TABLES.agc:331
//						#		SHAFT ANGLE
// PINBALL_NOUN_TABLES.agc:332
//		OCT	64146			# 74	TIME TO IGNITION
// slot 37046
    37046, 53452
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:333
//						#	YAWAFTER VEHICLE RISE
// PINBALL_NOUN_TABLES.agc:334
//						#	PITCH AFTER VEHICLE RISE
// PINBALL_NOUN_TABLES.agc:335
//		OCT	64151			# 75	DELTA ALTITUDE CDH
// slot 37047
    37047, 53458,
// PINBALL_NOUN_TABLES.agc:336
//						#	DELTA TIME (CDH-CSI OR TPI-CDH)
// PINBALL_NOUN_TABLES.agc:337
//						#	DELTA TIME (TPI-CDH OR TPI-NOMTPI)
// PINBALL_NOUN_TABLES.agc:338
//		OCT	24154			# 76	DESIRED HORIZONTAL VELOCITY
// slot 37048
    37048, 20696,
// PINBALL_NOUN_TABLES.agc:339
//						#	DESIRED RADIAL VELOCITY
// PINBALL_NOUN_TABLES.agc:340
//						#	CROSS-RANGE DISTANCE
// PINBALL_NOUN_TABLES.agc:341
//# Page 308
// PINBALL_NOUN_TABLES.agc:342
//		OCT	62157			# 77	TIME TO ENGINE CUTOFF
// slot 37049
    37049, 51422,
// PINBALL_NOUN_TABLES.agc:343
//						#	VELOCITY NORMAL TO CSM PLANE
// PINBALL_NOUN_TABLES.agc:344
//		OCT	02162			# 78	RR	RANGE
// slot 37050
    37050, 2276,
// PINBALL_NOUN_TABLES.agc:345
//						#		RANGE RATE
// PINBALL_NOUN_TABLES.agc:346
//		OCT	24165			# 79	CURSOR ANGLE
// slot 37051
    37051, 20714,
// PINBALL_NOUN_TABLES.agc:347
//						#	SPIRAL ANGLE
// PINBALL_NOUN_TABLES.agc:348
//						#	POSITION CODE
// PINBALL_NOUN_TABLES.agc:349
//		OCT	02170			# 80	DATA INDICATOR
// slot 37052
    37052, 2288,
// PINBALL_NOUN_TABLES.agc:350
//						#	OMEGA
// PINBALL_NOUN_TABLES.agc:351
//		OCT	24173			# 81	DELTA V (LV)
// slot 37053
    37053, 20726,
// PINBALL_NOUN_TABLES.agc:352
//		OCT	24176			# 82	DELTA V (LV)
// slot 37054
    37054, 20732,
// PINBALL_NOUN_TABLES.agc:353
//		OCT	24201			# 83	DELTA V (BODY)
// slot 37055
    37055, 20738,
// PINBALL_NOUN_TABLES.agc:354
//		OCT	24204			# 84	DELTA V (OTHER VEHICLE)
// slot 37056
    37056, 20744,
// PINBALL_NOUN_TABLES.agc:355
//		OCT	24207			# 85	VG (BODY)
// slot 37057
    37057, 20750,
// PINBALL_NOUN_TABLES.agc:356
//		OCT	24212			# 86	VG (LV)
// slot 37058
    37058, 20756,
// PINBALL_NOUN_TABLES.agc:357
//		OCT	02215			# 87	BACKUP OPTICS LOS	AZIMUTH
// slot 37059
    37059, 2330,
// PINBALL_NOUN_TABLES.agc:358
//						#				ELEVATION
// PINBALL_NOUN_TABLES.agc:359
//		OCT	24220			# 88	HALF UNIT SUN OR PLANET VECTOR
// slot 37060
    37060, 20768,
// PINBALL_NOUN_TABLES.agc:360
//		OCT	24223			# 89	LANDMARK	LATITUDE
// slot 37061
    37061, 20774,
// PINBALL_NOUN_TABLES.agc:361
//						#			LONGITUDE/2
// PINBALL_NOUN_TABLES.agc:362
//						#			ALTITUDE
// PINBALL_NOUN_TABLES.agc:363
//		OCT	24226			# 90	Y
// slot 37062
    37062, 20780,
// PINBALL_NOUN_TABLES.agc:364
//						#	Y DOT
// PINBALL_NOUN_TABLES.agc:365
//						#	PSI
// PINBALL_NOUN_TABLES.agc:366
//		OCT	04231			# 91	ALTITUDE
// slot 37063
    37063, 4402,
// PINBALL_NOUN_TABLES.agc:367
//						#	VELOCITY
// PINBALL_NOUN_TABLES.agc:368
//						#	FLIGHT PATH ANGLE
// PINBALL_NOUN_TABLES.agc:369
//		OCT	00000			# 92	SPARE
// slot 37064
    37064, 0,
// PINBALL_NOUN_TABLES.agc:370
//		OCT	04237			# 93	DELTA GYRO ANGLES
// slot 37065
    37065, 4414,
// PINBALL_NOUN_TABLES.agc:371
//		OCT	00000			# 94	SPARE
// slot 37066
    37066, 0,
// PINBALL_NOUN_TABLES.agc:372
//		OCT	0			# 95	SPARE
// slot 37067
    37067, 0,
// PINBALL_NOUN_TABLES.agc:373
//		OCT	0			# 96	SPARE
// slot 37068
    37068, 0,
// PINBALL_NOUN_TABLES.agc:374
//		OCT	04253			# 97	SYSTEM TEST INPUTS
// slot 37069
    37069, 4438,
// PINBALL_NOUN_TABLES.agc:375
//		OCT	04256			# 98	SYSTEM TEST RESULTS
// slot 37070
    37070, 4444,
// PINBALL_NOUN_TABLES.agc:376
//		OCT	24261			# 99	RMS IN POSITION
// slot 37071
    37071, 20834,
// PINBALL_NOUN_TABLES.agc:377
//						#	RMS IN VELOCITY
// PINBALL_NOUN_TABLES.agc:378
//						#	RMS IN BIAS
// PINBALL_NOUN_TABLES.agc:379
//
// PINBALL_NOUN_TABLES.agc:380
//# END OF NNADTAB FOR MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:381
//
// PINBALL_NOUN_TABLES.agc:382
//						# NN	NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:383
//NNTYPTAB	OCT	00000			# 00	NOT IN USE
// slot 37072
    37072, 0,
// PINBALL_NOUN_TABLES.agc:384
//		OCT	04040			# 01	3COMP FRACTIONAL
// slot 37073
    37073, 4160,
// PINBALL_NOUN_TABLES.agc:385
//		OCT	04140			# 02	3COMP WHOLE
// slot 37074
    37074, 4288,
// PINBALL_NOUN_TABLES.agc:386
//		OCT	04102			# 03	3COMP CDU DEGREES
// slot 37075
    37075, 4228,
// PINBALL_NOUN_TABLES.agc:387
//		OCT	00504			# 04	1COMP DPDEG(360)
// slot 37076
    37076, 648,
// PINBALL_NOUN_TABLES.agc:388
//		OCT	00504			# 05	1COMP DPDEG(360)
// slot 37077
    37077, 648,
// PINBALL_NOUN_TABLES.agc:389
//		OCT	04000			# 06	3COMP OCTAL ONLY
// slot 37078
    37078, 4096,
// PINBALL_NOUN_TABLES.agc:390
//		OCT	04000			# 07 	3COMP OCTAL ONLY
// slot 37079
    37079, 4096,
// PINBALL_NOUN_TABLES.agc:391
//		OCT	04000			# 08	3COMP OCTAL ONLY
// slot 37080
    37080, 4096,
// PINBALL_NOUN_TABLES.agc:392
//# Page 309
// PINBALL_NOUN_TABLES.agc:393
//		OCT	04000			# 09	3COMP OCTAL ONLY
// slot 37081
    37081, 4096,
// PINBALL_NOUN_TABLES.agc:394
//		OCT	00000			# 10	1COMP OCTAL ONLY
// slot 37082
    37082, 0,
// PINBALL_NOUN_TABLES.agc:395
//		OCT	24400			# 11	3COMP HMS (DEC ONLY)
// slot 37083
    37083, 20992,
// PINBALL_NOUN_TABLES.agc:396
//		OCT	02000			# 12	2COMP OCTAL ONLY
// slot 37084
    37084, 2048,
// PINBALL_NOUN_TABLES.agc:397
//		OCT	24400			# 13	3COMP HMS (DEC ONLY)
// slot 37085
    37085, 20992,
// PINBALL_NOUN_TABLES.agc:398
//		OCT	04140			# 14	3COMP WHOLE
// slot 37086
    37086, 4288,
// PINBALL_NOUN_TABLES.agc:399
//		OCT	00000			# 15	1COMP OCTAL ONLY
// slot 37087
    37087, 0,
// PINBALL_NOUN_TABLES.agc:400
//		OCT	24400			# 16	3COMP HMS (DEC ONLY)
// slot 37088
    37088, 20992,
// PINBALL_NOUN_TABLES.agc:401
//		OCT	0			# 17 	SPARE
// slot 37089
    37089, 0,
// PINBALL_NOUN_TABLES.agc:402
//		OCT	04102			# 18	3COMP CDU DEG
// slot 37090
    37090, 4228,
// PINBALL_NOUN_TABLES.agc:403
//		OCT	00000			# 19	SPARE
// slot 37091
    37091, 0,
// PINBALL_NOUN_TABLES.agc:404
//		OCT	04102			# 20	3COMP CDU DEGREES
// slot 37092
    37092, 4228,
// PINBALL_NOUN_TABLES.agc:405
//		OCT	04140			# 21	3COMP WHOLE
// slot 37093
    37093, 4288,
// PINBALL_NOUN_TABLES.agc:406
//		OCT	04102			# 22	3COMP CDU DEGREES
// slot 37094
    37094, 4228,
// PINBALL_NOUN_TABLES.agc:407
//		OCT	00000			# 23 	SPARE
// slot 37095
    37095, 0,
// PINBALL_NOUN_TABLES.agc:408
//		OCT	24400			# 24	3COMP HMS (DEC ONLY)
// slot 37096
    37096, 20992,
// PINBALL_NOUN_TABLES.agc:409
//		OCT	04140			# 25	3COMP WHOLE
// slot 37097
    37097, 4288,
// PINBALL_NOUN_TABLES.agc:410
//		OCT	04000			# 26	3COMP OCTAL ONLY
// slot 37098
    37098, 4096,
// PINBALL_NOUN_TABLES.agc:411
//		OCT	00140			# 27	1COMP WHILE
// slot 37099
    37099, 192,
// PINBALL_NOUN_TABLES.agc:412
//		OCT	00000			# 28	SPARE
// slot 37100
    37100, 0,
// PINBALL_NOUN_TABLES.agc:413
//		OCT	00000			# 29	SPARE
// slot 37101
    37101, 0,
// PINBALL_NOUN_TABLES.agc:414
//		OCT	0			# 30	SPARE
// slot 37102
    37102, 0,
// PINBALL_NOUN_TABLES.agc:415
//		OCT	0			# 31	SPARE
// slot 37103
    37103, 0,
// PINBALL_NOUN_TABLES.agc:416
//		OCT	24400			# 32 	3COMP HMS (DEC ONLY)
// slot 37104
    37104, 20992,
// PINBALL_NOUN_TABLES.agc:417
//		OCT	24400			# 33 	3COMP HMS (DEC ONLY)
// slot 37105
    37105, 20992,
// PINBALL_NOUN_TABLES.agc:418
//		OCT	24400			# 34	3COMP HMS (DEC ONLY)
// slot 37106
    37106, 20992,
// PINBALL_NOUN_TABLES.agc:419
//		OCT	24400			# 35 	3COMP HMS (DEC ONLY)
// slot 37107
    37107, 20992,
// PINBALL_NOUN_TABLES.agc:420
//		OCT	24400			# 36 	3COMP HMS (DEC ONLY)
// slot 37108
    37108, 20992,
// PINBALL_NOUN_TABLES.agc:421
//		OCT	24400			# 37 	3COMP HMS (DEC ONLY)
// slot 37109
    37109, 20992,
// PINBALL_NOUN_TABLES.agc:422
//		OCT	24400			# 38 	3COMP HMS (DEC ONLY)
// slot 37110
    37110, 20992,
// PINBALL_NOUN_TABLES.agc:423
//		OCT	00000			# 39	SPARE
// slot 37111
    37111, 0,
// PINBALL_NOUN_TABLES.agc:424
//
// PINBALL_NOUN_TABLES.agc:425
//# END OF NNTYPTAB FOR NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:426
//
// PINBALL_NOUN_TABLES.agc:427
//						# NN	MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:428
//		OCT	24500			# 40	3COMP	MIN/SEC, VEL3, VEL3
// slot 37112
    37112, 21120,
// PINBALL_NOUN_TABLES.agc:429
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:430
//		OCT	00542			# 41	2COMP	CDU DEG, ELEV DEG
// slot 37113
    37113, 708,
// PINBALL_NOUN_TABLES.agc:431
//		OCT	24410			# 42	3COMP	POS4, POS4, VEL3
// slot 37114
    37114, 21008,
// PINBALL_NOUN_TABLES.agc:432
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:433
//		OCT	20204			# 43	3COMP	DPDEG(360), DPDEG(360) POS4
// slot 37115
    37115, 16648,
// PINBALL_NOUN_TABLES.agc:434
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:435
//		OCT	00410			# 44	3COMP	POS4, POS4, MIN/SEC
// slot 37116
    37116, 528,
// PINBALL_NOUN_TABLES.agc:436
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:437
//		OCT	10000			# 45	3COMP	WHOLE, MIN/SEC, DPDEG(360)
// slot 37117
    37117, 8192,
// PINBALL_NOUN_TABLES.agc:438
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:439
//		OCT	00000			# 46	1COMP 	OCTAL ONLY
// slot 37118
    37118, 0,
// PINBALL_NOUN_TABLES.agc:440
//		OCT	00306			# 47	2COMP	WEIGHT2 FOR EACH
// slot 37119
    37119, 396,
// PINBALL_NOUN_TABLES.agc:441
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:442
//		OCT	01367			# 48	2COMP	TRIM DEG2 FOR EACH
// slot 37120
    37120, 1518,
// PINBALL_NOUN_TABLES.agc:443
//# Page 310
// PINBALL_NOUN_TABLES.agc:444
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:445
//		OCT	00510			# 49	3COMP	POS4, VEL3, WHOLE
// slot 37121
    37121, 656,
// PINBALL_NOUN_TABLES.agc:446
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:447
//		OCT	0			# 50	SPARE
// slot 37122
    37122, 0,
// PINBALL_NOUN_TABLES.agc:448
//		OCT	00204			# 51	2COMP	DPDEG(360), DPDEG(360)
// slot 37123
    37123, 264,
// PINBALL_NOUN_TABLES.agc:449
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:450
//		OCT	00004			# 52	1COMP	DPDEG(360)
// slot 37124
    37124, 8,
// PINBALL_NOUN_TABLES.agc:451
//		OCT	00000			# 53	SPARE
// slot 37125
    37125, 0,
// PINBALL_NOUN_TABLES.agc:452
//		OCT	10507			# 54	3COMP	POS5, VEL3, DPDEG(360)
// slot 37126
    37126, 8846,
// PINBALL_NOUN_TABLES.agc:453
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:454
//		OCT	10200			# 55	3COMP	WHOLE, DPDEG(360), DPDEG(360)
// slot 37127
    37127, 8448,
// PINBALL_NOUN_TABLES.agc:455
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:456
//		OCT	00204			# 56	2COMP	DPDEG(360), DPDEG(360)
// slot 37128
    37128, 264,
// PINBALL_NOUN_TABLES.agc:457
//		OCT	00010			# 57	1COMP	POS4
// slot 37129
    37129, 16,
// PINBALL_NOUN_TABLES.agc:458
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:459
//		OCT	24510			# 58	3COMP	POS4, VEL3, VEL3
// slot 37130
    37130, 21136,
// PINBALL_NOUN_TABLES.agc:460
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:461
//		OCT	24512			# 59	3COMP	VEL3 FOR EACH
// slot 37131
    37131, 21140
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:462
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:463
//		OCT	60512			# 60	3COMP	VEL3, VEL3, COMP ALT
// slot 37132
    37132, 49812,
// PINBALL_NOUN_TABLES.agc:464
//						# 		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:465
//		OCT	54000			# 61	3COMP 	MIN/SEC, MIN/SEC, POS7
// slot 37133
    37133, 45056,
// PINBALL_NOUN_TABLES.agc:466
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:467
//		OCT	24012			# 62	3COMP	VEL3, MIN/SEC, VEL3
// slot 37134
    37134, 20500,
// PINBALL_NOUN_TABLES.agc:468
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:469
//		OCT	60512			# 63	3COMP	VEL3, VEL3, COMP ALT
// slot 37135
    37135, 49812,
// PINBALL_NOUN_TABLES.agc:470
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:471
//		OCT	60500			# 64	3COMP	2INT, VEL3, COMP ALT
// slot 37136
    37136, 49792,
// PINBALL_NOUN_TABLES.agc:472
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:473
//		OCT	00000			# 65	3COMP	HMS (DEC ONLY)
// slot 37137
    37137, 0,
// PINBALL_NOUN_TABLES.agc:474
//		OCT	00016			# 66	2COMP 	LANDING RADAR ALT, POSITION
// slot 37138
    37138, 28,
// PINBALL_NOUN_TABLES.agc:475
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:476
//		OCT	53223			# 67	3COMP	LANDING RADAR VELX, Y, Z
// slot 37139
    37139, 44326,
// PINBALL_NOUN_TABLES.agc:477
//		OCT	60026			# 68	3COMP	POS7, MIN/SEC, COMP ALT
// slot 37140
    37140, 49196,
// PINBALL_NOUN_TABLES.agc:478
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:479
//		OCT	00000			# 69	SPARE
// slot 37141
    37141, 0,
// PINBALL_NOUN_TABLES.agc:480
//		OCT	0			# 70	3COMP	OCTAL ONLY FOR EACH
// slot 37142
    37142, 0,
// PINBALL_NOUN_TABLES.agc:481
//		OCT	0			# 71	3COMP	OCTAL ONLY FOR EACH
// slot 37143
    37143, 0,
// PINBALL_NOUN_TABLES.agc:482
//		OCT	00102			# 72	2COMP	360-CDU DEG, CDU DEG
// slot 37144
    37144, 132,
// PINBALL_NOUN_TABLES.agc:483
//		OCT	00102			# 73	2COMP	360-CDU DEG, CDU DEG
// slot 37145
    37145, 132,
// PINBALL_NOUN_TABLES.agc:484
//		OCT	10200			# 74	3COMP	MIN/SEC, DPDEG(360), DPDEG(360)
// slot 37146
    37146, 8448,
// PINBALL_NOUN_TABLES.agc:485
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:486
//		OCT	00010			# 75	3COMP	POS4, MIN/SEC, MIN/SEC
// slot 37147
    37147, 16,
// PINBALL_NOUN_TABLES.agc:487
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:488
//
// PINBALL_NOUN_TABLES.agc:489
//		OCT	20512			# 76	3COMP	VEL3, VEL3, POS4
// slot 37148
    37148, 17044,
// PINBALL_NOUN_TABLES.agc:490
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:491
//		OCT	00500			# 77	2COMP	MIN/SEC, VEL3
// slot 37149
    37149, 640,
// PINBALL_NOUN_TABLES.agc:492
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:493
//		OCT	00654			# 78	2 COMP	RR RANGE, RR RANGE RATE
// slot 37150
    37150, 856,
// PINBALL_NOUN_TABLES.agc:494
//		OCT	00102			# 79	3COMP	CDU DEG, CDU DEG, WHOLE
// slot 37151
    37151, 132,
// PINBALL_NOUN_TABLES.agc:495
//# Page 311
// PINBALL_NOUN_TABLES.agc:496
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:497
//		OCT	00200			# 80	2COMP	WHOLE, DPDEG(360)
// slot 37152
    37152, 256,
// PINBALL_NOUN_TABLES.agc:498
//		OCT	24512			# 81	3COMP	VEL3 FOR EACH
// slot 37153
    37153, 21140,
// PINBALL_NOUN_TABLES.agc:499
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:500
//		OCT	24512			# 82	3COMP	VEL3 FOR EACH
// slot 37154
    37154, 21140,
// PINBALL_NOUN_TABLES.agc:501
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:502
//		OCT	24512			# 83	3COMP	VEL3 FOR EACH
// slot 37155
    37155, 21140,
// PINBALL_NOUN_TABLES.agc:503
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:504
//		OCT	24512			# 84	3COMP	VEL3 FOR EACH
// slot 37156
    37156, 21140,
// PINBALL_NOUN_TABLES.agc:505
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:506
//		OCT	24512			# 85	3COMP	VEL3 FOR EACH
// slot 37157
    37157, 21140,
// PINBALL_NOUN_TABLES.agc:507
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:508
//		OCT	24512			# 86	3COMP	VEL3 FOR EACH
// slot 37158
    37158, 21140,
// PINBALL_NOUN_TABLES.agc:509
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:510
//		OCT	00102			# 87	2COMP	CDU DEG FOR EACH
// slot 37159
    37159, 132,
// PINBALL_NOUN_TABLES.agc:511
//		OCT	0			# 88	3COMP	FRAC FOR EACH
// slot 37160
    37160, 0,
// PINBALL_NOUN_TABLES.agc:512
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:513
//		OCT	16143			# 89	3COMP 	DPDEG(90), DPDEG(90), POS5
// slot 37161
    37161, 14534,
// PINBALL_NOUN_TABLES.agc:514
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:515
//		OCT	10507			# 90	3COMP	POS5, VEL3, DEPDEG(360)
// slot 37162
    37162, 8846,
// PINBALL_NOUN_TABLES.agc:516
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:517
//		OCT	10450			# 91	3COMP	POS4, VEL2, DPDEG(360)
// slot 37163
    37163, 8784,
// PINBALL_NOUN_TABLES.agc:518
//		OCT	00000			# 92	SPARE
// slot 37164
    37164, 0,
// PINBALL_NOUN_TABLES.agc:519
//		OCT	06143			# 93	3COMP	DPDEG(90) FOR EACH
// slot 37165
    37165, 6342,
// PINBALL_NOUN_TABLES.agc:520
//		OCT	00000			# 94	SPARE
// slot 37166
    37166, 0,
// PINBALL_NOUN_TABLES.agc:521
//		OCT	0			# 95	SPARE
// slot 37167
    37167, 0,
// PINBALL_NOUN_TABLES.agc:522
//		OCT	0			# 96	SPARE
// slot 37168
    37168, 0,
// PINBALL_NOUN_TABLES.agc:523
//		OCT	00000			# 97	3COMP	WHOLE FOR EACH
// slot 37169
    37169, 0,
// PINBALL_NOUN_TABLES.agc:524
//		OCT 	00000			# 98	3COMP	WHOLE, FRAC, WHOLE
// slot 37170
    37170, 0,
// PINBALL_NOUN_TABLES.agc:525
//		OCT	71572			# 99	3COMP	POS9, VEL4, RADIANS
// slot 37171
    37171, 59124,
// PINBALL_NOUN_TABLES.agc:526
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:527
//
// PINBALL_NOUN_TABLES.agc:528
//# END OF NNTYPTAB FOR MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:529
//
// PINBALL_NOUN_TABLES.agc:530
//SFINTAB		OCT	00006			# WHOLE, DP TIME (SEC)
// slot 37172
    37172, 12,
// PINBALL_NOUN_TABLES.agc:531
//		OCT	03240
// slot 37173
    37173, 3392,
// PINBALL_NOUN_TABLES.agc:532
//		OCT	00000			# SPARE
// slot 37174
    37174, 0,
// PINBALL_NOUN_TABLES.agc:533
//		OCT	00000
// slot 37175
    37175, 0,
// PINBALL_NOUN_TABLES.agc:534
//		OCT	00000			# CDU DEGREES, 360-CDU DEGREES
// slot 37176
    37176, 0,
// PINBALL_NOUN_TABLES.agc:535
//		OCT	00000			#	(SFCONS IN DEGINSF)
// slot 37177
    37177, 0,
// PINBALL_NOUN_TABLES.agc:536
//		OCT	10707			# DP DEGREES (90)
// slot 37178
    37178, 9102,
// PINBALL_NOUN_TABLES.agc:537
//		OCT	03435			#	UPPED BY 1
// slot 37179
    37179, 3642,
// PINBALL_NOUN_TABLES.agc:538
//		OCT	13070			# DP DEGREES (360) (POINT BETWN BITS 11-12)
// slot 37180
    37180, 11376,
// PINBALL_NOUN_TABLES.agc:539
//		OCT	34345			#	UPPED BY 1
// slot 37181
    37181, 29130,
// PINBALL_NOUN_TABLES.agc:540
//		OCT	00005			# DEGREES (180)
// slot 37182
    37182, 10,
// PINBALL_NOUN_TABLES.agc:541
//		OCT	21616
// slot 37183
    37183, 18204,
// PINBALL_NOUN_TABLES.agc:542
//		OCT	26113			# WEIGHT2
// slot 37184
    37184, 22678,
// PINBALL_NOUN_TABLES.agc:543
//		OCT	31713
// slot 37185
    37185, 26518,
// PINBALL_NOUN_TABLES.agc:544
//		OCT	00070			# POSITION5
// slot 37186
    37186, 112,
// PINBALL_NOUN_TABLES.agc:545
//		OCT	20460
// slot 37187
    37187, 16992,
// PINBALL_NOUN_TABLES.agc:546
//# Page 312
// PINBALL_NOUN_TABLES.agc:547
//		OCT	01065			# POSITION4
// slot 37188
    37188, 1130,
// PINBALL_NOUN_TABLES.agc:548
//		OCT	05740
// slot 37189
    37189, 6080,
// PINBALL_NOUN_TABLES.agc:549
//		OCT	11414			# VELOCITY2 	(POINT BETWN BITS 11-12)
// slot 37190
    37190, 9752,
// PINBALL_NOUN_TABLES.agc:550
//		OCT	31463
// slot 37191
    37191, 26214,
// PINBALL_NOUN_TABLES.agc:551
//		OCT	07475			# VELOCITY3
// slot 37192
    37192, 7802,
// PINBALL_NOUN_TABLES.agc:552
//		OCT	16051
// slot 37193
    37193, 14418,
// PINBALL_NOUN_TABLES.agc:553
//		OCT	00001			# ELEVATION DEGREES
// slot 37194
    37194, 2,
// PINBALL_NOUN_TABLES.agc:554
//		OCT	03434
// slot 37195
    37195, 3640,
// PINBALL_NOUN_TABLES.agc:555
//		OCT	00047			# RENDEZVOUS RADAR RANGE
// slot 37196
    37196, 78,
// PINBALL_NOUN_TABLES.agc:556
//		OCT	21135
// slot 37197
    37197, 17594,
// PINBALL_NOUN_TABLES.agc:557
//		OCT	77766			# RENDESVOUS RADAR RANGE RATE
// slot 37198
    37198, 65516,
// PINBALL_NOUN_TABLES.agc:558
//		OCT	50711
// slot 37199
    37199, 41874,
// PINBALL_NOUN_TABLES.agc:559
//		2DEC*	.9267840599 E5 B-28*	# LANDING RADAR ALTITUDE
// slot 37200 37201
    37200, 10, 37201, 21516,
// PINBALL_NOUN_TABLES.agc:560
//
// PINBALL_NOUN_TABLES.agc:561
//		OCT	00002			# INITIAL/FINAL ALTITUDE
// slot 37202
    37202, 4,
// PINBALL_NOUN_TABLES.agc:562
//		OCT	23224
// slot 37203
    37203, 19752,
// PINBALL_NOUN_TABLES.agc:563
//		OCT	00014			# ALTITUDE RATE
// slot 37204
    37204, 24,
// PINBALL_NOUN_TABLES.agc:564
//		OCT	06500
// slot 37205
    37205, 6784,
// PINBALL_NOUN_TABLES.agc:565
//		OCT	00012			# FORWARD/LATERAL VELOCITY
// slot 37206
    37206, 20,
// PINBALL_NOUN_TABLES.agc:566
//		OCT	36455
// slot 37207
    37207, 31322,
// PINBALL_NOUN_TABLES.agc:567
//		OCT	04256			# ROT HAND CONT ANGLE RATE
// slot 37208
    37208, 4444,
// PINBALL_NOUN_TABLES.agc:568
//		OCT	07071
// slot 37209
    37209, 7282,
// PINBALL_NOUN_TABLES.agc:569
//		2DEC*	-1.552795030 E5 B-28*	# LANDING RADAR VELX
// slot 37210 37211
    37210, 65516, 37211, 49886,
// PINBALL_NOUN_TABLES.agc:570
//
// PINBALL_NOUN_TABLES.agc:571
//		2DEC*	.8250825087 E5 B-28*	# LANDING RADAR VELY
// slot 37212 37213
    37212, 10, 37213, 1176,
// PINBALL_NOUN_TABLES.agc:572
//
// PINBALL_NOUN_TABLES.agc:573
//		2DEC*	1.153668673 E5 B-28*	# LANDING RADAR VELZ
// slot 37214 37215
    37214, 14, 37215, 1358,
// PINBALL_NOUN_TABLES.agc:574
//
// PINBALL_NOUN_TABLES.agc:575
//		OCT	04324			# POSITION7
// slot 37216
    37216, 4520,
// PINBALL_NOUN_TABLES.agc:576
//		OCT	27600
// slot 37217
    37217, 24320,
// PINBALL_NOUN_TABLES.agc:577
//		OCT	00036			# TRIM DEGREES2
// slot 37218
    37218, 60,
// PINBALL_NOUN_TABLES.agc:578
//		OCT	20440
// slot 37219
    37219, 16960,
// PINBALL_NOUN_TABLES.agc:579
//		OCT	00035			# COMPUTED ALTITUDE
// slot 37220
    37220, 58,
// PINBALL_NOUN_TABLES.agc:580
//		OCT	30400
// slot 37221
    37221, 25088,
// PINBALL_NOUN_TABLES.agc:581
//		OCT	23420			# DP DEGREES
// slot 37222
    37222, 20000,
// PINBALL_NOUN_TABLES.agc:582
//		OCT	00000
// slot 37223
    37223, 0,
// PINBALL_NOUN_TABLES.agc:583
//		2DEC	30480 B-19		# POSITION 9
// slot 37224 37225
    37224, 1904, 37225, 16384,
// PINBALL_NOUN_TABLES.agc:584
//
// PINBALL_NOUN_TABLES.agc:585
//		2DEC	30.48 B-7		# VELOCITY4
// slot 37226 37227
    37226, 7802, 37227, 14418,
// PINBALL_NOUN_TABLES.agc:586
//
// PINBALL_NOUN_TABLES.agc:587
//		2DEC	100 B-8			# RADIANS
// slot 37228 37229
    37228, 12800, 37229, 0,
// PINBALL_NOUN_TABLES.agc:588
//
// PINBALL_NOUN_TABLES.agc:589
//						# END OF SFINTAB
// PINBALL_NOUN_TABLES.agc:590
//
// PINBALL_NOUN_TABLES.agc:591
//SFOUTAB		OCT	05174			# WHOLE, DP TIME (SEC)
// slot 37230
    37230, 5368
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:592
//		OCT	13261
// slot 37231
    37231, 11618,
// PINBALL_NOUN_TABLES.agc:593
//		OCT	00000			# SPARE
// slot 37232
    37232, 0,
// PINBALL_NOUN_TABLES.agc:594
//		OCT	00000
// slot 37233
    37233, 0,
// PINBALL_NOUN_TABLES.agc:595
//		OCT	00000			# CDU DEGREES, 360-CDU DEGREES
// slot 37234
    37234, 0,
// PINBALL_NOUN_TABLES.agc:596
//# Page 313
// PINBALL_NOUN_TABLES.agc:597
//		OCT	00000			#	(SFCONS IN DEGOUTSF, 360 CDUO)
// slot 37235
    37235, 0,
// PINBALL_NOUN_TABLES.agc:598
//		OCT	00714			# DP DEGREES (90) (POINT BETWN BITS 7-8)
// slot 37236
    37236, 920,
// PINBALL_NOUN_TABLES.agc:599
//		OCT	31463
// slot 37237
    37237, 26214,
// PINBALL_NOUN_TABLES.agc:600
//		OCT	13412			# DP DEGREES (360)
// slot 37238
    37238, 11796,
// PINBALL_NOUN_TABLES.agc:601
//		OCT	07534
// slot 37239
    37239, 7864,
// PINBALL_NOUN_TABLES.agc:602
//		OCT	05605			# DEGREES (180)
// slot 37240
    37240, 5898,
// PINBALL_NOUN_TABLES.agc:603
//		OCT	03656
// slot 37241
    37241, 3932,
// PINBALL_NOUN_TABLES.agc:604
//		OCT	00001			# WEIGHT2
// slot 37242
    37242, 2,
// PINBALL_NOUN_TABLES.agc:605
//		OCT	16170
// slot 37243
    37243, 14576,
// PINBALL_NOUN_TABLES.agc:606
//		OCT	00441			# POSITION5
// slot 37244
    37244, 578,
// PINBALL_NOUN_TABLES.agc:607
//		OCT	34306
// slot 37245
    37245, 29068,
// PINBALL_NOUN_TABLES.agc:608
//		OCT	07176			# POSITION4	(POINT BETWN BITS 7-8)
// slot 37246
    37246, 7420,
// PINBALL_NOUN_TABLES.agc:609
//		OCT	21603
// slot 37247
    37247, 18182,
// PINBALL_NOUN_TABLES.agc:610
//		OCT	15340			# VELOCITY2
// slot 37248
    37248, 13760,
// PINBALL_NOUN_TABLES.agc:611
//		OCT	15340
// slot 37249
    37249, 13760,
// PINBALL_NOUN_TABLES.agc:612
//		OCT	01031			# VELOCITY3	(POINT BETWN BITS 7-8)
// slot 37250
    37250, 1074,
// PINBALL_NOUN_TABLES.agc:613
//		OCT	21032
// slot 37251
    37251, 17460,
// PINBALL_NOUN_TABLES.agc:614
//		OCT	34631			# ELEVATION DETREES
// slot 37252
    37252, 29490,
// PINBALL_NOUN_TABLES.agc:615
//		OCT	23146
// slot 37253
    37253, 19660,
// PINBALL_NOUN_TABLES.agc:616
//		OCT	00636			# RENDEZVOUS RADAR RANGE
// slot 37254
    37254, 828,
// PINBALL_NOUN_TABLES.agc:617
//		OCT	14552
// slot 37255
    37255, 13012,
// PINBALL_NOUN_TABLES.agc:618
//		OCT	74552			# RENDEZVOUS RADAR RANGE RATE
// slot 37256
    37256, 62164,
// PINBALL_NOUN_TABLES.agc:619
//		OCT	70307
// slot 37257
    37257, 57742,
// PINBALL_NOUN_TABLES.agc:620
//		2DEC	1.079 E-5 B14		# LANDING RADAR ALTITUDE
// slot 37258 37259
    37258, 5792, 37259, 13716,
// PINBALL_NOUN_TABLES.agc:621
//
// PINBALL_NOUN_TABLES.agc:622
//		OCT	14226			# INITIAL/FINAL ALTITUDE
// slot 37260
    37260, 12588,
// PINBALL_NOUN_TABLES.agc:623
//		OCT	31757
// slot 37261
    37261, 26590,
// PINBALL_NOUN_TABLES.agc:624
//		OCT	02476			# ALTITUDE RATE
// slot 37262
    37262, 2684,
// PINBALL_NOUN_TABLES.agc:625
//		OCT	05531
// slot 37263
    37263, 5810,
// PINBALL_NOUN_TABLES.agc:626
//		OCT	02727			# FORWARD/LATERAL VELOCTY
// slot 37264
    37264, 2990,
// PINBALL_NOUN_TABLES.agc:627
//		OCT	16415
// slot 37265
    37265, 14874,
// PINBALL_NOUN_TABLES.agc:628
//		OCT	00007			# ROT HAND CONT ANGLE RATE
// slot 37266
    37266, 14,
// PINBALL_NOUN_TABLES.agc:629
//		OCT	13734
// slot 37267
    37267, 12216,
// PINBALL_NOUN_TABLES.agc:630
//		2DEC	-.6440 E-5 B14		# LANDING RADAR VELX
// slot 37268 37269
    37268, 62078, 37269, 41798,
// PINBALL_NOUN_TABLES.agc:631
//
// PINBALL_NOUN_TABLES.agc:632
//		2DEC	1.212 E-5 B14		# LANDING RADAR VELY
// slot 37270 37271
    37270, 6506, 37271, 14344,
// PINBALL_NOUN_TABLES.agc:633
//
// PINBALL_NOUN_TABLES.agc:634
//		2DEC	.8668 E-5 B14		# LANDING RADAR VELZ
// slot 37272 37273
    37272, 4652, 37273, 26166,
// PINBALL_NOUN_TABLES.agc:635
//
// PINBALL_NOUN_TABLES.agc:636
//		OCT	34772			# POSITION7
// slot 37274
    37274, 29684,
// PINBALL_NOUN_TABLES.agc:637
//		OCT	07016
// slot 37275
    37275, 7196,
// PINBALL_NOUN_TABLES.agc:638
//		OCT	01030			# TRIM DEGREES2
// slot 37276
    37276, 1072,
// PINBALL_NOUN_TABLES.agc:639
//		OCT	33675
// slot 37277
    37277, 28538,
// PINBALL_NOUN_TABLES.agc:640
//		OCT	01046			# COMPUTED ALTITUDE
// slot 37278
    37278, 1100,
// PINBALL_NOUN_TABLES.agc:641
//		OCT	15700
// slot 37279
    37279, 14208,
// PINBALL_NOUN_TABLES.agc:642
//		OCT	00321			# DP DEGREES
// slot 37280
    37280, 418,
// PINBALL_NOUN_TABLES.agc:643
//		OCT	26706
// slot 37281
    37281, 23436,
// PINBALL_NOUN_TABLES.agc:644
//		2DEC	17.2010499 B-7		# POSITION 9
// slot 37282 37283
    37282, 4402, 37283, 24064,
// PINBALL_NOUN_TABLES.agc:645
//
// PINBALL_NOUN_TABLES.agc:646
//		2DEC	.032808399		# VELOCITY4
// slot 37284 37285
    37284, 1074, 37285, 17460,
// PINBALL_NOUN_TABLES.agc:647
//# Page 314
// PINBALL_NOUN_TABLES.agc:648
//		2DEC	.32			# RADIANS
// slot 37286 37287
    37286, 10484, 37287, 28836,
// PINBALL_NOUN_TABLES.agc:649
//
// PINBALL_NOUN_TABLES.agc:650
//						# END OF SFOUTAB
// PINBALL_NOUN_TABLES.agc:651
//
// PINBALL_NOUN_TABLES.agc:652
//						# NN 	SF CONSTANT		SF ROUTINE
// PINBALL_NOUN_TABLES.agc:653
//IDADDTAB	ECADR	TTOGO			# 40	MIN/SEC			M/S
// slot 37288
    37288, 3670,
// PINBALL_NOUN_TABLES.agc:654
//		ECADR	VGDISP			# 40	VEL3			DP3
// slot 37289
    37289, 3942,
// PINBALL_NOUN_TABLES.agc:655
//		ECADR	DVTOTAL			# 40	VEL3			DP3
// slot 37290
    37290, 3726,
// PINBALL_NOUN_TABLES.agc:656
//		ECADR	DSPTEM1			# 41	CDU DEG			CDU
// slot 37291
    37291, 1098,
// PINBALL_NOUN_TABLES.agc:657
//		ECADR	DSPTEM1 +1		# 41	ELEV DEG		ARTH
// slot 37292
    37292, 1100,
// PINBALL_NOUN_TABLES.agc:658
//		OCT	0			# 41	SPARE COMPONENT
// slot 37293
    37293, 0,
// PINBALL_NOUN_TABLES.agc:659
//		ECADR	HAPO			# 42	POS4			DP3
// slot 37294
    37294, 2460,
// PINBALL_NOUN_TABLES.agc:660
//		ECADR	HPER			# 42	POS4			DP3
// slot 37295
    37295, 2464,
// PINBALL_NOUN_TABLES.agc:661
//		ECADR	VGDISP			# 42 	VEL3			DP3
// slot 37296
    37296, 3942,
// PINBALL_NOUN_TABLES.agc:662
//		ECADR	LAT			# 43	DPDEG(360)		DP4
// slot 37297
    37297, 1184,
// PINBALL_NOUN_TABLES.agc:663
//		ECADR	LONG			# 43	DPDEG(360		DP4
// slot 37298
    37298, 1188,
// PINBALL_NOUN_TABLES.agc:664
//		ECADR	ALT			# 43	POS4			DP3
// slot 37299
    37299, 1192,
// PINBALL_NOUN_TABLES.agc:665
//		ECADR	HAPOX			# 44	POS4			DP3
// slot 37300
    37300, 2206,
// PINBALL_NOUN_TABLES.agc:666
//		ECADR	HPERX			# 44	POS4			DP3
// slot 37301
    37301, 2210,
// PINBALL_NOUN_TABLES.agc:667
//		ECADR	TFF			# 44	MIN/SEC			M/S
// slot 37302
    37302, 2240,
// PINBALL_NOUN_TABLES.agc:668
//		ECADR	TRKMKCNT		# 45	WHOLE			ARTH
// slot 37303
    37303, 3684,
// PINBALL_NOUN_TABLES.agc:669
//		ECADR	TTOGO			# 45	MIN/SEC			M/S
// slot 37304
    37304, 3670,
// PINBALL_NOUN_TABLES.agc:670
//		ECADR	+MGA			# 45	DPDEG(360)		DP4
// slot 37305
    37305, 2388,
// PINBALL_NOUN_TABLES.agc:671
//		ECADR	DAPDATR1		# 46	OCTAL ONLY		OCT
// slot 37306
    37306, 1478,
// PINBALL_NOUN_TABLES.agc:672
//		OCT	0			# 46	SPARE COMPONENT
// slot 37307
    37307, 0,
// PINBALL_NOUN_TABLES.agc:673
//		OCT	0			# 46	SPARE COMPONENT
// slot 37308
    37308, 0,
// PINBALL_NOUN_TABLES.agc:674
//		ECADR	LEMMASS			# 47	WEIGHT2			ARTH1
// slot 37309
    37309, 1458,
// PINBALL_NOUN_TABLES.agc:675
//		ECADR	CSMMASS			# 47	WEIGHT2			ARTH1
// slot 37310
    37310, 1460,
// PINBALL_NOUN_TABLES.agc:676
//		OCT	0			# 47	SPARE COMPONENT
// slot 37311
    37311, 0,
// PINBALL_NOUN_TABLES.agc:677
//		ECADR	PITTIME			# 48	TRIM DEG2		ARTH
// slot 37312
    37312, 3076,
// PINBALL_NOUN_TABLES.agc:678
//		ECADR	ROLLTIME		# 48	TRIM DEG2		ARTH
// slot 37313
    37313, 3074,
// PINBALL_NOUN_TABLES.agc:679
//		OCT	0			# 48	SPARE COMPONENT
// slot 37314
    37314, 0,
// PINBALL_NOUN_TABLES.agc:680
//		ECADR	R22DISP			# 49	POS4			DP3
// slot 37315
    37315, 408,
// PINBALL_NOUN_TABLES.agc:681
//		ECADR	R22DISP +2		# 49	VEL3			DP3
// slot 37316
    37316, 412,
// PINBALL_NOUN_TABLES.agc:682
//		ECADR	WHCHREAD		# 49	WHOLE			ARTH
// slot 37317
    37317, 4042,
// PINBALL_NOUN_TABLES.agc:683
//		OCT	0			# 50	SPARE
// slot 37318
    37318, 0,
// PINBALL_NOUN_TABLES.agc:684
//		OCT	0			# 50 	SPARE
// slot 37319
    37319, 0,
// PINBALL_NOUN_TABLES.agc:685
//		OCT	0			# 50	SPARE
// slot 37320
    37320, 0,
// PINBALL_NOUN_TABLES.agc:686
//		ECADR	ALPHASB			# 51	DPDEG(360)		DP4
// slot 37321
    37321, 2304,
// PINBALL_NOUN_TABLES.agc:687
//		ECADR	BETASB			# 51	DPDEG(360)		DP4
// slot 37322
    37322, 2308,
// PINBALL_NOUN_TABLES.agc:688
//		OCT	0			# 51	SPARE COMPONENT
// slot 37323
    37323, 0,
// PINBALL_NOUN_TABLES.agc:689
//		ECADR	ACTCENT			# 52	DPDEG(360)		DP4
// slot 37324
    37324, 2010,
// PINBALL_NOUN_TABLES.agc:690
//		OCT	00000			# 52	SPARE COMPONENT
// slot 37325
    37325, 0,
// PINBALL_NOUN_TABLES.agc:691
//		OCT	00000			# 52 	SPARE COMPONENT
// slot 37326
    37326, 0,
// PINBALL_NOUN_TABLES.agc:692
//		OCT	00000			# 53	SPARE
// slot 37327
    37327, 0,
// PINBALL_NOUN_TABLES.agc:693
//		OCT	00000			# 53
// slot 37328
    37328, 0,
// PINBALL_NOUN_TABLES.agc:694
//		OCT	00000			# 53
// slot 37329
    37329, 0,
// PINBALL_NOUN_TABLES.agc:695
//		ECADR	RANGE			# 54	POS5			DP1
// slot 37330
    37330, 2304,
// PINBALL_NOUN_TABLES.agc:696
//# Page 315
// PINBALL_NOUN_TABLES.agc:697
//		ECADR	RRATE			# 54	VEL3			DP3
// slot 37331
    37331, 2308,
// PINBALL_NOUN_TABLES.agc:698
//		ECADR	RTHETA			# 54	DPDEG(360)		DP4
// slot 37332
    37332, 2312,
// PINBALL_NOUN_TABLES.agc:699
//		ECADR	NN			# 55	WHOLE			ARTH
// slot 37333
    37333, 3692,
// PINBALL_NOUN_TABLES.agc:700
//		ECADR	ELEV			# 55	DPDEG(360)		DP4
// slot 37334
    37334, 2396,
// PINBALL_NOUN_TABLES.agc:701
//		ECADR	CENTANG			# 55	DPDEG(360)		DP4
// slot 37335
    37335, 3872,
// PINBALL_NOUN_TABLES.agc:702
//		ECADR	RR-AZ			# 56	DPDEG(360)		DP4
// slot 37336
    37336, 2304,
// PINBALL_NOUN_TABLES.agc:703
//		ECADR	RR-ELEV			# 56	DPDEG(360)		DP4
// slot 37337
    37337, 2308,
// PINBALL_NOUN_TABLES.agc:704
//		OCT	0			# 56	SPARE COMPONENT
// slot 37338
    37338, 0,
// PINBALL_NOUN_TABLES.agc:705
//		ECADR	DELTAR			# 57	POS4			DP3
// slot 37339
    37339, 2436,
// PINBALL_NOUN_TABLES.agc:706
//		OCT	0			# 57	SPARE COMPONENT
// slot 37340
    37340, 0,
// PINBALL_NOUN_TABLES.agc:707
//		OCT	0			# 57	SPARE COMPONENT
// slot 37341
    37341, 0,
// PINBALL_NOUN_TABLES.agc:708
//		ECADR	POSTTPI			# 58	POS4			DP3
// slot 37342
    37342, 3850,
// PINBALL_NOUN_TABLES.agc:709
//		ECADR	DELVTPI			# 58	VEL3			DP3
// slot 37343
    37343, 3834,
// PINBALL_NOUN_TABLES.agc:710
//		ECADR	DELVTPF			# 58	VEL3			DP3
// slot 37344
    37344, 2510,
// PINBALL_NOUN_TABLES.agc:711
//		ECADR	DVLOS			# 59	VEL3			DP3
// slot 37345
    37345, 2436,
// PINBALL_NOUN_TABLES.agc:712
//		ECADR	DVLOS +2		# 59	VEL3			DP3
// slot 37346
    37346, 2440,
// PINBALL_NOUN_TABLES.agc:713
//		ECADR	DVLOS +4		# 59	VEL3			DP3
// slot 37347
    37347, 2444,
// PINBALL_NOUN_TABLES.agc:714
//		ECADR	VHORIZ			# 60	VEL3			DP3
// slot 37348
    37348, 2404,
// PINBALL_NOUN_TABLES.agc:715
//		ECADR	HDOTDISP		# 60	VEL3			DP3
// slot 37349
    37349, 3702,
// PINBALL_NOUN_TABLES.agc:716
//		ECADR	HCALC			# 60	COMP ALT		DP1
// slot 37350
    37350, 3768,
// PINBALL_NOUN_TABLES.agc:717
//		ECADR	TTFDISP			# 61	MIN/SEC			M/S
// slot 37351
    37351, 3706,
// PINBALL_NOUN_TABLES.agc:718
//		ECADR	TTOGO			# 61	MIN/SEC			M/S
// slot 37352
    37352, 3670,
// PINBALL_NOUN_TABLES.agc:719
//		ECADR	OUTOFPLN		# 61	POS7			DP4
// slot 37353
    37353, 2860
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:720
//		ECADR	ABVEL			# 62	VEL3			DP3
// slot 37354
    37354, 3698,
// PINBALL_NOUN_TABLES.agc:721
//		ECADR	TTOGO			# 62	MIN/SEC			M/S
// slot 37355
    37355, 3670,
// PINBALL_NOUN_TABLES.agc:722
//		ECADR	DVTOTAL			# 62	VEL3			DP3
// slot 37356
    37356, 3726,
// PINBALL_NOUN_TABLES.agc:723
//		ECADR	ABVEL			# 63	VEL3			DP3
// slot 37357
    37357, 3698,
// PINBALL_NOUN_TABLES.agc:724
//		ECADR	HDOTDISP		# 63	VEL3			DP3
// slot 37358
    37358, 3702,
// PINBALL_NOUN_TABLES.agc:725
//		ECADR	HCALC1			# 63	COMP ALT		DP1
// slot 37359
    37359, 4088,
// PINBALL_NOUN_TABLES.agc:726
//		ECADR	FUNNYDSP		# 64 	2INT			2INT
// slot 37360
    37360, 3948,
// PINBALL_NOUN_TABLES.agc:727
//		ECADR	HDOTDISP		# 64	VEL3			DP3
// slot 37361
    37361, 3702,
// PINBALL_NOUN_TABLES.agc:728
//		ECADR	HCALC			# 64	COMP ALT		DP1
// slot 37362
    37362, 3768,
// PINBALL_NOUN_TABLES.agc:729
//		ECADR	SAMPTIME		# 65	HMS (MIXED ONLY TO KEEP CODE 65) HMS
// slot 37363
    37363, 22,
// PINBALL_NOUN_TABLES.agc:730
//		ECADR	SAMPTIME		# 65	HMS			HMS
// slot 37364
    37364, 22,
// PINBALL_NOUN_TABLES.agc:731
//		ECADR	SAMPTIME		# 65	HMS			HMS
// slot 37365
    37365, 22,
// PINBALL_NOUN_TABLES.agc:732
//		ECADR	RSTACK +6		# 66	LANDING RADAR ALT	DP1
// slot 37366
    37366, 2316,
// PINBALL_NOUN_TABLES.agc:733
//		OCT	0			# 66	LR POSITION		LRPOS
// slot 37367
    37367, 0,
// PINBALL_NOUN_TABLES.agc:734
//		OCT	0			# 66	SPARE COMPONENT
// slot 37368
    37368, 0,
// PINBALL_NOUN_TABLES.agc:735
//		ECADR	RSTACK			# 67	LANDING RADAR VELX	DP1
// slot 37369
    37369, 2304,
// PINBALL_NOUN_TABLES.agc:736
//		ECADR	RSTACK +2		# 67	LANDING RADAR VELY	DP1
// slot 37370
    37370, 2308,
// PINBALL_NOUN_TABLES.agc:737
//		ECADR	RSTACK +4		# 67	LANDING RADAR VELZ	DP1
// slot 37371
    37371, 2312,
// PINBALL_NOUN_TABLES.agc:738
//		ECADR	RANGEDSP		# 68	POS7			DP4
// slot 37372
    37372, 2856,
// PINBALL_NOUN_TABLES.agc:739
//		ECADR	TTFDISP			# 68	MIN/SEC			M/S
// slot 37373
    37373, 3706,
// PINBALL_NOUN_TABLES.agc:740
//		ECADR	DELTAH			# 68	COMP ALT		DP1
// slot 37374
    37374, 3944,
// PINBALL_NOUN_TABLES.agc:741
//		OCT	00000			# 69	SPARE
// slot 37375
    37375, 0,
// PINBALL_NOUN_TABLES.agc:742
//		OCT	00000			# 69
// slot 37376
    37376, 0,
// PINBALL_NOUN_TABLES.agc:743
//		OCT	00000			# 69
// slot 37377
    37377, 0,
// PINBALL_NOUN_TABLES.agc:744
//		ECADR	AOTCODE			# 70	OCTAL ONLY		OCT
// slot 37378
    37378, 954,
// PINBALL_NOUN_TABLES.agc:745
//		ECADR	AOTCODE +1		# 70 	OCTAL ONLY		OCT
// slot 37379
    37379, 956,
// PINBALL_NOUN_TABLES.agc:746
//		ECADR	AOTCODE +2		# 70	OCTAL ONLY		OCT
// slot 37380
    37380, 958,
// PINBALL_NOUN_TABLES.agc:747
//# Page 316
// PINBALL_NOUN_TABLES.agc:748
//		ECADR	AOTCODE			# 71	OCTAL ONLY		OCT
// slot 37381
    37381, 954,
// PINBALL_NOUN_TABLES.agc:749
//		ECADR	AOTCODE +1		# 71	OCTAL ONLY		OCT
// slot 37382
    37382, 956,
// PINBALL_NOUN_TABLES.agc:750
//		ECADR	AOTCODE +2		# 71 	OCTAL ONLY		OCT
// slot 37383
    37383, 958,
// PINBALL_NOUN_TABLES.agc:751
//		ECADR	CDUT			# 72	360-CDU DEG		360-CDU
// slot 37384
    37384, 58,
// PINBALL_NOUN_TABLES.agc:752
//		ECADR	CDUS			# 72	CDU DEG			CDU
// slot 37385
    37385, 60,
// PINBALL_NOUN_TABLES.agc:753
//		OCT	0			# 72	SPARE COMPONENT
// slot 37386
    37386, 0,
// PINBALL_NOUN_TABLES.agc:754
//		ECADR	TANG			# 73	360-CDU DEG		360-CDU
// slot 37387
    37387, 1166,
// PINBALL_NOUN_TABLES.agc:755
//		ECADR	TANG +1			# 73	CDU DEG			CDU
// slot 37388
    37388, 1168,
// PINBALL_NOUN_TABLES.agc:756
//		OCT	0			# 73	SPARE COMPONENT
// slot 37389
    37389, 0,
// PINBALL_NOUN_TABLES.agc:757
//		ECADR	TTOGO			# 74	MIN/SEC			M/S
// slot 37390
    37390, 3670,
// PINBALL_NOUN_TABLES.agc:758
//		ECADR	YAW			# 74	DPDEG(360)		DP4
// slot 37391
    37391, 2532,
// PINBALL_NOUN_TABLES.agc:759
//		ECADR	PITCH			# 74	DPDEG(360)		DP4
// slot 37392
    37392, 2536,
// PINBALL_NOUN_TABLES.agc:760
//		ECADR	DIFFALT			# 75	POS4			DP3
// slot 37393
    37393, 3838,
// PINBALL_NOUN_TABLES.agc:761
//		ECADR	T1TOT2			# 75	MIN/SEC
// slot 37394
    37394, 2388,
// PINBALL_NOUN_TABLES.agc:762
//		ECADR	T2TOT3			# 75	MIN/SEC			M/S
// slot 37395
    37395, 2392,
// PINBALL_NOUN_TABLES.agc:763
//		ECADR	ZDOTD			# 76	VEL3			DP3
// slot 37396
    37396, 2428,
// PINBALL_NOUN_TABLES.agc:764
//		ECADR	RDOTD			# 76	VEL3			DP3
// slot 37397
    37397, 2420,
// PINBALL_NOUN_TABLES.agc:765
//		ECADR	XRANGE			# 76	POS4			DP3
// slot 37398
    37398, 3908,
// PINBALL_NOUN_TABLES.agc:766
//		ECADR	TTOGO			# 77	MIN/SEC			M/S
// slot 37399
    37399, 3670,
// PINBALL_NOUN_TABLES.agc:767
//		ECADR	YDOT			# 77 	VEL3			DP3
// slot 37400
    37400, 2448,
// PINBALL_NOUN_TABLES.agc:768
//		OCT	0			# 77	SPARE COMPONENT
// slot 37401
    37401, 0,
// PINBALL_NOUN_TABLES.agc:769
//		ECADR	RSTACK			# 78 	RR RANGE		DP1
// slot 37402
    37402, 2304,
// PINBALL_NOUN_TABLES.agc:770
//		ECADR	RSTACK +2		# 78	RR RANGE RATE		DP1
// slot 37403
    37403, 2308,
// PINBALL_NOUN_TABLES.agc:771
//		OCT	00000			# 78	SPARE COMPONENT
// slot 37404
    37404, 0,
// PINBALL_NOUN_TABLES.agc:772
//		ECADR	CURSOR			# 79	CDU DEG			CDU
// slot 37405
    37405, 1340,
// PINBALL_NOUN_TABLES.agc:773
//		ECADR	SPIRAL			# 79	CDU DEG			CDU
// slot 37406
    37406, 1344,
// PINBALL_NOUN_TABLES.agc:774
//		ECADR	POSCODE			# 79	WHOLE			ARTH
// slot 37407
    37407, 1348,
// PINBALL_NOUN_TABLES.agc:775
//		ECADR	DATAGOOD		# 80	WHOLE			ARTH
// slot 37408
    37408, 4022,
// PINBALL_NOUN_TABLES.agc:776
//		ECADR	OMEGAD			# 80	DPDEG(360)		DP4
// slot 37409
    37409, 4024,
// PINBALL_NOUN_TABLES.agc:777
//		OCT	0			# 80	SPARE COMPONENT
// slot 37410
    37410, 0,
// PINBALL_NOUN_TABLES.agc:778
//		ECADR	DELVLVC			# 81	VEL3			DP3
// slot 37411
    37411, 3638,
// PINBALL_NOUN_TABLES.agc:779
//		ECADR	DELVLVC +2		# 81	VEL3			DP3
// slot 37412
    37412, 3642,
// PINBALL_NOUN_TABLES.agc:780
//		ECADR	DELVLVC +4		# 81	VEL3			DP3
// slot 37413
    37413, 3646,
// PINBALL_NOUN_TABLES.agc:781
//		ECADR	DELVLVC			# 82	VEL3			DP3
// slot 37414
    37414, 3638,
// PINBALL_NOUN_TABLES.agc:782
//		ECADR	DELVLVC +2		# 82	VEL3			DP3
// slot 37415
    37415, 3642,
// PINBALL_NOUN_TABLES.agc:783
//		ECADR	DELVLVC +4		# 82	VEL3			DP3
// slot 37416
    37416, 3646,
// PINBALL_NOUN_TABLES.agc:784
//		ECADR	DELVIMU			# 83	VEL3			DP3
// slot 37417
    37417, 3876,
// PINBALL_NOUN_TABLES.agc:785
//		ECADR	DELVIMU +2		# 83	VEL3			DP3
// slot 37418
    37418, 3880,
// PINBALL_NOUN_TABLES.agc:786
//		ECADR	DELVIMU +4		# 83	VEL3			DP3
// slot 37419
    37419, 3884,
// PINBALL_NOUN_TABLES.agc:787
//		ECADR	DELVOV			# 84	VEL3			DP3
// slot 37420
    37420, 2340,
// PINBALL_NOUN_TABLES.agc:788
//		ECADR	DELVOV +2		# 84	VEL3			DP3
// slot 37421
    37421, 2344,
// PINBALL_NOUN_TABLES.agc:789
//		ECADR	DELVOV +4		# 84	VEL3			DP3
// slot 37422
    37422, 2348,
// PINBALL_NOUN_TABLES.agc:790
//		ECADR	VGBODY			# 85	VEL3			DP3
// slot 37423
    37423, 3714,
// PINBALL_NOUN_TABLES.agc:791
//		ECADR	VGBODY +2		# 85	VEL3			DP3
// slot 37424
    37424, 3718,
// PINBALL_NOUN_TABLES.agc:792
//		ECADR	VGBODY +4		# 85	VEL3			DP3
// slot 37425
    37425, 3722,
// PINBALL_NOUN_TABLES.agc:793
//		ECADR	DELVLVC			# 86	VEL3			DP3
// slot 37426
    37426, 3638,
// PINBALL_NOUN_TABLES.agc:794
//		ECADR	DELVLVC +2		# 86	VEL3			DP3
// slot 37427
    37427, 3642,
// PINBALL_NOUN_TABLES.agc:795
//		ECADR	DELVLVC +4		# 86	VEL3			DP3
// slot 37428
    37428, 3646,
// PINBALL_NOUN_TABLES.agc:796
//		ECADR	AZ			# 87	CDU DEG			CDU
// slot 37429
    37429, 1486,
// PINBALL_NOUN_TABLES.agc:797
//		ECADR	EL			# 87	CDU DEG			CDU
// slot 37430
    37430, 1488,
// PINBALL_NOUN_TABLES.agc:798
//# Page 317
// PINBALL_NOUN_TABLES.agc:799
//		OCT	0			# 87	SPARE COMPONENT
// slot 37431
    37431, 0,
// PINBALL_NOUN_TABLES.agc:800
//		ECADR	STARAD			# 88	FRAC			FRAC
// slot 37432
    37432, 2956,
// PINBALL_NOUN_TABLES.agc:801
//		ECADR	STARAD +2		# 88	FRAC			FRAC
// slot 37433
    37433, 2960,
// PINBALL_NOUN_TABLES.agc:802
//		ECADR	STARAD +4		# 88	FRAC			FRAC
// slot 37434
    37434, 2964,
// PINBALL_NOUN_TABLES.agc:803
//		ECADR	LANDLAT			# 89	DPDEG(90)		DP3
// slot 37435
    37435, 2956,
// PINBALL_NOUN_TABLES.agc:804
//		ECADR	LANDLONG		# 89	DPDEG(90)		DP3
// slot 37436
    37436, 2960,
// PINBALL_NOUN_TABLES.agc:805
//		ECADR	LANDALT			# 89	POS5			DP1
// slot 37437
    37437, 2964,
// PINBALL_NOUN_TABLES.agc:806
//		ECADR	RANGE			# 90	POS5			DP1
// slot 37438
    37438, 2304,
// PINBALL_NOUN_TABLES.agc:807
//		ECADR	RRATE			# 90	VEL3			DP3
// slot 37439
    37439, 2308,
// PINBALL_NOUN_TABLES.agc:808
//		ECADR	RTHETA			# 90	DPDEG(360)		DP4
// slot 37440
    37440, 2312,
// PINBALL_NOUN_TABLES.agc:809
//		ECADR	P21ALT			# 91	POS4			DP3
// slot 37441
    37441, 3994,
// PINBALL_NOUN_TABLES.agc:810
//		ECADR	P21VEL			# 91 	VEL2			DP4
// slot 37442
    37442, 3986,
// PINBALL_NOUN_TABLES.agc:811
//		ECADR	P21GAM			# 91	DPDEG(360)		DP4
// slot 37443
    37443, 3990,
// PINBALL_NOUN_TABLES.agc:812
//		OCT	00000			# 92	SPARE
// slot 37444
    37444, 0,
// PINBALL_NOUN_TABLES.agc:813
//		OCT	00000			# 92
// slot 37445
    37445, 0,
// PINBALL_NOUN_TABLES.agc:814
//		OCT	00000			# 92
// slot 37446
    37446, 0,
// PINBALL_NOUN_TABLES.agc:815
//		ECADR	OGC			# 93	DPDEG(90)		DP3
// slot 37447
    37447, 3006,
// PINBALL_NOUN_TABLES.agc:816
//		ECADR	OGC +2			# 93	DPDEG(90)		DP3
// slot 37448
    37448, 3010,
// PINBALL_NOUN_TABLES.agc:817
//		ECADR	OGC +4			# 93	DPDEG(90)		DP3
// slot 37449
    37449, 3014,
// PINBALL_NOUN_TABLES.agc:818
//		OCT	00000			# 94	SPARE
// slot 37450
    37450, 0,
// PINBALL_NOUN_TABLES.agc:819
//		OCT	00000			# 94
// slot 37451
    37451, 0,
// PINBALL_NOUN_TABLES.agc:820
//		OCT	00000			# 94
// slot 37452
    37452, 0,
// PINBALL_NOUN_TABLES.agc:821
//		OCT	0			# 95	SPARE
// slot 37453
    37453, 0,
// PINBALL_NOUN_TABLES.agc:822
//		OCT	0			# 95	SPARE
// slot 37454
    37454, 0,
// PINBALL_NOUN_TABLES.agc:823
//		OCT	0			# 95	SPARE
// slot 37455
    37455, 0,
// PINBALL_NOUN_TABLES.agc:824
//		OCT	0			# 96	SPARE
// slot 37456
    37456, 0,
// PINBALL_NOUN_TABLES.agc:825
//		OCT	0			# 96	SPARE
// slot 37457
    37457, 0,
// PINBALL_NOUN_TABLES.agc:826
//		OCT	0			# 96	SPARE
// slot 37458
    37458, 0,
// PINBALL_NOUN_TABLES.agc:827
//		ECADR	DSPTEM1			# 97	WHOLE			ARTH
// slot 37459
    37459, 1098,
// PINBALL_NOUN_TABLES.agc:828
//		ECADR	DSPTEM1 +1		# 97	WHOLE			ARTH
// slot 37460
    37460, 1100,
// PINBALL_NOUN_TABLES.agc:829
//		ECADR	DSPTEM1 +2		# 97	WHOLE			ARTH
// slot 37461
    37461, 1102,
// PINBALL_NOUN_TABLES.agc:830
//		ECADR	DSPTEM2			# 98	WHOLE			ARTH
// slot 37462
    37462, 1104,
// PINBALL_NOUN_TABLES.agc:831
//		ECADR	DSPTEM2 +1		# 98	FRAC			FRAC
// slot 37463
    37463, 1106,
// PINBALL_NOUN_TABLES.agc:832
//		ECADR	DSPTEM2 +2		# 98	WHOLE			ARTH
// slot 37464
    37464, 1108,
// PINBALL_NOUN_TABLES.agc:833
//		ECADR	WWPOS			# 99 	POS9			DP3
// slot 37465
    37465, 2304,
// PINBALL_NOUN_TABLES.agc:834
//		ECADR	WWVEL			# 99	VEL4			DP2
// slot 37466
    37466, 2308,
// PINBALL_NOUN_TABLES.agc:835
//		ECADR	WWBIAS			# 99 	RADIANS			DP4
// slot 37467
    37467, 2312,
// PINBALL_NOUN_TABLES.agc:836
//
// PINBALL_NOUN_TABLES.agc:837
//# END OF IDADDTAB
// PINBALL_NOUN_TABLES.agc:838
//
// PINBALL_NOUN_TABLES.agc:839
//						# NN	SF ROUTINES
// PINBALL_NOUN_TABLES.agc:840
//RUTMXTAB	OCT	16351			# 40	M/S, DP3, DP3
// slot 37468
    37468, 14802,
// PINBALL_NOUN_TABLES.agc:841
//		OCT	00142			# 41	CDU, ARTH
// slot 37469
    37469, 196,
// PINBALL_NOUN_TABLES.agc:842
//		OCT	16347			# 42	DP3, DP3, DP3
// slot 37470
    37470, 14798,
// PINBALL_NOUN_TABLES.agc:843
//		OCT	16512			# 43	DP4, DP4, DP3
// slot 37471
    37471, 14996,
// PINBALL_NOUN_TABLES.agc:844
//		OCT	22347			# 44	DP3, DP3, M/S
// slot 37472
    37472, 18894,
// PINBALL_NOUN_TABLES.agc:845
//		OCT	24443			# 45	ARTH, M/S, DP4
// slot 37473
    37473, 21062,
// PINBALL_NOUN_TABLES.agc:846
//		OCT	00000			# 46	OCT
// slot 37474
    37474, 0,
// PINBALL_NOUN_TABLES.agc:847
//		OCT	00553			# 47	ARITH1, ARITH1
// slot 37475
    37475, 726
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:848
//# Page 318
// PINBALL_NOUN_TABLES.agc:849
//		OCT	00143			# 48	ARTH, ARTH
// slot 37476
    37476, 198,
// PINBALL_NOUN_TABLES.agc:850
//		OCT	06347			# 49	DP3, DP3, ARTH
// slot 37477
    37477, 6606,
// PINBALL_NOUN_TABLES.agc:851
//		OCT	0			# 50	SPARE
// slot 37478
    37478, 0,
// PINBALL_NOUN_TABLES.agc:852
//		OCT	00512			# 51	DP4, DP4
// slot 37479
    37479, 660,
// PINBALL_NOUN_TABLES.agc:853
//		OCT	00012			# 52	DP4
// slot 37480
    37480, 20,
// PINBALL_NOUN_TABLES.agc:854
//		OCT	00000			# 53 	SPARE
// slot 37481
    37481, 0,
// PINBALL_NOUN_TABLES.agc:855
//		OCT	24344			# 54	DP1, DP3, DP4
// slot 37482
    37482, 20936,
// PINBALL_NOUN_TABLES.agc:856
//		OCT	24503			# 55	ARTH, DP4, DP4
// slot 37483
    37483, 21126,
// PINBALL_NOUN_TABLES.agc:857
//		OCT	00512			# 56	DP4, DP4
// slot 37484
    37484, 660,
// PINBALL_NOUN_TABLES.agc:858
//		OCT	00007			# 57	DP3
// slot 37485
    37485, 14,
// PINBALL_NOUN_TABLES.agc:859
//		OCT	16347			# 58	DP3, DP3, DP3
// slot 37486
    37486, 14798,
// PINBALL_NOUN_TABLES.agc:860
//		OCT	16347			# 59	DP3, DP3, DP3
// slot 37487
    37487, 14798,
// PINBALL_NOUN_TABLES.agc:861
//		OCT	10347			# 60	DP3, DP3, DP1
// slot 37488
    37488, 8654,
// PINBALL_NOUN_TABLES.agc:862
//		OCT	24451			# 61	M/S, M/S, DP4
// slot 37489
    37489, 21074,
// PINBALL_NOUN_TABLES.agc:863
//		OCT	16447			# 62	DP3, M/S, DP3
// slot 37490
    37490, 14926,
// PINBALL_NOUN_TABLES.agc:864
//		OCT	10347			# 63	DP3, DP3, DP1
// slot 37491
    37491, 8654,
// PINBALL_NOUN_TABLES.agc:865
//		OCT	10354			# 64	2INT, DP3, DP1
// slot 37492
    37492, 8664,
// PINBALL_NOUN_TABLES.agc:866
//		OCT	20410			# 65	HMS, HMS, HMS
// slot 37493
    37493, 16912,
// PINBALL_NOUN_TABLES.agc:867
//		OCT	00304			# 66	DP1, LRPOS
// slot 37494
    37494, 392,
// PINBALL_NOUN_TABLES.agc:868
//		OCT	10204			# 67	DP1, DP1, DP1
// slot 37495
    37495, 8456,
// PINBALL_NOUN_TABLES.agc:869
//		OCT	10452			# 68	DP4, M/S, DP1
// slot 37496
    37496, 8788,
// PINBALL_NOUN_TABLES.agc:870
//		OCT	00000			# 69	SPARE
// slot 37497
    37497, 0,
// PINBALL_NOUN_TABLES.agc:871
//		OCT	0			# 70	OCT, OCT, OCT
// slot 37498
    37498, 0,
// PINBALL_NOUN_TABLES.agc:872
//		OCT	0			# 71	OCT, OCT, OCT
// slot 37499
    37499, 0,
// PINBALL_NOUN_TABLES.agc:873
//		OCT	00115			# 72	360-CDU, CDU
// slot 37500
    37500, 154,
// PINBALL_NOUN_TABLES.agc:874
//		OCT	00115			# 73	360-CDU, CDU
// slot 37501
    37501, 154,
// PINBALL_NOUN_TABLES.agc:875
//		OCT	24511			# 74	M/S, DP4, DP4
// slot 37502
    37502, 21138,
// PINBALL_NOUN_TABLES.agc:876
//		OCT	22447			# 75	DP3, M/S, M/S
// slot 37503
    37503, 19022,
// PINBALL_NOUN_TABLES.agc:877
//		OCT	16347			# 76	DP3, DP3, DP3
// slot 37504
    37504, 14798,
// PINBALL_NOUN_TABLES.agc:878
//		OCT	00351			# 77	M/S, DP3
// slot 37505
    37505, 466,
// PINBALL_NOUN_TABLES.agc:879
//		OCT	00204			# 78	DP1, DP1
// slot 37506
    37506, 264,
// PINBALL_NOUN_TABLES.agc:880
//		OCT	06102			# 79	CDU, CDU, ARTH
// slot 37507
    37507, 6276,
// PINBALL_NOUN_TABLES.agc:881
//		OCT	00503			# 80	ARTH, DP4
// slot 37508
    37508, 646,
// PINBALL_NOUN_TABLES.agc:882
//		OCT	16347			# 81	DP3, DP3, DP3
// slot 37509
    37509, 14798,
// PINBALL_NOUN_TABLES.agc:883
//		OCT	16347			# 82	DP3, DP3, DP3
// slot 37510
    37510, 14798,
// PINBALL_NOUN_TABLES.agc:884
//		OCT	16347			# 83	DP3, DP3, DP3
// slot 37511
    37511, 14798,
// PINBALL_NOUN_TABLES.agc:885
//		OCT	16347			# 84	DP3, DP3, DP3
// slot 37512
    37512, 14798,
// PINBALL_NOUN_TABLES.agc:886
//		OCT	16347			# 85	DP3, DP3, DP3
// slot 37513
    37513, 14798,
// PINBALL_NOUN_TABLES.agc:887
//		OCT	16347			# 86	DP3, DP3, DP3
// slot 37514
    37514, 14798,
// PINBALL_NOUN_TABLES.agc:888
//		OCT	00102			# 87	CDU, CDU
// slot 37515
    37515, 132,
// PINBALL_NOUN_TABLES.agc:889
//		OCT	02041			# 88	FRAC FOR EACH
// slot 37516
    37516, 2114,
// PINBALL_NOUN_TABLES.agc:890
//		OCT	10347			# 89	DP3, DP3, DP1
// slot 37517
    37517, 8654,
// PINBALL_NOUN_TABLES.agc:891
//		OCT	24344			# 90	DP1, DP3, DP4
// slot 37518
    37518, 20936,
// PINBALL_NOUN_TABLES.agc:892
//		OCT	24507			# 91	DP3, DP4, DP4
// slot 37519
    37519, 21134,
// PINBALL_NOUN_TABLES.agc:893
//		OCT	00000			# 92	SPARE
// slot 37520
    37520, 0,
// PINBALL_NOUN_TABLES.agc:894
//		OCT	16347			# 93	DP3, DP3, DP3
// slot 37521
    37521, 14798,
// PINBALL_NOUN_TABLES.agc:895
//		OCT	00000			# 94	SPARE
// slot 37522
    37522, 0,
// PINBALL_NOUN_TABLES.agc:896
//		OCT	0			# 95	SPARE
// slot 37523
    37523, 0,
// PINBALL_NOUN_TABLES.agc:897
//		OCT	0			# 96	SPARE
// slot 37524
    37524, 0,
// PINBALL_NOUN_TABLES.agc:898
//		OCT	06143			# 97	ARTH, ARTH, ARTH
// slot 37525
    37525, 6342,
// PINBALL_NOUN_TABLES.agc:899
//# Page 319
// PINBALL_NOUN_TABLES.agc:900
//		OCT	06043			# 98	ARTH, FRAC, ARTH
// slot 37526
    37526, 6214,
// PINBALL_NOUN_TABLES.agc:901
//		OCT	24247			# 99	DP3, DP2, DP4
// slot 37527
    37527, 20814
)).

// no code for the lines below
// PINBALL_NOUN_TABLES.agc:902
//
// PINBALL_NOUN_TABLES.agc:903
//# END OF RUTMXTAB
// PINBALL_NOUN_TABLES.agc:904
//
// PINBALL_NOUN_TABLES.agc:905
//		SBANK=	LOWSUPER
// PINBALL_NOUN_TABLES.agc:906
//
