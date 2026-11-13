// LEM_GEOMETRY.agc
agcAotInstallSourceRope(list(
// LEM_GEOMETRY.agc:1
//# Copyright:	Public domain.
// LEM_GEOMETRY.agc:2
//# Filename:	LEM_GEOMETRY.agc
// LEM_GEOMETRY.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// LEM_GEOMETRY.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// LEM_GEOMETRY.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// LEM_GEOMETRY.agc:6
//# Assembler:	yaYUL
// LEM_GEOMETRY.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// LEM_GEOMETRY.agc:8
//# Website:	www.ibiblio.org/apollo.
// LEM_GEOMETRY.agc:9
//# Pages:	320-325
// LEM_GEOMETRY.agc:10
//# Mod history:	2009-05-16 RSB	Adapted from the corresponding
// LEM_GEOMETRY.agc:11
//#				Luminary131 file, using page
// LEM_GEOMETRY.agc:12
//#				images from Luminary 1A.
// LEM_GEOMETRY.agc:13
//#
// LEM_GEOMETRY.agc:14
//# This source code has been transcribed or otherwise adapted from
// LEM_GEOMETRY.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// LEM_GEOMETRY.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// LEM_GEOMETRY.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// LEM_GEOMETRY.agc:18
//# in storage size and consequent reduction in image quality as well) are
// LEM_GEOMETRY.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// LEM_GEOMETRY.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// LEM_GEOMETRY.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// LEM_GEOMETRY.agc:22
//# actually created.
// LEM_GEOMETRY.agc:23
//#
// LEM_GEOMETRY.agc:24
//# Notations on the hardcopy document read, in part:
// LEM_GEOMETRY.agc:25
//#
// LEM_GEOMETRY.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// LEM_GEOMETRY.agc:27
//#	16:27 JULY 14, 1969
// LEM_GEOMETRY.agc:28
//
// LEM_GEOMETRY.agc:29
//# Page 320
// LEM_GEOMETRY.agc:30
//		BANK	23
// LEM_GEOMETRY.agc:31
//		SETLOC	LEMGEOM
// LEM_GEOMETRY.agc:32
//		BANK
// LEM_GEOMETRY.agc:33
//
// LEM_GEOMETRY.agc:34
//		SBANK=	LOWSUPER
// LEM_GEOMETRY.agc:35
//		EBANK=	XSM
// LEM_GEOMETRY.agc:36
//
// LEM_GEOMETRY.agc:37
//# THESE TWO ROUTINES COMPUTE THE ACTUAL STATE VECTOR FOR LM,CSM BY ADDING
// LEM_GEOMETRY.agc:38
//# THE CONIC R,V AND THE DEVIATIONSR,V. THE STATE VECTORS ARE CONVERTED TO
// LEM_GEOMETRY.agc:39
//# METERS B-29 AND METERS/CSEC B-7 AND STORED APPROPRIATELY IN RN,VN OR
// LEM_GEOMETRY.agc:40
//# R-OTHER , V-OTHER FOR DOWNLINK. THE ROUTINES NAMES ARE SWITCHED IN THE
// LEM_GEOMETRY.agc:41
//# OTHER VEHICLES COMPUTER.
// LEM_GEOMETRY.agc:42
//#
// LEM_GEOMETRY.agc:43
//# INPUT
// LEM_GEOMETRY.agc:44
//#   STATE VECTOR IN TEMPORARY STORAGE AREA
// LEM_GEOMETRY.agc:45
//#   IF STATE VECTOR IS SCALED POS B27 AND VEL B5
// LEM_GEOMETRY.agc:46
//#      SET X2 TO +2
// LEM_GEOMETRY.agc:47
//#   IF STATE VECTOR IS SCALED POS B29 AND VEL B7
// LEM_GEOMETRY.agc:48
//#      SET X2 TO 0
// LEM_GEOMETRY.agc:49
//#
// LEM_GEOMETRY.agc:50
//# OUTPUT
// LEM_GEOMETRY.agc:51
//#   R(T) IN RN, V(T) IN VN, T IN PIPTIME
// LEM_GEOMETRY.agc:52
//# OR
// LEM_GEOMETRY.agc:53
//#   R(T) IN R-OTHER, V(T) IN V-OTHER   (T IS DEFINED BY T-OTHER)
// LEM_GEOMETRY.agc:54
//
// LEM_GEOMETRY.agc:55
//		COUNT*	$$/GEOM
// LEM_GEOMETRY.agc:56
//SVDWN2		BOF	RVQ		# SW=1=AVETOMID DOING W-MATRIX INTEG.
// slot 13368
    13368, 36376,
// LEM_GEOMETRY.agc:57
//			AVEMIDSW
// slot 13369
    13369, 5084,
// LEM_GEOMETRY.agc:58
//			+1
// slot 13370
    13370, 22646,
// LEM_GEOMETRY.agc:59
//		VLOAD	VSL*
// slot 13371
    13371, 45050,
// LEM_GEOMETRY.agc:60
//			TDELTAV
// slot 13372
    13372, 1698,
// LEM_GEOMETRY.agc:61
//			0 -7,2
// slot 13373
    13373, 48906,
// LEM_GEOMETRY.agc:62
//		VAD	VSL*
// slot 13374
    13374, 44890,
// LEM_GEOMETRY.agc:63
//			RCV
// slot 13375
    13375, 1722,
// LEM_GEOMETRY.agc:64
//			0,2
// slot 13376
    13376, 48892,
// LEM_GEOMETRY.agc:65
//		STOVL	RN
// slot 13377
    13377, 21794,
// LEM_GEOMETRY.agc:66
//			TNUV
// slot 13378
    13378, 1710,
// LEM_GEOMETRY.agc:67
//		VSL*	VAD
// slot 13379
    13379, 44382,
// LEM_GEOMETRY.agc:68
//			0 -4,2
// slot 13380
    13380, 48900,
// LEM_GEOMETRY.agc:69
//			VCV
// slot 13381
    13381, 1734,
// LEM_GEOMETRY.agc:70
//		VSL*
// slot 13382
    13382, 65374,
// LEM_GEOMETRY.agc:71
//			0,2
// slot 13383
    13383, 48892,
// LEM_GEOMETRY.agc:72
//		STODL	VN
// slot 13384
    13384, 13614,
// LEM_GEOMETRY.agc:73
//			TET
// slot 13385
    13385, 1694,
// LEM_GEOMETRY.agc:74
//		STORE	PIPTIME
// slot 13386
    13386, 1338,
// LEM_GEOMETRY.agc:75
//		RVQ
// slot 13387
    13387, 65308,
// LEM_GEOMETRY.agc:76
//# Page 321
// LEM_GEOMETRY.agc:77
//SVDWN1		VLOAD	VSL*
// slot 13388
    13388, 45050,
// LEM_GEOMETRY.agc:78
//			TDELTAV
// slot 13389
    13389, 1698,
// LEM_GEOMETRY.agc:79
//			0 -7,2
// slot 13390
    13390, 48906,
// LEM_GEOMETRY.agc:80
//		VAD	VSL*
// slot 13391
    13391, 44890,
// LEM_GEOMETRY.agc:81
//			RCV
// slot 13392
    13392, 1722,
// LEM_GEOMETRY.agc:82
//			0,2
// slot 13393
    13393, 48892,
// LEM_GEOMETRY.agc:83
//		STOVL	R-OTHER
// slot 13394
    13394, 22432,
// LEM_GEOMETRY.agc:84
//			TNUV
// slot 13395
    13395, 1710,
// LEM_GEOMETRY.agc:85
//		VSL*	VAD
// slot 13396
    13396, 44382,
// LEM_GEOMETRY.agc:86
//			0 -4,2
// slot 13397
    13397, 48900,
// LEM_GEOMETRY.agc:87
//			VCV
// slot 13398
    13398, 1734,
// LEM_GEOMETRY.agc:88
//		VSL*
// slot 13399
    13399, 65374,
// LEM_GEOMETRY.agc:89
//			0,2
// slot 13400
    13400, 48892,
// LEM_GEOMETRY.agc:90
//		STORE	V-OTHER
// slot 13401
    13401, 1964,
// LEM_GEOMETRY.agc:91
//		RVQ
// slot 13402
    13402, 65308,
// LEM_GEOMETRY.agc:92
//
// LEM_GEOMETRY.agc:93
//# Page 322
// LEM_GEOMETRY.agc:94
//#	   THE FOLLOWING ROUTINE TAKES A HALF UNIT TARGET VECTOR REFERRED TO NAV BASE COORDINATES AND FINDS BOTH
// LEM_GEOMETRY.agc:95
//# GIMBAL ORIENTATIONS AT WHICH THE RR MIGHT SIGHT THE TARGET. THE GIMBAL ANGLES CORRESPONDING TO THE PRESENT MODE
// LEM_GEOMETRY.agc:96
//# ARE LEFT IN MODEA AND THOSE WHICH WOULD BE USED AFTER A REMODE IN MODEB. THIS ROUTINE ASSUMES MODE 1 IS TRUNNION
// LEM_GEOMETRY.agc:97
//# ANGLE LESS THAN 90 DEGS IN ABS VALUE WITH ARBITRARY SHAFT, WITH A CORRESPONDING DEFINITION FOR MODE 2. MODE
// LEM_GEOMETRY.agc:98
//# SELECTION AND LIMIT CHECKING ARE DONE ELSEWHERE.
// LEM_GEOMETRY.agc:99
//#
// LEM_GEOMETRY.agc:100
//#	   THE MODE 1 CONFIGURATION IS CALCULATED FROM THE VECTOR AND THEN MODE 2 IS FOUND USING THE RELATIONS
// LEM_GEOMETRY.agc:101
//#
// LEM_GEOMETRY.agc:102
//#	   S(2) = 180 + S(1)
// LEM_GEOMETRY.agc:103
//#	   T(2) = 180 - T(1)
// LEM_GEOMETRY.agc:104
//#
// LEM_GEOMETRY.agc:105
//#     THE VECTOR ARRIVES IN MPAC WHERE TRG*SMNB OR *SMNB* WILL HAVE LEFT IT.
// LEM_GEOMETRY.agc:106
//
// LEM_GEOMETRY.agc:107
//RRANGLES	STORE	32D
// slot 13403
    13403, 66,
// LEM_GEOMETRY.agc:108
//		DLOAD	DCOMP		# SINCE WE WILL FIND THE MODE 1 SHAFT
// slot 13404
    13404, 48842,
// LEM_GEOMETRY.agc:109
//			34D		# ANGLE LATER, WE CAN FIND THE MODE 1
// slot 13405
    13405, 70,
// LEM_GEOMETRY.agc:110
//		SETPD	ASIN		# TRUNNION BY SIMPLY TAKING THE ARCSIN OF
// slot 13406
    13406, 56834,
// LEM_GEOMETRY.agc:111
//			0		# THE Y COMPONENT, THE ASIN GIVIN AN
// slot 13407
    13407, 2,
// LEM_GEOMETRY.agc:112
//		PUSH	BDSU		# ANSWER WHOSE ABS VAL IS LESS THAN 90 DEG
// slot 13408
    13408, 37132,
// LEM_GEOMETRY.agc:113
//			LODPHALF
// slot 13409
    13409, 20490,
// LEM_GEOMETRY.agc:114
//		STODL	4		# MODE 2 TRUNNION TO 4.
// slot 13410
    13410, 12298,
// LEM_GEOMETRY.agc:115
//
// LEM_GEOMETRY.agc:116
//			LO6ZEROS
// slot 13411
    13411, 20494,
// LEM_GEOMETRY.agc:117
//		STOVL	34D		# UNIT THE PROJECTION OF THE VECTOR
// slot 13412
    13412, 20550,
// LEM_GEOMETRY.agc:118
//			32D		#   IN THE X-Z PLANE
// slot 13413
    13413, 66,
// LEM_GEOMETRY.agc:119
//		UNIT	BOVB		# IF OVERFLOW,TARGET VECTOR IS ALONG Y
// slot 13414
    13414, 33884,
// LEM_GEOMETRY.agc:120
//			LUNDESCH	# CALL FOR MANEUVER UNLESS ON MUN SURF
// slot 13415
    13415, 43554,
// LEM_GEOMETRY.agc:121
//		STODL	32D		# PROJECTION VECTOR.
// slot 13416
    13416, 12354,
// LEM_GEOMETRY.agc:122
//			32D
// slot 13417
    13417, 66,
// LEM_GEOMETRY.agc:123
//		SR1	STQ
// slot 13418
    13418, 37060,
// LEM_GEOMETRY.agc:124
//			S2
// slot 13419
    13419, 82,
// LEM_GEOMETRY.agc:125
//		STODL	SINTH		# USE ARCTRIG SINCE SHAFT COULD BE ARB.
// slot 13420
    13420, 12326,
// LEM_GEOMETRY.agc:126
//			36D
// slot 13421
    13421, 74,
// LEM_GEOMETRY.agc:127
//		SR1
// slot 13422
    13422, 65476,
// LEM_GEOMETRY.agc:128
//		STCALL	COSTH
// slot 13423
    13423, 28706
)).

agcAotInstallSourceRope(list(
// LEM_GEOMETRY.agc:129
//			ARCTRIG
// slot 13424
    13424, 40352,
// LEM_GEOMETRY.agc:130
//# Page 323
// LEM_GEOMETRY.agc:131
//		PUSH	DAD		# MODE 1 SHAFT TO 2.
// slot 13425
    13425, 36108,
// LEM_GEOMETRY.agc:132
//			LODPHALF
// slot 13426
    13426, 20490,
// LEM_GEOMETRY.agc:133
//		STOVL	6
// slot 13427
    13427, 20494,
// LEM_GEOMETRY.agc:134
//			4
// slot 13428
    13428, 10,
// LEM_GEOMETRY.agc:135
//		RTB			# FIND MODE 2 CDU ANGLES.
// slot 13429
    13429, 65336,
// LEM_GEOMETRY.agc:136
//			2V1STO2S
// slot 13430
    13430, 18234,
// LEM_GEOMETRY.agc:137
//		STOVL	MODEB
// slot 13431
    13431, 21652,
// LEM_GEOMETRY.agc:138
//			0
// slot 13432
    13432, 2,
// LEM_GEOMETRY.agc:139
//		RTB			# MODE 1 ANGLES TO MODE A.
// slot 13433
    13433, 65336,
// LEM_GEOMETRY.agc:140
//			2V1STO2S
// slot 13434
    13434, 18234,
// LEM_GEOMETRY.agc:141
//		STORE	MODEA
// slot 13435
    13435, 1168,
// LEM_GEOMETRY.agc:142
//		EXIT
// slot 13436
    13436, 65532
)).

// bank 13, slots 13437-13444
function agcAotUnit751 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13440 {
        if slot <= 13438 {
            if slot <= 13437 {
// LEM_GEOMETRY.agc:143
//
// LEM_GEOMETRY.agc:144
//		CS	RADMODES	# SWAP MODEA AND MODEB IF RR IN MODE 2.
// slot 13437
                if slot <> 13437 or instruction <> 16456 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 72).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LEM_GEOMETRY.agc:145
//		MASK	ANTENBIT
// slot 13438
                if slot <> 13438 or instruction <> 31200 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 13439 {
// LEM_GEOMETRY.agc:146
//		CCS	A
// slot 13439
                if slot <> 13439 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LEM_GEOMETRY.agc:147
//		TCF	+4
// slot 13440
                if slot <> 13440 or instruction <> 5252 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5252, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 13442 {
            if slot <= 13441 {
// LEM_GEOMETRY.agc:148
//
// LEM_GEOMETRY.agc:149
//		DXCH	MODEA
// slot 13441
                if slot <> 13441 or instruction <> 22088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LEM_GEOMETRY.agc:150
//		DXCH	MODEB
// slot 13442
                if slot <> 13442 or instruction <> 22090 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 586, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 13443 {
// LEM_GEOMETRY.agc:151
//		DXCH	MODEA
// slot 13443
                if slot <> 13443 or instruction <> 22088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// LEM_GEOMETRY.agc:152
//
// LEM_GEOMETRY.agc:153
//		TC	INTPRET
// slot 13444
                if slot <> 13444 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[751] to agcAotUnit751@.

agcAotInstallSourceRope(list(
// LEM_GEOMETRY.agc:154
//		GOTO
// slot 13445
    13445, 65360,
// LEM_GEOMETRY.agc:155
//			S2
// slot 13446
    13446, 82,
// LEM_GEOMETRY.agc:156
//# Page 324
// LEM_GEOMETRY.agc:157
//# GIVEN RR TRUNNION AND SHAFT (T,S) IN TANGNB,+1,FIND THE ASSOCIATED
// LEM_GEOMETRY.agc:158
//# LINE OF SIGHT IN NAV BASE AXES.  THE HALF UNIT VECTOR, .5(SIN(S)COS(T),
// LEM_GEOMETRY.agc:159
//# -SIN(T),COS(S)COS(T)) IS LEFT IN MPAC AND 32D.
// LEM_GEOMETRY.agc:160
//
// LEM_GEOMETRY.agc:161
//		SETLOC	INFLIGHT
// LEM_GEOMETRY.agc:162
//		BANK
// LEM_GEOMETRY.agc:163
//
// LEM_GEOMETRY.agc:164
//		COUNT*	$$/GEOM
// LEM_GEOMETRY.agc:165
//
// LEM_GEOMETRY.agc:166
//RRNB		SLOAD	RTB
// slot 21537
    21537, 40122,
// LEM_GEOMETRY.agc:167
//			TANGNB
// slot 21538
    21538, 4054,
// LEM_GEOMETRY.agc:168
//			CDULOGIC
// slot 21539
    21539, 18172,
// LEM_GEOMETRY.agc:169
//		SETPD	PUSH		# TRUNNION ANGLE TO 0
// slot 21540
    21540, 34306,
// LEM_GEOMETRY.agc:170
//			0
// slot 21541
    21541, 2,
// LEM_GEOMETRY.agc:171
//		SIN	DCOMP
// slot 21542
    21542, 48860,
// LEM_GEOMETRY.agc:172
//		STODL	34D		# Y COMPONENT
// slot 21543
    21543, 12358,
// LEM_GEOMETRY.agc:173
//
// LEM_GEOMETRY.agc:174
//		COS	PUSH		# .5 COS(T) TO 0
// slot 21544
    21544, 34508,
// LEM_GEOMETRY.agc:175
//		SLOAD	RTB
// slot 21545
    21545, 40122,
// LEM_GEOMETRY.agc:176
//			TANGNB +1
// slot 21546
    21546, 4056,
// LEM_GEOMETRY.agc:177
//			CDULOGIC
// slot 21547
    21547, 18172,
// LEM_GEOMETRY.agc:178
//RRNB1		PUSH	COS		# SHAFT ANGLE TO 2
// slot 21548
    21548, 58892,
// LEM_GEOMETRY.agc:179
//		DMP	SL1
// slot 21549
    21549, 59914,
// LEM_GEOMETRY.agc:180
//			0
// slot 21550
    21550, 2,
// LEM_GEOMETRY.agc:181
//		STODL	36D		# Z COMPONENT
// slot 21551
    21551, 12362,
// LEM_GEOMETRY.agc:182
//
// LEM_GEOMETRY.agc:183
//		SIN	DMP
// slot 21552
    21552, 34268,
// LEM_GEOMETRY.agc:184
//		SL1
// slot 21553
    21553, 65492,
// LEM_GEOMETRY.agc:185
//		STOVL	32D
// slot 21554
    21554, 20546,
// LEM_GEOMETRY.agc:186
//			32D
// slot 21555
    21555, 66,
// LEM_GEOMETRY.agc:187
//		RVQ
// slot 21556
    21556, 65308,
// LEM_GEOMETRY.agc:188
//
// LEM_GEOMETRY.agc:189
//# THIS ENTRY TO RRNB REQUIRES THE TRUNNION AND SHAFT ANGLES IN MPAC AND MPAC +1 RESPECTIVELY
// LEM_GEOMETRY.agc:190
//
// LEM_GEOMETRY.agc:191
//RRNBMPAC	STODL	20D		# SAVE SHAFT CDU IN 21.
// slot 21557
    21557, 12330,
// LEM_GEOMETRY.agc:192
//			MPAC		# SET MODE TO DP.  (THE PRECEEDING STORE
// slot 21558
    21558, 218,
// LEM_GEOMETRY.agc:193
//					# MAY BE DP. TP OR VECTOR.)
// LEM_GEOMETRY.agc:194
//		RTB	SETPD
// slot 21559
    21559, 33080,
// LEM_GEOMETRY.agc:195
//			CDULOGIC
// slot 21560
    21560, 18172,
// LEM_GEOMETRY.agc:196
//			0
// slot 21561
    21561, 2,
// LEM_GEOMETRY.agc:197
//		PUSH	SIN		# TRUNNION ANGLE TO 0
// slot 21562
    21562, 60940,
// LEM_GEOMETRY.agc:198
//		DCOMP
// slot 21563
    21563, 65404,
// LEM_GEOMETRY.agc:199
//		STODL	34D		# Y COMPONENT
// slot 21564
    21564, 12358,
// LEM_GEOMETRY.agc:200
//		COS	PUSH		# .5COS(T) TO 0
// slot 21565
    21565, 34508,
// LEM_GEOMETRY.agc:201
//		SLOAD	RTB		# PICK UP CDU'S.
// slot 21566
    21566, 40122,
// LEM_GEOMETRY.agc:202
//			21D
// slot 21567
    21567, 44,
// LEM_GEOMETRY.agc:203
//			CDULOGIC
// slot 21568
    21568, 18172,
// LEM_GEOMETRY.agc:204
//		GOTO
// slot 21569
    21569, 65360,
// LEM_GEOMETRY.agc:205
//			RRNB1
// slot 21570
    21570, 39000
)).

// no code for the lines below
// LEM_GEOMETRY.agc:206
//# Page 325 (empty page)
