// PORT: Original source unit LEM_GEOMETRY.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE LEM_GEOMETRY.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE LEM_GEOMETRY.agc:2
//# Filename:	LEM_GEOMETRY.agc
// PORT: SOURCE LEM_GEOMETRY.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE LEM_GEOMETRY.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE LEM_GEOMETRY.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE LEM_GEOMETRY.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE LEM_GEOMETRY.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE LEM_GEOMETRY.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE LEM_GEOMETRY.agc:9
//# Pages:	320-325
// PORT: SOURCE LEM_GEOMETRY.agc:10
//# Mod history:	2009-05-16 RSB	Adapted from the corresponding
// PORT: SOURCE LEM_GEOMETRY.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE LEM_GEOMETRY.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE LEM_GEOMETRY.agc:13
//#
// PORT: SOURCE LEM_GEOMETRY.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE LEM_GEOMETRY.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE LEM_GEOMETRY.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE LEM_GEOMETRY.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE LEM_GEOMETRY.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE LEM_GEOMETRY.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE LEM_GEOMETRY.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE LEM_GEOMETRY.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE LEM_GEOMETRY.agc:22
//# actually created.
// PORT: SOURCE LEM_GEOMETRY.agc:23
//#
// PORT: SOURCE LEM_GEOMETRY.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE LEM_GEOMETRY.agc:25
//#
// PORT: SOURCE LEM_GEOMETRY.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE LEM_GEOMETRY.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE LEM_GEOMETRY.agc:28
//
// PORT: SOURCE LEM_GEOMETRY.agc:29
//# Page 320
// PORT: SOURCE LEM_GEOMETRY.agc:30
//		BANK	23
// PORT: SOURCE LEM_GEOMETRY.agc:31
//		SETLOC	LEMGEOM
// PORT: SOURCE LEM_GEOMETRY.agc:32
//		BANK
// PORT: SOURCE LEM_GEOMETRY.agc:33
//
// PORT: SOURCE LEM_GEOMETRY.agc:34
//		SBANK=	LOWSUPER
// PORT: SOURCE LEM_GEOMETRY.agc:35
//		EBANK=	XSM
// PORT: SOURCE LEM_GEOMETRY.agc:36
//
// PORT: SOURCE LEM_GEOMETRY.agc:37
//# THESE TWO ROUTINES COMPUTE THE ACTUAL STATE VECTOR FOR LM,CSM BY ADDING
// PORT: SOURCE LEM_GEOMETRY.agc:38
//# THE CONIC R,V AND THE DEVIATIONSR,V. THE STATE VECTORS ARE CONVERTED TO
// PORT: SOURCE LEM_GEOMETRY.agc:39
//# METERS B-29 AND METERS/CSEC B-7 AND STORED APPROPRIATELY IN RN,VN OR
// PORT: SOURCE LEM_GEOMETRY.agc:40
//# R-OTHER , V-OTHER FOR DOWNLINK. THE ROUTINES NAMES ARE SWITCHED IN THE
// PORT: SOURCE LEM_GEOMETRY.agc:41
//# OTHER VEHICLES COMPUTER.
// PORT: SOURCE LEM_GEOMETRY.agc:42
//#
// PORT: SOURCE LEM_GEOMETRY.agc:43
//# INPUT
// PORT: SOURCE LEM_GEOMETRY.agc:44
//#   STATE VECTOR IN TEMPORARY STORAGE AREA
// PORT: SOURCE LEM_GEOMETRY.agc:45
//#   IF STATE VECTOR IS SCALED POS B27 AND VEL B5
// PORT: SOURCE LEM_GEOMETRY.agc:46
//#      SET X2 TO +2
// PORT: SOURCE LEM_GEOMETRY.agc:47
//#   IF STATE VECTOR IS SCALED POS B29 AND VEL B7
// PORT: SOURCE LEM_GEOMETRY.agc:48
//#      SET X2 TO 0
// PORT: SOURCE LEM_GEOMETRY.agc:49
//#
// PORT: SOURCE LEM_GEOMETRY.agc:50
//# OUTPUT
// PORT: SOURCE LEM_GEOMETRY.agc:51
//#   R(T) IN RN, V(T) IN VN, T IN PIPTIME
// PORT: SOURCE LEM_GEOMETRY.agc:52
//# OR
// PORT: SOURCE LEM_GEOMETRY.agc:53
//#   R(T) IN R-OTHER, V(T) IN V-OTHER   (T IS DEFINED BY T-OTHER)
// PORT: SOURCE LEM_GEOMETRY.agc:54
//
// PORT: SOURCE LEM_GEOMETRY.agc:55
//		COUNT*	$$/GEOM
// PORT: SOURCE LEM_GEOMETRY.agc:56
//SVDWN2		BOF	RVQ		# SW=1=AVETOMID DOING W-MATRIX INTEG.
// PORT: Fixed ROM slots 13368.
    13368, 36376,
// PORT: SOURCE LEM_GEOMETRY.agc:57
//			AVEMIDSW
// PORT: Fixed ROM slots 13369.
    13369, 5084,
// PORT: SOURCE LEM_GEOMETRY.agc:58
//			+1
// PORT: Fixed ROM slots 13370.
    13370, 22646,
// PORT: SOURCE LEM_GEOMETRY.agc:59
//		VLOAD	VSL*
// PORT: Fixed ROM slots 13371.
    13371, 45050,
// PORT: SOURCE LEM_GEOMETRY.agc:60
//			TDELTAV
// PORT: Fixed ROM slots 13372.
    13372, 1698,
// PORT: SOURCE LEM_GEOMETRY.agc:61
//			0 -7,2
// PORT: Fixed ROM slots 13373.
    13373, 48906,
// PORT: SOURCE LEM_GEOMETRY.agc:62
//		VAD	VSL*
// PORT: Fixed ROM slots 13374.
    13374, 44890,
// PORT: SOURCE LEM_GEOMETRY.agc:63
//			RCV
// PORT: Fixed ROM slots 13375.
    13375, 1722,
// PORT: SOURCE LEM_GEOMETRY.agc:64
//			0,2
// PORT: Fixed ROM slots 13376.
    13376, 48892,
// PORT: SOURCE LEM_GEOMETRY.agc:65
//		STOVL	RN
// PORT: Fixed ROM slots 13377.
    13377, 21794,
// PORT: SOURCE LEM_GEOMETRY.agc:66
//			TNUV
// PORT: Fixed ROM slots 13378.
    13378, 1710,
// PORT: SOURCE LEM_GEOMETRY.agc:67
//		VSL*	VAD
// PORT: Fixed ROM slots 13379.
    13379, 44382,
// PORT: SOURCE LEM_GEOMETRY.agc:68
//			0 -4,2
// PORT: Fixed ROM slots 13380.
    13380, 48900,
// PORT: SOURCE LEM_GEOMETRY.agc:69
//			VCV
// PORT: Fixed ROM slots 13381.
    13381, 1734,
// PORT: SOURCE LEM_GEOMETRY.agc:70
//		VSL*
// PORT: Fixed ROM slots 13382.
    13382, 65374,
// PORT: SOURCE LEM_GEOMETRY.agc:71
//			0,2
// PORT: Fixed ROM slots 13383.
    13383, 48892,
// PORT: SOURCE LEM_GEOMETRY.agc:72
//		STODL	VN
// PORT: Fixed ROM slots 13384.
    13384, 13614,
// PORT: SOURCE LEM_GEOMETRY.agc:73
//			TET
// PORT: Fixed ROM slots 13385.
    13385, 1694,
// PORT: SOURCE LEM_GEOMETRY.agc:74
//		STORE	PIPTIME
// PORT: Fixed ROM slots 13386.
    13386, 1338,
// PORT: SOURCE LEM_GEOMETRY.agc:75
//		RVQ
// PORT: Fixed ROM slots 13387.
    13387, 65308,
// PORT: SOURCE LEM_GEOMETRY.agc:76
//# Page 321
// PORT: SOURCE LEM_GEOMETRY.agc:77
//SVDWN1		VLOAD	VSL*
// PORT: Fixed ROM slots 13388.
    13388, 45050,
// PORT: SOURCE LEM_GEOMETRY.agc:78
//			TDELTAV
// PORT: Fixed ROM slots 13389.
    13389, 1698,
// PORT: SOURCE LEM_GEOMETRY.agc:79
//			0 -7,2
// PORT: Fixed ROM slots 13390.
    13390, 48906,
// PORT: SOURCE LEM_GEOMETRY.agc:80
//		VAD	VSL*
// PORT: Fixed ROM slots 13391.
    13391, 44890,
// PORT: SOURCE LEM_GEOMETRY.agc:81
//			RCV
// PORT: Fixed ROM slots 13392.
    13392, 1722,
// PORT: SOURCE LEM_GEOMETRY.agc:82
//			0,2
// PORT: Fixed ROM slots 13393.
    13393, 48892,
// PORT: SOURCE LEM_GEOMETRY.agc:83
//		STOVL	R-OTHER
// PORT: Fixed ROM slots 13394.
    13394, 22432,
// PORT: SOURCE LEM_GEOMETRY.agc:84
//			TNUV
// PORT: Fixed ROM slots 13395.
    13395, 1710,
// PORT: SOURCE LEM_GEOMETRY.agc:85
//		VSL*	VAD
// PORT: Fixed ROM slots 13396.
    13396, 44382,
// PORT: SOURCE LEM_GEOMETRY.agc:86
//			0 -4,2
// PORT: Fixed ROM slots 13397.
    13397, 48900,
// PORT: SOURCE LEM_GEOMETRY.agc:87
//			VCV
// PORT: Fixed ROM slots 13398.
    13398, 1734,
// PORT: SOURCE LEM_GEOMETRY.agc:88
//		VSL*
// PORT: Fixed ROM slots 13399.
    13399, 65374,
// PORT: SOURCE LEM_GEOMETRY.agc:89
//			0,2
// PORT: Fixed ROM slots 13400.
    13400, 48892,
// PORT: SOURCE LEM_GEOMETRY.agc:90
//		STORE	V-OTHER
// PORT: Fixed ROM slots 13401.
    13401, 1964,
// PORT: SOURCE LEM_GEOMETRY.agc:91
//		RVQ
// PORT: Fixed ROM slots 13402.
    13402, 65308,
// PORT: SOURCE LEM_GEOMETRY.agc:92
//
// PORT: SOURCE LEM_GEOMETRY.agc:93
//# Page 322
// PORT: SOURCE LEM_GEOMETRY.agc:94
//#	   THE FOLLOWING ROUTINE TAKES A HALF UNIT TARGET VECTOR REFERRED TO NAV BASE COORDINATES AND FINDS BOTH
// PORT: SOURCE LEM_GEOMETRY.agc:95
//# GIMBAL ORIENTATIONS AT WHICH THE RR MIGHT SIGHT THE TARGET. THE GIMBAL ANGLES CORRESPONDING TO THE PRESENT MODE
// PORT: SOURCE LEM_GEOMETRY.agc:96
//# ARE LEFT IN MODEA AND THOSE WHICH WOULD BE USED AFTER A REMODE IN MODEB. THIS ROUTINE ASSUMES MODE 1 IS TRUNNION
// PORT: SOURCE LEM_GEOMETRY.agc:97
//# ANGLE LESS THAN 90 DEGS IN ABS VALUE WITH ARBITRARY SHAFT, WITH A CORRESPONDING DEFINITION FOR MODE 2. MODE
// PORT: SOURCE LEM_GEOMETRY.agc:98
//# SELECTION AND LIMIT CHECKING ARE DONE ELSEWHERE.
// PORT: SOURCE LEM_GEOMETRY.agc:99
//#
// PORT: SOURCE LEM_GEOMETRY.agc:100
//#	   THE MODE 1 CONFIGURATION IS CALCULATED FROM THE VECTOR AND THEN MODE 2 IS FOUND USING THE RELATIONS
// PORT: SOURCE LEM_GEOMETRY.agc:101
//#
// PORT: SOURCE LEM_GEOMETRY.agc:102
//#	   S(2) = 180 + S(1)
// PORT: SOURCE LEM_GEOMETRY.agc:103
//#	   T(2) = 180 - T(1)
// PORT: SOURCE LEM_GEOMETRY.agc:104
//#
// PORT: SOURCE LEM_GEOMETRY.agc:105
//#     THE VECTOR ARRIVES IN MPAC WHERE TRG*SMNB OR *SMNB* WILL HAVE LEFT IT.
// PORT: SOURCE LEM_GEOMETRY.agc:106
//
// PORT: SOURCE LEM_GEOMETRY.agc:107
//RRANGLES	STORE	32D
// PORT: Fixed ROM slots 13403.
    13403, 66,
// PORT: SOURCE LEM_GEOMETRY.agc:108
//		DLOAD	DCOMP		# SINCE WE WILL FIND THE MODE 1 SHAFT
// PORT: Fixed ROM slots 13404.
    13404, 48842,
// PORT: SOURCE LEM_GEOMETRY.agc:109
//			34D		# ANGLE LATER, WE CAN FIND THE MODE 1
// PORT: Fixed ROM slots 13405.
    13405, 70,
// PORT: SOURCE LEM_GEOMETRY.agc:110
//		SETPD	ASIN		# TRUNNION BY SIMPLY TAKING THE ARCSIN OF
// PORT: Fixed ROM slots 13406.
    13406, 56834,
// PORT: SOURCE LEM_GEOMETRY.agc:111
//			0		# THE Y COMPONENT, THE ASIN GIVIN AN
// PORT: Fixed ROM slots 13407.
    13407, 2,
// PORT: SOURCE LEM_GEOMETRY.agc:112
//		PUSH	BDSU		# ANSWER WHOSE ABS VAL IS LESS THAN 90 DEG
// PORT: Fixed ROM slots 13408.
    13408, 37132,
// PORT: SOURCE LEM_GEOMETRY.agc:113
//			LODPHALF
// PORT: Fixed ROM slots 13409.
    13409, 20490,
// PORT: SOURCE LEM_GEOMETRY.agc:114
//		STODL	4		# MODE 2 TRUNNION TO 4.
// PORT: Fixed ROM slots 13410.
    13410, 12298,
// PORT: SOURCE LEM_GEOMETRY.agc:115
//
// PORT: SOURCE LEM_GEOMETRY.agc:116
//			LO6ZEROS
// PORT: Fixed ROM slots 13411.
    13411, 20494,
// PORT: SOURCE LEM_GEOMETRY.agc:117
//		STOVL	34D		# UNIT THE PROJECTION OF THE VECTOR
// PORT: Fixed ROM slots 13412.
    13412, 20550,
// PORT: SOURCE LEM_GEOMETRY.agc:118
//			32D		#   IN THE X-Z PLANE
// PORT: Fixed ROM slots 13413.
    13413, 66,
// PORT: SOURCE LEM_GEOMETRY.agc:119
//		UNIT	BOVB		# IF OVERFLOW,TARGET VECTOR IS ALONG Y
// PORT: Fixed ROM slots 13414.
    13414, 33884,
// PORT: SOURCE LEM_GEOMETRY.agc:120
//			LUNDESCH	# CALL FOR MANEUVER UNLESS ON LUNAR SURF
// PORT: Fixed ROM slots 13415.
    13415, 43554,
// PORT: SOURCE LEM_GEOMETRY.agc:121
//		STODL	32D		# PROJECTION VECTOR.
// PORT: Fixed ROM slots 13416.
    13416, 12354,
// PORT: SOURCE LEM_GEOMETRY.agc:122
//			32D
// PORT: Fixed ROM slots 13417.
    13417, 66,
// PORT: SOURCE LEM_GEOMETRY.agc:123
//		SR1	STQ
// PORT: Fixed ROM slots 13418.
    13418, 37060,
// PORT: SOURCE LEM_GEOMETRY.agc:124
//			S2
// PORT: Fixed ROM slots 13419.
    13419, 82,
// PORT: SOURCE LEM_GEOMETRY.agc:125
//		STODL	SINTH		# USE ARCTRIG SINCE SHAFT COULD BE ARB.
// PORT: Fixed ROM slots 13420.
    13420, 12326,
// PORT: SOURCE LEM_GEOMETRY.agc:126
//			36D
// PORT: Fixed ROM slots 13421.
    13421, 74,
// PORT: SOURCE LEM_GEOMETRY.agc:127
//		SR1
// PORT: Fixed ROM slots 13422.
    13422, 65476,
// PORT: SOURCE LEM_GEOMETRY.agc:128
//		STCALL	COSTH
// PORT: Fixed ROM slots 13423.
    13423, 28706
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE LEM_GEOMETRY.agc:129
//			ARCTRIG
// PORT: Fixed ROM slots 13424.
    13424, 40352,
// PORT: SOURCE LEM_GEOMETRY.agc:130
//# Page 323
// PORT: SOURCE LEM_GEOMETRY.agc:131
//		PUSH	DAD		# MODE 1 SHAFT TO 2.
// PORT: Fixed ROM slots 13425.
    13425, 36108,
// PORT: SOURCE LEM_GEOMETRY.agc:132
//			LODPHALF
// PORT: Fixed ROM slots 13426.
    13426, 20490,
// PORT: SOURCE LEM_GEOMETRY.agc:133
//		STOVL	6
// PORT: Fixed ROM slots 13427.
    13427, 20494,
// PORT: SOURCE LEM_GEOMETRY.agc:134
//			4
// PORT: Fixed ROM slots 13428.
    13428, 10,
// PORT: SOURCE LEM_GEOMETRY.agc:135
//		RTB			# FIND MODE 2 CDU ANGLES.
// PORT: Fixed ROM slots 13429.
    13429, 65336,
// PORT: SOURCE LEM_GEOMETRY.agc:136
//			2V1STO2S
// PORT: Fixed ROM slots 13430.
    13430, 18234,
// PORT: SOURCE LEM_GEOMETRY.agc:137
//		STOVL	MODEB
// PORT: Fixed ROM slots 13431.
    13431, 21652,
// PORT: SOURCE LEM_GEOMETRY.agc:138
//			0
// PORT: Fixed ROM slots 13432.
    13432, 2,
// PORT: SOURCE LEM_GEOMETRY.agc:139
//		RTB			# MODE 1 ANGLES TO MODE A.
// PORT: Fixed ROM slots 13433.
    13433, 65336,
// PORT: SOURCE LEM_GEOMETRY.agc:140
//			2V1STO2S
// PORT: Fixed ROM slots 13434.
    13434, 18234,
// PORT: SOURCE LEM_GEOMETRY.agc:141
//		STORE	MODEA
// PORT: Fixed ROM slots 13435.
    13435, 1168,
// PORT: SOURCE LEM_GEOMETRY.agc:142
//		EXIT
// PORT: Fixed ROM slots 13436.
    13436, 65532
)).

// PORT: Physical bank 13. Shared continuation entries, slots 13437–13444.
function agcAotUnit751 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 13440 {
        if slot <= 13438 {
            if slot <= 13437 {
// PORT: SOURCE LEM_GEOMETRY.agc:143
//
// PORT: SOURCE LEM_GEOMETRY.agc:144
//		CS	RADMODES	# SWAP MODEA AND MODEB IF RR IN MODE 2.
// PORT: Fixed ROM slots 13437.
                if slot <> 13437 or instruction <> 16456 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 72).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LEM_GEOMETRY.agc:145
//		MASK	ANTENBIT
// PORT: Fixed ROM slots 13438.
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
// PORT: SOURCE LEM_GEOMETRY.agc:146
//		CCS	A
// PORT: Fixed ROM slots 13439.
                if slot <> 13439 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LEM_GEOMETRY.agc:147
//		TCF	+4
// PORT: Fixed ROM slots 13440.
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
// PORT: SOURCE LEM_GEOMETRY.agc:148
//
// PORT: SOURCE LEM_GEOMETRY.agc:149
//		DXCH	MODEA
// PORT: Fixed ROM slots 13441.
                if slot <> 13441 or instruction <> 22088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LEM_GEOMETRY.agc:150
//		DXCH	MODEB
// PORT: Fixed ROM slots 13442.
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
// PORT: SOURCE LEM_GEOMETRY.agc:151
//		DXCH	MODEA
// PORT: Fixed ROM slots 13443.
                if slot <> 13443 or instruction <> 22088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 584, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LEM_GEOMETRY.agc:152
//
// PORT: SOURCE LEM_GEOMETRY.agc:153
//		TC	INTPRET
// PORT: Fixed ROM slots 13444.
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
// PORT: SOURCE LEM_GEOMETRY.agc:154
//		GOTO
// PORT: Fixed ROM slots 13445.
    13445, 65360,
// PORT: SOURCE LEM_GEOMETRY.agc:155
//			S2
// PORT: Fixed ROM slots 13446.
    13446, 82,
// PORT: SOURCE LEM_GEOMETRY.agc:156
//# Page 324
// PORT: SOURCE LEM_GEOMETRY.agc:157
//# GIVEN RR TRUNNION AND SHAFT (T,S) IN TANGNB,+1,FIND THE ASSOCIATED
// PORT: SOURCE LEM_GEOMETRY.agc:158
//# LINE OF SIGHT IN NAV BASE AXES.  THE HALF UNIT VECTOR, .5(SIN(S)COS(T),
// PORT: SOURCE LEM_GEOMETRY.agc:159
//# -SIN(T),COS(S)COS(T)) IS LEFT IN MPAC AND 32D.
// PORT: SOURCE LEM_GEOMETRY.agc:160
//
// PORT: SOURCE LEM_GEOMETRY.agc:161
//		SETLOC	INFLIGHT
// PORT: SOURCE LEM_GEOMETRY.agc:162
//		BANK
// PORT: SOURCE LEM_GEOMETRY.agc:163
//
// PORT: SOURCE LEM_GEOMETRY.agc:164
//		COUNT*	$$/GEOM
// PORT: SOURCE LEM_GEOMETRY.agc:165
//
// PORT: SOURCE LEM_GEOMETRY.agc:166
//RRNB		SLOAD	RTB
// PORT: Fixed ROM slots 21537.
    21537, 40122,
// PORT: SOURCE LEM_GEOMETRY.agc:167
//			TANGNB
// PORT: Fixed ROM slots 21538.
    21538, 4054,
// PORT: SOURCE LEM_GEOMETRY.agc:168
//			CDULOGIC
// PORT: Fixed ROM slots 21539.
    21539, 18172,
// PORT: SOURCE LEM_GEOMETRY.agc:169
//		SETPD	PUSH		# TRUNNION ANGLE TO 0
// PORT: Fixed ROM slots 21540.
    21540, 34306,
// PORT: SOURCE LEM_GEOMETRY.agc:170
//			0
// PORT: Fixed ROM slots 21541.
    21541, 2,
// PORT: SOURCE LEM_GEOMETRY.agc:171
//		SIN	DCOMP
// PORT: Fixed ROM slots 21542.
    21542, 48860,
// PORT: SOURCE LEM_GEOMETRY.agc:172
//		STODL	34D		# Y COMPONENT
// PORT: Fixed ROM slots 21543.
    21543, 12358,
// PORT: SOURCE LEM_GEOMETRY.agc:173
//
// PORT: SOURCE LEM_GEOMETRY.agc:174
//		COS	PUSH		# .5 COS(T) TO 0
// PORT: Fixed ROM slots 21544.
    21544, 34508,
// PORT: SOURCE LEM_GEOMETRY.agc:175
//		SLOAD	RTB
// PORT: Fixed ROM slots 21545.
    21545, 40122,
// PORT: SOURCE LEM_GEOMETRY.agc:176
//			TANGNB +1
// PORT: Fixed ROM slots 21546.
    21546, 4056,
// PORT: SOURCE LEM_GEOMETRY.agc:177
//			CDULOGIC
// PORT: Fixed ROM slots 21547.
    21547, 18172,
// PORT: SOURCE LEM_GEOMETRY.agc:178
//RRNB1		PUSH	COS		# SHAFT ANGLE TO 2
// PORT: Fixed ROM slots 21548.
    21548, 58892,
// PORT: SOURCE LEM_GEOMETRY.agc:179
//		DMP	SL1
// PORT: Fixed ROM slots 21549.
    21549, 59914,
// PORT: SOURCE LEM_GEOMETRY.agc:180
//			0
// PORT: Fixed ROM slots 21550.
    21550, 2,
// PORT: SOURCE LEM_GEOMETRY.agc:181
//		STODL	36D		# Z COMPONENT
// PORT: Fixed ROM slots 21551.
    21551, 12362,
// PORT: SOURCE LEM_GEOMETRY.agc:182
//
// PORT: SOURCE LEM_GEOMETRY.agc:183
//		SIN	DMP
// PORT: Fixed ROM slots 21552.
    21552, 34268,
// PORT: SOURCE LEM_GEOMETRY.agc:184
//		SL1
// PORT: Fixed ROM slots 21553.
    21553, 65492,
// PORT: SOURCE LEM_GEOMETRY.agc:185
//		STOVL	32D
// PORT: Fixed ROM slots 21554.
    21554, 20546,
// PORT: SOURCE LEM_GEOMETRY.agc:186
//			32D
// PORT: Fixed ROM slots 21555.
    21555, 66,
// PORT: SOURCE LEM_GEOMETRY.agc:187
//		RVQ
// PORT: Fixed ROM slots 21556.
    21556, 65308,
// PORT: SOURCE LEM_GEOMETRY.agc:188
//
// PORT: SOURCE LEM_GEOMETRY.agc:189
//# THIS ENTRY TO RRNB REQUIRES THE TRUNNION AND SHAFT ANGLES IN MPAC AND MPAC +1 RESPECTIVELY
// PORT: SOURCE LEM_GEOMETRY.agc:190
//
// PORT: SOURCE LEM_GEOMETRY.agc:191
//RRNBMPAC	STODL	20D		# SAVE SHAFT CDU IN 21.
// PORT: Fixed ROM slots 21557.
    21557, 12330,
// PORT: SOURCE LEM_GEOMETRY.agc:192
//			MPAC		# SET MODE TO DP.  (THE PRECEEDING STORE
// PORT: Fixed ROM slots 21558.
    21558, 218,
// PORT: SOURCE LEM_GEOMETRY.agc:193
//					# MAY BE DP. TP OR VECTOR.)
// PORT: SOURCE LEM_GEOMETRY.agc:194
//		RTB	SETPD
// PORT: Fixed ROM slots 21559.
    21559, 33080,
// PORT: SOURCE LEM_GEOMETRY.agc:195
//			CDULOGIC
// PORT: Fixed ROM slots 21560.
    21560, 18172,
// PORT: SOURCE LEM_GEOMETRY.agc:196
//			0
// PORT: Fixed ROM slots 21561.
    21561, 2,
// PORT: SOURCE LEM_GEOMETRY.agc:197
//		PUSH	SIN		# TRUNNION ANGLE TO 0
// PORT: Fixed ROM slots 21562.
    21562, 60940,
// PORT: SOURCE LEM_GEOMETRY.agc:198
//		DCOMP
// PORT: Fixed ROM slots 21563.
    21563, 65404,
// PORT: SOURCE LEM_GEOMETRY.agc:199
//		STODL	34D		# Y COMPONENT
// PORT: Fixed ROM slots 21564.
    21564, 12358,
// PORT: SOURCE LEM_GEOMETRY.agc:200
//		COS	PUSH		# .5COS(T) TO 0
// PORT: Fixed ROM slots 21565.
    21565, 34508,
// PORT: SOURCE LEM_GEOMETRY.agc:201
//		SLOAD	RTB		# PICK UP CDU'S.
// PORT: Fixed ROM slots 21566.
    21566, 40122,
// PORT: SOURCE LEM_GEOMETRY.agc:202
//			21D
// PORT: Fixed ROM slots 21567.
    21567, 44,
// PORT: SOURCE LEM_GEOMETRY.agc:203
//			CDULOGIC
// PORT: Fixed ROM slots 21568.
    21568, 18172,
// PORT: SOURCE LEM_GEOMETRY.agc:204
//		GOTO
// PORT: Fixed ROM slots 21569.
    21569, 65360,
// PORT: SOURCE LEM_GEOMETRY.agc:205
//			RRNB1
// PORT: Fixed ROM slots 21570.
    21570, 39000
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE LEM_GEOMETRY.agc:206
//# Page 325 (empty page)
