// PORT: Original source unit TVCMASSPROP.agc.
// PORT: Physical bank 05. Shared continuation entries, slots 7926–7932.
function agcAotUnit435 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7928 {
        if slot <= 7926 {
// PORT: SOURCE TVCMASSPROP.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCMASSPROP.agc:2
//# Filename:	TVCMASSPROP.agc
// PORT: SOURCE TVCMASSPROP.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCMASSPROP.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCMASSPROP.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCMASSPROP.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCMASSPROP.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCMASSPROP.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCMASSPROP.agc:9
//# Pages:	951-955
// PORT: SOURCE TVCMASSPROP.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCMASSPROP.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCMASSPROP.agc:12
//#
// PORT: SOURCE TVCMASSPROP.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCMASSPROP.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCMASSPROP.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCMASSPROP.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCMASSPROP.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCMASSPROP.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCMASSPROP.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCMASSPROP.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCMASSPROP.agc:21
//#
// PORT: SOURCE TVCMASSPROP.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCMASSPROP.agc:23
//#
// PORT: SOURCE TVCMASSPROP.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCMASSPROP.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCMASSPROP.agc:26
//#
// PORT: SOURCE TVCMASSPROP.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCMASSPROP.agc:28
//#			Colossus 2A
// PORT: SOURCE TVCMASSPROP.agc:29
//
// PORT: SOURCE TVCMASSPROP.agc:30
//# Page 951
// PORT: SOURCE TVCMASSPROP.agc:31
//# PROGRAM NAME....MASSPROP
// PORT: SOURCE TVCMASSPROP.agc:32
//# LOG SECTION....TVCMASSPROP		PROGRAMMER...MELANSON (ENGEL, SCHLUNDT)
// PORT: SOURCE TVCMASSPROP.agc:33
//#
// PORT: SOURCE TVCMASSPROP.agc:34
//#
// PORT: SOURCE TVCMASSPROP.agc:35
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE TVCMASSPROP.agc:36
//#
// PORT: SOURCE TVCMASSPROP.agc:37
//#	MASSPROP OPERATES IN TWO MODES:(1)IF LEM MASS OR CONFIGURATION ARE UPDATED (MASSPROP DOES NOT TEST
// PORT: SOURCE TVCMASSPROP.agc:38
//# FOR THIS) THE ENTIRE PROGRAM MUST BE RUN THROUGH, BREAKPOINT VALUES AND DERIVATIVES OF THE OUTPUTS WITH
// PORT: SOURCE TVCMASSPROP.agc:39
//# RESPECT TO CSM MASS BEING CALCULATED PRIOR TO CALCULATION OF THE OUTPUTS.  (2)OTHERWISE, THE OUTPUTS CAN BE
// PORT: SOURCE TVCMASSPROP.agc:40
//# CALCULATED USING PREVIOUSLY COMPUTED BREAKPOINT VALUES AND DERIVATIVES.
// PORT: SOURCE TVCMASSPROP.agc:41
//#
// PORT: SOURCE TVCMASSPROP.agc:42
//# CALLING SEQUENCES
// PORT: SOURCE TVCMASSPROP.agc:43
//#
// PORT: SOURCE TVCMASSPROP.agc:44
//#	IF LEM MASS OR CONFIGURATION HAS BEEN UPDATED, TRANSFER TO MASSPROP, OTHERWISE TRANSFER TO FIXCW.
// PORT: SOURCE TVCMASSPROP.agc:45
//#		L	TC	BANKCALL OR IBNKCALL
// PORT: SOURCE TVCMASSPROP.agc:46
//#		L+1	CADR	MASSPROP
// PORT: SOURCE TVCMASSPROP.agc:47
//#			OR
// PORT: SOURCE TVCMASSPROP.agc:48
//#		L+1	CADR	FIXCW
// PORT: SOURCE TVCMASSPROP.agc:49
//#
// PORT: SOURCE TVCMASSPROP.agc:50
//#		L+2	RETURNS VIA Q
// PORT: SOURCE TVCMASSPROP.agc:51
//#
// PORT: SOURCE TVCMASSPROP.agc:52
//# CALLED	IN PARTICULAR BY DONOUN47 (JOB) AND TVCEXECUTIVE (TASK)
// PORT: SOURCE TVCMASSPROP.agc:53
//#
// PORT: SOURCE TVCMASSPROP.agc:54
//# JOBS OR TASKS INITIATED - NONE
// PORT: SOURCE TVCMASSPROP.agc:55
//#
// PORT: SOURCE TVCMASSPROP.agc:56
//# SUBROUTINES CALLED - NONE
// PORT: SOURCE TVCMASSPROP.agc:57
//#
// PORT: SOURCE TVCMASSPROP.agc:58
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE TVCMASSPROP.agc:59
//#
// PORT: SOURCE TVCMASSPROP.agc:60
//#	LEMMASS MUST CONTAIN LEM MASS SCALED AT B+16 KILOGRAMS
// PORT: SOURCE TVCMASSPROP.agc:61
//#	CSMMASS MUST CONTAIN CSM MASS SCALED AT B+16 KILOGRAMS
// PORT: SOURCE TVCMASSPROP.agc:62
//#
// PORT: SOURCE TVCMASSPROP.agc:63
//#	DAPDATR1 MUST BE SET TO INDICATE VEHICLE CONFIGURATION.
// PORT: SOURCE TVCMASSPROP.agc:64
//#		BITS (15,14,13)  =  ( 0 , 0 , 1 )	LEM OFF
// PORT: SOURCE TVCMASSPROP.agc:65
//#				    ( 0 , 1 , 0 )	LEM ON (ASCNT,DSCNT)
// PORT: SOURCE TVCMASSPROP.agc:66
//#				    ( 1 , 1 , 0 )	LEM ON (ASCNT ONLY)
// PORT: SOURCE TVCMASSPROP.agc:67
//#
// PORT: SOURCE TVCMASSPROP.agc:68
//#
// PORT: SOURCE TVCMASSPROP.agc:69
//# ALARMS -	NONE
// PORT: SOURCE TVCMASSPROP.agc:70
//#
// PORT: SOURCE TVCMASSPROP.agc:71
//# EXIT -	TC	Q
// PORT: SOURCE TVCMASSPROP.agc:72
//#
// PORT: SOURCE TVCMASSPROP.agc:73
//# OUTPUTS:
// PORT: SOURCE TVCMASSPROP.agc:74
//#
// PORT: SOURCE TVCMASSPROP.agc:75
//#	(1)IXX, SINGLE PRECISION SCALED AT B+20 IN KG-M SQ.
// PORT: SOURCE TVCMASSPROP.agc:76
//#	(2)IAVG, SINGLE PRECISION SCALED AT B+20 IN KG-M SQ.
// PORT: SOURCE TVCMASSPROP.agc:77
//#	(3)IAVG/TLX, SINGLE PRECISION, SCALED AT B+2 SEC-SQD
// PORT: SOURCE TVCMASSPROP.agc:78
//#	THEY ARE STORED IN CONSECUTIVE REGISTERS IXX0, IXX1, IXX2
// PORT: SOURCE TVCMASSPROP.agc:79
//#
// PORT: SOURCE TVCMASSPROP.agc:80
//#	CONVERSION FACTOR :  (SLUG-FTSQ) = 0.737562 (KG-MSQ)
// PORT: SOURCE TVCMASSPROP.agc:81
//# Page 952
// PORT: SOURCE TVCMASSPROP.agc:82
//#
// PORT: SOURCE TVCMASSPROP.agc:83
//# OUTPUTS ARE CALCULATED AS FOLLOWS:
// PORT: SOURCE TVCMASSPROP.agc:84
//#
// PORT: SOURCE TVCMASSPROP.agc:85
//#   (1) IF LEM DOCKED, LEMMASS IS FIRST ELIMINATED AS A PARAMETER
// PORT: SOURCE TVCMASSPROP.agc:86
//#
// PORT: SOURCE TVCMASSPROP.agc:87
//#	VARST0 = INTVALUE0 + LEMMASS(SLOPEVAL0)		IXX		BREAKPOINT VALUE
// PORT: SOURCE TVCMASSPROP.agc:88
//#	VARST1 = INTVALUE1 + LEMMASS(SLOPEVAL1)		IAVG		BREAKPOINT VALUE
// PORT: SOURCE TVCMASSPROP.agc:89
//#	VARST2 = INTVALUE2 + LEMMASS(SLOPEVAL2)		IAVG/TLX	BREAKPOINT VALUE
// PORT: SOURCE TVCMASSPROP.agc:90
//#
// PORT: SOURCE TVCMASSPROP.agc:91
//#	VARST3 = INTVALUE3 + LEMMASS(SLOPEVAL3)		IAVG/TLX	SLOPE FOR CSMMASS > 33956 LBS ( SPS > 10000 LBS)
// PORT: SOURCE TVCMASSPROP.agc:92
//#	VARST4 = INTVALUE4 + LEMMASS(SLOPEVAL4)		IAVG		SLOPE FOR CSMMASS > 33956 LBS ( SPS > 10000 LBS)
// PORT: SOURCE TVCMASSPROP.agc:93
//#
// PORT: SOURCE TVCMASSPROP.agc:94
//#	VARST5 = INTVALUE5 + LEMMASS(SLOPEVAL5)		IXX		SLOPE FOR ALL VALUES OF CSMMASS
// PORT: SOURCE TVCMASSPROP.agc:95
//#
// PORT: SOURCE TVCMASSPROP.agc:96
//#	VARST6 = INTVALUE6 + LEMMASS(SLOPEVAL6)		IAVG		SLOPE FOR CSMMASS < 33956 LBS ( SPS < 10000 LBS)
// PORT: SOURCE TVCMASSPROP.agc:97
//#	VARST7 = INTVALUE7 + LEMMASS(SLOPEVAL7)		IAVG/TLX	SLOPE FOR CSMMASS < 33956 LBS ( SPS < 10000 LBS)
// PORT: SOURCE TVCMASSPROP.agc:98
//#
// PORT: SOURCE TVCMASSPROP.agc:99
//#	VARST8 = INTVALUE8 + LEMMASS(SLOPEVAL8)		IAVG		DECREMENT TO BRKPT VALUE WHEN LEM DSCNT STAGE OFF
// PORT: SOURCE TVCMASSPROP.agc:100
//#	VARST9 = INTVALUE9 + LEMMASS(SLOPEVAL9)		IAVG/TLX	DECREMENT TO BRKPT VALUE WHEN LEM DSCNT STAGE OFF
// PORT: SOURCE TVCMASSPROP.agc:101
//#
// PORT: SOURCE TVCMASSPROP.agc:102
//#   (2) IF LEM NOT DOCKED
// PORT: SOURCE TVCMASSPROP.agc:103
//#
// PORT: SOURCE TVCMASSPROP.agc:104
//#	VARST0 = NOLEMVAL0	WHERE THE MEANING AND SCALING OF VARST0
// PORT: SOURCE TVCMASSPROP.agc:105
//#		.	.	TO VARST9 ARE THE SAME AS GIVEN ABOVE
// PORT: SOURCE TVCMASSPROP.agc:106
//#		.	.
// PORT: SOURCE TVCMASSPROP.agc:107
//#		.	.	NOTE... FOR THIS CASE, VARST8,9 HAVE NO
// PORT: SOURCE TVCMASSPROP.agc:108
//#	VARST9 = NOLEMVAL9	MEANING (THEY ARE COMPUTED BUT NOT USED)
// PORT: SOURCE TVCMASSPROP.agc:109
//#
// PORT: SOURCE TVCMASSPROP.agc:110
//#   (3) THE FINAL OUTPUT CALCULATIONS ARE THEN DONE
// PORT: SOURCE TVCMASSPROP.agc:111
//#
// PORT: SOURCE TVCMASSPROP.agc:112
//#	IXX0 = VARST0 + (CSMMASS + NEGBPW)VARST5		IXX
// PORT: SOURCE TVCMASSPROP.agc:113
//#
// PORT: SOURCE TVCMASSPROP.agc:114
//#	IXX1 = VARST1 + (CSMMASS + NEGBPW)VARST(4 OR 6)		IAVG
// PORT: SOURCE TVCMASSPROP.agc:115
//#
// PORT: SOURCE TVCMASSPROP.agc:116
//#	IXX2 = VARST2 + (CSMMASS + NEGBPW)VARST(3 OR 7)		IAVG/TLX
// PORT: SOURCE TVCMASSPROP.agc:117
//#
// PORT: SOURCE TVCMASSPROP.agc:118
//#
// PORT: SOURCE TVCMASSPROP.agc:119
//# THE DATA USED CAME FROM CSM/LM SPACECRAFT OPERATIONAL DATA BOOK.
// PORT: SOURCE TVCMASSPROP.agc:120
//#	VOL. 3, NASA DOCUMENT SNA-8-D-027 (MARCH 1968)
// PORT: SOURCE TVCMASSPROP.agc:121
//#
// PORT: SOURCE TVCMASSPROP.agc:122
//# PERTINENT MASS DATA :		CSM WEIGHT	(FULL)	64100 LBS.
// PORT: SOURCE TVCMASSPROP.agc:123
//#						(EMPTY)	23956 LBS.
// PORT: SOURCE TVCMASSPROP.agc:124
//#				LEM WEIGHT	(FULL)	32000 LBS.
// PORT: SOURCE TVCMASSPROP.agc:125
//#						(EMPTY)	14116 LBS.
// PORT: SOURCE TVCMASSPROP.agc:126
//#
// PORT: SOURCE TVCMASSPROP.agc:127
//# (WEIGHTS ARE FROM AMENDMENT #1 (APRIL 24,1968) TO ABOVE DATA BOOK)
// PORT: SOURCE TVCMASSPROP.agc:128
//# Page 953
// PORT: SOURCE TVCMASSPROP.agc:129
//
// PORT: SOURCE TVCMASSPROP.agc:130
//		BANK	25
// PORT: SOURCE TVCMASSPROP.agc:131
//		SETLOC	DAPMASS
// PORT: SOURCE TVCMASSPROP.agc:132
//		BANK
// PORT: SOURCE TVCMASSPROP.agc:133
//		EBANK=	BZERO
// PORT: SOURCE TVCMASSPROP.agc:134
//		COUNT*	$$/MASP
// PORT: SOURCE TVCMASSPROP.agc:135
//
// PORT: SOURCE TVCMASSPROP.agc:136
//
// PORT: SOURCE TVCMASSPROP.agc:137
//MASSPROP	CAF	NINE		# MASSPROP USES TVC/RCS INTERRUPT TEMPS
// PORT: Fixed ROM slots 7926.
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
// PORT: SOURCE TVCMASSPROP.agc:138
//		TS	PHI333		# SET UP TEN PASSES
// PORT: Fixed ROM slots 7927.
                if slot <> 7927 or instruction <> 23366 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23366, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCMASSPROP.agc:139
//
// PORT: SOURCE TVCMASSPROP.agc:140
//LEMTEST		CAE	DAPDATR1	# DETERMINE LEM STATUS
// PORT: Fixed ROM slots 7928.
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
// PORT: SOURCE TVCMASSPROP.agc:141
//		MASK	BIT13
// PORT: Fixed ROM slots 7929.
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
// PORT: SOURCE TVCMASSPROP.agc:142
//		EXTEND
// PORT: Fixed ROM slots 7930.
                if slot <> 7930 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7931 {
// PORT: SOURCE TVCMASSPROP.agc:143
//		BZF	LEMYES
// PORT: Fixed ROM slots 7931.
                if slot <> 7931 or instruction <> 5887 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5887, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCMASSPROP.agc:144
//
// PORT: SOURCE TVCMASSPROP.agc:145
//LEMNO		INDEX	PHI333		# LEM NOT ATTACHED
// PORT: Fixed ROM slots 7932.
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
// PORT: SOURCE TVCMASSPROP.agc:146
//		CAF	NOLEMVAL
// PORT: Fixed ROM slots 7933.
    7933, 28262
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7934–7938.
function agcAotUnit436 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7935 {
        if slot <= 7934 {
// PORT: SOURCE TVCMASSPROP.agc:147
//		TCF	STOINST
// PORT: Fixed ROM slots 7934.
            if slot <> 7934 or instruction <> 5895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5895, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCMASSPROP.agc:148
//
// PORT: SOURCE TVCMASSPROP.agc:149
//LEMYES		CAE	LEMMASS		# LEM IS ATTACHED
// PORT: Fixed ROM slots 7935.
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
// PORT: SOURCE TVCMASSPROP.agc:150
//		DOUBLE
// PORT: Fixed ROM slots 7936.
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
// PORT: SOURCE TVCMASSPROP.agc:151
//		EXTEND
// PORT: Fixed ROM slots 7937.
                if slot <> 7937 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCMASSPROP.agc:152
//		INDEX	PHI333
// PORT: Fixed ROM slots 7938.
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
// PORT: SOURCE TVCMASSPROP.agc:153
//		MP	SLOPEVAL
// PORT: Fixed ROM slots 7939.
    7939, 61066
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7940–7941.
function agcAotUnit437 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7940 {
// PORT: SOURCE TVCMASSPROP.agc:154
//		DDOUBL
// PORT: Fixed ROM slots 7940.
        if slot <> 7940 or instruction <> 8193 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            if not agcCoreDas(words, 1) { return -1. }
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TVCMASSPROP.agc:155
//		INDEX	PHI333
// PORT: Fixed ROM slots 7941.
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
// PORT: SOURCE TVCMASSPROP.agc:156
//		AD	INTVALUE
// PORT: Fixed ROM slots 7942.
    7942, 52854
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7943–7943.
function agcAotUnit438 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCMASSPROP.agc:157
//
// PORT: SOURCE TVCMASSPROP.agc:158
//STOINST		INDEX	PHI333		# STORAGE INST BEGIN HERE
// PORT: Fixed ROM slots 7943.
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
// PORT: SOURCE TVCMASSPROP.agc:159
//		TS	VARST0
// PORT: Fixed ROM slots 7944.
    7944, 46738
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7945–7965.
function agcAotUnit439 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7954 {
        if slot <= 7949 {
            if slot <= 7946 {
                if slot <= 7945 {
// PORT: SOURCE TVCMASSPROP.agc:160
//		CCS	PHI333		# ARE ALL TEN PASSES COMPLETED
// PORT: Fixed ROM slots 7945.
                    if slot <> 7945 or instruction <> 4934 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 838).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:161
//		TCF	MASSPROP +1	# NO - GO DECREMENT PHI333
// PORT: Fixed ROM slots 7946.
                    if slot <> 7946 or instruction <> 5879 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5879, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7947 {
// PORT: SOURCE TVCMASSPROP.agc:162
//
// PORT: SOURCE TVCMASSPROP.agc:163
//DXTEST		CCS	DAPDATR1	# IF NEG, BIT15 IS 1, LEM DSCNT STAGE OFF
// PORT: Fixed ROM slots 7947.
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
// PORT: SOURCE TVCMASSPROP.agc:164
//		TCF	FIXCW
// PORT: Fixed ROM slots 7948.
                        if slot <> 7948 or instruction <> 5906 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5906, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCMASSPROP.agc:165
//		TCF	FIXCW
// PORT: Fixed ROM slots 7949.
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
// PORT: SOURCE TVCMASSPROP.agc:166
//		DXCH	VARST0 +8D
// PORT: Fixed ROM slots 7950.
                    if slot <> 7950 or instruction <> 22354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 850, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:167
//		DAS	VARST0 +1
// PORT: Fixed ROM slots 7951.
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
// PORT: SOURCE TVCMASSPROP.agc:168
//		CA	DXITFIX
// PORT: Fixed ROM slots 7952.
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
// PORT: SOURCE TVCMASSPROP.agc:169
//		ADS	VARST0 +7
// PORT: Fixed ROM slots 7953.
                        if slot <> 7953 or instruction <> 12112 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 848).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCMASSPROP.agc:170
//
// PORT: SOURCE TVCMASSPROP.agc:171
//FIXCW		CAF	BIT2		# COMPUTATION PHASE BEGINS HERE.  SET UP
// PORT: Fixed ROM slots 7954.
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
// PORT: SOURCE TVCMASSPROP.agc:172
//		TS	PHI333		# THREE PASSES
// PORT: Fixed ROM slots 7955.
                    if slot <> 7955 or instruction <> 23366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:173
//		TS	PSI333
// PORT: Fixed ROM slots 7956.
                    if slot <> 7956 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7957 {
// PORT: SOURCE TVCMASSPROP.agc:174
//
// PORT: SOURCE TVCMASSPROP.agc:175
//		CAE	CSMMASS		# GET DELTA CSM WEIGHT - SIGN DETERMINES
// PORT: Fixed ROM slots 7957.
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
// PORT: SOURCE TVCMASSPROP.agc:176
//		AD	NEGBPW		# SLOPE LOCATIONS.
// PORT: Fixed ROM slots 7958.
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
// PORT: SOURCE TVCMASSPROP.agc:177
//		DOUBLE
// PORT: Fixed ROM slots 7959.
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
// PORT: SOURCE TVCMASSPROP.agc:178
//		TS	TEMP333
// PORT: Fixed ROM slots 7960.
                    if slot <> 7960 or instruction <> 23368 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23368, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7961 {
// PORT: SOURCE TVCMASSPROP.agc:179
//# Page 954
// PORT: SOURCE TVCMASSPROP.agc:180
//		EXTEND
// PORT: Fixed ROM slots 7961.
                        if slot <> 7961 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCMASSPROP.agc:181
//		BZMF	PEGGY		# DETERMINE CORRECT SLOPE
// PORT: Fixed ROM slots 7962.
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
// PORT: SOURCE TVCMASSPROP.agc:182
//		CAF	NEG2
// PORT: Fixed ROM slots 7963.
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
// PORT: SOURCE TVCMASSPROP.agc:183
//		TS	PHI333
// PORT: Fixed ROM slots 7964.
                        if slot <> 7964 or instruction <> 23366 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23366, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCMASSPROP.agc:184
//
// PORT: SOURCE TVCMASSPROP.agc:185
//PEGGY		INDEX	PHI333		# ALL IS READY - CALCULATE OUTPUTS NOW
// PORT: Fixed ROM slots 7965.
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
// PORT: SOURCE TVCMASSPROP.agc:186
//		CAE	VARST5		# GET SLOPE
// PORT: Fixed ROM slots 7966.
    7966, 26268
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7967–7970.
function agcAotUnit440 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7968 {
        if slot <= 7967 {
// PORT: SOURCE TVCMASSPROP.agc:187
//		EXTEND
// PORT: Fixed ROM slots 7967.
            if slot <> 7967 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCMASSPROP.agc:188
//		MP	TEMP333		# MULT BY DELTA CSM WEIGHT
// PORT: Fixed ROM slots 7968.
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
// PORT: SOURCE TVCMASSPROP.agc:189
//		DOUBLE
// PORT: Fixed ROM slots 7969.
            if slot <> 7969 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCMASSPROP.agc:190
//		INDEX	PSI333
// PORT: Fixed ROM slots 7970.
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
// PORT: SOURCE TVCMASSPROP.agc:191
//		AD	VARST0		# ADD BREAKPOINT VALUE
// PORT: Fixed ROM slots 7971.
    7971, 50834
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7972–7972.
function agcAotUnit441 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCMASSPROP.agc:192
//		INDEX	PSI333
// PORT: Fixed ROM slots 7972.
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
// PORT: SOURCE TVCMASSPROP.agc:193
//		TS	IXX		# ****** OUTPUTS (IXX0, IXX1, IXX2) ******
// PORT: Fixed ROM slots 7973.
    7973, 46704
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7974–7986.
function agcAotUnit442 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7979 {
        if slot <= 7976 {
            if slot <= 7974 {
// PORT: SOURCE TVCMASSPROP.agc:194
//
// PORT: SOURCE TVCMASSPROP.agc:195
//
// PORT: SOURCE TVCMASSPROP.agc:196
//		CCS	PSI333		# BOOKKEEPING - MASSPROP FINISHED OR NOT
// PORT: Fixed ROM slots 7974.
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
// PORT: SOURCE TVCMASSPROP.agc:197
//		TCF	BOKKEP2		# NO - GO TAKE CARE OF INDEXING REGISTERS
// PORT: Fixed ROM slots 7975.
                    if slot <> 7975 or instruction <> 5935 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5935, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:198
//
// PORT: SOURCE TVCMASSPROP.agc:199
//		CAE	DAPDATR1	# UPDATE WEIGHT/G
// PORT: Fixed ROM slots 7976.
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
// PORT: SOURCE TVCMASSPROP.agc:200
//		MASK	BIT14
// PORT: Fixed ROM slots 7977.
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
// PORT: SOURCE TVCMASSPROP.agc:201
//		CCS	A
// PORT: Fixed ROM slots 7978.
                    if slot <> 7978 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:202
//		CA	LEMMASS
// PORT: Fixed ROM slots 7979.
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
// PORT: SOURCE TVCMASSPROP.agc:203
//		AD	CSMMASS
// PORT: Fixed ROM slots 7980.
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
// PORT: SOURCE TVCMASSPROP.agc:204
//		TS	WEIGHT/G	# SCALED AT B+16 KILOGRAMS
// PORT: Fixed ROM slots 7981.
                    if slot <> 7981 or instruction <> 23357 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23357, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:205
//ENDMASSP	TC	Q
// PORT: Fixed ROM slots 7982.
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
// PORT: SOURCE TVCMASSPROP.agc:206
//
// PORT: SOURCE TVCMASSPROP.agc:207
//BOKKEP2		TS	PSI333		# REDUCE PSI BY ONE
// PORT: Fixed ROM slots 7983.
                    if slot <> 7983 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCMASSPROP.agc:208
//		EXTEND
// PORT: Fixed ROM slots 7984.
                    if slot <> 7984 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7985 {
// PORT: SOURCE TVCMASSPROP.agc:209
//		DIM	PHI333
// PORT: Fixed ROM slots 7985.
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
// PORT: SOURCE TVCMASSPROP.agc:210
//		TCF	PEGGY
// PORT: Fixed ROM slots 7986.
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
// PORT: SOURCE TVCMASSPROP.agc:211
//
// PORT: SOURCE TVCMASSPROP.agc:212
//# Page 955
// PORT: SOURCE TVCMASSPROP.agc:213
//NOLEMVAL	DEC	25445 B-20
// PORT: Fixed ROM slots 7987.
    7987, 796,
// PORT: SOURCE TVCMASSPROP.agc:214
//		DEC	87450 B-20
// PORT: Fixed ROM slots 7988.
    7988, 2732,
// PORT: SOURCE TVCMASSPROP.agc:215
//		DEC	.30715 B-2
// PORT: Fixed ROM slots 7989.
    7989, 2516,
// PORT: SOURCE TVCMASSPROP.agc:216
//		DEC	1.22877 E-5 B+12
// PORT: Fixed ROM slots 7990.
    7990, 1650,
// PORT: SOURCE TVCMASSPROP.agc:217
//		DEC	1.6096 B-6
// PORT: Fixed ROM slots 7991.
    7991, 824,
// PORT: SOURCE TVCMASSPROP.agc:218
//		DEC	1.54 B-6
// PORT: Fixed ROM slots 7992.
    7992, 788,
// PORT: SOURCE TVCMASSPROP.agc:219
//		DEC	7.77177 B-6
// PORT: Fixed ROM slots 7993.
    7993, 3980,
// PORT: SOURCE TVCMASSPROP.agc:220
//		DEC	3.46458 E-5 B+12
// PORT: Fixed ROM slots 7994.
    7994, 4650,
// PORT: SOURCE TVCMASSPROP.agc:221
//
// PORT: SOURCE TVCMASSPROP.agc:222
//INTVALUE	DEC	26850 B-20
// PORT: Fixed ROM slots 7995.
    7995, 840,
// PORT: SOURCE TVCMASSPROP.agc:223
//		DEC	127518 B-20
// PORT: Fixed ROM slots 7996.
    7996, 3984,
// PORT: SOURCE TVCMASSPROP.agc:224
//		DEC	.54059 B-2
// PORT: Fixed ROM slots 7997.
    7997, 4428,
// PORT: SOURCE TVCMASSPROP.agc:225
//		DEC	.153964 E-4 B+12
// PORT: Fixed ROM slots 7998.
    7998, 2066,
// PORT: SOURCE TVCMASSPROP.agc:226
//		DEC	-.742923 B-6
// PORT: Fixed ROM slots 7999.
    7999, 65154,
// PORT: SOURCE TVCMASSPROP.agc:227
//		DEC	1.5398 B-6
// PORT: Fixed ROM slots 8000.
    8000, 788,
// PORT: SOURCE TVCMASSPROP.agc:228
//		DEC	9.68 B-6
// PORT: Fixed ROM slots 8001.
    8001, 4956,
// PORT: SOURCE TVCMASSPROP.agc:229
//		DEC	.647625	E-4 B+12
// PORT: Fixed ROM slots 8002.
    8002, 8692,
// PORT: SOURCE TVCMASSPROP.agc:230
//		DEC	-27228 B-20
// PORT: Fixed ROM slots 8003.
    8003, 64684,
// PORT: SOURCE TVCMASSPROP.agc:231
//		DEC	-.206476 B-2
// PORT: Fixed ROM slots 8004.
    8004, 63842,
// PORT: SOURCE TVCMASSPROP.agc:232
//
// PORT: SOURCE TVCMASSPROP.agc:233
//SLOPEVAL	DEC	1.96307 B-6
// PORT: Fixed ROM slots 8005.
    8005, 1006,
// PORT: SOURCE TVCMASSPROP.agc:234
//		DEC	27.5774 B-6
// PORT: Fixed ROM slots 8006.
    8006, 14120,
// PORT: SOURCE TVCMASSPROP.agc:235
//		DEC	2.3548 E-5 B+12
// PORT: Fixed ROM slots 8007.
    8007, 3160,
// PORT: SOURCE TVCMASSPROP.agc:236
//		DEC	2.1777 E-9 B+26
// PORT: Fixed ROM slots 8008.
    8008, 4788,
// PORT: SOURCE TVCMASSPROP.agc:237
//		DEC	1.044 E-3 B+8
// PORT: Fixed ROM slots 8009.
    8009, 8758,
// PORT: SOURCE TVCMASSPROP.agc:238
//		DEC	0
// PORT: Fixed ROM slots 8010.
    8010, 0,
// PORT: SOURCE TVCMASSPROP.agc:239
//		DEC	2.21068 E-3 B+8
// PORT: Fixed ROM slots 8011.
    8011, 18544,
// PORT: SOURCE TVCMASSPROP.agc:240
//		DEC	1.5166 E-9 B+26
// PORT: Fixed ROM slots 8012.
    8012, 3336,
// PORT: SOURCE TVCMASSPROP.agc:241
//		DEC	-1.284 B-6
// PORT: Fixed ROM slots 8013.
    8013, 64876,
// PORT: SOURCE TVCMASSPROP.agc:242
//		DEC	2 E-5 B+12
// PORT: Fixed ROM slots 8014.
    8014, 2684,
// PORT: SOURCE TVCMASSPROP.agc:243
//
// PORT: SOURCE TVCMASSPROP.agc:244
//NEGBPW		DEC	-15402.17 B-16
// PORT: Fixed ROM slots 8015.
    8015, 57832,
// PORT: SOURCE TVCMASSPROP.agc:245
//DXITFIX		DEC*	-1.88275 E-5 B+12*
// PORT: Fixed ROM slots 8016.
    8016, 63008
)).

