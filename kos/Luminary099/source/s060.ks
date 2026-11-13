// PORT: Original source unit PINBALL_NOUN_TABLES.agc.
// PORT: Physical bank 42. Shared continuation entries, slots 36931–36932.
function agcAotUnit2499 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36931 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:2
//# Filename:	PINBALL_NOUN_TABLES.agc
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:9
//# Pages:	301-319
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:11
//#				from the Luminary131/ file of the same
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:12
//#				name, using Luminary099 page images.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:13
//#		2009-06-07 RSB	Corrected two typos.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:14
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:15
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:23
//# actually created.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:24
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:26
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:28
//#	16:27 JULY 14, 1969
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:29
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:30
//# Page 301
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:31
//# THE FOLLOWING REFERS TO THE NOUN TABLES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:32
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:33
//# COMPONENT CODE NUMBER		INTERPRETATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:34
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:35
//#	00000			1 COMPONENT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:36
//#	00001			2 COMPONENT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:37
//#	00010			3 COMPONENT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:38
//#	X1XXX			BIT 4 = 1.  DECIMAL ONLY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:39
//#	1XXXX			BIT 5 = 1.  NO LOAD
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:40
//# END OF COMPONENT CODE NUMBER
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:41
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:42
//# SF ROUTINE CODE NUMBER	INTERPRETATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:43
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:44
//# 	00000			OCTAL ONLY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:45
//#	00001			STRAIGHT FRACTIONAL
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:46
//#	00010			CDU DEGREES (XXX.XX)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:47
//#	00011			ARITHMETIC SF
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:48
//#	00100			ARITH DP1	OUT (MULT BY 2EXP14 AT END)	IN (STRAIGHT)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:49
//#	00101			ARITH DP2	OUT (STRAIGHT)			IN (SL 7 AT END)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:50
//#	00110			LANDING RADAR POSITION (+0000X)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:51
//#	00111			ARITH DP3	OUT (SL 7 AT END)		IN (STRAIGHT)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:52
//#	01000			WHOLE HOURS IN R1, WHOLE MINUES (MOD 60) IN R2,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:53
//#					SECONDS (MOD 60) 0XX.XX IN R3.  *** ALARMS IF USED WITH OCTAL
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:54
//#	01001			MINUTES (MOD 60) IN D1D2, D3 BLANK, SECONDS (MOD 60) IN D4D5
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:55
//#					LIMITS TO 59B59 IF MAG EXCEEDS THIS VALUE.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:56
//#					ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:57
//#	01010			ARITH DP4	OUT (STRAIGHT)			IN (SL 3 AT END)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:58
//#	01011			ARITH1 SF	OUT (MULT BY 2EXP14 AT END)	IN (STRAIGHT)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:59
//#	01100			2 INTEGERS IN D1D2, D4D5, D3 BLANK.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:60
//#					ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:61
//#	01101			360-CDU DEGREES (XXX.XX)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:62
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:63
//# END OF SF ROUTINE CODE NUMBERS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:64
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:65
//# SF CONSTANT CODE NUMBER	INTERPRETATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:66
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:67
//#	00000			WHOLE				USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:68
//#	00000			DP TIME SEC (XXX.XX SEC)	USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:69
//#	00000			LR POSITION (+0000X)		USE LR POSITION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:70
//#	00001			SPARE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:71
//#	00010			CDU DEGREES			USE CDU DEGREES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:72
//#	00010			360-CDU DEGREES			USE 360-CDU DEGREES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:73
//#	00011			DP DEGREES (90 XX.XXX DEG	USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:74
//#	00100			DP DEGREES (360) XXX.XX DEG	USE ARITHDP4
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:75
//#	00101			DEGREES (180) XXX.XX DEG	USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:76
//#	00101			OPTICAL TRACKER AZIMUTH ANGLE (XXX.XXDEG)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:77
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:78
//#	00110			WEIGHT2 (XXXXX. LBS)		USE ARITH1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:79
//# Page 302
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:80
//#	00111			POSITION5 (XXX.XX NAUTICAL MILES)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:81
//#								USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:82
//#	01000			POSITION4 (XXXX.X NAUTICAL MILES)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:83
//#								USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:84
//#	01001			VELOCITY2 (XXXXX. FT/SEC)	USE ARITHDP4
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:85
//#	01010			VELOCITY3 (XXXX.X FT/SEC)	USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:86
//#	01011			ELEVATION DEGREES (89.999 MAX)	USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:87
//#	01100			RENDEZVOUS RADAR RANGE (XXX.XX NAUT MI)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:88
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:89
//#	01101			RENDEZVOUS RADAR RANGE RATE (XXXXX.FT/SEC)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:90
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:91
//#	01110			LANDING RADAR ALTITUDE (XXXXX.FEET)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:92
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:93
//#	01111			INITIAL/FINAL ALTITUDE (XXXXX. FEET)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:94
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:95
//#	10000			ALTITUDE RATE (XXXXX.FT/SEC)	USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:96
//#	10001			FORWARD/LATERAL VELOCITY (XXXXX.FEET/SEC)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:97
//#								USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:98
//#	10010			ROTATIONAL HAND CONTROLLER ANGLE RATES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:99
//#					XXXXX.DEG/SEC		USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:100
//#	10011			LANDING RADAR VELX (XXXXX.FEET/SEC)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:101
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:102
//#	10100			LANDING RADAR VELY (XXXXX.FEET/SEC)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:103
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:104
//#	10101			LANDING RADAR VELZ (XXXXX.FEET/SEC)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:105
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:106
//#	10110			POSITION7 (XXXX.X NAUT MI)	USE ARITHDP4
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:107
//#	10111			TRIM DEGREES2 (XXX.XX DEG)	USE ARITH
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:108
//#	11000			COMPUTED ALTITUDE (XXXXX. FEET)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:109
//#								USE ARITHDP1
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:110
//#	11001			DP DEGREES (XXXX.X DEG)		USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:111
//#	11010			POSITION9 (XXXX.X FT)		USE ARITHDP3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:112
//#	11011			VELOCITY4 (XXXX.X FT/SEC)	USE ARITHDP2
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:113
//#	11100			RADIANS (XXX.XXX RADIANS)	USE ARITHDP4
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:114
//#
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:115
//# END OF SF CONSTANT CODE NUMBERS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:116
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:117
//# FOR GREATER THAN SINGLE PRECISION SCALES, PUT ADDRESS OF MAJOR PART INTO
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:118
//# NOUN TABLES.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:119
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:120
//# OCTAL LOADS PLACE +0 INTO MAJOR PART, DATA INTO MINOR PART.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:121
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:122
//# OCTAL DISPLAYS SHOW MINOR PART ONLY.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:123
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:124
//# TO GET AT BOTH MAJOR AND MINOR PARTS (IN OCTAL), USE NOUN 01.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:125
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:126
//# A NOUN MAY BE DECLARED :DECIMAL ONLY: BY MAKING BIT4=1 OF ITS COMPONENT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:127
//# CODE NUMBER.  IF THIS NOUN IS USED WITH ANY OCTAL DISPLAY VERB, OR IF
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:128
//# DATA IS LOADED IN OCTAL, IT ALARMS.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:129
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:130
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:131
//# IN LOADING AN :HOURS, MINUTES, SECONDS: NOUN, ALL 3 WORDS MUST BE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:132
//# LOADED, OR ALARM.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:133
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:134
//# Page 303
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:135
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:136
//# ALARM IF AN ATTEMPT IS MADE TO LOAD :SPLIT MINUTES/SECONDS: (MMBSS).
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:137
//# THIS IS USED FOR DISPLAY ONLY.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:138
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:139
//# Page 304
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:140
//# THE FOLLOWING ROUTINES ARE FOR READING THE NOUN TABLES AND THE SF TABLES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:141
//# (WHICH ARE IN A SEPARATE BANK FROM THE REST OF PINBALL).  THESE READING
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:142
//# ROUTINES ARE IN THE SAME BANK AS THE TABLES.  THEY ARE CALLED BY DXCH Z.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:143
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:144
//# LODNNTAB LOADS NNADTEM WITH THE NNADTAB ENTRY, NNTYPTEM WITH THE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:145
//# NNTYPTAB ENTRY.  IF THE NOUN IS MIXED, IDADITEM IS LOADED WITH THE FIRST
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:146
//# IDADDTAB ENTRY, IDAD2TEM THE SECOND IDADDTAB ENTRY, IDAD3TEM THE THIRD
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:147
//# IDADDTAB ENTRY, RUTMXTEM WITH THE RUTMXTAB ENTRY.  MIXBR IS SET FOR
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:148
//# MIXED OR NORMAL NOUN.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:149
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:150
//		BANK	6
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:151
//		SETLOC	PINBALL3
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:152
//		BANK
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:153
//		COUNT*	$$/NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:154
//LODNNTAB	DXCH	IDAD2TEM		# SAVE RETURN INFO IN IDAD2TEM, IDAD3TEM.
// PORT: Fixed ROM slots 36931.
        if slot <> 36931 or instruction <> 21610 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:155
//		INDEX	NOUNREG
// PORT: Fixed ROM slots 36932.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:156
//		CAF	NNADTAB
// PORT: Fixed ROM slots 36933.
    36933, 26840
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36934–36935.
function agcAotUnit2500 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36934 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:157
//		TS	NNADTEM
// PORT: Fixed ROM slots 36934.
        if slot <> 36934 or instruction <> 22630 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22630, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:158
//		INDEX	NOUNREG
// PORT: Fixed ROM slots 36935.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:159
//		CAF	NNTYPTAB
// PORT: Fixed ROM slots 36936.
    36936, 27040
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36937–36947.
function agcAotUnit2501 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36941 {
        if slot <= 36938 {
            if slot <= 36937 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:160
//		TS	NNTYPTEM
// PORT: Fixed ROM slots 36937.
                if slot <> 36937 or instruction <> 22631 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22631, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:161
//		CS	NOUNREG
// PORT: Fixed ROM slots 36938.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:162
//		AD	MIXCON
// PORT: Fixed ROM slots 36939.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:163
//		EXTEND
// PORT: Fixed ROM slots 36940.
                    if slot <> 36940 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:164
//		BZMF	LODMIXNN		# NOUN NUMBER G/E FIRST MIXED NOUN
// PORT: Fixed ROM slots 36941.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:165
//		CAF	ONE			# NOUN NUMBER L/ FIRST MIXED NOUN
// PORT: Fixed ROM slots 36942.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:166
//		TS	MIXBR			# NORMAL.  +1 INTO MIXBR
// PORT: Fixed ROM slots 36943.
                    if slot <> 36943 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:167
//		TC	LODNLV
// PORT: Fixed ROM slots 36944.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:168
//LODMIXNN	CAF	TWO			# MIXED.  +2 INTO MIXBR.
// PORT: Fixed ROM slots 36945.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:169
//		TS	MIXBR
// PORT: Fixed ROM slots 36946.
                    if slot <> 36946 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:170
//		INDEX	NOUNREG
// PORT: Fixed ROM slots 36947.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:171
//		CAF	RUTMXTAB -40D		# FIRST MIXED NOUN = 40.
// PORT: Fixed ROM slots 36948.
    36948, 27752
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36949–36953.
function agcAotUnit2502 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36950 {
        if slot <= 36949 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:172
//		TS	RUTMXTEM
// PORT: Fixed ROM slots 36949.
            if slot <> 36949 or instruction <> 22635 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22635, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:173
//		CAF	LOW10
// PORT: Fixed ROM slots 36950.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:174
//		MASK	NNADTEM
// PORT: Fixed ROM slots 36951.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:175
//		TS	Q			# TEMP
// PORT: Fixed ROM slots 36952.
                if slot <> 36952 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:176
//		INDEX	A
// PORT: Fixed ROM slots 36953.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:177
//		CAF	IDADDTAB
// PORT: Fixed ROM slots 36954.
    36954, 27472
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36955–36957.
function agcAotUnit2503 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36955 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:178
//		TS	IDAD1TEM		# LOAD IDAD1TEM	WITH FIRST IDADDTAB ENTRY
// PORT: Fixed ROM slots 36955.
        if slot <> 36955 or instruction <> 22632 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22632, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 36956 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:179
//		EXTEND
// PORT: Fixed ROM slots 36956.
            if slot <> 36956 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:180
//		INDEX	Q			# LOAD IDAD2TEM WITH 2ND IDADDTAB ENTRY
// PORT: Fixed ROM slots 36957.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:181
//		DCA	IDADDTAB +1		# LOAD IDAD3TEM WITH 3RD IDADDTAB ENTRY.
// PORT: Fixed ROM slots 36958.
    36958, 27476
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36959–36963.
function agcAotUnit2504 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36960 {
        if slot <= 36959 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:182
//LODNLV		DXCH	IDAD2TEM		# PUT RETURN INFO INTO A, L.
// PORT: Fixed ROM slots 36959.
            if slot <> 36959 or instruction <> 21610 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:183
//		DXCH	Z
// PORT: Fixed ROM slots 36960.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:184
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:185
//MIXCON		=	OCT50			# (DEC 40)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:186
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:187
//# GTSFOUT LOADS SFTEMP1, SFTEMP2 WTIH THE DP SFOUTAB ENTRIES.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:188
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:189
//GTSFOUT		DXCH	SFTEMP1			# 2X(SFCONUM) ARRIVES IN SFTEMP1.
// PORT: Fixed ROM slots 36961.
            if slot <> 36961 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36962 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:190
//# Page 305
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:191
//		EXTEND
// PORT: Fixed ROM slots 36962.
                if slot <> 36962 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:192
//		INDEX	A
// PORT: Fixed ROM slots 36963.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:193
//		DCA	SFOUTAB
// PORT: Fixed ROM slots 36964.
    36964, 27358
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36965–36969.
function agcAotUnit2505 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36966 {
        if slot <= 36965 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:194
//SFCOM		DXCH	SFTEMP1
// PORT: Fixed ROM slots 36965.
            if slot <> 36965 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:195
//		DXCH	Z
// PORT: Fixed ROM slots 36966.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:196
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:197
//# GTSFIN LOADS SFTEMP1, SFTEMP2 WITH THE DP SFINTAB INTRIES.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:198
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:199
//GTSFIN		DXCH	SFTEMP1			# 2X(SFCONUM) ARIVES IN SFTEMP1.
// PORT: Fixed ROM slots 36967.
            if slot <> 36967 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36968 {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:200
//		EXTEND
// PORT: Fixed ROM slots 36968.
                if slot <> 36968 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:201
//		INDEX	A
// PORT: Fixed ROM slots 36969.
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
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:202
//		DCA	SFINTAB
// PORT: Fixed ROM slots 36970.
    36970, 27242
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36971–36971.
function agcAotUnit2506 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:203
//		TCF	SFCOM
// PORT: Fixed ROM slots 36971.
    if slot <> 36971 or instruction <> 5221 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5221, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2506] to agcAotUnit2506@.

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:204
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:205
//						# NN 	NORMAL NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:206
//NNADTAB		OCT	00000			# 00 	NOT IN USE
// PORT: Fixed ROM slots 36972.
    36972, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:207
//		OCT	40000			# 01 	SPECIFY MACHINE ADDRESS (FRACTIONAL)
// PORT: Fixed ROM slots 36973.
    36973, 32768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:208
//		OCT	40000			# 02 	SPECIFY MACHINE ADDRESS (WHOLE)
// PORT: Fixed ROM slots 36974.
    36974, 32768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:209
//		OCT	40000			# 03	SPECIFY MACHINE ADDRESS (DEGREES)
// PORT: Fixed ROM slots 36975.
    36975, 32768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:210
//		ECADR	DSPTEM1			# 04	ANGULAR ERROR/DIFFERENCE
// PORT: Fixed ROM slots 36976.
    36976, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:211
//		ECADR	DSPTEM1			# 05 	ANGULAR ERROR/DIFFERENCE
// PORT: Fixed ROM slots 36977.
    36977, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:212
//		ECADR	OPTION1			# 06	OPTION CODE
// PORT: Fixed ROM slots 36978.
    36978, 1224,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:213
//		ECADR	XREG			# 07	ECADR OF WORD TO BE MODIFIED
// PORT: Fixed ROM slots 36979.
    36979, 1030,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:214
//						#	ONES FOR BITS TO BE MODIFIED
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:215
//						#	1 TO SET OR 0 TO RESET SELECTED BITS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:216
//		ECADR	ALMCADR			# 08 	ALARM DATA
// PORT: Fixed ROM slots 36980.
    36980, 1510,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:217
//		ECADR	FAILREG			# 09	ALARM CODES
// PORT: Fixed ROM slots 36981.
    36981, 506,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:218
//		OCT	77776			# 10	CHANNEL TO BE SPECIFIED
// PORT: Fixed ROM slots 36982.
    36982, 65532,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:219
//		ECADR	TCSI			# 11	TIG OF CSI (HRS,MIN,SEC)
// PORT: Fixed ROM slots 36983.
    36983, 3894,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:220
//		ECADR	OPTIONX			# 12	OPTION CODE
// PORT: Fixed ROM slots 36984.
    36984, 1106,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:221
//						#	(USED BY EXTENDED VERBS ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:222
//		ECADR	TCDH			# 13	TIG OF CDH (HRS,MIN,SEC)
// PORT: Fixed ROM slots 36985.
    36985, 2044,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:223
//		ECADR	DSPTEMX			# 14	CHECKLIST
// PORT: Fixed ROM slots 36986.
    36986, 1106,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:224
//						#	(USED BY EXTENDED VERBS ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:225
//		OCT	77777			# 15	INCREMENT MACHINE ADDRESS
// PORT: Fixed ROM slots 36987.
    36987, 65534,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:226
//		ECADR	DSPTEMX			# 16	TIME OF EVENT (HRS,MIN,SEC)
// PORT: Fixed ROM slots 36988.
    36988, 1106,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:227
//		OCT	00000			# 17	SPARE
// PORT: Fixed ROM slots 36989.
    36989, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:228
//		ECADR	FDAIX			# 18	AUTO MANEUVER BALL ANGLES
// PORT: Fixed ROM slots 36990.
    36990, 2504,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:229
//		OCT	00000			# 19	SPARE
// PORT: Fixed ROM slots 36991.
    36991, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:230
//		ECADR	CDUX			# 20	ICDU ANGLES
// PORT: Fixed ROM slots 36992.
    36992, 52,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:231
//		ECADR	PIPAX			# 21	PIPAS
// PORT: Fixed ROM slots 36993.
    36993, 62,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:232
//		ECADR	THETAD			# 22	NEW ICDU ANGLES
// PORT: Fixed ROM slots 36994.
    36994, 418,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:233
//		OCT	00000			# 23	SPARE
// PORT: Fixed ROM slots 36995.
    36995, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:234
//		ECADR	DSPTEM2 +1		# 24	DELTA TIME FOR AGC CLOCK (HRS,MIN,SEC)
// PORT: Fixed ROM slots 36996.
    36996, 1106,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:235
//		ECADR	DSPTEM1			# 25	CHECKLIST
// PORT: Fixed ROM slots 36997.
    36997, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:236
//						#	(USED WTIH PLEASE PERFORM ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:237
//		ECADR	DSPTEM1			# 26	PRIO/DELAY, ADRES, BBCON
// PORT: Fixed ROM slots 36998.
    36998, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:238
//		ECADR	SMODE			# 27	SELF TEST ON/OFF SWITCH
// PORT: Fixed ROM slots 36999.
    36999, 1508,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:239
//# Page 306
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:240
//		OCT	00000			# 28	SPARE
// PORT: Fixed ROM slots 37000.
    37000, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:241
//		OCT	00000			# 29	SPARE
// PORT: Fixed ROM slots 37001.
    37001, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:242
//		OCT	0			# 30	SPARE
// PORT: Fixed ROM slots 37002.
    37002, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:243
//		OCT	0			# 31	SPARE
// PORT: Fixed ROM slots 37003.
    37003, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:244
//		ECADR	-TPER			# 32	TIME TO PERIGEE (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37004.
    37004, 2244,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:245
//		ECADR	TIG			# 33	TIME OF IGNITION (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37005.
    37005, 3650,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:246
//		ECADR	DSPTEM1			# 34	TIME OF EVENT (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37006.
    37006, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:247
//		ECADR	TTOGO			# 35	TIME TO GO TO EVENT (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37007.
    37007, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:248
//		ECADR	TIME2			# 36	TIME OF AGC CLOCK (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37008.
    37008, 40,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:249
//		ECADR	TTPI			# 37	TIG OF TPI (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37009.
    37009, 3898,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:250
//		ECADR	TET			# 38	TIME OF STATE BEING INTEGRATED
// PORT: Fixed ROM slots 37010.
    37010, 1692,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:251
//		OCT	00000			# 39	SPARE
// PORT: Fixed ROM slots 37011.
    37011, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:252
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:253
//# END OF NNADTAB FOR NORMAL NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:254
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:255
//						# NN	MIXED NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:256
//		OCT	64000			# 40	TIME TO IGNITION/CUTOFF
// PORT: Fixed ROM slots 37012.
    37012, 53248,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:257
//						#	VG
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:258
//						#	DELTA V (ACCUMULATED)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:259
//		OCT	02003			# 41	TARGET	AZIMUTH
// PORT: Fixed ROM slots 37013.
    37013, 2054,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:260
//						#		ELEVATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:261
//		OCT	24006			# 42	APOGEE
// PORT: Fixed ROM slots 37014.
    37014, 20492,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:262
//						#	PERIGEE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:263
//						#	DELTA V (REQUIRED)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:264
//		OCT	24011			# 43	LATITUDE
// PORT: Fixed ROM slots 37015.
    37015, 20498,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:265
//						#	LONGITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:266
//						#	ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:267
//		OCT	64014			# 44	APOGEE
// PORT: Fixed ROM slots 37016.
    37016, 53272,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:268
//						#	PERIGEE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:269
//						#	TFF
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:270
//		OCT	64017			# 45	MARKS
// PORT: Fixed ROM slots 37017.
    37017, 53278,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:271
//						#	TTI OF NEXT BURN
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:272
//						#	MGA
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:273
//		OCT	00022			# 46	AUTOPILOT CONFIGURATION
// PORT: Fixed ROM slots 37018.
    37018, 36,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:274
//		OCT	22025			# 47	LEM WEIGHT
// PORT: Fixed ROM slots 37019.
    37019, 18474,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:275
//						#	CSM WEIGHT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:276
//		OCT	22030			# 48	GIMBAL PITCH TRIM
// PORT: Fixed ROM slots 37020.
    37020, 18480,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:277
//						#	GIMBAL ROLL TRIM
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:278
//		OCT	24033			# 49	DELTA R
// PORT: Fixed ROM slots 37021.
    37021, 20534,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:279
//						#	DELTA V
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:280
//						#	RADAR DATA SOURCE CODE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:281
//		OCT	0			# 50	SPARE
// PORT: Fixed ROM slots 37022.
    37022, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:282
//		OCT	22041			# 51	S-BAND ANTENNA	PITCH
// PORT: Fixed ROM slots 37023.
    37023, 18498,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:283
//						#			YAW
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:284
//		OCT	00044			# 52	CENTRAL ANGLE OF ACTIVE VEHICLE
// PORT: Fixed ROM slots 37024.
    37024, 72,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:285
//		OCT	00000			# 53	SPARE
// PORT: Fixed ROM slots 37025.
    37025, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:286
//		OCT	24052			# 54	RANGE
// PORT: Fixed ROM slots 37026.
    37026, 20564,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:287
//						#	RANGE RATE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:288
//						#	THETA
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:289
//		OCT	24055			# 55	NO. OF APSIDAL CROSSINGS
// PORT: Fixed ROM slots 37027.
    37027, 20570,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:290
//# Page 307
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:291
//						#	ELEVATION ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:292
//						#	CENTRAL ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:293
//		OCT	02060			# 56	RR LOS	AZIMUTH
// PORT: Fixed ROM slots 37028.
    37028, 2144,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:294
//						#		ELEVATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:295
//		OCT	20063			# 57	DELTA R
// PORT: Fixed ROM slots 37029.
    37029, 16486,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:296
//		OCT	24066			# 58	PERIGEE ALT
// PORT: Fixed ROM slots 37030.
    37030, 20588,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:297
//						#	DELTA V TPI
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:298
//						#	DELTA V TPF
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:299
//		OCT	24071			# 59	DELTA VELOCITY LOS
// PORT: Fixed ROM slots 37031.
    37031, 20594,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:300
//		OCT	24074			# 60	HORIZONTAL VELOCITY
// PORT: Fixed ROM slots 37032.
    37032, 20600,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:301
//						#	ALTITUDE RATE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:302
//						#	COMPUTED ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:303
//		OCT	64077			# 61	TIME TO GO IN BRAKING PHASE
// PORT: Fixed ROM slots 37033.
    37033, 53374,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:304
//						#	TIME TO IGNITION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:305
//						#	CROSS RANGE DISTANCE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:306
//		OCT	64102			# 62	ABSOLUTE VALUE OF VELOCITY
// PORT: Fixed ROM slots 37034.
    37034, 53380,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:307
//						#	TIME TO IGNITION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:308
//						#	DELTA V (ACCUMULATED)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:309
//		OCT	24105			# 63	ABSOLUTE VALUE OF VELOCITY
// PORT: Fixed ROM slots 37035.
    37035, 20618,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:310
//						#	ALTITUDE RATE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:311
//						#	COMPUTED ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:312
//		OCT	64110			# 64	TIME LEFT FOR REDESIGNATION -- LPD ANGLE
// PORT: Fixed ROM slots 37036.
    37036, 53392,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:313
//						#	ALTITUDE RATE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:314
//						#	COMPUTED ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:315
//		OCT	24113			# 65	SAMPLED AGC TIME (HRS,MIN,SEC)
// PORT: Fixed ROM slots 37037.
    37037, 20630,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:316
//						#	(FETCHED IN INTERRUPT)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:317
//		OCT	62116			# 66	LR	RANGE
// PORT: Fixed ROM slots 37038.
    37038, 51356,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:318
//						#		POSITION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:319
//		OCT	04121			# 67	LRVX
// PORT: Fixed ROM slots 37039.
    37039, 4258,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:320
//						#	LRVY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:321
//						#	LRVZ
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:322
//		OCT	64124			# 68	SLANT RANGE TO LANDING SIGHT
// PORT: Fixed ROM slots 37040.
    37040, 53416,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:323
//						#	TIME TO GO IN BRAKING PHASE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:324
//						#	LR ALTITUDE -- COMPUTED ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:325
//		OCT	00000			# 69	SPARE
// PORT: Fixed ROM slots 37041.
    37041, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:326
//		OCT	04132			# 70	AOT DETENT CODE/STAR CODE
// PORT: Fixed ROM slots 37042.
    37042, 4276,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:327
//		OCT	04135			# 71	AOT DETENT CODE/STAR CODE
// PORT: Fixed ROM slots 37043.
    37043, 4282,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:328
//		OCT	02140			# 72	RR	360 -- TRUNNION ANGLE
// PORT: Fixed ROM slots 37044.
    37044, 2240,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:329
//						#		SHAFT ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:330
//		OCT	02143			# 73	NEW RR	360 -- TRUNNION ANGLE
// PORT: Fixed ROM slots 37045.
    37045, 2246,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:331
//						#		SHAFT ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:332
//		OCT	64146			# 74	TIME TO IGNITION
// PORT: Fixed ROM slots 37046.
    37046, 53452
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:333
//						#	YAWAFTER VEHICLE RISE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:334
//						#	PITCH AFTER VEHICLE RISE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:335
//		OCT	64151			# 75	DELTA ALTITUDE CDH
// PORT: Fixed ROM slots 37047.
    37047, 53458,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:336
//						#	DELTA TIME (CDH-CSI OR TPI-CDH)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:337
//						#	DELTA TIME (TPI-CDH OR TPI-NOMTPI)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:338
//		OCT	24154			# 76	DESIRED HORIZONTAL VELOCITY
// PORT: Fixed ROM slots 37048.
    37048, 20696,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:339
//						#	DESIRED RADIAL VELOCITY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:340
//						#	CROSS-RANGE DISTANCE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:341
//# Page 308
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:342
//		OCT	62157			# 77	TIME TO ENGINE CUTOFF
// PORT: Fixed ROM slots 37049.
    37049, 51422,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:343
//						#	VELOCITY NORMAL TO CSM PLANE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:344
//		OCT	02162			# 78	RR	RANGE
// PORT: Fixed ROM slots 37050.
    37050, 2276,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:345
//						#		RANGE RATE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:346
//		OCT	24165			# 79	CURSOR ANGLE
// PORT: Fixed ROM slots 37051.
    37051, 20714,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:347
//						#	SPIRAL ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:348
//						#	POSITION CODE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:349
//		OCT	02170			# 80	DATA INDICATOR
// PORT: Fixed ROM slots 37052.
    37052, 2288,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:350
//						#	OMEGA
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:351
//		OCT	24173			# 81	DELTA V (LV)
// PORT: Fixed ROM slots 37053.
    37053, 20726,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:352
//		OCT	24176			# 82	DELTA V (LV)
// PORT: Fixed ROM slots 37054.
    37054, 20732,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:353
//		OCT	24201			# 83	DELTA V (BODY)
// PORT: Fixed ROM slots 37055.
    37055, 20738,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:354
//		OCT	24204			# 84	DELTA V (OTHER VEHICLE)
// PORT: Fixed ROM slots 37056.
    37056, 20744,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:355
//		OCT	24207			# 85	VG (BODY)
// PORT: Fixed ROM slots 37057.
    37057, 20750,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:356
//		OCT	24212			# 86	VG (LV)
// PORT: Fixed ROM slots 37058.
    37058, 20756,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:357
//		OCT	02215			# 87	BACKUP OPTICS LOS	AZIMUTH
// PORT: Fixed ROM slots 37059.
    37059, 2330,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:358
//						#				ELEVATION
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:359
//		OCT	24220			# 88	HALF UNIT SUN OR PLANET VECTOR
// PORT: Fixed ROM slots 37060.
    37060, 20768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:360
//		OCT	24223			# 89	LANDMARK	LATITUDE
// PORT: Fixed ROM slots 37061.
    37061, 20774,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:361
//						#			LONGITUDE/2
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:362
//						#			ALTITUDE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:363
//		OCT	24226			# 90	Y
// PORT: Fixed ROM slots 37062.
    37062, 20780,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:364
//						#	Y DOT
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:365
//						#	PSI
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:366
//		OCT	04231			# 91	ALTITUDE
// PORT: Fixed ROM slots 37063.
    37063, 4402,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:367
//						#	VELOCITY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:368
//						#	FLIGHT PATH ANGLE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:369
//		OCT	00000			# 92	SPARE
// PORT: Fixed ROM slots 37064.
    37064, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:370
//		OCT	04237			# 93	DELTA GYRO ANGLES
// PORT: Fixed ROM slots 37065.
    37065, 4414,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:371
//		OCT	00000			# 94	SPARE
// PORT: Fixed ROM slots 37066.
    37066, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:372
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37067.
    37067, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:373
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37068.
    37068, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:374
//		OCT	04253			# 97	SYSTEM TEST INPUTS
// PORT: Fixed ROM slots 37069.
    37069, 4438,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:375
//		OCT	04256			# 98	SYSTEM TEST RESULTS
// PORT: Fixed ROM slots 37070.
    37070, 4444,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:376
//		OCT	24261			# 99	RMS IN POSITION
// PORT: Fixed ROM slots 37071.
    37071, 20834,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:377
//						#	RMS IN VELOCITY
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:378
//						#	RMS IN BIAS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:379
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:380
//# END OF NNADTAB FOR MIXED NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:381
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:382
//						# NN	NORMAL NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:383
//NNTYPTAB	OCT	00000			# 00	NOT IN USE
// PORT: Fixed ROM slots 37072.
    37072, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:384
//		OCT	04040			# 01	3COMP FRACTIONAL
// PORT: Fixed ROM slots 37073.
    37073, 4160,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:385
//		OCT	04140			# 02	3COMP WHOLE
// PORT: Fixed ROM slots 37074.
    37074, 4288,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:386
//		OCT	04102			# 03	3COMP CDU DEGREES
// PORT: Fixed ROM slots 37075.
    37075, 4228,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:387
//		OCT	00504			# 04	1COMP DPDEG(360)
// PORT: Fixed ROM slots 37076.
    37076, 648,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:388
//		OCT	00504			# 05	1COMP DPDEG(360)
// PORT: Fixed ROM slots 37077.
    37077, 648,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:389
//		OCT	04000			# 06	3COMP OCTAL ONLY
// PORT: Fixed ROM slots 37078.
    37078, 4096,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:390
//		OCT	04000			# 07 	3COMP OCTAL ONLY
// PORT: Fixed ROM slots 37079.
    37079, 4096,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:391
//		OCT	04000			# 08	3COMP OCTAL ONLY
// PORT: Fixed ROM slots 37080.
    37080, 4096,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:392
//# Page 309
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:393
//		OCT	04000			# 09	3COMP OCTAL ONLY
// PORT: Fixed ROM slots 37081.
    37081, 4096,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:394
//		OCT	00000			# 10	1COMP OCTAL ONLY
// PORT: Fixed ROM slots 37082.
    37082, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:395
//		OCT	24400			# 11	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37083.
    37083, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:396
//		OCT	02000			# 12	2COMP OCTAL ONLY
// PORT: Fixed ROM slots 37084.
    37084, 2048,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:397
//		OCT	24400			# 13	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37085.
    37085, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:398
//		OCT	04140			# 14	3COMP WHOLE
// PORT: Fixed ROM slots 37086.
    37086, 4288,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:399
//		OCT	00000			# 15	1COMP OCTAL ONLY
// PORT: Fixed ROM slots 37087.
    37087, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:400
//		OCT	24400			# 16	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37088.
    37088, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:401
//		OCT	0			# 17 	SPARE
// PORT: Fixed ROM slots 37089.
    37089, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:402
//		OCT	04102			# 18	3COMP CDU DEG
// PORT: Fixed ROM slots 37090.
    37090, 4228,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:403
//		OCT	00000			# 19	SPARE
// PORT: Fixed ROM slots 37091.
    37091, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:404
//		OCT	04102			# 20	3COMP CDU DEGREES
// PORT: Fixed ROM slots 37092.
    37092, 4228,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:405
//		OCT	04140			# 21	3COMP WHOLE
// PORT: Fixed ROM slots 37093.
    37093, 4288,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:406
//		OCT	04102			# 22	3COMP CDU DEGREES
// PORT: Fixed ROM slots 37094.
    37094, 4228,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:407
//		OCT	00000			# 23 	SPARE
// PORT: Fixed ROM slots 37095.
    37095, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:408
//		OCT	24400			# 24	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37096.
    37096, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:409
//		OCT	04140			# 25	3COMP WHOLE
// PORT: Fixed ROM slots 37097.
    37097, 4288,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:410
//		OCT	04000			# 26	3COMP OCTAL ONLY
// PORT: Fixed ROM slots 37098.
    37098, 4096,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:411
//		OCT	00140			# 27	1COMP WHILE
// PORT: Fixed ROM slots 37099.
    37099, 192,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:412
//		OCT	00000			# 28	SPARE
// PORT: Fixed ROM slots 37100.
    37100, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:413
//		OCT	00000			# 29	SPARE
// PORT: Fixed ROM slots 37101.
    37101, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:414
//		OCT	0			# 30	SPARE
// PORT: Fixed ROM slots 37102.
    37102, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:415
//		OCT	0			# 31	SPARE
// PORT: Fixed ROM slots 37103.
    37103, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:416
//		OCT	24400			# 32 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37104.
    37104, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:417
//		OCT	24400			# 33 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37105.
    37105, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:418
//		OCT	24400			# 34	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37106.
    37106, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:419
//		OCT	24400			# 35 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37107.
    37107, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:420
//		OCT	24400			# 36 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37108.
    37108, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:421
//		OCT	24400			# 37 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37109.
    37109, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:422
//		OCT	24400			# 38 	3COMP HMS (DEC ONLY)
// PORT: Fixed ROM slots 37110.
    37110, 20992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:423
//		OCT	00000			# 39	SPARE
// PORT: Fixed ROM slots 37111.
    37111, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:424
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:425
//# END OF NNTYPTAB FOR NORMAL NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:426
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:427
//						# NN	MIXED NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:428
//		OCT	24500			# 40	3COMP	MIN/SEC, VEL3, VEL3
// PORT: Fixed ROM slots 37112.
    37112, 21120,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:429
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:430
//		OCT	00542			# 41	2COMP	CDU DEG, ELEV DEG
// PORT: Fixed ROM slots 37113.
    37113, 708,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:431
//		OCT	24410			# 42	3COMP	POS4, POS4, VEL3
// PORT: Fixed ROM slots 37114.
    37114, 21008,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:432
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:433
//		OCT	20204			# 43	3COMP	DPDEG(360), DPDEG(360) POS4
// PORT: Fixed ROM slots 37115.
    37115, 16648,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:434
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:435
//		OCT	00410			# 44	3COMP	POS4, POS4, MIN/SEC
// PORT: Fixed ROM slots 37116.
    37116, 528,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:436
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:437
//		OCT	10000			# 45	3COMP	WHOLE, MIN/SEC, DPDEG(360)
// PORT: Fixed ROM slots 37117.
    37117, 8192,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:438
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:439
//		OCT	00000			# 46	1COMP 	OCTAL ONLY
// PORT: Fixed ROM slots 37118.
    37118, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:440
//		OCT	00306			# 47	2COMP	WEIGHT2 FOR EACH
// PORT: Fixed ROM slots 37119.
    37119, 396,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:441
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:442
//		OCT	01367			# 48	2COMP	TRIM DEG2 FOR EACH
// PORT: Fixed ROM slots 37120.
    37120, 1518,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:443
//# Page 310
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:444
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:445
//		OCT	00510			# 49	3COMP	POS4, VEL3, WHOLE
// PORT: Fixed ROM slots 37121.
    37121, 656,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:446
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:447
//		OCT	0			# 50	SPARE
// PORT: Fixed ROM slots 37122.
    37122, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:448
//		OCT	00204			# 51	2COMP	DPDEG(360), DPDEG(360)
// PORT: Fixed ROM slots 37123.
    37123, 264,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:449
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:450
//		OCT	00004			# 52	1COMP	DPDEG(360)
// PORT: Fixed ROM slots 37124.
    37124, 8,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:451
//		OCT	00000			# 53	SPARE
// PORT: Fixed ROM slots 37125.
    37125, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:452
//		OCT	10507			# 54	3COMP	POS5, VEL3, DPDEG(360)
// PORT: Fixed ROM slots 37126.
    37126, 8846,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:453
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:454
//		OCT	10200			# 55	3COMP	WHOLE, DPDEG(360), DPDEG(360)
// PORT: Fixed ROM slots 37127.
    37127, 8448,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:455
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:456
//		OCT	00204			# 56	2COMP	DPDEG(360), DPDEG(360)
// PORT: Fixed ROM slots 37128.
    37128, 264,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:457
//		OCT	00010			# 57	1COMP	POS4
// PORT: Fixed ROM slots 37129.
    37129, 16,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:458
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:459
//		OCT	24510			# 58	3COMP	POS4, VEL3, VEL3
// PORT: Fixed ROM slots 37130.
    37130, 21136,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:460
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:461
//		OCT	24512			# 59	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37131.
    37131, 21140
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:462
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:463
//		OCT	60512			# 60	3COMP	VEL3, VEL3, COMP ALT
// PORT: Fixed ROM slots 37132.
    37132, 49812,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:464
//						# 		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:465
//		OCT	54000			# 61	3COMP 	MIN/SEC, MIN/SEC, POS7
// PORT: Fixed ROM slots 37133.
    37133, 45056,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:466
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:467
//		OCT	24012			# 62	3COMP	VEL3, MIN/SEC, VEL3
// PORT: Fixed ROM slots 37134.
    37134, 20500,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:468
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:469
//		OCT	60512			# 63	3COMP	VEL3, VEL3, COMP ALT
// PORT: Fixed ROM slots 37135.
    37135, 49812,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:470
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:471
//		OCT	60500			# 64	3COMP	2INT, VEL3, COMP ALT
// PORT: Fixed ROM slots 37136.
    37136, 49792,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:472
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:473
//		OCT	00000			# 65	3COMP	HMS (DEC ONLY)
// PORT: Fixed ROM slots 37137.
    37137, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:474
//		OCT	00016			# 66	2COMP 	LANDING RADAR ALT, POSITION
// PORT: Fixed ROM slots 37138.
    37138, 28,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:475
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:476
//		OCT	53223			# 67	3COMP	LANDING RADAR VELX, Y, Z
// PORT: Fixed ROM slots 37139.
    37139, 44326,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:477
//		OCT	60026			# 68	3COMP	POS7, MIN/SEC, COMP ALT
// PORT: Fixed ROM slots 37140.
    37140, 49196,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:478
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:479
//		OCT	00000			# 69	SPARE
// PORT: Fixed ROM slots 37141.
    37141, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:480
//		OCT	0			# 70	3COMP	OCTAL ONLY FOR EACH
// PORT: Fixed ROM slots 37142.
    37142, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:481
//		OCT	0			# 71	3COMP	OCTAL ONLY FOR EACH
// PORT: Fixed ROM slots 37143.
    37143, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:482
//		OCT	00102			# 72	2COMP	360-CDU DEG, CDU DEG
// PORT: Fixed ROM slots 37144.
    37144, 132,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:483
//		OCT	00102			# 73	2COMP	360-CDU DEG, CDU DEG
// PORT: Fixed ROM slots 37145.
    37145, 132,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:484
//		OCT	10200			# 74	3COMP	MIN/SEC, DPDEG(360), DPDEG(360)
// PORT: Fixed ROM slots 37146.
    37146, 8448,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:485
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:486
//		OCT	00010			# 75	3COMP	POS4, MIN/SEC, MIN/SEC
// PORT: Fixed ROM slots 37147.
    37147, 16,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:487
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:488
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:489
//		OCT	20512			# 76	3COMP	VEL3, VEL3, POS4
// PORT: Fixed ROM slots 37148.
    37148, 17044,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:490
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:491
//		OCT	00500			# 77	2COMP	MIN/SEC, VEL3
// PORT: Fixed ROM slots 37149.
    37149, 640,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:492
//						#		(NO LOAD, DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:493
//		OCT	00654			# 78	2 COMP	RR RANGE, RR RANGE RATE
// PORT: Fixed ROM slots 37150.
    37150, 856,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:494
//		OCT	00102			# 79	3COMP	CDU DEG, CDU DEG, WHOLE
// PORT: Fixed ROM slots 37151.
    37151, 132,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:495
//# Page 311
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:496
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:497
//		OCT	00200			# 80	2COMP	WHOLE, DPDEG(360)
// PORT: Fixed ROM slots 37152.
    37152, 256,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:498
//		OCT	24512			# 81	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37153.
    37153, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:499
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:500
//		OCT	24512			# 82	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37154.
    37154, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:501
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:502
//		OCT	24512			# 83	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37155.
    37155, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:503
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:504
//		OCT	24512			# 84	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37156.
    37156, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:505
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:506
//		OCT	24512			# 85	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37157.
    37157, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:507
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:508
//		OCT	24512			# 86	3COMP	VEL3 FOR EACH
// PORT: Fixed ROM slots 37158.
    37158, 21140,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:509
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:510
//		OCT	00102			# 87	2COMP	CDU DEG FOR EACH
// PORT: Fixed ROM slots 37159.
    37159, 132,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:511
//		OCT	0			# 88	3COMP	FRAC FOR EACH
// PORT: Fixed ROM slots 37160.
    37160, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:512
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:513
//		OCT	16143			# 89	3COMP 	DPDEG(90), DPDEG(90), POS5
// PORT: Fixed ROM slots 37161.
    37161, 14534,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:514
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:515
//		OCT	10507			# 90	3COMP	POS5, VEL3, DEPDEG(360)
// PORT: Fixed ROM slots 37162.
    37162, 8846,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:516
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:517
//		OCT	10450			# 91	3COMP	POS4, VEL2, DPDEG(360)
// PORT: Fixed ROM slots 37163.
    37163, 8784,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:518
//		OCT	00000			# 92	SPARE
// PORT: Fixed ROM slots 37164.
    37164, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:519
//		OCT	06143			# 93	3COMP	DPDEG(90) FOR EACH
// PORT: Fixed ROM slots 37165.
    37165, 6342,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:520
//		OCT	00000			# 94	SPARE
// PORT: Fixed ROM slots 37166.
    37166, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:521
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37167.
    37167, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:522
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37168.
    37168, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:523
//		OCT	00000			# 97	3COMP	WHOLE FOR EACH
// PORT: Fixed ROM slots 37169.
    37169, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:524
//		OCT 	00000			# 98	3COMP	WHOLE, FRAC, WHOLE
// PORT: Fixed ROM slots 37170.
    37170, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:525
//		OCT	71572			# 99	3COMP	POS9, VEL4, RADIANS
// PORT: Fixed ROM slots 37171.
    37171, 59124,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:526
//						#		(DEC ONLY)
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:527
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:528
//# END OF NNTYPTAB FOR MIXED NOUNS
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:529
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:530
//SFINTAB		OCT	00006			# WHOLE, DP TIME (SEC)
// PORT: Fixed ROM slots 37172.
    37172, 12,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:531
//		OCT	03240
// PORT: Fixed ROM slots 37173.
    37173, 3392,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:532
//		OCT	00000			# SPARE
// PORT: Fixed ROM slots 37174.
    37174, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:533
//		OCT	00000
// PORT: Fixed ROM slots 37175.
    37175, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:534
//		OCT	00000			# CDU DEGREES, 360-CDU DEGREES
// PORT: Fixed ROM slots 37176.
    37176, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:535
//		OCT	00000			#	(SFCONS IN DEGINSF)
// PORT: Fixed ROM slots 37177.
    37177, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:536
//		OCT	10707			# DP DEGREES (90)
// PORT: Fixed ROM slots 37178.
    37178, 9102,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:537
//		OCT	03435			#	UPPED BY 1
// PORT: Fixed ROM slots 37179.
    37179, 3642,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:538
//		OCT	13070			# DP DEGREES (360) (POINT BETWN BITS 11-12)
// PORT: Fixed ROM slots 37180.
    37180, 11376,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:539
//		OCT	34345			#	UPPED BY 1
// PORT: Fixed ROM slots 37181.
    37181, 29130,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:540
//		OCT	00005			# DEGREES (180)
// PORT: Fixed ROM slots 37182.
    37182, 10,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:541
//		OCT	21616
// PORT: Fixed ROM slots 37183.
    37183, 18204,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:542
//		OCT	26113			# WEIGHT2
// PORT: Fixed ROM slots 37184.
    37184, 22678,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:543
//		OCT	31713
// PORT: Fixed ROM slots 37185.
    37185, 26518,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:544
//		OCT	00070			# POSITION5
// PORT: Fixed ROM slots 37186.
    37186, 112,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:545
//		OCT	20460
// PORT: Fixed ROM slots 37187.
    37187, 16992,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:546
//# Page 312
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:547
//		OCT	01065			# POSITION4
// PORT: Fixed ROM slots 37188.
    37188, 1130,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:548
//		OCT	05740
// PORT: Fixed ROM slots 37189.
    37189, 6080,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:549
//		OCT	11414			# VELOCITY2 	(POINT BETWN BITS 11-12)
// PORT: Fixed ROM slots 37190.
    37190, 9752,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:550
//		OCT	31463
// PORT: Fixed ROM slots 37191.
    37191, 26214,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:551
//		OCT	07475			# VELOCITY3
// PORT: Fixed ROM slots 37192.
    37192, 7802,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:552
//		OCT	16051
// PORT: Fixed ROM slots 37193.
    37193, 14418,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:553
//		OCT	00001			# ELEVATION DEGREES
// PORT: Fixed ROM slots 37194.
    37194, 2,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:554
//		OCT	03434
// PORT: Fixed ROM slots 37195.
    37195, 3640,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:555
//		OCT	00047			# RENDEZVOUS RADAR RANGE
// PORT: Fixed ROM slots 37196.
    37196, 78,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:556
//		OCT	21135
// PORT: Fixed ROM slots 37197.
    37197, 17594,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:557
//		OCT	77766			# RENDESVOUS RADAR RANGE RATE
// PORT: Fixed ROM slots 37198.
    37198, 65516,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:558
//		OCT	50711
// PORT: Fixed ROM slots 37199.
    37199, 41874,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:559
//		2DEC*	.9267840599 E5 B-28*	# LANDING RADAR ALTITUDE
// PORT: Fixed ROM slots 37200 37201.
    37200, 10, 37201, 21516,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:560
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:561
//		OCT	00002			# INITIAL/FINAL ALTITUDE
// PORT: Fixed ROM slots 37202.
    37202, 4,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:562
//		OCT	23224
// PORT: Fixed ROM slots 37203.
    37203, 19752,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:563
//		OCT	00014			# ALTITUDE RATE
// PORT: Fixed ROM slots 37204.
    37204, 24,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:564
//		OCT	06500
// PORT: Fixed ROM slots 37205.
    37205, 6784,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:565
//		OCT	00012			# FORWARD/LATERAL VELOCITY
// PORT: Fixed ROM slots 37206.
    37206, 20,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:566
//		OCT	36455
// PORT: Fixed ROM slots 37207.
    37207, 31322,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:567
//		OCT	04256			# ROT HAND CONT ANGLE RATE
// PORT: Fixed ROM slots 37208.
    37208, 4444,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:568
//		OCT	07071
// PORT: Fixed ROM slots 37209.
    37209, 7282,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:569
//		2DEC*	-1.552795030 E5 B-28*	# LANDING RADAR VELX
// PORT: Fixed ROM slots 37210 37211.
    37210, 65516, 37211, 49886,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:570
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:571
//		2DEC*	.8250825087 E5 B-28*	# LANDING RADAR VELY
// PORT: Fixed ROM slots 37212 37213.
    37212, 10, 37213, 1176,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:572
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:573
//		2DEC*	1.153668673 E5 B-28*	# LANDING RADAR VELZ
// PORT: Fixed ROM slots 37214 37215.
    37214, 14, 37215, 1358,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:574
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:575
//		OCT	04324			# POSITION7
// PORT: Fixed ROM slots 37216.
    37216, 4520,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:576
//		OCT	27600
// PORT: Fixed ROM slots 37217.
    37217, 24320,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:577
//		OCT	00036			# TRIM DEGREES2
// PORT: Fixed ROM slots 37218.
    37218, 60,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:578
//		OCT	20440
// PORT: Fixed ROM slots 37219.
    37219, 16960,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:579
//		OCT	00035			# COMPUTED ALTITUDE
// PORT: Fixed ROM slots 37220.
    37220, 58,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:580
//		OCT	30400
// PORT: Fixed ROM slots 37221.
    37221, 25088,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:581
//		OCT	23420			# DP DEGREES
// PORT: Fixed ROM slots 37222.
    37222, 20000,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:582
//		OCT	00000
// PORT: Fixed ROM slots 37223.
    37223, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:583
//		2DEC	30480 B-19		# POSITION 9
// PORT: Fixed ROM slots 37224 37225.
    37224, 1904, 37225, 16384,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:584
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:585
//		2DEC	30.48 B-7		# VELOCITY4
// PORT: Fixed ROM slots 37226 37227.
    37226, 7802, 37227, 14418,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:586
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:587
//		2DEC	100 B-8			# RADIANS
// PORT: Fixed ROM slots 37228 37229.
    37228, 12800, 37229, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:588
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:589
//						# END OF SFINTAB
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:590
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:591
//SFOUTAB		OCT	05174			# WHOLE, DP TIME (SEC)
// PORT: Fixed ROM slots 37230.
    37230, 5368
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:592
//		OCT	13261
// PORT: Fixed ROM slots 37231.
    37231, 11618,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:593
//		OCT	00000			# SPARE
// PORT: Fixed ROM slots 37232.
    37232, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:594
//		OCT	00000
// PORT: Fixed ROM slots 37233.
    37233, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:595
//		OCT	00000			# CDU DEGREES, 360-CDU DEGREES
// PORT: Fixed ROM slots 37234.
    37234, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:596
//# Page 313
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:597
//		OCT	00000			#	(SFCONS IN DEGOUTSF, 360 CDUO)
// PORT: Fixed ROM slots 37235.
    37235, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:598
//		OCT	00714			# DP DEGREES (90) (POINT BETWN BITS 7-8)
// PORT: Fixed ROM slots 37236.
    37236, 920,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:599
//		OCT	31463
// PORT: Fixed ROM slots 37237.
    37237, 26214,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:600
//		OCT	13412			# DP DEGREES (360)
// PORT: Fixed ROM slots 37238.
    37238, 11796,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:601
//		OCT	07534
// PORT: Fixed ROM slots 37239.
    37239, 7864,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:602
//		OCT	05605			# DEGREES (180)
// PORT: Fixed ROM slots 37240.
    37240, 5898,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:603
//		OCT	03656
// PORT: Fixed ROM slots 37241.
    37241, 3932,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:604
//		OCT	00001			# WEIGHT2
// PORT: Fixed ROM slots 37242.
    37242, 2,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:605
//		OCT	16170
// PORT: Fixed ROM slots 37243.
    37243, 14576,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:606
//		OCT	00441			# POSITION5
// PORT: Fixed ROM slots 37244.
    37244, 578,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:607
//		OCT	34306
// PORT: Fixed ROM slots 37245.
    37245, 29068,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:608
//		OCT	07176			# POSITION4	(POINT BETWN BITS 7-8)
// PORT: Fixed ROM slots 37246.
    37246, 7420,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:609
//		OCT	21603
// PORT: Fixed ROM slots 37247.
    37247, 18182,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:610
//		OCT	15340			# VELOCITY2
// PORT: Fixed ROM slots 37248.
    37248, 13760,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:611
//		OCT	15340
// PORT: Fixed ROM slots 37249.
    37249, 13760,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:612
//		OCT	01031			# VELOCITY3	(POINT BETWN BITS 7-8)
// PORT: Fixed ROM slots 37250.
    37250, 1074,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:613
//		OCT	21032
// PORT: Fixed ROM slots 37251.
    37251, 17460,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:614
//		OCT	34631			# ELEVATION DETREES
// PORT: Fixed ROM slots 37252.
    37252, 29490,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:615
//		OCT	23146
// PORT: Fixed ROM slots 37253.
    37253, 19660,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:616
//		OCT	00636			# RENDEZVOUS RADAR RANGE
// PORT: Fixed ROM slots 37254.
    37254, 828,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:617
//		OCT	14552
// PORT: Fixed ROM slots 37255.
    37255, 13012,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:618
//		OCT	74552			# RENDEZVOUS RADAR RANGE RATE
// PORT: Fixed ROM slots 37256.
    37256, 62164,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:619
//		OCT	70307
// PORT: Fixed ROM slots 37257.
    37257, 57742,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:620
//		2DEC	1.079 E-5 B14		# LANDING RADAR ALTITUDE
// PORT: Fixed ROM slots 37258 37259.
    37258, 5792, 37259, 13716,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:621
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:622
//		OCT	14226			# INITIAL/FINAL ALTITUDE
// PORT: Fixed ROM slots 37260.
    37260, 12588,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:623
//		OCT	31757
// PORT: Fixed ROM slots 37261.
    37261, 26590,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:624
//		OCT	02476			# ALTITUDE RATE
// PORT: Fixed ROM slots 37262.
    37262, 2684,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:625
//		OCT	05531
// PORT: Fixed ROM slots 37263.
    37263, 5810,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:626
//		OCT	02727			# FORWARD/LATERAL VELOCTY
// PORT: Fixed ROM slots 37264.
    37264, 2990,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:627
//		OCT	16415
// PORT: Fixed ROM slots 37265.
    37265, 14874,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:628
//		OCT	00007			# ROT HAND CONT ANGLE RATE
// PORT: Fixed ROM slots 37266.
    37266, 14,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:629
//		OCT	13734
// PORT: Fixed ROM slots 37267.
    37267, 12216,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:630
//		2DEC	-.6440 E-5 B14		# LANDING RADAR VELX
// PORT: Fixed ROM slots 37268 37269.
    37268, 62078, 37269, 41798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:631
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:632
//		2DEC	1.212 E-5 B14		# LANDING RADAR VELY
// PORT: Fixed ROM slots 37270 37271.
    37270, 6506, 37271, 14344,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:633
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:634
//		2DEC	.8668 E-5 B14		# LANDING RADAR VELZ
// PORT: Fixed ROM slots 37272 37273.
    37272, 4652, 37273, 26166,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:635
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:636
//		OCT	34772			# POSITION7
// PORT: Fixed ROM slots 37274.
    37274, 29684,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:637
//		OCT	07016
// PORT: Fixed ROM slots 37275.
    37275, 7196,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:638
//		OCT	01030			# TRIM DEGREES2
// PORT: Fixed ROM slots 37276.
    37276, 1072,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:639
//		OCT	33675
// PORT: Fixed ROM slots 37277.
    37277, 28538,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:640
//		OCT	01046			# COMPUTED ALTITUDE
// PORT: Fixed ROM slots 37278.
    37278, 1100,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:641
//		OCT	15700
// PORT: Fixed ROM slots 37279.
    37279, 14208,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:642
//		OCT	00321			# DP DEGREES
// PORT: Fixed ROM slots 37280.
    37280, 418,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:643
//		OCT	26706
// PORT: Fixed ROM slots 37281.
    37281, 23436,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:644
//		2DEC	17.2010499 B-7		# POSITION 9
// PORT: Fixed ROM slots 37282 37283.
    37282, 4402, 37283, 24064,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:645
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:646
//		2DEC	.032808399		# VELOCITY4
// PORT: Fixed ROM slots 37284 37285.
    37284, 1074, 37285, 17460,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:647
//# Page 314
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:648
//		2DEC	.32			# RADIANS
// PORT: Fixed ROM slots 37286 37287.
    37286, 10484, 37287, 28836,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:649
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:650
//						# END OF SFOUTAB
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:651
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:652
//						# NN 	SF CONSTANT		SF ROUTINE
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:653
//IDADDTAB	ECADR	TTOGO			# 40	MIN/SEC			M/S
// PORT: Fixed ROM slots 37288.
    37288, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:654
//		ECADR	VGDISP			# 40	VEL3			DP3
// PORT: Fixed ROM slots 37289.
    37289, 3942,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:655
//		ECADR	DVTOTAL			# 40	VEL3			DP3
// PORT: Fixed ROM slots 37290.
    37290, 3726,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:656
//		ECADR	DSPTEM1			# 41	CDU DEG			CDU
// PORT: Fixed ROM slots 37291.
    37291, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:657
//		ECADR	DSPTEM1 +1		# 41	ELEV DEG		ARTH
// PORT: Fixed ROM slots 37292.
    37292, 1100,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:658
//		OCT	0			# 41	SPARE COMPONENT
// PORT: Fixed ROM slots 37293.
    37293, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:659
//		ECADR	HAPO			# 42	POS4			DP3
// PORT: Fixed ROM slots 37294.
    37294, 2460,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:660
//		ECADR	HPER			# 42	POS4			DP3
// PORT: Fixed ROM slots 37295.
    37295, 2464,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:661
//		ECADR	VGDISP			# 42 	VEL3			DP3
// PORT: Fixed ROM slots 37296.
    37296, 3942,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:662
//		ECADR	LAT			# 43	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37297.
    37297, 1184,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:663
//		ECADR	LONG			# 43	DPDEG(360		DP4
// PORT: Fixed ROM slots 37298.
    37298, 1188,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:664
//		ECADR	ALT			# 43	POS4			DP3
// PORT: Fixed ROM slots 37299.
    37299, 1192,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:665
//		ECADR	HAPOX			# 44	POS4			DP3
// PORT: Fixed ROM slots 37300.
    37300, 2206,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:666
//		ECADR	HPERX			# 44	POS4			DP3
// PORT: Fixed ROM slots 37301.
    37301, 2210,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:667
//		ECADR	TFF			# 44	MIN/SEC			M/S
// PORT: Fixed ROM slots 37302.
    37302, 2240,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:668
//		ECADR	TRKMKCNT		# 45	WHOLE			ARTH
// PORT: Fixed ROM slots 37303.
    37303, 3684,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:669
//		ECADR	TTOGO			# 45	MIN/SEC			M/S
// PORT: Fixed ROM slots 37304.
    37304, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:670
//		ECADR	+MGA			# 45	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37305.
    37305, 2388,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:671
//		ECADR	DAPDATR1		# 46	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37306.
    37306, 1478,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:672
//		OCT	0			# 46	SPARE COMPONENT
// PORT: Fixed ROM slots 37307.
    37307, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:673
//		OCT	0			# 46	SPARE COMPONENT
// PORT: Fixed ROM slots 37308.
    37308, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:674
//		ECADR	LEMMASS			# 47	WEIGHT2			ARTH1
// PORT: Fixed ROM slots 37309.
    37309, 1458,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:675
//		ECADR	CSMMASS			# 47	WEIGHT2			ARTH1
// PORT: Fixed ROM slots 37310.
    37310, 1460,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:676
//		OCT	0			# 47	SPARE COMPONENT
// PORT: Fixed ROM slots 37311.
    37311, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:677
//		ECADR	PITTIME			# 48	TRIM DEG2		ARTH
// PORT: Fixed ROM slots 37312.
    37312, 3076,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:678
//		ECADR	ROLLTIME		# 48	TRIM DEG2		ARTH
// PORT: Fixed ROM slots 37313.
    37313, 3074,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:679
//		OCT	0			# 48	SPARE COMPONENT
// PORT: Fixed ROM slots 37314.
    37314, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:680
//		ECADR	R22DISP			# 49	POS4			DP3
// PORT: Fixed ROM slots 37315.
    37315, 408,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:681
//		ECADR	R22DISP +2		# 49	VEL3			DP3
// PORT: Fixed ROM slots 37316.
    37316, 412,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:682
//		ECADR	WHCHREAD		# 49	WHOLE			ARTH
// PORT: Fixed ROM slots 37317.
    37317, 4042,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:683
//		OCT	0			# 50	SPARE
// PORT: Fixed ROM slots 37318.
    37318, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:684
//		OCT	0			# 50 	SPARE
// PORT: Fixed ROM slots 37319.
    37319, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:685
//		OCT	0			# 50	SPARE
// PORT: Fixed ROM slots 37320.
    37320, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:686
//		ECADR	ALPHASB			# 51	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37321.
    37321, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:687
//		ECADR	BETASB			# 51	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37322.
    37322, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:688
//		OCT	0			# 51	SPARE COMPONENT
// PORT: Fixed ROM slots 37323.
    37323, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:689
//		ECADR	ACTCENT			# 52	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37324.
    37324, 2010,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:690
//		OCT	00000			# 52	SPARE COMPONENT
// PORT: Fixed ROM slots 37325.
    37325, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:691
//		OCT	00000			# 52 	SPARE COMPONENT
// PORT: Fixed ROM slots 37326.
    37326, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:692
//		OCT	00000			# 53	SPARE
// PORT: Fixed ROM slots 37327.
    37327, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:693
//		OCT	00000			# 53
// PORT: Fixed ROM slots 37328.
    37328, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:694
//		OCT	00000			# 53
// PORT: Fixed ROM slots 37329.
    37329, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:695
//		ECADR	RANGE			# 54	POS5			DP1
// PORT: Fixed ROM slots 37330.
    37330, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:696
//# Page 315
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:697
//		ECADR	RRATE			# 54	VEL3			DP3
// PORT: Fixed ROM slots 37331.
    37331, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:698
//		ECADR	RTHETA			# 54	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37332.
    37332, 2312,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:699
//		ECADR	NN			# 55	WHOLE			ARTH
// PORT: Fixed ROM slots 37333.
    37333, 3692,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:700
//		ECADR	ELEV			# 55	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37334.
    37334, 2396,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:701
//		ECADR	CENTANG			# 55	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37335.
    37335, 3872,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:702
//		ECADR	RR-AZ			# 56	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37336.
    37336, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:703
//		ECADR	RR-ELEV			# 56	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37337.
    37337, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:704
//		OCT	0			# 56	SPARE COMPONENT
// PORT: Fixed ROM slots 37338.
    37338, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:705
//		ECADR	DELTAR			# 57	POS4			DP3
// PORT: Fixed ROM slots 37339.
    37339, 2436,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:706
//		OCT	0			# 57	SPARE COMPONENT
// PORT: Fixed ROM slots 37340.
    37340, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:707
//		OCT	0			# 57	SPARE COMPONENT
// PORT: Fixed ROM slots 37341.
    37341, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:708
//		ECADR	POSTTPI			# 58	POS4			DP3
// PORT: Fixed ROM slots 37342.
    37342, 3850,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:709
//		ECADR	DELVTPI			# 58	VEL3			DP3
// PORT: Fixed ROM slots 37343.
    37343, 3834,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:710
//		ECADR	DELVTPF			# 58	VEL3			DP3
// PORT: Fixed ROM slots 37344.
    37344, 2510,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:711
//		ECADR	DVLOS			# 59	VEL3			DP3
// PORT: Fixed ROM slots 37345.
    37345, 2436,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:712
//		ECADR	DVLOS +2		# 59	VEL3			DP3
// PORT: Fixed ROM slots 37346.
    37346, 2440,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:713
//		ECADR	DVLOS +4		# 59	VEL3			DP3
// PORT: Fixed ROM slots 37347.
    37347, 2444,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:714
//		ECADR	VHORIZ			# 60	VEL3			DP3
// PORT: Fixed ROM slots 37348.
    37348, 2404,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:715
//		ECADR	HDOTDISP		# 60	VEL3			DP3
// PORT: Fixed ROM slots 37349.
    37349, 3702,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:716
//		ECADR	HCALC			# 60	COMP ALT		DP1
// PORT: Fixed ROM slots 37350.
    37350, 3768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:717
//		ECADR	TTFDISP			# 61	MIN/SEC			M/S
// PORT: Fixed ROM slots 37351.
    37351, 3706,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:718
//		ECADR	TTOGO			# 61	MIN/SEC			M/S
// PORT: Fixed ROM slots 37352.
    37352, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:719
//		ECADR	OUTOFPLN		# 61	POS7			DP4
// PORT: Fixed ROM slots 37353.
    37353, 2860
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:720
//		ECADR	ABVEL			# 62	VEL3			DP3
// PORT: Fixed ROM slots 37354.
    37354, 3698,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:721
//		ECADR	TTOGO			# 62	MIN/SEC			M/S
// PORT: Fixed ROM slots 37355.
    37355, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:722
//		ECADR	DVTOTAL			# 62	VEL3			DP3
// PORT: Fixed ROM slots 37356.
    37356, 3726,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:723
//		ECADR	ABVEL			# 63	VEL3			DP3
// PORT: Fixed ROM slots 37357.
    37357, 3698,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:724
//		ECADR	HDOTDISP		# 63	VEL3			DP3
// PORT: Fixed ROM slots 37358.
    37358, 3702,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:725
//		ECADR	HCALC1			# 63	COMP ALT		DP1
// PORT: Fixed ROM slots 37359.
    37359, 4088,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:726
//		ECADR	FUNNYDSP		# 64 	2INT			2INT
// PORT: Fixed ROM slots 37360.
    37360, 3948,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:727
//		ECADR	HDOTDISP		# 64	VEL3			DP3
// PORT: Fixed ROM slots 37361.
    37361, 3702,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:728
//		ECADR	HCALC			# 64	COMP ALT		DP1
// PORT: Fixed ROM slots 37362.
    37362, 3768,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:729
//		ECADR	SAMPTIME		# 65	HMS (MIXED ONLY TO KEEP CODE 65) HMS
// PORT: Fixed ROM slots 37363.
    37363, 22,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:730
//		ECADR	SAMPTIME		# 65	HMS			HMS
// PORT: Fixed ROM slots 37364.
    37364, 22,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:731
//		ECADR	SAMPTIME		# 65	HMS			HMS
// PORT: Fixed ROM slots 37365.
    37365, 22,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:732
//		ECADR	RSTACK +6		# 66	LANDING RADAR ALT	DP1
// PORT: Fixed ROM slots 37366.
    37366, 2316,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:733
//		OCT	0			# 66	LR POSITION		LRPOS
// PORT: Fixed ROM slots 37367.
    37367, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:734
//		OCT	0			# 66	SPARE COMPONENT
// PORT: Fixed ROM slots 37368.
    37368, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:735
//		ECADR	RSTACK			# 67	LANDING RADAR VELX	DP1
// PORT: Fixed ROM slots 37369.
    37369, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:736
//		ECADR	RSTACK +2		# 67	LANDING RADAR VELY	DP1
// PORT: Fixed ROM slots 37370.
    37370, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:737
//		ECADR	RSTACK +4		# 67	LANDING RADAR VELZ	DP1
// PORT: Fixed ROM slots 37371.
    37371, 2312,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:738
//		ECADR	RANGEDSP		# 68	POS7			DP4
// PORT: Fixed ROM slots 37372.
    37372, 2856,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:739
//		ECADR	TTFDISP			# 68	MIN/SEC			M/S
// PORT: Fixed ROM slots 37373.
    37373, 3706,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:740
//		ECADR	DELTAH			# 68	COMP ALT		DP1
// PORT: Fixed ROM slots 37374.
    37374, 3944,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:741
//		OCT	00000			# 69	SPARE
// PORT: Fixed ROM slots 37375.
    37375, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:742
//		OCT	00000			# 69
// PORT: Fixed ROM slots 37376.
    37376, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:743
//		OCT	00000			# 69
// PORT: Fixed ROM slots 37377.
    37377, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:744
//		ECADR	AOTCODE			# 70	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37378.
    37378, 954,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:745
//		ECADR	AOTCODE +1		# 70 	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37379.
    37379, 956,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:746
//		ECADR	AOTCODE +2		# 70	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37380.
    37380, 958,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:747
//# Page 316
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:748
//		ECADR	AOTCODE			# 71	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37381.
    37381, 954,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:749
//		ECADR	AOTCODE +1		# 71	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37382.
    37382, 956,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:750
//		ECADR	AOTCODE +2		# 71 	OCTAL ONLY		OCT
// PORT: Fixed ROM slots 37383.
    37383, 958,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:751
//		ECADR	CDUT			# 72	360-CDU DEG		360-CDU
// PORT: Fixed ROM slots 37384.
    37384, 58,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:752
//		ECADR	CDUS			# 72	CDU DEG			CDU
// PORT: Fixed ROM slots 37385.
    37385, 60,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:753
//		OCT	0			# 72	SPARE COMPONENT
// PORT: Fixed ROM slots 37386.
    37386, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:754
//		ECADR	TANG			# 73	360-CDU DEG		360-CDU
// PORT: Fixed ROM slots 37387.
    37387, 1166,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:755
//		ECADR	TANG +1			# 73	CDU DEG			CDU
// PORT: Fixed ROM slots 37388.
    37388, 1168,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:756
//		OCT	0			# 73	SPARE COMPONENT
// PORT: Fixed ROM slots 37389.
    37389, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:757
//		ECADR	TTOGO			# 74	MIN/SEC			M/S
// PORT: Fixed ROM slots 37390.
    37390, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:758
//		ECADR	YAW			# 74	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37391.
    37391, 2532,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:759
//		ECADR	PITCH			# 74	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37392.
    37392, 2536,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:760
//		ECADR	DIFFALT			# 75	POS4			DP3
// PORT: Fixed ROM slots 37393.
    37393, 3838,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:761
//		ECADR	T1TOT2			# 75	MIN/SEC
// PORT: Fixed ROM slots 37394.
    37394, 2388,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:762
//		ECADR	T2TOT3			# 75	MIN/SEC			M/S
// PORT: Fixed ROM slots 37395.
    37395, 2392,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:763
//		ECADR	ZDOTD			# 76	VEL3			DP3
// PORT: Fixed ROM slots 37396.
    37396, 2428,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:764
//		ECADR	RDOTD			# 76	VEL3			DP3
// PORT: Fixed ROM slots 37397.
    37397, 2420,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:765
//		ECADR	XRANGE			# 76	POS4			DP3
// PORT: Fixed ROM slots 37398.
    37398, 3908,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:766
//		ECADR	TTOGO			# 77	MIN/SEC			M/S
// PORT: Fixed ROM slots 37399.
    37399, 3670,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:767
//		ECADR	YDOT			# 77 	VEL3			DP3
// PORT: Fixed ROM slots 37400.
    37400, 2448,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:768
//		OCT	0			# 77	SPARE COMPONENT
// PORT: Fixed ROM slots 37401.
    37401, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:769
//		ECADR	RSTACK			# 78 	RR RANGE		DP1
// PORT: Fixed ROM slots 37402.
    37402, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:770
//		ECADR	RSTACK +2		# 78	RR RANGE RATE		DP1
// PORT: Fixed ROM slots 37403.
    37403, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:771
//		OCT	00000			# 78	SPARE COMPONENT
// PORT: Fixed ROM slots 37404.
    37404, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:772
//		ECADR	CURSOR			# 79	CDU DEG			CDU
// PORT: Fixed ROM slots 37405.
    37405, 1340,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:773
//		ECADR	SPIRAL			# 79	CDU DEG			CDU
// PORT: Fixed ROM slots 37406.
    37406, 1344,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:774
//		ECADR	POSCODE			# 79	WHOLE			ARTH
// PORT: Fixed ROM slots 37407.
    37407, 1348,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:775
//		ECADR	DATAGOOD		# 80	WHOLE			ARTH
// PORT: Fixed ROM slots 37408.
    37408, 4022,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:776
//		ECADR	OMEGAD			# 80	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37409.
    37409, 4024,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:777
//		OCT	0			# 80	SPARE COMPONENT
// PORT: Fixed ROM slots 37410.
    37410, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:778
//		ECADR	DELVLVC			# 81	VEL3			DP3
// PORT: Fixed ROM slots 37411.
    37411, 3638,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:779
//		ECADR	DELVLVC +2		# 81	VEL3			DP3
// PORT: Fixed ROM slots 37412.
    37412, 3642,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:780
//		ECADR	DELVLVC +4		# 81	VEL3			DP3
// PORT: Fixed ROM slots 37413.
    37413, 3646,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:781
//		ECADR	DELVLVC			# 82	VEL3			DP3
// PORT: Fixed ROM slots 37414.
    37414, 3638,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:782
//		ECADR	DELVLVC +2		# 82	VEL3			DP3
// PORT: Fixed ROM slots 37415.
    37415, 3642,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:783
//		ECADR	DELVLVC +4		# 82	VEL3			DP3
// PORT: Fixed ROM slots 37416.
    37416, 3646,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:784
//		ECADR	DELVIMU			# 83	VEL3			DP3
// PORT: Fixed ROM slots 37417.
    37417, 3876,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:785
//		ECADR	DELVIMU +2		# 83	VEL3			DP3
// PORT: Fixed ROM slots 37418.
    37418, 3880,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:786
//		ECADR	DELVIMU +4		# 83	VEL3			DP3
// PORT: Fixed ROM slots 37419.
    37419, 3884,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:787
//		ECADR	DELVOV			# 84	VEL3			DP3
// PORT: Fixed ROM slots 37420.
    37420, 2340,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:788
//		ECADR	DELVOV +2		# 84	VEL3			DP3
// PORT: Fixed ROM slots 37421.
    37421, 2344,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:789
//		ECADR	DELVOV +4		# 84	VEL3			DP3
// PORT: Fixed ROM slots 37422.
    37422, 2348,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:790
//		ECADR	VGBODY			# 85	VEL3			DP3
// PORT: Fixed ROM slots 37423.
    37423, 3714,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:791
//		ECADR	VGBODY +2		# 85	VEL3			DP3
// PORT: Fixed ROM slots 37424.
    37424, 3718,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:792
//		ECADR	VGBODY +4		# 85	VEL3			DP3
// PORT: Fixed ROM slots 37425.
    37425, 3722,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:793
//		ECADR	DELVLVC			# 86	VEL3			DP3
// PORT: Fixed ROM slots 37426.
    37426, 3638,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:794
//		ECADR	DELVLVC +2		# 86	VEL3			DP3
// PORT: Fixed ROM slots 37427.
    37427, 3642,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:795
//		ECADR	DELVLVC +4		# 86	VEL3			DP3
// PORT: Fixed ROM slots 37428.
    37428, 3646,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:796
//		ECADR	AZ			# 87	CDU DEG			CDU
// PORT: Fixed ROM slots 37429.
    37429, 1486,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:797
//		ECADR	EL			# 87	CDU DEG			CDU
// PORT: Fixed ROM slots 37430.
    37430, 1488,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:798
//# Page 317
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:799
//		OCT	0			# 87	SPARE COMPONENT
// PORT: Fixed ROM slots 37431.
    37431, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:800
//		ECADR	STARAD			# 88	FRAC			FRAC
// PORT: Fixed ROM slots 37432.
    37432, 2956,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:801
//		ECADR	STARAD +2		# 88	FRAC			FRAC
// PORT: Fixed ROM slots 37433.
    37433, 2960,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:802
//		ECADR	STARAD +4		# 88	FRAC			FRAC
// PORT: Fixed ROM slots 37434.
    37434, 2964,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:803
//		ECADR	LANDLAT			# 89	DPDEG(90)		DP3
// PORT: Fixed ROM slots 37435.
    37435, 2956,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:804
//		ECADR	LANDLONG		# 89	DPDEG(90)		DP3
// PORT: Fixed ROM slots 37436.
    37436, 2960,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:805
//		ECADR	LANDALT			# 89	POS5			DP1
// PORT: Fixed ROM slots 37437.
    37437, 2964,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:806
//		ECADR	RANGE			# 90	POS5			DP1
// PORT: Fixed ROM slots 37438.
    37438, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:807
//		ECADR	RRATE			# 90	VEL3			DP3
// PORT: Fixed ROM slots 37439.
    37439, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:808
//		ECADR	RTHETA			# 90	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37440.
    37440, 2312,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:809
//		ECADR	P21ALT			# 91	POS4			DP3
// PORT: Fixed ROM slots 37441.
    37441, 3994,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:810
//		ECADR	P21VEL			# 91 	VEL2			DP4
// PORT: Fixed ROM slots 37442.
    37442, 3986,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:811
//		ECADR	P21GAM			# 91	DPDEG(360)		DP4
// PORT: Fixed ROM slots 37443.
    37443, 3990,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:812
//		OCT	00000			# 92	SPARE
// PORT: Fixed ROM slots 37444.
    37444, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:813
//		OCT	00000			# 92
// PORT: Fixed ROM slots 37445.
    37445, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:814
//		OCT	00000			# 92
// PORT: Fixed ROM slots 37446.
    37446, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:815
//		ECADR	OGC			# 93	DPDEG(90)		DP3
// PORT: Fixed ROM slots 37447.
    37447, 3006,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:816
//		ECADR	OGC +2			# 93	DPDEG(90)		DP3
// PORT: Fixed ROM slots 37448.
    37448, 3010,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:817
//		ECADR	OGC +4			# 93	DPDEG(90)		DP3
// PORT: Fixed ROM slots 37449.
    37449, 3014,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:818
//		OCT	00000			# 94	SPARE
// PORT: Fixed ROM slots 37450.
    37450, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:819
//		OCT	00000			# 94
// PORT: Fixed ROM slots 37451.
    37451, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:820
//		OCT	00000			# 94
// PORT: Fixed ROM slots 37452.
    37452, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:821
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37453.
    37453, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:822
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37454.
    37454, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:823
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37455.
    37455, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:824
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37456.
    37456, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:825
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37457.
    37457, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:826
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37458.
    37458, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:827
//		ECADR	DSPTEM1			# 97	WHOLE			ARTH
// PORT: Fixed ROM slots 37459.
    37459, 1098,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:828
//		ECADR	DSPTEM1 +1		# 97	WHOLE			ARTH
// PORT: Fixed ROM slots 37460.
    37460, 1100,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:829
//		ECADR	DSPTEM1 +2		# 97	WHOLE			ARTH
// PORT: Fixed ROM slots 37461.
    37461, 1102,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:830
//		ECADR	DSPTEM2			# 98	WHOLE			ARTH
// PORT: Fixed ROM slots 37462.
    37462, 1104,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:831
//		ECADR	DSPTEM2 +1		# 98	FRAC			FRAC
// PORT: Fixed ROM slots 37463.
    37463, 1106,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:832
//		ECADR	DSPTEM2 +2		# 98	WHOLE			ARTH
// PORT: Fixed ROM slots 37464.
    37464, 1108,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:833
//		ECADR	WWPOS			# 99 	POS9			DP3
// PORT: Fixed ROM slots 37465.
    37465, 2304,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:834
//		ECADR	WWVEL			# 99	VEL4			DP2
// PORT: Fixed ROM slots 37466.
    37466, 2308,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:835
//		ECADR	WWBIAS			# 99 	RADIANS			DP4
// PORT: Fixed ROM slots 37467.
    37467, 2312,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:836
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:837
//# END OF IDADDTAB
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:838
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:839
//						# NN	SF ROUTINES
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:840
//RUTMXTAB	OCT	16351			# 40	M/S, DP3, DP3
// PORT: Fixed ROM slots 37468.
    37468, 14802,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:841
//		OCT	00142			# 41	CDU, ARTH
// PORT: Fixed ROM slots 37469.
    37469, 196,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:842
//		OCT	16347			# 42	DP3, DP3, DP3
// PORT: Fixed ROM slots 37470.
    37470, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:843
//		OCT	16512			# 43	DP4, DP4, DP3
// PORT: Fixed ROM slots 37471.
    37471, 14996,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:844
//		OCT	22347			# 44	DP3, DP3, M/S
// PORT: Fixed ROM slots 37472.
    37472, 18894,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:845
//		OCT	24443			# 45	ARTH, M/S, DP4
// PORT: Fixed ROM slots 37473.
    37473, 21062,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:846
//		OCT	00000			# 46	OCT
// PORT: Fixed ROM slots 37474.
    37474, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:847
//		OCT	00553			# 47	ARITH1, ARITH1
// PORT: Fixed ROM slots 37475.
    37475, 726
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:848
//# Page 318
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:849
//		OCT	00143			# 48	ARTH, ARTH
// PORT: Fixed ROM slots 37476.
    37476, 198,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:850
//		OCT	06347			# 49	DP3, DP3, ARTH
// PORT: Fixed ROM slots 37477.
    37477, 6606,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:851
//		OCT	0			# 50	SPARE
// PORT: Fixed ROM slots 37478.
    37478, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:852
//		OCT	00512			# 51	DP4, DP4
// PORT: Fixed ROM slots 37479.
    37479, 660,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:853
//		OCT	00012			# 52	DP4
// PORT: Fixed ROM slots 37480.
    37480, 20,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:854
//		OCT	00000			# 53 	SPARE
// PORT: Fixed ROM slots 37481.
    37481, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:855
//		OCT	24344			# 54	DP1, DP3, DP4
// PORT: Fixed ROM slots 37482.
    37482, 20936,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:856
//		OCT	24503			# 55	ARTH, DP4, DP4
// PORT: Fixed ROM slots 37483.
    37483, 21126,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:857
//		OCT	00512			# 56	DP4, DP4
// PORT: Fixed ROM slots 37484.
    37484, 660,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:858
//		OCT	00007			# 57	DP3
// PORT: Fixed ROM slots 37485.
    37485, 14,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:859
//		OCT	16347			# 58	DP3, DP3, DP3
// PORT: Fixed ROM slots 37486.
    37486, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:860
//		OCT	16347			# 59	DP3, DP3, DP3
// PORT: Fixed ROM slots 37487.
    37487, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:861
//		OCT	10347			# 60	DP3, DP3, DP1
// PORT: Fixed ROM slots 37488.
    37488, 8654,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:862
//		OCT	24451			# 61	M/S, M/S, DP4
// PORT: Fixed ROM slots 37489.
    37489, 21074,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:863
//		OCT	16447			# 62	DP3, M/S, DP3
// PORT: Fixed ROM slots 37490.
    37490, 14926,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:864
//		OCT	10347			# 63	DP3, DP3, DP1
// PORT: Fixed ROM slots 37491.
    37491, 8654,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:865
//		OCT	10354			# 64	2INT, DP3, DP1
// PORT: Fixed ROM slots 37492.
    37492, 8664,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:866
//		OCT	20410			# 65	HMS, HMS, HMS
// PORT: Fixed ROM slots 37493.
    37493, 16912,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:867
//		OCT	00304			# 66	DP1, LRPOS
// PORT: Fixed ROM slots 37494.
    37494, 392,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:868
//		OCT	10204			# 67	DP1, DP1, DP1
// PORT: Fixed ROM slots 37495.
    37495, 8456,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:869
//		OCT	10452			# 68	DP4, M/S, DP1
// PORT: Fixed ROM slots 37496.
    37496, 8788,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:870
//		OCT	00000			# 69	SPARE
// PORT: Fixed ROM slots 37497.
    37497, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:871
//		OCT	0			# 70	OCT, OCT, OCT
// PORT: Fixed ROM slots 37498.
    37498, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:872
//		OCT	0			# 71	OCT, OCT, OCT
// PORT: Fixed ROM slots 37499.
    37499, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:873
//		OCT	00115			# 72	360-CDU, CDU
// PORT: Fixed ROM slots 37500.
    37500, 154,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:874
//		OCT	00115			# 73	360-CDU, CDU
// PORT: Fixed ROM slots 37501.
    37501, 154,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:875
//		OCT	24511			# 74	M/S, DP4, DP4
// PORT: Fixed ROM slots 37502.
    37502, 21138,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:876
//		OCT	22447			# 75	DP3, M/S, M/S
// PORT: Fixed ROM slots 37503.
    37503, 19022,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:877
//		OCT	16347			# 76	DP3, DP3, DP3
// PORT: Fixed ROM slots 37504.
    37504, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:878
//		OCT	00351			# 77	M/S, DP3
// PORT: Fixed ROM slots 37505.
    37505, 466,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:879
//		OCT	00204			# 78	DP1, DP1
// PORT: Fixed ROM slots 37506.
    37506, 264,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:880
//		OCT	06102			# 79	CDU, CDU, ARTH
// PORT: Fixed ROM slots 37507.
    37507, 6276,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:881
//		OCT	00503			# 80	ARTH, DP4
// PORT: Fixed ROM slots 37508.
    37508, 646,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:882
//		OCT	16347			# 81	DP3, DP3, DP3
// PORT: Fixed ROM slots 37509.
    37509, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:883
//		OCT	16347			# 82	DP3, DP3, DP3
// PORT: Fixed ROM slots 37510.
    37510, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:884
//		OCT	16347			# 83	DP3, DP3, DP3
// PORT: Fixed ROM slots 37511.
    37511, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:885
//		OCT	16347			# 84	DP3, DP3, DP3
// PORT: Fixed ROM slots 37512.
    37512, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:886
//		OCT	16347			# 85	DP3, DP3, DP3
// PORT: Fixed ROM slots 37513.
    37513, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:887
//		OCT	16347			# 86	DP3, DP3, DP3
// PORT: Fixed ROM slots 37514.
    37514, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:888
//		OCT	00102			# 87	CDU, CDU
// PORT: Fixed ROM slots 37515.
    37515, 132,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:889
//		OCT	02041			# 88	FRAC FOR EACH
// PORT: Fixed ROM slots 37516.
    37516, 2114,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:890
//		OCT	10347			# 89	DP3, DP3, DP1
// PORT: Fixed ROM slots 37517.
    37517, 8654,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:891
//		OCT	24344			# 90	DP1, DP3, DP4
// PORT: Fixed ROM slots 37518.
    37518, 20936,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:892
//		OCT	24507			# 91	DP3, DP4, DP4
// PORT: Fixed ROM slots 37519.
    37519, 21134,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:893
//		OCT	00000			# 92	SPARE
// PORT: Fixed ROM slots 37520.
    37520, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:894
//		OCT	16347			# 93	DP3, DP3, DP3
// PORT: Fixed ROM slots 37521.
    37521, 14798,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:895
//		OCT	00000			# 94	SPARE
// PORT: Fixed ROM slots 37522.
    37522, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:896
//		OCT	0			# 95	SPARE
// PORT: Fixed ROM slots 37523.
    37523, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:897
//		OCT	0			# 96	SPARE
// PORT: Fixed ROM slots 37524.
    37524, 0,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:898
//		OCT	06143			# 97	ARTH, ARTH, ARTH
// PORT: Fixed ROM slots 37525.
    37525, 6342,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:899
//# Page 319
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:900
//		OCT	06043			# 98	ARTH, FRAC, ARTH
// PORT: Fixed ROM slots 37526.
    37526, 6214,
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:901
//		OCT	24247			# 99	DP3, DP2, DP4
// PORT: Fixed ROM slots 37527.
    37527, 20814
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:902
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:903
//# END OF RUTMXTAB
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:904
//
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:905
//		SBANK=	LOWSUPER
// PORT: SOURCE PINBALL_NOUN_TABLES.agc:906
//
