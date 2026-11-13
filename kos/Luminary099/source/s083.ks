// THE_LUNAR_LANDING.agc
// bank 32, slots 29182-29182
function agcAotUnit1870 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:1
//# Copyright:	Public domain.
// THE_LUNAR_LANDING.agc:2
//# Filename:	THE_LUNAR_LANDING.agc
// THE_LUNAR_LANDING.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// THE_LUNAR_LANDING.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// THE_LUNAR_LANDING.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// THE_LUNAR_LANDING.agc:6
//# Assembler:	yaYUL
// THE_LUNAR_LANDING.agc:7
//# Contact:	Hartmuth Gutsche<hgutsche@xplornet.com>.
// THE_LUNAR_LANDING.agc:8
//# Website:	www.ibiblio.org/apollo.
// THE_LUNAR_LANDING.agc:9
//# Pages:	785-792
// THE_LUNAR_LANDING.agc:10
//# Mod history:	2009-05-20 HG	Transcribed from page images.
// THE_LUNAR_LANDING.agc:11
//#
// THE_LUNAR_LANDING.agc:12
//# This source code has been transcribed or otherwise adapted from
// THE_LUNAR_LANDING.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// THE_LUNAR_LANDING.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// THE_LUNAR_LANDING.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// THE_LUNAR_LANDING.agc:16
//# in storage size and consequent reduction in image quality as well) are
// THE_LUNAR_LANDING.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// THE_LUNAR_LANDING.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// THE_LUNAR_LANDING.agc:19
//# about getting access to the (much) higher-quality images which Paul
// THE_LUNAR_LANDING.agc:20
//# actually created.
// THE_LUNAR_LANDING.agc:21
//#
// THE_LUNAR_LANDING.agc:22
//# Notations on the hardcopy document read, in part:
// THE_LUNAR_LANDING.agc:23
//#
// THE_LUNAR_LANDING.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// THE_LUNAR_LANDING.agc:25
//#	16:27 JULY 14, 1969
// THE_LUNAR_LANDING.agc:26
//
// THE_LUNAR_LANDING.agc:27
//# Page 785
// THE_LUNAR_LANDING.agc:28
//		BANK	32
// THE_LUNAR_LANDING.agc:29
//		SETLOC	F2DPS*32
// THE_LUNAR_LANDING.agc:30
//		BANK
// THE_LUNAR_LANDING.agc:31
//
// THE_LUNAR_LANDING.agc:32
//		EBANK=	E2DPS
// THE_LUNAR_LANDING.agc:33
//
// THE_LUNAR_LANDING.agc:34
//#	*************************************
// THE_LUNAR_LANDING.agc:35
//#	P63: THE LUNAR LANDING, BRAKING PHASE
// THE_LUNAR_LANDING.agc:36
//#	*************************************
// THE_LUNAR_LANDING.agc:37
//
// THE_LUNAR_LANDING.agc:38
//		COUNT*	$$/P63
// THE_LUNAR_LANDING.agc:39
//
// THE_LUNAR_LANDING.agc:40
//P63LM		TC	PHASCHNG
// slot 29182
    if slot <> 29182 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1870] to agcAotUnit1870@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:41
//		OCT	04024
// slot 29183
    29183, 4136
)).

// bank 32, slots 29184-29184
function agcAotUnit1871 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:42
//
// THE_LUNAR_LANDING.agc:43
//		TC	BANKCALL	# DO IMU STATUS CHECK ROUTINE R02
// slot 29184
    if slot <> 29184 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1871] to agcAotUnit1871@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:44
//		CADR	R02BOTH
// slot 29185
    29185, 9560
)).

// bank 32, slots 29186-29199
function agcAotUnit1872 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29192 {
        if slot <= 29188 {
            if slot <= 29186 {
// THE_LUNAR_LANDING.agc:45
//
// THE_LUNAR_LANDING.agc:46
//		CAF	P63ADRES	# INITIALIZE WHICH FOR BURNBABY
// slot 29186
                if slot <> 29186 or instruction <> 13995 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1707), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29187 {
// THE_LUNAR_LANDING.agc:47
//		TS	WHICH
// slot 29187
                    if slot <> 29187 or instruction <> 23341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23341, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:48
//
// THE_LUNAR_LANDING.agc:49
//		CAF	DPSTHRSH	# INITIALIZE DVMON
// slot 29188
                    if slot <> 29188 or instruction <> 13312 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29190 {
                if slot <= 29189 {
// THE_LUNAR_LANDING.agc:50
//		TS	DVTHRUSH
// slot 29189
                    if slot <> 29189 or instruction <> 23209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23209, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:51
//		CAF	FOUR
// slot 29190
                    if slot <> 29190 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29191 {
// THE_LUNAR_LANDING.agc:52
//		TS	DVCNTR
// slot 29191
                    if slot <> 29191 or instruction <> 23373 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23373, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:53
//
// THE_LUNAR_LANDING.agc:54
//		CS	ONE		# INITIALIZE WCHPHASE AND FLPASS0
// slot 29192
                    if slot <> 29192 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 29195 {
            if slot <= 29193 {
// THE_LUNAR_LANDING.agc:55
//		TS	WCHPHASE
// slot 29193
                if slot <> 29193 or instruction <> 23273 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23273, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 29194 {
// THE_LUNAR_LANDING.agc:56
//
// THE_LUNAR_LANDING.agc:57
//		CA	ZERO
// slot 29194
                    if slot <> 29194 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:58
//		TS	FLPASS0
// slot 29195
                    if slot <> 29195 or instruction <> 23443 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23443, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 29197 {
                if slot <= 29196 {
// THE_LUNAR_LANDING.agc:59
//
// THE_LUNAR_LANDING.agc:60
//		CS	BIT14
// slot 29196
                    if slot <> 29196 or instruction <> 18910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:61
//		EXTEND
// slot 29197
                    if slot <> 29197 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 29198 {
// THE_LUNAR_LANDING.agc:62
//		WAND	CHAN12		# REMOVE TRACK-ENABLE DISCRETE.
// slot 29198
                    if slot <> 29198 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// THE_LUNAR_LANDING.agc:63
//
// THE_LUNAR_LANDING.agc:64
//FLAGORGY	TC	INTPRET		# DIONYSIAN FLAG WAVING
// slot 29199
                    if slot <> 29199 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1872] to agcAotUnit1872@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:65
//		CLEAR	CLEAR
// slot 29200
    29200, 35864,
// THE_LUNAR_LANDING.agc:66
//			NOTHROTL
// slot 29201
    29201, 2918,
// THE_LUNAR_LANDING.agc:67
//			REDFLAG
// slot 29202
    29202, 3442,
// THE_LUNAR_LANDING.agc:68
//		CLEAR	SET
// slot 29203
    29203, 35864,
// THE_LUNAR_LANDING.agc:69
//			LRBYPASS
// slot 29204
    29204, 5984,
// THE_LUNAR_LANDING.agc:70
//			MUNFLAG
// slot 29205
    29205, 3182,
// THE_LUNAR_LANDING.agc:71
//		CLEAR	CLEAR
// slot 29206
    29206, 35864,
// THE_LUNAR_LANDING.agc:72
//			P25FLAG		# TERMINATE P25 IF IT IS RUNNING.
// slot 29207
    29207, 364,
// THE_LUNAR_LANDING.agc:73
//			RNDVZFLG	# TERMINATE P20 IF IT IS RUNNING
// slot 29208
    29208, 368,
// THE_LUNAR_LANDING.agc:74
//
// THE_LUNAR_LANDING.agc:75
//					# ********************************
// THE_LUNAR_LANDING.agc:76
//
// THE_LUNAR_LANDING.agc:77
//IGNALG		SETPD	VLOAD		# FIRST SET UP INPUTS FOR RP-TO-R:-
// slot 29209
    29209, 64770,
// THE_LUNAR_LANDING.agc:78
//# Page 786
// THE_LUNAR_LANDING.agc:79
//			0		#   AT 0D LANDING SITE IN MOON FIXED FRAME
// slot 29210
    29210, 2,
// THE_LUNAR_LANDING.agc:80
//			RLS		#   AT 6D ESTIMATED TIME OF LANDING
// slot 29211
    29211, 2086,
// THE_LUNAR_LANDING.agc:81
//		PDDL	PUSH		#   MPAC NON-ZERO TO INDICATE LUNAR CASE
// slot 29212
    29212, 34474,
// THE_LUNAR_LANDING.agc:82
//			TLAND
// slot 29213
    29213, 2562,
// THE_LUNAR_LANDING.agc:83
//		STCALL	TPIP		# ALSO SET TPIP FOR FIRST GUIDANCE PASS
// slot 29214
    29214, 32554,
// THE_LUNAR_LANDING.agc:84
//			RP-TO-R
// slot 29215
    29215, 47004,
// THE_LUNAR_LANDING.agc:85
//		VSL4	MXV
// slot 29216
    29216, 53652,
// THE_LUNAR_LANDING.agc:86
//			REFSMMAT
// slot 29217
    29217, 1976,
// THE_LUNAR_LANDING.agc:87
//		STCALL	LAND
// slot 29218
    29218, 32570,
// THE_LUNAR_LANDING.agc:88
//			GUIDINIT	# GUIDINIT INITIALIZES WM AND /LAND/
// slot 29219
    29219, 39476,
// THE_LUNAR_LANDING.agc:89
//		DLOAD	DSU
// slot 29220
    29220, 38346,
// THE_LUNAR_LANDING.agc:90
//			TLAND
// slot 29221
    29221, 2562,
// THE_LUNAR_LANDING.agc:91
//			GUIDDURN
// slot 29222
    29222, 21856,
// THE_LUNAR_LANDING.agc:92
//		STCALL	TDEC1		# INTEGRATE STATE FORWARD TO THAT TIME
// slot 29223
    29223, 28738,
// THE_LUNAR_LANDING.agc:93
//			LEMPREC
// slot 29224
    29224, 23646,
// THE_LUNAR_LANDING.agc:94
//		SSP	VLOAD
// slot 29225
    29225, 64946,
// THE_LUNAR_LANDING.agc:95
//			NIGNLOOP
// slot 29226
    29226, 3918,
// THE_LUNAR_LANDING.agc:96
//			40D
// slot 29227
    29227, 80,
// THE_LUNAR_LANDING.agc:97
//			UNITX
// slot 29228
    29228, 6816,
// THE_LUNAR_LANDING.agc:98
//		STOVL	CG
// slot 29229
    29229, 23302,
// THE_LUNAR_LANDING.agc:99
//			UNITY
// slot 29230
    29230, 6812,
// THE_LUNAR_LANDING.agc:100
//		STOVL	CG +6
// slot 29231
    29231, 23314,
// THE_LUNAR_LANDING.agc:101
//			UNITZ
// slot 29232
    29232, 6808,
// THE_LUNAR_LANDING.agc:102
//		STODL	CG +14
// slot 29233
    29233, 15134,
// THE_LUNAR_LANDING.agc:103
//			99999CON
// slot 29234
    29234, 21852,
// THE_LUNAR_LANDING.agc:104
//		STOVL	DELTAH		# INITIALIZE DELTAH FOR V16N68 DISPLAY
// slot 29235
    29235, 24426,
// THE_LUNAR_LANDING.agc:105
//			ZEROVECS
// slot 29236
    29236, 6820,
// THE_LUNAR_LANDING.agc:106
//		STODL	UNFC/2		# INITIALIZE TRIM VELOCITY CORRECTION TERM
// slot 29237
    29237, 15704,
// THE_LUNAR_LANDING.agc:107
//			HI6ZEROS
// slot 29238
    29238, 6820,
// THE_LUNAR_LANDING.agc:108
//		STORE	TTF/8
// slot 29239
    29239, 3910,
// THE_LUNAR_LANDING.agc:109
//
// THE_LUNAR_LANDING.agc:110
//IGNALOOP	DLOAD
// slot 29240
    29240, 65482,
// THE_LUNAR_LANDING.agc:111
//			TAT
// slot 29241
    29241, 26,
// THE_LUNAR_LANDING.agc:112
//		STOVL	PIPTIME1
// slot 29242
    29242, 24290,
// THE_LUNAR_LANDING.agc:113
//			RATT1
// slot 29243
    29243, 30,
// THE_LUNAR_LANDING.agc:114
//		VSL4	MXV
// slot 29244
    29244, 53652,
// THE_LUNAR_LANDING.agc:115
//			REFSMMAT
// slot 29245
    29245, 1976,
// THE_LUNAR_LANDING.agc:116
//		STCALL	R
// slot 29246
    29246, 32418,
// THE_LUNAR_LANDING.agc:117
//			MUNGRAV
// slot 29247
    29247, 56496,
// THE_LUNAR_LANDING.agc:118
//		STCALL	GDT/2
// slot 29248
    29248, 30014,
// THE_LUNAR_LANDING.agc:119
//			?GUIDSUB	# WHICH DELIVERS N PASSES OF GUIDANCE
// slot 29249
    29249, 51800
)).

// bank 32, slots 29250-29251
function agcAotUnit1873 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29250 {
// THE_LUNAR_LANDING.agc:120
//
// THE_LUNAR_LANDING.agc:121
//# DDUMCALC IS PROGRAMMED AS FOLLOWS:-
// THE_LUNAR_LANDING.agc:122
//#                                         2                                           ___
// THE_LUNAR_LANDING.agc:123
//#              (RIGNZ - RGU )/16 + 16(RGU  )KIGNY/B8 + (RGU - RIGNX)KIGNX/B4 + (ABVAL(VGU) - VIGN)KIGNV/B4
// THE_LUNAR_LANDING.agc:124
//#                          2             1                 0
// THE_LUNAR_LANDING.agc:125
//#	DDUM = -------------------------------------------------------------------------------------------
// THE_LUNAR_LANDING.agc:126
//#                                                10
// THE_LUNAR_LANDING.agc:127
//#                                               2   (VGU - 16 VGU KIGNX/B4)
// THE_LUNAR_LANDING.agc:128
//#                                                       2        0
// THE_LUNAR_LANDING.agc:129
//# Page 787 new page is actually one line earlier but this would put the indices on a separate line
// THE_LUNAR_LANDING.agc:130
//# disconnected from their respective variables
// THE_LUNAR_LANDING.agc:131
//# THE NUMERATOR IS SCALED IN METERS AT 2(28).  THE DENOMINATOR IS A VELOCITY IN UNITS OF 2(10) M/CS.
// THE_LUNAR_LANDING.agc:132
//# THE QUOTIENT IS THUS A TIME IN UNITS OF 2(18) CENTISECONDS.  THE FINAL SHIFT RESCALES TO UNITS OF 2(28) CS.
// THE_LUNAR_LANDING.agc:133
//# THERE IS NO DAMPING FACTOR.  THE CONSTANTS KIGNX/B4, KIGNY/B8 AND KIGNV/B4 ARE ALL NEGATIVE IN SIGN.
// THE_LUNAR_LANDING.agc:134
//
// THE_LUNAR_LANDING.agc:135
//DDUMCALC	TS	NIGNLOOP
// slot 29250
        if slot <> 29250 or instruction <> 23462 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23462, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:136
//		TC	INTPRET
// slot 29251
        if slot <> 29251 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1873] to agcAotUnit1873@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:137
//		DLOAD	DMPR		# FORM DENOMINATOR FIRST
// slot 29252
    29252, 48586,
// THE_LUNAR_LANDING.agc:138
//			VGU
// slot 29253
    29253, 3886,
// THE_LUNAR_LANDING.agc:139
//			KIGNX/B4
// slot 29254
    29254, 2690,
// THE_LUNAR_LANDING.agc:140
//		SL4R	BDSU
// slot 29255
    29255, 37172,
// THE_LUNAR_LANDING.agc:141
//			VGU +4
// slot 29256
    29256, 3894,
// THE_LUNAR_LANDING.agc:142
//		PDDL	DSU
// slot 29257
    29257, 38314,
// THE_LUNAR_LANDING.agc:143
//			RIGNZ
// slot 29258
    29258, 2686,
// THE_LUNAR_LANDING.agc:144
//			RGU +4
// slot 29259
    29259, 2886,
// THE_LUNAR_LANDING.agc:145
//		SR4R	PDDL
// slot 29260
    29260, 54564,
// THE_LUNAR_LANDING.agc:146
//			RGU +2
// slot 29261
    29261, 2882,
// THE_LUNAR_LANDING.agc:147
//		DSQ	DMPR
// slot 29262
    29262, 48540,
// THE_LUNAR_LANDING.agc:148
//			KIGNY/B8
// slot 29263
    29263, 2694,
// THE_LUNAR_LANDING.agc:149
//		SL4R	PDDL
// slot 29264
    29264, 54580,
// THE_LUNAR_LANDING.agc:150
//			RGU
// slot 29265
    29265, 2878,
// THE_LUNAR_LANDING.agc:151
//		DSU	DMPR
// slot 29266
    29266, 48426,
// THE_LUNAR_LANDING.agc:152
//			RIGNX
// slot 29267
    29267, 2682,
// THE_LUNAR_LANDING.agc:153
//			KIGNX/B4
// slot 29268
    29268, 2690,
// THE_LUNAR_LANDING.agc:154
//		PDVL	ABVAL
// slot 29269
    29269, 42650,
// THE_LUNAR_LANDING.agc:155
//			VGU
// slot 29270
    29270, 3886,
// THE_LUNAR_LANDING.agc:156
//		DSU	DMPR
// slot 29271
    29271, 48426,
// THE_LUNAR_LANDING.agc:157
//			VIGN
// slot 29272
    29272, 2678,
// THE_LUNAR_LANDING.agc:158
//			KIGNV/B4
// slot 29273
    29273, 2698,
// THE_LUNAR_LANDING.agc:159
//		DAD	DAD
// slot 29274
    29274, 36122,
// THE_LUNAR_LANDING.agc:160
//		DAD	DDV
// slot 29275
    29275, 47386,
// THE_LUNAR_LANDING.agc:161
//		SRR
// slot 29276
    29276, 65378,
// THE_LUNAR_LANDING.agc:162
//			10D
// slot 29277
    29277, 18198,
// THE_LUNAR_LANDING.agc:163
//
// THE_LUNAR_LANDING.agc:164
//		PUSH	DAD
// slot 29278
    29278, 36108,
// THE_LUNAR_LANDING.agc:165
//			PIPTIME1
// slot 29279
    29279, 3810,
// THE_LUNAR_LANDING.agc:166
//		STODL	TDEC1		# STORE NEW GUESS FOR NEXT INTEGRATION
// slot 29280
    29280, 12354,
// THE_LUNAR_LANDING.agc:167
//		ABS	DSU
// slot 29281
    29281, 38220,
// THE_LUNAR_LANDING.agc:168
//			DDUMCRIT
// slot 29282
    29282, 21860,
// THE_LUNAR_LANDING.agc:169
//		BMN	CALL
// slot 29283
    29283, 37952,
// THE_LUNAR_LANDING.agc:170
//			DDUMGOOD
// slot 29284
    29284, 54502,
// THE_LUNAR_LANDING.agc:171
//			INTSTALL
// slot 29285
    29285, 24088,
// THE_LUNAR_LANDING.agc:172
//		SET	SET
// slot 29286
    29286, 35864,
// THE_LUNAR_LANDING.agc:173
//			INTYPFLG
// slot 29287
    29287, 1654,
// THE_LUNAR_LANDING.agc:174
//			MOONFLAG
// slot 29288
    29288, 102,
// THE_LUNAR_LANDING.agc:175
//		DLOAD
// slot 29289
    29289, 65482,
// THE_LUNAR_LANDING.agc:176
//			PIPTIME1
// slot 29290
    29290, 3810,
// THE_LUNAR_LANDING.agc:177
//		STOVL	TET		# HOPEFULLY ?GUIDSUB DID NOT
// slot 29291
    29291, 22174,
// THE_LUNAR_LANDING.agc:178
//			RATT1		#   CLOBBER RATT1 AND VATT1
// slot 29292
    29292, 30,
// THE_LUNAR_LANDING.agc:179
//# Page 788
// THE_LUNAR_LANDING.agc:180
//		STOVL	RCV
// slot 29293
    29293, 22202,
// THE_LUNAR_LANDING.agc:181
//			VATT1
// slot 29294
    29294, 42,
// THE_LUNAR_LANDING.agc:182
//		STCALL	VCV
// slot 29295
    29295, 30406,
// THE_LUNAR_LANDING.agc:183
//			INTEGRVS
// slot 29296
    29296, 23694,
// THE_LUNAR_LANDING.agc:184
//		GOTO
// slot 29297
    29297, 65360,
// THE_LUNAR_LANDING.agc:185
//			IGNALOOP
// slot 29298
    29298, 54384,
// THE_LUNAR_LANDING.agc:186
//
// THE_LUNAR_LANDING.agc:187
//DDUMGOOD	SLOAD	SR
// slot 29299
    29299, 45498,
// THE_LUNAR_LANDING.agc:188
//			ZOOMTIME
// slot 29300
    29300, 3622,
// THE_LUNAR_LANDING.agc:189
//			14D
// slot 29301
    29301, 17182,
// THE_LUNAR_LANDING.agc:190
//		BDSU
// slot 29302
    29302, 65314,
// THE_LUNAR_LANDING.agc:191
//			TDEC1
// slot 29303
    29303, 66,
// THE_LUNAR_LANDING.agc:192
//		STOVL	TIG		# COMPUTE DISTANCE LANDING SITE WILL BE
// slot 29304
    29304, 24132,
// THE_LUNAR_LANDING.agc:193
//			V		#   OUT OF LM'S ORBITAL PLANE AT IGNITION:
// slot 29305
    29305, 3758,
// THE_LUNAR_LANDING.agc:194
//		VXV	UNIT		#   SIGN IS + IF LANDING SITE IS TO THE
// slot 29306
    29306, 44602,
// THE_LUNAR_LANDING.agc:195
//			R		#   RIGHT, NORTH; - IF TO THE LEFT, SOUTH.
// slot 29307
    29307, 3746,
// THE_LUNAR_LANDING.agc:196
//		DOT	SL1
// slot 29308
    29308, 59970,
// THE_LUNAR_LANDING.agc:197
//			LAND
// slot 29309
    29309, 3898,
// THE_LUNAR_LANDING.agc:198
//R60INIT		STOVL	OUTOFPLN	# INITIALIZATION FOR CALCMANU
// slot 29310
    29310, 23342,
// THE_LUNAR_LANDING.agc:199
//			UNFC/2
// slot 29311
    29311, 3416,
// THE_LUNAR_LANDING.agc:200
//		STORE	R60VSAVE	# STORE UNFC/2 TEMPORARILY IN R60SAVE
// slot 29312
    29312, 2866,
// THE_LUNAR_LANDING.agc:201
//		EXIT
// slot 29313
    29313, 65532
)).

// bank 32, slots 29314-29314
function agcAotUnit1874 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:202
//					# *******************************************
// THE_LUNAR_LANDING.agc:203
//
// THE_LUNAR_LANDING.agc:204
//IGNALGRT	TC	PHASCHNG	# PREVENT REPEATING IGNALG
// slot 29314
    if slot <> 29314 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1874] to agcAotUnit1874@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:205
//		OCT	04024
// slot 29315
    29315, 4136
)).

// bank 32, slots 29316-29317
function agcAotUnit1875 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29316 {
// THE_LUNAR_LANDING.agc:206
//
// THE_LUNAR_LANDING.agc:207
//ASTNCLOK	CS	ASTNDEX
// slot 29316
        if slot <> 29316 or instruction <> 18674 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2290), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:208
//		TC	BANKCALL
// slot 29317
        if slot <> 29317 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1875] to agcAotUnit1875@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:209
//		CADR	STCLOK2
// slot 29318
    29318, 62312
)).

// bank 32, slots 29319-29320
function agcAotUnit1876 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29319 {
// THE_LUNAR_LANDING.agc:210
//		TCF	ENDOFJOB	# RETURN IN NEW JOB AND IN EBANK FIVE
// slot 29319
        if slot <> 29319 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:211
//
// THE_LUNAR_LANDING.agc:212
//ASTNRET		TC	INTPRET
// slot 29320
        if slot <> 29320 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1876] to agcAotUnit1876@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:213
//		SSP	RTB		# GO PICK UP DISPLAY AT END OF R51:
// slot 29321
    29321, 40114,
// THE_LUNAR_LANDING.agc:214
//			QMAJ		#   "PROCEED" WILL DO A FINE ALIGNMENT
// slot 29322
    29322, 3022,
// THE_LUNAR_LANDING.agc:215
//		FCADR	P63SPOT2	#   " ENTER " WILL RETURN TO P63SPOT2
// slot 29323
    29323, 54554,
// THE_LUNAR_LANDING.agc:216
//			R51P63
// slot 29324
    29324, 25786,
// THE_LUNAR_LANDING.agc:217
//P63SPOT2	VLOAD	UNIT		# INITIALIZE KALCMANU FOR BURN ATTITUDE
// slot 29325
    29325, 44794,
// THE_LUNAR_LANDING.agc:218
//			R60VSAVE
// slot 29326
    29326, 2866,
// THE_LUNAR_LANDING.agc:219
//		STOVL	POINTVSM
// slot 29327
    29327, 24566,
// THE_LUNAR_LANDING.agc:220
//			UNITX
// slot 29328
    29328, 6816,
// THE_LUNAR_LANDING.agc:221
//		STORE	SCAXIS
// slot 29329
    29329, 4074,
// THE_LUNAR_LANDING.agc:222
//		EXIT
// slot 29330
    29330, 65532
)).

// bank 32, slots 29331-29334
function agcAotUnit1877 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29332 {
        if slot <= 29331 {
// THE_LUNAR_LANDING.agc:223
//
// THE_LUNAR_LANDING.agc:224
//		CAF	EBANK7
// slot 29331
            if slot <> 29331 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// THE_LUNAR_LANDING.agc:225
//		TS	EBANK
// slot 29332
            if slot <> 29332 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 29333 {
// THE_LUNAR_LANDING.agc:226
//
// THE_LUNAR_LANDING.agc:227
//		INHINT
// slot 29333
            if slot <> 29333 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// THE_LUNAR_LANDING.agc:228
//		TC	IBNKCALL
// slot 29334
            if slot <> 29334 or instruction <> 2492 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2492, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1877] to agcAotUnit1877@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:229
//		CADR	PFLITEDB
// slot 29335
    29335, 32964
)).

// bank 32, slots 29336-29337
function agcAotUnit1878 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29336 {
// THE_LUNAR_LANDING.agc:230
//# Page 789
// THE_LUNAR_LANDING.agc:231
//		RELINT
// slot 29336
        if slot <> 29336 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:232
//
// THE_LUNAR_LANDING.agc:233
//		TC	BANKCALL
// slot 29337
        if slot <> 29337 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1878] to agcAotUnit1878@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:234
//		CADR	R60LEM
// slot 29338
    29338, 45222
)).

// bank 32, slots 29339-29339
function agcAotUnit1879 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:235
//
// THE_LUNAR_LANDING.agc:236
//		TC	PHASCHNG	# PREVENT RECALLING R60
// slot 29339
    if slot <> 29339 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1879] to agcAotUnit1879@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:237
//		OCT	04024
// slot 29340
    29340, 4136
)).

// bank 32, slots 29341-29347
function agcAotUnit1880 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29343 {
        if slot <= 29341 {
// THE_LUNAR_LANDING.agc:238
//
// THE_LUNAR_LANDING.agc:239
//P63SPOT3	CA	BIT6		# IS THE LR ANTENNA IN POSITION 1 YET
// slot 29341
            if slot <> 29341 or instruction <> 14822 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 29342 {
// THE_LUNAR_LANDING.agc:240
//		EXTEND
// slot 29342
                if slot <> 29342 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// THE_LUNAR_LANDING.agc:241
//		RAND	CHAN33
// slot 29343
                if slot <> 29343 or instruction <> 1051 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 29345 {
            if slot <= 29344 {
// THE_LUNAR_LANDING.agc:242
//		EXTEND
// slot 29344
                if slot <> 29344 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// THE_LUNAR_LANDING.agc:243
//		BZF	P63SPOT4	# BRANCH IF ANTENNA ALREADY IN POSITION 1
// slot 29345
                if slot <> 29345 or instruction <> 5799 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 29346 {
// THE_LUNAR_LANDING.agc:244
//
// THE_LUNAR_LANDING.agc:245
//		CAF	CODE500		# ASTRONAUT:	PLEASE CRANK THE
// slot 29346
                if slot <> 29346 or instruction <> 13996 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1708), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// THE_LUNAR_LANDING.agc:246
//		TC	BANKCALL	#		SILLY THING AROUND
// slot 29347
                if slot <> 29347 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1880] to agcAotUnit1880@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:247
//		CADR	GOPERF1
// slot 29348
    29348, 17190
)).

// bank 32, slots 29349-29351
function agcAotUnit1881 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 29349 {
// THE_LUNAR_LANDING.agc:248
//		TCF	GOTOPOOH	# TERMINATE
// slot 29349
        if slot <> 29349 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 29350 {
// THE_LUNAR_LANDING.agc:249
//		TCF	P63SPOT3	# PROCEED	SEE IF HE'S LYING
// slot 29350
            if slot <> 29350 or instruction <> 5789 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5789, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// THE_LUNAR_LANDING.agc:250
//
// THE_LUNAR_LANDING.agc:251
//P63SPOT4	TC	BANKCALL	# ENTER		INITIALIZE LANDING RADAR
// slot 29351
            if slot <> 29351 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1881] to agcAotUnit1881@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:252
//		CADR	SETPOS1
// slot 29352
    29352, 57250
)).

// bank 32, slots 29353-29353
function agcAotUnit1882 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:253
//
// THE_LUNAR_LANDING.agc:254
//		TC	POSTJUMP	# OFF TO SEE THE WIZARD...
// slot 29353
    if slot <> 29353 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1882] to agcAotUnit1882@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:255
//		CADR	BURNBABY
// slot 29354
    29354, 61612,
// THE_LUNAR_LANDING.agc:256
//
// THE_LUNAR_LANDING.agc:257
//#	---------------------------------
// THE_LUNAR_LANDING.agc:258
//
// THE_LUNAR_LANDING.agc:259
//#	CONSTANTS FOR P63LM AND IGNALG
// THE_LUNAR_LANDING.agc:260
//
// THE_LUNAR_LANDING.agc:261
//P63ADRES	GENADR	P63TABLE
// slot 29355
    29355, 2172,
// THE_LUNAR_LANDING.agc:262
//
// THE_LUNAR_LANDING.agc:263
//ASTNDEX		=	MD1		# OCT 25:  INDEX FOR CLOKTASK
// THE_LUNAR_LANDING.agc:264
//
// THE_LUNAR_LANDING.agc:265
//CODE500		OCT	00500
// slot 29356
    29356, 640,
// THE_LUNAR_LANDING.agc:266
//
// THE_LUNAR_LANDING.agc:267
//99999CON	2DEC	30479.7 B-24
// slot 29357 29358
    29357, 58, 29358, 25078,
// THE_LUNAR_LANDING.agc:268
//
// THE_LUNAR_LANDING.agc:269
//GUIDDURN	2DEC	+66440		# GUIDDURN	+6.64400314 E+2
// slot 29359 29360
    29359, 8, 29360, 1808,
// THE_LUNAR_LANDING.agc:270
//DDUMCRIT	2DEC	+8 B-28		# CRITERION FOR IGNALG CONVERGENCE
// slot 29361 29362
    29361, 0, 29362, 16
)).

// bank 31, slots 27748-27748
function agcAotUnit1754 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:271
//
// THE_LUNAR_LANDING.agc:272
//# Page 790
// THE_LUNAR_LANDING.agc:273
//#	--------------------------------
// THE_LUNAR_LANDING.agc:274
//
// THE_LUNAR_LANDING.agc:275
//# Page 791
// THE_LUNAR_LANDING.agc:276
//#	*************************
// THE_LUNAR_LANDING.agc:277
//#	P68: LANDING CONFIRMATION
// THE_LUNAR_LANDING.agc:278
//#	*************************
// THE_LUNAR_LANDING.agc:279
//
// THE_LUNAR_LANDING.agc:280
//		BANK	31
// THE_LUNAR_LANDING.agc:281
//		SETLOC	F2DPS*31
// THE_LUNAR_LANDING.agc:282
//		BANK
// THE_LUNAR_LANDING.agc:283
//
// THE_LUNAR_LANDING.agc:284
//		COUNT*	$$/P6567
// THE_LUNAR_LANDING.agc:285
//
// THE_LUNAR_LANDING.agc:286
//LANDJUNK	TC	PHASCHNG
// slot 27748
    if slot <> 27748 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1754] to agcAotUnit1754@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:287
//		OCT	04024
// slot 27749
    27749, 4136
)).

// bank 31, slots 27750-27751
function agcAotUnit1755 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27750 {
// THE_LUNAR_LANDING.agc:288
//
// THE_LUNAR_LANDING.agc:289
//		INHINT
// slot 27750
        if slot <> 27750 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:290
//		TC	BANKCALL	# ZERO ATTITUDE ERROR
// slot 27751
        if slot <> 27751 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1755] to agcAotUnit1755@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:291
//		CADR	ZATTEROR
// slot 27752
    27752, 32982
)).

// bank 31, slots 27753-27753
function agcAotUnit1756 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:292
//
// THE_LUNAR_LANDING.agc:293
//		TC	BANKCALL	# SET 5 DEGREE DEADBAND
// slot 27753
    if slot <> 27753 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1756] to agcAotUnit1756@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:294
//		CADR	SETMAXDB
// slot 27754
    27754, 32942
)).

// bank 31, slots 27755-27755
function agcAotUnit1757 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:295
//
// THE_LUNAR_LANDING.agc:296
//		TC	INTPRET		# TO INTERPRETIVE AS TIME IS NOT CRITICAL
// slot 27755
    if slot <> 27755 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1757] to agcAotUnit1757@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:297
//		SET	CLEAR
// slot 27756
    27756, 35864,
// THE_LUNAR_LANDING.agc:298
//			SURFFLAG
// slot 27757
    27757, 4206,
// THE_LUNAR_LANDING.agc:299
//			LETABORT
// slot 27758
    27758, 4972,
// THE_LUNAR_LANDING.agc:300
//		SET	VLOAD
// slot 27759
    27759, 64792,
// THE_LUNAR_LANDING.agc:301
//			APSFLAG
// slot 27760
    27760, 5220,
// THE_LUNAR_LANDING.agc:302
//			RN
// slot 27761
    27761, 1314,
// THE_LUNAR_LANDING.agc:303
//		STODL	ALPHAV
// slot 27762
    27762, 14388,
// THE_LUNAR_LANDING.agc:304
//			PIPTIME
// slot 27763
    27763, 1338,
// THE_LUNAR_LANDING.agc:305
//		SET	CALL
// slot 27764
    27764, 37912,
// THE_LUNAR_LANDING.agc:306
//			LUNAFLAG
// slot 27765
    27765, 1638,
// THE_LUNAR_LANDING.agc:307
//			LAT-LONG
// slot 27766
    27766, 22994,
// THE_LUNAR_LANDING.agc:308
//		SETPD	VLOAD		# COMPUTE RLS AND STORE IT AWAY
// slot 27767
    27767, 64770,
// THE_LUNAR_LANDING.agc:309
//			0
// slot 27768
    27768, 2,
// THE_LUNAR_LANDING.agc:310
//			RN
// slot 27769
    27769, 1314,
// THE_LUNAR_LANDING.agc:311
//		VSL2	PDDL
// slot 27770
    27770, 54740,
// THE_LUNAR_LANDING.agc:312
//			PIPTIME
// slot 27771
    27771, 1338,
// THE_LUNAR_LANDING.agc:313
//		PUSH	CALL
// slot 27772
    27772, 37900,
// THE_LUNAR_LANDING.agc:314
//			R-TO-RP
// slot 27773
    27773, 42864,
// THE_LUNAR_LANDING.agc:315
//		STORE	RLS
// slot 27774
    27774, 2086,
// THE_LUNAR_LANDING.agc:316
//		EXIT
// slot 27775
    27775, 65532
)).

// bank 31, slots 27776-27777
function agcAotUnit1758 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27776 {
// THE_LUNAR_LANDING.agc:317
//		CAF	V06N43*		# ASTRONAUT:  NOW LOOK WHERE YOU ENDED UP
// slot 27776
        if slot <> 27776 or instruction <> 13453 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1165), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// THE_LUNAR_LANDING.agc:318
//		TC	BANKCALL
// slot 27777
        if slot <> 27777 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1758] to agcAotUnit1758@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:319
//		CADR	GOFLASH
// slot 27778
    27778, 17020
)).

// bank 31, slots 27779-27782
function agcAotUnit1759 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27780 {
        if slot <= 27779 {
// THE_LUNAR_LANDING.agc:320
//		TCF	GOTOPOOH	# TERMINATE
// slot 27779
            if slot <> 27779 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// THE_LUNAR_LANDING.agc:321
//		TCF	+2		# PROCEED
// slot 27780
            if slot <> 27780 or instruction <> 5254 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5254, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27781 {
// THE_LUNAR_LANDING.agc:322
//		TCF	-5		# RECYCLE
// slot 27781
            if slot <> 27781 or instruction <> 5248 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5248, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// THE_LUNAR_LANDING.agc:323
//
// THE_LUNAR_LANDING.agc:324
//		TC	INTPRET
// slot 27782
            if slot <> 27782 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1759] to agcAotUnit1759@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:325
//# Page 792
// THE_LUNAR_LANDING.agc:326
//		VLOAD			# INITIALIZE GSAV AND (USING REFMF)
// slot 27783
    27783, 65530,
// THE_LUNAR_LANDING.agc:327
//			UNITX		#   YNBSAV, ZNBSAV AND ATTFLAG FOR P57
// slot 27784
    27784, 6816,
// THE_LUNAR_LANDING.agc:328
//		STCALL	GSAV
// slot 27785
    27785, 31026,
// THE_LUNAR_LANDING.agc:329
//			REFMF
// slot 27786
    27786, 28300,
// THE_LUNAR_LANDING.agc:330
//		EXIT
// slot 27787
    27787, 65532
)).

// bank 31, slots 27788-27788
function agcAotUnit1760 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// THE_LUNAR_LANDING.agc:331
//
// THE_LUNAR_LANDING.agc:332
//		TCF	GOTOPOOH	# ASTRONAUT:  PLEASE SELECT P57
// slot 27788
    if slot <> 27788 or instruction <> 7169 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7169, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1760] to agcAotUnit1760@.

agcAotInstallSourceRope(list(
// THE_LUNAR_LANDING.agc:333
//
// THE_LUNAR_LANDING.agc:334
//V06N43*		VN	0643
// slot 27789
    27789, 1622
)).

// no code for the lines below
// THE_LUNAR_LANDING.agc:335
//
