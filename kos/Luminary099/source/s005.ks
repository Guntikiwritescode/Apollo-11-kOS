// ASCENT_GUIDANCE.agc
// bank 34, slots 31650-31650
function agcAotUnit2002 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:1
//# Copyright:	Public domain.
// ASCENT_GUIDANCE.agc:2
//# Filename:	ASCENT_GUIDANCE.agc
// ASCENT_GUIDANCE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// ASCENT_GUIDANCE.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// ASCENT_GUIDANCE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// ASCENT_GUIDANCE.agc:6
//# Assembler:	yaYUL
// ASCENT_GUIDANCE.agc:7
//# Contact:	Gutsche Kerman <hgutsche@xplornet.com>.
// ASCENT_GUIDANCE.agc:8
//# Website:	www.ibiblio.org/apollo.
// ASCENT_GUIDANCE.agc:9
//# Pages:	843-856
// ASCENT_GUIDANCE.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// ASCENT_GUIDANCE.agc:11
//#		2009-06-05 RSB	Fixed a couple of typos.
// ASCENT_GUIDANCE.agc:12
//#		2009-06-07 RSB	Corrected a typo.
// ASCENT_GUIDANCE.agc:13
//#
// ASCENT_GUIDANCE.agc:14
//# This source code has been transcribed or otherwise adapted from
// ASCENT_GUIDANCE.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// ASCENT_GUIDANCE.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// ASCENT_GUIDANCE.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// ASCENT_GUIDANCE.agc:18
//# in storage size and consequent reduction in image quality as well) are
// ASCENT_GUIDANCE.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// ASCENT_GUIDANCE.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// ASCENT_GUIDANCE.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// ASCENT_GUIDANCE.agc:22
//# actually created.
// ASCENT_GUIDANCE.agc:23
//#
// ASCENT_GUIDANCE.agc:24
//# Notations on the hardcopy document read, in part:
// ASCENT_GUIDANCE.agc:25
//#
// ASCENT_GUIDANCE.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// ASCENT_GUIDANCE.agc:27
//#	16:27 JULY 14, 1969
// ASCENT_GUIDANCE.agc:28
//
// ASCENT_GUIDANCE.agc:29
//# Page 843
// ASCENT_GUIDANCE.agc:30
//		BANK	34
// ASCENT_GUIDANCE.agc:31
//		SETLOC	ASCFILT
// ASCENT_GUIDANCE.agc:32
//		BANK
// ASCENT_GUIDANCE.agc:33
//
// ASCENT_GUIDANCE.agc:34
//		EBANK=	DVCNTR
// ASCENT_GUIDANCE.agc:35
//
// ASCENT_GUIDANCE.agc:36
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:37
//
// ASCENT_GUIDANCE.agc:38
//ATMAG		TC	PHASCHNG
// slot 31650
    if slot <> 31650 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2002] to agcAotUnit2002@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:39
//		OCT	00035
// slot 31651
    31651, 58
)).

// bank 34, slots 31652-31652
function agcAotUnit2003 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:40
//		TC	INTPRET
// slot 31652
    if slot <> 31652 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2003] to agcAotUnit2003@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:41
//		BON
// slot 31653
    31653, 65304,
// ASCENT_GUIDANCE.agc:42
//			FLRCS
// slot 31654
    31654, 5002,
// ASCENT_GUIDANCE.agc:43
//			ASCENT
// slot 31655
    31655, 49570,
// ASCENT_GUIDANCE.agc:44
//		DLOAD	DSU
// slot 31656
    31656, 38346,
// ASCENT_GUIDANCE.agc:45
//			ABDVCONV
// slot 31657
    31657, 3736,
// ASCENT_GUIDANCE.agc:46
//			MINABDV
// slot 31658
    31658, 22794,
// ASCENT_GUIDANCE.agc:47
//		BMN	CLEAR
// slot 31659
    31659, 35904,
// ASCENT_GUIDANCE.agc:48
//			ASCTERM4
// slot 31660
    31660, 50128,
// ASCENT_GUIDANCE.agc:49
//			SURFFLAG
// slot 31661
    31661, 4462,
// ASCENT_GUIDANCE.agc:50
//		CLEAR	SLOAD
// slot 31662
    31662, 56600,
// ASCENT_GUIDANCE.agc:51
//			RENDWFLG
// slot 31663
    31663, 2940,
// ASCENT_GUIDANCE.agc:52
//			BIT3H
// slot 31664
    31664, 26524,
// ASCENT_GUIDANCE.agc:53
//		DDV	EXIT
// slot 31665
    31665, 65138,
// ASCENT_GUIDANCE.agc:54
//			ABDVCONV
// slot 31666
    31666, 3736
)).

// bank 34, slots 31667-31672
function agcAotUnit2004 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31669 {
        if slot <= 31667 {
// ASCENT_GUIDANCE.agc:55
//		DXCH	MPAC
// slot 31667
            if slot <> 31667 or instruction <> 21613 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31668 {
// ASCENT_GUIDANCE.agc:56
//		DXCH	1/DV3
// slot 31668
                if slot <> 31668 or instruction <> 22433 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 929, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:57
//		DXCH	1/DV2
// slot 31669
                if slot <> 31669 or instruction <> 22431 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 927, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31670 {
// ASCENT_GUIDANCE.agc:58
//		DXCH	1/DV1
// slot 31670
            if slot <> 31670 or instruction <> 22429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 925, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31671 {
// ASCENT_GUIDANCE.agc:59
//		DXCH	1/DV0
// slot 31671
                if slot <> 31671 or instruction <> 22393 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 889, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:60
//		TC	INTPRET
// slot 31672
                if slot <> 31672 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2004] to agcAotUnit2004@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:61
//		DLOAD	DAD
// slot 31673
    31673, 36298,
// ASCENT_GUIDANCE.agc:62
//			1/DV0
// slot 31674
    31674, 3826,
// ASCENT_GUIDANCE.agc:63
//			1/DV1
// slot 31675
    31675, 3898,
// ASCENT_GUIDANCE.agc:64
//		DAD	DAD
// slot 31676
    31676, 36122,
// ASCENT_GUIDANCE.agc:65
//			1/DV2
// slot 31677
    31677, 3902,
// ASCENT_GUIDANCE.agc:66
//			1/DV3
// slot 31678
    31678, 3906,
// ASCENT_GUIDANCE.agc:67
//		DMP	DMP
// slot 31679
    31679, 34058,
// ASCENT_GUIDANCE.agc:68
//			VE
// slot 31680
    31680, 2410,
// ASCENT_GUIDANCE.agc:69
//			2SEC(9)
// slot 31681
    31681, 17460,
// ASCENT_GUIDANCE.agc:70
//		SL3	PDDL
// slot 31682
    31682, 54612,
// ASCENT_GUIDANCE.agc:71
//			TBUP
// slot 31683
    31683, 2418,
// ASCENT_GUIDANCE.agc:72
//		SR1	DAD
// slot 31684
    31684, 36292,
// ASCENT_GUIDANCE.agc:73
//		DSU
// slot 31685
    31685, 65322,
// ASCENT_GUIDANCE.agc:74
//			6SEC(18)
// slot 31686
    31686, 17454,
// ASCENT_GUIDANCE.agc:75
//		STODL	TBUP
// slot 31687
    31687, 14706,
// ASCENT_GUIDANCE.agc:76
//			VE
// slot 31688
    31688, 2410,
// ASCENT_GUIDANCE.agc:77
//		SR1	DDV
// slot 31689
    31689, 47556,
// ASCENT_GUIDANCE.agc:78
//			TBUP
// slot 31690
    31690, 2418,
// ASCENT_GUIDANCE.agc:79
//		STCALL	AT
// slot 31691
    31691, 31078,
// ASCENT_GUIDANCE.agc:80
//# Page 844
// ASCENT_GUIDANCE.agc:81
//			ASCENT
// slot 31692
    31692, 49570,
// ASCENT_GUIDANCE.agc:82
//BIT3H		OCT	4
// slot 31693
    31693, 8,
// ASCENT_GUIDANCE.agc:83
//
// ASCENT_GUIDANCE.agc:84
//# Page 845
// ASCENT_GUIDANCE.agc:85
//		BANK	30
// ASCENT_GUIDANCE.agc:86
//		SETLOC	ASENT
// ASCENT_GUIDANCE.agc:87
//		BANK
// ASCENT_GUIDANCE.agc:88
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:89
//
// ASCENT_GUIDANCE.agc:90
//ASCENT		VLOAD	ABVAL
// slot 26833
    26833, 42746,
// ASCENT_GUIDANCE.agc:91
//			R
// slot 26834
    26834, 3746,
// ASCENT_GUIDANCE.agc:92
//		STOVL	/R/MAG
// slot 26835
    26835, 22914,
// ASCENT_GUIDANCE.agc:93
//			ZAXIS1
// slot 26836
    26836, 4012,
// ASCENT_GUIDANCE.agc:94
//		DOT	SL1
// slot 26837
    26837, 59970,
// ASCENT_GUIDANCE.agc:95
//			V		# Z.V = ZDOT*2(-8).
// slot 26838
    26838, 3758,
// ASCENT_GUIDANCE.agc:96
//		STOVL	ZDOT		# ZDOT*2(-7)
// slot 26839
    26839, 22934,
// ASCENT_GUIDANCE.agc:97
//			ZAXIS1
// slot 26840
    26840, 4012,
// ASCENT_GUIDANCE.agc:98
//		VXV	VSL1
// slot 26841
    26841, 64058,
// ASCENT_GUIDANCE.agc:99
//			UNIT/R/		# Z X UR = LAXIS*2(-2)
// slot 26842
    26842, 3774,
// ASCENT_GUIDANCE.agc:100
//		STORE	LAXIS		# LAXIS*2(-1)
// slot 26843
    26843, 2438,
// ASCENT_GUIDANCE.agc:101
//		DOT	SL1
// slot 26844
    26844, 59970,
// ASCENT_GUIDANCE.agc:102
//			V		# L.V = YDOT*2(-8).
// slot 26845
    26845, 3758,
// ASCENT_GUIDANCE.agc:103
//		STCALL	YDOT		# YDOT * 2(-7)
// slot 26846
    26846, 31122,
// ASCENT_GUIDANCE.agc:104
//			YCOMP
// slot 26847
    26847, 48532,
// ASCENT_GUIDANCE.agc:105
//		VLOAD
// slot 26848
    26848, 65530,
// ASCENT_GUIDANCE.agc:106
//			GDT1/2		# LOAD GDT1/2*2(-7) M/CS.
// slot 26849
    26849, 3814,
// ASCENT_GUIDANCE.agc:107
//		V/SC	DOT
// slot 26850
    26850, 41410,
// ASCENT_GUIDANCE.agc:108
//			2SEC(18)
// slot 26851
    26851, 23758,
// ASCENT_GUIDANCE.agc:109
//			UNIT/R/		# G.UR*2(9) = GR*2(9).
// slot 26852
    26852, 3774,
// ASCENT_GUIDANCE.agc:110
//		PDVL	VXV		# STORE IN PDL(0)
// slot 26853
    26853, 40346,
// ASCENT_GUIDANCE.agc:111
//			UNIT/R/		# LOAD UNIT/R/ *2(-1)
// slot 26854
    26854, 3774,
// ASCENT_GUIDANCE.agc:112
//			V		# UR*2(-1) X V*2(-7) = H/R*2(-8).
// slot 26855
    26855, 3758,
// ASCENT_GUIDANCE.agc:113
//		VSQ	DDV		# H(2)/R(2)*2(-16).
// slot 26856
    26856, 47420,
// ASCENT_GUIDANCE.agc:114
//			/R/MAG		# H(2)/R(3)*2(9).
// slot 26857
    26857, 2434,
// ASCENT_GUIDANCE.agc:115
//		SL1	DAD
// slot 26858
    26858, 36308,
// ASCENT_GUIDANCE.agc:116
//		STADR
// slot 26859
    26859, 65324,
// ASCENT_GUIDANCE.agc:117
//		STODL	GEFF		# GEFF*2(10)m/CS/CS.
// slot 26860
    26860, 50788,
// ASCENT_GUIDANCE.agc:118
//			ZDOTD
// slot 26861
    26861, 2430,
// ASCENT_GUIDANCE.agc:119
//		DSU
// slot 26862
    26862, 65322,
// ASCENT_GUIDANCE.agc:120
//			ZDOT
// slot 26863
    26863, 2454,
// ASCENT_GUIDANCE.agc:121
//		STORE	DZDOT		# DZDOT = (ZDOTD - ZDOT) * 2(7) M/CS.
// slot 26864
    26864, 2502,
// ASCENT_GUIDANCE.agc:122
//		VXSC	PDDL
// slot 26865
    26865, 54754,
// ASCENT_GUIDANCE.agc:123
//			ZAXIS1
// slot 26866
    26866, 4012,
// ASCENT_GUIDANCE.agc:124
//			YDOTD
// slot 26867
    26867, 2426,
// ASCENT_GUIDANCE.agc:125
//		DSU
// slot 26868
    26868, 65322,
// ASCENT_GUIDANCE.agc:126
//			YDOT
// slot 26869
    26869, 2450,
// ASCENT_GUIDANCE.agc:127
//		STORE	DYDOT		# DYDOT = (YDOTD - YDOT) *2(7) M/CS.
// slot 26870
    26870, 2498,
// ASCENT_GUIDANCE.agc:128
//		VXSC	PDDL
// slot 26871
    26871, 54754,
// ASCENT_GUIDANCE.agc:129
//			LAXIS
// slot 26872
    26872, 2438,
// ASCENT_GUIDANCE.agc:130
//			RDOTD
// slot 26873
    26873, 2422,
// ASCENT_GUIDANCE.agc:131
//# Page 846
// ASCENT_GUIDANCE.agc:132
//		DSU
// slot 26874
    26874, 65322,
// ASCENT_GUIDANCE.agc:133
//			RDOT
// slot 26875
    26875, 3704,
// ASCENT_GUIDANCE.agc:134
//		STORE	DRDOT		# DRDOT = (RDOTD - RDOT) * 2(7) M/CS.
// slot 26876
    26876, 2494,
// ASCENT_GUIDANCE.agc:135
//		VXSC	VAD
// slot 26877
    26877, 44514,
// ASCENT_GUIDANCE.agc:136
//			UNIT/R/
// slot 26878
    26878, 3774,
// ASCENT_GUIDANCE.agc:137
//		VAD	VSL1
// slot 26879
    26879, 64090,
// ASCENT_GUIDANCE.agc:138
//		STADR
// slot 26880
    26880, 65324,
// ASCENT_GUIDANCE.agc:139
//		STORE	VGVECT		# VG = (DRDOT)R + (DVDOT)L + (DZDOT)Z.
// slot 26881
    26881, 61618,
// ASCENT_GUIDANCE.agc:140
//		DLOAD	DMP		# LOAD TGO
// slot 26882
    26882, 34250,
// ASCENT_GUIDANCE.agc:141
//			TGO		# TGO GEFF
// slot 26883
    26883, 3742,
// ASCENT_GUIDANCE.agc:142
//			GEFF
// slot 26884
    26884, 2458,
// ASCENT_GUIDANCE.agc:143
//		VXSC	VSL1
// slot 26885
    26885, 64226,
// ASCENT_GUIDANCE.agc:144
//			UNIT/R/		# TGO GEFF UR
// slot 26886
    26886, 3774,
// ASCENT_GUIDANCE.agc:145
//		BVSU
// slot 26887
    26887, 65354,
// ASCENT_GUIDANCE.agc:146
//			VGVECT		# COMPENSATED FOR GEFF
// slot 26888
    26888, 3916,
// ASCENT_GUIDANCE.agc:147
//		STORE	VGVECT		# STORE FOR DOWNLINK
// slot 26889
    26889, 3916,
// ASCENT_GUIDANCE.agc:148
//		MXV	VSL1		# GET VGBODY FOR N85 DISPLAY
// slot 26890
    26890, 64162,
// ASCENT_GUIDANCE.agc:149
//			XNBPIP
// slot 26891
    26891, 2252,
// ASCENT_GUIDANCE.agc:150
//		STOVL	VGBODY
// slot 26892
    26892, 24196,
// ASCENT_GUIDANCE.agc:151
//			VGVECT
// slot 26893
    26893, 3916,
// ASCENT_GUIDANCE.agc:152
//		ABVAL	BOFF		# MAGNITUDE OF VGVECT
// slot 26894
    26894, 35916,
// ASCENT_GUIDANCE.agc:153
//			FLRCS		# IF FLRCS=0,D0 NORMAL GUIDANCE
// slot 26895
    26895, 5066,
// ASCENT_GUIDANCE.agc:154
//			MAINENG
// slot 26896
    26896, 49706,
// ASCENT_GUIDANCE.agc:155
//		DDV			# USE TGO=VG/AT WITH RCS
// slot 26897
    26897, 65394,
// ASCENT_GUIDANCE.agc:156
//			AT/RCS
// slot 26898
    26898, 16386,
// ASCENT_GUIDANCE.agc:157
//		STCALL	TGO		# THIS WILL BE USED ON NEXT CYCLE
// slot 26899
    26899, 32414,
// ASCENT_GUIDANCE.agc:158
//			ASCTERM2
// slot 26900
    26900, 50124,
// ASCENT_GUIDANCE.agc:159
//MAINENG		DDV	PUSH		# VG/VE IN PDL(0)		(2)
// slot 26901
    26901, 34418,
// ASCENT_GUIDANCE.agc:160
//			VE
// slot 26902
    26902, 2410,
// ASCENT_GUIDANCE.agc:161
//		DMP	BDSU		# 1 - KT VG/VE
// slot 26903
    26903, 37130,
// ASCENT_GUIDANCE.agc:162
//			KT1
// slot 26904
    26904, 22786,
// ASCENT_GUIDANCE.agc:163
//			NEARONE
// slot 26905
    26905, 16370,
// ASCENT_GUIDANCE.agc:164
//		DMP	DMP		# TBUP VG(1-KT VG/VE)/VE	(0)
// slot 26906
    26906, 34058,
// ASCENT_GUIDANCE.agc:165
//			TBUP		# 	= TGO
// slot 26907
    26907, 2418,
// ASCENT_GUIDANCE.agc:166
//		DSU			# COMPENSATE FOR TAILOFF
// slot 26908
    26908, 65322,
// ASCENT_GUIDANCE.agc:167
//			TTO
// slot 26909
    26909, 2414,
// ASCENT_GUIDANCE.agc:168
//		STORE	TGO
// slot 26910
    26910, 3742,
// ASCENT_GUIDANCE.agc:169
//		SR	DCOMP
// slot 26911
    26911, 48738,
// ASCENT_GUIDANCE.agc:170
//			11D
// slot 26912
    26912, 17176,
// ASCENT_GUIDANCE.agc:171
//		STODL	TTOGO		# TGO *2(-28) CS
// slot 26913
    26913, 15960,
// ASCENT_GUIDANCE.agc:172
//			TGO
// slot 26914
    26914, 3742,
// ASCENT_GUIDANCE.agc:173
//		BON	DSU
// slot 26915
    26915, 38168,
// ASCENT_GUIDANCE.agc:174
//			IDLEFLAG
// slot 26916
    26916, 3984,
// ASCENT_GUIDANCE.agc:175
//			T2TEST
// slot 26917
    26917, 49746,
// ASCENT_GUIDANCE.agc:176
//			4SEC(17)	# ( TGO - 4 )*2(-17) CS.
// slot 26918
    26918, 17442,
// ASCENT_GUIDANCE.agc:177
//		BMN
// slot 26919
    26919, 65344,
// ASCENT_GUIDANCE.agc:178
//			ENGOFF
// slot 26920
    26920, 25050,
// ASCENT_GUIDANCE.agc:179
//T2TEST		DLOAD
// slot 26921
    26921, 65482,
// ASCENT_GUIDANCE.agc:180
//			TGO
// slot 26922
    26922, 3742,
// ASCENT_GUIDANCE.agc:181
//		DSU	BMN		# IF TGO - T2 NEG., GO TO CMPONENT
// slot 26923
    26923, 41002,
// ASCENT_GUIDANCE.agc:182
//# Page 847
// ASCENT_GUIDANCE.agc:183
//			T2A
// slot 26924
    26924, 17446,
// ASCENT_GUIDANCE.agc:184
//			CMPONENT
// slot 26925
    26925, 49940,
// ASCENT_GUIDANCE.agc:185
//		DLOAD	DSU
// slot 26926
    26926, 38346,
// ASCENT_GUIDANCE.agc:186
//			TBUP
// slot 26927
    26927, 2418,
// ASCENT_GUIDANCE.agc:187
//			TGO
// slot 26928
    26928, 3742,
// ASCENT_GUIDANCE.agc:188
//		DDV	CALL		# 1- TGO/TBUP
// slot 26929
    26929, 38002
)).

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:189
//			TBUP
// slot 26930
    26930, 2418,
// ASCENT_GUIDANCE.agc:190
//			LOGSUB
// slot 26931
    26931, 50236,
// ASCENT_GUIDANCE.agc:191
//		SL	PUSH		# -L IN PDL(0)			(2)
// slot 26932
    26932, 34402,
// ASCENT_GUIDANCE.agc:192
//			5
// slot 26933
    26933, 16652,
// ASCENT_GUIDANCE.agc:193
//		BDDV	BDSU		# -TGO/L*2(-17)
// slot 26934
    26934, 37226,
// ASCENT_GUIDANCE.agc:194
//			TGO
// slot 26935
    26935, 3742,
// ASCENT_GUIDANCE.agc:195
//			TBUP		# TBUP + TGO/L = D12*2(-17)
// slot 26936
    26936, 2418,
// ASCENT_GUIDANCE.agc:196
//		PUSH	BON		# STORE IN PDL(2)		(4)
// slot 26937
    26937, 35852,
// ASCENT_GUIDANCE.agc:197
//			FLPC		# IF FLPC = 1, GO TO CONST
// slot 26938
    26938, 4998,
// ASCENT_GUIDANCE.agc:198
//			NORATES
// slot 26939
    26939, 49796,
// ASCENT_GUIDANCE.agc:199
//		DLOAD	DSU
// slot 26940
    26940, 38346,
// ASCENT_GUIDANCE.agc:200
//			TGO
// slot 26941
    26941, 3742,
// ASCENT_GUIDANCE.agc:201
//			T3
// slot 26942
    26942, 17450,
// ASCENT_GUIDANCE.agc:202
//		BPL	SET		# FLPC=1
// slot 26943
    26943, 35912,
// ASCENT_GUIDANCE.agc:203
//			RATES
// slot 26944
    26944, 49808,
// ASCENT_GUIDANCE.agc:204
//			FLPC
// slot 26945
    26945, 4710,
// ASCENT_GUIDANCE.agc:205
//NORATES		DLOAD
// slot 26946
    26946, 65482,
// ASCENT_GUIDANCE.agc:206
//			HI6ZEROS
// slot 26947
    26947, 6820,
// ASCENT_GUIDANCE.agc:207
//		STORE	PRATE		# B = 0
// slot 26948
    26948, 2514,
// ASCENT_GUIDANCE.agc:208
//		STORE	YRATE		# D = 0
// slot 26949
    26949, 2518,
// ASCENT_GUIDANCE.agc:209
//		GOTO
// slot 26950
    26950, 65360,
// ASCENT_GUIDANCE.agc:210
//			CONST		# GO TO CONST
// slot 26951
    26951, 49908,
// ASCENT_GUIDANCE.agc:211
//RATES		DLOAD	DSU
// slot 26952
    26952, 38346,
// ASCENT_GUIDANCE.agc:212
//			TGO
// slot 26953
    26953, 3742,
// ASCENT_GUIDANCE.agc:213
//			02D		# TGO - D12 = D21*2(-17)
// slot 26954
    26954, 6,
// ASCENT_GUIDANCE.agc:214
//		PUSH	SL1		# IN PDL(4)			(6)
// slot 26955
    26955, 59916,
// ASCENT_GUIDANCE.agc:215
//		BDSU	SL3		# (1/2TGO - D21)*2(-13) = E * 2(-13)
// slot 26956
    26956, 43554,
// ASCENT_GUIDANCE.agc:216
//			TGO		#				(8)
// slot 26957
    26957, 3742,
// ASCENT_GUIDANCE.agc:217
//		PDDL	DMP		# IN PDL(6)
// slot 26958
    26958, 34218,
// ASCENT_GUIDANCE.agc:218
//			TGO
// slot 26959
    26959, 3742,
// ASCENT_GUIDANCE.agc:219
//			RDOT		# RDOT TGO * 2(-24)
// slot 26960
    26960, 3704,
// ASCENT_GUIDANCE.agc:220
//		DAD	DSU		# R + RDOT TGO
// slot 26961
    26961, 38170,
// ASCENT_GUIDANCE.agc:221
//			/R/MAG		# R + RDOT TGO - RCO
// slot 26962
    26962, 2434,
// ASCENT_GUIDANCE.agc:222
//			RCO		# MPAC = -DR *2(-24).
// slot 26963
    26963, 3890,
// ASCENT_GUIDANCE.agc:223
//		PDDL	DMP		# -DR IN PDL(8)			(10)
// slot 26964
    26964, 34218,
// ASCENT_GUIDANCE.agc:224
//			DRDOT
// slot 26965
    26965, 2494,
// ASCENT_GUIDANCE.agc:225
//			04D		# D21 DRDOT*2(-24)
// slot 26966
    26966, 10,
// ASCENT_GUIDANCE.agc:226
//		DAD	SL2		# (D21 DRDOT-DR)*2(-22)		(8)
// slot 26967
    26967, 51738,
// ASCENT_GUIDANCE.agc:227
//		DDV	DDV
// slot 26968
    26968, 47474,
// ASCENT_GUIDANCE.agc:228
//			06D		# (D21 DRDOT-DR)/E*2(-9)
// slot 26969
    26969, 14,
// ASCENT_GUIDANCE.agc:229
//			TGO
// slot 26970
    26970, 3742,
// ASCENT_GUIDANCE.agc:230
//		STORE	PRATE		# B * 2(8)
// slot 26971
    26971, 2514,
// ASCENT_GUIDANCE.agc:231
//		BMN	DLOAD		# B>0 NOT PERMITTED
// slot 26972
    26972, 58688,
// ASCENT_GUIDANCE.agc:232
//			CHKBMAG
// slot 26973
    26973, 49858,
// ASCENT_GUIDANCE.agc:233
//# Page 848
// ASCENT_GUIDANCE.agc:234
//			HI6ZEROS
// slot 26974
    26974, 6820,
// ASCENT_GUIDANCE.agc:235
//		STCALL	PRATE
// slot 26975
    26975, 31186,
// ASCENT_GUIDANCE.agc:236
//			PROK
// slot 26976
    26976, 49878,
// ASCENT_GUIDANCE.agc:237
//CHKBMAG		SR4	DDV		# B*2(4)
// slot 26977
    26977, 47364,
// ASCENT_GUIDANCE.agc:238
//			TBUP		# (B / TAU) * 2(21)
// slot 26978
    26978, 2418,
// ASCENT_GUIDANCE.agc:239
//		DSU	BPL
// slot 26979
    26979, 42026,
// ASCENT_GUIDANCE.agc:240
//			PRLIMIT		# ( B / TAU ) = 2(21) MAX.
// slot 26980
    26980, 22790,
// ASCENT_GUIDANCE.agc:241
//			PROK
// slot 26981
    26981, 49878,
// ASCENT_GUIDANCE.agc:242
//		DLOAD	DMP
// slot 26982
    26982, 34250,
// ASCENT_GUIDANCE.agc:243
//			PRLIMIT
// slot 26983
    26983, 22790,
// ASCENT_GUIDANCE.agc:244
//			TBUP		# B MAX. * 2(4)
// slot 26984
    26984, 2418,
// ASCENT_GUIDANCE.agc:245
//		SL4			# BMAX*2(8)
// slot 26985
    26985, 65300,
// ASCENT_GUIDANCE.agc:246
//		STORE	PRATE
// slot 26986
    26986, 2514,
// ASCENT_GUIDANCE.agc:247
//PROK		DLOAD
// slot 26987
    26987, 65482,
// ASCENT_GUIDANCE.agc:248
//			TGO
// slot 26988
    26988, 3742,
// ASCENT_GUIDANCE.agc:249
//		DMP	DAD		# YDOT TGO
// slot 26989
    26989, 36106,
// ASCENT_GUIDANCE.agc:250
//			YDOT
// slot 26990
    26990, 2450,
// ASCENT_GUIDANCE.agc:251
//			Y		# Y + YDOT TGO
// slot 26991
    26991, 2490,
// ASCENT_GUIDANCE.agc:252
//		DSU	PDDL		# Y + YDOT TGO - YCO
// slot 26992
    26992, 54570,
// ASCENT_GUIDANCE.agc:253
//			YCO		# MPAC = - DY*(-24.) IN PDL(8)	(10)
// slot 26993
    26993, 3894,
// ASCENT_GUIDANCE.agc:254
//			DYDOT
// slot 26994
    26994, 2498,
// ASCENT_GUIDANCE.agc:255
//		DMP	DAD		# D21 DYDOT - DY		(8)
// slot 26995
    26995, 36106,
// ASCENT_GUIDANCE.agc:256
//			04D
// slot 26996
    26996, 10,
// ASCENT_GUIDANCE.agc:257
//		SL2	DDV		# (D21 DYDOT - DY)/E*2(-9)
// slot 26997
    26997, 47508,
// ASCENT_GUIDANCE.agc:258
//		DDV	SETPD		# (D21 DYDOT - DY)/E TGO*2(8)
// slot 26998
    26998, 33138,
// ASCENT_GUIDANCE.agc:259
//			TGO		#	= D*2(8)
// slot 26999
    26999, 3742,
// ASCENT_GUIDANCE.agc:260
//			04
// slot 27000
    27000, 10,
// ASCENT_GUIDANCE.agc:261
//		STORE	YRATE
// slot 27001
    27001, 2518,
// ASCENT_GUIDANCE.agc:262
//CONST		DLOAD	DMP		# LOAD B*2(8)
// slot 27002
    27002, 34250,
// ASCENT_GUIDANCE.agc:263
//			PRATE		# B D12*2(-9)
// slot 27003
    27003, 2514,
// ASCENT_GUIDANCE.agc:264
//			02D
// slot 27004
    27004, 6,
// ASCENT_GUIDANCE.agc:265
//		PDDL	DDV		# D12 B IN PDL(4)	(6)
// slot 27005
    27005, 47530,
// ASCENT_GUIDANCE.agc:266
//			DRDOT		# LOAD DRDOT*2(-7)
// slot 27006
    27006, 2494,
// ASCENT_GUIDANCE.agc:267
//			00D		# -DRDOT/L*2(-7)
// slot 27007
    27007, 2,
// ASCENT_GUIDANCE.agc:268
//		SR2	DSU		# (-DRDOT/L-D12 B)=A*2(-9)	(4)
// slot 27008
    27008, 38276,
// ASCENT_GUIDANCE.agc:269
//		STADR
// slot 27009
    27009, 65324,
// ASCENT_GUIDANCE.agc:270
//		STODL	PCONS
// slot 27010
    27010, 50740,
// ASCENT_GUIDANCE.agc:271
//			YRATE		# D*2(8)
// slot 27011
    27011, 2518,
// ASCENT_GUIDANCE.agc:272
//		DMP	PDDL		# D12 D,EXCH WITH -L IN PDL(0)	(2,2)
// slot 27012
    27012, 54538,
// ASCENT_GUIDANCE.agc:273
//		BDDV	SR2		# -DYDOT/L*2(-9)
// slot 27013
    27013, 49770,
// ASCENT_GUIDANCE.agc:274
//			DYDOT
// slot 27014
    27014, 2498,
// ASCENT_GUIDANCE.agc:275
//		DSU			# (-DYDOT/L-D12 D)=C*2(-9)
// slot 27015
    27015, 65322,
// ASCENT_GUIDANCE.agc:276
//			00D
// slot 27016
    27016, 2,
// ASCENT_GUIDANCE.agc:277
//		STORE	YCONS
// slot 27017
    27017, 2510,
// ASCENT_GUIDANCE.agc:278
//CMPONENT	SETPD	DLOAD
// slot 27018
    27018, 58626,
// ASCENT_GUIDANCE.agc:279
//			00D
// slot 27019
    27019, 2,
// ASCENT_GUIDANCE.agc:280
// 			100CS
// slot 27020
    27020, 23758,
// ASCENT_GUIDANCE.agc:281
// 		DMP
// slot 27021
    27021, 65290,
// ASCENT_GUIDANCE.agc:282
//			PRATE		# B(T-T0)*2(-9)
// slot 27022
    27022, 2514,
// ASCENT_GUIDANCE.agc:283
//		DAD	DDV		# (A+B(T-T0))*2(-9)
// slot 27023
    27023, 47386,
// ASCENT_GUIDANCE.agc:284
//# Page 849
// ASCENT_GUIDANCE.agc:285
//			PCONS		# (A+B(T-T0))/TBUP*2(8)
// slot 27024
    27024, 2506,
// ASCENT_GUIDANCE.agc:286
//			TBUP
// slot 27025
    27025, 2418,
// ASCENT_GUIDANCE.agc:287
//		SL1	DSU
// slot 27026
    27026, 38356,
// ASCENT_GUIDANCE.agc:288
//			GEFF		# ATR*2(9)
// slot 27027
    27027, 2458,
// ASCENT_GUIDANCE.agc:289
//		STODL	ATR
// slot 27028
    27028, 14814,
// ASCENT_GUIDANCE.agc:290
//			100CS
// slot 27029
    27029, 23758,
// ASCENT_GUIDANCE.agc:291
//		DMP	DAD
// slot 27030
    27030, 36106,
// ASCENT_GUIDANCE.agc:292
//			YRATE
// slot 27031
    27031, 2518,
// ASCENT_GUIDANCE.agc:293
//			YCONS		# (C+D(T-T0))*2(-9)
// slot 27032
    27032, 2510,
// ASCENT_GUIDANCE.agc:294
//		DDV	SL1
// slot 27033
    27033, 60018,
// ASCENT_GUIDANCE.agc:295
//			TBUP
// slot 27034
    27034, 2418,
// ASCENT_GUIDANCE.agc:296
//		STORE	ATY		# ATY*2(9)
// slot 27035
    27035, 2522,
// ASCENT_GUIDANCE.agc:297
//		VXSC	PDDL		# ATY UY*2(8)		(6)
// slot 27036
    27036, 54754,
// ASCENT_GUIDANCE.agc:298
//			LAXIS
// slot 27037
    27037, 2438,
// ASCENT_GUIDANCE.agc:299
//			ATR
// slot 27038
    27038, 2526,
// ASCENT_GUIDANCE.agc:300
//		VXSC	VAD
// slot 27039
    27039, 44514,
// ASCENT_GUIDANCE.agc:301
//			UNIT/R/
// slot 27040
    27040, 3774,
// ASCENT_GUIDANCE.agc:302
//		VSL1	PUSH		# AH*2(9) IN PDL(0)	(6)
// slot 27041
    27041, 34548,
// ASCENT_GUIDANCE.agc:303
//		ABVAL	PDDL		# AH(2) IN PDL(34)
// slot 27042
    27042, 54604,
// ASCENT_GUIDANCE.agc:304
//			AT		# AHMAG IN PDL(6)	(8)
// slot 27043
    27043, 2406,
// ASCENT_GUIDANCE.agc:305
//		DSQ	DSU		# (AT(2)-AH(2))*2(18)
// slot 27044
    27044, 38300,
// ASCENT_GUIDANCE.agc:306
//			34D		# =ATP2*2(18)
// slot 27045
    27045, 70,
// ASCENT_GUIDANCE.agc:307
//		PDDL	PUSH		#			(12)
// slot 27046
    27046, 34474,
// ASCENT_GUIDANCE.agc:308
//			AT
// slot 27047
    27047, 2406,
// ASCENT_GUIDANCE.agc:309
//		DSQ	DSU		# (AT(2)KR(2)-AH(2))*2(18)	(10)
// slot 27048
    27048, 38300,
// ASCENT_GUIDANCE.agc:310
//			34D		# =ATP3*2(18)
// slot 27049
    27049, 70,
// ASCENT_GUIDANCE.agc:311
//		BMN	DLOAD		# IF ATP3 NEG,GO TO NO-ATP
// slot 27050
    27050, 58688,
// ASCENT_GUIDANCE.agc:312
//			NO-ATP		# LOAD ATP2, IF ATP3 POS
// slot 27051
    27051, 50014,
// ASCENT_GUIDANCE.agc:313
//			8D
// slot 27052
    27052, 18,
// ASCENT_GUIDANCE.agc:314
//		SQRT	GOTO		# ATP*2(9)
// slot 27053
    27053, 43244,
// ASCENT_GUIDANCE.agc:315
//			AIMER
// slot 27054
    27054, 50026,
// ASCENT_GUIDANCE.agc:316
//NO-ATP		DLOAD	BDDV		# KR AT/AH = KH		(8)
// slot 27055
    27055, 46538
)).

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:317
//			6D
// slot 27056
    27056, 14,
// ASCENT_GUIDANCE.agc:318
//		VXSC			# KH AG*2(9)
// slot 27057
    27057, 65506,
// ASCENT_GUIDANCE.agc:319
//			00D
// slot 27058
    27058, 2,
// ASCENT_GUIDANCE.agc:320
//		STODL	00D		# STORE NEW AH IN PDL(0)
// slot 27059
    27059, 12290,
// ASCENT_GUIDANCE.agc:321
//			HI6ZEROS
// slot 27060
    27060, 6820,
// ASCENT_GUIDANCE.agc:322
//AIMER		SIGN
// slot 27061
    27061, 65514,
// ASCENT_GUIDANCE.agc:323
//			DZDOT
// slot 27062
    27062, 2502,
// ASCENT_GUIDANCE.agc:324
//		STORE	ATP
// slot 27063
    27063, 2530,
// ASCENT_GUIDANCE.agc:325
//		VXSC
// slot 27064
    27064, 65506,
// ASCENT_GUIDANCE.agc:326
//			ZAXIS1		# ATP ZAXIS *2(8).
// slot 27065
    27065, 4012,
// ASCENT_GUIDANCE.agc:327
//		VSL1	VAD		# AT*2(0)
// slot 27066
    27066, 44532,
// ASCENT_GUIDANCE.agc:328
//			00D
// slot 27067
    27067, 2,
// ASCENT_GUIDANCE.agc:329
//		STORE	UNFC/2		# WILL BE OVERWRITTEN IF IN VERT. RISE.
// slot 27068
    27068, 3416,
// ASCENT_GUIDANCE.agc:330
//		SETPD	BON
// slot 27069
    27069, 35842,
// ASCENT_GUIDANCE.agc:331
//			00D
// slot 27070
    27070, 2,
// ASCENT_GUIDANCE.agc:332
//			FLPI
// slot 27071
    27071, 5000,
// ASCENT_GUIDANCE.agc:333
//			P12RET
// slot 27072
    27072, 49440,
// ASCENT_GUIDANCE.agc:334
//		BON
// slot 27073
    27073, 65304,
// ASCENT_GUIDANCE.agc:335
//# Page 850
// ASCENT_GUIDANCE.agc:336
//			FLVR
// slot 27074
    27074, 4994,
// ASCENT_GUIDANCE.agc:337
//			CHECKALT
// slot 27075
    27075, 50138,
// ASCENT_GUIDANCE.agc:338
//MAINLINE	VLOAD	VCOMP
// slot 27076
    27076, 48890,
// ASCENT_GUIDANCE.agc:339
//			UNIT/R/
// slot 27077
    27077, 3774,
// ASCENT_GUIDANCE.agc:340
//		STODL	UNWC/2
// slot 27078
    27078, 15716,
// ASCENT_GUIDANCE.agc:341
//			TXO
// slot 27079
    27079, 3928,
// ASCENT_GUIDANCE.agc:342
//		DSU	BPL
// slot 27080
    27080, 42026,
// ASCENT_GUIDANCE.agc:343
//			PIPTIME
// slot 27081
    27081, 1338,
// ASCENT_GUIDANCE.agc:344
//			ASCTERM
// slot 27082
    27082, 50082,
// ASCENT_GUIDANCE.agc:345
//		BON
// slot 27083
    27083, 65304,
// ASCENT_GUIDANCE.agc:346
//			ROTFLAG
// slot 27084
    27084, 5010,
// ASCENT_GUIDANCE.agc:347
//			ANG1CHEK
// slot 27085
    27085, 48502,
// ASCENT_GUIDANCE.agc:348
//CLRXFLAG	CLEAR	CLEAR
// slot 27086
    27086, 35864,
// ASCENT_GUIDANCE.agc:349
//			NOR29FLG	# START r29 IN ASCENT PHASE.
// slot 27087
    27087, 1896,
// ASCENT_GUIDANCE.agc:350
//			XOVINFLG	# ALLOW X-AXIS OVERRIDE
// slot 27088
    27088, 7020,
// ASCENT_GUIDANCE.agc:351
//ASCTERM		EXIT
// slot 27089
    27089, 65532
)).

// bank 30, slots 27090-27094
function agcAotUnit1702 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27091 {
        if slot <= 27090 {
// ASCENT_GUIDANCE.agc:352
//		CA	FLAGWRD9
// slot 27090
            if slot <> 27090 or instruction <> 12357 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 69).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// ASCENT_GUIDANCE.agc:353
//		MASK	FLRCSBIT
// slot 27091
            if slot <> 27091 or instruction <> 31202 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                if fixedOperand = 512 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27092 {
// ASCENT_GUIDANCE.agc:354
//		CCS	A
// slot 27092
            if slot <> 27092 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27093 {
// ASCENT_GUIDANCE.agc:355
//		TCF	ASCTERM3
// slot 27093
                if slot <> 27093 or instruction <> 5607 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5607, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:356
//		TC	INTPRET
// slot 27094
                if slot <> 27094 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1702] to agcAotUnit1702@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:357
//		CALL
// slot 27095
    27095, 65320,
// ASCENT_GUIDANCE.agc:358
//			FINDCDUW -2
// slot 27096
    27096, 50322,
// ASCENT_GUIDANCE.agc:359
//ASCTERM1	EXIT
// slot 27097
    27097, 65532
)).

// bank 30, slots 27098-27107
function agcAotUnit1703 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27102 {
        if slot <= 27099 {
            if slot <= 27098 {
// ASCENT_GUIDANCE.agc:360
// +1		CA	FLAGWRD9	# INSURE THAT THE NOUN 63 DISPLAY IS
// slot 27098
                if slot <> 27098 or instruction <> 12357 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:361
// 		MASK	FLRCSBIT	# BYPASSED IF WE ARE IN THE RCS TRIMMING
// slot 27099
                if slot <> 27099 or instruction <> 31202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    if fixedOperand = 512 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27100 {
// ASCENT_GUIDANCE.agc:362
//		CCS	A		# MODE OF OPERATION
// slot 27100
                if slot <> 27100 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27101 {
// ASCENT_GUIDANCE.agc:363
//		TCF	ASCTERM3
// slot 27101
                    if slot <> 27101 or instruction <> 5607 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5607, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:364
//		CA	FLAGWRD8	# BYPASS DISPLAYS IF ENGINE FAILURE IS
// slot 27102
                    if slot <> 27102 or instruction <> 12356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 68).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27104 {
            if slot <= 27103 {
// ASCENT_GUIDANCE.agc:365
//		MASK	FLUNDBIT	# INDICATED.
// slot 27103
                if slot <> 27103 or instruction <> 31202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                    if fixedOperand = 512 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 2) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:366
//		CCS	A
// slot 27104
                if slot <> 27104 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27105 {
// ASCENT_GUIDANCE.agc:367
//		TCF	ASCTERM3
// slot 27105
                if slot <> 27105 or instruction <> 5607 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5607, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27106 {
// ASCENT_GUIDANCE.agc:368
//		CAF	V06N63*
// slot 27106
                    if slot <> 27106 or instruction <> 13851 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1563), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:369
//		TC	BANKCALL
// slot 27107
                    if slot <> 27107 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1703] to agcAotUnit1703@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:370
//		CADR	GODSPR
// slot 27108
    27108, 16978
)).

// bank 30, slots 27109-27109
function agcAotUnit1704 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:371
//		TCF	ASCTERM3
// slot 27109
    if slot <> 27109 or instruction <> 5607 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5607, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1704] to agcAotUnit1704@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:372
//ASCTERM2	EXIT
// slot 27110
    27110, 65532
)).

// bank 30, slots 27111-27111
function agcAotUnit1705 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:373
//ASCTERM3	TCF	ENDOFJOB
// slot 27111
    if slot <> 27111 or instruction <> 6765 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6765, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1705] to agcAotUnit1705@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:374
//ASCTERM4	EXIT
// slot 27112
    27112, 65532
)).

// bank 30, slots 27113-27114
function agcAotUnit1706 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27113 {
// ASCENT_GUIDANCE.agc:375
//		INHINT
// slot 27113
        if slot <> 27113 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:376
//		TC	IBNKCALL	# NO GUIDANCE THIS CYCLE -- HENCE ZERO
// slot 27114
        if slot <> 27114 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1706] to agcAotUnit1706@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:377
//		CADR	ZATTEROR	# THE DAP COMMANDED ERRORS.
// slot 27115
    27115, 32982
)).

// bank 30, slots 27116-27116
function agcAotUnit1707 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:378
//		TCF	ASCTERM1 +1
// slot 27116
    if slot <> 27116 or instruction <> 5594 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5594, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1707] to agcAotUnit1707@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:379
//
// ASCENT_GUIDANCE.agc:380
//CHECKALT	DLOAD	DSU
// slot 27117
    27117, 38346,
// ASCENT_GUIDANCE.agc:381
//			/R/MAG
// slot 27118
    27118, 2434,
// ASCENT_GUIDANCE.agc:382
//			/LAND/
// slot 27119
    27119, 2486,
// ASCENT_GUIDANCE.agc:383
//		DSU	BMN		# IF H LT 25K CHECK Z AXIS ORIENTATION
// slot 27120
    27120, 41002,
// ASCENT_GUIDANCE.agc:384
//			25KFT
// slot 27121
    27121, 23424,
// ASCENT_GUIDANCE.agc:385
//			CHECKYAW
// slot 27122
    27122, 15214,
// ASCENT_GUIDANCE.agc:386
//# Page 851
// ASCENT_GUIDANCE.agc:387
//EXITVR		CLEAR	BON
// slot 27123
    27123, 35864,
// ASCENT_GUIDANCE.agc:388
//			FLVR
// slot 27124
    27124, 4962,
// ASCENT_GUIDANCE.agc:389
//			ROTFLAG
// slot 27125
    27125, 5010,
// ASCENT_GUIDANCE.agc:390
//			MAINLINE
// slot 27126
    27126, 50056,
// ASCENT_GUIDANCE.agc:391
//		DLOAD	DAD
// slot 27127
    27127, 36298,
// ASCENT_GUIDANCE.agc:392
//			PIPTIME
// slot 27128
    27128, 1338,
// ASCENT_GUIDANCE.agc:393
//			10SECS
// slot 27129
    27129, 22490,
// ASCENT_GUIDANCE.agc:394
//		STCALL	TXO
// slot 27130
    27130, 32600,
// ASCENT_GUIDANCE.agc:395
//			MAINLINE
// slot 27131
    27131, 50056,
// ASCENT_GUIDANCE.agc:396
//EXITVR1		CLRGO
// slot 27132
    27132, 65304,
// ASCENT_GUIDANCE.agc:397
//			ROTFLAG
// slot 27133
    27133, 4914,
// ASCENT_GUIDANCE.agc:398
//			EXITVR
// slot 27134
    27134, 50150,
// ASCENT_GUIDANCE.agc:399
//
// ASCENT_GUIDANCE.agc:400
//		SETLOC	ASENT1
// ASCENT_GUIDANCE.agc:401
//		BANK
// ASCENT_GUIDANCE.agc:402
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:403
//
// ASCENT_GUIDANCE.agc:404
//ANG1CHEK	VLOAD	DOT
// slot 26299
    26299, 41466,
// ASCENT_GUIDANCE.agc:405
//			UNFC/2
// slot 26300
    26300, 3416,
// ASCENT_GUIDANCE.agc:406
//			XNBPIP
// slot 26301
    26301, 2252,
// ASCENT_GUIDANCE.agc:407
//		DSU	BPL
// slot 26302
    26302, 42026,
// ASCENT_GUIDANCE.agc:408
//			COSTHET1
// slot 26303
    26303, 2814,
// ASCENT_GUIDANCE.agc:409
//			OFFROT
// slot 26304
    26304, 48526,
// ASCENT_GUIDANCE.agc:410
//		VLOAD	DOT
// slot 26305
    26305, 41466,
// ASCENT_GUIDANCE.agc:411
//			XNBPIP
// slot 26306
    26306, 2252,
// ASCENT_GUIDANCE.agc:412
//			UNIT/R/
// slot 26307
    26307, 3774,
// ASCENT_GUIDANCE.agc:413
//		DSU	BMN
// slot 26308
    26308, 41002,
// ASCENT_GUIDANCE.agc:414
//			COSTHET2
// slot 26309
    26309, 2818,
// ASCENT_GUIDANCE.agc:415
//			KEEPVR1
// slot 26310
    26310, 25042,
// ASCENT_GUIDANCE.agc:416
//OFFROT		CLRGO
// slot 26311
    26311, 65304,
// ASCENT_GUIDANCE.agc:417
//			ROTFLAG
// slot 26312
    26312, 4914,
// ASCENT_GUIDANCE.agc:418
//			CLRXFLAG
// slot 26313
    26313, 50076,
// ASCENT_GUIDANCE.agc:419
//
// ASCENT_GUIDANCE.agc:420
//		BANK	7
// ASCENT_GUIDANCE.agc:421
//		SETLOC	ASENT2
// ASCENT_GUIDANCE.agc:422
//		BANK
// ASCENT_GUIDANCE.agc:423
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:424
//
// ASCENT_GUIDANCE.agc:425
//SETXFLAG	=	CHECKYAW
// ASCENT_GUIDANCE.agc:426
//
// ASCENT_GUIDANCE.agc:427
//CHECKYAW	SET
// slot 9655
    9655, 65304,
// ASCENT_GUIDANCE.agc:428
//			XOVINFLG	# PROHIBIT X-AXIS OVERRIDE
// slot 9656
    9656, 6764,
// ASCENT_GUIDANCE.agc:429
//		DLOAD	VXSC
// slot 9657
    9657, 61898,
// ASCENT_GUIDANCE.agc:430
//			ATY
// slot 9658
    9658, 2522,
// ASCENT_GUIDANCE.agc:431
//			LAXIS
// slot 9659
    9659, 2438,
// ASCENT_GUIDANCE.agc:432
//		PDDL	VXSC
// slot 9660
    9660, 61866,
// ASCENT_GUIDANCE.agc:433
//			ATP
// slot 9661
    9661, 2530,
// ASCENT_GUIDANCE.agc:434
//			ZAXIS1
// slot 9662
    9662, 4012,
// ASCENT_GUIDANCE.agc:435
//		VAD	UNIT
// slot 9663
    9663, 44634,
// ASCENT_GUIDANCE.agc:436
//		PUSH	DOT
// slot 9664
    9664, 41228,
// ASCENT_GUIDANCE.agc:437
//# Page 852
// ASCENT_GUIDANCE.agc:438
//			YNBPIP
// slot 9665
    9665, 2264,
// ASCENT_GUIDANCE.agc:439
//		ABS	DSU
// slot 9666
    9666, 38220,
// ASCENT_GUIDANCE.agc:440
//			SIN5DEG
// slot 9667
    9667, 11910,
// ASCENT_GUIDANCE.agc:441
//		BPL	DLOAD
// slot 9668
    9668, 58696,
// ASCENT_GUIDANCE.agc:442
//			KEEPVR
// slot 9669
    9669, 25038,
// ASCENT_GUIDANCE.agc:443
//			RDOT
// slot 9670
    9670, 3704,
// ASCENT_GUIDANCE.agc:444
//		DSU	BPL
// slot 9671
    9671, 42026,
// ASCENT_GUIDANCE.agc:445
//			40FPS
// slot 9672
    9672, 11914,
// ASCENT_GUIDANCE.agc:446
//			EXITVR1
// slot 9673
    9673, 50168,
// ASCENT_GUIDANCE.agc:447
//		GOTO
// slot 9674
    9674, 65360,
// ASCENT_GUIDANCE.agc:448
//			KEEPVR
// slot 9675
    9675, 25038,
// ASCENT_GUIDANCE.agc:449
//
// ASCENT_GUIDANCE.agc:450
//		BANK	5
// ASCENT_GUIDANCE.agc:451
//		SETLOC	ASENT3
// ASCENT_GUIDANCE.agc:452
//		BANK
// ASCENT_GUIDANCE.agc:453
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:454
//
// ASCENT_GUIDANCE.agc:455
//SIN5DEG		2DEC	0.08716 B-2
// slot 8002 8003
    8002, 714, 8003, 242,
// ASCENT_GUIDANCE.agc:456
//40FPS		2DEC	0.12192 B-7
// slot 8004 8005
    8004, 30, 8005, 19850,
// ASCENT_GUIDANCE.agc:457
//
// ASCENT_GUIDANCE.agc:458
//		BANK	14
// ASCENT_GUIDANCE.agc:459
//		SETLOC	ASENT4
// ASCENT_GUIDANCE.agc:460
//		BANK
// ASCENT_GUIDANCE.agc:461
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:462
//
// ASCENT_GUIDANCE.agc:463
//KEEPVR		VLOAD	STADR		# RECALL LOSVEC FROM PUSHLIST
// slot 14567
    14567, 38650,
// ASCENT_GUIDANCE.agc:464
//		STORE	UNWC/2
// slot 14568
    14568, 62106,
// ASCENT_GUIDANCE.agc:465
//KEEPVR1		VLOAD
// slot 14569
    14569, 65530,
// ASCENT_GUIDANCE.agc:466
//			UNIT/R/
// slot 14570
    14570, 3774,
// ASCENT_GUIDANCE.agc:467
//		STCALL	UNFC/2
// slot 14571
    14571, 32088,
// ASCENT_GUIDANCE.agc:468
//			ASCTERM
// slot 14572
    14572, 50082,
// ASCENT_GUIDANCE.agc:469
//
// ASCENT_GUIDANCE.agc:470
//ENGOFF		RTB
// slot 14573
    14573, 65336,
// ASCENT_GUIDANCE.agc:471
//			LOADTIME
// slot 14574
    14574, 18166,
// ASCENT_GUIDANCE.agc:472
//		DSU	DAD
// slot 14575
    14575, 36138,
// ASCENT_GUIDANCE.agc:473
//			PIPTIME
// slot 14576
    14576, 1338,
// ASCENT_GUIDANCE.agc:474
//			TTOGO
// slot 14577
    14577, 3672,
// ASCENT_GUIDANCE.agc:475
//		DCOMP	EXIT
// slot 14578
    14578, 65148
)).

// bank 14, slots 14579-14589
function agcAotUnit799 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14583 {
        if slot <= 14580 {
            if slot <= 14579 {
// ASCENT_GUIDANCE.agc:476
//		TC	TPAGREE		# FORCE SIGN AGREEMENT ON MPAC, MPAC +1.
// slot 14579
                if slot <> 14579 or instruction <> 3759 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3759, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ASCENT_GUIDANCE.agc:477
//		CAF	EBANK7
// slot 14580
                if slot <> 14580 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 14581 {
// ASCENT_GUIDANCE.agc:478
//		TS	EBANK
// slot 14581
                if slot <> 14581 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14582 {
// ASCENT_GUIDANCE.agc:479
//		EBANK=	TGO
// ASCENT_GUIDANCE.agc:480
//		INHINT
// slot 14582
                    if slot <> 14582 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:481
//		CCS	MPAC +1
// slot 14583
                    if slot <> 14583 or instruction <> 4205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 109).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 14586 {
            if slot <= 14584 {
// ASCENT_GUIDANCE.agc:482
//		TCF	+3		# C(A) = DT - 1 BIT
// slot 14584
                if slot <> 14584 or instruction <> 5371 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5371, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 14585 {
// ASCENT_GUIDANCE.agc:483
//		TCF	+2		# C(A) = 0
// slot 14585
                    if slot <> 14585 or instruction <> 5371 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5371, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:484
//		CAF	ZERO		# C(A) = 0
// slot 14586
                    if slot <> 14586 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            if slot <= 14587 {
// ASCENT_GUIDANCE.agc:485
//		AD	BIT1		# C(A) = 1 BIT OR DT.
// slot 14587
                if slot <> 14587 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                if slot <= 14588 {
// ASCENT_GUIDANCE.agc:486
//# Page 853
// ASCENT_GUIDANCE.agc:487
//		TS	ENGOFFDT
// slot 14588
                    if slot <> 14588 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:488
//		TC	TWIDDLE
// slot 14589
                    if slot <> 14589 or instruction <> 2683 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2683, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[799] to agcAotUnit799@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:489
//		ADRES	ENGOFF1
// slot 14590
    14590, 2576
)).

// bank 14, slots 14591-14591
function agcAotUnit800 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:490
//		TC	PHASCHNG
// slot 14591
    if slot <> 14591 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[800] to agcAotUnit800@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:491
//		OCT	47014
// slot 14592
    14592, 39960,
// ASCENT_GUIDANCE.agc:492
//		-GENADR	ENGOFFDT
// slot 14593
    14593, 63670,
// ASCENT_GUIDANCE.agc:493
//		EBANK=	TGO
// ASCENT_GUIDANCE.agc:494
//		2CADR	ENGOFF1
// slot 14594 14595
    14594, 2576, 14595, 24686
)).

// bank 14, slots 14596-14596
function agcAotUnit801 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:495
//
// ASCENT_GUIDANCE.agc:496
//		TC	INTPRET
// slot 14596
    if slot <> 14596 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[801] to agcAotUnit801@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:497
//		SET	GOTO
// slot 14597
    14597, 43032,
// ASCENT_GUIDANCE.agc:498
//			IDLEFLAG	# DISABLE DELTA-V MONITOR
// slot 14598
    14598, 3696,
// ASCENT_GUIDANCE.agc:499
//			T2TEST
// slot 14599
    14599, 49746
)).

// bank 14, slots 14600-14600
function agcAotUnit802 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:500
//
// ASCENT_GUIDANCE.agc:501
//ENGOFF1		TC	IBNKCALL	# SHUT OFF THE ENGINE.
// slot 14600
    if slot <> 14600 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[802] to agcAotUnit802@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:502
//		CADR	ENGINOF2
// slot 14601
    14601, 63186
)).

// bank 14, slots 14602-14603
function agcAotUnit803 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14602 {
// ASCENT_GUIDANCE.agc:503
//
// ASCENT_GUIDANCE.agc:504
//		CAF	PRIO17		# SET UP A JOB FOR THE ASCENT GUIDANCE
// slot 14602
        if slot <> 14602 or instruction <> 14871 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2583), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:505
//		TC	FINDVAC		# POSTBURN LOGIC.
// slot 14603
        if slot <> 14603 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[803] to agcAotUnit803@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:506
//		EBANK=	WHICH
// ASCENT_GUIDANCE.agc:507
//		2CADR	CUTOFF
// slot 14604 14605
    14604, 2600, 14605, 24686
)).

// bank 14, slots 14606-14606
function agcAotUnit804 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:508
//
// ASCENT_GUIDANCE.agc:509
//		TC	PHASCHNG
// slot 14606
    if slot <> 14606 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[804] to agcAotUnit804@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:510
//		OCT 	07024
// slot 14607
    14607, 7208,
// ASCENT_GUIDANCE.agc:511
//		OCT	17000
// slot 14608
    14608, 15360,
// ASCENT_GUIDANCE.agc:512
//		EBANK=	TGO
// ASCENT_GUIDANCE.agc:513
//		2CADR	CUTOFF
// slot 14609 14610
    14609, 2600, 14610, 24686
)).

// bank 14, slots 14611-14612
function agcAotUnit805 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14611 {
// ASCENT_GUIDANCE.agc:514
//
// ASCENT_GUIDANCE.agc:515
//		TCF	TASKOVER
// slot 14611
        if slot <> 14611 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:516
//
// ASCENT_GUIDANCE.agc:517
//CUTOFF		TC	UPFLAG		# SET FLRCS FLAG.
// slot 14612
        if slot <> 14612 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[805] to agcAotUnit805@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:518
//		ADRES	FLRCS
// slot 14613
    14613, 280
)).

// bank 14, slots 14614-14615
function agcAotUnit806 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14614 {
// ASCENT_GUIDANCE.agc:519
//
// ASCENT_GUIDANCE.agc:520
// -5		CAF	V16N63
// slot 14614
        if slot <> 14614 or instruction <> 13605 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1317), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:521
// 		TC	BANKCALL
// slot 14615
        if slot <> 14615 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[806] to agcAotUnit806@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:522
//		CADR	GOFLASH
// slot 14616
    14616, 17020
)).

// bank 14, slots 14617-14620
function agcAotUnit807 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14618 {
        if slot <= 14617 {
// ASCENT_GUIDANCE.agc:523
//		TCF	+3
// slot 14617
            if slot <> 14617 or instruction <> 5404 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5404, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ASCENT_GUIDANCE.agc:524
//		TCF	CUTOFF1
// slot 14618
            if slot <> 14618 or instruction <> 5406 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5406, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 14619 {
// ASCENT_GUIDANCE.agc:525
//		TCF	-5
// slot 14619
            if slot <> 14619 or instruction <> 5398 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5398, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ASCENT_GUIDANCE.agc:526
//
// ASCENT_GUIDANCE.agc:527
// +3		TC	POSTJUMP
// slot 14620
            if slot <> 14620 or instruction <> 2461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[807] to agcAotUnit807@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:528
// 		CADR	TERMASC
// slot 14621
    14621, 50190
)).

// bank 14, slots 14622-14623
function agcAotUnit808 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 14622 {
// ASCENT_GUIDANCE.agc:529
//
// ASCENT_GUIDANCE.agc:530
//CUTOFF1		INHINT
// slot 14622
        if slot <> 14622 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:531
//		TC	IBNKCALL	# ZERO ATTITUDE ERRORS BEFORE REDUCINT DB.
// slot 14623
        if slot <> 14623 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[808] to agcAotUnit808@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:532
//		CADR	ZATTEROR
// slot 14624
    14624, 32982
)).

// bank 14, slots 14625-14625
function agcAotUnit809 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:533
//		TC	IBNKCALL
// slot 14625
    if slot <> 14625 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[809] to agcAotUnit809@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:534
//		CADR	SETMINDB
// slot 14626
    14626, 32960
)).

// bank 14, slots 14627-14627
function agcAotUnit810 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:535
//		TC	POSTJUMP
// slot 14627
    if slot <> 14627 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[810] to agcAotUnit810@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:536
//		CADR	CUTOFF2
// slot 14628
    14628, 50174,
// ASCENT_GUIDANCE.agc:537
//# Page 854
// ASCENT_GUIDANCE.agc:538
//
// ASCENT_GUIDANCE.agc:539
//V16N63		VN	1663
// slot 14629
    14629, 4222
)).

// bank 30, slots 27135-27135
function agcAotUnit1708 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:540
//		BANK	30
// ASCENT_GUIDANCE.agc:541
//		SETLOC	ASENT5
// ASCENT_GUIDANCE.agc:542
//		BANK
// ASCENT_GUIDANCE.agc:543
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:544
//
// ASCENT_GUIDANCE.agc:545
//CUTOFF2		TC	PHASCHNG
// slot 27135
    if slot <> 27135 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1708] to agcAotUnit1708@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:546
//		OCT	04024
// slot 27136
    27136, 4136
)).

// bank 30, slots 27137-27138
function agcAotUnit1709 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27137 {
// ASCENT_GUIDANCE.agc:547
//
// ASCENT_GUIDANCE.agc:548
//		CAF	V16N85C
// slot 27137
        if slot <> 27137 or instruction <> 13839 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1551), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:549
//		TC	BANKCALL
// slot 27138
        if slot <> 27138 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1709] to agcAotUnit1709@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:550
//		CADR	GOFLASH
// slot 27139
    27139, 17020
)).

// bank 30, slots 27140-27143
function agcAotUnit1710 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27141 {
        if slot <= 27140 {
// ASCENT_GUIDANCE.agc:551
//		TCF	TERMASC
// slot 27140
            if slot <> 27140 or instruction <> 5639 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5639, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ASCENT_GUIDANCE.agc:552
//		TCF	+2		# PROCEED
// slot 27141
            if slot <> 27141 or instruction <> 5639 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5639, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27142 {
// ASCENT_GUIDANCE.agc:553
//		TCF	CUTOFF2
// slot 27142
            if slot <> 27142 or instruction <> 5631 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5631, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ASCENT_GUIDANCE.agc:554
//
// ASCENT_GUIDANCE.agc:555
//TERMASC		TC	PHASCHNG
// slot 27143
            if slot <> 27143 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1710] to agcAotUnit1710@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:556
//		OCT	04024
// slot 27144
    27144, 4136
)).

// bank 30, slots 27145-27146
function agcAotUnit1711 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27145 {
// ASCENT_GUIDANCE.agc:557
//
// ASCENT_GUIDANCE.agc:558
//		INHINT			# RESTORE DEADBAND DESIRED BY BOB.
// slot 27145
        if slot <> 27145 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// ASCENT_GUIDANCE.agc:559
//		TC	IBNKCALL
// slot 27146
        if slot <> 27146 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1711] to agcAotUnit1711@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:560
//		CADR	RESTORDB
// slot 27147
    27147, 32934
)).

// bank 30, slots 27148-27148
function agcAotUnit1712 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:561
//		TC	DOWNFLAG	# DISALLOW ABORTS AT THIS TIME.
// slot 27148
    if slot <> 27148 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1712] to agcAotUnit1712@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:562
//		ADRES	LETABORT
// slot 27149
    27149, 282
)).

// bank 30, slots 27150-27150
function agcAotUnit1713 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:563
//		TCF	GOTOPOOH
// slot 27150
    if slot <> 27150 or instruction <> 7169 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 7169, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1713] to agcAotUnit1713@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:564
//
// ASCENT_GUIDANCE.agc:565
//V16N85C		VN	1685
// slot 27151
    27151, 4266,
// ASCENT_GUIDANCE.agc:566
//
// ASCENT_GUIDANCE.agc:567
//		BANK 27
// ASCENT_GUIDANCE.agc:568
//		SETLOC	ASENT1
// ASCENT_GUIDANCE.agc:569
//		BANK
// ASCENT_GUIDANCE.agc:570
//		COUNT* $$/ASENT
// ASCENT_GUIDANCE.agc:571
//
// ASCENT_GUIDANCE.agc:572
//YCOMP		VLOAD	DOT
// slot 26314
    26314, 41466,
// ASCENT_GUIDANCE.agc:573
//			UNIT/R/
// slot 26315
    26315, 3774,
// ASCENT_GUIDANCE.agc:574
//			QAXIS
// slot 26316
    26316, 4000,
// ASCENT_GUIDANCE.agc:575
//		SL2	DMP
// slot 26317
    26317, 34196,
// ASCENT_GUIDANCE.agc:576
//			RCO
// slot 26318
    26318, 3890,
// ASCENT_GUIDANCE.agc:577
//		STORE	Y
// slot 26319
    26319, 2490,
// ASCENT_GUIDANCE.agc:578
//		RVQ
// slot 26320
    26320, 65308,
// ASCENT_GUIDANCE.agc:579
//
// ASCENT_GUIDANCE.agc:580
//		BANK	30
// ASCENT_GUIDANCE.agc:581
//		SETLOC	ASENT
// ASCENT_GUIDANCE.agc:582
//		BANK
// ASCENT_GUIDANCE.agc:583
//# Page 855
// ASCENT_GUIDANCE.agc:584
//100CS		EQUALS	2SEC(18)
// ASCENT_GUIDANCE.agc:585
//T2A		EQUALS	2SEC(17)
// ASCENT_GUIDANCE.agc:586
//4SEC(17)	2DEC	400 B-17
// slot 27152 27153
    27152, 100, 27153, 0,
// ASCENT_GUIDANCE.agc:587
//2SEC(17)	2DEC	200 B-17
// slot 27154 27155
    27154, 50, 27155, 0,
// ASCENT_GUIDANCE.agc:588
//T3		2DEC	1000 B-17
// slot 27156 27157
    27156, 250, 27157, 0,
// ASCENT_GUIDANCE.agc:589
//6SEC(18)	2DEC	600 B-18
// slot 27158 27159
    27158, 74, 27159, 16384,
// ASCENT_GUIDANCE.agc:590
//BIT4H		OCT	10
// slot 27160
    27160, 16,
// ASCENT_GUIDANCE.agc:591
//2SEC(9)		2DEC	200 B-9
// slot 27161 27162
    27161, 12800, 27162, 0,
// ASCENT_GUIDANCE.agc:592
//V06N63*		VN	0663
// slot 27163
    27163, 1662,
// ASCENT_GUIDANCE.agc:593
//V06N76		VN	0676
// slot 27164
    27164, 1688,
// ASCENT_GUIDANCE.agc:594
//V06N33A		VN	0633
// slot 27165
    27165, 1602,
// ASCENT_GUIDANCE.agc:595
//
// ASCENT_GUIDANCE.agc:596
//		BANK	33
// ASCENT_GUIDANCE.agc:597
//		SETLOC	ASENT6
// ASCENT_GUIDANCE.agc:598
//		BANK
// ASCENT_GUIDANCE.agc:599
//		COUNT*	$$/ASENT
// ASCENT_GUIDANCE.agc:600
//
// ASCENT_GUIDANCE.agc:601
//KT1		2DEC	0.5000
// slot 29824 29825
    29824, 16384, 29825, 0,
// ASCENT_GUIDANCE.agc:602
//PRLIMIT		2DEC	-.0639		# (B/TBUP)MIN=-.1FT.SEC(-3)
// slot 29826 29827
    29826, 63442, 29827, 34810,
// ASCENT_GUIDANCE.agc:603
//MINABDV		2DEC	.0356 B-5	# 10 PERCENT BIGGER THAN GRAVITY
// slot 29828 29829
    29828, 36, 29829, 7444,
// ASCENT_GUIDANCE.agc:604
//1/DV0		=	MASS1
// ASCENT_GUIDANCE.agc:605
//
// ASCENT_GUIDANCE.agc:606
//# Page 856
// ASCENT_GUIDANCE.agc:607
//# THE LOGARITHM SUBROUTINE
// ASCENT_GUIDANCE.agc:608
//
// ASCENT_GUIDANCE.agc:609
//		BANK	24
// ASCENT_GUIDANCE.agc:610
//		SETLOC	FLOGSUB
// ASCENT_GUIDANCE.agc:611
//		BANK
// ASCENT_GUIDANCE.agc:612
//
// ASCENT_GUIDANCE.agc:613
//# INPUT ..... X IN MPAC
// ASCENT_GUIDANCE.agc:614
//# OUTPUT ..... -LOG(X) IN MPAC
// ASCENT_GUIDANCE.agc:615
//
// ASCENT_GUIDANCE.agc:616
//LOGSUB		NORM	BDSU
// slot 27166
    27166, 37250,
// ASCENT_GUIDANCE.agc:617
//			MPAC +6
// slot 27167
    27167, 230,
// ASCENT_GUIDANCE.agc:618
//			NEARONE
// slot 27168
    27168, 16370,
// ASCENT_GUIDANCE.agc:619
//		EXIT
// slot 27169
    27169, 65532
)).

// bank 30, slots 27170-27170
function agcAotUnit1714 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ASCENT_GUIDANCE.agc:620
//		TC	POLY
// slot 27170
    if slot <> 27170 or instruction <> 3730 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3730, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1714] to agcAotUnit1714@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:621
//		DEC	6
// slot 27171
    27171, 12,
// ASCENT_GUIDANCE.agc:622
//		2DEC	.0000000060
// slot 27172 27173
    27172, 0, 27173, 4,
// ASCENT_GUIDANCE.agc:623
//		2DEC	-.0312514377
// slot 27174 27175
    27174, 64510, 27175, 64762,
// ASCENT_GUIDANCE.agc:624
//		2DEC	-.0155686771
// slot 27176 27177
    27176, 65024, 27177, 63004,
// ASCENT_GUIDANCE.agc:625
//		2DEC	-.0112502068
// slot 27178 27179
    27178, 65166, 27179, 54938,
// ASCENT_GUIDANCE.agc:626
//		2DEC	-.0018545108
// slot 27180 27181
    27180, 65474, 27181, 52942,
// ASCENT_GUIDANCE.agc:627
//		2DEC	-.0286607906
// slot 27182 27183
    27182, 64596, 27183, 46582,
// ASCENT_GUIDANCE.agc:628
//		2DEC	.0385598563
// slot 27184 27185
    27184, 1262, 27185, 25058,
// ASCENT_GUIDANCE.agc:629
//		2DEC	-.0419361902
// slot 27186 27187
    27186, 64160, 27187, 62830
)).

// bank 30, slots 27188-27200
function agcAotUnit1715 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27193 {
        if slot <= 27190 {
            if slot <= 27188 {
// ASCENT_GUIDANCE.agc:630
//
// ASCENT_GUIDANCE.agc:631
//		CAF	ZERO
// slot 27188
                if slot <> 27188 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27189 {
// ASCENT_GUIDANCE.agc:632
//		TS	MPAC +2
// slot 27189
                    if slot <> 27189 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:633
//		EXTEND
// slot 27190
                    if slot <> 27190 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27191 {
// ASCENT_GUIDANCE.agc:634
//		DCA	CLOG2/32
// slot 27191
                if slot <> 27191 or instruction <> 13891 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1603, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27192 {
// ASCENT_GUIDANCE.agc:635
//		DXCH	MPAC
// slot 27192
                    if slot <> 27192 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:636
//		DXCH	BUF +1
// slot 27193
                    if slot <> 27193 or instruction <> 21594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 90, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27196 {
            if slot <= 27194 {
// ASCENT_GUIDANCE.agc:637
//		CA	MPAC +6
// slot 27194
                if slot <> 27194 or instruction <> 12402 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 114).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27195 {
// ASCENT_GUIDANCE.agc:638
//		TC	SHORTMP
// slot 27195
                    if slot <> 27195 or instruction <> 3783 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3783, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:639
//		DXCH	MPAC +1
// slot 27196
                    if slot <> 27196 or instruction <> 21614 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27198 {
                if slot <= 27197 {
// ASCENT_GUIDANCE.agc:640
//		DXCH	MPAC
// slot 27197
                    if slot <> 27197 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:641
//		DXCH	BUF +1
// slot 27198
                    if slot <> 27198 or instruction <> 21594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 90, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27199 {
// ASCENT_GUIDANCE.agc:642
//		DAS	MPAC
// slot 27199
                    if slot <> 27199 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// ASCENT_GUIDANCE.agc:643
//		TC	INTPRET
// slot 27200
                    if slot <> 27200 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1715] to agcAotUnit1715@.

agcAotInstallSourceRope(list(
// ASCENT_GUIDANCE.agc:644
//		DCOMP	RVQ
// slot 27201
    27201, 36476,
// ASCENT_GUIDANCE.agc:645
//
// ASCENT_GUIDANCE.agc:646
//CLOG2/32	2DEC	.0216608494
// slot 27202 27203
    27202, 708, 27203, 29208
)).

// no code for the lines below
// ASCENT_GUIDANCE.agc:647
//
