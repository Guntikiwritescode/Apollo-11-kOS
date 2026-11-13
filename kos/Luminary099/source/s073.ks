// PORT: Original source unit S-BAND_ANTENNA_FOR_LM.agc.
// PORT: Physical bank 42. Shared continuation entries, slots 37766–37766.
function agcAotUnit2531 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:2
//# Filename:	S-BAND_ANTENNA_FOR_LM.agc
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:9
//# Pages:	486-489
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:13
//#		2009-06-07 RSB	Corrected a misprint.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:14
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:15
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:17
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:19
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:22
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:23
//# actually created.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:24
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:26
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:28
//#	16:27 JULY 14, 1969
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:29
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:30
//# Page 486
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:31
//# SUBROUTINE NAME: R05 - S-BAND ANTENNA FOR LM
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:32
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:33
//# MOD0 BY T. JAMES
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:34
//# MOD1 BY P. SHAKIR
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:35
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:36
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:37
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:38
//#     THE S-BAND ANTENNA ROUTINE, R05, COMPUTES AND DISPLAYS THE PITCH AND
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:39
//# YAW ANTENNA GIMBAL ANGLES REQUIRED TO POINT THE LM STEERABLE ANTENNA
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:40
//# TOWARD THE CENTER OF THE EARTH. THIS ROUTINE IS SELECTED BY THE ASTRO-
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:41
//# NAUT VIA DSKY ENTRY DURING COASTING FLIGHT OR WHEN THE LM IS ON THE MOON
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:42
//# SURFACE. THE EARTH OR MOON REFERENCE COORDINATE SYSTEM IS USED DEPENDING
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:43
//# ON WHETHER THE LM IS ABOUT TO ENTER OR HAS ALREADY ENTERED THE MOON
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:44
//# SPHERE OF INFLUENCE, RESPECTIVELY
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:45
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:46
//# TO CALL SUBROUTINE, ASTRONAUT KEYS IN V 64 E
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:47
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:48
//# SUBROUTINES CALLED-
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:49
//#	R02BOTH
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:50
//#	INTPRET
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:51
//#	LOADTIME
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:52
//#	LEMCONIC
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:53
//#	LUNPOS
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:54
//#	CDUTRIG
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:55
//#	*SMNB*
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:56
//#	BANKCALL
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:57
//#	B50OFF
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:58
//#	ENDOFJOB
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:59
//#	BLANKET
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:60
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:61
//# RETURNS WITH
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:62
//#	PITCH ANGLE IN PITCHANG 	REV. B0
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:63
//#	YAW ANGLE IN YAWANG		REV. B0
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:64
//#
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:65
//# ERASABLES USED
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:66
//#	PITCHANG
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:67
//#	YAWANG
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:68
//#	RLM
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:69
//#	VAC AREA
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:70
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:71
//		BANK	41
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:72
//		SETLOC	SBAND
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:73
//		BANK
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:74
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:75
//		EBANK=	WHOCARES
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:76
//		COUNT*	$$/R05
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:77
//SBANDANT	TC	BANKCALL
// PORT: Fixed ROM slots 37766.
    if slot <> 37766 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2531] to agcAotUnit2531@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:78
//# Page 487
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:79
//		CADR	R02BOTH		# CHECK IF IMU IS ON AND ALIGNED
// PORT: Fixed ROM slots 37767.
    37767, 9560
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37768–37768.
function agcAotUnit2532 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:80
//		TC	INTPRET
// PORT: Fixed ROM slots 37768.
    if slot <> 37768 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2532] to agcAotUnit2532@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:81
//		SETPD	RTB
// PORT: Fixed ROM slots 37769.
    37769, 39938,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:82
//			0D
// PORT: Fixed ROM slots 37770.
    37770, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:83
//			LOADTIME	# PICK UP CURRENT TIME
// PORT: Fixed ROM slots 37771.
    37771, 18166,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:84
//		STCALL	TDEC1		# ADVANCE INTEGRATION TO TIME IN TDEC1
// PORT: Fixed ROM slots 37772.
    37772, 28738,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:85
//			LEMCONIC	# USING CONIC INTEGRATION
// PORT: Fixed ROM slots 37773.
    37773, 23680,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:86
//		SLOAD	BHIZ
// PORT: Fixed ROM slots 37774.
    37774, 39098,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:87
//			X2		# X2 =0 EARTH SPHERE, X2 =2 MOON SPHERE
// PORT: Fixed ROM slots 37775.
    37775, 80,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:88
//			CONV4
// PORT: Fixed ROM slots 37776.
    37776, 55100,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:89
//		VLOAD
// PORT: Fixed ROM slots 37777.
    37777, 65530,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:90
//			RATT
// PORT: Fixed ROM slots 37778.
    37778, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:91
//		STODL	RLM
// PORT: Fixed ROM slots 37779.
    37779, 14602,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:92
//			TAT
// PORT: Fixed ROM slots 37780.
    37780, 26,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:93
//CONV3		CALL
// PORT: Fixed ROM slots 37781.
    37781, 65320,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:94
//			LUNPOS		# UNIT POSITION VECTOR FROM EARTH TO MOON
// PORT: Fixed ROM slots 37782.
    37782, 28520,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:95
//		VLOAD	VXSC
// PORT: Fixed ROM slots 37783.
    37783, 61946,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:96
//			VMOON
// PORT: Fixed ROM slots 37784.
    37784, 2982,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:97
//			REMDIST		# MEAN DISTANCE FROM EARTH TO MOON
// PORT: Fixed ROM slots 37785.
    37785, 20482,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:98
//		VSL1	VAD
// PORT: Fixed ROM slots 37786.
    37786, 44532,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:99
//			RLM
// PORT: Fixed ROM slots 37787.
    37787, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:100
//		GOTO
// PORT: Fixed ROM slots 37788.
    37788, 65360,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:101
//			CONV5
// PORT: Fixed ROM slots 37789.
    37789, 55104,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:102
//CONV4		VLOAD
// PORT: Fixed ROM slots 37790.
    37790, 65530,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:103
//			RATT		# UE = -UNIT(RATT)  EARTH SPHERE
// PORT: Fixed ROM slots 37791.
    37791, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:104
//CONV5		SETPD	UNIT		# UE = -UNIT((REM)(UEM) + RL)  MOON SPHERE
// PORT: Fixed ROM slots 37792.
    37792, 44546,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:105
//			0D		# SET PL POINTER TO 0
// PORT: Fixed ROM slots 37793.
    37793, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:106
//		VCOMP	CALL
// PORT: Fixed ROM slots 37794.
    37794, 38012,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:107
//			CDUTRIG		# COMPUTE SINES AND COSINES OF CDU ANGLES
// PORT: Fixed ROM slots 37795.
    37795, 40638,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:108
//		MXV	VSL1		# TRANSFORM REF. COORDINATE SYSTEM TO
// PORT: Fixed ROM slots 37796.
    37796, 64162,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:109
//			REFSMMAT	# STABLE MEMBER  B-1 X B-1 X B+1 = B-1
// PORT: Fixed ROM slots 37797.
    37797, 1976,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:110
//		PUSH	DLOAD		# 8D
// PORT: Fixed ROM slots 37798.
    37798, 58636,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:111
//			HI6ZEROS
// PORT: Fixed ROM slots 37799.
    37799, 6820,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:112
//		STORE	PITCHANG
// PORT: Fixed ROM slots 37800.
    37800, 2306,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:113
//		STOVL	YAWANG		# ZERO OUT ANGLES
// PORT: Fixed ROM slots 37801.
    37801, 22790,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:114
//		CALL
// PORT: Fixed ROM slots 37802.
    37802, 65320,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:115
//			*SMNB*
// PORT: Fixed ROM slots 37803.
    37803, 40818,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:116
//		STODL	RLM		# PRE-MULTIPLY RLM BY (NBSA) MATRIX(B0)
// PORT: Fixed ROM slots 37804.
    37804, 14602,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:117
//			RLM 	+2
// PORT: Fixed ROM slots 37805.
    37805, 2318,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:118
//		PUSH	DSU
// PORT: Fixed ROM slots 37806.
    37806, 38156,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:119
//			RLM
// PORT: Fixed ROM slots 37807.
    37807, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:120
//		DMP
// PORT: Fixed ROM slots 37808.
    37808, 65290,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:121
//			1OVSQRT2
// PORT: Fixed ROM slots 37809.
    37809, 22514,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:122
//		STODL	RLM 	+2
// PORT: Fixed ROM slots 37810.
    37810, 14606,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:123
//		DAD	DMP
// PORT: Fixed ROM slots 37811.
    37811, 34074,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:124
//			RLM
// PORT: Fixed ROM slots 37812.
    37812, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:125
//			1OVSQRT2
// PORT: Fixed ROM slots 37813.
    37813, 22514,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:126
//		STOVL	RLM		# R  B-1
// PORT: Fixed ROM slots 37814.
    37814, 22794,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:127
//			RLM
// PORT: Fixed ROM slots 37815.
    37815, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:128
//		UNIT	PDVL
// PORT: Fixed ROM slots 37816.
    37816, 52572,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:129
//# Page 488
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:130
//			RLM
// PORT: Fixed ROM slots 37817.
    37817, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:131
//		VPROJ	VSL2		# PROJECTION OF R ONTO LM XZ PLANE
// PORT: Fixed ROM slots 37818.
    37818, 59954,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:132
//			HIUNITY
// PORT: Fixed ROM slots 37819.
    37819, 6812,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:133
//		BVSU	BOV		# CLEAR OVERFLOW INDICATOR IF ON
// PORT: Fixed ROM slots 37820.
    37820, 32842,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:134
//			RLM
// PORT: Fixed ROM slots 37821.
    37821, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:135
//			COVCNV
// PORT: Fixed ROM slots 37822.
    37822, 55166,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:136
//COVCNV		UNIT	BOV		# EXIT ON OVERFLOW
// PORT: Fixed ROM slots 37823.
    37823, 32860,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:137
//			SBANDEX
// PORT: Fixed ROM slots 37824.
    37824, 55242,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:138
//		PUSH	VXV		# URP VECTOR  B-1
// PORT: Fixed ROM slots 37825.
    37825, 40204,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:139
//			HIUNITZ
// PORT: Fixed ROM slots 37826.
    37826, 6808,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:140
//		VSL1	VCOMP		# UZ X URP = -(URP X UZ)
// PORT: Fixed ROM slots 37827.
    37827, 48884,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:141
//		STORE	RLM		# X VEC  B-1
// PORT: Fixed ROM slots 37828.
    37828, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:142
//		DOT	PDVL		# SGN(X.UY) UNSCALED
// PORT: Fixed ROM slots 37829.
    37829, 52546,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:143
//			HIUNITY
// PORT: Fixed ROM slots 37830.
    37830, 6812,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:144
//			RLM
// PORT: Fixed ROM slots 37831.
    37831, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:145
//		ABVAL	SIGN
// PORT: Fixed ROM slots 37832.
    37832, 62796,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:146
//		ASIN			# ASIN((SGN(X.UY))ABV(X)) REV B0
// PORT: Fixed ROM slots 37833.
    37833, 65468,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:147
//		STOVL	PITCHANG
// PORT: Fixed ROM slots 37834.
    37834, 22786,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:148
//			URP
// PORT: Fixed ROM slots 37835.
    37835, 14,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:149
//		DOT	BPL
// PORT: Fixed ROM slots 37836.
    37836, 42050,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:150
//			HIUNITZ
// PORT: Fixed ROM slots 37837.
    37837, 6808,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:151
//			NOADJUST	# YES, -90 TO +90
// PORT: Fixed ROM slots 37838.
    37838, 55206,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:152
//		DLOAD	DSU
// PORT: Fixed ROM slots 37839.
    37839, 38346,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:153
//			HIDPHALF
// PORT: Fixed ROM slots 37840.
    37840, 6816,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:154
//			PITCHANG
// PORT: Fixed ROM slots 37841.
    37841, 2306,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:155
//		STORE	PITCHANG
// PORT: Fixed ROM slots 37842.
    37842, 2306,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:156
//NOADJUST	VLOAD	VXV
// PORT: Fixed ROM slots 37843.
    37843, 40442,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:157
//			UR		# Z = (UR X URP)
// PORT: Fixed ROM slots 37844.
    37844, 2,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:158
//			URP
// PORT: Fixed ROM slots 37845.
    37845, 14,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:159
//		VSL1
// PORT: Fixed ROM slots 37846.
    37846, 65524,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:160
//		STODL	RLM		# Z VEC  B-1
// PORT: Fixed ROM slots 37847.
    37847, 14602,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:161
//			PITCHANG
// PORT: Fixed ROM slots 37848.
    37848, 2306,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:162
//		SIN	VXSC
// PORT: Fixed ROM slots 37849.
    37849, 61916,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:163
//			HIUNITZ
// PORT: Fixed ROM slots 37850.
    37850, 6808,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:164
//		PDDL	COS
// PORT: Fixed ROM slots 37851.
    37851, 59050,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:165
//			PITCHANG
// PORT: Fixed ROM slots 37852.
    37852, 2306,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:166
//		VXSC	VSU
// PORT: Fixed ROM slots 37853.
    37853, 43490,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:167
//			HIUNITX		# (UX COS ALPHA) - (UZ SIN ALPHA)
// PORT: Fixed ROM slots 37854.
    37854, 6816,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:168
//		DOT	PDVL		# YAW.Z
// PORT: Fixed ROM slots 37855.
    37855, 52546,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:169
//			RLM
// PORT: Fixed ROM slots 37856.
    37856, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:170
//			RLM
// PORT: Fixed ROM slots 37857.
    37857, 2314,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:171
//		ABVAL	SIGN
// PORT: Fixed ROM slots 37858.
    37858, 62796,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:172
//		ASIN
// PORT: Fixed ROM slots 37859.
    37859, 65468,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:173
//		STORE	YAWANG
// PORT: Fixed ROM slots 37860.
    37860, 2310,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:174
//SBANDEX		EXIT
// PORT: Fixed ROM slots 37861.
    37861, 65532
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37862–37869.
function agcAotUnit2533 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37865 {
        if slot <= 37863 {
            if slot <= 37862 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:175
//		CA	EXTVBACT
// PORT: Fixed ROM slots 37862.
                if slot <> 37862 or instruction <> 12836 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 548).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:176
//		MASK	BIT5		# IS BIT5 STILL ON
// PORT: Fixed ROM slots 37863.
                if slot <> 37863 or instruction <> 31207 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    if fixedOperand = 16 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37864 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:177
//		EXTEND
// PORT: Fixed ROM slots 37864.
                if slot <> 37864 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:178
//		BZF	ENDEXT		# NO
// PORT: Fixed ROM slots 37865.
                if slot <> 37865 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37867 {
            if slot <= 37866 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:179
//		CAF	PRIO5
// PORT: Fixed ROM slots 37866.
                if slot <> 37866 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:180
//# Page 489
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:181
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 37867.
                if slot <> 37867 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37868 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:182
//		CAF	V06N51		# DISPLAY ANGLES
// PORT: Fixed ROM slots 37868.
                if slot <> 37868 or instruction <> 14327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2039), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:183
//		TC	BANKCALL
// PORT: Fixed ROM slots 37869.
                if slot <> 37869 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2533] to agcAotUnit2533@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:184
//		CADR	GOMARKFR
// PORT: Fixed ROM slots 37870.
    37870, 16854
)).

// PORT: Physical bank 42. Shared continuation entries, slots 37871–37878.
function agcAotUnit2534 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37874 {
        if slot <= 37872 {
            if slot <= 37871 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:185
//		TC	B5OFF		# TERMINATE
// PORT: Fixed ROM slots 37871.
                if slot <> 37871 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:186
//		TC	B5OFF		# PROCEED
// PORT: Fixed ROM slots 37872.
                if slot <> 37872 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37873 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:187
//		TC	ENDOFJOB	# RECYCLE
// PORT: Fixed ROM slots 37873.
                if slot <> 37873 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:188
//		CAF	BIT3		# IMMEDIATE RETURN
// PORT: Fixed ROM slots 37874.
                if slot <> 37874 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37876 {
            if slot <= 37875 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:189
//		TC	BLANKET		# BLANK R3
// PORT: Fixed ROM slots 37875.
                if slot <> 37875 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:190
//		CAF	PRIO4
// PORT: Fixed ROM slots 37876.
                if slot <> 37876 or instruction <> 14816 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37877 {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:191
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 37877.
                if slot <> 37877 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:192
//		TC	SBANDANT +2	# YES, CONTINUE DISPLAYING ANGLES
// PORT: Fixed ROM slots 37878.
                if slot <> 37878 or instruction <> 1928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2534] to agcAotUnit2534@.

agcAotInstallSourceRope(list(
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:193
//V06N51		VN	0651
// PORT: Fixed ROM slots 37879.
    37879, 1638,
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:194
//1OVSQRT2	2DEC	.7071067815	# 1/SQRT(2)
// PORT: Fixed ROM slots 37880 37881.
    37880, 23170, 37881, 7782
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:195
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:196
//UR		EQUALS	0D
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:197
//URP		EQUALS	6D
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:198
//		SBANK=	LOWSUPER
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:199
//
// PORT: SOURCE S-BAND_ANTENNA_FOR_LM.agc:200
//# *** END OF LNYAIDE .001 ***
