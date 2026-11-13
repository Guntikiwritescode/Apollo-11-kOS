// TPI_SEARCH.agc
agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:1
//# Copyright:	Public domain.
// TPI_SEARCH.agc:2
//# Filename:	TPI_SEARCH.agc
// TPI_SEARCH.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// TPI_SEARCH.agc:4
//#		It is part of the source code for the Command Module's (CM)
// TPI_SEARCH.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TPI_SEARCH.agc:6
//# Assembler:	yaYUL
// TPI_SEARCH.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// TPI_SEARCH.agc:8
//# Website:	www.ibiblio.org/apollo.
// TPI_SEARCH.agc:9
//# Pages:	551-561
// TPI_SEARCH.agc:10
//# Mod history:	2009-05-15 RSB	Adapted from the Colossus249/ file of the
// TPI_SEARCH.agc:11
//#				same name, using Comanche055 page images.
// TPI_SEARCH.agc:12
//#		2009-05-20 RSB	Corrections:  On p. 551, "SETLOC P17S" -> P17S1.
// TPI_SEARCH.agc:13
//#
// TPI_SEARCH.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// TPI_SEARCH.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// TPI_SEARCH.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// TPI_SEARCH.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// TPI_SEARCH.agc:18
//# consequent reduction in image quality as well) are available online at
// TPI_SEARCH.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// TPI_SEARCH.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// TPI_SEARCH.agc:21
//# (much) higher-quality images which Paul actually created.
// TPI_SEARCH.agc:22
//#
// TPI_SEARCH.agc:23
//# Notations on the hardcopy document read, in part:
// TPI_SEARCH.agc:24
//#
// TPI_SEARCH.agc:25
//#	Assemble revision 055 of AGC program Comanche by NASA
// TPI_SEARCH.agc:26
//#	2021113-051.  10:28 APR. 1, 1969
// TPI_SEARCH.agc:27
//#
// TPI_SEARCH.agc:28
//#	This AGC program shall also be referred to as
// TPI_SEARCH.agc:29
//#			Colossus 2A
// TPI_SEARCH.agc:30
//
// TPI_SEARCH.agc:31
//# Page 551
// TPI_SEARCH.agc:32
//# TPI SEARCH
// TPI_SEARCH.agc:33
//
// TPI_SEARCH.agc:34
//# PROGRAM DESCRIPTION S17.1 AND S17.2
// TPI_SEARCH.agc:35
//
// TPI_SEARCH.agc:36
//# FUNCTIONAL DESCRIPTION
// TPI_SEARCH.agc:37
//
// TPI_SEARCH.agc:38
//# 	THE TPI SEARCH ROUTINE DETERMINES THE MINIMUM TOTAL VELOCITY TRANSFER TRAJECTORY FROM A GIVEN TPI
// TPI_SEARCH.agc:39
//# MANEUVER TIME WITHIN THE CONSTRAINT OF A SAFE PERICENTER.  THIS VELOCITY IS THE SUM OF THE IMPULSIVE VELOCITIES
// TPI_SEARCH.agc:40
//# FOR THE TPI AND TPF MANEUVERS.
// TPI_SEARCH.agc:41
//# 	THE S17.1 ROUTINE EXTRAPOLATES THE STATE VECTORS OF BOTH VEHICLES TO THE TPI TIME AND COMPUTES THE
// TPI_SEARCH.agc:42
//# RELATIVE PHASE ANGLE BETWEEN THE VEHICLES, THE ALTITUDE DIFFERENCE(I.E. THE MAGNITUDE DIFFERENCE OF THE
// TPI_SEARCH.agc:43
//# POSITION VECTORS) AND SELECTS A SEARCH SECTOR BASED ON THE SIGN OF THE ALTITUDE DIFFERENCE.
// TPI_SEARCH.agc:44
//# 	THE S17.2 ROUTINE FURTHER DEFINES THE SEARCH SECTOR BY COMPUTING ANGULAR LIMITS AND USES THE TIME THETA
// TPI_SEARCH.agc:45
//# SUBROUTINE TO COMPUTE THE SEARCH START AND END TIMES.  THE SEARCH IS THEN MADE IN AN ITERATIVE LOOP USING THE
// TPI_SEARCH.agc:46
//# LAMBERT SUBROUTINE TO COMPUTE THE VELOCITIES REQUIRED AT TPI TIME AND AT TPF TIME.  EXIT FROM THE SEARCH LOOP
// TPI_SEARCH.agc:47
//# IS MADE WHEN SOLUTION CRITERIA ARE MET (NORMAL EXIT) OR AS SOON AS IT IS EVIDENT THAT NO SOLUTION EXISTS IN
// TPI_SEARCH.agc:48
//# THE SECTOR SEARCHED.
// TPI_SEARCH.agc:49
//
// TPI_SEARCH.agc:50
//# CALLING SEQUENCE
// TPI_SEARCH.agc:51
//
// TPI_SEARCH.agc:52
//# 	BOTH ROUTINES ARE CALLED IN INTERPRETIVE CODE AND RETURN VIA QPRET.  S17.1 HAS ONLY A NORMAL EXIT.
// TPI_SEARCH.agc:53
//# S17.2 RETURNS VIA QPRET FOR NORMAL EXIT AND TO ALARUMS FOR ERROR EXIT.
// TPI_SEARCH.agc:54
//# SUBROUTINES CALLED
// TPI_SEARCH.agc:55
//#
// TPI_SEARCH.agc:56
//#	CSMCONIC
// TPI_SEARCH.agc:57
//#	LEMCONIC
// TPI_SEARCH.agc:58
//#	TIMETHET
// TPI_SEARCH.agc:59
//#	INITVEL
// TPI_SEARCH.agc:60
//
// TPI_SEARCH.agc:61
//		BANK	36
// TPI_SEARCH.agc:62
//		SETLOC	P17S1
// TPI_SEARCH.agc:63
//		BANK
// TPI_SEARCH.agc:64
//
// TPI_SEARCH.agc:65
//		COUNT	36/TPI
// TPI_SEARCH.agc:66
//
// TPI_SEARCH.agc:67
//		EBANK=	RACT3
// TPI_SEARCH.agc:68
//
// TPI_SEARCH.agc:69
//# 	**** TEMPORARY ****
// TPI_SEARCH.agc:70
//
// TPI_SEARCH.agc:71
//HPE		2DEC	157420.0 B-29		# EARTH'S MIN. PERICENTER ALTITUDE 85 N.M.
// slot 32339 32340
    32339, 8, 32340, 26348,
// TPI_SEARCH.agc:72
//
// TPI_SEARCH.agc:73
//HPL		2DEC	10668.0213 B-29		# MOON:S MIN. PERICENTER ALTITUDE 35000FT
// slot 32341 32342
    32341, 0, 32342, 10668,
// TPI_SEARCH.agc:74
//
// TPI_SEARCH.agc:75
//CDSEC		2DEC	40000
// slot 32343 32344
    32343, 4, 32344, 14464,
// TPI_SEARCH.agc:76
//
// TPI_SEARCH.agc:77
//CLSEC		2DEC	15000
// slot 32345 32346
    32345, 0, 32346, 30000,
// TPI_SEARCH.agc:78
//
// TPI_SEARCH.agc:79
//PIINVERS	2DEC	.3183098862
// slot 32347 32348
    32347, 10430, 32348, 6198,
// TPI_SEARCH.agc:80
//
// TPI_SEARCH.agc:81
//SEC1THET	2DEC	.1944444444
// slot 32349 32350
    32349, 6370, 32350, 25486,
// TPI_SEARCH.agc:82
//
// TPI_SEARCH.agc:83
//# Page 552
// TPI_SEARCH.agc:84
//SEC2THET	2DEC	.9166666667
// slot 32351 32352
    32351, 30036, 32352, 21846,
// TPI_SEARCH.agc:85
//
// TPI_SEARCH.agc:86
//MANYFEET	2DEC	-1.0 B-2
// slot 32353 32354
    32353, 57342, 32354, 65534,
// TPI_SEARCH.agc:87
//
// TPI_SEARCH.agc:88
//LIMVEL		2DEC	.6096 E-2 B-7		# 2FPS
// slot 32355 32356
    32355, 0, 32356, 25568,
// TPI_SEARCH.agc:89
//
// TPI_SEARCH.agc:90
//DFTMOON		2DEC	.1524 E3 B-29		# 500 FEET
// slot 32357 32358
    32357, 0, 32358, 152,
// TPI_SEARCH.agc:91
//
// TPI_SEARCH.agc:92
//DP-.002		2DEC	0.002
// slot 32359 32360
    32359, 64, 32360, 25166,
// TPI_SEARCH.agc:93
//
// TPI_SEARCH.agc:94
//		SETLOC	P17S
// TPI_SEARCH.agc:95
//		BANK
// TPI_SEARCH.agc:96
//S17.1		STQ	DLOAD
// slot 32778
    32778, 58656,
// TPI_SEARCH.agc:97
//			NORMEX
// slot 32779
    32779, 1472,
// TPI_SEARCH.agc:98
//			TTPI
// slot 32780
    32780, 3942,
// TPI_SEARCH.agc:99
//		STCALL	TDEC1			# ADVANCE PASSIVE VEHICLE TO TPI
// slot 32781
    32781, 28738,
// TPI_SEARCH.agc:100
//			LEMCONIC
// slot 32782
    32782, 23724,
// TPI_SEARCH.agc:101
//		CALL
// slot 32783
    32783, 65320,
// TPI_SEARCH.agc:102
//			LEMSTORE
// slot 32784
    32784, 38198,
// TPI_SEARCH.agc:103
//		DLOAD
// slot 32785
    32785, 65482,
// TPI_SEARCH.agc:104
//			TTPI
// slot 32786
    32786, 3942,
// TPI_SEARCH.agc:105
//		STCALL	TDEC1			# ADVANCE ACTIVE VEHICLE TO TPI
// slot 32787
    32787, 28738,
// TPI_SEARCH.agc:106
//			CSMCONIC
// slot 32788
    32788, 23704,
// TPI_SEARCH.agc:107
//		CALL
// slot 32789
    32789, 65320,
// TPI_SEARCH.agc:108
//			CSMSTORE
// slot 32790
    32790, 38214,
// TPI_SEARCH.agc:109
//		VLOAD
// slot 32791
    32791, 65530,
// TPI_SEARCH.agc:110
//			RACT3
// slot 32792
    32792, 3776,
// TPI_SEARCH.agc:111
//		ABVAL	PDVL			# /RA/ 0D			PL 2D
// slot 32793
    32793, 52556,
// TPI_SEARCH.agc:112
//			RPASS3
// slot 32794
    32794, 3800,
// TPI_SEARCH.agc:113
//		UNIT	PDDL			# UNIT RP 0D			PL 6D
// slot 32795
    32795, 54620,
// TPI_SEARCH.agc:114
//		BDSU	SET
// slot 32796
    32796, 35874,
// TPI_SEARCH.agc:115
//			36D			# /RP/ -/RA/
// slot 32797
    32797, 74,
// TPI_SEARCH.agc:116
//			KFLAG			# OFF = +
// slot 32798
    32798, 124,
// TPI_SEARCH.agc:117
//		BMN	CLEAR
// slot 32799
    32799, 35904,
// TPI_SEARCH.agc:118
//			+2
// slot 32800
    32800, 61508,
// TPI_SEARCH.agc:119
//			KFLAG			# ON = -
// slot 32801
    32801, 380,
// TPI_SEARCH.agc:120
//		STOVL	DELHITE
// slot 32802
    32802, 24536,
// TPI_SEARCH.agc:121
//			0D
// slot 32803
    32803, 2,
// TPI_SEARCH.agc:122
//		VXV	UNIT
// slot 32804
    32804, 44602,
// TPI_SEARCH.agc:123
//			VPASS3
// slot 32805
    32805, 3812,
// TPI_SEARCH.agc:124
//		STOVL	E2			# ALMOST IT SAVE FOR 17.2
// slot 32806
    32806, 24396,
// TPI_SEARCH.agc:125
//			RACT3
// slot 32807
    32807, 3776,
// TPI_SEARCH.agc:126
//		PUSH	VPROJ
// slot 32808
    32808, 39180,
// TPI_SEARCH.agc:127
//			E2
// slot 32809
    32809, 3916,
// TPI_SEARCH.agc:128
//		VSL2	BVSU			# RPA
// slot 32810
    32810, 42452
)).

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:129
//		UNIT	DOT
// slot 32811
    32811, 41308,
// TPI_SEARCH.agc:130
//			0D
// slot 32812
    32812, 2,
// TPI_SEARCH.agc:131
//		SL1 	ACOS
// slot 32813
    32813, 54996,
// TPI_SEARCH.agc:132
//		PDVL
// slot 32814
    32814, 65434,
// TPI_SEARCH.agc:133
//		VXV	DOT
// slot 32815
    32815, 41274,
// TPI_SEARCH.agc:134
//# Page 553
// TPI_SEARCH.agc:135
//			RACT3
// slot 32816
    32816, 3776,
// TPI_SEARCH.agc:136
//			E2
// slot 32817
    32817, 3916,
// TPI_SEARCH.agc:137
//		PDDL	SIGN
// slot 32818
    32818, 62890,
// TPI_SEARCH.agc:138
//		STADR
// slot 32819
    32819, 65324,
// TPI_SEARCH.agc:139
//		STODL	THETZERO		# CENTRAL ANGLE
// slot 32820
    32820, 50400,
// TPI_SEARCH.agc:140
//			X1
// slot 32821
    32821, 78,
// TPI_SEARCH.agc:141
//		STCALL	XRS			# SAVE INDICES FOR FURTHER USE
// slot 32822
    32822, 32716,
// TPI_SEARCH.agc:142
//			NORMEX			#   += ACTIVE AHEAD  -= ACTIVE BEHIND
// slot 32823
    32823, 1472,
// TPI_SEARCH.agc:143
//S17.2		STQ	VLOAD			# COMPUTE SEARCH SECTOR LIMITS
// slot 32824
    32824, 64800,
// TPI_SEARCH.agc:144
//			QTEMP
// slot 32825
    32825, 3934,
// TPI_SEARCH.agc:145
//			RACT3
// slot 32826
    32826, 3776,
// TPI_SEARCH.agc:146
//		UNIT	DOT
// slot 32827
    32827, 41308,
// TPI_SEARCH.agc:147
//			E2
// slot 32828
    32828, 3916,
// TPI_SEARCH.agc:148
//		ABS	SQRT
// slot 32829
    32829, 63052,
// TPI_SEARCH.agc:149
//		SL1	DAD
// slot 32830
    32830, 36308,
// TPI_SEARCH.agc:150
//			DP-.002			# ADD .002 RADIANS TO IT
// slot 32831
    32831, 27856,
// TPI_SEARCH.agc:151
//		BON	DCOMP			# GIVES CORRECT SINE, COSINE MUST BE
// slot 32832
    32832, 48664,
// TPI_SEARCH.agc:152
//			KFLAG			# COMP. ADD .5 FOR ANGLE
// slot 32833
    32833, 412,
// TPI_SEARCH.agc:153
//			+1
// slot 32834
    32834, 61574,
// TPI_SEARCH.agc:154
//# PHI(0)=180-(-(THETAZERO +K5IT)), PHI(I)=180-(-THETAZERO+K2IT))
// TPI_SEARCH.agc:155
//# SIN(180-ALPHA)=SIN(ALPHA) ETC
// TPI_SEARCH.agc:156
//		DMP	SETPD
// slot 32835
    32835, 33034,
// TPI_SEARCH.agc:157
//			PIINVERS		# REVOLUTIONARY HERES TWO IT
// slot 32836
    32836, 27832,
// TPI_SEARCH.agc:158
//			0D
// slot 32837
    32837, 2,
// TPI_SEARCH.agc:159
//		PUSH	DSU
// slot 32838
    32838, 38156,
// TPI_SEARCH.agc:160
//			THETZERO
// slot 32839
    32839, 2846,
// TPI_SEARCH.agc:161
//		STORE	IT			# PHI(I) , -(THETZERO + K2IT)
// slot 32840
    32840, 2834,
// TPI_SEARCH.agc:162
//		PDDL	PUSH
// slot 32841
    32841, 34474,
// TPI_SEARCH.agc:163
//		SR1	DAD
// slot 32842
    32842, 36292,
// TPI_SEARCH.agc:164
//		DAD	PUSH			# PHI(0) , -(THETZERO + K5IT)
// slot 32843
    32843, 34330,
// TPI_SEARCH.agc:165
//		SIN	SET
// slot 32844
    32844, 36060,
// TPI_SEARCH.agc:166
//			RVSW
// slot 32845
    32845, 3692,
// TPI_SEARCH.agc:167
//		STODL	SNTH
// slot 32846
    32846, 15284,
// TPI_SEARCH.agc:168
//		COS	BMN
// slot 32847
    32847, 41164,
// TPI_SEARCH.agc:169
//			+2
// slot 32848
    32848, 61604,
// TPI_SEARCH.agc:170
//		DCOMP
// slot 32849
    32849, 65404,
// TPI_SEARCH.agc:171
//		STODL	CSTH
// slot 32850
    32850, 15288,
// TPI_SEARCH.agc:172
//			XRS
// slot 32851
    32851, 4044,
// TPI_SEARCH.agc:173
//		STOVL	X1
// slot 32852
    32852, 20558,
// TPI_SEARCH.agc:174
//			RPASS3
// slot 32853
    32853, 3800,
// TPI_SEARCH.agc:175
//		VSR*
// slot 32854
    32854, 65374,
// TPI_SEARCH.agc:176
//			0,2
// slot 32855
    32855, 48380,
// TPI_SEARCH.agc:177
//		STOVL	RVEC
// slot 32856
    32856, 23390,
// TPI_SEARCH.agc:178
//			VPASS3
// slot 32857
    32857, 3812,
// TPI_SEARCH.agc:179
//		VSR*
// slot 32858
    32858, 65374,
// TPI_SEARCH.agc:180
//			0,2
// slot 32859
    32859, 48380,
// TPI_SEARCH.agc:181
//		STCALL	VVEC
// slot 32860
    32860, 31692,
// TPI_SEARCH.agc:182
//			TIMETHET
// slot 32861
    32861, 21448,
// TPI_SEARCH.agc:183
//		DLOAD				# SAVE START TIME AND GET END TIME
// slot 32862
    32862, 65482,
// TPI_SEARCH.agc:184
//			T
// slot 32863
    32863, 62,
// TPI_SEARCH.agc:185
//# Page 554
// TPI_SEARCH.agc:186
//		STORE	TF
// slot 32864
    32864, 4052,
// TPI_SEARCH.agc:187
//		STODL	TFO
// slot 32865
    32865, 15150,
// TPI_SEARCH.agc:188
//			IT
// slot 32866
    32866, 2834,
// TPI_SEARCH.agc:189
//		PUSH	SIN
// slot 32867
    32867, 60940,
// TPI_SEARCH.agc:190
//		STODL	SNTH
// slot 32868
    32868, 15284,
// TPI_SEARCH.agc:191
//		COS	BMN
// slot 32869
    32869, 41164,
// TPI_SEARCH.agc:192
//			+2
// slot 32870
    32870, 61648,
// TPI_SEARCH.agc:193
//		DCOMP
// slot 32871
    32871, 65404,
// TPI_SEARCH.agc:194
//		STORE	CSTH
// slot 32872
    32872, 3000,
// TPI_SEARCH.agc:195
//		LXA,1	CALL
// slot 32873
    32873, 38096,
// TPI_SEARCH.agc:196
//			XRS
// slot 32874
    32874, 4042,
// TPI_SEARCH.agc:197
//			TIMETHET
// slot 32875
    32875, 21448,
// TPI_SEARCH.agc:198
//# INITIALIZE LOOP
// TPI_SEARCH.agc:199
//		DLOAD	CLEAR
// slot 32876
    32876, 36042,
// TPI_SEARCH.agc:200
//			T
// slot 32877
    32877, 62,
// TPI_SEARCH.agc:201
//			ITSWICH
// slot 32878
    32878, 3938,
// TPI_SEARCH.agc:202
//		STODL	TFI			# SAVE TIME FOR LOOP TEST
// slot 32879
    32879, 15138,
// TPI_SEARCH.agc:203
//			DPPOSMAX
// slot 32880
    32880, 13766,
// TPI_SEARCH.agc:204
//		STODL	DELVEE
// slot 32881
    32881, 15142,
// TPI_SEARCH.agc:205
//			MANYFEET
// slot 32882
    32882, 27844,
// TPI_SEARCH.agc:206
//		STODL	HP
// slot 32883
    32883, 15146,
// TPI_SEARCH.agc:207
//			SEC1THET		# 70 DEGREES
// slot 32884
    32884, 27836,
// TPI_SEARCH.agc:208
//		BON	DLOAD
// slot 32885
    32885, 58648,
// TPI_SEARCH.agc:209
//			KFLAG
// slot 32886
    32886, 412,
// TPI_SEARCH.agc:210
//			+2
// slot 32887
    32887, 61682,
// TPI_SEARCH.agc:211
//			SEC2THET		# 330 DEGREES
// slot 32888
    32888, 27840,
// TPI_SEARCH.agc:212
//		STCALL	THETL
// slot 32889
    32889, 32720,
// TPI_SEARCH.agc:213
//			CONCAUL
// slot 32890
    32890, 61720,
// TPI_SEARCH.agc:214
//BIS		DLOAD	SR1
// slot 32891
    32891, 58058,
// TPI_SEARCH.agc:215
//			CSTH
// slot 32892
    32892, 3000,
// TPI_SEARCH.agc:216
//		STODL	COSTH
// slot 32893
    32893, 12322,
// TPI_SEARCH.agc:217
//			SNTH
// slot 32894
    32894, 2996,
// TPI_SEARCH.agc:218
//		SR1
// slot 32895
    32895, 65476,
// TPI_SEARCH.agc:219
//		STCALL	SINTH			# GET 4 QUADRANT THETA
// slot 32896
    32896, 28710,
// TPI_SEARCH.agc:220
//			ARCTRIG
// slot 32897
    32897, 40284,
// TPI_SEARCH.agc:221
//		BPL	DAD
// slot 32898
    32898, 36168,
// TPI_SEARCH.agc:222
//			+2
// slot 32899
    32899, 61706,
// TPI_SEARCH.agc:223
//			DPPOSMAX		# PUT THETA BETWEEN 0,1
// slot 32900
    32900, 13766,
// TPI_SEARCH.agc:224
//		BDSU	PDDL
// slot 32901
    32901, 54562,
// TPI_SEARCH.agc:225
//			THETL
// slot 32902
    32902, 4048,
// TPI_SEARCH.agc:226
//			TF
// slot 32903
    32903, 4052,
// TPI_SEARCH.agc:227
//		DSU	SIGN			# FAST TIMES
// slot 32904
    32904, 62762,
// TPI_SEARCH.agc:228
//			TFI
// slot 32905
    32905, 2850,
// TPI_SEARCH.agc:229
//		BMN
// slot 32906
    32906, 65344,
// TPI_SEARCH.agc:230
//			RNGETEST		# TIME MUST HAVE A STOP
// slot 32907
    32907, 61980,
// TPI_SEARCH.agc:231
//# ADVANCE PASSIVE FOR TARGET VECTOR
// TPI_SEARCH.agc:232
//CONCAUL		DLOAD
// slot 32908
    32908, 65482,
// TPI_SEARCH.agc:233
//			TTPI
// slot 32909
    32909, 3942,
// TPI_SEARCH.agc:234
//		DAD	BON
// slot 32910
    32910, 35866,
// TPI_SEARCH.agc:235
//			TF
// slot 32911
    32911, 4052,
// TPI_SEARCH.agc:236
//# Page 555
// TPI_SEARCH.agc:237
//			AVFLAG
// slot 32912
    32912, 1428,
// TPI_SEARCH.agc:238
//			ADVCSM
// slot 32913
    32913, 61740,
// TPI_SEARCH.agc:239
//		STCALL	TDEC1
// slot 32914
    32914, 28738,
// TPI_SEARCH.agc:240
//			LEMCONIC
// slot 32915
    32915, 23724,
// TPI_SEARCH.agc:241
//		GOTO
// slot 32916
    32916, 65360,
// TPI_SEARCH.agc:242
//			JUNCT3
// slot 32917
    32917, 61744,
// TPI_SEARCH.agc:243
//ADVCSM		STCALL	TDEC1
// slot 32918
    32918, 28738,
// TPI_SEARCH.agc:244
//			CSMCONIC
// slot 32919
    32919, 23704,
// TPI_SEARCH.agc:245
//# SAVE BACK VALUES OF HP AND DELVEE
// TPI_SEARCH.agc:246
//JUNCT3		VLOAD
// slot 32920
    32920, 65530,
// TPI_SEARCH.agc:247
//			VATT
// slot 32921
    32921, 14,
// TPI_SEARCH.agc:248
//		STOVL	VPASS4
// slot 32922
    32922, 24384,
// TPI_SEARCH.agc:249
//			RATT
// slot 32923
    32923, 2,
// TPI_SEARCH.agc:250
//		STORE	RPASS4
// slot 32924
    32924, 3892,
// TPI_SEARCH.agc:251
//		STODL	RTARG
// slot 32925
    32925, 15898,
// TPI_SEARCH.agc:252
//			TF
// slot 32926
    32926, 4052,
// TPI_SEARCH.agc:253
//		STODL	DELLT4
// slot 32927
    32927, 15910,
// TPI_SEARCH.agc:254
//			HP
// slot 32928
    32928, 2858,
// TPI_SEARCH.agc:255
//		STODL	HPO
// slot 32929
    32929, 15154,
// TPI_SEARCH.agc:256
//			DELVEE
// slot 32930
    32930, 2854
)).

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:257
//		STODL	DELVEO
// slot 32931
    32931, 15158,
// TPI_SEARCH.agc:258
//# PREPARE FOR LAMBERT
// TPI_SEARCH.agc:259
//			TTPI
// slot 32932
    32932, 3942,
// TPI_SEARCH.agc:260
//		STODL	INTIME
// slot 32933
    32933, 16006,
// TPI_SEARCH.agc:261
//			XRS
// slot 32934
    32934, 4044,
// TPI_SEARCH.agc:262
//		STODL	RTX1
// slot 32935
    32935, 16332,
// TPI_SEARCH.agc:263
//			HI6ZEROS
// slot 32936
    32936, 13754,
// TPI_SEARCH.agc:264
//		SETPD	PDDL
// slot 32937
    32937, 54530,
// TPI_SEARCH.agc:265
//			0D
// slot 32938
    32938, 2,
// TPI_SEARCH.agc:266
//			EPSFOUR
// slot 32939
    32939, 27812,
// TPI_SEARCH.agc:267
//		PDVL
// slot 32940
    32940, 65434,
// TPI_SEARCH.agc:268
//			RACT3
// slot 32941
    32941, 3776,
// TPI_SEARCH.agc:269
//		STOVL	RINIT
// slot 32942
    32942, 24304,
// TPI_SEARCH.agc:270
//			VACT3
// slot 32943
    32943, 3788,
// TPI_SEARCH.agc:271
//		STCALL	VINIT
// slot 32944
    32944, 32508,
// TPI_SEARCH.agc:272
//			INITVEL
// slot 32945
    32945, 18432,
// TPI_SEARCH.agc:273
//# COMPUTE H ET CETERA
// TPI_SEARCH.agc:274
//		VLOAD	VSU
// slot 32946
    32946, 43514,
// TPI_SEARCH.agc:275
//			VTPRIME
// slot 32947
    32947, 3872,
// TPI_SEARCH.agc:276
//			VPASS4
// slot 32948
    32948, 3904,
// TPI_SEARCH.agc:277
//		ABVAL	PUSH
// slot 32949
    32949, 34380,
// TPI_SEARCH.agc:278
//		STOVL	RELDELV			# /V2-VP(TPI+TF)/
// slot 32950
    32950, 23358,
// TPI_SEARCH.agc:279
//			DELVEET3		# V1-VA
// slot 32951
    32951, 3916,
// TPI_SEARCH.agc:280
//		ABVAL				# /V1-VA/
// slot 32952
    32952, 65356,
// TPI_SEARCH.agc:281
//		STORE	MAGVTPI
// slot 32953
    32953, 2874,
// TPI_SEARCH.agc:282
//		DAD	STADR
// slot 32954
    32954, 38426,
// TPI_SEARCH.agc:283
//		STODL	DELVEE
// slot 32955
    32955, 50392,
// TPI_SEARCH.agc:284
//			XRS
// slot 32956
    32956, 4044,
// TPI_SEARCH.agc:285
//		STOVL	X1
// slot 32957
    32957, 20558,
// TPI_SEARCH.agc:286
//			VIPRIME
// slot 32958
    32958, 3860,
// TPI_SEARCH.agc:287
//# Page 556
// TPI_SEARCH.agc:288
//		VSR*
// slot 32959
    32959, 65374,
// TPI_SEARCH.agc:289
//			0,2
// slot 32960
    32960, 48380,
// TPI_SEARCH.agc:290
//		STOVL	VVEC
// slot 32961
    32961, 23500,
// TPI_SEARCH.agc:291
//			RACT3
// slot 32962
    32962, 3776,
// TPI_SEARCH.agc:292
//		VSR*
// slot 32963
    32963, 65374,
// TPI_SEARCH.agc:293
//			0,2
// slot 32964
    32964, 48380,
// TPI_SEARCH.agc:294
//		STCALL	RVEC
// slot 32965
    32965, 31582,
// TPI_SEARCH.agc:295
//			PERIAPO
// slot 32966
    32966, 38118,
// TPI_SEARCH.agc:296
//		LXA,2	DLOAD
// slot 32967
    32967, 58840,
// TPI_SEARCH.agc:297
//			XRS	+1
// slot 32968
    32968, 4044,
// TPI_SEARCH.agc:298
//		SL*
// slot 32969
    32969, 65374,
// TPI_SEARCH.agc:299
//			0,2
// slot 32970
    32970, 48892,
// TPI_SEARCH.agc:300
//		STORE	HP
// slot 32971
    32971, 2858,
// TPI_SEARCH.agc:301
//# ITSWICH DENOTES INTERPOLATION--SOLUTION ACCEPTANCE IS FORCED
// TPI_SEARCH.agc:302
//		BON	DLOAD
// slot 32972
    32972, 58648,
// TPI_SEARCH.agc:303
//			ITSWICH
// slot 32973
    32973, 3970,
// TPI_SEARCH.agc:304
//			ENDEN
// slot 32974
    32974, 61998,
// TPI_SEARCH.agc:305
//			HPERMIN
// slot 32975
    32975, 2466,
// TPI_SEARCH.agc:306
//		DSU	BMN
// slot 32976
    32976, 41002,
// TPI_SEARCH.agc:307
//			HP
// slot 32977
    32977, 2858,
// TPI_SEARCH.agc:308
//			HALFSAFE
// slot 32978
    32978, 61930,
// TPI_SEARCH.agc:309
//		PDDL	DSU			# WAS PERICENTER ALT SAFE
// slot 32979
    32979, 38314,
// TPI_SEARCH.agc:310
//			HPERMIN
// slot 32980
    32980, 2466,
// TPI_SEARCH.agc:311
//			HPO
// slot 32981
    32981, 2866,
// TPI_SEARCH.agc:312
//		BMN	DSU			# (HPLIM-HPO)-(HPLIM-HP)=HP-HPO
// slot 32982
    32982, 38208,
// TPI_SEARCH.agc:313
//			INTERP			# SOLUTION AT HAND
// slot 32983
    32983, 61896,
// TPI_SEARCH.agc:314
//		BMN	DLOAD
// slot 32984
    32984, 58688,
// TPI_SEARCH.agc:315
//			ALARUMS			# IT'S GETTING WORSE - SOUND THE ALARM
// slot 32985
    32985, 60760,
// TPI_SEARCH.agc:316
//			CDSEC
// slot 32986
    32986, 27824,
// TPI_SEARCH.agc:317
//JUNCT1		BOFF	DCOMP			# OFF IS PLUS ON IS MINUS
// slot 32987
    32987, 48664,
// TPI_SEARCH.agc:318
//			KFLAG
// slot 32988
    32988, 476,
// TPI_SEARCH.agc:319
//			+1
// slot 32989
    32989, 61884,
// TPI_SEARCH.agc:320
//		STORE	DELTEE
// slot 32990
    32990, 4040,
// TPI_SEARCH.agc:321
//JUNCT2		DLOAD	DAD
// slot 32991
    32991, 36298,
// TPI_SEARCH.agc:322
//			DELTEE
// slot 32992
    32992, 4040,
// TPI_SEARCH.agc:323
//			TF
// slot 32993
    32993, 4052,
// TPI_SEARCH.agc:324
//		STCALL	TF
// slot 32994
    32994, 32724,
// TPI_SEARCH.agc:325
//			BIS			# RECYCLE
// slot 32995
    32995, 61686,
// TPI_SEARCH.agc:326
//INTERP		SET	DSU			# HP-HPO
// slot 32996
    32996, 38168,
// TPI_SEARCH.agc:327
//			ITSWICH
// slot 32997
    32997, 3682,
// TPI_SEARCH.agc:328
//		NORM	PDDL
// slot 32998
    32998, 54658,
// TPI_SEARCH.agc:329
//			X1
// slot 32999
    32999, 78,
// TPI_SEARCH.agc:330
//			DFTMOON
// slot 33000
    33000, 27852,
// TPI_SEARCH.agc:331
//		DAD	DSU
// slot 33001
    33001, 38170,
// TPI_SEARCH.agc:332
//			HPERMIN
// slot 33002
    33002, 2466,
// TPI_SEARCH.agc:333
//			HP
// slot 33003
    33003, 2858,
// TPI_SEARCH.agc:334
//		NORM	SR1
// slot 33004
    33004, 57986,
// TPI_SEARCH.agc:335
//			X2
// slot 33005
    33005, 80,
// TPI_SEARCH.agc:336
//		XSU,2	DDV
// slot 33006
    33006, 47464,
// TPI_SEARCH.agc:337
//			X1
// slot 33007
    33007, 76,
// TPI_SEARCH.agc:338
//# Page 557
// TPI_SEARCH.agc:339
//		DMP	SR*
// slot 33008
    33008, 44810,
// TPI_SEARCH.agc:340
//			DELTEE
// slot 33009
    33009, 4040,
// TPI_SEARCH.agc:341
//			0 	-1,2
// slot 33010
    33010, 48382,
// TPI_SEARCH.agc:342
//		STCALL	DELTEE
// slot 33011
    33011, 32712,
// TPI_SEARCH.agc:343
//			JUNCT2
// slot 33012
    33012, 61886,
// TPI_SEARCH.agc:344
//HALFSAFE	PDDL	DSU			# SAVE HP-HPLIM FOR POSSIBLE
// slot 33013
    33013, 38314,
// TPI_SEARCH.agc:345
//			DELVEE
// slot 33014
    33014, 2854,
// TPI_SEARCH.agc:346
//			DELVEO			# SAVE THIS TOO
// slot 33015
    33015, 2870,
// TPI_SEARCH.agc:347
//		PUSH	ABS
// slot 33016
    33016, 42508,
// TPI_SEARCH.agc:348
//		DSU	BMN
// slot 33017
    33017, 41002,
// TPI_SEARCH.agc:349
//			LIMVEL			# 2 FT PS
// slot 33018
    33018, 27848,
// TPI_SEARCH.agc:350
//			ENDEN
// slot 33019
    33019, 61998,
// TPI_SEARCH.agc:351
//		DLOAD	DSU
// slot 33020
    33020, 38346,
// TPI_SEARCH.agc:352
//			HPERMIN
// slot 33021
    33021, 2466,
// TPI_SEARCH.agc:353
//			HPO
// slot 33022
    33022, 2866,
// TPI_SEARCH.agc:354
//		PDDL
// slot 33023
    33023, 65450,
// TPI_SEARCH.agc:355
//		BMN	DLOAD
// slot 33024
    33024, 58688,
// TPI_SEARCH.agc:356
//			LRGRDVO
// slot 33025
    33025, 61968,
// TPI_SEARCH.agc:357
//		BPL	DLOAD
// slot 33026
    33026, 58696,
// TPI_SEARCH.agc:358
//			INTERP
// slot 33027
    33027, 61896,
// TPI_SEARCH.agc:359
//			DELTEE
// slot 33028
    33028, 4040,
// TPI_SEARCH.agc:360
//		SR1	DCOMP
// slot 33029
    33029, 48836,
// TPI_SEARCH.agc:361
//		STCALL	DELTEE
// slot 33030
    33030, 32712,
// TPI_SEARCH.agc:362
//			JUNCT2
// slot 33031
    33031, 61886,
// TPI_SEARCH.agc:363
//LRGRDVO		DLOAD
// slot 33032
    33032, 65482,
// TPI_SEARCH.agc:364
//		BMN	DLOAD
// slot 33033
    33033, 58688,
// TPI_SEARCH.agc:365
//			JUNCT2
// slot 33034
    33034, 61886,
// TPI_SEARCH.agc:366
//			CLSEC
// slot 33035
    33035, 27828,
// TPI_SEARCH.agc:367
//		GOTO
// slot 33036
    33036, 65360,
// TPI_SEARCH.agc:368
//			JUNCT1
// slot 33037
    33037, 61878,
// TPI_SEARCH.agc:369
//# TIME RAN OUT ASSUME SOLUTION IF SAVE PERICENTER
// TPI_SEARCH.agc:370
//RNGETEST	DLOAD	DSU
// slot 33038
    33038, 38346,
// TPI_SEARCH.agc:371
//			HP
// slot 33039
    33039, 2858,
// TPI_SEARCH.agc:372
//			HPERMIN
// slot 33040
    33040, 2466,
// TPI_SEARCH.agc:373
//		BMN	DLOAD
// slot 33041
    33041, 58688,
// TPI_SEARCH.agc:374
//			ALARUMS
// slot 33042
    33042, 60760,
// TPI_SEARCH.agc:375
//			TF
// slot 33043
    33043, 4052,
// TPI_SEARCH.agc:376
//		DSU
// slot 33044
    33044, 65322,
// TPI_SEARCH.agc:377
//			DELTEE
// slot 33045
    33045, 4040,
// TPI_SEARCH.agc:378
//		STORE	TF			# TIME OF SOLUTION
// slot 33046
    33046, 4052,
// TPI_SEARCH.agc:379
//ENDEN		VLOAD
// slot 33047
    33047, 65530,
// TPI_SEARCH.agc:380
//			VTPRIME
// slot 33048
    33048, 3872,
// TPI_SEARCH.agc:381
//		DOT	PDDL			# SG2 WITH MAGNITUDE
// slot 33049
    33049, 54594,
// TPI_SEARCH.agc:382
//			RPASS4
// slot 33050
    33050, 3892,
// TPI_SEARCH.agc:383
//			RELDELV
// slot 33051
    33051, 2878,
// TPI_SEARCH.agc:384
//		SIGN	STADR			# NOW SIGN(RELDELV)=SIGN(SG2)
// slot 33052
    33052, 38634
)).

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:385
//		STCALL	RELDELV
// slot 33053
    33053, 33984,
// TPI_SEARCH.agc:386
//			TRANSANG		# COMPUTE OMEGA T , CENTRAL ANGLE
// slot 33054
    33054, 14914,
// TPI_SEARCH.agc:387
//		VLOAD	DOT
// slot 33055
    33055, 41466,
// TPI_SEARCH.agc:388
//			RACT3
// slot 33056
    33056, 3776,
// TPI_SEARCH.agc:389
//# Page 558
// TPI_SEARCH.agc:390
//			VIPRIME			# SG1
// slot 33057
    33057, 3860,
// TPI_SEARCH.agc:391
//		SIGN	BPL			# IF POSITIVE THEN SG1 = SG2 OTHERWISE
// slot 33058
    33058, 42218,
// TPI_SEARCH.agc:392
//			RELDELV
// slot 33059
    33059, 2878,
// TPI_SEARCH.agc:393
//			USEKAY			# SIGN(SG2-SG1)=SIGN(SG2)=SIGN(RELDELV)
// slot 33060
    33060, 62040,
// TPI_SEARCH.agc:394
//		SLOAD	DCOMP
// slot 33061
    33061, 48826,
// TPI_SEARCH.agc:395
//			DECTWO
// slot 33062
    33062, 27806,
// TPI_SEARCH.agc:396
//		SIGN	BPL
// slot 33063
    33063, 42218,
// TPI_SEARCH.agc:397
//			RELDELV
// slot 33064
    33064, 2878,
// TPI_SEARCH.agc:398
//			NEXUS
// slot 33065
    33065, 62052,
// TPI_SEARCH.agc:399
//		DCOMP	GOTO
// slot 33066
    33066, 43132,
// TPI_SEARCH.agc:400
//			USEKAY	+4
// slot 33067
    33067, 62048,
// TPI_SEARCH.agc:401
//USEKAY		SLOAD	BON
// slot 33068
    33068, 36026,
// TPI_SEARCH.agc:402
//			DECTWO
// slot 33069
    33069, 27806,
// TPI_SEARCH.agc:403
//			KFLAG
// slot 33070
    33070, 412,
// TPI_SEARCH.agc:404
//			NEXUS
// slot 33071
    33071, 62052,
// TPI_SEARCH.agc:405
//		DSU
// slot 33072
    33072, 65322,
// TPI_SEARCH.agc:406
//			P21ONENN
// slot 33073
    33073, 30928,
// TPI_SEARCH.agc:407
//NEXUS		STODL	NN1
// slot 33074
    33074, 16364,
// TPI_SEARCH.agc:408
//			HP
// slot 33075
    33075, 2858,
// TPI_SEARCH.agc:409
//		STCALL	POSTTPI
// slot 33076
    33076, 31554,
// TPI_SEARCH.agc:410
//			QTEMP
// slot 33077
    33077, 3934,
// TPI_SEARCH.agc:411
//		BANK	07
// TPI_SEARCH.agc:412
//		SETLOC	XANG
// TPI_SEARCH.agc:413
//		BANK
// TPI_SEARCH.agc:414
//		COUNT	07/XANG
// TPI_SEARCH.agc:415
//
// TPI_SEARCH.agc:416
//# CENTRAL ANGLE SUBROUTINE
// TPI_SEARCH.agc:417
//# 	THIS SUBROUTINE COMPUTES THE CENTRAL ANGLE OF TRAVEL OF THE
// TPI_SEARCH.agc:418
//# PASSIVE VEHICLE DURING THE TRANSFER.
// TPI_SEARCH.agc:419
//
// TPI_SEARCH.agc:420
//TRANSANG	STQ	SETPD
// slot 9505
    9505, 33056,
// TPI_SEARCH.agc:421
//			SUBEXIT
// slot 9506
    9506, 2544,
// TPI_SEARCH.agc:422
//			0
// slot 9507
    9507, 2,
// TPI_SEARCH.agc:423
//		LXA,1	LXA,2
// slot 9508
    9508, 60624,
// TPI_SEARCH.agc:424
//			XRS
// slot 9509
    9509, 4042,
// TPI_SEARCH.agc:425
//			XRS	+1
// slot 9510
    9510, 4044,
// TPI_SEARCH.agc:426
//		VLOAD	VSR*
// slot 9511
    9511, 45050,
// TPI_SEARCH.agc:427
//			VPASS4
// slot 9512
    9512, 3904,
// TPI_SEARCH.agc:428
//			0,2
// slot 9513
    9513, 48380,
// TPI_SEARCH.agc:429
//		STODL*	VVEC
// slot 9514
    9514, 19404,
// TPI_SEARCH.agc:430
//			MUTABLE	+2,1
// slot 9515
    9515, 10180,
// TPI_SEARCH.agc:431
//		PDVL	VSR*			# SQRT MU (+18 OR +15)			00D
// slot 9516
    9516, 44954,
// TPI_SEARCH.agc:432
//			RPASS4
// slot 9517
    9517, 3892,
// TPI_SEARCH.agc:433
//			0,2
// slot 9518
    9518, 48380,
// TPI_SEARCH.agc:434
//		ABVAL	PDDL*			# MAGNITUDE OF R (+29 OR +27)		02D
// slot 9519
    9519, 54092,
// TPI_SEARCH.agc:435
//			MUTABLE,1
// slot 9520
    9520, 10176,
// TPI_SEARCH.agc:436
//		PDVL	VSQ			# 1/MU (+34 OR +28)			04D
// slot 9521
    9521, 40602,
// TPI_SEARCH.agc:437
//			VVEC
// slot 9522
    9522, 3020,
// TPI_SEARCH.agc:438
//		NORM	DMPR			# PUSH LIST AT 02D
// slot 9523
    9523, 48514,
// TPI_SEARCH.agc:439
//			X1
// slot 9524
    9524, 78,
// TPI_SEARCH.agc:440
//# Page 559
// TPI_SEARCH.agc:441
//		DMP	SRR*
// slot 9525
    9525, 44810,
// TPI_SEARCH.agc:442
//			02D
// slot 9526
    9526, 6,
// TPI_SEARCH.agc:443
//			0 	-3,1
// slot 9527
    9527, 18172,
// TPI_SEARCH.agc:444
//		BDSU				# R V**/MU (+6)
// slot 9528
    9528, 65314,
// TPI_SEARCH.agc:445
//			D1/32
// slot 9529
    9529, 10012,
// TPI_SEARCH.agc:446
//		NORM	PDDL
// slot 9530
    9530, 54658,
// TPI_SEARCH.agc:447
//			X1			# (2 - R V**/MU) 	(+6-N)
// slot 9531
    9531, 78,
// TPI_SEARCH.agc:448
//		SR1R	DDV			# MAGNITUDE OF R 	(+30 OR +28)
// slot 9532
    9532, 47588,
// TPI_SEARCH.agc:449
//		SL*	PUSH			# R/(2 - R V**/MU)	(+29 OR +27)02D
// slot 9533
    9533, 34398,
// TPI_SEARCH.agc:450
//			0 	-5,1
// slot 9534
    9534, 16632,
// TPI_SEARCH.agc:451
//		SR1	SQRT
// slot 9535
    9535, 63172,
// TPI_SEARCH.agc:452
//		DMP
// slot 9536
    9536, 65290,
// TPI_SEARCH.agc:453
//		NORM	PDDL			# ASUBP***				00D
// slot 9537
    9537, 54658,
// TPI_SEARCH.agc:454
//			X1
// slot 9538
    9538, 78,
// TPI_SEARCH.agc:455
//		SR1	DDV
// slot 9539
    9539, 47556,
// TPI_SEARCH.agc:456
//		DMP	SL*
// slot 9540
    9540, 44810,
// TPI_SEARCH.agc:457
//			TF
// slot 9541
    9541, 4052,
// TPI_SEARCH.agc:458
//			0,1
// slot 9542
    9542, 16642,
// TPI_SEARCH.agc:459
//		PDDL	NORM
// slot 9543
    9543, 49578,
// TPI_SEARCH.agc:460
//			2PISC
// slot 9544
    9544, 10032,
// TPI_SEARCH.agc:461
//			X1
// slot 9545
    9545, 78,
// TPI_SEARCH.agc:462
//		PDDL	DDV
// slot 9546
    9546, 47530,
// TPI_SEARCH.agc:463
//		SL*
// slot 9547
    9547, 65374,
// TPI_SEARCH.agc:464
//			0 	-3,1		# CENTANG = (SQRT(MU/ASUP***)TF)
// slot 9548
    9548, 16636,
// TPI_SEARCH.agc:465
//		STCALL	CENTANG			# IN REVOLUTIONS B-0
// slot 9549
    9549, 32728,
// TPI_SEARCH.agc:466
//			SUBEXIT
// slot 9550
    9550, 2544
)).

// bank 35, slots 32361-32367
function agcAotUnit1827 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32363 {
        if slot <= 32361 {
// TPI_SEARCH.agc:467
//		BANK	35
// TPI_SEARCH.agc:468
//		SETLOC	P17S1
// TPI_SEARCH.agc:469
//		BANK
// TPI_SEARCH.agc:470
//		COUNT	35/P17
// TPI_SEARCH.agc:471
//
// TPI_SEARCH.agc:472
//# TPI SEARCH DISPLAY ROUTNE
// TPI_SEARCH.agc:473
//
// TPI_SEARCH.agc:474
//P17		TC	AVFLAGA			# AVFLAG = CSM , SET TRACK + UPDATE FLAGS
// slot 32361
            if slot <> 32361 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32362 {
// TPI_SEARCH.agc:475
//		TC	P17.1
// slot 32362
                if slot <> 32362 or instruction <> 1644 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1644, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:476
//P77		TC	AVFLAGP			# AVFLAG = LEM , SET TRACK + UPDATE FLAGS
// slot 32363
                if slot <> 32363 or instruction <> 2466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32365 {
            if slot <= 32364 {
// TPI_SEARCH.agc:477
//P17.1		TC	P20FLGON		#	SET UPDATE FLAG
// slot 32364
                if slot <> 32364 or instruction <> 2471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:478
//		CAF	V06N37			#	DISPLAY TTPI TIME
// slot 32365
                if slot <> 32365 or instruction <> 14732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2444), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32366 {
// TPI_SEARCH.agc:479
//		TC	VNPOOH
// slot 32366
                if slot <> 32366 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:480
//		TC	INTPRET
// slot 32367
                if slot <> 32367 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1827] to agcAotUnit1827@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:481
//		CLEAR	CALL
// slot 32368
    32368, 37912,
// TPI_SEARCH.agc:482
//			UPDATFLG
// slot 32369
    32369, 880,
// TPI_SEARCH.agc:483
//			S17.1			# UPDATE STATE VECTORS TO TTPI
// slot 32370
    32370, 61460,
// TPI_SEARCH.agc:484
//		SET	AXT,1
// slot 32371
    32371, 63512,
// TPI_SEARCH.agc:485
//			UPDATFLG
// slot 32372
    32372, 624,
// TPI_SEARCH.agc:486
//		DEC	2			# DELTA H = 2	K POSITIVE , KFLAG OFF
// slot 32373
    32373, 4,
// TPI_SEARCH.agc:487
//		BOFF	AXT,1
// slot 32374
    32374, 63512,
// TPI_SEARCH.agc:488
//			KFLAG
// slot 32375
    32375, 476,
// TPI_SEARCH.agc:489
//			+2
// slot 32376
    32376, 60660,
// TPI_SEARCH.agc:490
//		DEC	1			# DELTA H = 1	K NEGATIVE , KFLAG ON
// slot 32377
    32377, 2,
// TPI_SEARCH.agc:491
//# Page 560
// TPI_SEARCH.agc:492
//		SXA,1	EXIT
// slot 32378
    32378, 65200,
// TPI_SEARCH.agc:493
//			OPTION2
// slot 32379
    32379, 1204
)).

// bank 35, slots 32380-32382
function agcAotUnit1828 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32380 {
// TPI_SEARCH.agc:494
//		CAF	V06N72			# DISPLAY PHI , DELTA H , SEARCH OPTION K
// slot 32380
        if slot <> 32380 or instruction <> 14003 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1715), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32381 {
// TPI_SEARCH.agc:495
//		TC	VNCOMP17
// slot 32381
            if slot <> 32381 or instruction <> 1695 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1695, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TPI_SEARCH.agc:496
//		TC	INTPRET
// slot 32382
            if slot <> 32382 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1828] to agcAotUnit1828@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:497
//		CLEAR	SET
// slot 32383
    32383, 35864,
// TPI_SEARCH.agc:498
//			UPDATFLG
// slot 32384
    32384, 880,
// TPI_SEARCH.agc:499
//			KFLAG
// slot 32385
    32385, 124,
// TPI_SEARCH.agc:500
//		SLOAD	DSU
// slot 32386
    32386, 38330,
// TPI_SEARCH.agc:501
//			OPTION2			# RESET KFLAG ON FOR OPTION =1
// slot 32387
    32387, 1206,
// TPI_SEARCH.agc:502
//			P21ONENN		#	     OFF FOR OPTION =2
// slot 32388
    32388, 30928,
// TPI_SEARCH.agc:503
//		BHIZ	CLEAR
// slot 32389
    32389, 35888,
// TPI_SEARCH.agc:504
//			+2
// slot 32390
    32390, 60688,
// TPI_SEARCH.agc:505
//			KFLAG
// slot 32391
    32391, 380,
// TPI_SEARCH.agc:506
//		SLOAD	BHIZ
// slot 32392
    32392, 39098,
// TPI_SEARCH.agc:507
//			XRS	+1
// slot 32393
    32393, 4046,
// TPI_SEARCH.agc:508
//			+4
// slot 32394
    32394, 60700,
// TPI_SEARCH.agc:509
//		DLOAD	GOTO
// slot 32395
    32395, 43210,
// TPI_SEARCH.agc:510
//			HPL
// slot 32396
    32396, 27820,
// TPI_SEARCH.agc:511
//			P17.2
// slot 32397
    32397, 60704,
// TPI_SEARCH.agc:512
//		DLOAD
// slot 32398
    32398, 65482,
// TPI_SEARCH.agc:513
//			HPE
// slot 32399
    32399, 27816,
// TPI_SEARCH.agc:514
//P17.2		STCALL	HPERMIN
// slot 32400
    32400, 31138,
// TPI_SEARCH.agc:515
//			S17.2
// slot 32401
    32401, 61552,
// TPI_SEARCH.agc:516
//		SET	EXIT
// slot 32402
    32402, 65048,
// TPI_SEARCH.agc:517
//			UPDATFLG
// slot 32403
    32403, 624
)).

// bank 35, slots 32404-32407
function agcAotUnit1829 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32405 {
        if slot <= 32404 {
// TPI_SEARCH.agc:518
//P17.3		CAF	V06N58			# DISPLAY DELTA VTPI , DELTA VTPF , AND H
// slot 32404
            if slot <> 32404 or instruction <> 14734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2446), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TPI_SEARCH.agc:519
//		TC	VNCOMP17
// slot 32405
            if slot <> 32405 or instruction <> 1695 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1695, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32406 {
// TPI_SEARCH.agc:520
//		CAF	V06N55			# DISPLAY PERICENTER CODE AND CENTRAL ANG.
// slot 32406
            if slot <> 32406 or instruction <> 14733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2445), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TPI_SEARCH.agc:521
//		TC	BANKCALL
// slot 32407
            if slot <> 32407 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1829] to agcAotUnit1829@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:522
//		CADR	GOFLASHR
// slot 32408
    32408, 17502
)).

// bank 35, slots 32409-32419
function agcAotUnit1830 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32413 {
        if slot <= 32410 {
            if slot <= 32409 {
// TPI_SEARCH.agc:523
//		TC	GOTOPOOH		# TERMINATE PROGRAM
// slot 32409
                if slot <> 32409 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:524
//		TC	GOTOPOOH		# END PROGRAM
// slot 32410
                if slot <> 32410 or instruction <> 2118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2118, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32411 {
// TPI_SEARCH.agc:525
//		TC	P17.1			# RECYCLE WITH NEW TTPI OR SEARCH OPTION
// slot 32411
                if slot <> 32411 or instruction <> 1644 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1644, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32412 {
// TPI_SEARCH.agc:526
//		CAF	TWO			# BLANK R2
// slot 32412
                    if slot <> 32412 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TPI_SEARCH.agc:527
//		TC	BLANKET
// slot 32413
                    if slot <> 32413 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32416 {
            if slot <= 32414 {
// TPI_SEARCH.agc:528
//		TCF	ENDOFJOB
// slot 32414
                if slot <> 32414 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32415 {
// TPI_SEARCH.agc:529
//		EBANK=	RTRN
// TPI_SEARCH.agc:530
//
// TPI_SEARCH.agc:531
//VNCOMP17	EXTEND
// slot 32415
                    if slot <> 32415 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TPI_SEARCH.agc:532
//		QXCH	QSAVED
// slot 32416
                    if slot <> 32416 or instruction <> 10230 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 1014, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32417 {
// TPI_SEARCH.agc:533
//		TS	VERBNOUN
// slot 32417
                if slot <> 32417 or instruction <> 23541 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23541, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32418 {
// TPI_SEARCH.agc:534
//		CA	VERBNOUN
// slot 32418
                    if slot <> 32418 or instruction <> 13301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1013).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TPI_SEARCH.agc:535
//		TCR	BANKCALL
// slot 32419
                    if slot <> 32419 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1830] to agcAotUnit1830@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:536
//		CADR	GOFLASH
// slot 32420
    32420, 17312
)).

// bank 35, slots 32421-32427
function agcAotUnit1831 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32423 {
        if slot <= 32421 {
// TPI_SEARCH.agc:537
//		TC	-3			# TERMINATE ILLEGAL REDISPLAY
// slot 32421
            if slot <> 32421 or instruction <> 1698 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1698, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32422 {
// TPI_SEARCH.agc:538
//		TC	QSAVED			# PROCEED
// slot 32422
                if slot <> 32422 or instruction <> 1014 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1014, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:539
//		CS	MPAC			# RECYCLE WITH NEW TPI TIME
// slot 32423
                if slot <> 32423 or instruction <> 16492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 108).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32425 {
            if slot <= 32424 {
// TPI_SEARCH.agc:540
//		AD	BIT6			# OR PROCEED WITH NEW SEARCH OPTION
// slot 32424
                if slot <> 32424 or instruction <> 27146 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:541
//		EXTEND
// slot 32425
                if slot <> 32425 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32426 {
// TPI_SEARCH.agc:542
//# Page 561
// TPI_SEARCH.agc:543
//		BZF	P17.1
// slot 32426
                if slot <> 32426 or instruction <> 5740 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5740, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TPI_SEARCH.agc:544
//		TC	VNCOMP17 +3
// slot 32427
                if slot <> 32427 or instruction <> 1698 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1698, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1831] to agcAotUnit1831@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:545
//ALARUMS		SET	EXIT
// slot 32428
    32428, 65048,
// TPI_SEARCH.agc:546
//			UPDATFLG
// slot 32429
    32429, 624
)).

// bank 35, slots 32430-32430
function agcAotUnit1832 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TPI_SEARCH.agc:547
//		TC	ALARM
// slot 32430
    if slot <> 32430 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1832] to agcAotUnit1832@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:548
//		OCT	00124			# NO SAFE PERICENTER IN THIS SECTOR
// slot 32431
    32431, 168
)).

// bank 35, slots 32432-32434
function agcAotUnit1833 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32432 {
// TPI_SEARCH.agc:549
//		CAF	V05N09
// slot 32432
        if slot <> 32432 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32433 {
// TPI_SEARCH.agc:550
//		TC	VNCOMP17
// slot 32433
            if slot <> 32433 or instruction <> 1695 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1695, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TPI_SEARCH.agc:551
//		TC	GOTOPOOH		# PROCEED ILLEGAL TERMINATE PROGRAM
// slot 32434
            if slot <> 32434 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1833] to agcAotUnit1833@.

agcAotInstallSourceRope(list(
// TPI_SEARCH.agc:552
//V06N72		VN	0672
// slot 32435
    32435, 1680
)).

