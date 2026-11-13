// CSM_GEOMETRY.agc
agcAotInstallSourceRope(list(
// CSM_GEOMETRY.agc:1
//# Copyright:	Public domain.
// CSM_GEOMETRY.agc:2
//# Filename:	CSM_GEOMETRY.agc
// CSM_GEOMETRY.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// CSM_GEOMETRY.agc:4
//#		It is part of the source code for the Command Module's (CM)
// CSM_GEOMETRY.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// CSM_GEOMETRY.agc:6
//# Assembler:	yaYUL
// CSM_GEOMETRY.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// CSM_GEOMETRY.agc:8
//# Website:	www.ibiblio.org/apollo.
// CSM_GEOMETRY.agc:9
//# Pages:	285-296
// CSM_GEOMETRY.agc:10
//# Mod history:	2009-05-08 RSB	Adapted from the Colossus249/ file of the
// CSM_GEOMETRY.agc:11
//#				same name, using Comanche055 page images.
// CSM_GEOMETRY.agc:12
//#
// CSM_GEOMETRY.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// CSM_GEOMETRY.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// CSM_GEOMETRY.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// CSM_GEOMETRY.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// CSM_GEOMETRY.agc:17
//# consequent reduction in image quality as well) are available online at
// CSM_GEOMETRY.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// CSM_GEOMETRY.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// CSM_GEOMETRY.agc:20
//# (much) higher-quality images which Paul actually created.
// CSM_GEOMETRY.agc:21
//#
// CSM_GEOMETRY.agc:22
//# Notations on the hardcopy document read, in part:
// CSM_GEOMETRY.agc:23
//#
// CSM_GEOMETRY.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// CSM_GEOMETRY.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// CSM_GEOMETRY.agc:26
//#
// CSM_GEOMETRY.agc:27
//#	This AGC program shall also be referred to as
// CSM_GEOMETRY.agc:28
//#			Colossus 2A
// CSM_GEOMETRY.agc:29
//
// CSM_GEOMETRY.agc:30
//# Page 285
// CSM_GEOMETRY.agc:31
//		BANK	22
// CSM_GEOMETRY.agc:32
//		SETLOC	COMGEOM1
// CSM_GEOMETRY.agc:33
//		BANK
// CSM_GEOMETRY.agc:34
//
// CSM_GEOMETRY.agc:35
//# THIS ROUTINE TAKES THE SHAFT AND TRUNNION ANGLES AS READ BY THE CM OPTICAL SYSTEM AND CONVERTS THEM INTO A  UNIT
// CSM_GEOMETRY.agc:36
//# VECTOR REFERENCED TO THE NAVIGATION BASE COORDINATE SYSTEM AND COINCIDENT WITH THE SEXTANT LINE OF SIGHT.
// CSM_GEOMETRY.agc:37
//#
// CSM_GEOMETRY.agc:38
//# THE INPUTS ARE  1) THE SEXTANT SHAFT AND TRUNNION ANGLES ARE STORED SP IN LOCATIONS 3 AND 5 RESPECTIVELY OF THE
// CSM_GEOMETRY.agc:39
//# MARK VAC AREA.  2) THE COMPLEMENT OF THE BASE ADDRESS OF THE MARK VAC AREA IS STORED SP AT LOCATION X1 OF YOUR
// CSM_GEOMETRY.agc:40
//# JOB VAC AREA.
// CSM_GEOMETRY.agc:41
//#
// CSM_GEOMETRY.agc:42
//# THE OUTPUT IS A HALF-UNIT VECTOR IN NAVIGATION BASE COORDINATES AND STORED AT LOCATION 32D OF THE VAC AREA. THE
// CSM_GEOMETRY.agc:43
//# OUTPUT IS ALSO AVAILABLE AT MPAC.
// CSM_GEOMETRY.agc:44
//
// CSM_GEOMETRY.agc:45
//
// CSM_GEOMETRY.agc:46
//		COUNT	23/GEOM
// CSM_GEOMETRY.agc:47
//
// CSM_GEOMETRY.agc:48
//SXTNB		SLOAD*	RTB		# PUSHDOWN  00,02,04,(17D-19D),32D-36D
// slot 21504
    21504, 40118,
// CSM_GEOMETRY.agc:49
//			5,1		# TRUNNION = TA
// slot 21505
    21505, 12,
// CSM_GEOMETRY.agc:50
//			CDULOGIC
// slot 21506
    21506, 38550,
// CSM_GEOMETRY.agc:51
//		RTB	PUSH
// slot 21507
    21507, 34360,
// CSM_GEOMETRY.agc:52
//			SXTLOGIC
// slot 21508
    21508, 38958,
// CSM_GEOMETRY.agc:53
//		SIN	SL1
// slot 21509
    21509, 60124,
// CSM_GEOMETRY.agc:54
//		PUSH	SLOAD*		# PD2 = SIN(TA)
// slot 21510
    21510, 56076,
// CSM_GEOMETRY.agc:55
//			3,1		# SHAFT = SA
// slot 21511
    21511, 8,
// CSM_GEOMETRY.agc:56
//		RTB	PUSH		# PD4 = SA
// slot 21512
    21512, 34360,
// CSM_GEOMETRY.agc:57
//			CDULOGIC
// slot 21513
    21513, 38550,
// CSM_GEOMETRY.agc:58
//
// CSM_GEOMETRY.agc:59
//		COS	DMP
// slot 21514
    21514, 34252,
// CSM_GEOMETRY.agc:60
//			2
// slot 21515
    21515, 6,
// CSM_GEOMETRY.agc:61
//		STODL	STARM		# COS(SA)SIN(TA)
// slot 21516
    21516, 12354,
// CSM_GEOMETRY.agc:62
//
// CSM_GEOMETRY.agc:63
//		SIN	DMP
// slot 21517
    21517, 34268,
// CSM_GEOMETRY.agc:64
//		STADR
// slot 21518
    21518, 65324,
// CSM_GEOMETRY.agc:65
//		STODL	STARM	+2	# SIN(SA)SIN(TA)
// slot 21519
    21519, 53176,
// CSM_GEOMETRY.agc:66
//
// CSM_GEOMETRY.agc:67
//		COS
// slot 21520
    21520, 65484,
// CSM_GEOMETRY.agc:68
//		STOVL	STARM	+4
// slot 21521
    21521, 20554,
// CSM_GEOMETRY.agc:69
//			STARM		# STARM = 32D
// slot 21522
    21522, 66,
// CSM_GEOMETRY.agc:70
//		MXV	VSL1
// slot 21523
    21523, 64162,
// CSM_GEOMETRY.agc:71
//			NB1NB2
// slot 21524
    21524, 6532,
// CSM_GEOMETRY.agc:72
//		STORE	32D
// slot 21525
    21525, 66,
// CSM_GEOMETRY.agc:73
//		RVQ
// slot 21526
    21526, 65308
)).

// bank 23, slots 21527-21531
function agcAotUnit1223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21528 {
        if slot <= 21527 {
// CSM_GEOMETRY.agc:74
//
// CSM_GEOMETRY.agc:75
//
// CSM_GEOMETRY.agc:76
//SXTLOGIC	CAF	10DEGS-		# CORRECT FOR 19.775 DEGREE OFFSET
// slot 21527
            if slot <> 21527 or instruction <> 13523 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1235), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// CSM_GEOMETRY.agc:77
//		ADS	MPAC
// slot 21528
            if slot <> 21528 or instruction <> 11372 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 21529 {
// CSM_GEOMETRY.agc:78
//		CAF	QUARTER
// slot 21529
            if slot <> 21529 or instruction <> 14851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 21530 {
// CSM_GEOMETRY.agc:79
//		TC	SHORTMP
// slot 21530
                if slot <> 21530 or instruction <> 3758 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3758, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// CSM_GEOMETRY.agc:80
//		TC	DANZIG
// slot 21531
                if slot <> 21531 or instruction <> 3096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3096, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1223] to agcAotUnit1223@.

agcAotInstallSourceRope(list(
// CSM_GEOMETRY.agc:81
//# Page 286
// CSM_GEOMETRY.agc:82
//# CALCSXA COMPUTES THE SEXTANT SHAFT AND TRUNNION ANGLES REQUIRED TO POSITION THE OPTICS SUCH THAT A STAR LINE-
// CSM_GEOMETRY.agc:83
//# OF-SIGHT LIES ALONG THE STAR VECTOR.  THE ROUTINE TAKES THE GIVEN STAR VECTOR AND EXPRESSES IT AS A VECTOR REF-
// CSM_GEOMETRY.agc:84
//# ERENCED TO THE OPTICS COORDINATE SYSTEM.  IN ADDITION IT SETS UP THREE UNIT VECTORS DEFINING THE X,Y, AND Z AXES
// CSM_GEOMETRY.agc:85
//# REFERENCED TO THE OPTICS COORDINATE SYSTEM.
// CSM_GEOMETRY.agc:86
//#
// CSM_GEOMETRY.agc:87
//# THE INPUTS ARE  1) THE STAR VECTOR REFERRED TO PRESENT STABLE MEMBER COORDINATES STORED AT STAR.  2) SAME ANGLE
// CSM_GEOMETRY.agc:88
//# INPUT AS *SMNB*, I.E. SINES AND COSINES OF THE CDU ANGLES, IN THE ORDER Y Z X, AT SINCDU AND COSCDU.  A CALL
// CSM_GEOMETRY.agc:89
//# TO CDUTRIG WILL PROVIDE THIS INPUT.
// CSM_GEOMETRY.agc:90
//#
// CSM_GEOMETRY.agc:91
//# THE OUTPUTS ARE THE SEXTANT SHAFT AND TRUNNION ANGLES STORED DP AT SAC AND PAC RESPECTIVELY.  (LOW ORDER PART
// CSM_GEOMETRY.agc:92
//# EQUAL TO ZERO).
// CSM_GEOMETRY.agc:93
//
// CSM_GEOMETRY.agc:94
//
// CSM_GEOMETRY.agc:95
//CALCSXA		ITA	VLOAD		# PUSHDOWN 00-26D,28D,30D,32D-36D
// slot 21532
    21532, 64800,
// CSM_GEOMETRY.agc:96
//			28D
// slot 21533
    21533, 56,
// CSM_GEOMETRY.agc:97
//			STAR
// slot 21534
    21534, 3052,
// CSM_GEOMETRY.agc:98
//		CALL
// slot 21535
    21535, 65320,
// CSM_GEOMETRY.agc:99
//			*SMNB*
// slot 21536
    21536, 40776,
// CSM_GEOMETRY.agc:100
//		MXV	VSL1
// slot 21537
    21537, 64162,
// CSM_GEOMETRY.agc:101
//			NB2NB1
// slot 21538
    21538, 6496,
// CSM_GEOMETRY.agc:102
//		STOVL	STAR
// slot 21539
    21539, 23532,
// CSM_GEOMETRY.agc:103
//			HIUNITX
// slot 21540
    21540, 13750,
// CSM_GEOMETRY.agc:104
//		STOVL	XNB1
// slot 21541
    21541, 23258,
// CSM_GEOMETRY.agc:105
//			HIUNITY
// slot 21542
    21542, 13746,
// CSM_GEOMETRY.agc:106
//		STOVL	YNB1
// slot 21543
    21543, 23270,
// CSM_GEOMETRY.agc:107
//			HIUNITZ
// slot 21544
    21544, 13742,
// CSM_GEOMETRY.agc:108
//		STCALL	ZNB1
// slot 21545
    21545, 31474,
// CSM_GEOMETRY.agc:109
//			SXTANG1
// slot 21546
    21546, 39036,
// CSM_GEOMETRY.agc:110
//# Page 287
// CSM_GEOMETRY.agc:111
//# SXTANG COMPUTES THE SEXTANT SHAFT AND TRUNNION ANGLES REQUIRED TO POSITION THE OPTICS SUCH THAT A STAR LINE-OF-
// CSM_GEOMETRY.agc:112
//# SIGHT LIES ALONG THE STAR VECTOR.
// CSM_GEOMETRY.agc:113
//#
// CSM_GEOMETRY.agc:114
//# THE INPUTS ARE  1) THE STAR VECTOR REFERRED TO ANY COORDINATE SYSTEM STORED AT STAR.  2) THE NAVIGATION BASE
// CSM_GEOMETRY.agc:115
//# COORDINATES REFERRED TO THE SAME COORDINATE SYSTEM.  THESE THREE HALF-UNIT VECTORS ARE STORED AT XNB, YNB, AND
// CSM_GEOMETRY.agc:116
//# ZNB.
// CSM_GEOMETRY.agc:117
//#
// CSM_GEOMETRY.agc:118
//# THE OUTPUTS ARE THE SEXTANT SHAFT AND TRUNNION ANGLES STORED DP AT SAC AND PAC RESPECTIVELY.  (LOW ORDER PART
// CSM_GEOMETRY.agc:119
//# EQUAL TO ZERO).
// CSM_GEOMETRY.agc:120
//
// CSM_GEOMETRY.agc:121
//
// CSM_GEOMETRY.agc:122
//SXTANG		ITA	RTB		# PUSHDOWN  16D,18D,22D-26D,28D
// slot 21547
    21547, 39968,
// CSM_GEOMETRY.agc:123
//			28D
// slot 21548
    21548, 56,
// CSM_GEOMETRY.agc:124
//			TRANSP1		# EREF WRT NB2
// slot 21549
    21549, 38756,
// CSM_GEOMETRY.agc:125
//		VLOAD	MXV
// slot 21550
    21550, 53754,
// CSM_GEOMETRY.agc:126
//			XNB
// slot 21551
    21551, 2968,
// CSM_GEOMETRY.agc:127
//			NB2NB1
// slot 21552
    21552, 6496,
// CSM_GEOMETRY.agc:128
//		VSL1
// slot 21553
    21553, 65524,
// CSM_GEOMETRY.agc:129
//		STOVL	XNB1
// slot 21554
    21554, 23258,
// CSM_GEOMETRY.agc:130
//			YNB
// slot 21555
    21555, 2980,
// CSM_GEOMETRY.agc:131
//		MXV	VSL1
// slot 21556
    21556, 64162,
// CSM_GEOMETRY.agc:132
//			NB2NB1
// slot 21557
    21557, 6496,
// CSM_GEOMETRY.agc:133
//		STOVL	YNB1
// slot 21558
    21558, 23270,
// CSM_GEOMETRY.agc:134
//			ZNB
// slot 21559
    21559, 2992,
// CSM_GEOMETRY.agc:135
//		MXV	VSL1
// slot 21560
    21560, 64162,
// CSM_GEOMETRY.agc:136
//			NB2NB1
// slot 21561
    21561, 6496,
// CSM_GEOMETRY.agc:137
//		STORE	ZNB1
// slot 21562
    21562, 2802,
// CSM_GEOMETRY.agc:138
//
// CSM_GEOMETRY.agc:139
//		RTB	RTB
// slot 21563
    21563, 39992,
// CSM_GEOMETRY.agc:140
//			TRANSP1
// slot 21564
    21564, 38756,
// CSM_GEOMETRY.agc:141
//			TRANSP2
// slot 21565
    21565, 38780,
// CSM_GEOMETRY.agc:142
//
// CSM_GEOMETRY.agc:143
//SXTANG1		VLOAD	VXV
// slot 21566
    21566, 40442,
// CSM_GEOMETRY.agc:144
//			ZNB1
// slot 21567
    21567, 2802,
// CSM_GEOMETRY.agc:145
//			STAR
// slot 21568
    21568, 3052,
// CSM_GEOMETRY.agc:146
//		BOV
// slot 21569
    21569, 65280,
// CSM_GEOMETRY.agc:147
//			+1
// slot 21570
    21570, 39046,
// CSM_GEOMETRY.agc:148
//		UNIT	BOV
// slot 21571
    21571, 32860,
// CSM_GEOMETRY.agc:149
//			ZNB=S1
// slot 21572
    21572, 39114,
// CSM_GEOMETRY.agc:150
//		STORE	PDA		# PDA = UNIT(ZNB X S)
// slot 21573
    21573, 46,
// CSM_GEOMETRY.agc:151
//
// CSM_GEOMETRY.agc:152
//		DOT	DCOMP
// slot 21574
    21574, 48706,
// CSM_GEOMETRY.agc:153
//			XNB1
// slot 21575
    21575, 2778,
// CSM_GEOMETRY.agc:154
//		STOVL	SINTH		# SIN(SA) = PDA . -XNB
// slot 21576
    21576, 20518,
// CSM_GEOMETRY.agc:155
//			PDA
// slot 21577
    21577, 46,
// CSM_GEOMETRY.agc:156
//
// CSM_GEOMETRY.agc:157
//		DOT
// slot 21578
    21578, 65346,
// CSM_GEOMETRY.agc:158
//			YNB1
// slot 21579
    21579, 2790,
// CSM_GEOMETRY.agc:159
//		STCALL	COSTH		# COS(SA) = PDA . YNB
// slot 21580
    21580, 28706,
// CSM_GEOMETRY.agc:160
//			ARCTRIG
// slot 21581
    21581, 40284,
// CSM_GEOMETRY.agc:161
//# Page 288
// CSM_GEOMETRY.agc:162
//		RTB
// slot 21582
    21582, 65336,
// CSM_GEOMETRY.agc:163
//			1STO2S
// slot 21583
    21583, 38604,
// CSM_GEOMETRY.agc:164
//		STOVL	SAC
// slot 21584
    21584, 23544,
// CSM_GEOMETRY.agc:165
//			STAR
// slot 21585
    21585, 3052,
// CSM_GEOMETRY.agc:166
//		BOV
// slot 21586
    21586, 65280,
// CSM_GEOMETRY.agc:167
//			+1
// slot 21587
    21587, 39080,
// CSM_GEOMETRY.agc:168
//		DOT	SL1
// slot 21588
    21588, 59970,
// CSM_GEOMETRY.agc:169
//			ZNB1
// slot 21589
    21589, 2802,
// CSM_GEOMETRY.agc:170
//		ACOS
// slot 21590
    21590, 65452,
// CSM_GEOMETRY.agc:171
//		BMN	SL2
// slot 21591
    21591, 51776,
// CSM_GEOMETRY.agc:172
//			SXTALARM	# TRUNNION ANGLE NEGATIVE
// slot 21592
    21592, 39108,
// CSM_GEOMETRY.agc:173
//		BOV	DSU
// slot 21593
    21593, 38144,
// CSM_GEOMETRY.agc:174
//			SXTALARM	# TRUNNION ANGLE GREATER THAN 90 DEGREES
// slot 21594
    21594, 39108,
// CSM_GEOMETRY.agc:175
//			20DEG-
// slot 21595
    21595, 6578,
// CSM_GEOMETRY.agc:176
//		RTB
// slot 21596
    21596, 65336,
// CSM_GEOMETRY.agc:177
//			1STO2S
// slot 21597
    21597, 38604,
// CSM_GEOMETRY.agc:178
//		STORE	PAC		# FOR FLIGHT USE, CULTFLAG IS ON IF
// slot 21598
    21598, 3068,
// CSM_GEOMETRY.agc:179
//		CLRGO			# TRUNION IS GREATER THAN 90 DEG
// slot 21599
    21599, 65304,
// CSM_GEOMETRY.agc:180
//			CULTFLAG
// slot 21600
    21600, 1840,
// CSM_GEOMETRY.agc:181
//			28D
// slot 21601
    21601, 56,
// CSM_GEOMETRY.agc:182
//SXTALARM	SETGO			# ALARM HAS BEEN REMOVED FROM THIS
// slot 21602
    21602, 65304,
// CSM_GEOMETRY.agc:183
//			CULTFLAG
// slot 21603
    21603, 1584,
// CSM_GEOMETRY.agc:184
//			28D		# SUBROUTINE,ALARM WILL BE SET BY MPI
// slot 21604
    21604, 56,
// CSM_GEOMETRY.agc:185
//ZNB=S1		DLOAD
// slot 21605
    21605, 65482,
// CSM_GEOMETRY.agc:186
//			270DEG
// slot 21606
    21606, 6570,
// CSM_GEOMETRY.agc:187
//		STODL	SAC
// slot 21607
    21607, 15352,
// CSM_GEOMETRY.agc:188
//			20DEGS-
// slot 21608
    21608, 6574,
// CSM_GEOMETRY.agc:189
//		STORE	PAC
// slot 21609
    21609, 3068,
// CSM_GEOMETRY.agc:190
//		CLRGO
// slot 21610
    21610, 65304,
// CSM_GEOMETRY.agc:191
//			CULTFLAG
// slot 21611
    21611, 1840,
// CSM_GEOMETRY.agc:192
//			28D
// slot 21612
    21612, 56,
// CSM_GEOMETRY.agc:193
//# Page 289
// CSM_GEOMETRY.agc:194
//# THESE TWO ROUTINES COMPUTE THE ACTUAL STATE VECTOR FOR LM, CSM BY ADDING
// CSM_GEOMETRY.agc:195
//# THE CONIC R,V AND THE DEVIATIONSR,V.  THE STATE VECTORS ARE CONVERTED TO
// CSM_GEOMETRY.agc:196
//# METERS B-29 AND METERS/CSEC B-7 AND STORED APPROPRIATELY IN RN,VN OR
// CSM_GEOMETRY.agc:197
//# R-OTHER , V-OTHER FOR DOWNLINK.  THE ROUTINES NAMES ARE SWITCHED IN THE
// CSM_GEOMETRY.agc:198
//# OTHER VEHICLES COMPUTER.
// CSM_GEOMETRY.agc:199
//#
// CSM_GEOMETRY.agc:200
//# INPUT
// CSM_GEOMETRY.agc:201
//#	STATE VECTOR IN TEMPORARY STORAGE AREA
// CSM_GEOMETRY.agc:202
//#	IF STATE VECTOR IS SCALED POS B27 AND VEL B5
// CSM_GEOMETRY.agc:203
//#		SET X2 TO +2
// CSM_GEOMETRY.agc:204
//#	IF STATE VECTOR IS SCALED POS B29 AND VEL B7
// CSM_GEOMETRY.agc:205
//#		SET X2 TO 0
// CSM_GEOMETRY.agc:206
//#
// CSM_GEOMETRY.agc:207
//# OUTPUT
// CSM_GEOMETRY.agc:208
//#	R(T) IN RN, V(T) IN VN, T IN PIPTIME
// CSM_GEOMETRY.agc:209
//#		OR
// CSM_GEOMETRY.agc:210
//#	R(T) IN R-OTHER, V(T) IN V-OTHER	(T IS DEFINED BY T-OTHER)
// CSM_GEOMETRY.agc:211
//
// CSM_GEOMETRY.agc:212
//
// CSM_GEOMETRY.agc:213
//		BANK	23
// CSM_GEOMETRY.agc:214
//		SETLOC	COMGEOM2
// CSM_GEOMETRY.agc:215
//		BANK
// CSM_GEOMETRY.agc:216
//		COUNT	10/GEOM
// CSM_GEOMETRY.agc:217
//SVDWN1		BOF	RVQ			# SW=1=AVETOMID DOING W-MATRIX INTEG
// slot 10399
    10399, 36376
)).

agcAotInstallSourceRope(list(
// CSM_GEOMETRY.agc:218
//			AVEMIDSW
// slot 10400
    10400, 5084,
// CSM_GEOMETRY.agc:219
//			+1
// slot 10401
    10401, 16708,
// CSM_GEOMETRY.agc:220
//		VLOAD	VSL*
// slot 10402
    10402, 45050,
// CSM_GEOMETRY.agc:221
//			TDELTAV
// slot 10403
    10403, 1698,
// CSM_GEOMETRY.agc:222
//			0	-7,2
// slot 10404
    10404, 48906,
// CSM_GEOMETRY.agc:223
//		VAD	VSL*
// slot 10405
    10405, 44890,
// CSM_GEOMETRY.agc:224
//			RCV
// slot 10406
    10406, 1722,
// CSM_GEOMETRY.agc:225
//			0,2
// slot 10407
    10407, 48892,
// CSM_GEOMETRY.agc:226
//		STOVL	RN
// slot 10408
    10408, 21746,
// CSM_GEOMETRY.agc:227
//			TNUV
// slot 10409
    10409, 1710,
// CSM_GEOMETRY.agc:228
//		VSL*	VAD
// slot 10410
    10410, 44382,
// CSM_GEOMETRY.agc:229
//			0	-4,2
// slot 10411
    10411, 48900,
// CSM_GEOMETRY.agc:230
//			VCV
// slot 10412
    10412, 1734,
// CSM_GEOMETRY.agc:231
//		VSL*
// slot 10413
    10413, 65374,
// CSM_GEOMETRY.agc:232
//			0,2
// slot 10414
    10414, 48892,
// CSM_GEOMETRY.agc:233
//		STODL	VN
// slot 10415
    10415, 13566,
// CSM_GEOMETRY.agc:234
//			TET
// slot 10416
    10416, 1694,
// CSM_GEOMETRY.agc:235
//		STORE	PIPTIME
// slot 10417
    10417, 1290,
// CSM_GEOMETRY.agc:236
//		RVQ
// slot 10418
    10418, 65308,
// CSM_GEOMETRY.agc:237
//
// CSM_GEOMETRY.agc:238
//SVDWN2		VLOAD	VSL*
// slot 10419
    10419, 45050,
// CSM_GEOMETRY.agc:239
//			TDELTAV
// slot 10420
    10420, 1698,
// CSM_GEOMETRY.agc:240
//			0	-7,2
// slot 10421
    10421, 48906,
// CSM_GEOMETRY.agc:241
//		VAD	VSL*
// slot 10422
    10422, 44890,
// CSM_GEOMETRY.agc:242
//			RCV
// slot 10423
    10423, 1722,
// CSM_GEOMETRY.agc:243
//# Page 290
// CSM_GEOMETRY.agc:244
//			0,2
// slot 10424
    10424, 48892,
// CSM_GEOMETRY.agc:245
//		STOVL	R-OTHER
// slot 10425
    10425, 22436,
// CSM_GEOMETRY.agc:246
//			TNUV
// slot 10426
    10426, 1710,
// CSM_GEOMETRY.agc:247
//		VSL*	VAD
// slot 10427
    10427, 44382,
// CSM_GEOMETRY.agc:248
//			0	-4,2
// slot 10428
    10428, 48900,
// CSM_GEOMETRY.agc:249
//			VCV
// slot 10429
    10429, 1734,
// CSM_GEOMETRY.agc:250
//		VSL*
// slot 10430
    10430, 65374,
// CSM_GEOMETRY.agc:251
//			0,2
// slot 10431
    10431, 48892,
// CSM_GEOMETRY.agc:252
//		STORE	V-OTHER
// slot 10432
    10432, 1968,
// CSM_GEOMETRY.agc:253
//		RVQ
// slot 10433
    10433, 65308,
// CSM_GEOMETRY.agc:254
//# Page 291
// CSM_GEOMETRY.agc:255
//# SUBROUTINE TO COMPUTE THE NATURAL LOG OF C(MPAC, MPAC +1).
// CSM_GEOMETRY.agc:256
//#
// CSM_GEOMETRY.agc:257
//#	ENTRY:	CALL
// CSM_GEOMETRY.agc:258
//#			LOG
// CSM_GEOMETRY.agc:259
//#
// CSM_GEOMETRY.agc:260
//# SUBROUTINE RETURNS WITH -LOG IN DP MPAC.
// CSM_GEOMETRY.agc:261
//#
// CSM_GEOMETRY.agc:262
//# EBANK IS ARBITRARY..
// CSM_GEOMETRY.agc:263
//
// CSM_GEOMETRY.agc:264
//		BANK	14
// CSM_GEOMETRY.agc:265
//		SETLOC	POWFLIT2
// CSM_GEOMETRY.agc:266
//		BANK
// CSM_GEOMETRY.agc:267
//		COUNT	23/GEOM
// CSM_GEOMETRY.agc:268
//
// CSM_GEOMETRY.agc:269
//LOG		NORM	BDSU		# GENERATES LOG BY SHIFTING ARG
// slot 21613
    21613, 37250,
// CSM_GEOMETRY.agc:270
//			MPAC	+3	# UNTIL IT LIES BETWEEN .5 AND 1.
// slot 21614
    21614, 224,
// CSM_GEOMETRY.agc:271
//			NEARLY1		# THE LOG OF THIS PART IS FOUND AND THE
// slot 21615
    21615, 6420,
// CSM_GEOMETRY.agc:272
//		EXIT			# LOG OF THE SHIFTED PART IS COMPUTED
// slot 21616
    21616, 65532
)).

// bank 23, slots 21617-21617
function agcAotUnit1224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// CSM_GEOMETRY.agc:273
//
// CSM_GEOMETRY.agc:274
//		TC	POLY		# AND ADDED IN.  SHIFT COUNT STORED
// slot 21617
    if slot <> 21617 or instruction <> 3705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1224] to agcAotUnit1224@.

agcAotInstallSourceRope(list(
// CSM_GEOMETRY.agc:275
//
// CSM_GEOMETRY.agc:276
//		DEC	2		# (N-1, SUPPLIED BY SMERZH)
// slot 21618
    21618, 4,
// CSM_GEOMETRY.agc:277
//		2DEC	0		# IN MPAC +3.
// slot 21619 21620
    21619, 0, 21620, 0,
// CSM_GEOMETRY.agc:278
//		2DEC	.031335467
// slot 21621 21622
    21621, 1026, 21622, 13116,
// CSM_GEOMETRY.agc:279
//		2DEC	.0130145859
// slot 21623 21624
    21623, 426, 21624, 7568,
// CSM_GEOMETRY.agc:280
//		2DEC	.0215738898
// slot 21625 21626
    21625, 706, 21626, 15290
)).

// bank 23, slots 21627-21639
function agcAotUnit1225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21632 {
        if slot <= 21629 {
            if slot <= 21627 {
// CSM_GEOMETRY.agc:281
//
// CSM_GEOMETRY.agc:282
//		CAF	ZERO
// slot 21627
                if slot <> 21627 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21628 {
// CSM_GEOMETRY.agc:283
//		TS	MPAC	+2
// slot 21628
                    if slot <> 21628 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CSM_GEOMETRY.agc:284
//		EXTEND
// slot 21629
                    if slot <> 21629 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21630 {
// CSM_GEOMETRY.agc:285
//		DCA	CLOG2/32
// slot 21630
                if slot <> 21630 or instruction <> 13452 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1164, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21631 {
// CSM_GEOMETRY.agc:286
//		DXCH	MPAC
// slot 21631
                    if slot <> 21631 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CSM_GEOMETRY.agc:287
//		DXCH	MPAC	+3
// slot 21632
                    if slot <> 21632 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21635 {
            if slot <= 21633 {
// CSM_GEOMETRY.agc:288
//		COM			# LOAD POSITIVE SHIFT COUNT IN A.
// slot 21633
                if slot <> 21633 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21634 {
// CSM_GEOMETRY.agc:289
//		TC	SHORTMP		# MULTIPLY BY SHIFT COUNT.
// slot 21634
                    if slot <> 21634 or instruction <> 3758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3758, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CSM_GEOMETRY.agc:290
//
// CSM_GEOMETRY.agc:291
//		DXCH	MPAC	+1
// slot 21635
                    if slot <> 21635 or instruction <> 21614 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 110, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21637 {
                if slot <= 21636 {
// CSM_GEOMETRY.agc:292
//		DXCH	MPAC
// slot 21636
                    if slot <> 21636 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CSM_GEOMETRY.agc:293
//		DXCH	MPAC	+3
// slot 21637
                    if slot <> 21637 or instruction <> 21616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 112, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 21638 {
// CSM_GEOMETRY.agc:294
//		DAS	MPAC
// slot 21638
                    if slot <> 21638 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// CSM_GEOMETRY.agc:295
//		TC	INTPRET		# RESULT IN MPAC, MPAC +1
// slot 21639
                    if slot <> 21639 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1225] to agcAotUnit1225@.

agcAotInstallSourceRope(list(
// CSM_GEOMETRY.agc:296
//
// CSM_GEOMETRY.agc:297
//		RVQ
// slot 21640
    21640, 65308,
// CSM_GEOMETRY.agc:298
//
// CSM_GEOMETRY.agc:299
//NEARLY1		2DEC	.999999999
// slot 21641 21642
    21641, 32766, 21642, 32766,
// CSM_GEOMETRY.agc:300
//
// CSM_GEOMETRY.agc:301
//# Page 292
// CSM_GEOMETRY.agc:302
//CLOG2/32	2DEC	.0216608494
// slot 21643 21644
    21643, 708, 21644, 29208,
// CSM_GEOMETRY.agc:303
//
// CSM_GEOMETRY.agc:304
//# Page 293
// CSM_GEOMETRY.agc:305
//# SUBROUTINE NAME: 	EARTH ROTATOR	(EARROT1 OR EARROT2)		DATE:  		15 FEB 67
// CSM_GEOMETRY.agc:306
//# MOD NO:  N +1								LOG SECTION:  	POWERED FLIGHT SUBROS
// CSM_GEOMETRY.agc:307
//# MOD BY:  ENTRY GROUP (BAIRNSFATHER)
// CSM_GEOMETRY.agc:308
//# FUNCTIONAL DESCRIPTION: 	THIS ROUTINE PROJECTS THE INITIAL EARTH TARGET VECTOR RTINIT AHEAD THROUGH
// CSM_GEOMETRY.agc:309
//#	THE ESTIMATED TIME OF FLIGHT.  INITIAL CALL RESOLVES THE INITIAL TARGET VECTOR RTINIT INTO EASTERLY
// CSM_GEOMETRY.agc:310
//#	AND NORMAL COMPONENTS RTEAST AND RTNORM .  INITIAL AND SUBSEQUENT CALLS ROTATE THIS VECTOR
// CSM_GEOMETRY.agc:311
//#	ABOUT THE (FULL) UNIT POLAR AXIS UNITW THROUGH THE ANGLE WIE DTEAROT TO OBTAIN THE ROTATED
// CSM_GEOMETRY.agc:312
//#	TARGET VECTOR RT .  ALL VECTORS EXCEPT UNITW ARE HALF UNIT.
// CSM_GEOMETRY.agc:313
//#	THE EQUATIONS ARE
// CSM_GEOMETRY.agc:314
//#		-    -        -                      -
// CSM_GEOMETRY.agc:315
//#		RT = RTINIT + RTNORM (COS(WT) - 1) + RTEAST SIN(WT)
// CSM_GEOMETRY.agc:316
//#	WHERE	WT = WIE DTEAROT
// CSM_GEOMETRY.agc:317
//#		RTINIT = INITIAL TARGET VECTOR
// CSM_GEOMETRY.agc:318
//#		-        -       -
// CSM_GEOMETRY.agc:319
//#		RTEAST = UNITW*RTINIT
// CSM_GEOMETRY.agc:320
//#		-        -        -
// CSM_GEOMETRY.agc:321
//#		RTNORM = RTEAST*UNITW
// CSM_GEOMETRY.agc:322
//#
// CSM_GEOMETRY.agc:323
//#	FOR CONTINUOUS UPDATING, ONLY ONE ENTRY TO EARROT1 IS REQUIRED, WITH SUBSEQUENT ENTRIES AT EARROT2.
// CSM_GEOMETRY.agc:324
//# CALLING SEQUENCE:	FIRST CALL			SUBSEQUENT CALL
// CSM_GEOMETRY.agc:325
//#			STCALL	DTEAROT			STCALL	DTEAROT
// CSM_GEOMETRY.agc:326
//#				EARROT1				EARROT2
// CSM_GEOMETRY.agc:327
//#			C(MPAC) UNSPECIFIED		C(MPAC) = DTEAROT
// CSM_GEOMETRY.agc:328
//#	PUSHLOC = PDL+0, ARBITRARY.  6 LOCATIONS USED.
// CSM_GEOMETRY.agc:329
//#
// CSM_GEOMETRY.agc:330
//# SUBROUTINES USED:  NONE
// CSM_GEOMETRY.agc:331
//# NORMAL EXIT MODES:  RVQ
// CSM_GEOMETRY.agc:332
//# ALARMS:  NONE
// CSM_GEOMETRY.agc:333
//# OUTPUT:  RTEAST (-1)		.5 UNIT VECTOR EAST, COMPNT OF RTINIT	LEFT BY FIRST CALL
// CSM_GEOMETRY.agc:334
//#	   RTNORM (-1)		.5 UNIT VECTOR NORML, COMPNT OF RTINIT	LEFT BY FIRST CALL
// CSM_GEOMETRY.agc:335
//#	   RT	  (-1)		.5 UNIT TARGET VECTOR, ROTATED		LEFT BY ALL CALLS
// CSM_GEOMETRY.agc:336
//#	   DTEAROT  (-28) CS	MAY BE CHANGED BY EARROT2, IF OVER 1 DAY
// CSM_GEOMETRY.agc:337
//# ERASABLE INITIALIZATION REQUIRED:
// CSM_GEOMETRY.agc:338
//#	   UNITW  (0)		UNIT POLAR VECTOR			PAD LOADED
// CSM_GEOMETRY.agc:339
//#	   RTINIT (-1)		.5 UNIT INITIAL TARGET VECTOR		LEFT BY ENTRY
// CSM_GEOMETRY.agc:340
//#	   DTEAROT  (-28) CS	TIME OF FLIGHT				LEFT BY CALLER
// CSM_GEOMETRY.agc:341
//# DEBRIS:  QPRET, PDL+0 ... PDL+5
// CSM_GEOMETRY.agc:342
//# Page 294
// CSM_GEOMETRY.agc:343
//		EBANK=	RTINIT
// CSM_GEOMETRY.agc:344
//
// CSM_GEOMETRY.agc:345
//EARROT1		VLOAD	VXV
// slot 21645
    21645, 40442,
// CSM_GEOMETRY.agc:346
//			UNITW		# FULL UNIT VECTOR
// slot 21646
    21646, 1944,
// CSM_GEOMETRY.agc:347
//			RTINIT		# .5 UNIT
// slot 21647
    21647, 3668,
// CSM_GEOMETRY.agc:348
//		STORE	RTEAST		# .5 UNIT
// slot 21648
    21648, 3680,
// CSM_GEOMETRY.agc:349
//
// CSM_GEOMETRY.agc:350
//		VXV
// slot 21649
    21649, 65338,
// CSM_GEOMETRY.agc:351
//			UNITW		# FULL UNIT
// slot 21650
    21650, 1944,
// CSM_GEOMETRY.agc:352
//		STODL	RTNORM		# .5 UNIT
// slot 21651
    21651, 15980,
// CSM_GEOMETRY.agc:353
//			DTEAROT		# (-28) CS
// slot 21652
    21652, 3852,
// CSM_GEOMETRY.agc:354
//
// CSM_GEOMETRY.agc:355
//EARROT2		BOVB	DDV
// slot 21653
    21653, 47368,
// CSM_GEOMETRY.agc:356
//			TCDANZIG	# RESET OVFIND, IF ON
// slot 21654
    21654, 48596,
// CSM_GEOMETRY.agc:357
//			1/WIE
// slot 21655
    21655, 6492,
// CSM_GEOMETRY.agc:358
//		BOV	PUSH
// slot 21656
    21656, 34304,
// CSM_GEOMETRY.agc:359
//			OVERADAY
// slot 21657
    21657, 39242,
// CSM_GEOMETRY.agc:360
//		COS	DSU
// slot 21658
    21658, 38348,
// CSM_GEOMETRY.agc:361
//			HIDPHALF
// slot 21659
    21659, 13750,
// CSM_GEOMETRY.agc:362
//		VXSC	PDDL		# XCH W PUSH LIST
// slot 21660
    21660, 54754,
// CSM_GEOMETRY.agc:363
//			RTNORM		# .5 UNIT
// slot 21661
    21661, 3692,
// CSM_GEOMETRY.agc:364
//		SIN	VXSC
// slot 21662
    21662, 61916,
// CSM_GEOMETRY.agc:365
//			RTEAST		# .5 UNIT
// slot 21663
    21663, 3680,
// CSM_GEOMETRY.agc:366
//		VAD	VSL1
// slot 21664
    21664, 64090,
// CSM_GEOMETRY.agc:367
//		VAD	UNIT		# INSURE THAT RT IS 'UNIT'.
// slot 21665
    21665, 44634,
// CSM_GEOMETRY.agc:368
//			RTINIT		# .5 UNIT
// slot 21666
    21666, 3668,
// CSM_GEOMETRY.agc:369
//		STORE	RT		# .5 UNIT TARGET VECTOR
// slot 21667
    21667, 3704,
// CSM_GEOMETRY.agc:370
//
// CSM_GEOMETRY.agc:371
//		RVQ
// slot 21668
    21668, 65308,
// CSM_GEOMETRY.agc:372
//
// CSM_GEOMETRY.agc:373
//OVERADAY	DLOAD	SIGN
// slot 21669
    21669, 62922,
// CSM_GEOMETRY.agc:374
//			1/WIE
// slot 21670
    21670, 6492,
// CSM_GEOMETRY.agc:375
//			DTEAROT
// slot 21671
    21671, 3852,
// CSM_GEOMETRY.agc:376
//		BDSU
// slot 21672
    21672, 65314,
// CSM_GEOMETRY.agc:377
//			DTEAROT
// slot 21673
    21673, 3852,
// CSM_GEOMETRY.agc:378
//		STORE	DTEAROT
// slot 21674
    21674, 3852,
// CSM_GEOMETRY.agc:379
//
// CSM_GEOMETRY.agc:380
//		GOTO
// slot 21675
    21675, 65360,
// CSM_GEOMETRY.agc:381
//			EARROT2
// slot 21676
    21676, 39210,
// CSM_GEOMETRY.agc:382
//
// CSM_GEOMETRY.agc:383
//#WIE		2DEC	.1901487997
// CSM_GEOMETRY.agc:384
//1/WIE		2DEC	8616410
// slot 21677 21678
    21677, 1050, 21678, 29620,
// CSM_GEOMETRY.agc:385
//NB2NB1		2DEC	+.8431756920 B-1
// slot 21679 21680
    21679, 13814, 21680, 9676,
// CSM_GEOMETRY.agc:386
//		2DEC	0
// slot 21681 21682
    21681, 0, 21682, 0,
// CSM_GEOMETRY.agc:387
//		2DEC	-.5376381241 B-1
// slot 21683 21684
    21683, 56726, 21684, 54670,
// CSM_GEOMETRY.agc:388
//# Page 295
// CSM_GEOMETRY.agc:389
//ZERINFLT	2DEC	0
// slot 21685 21686
    21685, 0, 21686, 0,
// CSM_GEOMETRY.agc:390
//HALFNFLT	2DEC	.5
// slot 21687 21688
    21687, 16384, 21688, 0,
// CSM_GEOMETRY.agc:391
//		2DEC	0
// slot 21689 21690
    21689, 0, 21690, 0,
// CSM_GEOMETRY.agc:392
//		2DEC	+.5376381241 B-1
// slot 21691 21692
    21691, 8808, 21692, 10864,
// CSM_GEOMETRY.agc:393
//		2DEC	0
// slot 21693 21694
    21693, 0, 21694, 0,
// CSM_GEOMETRY.agc:394
//		2DEC	+.8431756920 B-1
// slot 21695 21696
    21695, 13814, 21696, 9676,
// CSM_GEOMETRY.agc:395
//NB1NB2		2DEC	+.8431756920 B-1
// slot 21697 21698
    21697, 13814, 21698, 9676,
// CSM_GEOMETRY.agc:396
//		2DEC	0
// slot 21699 21700
    21699, 0, 21700, 0,
// CSM_GEOMETRY.agc:397
//		2DEC	+.5376381241 B-1
// slot 21701 21702
    21701, 8808, 21702, 10864,
// CSM_GEOMETRY.agc:398
//		2DEC	0
// slot 21703 21704
    21703, 0, 21704, 0,
// CSM_GEOMETRY.agc:399
//		2DEC	.5
// slot 21705 21706
    21705, 16384, 21706, 0,
// CSM_GEOMETRY.agc:400
//		2DEC	0
// slot 21707 21708
    21707, 0, 21708, 0,
// CSM_GEOMETRY.agc:401
//		2DEC	-.5376381241 B-1
// slot 21709 21710
    21709, 56726, 21710, 54670,
// CSM_GEOMETRY.agc:402
//		2DEC	0
// slot 21711 21712
    21711, 0, 21712, 0,
// CSM_GEOMETRY.agc:403
//		2DEC	+.8431756920 B-1
// slot 21713 21714
    21713, 13814, 21714, 9676,
// CSM_GEOMETRY.agc:404
//
// CSM_GEOMETRY.agc:405
//# Page 296
// CSM_GEOMETRY.agc:406
//10DEGS-		DEC	3600
// slot 21715
    21715, 7200,
// CSM_GEOMETRY.agc:407
//
// CSM_GEOMETRY.agc:408
//270DEG		OCT	60000		# SHAFT 270 DEGREES	2S COMP.
// slot 21716
    21716, 49152,
// CSM_GEOMETRY.agc:409
//		OCT	00000
// slot 21717
    21717, 0,
// CSM_GEOMETRY.agc:410
//
// CSM_GEOMETRY.agc:411
//20DEGS-		DEC	-07199
// slot 21718
    21718, 51136,
// CSM_GEOMETRY.agc:412
//		DEC	-00000
// slot 21719
    21719, 65534,
// CSM_GEOMETRY.agc:413
//
// CSM_GEOMETRY.agc:414
//20DEG-		DEC	03600
// slot 21720
    21720, 7200,
// CSM_GEOMETRY.agc:415
//		DEC	00000
// slot 21721
    21721, 0
)).

