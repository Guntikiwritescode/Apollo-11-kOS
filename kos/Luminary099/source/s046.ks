// MEASUREMENT_INCORPORATION.agc
agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:1
//# Copyright:	Public domain.
// MEASUREMENT_INCORPORATION.agc:2
//# Filename:	MEASUREMENT_INCORPORATION.agc
// MEASUREMENT_INCORPORATION.agc:3
//# Purpose:	Part of the source code for Luminary 1A build 099.
// MEASUREMENT_INCORPORATION.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// MEASUREMENT_INCORPORATION.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// MEASUREMENT_INCORPORATION.agc:6
//#
// MEASUREMENT_INCORPORATION.agc:7
//# Assembler:	yaYUL
// MEASUREMENT_INCORPORATION.agc:8
//# Contact:	Jim Lawton <jim DOT lawton AT gmail DOT com>
// MEASUREMENT_INCORPORATION.agc:9
//# Website:	www.ibiblio.org/apollo.
// MEASUREMENT_INCORPORATION.agc:10
//# Pages:	1149-1158
// MEASUREMENT_INCORPORATION.agc:11
//# Mod history:	2009-05-28 JL	Updated from page images.
// MEASUREMENT_INCORPORATION.agc:12
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// MEASUREMENT_INCORPORATION.agc:13
//#
// MEASUREMENT_INCORPORATION.agc:14
//# This source code has been transcribed or otherwise adapted from digitized
// MEASUREMENT_INCORPORATION.agc:15
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// MEASUREMENT_INCORPORATION.agc:16
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// MEASUREMENT_INCORPORATION.agc:17
//# thanks to both.  The images (with suitable reduction in storage size and
// MEASUREMENT_INCORPORATION.agc:18
//# consequent reduction in image quality as well) are available online at
// MEASUREMENT_INCORPORATION.agc:19
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// MEASUREMENT_INCORPORATION.agc:20
//# illegible, contact me at info@sandroid.org about getting access to the
// MEASUREMENT_INCORPORATION.agc:21
//# (much) higher-quality images which Paul actually created.
// MEASUREMENT_INCORPORATION.agc:22
//#
// MEASUREMENT_INCORPORATION.agc:23
//# Notations on the hardcopy document read, in part:
// MEASUREMENT_INCORPORATION.agc:24
//#
// MEASUREMENT_INCORPORATION.agc:25
//#    Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// MEASUREMENT_INCORPORATION.agc:26
//#    16:27 JULY 14, 1969
// MEASUREMENT_INCORPORATION.agc:27
//
// MEASUREMENT_INCORPORATION.agc:28
//# Page 1149
// MEASUREMENT_INCORPORATION.agc:29
//# INCORP1 -- PERFORMS THE SIX DIMENSIONAL STATE VECTOR DEVIATION FOR POSITION
// MEASUREMENT_INCORPORATION.agc:30
//# AND VELOCITY OR THE NINE-DIMENSIONAL DEVIATION OF POSITION, VELOCITY, AND
// MEASUREMENT_INCORPORATION.agc:31
//# RADAR OR LANDMARK BIAS. THE OUTPUT OF THE BVECTOR ROUTINE ALONG WITH THE
// MEASUREMENT_INCORPORATION.agc:32
//# ERROR TRANSITION MATRIX (W) ARE USED AS INPU TO THE ROUTINE. THE DEVIATION
// MEASUREMENT_INCORPORATION.agc:33
//# IS OBTAINED BY COMPUTING AN ESTIMATED TRACKING MEASUREMENT FROM THE
// MEASUREMENT_INCORPORATION.agc:34
//# CURRENT STATE VECTOR AND COMPARING IT WITH AN ACTUAL TRACKING MEASUREMENT
// MEASUREMENT_INCORPORATION.agc:35
//# AND APPLYING A STATISTICAL WEIGHTING VECTOR.
// MEASUREMENT_INCORPORATION.agc:36
//#
// MEASUREMENT_INCORPORATION.agc:37
//# INPUT
// MEASUREMENT_INCORPORATION.agc:38
//#	 DMENFLG = 0 (6-DIMENSIONAL BVECTOR), =1 (9-DIMENSIONAL)
// MEASUREMENT_INCORPORATION.agc:39
//#	       W = ERROR TRANSITION MATRIX 6X6 OR 9X9
// MEASUREMENT_INCORPORATION.agc:40
//#	VARIANCE = VARIANCE (SCALAR)
// MEASUREMENT_INCORPORATION.agc:41
//#	  DELTAQ = MEASURED DEVIATION (SCALAR)
// MEASUREMENT_INCORPORATION.agc:42
//#	 BVECTOR = 6 OR 9 DIMENSIONAL BVECTOR
// MEASUREMENT_INCORPORATION.agc:43
//#
// MEASUREMENT_INCORPORATION.agc:44
//# OUTPUT
// MEASUREMENT_INCORPORATION.agc:45
//#	  DELTAX = STATE VECTOR DEVIATIONS 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:46
//#	      ZI = VECTOR USED FOR THE INCORPORATION 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:47
//#	   GAMMA = SCALAR
// MEASUREMENT_INCORPORATION.agc:48
//#	   OMEGA = OMEGA WEIGHTING VECTOR 6 OR 9 DIMENSIONAL
// MEASUREMENT_INCORPORATION.agc:49
//#
// MEASUREMENT_INCORPORATION.agc:50
//# CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:51
//#	L	CALL 	INCORP1
// MEASUREMENT_INCORPORATION.agc:52
//#
// MEASUREMENT_INCORPORATION.agc:53
//# NORMAL EXIT
// MEASUREMENT_INCORPORATION.agc:54
//#	L+1 OF CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:55
//
// MEASUREMENT_INCORPORATION.agc:56
//		BANK	37
// MEASUREMENT_INCORPORATION.agc:57
//		SETLOC	MEASINC
// MEASUREMENT_INCORPORATION.agc:58
//		BANK
// MEASUREMENT_INCORPORATION.agc:59
//
// MEASUREMENT_INCORPORATION.agc:60
//		COUNT*	$$/INCOR
// MEASUREMENT_INCORPORATION.agc:61
//
// MEASUREMENT_INCORPORATION.agc:62
//		EBANK=	W
// MEASUREMENT_INCORPORATION.agc:63
//
// MEASUREMENT_INCORPORATION.agc:64
//INCORP1		STQ
// slot 21849
    21849, 65312,
// MEASUREMENT_INCORPORATION.agc:65
//			EGRESS
// slot 21850
    21850, 3060,
// MEASUREMENT_INCORPORATION.agc:66
//		AXT,1	SSP
// slot 21851
    21851, 55792,
// MEASUREMENT_INCORPORATION.agc:67
//			54D
// slot 21852
    21852, 108,
// MEASUREMENT_INCORPORATION.agc:68
//			S1
// slot 21853
    21853, 82,
// MEASUREMENT_INCORPORATION.agc:69
//			18D		# IX1 = 54 	S1= 18
// slot 21854
    21854, 36,
// MEASUREMENT_INCORPORATION.agc:70
//		AXT,2	SSP
// slot 21855
    21855, 55800,
// MEASUREMENT_INCORPORATION.agc:71
//			18D
// slot 21856
    21856, 36,
// MEASUREMENT_INCORPORATION.agc:72
//			S2
// slot 21857
    21857, 84,
// MEASUREMENT_INCORPORATION.agc:73
//			6		# IX2 = 18	S2=6
// slot 21858
    21858, 12,
// MEASUREMENT_INCORPORATION.agc:74
//Z123		VLOAD	MXV*
// slot 21859
    21859, 53242,
// MEASUREMENT_INCORPORATION.agc:75
//			BVECTOR		# BVECTOR (0)
// slot 21860
    21860, 3754,
// MEASUREMENT_INCORPORATION.agc:76
//			W +54D,1
// slot 21861
    21861, 2670,
// MEASUREMENT_INCORPORATION.agc:77
//		STORE	ZI +18D,2
// slot 21862
    21862, 11114,
// MEASUREMENT_INCORPORATION.agc:78
//		VLOAD
// slot 21863
    21863, 65530,
// MEASUREMENT_INCORPORATION.agc:79
//			BVECTOR +6	# BVECTOR (1)
// slot 21864
    21864, 3766,
// MEASUREMENT_INCORPORATION.agc:80
//# Page 1150
// MEASUREMENT_INCORPORATION.agc:81
//		MXV*	VAD*
// slot 21865
    21865, 43934,
// MEASUREMENT_INCORPORATION.agc:82
//			W +108D,1
// slot 21866
    21866, 2778,
// MEASUREMENT_INCORPORATION.agc:83
//			ZI +18D,2
// slot 21867
    21867, 62612,
// MEASUREMENT_INCORPORATION.agc:84
//		STORE	ZI +18D,2
// slot 21868
    21868, 11114,
// MEASUREMENT_INCORPORATION.agc:85
//		VLOAD
// slot 21869
    21869, 65530,
// MEASUREMENT_INCORPORATION.agc:86
//			BVECTOR +12D	# BVECTOR (2)
// slot 21870
    21870, 3778,
// MEASUREMENT_INCORPORATION.agc:87
//		MXV*	VAD*
// slot 21871
    21871, 43934,
// MEASUREMENT_INCORPORATION.agc:88
//			W +162D,1
// slot 21872
    21872, 2886,
// MEASUREMENT_INCORPORATION.agc:89
//			ZI +18D,2	# B(0)*W+B(1)*(W+54)+B(2)*(W+108) FIRST PASS
// slot 21873
    21873, 62612,
// MEASUREMENT_INCORPORATION.agc:90
//		STORE	ZI +18D,2	# ZI THEN Z2 THEN Z3
// slot 21874
    21874, 11114,
// MEASUREMENT_INCORPORATION.agc:91
//		TIX,1
// slot 21875
    21875, 65408,
// MEASUREMENT_INCORPORATION.agc:92
//			INCOR1
// slot 21876
    21876, 39658,
// MEASUREMENT_INCORPORATION.agc:93
//INCOR1		TIX,2	BON
// slot 21877
    21877, 35976,
// MEASUREMENT_INCORPORATION.agc:94
//			Z123		# LOOP FOR Z1,Z2,Z3
// slot 21878
    21878, 39622,
// MEASUREMENT_INCORPORATION.agc:95
//			DMENFLG
// slot 21879
    21879, 2956,
// MEASUREMENT_INCORPORATION.agc:96
//			INCOR1A
// slot 21880
    21880, 39672,
// MEASUREMENT_INCORPORATION.agc:97
//		VLOAD
// slot 21881
    21881, 65530,
// MEASUREMENT_INCORPORATION.agc:98
//			ZEROVECS
// slot 21882
    21882, 6820,
// MEASUREMENT_INCORPORATION.agc:99
//		STORE	ZI +12D
// slot 21883
    21883, 2910,
// MEASUREMENT_INCORPORATION.agc:100
//INCOR1A		SETPD	VLOAD
// slot 21884
    21884, 64770,
// MEASUREMENT_INCORPORATION.agc:101
//			0
// slot 21885
    21885, 2,
// MEASUREMENT_INCORPORATION.agc:102
//			ZI
// slot 21886
    21886, 2886,
// MEASUREMENT_INCORPORATION.agc:103
//		VSQ	RTB
// slot 21887
    21887, 39996,
// MEASUREMENT_INCORPORATION.agc:104
//			TPMODE
// slot 21888
    21888, 18230,
// MEASUREMENT_INCORPORATION.agc:105
//		PDVL	VSQ
// slot 21889
    21889, 40602,
// MEASUREMENT_INCORPORATION.agc:106
//			ZI +6
// slot 21890
    21890, 2898,
// MEASUREMENT_INCORPORATION.agc:107
//		RTB	TAD
// slot 21891
    21891, 63800,
// MEASUREMENT_INCORPORATION.agc:108
//			TPMODE
// slot 21892
    21892, 18230,
// MEASUREMENT_INCORPORATION.agc:109
//		PDVL	VSQ
// slot 21893
    21893, 40602,
// MEASUREMENT_INCORPORATION.agc:110
//			ZI +12D
// slot 21894
    21894, 2910,
// MEASUREMENT_INCORPORATION.agc:111
//		RTB	TAD
// slot 21895
    21895, 63800,
// MEASUREMENT_INCORPORATION.agc:112
//			TPMODE
// slot 21896
    21896, 18230,
// MEASUREMENT_INCORPORATION.agc:113
//		TAD	AXT,2
// slot 21897
    21897, 64754,
// MEASUREMENT_INCORPORATION.agc:114
//			VARIANCE
// slot 21898
    21898, 2958,
// MEASUREMENT_INCORPORATION.agc:115
//			0
// slot 21899
    21899, 0,
// MEASUREMENT_INCORPORATION.agc:116
//		STORE	TRIPA		# ZI*2 + Z2*2 + Z3*2 + VARIANCE
// slot 21900
    21900, 2922,
// MEASUREMENT_INCORPORATION.agc:117
//		TLOAD	BOV
// slot 21901
    21901, 32978,
// MEASUREMENT_INCORPORATION.agc:118
//			VARIANCE	# CLEAR OVFIND
// slot 21902
    21902, 2958,
// MEASUREMENT_INCORPORATION.agc:119
//			+1
// slot 21903
    21903, 39712,
// MEASUREMENT_INCORPORATION.agc:120
//		STORE	TEMPVAR		# TEMP STORAGE FOR VARIANCE
// slot 21904
    21904, 2928,
// MEASUREMENT_INCORPORATION.agc:121
//		BZE
// slot 21905
    21905, 65368,
// MEASUREMENT_INCORPORATION.agc:122
//			INCOR1C
// slot 21906
    21906, 39730,
// MEASUREMENT_INCORPORATION.agc:123
//INCOR1B		SL2	BOV
// slot 21907
    21907, 32916,
// MEASUREMENT_INCORPORATION.agc:124
//			INCOR1C
// slot 21908
    21908, 39730,
// MEASUREMENT_INCORPORATION.agc:125
//		STORE	TEMPVAR
// slot 21909
    21909, 2928,
// MEASUREMENT_INCORPORATION.agc:126
//		INCR,2	GOTO
// slot 21910
    21910, 43160,
// MEASUREMENT_INCORPORATION.agc:127
//		DEC	1
// slot 21911
    21911, 2,
// MEASUREMENT_INCORPORATION.agc:128
//			INCOR1B
// slot 21912
    21912, 39718
)).

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:129
//INCOR1C		TLOAD	ROUND
// slot 21913
    21913, 50898,
// MEASUREMENT_INCORPORATION.agc:130
//			TRIPA
// slot 21914
    21914, 2922,
// MEASUREMENT_INCORPORATION.agc:131
//# Page 1151
// MEASUREMENT_INCORPORATION.agc:132
//		DMP	SQRT
// slot 21915
    21915, 62986,
// MEASUREMENT_INCORPORATION.agc:133
//			TEMPVAR
// slot 21916
    21916, 2928,
// MEASUREMENT_INCORPORATION.agc:134
//		SL*	TAD
// slot 21917
    21917, 63838,
// MEASUREMENT_INCORPORATION.agc:135
//			0,2
// slot 21918
    21918, 48892,
// MEASUREMENT_INCORPORATION.agc:136
//			TRIPA
// slot 21919
    21919, 2922,
// MEASUREMENT_INCORPORATION.agc:137
//		NORM	INCR,2
// slot 21920
    21920, 52354,
// MEASUREMENT_INCORPORATION.agc:138
//			X2
// slot 21921
    21921, 80,
// MEASUREMENT_INCORPORATION.agc:139
//		DEC	-2
// slot 21922
    21922, 65530,
// MEASUREMENT_INCORPORATION.agc:140
//		SXA,2	AXT,2
// slot 21923
    21923, 64696,
// MEASUREMENT_INCORPORATION.agc:141
//			NORMGAM		# NORMALIZATION COUNT -2 FOR GAMMA
// slot 21924
    21924, 2182,
// MEASUREMENT_INCORPORATION.agc:142
//			162D
// slot 21925
    21925, 324,
// MEASUREMENT_INCORPORATION.agc:143
//		BDDV	SETPD
// slot 21926
    21926, 33130,
// MEASUREMENT_INCORPORATION.agc:144
//			DP1/4TH
// slot 21927
    21927, 6804,
// MEASUREMENT_INCORPORATION.agc:145
//			0
// slot 21928
    21928, 2,
// MEASUREMENT_INCORPORATION.agc:146
//		STORE	GAMMA
// slot 21929
    21929, 3712,
// MEASUREMENT_INCORPORATION.agc:147
//		TLOAD	NORM
// slot 21930
    21930, 49618,
// MEASUREMENT_INCORPORATION.agc:148
//			TRIPA
// slot 21931
    21931, 2922,
// MEASUREMENT_INCORPORATION.agc:149
//			X1
// slot 21932
    21932, 78,
// MEASUREMENT_INCORPORATION.agc:150
//		DLOAD	PDDL		# PD 0-1 = NORM (A)
// slot 21933
    21933, 54730,
// MEASUREMENT_INCORPORATION.agc:151
//			MPAC
// slot 21934
    21934, 218,
// MEASUREMENT_INCORPORATION.agc:152
//			DELTAQ
// slot 21935
    21935, 3790,
// MEASUREMENT_INCORPORATION.agc:153
//		NORM
// slot 21936
    21936, 65410,
// MEASUREMENT_INCORPORATION.agc:154
//			S1
// slot 21937
    21937, 82,
// MEASUREMENT_INCORPORATION.agc:155
//		XSU,1	SR1
// slot 21938
    21938, 57952,
// MEASUREMENT_INCORPORATION.agc:156
//			S1
// slot 21939
    21939, 80,
// MEASUREMENT_INCORPORATION.agc:157
//		DDV	PUSH		# PD 0-1 = DELTAQ/A
// slot 21940
    21940, 34418,
// MEASUREMENT_INCORPORATION.agc:158
//		GOTO
// slot 21941
    21941, 65360,
// MEASUREMENT_INCORPORATION.agc:159
//			NEWZCOMP
// slot 21942
    21942, 38802,
// MEASUREMENT_INCORPORATION.agc:160
// -3		SSP
// slot 21943
    21943, 65458,
// MEASUREMENT_INCORPORATION.agc:161
//			S2
// slot 21944
    21944, 84,
// MEASUREMENT_INCORPORATION.agc:162
//			54D
// slot 21945
    21945, 108,
// MEASUREMENT_INCORPORATION.agc:163
//INCOR2		VLOAD	VXM*		# COMPUT OMEGA1,2,3
// slot 21946
    21946, 50170,
// MEASUREMENT_INCORPORATION.agc:164
//			ZI
// slot 21947
    21947, 2886,
// MEASUREMENT_INCORPORATION.agc:165
//			W +162D,2
// slot 21948
    21948, 62648,
// MEASUREMENT_INCORPORATION.agc:166
//		PUSH	VLOAD
// slot 21949
    21949, 64780,
// MEASUREMENT_INCORPORATION.agc:167
//			ZI +6
// slot 21950
    21950, 2898,
// MEASUREMENT_INCORPORATION.agc:168
//		VXM*	VAD
// slot 21951
    21951, 44422,
// MEASUREMENT_INCORPORATION.agc:169
//			W +180D,2
// slot 21952
    21952, 62612,
// MEASUREMENT_INCORPORATION.agc:170
//		PUSH	VLOAD
// slot 21953
    21953, 64780,
// MEASUREMENT_INCORPORATION.agc:171
//			ZI +12D
// slot 21954
    21954, 2910,
// MEASUREMENT_INCORPORATION.agc:172
//		VXM*	VAD
// slot 21955
    21955, 44422,
// MEASUREMENT_INCORPORATION.agc:173
//			W +198D,2
// slot 21956
    21956, 62576,
// MEASUREMENT_INCORPORATION.agc:174
//		PUSH	TIX,2		# PD 2-7=OMEGA1, 8-13=OMEGA2, 14-19=OMEGA3
// slot 21957
    21957, 50188,
// MEASUREMENT_INCORPORATION.agc:175
//			INCOR2
// slot 21958
    21958, 39796,
// MEASUREMENT_INCORPORATION.agc:176
//		VLOAD	STADR
// slot 21959
    21959, 38650,
// MEASUREMENT_INCORPORATION.agc:177
//		STORE	OMEGA +12D
// slot 21960
    21960, 61792,
// MEASUREMENT_INCORPORATION.agc:178
//		VLOAD	STADR
// slot 21961
    21961, 38650,
// MEASUREMENT_INCORPORATION.agc:179
//		STORE	OMEGA +6
// slot 21962
    21962, 61804,
// MEASUREMENT_INCORPORATION.agc:180
//		VLOAD	STADR
// slot 21963
    21963, 38650,
// MEASUREMENT_INCORPORATION.agc:181
//		STORE	OMEGA
// slot 21964
    21964, 61816,
// MEASUREMENT_INCORPORATION.agc:182
//# Page 1152
// MEASUREMENT_INCORPORATION.agc:183
//		BON	VLOAD
// slot 21965
    21965, 64792,
// MEASUREMENT_INCORPORATION.agc:184
//			DMENFLG
// slot 21966
    21966, 2956,
// MEASUREMENT_INCORPORATION.agc:185
//			INCOR2AB
// slot 21967
    21967, 39844,
// MEASUREMENT_INCORPORATION.agc:186
//			ZEROVECS
// slot 21968
    21968, 6820,
// MEASUREMENT_INCORPORATION.agc:187
//		STORE	OMEGA +12D
// slot 21969
    21969, 3742,
// MEASUREMENT_INCORPORATION.agc:188
//INCOR2AB	AXT,2	SSP
// slot 21970
    21970, 55800,
// MEASUREMENT_INCORPORATION.agc:189
//			18D
// slot 21971
    21971, 36,
// MEASUREMENT_INCORPORATION.agc:190
//			S2
// slot 21972
    21972, 84,
// MEASUREMENT_INCORPORATION.agc:191
//			6
// slot 21973
    21973, 12,
// MEASUREMENT_INCORPORATION.agc:192
//INCOR3		VLOAD*
// slot 21974
    21974, 65526,
// MEASUREMENT_INCORPORATION.agc:193
//			OMEGA +18D,2
// slot 21975
    21975, 61780,
// MEASUREMENT_INCORPORATION.agc:194
//		VXSC	VSL*
// slot 21976
    21976, 45026,
// MEASUREMENT_INCORPORATION.agc:195
//			0		# DELTAQ/A
// slot 21977
    21977, 2,
// MEASUREMENT_INCORPORATION.agc:196
//			0,1
// slot 21978
    21978, 16642,
// MEASUREMENT_INCORPORATION.agc:197
//		STORE	DELTAX +18D,2
// slot 21979
    21979, 11150,
// MEASUREMENT_INCORPORATION.agc:198
//		TIX,2	VLOAD
// slot 21980
    21980, 64904,
// MEASUREMENT_INCORPORATION.agc:199
//			INCOR3
// slot 21981
    21981, 39852,
// MEASUREMENT_INCORPORATION.agc:200
//			DELTAX +6
// slot 21982
    21982, 2934,
// MEASUREMENT_INCORPORATION.agc:201
//		VSL3
// slot 21983
    21983, 65460,
// MEASUREMENT_INCORPORATION.agc:202
//		STORE	DELTAX +6
// slot 21984
    21984, 2934,
// MEASUREMENT_INCORPORATION.agc:203
//		GOTO
// slot 21985
    21985, 65360,
// MEASUREMENT_INCORPORATION.agc:204
//			EGRESS
// slot 21986
    21986, 3060,
// MEASUREMENT_INCORPORATION.agc:205
//
// MEASUREMENT_INCORPORATION.agc:206
//# Page 1153
// MEASUREMENT_INCORPORATION.agc:207
//# INCORP2 - INCORPORATES THE COMPUTED STATE VECTOR DEVIATIONS INTO THE
// MEASUREMENT_INCORPORATION.agc:208
//# ESTIMATED STATE VECTOR. THE STATE VECTOR UPDATED MAY BE FOR EITHER THE
// MEASUREMENT_INCORPORATION.agc:209
//# LEM OR THE CSM. DETERMINED BY FLAG VEHUPFLG. (ZERO = LEM) (1 = CSM)
// MEASUREMENT_INCORPORATION.agc:210
//#
// MEASUREMENT_INCORPORATION.agc:211
//# INPUT
// MEASUREMENT_INCORPORATION.agc:212
//#	PERMANENT STATE VECTOR FOR EITHER THE LEM OR CSM
// MEASUREMENT_INCORPORATION.agc:213
//#	VEHUPFLG = UPDATE VEHICLE 0=LEM  1=CSM
// MEASUREMENT_INCORPORATION.agc:214
//#	W = ERROR TRANSITION MATRIX
// MEASUREMENT_INCORPORATION.agc:215
//#	DELTAX = COMPUTED STATE VECTOR DEVIATIONS
// MEASUREMENT_INCORPORATION.agc:216
//# 	DMENFLG = SIZE OF W MATRIX (ZERO=6X6) (1=9X9)
// MEASUREMENT_INCORPORATION.agc:217
//#	GAMMA = SCALAR FOR INCORPORATION
// MEASUREMENT_INCORPORATION.agc:218
//# 	ZI = VECTOR USED IN INCORPORATION
// MEASUREMENT_INCORPORATION.agc:219
//#	OMEGA = WEIGHTING VECTOR
// MEASUREMENT_INCORPORATION.agc:220
//#
// MEASUREMENT_INCORPORATION.agc:221
//# OUTPUT
// MEASUREMENT_INCORPORATION.agc:222
//#	UPDATED PERMANENT STATE VECTOR
// MEASUREMENT_INCORPORATION.agc:223
//#
// MEASUREMENT_INCORPORATION.agc:224
//# CALLING SEQUENCE
// MEASUREMENT_INCORPORATION.agc:225
//#	L	CALL	INCORP2
// MEASUREMENT_INCORPORATION.agc:226
//#
// MEASUREMENT_INCORPORATION.agc:227
//# NORMAL EXIT
// MEASUREMENT_INCORPORATION.agc:228
//#	L+1 OF CALLING SEQUENCE
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
// slot 21987
    21987, 37920,
// MEASUREMENT_INCORPORATION.agc:237
//			EGRESS
// slot 21988
    21988, 3060,
// MEASUREMENT_INCORPORATION.agc:238
//			INTSTALL
// slot 21989
    21989, 24088,
// MEASUREMENT_INCORPORATION.agc:239
//		VLOAD	VXSC		# CALC. GAMMA * OMEGA1,2,3
// slot 21990
    21990, 61946,
// MEASUREMENT_INCORPORATION.agc:240
//			OMEGA
// slot 21991
    21991, 3718,
// MEASUREMENT_INCORPORATION.agc:241
//			GAMMA
// slot 21992
    21992, 3712,
// MEASUREMENT_INCORPORATION.agc:242
//		STOVL	OMEGAM1
// slot 21993
    21993, 23446,
// MEASUREMENT_INCORPORATION.agc:243
//			OMEGA +6
// slot 21994
    21994, 3730,
// MEASUREMENT_INCORPORATION.agc:244
//		VXSC
// slot 21995
    21995, 65506,
// MEASUREMENT_INCORPORATION.agc:245
//			GAMMA
// slot 21996
    21996, 3712,
// MEASUREMENT_INCORPORATION.agc:246
//		STOVL	OMEGAM2
// slot 21997
    21997, 23458,
// MEASUREMENT_INCORPORATION.agc:247
//			OMEGA +12D
// slot 21998
    21998, 3742,
// MEASUREMENT_INCORPORATION.agc:248
//		VXSC
// slot 21999
    21999, 65506,
// MEASUREMENT_INCORPORATION.agc:249
//			GAMMA
// slot 22000
    22000, 3712,
// MEASUREMENT_INCORPORATION.agc:250
//		STORE	OMEGAM3
// slot 22001
    22001, 2990,
// MEASUREMENT_INCORPORATION.agc:251
//		EXIT
// slot 22002
    22002, 65532
)).

// bank 23, slots 22003-22009
function agcAotUnit1361 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22005 {
        if slot <= 22003 {
// MEASUREMENT_INCORPORATION.agc:252
//		CAF	54DD		# INITIAL IX 1 SETTING FOR W MATRIX
// slot 22003
            if slot <> 22003 or instruction <> 13988 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1700), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22004 {
// MEASUREMENT_INCORPORATION.agc:253
//		TS	WIXA
// slot 22004
                if slot <> 22004 or instruction <> 23248 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23248, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:254
//		TS	WIXB
// slot 22005
                if slot <> 22005 or instruction <> 23249 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23249, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22007 {
            if slot <= 22006 {
// MEASUREMENT_INCORPORATION.agc:255
//		CAF	ZERO
// slot 22006
                if slot <> 22006 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:256
//		TS	ZIXA		# INITIAL IX 2 SETTING FOR Z COMPONENT
// slot 22007
                if slot <> 22007 or instruction <> 23250 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23250, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22008 {
// MEASUREMENT_INCORPORATION.agc:257
//		TS	ZIXB
// slot 22008
                if slot <> 22008 or instruction <> 23251 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23251, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:258
//FAZA		TC	PHASCHNG
// slot 22009
                if slot <> 22009 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1361] to agcAotUnit1361@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:259
//# Page 1154
// MEASUREMENT_INCORPORATION.agc:260
//		OCT	04022
// slot 22010
    22010, 4132
)).

// bank 23, slots 22011-22011
function agcAotUnit1362 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// MEASUREMENT_INCORPORATION.agc:261
//		TC	UPFLAG
// slot 22011
    if slot <> 22011 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1362] to agcAotUnit1362@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:262
//		ADRES	REINTFLG
// slot 22012
    22012, 316
)).

// bank 23, slots 22013-22017
function agcAotUnit1363 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22014 {
        if slot <= 22013 {
// MEASUREMENT_INCORPORATION.agc:263
//FAZA1		CA	WIXB		# START FIRST PHASE OF INCORP2
// slot 22013
            if slot <> 22013 or instruction <> 13009 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 721).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// MEASUREMENT_INCORPORATION.agc:264
//		TS	WIXA		# TO UPDATE 6 OR 9 DIM. W MATRIX IN TEMP
// slot 22014
            if slot <> 22014 or instruction <> 23248 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23248, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 22015 {
// MEASUREMENT_INCORPORATION.agc:265
//		CA	ZIXB
// slot 22015
            if slot <> 22015 or instruction <> 13011 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 723).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22016 {
// MEASUREMENT_INCORPORATION.agc:266
//		TS	ZIXA
// slot 22016
                if slot <> 22016 or instruction <> 23250 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23250, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:267
//		TC	INTPRET
// slot 22017
                if slot <> 22017 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1363] to agcAotUnit1363@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:268
//		LXA,1	LXA,2
// slot 22018
    22018, 60624,
// MEASUREMENT_INCORPORATION.agc:269
//			WIXA
// slot 22019
    22019, 1440,
// MEASUREMENT_INCORPORATION.agc:270
//			ZIXA
// slot 22020
    22020, 1444,
// MEASUREMENT_INCORPORATION.agc:271
//		SSP	DLOAD*
// slot 22021
    22021, 58290,
// MEASUREMENT_INCORPORATION.agc:272
//			S1
// slot 22022
    22022, 82,
// MEASUREMENT_INCORPORATION.agc:273
//			6
// slot 22023
    22023, 12,
// MEASUREMENT_INCORPORATION.agc:274
//			ZI,2
// slot 22024
    22024, 62648,
// MEASUREMENT_INCORPORATION.agc:275
//		DCOMP	NORM		# CALC UPPER 3X9 PARTITION OF W MATRIX
// slot 22025
    22025, 49532,
// MEASUREMENT_INCORPORATION.agc:276
//			S2
// slot 22026
    22026, 84,
// MEASUREMENT_INCORPORATION.agc:277
//		VXSC	XCHX,2
// slot 22027
    22027, 54498,
// MEASUREMENT_INCORPORATION.agc:278
//			OMEGAM1
// slot 22028
    22028, 2966,
// MEASUREMENT_INCORPORATION.agc:279
//			S2
// slot 22029
    22029, 82,
// MEASUREMENT_INCORPORATION.agc:280
//		LXC,2	XAD,2
// slot 22030
    22030, 48328,
// MEASUREMENT_INCORPORATION.agc:281
//			X2
// slot 22031
    22031, 78,
// MEASUREMENT_INCORPORATION.agc:282
//			NORMGAM
// slot 22032
    22032, 2182,
// MEASUREMENT_INCORPORATION.agc:283
//		VSL*	XCHX,2
// slot 22033
    22033, 54366,
// MEASUREMENT_INCORPORATION.agc:284
//			0,2
// slot 22034
    22034, 48892,
// MEASUREMENT_INCORPORATION.agc:285
//			S2
// slot 22035
    22035, 82,
// MEASUREMENT_INCORPORATION.agc:286
//		VAD*
// slot 22036
    22036, 65366,
// MEASUREMENT_INCORPORATION.agc:287
//			W +54D,1
// slot 22037
    22037, 2670,
// MEASUREMENT_INCORPORATION.agc:288
//		STORE	HOLDW
// slot 22038
    22038, 3002,
// MEASUREMENT_INCORPORATION.agc:289
//		DLOAD*	DCOMP		# CALC MIDDLE 3X9 PARTITION OF W MATRIX
// slot 22039
    22039, 48838,
// MEASUREMENT_INCORPORATION.agc:290
//			ZI,2
// slot 22040
    22040, 62648,
// MEASUREMENT_INCORPORATION.agc:291
//		NORM	VXSC
// slot 22041
    22041, 61826,
// MEASUREMENT_INCORPORATION.agc:292
//			S2
// slot 22042
    22042, 84,
// MEASUREMENT_INCORPORATION.agc:293
//			OMEGAM2
// slot 22043
    22043, 2978,
// MEASUREMENT_INCORPORATION.agc:294
//		XCHX,2	LXC,2
// slot 22044
    22044, 58536,
// MEASUREMENT_INCORPORATION.agc:295
//			S2
// slot 22045
    22045, 82,
// MEASUREMENT_INCORPORATION.agc:296
//			X2
// slot 22046
    22046, 78,
// MEASUREMENT_INCORPORATION.agc:297
//		XAD,2	VSL*
// slot 22047
    22047, 44920,
// MEASUREMENT_INCORPORATION.agc:298
//			NORMGAM
// slot 22048
    22048, 2182,
// MEASUREMENT_INCORPORATION.agc:299
//			0,2
// slot 22049
    22049, 48892,
// MEASUREMENT_INCORPORATION.agc:300
//		XCHX,2	VAD*
// slot 22050
    22050, 43944,
// MEASUREMENT_INCORPORATION.agc:301
//			S2
// slot 22051
    22051, 82,
// MEASUREMENT_INCORPORATION.agc:302
//			W +108D,1
// slot 22052
    22052, 2778,
// MEASUREMENT_INCORPORATION.agc:303
//		STORE	HOLDW +6
// slot 22053
    22053, 3014,
// MEASUREMENT_INCORPORATION.agc:304
//		BOFF
// slot 22054
    22054, 65304,
// MEASUREMENT_INCORPORATION.agc:305
//			DMENFLG		# BRANCH IF 6 DIMENSIONAL
// slot 22055
    22055, 3020,
// MEASUREMENT_INCORPORATION.agc:306
//			FAZB
// slot 22056
    22056, 40048,
// MEASUREMENT_INCORPORATION.agc:307
//		DLOAD*	DCOMP		# CALC LOWER 3X9 PARTITION OF W MATRIX
// slot 22057
    22057, 48838,
// MEASUREMENT_INCORPORATION.agc:308
//			ZI,2
// slot 22058
    22058, 62648,
// MEASUREMENT_INCORPORATION.agc:309
//		NORM	VXSC
// slot 22059
    22059, 61826,
// MEASUREMENT_INCORPORATION.agc:310
//# Page 1155
// MEASUREMENT_INCORPORATION.agc:311
//			S2
// slot 22060
    22060, 84,
// MEASUREMENT_INCORPORATION.agc:312
//			OMEGAM3
// slot 22061
    22061, 2990,
// MEASUREMENT_INCORPORATION.agc:313
//		XCHX,2	LXC,2
// slot 22062
    22062, 58536,
// MEASUREMENT_INCORPORATION.agc:314
//			S2
// slot 22063
    22063, 82,
// MEASUREMENT_INCORPORATION.agc:315
//			X2
// slot 22064
    22064, 78,
// MEASUREMENT_INCORPORATION.agc:316
//		XAD,2	VSL*
// slot 22065
    22065, 44920,
// MEASUREMENT_INCORPORATION.agc:317
//			NORMGAM
// slot 22066
    22066, 2182,
// MEASUREMENT_INCORPORATION.agc:318
//			0,2
// slot 22067
    22067, 48892,
// MEASUREMENT_INCORPORATION.agc:319
//		XCHX,2	VAD*
// slot 22068
    22068, 43944,
// MEASUREMENT_INCORPORATION.agc:320
//			S2
// slot 22069
    22069, 82,
// MEASUREMENT_INCORPORATION.agc:321
//			W +162D,1
// slot 22070
    22070, 2886,
// MEASUREMENT_INCORPORATION.agc:322
//		STORE	HOLDW +12D
// slot 22071
    22071, 3026,
// MEASUREMENT_INCORPORATION.agc:323
//FAZB		CALL
// slot 22072
    22072, 65320,
// MEASUREMENT_INCORPORATION.agc:324
//			GRP2PC
// slot 22073
    22073, 9544,
// MEASUREMENT_INCORPORATION.agc:325
//		EXIT
// slot 22074
    22074, 65532
)).

// bank 23, slots 22075-22081
function agcAotUnit1364 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22077 {
        if slot <= 22075 {
// MEASUREMENT_INCORPORATION.agc:326
//FAZB1		CA	WIXA		# START 2ND PHASE OF INCORP2 TO TRANSFER
// slot 22075
            if slot <> 22075 or instruction <> 13008 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 720).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22076 {
// MEASUREMENT_INCORPORATION.agc:327
//		AD	6DD		# 	TEMP REG TO PERM W MATRIX
// slot 22076
                if slot <> 22076 or instruction <> 26277 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1701), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:328
//		TS	WIXB
// slot 22077
                if slot <> 22077 or instruction <> 23249 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23249, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 22079 {
            if slot <= 22078 {
// MEASUREMENT_INCORPORATION.agc:329
//		CA	ZIXA
// slot 22078
                if slot <> 22078 or instruction <> 13010 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 722).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:330
//		AD	MINUS2
// slot 22079
                if slot <> 22079 or instruction <> 28646 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22080 {
// MEASUREMENT_INCORPORATION.agc:331
//		TS	ZIXB
// slot 22080
                if slot <> 22080 or instruction <> 23251 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23251, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// MEASUREMENT_INCORPORATION.agc:332
//		TC	INTPRET
// slot 22081
                if slot <> 22081 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1364] to agcAotUnit1364@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:333
//		LXA,1	SSP
// slot 22082
    22082, 55760,
// MEASUREMENT_INCORPORATION.agc:334
//			WIXA
// slot 22083
    22083, 1440,
// MEASUREMENT_INCORPORATION.agc:335
//			S1
// slot 22084
    22084, 82,
// MEASUREMENT_INCORPORATION.agc:336
//			6
// slot 22085
    22085, 12,
// MEASUREMENT_INCORPORATION.agc:337
//		VLOAD
// slot 22086
    22086, 65530,
// MEASUREMENT_INCORPORATION.agc:338
//			HOLDW
// slot 22087
    22087, 3002,
// MEASUREMENT_INCORPORATION.agc:339
//		STORE	W +54D,1
// slot 22088
    22088, 6766,
// MEASUREMENT_INCORPORATION.agc:340
//		VLOAD
// slot 22089
    22089, 65530,
// MEASUREMENT_INCORPORATION.agc:341
//			HOLDW +6
// slot 22090
    22090, 3014,
// MEASUREMENT_INCORPORATION.agc:342
//		STORE	W +108D,1
// slot 22091
    22091, 6874,
// MEASUREMENT_INCORPORATION.agc:343
//		BOFF	VLOAD
// slot 22092
    22092, 64792,
// MEASUREMENT_INCORPORATION.agc:344
//			DMENFLG
// slot 22093
    22093, 3020,
// MEASUREMENT_INCORPORATION.agc:345
//			FAZB5
// slot 22094
    22094, 40108,
// MEASUREMENT_INCORPORATION.agc:346
//			HOLDW +12D
// slot 22095
    22095, 3026,
// MEASUREMENT_INCORPORATION.agc:347
//		STORE	W +162D,1
// slot 22096
    22096, 6982,
// MEASUREMENT_INCORPORATION.agc:348
//FAZB2		TIX,1	GOTO
// slot 22097
    22097, 43136,
// MEASUREMENT_INCORPORATION.agc:349
//			+2
// slot 22098
    22098, 40104,
// MEASUREMENT_INCORPORATION.agc:350
//			FAZC		# DONE WITH W MATRIX.  UPDATE STATE VECTOR
// slot 22099
    22099, 40120,
// MEASUREMENT_INCORPORATION.agc:351
//		RTB
// slot 22100
    22100, 65336,
// MEASUREMENT_INCORPORATION.agc:352
//			FAZA
// slot 22101
    22101, 39922,
// MEASUREMENT_INCORPORATION.agc:353
//FAZB5		SLOAD	DAD
// slot 22102
    22102, 36282,
// MEASUREMENT_INCORPORATION.agc:354
//			ZIXB
// slot 22103
    22103, 1448,
// MEASUREMENT_INCORPORATION.agc:355
//			12DD
// slot 22104
    22104, 7502,
// MEASUREMENT_INCORPORATION.agc:356
//		BHIZ	GOTO
// slot 22105
    22105, 43056,
// MEASUREMENT_INCORPORATION.agc:357
//			FAZC
// slot 22106
    22106, 40120,
// MEASUREMENT_INCORPORATION.agc:358
//			FAZB2
// slot 22107
    22107, 40098,
// MEASUREMENT_INCORPORATION.agc:359
//FAZC		CALL
// slot 22108
    22108, 65320,
// MEASUREMENT_INCORPORATION.agc:360
//			GRP2PC
// slot 22109
    22109, 9544,
// MEASUREMENT_INCORPORATION.agc:361
//# Page 1156
// MEASUREMENT_INCORPORATION.agc:362
//		VLOAD	VAD		# START 3RD PHASE OF INCORP2
// slot 22110
    22110, 44538,
// MEASUREMENT_INCORPORATION.agc:363
//			X789		# 7TH, 8TH, 9TH COMPONENT OF STATE VECTOR
// slot 22111
    22111, 1922,
// MEASUREMENT_INCORPORATION.agc:364
//			DELTAX +12D	# INCORPORATION FOR X789
// slot 22112
    22112, 2946,
// MEASUREMENT_INCORPORATION.agc:365
//		STORE	TX789
// slot 22113
    22113, 3700,
// MEASUREMENT_INCORPORATION.agc:366
//		BON	RTB
// slot 22114
    22114, 39960,
// MEASUREMENT_INCORPORATION.agc:367
//			VEHUPFLG
// slot 22115
    22115, 910,
// MEASUREMENT_INCORPORATION.agc:368
//			DOCSM
// slot 22116
    22116, 40248,
// MEASUREMENT_INCORPORATION.agc:369
//			MOVEPLEM
// slot 22117
    22117, 23536,
// MEASUREMENT_INCORPORATION.agc:370
//FAZAB		BOVB	AXT,2
// slot 22118
    22118, 64520,
// MEASUREMENT_INCORPORATION.agc:371
//			TCDANZIG
// slot 22119
    22119, 49110,
// MEASUREMENT_INCORPORATION.agc:372
//			0
// slot 22120
    22120, 0,
// MEASUREMENT_INCORPORATION.agc:373
//		BOFF	AXT,2
// slot 22121
    22121, 64536,
// MEASUREMENT_INCORPORATION.agc:374
//			MOONTHIS
// slot 22122
    22122, 4552,
// MEASUREMENT_INCORPORATION.agc:375
//			+2
// slot 22123
    22123, 40154,
// MEASUREMENT_INCORPORATION.agc:376
//			2
// slot 22124
    22124, 4,
// MEASUREMENT_INCORPORATION.agc:377
//		VLOAD	VSR*
// slot 22125
    22125, 45050,
// MEASUREMENT_INCORPORATION.agc:378
//			DELTAX		# B27 IF MOON ORBIT, B29 IF EARTH
// slot 22126
    22126, 2922,
// MEASUREMENT_INCORPORATION.agc:379
//			0 -7,2
// slot 22127
    22127, 48394,
// MEASUREMENT_INCORPORATION.agc:380
//		VAD	BOV
// slot 22128
    22128, 32858,
// MEASUREMENT_INCORPORATION.agc:381
//			TDELTAV
// slot 22129
    22129, 1698,
// MEASUREMENT_INCORPORATION.agc:382
//			FAZAB1
// slot 22130
    22130, 40184,
// MEASUREMENT_INCORPORATION.agc:383
//		STOVL	TDELTAV
// slot 22131
    22131, 22178,
// MEASUREMENT_INCORPORATION.agc:384
//			DELTAX +6	# B5 IF MOON ORBIT, B7 IF EARTH
// slot 22132
    22132, 2934,
// MEASUREMENT_INCORPORATION.agc:385
//		VSR*	VAD
// slot 22133
    22133, 44382,
// MEASUREMENT_INCORPORATION.agc:386
//			0 -4,2
// slot 22134
    22134, 48388,
// MEASUREMENT_INCORPORATION.agc:387
//			TNUV
// slot 22135
    22135, 1710,
// MEASUREMENT_INCORPORATION.agc:388
//		BOV
// slot 22136
    22136, 65280,
// MEASUREMENT_INCORPORATION.agc:389
//			FAZAB2
// slot 22137
    22137, 40192,
// MEASUREMENT_INCORPORATION.agc:390
//		STCALL	TNUV
// slot 22138
    22138, 30382,
// MEASUREMENT_INCORPORATION.agc:391
//			FAZAB3
// slot 22139
    22139, 40206,
// MEASUREMENT_INCORPORATION.agc:392
//FAZAB1		VLOAD	VAD
// slot 22140
    22140, 44538,
// MEASUREMENT_INCORPORATION.agc:393
//			RCV
// slot 22141
    22141, 1722,
// MEASUREMENT_INCORPORATION.agc:394
//			DELTAX
// slot 22142
    22142, 2922,
// MEASUREMENT_INCORPORATION.agc:395
//		STORE	RCV
// slot 22143
    22143, 1722,
// MEASUREMENT_INCORPORATION.agc:396
//FAZAB2		VLOAD	VAD
// slot 22144
    22144, 44538,
// MEASUREMENT_INCORPORATION.agc:397
//			VCV
// slot 22145
    22145, 1734,
// MEASUREMENT_INCORPORATION.agc:398
//			DELTAX +6
// slot 22146
    22146, 2934,
// MEASUREMENT_INCORPORATION.agc:399
//		STORE	VCV
// slot 22147
    22147, 1734,
// MEASUREMENT_INCORPORATION.agc:400
//		SXA,2	CALL
// slot 22148
    22148, 38072,
// MEASUREMENT_INCORPORATION.agc:401
//			PBODY
// slot 22149
    22149, 2096,
// MEASUREMENT_INCORPORATION.agc:402
//			RECTIFY
// slot 22150
    22150, 20034,
// MEASUREMENT_INCORPORATION.agc:403
//FAZAB3		CALL
// slot 22151
    22151, 65320,
// MEASUREMENT_INCORPORATION.agc:404
//			GRP2PC
// slot 22152
    22152, 9544,
// MEASUREMENT_INCORPORATION.agc:405
//		BON	RTB
// slot 22153
    22153, 39960,
// MEASUREMENT_INCORPORATION.agc:406
//			VEHUPFLG
// slot 22154
    22154, 910,
// MEASUREMENT_INCORPORATION.agc:407
//			DOCSM1
// slot 22155
    22155, 40254,
// MEASUREMENT_INCORPORATION.agc:408
//			MOVEALEM
// slot 22156
    22156, 23502,
// MEASUREMENT_INCORPORATION.agc:409
//		CALL
// slot 22157
    22157, 65320,
// MEASUREMENT_INCORPORATION.agc:410
//			SVDWN2		# STORE DOWNLINK STATE VECTOR
// slot 22158
    22158, 22640,
// MEASUREMENT_INCORPORATION.agc:411
//FAZAB4		CALL
// slot 22159
    22159, 65320,
// MEASUREMENT_INCORPORATION.agc:412
//# Page 1157
// MEASUREMENT_INCORPORATION.agc:413
//			GRP2PC		# PHASE CHANGE
// slot 22160
    22160, 9544,
// MEASUREMENT_INCORPORATION.agc:414
//		BOFF	VLOAD
// slot 22161
    22161, 64792,
// MEASUREMENT_INCORPORATION.agc:415
//			DMENFLG
// slot 22162
    22162, 3020,
// MEASUREMENT_INCORPORATION.agc:416
//			FAZAB5		# 6 DIMENSIONAL
// slot 22163
    22163, 40236,
// MEASUREMENT_INCORPORATION.agc:417
//			TX789		# 9 DIMENSIONAL
// slot 22164
    22164, 3700,
// MEASUREMENT_INCORPORATION.agc:418
//		STORE	X789
// slot 22165
    22165, 1922,
// MEASUREMENT_INCORPORATION.agc:419
//FAZAB5		LXA,1	SXA,1
// slot 22166
    22166, 55504,
// MEASUREMENT_INCORPORATION.agc:420
//			EGRESS
// slot 22167
    22167, 3060,
// MEASUREMENT_INCORPORATION.agc:421
//			QPRET
// slot 22168
    22168, 84,
// MEASUREMENT_INCORPORATION.agc:422
//		EXIT
// slot 22169
    22169, 65532
)).

// bank 23, slots 22170-22170
function agcAotUnit1365 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// MEASUREMENT_INCORPORATION.agc:423
//		TC	POSTJUMP	# EXIT
// slot 22170
    if slot <> 22170 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1365] to agcAotUnit1365@.

agcAotInstallSourceRope(list(
// MEASUREMENT_INCORPORATION.agc:424
//		CADR	INTWAKE
// slot 22171
    22171, 24106,
// MEASUREMENT_INCORPORATION.agc:425
//DOCSM		RTB	GOTO
// slot 22172
    22172, 43064,
// MEASUREMENT_INCORPORATION.agc:426
//			MOVEPCSM
// slot 22173
    22173, 23462,
// MEASUREMENT_INCORPORATION.agc:427
//			FAZAB
// slot 22174
    22174, 40140,
// MEASUREMENT_INCORPORATION.agc:428
//DOCSM1		RTB	CALL
// slot 22175
    22175, 37944,
// MEASUREMENT_INCORPORATION.agc:429
//			MOVEACSM
// slot 22176
    22176, 23416,
// MEASUREMENT_INCORPORATION.agc:430
//			SVDWN1		# STORE DOWNLINK STATE VECTOR
// slot 22177
    22177, 22680,
// MEASUREMENT_INCORPORATION.agc:431
//		GOTO
// slot 22178
    22178, 65360,
// MEASUREMENT_INCORPORATION.agc:432
//			FAZAB4
// slot 22179
    22179, 40222,
// MEASUREMENT_INCORPORATION.agc:433
//ZEROD		=	ZEROVECS
// MEASUREMENT_INCORPORATION.agc:434
//54DD		DEC	54
// slot 22180
    22180, 108,
// MEASUREMENT_INCORPORATION.agc:435
//6DD		DEC	-6
// slot 22181
    22181, 65522,
// MEASUREMENT_INCORPORATION.agc:436
//12DD		DEC	12
// slot 22182
    22182, 24,
// MEASUREMENT_INCORPORATION.agc:437
//
// MEASUREMENT_INCORPORATION.agc:438
//		SETLOC	RENDEZ
// MEASUREMENT_INCORPORATION.agc:439
//		BANK
// MEASUREMENT_INCORPORATION.agc:440
//		COUNT*	$$/INCOR
// MEASUREMENT_INCORPORATION.agc:441
//
// MEASUREMENT_INCORPORATION.agc:442
//NEWZCOMP	VLOAD	ABVAL
// slot 21449
    21449, 42746,
// MEASUREMENT_INCORPORATION.agc:443
//			ZI
// slot 21450
    21450, 2886,
// MEASUREMENT_INCORPORATION.agc:444
//		STOVL	NORMZI
// slot 21451
    21451, 20554,
// MEASUREMENT_INCORPORATION.agc:445
//			ZI +6
// slot 21452
    21452, 2898,
// MEASUREMENT_INCORPORATION.agc:446
//		ABVAL	PUSH
// slot 21453
    21453, 34380,
// MEASUREMENT_INCORPORATION.agc:447
//		DSU	BMN
// slot 21454
    21454, 41002,
// MEASUREMENT_INCORPORATION.agc:448
//			NORMZI
// slot 21455
    21455, 74,
// MEASUREMENT_INCORPORATION.agc:449
//			+3
// slot 21456
    21456, 38822,
// MEASUREMENT_INCORPORATION.agc:450
//		DLOAD	STADR
// slot 21457
    21457, 38602,
// MEASUREMENT_INCORPORATION.agc:451
//		STORE	NORMZI
// slot 21458
    21458, 65460,
// MEASUREMENT_INCORPORATION.agc:452
//		VLOAD	ABVAL
// slot 21459
    21459, 42746,
// MEASUREMENT_INCORPORATION.agc:453
//			ZI +12D
// slot 21460
    21460, 2910,
// MEASUREMENT_INCORPORATION.agc:454
//		PUSH	DSU
// slot 21461
    21461, 38156,
// MEASUREMENT_INCORPORATION.agc:455
//			NORMZI
// slot 21462
    21462, 74,
// MEASUREMENT_INCORPORATION.agc:456
//		BMN	DLOAD
// slot 21463
    21463, 58688,
// MEASUREMENT_INCORPORATION.agc:457
//			+3
// slot 21464
    21464, 38838,
// MEASUREMENT_INCORPORATION.agc:458
//		STADR
// slot 21465
    21465, 65324,
// MEASUREMENT_INCORPORATION.agc:459
//		STORE	NORMZI		# LARGEST ABVAL
// slot 21466
    21466, 65460,
// MEASUREMENT_INCORPORATION.agc:460
//		DLOAD	SXA,1
// slot 21467
    21467, 55498,
// MEASUREMENT_INCORPORATION.agc:461
//			NORMZI
// slot 21468
    21468, 74,
// MEASUREMENT_INCORPORATION.agc:462
//			NORMZI		# SAVE X1
// slot 21469
    21469, 72,
// MEASUREMENT_INCORPORATION.agc:463
//		NORM	INCR,1
// slot 21470
    21470, 51330,
// MEASUREMENT_INCORPORATION.agc:464
//# Page 1158
// MEASUREMENT_INCORPORATION.agc:465
//			X1
// slot 21471
    21471, 78,
// MEASUREMENT_INCORPORATION.agc:466
//		DEC	2
// slot 21472
    21472, 4,
// MEASUREMENT_INCORPORATION.agc:467
//		VLOAD	VSL*
// slot 21473
    21473, 45050,
// MEASUREMENT_INCORPORATION.agc:468
//			ZI
// slot 21474
    21474, 2886,
// MEASUREMENT_INCORPORATION.agc:469
//			0,1
// slot 21475
    21475, 16642,
// MEASUREMENT_INCORPORATION.agc:470
//		STOVL	ZI
// slot 21476
    21476, 23366,
// MEASUREMENT_INCORPORATION.agc:471
//			ZI +6
// slot 21477
    21477, 2898,
// MEASUREMENT_INCORPORATION.agc:472
//		VSL*
// slot 21478
    21478, 65374,
// MEASUREMENT_INCORPORATION.agc:473
//			0,1
// slot 21479
    21479, 16642,
// MEASUREMENT_INCORPORATION.agc:474
//		STOVL	ZI +6
// slot 21480
    21480, 23378,
// MEASUREMENT_INCORPORATION.agc:475
//			ZI +12D
// slot 21481
    21481, 2910,
// MEASUREMENT_INCORPORATION.agc:476
//		VSL*	SXA,1
// slot 21482
    21482, 55390,
// MEASUREMENT_INCORPORATION.agc:477
//			0,1
// slot 21483
    21483, 16642,
// MEASUREMENT_INCORPORATION.agc:478
//			NORMZI +1	# SAVE SHIFT
// slot 21484
    21484, 74,
// MEASUREMENT_INCORPORATION.agc:479
//		STORE	ZI +12D
// slot 21485
    21485, 2910,
// MEASUREMENT_INCORPORATION.agc:480
//		LXA,1	XSU,1
// slot 21486
    21486, 45264,
// MEASUREMENT_INCORPORATION.agc:481
//			NORMGAM
// slot 21487
    21487, 2182,
// MEASUREMENT_INCORPORATION.agc:482
//			NORMZI +1
// slot 21488
    21488, 74,
// MEASUREMENT_INCORPORATION.agc:483
//		XSU,1
// slot 21489
    21489, 65376,
// MEASUREMENT_INCORPORATION.agc:484
//			NORMZI +1
// slot 21490
    21490, 74,
// MEASUREMENT_INCORPORATION.agc:485
//		SXA,1	LXC,1
// slot 21491
    21491, 57520,
// MEASUREMENT_INCORPORATION.agc:486
//			NORMGAM
// slot 21492
    21492, 2182,
// MEASUREMENT_INCORPORATION.agc:487
//			NORMZI +1
// slot 21493
    21493, 74,
// MEASUREMENT_INCORPORATION.agc:488
//		XAD,1	SETPD
// slot 21494
    21494, 33136,
// MEASUREMENT_INCORPORATION.agc:489
//			NORMZI
// slot 21495
    21495, 72,
// MEASUREMENT_INCORPORATION.agc:490
//			2D
// slot 21496
    21496, 6,
// MEASUREMENT_INCORPORATION.agc:491
//		GOTO
// slot 21497
    21497, 65360,
// MEASUREMENT_INCORPORATION.agc:492
//			INCOR2 -3
// slot 21498
    21498, 39790
)).

// no code for the lines below
// MEASUREMENT_INCORPORATION.agc:493
//NORMZI		=	36D
// MEASUREMENT_INCORPORATION.agc:494
//
// MEASUREMENT_INCORPORATION.agc:495
//
