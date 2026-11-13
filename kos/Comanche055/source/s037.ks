// MEASUREMENT_INCORPORATION.agc
agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:1
//# Copyright:	Public domain.
// MEASUREMENT_INCORPORATION.agc:2
//# Filename:	MEASUREMENT_INCORPORATION.agc
// MEASUREMENT_INCORPORATION.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// MEASUREMENT_INCORPORATION.agc:4
//#		It is part of the source code for the Command Module's (CM)
// MEASUREMENT_INCORPORATION.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// MEASUREMENT_INCORPORATION.agc:6
//# Assembler:	yaYUL
// MEASUREMENT_INCORPORATION.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// MEASUREMENT_INCORPORATION.agc:8
//# Website:	www.ibiblio.org/apollo.
// MEASUREMENT_INCORPORATION.agc:9
//# Pages:	1252-1261
// MEASUREMENT_INCORPORATION.agc:10
//# Mod history:	2009-05-14 RSB	Adapted from the Colossus249/ file of the
// MEASUREMENT_INCORPORATION.agc:11
//#				same name, using Comanche055 page images.
// MEASUREMENT_INCORPORATION.agc:12
//#
// MEASUREMENT_INCORPORATION.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// MEASUREMENT_INCORPORATION.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// MEASUREMENT_INCORPORATION.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// MEASUREMENT_INCORPORATION.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// MEASUREMENT_INCORPORATION.agc:17
//# consequent reduction in image quality as well) are available online at
// MEASUREMENT_INCORPORATION.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// MEASUREMENT_INCORPORATION.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// MEASUREMENT_INCORPORATION.agc:20
//# (much) higher-quality images which Paul actually created.
// MEASUREMENT_INCORPORATION.agc:21
//#
// MEASUREMENT_INCORPORATION.agc:22
//# Notations on the hardcopy document read, in part:
// MEASUREMENT_INCORPORATION.agc:23
//#
// MEASUREMENT_INCORPORATION.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// MEASUREMENT_INCORPORATION.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// MEASUREMENT_INCORPORATION.agc:26
//#
// MEASUREMENT_INCORPORATION.agc:27
//#	This AGC program shall also be referred to as
// MEASUREMENT_INCORPORATION.agc:28
//#			Colossus 2A
// MEASUREMENT_INCORPORATION.agc:29
//
// MEASUREMENT_INCORPORATION.agc:30
//# Page 1252
// MEASUREMENT_INCORPORATION.agc:31
//#  INCORP1--PERFORMS THE SIX DIMENSIONAL STATE VECTOR DEVIATION FOR POSITI
// MEASUREMENT_INCORPORATION.agc:32
//# ON AND VELOCITY OR THE NINE DIMENSIONAL DEVIATION OF POSITION,VELOCITY,A
// MEASUREMENT_INCORPORATION.agc:33
//# ND RADAR OR LANDMARK BIAS.THE OUTPUT OF THE BVECTOR ROUTINE ALONG WITH T
// MEASUREMENT_INCORPORATION.agc:34
//# HE ERROR TRANSITION MATRIX(W) ARE USED AS INPUT TO THE ROUTINE.THE DEVIA
// MEASUREMENT_INCORPORATION.agc:35
//# TION IS OBTAINED BY COMPUTING AN ESTIMATED TRACKING MEASUREMENT FROM THE
// MEASUREMENT_INCORPORATION.agc:36
//# CURRENT STATE VECTOR AND COMPARING IT WITH AN ACTUAL TRACKING MEASUREMEN
// MEASUREMENT_INCORPORATION.agc:37
//# T AND APPLYING A STATISTICAL WEIGHTING VECTOR.
// MEASUREMENT_INCORPORATION.agc:38
//# INPUT
// MEASUREMENT_INCORPORATION.agc:39
//#   DMENFLG = 0 6DIMENSIONAL BVECTOR  1= 9DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:40
//#          W = ERROR TRANSITION MATRIX 6X6 OR 9X9
// MEASUREMENT_INCORPORATION.agc:41
//#   VARIANCE = VARIANCE (SCALAR)
// MEASUREMENT_INCORPORATION.agc:42
//#     DELTAQ = MEASURED DEVIATION(SCALAR)
// MEASUREMENT_INCORPORATION.agc:43
//#    BVECTOR = 6 OR 9 DIMENSIONAL BVECTOR
// MEASUREMENT_INCORPORATION.agc:44
//#
// MEASUREMENT_INCORPORATION.agc:45
//# OUTPUT
// MEASUREMENT_INCORPORATION.agc:46
//#      DELTAX = STATE VECTOR DEVIATIONS 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:47
//#	   ZI = VECTOR USED FOR THE INCORPORATION 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:48
//#     GAMMA = SCALAR
// MEASUREMENT_INCORPORATION.agc:49
//#     OMEGA = OMEGA WEIGHTING VECTOR 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:50
//#
// MEASUREMENT_INCORPORATION.agc:51
//# CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:52
//#    L  CALL INCORP1
// MEASUREMENT_INCORPORATION.agc:53
//#
// MEASUREMENT_INCORPORATION.agc:54
//# NORMAL EXIT
// MEASUREMENT_INCORPORATION.agc:55
//#    L+1 OF CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:56
//
// MEASUREMENT_INCORPORATION.agc:57
//		BANK	37
// MEASUREMENT_INCORPORATION.agc:58
//		SETLOC	MEASINC
// MEASUREMENT_INCORPORATION.agc:59
//		BANK
// MEASUREMENT_INCORPORATION.agc:60
//
// MEASUREMENT_INCORPORATION.agc:61
//		COUNT*	$$/INCOR
// MEASUREMENT_INCORPORATION.agc:62
//
// MEASUREMENT_INCORPORATION.agc:63
//		EBANK=	W
// MEASUREMENT_INCORPORATION.agc:64
//
// MEASUREMENT_INCORPORATION.agc:65
//INCORP1		STQ
// slot 33452
    33452, 65312,
// MEASUREMENT_INCORPORATION.agc:66
//			EGRESS
// slot 33453
    33453, 2462,
// MEASUREMENT_INCORPORATION.agc:67
//		AXT,1	SSP
// slot 33454
    33454, 55792,
// MEASUREMENT_INCORPORATION.agc:68
//			54D
// slot 33455
    33455, 108,
// MEASUREMENT_INCORPORATION.agc:69
//			S1
// slot 33456
    33456, 82,
// MEASUREMENT_INCORPORATION.agc:70
//			18D		# IX1 = 54 	S1= 18
// slot 33457
    33457, 36,
// MEASUREMENT_INCORPORATION.agc:71
//		AXT,2	SSP
// slot 33458
    33458, 55800,
// MEASUREMENT_INCORPORATION.agc:72
//			18D
// slot 33459
    33459, 36,
// MEASUREMENT_INCORPORATION.agc:73
//			S2
// slot 33460
    33460, 84,
// MEASUREMENT_INCORPORATION.agc:74
//			6		# IX2 = 18	S2=6
// slot 33461
    33461, 12,
// MEASUREMENT_INCORPORATION.agc:75
//Z123		VLOAD	MXV*
// slot 33462
    33462, 53242,
// MEASUREMENT_INCORPORATION.agc:76
//			BVECTOR		# BVECTOR (0)
// slot 33463
    33463, 3716,
// MEASUREMENT_INCORPORATION.agc:77
//			W +54D,1
// slot 33464
    33464, 2670,
// MEASUREMENT_INCORPORATION.agc:78
//		STORE	ZI +18D,2
// slot 33465
    33465, 11210,
// MEASUREMENT_INCORPORATION.agc:79
//		VLOAD
// slot 33466
    33466, 65530,
// MEASUREMENT_INCORPORATION.agc:80
//			BVECTOR +6	# BVECTOR (1)
// slot 33467
    33467, 3728,
// MEASUREMENT_INCORPORATION.agc:81
//# Page 1253
// MEASUREMENT_INCORPORATION.agc:82
//		MXV*	VAD*
// slot 33468
    33468, 43934,
// MEASUREMENT_INCORPORATION.agc:83
//			W +108D,1
// slot 33469
    33469, 2778,
// MEASUREMENT_INCORPORATION.agc:84
//			ZI +18D,2
// slot 33470
    33470, 62516,
// MEASUREMENT_INCORPORATION.agc:85
//		STORE	ZI +18D,2
// slot 33471
    33471, 11210,
// MEASUREMENT_INCORPORATION.agc:86
//		VLOAD
// slot 33472
    33472, 65530,
// MEASUREMENT_INCORPORATION.agc:87
//			BVECTOR +12D	# BVECTOR (2)
// slot 33473
    33473, 3740,
// MEASUREMENT_INCORPORATION.agc:88
//		MXV*	VAD*
// slot 33474
    33474, 43934,
// MEASUREMENT_INCORPORATION.agc:89
//			W +162D,1
// slot 33475
    33475, 2886,
// MEASUREMENT_INCORPORATION.agc:90
//			ZI +18D,2	# B(0)*W+B(1)*(W+54)+B(2)*(W+108)FIRST PAS
// slot 33476
    33476, 62516,
// MEASUREMENT_INCORPORATION.agc:91
//		STORE	ZI +18D,2	# ZI THEN Z2 THEN Z3
// slot 33477
    33477, 11210,
// MEASUREMENT_INCORPORATION.agc:92
//		TIX,1
// slot 33478
    33478, 65408,
// MEASUREMENT_INCORPORATION.agc:93
//			INCOR1
// slot 33479
    33479, 62864,
// MEASUREMENT_INCORPORATION.agc:94
//INCOR1		TIX,2	BON
// slot 33480
    33480, 35976,
// MEASUREMENT_INCORPORATION.agc:95
//			Z123		# LOOP FOR Z1,Z2,Z3
// slot 33481
    33481, 62828,
// MEASUREMENT_INCORPORATION.agc:96
//			DMENFLG
// slot 33482
    33482, 2956,
// MEASUREMENT_INCORPORATION.agc:97
//			INCOR1A
// slot 33483
    33483, 62878,
// MEASUREMENT_INCORPORATION.agc:98
//		VLOAD
// slot 33484
    33484, 65530,
// MEASUREMENT_INCORPORATION.agc:99
//			ZEROVECS
// slot 33485
    33485, 13754,
// MEASUREMENT_INCORPORATION.agc:100
//		STORE	ZI +12D
// slot 33486
    33486, 3006,
// MEASUREMENT_INCORPORATION.agc:101
//INCOR1A		SETPD	VLOAD
// slot 33487
    33487, 64770,
// MEASUREMENT_INCORPORATION.agc:102
//			0
// slot 33488
    33488, 2,
// MEASUREMENT_INCORPORATION.agc:103
//			ZI
// slot 33489
    33489, 2982,
// MEASUREMENT_INCORPORATION.agc:104
//		VSQ	RTB
// slot 33490
    33490, 39996,
// MEASUREMENT_INCORPORATION.agc:105
//			TPMODE
// slot 33491
    33491, 38634,
// MEASUREMENT_INCORPORATION.agc:106
//		PDVL	VSQ
// slot 33492
    33492, 40602,
// MEASUREMENT_INCORPORATION.agc:107
//			ZI +6
// slot 33493
    33493, 2994,
// MEASUREMENT_INCORPORATION.agc:108
//		RTB	TAD
// slot 33494
    33494, 63800,
// MEASUREMENT_INCORPORATION.agc:109
//			TPMODE
// slot 33495
    33495, 38634,
// MEASUREMENT_INCORPORATION.agc:110
//		PDVL	VSQ
// slot 33496
    33496, 40602,
// MEASUREMENT_INCORPORATION.agc:111
//			ZI +12D
// slot 33497
    33497, 3006,
// MEASUREMENT_INCORPORATION.agc:112
//		RTB	TAD
// slot 33498
    33498, 63800,
// MEASUREMENT_INCORPORATION.agc:113
//			TPMODE
// slot 33499
    33499, 38634,
// MEASUREMENT_INCORPORATION.agc:114
//		TAD	AXT,2
// slot 33500
    33500, 64754,
// MEASUREMENT_INCORPORATION.agc:115
//			VARIANCE
// slot 33501
    33501, 3756,
// MEASUREMENT_INCORPORATION.agc:116
//			0
// slot 33502
    33502, 0,
// MEASUREMENT_INCORPORATION.agc:117
//		STORE	TRIPA		# ZI*2 + Z2*2 + Z3*2 + VARIANCE
// slot 33503
    33503, 1374,
// MEASUREMENT_INCORPORATION.agc:118
//		TLOAD	BOV
// slot 33504
    33504, 32978,
// MEASUREMENT_INCORPORATION.agc:119
//			VARIANCE	# CLEAR OVFIND
// slot 33505
    33505, 3756,
// MEASUREMENT_INCORPORATION.agc:120
//			+1
// slot 33506
    33506, 62918,
// MEASUREMENT_INCORPORATION.agc:121
//		STORE	TEMPVAR		# TEMP STORAGE FOR VARIANCE
// slot 33507
    33507, 1380,
// MEASUREMENT_INCORPORATION.agc:122
//		BZE
// slot 33508
    33508, 65368,
// MEASUREMENT_INCORPORATION.agc:123
//			INCOR1C
// slot 33509
    33509, 62936,
// MEASUREMENT_INCORPORATION.agc:124
//INCOR1B		SL2	BOV
// slot 33510
    33510, 32916,
// MEASUREMENT_INCORPORATION.agc:125
//			INCOR1C
// slot 33511
    33511, 62936,
// MEASUREMENT_INCORPORATION.agc:126
//		STORE	TEMPVAR
// slot 33512
    33512, 1380,
// MEASUREMENT_INCORPORATION.agc:127
//		INCR,2	GOTO
// slot 33513
    33513, 43160,
// MEASUREMENT_INCORPORATION.agc:128
//		DEC	1
// slot 33514
    33514, 2
)).

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:129
//			INCOR1B
// slot 33515
    33515, 62924,
// MEASUREMENT_INCORPORATION.agc:130
//INCOR1C		TLOAD	ROUND
// slot 33516
    33516, 50898,
// MEASUREMENT_INCORPORATION.agc:131
//			TRIPA
// slot 33517
    33517, 1374,
// MEASUREMENT_INCORPORATION.agc:132
//# Page 1254
// MEASUREMENT_INCORPORATION.agc:133
//		DMP	SQRT
// slot 33518
    33518, 62986,
// MEASUREMENT_INCORPORATION.agc:134
//			TEMPVAR
// slot 33519
    33519, 1380,
// MEASUREMENT_INCORPORATION.agc:135
//		SL*	TAD
// slot 33520
    33520, 63838,
// MEASUREMENT_INCORPORATION.agc:136
//			0,2
// slot 33521
    33521, 48892,
// MEASUREMENT_INCORPORATION.agc:137
//			TRIPA
// slot 33522
    33522, 1374,
// MEASUREMENT_INCORPORATION.agc:138
//		NORM	INCR,2
// slot 33523
    33523, 52354,
// MEASUREMENT_INCORPORATION.agc:139
//			X2
// slot 33524
    33524, 80,
// MEASUREMENT_INCORPORATION.agc:140
//		DEC	-2
// slot 33525
    33525, 65530,
// MEASUREMENT_INCORPORATION.agc:141
//		SXA,2	AXT,2
// slot 33526
    33526, 64696,
// MEASUREMENT_INCORPORATION.agc:142
//			NORMGAM		# NORMALIZATION COUNT -2 FOR GAMMA
// slot 33527
    33527, 2330,
// MEASUREMENT_INCORPORATION.agc:143
//			162D
// slot 33528
    33528, 324,
// MEASUREMENT_INCORPORATION.agc:144
//		BDDV	SETPD
// slot 33529
    33529, 33130,
// MEASUREMENT_INCORPORATION.agc:145
//			DP1/4TH
// slot 33530
    33530, 13738,
// MEASUREMENT_INCORPORATION.agc:146
//			0
// slot 33531
    33531, 2,
// MEASUREMENT_INCORPORATION.agc:147
//		STORE	GAMMA
// slot 33532
    33532, 3676,
// MEASUREMENT_INCORPORATION.agc:148
//		TLOAD	NORM
// slot 33533
    33533, 49618,
// MEASUREMENT_INCORPORATION.agc:149
//			TRIPA
// slot 33534
    33534, 1374,
// MEASUREMENT_INCORPORATION.agc:150
//			X1
// slot 33535
    33535, 78,
// MEASUREMENT_INCORPORATION.agc:151
//		DLOAD	PDDL		# PD 0-1 = NORM (A)
// slot 33536
    33536, 54730,
// MEASUREMENT_INCORPORATION.agc:152
//			MPAC
// slot 33537
    33537, 218,
// MEASUREMENT_INCORPORATION.agc:153
//			DELTAQ
// slot 33538
    33538, 3752,
// MEASUREMENT_INCORPORATION.agc:154
//		NORM
// slot 33539
    33539, 65410,
// MEASUREMENT_INCORPORATION.agc:155
//			S1
// slot 33540
    33540, 82,
// MEASUREMENT_INCORPORATION.agc:156
//		XSU,1	SR1
// slot 33541
    33541, 57952,
// MEASUREMENT_INCORPORATION.agc:157
//			S1
// slot 33542
    33542, 80,
// MEASUREMENT_INCORPORATION.agc:158
//		DDV	PUSH		# PD 0-1 = DELTAQ/A
// slot 33543
    33543, 34418,
// MEASUREMENT_INCORPORATION.agc:159
//		GOTO
// slot 33544
    33544, 65360,
// MEASUREMENT_INCORPORATION.agc:160
//			NEWZCOMP
// slot 33545
    33545, 26110,
// MEASUREMENT_INCORPORATION.agc:161
//   -3		SSP
// slot 33546
    33546, 65458,
// MEASUREMENT_INCORPORATION.agc:162
//			S2
// slot 33547
    33547, 84,
// MEASUREMENT_INCORPORATION.agc:163
//			54D
// slot 33548
    33548, 108,
// MEASUREMENT_INCORPORATION.agc:164
//INCOR2		VLOAD	VXM*		# COMPUT OMEGA1,2,3
// slot 33549
    33549, 50170,
// MEASUREMENT_INCORPORATION.agc:165
//			ZI
// slot 33550
    33550, 2982,
// MEASUREMENT_INCORPORATION.agc:166
//			W +162D,2
// slot 33551
    33551, 62648,
// MEASUREMENT_INCORPORATION.agc:167
//		PUSH	VLOAD
// slot 33552
    33552, 64780,
// MEASUREMENT_INCORPORATION.agc:168
//			ZI +6
// slot 33553
    33553, 2994,
// MEASUREMENT_INCORPORATION.agc:169
//		VXM*	VAD
// slot 33554
    33554, 44422,
// MEASUREMENT_INCORPORATION.agc:170
//			W +180D,2
// slot 33555
    33555, 62612,
// MEASUREMENT_INCORPORATION.agc:171
//		PUSH	VLOAD
// slot 33556
    33556, 64780,
// MEASUREMENT_INCORPORATION.agc:172
//			ZI +12D
// slot 33557
    33557, 3006,
// MEASUREMENT_INCORPORATION.agc:173
//		VXM*	VAD
// slot 33558
    33558, 44422,
// MEASUREMENT_INCORPORATION.agc:174
//			W +198D,2
// slot 33559
    33559, 62576,
// MEASUREMENT_INCORPORATION.agc:175
//		PUSH	TIX,2		# PD 2-7=OMEGA1,8-13=OMEGA2,14-19=OMEGA3
// slot 33560
    33560, 50188,
// MEASUREMENT_INCORPORATION.agc:176
//			INCOR2
// slot 33561
    33561, 63002,
// MEASUREMENT_INCORPORATION.agc:177
//		VLOAD	STADR
// slot 33562
    33562, 38650,
// MEASUREMENT_INCORPORATION.agc:178
//		STORE	OMEGA +12D
// slot 33563
    33563, 61830,
// MEASUREMENT_INCORPORATION.agc:179
//		VLOAD	STADR
// slot 33564
    33564, 38650,
// MEASUREMENT_INCORPORATION.agc:180
//		STORE	OMEGA +6
// slot 33565
    33565, 61842,
// MEASUREMENT_INCORPORATION.agc:181
//		VLOAD	STADR
// slot 33566
    33566, 38650,
// MEASUREMENT_INCORPORATION.agc:182
//		STORE	OMEGA
// slot 33567
    33567, 61854,
// MEASUREMENT_INCORPORATION.agc:183
//# Page 1255
// MEASUREMENT_INCORPORATION.agc:184
//		BON	VLOAD
// slot 33568
    33568, 64792,
// MEASUREMENT_INCORPORATION.agc:185
//			DMENFLG
// slot 33569
    33569, 2956,
// MEASUREMENT_INCORPORATION.agc:186
//			INCOR2AB
// slot 33570
    33570, 63050,
// MEASUREMENT_INCORPORATION.agc:187
//			ZEROVECS
// slot 33571
    33571, 13754,
// MEASUREMENT_INCORPORATION.agc:188
//		STORE	OMEGA +12D
// slot 33572
    33572, 3704,
// MEASUREMENT_INCORPORATION.agc:189
//INCOR2AB	AXT,2	SSP
// slot 33573
    33573, 55800,
// MEASUREMENT_INCORPORATION.agc:190
//			18D
// slot 33574
    33574, 36,
// MEASUREMENT_INCORPORATION.agc:191
//			S2
// slot 33575
    33575, 84,
// MEASUREMENT_INCORPORATION.agc:192
//			6
// slot 33576
    33576, 12,
// MEASUREMENT_INCORPORATION.agc:193
//INCOR3		VLOAD*
// slot 33577
    33577, 65526,
// MEASUREMENT_INCORPORATION.agc:194
//			OMEGA +18D,2
// slot 33578
    33578, 61818,
// MEASUREMENT_INCORPORATION.agc:195
//		VXSC	VSL*
// slot 33579
    33579, 45026,
// MEASUREMENT_INCORPORATION.agc:196
//			0		# DELTAQ/A
// slot 33580
    33580, 2,
// MEASUREMENT_INCORPORATION.agc:197
//			0,1
// slot 33581
    33581, 16642,
// MEASUREMENT_INCORPORATION.agc:198
//		STORE	DELTAX +18D,2
// slot 33582
    33582, 9602,
// MEASUREMENT_INCORPORATION.agc:199
//		TIX,2	VLOAD
// slot 33583
    33583, 64904,
// MEASUREMENT_INCORPORATION.agc:200
//			INCOR3
// slot 33584
    33584, 63058,
// MEASUREMENT_INCORPORATION.agc:201
//			DELTAX +6
// slot 33585
    33585, 1386,
// MEASUREMENT_INCORPORATION.agc:202
//		VSL3
// slot 33586
    33586, 65460,
// MEASUREMENT_INCORPORATION.agc:203
//		STORE	DELTAX +6
// slot 33587
    33587, 1386,
// MEASUREMENT_INCORPORATION.agc:204
//		GOTO
// slot 33588
    33588, 65360,
// MEASUREMENT_INCORPORATION.agc:205
//			EGRESS
// slot 33589
    33589, 2462,
// MEASUREMENT_INCORPORATION.agc:206
//
// MEASUREMENT_INCORPORATION.agc:207
//# Page 1256
// MEASUREMENT_INCORPORATION.agc:208
//#  INCORP2 -INCORPORATES THE COMPUTED STATE VECTOR DEVIATIONS INTO THE
// MEASUREMENT_INCORPORATION.agc:209
//# ESTIMATED STATE VECTOR. THE STATE VECTOR UPDATED MAY BE FOR EITHER THE
// MEASUREMENT_INCORPORATION.agc:210
//# LEM OR THE CSM.DETERMINED BY FLAG VEHUPFLG.(ZERO = LEM) (1 = CSM)
// MEASUREMENT_INCORPORATION.agc:211
//# INPUT
// MEASUREMENT_INCORPORATION.agc:212
//#    PERMANENT STATE VECTOR FOR EITHER THE LEM OR CSM
// MEASUREMENT_INCORPORATION.agc:213
//#    VEHUPFLG = UPDATE VEHICLE C=LEM  1=CSM
// MEASUREMENT_INCORPORATION.agc:214
//#    W = 	ERROR TRANSITION MATRIX
// MEASUREMENT_INCORPORATION.agc:215
//#    DELTAX  = 	COMPUTED STATE VECTOR DEVIATIONS
// MEASUREMENT_INCORPORATION.agc:216
//#    DMENFLG = 	SIZE OF W MATRIX (ZERO=6X6) (1=9X9)
// MEASUREMENT_INCORPORATION.agc:217
//#    GAMMA   = 	SCALAR FOR INCORPORATION
// MEASUREMENT_INCORPORATION.agc:218
//#    ZI      = 	VECTOR USED IN INCORPORATION
// MEASUREMENT_INCORPORATION.agc:219
//#    OMEGA   = 	WEIGHTING VECTOR
// MEASUREMENT_INCORPORATION.agc:220
//#
// MEASUREMENT_INCORPORATION.agc:221
//# OUTPUT
// MEASUREMENT_INCORPORATION.agc:222
//#    UPDATED PERMANENT STATE VECTOR
// MEASUREMENT_INCORPORATION.agc:223
//#
// MEASUREMENT_INCORPORATION.agc:224
//# CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:225
//#    L	 CALL INCORP2
// MEASUREMENT_INCORPORATION.agc:226
//#
// MEASUREMENT_INCORPORATION.agc:227
//# NORMAL EXIT
// MEASUREMENT_INCORPORATION.agc:228
//#    L+1 OF CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:229
//#
// MEASUREMENT_INCORPORATION.agc:230
//
// MEASUREMENT_INCORPORATION.agc:231
//		SETLOC	MEASINC1
// MEASUREMENT_INCORPORATION.agc:232
//		BANK
// MEASUREMENT_INCORPORATION.agc:233
//
// MEASUREMENT_INCORPORATION.agc:234
//		COUNT*	$$/INCOR
// MEASUREMENT_INCORPORATION.agc:235
//
// MEASUREMENT_INCORPORATION.agc:236
//INCORP2		STQ	CALL
// slot 33590
    33590, 37920,
// MEASUREMENT_INCORPORATION.agc:237
//			EGRESS
// slot 33591
    33591, 2462,
// MEASUREMENT_INCORPORATION.agc:238
//			INTSTALL
// slot 33592
    33592, 24132,
// MEASUREMENT_INCORPORATION.agc:239
//		VLOAD	VXSC		# CALC. GAMMA * OMEGA1,2,3
// slot 33593
    33593, 61946,
// MEASUREMENT_INCORPORATION.agc:240
//			OMEGA
// slot 33594
    33594, 3680,
// MEASUREMENT_INCORPORATION.agc:241
//			GAMMA
// slot 33595
    33595, 3676,
// MEASUREMENT_INCORPORATION.agc:242
//		STOVL	OMEGAM1
// slot 33596
    33596, 23366,
// MEASUREMENT_INCORPORATION.agc:243
//			OMEGA +6
// slot 33597
    33597, 3692,
// MEASUREMENT_INCORPORATION.agc:244
//		VXSC
// slot 33598
    33598, 65506,
// MEASUREMENT_INCORPORATION.agc:245
//			GAMMA
// slot 33599
    33599, 3676,
// MEASUREMENT_INCORPORATION.agc:246
//		STOVL	OMEGAM2
// slot 33600
    33600, 23378,
// MEASUREMENT_INCORPORATION.agc:247
//			OMEGA +12D
// slot 33601
    33601, 3704,
// MEASUREMENT_INCORPORATION.agc:248
//		VXSC
// slot 33602
    33602, 65506,
// MEASUREMENT_INCORPORATION.agc:249
//			GAMMA
// slot 33603
    33603, 3676,
// MEASUREMENT_INCORPORATION.agc:250
//		STORE	OMEGAM3
// slot 33604
    33604, 2910,
// MEASUREMENT_INCORPORATION.agc:251
//		EXIT
// slot 33605
    33605, 65532
)).

// bank 36, slots 33606-33612
function agcAotUnit1874 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33608 {
        if slot <= 33606 {
// MEASUREMENT_INCORPORATION.agc:252
//		CAF	54DD		# INITIAL IX 1 SETTING FOR W MATRIX
// slot 33606
            if slot <> 33606 or instruction <> 14327 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2039), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33607 {
// MEASUREMENT_INCORPORATION.agc:253
//		TS	WIXA
// slot 33607
                if slot <> 33607 or instruction <> 23210 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23210, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:254
//		TS	WIXB
// slot 33608
                if slot <> 33608 or instruction <> 23211 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23211, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33610 {
            if slot <= 33609 {
// MEASUREMENT_INCORPORATION.agc:255
//		CAF	ZERO
// slot 33609
                if slot <> 33609 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:256
//		TS	ZIXA		# INITIAL IX 2 SETTING FOR Z COMPONENT
// slot 33610
                if slot <> 33610 or instruction <> 23212 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23212, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33611 {
// MEASUREMENT_INCORPORATION.agc:257
//		TS	ZIXB
// slot 33611
                if slot <> 33611 or instruction <> 23213 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23213, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:258
//FAZA		TC	PHASCHNG
// slot 33612
                if slot <> 33612 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1874] to agcAotUnit1874@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:259
//# Page 1257
// MEASUREMENT_INCORPORATION.agc:260
//		OCT	04022
// slot 33613
    33613, 4132
)).

// bank 36, slots 33614-33614
function agcAotUnit1875 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// MEASUREMENT_INCORPORATION.agc:261
//		TC	UPFLAG
// slot 33614
    if slot <> 33614 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1875] to agcAotUnit1875@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:262
//		ADRES	REINTFLG
// slot 33615
    33615, 316
)).

// bank 36, slots 33616-33620
function agcAotUnit1876 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33617 {
        if slot <= 33616 {
// MEASUREMENT_INCORPORATION.agc:263
//FAZA1		CA	WIXB		# START FIRST PHASE OF INCORP2
// slot 33616
            if slot <> 33616 or instruction <> 12971 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 683).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// MEASUREMENT_INCORPORATION.agc:264
//		TS	WIXA		#  TO UPDATE 6 OR 9 DIM. W MATRIX IN TEMP
// slot 33617
            if slot <> 33617 or instruction <> 23210 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23210, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33618 {
// MEASUREMENT_INCORPORATION.agc:265
//		CA	ZIXB
// slot 33618
            if slot <> 33618 or instruction <> 12973 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 685).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33619 {
// MEASUREMENT_INCORPORATION.agc:266
//		TS	ZIXA
// slot 33619
                if slot <> 33619 or instruction <> 23212 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23212, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:267
//		TC	INTPRET
// slot 33620
                if slot <> 33620 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1876] to agcAotUnit1876@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:268
//		LXA,1	LXA,2
// slot 33621
    33621, 60624,
// MEASUREMENT_INCORPORATION.agc:269
//			WIXA
// slot 33622
    33622, 1364,
// MEASUREMENT_INCORPORATION.agc:270
//			ZIXA
// slot 33623
    33623, 1368,
// MEASUREMENT_INCORPORATION.agc:271
//		SSP	DLOAD*
// slot 33624
    33624, 58290,
// MEASUREMENT_INCORPORATION.agc:272
//			S1
// slot 33625
    33625, 82,
// MEASUREMENT_INCORPORATION.agc:273
//			6
// slot 33626
    33626, 12,
// MEASUREMENT_INCORPORATION.agc:274
//			ZI,2
// slot 33627
    33627, 62552,
// MEASUREMENT_INCORPORATION.agc:275
//		DCOMP	NORM		# CALC UPPER 3X9 PARTITION OF W MATRIX
// slot 33628
    33628, 49532,
// MEASUREMENT_INCORPORATION.agc:276
//			S2
// slot 33629
    33629, 84,
// MEASUREMENT_INCORPORATION.agc:277
//		VXSC	XCHX,2
// slot 33630
    33630, 54498,
// MEASUREMENT_INCORPORATION.agc:278
//			OMEGAM1
// slot 33631
    33631, 2886,
// MEASUREMENT_INCORPORATION.agc:279
//			S2
// slot 33632
    33632, 82,
// MEASUREMENT_INCORPORATION.agc:280
//		LXC,2	XAD,2
// slot 33633
    33633, 48328,
// MEASUREMENT_INCORPORATION.agc:281
//			X2
// slot 33634
    33634, 78,
// MEASUREMENT_INCORPORATION.agc:282
//			NORMGAM
// slot 33635
    33635, 2330,
// MEASUREMENT_INCORPORATION.agc:283
//		VSL*	XCHX,2
// slot 33636
    33636, 54366,
// MEASUREMENT_INCORPORATION.agc:284
//			0,2
// slot 33637
    33637, 48892,
// MEASUREMENT_INCORPORATION.agc:285
//			S2
// slot 33638
    33638, 82,
// MEASUREMENT_INCORPORATION.agc:286
//		VAD*
// slot 33639
    33639, 65366,
// MEASUREMENT_INCORPORATION.agc:287
//			W +54D,1
// slot 33640
    33640, 2670,
// MEASUREMENT_INCORPORATION.agc:288
//		STORE	HOLDW
// slot 33641
    33641, 2922,
// MEASUREMENT_INCORPORATION.agc:289
//		DLOAD*	DCOMP		# CALC MIDDLE 3X9 PARTITION OF W MATRIX
// slot 33642
    33642, 48838,
// MEASUREMENT_INCORPORATION.agc:290
//			ZI,2
// slot 33643
    33643, 62552,
// MEASUREMENT_INCORPORATION.agc:291
//		NORM	VXSC
// slot 33644
    33644, 61826,
// MEASUREMENT_INCORPORATION.agc:292
//			S2
// slot 33645
    33645, 84,
// MEASUREMENT_INCORPORATION.agc:293
//			OMEGAM2
// slot 33646
    33646, 2898,
// MEASUREMENT_INCORPORATION.agc:294
//		XCHX,2	LXC,2
// slot 33647
    33647, 58536,
// MEASUREMENT_INCORPORATION.agc:295
//			S2
// slot 33648
    33648, 82,
// MEASUREMENT_INCORPORATION.agc:296
//			X2
// slot 33649
    33649, 78,
// MEASUREMENT_INCORPORATION.agc:297
//		XAD,2	VSL*
// slot 33650
    33650, 44920,
// MEASUREMENT_INCORPORATION.agc:298
//			NORMGAM
// slot 33651
    33651, 2330,
// MEASUREMENT_INCORPORATION.agc:299
//			0,2
// slot 33652
    33652, 48892,
// MEASUREMENT_INCORPORATION.agc:300
//		XCHX,2	VAD*
// slot 33653
    33653, 43944,
// MEASUREMENT_INCORPORATION.agc:301
//			S2
// slot 33654
    33654, 82,
// MEASUREMENT_INCORPORATION.agc:302
//			W +108D,1
// slot 33655
    33655, 2778,
// MEASUREMENT_INCORPORATION.agc:303
//		STORE	HOLDW +6
// slot 33656
    33656, 2934,
// MEASUREMENT_INCORPORATION.agc:304
//		BOFF
// slot 33657
    33657, 65304,
// MEASUREMENT_INCORPORATION.agc:305
//			DMENFLG		# BRANCH IF 6 DIMENSIONAL
// slot 33658
    33658, 3020,
// MEASUREMENT_INCORPORATION.agc:306
//			FAZB
// slot 33659
    33659, 63254,
// MEASUREMENT_INCORPORATION.agc:307
//		DLOAD*	DCOMP		# CALC LOWER 3X9 PARTITION OF W MATRIX
// slot 33660
    33660, 48838,
// MEASUREMENT_INCORPORATION.agc:308
//			ZI,2
// slot 33661
    33661, 62552,
// MEASUREMENT_INCORPORATION.agc:309
//		NORM	VXSC
// slot 33662
    33662, 61826,
// MEASUREMENT_INCORPORATION.agc:310
//# Page 1258
// MEASUREMENT_INCORPORATION.agc:311
//			S2
// slot 33663
    33663, 84,
// MEASUREMENT_INCORPORATION.agc:312
//			OMEGAM3
// slot 33664
    33664, 2910,
// MEASUREMENT_INCORPORATION.agc:313
//		XCHX,2	LXC,2
// slot 33665
    33665, 58536,
// MEASUREMENT_INCORPORATION.agc:314
//			S2
// slot 33666
    33666, 82,
// MEASUREMENT_INCORPORATION.agc:315
//			X2
// slot 33667
    33667, 78,
// MEASUREMENT_INCORPORATION.agc:316
//		XAD,2	VSL*
// slot 33668
    33668, 44920,
// MEASUREMENT_INCORPORATION.agc:317
//			NORMGAM
// slot 33669
    33669, 2330,
// MEASUREMENT_INCORPORATION.agc:318
//			0,2
// slot 33670
    33670, 48892,
// MEASUREMENT_INCORPORATION.agc:319
//		XCHX,2	VAD*
// slot 33671
    33671, 43944,
// MEASUREMENT_INCORPORATION.agc:320
//			S2
// slot 33672
    33672, 82,
// MEASUREMENT_INCORPORATION.agc:321
//			W +162D,1
// slot 33673
    33673, 2886,
// MEASUREMENT_INCORPORATION.agc:322
//		STORE	HOLDW +12D
// slot 33674
    33674, 2946,
// MEASUREMENT_INCORPORATION.agc:323
//FAZB		CALL
// slot 33675
    33675, 65320,
// MEASUREMENT_INCORPORATION.agc:324
//			GRP2PC
// slot 33676
    33676, 48080,
// MEASUREMENT_INCORPORATION.agc:325
//		EXIT
// slot 33677
    33677, 65532
)).

// bank 36, slots 33678-33684
function agcAotUnit1877 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33680 {
        if slot <= 33678 {
// MEASUREMENT_INCORPORATION.agc:326
//FAZB1		CA	WIXA		# START 2ND PHASE OF INCORP2 TO TRANSFER
// slot 33678
            if slot <> 33678 or instruction <> 12970 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 682).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33679 {
// MEASUREMENT_INCORPORATION.agc:327
//		AD	6DD		#     TEMP REG TO PERM W MATRIX
// slot 33679
                if slot <> 33679 or instruction <> 26616 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2040), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:328
//		TS	WIXB
// slot 33680
                if slot <> 33680 or instruction <> 23211 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23211, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33682 {
            if slot <= 33681 {
// MEASUREMENT_INCORPORATION.agc:329
//		CA	ZIXA
// slot 33681
                if slot <> 33681 or instruction <> 12972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 684).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:330
//		AD	MINUS2
// slot 33682
                if slot <> 33682 or instruction <> 28621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33683 {
// MEASUREMENT_INCORPORATION.agc:331
//		TS	ZIXB
// slot 33683
                if slot <> 33683 or instruction <> 23213 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23213, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:332
//		TC	INTPRET
// slot 33684
                if slot <> 33684 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1877] to agcAotUnit1877@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:333
//		LXA,1	SSP
// slot 33685
    33685, 55760,
// MEASUREMENT_INCORPORATION.agc:334
//			WIXA
// slot 33686
    33686, 1364,
// MEASUREMENT_INCORPORATION.agc:335
//			S1
// slot 33687
    33687, 82,
// MEASUREMENT_INCORPORATION.agc:336
//			6
// slot 33688
    33688, 12,
// MEASUREMENT_INCORPORATION.agc:337
//		VLOAD
// slot 33689
    33689, 65530,
// MEASUREMENT_INCORPORATION.agc:338
//			HOLDW
// slot 33690
    33690, 2922,
// MEASUREMENT_INCORPORATION.agc:339
//		STORE	W +54D,1
// slot 33691
    33691, 6766,
// MEASUREMENT_INCORPORATION.agc:340
//		VLOAD
// slot 33692
    33692, 65530,
// MEASUREMENT_INCORPORATION.agc:341
//			HOLDW +6
// slot 33693
    33693, 2934,
// MEASUREMENT_INCORPORATION.agc:342
//		STORE	W +108D,1
// slot 33694
    33694, 6874,
// MEASUREMENT_INCORPORATION.agc:343
//		BOFF	VLOAD
// slot 33695
    33695, 64792,
// MEASUREMENT_INCORPORATION.agc:344
//			DMENFLG
// slot 33696
    33696, 3020,
// MEASUREMENT_INCORPORATION.agc:345
//			FAZB5
// slot 33697
    33697, 63314,
// MEASUREMENT_INCORPORATION.agc:346
//			HOLDW +12D
// slot 33698
    33698, 2946,
// MEASUREMENT_INCORPORATION.agc:347
//		STORE	W +162D,1
// slot 33699
    33699, 6982,
// MEASUREMENT_INCORPORATION.agc:348
//FAZB2		TIX,1	GOTO
// slot 33700
    33700, 43136,
// MEASUREMENT_INCORPORATION.agc:349
//			+2
// slot 33701
    33701, 63310,
// MEASUREMENT_INCORPORATION.agc:350
//			FAZC		# DONE WITH W MATRIX. UPDATE STATE VECTOR
// slot 33702
    33702, 63326,
// MEASUREMENT_INCORPORATION.agc:351
//		RTB
// slot 33703
    33703, 65336,
// MEASUREMENT_INCORPORATION.agc:352
//			FAZA
// slot 33704
    33704, 63128,
// MEASUREMENT_INCORPORATION.agc:353
//FAZB5		SLOAD	DAD
// slot 33705
    33705, 36282,
// MEASUREMENT_INCORPORATION.agc:354
//			ZIXB
// slot 33706
    33706, 1372,
// MEASUREMENT_INCORPORATION.agc:355
//			12DD
// slot 33707
    33707, 30708,
// MEASUREMENT_INCORPORATION.agc:356
//		BHIZ	GOTO
// slot 33708
    33708, 43056,
// MEASUREMENT_INCORPORATION.agc:357
//			FAZC
// slot 33709
    33709, 63326,
// MEASUREMENT_INCORPORATION.agc:358
//			FAZB2
// slot 33710
    33710, 63304,
// MEASUREMENT_INCORPORATION.agc:359
//FAZC		CALL
// slot 33711
    33711, 65320,
// MEASUREMENT_INCORPORATION.agc:360
//			GRP2PC
// slot 33712
    33712, 48080,
// MEASUREMENT_INCORPORATION.agc:361
//# Page 1259
// MEASUREMENT_INCORPORATION.agc:362
//		VLOAD	VAD		# START 3RD PHASE OF INCORP2
// slot 33713
    33713, 44538,
// MEASUREMENT_INCORPORATION.agc:363
//			X789		# 7TH,8TH,9TH,COMPONENT OF STATE VECTOR
// slot 33714
    33714, 1922,
// MEASUREMENT_INCORPORATION.agc:364
//			DELTAX +12D	# INCORPORATION FOR X789
// slot 33715
    33715, 1398,
// MEASUREMENT_INCORPORATION.agc:365
//		STORE	TX789
// slot 33716
    33716, 3664,
// MEASUREMENT_INCORPORATION.agc:366
//		BON	RTB
// slot 33717
    33717, 39960,
// MEASUREMENT_INCORPORATION.agc:367
//			VEHUPFLG
// slot 33718
    33718, 910,
// MEASUREMENT_INCORPORATION.agc:368
//			DOCSM
// slot 33719
    33719, 63454,
// MEASUREMENT_INCORPORATION.agc:369
//			MOVEPLEM
// slot 33720
    33720, 23576,
// MEASUREMENT_INCORPORATION.agc:370
//FAZAB		BOVB	AXT,2
// slot 33721
    33721, 64520,
// MEASUREMENT_INCORPORATION.agc:371
//			TCDANZIG
// slot 33722
    33722, 48596,
// MEASUREMENT_INCORPORATION.agc:372
//			0
// slot 33723
    33723, 0,
// MEASUREMENT_INCORPORATION.agc:373
//		BOFF	AXT,2
// slot 33724
    33724, 64536,
// MEASUREMENT_INCORPORATION.agc:374
//			MOONTHIS
// slot 33725
    33725, 4550,
// MEASUREMENT_INCORPORATION.agc:375
//			+2
// slot 33726
    33726, 63360,
// MEASUREMENT_INCORPORATION.agc:376
//			2
// slot 33727
    33727, 4,
// MEASUREMENT_INCORPORATION.agc:377
//		VLOAD	VSR*
// slot 33728
    33728, 45050,
// MEASUREMENT_INCORPORATION.agc:378
//			DELTAX		# B27 IF MOON ORBIT, B29 IF EARTH
// slot 33729
    33729, 1374,
// MEASUREMENT_INCORPORATION.agc:379
//			0 -7,2
// slot 33730
    33730, 48394,
// MEASUREMENT_INCORPORATION.agc:380
//		VAD	BOV
// slot 33731
    33731, 32858,
// MEASUREMENT_INCORPORATION.agc:381
//			TDELTAV
// slot 33732
    33732, 1698,
// MEASUREMENT_INCORPORATION.agc:382
//			FAZAB1
// slot 33733
    33733, 63390,
// MEASUREMENT_INCORPORATION.agc:383
//		STOVL	TDELTAV
// slot 33734
    33734, 22178,
// MEASUREMENT_INCORPORATION.agc:384
//			DELTAX +6	# B5 IF MOON ORBIT, B7 IF EARTH
// slot 33735
    33735, 1386,
// MEASUREMENT_INCORPORATION.agc:385
//		VSR*	VAD
// slot 33736
    33736, 44382,
// MEASUREMENT_INCORPORATION.agc:386
//			0 -4,2
// slot 33737
    33737, 48388,
// MEASUREMENT_INCORPORATION.agc:387
//			TNUV
// slot 33738
    33738, 1710,
// MEASUREMENT_INCORPORATION.agc:388
//		BOV
// slot 33739
    33739, 65280,
// MEASUREMENT_INCORPORATION.agc:389
//			FAZAB2
// slot 33740
    33740, 63398,
// MEASUREMENT_INCORPORATION.agc:390
//		STCALL	TNUV
// slot 33741
    33741, 30382,
// MEASUREMENT_INCORPORATION.agc:391
//			FAZAB3
// slot 33742
    33742, 63412,
// MEASUREMENT_INCORPORATION.agc:392
//FAZAB1		VLOAD	VAD
// slot 33743
    33743, 44538,
// MEASUREMENT_INCORPORATION.agc:393
//			RCV
// slot 33744
    33744, 1722,
// MEASUREMENT_INCORPORATION.agc:394
//			DELTAX
// slot 33745
    33745, 1374,
// MEASUREMENT_INCORPORATION.agc:395
//		STORE	RCV
// slot 33746
    33746, 1722,
// MEASUREMENT_INCORPORATION.agc:396
//FAZAB2		VLOAD	VAD
// slot 33747
    33747, 44538,
// MEASUREMENT_INCORPORATION.agc:397
//			VCV
// slot 33748
    33748, 1734,
// MEASUREMENT_INCORPORATION.agc:398
//			DELTAX +6
// slot 33749
    33749, 1386,
// MEASUREMENT_INCORPORATION.agc:399
//		STORE	VCV
// slot 33750
    33750, 1734,
// MEASUREMENT_INCORPORATION.agc:400
//		SXA,2	CALL
// slot 33751
    33751, 38072,
// MEASUREMENT_INCORPORATION.agc:401
//			PBODY
// slot 33752
    33752, 2256,
// MEASUREMENT_INCORPORATION.agc:402
//			RECTIFY
// slot 33753
    33753, 20002,
// MEASUREMENT_INCORPORATION.agc:403
//FAZAB3		CALL
// slot 33754
    33754, 65320,
// MEASUREMENT_INCORPORATION.agc:404
//			GRP2PC
// slot 33755
    33755, 48080,
// MEASUREMENT_INCORPORATION.agc:405
//		BON	RTB
// slot 33756
    33756, 39960,
// MEASUREMENT_INCORPORATION.agc:406
//			VEHUPFLG
// slot 33757
    33757, 910,
// MEASUREMENT_INCORPORATION.agc:407
//			DOCSM1
// slot 33758
    33758, 63460,
// MEASUREMENT_INCORPORATION.agc:408
//			MOVEALEM
// slot 33759
    33759, 23542,
// MEASUREMENT_INCORPORATION.agc:409
//		CALL
// slot 33760
    33760, 65320,
// MEASUREMENT_INCORPORATION.agc:410
//			SVDWN2		# STORE DOWNLINK STATE VECTOR
// slot 33761
    33761, 16742,
// MEASUREMENT_INCORPORATION.agc:411
//FAZAB4		CALL
// slot 33762
    33762, 65320,
// MEASUREMENT_INCORPORATION.agc:412
//# Page 1260
// MEASUREMENT_INCORPORATION.agc:413
//			GRP2PC		# PHASE CHANGE
// slot 33763
    33763, 48080,
// MEASUREMENT_INCORPORATION.agc:414
//		BOFF	VLOAD
// slot 33764
    33764, 64792,
// MEASUREMENT_INCORPORATION.agc:415
//			DMENFLG
// slot 33765
    33765, 3020,
// MEASUREMENT_INCORPORATION.agc:416
//			FAZAB5		# 6 DIMENSIONAL
// slot 33766
    33766, 63442,
// MEASUREMENT_INCORPORATION.agc:417
//			TX789		# 9 DIMENSIONAL
// slot 33767
    33767, 3664,
// MEASUREMENT_INCORPORATION.agc:418
//		STORE	X789
// slot 33768
    33768, 1922,
// MEASUREMENT_INCORPORATION.agc:419
//FAZAB5		LXA,1	SXA,1
// slot 33769
    33769, 55504,
// MEASUREMENT_INCORPORATION.agc:420
//			EGRESS
// slot 33770
    33770, 2462,
// MEASUREMENT_INCORPORATION.agc:421
//			QPRET
// slot 33771
    33771, 84,
// MEASUREMENT_INCORPORATION.agc:422
//		EXIT
// slot 33772
    33772, 65532
)).

// bank 36, slots 33773-33773
function agcAotUnit1878 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// MEASUREMENT_INCORPORATION.agc:423
//		TC	POSTJUMP	# EXIT
// slot 33773
    if slot <> 33773 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1878] to agcAotUnit1878@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:424
//		CADR	INTWAKE
// slot 33774
    33774, 24158,
// MEASUREMENT_INCORPORATION.agc:425
//DOCSM		RTB	GOTO
// slot 33775
    33775, 43064,
// MEASUREMENT_INCORPORATION.agc:426
//			MOVEPCSM
// slot 33776
    33776, 23502,
// MEASUREMENT_INCORPORATION.agc:427
//			FAZAB
// slot 33777
    33777, 63346,
// MEASUREMENT_INCORPORATION.agc:428
//DOCSM1		RTB	CALL
// slot 33778
    33778, 37944,
// MEASUREMENT_INCORPORATION.agc:429
//			MOVEACSM
// slot 33779
    33779, 23456,
// MEASUREMENT_INCORPORATION.agc:430
//			SVDWN1		# STORE DOWNLINK STATE VECTOR
// slot 33780
    33780, 16702,
// MEASUREMENT_INCORPORATION.agc:431
//		GOTO
// slot 33781
    33781, 65360,
// MEASUREMENT_INCORPORATION.agc:432
//			FAZAB4
// slot 33782
    33782, 63428,
// MEASUREMENT_INCORPORATION.agc:433
//ZEROD		=	ZEROVECS
// MEASUREMENT_INCORPORATION.agc:434
//54DD		DEC	54
// slot 33783
    33783, 108,
// MEASUREMENT_INCORPORATION.agc:435
//6DD		DEC	-6
// slot 33784
    33784, 65522,
// MEASUREMENT_INCORPORATION.agc:436
//12DD		DEC	12
// slot 33785
    33785, 24,
// MEASUREMENT_INCORPORATION.agc:437
//		SETLOC	MEASINC2
// MEASUREMENT_INCORPORATION.agc:438
//		BANK
// MEASUREMENT_INCORPORATION.agc:439
//		COUNT*	$$/INCOR
// MEASUREMENT_INCORPORATION.agc:440
//
// MEASUREMENT_INCORPORATION.agc:441
//NEWZCOMP	VLOAD	ABVAL
// slot 15103
    15103, 42746,
// MEASUREMENT_INCORPORATION.agc:442
//			ZI
// slot 15104
    15104, 2982,
// MEASUREMENT_INCORPORATION.agc:443
//		STOVL	NORMZI
// slot 15105
    15105, 20554,
// MEASUREMENT_INCORPORATION.agc:444
//			ZI +6
// slot 15106
    15106, 2994,
// MEASUREMENT_INCORPORATION.agc:445
//		ABVAL	PUSH
// slot 15107
    15107, 34380,
// MEASUREMENT_INCORPORATION.agc:446
//		DSU	BMN
// slot 15108
    15108, 41002,
// MEASUREMENT_INCORPORATION.agc:447
//			NORMZI
// slot 15109
    15109, 74,
// MEASUREMENT_INCORPORATION.agc:448
//			+3
// slot 15110
    15110, 26130,
// MEASUREMENT_INCORPORATION.agc:449
//		DLOAD	STADR
// slot 15111
    15111, 38602,
// MEASUREMENT_INCORPORATION.agc:450
//		STORE	NORMZI
// slot 15112
    15112, 65460,
// MEASUREMENT_INCORPORATION.agc:451
//		VLOAD	ABVAL
// slot 15113
    15113, 42746,
// MEASUREMENT_INCORPORATION.agc:452
//			ZI +12D
// slot 15114
    15114, 3006,
// MEASUREMENT_INCORPORATION.agc:453
//		PUSH	DSU
// slot 15115
    15115, 38156,
// MEASUREMENT_INCORPORATION.agc:454
//			NORMZI
// slot 15116
    15116, 74,
// MEASUREMENT_INCORPORATION.agc:455
//		BMN	DLOAD
// slot 15117
    15117, 58688,
// MEASUREMENT_INCORPORATION.agc:456
//			NEWZCMP1
// slot 15118
    15118, 61242,
// MEASUREMENT_INCORPORATION.agc:457
//		STADR
// slot 15119
    15119, 65324,
// MEASUREMENT_INCORPORATION.agc:458
//		STCALL	NORMZI		# LARGEST ABVAL
// slot 15120
    15120, 36788,
// MEASUREMENT_INCORPORATION.agc:459
//			NEWZCMP1
// slot 15121
    15121, 61242,
// MEASUREMENT_INCORPORATION.agc:460
//
// MEASUREMENT_INCORPORATION.agc:461
//		SETLOC	MEASINC3
// MEASUREMENT_INCORPORATION.agc:462
//		BANK
// MEASUREMENT_INCORPORATION.agc:463
//# Page 1261
// MEASUREMENT_INCORPORATION.agc:464
//NEWZCMP1		DLOAD	SXA,1
// slot 32669
    32669, 55498,
// MEASUREMENT_INCORPORATION.agc:465
//			NORMZI
// slot 32670
    32670, 74,
// MEASUREMENT_INCORPORATION.agc:466
//			NORMZI		# SAVE X1
// slot 32671
    32671, 72,
// MEASUREMENT_INCORPORATION.agc:467
//		NORM	INCR,1
// slot 32672
    32672, 51330,
// MEASUREMENT_INCORPORATION.agc:468
//			X1
// slot 32673
    32673, 78,
// MEASUREMENT_INCORPORATION.agc:469
//		DEC	2
// slot 32674
    32674, 4,
// MEASUREMENT_INCORPORATION.agc:470
//		VLOAD	VSL*
// slot 32675
    32675, 45050,
// MEASUREMENT_INCORPORATION.agc:471
//			ZI
// slot 32676
    32676, 2982,
// MEASUREMENT_INCORPORATION.agc:472
//			0,1
// slot 32677
    32677, 16642,
// MEASUREMENT_INCORPORATION.agc:473
//		STOVL	ZI
// slot 32678
    32678, 23462,
// MEASUREMENT_INCORPORATION.agc:474
//			ZI +6
// slot 32679
    32679, 2994,
// MEASUREMENT_INCORPORATION.agc:475
//		VSL*
// slot 32680
    32680, 65374,
// MEASUREMENT_INCORPORATION.agc:476
//			0,1
// slot 32681
    32681, 16642,
// MEASUREMENT_INCORPORATION.agc:477
//		STOVL	ZI +6
// slot 32682
    32682, 23474,
// MEASUREMENT_INCORPORATION.agc:478
//			ZI +12D
// slot 32683
    32683, 3006,
// MEASUREMENT_INCORPORATION.agc:479
//		VSL*	SXA,1
// slot 32684
    32684, 55390,
// MEASUREMENT_INCORPORATION.agc:480
//			0,1
// slot 32685
    32685, 16642,
// MEASUREMENT_INCORPORATION.agc:481
//			NORMZI +1	# SAVE SHIFT
// slot 32686
    32686, 74,
// MEASUREMENT_INCORPORATION.agc:482
//		STORE	ZI +12D
// slot 32687
    32687, 3006,
// MEASUREMENT_INCORPORATION.agc:483
//		LXA,1	XSU,1
// slot 32688
    32688, 45264,
// MEASUREMENT_INCORPORATION.agc:484
//			NORMGAM
// slot 32689
    32689, 2330,
// MEASUREMENT_INCORPORATION.agc:485
//			NORMZI +1
// slot 32690
    32690, 74,
// MEASUREMENT_INCORPORATION.agc:486
//		XSU,1
// slot 32691
    32691, 65376,
// MEASUREMENT_INCORPORATION.agc:487
//			NORMZI +1
// slot 32692
    32692, 74,
// MEASUREMENT_INCORPORATION.agc:488
//		SXA,1	LXC,1
// slot 32693
    32693, 57520,
// MEASUREMENT_INCORPORATION.agc:489
//			NORMGAM
// slot 32694
    32694, 2330,
// MEASUREMENT_INCORPORATION.agc:490
//			NORMZI +1
// slot 32695
    32695, 74,
// MEASUREMENT_INCORPORATION.agc:491
//		XAD,1	SETPD
// slot 32696
    32696, 33136,
// MEASUREMENT_INCORPORATION.agc:492
//			NORMZI
// slot 32697
    32697, 72,
// MEASUREMENT_INCORPORATION.agc:493
//			2D
// slot 32698
    32698, 6,
// MEASUREMENT_INCORPORATION.agc:494
//		GOTO
// slot 32699
    32699, 65360,
// MEASUREMENT_INCORPORATION.agc:495
//			INCOR2 -3
// slot 32700
    32700, 62996
)).

// no code for the lines below
// MEASUREMENT_INCORPORATION.agc:496
//NORMZI		=	36D
