// ANGLFIND.agc
// bank 22, slots 20480-20480
function agcAotUnit1191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ANGLFIND.agc:1
//# Copyright:	Public domain.
// ANGLFIND.agc:2
//# Filename:	ANGLFIND.agc
// ANGLFIND.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// ANGLFIND.agc:4
//#		It is part of the source code for the Command Module's (CM)
// ANGLFIND.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// ANGLFIND.agc:6
//# Assembler:	yaYUL
// ANGLFIND.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// ANGLFIND.agc:8
//# Website:	www.ibiblio.org/apollo.
// ANGLFIND.agc:9
//# Pages:	399-411
// ANGLFIND.agc:10
//# Mod history:	2009-05-09 RSB	Adapted from the Colossus249/ file
// ANGLFIND.agc:11
//#				of the same name, using Comanche055 page
// ANGLFIND.agc:12
//#				images.
// ANGLFIND.agc:13
//#		2009-05-22 RSB	In NOGOM2, TC ZEROEROR corrected to
// ANGLFIND.agc:14
//#				CADR ZEROEROR.
// ANGLFIND.agc:15
//#
// ANGLFIND.agc:16
//# This source code has been transcribed or otherwise adapted from digitized
// ANGLFIND.agc:17
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// ANGLFIND.agc:18
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// ANGLFIND.agc:19
//# thanks to both.  The images (with suitable reduction in storage size and
// ANGLFIND.agc:20
//# consequent reduction in image quality as well) are available online at
// ANGLFIND.agc:21
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// ANGLFIND.agc:22
//# illegible, contact me at info@sandroid.org about getting access to the
// ANGLFIND.agc:23
//# (much) higher-quality images which Paul actually created.
// ANGLFIND.agc:24
//#
// ANGLFIND.agc:25
//# Notations on the hardcopy document read, in part:
// ANGLFIND.agc:26
//#
// ANGLFIND.agc:27
//#	Assemble revision 055 of AGC program Comanche by NASA
// ANGLFIND.agc:28
//#	2021113-051.  10:28 APR. 1, 1969
// ANGLFIND.agc:29
//#
// ANGLFIND.agc:30
//#	This AGC program shall also be referred to as
// ANGLFIND.agc:31
//#			Colossus 2A
// ANGLFIND.agc:32
//
// ANGLFIND.agc:33
//# Page 399
// ANGLFIND.agc:34
//		BANK	15
// ANGLFIND.agc:35
//		SETLOC	KALCMON1
// ANGLFIND.agc:36
//		BANK
// ANGLFIND.agc:37
//
// ANGLFIND.agc:38
//		EBANK=	BCDU
// ANGLFIND.agc:39
//
// ANGLFIND.agc:40
//		COUNT	22/KALC
// ANGLFIND.agc:41
//
// ANGLFIND.agc:42
//KALCMAN3	TC	INTPRET
// slot 20480
    if slot <> 20480 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1191] to agcAotUnit1191@.

agcAotInstallSourceRope(list(
// ANGLFIND.agc:43
//		RTB
// slot 20481
    20481, 65336,
// ANGLFIND.agc:44
//			READCDUK	# PICK UP CURRENT CDU ANGLES
// slot 20482
    20482, 37372,
// ANGLFIND.agc:45
//		STORE	BCDU		# STORE THE INITIAL S/C ANGLES
// slot 20483
    20483, 3428,
// ANGLFIND.agc:46
//		AXC,2	TLOAD		# COMPUTE THE TRANSFORMATION FROM
// slot 20484
    20484, 59880,
// ANGLFIND.agc:47
//			MIS		# INITIAL S/C AXES TO STABLE MEMBER AXES
// slot 20485
    20485, 3488,
// ANGLFIND.agc:48
//			BCDU		# (MIS)
// slot 20486
    20486, 3428,
// ANGLFIND.agc:49
//		CALL
// slot 20487
    20487, 65320,
// ANGLFIND.agc:50
//			CDUTODCM
// slot 20488
    20488, 37386,
// ANGLFIND.agc:51
//		AXC,2	TLOAD		# COMPUTE THE TRANSFORMATION FROM
// slot 20489
    20489, 59880,
// ANGLFIND.agc:52
//			MFS		# FINAL S/C AXES TO STABLE MEMBER AXES
// slot 20490
    20490, 3626,
// ANGLFIND.agc:53
//			CPHI		# (MFS)
// slot 20491
    20491, 1244,
// ANGLFIND.agc:54
//		CALL
// slot 20492
    20492, 65320,
// ANGLFIND.agc:55
//			CDUTODCM
// slot 20493
    20493, 37386,
// ANGLFIND.agc:56
//SECAD		AXC,1	CALL		# MIS AND MFS ARRAYS CALCULATED		$2
// slot 20494
    20494, 38112,
// ANGLFIND.agc:57
//			MIS
// slot 20495
    20495, 3488,
// ANGLFIND.agc:58
//			TRANSPOS
// slot 20496
    20496, 37304,
// ANGLFIND.agc:59
//		VLOAD
// slot 20497
    20497, 65530,
// ANGLFIND.agc:60
//		STADR
// slot 20498
    20498, 65324,
// ANGLFIND.agc:61
//		STOVL	TMIS +12D
// slot 20499
    20499, 41592,
// ANGLFIND.agc:62
//		STADR
// slot 20500
    20500, 65324,
// ANGLFIND.agc:63
//		STOVL	TMIS +6
// slot 20501
    20501, 41604,
// ANGLFIND.agc:64
//		STADR
// slot 20502
    20502, 65324,
// ANGLFIND.agc:65
//		STORE	TMIS		# TMIS = TRANSPOSE(MIS) SCALED BY 2
// slot 20503
    20503, 62096,
// ANGLFIND.agc:66
//		AXC,1	AXC,2
// slot 20504
    20504, 62688,
// ANGLFIND.agc:67
//			TMIS
// slot 20505
    20505, 3436,
// ANGLFIND.agc:68
//			MFS
// slot 20506
    20506, 3626,
// ANGLFIND.agc:69
//		CALL
// slot 20507
    20507, 65320,
// ANGLFIND.agc:70
//			MXM3
// slot 20508
    20508, 37256,
// ANGLFIND.agc:71
//		VLOAD	STADR
// slot 20509
    20509, 38650,
// ANGLFIND.agc:72
//		STOVL	MFI +12D
// slot 20510
    20510, 41402,
// ANGLFIND.agc:73
//		STADR
// slot 20511
    20511, 65324,
// ANGLFIND.agc:74
//		STOVL	MFI +6
// slot 20512
    20512, 41414,
// ANGLFIND.agc:75
//		STADR
// slot 20513
    20513, 65324,
// ANGLFIND.agc:76
//		STORE	MFI		# MFI = TMIS MFS (SCALED BY 4)
// slot 20514
    20514, 61906,
// ANGLFIND.agc:77
//		SETPD	CALL		# TRANSPOSE MFI IN PD LIST
// slot 20515
    20515, 37890,
// ANGLFIND.agc:78
//			18D
// slot 20516
    20516, 38,
// ANGLFIND.agc:79
//			TRNSPSPD
// slot 20517
    20517, 37318,
// ANGLFIND.agc:80
//		VLOAD	STADR
// slot 20518
    20518, 38650,
// ANGLFIND.agc:81
//		STOVL	TMFI +12D
// slot 20519
    20519, 41592,
// ANGLFIND.agc:82
//		STADR
// slot 20520
    20520, 65324,
// ANGLFIND.agc:83
//		STOVL	TMFI +6
// slot 20521
    20521, 41604,
// ANGLFIND.agc:84
//# Page 400
// ANGLFIND.agc:85
//		STADR
// slot 20522
    20522, 65324,
// ANGLFIND.agc:86
//		STORE	TMFI		# TMFI = TRANSPOSE (MFI)  SCALED BY 4
// slot 20523
    20523, 62096,
// ANGLFIND.agc:87
//
// ANGLFIND.agc:88
//# CALCULATE COFSKEW AND MFISYM
// ANGLFIND.agc:89
//
// ANGLFIND.agc:90
//		DLOAD	DSU
// slot 20524
    20524, 38346,
// ANGLFIND.agc:91
//			TMFI +2
// slot 20525
    20525, 3442,
// ANGLFIND.agc:92
//			MFI +2
// slot 20526
    20526, 3632,
// ANGLFIND.agc:93
//		PDDL	DSU		# CALCULATE COF SCALED BY 2/SIN(AM)
// slot 20527
    20527, 38314,
// ANGLFIND.agc:94
//			MFI +4
// slot 20528
    20528, 3636,
// ANGLFIND.agc:95
//			TMFI +4
// slot 20529
    20529, 3446,
// ANGLFIND.agc:96
//		PDDL	DSU
// slot 20530
    20530, 38314,
// ANGLFIND.agc:97
//			TMFI +10D
// slot 20531
    20531, 3458,
// ANGLFIND.agc:98
//			MFI +10D
// slot 20532
    20532, 3648,
// ANGLFIND.agc:99
//		VDEF
// slot 20533
    20533, 65388,
// ANGLFIND.agc:100
//		STORE	COFSKEW		# EQUALS MFISKEW
// slot 20534
    20534, 3474,
// ANGLFIND.agc:101
//
// ANGLFIND.agc:102
//# CALCULATE AM AND PROCEED ACCORDING TO ITS MAGNITUDE
// ANGLFIND.agc:103
//
// ANGLFIND.agc:104
//		DLOAD	DAD
// slot 20535
    20535, 36298,
// ANGLFIND.agc:105
//			MFI
// slot 20536
    20536, 3628,
// ANGLFIND.agc:106
//			MFI +16D
// slot 20537
    20537, 3660,
// ANGLFIND.agc:107
//		DSU	DAD
// slot 20538
    20538, 36138,
// ANGLFIND.agc:108
//			DP1/4TH
// slot 20539
    20539, 13738,
// ANGLFIND.agc:109
//			MFI +8D
// slot 20540
    20540, 3644,
// ANGLFIND.agc:110
//		STORE	CAM		# CAM = (MFI0+MFI4+MFI8-1)/2 HALF SCALE
// slot 20541
    20541, 3486,
// ANGLFIND.agc:111
//		ARCCOS
// slot 20542
    20542, 65452,
// ANGLFIND.agc:112
//		STORE	AM		# AM=ARCCOS(CAM)  (AM SCALED BY 2)
// slot 20543
    20543, 3562,
// ANGLFIND.agc:113
//		DSU	BPL
// slot 20544
    20544, 42026,
// ANGLFIND.agc:114
//			MINANG
// slot 20545
    20545, 4590,
// ANGLFIND.agc:115
//			CHECKMAX
// slot 20546
    20546, 37010,
// ANGLFIND.agc:116
//		EXIT			# MANEUVER LESS THAN 0.25 DEG
// slot 20547
    20547, 65532
)).

// bank 22, slots 20548-20552
function agcAotUnit1192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20549 {
        if slot <= 20548 {
// ANGLFIND.agc:117
//		INHINT			# GO DIRECTLY INTO ATTITUDE HOLD
// slot 20548
            if slot <> 20548 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ANGLFIND.agc:118
//		CS	ONE		# ABOUT COMMANDED ANGLES
// slot 20549
            if slot <> 20549 or instruction <> 18959 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20550 {
// ANGLFIND.agc:119
//		TS	HOLDFLAG	# NOGO WILL STOP ANY RATE AND SET UP FOR A
// slot 20550
            if slot <> 20550 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20551 {
// ANGLFIND.agc:120
//		TC	LOADCDUD	# GOOD RETURN
// slot 20551
                if slot <> 20551 or instruction <> 1634 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1634, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ANGLFIND.agc:121
//		TCF	NOGO
// slot 20552
                if slot <> 20552 or instruction <> 5592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1192] to agcAotUnit1192@.

agcAotInstallSourceRope(list(
// ANGLFIND.agc:122
//
// ANGLFIND.agc:123
//CHECKMAX	DLOAD	DSU
// slot 20553
    20553, 38346,
// ANGLFIND.agc:124
//			AM
// slot 20554
    20554, 3562,
// ANGLFIND.agc:125
//			MAXANG
// slot 20555
    20555, 4592,
// ANGLFIND.agc:126
//		BPL	VLOAD
// slot 20556
    20556, 64840,
// ANGLFIND.agc:127
//			ALTCALC		# UNIT
// slot 20557
    20557, 37030,
// ANGLFIND.agc:128
//			COFSKEW		# COFSKEW
// slot 20558
    20558, 3474,
// ANGLFIND.agc:129
//		UNIT
// slot 20559
    20559, 65372,
// ANGLFIND.agc:130
//		STORE	COF		# COF IS THE MANEUVER AXIS
// slot 20560
    20560, 3526,
// ANGLFIND.agc:131
//		GOTO			# SEE IF MANEUVER GOES THRU GIMBAL LOCK
// slot 20561
    20561, 65360,
// ANGLFIND.agc:132
//			LOCSKIRT
// slot 20562
    20562, 37822,
// ANGLFIND.agc:133
//ALTCALC		VLOAD	VAD		# IF AM GREATER THAN 170 DEGREES
// slot 20563
    20563, 44538,
// ANGLFIND.agc:134
//			MFI
// slot 20564
    20564, 3628,
// ANGLFIND.agc:135
//# Page 401
// ANGLFIND.agc:136
//			TMFI
// slot 20565
    20565, 3438,
// ANGLFIND.agc:137
//		VSR1
// slot 20566
    20566, 65508,
// ANGLFIND.agc:138
//		STOVL	MFISYM
// slot 20567
    20567, 23918,
// ANGLFIND.agc:139
//			MFI +6
// slot 20568
    20568, 3640,
// ANGLFIND.agc:140
//		VAD	VSR1
// slot 20569
    20569, 62042,
// ANGLFIND.agc:141
//			TMFI +6
// slot 20570
    20570, 3450,
// ANGLFIND.agc:142
//		STOVL	MFISYM +6
// slot 20571
    20571, 23930,
// ANGLFIND.agc:143
//			MFI +12D
// slot 20572
    20572, 3652,
// ANGLFIND.agc:144
//		VAD	VSR1
// slot 20573
    20573, 62042,
// ANGLFIND.agc:145
//			TMFI +12D
// slot 20574
    20574, 3462,
// ANGLFIND.agc:146
//		STORE	MFISYM +12D	# MFISYM=(MFI+TMFI)/2	SCALED BY 4
// slot 20575
    20575, 3462,
// ANGLFIND.agc:147
//
// ANGLFIND.agc:148
//# CALCULATE COF
// ANGLFIND.agc:149
//
// ANGLFIND.agc:150
//		DLOAD	SR1
// slot 20576
    20576, 58058,
// ANGLFIND.agc:151
//			CAM
// slot 20577
    20577, 3486,
// ANGLFIND.agc:152
//		PDDL	DSU		# PD0 CAM		 	       $4
// slot 20578
    20578, 38314,
// ANGLFIND.agc:153
//			DPHALF
// slot 20579
    20579, 13750,
// ANGLFIND.agc:154
//			CAM
// slot 20580
    20580, 3486,
// ANGLFIND.agc:155
//		BOVB	PDDL		# PD2 1 - CAM			       $2
// slot 20581
    20581, 54536,
// ANGLFIND.agc:156
//			SIGNMPAC
// slot 20582
    20582, 38804,
// ANGLFIND.agc:157
//			MFISYM +16D
// slot 20583
    20583, 3470,
// ANGLFIND.agc:158
//		DSU	DDV
// slot 20584
    20584, 47402,
// ANGLFIND.agc:159
//			0
// slot 20585
    20585, 2,
// ANGLFIND.agc:160
//			2
// slot 20586
    20586, 6,
// ANGLFIND.agc:161
//		SQRT	PDDL		# COFZ = SQRT(MFISYM8-CAM)/(1-CAM)
// slot 20587
    20587, 54764,
// ANGLFIND.agc:162
//			MFISYM +8D	#			  	 $ ROOT 2
// slot 20588
    20588, 3454,
// ANGLFIND.agc:163
//		DSU	DDV
// slot 20589
    20589, 47402,
// ANGLFIND.agc:164
//			0
// slot 20590
    20590, 2,
// ANGLFIND.agc:165
//			2
// slot 20591
    20591, 6,
// ANGLFIND.agc:166
//		SQRT	PDDL		# COFY = SQRT(MFISYM4-CAM)/(1-CAM) $ROOT2
// slot 20592
    20592, 54764,
// ANGLFIND.agc:167
//			MFISYM
// slot 20593
    20593, 3438,
// ANGLFIND.agc:168
//		DSU	DDV
// slot 20594
    20594, 47402,
// ANGLFIND.agc:169
//			0
// slot 20595
    20595, 2,
// ANGLFIND.agc:170
//			2
// slot 20596
    20596, 6,
// ANGLFIND.agc:171
//		SQRT	VDEF		# COFX = SQRT(MFISYM-CAM)/(1-CAM) $ROOT 2
// slot 20597
    20597, 46828,
// ANGLFIND.agc:172
//		UNIT
// slot 20598
    20598, 65372,
// ANGLFIND.agc:173
//		STORE	COF
// slot 20599
    20599, 3526,
// ANGLFIND.agc:174
//
// ANGLFIND.agc:175
//# DETERMINE LARGEST COF AND ADJUST ACCORDINGLY
// ANGLFIND.agc:176
//
// ANGLFIND.agc:177
//COFMAXGO	DLOAD	DSU
// slot 20600
    20600, 38346,
// ANGLFIND.agc:178
//			COF
// slot 20601
    20601, 3526,
// ANGLFIND.agc:179
//			COF +2
// slot 20602
    20602, 3530,
// ANGLFIND.agc:180
//		BMN	DLOAD		# COFY G COFX
// slot 20603
    20603, 58688,
// ANGLFIND.agc:181
//			COMP12
// slot 20604
    20604, 37126,
// ANGLFIND.agc:182
//			COF
// slot 20605
    20605, 3526,
// ANGLFIND.agc:183
//		DSU	BMN
// slot 20606
    20606, 41002,
// ANGLFIND.agc:184
//			COF +4
// slot 20607
    20607, 3534,
// ANGLFIND.agc:185
//# Page 402
// ANGLFIND.agc:186
//			METHOD3		# COFZ G COFX OR COFY
// slot 20608
    20608, 37216,
// ANGLFIND.agc:187
//		GOTO
// slot 20609
    20609, 65360,
// ANGLFIND.agc:188
//			METHOD1		# COFX G COFY OR COFZ
// slot 20610
    20610, 37176,
// ANGLFIND.agc:189
//COMP12		DLOAD	DSU
// slot 20611
    20611, 38346,
// ANGLFIND.agc:190
//			COF +2
// slot 20612
    20612, 3530,
// ANGLFIND.agc:191
//			COF +4
// slot 20613
    20613, 3534,
// ANGLFIND.agc:192
//		BMN
// slot 20614
    20614, 65344,
// ANGLFIND.agc:193
//			METHOD3		# COFZ G COFY OR COFX
// slot 20615
    20615, 37216,
// ANGLFIND.agc:194
//
// ANGLFIND.agc:195
//METHOD2		DLOAD	BPL		# COFY MAX
// slot 20616
    20616, 42186,
// ANGLFIND.agc:196
//			COFSKEW +2	# UY
// slot 20617
    20617, 3478,
// ANGLFIND.agc:197
//			U2POS
// slot 20618
    20618, 37148,
// ANGLFIND.agc:198
//		VLOAD	VCOMP
// slot 20619
    20619, 48890,
// ANGLFIND.agc:199
//			COF
// slot 20620
    20620, 3526,
// ANGLFIND.agc:200
//		STORE	COF
// slot 20621
    20621, 3526,
// ANGLFIND.agc:201
//U2POS		DLOAD	BPL
// slot 20622
    20622, 42186,
// ANGLFIND.agc:202
//			MFISYM +2	# UX UY
// slot 20623
    20623, 3442,
// ANGLFIND.agc:203
//			OKU21
// slot 20624
    20624, 37160,
// ANGLFIND.agc:204
//		DLOAD	DCOMP		# SIGN OF UX OPPOSITE TO UY
// slot 20625
    20625, 48842,
// ANGLFIND.agc:205
//			COF
// slot 20626
    20626, 3526,
// ANGLFIND.agc:206
//		STORE	COF
// slot 20627
    20627, 3526,
// ANGLFIND.agc:207
//OKU21		DLOAD	BPL
// slot 20628
    20628, 42186,
// ANGLFIND.agc:208
//			MFISYM +10D	# UY UZ
// slot 20629
    20629, 3458,
// ANGLFIND.agc:209
//			LOCSKIRT
// slot 20630
    20630, 37822,
// ANGLFIND.agc:210
//		DLOAD	DCOMP		# SIGN OF UZ OPPOSITE TO UY
// slot 20631
    20631, 48842,
// ANGLFIND.agc:211
//			COF +4
// slot 20632
    20632, 3534,
// ANGLFIND.agc:212
//		STORE	COF +4
// slot 20633
    20633, 3534,
// ANGLFIND.agc:213
//		GOTO
// slot 20634
    20634, 65360,
// ANGLFIND.agc:214
//			LOCSKIRT
// slot 20635
    20635, 37822,
// ANGLFIND.agc:215
//METHOD1		DLOAD	BPL		# COFX MAX
// slot 20636
    20636, 42186,
// ANGLFIND.agc:216
//			COFSKEW		# UX
// slot 20637
    20637, 3474,
// ANGLFIND.agc:217
//			U1POS
// slot 20638
    20638, 37188,
// ANGLFIND.agc:218
//		VLOAD	VCOMP
// slot 20639
    20639, 48890,
// ANGLFIND.agc:219
//			COF
// slot 20640
    20640, 3526,
// ANGLFIND.agc:220
//		STORE	COF
// slot 20641
    20641, 3526,
// ANGLFIND.agc:221
//U1POS		DLOAD	BPL
// slot 20642
    20642, 42186,
// ANGLFIND.agc:222
//			MFISYM +2	# UX UY
// slot 20643
    20643, 3442,
// ANGLFIND.agc:223
//			OKU12
// slot 20644
    20644, 37200,
// ANGLFIND.agc:224
//		DLOAD	DCOMP
// slot 20645
    20645, 48842,
// ANGLFIND.agc:225
//			COF +2		# SIGN OF UY OPPOSITE TO UX
// slot 20646
    20646, 3530,
// ANGLFIND.agc:226
//		STORE	COF +2
// slot 20647
    20647, 3530,
// ANGLFIND.agc:227
//OKU12		DLOAD	BPL
// slot 20648
    20648, 42186,
// ANGLFIND.agc:228
//			MFISYM +4	# UX UZ
// slot 20649
    20649, 3446,
// ANGLFIND.agc:229
//			LOCSKIRT
// slot 20650
    20650, 37822,
// ANGLFIND.agc:230
//		DLOAD	DCOMP		# SIGN OF UZ OPPOSITE TO UY
// slot 20651
    20651, 48842,
// ANGLFIND.agc:231
//			COF +4
// slot 20652
    20652, 3534,
// ANGLFIND.agc:232
//		STORE	COF +4
// slot 20653
    20653, 3534,
// ANGLFIND.agc:233
//		GOTO
// slot 20654
    20654, 65360,
// ANGLFIND.agc:234
//			LOCSKIRT
// slot 20655
    20655, 37822,
// ANGLFIND.agc:235
//METHOD3		DLOAD	BPL		# COFZ MAX
// slot 20656
    20656, 42186,
// ANGLFIND.agc:236
//# Page 403
// ANGLFIND.agc:237
//			COFSKEW	+4	# UZ
// slot 20657
    20657, 3482,
// ANGLFIND.agc:238
//			U3POS
// slot 20658
    20658, 37228,
// ANGLFIND.agc:239
//		VLOAD	VCOMP
// slot 20659
    20659, 48890,
// ANGLFIND.agc:240
//			COF
// slot 20660
    20660, 3526,
// ANGLFIND.agc:241
//		STORE	COF
// slot 20661
    20661, 3526,
// ANGLFIND.agc:242
//U3POS		DLOAD	BPL
// slot 20662
    20662, 42186,
// ANGLFIND.agc:243
//			MFISYM +4	# UX UZ
// slot 20663
    20663, 3446,
// ANGLFIND.agc:244
//			OKU31
// slot 20664
    20664, 37240,
// ANGLFIND.agc:245
//		DLOAD	DCOMP
// slot 20665
    20665, 48842,
// ANGLFIND.agc:246
//			COF		# SIGN OF UX OPPOSITE TO UZ
// slot 20666
    20666, 3526,
// ANGLFIND.agc:247
//		STORE	COF
// slot 20667
    20667, 3526,
// ANGLFIND.agc:248
//OKU31		DLOAD	BPL
// slot 20668
    20668, 42186,
// ANGLFIND.agc:249
//			MFISYM +10D	# UY UZ
// slot 20669
    20669, 3458
)).

agcAotInstallSourceRope(list(
// ANGLFIND.agc:250
//			LOCSKIRT
// slot 20670
    20670, 37822,
// ANGLFIND.agc:251
//		DLOAD	DCOMP
// slot 20671
    20671, 48842,
// ANGLFIND.agc:252
//			COF +2		# SIGN OF UY OPPOSITE TO UZ
// slot 20672
    20672, 3530,
// ANGLFIND.agc:253
//		STORE	COF +2
// slot 20673
    20673, 3530,
// ANGLFIND.agc:254
//		GOTO
// slot 20674
    20674, 65360,
// ANGLFIND.agc:255
//			LOCSKIRT
// slot 20675
    20675, 37822,
// ANGLFIND.agc:256
//
// ANGLFIND.agc:257
//# Page 404
// ANGLFIND.agc:258
//# MATRIX OPERATIONS
// ANGLFIND.agc:259
//
// ANGLFIND.agc:260
//MXM3		SETPD			# MXM3 MULTIPLIES 2 3X3 MATRICES
// slot 20676
    20676, 65282,
// ANGLFIND.agc:261
//			0		# AND LEAVES RESULT IN PD LIST
// slot 20677
    20677, 2,
// ANGLFIND.agc:262
//		DLOAD*	PDDL*		# ADDRESS OF 1ST MATRIX IN XR1
// slot 20678
    20678, 54214,
// ANGLFIND.agc:263
//			12D,2		# ADDRESS OF 2ND MATRIX IN XR2
// slot 20679
    20679, 65508,
// ANGLFIND.agc:264
//			6,2
// slot 20680
    20680, 65520,
// ANGLFIND.agc:265
//		PDDL*	VDEF		# DEFINE VECTOR M2(COL 1)
// slot 20681
    20681, 46758,
// ANGLFIND.agc:266
//			0,2
// slot 20682
    20682, 65532,
// ANGLFIND.agc:267
//		MXV*	PDDL*		# M1XM2(COL 1) IN PD
// slot 20683
    20683, 54174,
// ANGLFIND.agc:268
//			0,1
// slot 20684
    20684, 2,
// ANGLFIND.agc:269
//			14D,2
// slot 20685
    20685, 65504,
// ANGLFIND.agc:270
//		PDDL*	PDDL*
// slot 20686
    20686, 54182,
// ANGLFIND.agc:271
//			8D,2
// slot 20687
    20687, 65516,
// ANGLFIND.agc:272
//			2,2
// slot 20688
    20688, 65528,
// ANGLFIND.agc:273
//		VDEF	MXV*		# DEFINE VECTOR M2(COL 2)
// slot 20689
    20689, 53100,
// ANGLFIND.agc:274
//			0,1
// slot 20690
    20690, 2,
// ANGLFIND.agc:275
//		PDDL*	PDDL*		# M1XM2(COL 2) IN PD
// slot 20691
    20691, 54182,
// ANGLFIND.agc:276
//			16D,2
// slot 20692
    20692, 65500,
// ANGLFIND.agc:277
//			10D,2
// slot 20693
    20693, 65512,
// ANGLFIND.agc:278
//		PDDL*	VDEF		# DEFINE VECTOR M2(COL 3)
// slot 20694
    20694, 46758,
// ANGLFIND.agc:279
//			4,2
// slot 20695
    20695, 65524,
// ANGLFIND.agc:280
//		MXV*	PUSH		# M1XM2(COL 3) IN PD
// slot 20696
    20696, 34462,
// ANGLFIND.agc:281
//			0,1
// slot 20697
    20697, 2,
// ANGLFIND.agc:282
//		GOTO
// slot 20698
    20698, 65360,
// ANGLFIND.agc:283
//			TRNSPSPD	# REVERSE ROWS AND COLS IN PD AND
// slot 20699
    20699, 37318,
// ANGLFIND.agc:284
//					# RETURN WITH M1XM2 IN PD LIST
// ANGLFIND.agc:285
//
// ANGLFIND.agc:286
//TRANSPOS	SETPD	VLOAD*		# TRANSPOS TRANSPOSES A 3X3 MATRIX
// slot 20700
    20700, 64258,
// ANGLFIND.agc:287
//			0		#  AND LEAVES RESULT IN PD LIST
// slot 20701
    20701, 2,
// ANGLFIND.agc:288
//			0,1		# MATRIX ADDRESS IN XR1
// slot 20702
    20702, 2,
// ANGLFIND.agc:289
//		PDVL*	PDVL*
// slot 20703
    20703, 52118,
// ANGLFIND.agc:290
//			6,1
// slot 20704
    20704, 14,
// ANGLFIND.agc:291
//			12D,1
// slot 20705
    20705, 26,
// ANGLFIND.agc:292
//		PUSH			# MATRIX IN PD
// slot 20706
    20706, 65292,
// ANGLFIND.agc:293
//TRNSPSPD	DLOAD	PDDL		# ENTER WITH MATRIX IN PD LIST
// slot 20707
    20707, 54730,
// ANGLFIND.agc:294
//			2
// slot 20708
    20708, 6,
// ANGLFIND.agc:295
//			6
// slot 20709
    20709, 14,
// ANGLFIND.agc:296
//		STODL	2
// slot 20710
    20710, 12294,
// ANGLFIND.agc:297
//		STADR
// slot 20711
    20711, 65324,
// ANGLFIND.agc:298
//		STODL	6
// slot 20712
    20712, 53232,
// ANGLFIND.agc:299
//			4
// slot 20713
    20713, 10,
// ANGLFIND.agc:300
//		PDDL
// slot 20714
    20714, 65450,
// ANGLFIND.agc:301
//			12D
// slot 20715
    20715, 26,
// ANGLFIND.agc:302
//		STODL	4
// slot 20716
    20716, 12298,
// ANGLFIND.agc:303
//		STADR
// slot 20717
    20717, 65324,
// ANGLFIND.agc:304
//		STODL	12D
// slot 20718
    20718, 53220,
// ANGLFIND.agc:305
//			10D
// slot 20719
    20719, 22,
// ANGLFIND.agc:306
//		PDDL
// slot 20720
    20720, 65450,
// ANGLFIND.agc:307
//# Page 405
// ANGLFIND.agc:308
//			14D
// slot 20721
    20721, 30,
// ANGLFIND.agc:309
//		STODL	10D
// slot 20722
    20722, 12310,
// ANGLFIND.agc:310
//		STADR
// slot 20723
    20723, 65324,
// ANGLFIND.agc:311
//		STORE	14D
// slot 20724
    20724, 65504,
// ANGLFIND.agc:312
//		RVQ			# RETURN WITH TRANSPOSED MATRIX IN PD LIST
// slot 20725
    20725, 65308,
// ANGLFIND.agc:313
//MINANG		DEC	.00069375
// slot 20726
    20726, 22,
// ANGLFIND.agc:314
//MAXANG		DEC	.472222
// slot 20727
    20727, 15474,
// ANGLFIND.agc:315
//# GIMBAL LOCK CONSTANTS
// ANGLFIND.agc:316
//
// ANGLFIND.agc:317
//# D = MGA CORRESPONDING TO GIMBAL LOCK = 60 DEGREES
// ANGLFIND.agc:318
//# NGL = BUFFER ANGLE (TO AVOID DIVISIONS BY ZERO) = 2 DEGREES
// ANGLFIND.agc:319
//
// ANGLFIND.agc:320
//SD		DEC	.433015		# = SIN(D)				$2
// slot 20728
    20728, 14190,
// ANGLFIND.agc:321
//K3S1		DEC	.86603		# = SIN(D)				$2
// slot 20729
    20729, 28378,
// ANGLFIND.agc:322
//K4		DEC	-.25		# = - COS(D)				$2
// slot 20730
    20730, 57342,
// ANGLFIND.agc:323
//K4SQ		DEC	.125		# = COS(D)COS(D)			$2
// slot 20731
    20731, 4096,
// ANGLFIND.agc:324
//SNGLCD		DEC	.008725		# = SIN(NGL)COS(D)			$2
// slot 20732
    20732, 286,
// ANGLFIND.agc:325
//CNGL		DEC	.499695		# = COS(NGL)				$2
// slot 20733
    20733, 16374
)).

// bank 22, slots 20734-20740
function agcAotUnit1193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20736 {
        if slot <= 20734 {
// ANGLFIND.agc:326
//READCDUK	INHINT			# LOAD T(MPAC) WITH THE CURRENT CDU ANGLES
// slot 20734
            if slot <> 20734 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20735 {
// ANGLFIND.agc:327
//		CA	CDUZ
// slot 20735
                if slot <> 20735 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// ANGLFIND.agc:328
//		TS	MPAC +2
// slot 20736
                if slot <> 20736 or instruction <> 22638 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22638, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 20738 {
            if slot <= 20737 {
// ANGLFIND.agc:329
//		EXTEND
// slot 20737
                if slot <> 20737 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ANGLFIND.agc:330
//		DCA	CDUX
// slot 20738
                if slot <> 20738 or instruction <> 12315 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 27, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 20739 {
// ANGLFIND.agc:331
//		RELINT
// slot 20739
                if slot <> 20739 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// ANGLFIND.agc:332
//		TCF	TLOAD +6
// slot 20740
                if slot <> 20740 or instruction <> 7461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1193] to agcAotUnit1193@.

agcAotInstallSourceRope(list(
// ANGLFIND.agc:333
//		BANK	16
// ANGLFIND.agc:334
//		SETLOC	KALCMON2
// ANGLFIND.agc:335
//		BANK
// ANGLFIND.agc:336
//
// ANGLFIND.agc:337
//		COUNT*	$$/KALC
// ANGLFIND.agc:338
//
// ANGLFIND.agc:339
//CDUTODCM	AXT,1	SSP		# SUBROUTINE TO COMPUTE  DIRECTION COSINE
// slot 20741
    20741, 55792,
// ANGLFIND.agc:340
//		OCT	3		# MATRIX RELATING S/C AXES TO STABLE
// slot 20742
    20742, 6,
// ANGLFIND.agc:341
//			S1		# MEMBER AXES FROM 3 CDU ANGLES IN T(MPAC)
// slot 20743
    20743, 82,
// ANGLFIND.agc:342
//		OCT	1		# SET XR1, S1 AND PD FOR LOOP
// slot 20744
    20744, 2,
// ANGLFIND.agc:343
//		STORE	7
// slot 20745
    20745, 16,
// ANGLFIND.agc:344
//		SETPD
// slot 20746
    20746, 65282,
// ANGLFIND.agc:345
//			0
// slot 20747
    20747, 2,
// ANGLFIND.agc:346
//LOOPSIN		SLOAD*	RTB
// slot 20748
    20748, 40118,
// ANGLFIND.agc:347
//			10D,1
// slot 20749
    20749, 22,
// ANGLFIND.agc:348
//			CDULOGIC
// slot 20750
    20750, 38550,
// ANGLFIND.agc:349
//		STORE	10D		# LOAD PD WITH 0 SIN(PHI)
// slot 20751
    20751, 22,
// ANGLFIND.agc:350
//		SIN	PDDL		#	       2 COS(PHI)
// slot 20752
    20752, 54748,
// ANGLFIND.agc:351
//			10D		#	       4 SIN(THETA)
// slot 20753
    20753, 22,
// ANGLFIND.agc:352
//		COS	PUSH		#	       6 COS(THETA)
// slot 20754
    20754, 34508,
// ANGLFIND.agc:353
//		TIX,1	DLOAD		#	       8 SIN(PSI)
// slot 20755
    20755, 58752,
// ANGLFIND.agc:354
//			LOOPSIN		#	      10 COS(PSI)
// slot 20756
    20756, 37400,
// ANGLFIND.agc:355
//			6
// slot 20757
    20757, 14,
// ANGLFIND.agc:356
//		DMP	SL1
// slot 20758
    20758, 59914,
// ANGLFIND.agc:357
//			10D
// slot 20759
    20759, 22,
// ANGLFIND.agc:358
//# Page 406
// ANGLFIND.agc:359
//		STORE	0,2
// slot 20760
    20760, 8194,
// ANGLFIND.agc:360
//		DLOAD
// slot 20761
    20761, 65482,
// ANGLFIND.agc:361
//			4
// slot 20762
    20762, 10,
// ANGLFIND.agc:362
//		DMP	PDDL
// slot 20763
    20763, 54538,
// ANGLFIND.agc:363
//			0		# (PD6 SIN(THETA)SIN(PHI))
// slot 20764
    20764, 2,
// ANGLFIND.agc:364
//			6
// slot 20765
    20765, 14,
// ANGLFIND.agc:365
//		DMP	DMP
// slot 20766
    20766, 34058,
// ANGLFIND.agc:366
//			8D
// slot 20767
    20767, 18,
// ANGLFIND.agc:367
//			2
// slot 20768
    20768, 6,
// ANGLFIND.agc:368
//		SL1	BDSU
// slot 20769
    20769, 37332,
// ANGLFIND.agc:369
//			12D
// slot 20770
    20770, 26,
// ANGLFIND.agc:370
//		SL1
// slot 20771
    20771, 65492,
// ANGLFIND.agc:371
//		STORE	2,2
// slot 20772
    20772, 8198,
// ANGLFIND.agc:372
//		DLOAD
// slot 20773
    20773, 65482,
// ANGLFIND.agc:373
//			2
// slot 20774
    20774, 6,
// ANGLFIND.agc:374
//		DMP	PDDL		# (PD7 COS(PHI)SIN(THETA)) SCALED 4
// slot 20775
    20775, 54538,
// ANGLFIND.agc:375
//			4
// slot 20776
    20776, 10,
// ANGLFIND.agc:376
//			6
// slot 20777
    20777, 14,
// ANGLFIND.agc:377
//		DMP	DMP
// slot 20778
    20778, 34058,
// ANGLFIND.agc:378
//			8D
// slot 20779
    20779, 18,
// ANGLFIND.agc:379
//			0
// slot 20780
    20780, 2,
// ANGLFIND.agc:380
//		SL1
// slot 20781
    20781, 65492,
// ANGLFIND.agc:381
//		DAD	SL1
// slot 20782
    20782, 59930,
// ANGLFIND.agc:382
//			14D
// slot 20783
    20783, 30,
// ANGLFIND.agc:383
//		STORE	4,2
// slot 20784
    20784, 8202,
// ANGLFIND.agc:384
//		DLOAD
// slot 20785
    20785, 65482,
// ANGLFIND.agc:385
//			8D
// slot 20786
    20786, 18,
// ANGLFIND.agc:386
//		STORE	6,2
// slot 20787
    20787, 8206,
// ANGLFIND.agc:387
//		DLOAD
// slot 20788
    20788, 65482,
// ANGLFIND.agc:388
//			10D
// slot 20789
    20789, 22,
// ANGLFIND.agc:389
//		DMP	SL1
// slot 20790
    20790, 59914,
// ANGLFIND.agc:390
//			2
// slot 20791
    20791, 6,
// ANGLFIND.agc:391
//		STORE	8D,2
// slot 20792
    20792, 8210,
// ANGLFIND.agc:392
//		DLOAD
// slot 20793
    20793, 65482,
// ANGLFIND.agc:393
//			10D
// slot 20794
    20794, 22,
// ANGLFIND.agc:394
//		DMP	DCOMP
// slot 20795
    20795, 48650,
// ANGLFIND.agc:395
//			0
// slot 20796
    20796, 2,
// ANGLFIND.agc:396
//		SL1
// slot 20797
    20797, 65492,
// ANGLFIND.agc:397
//		STORE	10D,2
// slot 20798
    20798, 8214,
// ANGLFIND.agc:398
//		DLOAD
// slot 20799
    20799, 65482,
// ANGLFIND.agc:399
//			4
// slot 20800
    20800, 10,
// ANGLFIND.agc:400
//		DMP	DCOMP
// slot 20801
    20801, 48650,
// ANGLFIND.agc:401
//			10D
// slot 20802
    20802, 22,
// ANGLFIND.agc:402
//		SL1
// slot 20803
    20803, 65492,
// ANGLFIND.agc:403
//		STORE	12D,2
// slot 20804
    20804, 8218,
// ANGLFIND.agc:404
//		DLOAD
// slot 20805
    20805, 65482,
// ANGLFIND.agc:405
//		DMP	SL1		# (PUSH UP 7)
// slot 20806
    20806, 59914,
// ANGLFIND.agc:406
//			8D
// slot 20807
    20807, 18,
// ANGLFIND.agc:407
//		PDDL	DMP		# (PD7 COS(PHI)SIN(THETA)SIN(PSI)) SCALE4
// slot 20808
    20808, 34218,
// ANGLFIND.agc:408
//			6
// slot 20809
    20809, 14,
// ANGLFIND.agc:409
//# Page 407
// ANGLFIND.agc:410
//			0
// slot 20810
    20810, 2,
// ANGLFIND.agc:411
//		DAD	SL1		#  (PUSH UP 7)
// slot 20811
    20811, 59930,
// ANGLFIND.agc:412
//		STADR			# C7=COS(PHI)SIN(THETA)SIN(PSI)
// slot 20812
    20812, 65324,
// ANGLFIND.agc:413
//		STORE	14D,2
// slot 20813
    20813, 57312,
// ANGLFIND.agc:414
//		DLOAD
// slot 20814
    20814, 65482,
// ANGLFIND.agc:415
//		DMP	SL1		#  (PUSH UP 6)
// slot 20815
    20815, 59914,
// ANGLFIND.agc:416
//			8D
// slot 20816
    20816, 18,
// ANGLFIND.agc:417
//		PDDL	DMP		#  (PD6 SIN(THETA)SIN(PHI)SIN(PSI)) SCALE4
// slot 20817
    20817, 34218,
// ANGLFIND.agc:418
//			6
// slot 20818
    20818, 14,
// ANGLFIND.agc:419
//			2
// slot 20819
    20819, 6,
// ANGLFIND.agc:420
//		DSU	SL1		#  (PUSH UP 6)
// slot 20820
    20820, 59946,
// ANGLFIND.agc:421
//		STADR
// slot 20821
    20821, 65324,
// ANGLFIND.agc:422
//		STORE	16D,2		# C8=-SIN(THETA)SIN(PHI)SIN(PSI)
// slot 20822
    20822, 57308,
// ANGLFIND.agc:423
//		RVQ			#  +COS(THETA)COS(PHI)
// slot 20823
    20823, 65308,
// ANGLFIND.agc:424
//ENDOCM		EQUALS
// ANGLFIND.agc:425
//
// ANGLFIND.agc:426
//		BANK	15
// ANGLFIND.agc:427
//		SETLOC	KALCMON1
// ANGLFIND.agc:428
//		BANK
// ANGLFIND.agc:429
//
// ANGLFIND.agc:430
//# CALCULATION OF THE MATRIX DEL......
// ANGLFIND.agc:431
//#
// ANGLFIND.agc:432
//#	*      *               --T           *
// ANGLFIND.agc:433
//#	DEL = (IDMATRIX)COS(A)+UU (1-COS(A))+UX SIN(A)		SCALED 1
// ANGLFIND.agc:434
//#
// ANGLFIND.agc:435
//#             -
// ANGLFIND.agc:436
//#	WHERE U IS A UNIT VECTOR (DP SCALED 2) ALONG THE AXIS OF ROTATION.
// ANGLFIND.agc:437
//#	A IS THE ANGLE OF ROTATION (DP SCALED 2)
// ANGLFIND.agc:438
//#					   -
// ANGLFIND.agc:439
//#	UPON ENTRY THE STARTING ADDRESS OF U IS COF, AND A IS IN MPAC
// ANGLFIND.agc:440
//
// ANGLFIND.agc:441
//		COUNT	22/KALC
// ANGLFIND.agc:442
//
// ANGLFIND.agc:443
//DELCOMP		SETPD	PUSH		# MPAC CONTAINS THE ANGLE A
// slot 20824
    20824, 34306,
// ANGLFIND.agc:444
//			0
// slot 20825
    20825, 2,
// ANGLFIND.agc:445
//		SIN	PDDL		# PD0 = SIN(A)
// slot 20826
    20826, 54748,
// ANGLFIND.agc:446
//		COS	PUSH		# PD2 = COS(A)
// slot 20827
    20827, 34508,
// ANGLFIND.agc:447
//		SR2	PDDL		# PD2 = COS(A)				$8
// slot 20828
    20828, 54660,
// ANGLFIND.agc:448
//		BDSU	BOVB		# PD4 = 1-COS(A)			$2
// slot 20829
    20829, 33826,
// ANGLFIND.agc:449
//			DPHALF
// slot 20830
    20830, 13750,
// ANGLFIND.agc:450
//			SIGNMPAC
// slot 20831
    20831, 38804,
// ANGLFIND.agc:451
//
// ANGLFIND.agc:452
//# COMPUTE THE DIAGONAL COMPONENTS OF DEL
// ANGLFIND.agc:453
//
// ANGLFIND.agc:454
//		PDDL
// slot 20832
    20832, 65450,
// ANGLFIND.agc:455
//			COF
// slot 20833
    20833, 3526,
// ANGLFIND.agc:456
//		DSQ	DMP
// slot 20834
    20834, 34204,
// ANGLFIND.agc:457
//			4
// slot 20835
    20835, 10,
// ANGLFIND.agc:458
//		DAD	SL3
// slot 20836
    20836, 43546,
// ANGLFIND.agc:459
//# Page 408
// ANGLFIND.agc:460
//			2
// slot 20837
    20837, 6
)).

agcAotInstallSourceRope(list(
// ANGLFIND.agc:461
//		BOVB
// slot 20838
    20838, 65288,
// ANGLFIND.agc:462
//			SIGNMPAC
// slot 20839
    20839, 38804,
// ANGLFIND.agc:463
//		STODL	DEL		# UX UX(U-COS(A)) +COS(A)		$1
// slot 20840
    20840, 15916,
// ANGLFIND.agc:464
//			COF +2
// slot 20841
    20841, 3530,
// ANGLFIND.agc:465
//		DSQ	DMP
// slot 20842
    20842, 34204,
// ANGLFIND.agc:466
//			4
// slot 20843
    20843, 10,
// ANGLFIND.agc:467
//		DAD	SL3
// slot 20844
    20844, 43546,
// ANGLFIND.agc:468
//			2
// slot 20845
    20845, 6,
// ANGLFIND.agc:469
//		BOVB
// slot 20846
    20846, 65288,
// ANGLFIND.agc:470
//			SIGNMPAC
// slot 20847
    20847, 38804,
// ANGLFIND.agc:471
//		STODL	DEL +8D		# UY UY(1-COS(A)) +COS(A)		$1
// slot 20848
    20848, 15932,
// ANGLFIND.agc:472
//			COF +4
// slot 20849
    20849, 3534,
// ANGLFIND.agc:473
//		DSQ	DMP
// slot 20850
    20850, 34204,
// ANGLFIND.agc:474
//			4
// slot 20851
    20851, 10,
// ANGLFIND.agc:475
//		DAD	SL3
// slot 20852
    20852, 43546,
// ANGLFIND.agc:476
//			2
// slot 20853
    20853, 6,
// ANGLFIND.agc:477
//		BOVB
// slot 20854
    20854, 65288,
// ANGLFIND.agc:478
//			SIGNMPAC
// slot 20855
    20855, 38804,
// ANGLFIND.agc:479
//		STORE	DEL +16D	# UZ UZ(1-COS(A)) +COS(A)		$1
// slot 20856
    20856, 3660,
// ANGLFIND.agc:480
//
// ANGLFIND.agc:481
//# COMPUTE THE OFF DIAGONAL TERMS OF DEL
// ANGLFIND.agc:482
//
// ANGLFIND.agc:483
//		DLOAD	DMP
// slot 20857
    20857, 34250,
// ANGLFIND.agc:484
//			COF
// slot 20858
    20858, 3526,
// ANGLFIND.agc:485
//			COF +2
// slot 20859
    20859, 3530,
// ANGLFIND.agc:486
//		DMP	SL1
// slot 20860
    20860, 59914,
// ANGLFIND.agc:487
//			4
// slot 20861
    20861, 10,
// ANGLFIND.agc:488
//		PDDL	DMP		# D6  UX UY (1-COS A)			$ 4
// slot 20862
    20862, 34218,
// ANGLFIND.agc:489
//			COF +4
// slot 20863
    20863, 3534,
// ANGLFIND.agc:490
//			0
// slot 20864
    20864, 2,
// ANGLFIND.agc:491
//		PUSH	DAD		# D8  UZ SIN A				$ 4
// slot 20865
    20865, 36108,
// ANGLFIND.agc:492
//			6
// slot 20866
    20866, 14,
// ANGLFIND.agc:493
//		SL2	BOVB
// slot 20867
    20867, 33940,
// ANGLFIND.agc:494
//			SIGNMPAC
// slot 20868
    20868, 38804,
// ANGLFIND.agc:495
//		STODL	DEL +6
// slot 20869
    20869, 15928,
// ANGLFIND.agc:496
//		BDSU	SL2
// slot 20870
    20870, 51746,
// ANGLFIND.agc:497
//		BOVB
// slot 20871
    20871, 65288,
// ANGLFIND.agc:498
//			SIGNMPAC
// slot 20872
    20872, 38804,
// ANGLFIND.agc:499
//		STODL	DEL +2
// slot 20873
    20873, 15920,
// ANGLFIND.agc:500
//			COF
// slot 20874
    20874, 3526,
// ANGLFIND.agc:501
//		DMP	DMP
// slot 20875
    20875, 34058,
// ANGLFIND.agc:502
//			COF +4
// slot 20876
    20876, 3534,
// ANGLFIND.agc:503
//			4
// slot 20877
    20877, 10,
// ANGLFIND.agc:504
//		SL1	PDDL		# D6  UX UZ (1-COS A )		$ 4
// slot 20878
    20878, 54740,
// ANGLFIND.agc:505
//			COF +2
// slot 20879
    20879, 3530,
// ANGLFIND.agc:506
//		DMP	PUSH		# D8  UY SIN(A)
// slot 20880
    20880, 34314,
// ANGLFIND.agc:507
//			0
// slot 20881
    20881, 2,
// ANGLFIND.agc:508
//		DAD	SL2
// slot 20882
    20882, 51738,
// ANGLFIND.agc:509
//			6
// slot 20883
    20883, 14,
// ANGLFIND.agc:510
//# Page 409
// ANGLFIND.agc:511
//		BOVB
// slot 20884
    20884, 65288,
// ANGLFIND.agc:512
//			SIGNMPAC
// slot 20885
    20885, 38804,
// ANGLFIND.agc:513
//		STODL	DEL +4		# UX UZ (1-COS(A))+UY SIN(A)
// slot 20886
    20886, 15924,
// ANGLFIND.agc:514
//		BDSU	SL2
// slot 20887
    20887, 51746,
// ANGLFIND.agc:515
//		BOVB
// slot 20888
    20888, 65288,
// ANGLFIND.agc:516
//			SIGNMPAC
// slot 20889
    20889, 38804,
// ANGLFIND.agc:517
//		STODL	DEL +12D	# UX UZ (U-COS(A))-UY SIN(A)
// slot 20890
    20890, 15940,
// ANGLFIND.agc:518
//			COF +2
// slot 20891
    20891, 3530,
// ANGLFIND.agc:519
//		DMP	DMP
// slot 20892
    20892, 34058,
// ANGLFIND.agc:520
//			COF +4
// slot 20893
    20893, 3534,
// ANGLFIND.agc:521
//			4
// slot 20894
    20894, 10,
// ANGLFIND.agc:522
//		SL1	PDDL		# D6  UY UZ (1-COS(A))		$ 4
// slot 20895
    20895, 54740,
// ANGLFIND.agc:523
//			COF
// slot 20896
    20896, 3526,
// ANGLFIND.agc:524
//		DMP	PUSH		# D6  UX SIN(A)
// slot 20897
    20897, 34314,
// ANGLFIND.agc:525
//			0
// slot 20898
    20898, 2,
// ANGLFIND.agc:526
//		DAD	SL2
// slot 20899
    20899, 51738,
// ANGLFIND.agc:527
//			6
// slot 20900
    20900, 14,
// ANGLFIND.agc:528
//		BOVB
// slot 20901
    20901, 65288,
// ANGLFIND.agc:529
//			SIGNMPAC
// slot 20902
    20902, 38804,
// ANGLFIND.agc:530
//		STODL	DEL +14D	# UY UZ(1-COS(A)) +UX SIN(A)
// slot 20903
    20903, 15944,
// ANGLFIND.agc:531
//		BDSU	SL2
// slot 20904
    20904, 51746,
// ANGLFIND.agc:532
//		BOVB
// slot 20905
    20905, 65288,
// ANGLFIND.agc:533
//			SIGNMPAC
// slot 20906
    20906, 38804,
// ANGLFIND.agc:534
//		STORE	DEL +10D	# UY UZ (1-COS(A)) -UX SIN(A)
// slot 20907
    20907, 3648,
// ANGLFIND.agc:535
//		RVQ
// slot 20908
    20908, 65308,
// ANGLFIND.agc:536
//
// ANGLFIND.agc:537
//# DIRECTION COSINE MATRIX TO CDU ANGLE ROUTINE
// ANGLFIND.agc:538
//# X1 CONTAINS THE COMPLEMENT OF THE STARTING ADDRESS FOR MATRIX (SCALED 2)
// ANGLFIND.agc:539
//# LEAVES CDU ANGLES SCALED 2PI IN V(MPAC)
// ANGLFIND.agc:540
//# COS(MGA) WILL BE LEFT IN S1 (SCALED 1)
// ANGLFIND.agc:541
//#
// ANGLFIND.agc:542
//# THE DIRECTION COSINE MATRIX RELATING S/C AXES TO STABLE MEMBER AXES CAN BE WRITTEN AS***
// ANGLFIND.agc:543
//#
// ANGLFIND.agc:544
//#	C =COS(THETA)COS(PSI)
// ANGLFIND.agc:545
//#	 0
// ANGLFIND.agc:546
//#	C =-COS(THETA)SIN(PSI)COS(PHI)+SI (THETA)SIN(PHI)
// ANGLFIND.agc:547
//#	 1
// ANGLFIND.agc:548
//#	C =COS(THETA)SIN(PSI)SIN(PHI) + S N(THETA)COS(PHI)
// ANGLFIND.agc:549
//#	 2
// ANGLFIND.agc:550
//#	C =SIN(PSI)
// ANGLFIND.agc:551
//#	 3
// ANGLFIND.agc:552
//#	C =COS(PSI)COS(PHI)
// ANGLFIND.agc:553
//#	 4
// ANGLFIND.agc:554
//#	C =-COS(PSI)SIN(PHI)
// ANGLFIND.agc:555
//#	 5
// ANGLFIND.agc:556
//#	C =-SIN(THETA)COS(PSI)
// ANGLFIND.agc:557
//#	 6
// ANGLFIND.agc:558
//#	C =SIN(THETA)SIN(PSI)COS(PHI)+COS THETA)SIN(PHI)
// ANGLFIND.agc:559
//#	 7
// ANGLFIND.agc:560
//# Page 410
// ANGLFIND.agc:561
//#	C =-SIN(THETA)SIN(PSI)SIN(PHI)+COS(THETA)COS(PHI)
// ANGLFIND.agc:562
//#	 8
// ANGLFIND.agc:563
//#
// ANGLFIND.agc:564
//#	WHERE	PHI = OGA
// ANGLFIND.agc:565
//#		THETA = IGA
// ANGLFIND.agc:566
//#		PSI = MGA
// ANGLFIND.agc:567
//
// ANGLFIND.agc:568
//DCMTOCDU	DLOAD*	ARCSIN
// slot 20909
    20909, 57030,
// ANGLFIND.agc:569
//			6,1
// slot 20910
    20910, 14,
// ANGLFIND.agc:570
//		PUSH	COS		# PD +0		PSI
// slot 20911
    20911, 58892,
// ANGLFIND.agc:571
//		SL1	BOVB
// slot 20912
    20912, 34004,
// ANGLFIND.agc:572
//			SIGNMPAC
// slot 20913
    20913, 38804,
// ANGLFIND.agc:573
//		STORE	S1
// slot 20914
    20914, 82,
// ANGLFIND.agc:574
//		DLOAD*	DCOMP
// slot 20915
    20915, 48838,
// ANGLFIND.agc:575
//			12D,1
// slot 20916
    20916, 26,
// ANGLFIND.agc:576
//		DDV	ARCSIN
// slot 20917
    20917, 56946,
// ANGLFIND.agc:577
//			S1
// slot 20918
    20918, 82,
// ANGLFIND.agc:578
//		PDDL*	BPL		# PD +2		THETA
// slot 20919
    20919, 42150,
// ANGLFIND.agc:579
//			0,1		# MUST CHECK THE SIGN OF COS(THETA)
// slot 20920
    20920, 2,
// ANGLFIND.agc:580
//			OKTHETA		# TO DETERMINE THE PROPER QUADRANT
// slot 20921
    20921, 37766,
// ANGLFIND.agc:581
//		DLOAD	DCOMP
// slot 20922
    20922, 48842,
// ANGLFIND.agc:582
//		BPL	DAD
// slot 20923
    20923, 36168,
// ANGLFIND.agc:583
//			SUHALFA
// slot 20924
    20924, 37760,
// ANGLFIND.agc:584
//			DPHALF
// slot 20925
    20925, 13750,
// ANGLFIND.agc:585
//		GOTO
// slot 20926
    20926, 65360,
// ANGLFIND.agc:586
//			CALCPHI
// slot 20927
    20927, 37764,
// ANGLFIND.agc:587
//SUHALFA		DSU
// slot 20928
    20928, 65322,
// ANGLFIND.agc:588
//			DPHALF
// slot 20929
    20929, 13750
)).

agcAotInstallSourceRope(list(
// ANGLFIND.agc:589
//CALCPHI		PUSH
// slot 20930
    20930, 65292,
// ANGLFIND.agc:590
//OKTHETA		DLOAD*	DCOMP
// slot 20931
    20931, 48838,
// ANGLFIND.agc:591
//			10D,1
// slot 20932
    20932, 22,
// ANGLFIND.agc:592
//		DDV	ARCSIN
// slot 20933
    20933, 56946,
// ANGLFIND.agc:593
//			S1
// slot 20934
    20934, 82,
// ANGLFIND.agc:594
//		PDDL*	BPL		# PUSH DOWN PHI
// slot 20935
    20935, 42150,
// ANGLFIND.agc:595
//			8D,1
// slot 20936
    20936, 18,
// ANGLFIND.agc:596
//			OKPHI
// slot 20937
    20937, 37798,
// ANGLFIND.agc:597
//		DLOAD	DCOMP		# PUSH UP PHI
// slot 20938
    20938, 48842,
// ANGLFIND.agc:598
//		BPL	DAD
// slot 20939
    20939, 36168,
// ANGLFIND.agc:599
//			SUHALFAP
// slot 20940
    20940, 37792,
// ANGLFIND.agc:600
//			DPHALF
// slot 20941
    20941, 13750,
// ANGLFIND.agc:601
//		GOTO
// slot 20942
    20942, 65360,
// ANGLFIND.agc:602
//			VECOFANG
// slot 20943
    20943, 37800,
// ANGLFIND.agc:603
//SUHALFAP	DSU	GOTO
// slot 20944
    20944, 43050,
// ANGLFIND.agc:604
//			DPHALF
// slot 20945
    20945, 13750,
// ANGLFIND.agc:605
//			VECOFANG
// slot 20946
    20946, 37800,
// ANGLFIND.agc:606
//OKPHI		DLOAD			# PUSH UP PHI
// slot 20947
    20947, 65482,
// ANGLFIND.agc:607
//VECOFANG	VDEF	RVQ
// slot 20948
    20948, 36460
)).

// bank 22, slots 20949-20950
function agcAotUnit1194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20949 {
// ANGLFIND.agc:608
//
// ANGLFIND.agc:609
//# Page 411
// ANGLFIND.agc:610
//# ROUTINE FOR TERMINATING AUTOMATIC MANEUVERS
// ANGLFIND.agc:611
//
// ANGLFIND.agc:612
//NOGOM2		INHINT			# THIS LOCATION ACCESSED BY A BZMF NOGO -2
// slot 20949
        if slot <> 20949 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// ANGLFIND.agc:613
//		TC	BANKCALL
// slot 20950
        if slot <> 20950 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1194] to agcAotUnit1194@.

agcAotInstallSourceRope(list(
// ANGLFIND.agc:614
//		CADR	ZEROEROR
// slot 20951
    20951, 32986
)).

// bank 22, slots 20952-20955
function agcAotUnit1195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20953 {
        if slot <= 20952 {
// ANGLFIND.agc:615
//
// ANGLFIND.agc:616
//NOGO		INHINT
// slot 20952
            if slot <> 20952 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// ANGLFIND.agc:617
//		TC	STOPRATE
// slot 20953
            if slot <> 20953 or instruction <> 2390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20954 {
// ANGLFIND.agc:618
//
// ANGLFIND.agc:619
//					# TERMINATE MANEUVER
// ANGLFIND.agc:620
//		CAF	TWO		# NOTE - ALL RETURNS ARE NOW MADE VIA
// slot 20954
            if slot <> 20954 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// ANGLFIND.agc:621
//		TC	WAITLIST	# GOODEND
// slot 20955
            if slot <> 20955 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1195] to agcAotUnit1195@.

agcAotInstallSourceRope(list(
// ANGLFIND.agc:622
//		EBANK=	BCDU
// ANGLFIND.agc:623
//		2CADR	ENDMANU
// slot 20956 20957
    20956, 2060, 20957, 34924
)).

// bank 22, slots 20958-20958
function agcAotUnit1196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// ANGLFIND.agc:624
//
// ANGLFIND.agc:625
//		TCF	ENDOFJOB
// slot 20958
    if slot <> 20958 or instruction <> 6799 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6799, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1196] to agcAotUnit1196@.

// no code for the lines below
// ANGLFIND.agc:626
//
