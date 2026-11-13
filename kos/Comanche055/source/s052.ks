// PINBALL_NOUN_TABLES.agc
// bank 42, slots 36914-36915
function agcAotUnit2165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36914 {
// PINBALL_NOUN_TABLES.agc:1
//# Copyright:	Public domain.
// PINBALL_NOUN_TABLES.agc:2
//# Filename:	PINBALL_NOUN_TABLES.agc
// PINBALL_NOUN_TABLES.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// PINBALL_NOUN_TABLES.agc:4
//#		is part of the source code for the Command Module's
// PINBALL_NOUN_TABLES.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// PINBALL_NOUN_TABLES.agc:6
//# Assembler:	yaYUL
// PINBALL_NOUN_TABLES.agc:7
//# Reference:	pp. 268-284
// PINBALL_NOUN_TABLES.agc:8
//# Contact:	Burkey Kerman <info@sandroid.org>,
// PINBALL_NOUN_TABLES.agc:9
//#  		Bernardini Kerman <fabrizio@spacecraft.it>
// PINBALL_NOUN_TABLES.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PINBALL_NOUN_TABLES.agc:11
//# Mod history:	2009-05-18 FB	Transcription Batch 3 Assignment.
// PINBALL_NOUN_TABLES.agc:12
//#		2009-05-23 RSB	In NNTYPTAB, corrected former 13 SPARE.
// PINBALL_NOUN_TABLES.agc:13
//#
// PINBALL_NOUN_TABLES.agc:14
//# The contents of the "Comanche055" files, in general, are transcribed
// PINBALL_NOUN_TABLES.agc:15
//# from scanned documents.
// PINBALL_NOUN_TABLES.agc:16
//#
// PINBALL_NOUN_TABLES.agc:17
//#	Assemble revision 055 of AGC program Comanche by NASA
// PINBALL_NOUN_TABLES.agc:18
//#	2021113-051.  April 1, 1969.
// PINBALL_NOUN_TABLES.agc:19
//#
// PINBALL_NOUN_TABLES.agc:20
//#	This AGC program shall also be referred to as Colossus 2A
// PINBALL_NOUN_TABLES.agc:21
//#
// PINBALL_NOUN_TABLES.agc:22
//#	Prepared by
// PINBALL_NOUN_TABLES.agc:23
//#			Massachusetts Institute of Technology
// PINBALL_NOUN_TABLES.agc:24
//#			75 Cambridge Parkway
// PINBALL_NOUN_TABLES.agc:25
//#			Cambridge, Massachusetts
// PINBALL_NOUN_TABLES.agc:26
//#
// PINBALL_NOUN_TABLES.agc:27
//#	under NASA contract NAS 9-4065.
// PINBALL_NOUN_TABLES.agc:28
//#
// PINBALL_NOUN_TABLES.agc:29
//# Refer directly to the online document mentioned above for further
// PINBALL_NOUN_TABLES.agc:30
//# information.  Please report any errors to info@sandroid.org.
// PINBALL_NOUN_TABLES.agc:31
//
// PINBALL_NOUN_TABLES.agc:32
//# Page 268
// PINBALL_NOUN_TABLES.agc:33
//# THE FOLLOWING REFERS TO THE NOUN TABLES
// PINBALL_NOUN_TABLES.agc:34
//
// PINBALL_NOUN_TABLES.agc:35
//
// PINBALL_NOUN_TABLES.agc:36
//# COMPONENT CODE NUMBER		INTERPRETATION
// PINBALL_NOUN_TABLES.agc:37
//
// PINBALL_NOUN_TABLES.agc:38
//# 00000				1 COMPONENT
// PINBALL_NOUN_TABLES.agc:39
//# 00001				2 COMPONENT
// PINBALL_NOUN_TABLES.agc:40
//# 00010				3 COMPONENT
// PINBALL_NOUN_TABLES.agc:41
//# X1XXX				BIT 4 = 1. DECIMAL ONLY
// PINBALL_NOUN_TABLES.agc:42
//# 1XXXX				BIT 5 = 1. NO LOAD
// PINBALL_NOUN_TABLES.agc:43
//# END OF COMPONENT CODE NUMBERS
// PINBALL_NOUN_TABLES.agc:44
//
// PINBALL_NOUN_TABLES.agc:45
//
// PINBALL_NOUN_TABLES.agc:46
//# SF ROUTINE CODE NUMBER	INTERPRETATION
// PINBALL_NOUN_TABLES.agc:47
//
// PINBALL_NOUN_TABLES.agc:48
//# 00000		OCTAL ONLY
// PINBALL_NOUN_TABLES.agc:49
//# 00001		STRAIGHT FRACTIONAL
// PINBALL_NOUN_TABLES.agc:50
//# 00010		CDU DEGREES (XXX.XX)
// PINBALL_NOUN_TABLES.agc:51
//# 00011		ARITHMETIC SF
// PINBALL_NOUN_TABLES.agc:52
//# 00100		ARITH DP1	OUT(MULT BY 2EXP14 AT END)	IN(STRAIGHT)
// PINBALL_NOUN_TABLES.agc:53
//# 00101		ARITH DP2	OUT(STRAIGHT)			IN(SL 7 AT END)
// PINBALL_NOUN_TABLES.agc:54
//# 00110		Y OPTICS DEGREES (XX.XXX MAX 89.999)
// PINBALL_NOUN_TABLES.agc:55
//# 00111		ARITH DP3	OUT ( SL 7 AT END)		IN ( STRAIGHT)
// PINBALL_NOUN_TABLES.agc:56
//# 01000		WHOLE HOURS IN R1, WHOLE MINUTES (MOD 60) IN R2,
// PINBALL_NOUN_TABLES.agc:57
//#			SECONDS (MOD 60) 0XX.XX IN R3. *** ALARMS IF USED WITH OCTAL
// PINBALL_NOUN_TABLES.agc:58
//# 01001		MINUTES (MOD 60) IN D1D2, D3 BLANK, SECONDS (MOD 60) IN D4D5
// PINBALL_NOUN_TABLES.agc:59
//#				LIMITS TO 59B59 IF MAG EXCEEDS THIS VALUE.
// PINBALL_NOUN_TABLES.agc:60
//#				ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PINBALL_NOUN_TABLES.agc:61
//# 01010		ARITH DP4	OUT (STRAIGHT)			IN (SL 3 AT END)
// PINBALL_NOUN_TABLES.agc:62
//# 01011		ARITH1 SF	OUT(MULT BY 2EXP14 AT END)	IN(STRAIGHT)
// PINBALL_NOUN_TABLES.agc:63
//# 01100		2 INTEGERS IN D1D2, D4D5, D3 BLANK.
// PINBALL_NOUN_TABLES.agc:64
//#				ALARMS IF USED WITH OCTAL ******** IN (ALARM)
// PINBALL_NOUN_TABLES.agc:65
//# 01101	DP STRAIGHT FRACTIONAL
// PINBALL_NOUN_TABLES.agc:66
//# END OF SF ROUTINE CODE NUMBERS
// PINBALL_NOUN_TABLES.agc:67
//
// PINBALL_NOUN_TABLES.agc:68
//
// PINBALL_NOUN_TABLES.agc:69
//# 	SF CONSTANT CODE NUMBER	INTERPRETATION
// PINBALL_NOUN_TABLES.agc:70
//
// PINBALL_NOUN_TABLES.agc:71
//#	00000			WHOLE				USE ARITH
// PINBALL_NOUN_TABLES.agc:72
//#	00000			DP TIME SEC (XXX.XX SEC)	USE ARITHDP1
// PINBALL_NOUN_TABLES.agc:73
//#	00001			SPARE
// PINBALL_NOUN_TABLES.agc:74
//#	00010			CDU DEGREES		     USE CDU DEGREES
// PINBALL_NOUN_TABLES.agc:75
//#	00010			Y OPTICS DEGREES	USE Y OPTICS DEGREES
// PINBALL_NOUN_TABLES.agc:76
//#	00011			DP DEGREES (90) XX.XXX DEG	USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:77
//#	00100			DP DEGREES (360) XXX.XX DEG	USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:78
//#	00101			DEGREES (180) XXX.XX DEG	USE ARITH
// PINBALL_NOUN_TABLES.agc:79
//#	00110			WEIGHT2 (XXXXX. LBS)		USE ARITH1
// PINBALL_NOUN_TABLES.agc:80
//#	00111			POSITION5 (XXX.XX NAUTICAL MILES)
// PINBALL_NOUN_TABLES.agc:81
//#								USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:82
//#	01000			POSITION4 (XXXX.X NAUTICAL MILES)
// PINBALL_NOUN_TABLES.agc:83
//# Page 269
// PINBALL_NOUN_TABLES.agc:84
//#							    USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:85
//#	01001			VELOCITY2 (XXXXX. FT/SEC)   USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:86
//#	01010			VELOCITY3 (XXXX.X FT/SEC)   USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:87
//#	01011			ELEVATION DEGREES (89.999MAX) USE ARITH
// PINBALL_NOUN_TABLES.agc:88
//#	01100			TRIM DEGREES (XXX.XX DEG)    USE ARITH
// PINBALL_NOUN_TABLES.agc:89
//#	01101			INERTIA (XXXXXBB. SLUG FT FT)  USE ARITH
// PINBALL_NOUN_TABLES.agc:90
//#	01101			THRUST MOMENT (XXXXXBB.FT LBS) USE ARITH
// PINBALL_NOUN_TABLES.agc:91
//#	01110			VELOCITY/2VS (XXXXX. FT/SEC)USE ARITHDP4
// PINBALL_NOUN_TABLES.agc:92
//#	01111			POSITION6 (XXXX.X NAUT MI)  USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:93
//#	10000			DRAG ACCELERATION (XXX.XX G)USE ARITHDP2
// PINBALL_NOUN_TABLES.agc:94
//#	10001			POSITION8 (XXXX.X NAUT MI)  USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:95
//#	10010			POSITION9 (XXXXX. FT)	    USE ARITHDP3
// PINBALL_NOUN_TABLES.agc:96
//#	10011			VELOCITY4 (XXXX.X FT/SEC)   USE ARITHDP2
// PINBALL_NOUN_TABLES.agc:97
//# 	END OF SF CONSTANT CODE NUMBERS
// PINBALL_NOUN_TABLES.agc:98
//
// PINBALL_NOUN_TABLES.agc:99
//
// PINBALL_NOUN_TABLES.agc:100
//# FOR GREATER THAN SINGLE PRECISION SCALES, PUT ADDRESS IN MAJOR PART INTO
// PINBALL_NOUN_TABLES.agc:101
//# NOUN TABLES.
// PINBALL_NOUN_TABLES.agc:102
//# OCTAL LOADS PLACE +0 INTO MAJOR PART, DATA INTO MINOR PART.
// PINBALL_NOUN_TABLES.agc:103
//# OCTAL DISPLAYS SHOW MINOR PART ONLY.
// PINBALL_NOUN_TABLES.agc:104
//# TO GET AT BOTH MAJOR AND MINOR PARTS(IN OCTAL), USE NOUN 01.
// PINBALL_NOUN_TABLES.agc:105
//
// PINBALL_NOUN_TABLES.agc:106
//
// PINBALL_NOUN_TABLES.agc:107
//# A NOUN MAY BE DECLARED :DECIMAL ONLY: BY MAKING BIT4=1 OF ITS COMPONENT
// PINBALL_NOUN_TABLES.agc:108
//# CODE NUMBER.  IF THIS NOUN IS USED WITH ANY OCTAL DISPLAY VERB, OR IF
// PINBALL_NOUN_TABLES.agc:109
//# DATA IS LOADED IN OCTAL, IT ALARMS.
// PINBALL_NOUN_TABLES.agc:110
//
// PINBALL_NOUN_TABLES.agc:111
//# IN LOADING AN :HOURS, MINUTES, SECONDS: NOUN, ALL 3 WORDS MUST BE
// PINBALL_NOUN_TABLES.agc:112
//# LOADED, OR ALARM.
// PINBALL_NOUN_TABLES.agc:113
//# ALARM IF AN ATTEMPT IS MADE TO LOAD :SPLIT MINUTES/SECONDS: (MMBSS).
// PINBALL_NOUN_TABLES.agc:114
//# THIS IS USED FOR DISPLAY ONLY.
// PINBALL_NOUN_TABLES.agc:115
//
// PINBALL_NOUN_TABLES.agc:116
//# Page 270
// PINBALL_NOUN_TABLES.agc:117
//# THE FOLLOWING ROUTINES ARE FOR READING THE NOUN TABLES AND THE SF TABLES
// PINBALL_NOUN_TABLES.agc:118
//# (WHICH ARE IN A SEPARATE BANK FROM THE REST OF PINBALL).  THESE READING
// PINBALL_NOUN_TABLES.agc:119
//# ROUTINES ARE IN THE SAME BANK AS THE TABLES.  THEY ARE CALLED BY DXCH Z.
// PINBALL_NOUN_TABLES.agc:120
//
// PINBALL_NOUN_TABLES.agc:121
//
// PINBALL_NOUN_TABLES.agc:122
//# LODNNTAB LOADS NNADTEM WITH THE NNADTAB ENTRY, NNTYPTEM WITH THE
// PINBALL_NOUN_TABLES.agc:123
//# NNTYPTAB ENTRY.  IF THE NOUN IS MIXED, IDADITEM IS LOADED WITH THE FIRST
// PINBALL_NOUN_TABLES.agc:124
//# IDADDTAB ENTRY, IDAD2TEM THE SECOND IDADDTAB ENTRY, IDAD3TEM THE THIRD
// PINBALL_NOUN_TABLES.agc:125
//# IDADDTAB ENTRY, RUTMXTEM WITH THE RUTMXTAB ENTRY.  MIXBR IS SET FOR
// PINBALL_NOUN_TABLES.agc:126
//# MIXED OR NORMAL NOUN.
// PINBALL_NOUN_TABLES.agc:127
//
// PINBALL_NOUN_TABLES.agc:128
//		BANK	06
// PINBALL_NOUN_TABLES.agc:129
//		SETLOC	PINBALL3
// PINBALL_NOUN_TABLES.agc:130
//		BANK
// PINBALL_NOUN_TABLES.agc:131
//
// PINBALL_NOUN_TABLES.agc:132
//		COUNT	42/NOUNS
// PINBALL_NOUN_TABLES.agc:133
//
// PINBALL_NOUN_TABLES.agc:134
//LODNNTAB	DXCH	IDAD2TEM		# SAVE RETURN INFO IN IDAD2TEM, IDAD3TEM.
// slot 36914
        if slot <> 36914 or instruction <> 21610 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PINBALL_NOUN_TABLES.agc:135
//		INDEX	NOUNREG
// slot 36915
        if slot <> 36915 or instruction <> 20994 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2165] to agcAotUnit2165@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:136
//		CAF	NNADTAB
// slot 36916
    36916, 26806
)).

// bank 42, slots 36917-36918
function agcAotUnit2166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36917 {
// PINBALL_NOUN_TABLES.agc:137
//		TS	NNADTEM
// slot 36917
        if slot <> 36917 or instruction <> 22630 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22630, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PINBALL_NOUN_TABLES.agc:138
//		INDEX	NOUNREG
// slot 36918
        if slot <> 36918 or instruction <> 20994 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2166] to agcAotUnit2166@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:139
//		CAF	NNTYPTAB
// slot 36919
    36919, 27006
)).

// bank 42, slots 36920-36930
function agcAotUnit2167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36924 {
        if slot <= 36921 {
            if slot <= 36920 {
// PINBALL_NOUN_TABLES.agc:140
//		TS	NNTYPTEM
// slot 36920
                if slot <> 36920 or instruction <> 22631 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22631, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:141
//		CS	NOUNREG
// slot 36921
                if slot <> 36921 or instruction <> 16898 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 514).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36922 {
// PINBALL_NOUN_TABLES.agc:142
//		AD	MIXCON
// slot 36922
                if slot <> 36922 or instruction <> 27163 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36923 {
// PINBALL_NOUN_TABLES.agc:143
//		EXTEND
// slot 36923
                    if slot <> 36923 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:144
//		BZMF	LODMIXNN		# NOUN NUMBER G/E FIRST MIXED NOUN
// slot 36924
                    if slot <> 36924 or instruction <> 25664 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25664, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 36927 {
            if slot <= 36925 {
// PINBALL_NOUN_TABLES.agc:145
//		CAF	ONE			# NOUN NUMBER L/ FIRST MIXED NOUN
// slot 36925
                if slot <> 36925 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36926 {
// PINBALL_NOUN_TABLES.agc:146
//		TS	MIXBR			# NORMAL.  +1 INTO MIXBR.
// slot 36926
                    if slot <> 36926 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:147
//		TC	LODNLV
// slot 36927
                    if slot <> 36927 or instruction <> 1102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1102, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 36928 {
// PINBALL_NOUN_TABLES.agc:148
//LODMIXNN	CAF	TWO			# MIXED.  +2 INTO MIXBR.
// slot 36928
                if slot <> 36928 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36929 {
// PINBALL_NOUN_TABLES.agc:149
//		TS	MIXBR
// slot 36929
                    if slot <> 36929 or instruction <> 22624 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22624, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PINBALL_NOUN_TABLES.agc:150
//		INDEX	NOUNREG
// slot 36930
                    if slot <> 36930 or instruction <> 20994 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2167] to agcAotUnit2167@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:151
//		CAF	RUTMXTAB -40D		# FIRST MIXED NOUN = 40.
// slot 36931
    36931, 27646
)).

// bank 42, slots 36932-36936
function agcAotUnit2168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36933 {
        if slot <= 36932 {
// PINBALL_NOUN_TABLES.agc:152
//		TS	RUTMXTEM
// slot 36932
            if slot <> 36932 or instruction <> 22635 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22635, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:153
//		CAF	LOW10
// slot 36933
            if slot <> 36933 or instruction <> 14892 { return choose false if checkOnly else -1. }
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
        if slot <= 36934 {
// PINBALL_NOUN_TABLES.agc:154
//		MASK	NNADTEM
// slot 36934
            if slot <> 36934 or instruction <> 28774 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 102).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36935 {
// PINBALL_NOUN_TABLES.agc:155
//		TS	Q			# TEMP
// slot 36935
                if slot <> 36935 or instruction <> 22530 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22530, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:156
//		INDEX	A
// slot 36936
                if slot <> 36936 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2168] to agcAotUnit2168@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:157
//		CAF	IDADDTAB
// slot 36937
    36937, 27366
)).

// bank 42, slots 36938-36940
function agcAotUnit2169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36938 {
// PINBALL_NOUN_TABLES.agc:158
//		TS	IDAD1TEM		# LOAD IDAD1TEM	WITH FIRST IDADDTAB ENTRY
// slot 36938
        if slot <> 36938 or instruction <> 22632 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22632, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 36939 {
// PINBALL_NOUN_TABLES.agc:159
//		EXTEND
// slot 36939
            if slot <> 36939 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:160
//		INDEX	Q			# LOAD IDAD2TEM WITH 2ND IDADDTAB ENTRY
// slot 36940
            if slot <> 36940 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2169] to agcAotUnit2169@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:161
//		DCA	IDADDTAB +1		# LOAD IDAD3TEM WITH 3RD IDADDTAB ENTRY.
// slot 36941
    36941, 27370
)).

// bank 42, slots 36942-36946
function agcAotUnit2170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36943 {
        if slot <= 36942 {
// PINBALL_NOUN_TABLES.agc:162
//LODNLV		DXCH	IDAD2TEM		# PUT RETURN INFO INTO A, L.
// slot 36942
            if slot <> 36942 or instruction <> 21610 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:163
//		DXCH	Z
// slot 36943
            if slot <> 36943 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36944 {
// PINBALL_NOUN_TABLES.agc:164
//
// PINBALL_NOUN_TABLES.agc:165
//MIXCON		=	OCT50			# FIRST MIXED NOUN =40.  (DEC 40)
// PINBALL_NOUN_TABLES.agc:166
//
// PINBALL_NOUN_TABLES.agc:167
//# GTSFOUT LOADS SFTEMP1, SFTEMP2 WITH THE DP SFOUTAB ENTRIES.
// PINBALL_NOUN_TABLES.agc:168
//# Page 271
// PINBALL_NOUN_TABLES.agc:169
//
// PINBALL_NOUN_TABLES.agc:170
//GTSFOUT		DXCH	SFTEMP1			# 2X(SFCONUM) ARRIVES IN SFTEMP1.
// slot 36944
            if slot <> 36944 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36945 {
// PINBALL_NOUN_TABLES.agc:171
//		EXTEND
// slot 36945
                if slot <> 36945 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:172
//		INDEX	A
// slot 36946
                if slot <> 36946 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2170] to agcAotUnit2170@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:173
//		DCA	SFOUTAB
// slot 36947
    36947, 27288
)).

// bank 42, slots 36948-36952
function agcAotUnit2171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36949 {
        if slot <= 36948 {
// PINBALL_NOUN_TABLES.agc:174
//SFCOM		DXCH	SFTEMP1
// slot 36948
            if slot <> 36948 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PINBALL_NOUN_TABLES.agc:175
//		DXCH	Z
// slot 36949
            if slot <> 36949 or instruction <> 21510 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36950 {
// PINBALL_NOUN_TABLES.agc:176
//
// PINBALL_NOUN_TABLES.agc:177
//# GTSFIN LOADS SFTEMP1, SFTEMP2 WITH THE DP SFINTAB ENTRIES.
// PINBALL_NOUN_TABLES.agc:178
//
// PINBALL_NOUN_TABLES.agc:179
//GTSFIN		DXCH	SFTEMP1			# 2X(SFCONUM) ARIVES IN SFTEMP1.
// slot 36950
            if slot <> 36950 or instruction <> 21588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 84, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36951 {
// PINBALL_NOUN_TABLES.agc:180
//		EXTEND
// slot 36951
                if slot <> 36951 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PINBALL_NOUN_TABLES.agc:181
//		INDEX	A
// slot 36952
                if slot <> 36952 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2171] to agcAotUnit2171@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:182
//		DCA	SFINTAB
// slot 36953
    36953, 27208
)).

// bank 42, slots 36954-36954
function agcAotUnit2172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PINBALL_NOUN_TABLES.agc:183
//		TCF	SFCOM
// slot 36954
    if slot <> 36954 or instruction <> 5204 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5204, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2172] to agcAotUnit2172@.

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:184
//
// PINBALL_NOUN_TABLES.agc:185
//						# NN 	 NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:186
//NNADTAB		OCT	00000			# 00 	NOT IN USE
// slot 36955
    36955, 0,
// PINBALL_NOUN_TABLES.agc:187
//		OCT	40000			# 01 	SPECIFY MACHINE ADDRESS (FRACTIONAL)
// slot 36956
    36956, 32768,
// PINBALL_NOUN_TABLES.agc:188
//		OCT	40000			# 02 	SPECIFY MACHINE ADDRESS (WHOLE)
// slot 36957
    36957, 32768,
// PINBALL_NOUN_TABLES.agc:189
//		OCT	40000			# 03	SPECIFY MACHINE ADDRESS (DEGREES)
// slot 36958
    36958, 32768,
// PINBALL_NOUN_TABLES.agc:190
//		OCT	0			# 04	SPARE
// slot 36959
    36959, 0,
// PINBALL_NOUN_TABLES.agc:191
//		ECADR	DSPTEM1			# 05 	ANGULAR ERROR/DIFFERENCE
// slot 36960
    36960, 1098,
// PINBALL_NOUN_TABLES.agc:192
//		ECADR	OPTION1			# 06	OPTION CODE
// slot 36961
    36961, 1202,
// PINBALL_NOUN_TABLES.agc:193
//		ECADR	XREG			# 07	ECADR OF WORD TO BE MODIFIED
// slot 36962
    36962, 1030,
// PINBALL_NOUN_TABLES.agc:194
//						#	ONES FOR BITS TO BE MODIFIED
// PINBALL_NOUN_TABLES.agc:195
//						#	1 TO SET OR 0 TO RESET SELECTED BITS
// PINBALL_NOUN_TABLES.agc:196
//		ECADR	ALMCADR			# 08 	ALARM DATA
// slot 36963
    36963, 1510,
// PINBALL_NOUN_TABLES.agc:197
//		ECADR	FAILREG			# 09	ALARM CODES
// slot 36964
    36964, 506,
// PINBALL_NOUN_TABLES.agc:198
//		OCT	77776			# 10	CHANNEL TO BE SPECIFIED
// slot 36965
    36965, 65532,
// PINBALL_NOUN_TABLES.agc:199
//		ECADR	TCSI			# 11	TIG OF CSI (HRS,MIN,SEC)
// slot 36966
    36966, 2876,
// PINBALL_NOUN_TABLES.agc:200
//		ECADR	OPTIONX			# 12	OPTION CODE
// slot 36967
    36967, 1106,
// PINBALL_NOUN_TABLES.agc:201
//						#	   (USED BY EXTENDED VERBS ONLY)
// PINBALL_NOUN_TABLES.agc:202
//		ECADR	TCDH			# 13	TIG OF CDH (HRS,MIN,SEC)
// slot 36968
    36968, 2872,
// PINBALL_NOUN_TABLES.agc:203
//		OCT	0			# 14	SPARE
// slot 36969
    36969, 0,
// PINBALL_NOUN_TABLES.agc:204
//		OCT	77777			# 15	INCREMENT MACHINE ADDRESS
// slot 36970
    36970, 65534,
// PINBALL_NOUN_TABLES.agc:205
//		ECADR	DSPTEMX			# 16	TIME OF EVENT (HRS,MIN,SEC)
// slot 36971
    36971, 1106,
// PINBALL_NOUN_TABLES.agc:206
//		ECADR	CPHIX			# 17	VAL TOTAL ATTITUDE
// slot 36972
    36972, 1462,
// PINBALL_NOUN_TABLES.agc:207
//		ECADR	THETAD			# 18	AUTO MANEUVER BALL ANGLES
// slot 36973
    36973, 1242,
// PINBALL_NOUN_TABLES.agc:208
//		ECADR	THETAD			# 19	BYPASS ATTITUDE TRIM MANEUVER
// slot 36974
    36974, 1242,
// PINBALL_NOUN_TABLES.agc:209
//		ECADR	CDUX			# 20	ICDU ANGLES
// slot 36975
    36975, 52,
// PINBALL_NOUN_TABLES.agc:210
//		ECADR	PIPAX			# 21	PIPAS
// slot 36976
    36976, 62,
// PINBALL_NOUN_TABLES.agc:211
//		ECADR	THETAD			# 22	NEW ICDU ANGLES
// slot 36977
    36977, 1242,
// PINBALL_NOUN_TABLES.agc:212
//		OCT	00000			# 23	SPARE
// slot 36978
    36978, 0,
// PINBALL_NOUN_TABLES.agc:213
//		ECADR	DSPTEM2 +1		# 24	DELTA TIME FOR AGC CLOCK(HRS,MIN,SEC)
// slot 36979
    36979, 1106,
// PINBALL_NOUN_TABLES.agc:214
//		ECADR	DSPTEM1			# 25	CHECKLIST
// slot 36980
    36980, 1098,
// PINBALL_NOUN_TABLES.agc:215
//						#	   (USED WITH PLEASE PERFORM ONLY)
// PINBALL_NOUN_TABLES.agc:216
//		ECADR	DSPTEM1			# 26	PRIO/DELAY, ADRES, BBCON
// slot 36981
    36981, 1098,
// PINBALL_NOUN_TABLES.agc:217
//		ECADR	SMODE			# 27	SELF TEST ON/OFF SWITCH
// slot 36982
    36982, 1508,
// PINBALL_NOUN_TABLES.agc:218
//# Page 272
// PINBALL_NOUN_TABLES.agc:219
//		OCT	0			# 28	SPARE
// slot 36983
    36983, 0,
// PINBALL_NOUN_TABLES.agc:220
//		ECADR	DSPTEM1			# 29	XSM LAUNCH AZIMUTH
// slot 36984
    36984, 1098,
// PINBALL_NOUN_TABLES.agc:221
//		ECADR	DSPTEM1			# 30	TARGET CODES
// slot 36985
    36985, 1098,
// PINBALL_NOUN_TABLES.agc:222
//		ECADR	DSPTEM1			# 31	TIME OF LANDING SITE (HRS,MIN,SEC)
// slot 36986
    36986, 1098,
// PINBALL_NOUN_TABLES.agc:223
//		ECADR	-TPER			# 32	TIME TO PERIGEE (HRS,MIN,SEC)
// slot 36987
    36987, 2506,
// PINBALL_NOUN_TABLES.agc:224
//		ECADR	TIG			# 33	TIME OF IGNITION (HRS,MIN,SEC)
// slot 36988
    36988, 3604,
// PINBALL_NOUN_TABLES.agc:225
//		ECADR	DSPTEM1			# 34	TIME OF EVENT (HRS,MIN,SEC)
// slot 36989
    36989, 1098,
// PINBALL_NOUN_TABLES.agc:226
//		ECADR	TTOGO			# 35	TIME TO GO TO EVENT (HRS,MIN,SEC)
// slot 36990
    36990, 3936,
// PINBALL_NOUN_TABLES.agc:227
//		ECADR	TIME2			# 36	TIME OF AGC CLOCK (HRS,MIN,SEC)
// slot 36991
    36991, 40,
// PINBALL_NOUN_TABLES.agc:228
//		ECADR	TTPI			# 37	TIG OF TPI (HRS,MIN,SEC)
// slot 36992
    36992, 3940,
// PINBALL_NOUN_TABLES.agc:229
//		ECADR	TET			# 38	TIME OF STATE VECTOR
// slot 36993
    36993, 1692,
// PINBALL_NOUN_TABLES.agc:230
//		ECADR	T3TOT4			# 39	DELTA TIME TO TRANSFER (HRS,MIN,SEC)
// slot 36994
    36994, 2880,
// PINBALL_NOUN_TABLES.agc:231
//# END OF NNADTAB FOR NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:232
//
// PINBALL_NOUN_TABLES.agc:233
//						# NN	 MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:234
//		OCT	64000			# 40	TIME TO IGNITION/CUTOFF
// slot 36995
    36995, 53248,
// PINBALL_NOUN_TABLES.agc:235
//						#	VG
// PINBALL_NOUN_TABLES.agc:236
//						#	DELTA V (ACCUMULATED)
// PINBALL_NOUN_TABLES.agc:237
//		OCT	02003			# 41	TARGET	AZIMUTH
// slot 36996
    36996, 2054,
// PINBALL_NOUN_TABLES.agc:238
//						#		ELEVATION
// PINBALL_NOUN_TABLES.agc:239
//		OCT	24006			# 42	APOGEE
// slot 36997
    36997, 20492,
// PINBALL_NOUN_TABLES.agc:240
//						#	PERIGEE
// PINBALL_NOUN_TABLES.agc:241
//						#	DELTA V (REQUIRED)
// PINBALL_NOUN_TABLES.agc:242
//		OCT	24011			# 43	LATITUDE
// slot 36998
    36998, 20498,
// PINBALL_NOUN_TABLES.agc:243
//						#	LONGITUDE
// PINBALL_NOUN_TABLES.agc:244
//						#	ALTITUDE
// PINBALL_NOUN_TABLES.agc:245
//		OCT	64014			# 44	APOGEE
// slot 36999
    36999, 53272,
// PINBALL_NOUN_TABLES.agc:246
//						#	PERIGEE
// PINBALL_NOUN_TABLES.agc:247
//						#	TFF
// PINBALL_NOUN_TABLES.agc:248
//		OCT	64017			# 45	MARKS (VHF - OPTICS)
// slot 37000
    37000, 53278,
// PINBALL_NOUN_TABLES.agc:249
//						#	TTI OF NEXT BURN
// PINBALL_NOUN_TABLES.agc:250
//						#	MGA
// PINBALL_NOUN_TABLES.agc:251
//		OCT	02022			# 46	AUTOPILOT CONFIGURATION
// slot 37001
    37001, 2084,
// PINBALL_NOUN_TABLES.agc:252
//		OCT	22025			# 47	THIS VEHICLE WEIGHT
// slot 37002
    37002, 18474,
// PINBALL_NOUN_TABLES.agc:253
//						#	OTHER VEHICLE WEIGHT
// PINBALL_NOUN_TABLES.agc:254
//		OCT	22030			# 48	PITCH TRIM
// slot 37003
    37003, 18480,
// PINBALL_NOUN_TABLES.agc:255
//						#	YAW TRIM
// PINBALL_NOUN_TABLES.agc:256
//		OCT	24033			# 49	DELTA R
// slot 37004
    37004, 20534,
// PINBALL_NOUN_TABLES.agc:257
//						#	DELTA V
// PINBALL_NOUN_TABLES.agc:258
//						#	VHF OR OPTICS CODE
// PINBALL_NOUN_TABLES.agc:259
//		OCT	64036			# 50	SPLASH ERROR
// slot 37005
    37005, 53308,
// PINBALL_NOUN_TABLES.agc:260
//						#	PERIGEE
// PINBALL_NOUN_TABLES.agc:261
//						#	TFF
// PINBALL_NOUN_TABLES.agc:262
//		OCT	22041			# 51	S-BAND ANTENNA	PITCH
// slot 37006
    37006, 18498,
// PINBALL_NOUN_TABLES.agc:263
//						#			YAW
// PINBALL_NOUN_TABLES.agc:264
//		OCT	00044			# 52	CENTRAL ANGLE OF ACTIVE VEHICLE
// slot 37007
    37007, 72,
// PINBALL_NOUN_TABLES.agc:265
//		OCT	24047			# 53	RANGE
// slot 37008
    37008, 20558,
// PINBALL_NOUN_TABLES.agc:266
//						#	RANGE RATE
// PINBALL_NOUN_TABLES.agc:267
//						#	PHI
// PINBALL_NOUN_TABLES.agc:268
//# Page 273
// PINBALL_NOUN_TABLES.agc:269
//		OCT	24052			# 54	RANGE
// slot 37009
    37009, 20564,
// PINBALL_NOUN_TABLES.agc:270
//						#	RANGE RATE
// PINBALL_NOUN_TABLES.agc:271
//						#	THETA
// PINBALL_NOUN_TABLES.agc:272
//		OCT	24055			# 55	PERIGEE CODE
// slot 37010
    37010, 20570,
// PINBALL_NOUN_TABLES.agc:273
//						#	ELEVATION ANGLE
// PINBALL_NOUN_TABLES.agc:274
//						#	CENTRAL ANGLE
// PINBALL_NOUN_TABLES.agc:275
//		OCT	22060			# 56	REENTRY ANGLE,
// slot 37011
    37011, 18528,
// PINBALL_NOUN_TABLES.agc:276
//						#	DELTA V
// PINBALL_NOUN_TABLES.agc:277
//		OCT	20063			# 57	DELTA R
// slot 37012
    37012, 16486,
// PINBALL_NOUN_TABLES.agc:278
//		OCT	24066			# 58	PERIGEE ALT
// slot 37013
    37013, 20588,
// PINBALL_NOUN_TABLES.agc:279
//						#	DELTA V TPI
// PINBALL_NOUN_TABLES.agc:280
//						#	DELTA V TPF
// PINBALL_NOUN_TABLES.agc:281
//		OCT	24071			# 59	DELTA VELOCITY LOS
// slot 37014
    37014, 20594,
// PINBALL_NOUN_TABLES.agc:282
//		OCT	24074			# 60	GMAX
// slot 37015
    37015, 20600,
// PINBALL_NOUN_TABLES.agc:283
//						#	VPRED
// PINBALL_NOUN_TABLES.agc:284
//						#	GAMMA EI
// PINBALL_NOUN_TABLES.agc:285
//		OCT	24077			# 61	IMPACT LATITUDE
// slot 37016
    37016, 20606,
// PINBALL_NOUN_TABLES.agc:286
//						#	IMPACT LONGITUDE
// PINBALL_NOUN_TABLES.agc:287
//						#	HEADS UP/DOWN
// PINBALL_NOUN_TABLES.agc:288
//		OCT	24102			# 62	INERTIAL VEL MAG (V1)
// slot 37017
    37017, 20612,
// PINBALL_NOUN_TABLES.agc:289
//						#	ALT RATE CHANGE (HDOT)
// PINBALL_NOUN_TABLES.agc:290
//						#	ALT ABOVE PAD RADIUS (H)
// PINBALL_NOUN_TABLES.agc:291
//		OCT	64105			# 63	RANGE 297,431 TO SPLASH (RTGO)
// slot 37018
    37018, 53386,
// PINBALL_NOUN_TABLES.agc:292
//						#	PREDICTED INERT VEL (VIO)
// PINBALL_NOUN_TABLES.agc:293
//						#	TIME TO GO TO 297,431 (TTE)
// PINBALL_NOUN_TABLES.agc:294
//		OCT	24110			# 64	DRAG ACCELERATION
// slot 37019
    37019, 20624,
// PINBALL_NOUN_TABLES.agc:295
//						#	INERTIAL VELOCITY (VI)
// PINBALL_NOUN_TABLES.agc:296
//						#	RANGE TO SPLASH
// PINBALL_NOUN_TABLES.agc:297
//		OCT	24113			# 65	SAMPLED AGC TIME (HRS,MIN,SEC)
// slot 37020
    37020, 20630,
// PINBALL_NOUN_TABLES.agc:298
//						#	(FETCHED IN INTERRUPT)
// PINBALL_NOUN_TABLES.agc:299
//		OCT	24116			# 66	COMMAND BANK ANGLE (BETA)
// slot 37021
    37021, 20636,
// PINBALL_NOUN_TABLES.agc:300
//						# 	CROSS RANGE ERROR
// PINBALL_NOUN_TABLES.agc:301
//						#	DOWN RANGE ERROR
// PINBALL_NOUN_TABLES.agc:302
//		OCT	24121			# 67	RANGE TO TARGET
// slot 37022
    37022, 20642,
// PINBALL_NOUN_TABLES.agc:303
//						#	PRESENT LATITUDE
// PINBALL_NOUN_TABLES.agc:304
//						#	PRESENT LONGITUDE
// PINBALL_NOUN_TABLES.agc:305
//		OCT	24124			# 68	COMMAND BANK ANGLE (BETA)
// slot 37023
    37023, 20648,
// PINBALL_NOUN_TABLES.agc:306
//						#	INERTIAL VELOCITY (VI)
// PINBALL_NOUN_TABLES.agc:307
//						#	ALT RATE CHANGE (RDOT)
// PINBALL_NOUN_TABLES.agc:308
//		OCT	24127			# 69	BETA
// slot 37024
    37024, 20654,
// PINBALL_NOUN_TABLES.agc:309
//						#	DL
// PINBALL_NOUN_TABLES.agc:310
//						#	VL
// PINBALL_NOUN_TABLES.agc:311
//		OCT	04132			# 70	STAR CODE
// slot 37025
    37025, 4276
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:312
//						#	LANDMARK DATA
// PINBALL_NOUN_TABLES.agc:313
//						#	HORIZON DATA
// PINBALL_NOUN_TABLES.agc:314
//		OCT	04135			# 71	STAR CODE
// slot 37026
    37026, 4282,
// PINBALL_NOUN_TABLES.agc:315
//						#	LANDMARK
// PINBALL_NOUN_TABLES.agc:316
//						#	HORIZON
// PINBALL_NOUN_TABLES.agc:317
//		OCT	24140			# 72	DELT ANG
// slot 37027
    37027, 20672,
// PINBALL_NOUN_TABLES.agc:318
//						#	DELT ALT
// PINBALL_NOUN_TABLES.agc:319
//# Page 274
// PINBALL_NOUN_TABLES.agc:320
//						# 	SEARCH OPTION
// PINBALL_NOUN_TABLES.agc:321
//		OCT	04143			# 73	ALTITUDE
// slot 37028
    37028, 4294,
// PINBALL_NOUN_TABLES.agc:322
//						#	VELOCITY
// PINBALL_NOUN_TABLES.agc:323
//						#	FLIGHT PATH ANGLE
// PINBALL_NOUN_TABLES.agc:324
//		OCT	04146			# 74	COMMAND BANK ANGLE (BETA)
// slot 37029
    37029, 4300,
// PINBALL_NOUN_TABLES.agc:325
//						# 	INERTIAL VELOCITY (VI)
// PINBALL_NOUN_TABLES.agc:326
//						# 	DRAG ACCELERATION
// PINBALL_NOUN_TABLES.agc:327
//		OCT	64151			# 75	DELTA ALTITUDE CDH
// slot 37030
    37030, 53458,
// PINBALL_NOUN_TABLES.agc:328
//						# 	DELTA TIME (CDH-CSI OR TPI-CDH)
// PINBALL_NOUN_TABLES.agc:329
//						#	DELTA TIME (TPI-CDH OR TPI-NOMTPI)
// PINBALL_NOUN_TABLES.agc:330
//		OCT	0			# 76	SPARE
// slot 37031
    37031, 0,
// PINBALL_NOUN_TABLES.agc:331
//		OCT	0			# 77	SPARE
// slot 37032
    37032, 0,
// PINBALL_NOUN_TABLES.agc:332
//		OCT	0			# 78	SPARE
// slot 37033
    37033, 0,
// PINBALL_NOUN_TABLES.agc:333
//		OCT	0			# 79	SPARE
// slot 37034
    37034, 0,
// PINBALL_NOUN_TABLES.agc:334
//		OCT	64170			# 80	TIME TO IGNITION/CUTOFF
// slot 37035
    37035, 53488,
// PINBALL_NOUN_TABLES.agc:335
//						#	VG
// PINBALL_NOUN_TABLES.agc:336
//						#	DELTA V (ACCUMULATED)
// PINBALL_NOUN_TABLES.agc:337
//		OCT	24173			# 81	DELTA V (LV)
// slot 37036
    37036, 20726,
// PINBALL_NOUN_TABLES.agc:338
//		OCT	24176			# 82	DELTA V (LV)
// slot 37037
    37037, 20732,
// PINBALL_NOUN_TABLES.agc:339
//		OCT	24201			# 83	DELTA V (BODY)
// slot 37038
    37038, 20738,
// PINBALL_NOUN_TABLES.agc:340
//		OCT	24204			# 84	DELTA V (OTHER VEHICLE)
// slot 37039
    37039, 20744,
// PINBALL_NOUN_TABLES.agc:341
//		OCT	24207			# 85	VG (BODY)
// slot 37040
    37040, 20750,
// PINBALL_NOUN_TABLES.agc:342
//		OCT	24212			# 86	DELTA V (LV)
// slot 37041
    37041, 20756,
// PINBALL_NOUN_TABLES.agc:343
//		OCT	02215			# 87	MARK DATA	SHAFT
// slot 37042
    37042, 2330,
// PINBALL_NOUN_TABLES.agc:344
//						#			TRUNION
// PINBALL_NOUN_TABLES.agc:345
//		OCT	24220			# 88	HALF UNIT KERBOL OR PLANET VECTOR
// slot 37043
    37043, 20768,
// PINBALL_NOUN_TABLES.agc:346
//		OCT	24223			# 89	LANDMARK	LATITUDE
// slot 37044
    37044, 20774,
// PINBALL_NOUN_TABLES.agc:347
//						#			LONGITUDE/2
// PINBALL_NOUN_TABLES.agc:348
//						#			ALTITUDE
// PINBALL_NOUN_TABLES.agc:349
//		OCT	24226			# 90	Y
// slot 37045
    37045, 20780,
// PINBALL_NOUN_TABLES.agc:350
//						#	Y DOT
// PINBALL_NOUN_TABLES.agc:351
//						#	PSI
// PINBALL_NOUN_TABLES.agc:352
//		OCT	02231			# 91	OCDU ANGLES	SHAFT
// slot 37046
    37046, 2354,
// PINBALL_NOUN_TABLES.agc:353
//						#			TRUNION
// PINBALL_NOUN_TABLES.agc:354
//		OCT	02234			# 92	NEW OPTICS ANGLES SHAFT
// slot 37047
    37047, 2360,
// PINBALL_NOUN_TABLES.agc:355
//						#			  TRUNION
// PINBALL_NOUN_TABLES.agc:356
//		OCT	04237			# 93	DELTA GYRO ANGLES
// slot 37048
    37048, 4414,
// PINBALL_NOUN_TABLES.agc:357
//		OCT	02242			# 94	NEW OPTICS ANGLES SHAFT
// slot 37049
    37049, 2372,
// PINBALL_NOUN_TABLES.agc:358
//						#			  TRUNNION
// PINBALL_NOUN_TABLES.agc:359
//		OCT	04245			# 95	PREFERRED ATTITUDE ICDU ANGLES
// slot 37050
    37050, 4426,
// PINBALL_NOUN_TABLES.agc:360
//		OCT	04250			# 96	+X-AXIS ATTITUDE ICDU ANGLES
// slot 37051
    37051, 4432,
// PINBALL_NOUN_TABLES.agc:361
//		OCT	04253			# 97	SYSTEM TEST INPUTS
// slot 37052
    37052, 4438,
// PINBALL_NOUN_TABLES.agc:362
//		OCT	04256			# 98	SYSTEM TEST RESULTS
// slot 37053
    37053, 4444,
// PINBALL_NOUN_TABLES.agc:363
//		OCT	24261			# 99	RMS IN POSITION
// slot 37054
    37054, 20834,
// PINBALL_NOUN_TABLES.agc:364
//						#	RMS IN VELOCITY
// PINBALL_NOUN_TABLES.agc:365
//						#	RMS OPTION
// PINBALL_NOUN_TABLES.agc:366
//# END OF NNADTAB FOR MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:367
//
// PINBALL_NOUN_TABLES.agc:368
//						# NN	NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:369
//# Page 275
// PINBALL_NOUN_TABLES.agc:370
//NNTYPTAB	OCT	00000			# 00	NOT IN USE
// slot 37055
    37055, 0,
// PINBALL_NOUN_TABLES.agc:371
//		OCT	04040			# 01	3COMP FRACTIONAL
// slot 37056
    37056, 4160,
// PINBALL_NOUN_TABLES.agc:372
//		OCT	04140			# 02	3COMP WHOLE
// slot 37057
    37057, 4288,
// PINBALL_NOUN_TABLES.agc:373
//		OCT	04102			# 03	3COMP CDU DEGREES
// slot 37058
    37058, 4228,
// PINBALL_NOUN_TABLES.agc:374
//		OCT	0			# 04	SPARE
// slot 37059
    37059, 0,
// PINBALL_NOUN_TABLES.agc:375
//		OCT	00504			# 05	1COMP DPDEG(360)
// slot 37060
    37060, 648,
// PINBALL_NOUN_TABLES.agc:376
//		OCT	02000			# 06	2COMP OCTAL ONLY
// slot 37061
    37061, 2048,
// PINBALL_NOUN_TABLES.agc:377
//		OCT	04000			# 07 	3COMP OCTAL ONLY
// slot 37062
    37062, 4096,
// PINBALL_NOUN_TABLES.agc:378
//		OCT	04000			# 08	3COMP OCTAL ONLY
// slot 37063
    37063, 4096,
// PINBALL_NOUN_TABLES.agc:379
//		OCT	04000			# 09	3COMP OCTAL ONLY
// slot 37064
    37064, 4096,
// PINBALL_NOUN_TABLES.agc:380
//		OCT	00000			# 10	1COMP OCTAL ONLY
// slot 37065
    37065, 0,
// PINBALL_NOUN_TABLES.agc:381
//		OCT	24400			# 11	3COMP HMS (DEC ONLY)
// slot 37066
    37066, 20992,
// PINBALL_NOUN_TABLES.agc:382
//		OCT	02000			# 12	2COMP OCTAL ONLY
// slot 37067
    37067, 2048,
// PINBALL_NOUN_TABLES.agc:383
//		OCT	24400			# 13	3COMP HMS (DEC ONLY)
// slot 37068
    37068, 20992,
// PINBALL_NOUN_TABLES.agc:384
//		OCT	0			# 14	SPARE
// slot 37069
    37069, 0,
// PINBALL_NOUN_TABLES.agc:385
//		OCT	00000			# 15	1COMP OCTAL ONLY
// slot 37070
    37070, 0,
// PINBALL_NOUN_TABLES.agc:386
//		OCT	24400			# 16	3COMP HMS (DEC ONLY)
// slot 37071
    37071, 20992,
// PINBALL_NOUN_TABLES.agc:387
//		OCT	04102			# 17 	3COMP CDU DEG
// slot 37072
    37072, 4228,
// PINBALL_NOUN_TABLES.agc:388
//		OCT	04102			# 18	3COMP CDU DEG
// slot 37073
    37073, 4228,
// PINBALL_NOUN_TABLES.agc:389
//		OCT	04102			# 19	3COMP CDU DEG
// slot 37074
    37074, 4228,
// PINBALL_NOUN_TABLES.agc:390
//		OCT	04102			# 20	3COMP CDU DEGREES
// slot 37075
    37075, 4228,
// PINBALL_NOUN_TABLES.agc:391
//		OCT	04140			# 21	3COMP WHOLE
// slot 37076
    37076, 4288,
// PINBALL_NOUN_TABLES.agc:392
//		OCT	04102			# 22	3COMP CDU DEGREES
// slot 37077
    37077, 4228,
// PINBALL_NOUN_TABLES.agc:393
//		OCT	00000			# 23 	SPARE
// slot 37078
    37078, 0,
// PINBALL_NOUN_TABLES.agc:394
//		OCT	24400			# 24	3COMP HMS (DEC ONLY)
// slot 37079
    37079, 20992,
// PINBALL_NOUN_TABLES.agc:395
//		OCT	04140			# 25	3COMP WHOLE
// slot 37080
    37080, 4288,
// PINBALL_NOUN_TABLES.agc:396
//		OCT	04000			# 26	3COMP OCTAL ONLY
// slot 37081
    37081, 4096,
// PINBALL_NOUN_TABLES.agc:397
//		OCT	00140			# 27	1COMP WHOLE
// slot 37082
    37082, 192,
// PINBALL_NOUN_TABLES.agc:398
//		OCT	00000			# 28	SPARE
// slot 37083
    37083, 0,
// PINBALL_NOUN_TABLES.agc:399
//		OCT	20102			# 29	1COMP CDU DEG (DEC ONLY)
// slot 37084
    37084, 16516,
// PINBALL_NOUN_TABLES.agc:400
//		OCT	04140			# 30	3COMP WHOLE
// slot 37085
    37085, 4288,
// PINBALL_NOUN_TABLES.agc:401
//		OCT	24400			# 31	3COMP HMS (DEC ONLY)
// slot 37086
    37086, 20992,
// PINBALL_NOUN_TABLES.agc:402
//		OCT	24400			# 32 	3COMP HMS (DEC ONLY)
// slot 37087
    37087, 20992,
// PINBALL_NOUN_TABLES.agc:403
//		OCT	24400			# 33 	3COMP HMS (DEC ONLY)
// slot 37088
    37088, 20992,
// PINBALL_NOUN_TABLES.agc:404
//		OCT	24400			# 34	3COMP HMS (DEC ONLY)
// slot 37089
    37089, 20992,
// PINBALL_NOUN_TABLES.agc:405
//		OCT	24400			# 35 	3COMP HMS (DEC ONLY)
// slot 37090
    37090, 20992,
// PINBALL_NOUN_TABLES.agc:406
//		OCT	24400			# 36 	3COMP HMS (DEC ONLY)
// slot 37091
    37091, 20992,
// PINBALL_NOUN_TABLES.agc:407
//		OCT	24400			# 37 	3COMP HMS (DEC ONLY)
// slot 37092
    37092, 20992,
// PINBALL_NOUN_TABLES.agc:408
//		OCT	24400			# 38 	3COMP HMS (DEC ONLY)
// slot 37093
    37093, 20992,
// PINBALL_NOUN_TABLES.agc:409
//		OCT	24400			# 39	3COMP HMS (DEC ONLY)
// slot 37094
    37094, 20992,
// PINBALL_NOUN_TABLES.agc:410
//# END OF NNTYPTAB FOR NORMAL NOUNS
// PINBALL_NOUN_TABLES.agc:411
//
// PINBALL_NOUN_TABLES.agc:412
//						# NN	MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:413
//
// PINBALL_NOUN_TABLES.agc:414
//		OCT	24500			# 40	3COMP	MIN/SEC, VEL3, VEL3
// slot 37095
    37095, 21120,
// PINBALL_NOUN_TABLES.agc:415
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:416
//		OCT	00542			# 41	2COMP	CDU DEG, ELEV DEG
// slot 37096
    37096, 708,
// PINBALL_NOUN_TABLES.agc:417
//		OCT	24410			# 42	3COMP	POS4, POS4, VEL3
// slot 37097
    37097, 21008,
// PINBALL_NOUN_TABLES.agc:418
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:419
//		OCT	20204			# 43	3COMP	DPDEG(360), DPDEG(360), POS4
// slot 37098
    37098, 16648,
// PINBALL_NOUN_TABLES.agc:420
//# Page 276
// PINBALL_NOUN_TABLES.agc:421
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:422
//		OCT	00410			# 44	3COMP	POS4, POS4, MIN/SEC
// slot 37099
    37099, 528,
// PINBALL_NOUN_TABLES.agc:423
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:424
//		OCT	10000			# 45	3COMP	2INT, MIN/SEC, DPDEG(360)
// slot 37100
    37100, 8192,
// PINBALL_NOUN_TABLES.agc:425
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:426
//		OCT	00000			# 46	2COMP 	OCTAL ONLY FOR EACH
// slot 37101
    37101, 0,
// PINBALL_NOUN_TABLES.agc:427
//		OCT	00306			# 47	2COMP	WEIGHT2 FOR EACH
// slot 37102
    37102, 396,
// PINBALL_NOUN_TABLES.agc:428
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:429
//		OCT	00614			# 48	2COMP	TRIM DEG, TRIM DEG
// slot 37103
    37103, 792,
// PINBALL_NOUN_TABLES.agc:430
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:431
//		OCT	00510			# 49	3COMP	POS4, VEL3, WHOLE
// slot 37104
    37104, 656,
// PINBALL_NOUN_TABLES.agc:432
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:433
//		OCT	00417			# 50	3COMP	POS6, POS4, MIN/SEC
// slot 37105
    37105, 542,
// PINBALL_NOUN_TABLES.agc:434
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:435
//		OCT	00204			# 51	2COMP	DPDEG(360), DPDEG(360)
// slot 37106
    37106, 264,
// PINBALL_NOUN_TABLES.agc:436
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:437
//		OCT	00004			# 52	1COMP	DPDEG(360)
// slot 37107
    37107, 8,
// PINBALL_NOUN_TABLES.agc:438
//		OCT	10507			# 53	3COMP	POS5, VEL3, DPDEG(360)
// slot 37108
    37108, 8846,
// PINBALL_NOUN_TABLES.agc:439
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:440
//		OCT	10507			# 54	3COMP	POS5, VEL3, DPDEG(360)
// slot 37109
    37109, 8846
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:441
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:442
//		OCT	10200			# 55	3COMP	WHOLE, DPDEG(360), DPDEG(360)
// slot 37110
    37110, 8448,
// PINBALL_NOUN_TABLES.agc:443
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:444
//		OCT	00444			# 56	2COMP	DPDEG(360), VEL2
// slot 37111
    37111, 584,
// PINBALL_NOUN_TABLES.agc:445
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:446
//		OCT	00010			# 57	1COMP	POS4
// slot 37112
    37112, 16,
// PINBALL_NOUN_TABLES.agc:447
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:448
//		OCT	24510			# 58	3COMP	POS4, VEL3, VEL3
// slot 37113
    37113, 21136,
// PINBALL_NOUN_TABLES.agc:449
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:450
//		OCT	24512			# 59	3COMP	VEL3 FOR EACH
// slot 37114
    37114, 21140,
// PINBALL_NOUN_TABLES.agc:451
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:452
//		OCT	10440			# 60	3COMP	WHOLE, VEL2, DPDEG(360)
// slot 37115
    37115, 8768,
// PINBALL_NOUN_TABLES.agc:453
//						# 		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:454
//		OCT	00204			# 61	3COMP 	DPDEG(360), DPDEG(360), WHOLE
// slot 37116
    37116, 264,
// PINBALL_NOUN_TABLES.agc:455
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:456
//		OCT	20451			# 62	3COMP	VEL2, VEL2, POS4
// slot 37117
    37117, 16978,
// PINBALL_NOUN_TABLES.agc:457
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:458
//		OCT	00457			# 63	3COMP	POS6, VEL2, MIN/SEC
// slot 37118
    37118, 606,
// PINBALL_NOUN_TABLES.agc:459
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:460
//		OCT	36460			# 64	3COMP	DRAG ACCEL, VEL2, POS6
// slot 37119
    37119, 31328,
// PINBALL_NOUN_TABLES.agc:461
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:462
//		OCT	00000			# 65	3COMP	HMS (DEC ONLY)
// slot 37120
    37120, 0,
// PINBALL_NOUN_TABLES.agc:463
//		OCT	37044			# 66	3COMP 	DPDEG(360), POS8, POS6
// slot 37121
    37121, 31816,
// PINBALL_NOUN_TABLES.agc:464
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:465
//		OCT	10217			# 67	3COMP	POS6, DPDEG(360), DPDEG(360)
// slot 37122
    37122, 8478,
// PINBALL_NOUN_TABLES.agc:466
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:467
//		OCT	34444			# 68	3COMP	DPDEG(360), VEL2, VEL/2VS
// slot 37123
    37123, 29256,
// PINBALL_NOUN_TABLES.agc:468
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:469
//		OCT	35004			# 69	3COMP	DPDEG(360), DRAG ACCEL,VEL/2VS
// slot 37124
    37124, 29704,
// PINBALL_NOUN_TABLES.agc:470
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:471
//# Page 277
// PINBALL_NOUN_TABLES.agc:472
//		OCT	00000			# 70	3COMP	OCTAL ONLY FOR EACH
// slot 37125
    37125, 0,
// PINBALL_NOUN_TABLES.agc:473
//		OCT	0			# 71	3COMP	OCTAL ONLY FOR EACH
// slot 37126
    37126, 0,
// PINBALL_NOUN_TABLES.agc:474
//		OCT	00404			# 72	3COMP	DPDEG(360), POS4, WHOLE
// slot 37127
    37127, 520,
// PINBALL_NOUN_TABLES.agc:475
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:476
//		OCT	10450			# 73	3COMP	POS4, VEL2, DPDEG(360)
// slot 37128
    37128, 8784,
// PINBALL_NOUN_TABLES.agc:477
//		OCT	40444			# 74	3COMP	DPDEG(360), VEL2, DRAG ACCEL
// slot 37129
    37129, 33352,
// PINBALL_NOUN_TABLES.agc:478
//		OCT	00010			# 75	3COMP	POS4, MIN/SEC, MIN/SEC
// slot 37130
    37130, 16,
// PINBALL_NOUN_TABLES.agc:479
//#						# 		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:480
//		OCT	0			# 76		SPARE
// slot 37131
    37131, 0,
// PINBALL_NOUN_TABLES.agc:481
//		OCT	0			# 77		SPARE
// slot 37132
    37132, 0,
// PINBALL_NOUN_TABLES.agc:482
//		OCT	0			# 78		SPARE
// slot 37133
    37133, 0,
// PINBALL_NOUN_TABLES.agc:483
//		OCT	0			# 79		SPARE
// slot 37134
    37134, 0,
// PINBALL_NOUN_TABLES.agc:484
//		OCT	22440			# 80	3COMP	MIN/SEC, VEL2, VEL2
// slot 37135
    37135, 19008,
// PINBALL_NOUN_TABLES.agc:485
//						#		(NO LOAD, DEC ONLY)
// PINBALL_NOUN_TABLES.agc:486
//		OCT	24512			# 81	3COMP	VEL3 FOR EACH
// slot 37136
    37136, 21140,
// PINBALL_NOUN_TABLES.agc:487
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:488
//		OCT	24512			# 82	3COMP	VEL3 FOR EACH
// slot 37137
    37137, 21140,
// PINBALL_NOUN_TABLES.agc:489
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:490
//		OCT	24512			# 83	3COMP	VEL3 FOR EACH
// slot 37138
    37138, 21140,
// PINBALL_NOUN_TABLES.agc:491
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:492
//		OCT	24512			# 84	3COMP	VEL3 FOR EACH
// slot 37139
    37139, 21140,
// PINBALL_NOUN_TABLES.agc:493
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:494
//		OCT	24512			# 85	3COMP	VEL3 FOR EACH
// slot 37140
    37140, 21140,
// PINBALL_NOUN_TABLES.agc:495
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:496
//		OCT	22451			# 86	3COMP	VEL2 FOR EACH
// slot 37141
    37141, 19026,
// PINBALL_NOUN_TABLES.agc:497
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:498
//		OCT	00102			# 87	2COMP	CDU DEG, Y OPTICS DEG
// slot 37142
    37142, 132,
// PINBALL_NOUN_TABLES.agc:499
//		OCT	0			# 88	3COMP	FRAC FOR EACH
// slot 37143
    37143, 0,
// PINBALL_NOUN_TABLES.agc:500
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:501
//		OCT	16143			# 89	3COMP 	DPDEG(90), DPDEG(90), POS5
// slot 37144
    37144, 14534,
// PINBALL_NOUN_TABLES.agc:502
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:503
//		OCT	10507			# 90	3COMP	POS5, VEL3, DEPDEG(360)
// slot 37145
    37145, 8846,
// PINBALL_NOUN_TABLES.agc:504
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:505
//		OCT	00102			# 91	2COMP	CDUDEG, YOPTICS DEG
// slot 37146
    37146, 132,
// PINBALL_NOUN_TABLES.agc:506
//		OCT	00102			# 92	2COMP	CDUDEG, YOPTICS DEG
// slot 37147
    37147, 132,
// PINBALL_NOUN_TABLES.agc:507
//		OCT	06143			# 93	3COMP	DPDEG(90) FOR EACH
// slot 37148
    37148, 6342,
// PINBALL_NOUN_TABLES.agc:508
//		OCT	00102			# 94	2COMP	CDUDEG, YOPTICS DEG
// slot 37149
    37149, 132,
// PINBALL_NOUN_TABLES.agc:509
//		OCT	04102			# 95	3COMP	CDU DEG FOR EACH
// slot 37150
    37150, 4228,
// PINBALL_NOUN_TABLES.agc:510
//		OCT	04102			# 96	3COMP	CDU DEG FOR EACH
// slot 37151
    37151, 4228,
// PINBALL_NOUN_TABLES.agc:511
//		OCT	00000			# 97	3COMP	WHOLE FOR EACH
// slot 37152
    37152, 0,
// PINBALL_NOUN_TABLES.agc:512
//		OCT 	00000			# 98	3COMP	WHOLE, FRAC, WHOLE
// slot 37153
    37153, 0,
// PINBALL_NOUN_TABLES.agc:513
//		OCT	01162			# 99	3COMP	POS9, VEL4, WHOLE
// slot 37154
    37154, 1252,
// PINBALL_NOUN_TABLES.agc:514
//						#		(DEC ONLY)
// PINBALL_NOUN_TABLES.agc:515
//# END OF NNTYPTAB FOR MIXED NOUNS
// PINBALL_NOUN_TABLES.agc:516
//
// PINBALL_NOUN_TABLES.agc:517
//
// PINBALL_NOUN_TABLES.agc:518
//SFINTAB		OCT	00006			# WHOLE, DP TIME (SEC)
// slot 37155
    37155, 12,
// PINBALL_NOUN_TABLES.agc:519
//		OCT	03240
// slot 37156
    37156, 3392,
// PINBALL_NOUN_TABLES.agc:520
//		OCT	00000			# SPARE
// slot 37157
    37157, 0,
// PINBALL_NOUN_TABLES.agc:521
//		OCT	00000
// slot 37158
    37158, 0,
// PINBALL_NOUN_TABLES.agc:522
//# Page 278
// PINBALL_NOUN_TABLES.agc:523
//		OCT	00000			# CDU DEGREES, Y OPTICS DEGREES
// slot 37159
    37159, 0,
// PINBALL_NOUN_TABLES.agc:524
//		OCT	00000			#	(SFCONS IN DEGINSF, OPTDEGIN)
// slot 37160
    37160, 0,
// PINBALL_NOUN_TABLES.agc:525
//		OCT	10707			# DP DEGREES (90)
// slot 37161
    37161, 9102,
// PINBALL_NOUN_TABLES.agc:526
//		OCT	03435			#	UPPED BY 1
// slot 37162
    37162, 3642,
// PINBALL_NOUN_TABLES.agc:527
//		OCT	13070			# DP DEGREES (360)(POINT BETWN BITS 11-12)
// slot 37163
    37163, 11376,
// PINBALL_NOUN_TABLES.agc:528
//		OCT	34345			#	UPPED BY 1
// slot 37164
    37164, 29130,
// PINBALL_NOUN_TABLES.agc:529
//		OCT	00005			# DEGREES (180)
// slot 37165
    37165, 10,
// PINBALL_NOUN_TABLES.agc:530
//		OCT	21616
// slot 37166
    37166, 18204,
// PINBALL_NOUN_TABLES.agc:531
//		OCT	26113			# WEIGHT2
// slot 37167
    37167, 22678,
// PINBALL_NOUN_TABLES.agc:532
//		OCT	31713
// slot 37168
    37168, 26518,
// PINBALL_NOUN_TABLES.agc:533
//		OCT	00070			# POSITION5
// slot 37169
    37169, 112,
// PINBALL_NOUN_TABLES.agc:534
//		OCT	20460
// slot 37170
    37170, 16992,
// PINBALL_NOUN_TABLES.agc:535
//		OCT	01065			# POSITION4
// slot 37171
    37171, 1130,
// PINBALL_NOUN_TABLES.agc:536
//		OCT	05740
// slot 37172
    37172, 6080,
// PINBALL_NOUN_TABLES.agc:537
//		OCT	11414			# VELOCITY2 	(POINT BETWN BITS 11-12)
// slot 37173
    37173, 9752,
// PINBALL_NOUN_TABLES.agc:538
//		OCT	31463
// slot 37174
    37174, 26214,
// PINBALL_NOUN_TABLES.agc:539
//		OCT	07475			# VELOCITY3
// slot 37175
    37175, 7802,
// PINBALL_NOUN_TABLES.agc:540
//		OCT	16051
// slot 37176
    37176, 14418,
// PINBALL_NOUN_TABLES.agc:541
//		OCT	00001			# ELEVATION DEGREES
// slot 37177
    37177, 2,
// PINBALL_NOUN_TABLES.agc:542
//		OCT	03434
// slot 37178
    37178, 3640,
// PINBALL_NOUN_TABLES.agc:543
//		OCT	00002			# TRIM DEGREES
// slot 37179
    37179, 4,
// PINBALL_NOUN_TABLES.agc:544
//		OCT	22245
// slot 37180
    37180, 18762,
// PINBALL_NOUN_TABLES.agc:545
//		OCT	00014			# INERTIA, THRUST MOMENT
// slot 37181
    37181, 24,
// PINBALL_NOUN_TABLES.agc:546
//		OCT	35607
// slot 37182
    37182, 30478,
// PINBALL_NOUN_TABLES.agc:547
//		OCT	07606			# VELOCITY/2VS
// slot 37183
    37183, 7948,
// PINBALL_NOUN_TABLES.agc:548
//		OCT	06300
// slot 37184
    37184, 6528,
// PINBALL_NOUN_TABLES.agc:549
//		OCT	16631			# POSITION 6
// slot 37185
    37185, 15154,
// PINBALL_NOUN_TABLES.agc:550
//		OCT	11307
// slot 37186
    37186, 9614,
// PINBALL_NOUN_TABLES.agc:551
//		OCT	12000			# DRAG ACCELERATION (POINT BETWN BITS 7-8)
// slot 37187
    37187, 10240,
// PINBALL_NOUN_TABLES.agc:552
//		OCT	00000
// slot 37188
    37188, 0,
// PINBALL_NOUN_TABLES.agc:553
//		OCT	27176			# POSITION 8
// slot 37189
    37189, 23804,
// PINBALL_NOUN_TABLES.agc:554
//		OCT	14235
// slot 37190
    37190, 12602,
// PINBALL_NOUN_TABLES.agc:555
//		2DEC	30480 B-19		# POSITION 9
// slot 37191 37192
    37191, 1904, 37192, 16384,
// PINBALL_NOUN_TABLES.agc:556
//
// PINBALL_NOUN_TABLES.agc:557
//		2DEC	30.48 B-7		# VELOCITY4
// slot 37193 37194
    37193, 7802, 37194, 14418,
// PINBALL_NOUN_TABLES.agc:558
//
// PINBALL_NOUN_TABLES.agc:559
//						# END OF SFINTAB
// PINBALL_NOUN_TABLES.agc:560
//
// PINBALL_NOUN_TABLES.agc:561
//
// PINBALL_NOUN_TABLES.agc:562
//SFOUTAB		OCT	05174			# WHOLE, DP TIME (SEC)
// slot 37195
    37195, 5368,
// PINBALL_NOUN_TABLES.agc:563
//		OCT	13261
// slot 37196
    37196, 11618,
// PINBALL_NOUN_TABLES.agc:564
//		OCT	00000			# SPARE
// slot 37197
    37197, 0,
// PINBALL_NOUN_TABLES.agc:565
//		OCT	00000
// slot 37198
    37198, 0,
// PINBALL_NOUN_TABLES.agc:566
//		OCT	00000			# CDU DEGREES, Y OPTICS DEGREES
// slot 37199
    37199, 0,
// PINBALL_NOUN_TABLES.agc:567
//		OCT	00000			#	(SFCONS IN DEGOUTSF, OPTDEGOUT)
// slot 37200
    37200, 0,
// PINBALL_NOUN_TABLES.agc:568
//		OCT	00714			# DP DEGREES (90) (POINT BETWN BITS 7-8)
// slot 37201
    37201, 920
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:569
//		OCT	31463
// slot 37202
    37202, 26214,
// PINBALL_NOUN_TABLES.agc:570
//		OCT	13412			# DP DEGREES (360)
// slot 37203
    37203, 11796,
// PINBALL_NOUN_TABLES.agc:571
//		OCT	07534
// slot 37204
    37204, 7864,
// PINBALL_NOUN_TABLES.agc:572
//		OCT	05605			# DEGREES (180)
// slot 37205
    37205, 5898,
// PINBALL_NOUN_TABLES.agc:573
//# Page 279
// PINBALL_NOUN_TABLES.agc:574
//		OCT	03656
// slot 37206
    37206, 3932,
// PINBALL_NOUN_TABLES.agc:575
//		OCT	00001			# WEIGHT2
// slot 37207
    37207, 2,
// PINBALL_NOUN_TABLES.agc:576
//		OCT	16170
// slot 37208
    37208, 14576,
// PINBALL_NOUN_TABLES.agc:577
//		OCT	00441			# POSITION5
// slot 37209
    37209, 578,
// PINBALL_NOUN_TABLES.agc:578
//		OCT	34306
// slot 37210
    37210, 29068,
// PINBALL_NOUN_TABLES.agc:579
//		OCT	07176			# POSITION4
// slot 37211
    37211, 7420,
// PINBALL_NOUN_TABLES.agc:580
//		OCT	21603
// slot 37212
    37212, 18182,
// PINBALL_NOUN_TABLES.agc:581
//		OCT	15340			# VELOCITY2
// slot 37213
    37213, 13760,
// PINBALL_NOUN_TABLES.agc:582
//		OCT	15340
// slot 37214
    37214, 13760,
// PINBALL_NOUN_TABLES.agc:583
//		OCT	01031			# VELOCITY3	(POINT BETWN BITS 7-8)
// slot 37215
    37215, 1074,
// PINBALL_NOUN_TABLES.agc:584
//		OCT	21032
// slot 37216
    37216, 17460,
// PINBALL_NOUN_TABLES.agc:585
//		OCT	34631			# ELEVATION DEGREES
// slot 37217
    37217, 29490,
// PINBALL_NOUN_TABLES.agc:586
//		OCT	23146
// slot 37218
    37218, 19660,
// PINBALL_NOUN_TABLES.agc:587
//		OCT	14340			# TRIM DEGREES
// slot 37219
    37219, 12736,
// PINBALL_NOUN_TABLES.agc:588
//		OCT	24145
// slot 37220
    37220, 20682,
// PINBALL_NOUN_TABLES.agc:589
//		OCT	02363			# INERTIA, THRUST MOMENT
// slot 37221
    37221, 2534,
// PINBALL_NOUN_TABLES.agc:590
//		OCT	03721
// slot 37222
    37222, 4002,
// PINBALL_NOUN_TABLES.agc:591
//		OCT	20373			# VELOCITY/ZVS
// slot 37223
    37223, 16886,
// PINBALL_NOUN_TABLES.agc:592
//		OCT	02122
// slot 37224
    37224, 2212,
// PINBALL_NOUN_TABLES.agc:593
//		OCT	00424			# POSITION 6	(POINT BETWN BITS 7-8)
// slot 37225
    37225, 552,
// PINBALL_NOUN_TABLES.agc:594
//		OCT	30446
// slot 37226
    37226, 25164,
// PINBALL_NOUN_TABLES.agc:595
//		OCT	00631			# DRAG ACCELERATION
// slot 37227
    37227, 818,
// PINBALL_NOUN_TABLES.agc:596
//		OCT	23146
// slot 37228
    37228, 19660,
// PINBALL_NOUN_TABLES.agc:597
//		OCT	00260			# POSITION 8
// slot 37229
    37229, 352,
// PINBALL_NOUN_TABLES.agc:598
//		OCT	06213
// slot 37230
    37230, 6422,
// PINBALL_NOUN_TABLES.agc:599
//		2DEC	17.2010499 B-7		# POSITION 9
// slot 37231 37232
    37231, 4402, 37232, 24064,
// PINBALL_NOUN_TABLES.agc:600
//
// PINBALL_NOUN_TABLES.agc:601
//		2DEC	.032808399		# VELOCITY4
// slot 37233 37234
    37233, 1074, 37234, 17460,
// PINBALL_NOUN_TABLES.agc:602
//
// PINBALL_NOUN_TABLES.agc:603
//						# END OF SFOUTAB
// PINBALL_NOUN_TABLES.agc:604
//
// PINBALL_NOUN_TABLES.agc:605
//
// PINBALL_NOUN_TABLES.agc:606
//						# NN	 SF CONSTANT		SF ROUTINE
// PINBALL_NOUN_TABLES.agc:607
//
// PINBALL_NOUN_TABLES.agc:608
//IDADDTAB	ECADR	TTOGO			# 40	MIN/SEC			M/S
// slot 37235
    37235, 3936,
// PINBALL_NOUN_TABLES.agc:609
//		ECADR	VGDISP			# 40	VEL3			DP3
// slot 37236
    37236, 4084,
// PINBALL_NOUN_TABLES.agc:610
//		ECADR	DVTOTAL			# 40	VEL3			DP3
// slot 37237
    37237, 3626,
// PINBALL_NOUN_TABLES.agc:611
//		ECADR	DSPTEM1			# 41	CDU DEG			CDU
// slot 37238
    37238, 1098,
// PINBALL_NOUN_TABLES.agc:612
//		ECADR	DSPTEM1 +1		# 41	ELEV DEG		ARTH
// slot 37239
    37239, 1100,
// PINBALL_NOUN_TABLES.agc:613
//		OCT	0			# 41	SPARE COMPONENT
// slot 37240
    37240, 0,
// PINBALL_NOUN_TABLES.agc:614
//		ECADR	HAPO			# 42	POS4			DP3
// slot 37241
    37241, 2534,
// PINBALL_NOUN_TABLES.agc:615
//		ECADR	HPER			# 42	POS4			DP3
// slot 37242
    37242, 2538,
// PINBALL_NOUN_TABLES.agc:616
//		ECADR	VGDISP			# 42 	VEL3			DP3
// slot 37243
    37243, 4084,
// PINBALL_NOUN_TABLES.agc:617
//		ECADR	LAT			# 43	DPDEG(360)		DP4
// slot 37244
    37244, 1158,
// PINBALL_NOUN_TABLES.agc:618
//		ECADR	LONG			# 43	DPDEG(360)		DP4
// slot 37245
    37245, 1162,
// PINBALL_NOUN_TABLES.agc:619
//		ECADR	ALT			# 43	POS4			DP3
// slot 37246
    37246, 1166,
// PINBALL_NOUN_TABLES.agc:620
//		ECADR	HAPOX			# 44	POS4			DP3
// slot 37247
    37247, 2514,
// PINBALL_NOUN_TABLES.agc:621
//		ECADR	HPERX			# 44	POS4			DP3
// slot 37248
    37248, 2518,
// PINBALL_NOUN_TABLES.agc:622
//		ECADR	TFF			# 44	MIN/SEC			M/S
// slot 37249
    37249, 2502,
// PINBALL_NOUN_TABLES.agc:623
//		ECADR	VHFCNT			# 45	2INT			2INT
// slot 37250
    37250, 1194,
// PINBALL_NOUN_TABLES.agc:624
//# Page 280
// PINBALL_NOUN_TABLES.agc:625
//		ECADR	TTOGO			# 45	MIN/SEC			M/S
// slot 37251
    37251, 3936,
// PINBALL_NOUN_TABLES.agc:626
//		ECADR	+MGA			# 45	DPDEG(360)		DP4
// slot 37252
    37252, 3882,
// PINBALL_NOUN_TABLES.agc:627
//		ECADR	DAPDATR1		# 46	OCTAL ONLY		OCT
// slot 37253
    37253, 3180,
// PINBALL_NOUN_TABLES.agc:628
//		ECADR	DAPDATR2		# 46	OCATAL ONLY		OCT
// slot 37254
    37254, 3182,
// PINBALL_NOUN_TABLES.agc:629
//		OCT	0			# 46	SPARE COMPONENT
// slot 37255
    37255, 0,
// PINBALL_NOUN_TABLES.agc:630
//		ECADR	CSMMASS			# 47	WEIGHT2			ARTH1
// slot 37256
    37256, 3192,
// PINBALL_NOUN_TABLES.agc:631
//		ECADR	LEMMASS			# 47	WEIGHT2			ARTH1
// slot 37257
    37257, 3190,
// PINBALL_NOUN_TABLES.agc:632
//		OCT	00000			# 47	SPARE COMPONENT
// slot 37258
    37258, 0,
// PINBALL_NOUN_TABLES.agc:633
//		ECADR	PACTOFF			# 48	TRIM DEG		ARTH
// slot 37259
    37259, 3110,
// PINBALL_NOUN_TABLES.agc:634
//		ECADR	YACTOFF			# 48	TRIM DEG		ARTH
// slot 37260
    37260, 3112,
// PINBALL_NOUN_TABLES.agc:635
//		OCT	00000			# 48	SPARE COMPONENT
// slot 37261
    37261, 0,
// PINBALL_NOUN_TABLES.agc:636
//		ECADR	N49DISP			# 49	POS4			DP3
// slot 37262
    37262, 3714,
// PINBALL_NOUN_TABLES.agc:637
//		ECADR	N49DISP +2		# 49	VEL3			DP3
// slot 37263
    37263, 3718,
// PINBALL_NOUN_TABLES.agc:638
//		ECADR	N49DISP +4		# 49	WHOLE			ARTH
// slot 37264
    37264, 3722,
// PINBALL_NOUN_TABLES.agc:639
//		ECADR	RSP-RREC		# 50	POS6			DP3
// slot 37265
    37265, 2522,
// PINBALL_NOUN_TABLES.agc:640
//		ECADR	HPERX			# 50 	POS4			DP3
// slot 37266
    37266, 2518,
// PINBALL_NOUN_TABLES.agc:641
//		ECADR	TFF			# 50	MIN/SEC			M/S
// slot 37267
    37267, 2502,
// PINBALL_NOUN_TABLES.agc:642
//		ECADR	RHOSB			# 51	DPDEG(360)
// slot 37268
    37268, 2464,
// PINBALL_NOUN_TABLES.agc:643
//		ECADR	GAMMASB			# 51	DPDEG(360)		DP4
// slot 37269
    37269, 2468,
// PINBALL_NOUN_TABLES.agc:644
//		OCT	0			# 51	SPARE COMPONENT
// slot 37270
    37270, 0,
// PINBALL_NOUN_TABLES.agc:645
//		ECADR	ACTCENT			# 52	DPDEG(360)		DP4
// slot 37271
    37271, 2868,
// PINBALL_NOUN_TABLES.agc:646
//		OCT	00000			# 52	SPARE COMPONENT
// slot 37272
    37272, 0,
// PINBALL_NOUN_TABLES.agc:647
//		OCT	00000			# 52 	SPARE COMPONENT
// slot 37273
    37273, 0,
// PINBALL_NOUN_TABLES.agc:648
//		ECADR	RANGE			# 53	POS5			DP1
// slot 37274
    37274, 2464,
// PINBALL_NOUN_TABLES.agc:649
//		ECADR	RRATE			# 53 	VEL3			DP3
// slot 37275
    37275, 2468,
// PINBALL_NOUN_TABLES.agc:650
//		ECADR	RTHETA			# 53 	DPDEG(360)		DP4
// slot 37276
    37276, 2472,
// PINBALL_NOUN_TABLES.agc:651
//		ECADR	RANGE			# 54	POS5			DP1
// slot 37277
    37277, 2464,
// PINBALL_NOUN_TABLES.agc:652
//		ECADR	RRATE			# 54	VEL3			DP3
// slot 37278
    37278, 2468,
// PINBALL_NOUN_TABLES.agc:653
//		ECADR	RTHETA			# 54	DPDEG(360)		DP4
// slot 37279
    37279, 2472,
// PINBALL_NOUN_TABLES.agc:654
//		ECADR	NN1			# 55	WHOLE			ARTH
// slot 37280
    37280, 4074,
// PINBALL_NOUN_TABLES.agc:655
//		ECADR	ELEV			# 55	DPDEG(360)		DP4
// slot 37281
    37281, 4038,
// PINBALL_NOUN_TABLES.agc:656
//		ECADR	CENTANG			# 55	DPDEG(360)		DP4
// slot 37282
    37282, 4054,
// PINBALL_NOUN_TABLES.agc:657
//		ECADR	RTEGAM2D		# 56	DPDEG(360)		DP4
// slot 37283
    37283, 3894,
// PINBALL_NOUN_TABLES.agc:658
//		ECADR	RTEDVD			# 56	VEL2			DP4
// slot 37284
    37284, 3890,
// PINBALL_NOUN_TABLES.agc:659
//		OCT	0			# 56	SPARE COMPONENT
// slot 37285
    37285, 0,
// PINBALL_NOUN_TABLES.agc:660
//		ECADR	DELTAR			# 57	POS4			DP3
// slot 37286
    37286, 2832,
// PINBALL_NOUN_TABLES.agc:661
//		OCT	0			# 57	SPARE COMPONENT
// slot 37287
    37287, 0,
// PINBALL_NOUN_TABLES.agc:662
//		OCT	0			# 57	SPARE COMPONENT
// slot 37288
    37288, 0,
// PINBALL_NOUN_TABLES.agc:663
//		ECADR	POSTTPI			# 58	POS4			DP3
// slot 37289
    37289, 2880,
// PINBALL_NOUN_TABLES.agc:664
//		ECADR	DELVTPI			# 58	VEL3			DP3
// slot 37290
    37290, 2872,
// PINBALL_NOUN_TABLES.agc:665
//		ECADR	DELVTPF			# 58	VEL3			DP3
// slot 37291
    37291, 2876,
// PINBALL_NOUN_TABLES.agc:666
//		ECADR	DVLOS			# 59	VEL3			DP3
// slot 37292
    37292, 2832,
// PINBALL_NOUN_TABLES.agc:667
//		ECADR	DVLOS +2		# 59	VEL3			DP3
// slot 37293
    37293, 2836,
// PINBALL_NOUN_TABLES.agc:668
//		ECADR	DVLOS +4		# 59	VEL3			DP3
// slot 37294
    37294, 2840,
// PINBALL_NOUN_TABLES.agc:669
//		ECADR	GMAX			# 60	WHOLE			ARTH
// slot 37295
    37295, 4002,
// PINBALL_NOUN_TABLES.agc:670
//		ECADR	VPRED			# 60	VEL2			DP4
// slot 37296
    37296, 4076,
// PINBALL_NOUN_TABLES.agc:671
//		ECADR	GAMMAEI			# 60	DPDEG(360)		DP4
// slot 37297
    37297, 4080,
// PINBALL_NOUN_TABLES.agc:672
//		ECADR	LAT(SPL)		# 61	DPDEG(360)		DP4
// slot 37298
    37298, 3584,
// PINBALL_NOUN_TABLES.agc:673
//		ECADR	LNG(SPL)		# 61	DPDEG(360)		DP4
// slot 37299
    37299, 3588,
// PINBALL_NOUN_TABLES.agc:674
//		ECADR	HEADSUP			# 61	WHOLE			ARTH
// slot 37300
    37300, 3500,
// PINBALL_NOUN_TABLES.agc:675
//# Page 281
// PINBALL_NOUN_TABLES.agc:676
//		ECADR	VMAGI			# 62	VEL2			DP4
// slot 37301
    37301, 4004,
// PINBALL_NOUN_TABLES.agc:677
//		ECADR	HDOT			# 62	VEL2			DP4
// slot 37302
    37302, 4028,
// PINBALL_NOUN_TABLES.agc:678
//		ECADR	ALTI			# 62	POS4			DP3
// slot 37303
    37303, 4024,
// PINBALL_NOUN_TABLES.agc:679
//		ECADR	RTGO			# 63	POS6			DP3
// slot 37304
    37304, 3990,
// PINBALL_NOUN_TABLES.agc:680
//		ECADR	VIO			# 63	VEL2			DP4
// slot 37305
    37305, 4008,
// PINBALL_NOUN_TABLES.agc:681
//		ECADR	TTE			# 63	MIN/SEC			M/S
// slot 37306
    37306, 4012,
// PINBALL_NOUN_TABLES.agc:682
//		ECADR	D			# 64 	DRAG ACCEL		DP2
// slot 37307
    37307, 3902,
// PINBALL_NOUN_TABLES.agc:683
//		ECADR	VMAGI			# 64	VEL2			DP4
// slot 37308
    37308, 4004,
// PINBALL_NOUN_TABLES.agc:684
//		ECADR	RTGON64			# 64	POS6			DP3
// slot 37309
    37309, 3990,
// PINBALL_NOUN_TABLES.agc:685
//		ECADR	SAMPTIME		# 65	HMS (MIXED ONLY TO KEEP CODE 65) HMS
// slot 37310
    37310, 22,
// PINBALL_NOUN_TABLES.agc:686
//		ECADR	SAMPTIME		# 65	HMS			HMS
// slot 37311
    37311, 22,
// PINBALL_NOUN_TABLES.agc:687
//		ECADR	SAMPTIME		# 65	HMS			HMS
// slot 37312
    37312, 22,
// PINBALL_NOUN_TABLES.agc:688
//		ECADR	ROLLC			# 66	DPDEG(360)		DP4
// slot 37313
    37313, 3482,
// PINBALL_NOUN_TABLES.agc:689
//		ECADR	XRNGERR			# 66	POS8			DP3
// slot 37314
    37314, 3962,
// PINBALL_NOUN_TABLES.agc:690
//		ECADR	DNRNGERR		# 66	POS6			DP3
// slot 37315
    37315, 3994,
// PINBALL_NOUN_TABLES.agc:691
//		ECADR	RTGON67			# 67	POS6			DP3
// slot 37316
    37316, 3990,
// PINBALL_NOUN_TABLES.agc:692
//		ECADR	LAT			# 67	DPDEG(360)		DP4
// slot 37317
    37317, 1158,
// PINBALL_NOUN_TABLES.agc:693
//		ECADR	LONG			# 67	DPDEG(360)		DP4
// slot 37318
    37318, 1162,
// PINBALL_NOUN_TABLES.agc:694
//		ECADR	ROLLC			# 68	DPDEG(360)		DP4
// slot 37319
    37319, 3482,
// PINBALL_NOUN_TABLES.agc:695
//		ECADR	VMAGI			# 68	VEL2			DP4
// slot 37320
    37320, 4004,
// PINBALL_NOUN_TABLES.agc:696
//		ECADR	RDOT			# 68	VEL/2VS			DP4
// slot 37321
    37321, 3966
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:697
//		ECADR	ROLLC			# 69	DPDEG(360)		DP4
// slot 37322
    37322, 3482,
// PINBALL_NOUN_TABLES.agc:698
//		ECADR	Q7			# 69	DRAG ACCEL		DP2
// slot 37323
    37323, 3320,
// PINBALL_NOUN_TABLES.agc:699
//		ECADR	VL			# 69	VEL/2VS			DP4
// slot 37324
    37324, 4076,
// PINBALL_NOUN_TABLES.agc:700
//		ECADR	STARCODE		# 70 	OCTAL ONLY		OCT
// slot 37325
    37325, 954,
// PINBALL_NOUN_TABLES.agc:701
//		ECADR	LANDMARK		# 70	OCTAL ONLY		OCT
// slot 37326
    37326, 3026,
// PINBALL_NOUN_TABLES.agc:702
//		ECADR	HORIZON			# 70	OCTAL ONLY		OCT
// slot 37327
    37327, 3028,
// PINBALL_NOUN_TABLES.agc:703
//		ECADR	STARCODE		# 71	OCTAL ONLY		OCT
// slot 37328
    37328, 954,
// PINBALL_NOUN_TABLES.agc:704
//		ECADR	LANDMARK		# 71	OCTAL ONLY		OCT
// slot 37329
    37329, 3026,
// PINBALL_NOUN_TABLES.agc:705
//		ECADR	HORIZON			# 71 	OCTAL ONLY		OCT
// slot 37330
    37330, 3028,
// PINBALL_NOUN_TABLES.agc:706
//		ECADR	THETZERO		# 72 	DPDEG(360)		DP4
// slot 37331
    37331, 2844,
// PINBALL_NOUN_TABLES.agc:707
//		ECADR	DELHITE			# 72	POS4			DP3
// slot 37332
    37332, 4054,
// PINBALL_NOUN_TABLES.agc:708
//		ECADR	OPTION2			# 72	WHOLE			ARTH
// slot 37333
    37333, 1204,
// PINBALL_NOUN_TABLES.agc:709
//		ECADR	P21ALT			# 73	POS4			DP3
// slot 37334
    37334, 3872,
// PINBALL_NOUN_TABLES.agc:710
//		ECADR	P21VEL			# 73	VEL2			DP4
// slot 37335
    37335, 3876,
// PINBALL_NOUN_TABLES.agc:711
//		ECADR	P21GAM			# 73	DPDEG(360)		DP4
// slot 37336
    37336, 3880,
// PINBALL_NOUN_TABLES.agc:712
//		ECADR	ROLLC			# 74	DPDEG(360)		DP4
// slot 37337
    37337, 3482,
// PINBALL_NOUN_TABLES.agc:713
//		ECADR	VMAGI			# 74	VEL2			DP4
// slot 37338
    37338, 4004,
// PINBALL_NOUN_TABLES.agc:714
//		ECADR	D			# 74	DRAG ACCEL		DP2
// slot 37339
    37339, 3902,
// PINBALL_NOUN_TABLES.agc:715
//		ECADR	DIFFALT			# 75	POS4			DP3
// slot 37340
    37340, 2868,
// PINBALL_NOUN_TABLES.agc:716
//		ECADR	T1TOT2			# 75	MIN/SEC			M/S
// slot 37341
    37341, 2764,
// PINBALL_NOUN_TABLES.agc:717
//		ECADR	T2TOT3			# 75	MIN/SEC			M/S
// slot 37342
    37342, 3930,
// PINBALL_NOUN_TABLES.agc:718
//		OCT	0			# 76	SPARE
// slot 37343
    37343, 0,
// PINBALL_NOUN_TABLES.agc:719
//		OCT	0			# 76	SPARE
// slot 37344
    37344, 0,
// PINBALL_NOUN_TABLES.agc:720
//		OCT	0			# 76	SPARE
// slot 37345
    37345, 0,
// PINBALL_NOUN_TABLES.agc:721
//		OCT	0			# 77	SPARE
// slot 37346
    37346, 0,
// PINBALL_NOUN_TABLES.agc:722
//		OCT	0			# 77	SPARE
// slot 37347
    37347, 0,
// PINBALL_NOUN_TABLES.agc:723
//		OCT	0			# 77	SPARE
// slot 37348
    37348, 0,
// PINBALL_NOUN_TABLES.agc:724
//		OCT	0			# 78	SPARE
// slot 37349
    37349, 0,
// PINBALL_NOUN_TABLES.agc:725
//		OCT	0			# 78	SPARE
// slot 37350
    37350, 0,
// PINBALL_NOUN_TABLES.agc:726
//# Page 282
// PINBALL_NOUN_TABLES.agc:727
//		OCT	0			# 78	SPARE
// slot 37351
    37351, 0,
// PINBALL_NOUN_TABLES.agc:728
//		OCT	0			# 79	SPARE
// slot 37352
    37352, 0,
// PINBALL_NOUN_TABLES.agc:729
//		OCT	0			# 79	SPARE
// slot 37353
    37353, 0,
// PINBALL_NOUN_TABLES.agc:730
//		OCT	0			# 79	SPARE
// slot 37354
    37354, 0,
// PINBALL_NOUN_TABLES.agc:731
//		ECADR	TTOGO			# 80	MIN/SEC			M/S
// slot 37355
    37355, 3936,
// PINBALL_NOUN_TABLES.agc:732
//		ECADR	VGDISP			# 80	VEL2			DP4
// slot 37356
    37356, 4084,
// PINBALL_NOUN_TABLES.agc:733
//		ECADR	DVTOTAL			# 80	VEL2			DP4
// slot 37357
    37357, 3626,
// PINBALL_NOUN_TABLES.agc:734
//		ECADR	DELVLVC			# 81	VEL3			DP3
// slot 37358
    37358, 3592,
// PINBALL_NOUN_TABLES.agc:735
//		ECADR	DELVLVC +2		# 81	VEL3			DP3
// slot 37359
    37359, 3596,
// PINBALL_NOUN_TABLES.agc:736
//		ECADR	DELVLVC +4		# 81	VEL3			DP3
// slot 37360
    37360, 3600,
// PINBALL_NOUN_TABLES.agc:737
//		ECADR	DELVLVC			# 82	VEL3			DP3
// slot 37361
    37361, 3592,
// PINBALL_NOUN_TABLES.agc:738
//		ECADR	DELVLVC +2		# 82	VEL3			DP3
// slot 37362
    37362, 3596,
// PINBALL_NOUN_TABLES.agc:739
//		ECADR	DELVLVC +4		# 82 	VEL3			DP3
// slot 37363
    37363, 3600,
// PINBALL_NOUN_TABLES.agc:740
//		ECADR	DELVIMU			# 83	VEL3			DP3
// slot 37364
    37364, 3960,
// PINBALL_NOUN_TABLES.agc:741
//		ECADR	DELVIMU +2		# 83	VEL3			DP3
// slot 37365
    37365, 3964,
// PINBALL_NOUN_TABLES.agc:742
//		ECADR	DELVIMU +4		# 83	VEL3			DP3
// slot 37366
    37366, 3968,
// PINBALL_NOUN_TABLES.agc:743
//		ECADR	DELVOV			# 84	VEL3			DP3
// slot 37367
    37367, 3774,
// PINBALL_NOUN_TABLES.agc:744
//		ECADR	DELVOV +2		# 84	VEL3			DP3
// slot 37368
    37368, 3778,
// PINBALL_NOUN_TABLES.agc:745
//		ECADR	DELVOV +4		# 84	VEL3			DP3
// slot 37369
    37369, 3782,
// PINBALL_NOUN_TABLES.agc:746
//		ECADR	VGBODY			# 85	VEL3			DP3
// slot 37370
    37370, 3944,
// PINBALL_NOUN_TABLES.agc:747
//		ECADR	VGBODY +2		# 85	VEL3			DP3
// slot 37371
    37371, 3948,
// PINBALL_NOUN_TABLES.agc:748
//		ECADR	VGBODY +4		# 85	VEL3			DP3
// slot 37372
    37372, 3952,
// PINBALL_NOUN_TABLES.agc:749
//		ECADR	DELVLVC			# 86	VEL2			DP4
// slot 37373
    37373, 3592,
// PINBALL_NOUN_TABLES.agc:750
//		ECADR	DELVLVC +2		# 86	VEL2			DP4
// slot 37374
    37374, 3596,
// PINBALL_NOUN_TABLES.agc:751
//		ECADR	DELVLVC +4		# 86	VEL2			DP4
// slot 37375
    37375, 3600,
// PINBALL_NOUN_TABLES.agc:752
//		ECADR	MRKBUF1 +3		# 87	CDU DEG			CDU
// slot 37376
    37376, 4016,
// PINBALL_NOUN_TABLES.agc:753
//		ECADR	MRKBUF1 +5		# 87	Y OPTICS DEG		YOPT
// slot 37377
    37377, 4020,
// PINBALL_NOUN_TABLES.agc:754
//		OCT	0			# 87	SPARE COMPONENT
// slot 37378
    37378, 0,
// PINBALL_NOUN_TABLES.agc:755
//		ECADR	STARSAV3		# 88	DPFRAC		      DPFRAC
// slot 37379
    37379, 3976,
// PINBALL_NOUN_TABLES.agc:756
//		ECADR	STARSAV3 +2		# 88	DPFRAC		      DPFRAC
// slot 37380
    37380, 3980,
// PINBALL_NOUN_TABLES.agc:757
//		ECADR	STARSAV3 +4		# 88	DPFRAC		      DPFRAC
// slot 37381
    37381, 3984,
// PINBALL_NOUN_TABLES.agc:758
//		ECADR	LANDLAT			# 89	DPDEG(90)		DP3
// slot 37382
    37382, 1158,
// PINBALL_NOUN_TABLES.agc:759
//		ECADR	LANDLONG		# 89	DPDEG(90)		DP3
// slot 37383
    37383, 2526,
// PINBALL_NOUN_TABLES.agc:760
//		ECADR	LANDALT			# 89	POS5			DP1
// slot 37384
    37384, 2530,
// PINBALL_NOUN_TABLES.agc:761
//		ECADR	RANGE			# 90	POS5			DP1
// slot 37385
    37385, 2464,
// PINBALL_NOUN_TABLES.agc:762
//		ECADR	RRATE			# 90	VEL3			DP3
// slot 37386
    37386, 2468,
// PINBALL_NOUN_TABLES.agc:763
//		ECADR	RTHETA			# 90	DPDEG(360)		DP4
// slot 37387
    37387, 2472,
// PINBALL_NOUN_TABLES.agc:764
//		ECADR	CDUS			# 91	CDU DEG			CDU
// slot 37388
    37388, 60,
// PINBALL_NOUN_TABLES.agc:765
//		ECADR	CDUT			# 91	Y OPTICS DEG		YOPT
// slot 37389
    37389, 58,
// PINBALL_NOUN_TABLES.agc:766
//		OCT	0			# 91	SPARE COMPONENT
// slot 37390
    37390, 0,
// PINBALL_NOUN_TABLES.agc:767
//		ECADR	SAC			# 92	CDU DEG			CDU
// slot 37391
    37391, 3062,
// PINBALL_NOUN_TABLES.agc:768
//		ECADR	PAC			# 92	Y OPTICS DEG		YOPT
// slot 37392
    37392, 3066,
// PINBALL_NOUN_TABLES.agc:769
//		OCT	0			# 92	SPARE COMPONENT
// slot 37393
    37393, 0,
// PINBALL_NOUN_TABLES.agc:770
//		ECADR	OGC			# 93	DPDEG(90)		DP3
// slot 37394
    37394, 3038,
// PINBALL_NOUN_TABLES.agc:771
//		ECADR	OGC +2			# 93	DPDEG(90)		DP3
// slot 37395
    37395, 3042,
// PINBALL_NOUN_TABLES.agc:772
//		ECADR	OGC +4			# 93	DPDEG(90)		DP3
// slot 37396
    37396, 3046,
// PINBALL_NOUN_TABLES.agc:773
//		ECADR	MRKBUF1 +3		# 94	CDU DEG			CDU
// slot 37397
    37397, 4016,
// PINBALL_NOUN_TABLES.agc:774
//		ECADR	MRKBUF1 +5		# 94 	Y OPTICS DEG		YOPT
// slot 37398
    37398, 4020,
// PINBALL_NOUN_TABLES.agc:775
//		OCT	00000			# 94 	SPARE
// slot 37399
    37399, 0,
// PINBALL_NOUN_TABLES.agc:776
//		ECADR	PRAXIS			# 95	CDU DEG			CDU
// slot 37400
    37400, 4004,
// PINBALL_NOUN_TABLES.agc:777
//# Page 283
// PINBALL_NOUN_TABLES.agc:778
//		ECADR	PRAXIS +1		# 95	CDU DEG			CDU
// slot 37401
    37401, 4006,
// PINBALL_NOUN_TABLES.agc:779
//		ECADR	PRAXIS +2		# 95	CDU DEG			CDU
// slot 37402
    37402, 4008,
// PINBALL_NOUN_TABLES.agc:780
//		ECADR	CPHIX			# 96	CDU DEG			CDU
// slot 37403
    37403, 1462,
// PINBALL_NOUN_TABLES.agc:781
//		ECADR	CPHIX +1		# 96	CDU DEG			CDU
// slot 37404
    37404, 1464,
// PINBALL_NOUN_TABLES.agc:782
//		ECADR	CPHIX +2		# 96	CDU DEG			CDU
// slot 37405
    37405, 1466,
// PINBALL_NOUN_TABLES.agc:783
//		ECADR	DSPTEM1			# 97	WHOLE			ARTH
// slot 37406
    37406, 1098,
// PINBALL_NOUN_TABLES.agc:784
//		ECADR	DSPTEM1 +1		# 97	WHOLE			ARTH
// slot 37407
    37407, 1100,
// PINBALL_NOUN_TABLES.agc:785
//		ECADR	DSPTEM1 +2		# 97	WHOLE			ARTH
// slot 37408
    37408, 1102,
// PINBALL_NOUN_TABLES.agc:786
//		ECADR	DSPTEM2			# 98	WHOLE			ARTH
// slot 37409
    37409, 1104,
// PINBALL_NOUN_TABLES.agc:787
//		ECADR	DSPTEM2 +1		# 98	FRAC			FRAC
// slot 37410
    37410, 1106,
// PINBALL_NOUN_TABLES.agc:788
//		ECADR	DSPTEM2 +2		# 98	WHOLE			ARTH
// slot 37411
    37411, 1108,
// PINBALL_NOUN_TABLES.agc:789
//		ECADR	WWPOS			# 99 	POS9			DP3
// slot 37412
    37412, 2464,
// PINBALL_NOUN_TABLES.agc:790
//		ECADR	WWVEL			# 99	VEL4			DP2
// slot 37413
    37413, 2468,
// PINBALL_NOUN_TABLES.agc:791
//		ECADR	WWOPT			# 99 	WHOLE			ARTH
// slot 37414
    37414, 2472,
// PINBALL_NOUN_TABLES.agc:792
//# END OF IDADDTAB
// PINBALL_NOUN_TABLES.agc:793
//
// PINBALL_NOUN_TABLES.agc:794
//
// PINBALL_NOUN_TABLES.agc:795
//						# NN	SF ROUTINES
// PINBALL_NOUN_TABLES.agc:796
//
// PINBALL_NOUN_TABLES.agc:797
//RUTMXTAB	OCT	16351			# 40	M/S, DP3, DP3
// slot 37415
    37415, 14802,
// PINBALL_NOUN_TABLES.agc:798
//		OCT	00142			# 41	CDU, ARTH
// slot 37416
    37416, 196,
// PINBALL_NOUN_TABLES.agc:799
//		OCT	16347			# 42	DP3, DP3, DP3
// slot 37417
    37417, 14798,
// PINBALL_NOUN_TABLES.agc:800
//		OCT	16512			# 43	DP4, DP4, DP3
// slot 37418
    37418, 14996,
// PINBALL_NOUN_TABLES.agc:801
//		OCT	22347			# 44	DP3, DP3, M/S
// slot 37419
    37419, 18894,
// PINBALL_NOUN_TABLES.agc:802
//		OCT	24454			# 45	2INT, M/S, DP4
// slot 37420
    37420, 21080,
// PINBALL_NOUN_TABLES.agc:803
//		OCT	00000			# 46	OCT, OCT
// slot 37421
    37421, 0,
// PINBALL_NOUN_TABLES.agc:804
//		OCT	00553			# 47	ARITH1, ARITH1
// slot 37422
    37422, 726,
// PINBALL_NOUN_TABLES.agc:805
//		OCT	00143			# 48	ARTH, ARTH
// slot 37423
    37423, 198,
// PINBALL_NOUN_TABLES.agc:806
//		OCT	06347			# 49	DP3, DP3, ARTH
// slot 37424
    37424, 6606,
// PINBALL_NOUN_TABLES.agc:807
//		OCT	22347			# 50	DP3, DP3, M/S
// slot 37425
    37425, 18894,
// PINBALL_NOUN_TABLES.agc:808
//		OCT	00512			# 51	DP4, DP4
// slot 37426
    37426, 660,
// PINBALL_NOUN_TABLES.agc:809
//		OCT	00012			# 52	DP4
// slot 37427
    37427, 20,
// PINBALL_NOUN_TABLES.agc:810
//		OCT	24344			# 53 	DP1, DP3, DP4
// slot 37428
    37428, 20936,
// PINBALL_NOUN_TABLES.agc:811
//		OCT	24344			# 54	DP1, DP3, DP4
// slot 37429
    37429, 20936,
// PINBALL_NOUN_TABLES.agc:812
//		OCT	24503			# 55	ARTH, DP4 , DP4
// slot 37430
    37430, 21126,
// PINBALL_NOUN_TABLES.agc:813
//		OCT	00512			# 56	DP4, DP4
// slot 37431
    37431, 660,
// PINBALL_NOUN_TABLES.agc:814
//		OCT	00007			# 57	DP3
// slot 37432
    37432, 14,
// PINBALL_NOUN_TABLES.agc:815
//		OCT	16347			# 58	DP3, DP3, DP3
// slot 37433
    37433, 14798,
// PINBALL_NOUN_TABLES.agc:816
//		OCT	16347			# 59	DP3, DP3, DP3
// slot 37434
    37434, 14798,
// PINBALL_NOUN_TABLES.agc:817
//		OCT	24503			# 60	ARTH, DP4, DP4
// slot 37435
    37435, 21126,
// PINBALL_NOUN_TABLES.agc:818
//		OCT	06512			# 61	DP4, DP4, ARTH
// slot 37436
    37436, 6804,
// PINBALL_NOUN_TABLES.agc:819
//		OCT	16512			# 62	DP4, DP4, DP3
// slot 37437
    37437, 14996,
// PINBALL_NOUN_TABLES.agc:820
//		OCT	22507			# 63	DP3, DP4, M/S
// slot 37438
    37438, 19086,
// PINBALL_NOUN_TABLES.agc:821
//		OCT	16505			# 64	DP2, DP4, DP3
// slot 37439
    37439, 14986,
// PINBALL_NOUN_TABLES.agc:822
//		OCT	20410			# 65	HMS, HMS, HMS
// slot 37440
    37440, 16912,
// PINBALL_NOUN_TABLES.agc:823
//		OCT	16352			# 66	DP4, DP3, DP3
// slot 37441
    37441, 14804,
// PINBALL_NOUN_TABLES.agc:824
//		OCT	24507			# 67	DP3, DP4, DP4
// slot 37442
    37442, 21134
)).

agcAotInstallSourceRope(list(
// PINBALL_NOUN_TABLES.agc:825
//		OCT	24512			# 68	DP4, DP4, DP4
// slot 37443
    37443, 21140,
// PINBALL_NOUN_TABLES.agc:826
//		OCT	24252			# 69	DP4, DP2, DP4
// slot 37444
    37444, 20820,
// PINBALL_NOUN_TABLES.agc:827
//		OCT	00000			# 70	OCT, OCT, OCT
// slot 37445
    37445, 0,
// PINBALL_NOUN_TABLES.agc:828
//# Page 284
// PINBALL_NOUN_TABLES.agc:829
//		OCT	0			# 71	OCT, OCT, OCT
// slot 37446
    37446, 0,
// PINBALL_NOUN_TABLES.agc:830
//		OCT	06352			# 72	DP4, DP3, ARTH
// slot 37447
    37447, 6612,
// PINBALL_NOUN_TABLES.agc:831
//		OCT	24507			# 73	DPR, DP4, DP4
// slot 37448
    37448, 21134,
// PINBALL_NOUN_TABLES.agc:832
//		OCT	12512			# 74	DP4, DP4, DP2
// slot 37449
    37449, 10900,
// PINBALL_NOUN_TABLES.agc:833
//		OCT	22447			# 75	DP3, M/S, M/S
// slot 37450
    37450, 19022,
// PINBALL_NOUN_TABLES.agc:834
//		OCT	0			# 76	SPARE
// slot 37451
    37451, 0,
// PINBALL_NOUN_TABLES.agc:835
//		OCT	0			# 77	SPARE
// slot 37452
    37452, 0,
// PINBALL_NOUN_TABLES.agc:836
//		OCT	0			# 78	SPARE
// slot 37453
    37453, 0,
// PINBALL_NOUN_TABLES.agc:837
//		OCT	0			# 79	SPARE
// slot 37454
    37454, 0,
// PINBALL_NOUN_TABLES.agc:838
//		OCT	24511			# 80	M/S, DP4, DP4
// slot 37455
    37455, 21138,
// PINBALL_NOUN_TABLES.agc:839
//		OCT	16347			# 81	DP3, DP3, DP3
// slot 37456
    37456, 14798,
// PINBALL_NOUN_TABLES.agc:840
//		OCT	16347			# 82	DP3, DP3, DP3
// slot 37457
    37457, 14798,
// PINBALL_NOUN_TABLES.agc:841
//		OCT	16347			# 83	DP3, DP3, DP3
// slot 37458
    37458, 14798,
// PINBALL_NOUN_TABLES.agc:842
//		OCT	16347			# 84	DP3, DP3, DP3
// slot 37459
    37459, 14798,
// PINBALL_NOUN_TABLES.agc:843
//		OCT	16347			# 85	DP3, DP3, DP3
// slot 37460
    37460, 14798,
// PINBALL_NOUN_TABLES.agc:844
//		OCT	24512			# 86	DP4, DP4, DP4
// slot 37461
    37461, 21140,
// PINBALL_NOUN_TABLES.agc:845
//		OCT	00302			# 87	CDU, YOPT
// slot 37462
    37462, 388,
// PINBALL_NOUN_TABLES.agc:846
//		OCT	32655			# 88	DPFRAC FOR EACH
// slot 37463
    37463, 27482,
// PINBALL_NOUN_TABLES.agc:847
//		OCT	10347			# 89	DP3, DP3, DP1
// slot 37464
    37464, 8654,
// PINBALL_NOUN_TABLES.agc:848
//		OCT	24344			# 90	DP1, DP3, DP4
// slot 37465
    37465, 20936,
// PINBALL_NOUN_TABLES.agc:849
//		OCT	00302			# 91	CDU, YOPT
// slot 37466
    37466, 388,
// PINBALL_NOUN_TABLES.agc:850
//		OCT	00302			# 92	CDU, YOPT
// slot 37467
    37467, 388,
// PINBALL_NOUN_TABLES.agc:851
//		OCT	16347			# 93	DP3, DP3, DP3
// slot 37468
    37468, 14798,
// PINBALL_NOUN_TABLES.agc:852
//		OCT	00302			# 94	CDU, YOPT
// slot 37469
    37469, 388,
// PINBALL_NOUN_TABLES.agc:853
//		OCT	04102			# 95	CDU, CDU, CDU
// slot 37470
    37470, 4228,
// PINBALL_NOUN_TABLES.agc:854
//		OCT	04102			# 96	CDU, CDU, CDU
// slot 37471
    37471, 4228,
// PINBALL_NOUN_TABLES.agc:855
//		OCT	06143			# 97	ARTH, ARTH, ARTH
// slot 37472
    37472, 6342,
// PINBALL_NOUN_TABLES.agc:856
//		OCT	06043			# 98	ARTH, FRAC, ARTH
// slot 37473
    37473, 6214,
// PINBALL_NOUN_TABLES.agc:857
//		OCT	06247			# 99	DP3, DP2, ARTH
// slot 37474
    37474, 6478
)).

// no code for the lines below
// PINBALL_NOUN_TABLES.agc:858
//# END OF RUTMXTAB
// PINBALL_NOUN_TABLES.agc:859
//
// PINBALL_NOUN_TABLES.agc:860
//
// PINBALL_NOUN_TABLES.agc:861
//		SBANK=	LOWSUPER
