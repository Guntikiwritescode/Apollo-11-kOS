// TVCMASSPROP.agc
// bank 05, slots 7926-7932
function agcAotUnit435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7928 {
        if slot <= 7926 {
// TVCMASSPROP.agc:1
//# Copyright:	Public domain.
// TVCMASSPROP.agc:2
//# Filename:	TVCMASSPROP.agc
// TVCMASSPROP.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// TVCMASSPROP.agc:4
//#		It is part of the source code for the Command Module's (CM)
// TVCMASSPROP.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TVCMASSPROP.agc:6
//# Assembler:	yaYUL
// TVCMASSPROP.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// TVCMASSPROP.agc:8
//# Website:	www.ibiblio.org/apollo.
// TVCMASSPROP.agc:9
//# Pages:	951-955
// TVCMASSPROP.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// TVCMASSPROP.agc:11
//#				same name, using Comanche055 page images.
// TVCMASSPROP.agc:12
//#
// TVCMASSPROP.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// TVCMASSPROP.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// TVCMASSPROP.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// TVCMASSPROP.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// TVCMASSPROP.agc:17
//# consequent reduction in image quality as well) are available online at
// TVCMASSPROP.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// TVCMASSPROP.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// TVCMASSPROP.agc:20
//# (much) higher-quality images which Paul actually created.
// TVCMASSPROP.agc:21
//#
// TVCMASSPROP.agc:22
//# Notations on the hardcopy document read, in part:
// TVCMASSPROP.agc:23
//#
// TVCMASSPROP.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// TVCMASSPROP.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// TVCMASSPROP.agc:26
//#
// TVCMASSPROP.agc:27
//#	This AGC program shall also be referred to as
// TVCMASSPROP.agc:28
//#			Colossus 2A
// TVCMASSPROP.agc:29
//
// TVCMASSPROP.agc:30
//# Page 951
// TVCMASSPROP.agc:31
//# PROGRAM NAME....MASSPROP
// TVCMASSPROP.agc:32
//# LOG SECTION....TVCMASSPROP		PROGRAMMER...MELANSON (ENGEL, SCHLUNDT)
// TVCMASSPROP.agc:33
//#
// TVCMASSPROP.agc:34
//#
// TVCMASSPROP.agc:35
//# FUNCTIONAL DESCRIPTION:
// TVCMASSPROP.agc:36
//#
// TVCMASSPROP.agc:37
//#	MASSPROP OPERATES IN TWO MODES:(1)IF LEM MASS OR CONFIGURATION ARE UPDATED (MASSPROP DOES NOT TEST
// TVCMASSPROP.agc:38
//# FOR THIS) THE ENTIRE PROGRAM MUST BE RUN THROUGH, BREAKPOINT VALUES AND DERIVATIVES OF THE OUTPUTS WITH
// TVCMASSPROP.agc:39
//# RESPECT TO CSM MASS BEING CALCULATED PRIOR TO CALCULATION OF THE OUTPUTS.  (2)OTHERWISE, THE OUTPUTS CAN BE
// TVCMASSPROP.agc:40
//# CALCULATED USING PREVIOUSLY COMPUTED BREAKPOINT VALUES AND DERIVATIVES.
// TVCMASSPROP.agc:41
//#
// TVCMASSPROP.agc:42
//# CALLING SEQUENCES
// TVCMASSPROP.agc:43
//#
// TVCMASSPROP.agc:44
//#	IF LEM MASS OR CONFIGURATION HAS BEEN UPDATED, TRANSFER TO MASSPROP, OTHERWISE TRANSFER TO FIXCW.
// TVCMASSPROP.agc:45
//#		L	TC	BANKCALL OR IBNKCALL
// TVCMASSPROP.agc:46
//#		L+1	CADR	MASSPROP
// TVCMASSPROP.agc:47
//#			OR
// TVCMASSPROP.agc:48
//#		L+1	CADR	FIXCW
// TVCMASSPROP.agc:49
//#
// TVCMASSPROP.agc:50
//#		L+2	RETURNS VIA Q
// TVCMASSPROP.agc:51
//#
// TVCMASSPROP.agc:52
//# CALLED	IN PARTICULAR BY DONOUN47 (JOB) AND TVCEXECUTIVE (TASK)
// TVCMASSPROP.agc:53
//#
// TVCMASSPROP.agc:54
//# JOBS OR TASKS INITIATED - NONE
// TVCMASSPROP.agc:55
//#
// TVCMASSPROP.agc:56
//# SUBROUTINES CALLED - NONE
// TVCMASSPROP.agc:57
//#
// TVCMASSPROP.agc:58
//# ERASABLE INITIALIZATION REQUIRED
// TVCMASSPROP.agc:59
//#
// TVCMASSPROP.agc:60
//#	LEMMASS MUST CONTAIN LEM MASS SCALED AT B+16 KILOGRAMS
// TVCMASSPROP.agc:61
//#	CSMMASS MUST CONTAIN CSM MASS SCALED AT B+16 KILOGRAMS
// TVCMASSPROP.agc:62
//#
// TVCMASSPROP.agc:63
//#	DAPDATR1 MUST BE SET TO INDICATE VEHICLE CONFIGURATION.
// TVCMASSPROP.agc:64
//#		BITS (15,14,13)  =  ( 0 , 0 , 1 )	LEM OFF
// TVCMASSPROP.agc:65
//#				    ( 0 , 1 , 0 )	LEM ON (ASCNT,DSCNT)
// TVCMASSPROP.agc:66
//#				    ( 1 , 1 , 0 )	LEM ON (ASCNT ONLY)
// TVCMASSPROP.agc:67
//#
// TVCMASSPROP.agc:68
//#
// TVCMASSPROP.agc:69
//# ALARMS -	NONE
// TVCMASSPROP.agc:70
//#
// TVCMASSPROP.agc:71
//# EXIT -	TC	Q
// TVCMASSPROP.agc:72
//#
// TVCMASSPROP.agc:73
//# OUTPUTS:
// TVCMASSPROP.agc:74
//#
// TVCMASSPROP.agc:75
//#	(1)IXX, SINGLE PRECISION SCALED AT B+20 IN KG-M SQ.
// TVCMASSPROP.agc:76
//#	(2)IAVG, SINGLE PRECISION SCALED AT B+20 IN KG-M SQ.
// TVCMASSPROP.agc:77
//#	(3)IAVG/TLX, SINGLE PRECISION, SCALED AT B+2 SEC-SQD
// TVCMASSPROP.agc:78
//#	THEY ARE STORED IN CONSECUTIVE REGISTERS IXX0, IXX1, IXX2
// TVCMASSPROP.agc:79
//#
// TVCMASSPROP.agc:80
//#	CONVERSION FACTOR :  (SLUG-FTSQ) = 0.737562 (KG-MSQ)
// TVCMASSPROP.agc:81
//# Page 952
// TVCMASSPROP.agc:82
//#
// TVCMASSPROP.agc:83
//# OUTPUTS ARE CALCULATED AS FOLLOWS:
// TVCMASSPROP.agc:84
//#
// TVCMASSPROP.agc:85
//#   (1) IF LEM DOCKED, LEMMASS IS FIRST ELIMINATED AS A PARAMETER
// TVCMASSPROP.agc:86
//#
// TVCMASSPROP.agc:87
//#	VARST0 = INTVALUE0 + LEMMASS(SLOPEVAL0)		IXX		BREAKPOINT VALUE
// TVCMASSPROP.agc:88
//#	VARST1 = INTVALUE1 + LEMMASS(SLOPEVAL1)		IAVG		BREAKPOINT VALUE
// TVCMASSPROP.agc:89
//#	VARST2 = INTVALUE2 + LEMMASS(SLOPEVAL2)		IAVG/TLX	BREAKPOINT VALUE
// TVCMASSPROP.agc:90
//#
// TVCMASSPROP.agc:91
//#	VARST3 = INTVALUE3 + LEMMASS(SLOPEVAL3)		IAVG/TLX	SLOPE FOR CSMMASS > 33956 LBS ( SPS > 10000 LBS)
// TVCMASSPROP.agc:92
//#	VARST4 = INTVALUE4 + LEMMASS(SLOPEVAL4)		IAVG		SLOPE FOR CSMMASS > 33956 LBS ( SPS > 10000 LBS)
// TVCMASSPROP.agc:93
//#
// TVCMASSPROP.agc:94
//#	VARST5 = INTVALUE5 + LEMMASS(SLOPEVAL5)		IXX		SLOPE FOR ALL VALUES OF CSMMASS
// TVCMASSPROP.agc:95
//#
// TVCMASSPROP.agc:96
//#	VARST6 = INTVALUE6 + LEMMASS(SLOPEVAL6)		IAVG		SLOPE FOR CSMMASS < 33956 LBS ( SPS < 10000 LBS)
// TVCMASSPROP.agc:97
//#	VARST7 = INTVALUE7 + LEMMASS(SLOPEVAL7)		IAVG/TLX	SLOPE FOR CSMMASS < 33956 LBS ( SPS < 10000 LBS)
// TVCMASSPROP.agc:98
//#
// TVCMASSPROP.agc:99
//#	VARST8 = INTVALUE8 + LEMMASS(SLOPEVAL8)		IAVG		DECREMENT TO BRKPT VALUE WHEN LEM DSCNT STAGE OFF
// TVCMASSPROP.agc:100
//#	VARST9 = INTVALUE9 + LEMMASS(SLOPEVAL9)		IAVG/TLX	DECREMENT TO BRKPT VALUE WHEN LEM DSCNT STAGE OFF
// TVCMASSPROP.agc:101
//#
// TVCMASSPROP.agc:102
//#   (2) IF LEM NOT DOCKED
// TVCMASSPROP.agc:103
//#
// TVCMASSPROP.agc:104
//#	VARST0 = NOLEMVAL0	WHERE THE MEANING AND SCALING OF VARST0
// TVCMASSPROP.agc:105
//#		.	.	TO VARST9 ARE THE SAME AS GIVEN ABOVE
// TVCMASSPROP.agc:106
//#		.	.
// TVCMASSPROP.agc:107
//#		.	.	NOTE... FOR THIS CASE, VARST8,9 HAVE NO
// TVCMASSPROP.agc:108
//#	VARST9 = NOLEMVAL9	MEANING (THEY ARE COMPUTED BUT NOT USED)
// TVCMASSPROP.agc:109
//#
// TVCMASSPROP.agc:110
//#   (3) THE FINAL OUTPUT CALCULATIONS ARE THEN DONE
// TVCMASSPROP.agc:111
//#
// TVCMASSPROP.agc:112
//#	IXX0 = VARST0 + (CSMMASS + NEGBPW)VARST5		IXX
// TVCMASSPROP.agc:113
//#
// TVCMASSPROP.agc:114
//#	IXX1 = VARST1 + (CSMMASS + NEGBPW)VARST(4 OR 6)		IAVG
// TVCMASSPROP.agc:115
//#
// TVCMASSPROP.agc:116
//#	IXX2 = VARST2 + (CSMMASS + NEGBPW)VARST(3 OR 7)		IAVG/TLX
// TVCMASSPROP.agc:117
//#
// TVCMASSPROP.agc:118
//#
// TVCMASSPROP.agc:119
//# THE DATA USED CAME FROM CSM/LM SPACECRAFT OPERATIONAL DATA BOOK.
// TVCMASSPROP.agc:120
//#	VOL. 3, NASA DOCUMENT SNA-8-D-027 (MARCH 1968)
// TVCMASSPROP.agc:121
//#
// TVCMASSPROP.agc:122
//# PERTINENT MASS DATA :		CSM WEIGHT	(FULL)	64100 LBS.
// TVCMASSPROP.agc:123
//#						(EMPTY)	23956 LBS.
// TVCMASSPROP.agc:124
//#				LEM WEIGHT	(FULL)	32000 LBS.
// TVCMASSPROP.agc:125
//#						(EMPTY)	14116 LBS.
// TVCMASSPROP.agc:126
//#
// TVCMASSPROP.agc:127
//# (WEIGHTS ARE FROM AMENDMENT #1 (APRIL 24,1968) TO ABOVE DATA BOOK)
// TVCMASSPROP.agc:128
//# Page 953
// TVCMASSPROP.agc:129
//
// TVCMASSPROP.agc:130
//		BANK	25
// TVCMASSPROP.agc:131
//		SETLOC	DAPMASS
// TVCMASSPROP.agc:132
//		BANK
// TVCMASSPROP.agc:133
//		EBANK=	BZERO
// TVCMASSPROP.agc:134
//		COUNT*	$$/MASP
// TVCMASSPROP.agc:135
//
// TVCMASSPROP.agc:136
//
// TVCMASSPROP.agc:137
//MASSPROP	CAF	NINE		# MASSPROP USES TVC/RCS INTERRUPT TEMPS
// slot 7926
            if slot <> 7926 or instruction <> 14556 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7927 {
// TVCMASSPROP.agc:138
//		TS	PHI333		# SET UP TEN PASSES
// slot 7927
                if slot <> 7927 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCMASSPROP.agc:139
//
// TVCMASSPROP.agc:140
//LEMTEST		CAE	DAPDATR1	# DETERMINE LEM STATUS
// slot 7928
                if slot <> 7928 or instruction <> 13110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 822).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7930 {
            if slot <= 7929 {
// TVCMASSPROP.agc:141
//		MASK	BIT13
// slot 7929
                if slot <> 7929 or instruction <> 31235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    if fixedOperand = 4096 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCMASSPROP.agc:142
//		EXTEND
// slot 7930
                if slot <> 7930 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7931 {
// TVCMASSPROP.agc:143
//		BZF	LEMYES
// slot 7931
                if slot <> 7931 or instruction <> 5887 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5887, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCMASSPROP.agc:144
//
// TVCMASSPROP.agc:145
//LEMNO		INDEX	PHI333		# LEM NOT ATTACHED
// slot 7932
                if slot <> 7932 or instruction <> 21318 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[435] to agcAotUnit435@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:146
//		CAF	NOLEMVAL
// slot 7933
    7933, 28262
)).

// bank 05, slots 7934-7938
function agcAotUnit436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7935 {
        if slot <= 7934 {
// TVCMASSPROP.agc:147
//		TCF	STOINST
// slot 7934
            if slot <> 7934 or instruction <> 5895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5895, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCMASSPROP.agc:148
//
// TVCMASSPROP.agc:149
//LEMYES		CAE	LEMMASS		# LEM IS ATTACHED
// slot 7935
            if slot <> 7935 or instruction <> 13115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 827).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7936 {
// TVCMASSPROP.agc:150
//		DOUBLE
// slot 7936
            if slot <> 7936 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7937 {
// TVCMASSPROP.agc:151
//		EXTEND
// slot 7937
                if slot <> 7937 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCMASSPROP.agc:152
//		INDEX	PHI333
// slot 7938
                if slot <> 7938 or instruction <> 21318 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21318, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[436] to agcAotUnit436@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:153
//		MP	SLOPEVAL
// slot 7939
    7939, 61066
)).

// bank 05, slots 7940-7941
function agcAotUnit437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7940 {
// TVCMASSPROP.agc:154
//		DDOUBL
// slot 7940
        if slot <> 7940 or instruction <> 8193 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            if not agcCoreDas(words, 1) { return -1. }
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// TVCMASSPROP.agc:155
//		INDEX	PHI333
// slot 7941
        if slot <> 7941 or instruction <> 21318 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21318, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[437] to agcAotUnit437@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:156
//		AD	INTVALUE
// slot 7942
    7942, 52854
)).

// bank 05, slots 7943-7943
function agcAotUnit438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TVCMASSPROP.agc:157
//
// TVCMASSPROP.agc:158
//STOINST		INDEX	PHI333		# STORAGE INST BEGIN HERE
// slot 7943
    if slot <> 7943 or instruction <> 21318 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21318, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[438] to agcAotUnit438@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:159
//		TS	VARST0
// slot 7944
    7944, 46738
)).

// bank 05, slots 7945-7965
function agcAotUnit439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7954 {
        if slot <= 7949 {
            if slot <= 7946 {
                if slot <= 7945 {
// TVCMASSPROP.agc:160
//		CCS	PHI333		# ARE ALL TEN PASSES COMPLETED
// slot 7945
                    if slot <> 7945 or instruction <> 4934 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 838).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:161
//		TCF	MASSPROP +1	# NO - GO DECREMENT PHI333
// slot 7946
                    if slot <> 7946 or instruction <> 5879 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5879, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7947 {
// TVCMASSPROP.agc:162
//
// TVCMASSPROP.agc:163
//DXTEST		CCS	DAPDATR1	# IF NEG, BIT15 IS 1, LEM DSCNT STAGE OFF
// slot 7947
                    if slot <> 7947 or instruction <> 4918 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7948 {
// TVCMASSPROP.agc:164
//		TCF	FIXCW
// slot 7948
                        if slot <> 7948 or instruction <> 5906 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5906, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCMASSPROP.agc:165
//		TCF	FIXCW
// slot 7949
                        if slot <> 7949 or instruction <> 5906 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5906, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7951 {
                if slot <= 7950 {
// TVCMASSPROP.agc:166
//		DXCH	VARST0 +8D
// slot 7950
                    if slot <> 7950 or instruction <> 22354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 850, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:167
//		DAS	VARST0 +1
// slot 7951
                    if slot <> 7951 or instruction <> 9035 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 843) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7952 {
// TVCMASSPROP.agc:168
//		CA	DXITFIX
// slot 7952
                    if slot <> 7952 or instruction <> 14160 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1872), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7953 {
// TVCMASSPROP.agc:169
//		ADS	VARST0 +7
// slot 7953
                        if slot <> 7953 or instruction <> 12112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 848).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCMASSPROP.agc:170
//
// TVCMASSPROP.agc:171
//FIXCW		CAF	BIT2		# COMPUTATION PHASE BEGINS HERE.  SET UP
// slot 7954
                        if slot <> 7954 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 7959 {
            if slot <= 7956 {
                if slot <= 7955 {
// TVCMASSPROP.agc:172
//		TS	PHI333		# THREE PASSES
// slot 7955
                    if slot <> 7955 or instruction <> 23366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:173
//		TS	PSI333
// slot 7956
                    if slot <> 7956 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7957 {
// TVCMASSPROP.agc:174
//
// TVCMASSPROP.agc:175
//		CAE	CSMMASS		# GET DELTA CSM WEIGHT - SIGN DETERMINES
// slot 7957
                    if slot <> 7957 or instruction <> 13116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 828).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7958 {
// TVCMASSPROP.agc:176
//		AD	NEGBPW		# SLOPE LOCATIONS.
// slot 7958
                        if slot <> 7958 or instruction <> 26447 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1871), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCMASSPROP.agc:177
//		DOUBLE
// slot 7959
                        if slot <> 7959 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7962 {
                if slot <= 7960 {
// TVCMASSPROP.agc:178
//		TS	TEMP333
// slot 7960
                    if slot <> 7960 or instruction <> 23368 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23368, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7961 {
// TVCMASSPROP.agc:179
//# Page 954
// TVCMASSPROP.agc:180
//		EXTEND
// slot 7961
                        if slot <> 7961 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCMASSPROP.agc:181
//		BZMF	PEGGY		# DETERMINE CORRECT SLOPE
// slot 7962
                        if slot <> 7962 or instruction <> 26397 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26397, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7963 {
// TVCMASSPROP.agc:182
//		CAF	NEG2
// slot 7963
                    if slot <> 7963 or instruction <> 16333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7964 {
// TVCMASSPROP.agc:183
//		TS	PHI333
// slot 7964
                        if slot <> 7964 or instruction <> 23366 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23366, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCMASSPROP.agc:184
//
// TVCMASSPROP.agc:185
//PEGGY		INDEX	PHI333		# ALL IS READY - CALCULATE OUTPUTS NOW
// slot 7965
                        if slot <> 7965 or instruction <> 21318 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21318, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21318, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[439] to agcAotUnit439@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:186
//		CAE	VARST5		# GET SLOPE
// slot 7966
    7966, 26268
)).

// bank 05, slots 7967-7970
function agcAotUnit440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7968 {
        if slot <= 7967 {
// TVCMASSPROP.agc:187
//		EXTEND
// slot 7967
            if slot <> 7967 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCMASSPROP.agc:188
//		MP	TEMP333		# MULT BY DELTA CSM WEIGHT
// slot 7968
            if slot <> 7968 or instruction <> 29512 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 840, readEffective:call(words, 840)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7969 {
// TVCMASSPROP.agc:189
//		DOUBLE
// slot 7969
            if slot <> 7969 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCMASSPROP.agc:190
//		INDEX	PSI333
// slot 7970
            if slot <> 7970 or instruction <> 21319 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21319, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[440] to agcAotUnit440@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:191
//		AD	VARST0		# ADD BREAKPOINT VALUE
// slot 7971
    7971, 50834
)).

// bank 05, slots 7972-7972
function agcAotUnit441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TVCMASSPROP.agc:192
//		INDEX	PSI333
// slot 7972
    if slot <> 7972 or instruction <> 21319 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21319, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[441] to agcAotUnit441@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:193
//		TS	IXX		# ****** OUTPUTS (IXX0, IXX1, IXX2) ******
// slot 7973
    7973, 46704
)).

// bank 05, slots 7974-7986
function agcAotUnit442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7979 {
        if slot <= 7976 {
            if slot <= 7974 {
// TVCMASSPROP.agc:194
//
// TVCMASSPROP.agc:195
//
// TVCMASSPROP.agc:196
//		CCS	PSI333		# BOOKKEEPING - MASSPROP FINISHED OR NOT
// slot 7974
                if slot <> 7974 or instruction <> 4935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 839).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7975 {
// TVCMASSPROP.agc:197
//		TCF	BOKKEP2		# NO - GO TAKE CARE OF INDEXING REGISTERS
// slot 7975
                    if slot <> 7975 or instruction <> 5935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:198
//
// TVCMASSPROP.agc:199
//		CAE	DAPDATR1	# UPDATE WEIGHT/G
// slot 7976
                    if slot <> 7976 or instruction <> 13110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7977 {
// TVCMASSPROP.agc:200
//		MASK	BIT14
// slot 7977
                if slot <> 7977 or instruction <> 31234 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    if fixedOperand = 8192 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 2) * 8192).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7978 {
// TVCMASSPROP.agc:201
//		CCS	A
// slot 7978
                    if slot <> 7978 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:202
//		CA	LEMMASS
// slot 7979
                    if slot <> 7979 or instruction <> 13115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 827).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7982 {
            if slot <= 7980 {
// TVCMASSPROP.agc:203
//		AD	CSMMASS
// slot 7980
                if slot <> 7980 or instruction <> 25404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 828).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7981 {
// TVCMASSPROP.agc:204
//		TS	WEIGHT/G	# SCALED AT B+16 KILOGRAMS
// slot 7981
                    if slot <> 7981 or instruction <> 23357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23357, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:205
//ENDMASSP	TC	Q
// slot 7982
                    if slot <> 7982 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7984 {
                if slot <= 7983 {
// TVCMASSPROP.agc:206
//
// TVCMASSPROP.agc:207
//BOKKEP2		TS	PSI333		# REDUCE PSI BY ONE
// slot 7983
                    if slot <> 7983 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:208
//		EXTEND
// slot 7984
                    if slot <> 7984 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7985 {
// TVCMASSPROP.agc:209
//		DIM	PHI333
// slot 7985
                    if slot <> 7985 or instruction <> 12102 { return choose false if checkOnly else -1. }
                    if extended {
                        local operandSlot is agcAddressSlot(838, words[3], words[4], words["channel7"]).
                        if operandSlot >= 16 and operandSlot <= 19 and
                            (words[operandSlot] = 0 or words[operandSlot] = 32767) { return choose false if checkOnly else -1. }
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDIM(words, 838).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCMASSPROP.agc:210
//		TCF	PEGGY
// slot 7986
                    if slot <> 7986 or instruction <> 5917 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5917, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[442] to agcAotUnit442@.

agcAotInstallSourceRope(list(
// TVCMASSPROP.agc:211
//
// TVCMASSPROP.agc:212
//# Page 955
// TVCMASSPROP.agc:213
//NOLEMVAL	DEC	25445 B-20
// slot 7987
    7987, 796,
// TVCMASSPROP.agc:214
//		DEC	87450 B-20
// slot 7988
    7988, 2732,
// TVCMASSPROP.agc:215
//		DEC	.30715 B-2
// slot 7989
    7989, 2516,
// TVCMASSPROP.agc:216
//		DEC	1.22877 E-5 B+12
// slot 7990
    7990, 1650,
// TVCMASSPROP.agc:217
//		DEC	1.6096 B-6
// slot 7991
    7991, 824,
// TVCMASSPROP.agc:218
//		DEC	1.54 B-6
// slot 7992
    7992, 788,
// TVCMASSPROP.agc:219
//		DEC	7.77177 B-6
// slot 7993
    7993, 3980,
// TVCMASSPROP.agc:220
//		DEC	3.46458 E-5 B+12
// slot 7994
    7994, 4650,
// TVCMASSPROP.agc:221
//
// TVCMASSPROP.agc:222
//INTVALUE	DEC	26850 B-20
// slot 7995
    7995, 840,
// TVCMASSPROP.agc:223
//		DEC	127518 B-20
// slot 7996
    7996, 3984,
// TVCMASSPROP.agc:224
//		DEC	.54059 B-2
// slot 7997
    7997, 4428,
// TVCMASSPROP.agc:225
//		DEC	.153964 E-4 B+12
// slot 7998
    7998, 2066,
// TVCMASSPROP.agc:226
//		DEC	-.742923 B-6
// slot 7999
    7999, 65154,
// TVCMASSPROP.agc:227
//		DEC	1.5398 B-6
// slot 8000
    8000, 788,
// TVCMASSPROP.agc:228
//		DEC	9.68 B-6
// slot 8001
    8001, 4956,
// TVCMASSPROP.agc:229
//		DEC	.647625	E-4 B+12
// slot 8002
    8002, 8692,
// TVCMASSPROP.agc:230
//		DEC	-27228 B-20
// slot 8003
    8003, 64684,
// TVCMASSPROP.agc:231
//		DEC	-.206476 B-2
// slot 8004
    8004, 63842,
// TVCMASSPROP.agc:232
//
// TVCMASSPROP.agc:233
//SLOPEVAL	DEC	1.96307 B-6
// slot 8005
    8005, 1006,
// TVCMASSPROP.agc:234
//		DEC	27.5774 B-6
// slot 8006
    8006, 14120,
// TVCMASSPROP.agc:235
//		DEC	2.3548 E-5 B+12
// slot 8007
    8007, 3160,
// TVCMASSPROP.agc:236
//		DEC	2.1777 E-9 B+26
// slot 8008
    8008, 4788,
// TVCMASSPROP.agc:237
//		DEC	1.044 E-3 B+8
// slot 8009
    8009, 8758,
// TVCMASSPROP.agc:238
//		DEC	0
// slot 8010
    8010, 0,
// TVCMASSPROP.agc:239
//		DEC	2.21068 E-3 B+8
// slot 8011
    8011, 18544,
// TVCMASSPROP.agc:240
//		DEC	1.5166 E-9 B+26
// slot 8012
    8012, 3336,
// TVCMASSPROP.agc:241
//		DEC	-1.284 B-6
// slot 8013
    8013, 64876,
// TVCMASSPROP.agc:242
//		DEC	2 E-5 B+12
// slot 8014
    8014, 2684,
// TVCMASSPROP.agc:243
//
// TVCMASSPROP.agc:244
//NEGBPW		DEC	-15402.17 B-16
// slot 8015
    8015, 57832,
// TVCMASSPROP.agc:245
//DXITFIX		DEC*	-1.88275 E-5 B+12*
// slot 8016
    8016, 63008
)).

