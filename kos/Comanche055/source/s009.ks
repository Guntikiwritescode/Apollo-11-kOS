// PORT: Original source unit CSM_GEOMETRY.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE CSM_GEOMETRY.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE CSM_GEOMETRY.agc:2
//# Filename:	CSM_GEOMETRY.agc
// PORT: SOURCE CSM_GEOMETRY.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE CSM_GEOMETRY.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE CSM_GEOMETRY.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE CSM_GEOMETRY.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE CSM_GEOMETRY.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE CSM_GEOMETRY.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE CSM_GEOMETRY.agc:9
//# Pages:	285-296
// PORT: SOURCE CSM_GEOMETRY.agc:10
//# Mod history:	2009-05-08 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE CSM_GEOMETRY.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE CSM_GEOMETRY.agc:12
//#
// PORT: SOURCE CSM_GEOMETRY.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE CSM_GEOMETRY.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE CSM_GEOMETRY.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE CSM_GEOMETRY.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE CSM_GEOMETRY.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE CSM_GEOMETRY.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE CSM_GEOMETRY.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE CSM_GEOMETRY.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE CSM_GEOMETRY.agc:21
//#
// PORT: SOURCE CSM_GEOMETRY.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE CSM_GEOMETRY.agc:23
//#
// PORT: SOURCE CSM_GEOMETRY.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE CSM_GEOMETRY.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE CSM_GEOMETRY.agc:26
//#
// PORT: SOURCE CSM_GEOMETRY.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE CSM_GEOMETRY.agc:28
//#			Colossus 2A
// PORT: SOURCE CSM_GEOMETRY.agc:29
//
// PORT: SOURCE CSM_GEOMETRY.agc:30
//# Page 285
// PORT: SOURCE CSM_GEOMETRY.agc:31
//		BANK	22
// PORT: SOURCE CSM_GEOMETRY.agc:32
//		SETLOC	COMGEOM1
// PORT: SOURCE CSM_GEOMETRY.agc:33
//		BANK
// PORT: SOURCE CSM_GEOMETRY.agc:34
//
// PORT: SOURCE CSM_GEOMETRY.agc:35
//# THIS ROUTINE TAKES THE SHAFT AND TRUNNION ANGLES AS READ BY THE CM OPTICAL SYSTEM AND CONVERTS THEM INTO A  UNIT
// PORT: SOURCE CSM_GEOMETRY.agc:36
//# VECTOR REFERENCED TO THE NAVIGATION BASE COORDINATE SYSTEM AND COINCIDENT WITH THE SEXTANT LINE OF SIGHT.
// PORT: SOURCE CSM_GEOMETRY.agc:37
//#
// PORT: SOURCE CSM_GEOMETRY.agc:38
//# THE INPUTS ARE  1) THE SEXTANT SHAFT AND TRUNNION ANGLES ARE STORED SP IN LOCATIONS 3 AND 5 RESPECTIVELY OF THE
// PORT: SOURCE CSM_GEOMETRY.agc:39
//# MARK VAC AREA.  2) THE COMPLEMENT OF THE BASE ADDRESS OF THE MARK VAC AREA IS STORED SP AT LOCATION X1 OF YOUR
// PORT: SOURCE CSM_GEOMETRY.agc:40
//# JOB VAC AREA.
// PORT: SOURCE CSM_GEOMETRY.agc:41
//#
// PORT: SOURCE CSM_GEOMETRY.agc:42
//# THE OUTPUT IS A HALF-UNIT VECTOR IN NAVIGATION BASE COORDINATES AND STORED AT LOCATION 32D OF THE VAC AREA. THE
// PORT: SOURCE CSM_GEOMETRY.agc:43
//# OUTPUT IS ALSO AVAILABLE AT MPAC.
// PORT: SOURCE CSM_GEOMETRY.agc:44
//
// PORT: SOURCE CSM_GEOMETRY.agc:45
//
// PORT: SOURCE CSM_GEOMETRY.agc:46
//		COUNT	23/GEOM
// PORT: SOURCE CSM_GEOMETRY.agc:47
//
// PORT: SOURCE CSM_GEOMETRY.agc:48
//SXTNB		SLOAD*	RTB		# PUSHDOWN  00,02,04,(17D-19D),32D-36D
// PORT: Fixed ROM slots 21504.
    21504, 40118,
// PORT: SOURCE CSM_GEOMETRY.agc:49
//			5,1		# TRUNNION = TA
// PORT: Fixed ROM slots 21505.
    21505, 12,
// PORT: SOURCE CSM_GEOMETRY.agc:50
//			CDULOGIC
// PORT: Fixed ROM slots 21506.
    21506, 38550,
// PORT: SOURCE CSM_GEOMETRY.agc:51
//		RTB	PUSH
// PORT: Fixed ROM slots 21507.
    21507, 34360,
// PORT: SOURCE CSM_GEOMETRY.agc:52
//			SXTLOGIC
// PORT: Fixed ROM slots 21508.
    21508, 38958,
// PORT: SOURCE CSM_GEOMETRY.agc:53
//		SIN	SL1
// PORT: Fixed ROM slots 21509.
    21509, 60124,
// PORT: SOURCE CSM_GEOMETRY.agc:54
//		PUSH	SLOAD*		# PD2 = SIN(TA)
// PORT: Fixed ROM slots 21510.
    21510, 56076,
// PORT: SOURCE CSM_GEOMETRY.agc:55
//			3,1		# SHAFT = SA
// PORT: Fixed ROM slots 21511.
    21511, 8,
// PORT: SOURCE CSM_GEOMETRY.agc:56
//		RTB	PUSH		# PD4 = SA
// PORT: Fixed ROM slots 21512.
    21512, 34360,
// PORT: SOURCE CSM_GEOMETRY.agc:57
//			CDULOGIC
// PORT: Fixed ROM slots 21513.
    21513, 38550,
// PORT: SOURCE CSM_GEOMETRY.agc:58
//
// PORT: SOURCE CSM_GEOMETRY.agc:59
//		COS	DMP
// PORT: Fixed ROM slots 21514.
    21514, 34252,
// PORT: SOURCE CSM_GEOMETRY.agc:60
//			2
// PORT: Fixed ROM slots 21515.
    21515, 6,
// PORT: SOURCE CSM_GEOMETRY.agc:61
//		STODL	STARM		# COS(SA)SIN(TA)
// PORT: Fixed ROM slots 21516.
    21516, 12354,
// PORT: SOURCE CSM_GEOMETRY.agc:62
//
// PORT: SOURCE CSM_GEOMETRY.agc:63
//		SIN	DMP
// PORT: Fixed ROM slots 21517.
    21517, 34268,
// PORT: SOURCE CSM_GEOMETRY.agc:64
//		STADR
// PORT: Fixed ROM slots 21518.
    21518, 65324,
// PORT: SOURCE CSM_GEOMETRY.agc:65
//		STODL	STARM	+2	# SIN(SA)SIN(TA)
// PORT: Fixed ROM slots 21519.
    21519, 53176,
// PORT: SOURCE CSM_GEOMETRY.agc:66
//
// PORT: SOURCE CSM_GEOMETRY.agc:67
//		COS
// PORT: Fixed ROM slots 21520.
    21520, 65484,
// PORT: SOURCE CSM_GEOMETRY.agc:68
//		STOVL	STARM	+4
// PORT: Fixed ROM slots 21521.
    21521, 20554,
// PORT: SOURCE CSM_GEOMETRY.agc:69
//			STARM		# STARM = 32D
// PORT: Fixed ROM slots 21522.
    21522, 66,
// PORT: SOURCE CSM_GEOMETRY.agc:70
//		MXV	VSL1
// PORT: Fixed ROM slots 21523.
    21523, 64162,
// PORT: SOURCE CSM_GEOMETRY.agc:71
//			NB1NB2
// PORT: Fixed ROM slots 21524.
    21524, 6532,
// PORT: SOURCE CSM_GEOMETRY.agc:72
//		STORE	32D
// PORT: Fixed ROM slots 21525.
    21525, 66,
// PORT: SOURCE CSM_GEOMETRY.agc:73
//		RVQ
// PORT: Fixed ROM slots 21526.
    21526, 65308
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21527–21531.
function agcAotUnit1223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21528 {
        if slot <= 21527 {
// PORT: SOURCE CSM_GEOMETRY.agc:74
//
// PORT: SOURCE CSM_GEOMETRY.agc:75
//
// PORT: SOURCE CSM_GEOMETRY.agc:76
//SXTLOGIC	CAF	10DEGS-		# CORRECT FOR 19.775 DEGREE OFFSET
// PORT: Fixed ROM slots 21527.
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
// PORT: SOURCE CSM_GEOMETRY.agc:77
//		ADS	MPAC
// PORT: Fixed ROM slots 21528.
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
// PORT: SOURCE CSM_GEOMETRY.agc:78
//		CAF	QUARTER
// PORT: Fixed ROM slots 21529.
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
// PORT: SOURCE CSM_GEOMETRY.agc:79
//		TC	SHORTMP
// PORT: Fixed ROM slots 21530.
                if slot <> 21530 or instruction <> 3758 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3758, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE CSM_GEOMETRY.agc:80
//		TC	DANZIG
// PORT: Fixed ROM slots 21531.
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
// PORT: SOURCE CSM_GEOMETRY.agc:81
//# Page 286
// PORT: SOURCE CSM_GEOMETRY.agc:82
//# CALCSXA COMPUTES THE SEXTANT SHAFT AND TRUNNION ANGLES REQUIRED TO POSITION THE OPTICS SUCH THAT A STAR LINE-
// PORT: SOURCE CSM_GEOMETRY.agc:83
//# OF-SIGHT LIES ALONG THE STAR VECTOR.  THE ROUTINE TAKES THE GIVEN STAR VECTOR AND EXPRESSES IT AS A VECTOR REF-
// PORT: SOURCE CSM_GEOMETRY.agc:84
//# ERENCED TO THE OPTICS COORDINATE SYSTEM.  IN ADDITION IT SETS UP THREE UNIT VECTORS DEFINING THE X,Y, AND Z AXES
// PORT: SOURCE CSM_GEOMETRY.agc:85
//# REFERENCED TO THE OPTICS COORDINATE SYSTEM.
// PORT: SOURCE CSM_GEOMETRY.agc:86
//#
// PORT: SOURCE CSM_GEOMETRY.agc:87
//# THE INPUTS ARE  1) THE STAR VECTOR REFERRED TO PRESENT STABLE MEMBER COORDINATES STORED AT STAR.  2) SAME ANGLE
// PORT: SOURCE CSM_GEOMETRY.agc:88
//# INPUT AS *SMNB*, I.E. SINES AND COSINES OF THE CDU ANGLES, IN THE ORDER Y Z X, AT SINCDU AND COSCDU.  A CALL
// PORT: SOURCE CSM_GEOMETRY.agc:89
//# TO CDUTRIG WILL PROVIDE THIS INPUT.
// PORT: SOURCE CSM_GEOMETRY.agc:90
//#
// PORT: SOURCE CSM_GEOMETRY.agc:91
//# THE OUTPUTS ARE THE SEXTANT SHAFT AND TRUNNION ANGLES STORED DP AT SAC AND PAC RESPECTIVELY.  (LOW ORDER PART
// PORT: SOURCE CSM_GEOMETRY.agc:92
//# EQUAL TO ZERO).
// PORT: SOURCE CSM_GEOMETRY.agc:93
//
// PORT: SOURCE CSM_GEOMETRY.agc:94
//
// PORT: SOURCE CSM_GEOMETRY.agc:95
//CALCSXA		ITA	VLOAD		# PUSHDOWN 00-26D,28D,30D,32D-36D
// PORT: Fixed ROM slots 21532.
    21532, 64800,
// PORT: SOURCE CSM_GEOMETRY.agc:96
//			28D
// PORT: Fixed ROM slots 21533.
    21533, 56,
// PORT: SOURCE CSM_GEOMETRY.agc:97
//			STAR
// PORT: Fixed ROM slots 21534.
    21534, 3052,
// PORT: SOURCE CSM_GEOMETRY.agc:98
//		CALL
// PORT: Fixed ROM slots 21535.
    21535, 65320,
// PORT: SOURCE CSM_GEOMETRY.agc:99
//			*SMNB*
// PORT: Fixed ROM slots 21536.
    21536, 40776,
// PORT: SOURCE CSM_GEOMETRY.agc:100
//		MXV	VSL1
// PORT: Fixed ROM slots 21537.
    21537, 64162,
// PORT: SOURCE CSM_GEOMETRY.agc:101
//			NB2NB1
// PORT: Fixed ROM slots 21538.
    21538, 6496,
// PORT: SOURCE CSM_GEOMETRY.agc:102
//		STOVL	STAR
// PORT: Fixed ROM slots 21539.
    21539, 23532,
// PORT: SOURCE CSM_GEOMETRY.agc:103
//			HIUNITX
// PORT: Fixed ROM slots 21540.
    21540, 13750,
// PORT: SOURCE CSM_GEOMETRY.agc:104
//		STOVL	XNB1
// PORT: Fixed ROM slots 21541.
    21541, 23258,
// PORT: SOURCE CSM_GEOMETRY.agc:105
//			HIUNITY
// PORT: Fixed ROM slots 21542.
    21542, 13746,
// PORT: SOURCE CSM_GEOMETRY.agc:106
//		STOVL	YNB1
// PORT: Fixed ROM slots 21543.
    21543, 23270,
// PORT: SOURCE CSM_GEOMETRY.agc:107
//			HIUNITZ
// PORT: Fixed ROM slots 21544.
    21544, 13742,
// PORT: SOURCE CSM_GEOMETRY.agc:108
//		STCALL	ZNB1
// PORT: Fixed ROM slots 21545.
    21545, 31474,
// PORT: SOURCE CSM_GEOMETRY.agc:109
//			SXTANG1
// PORT: Fixed ROM slots 21546.
    21546, 39036,
// PORT: SOURCE CSM_GEOMETRY.agc:110
//# Page 287
// PORT: SOURCE CSM_GEOMETRY.agc:111
//# SXTANG COMPUTES THE SEXTANT SHAFT AND TRUNNION ANGLES REQUIRED TO POSITION THE OPTICS SUCH THAT A STAR LINE-OF-
// PORT: SOURCE CSM_GEOMETRY.agc:112
//# SIGHT LIES ALONG THE STAR VECTOR.
// PORT: SOURCE CSM_GEOMETRY.agc:113
//#
// PORT: SOURCE CSM_GEOMETRY.agc:114
//# THE INPUTS ARE  1) THE STAR VECTOR REFERRED TO ANY COORDINATE SYSTEM STORED AT STAR.  2) THE NAVIGATION BASE
// PORT: SOURCE CSM_GEOMETRY.agc:115
//# COORDINATES REFERRED TO THE SAME COORDINATE SYSTEM.  THESE THREE HALF-UNIT VECTORS ARE STORED AT XNB, YNB, AND
// PORT: SOURCE CSM_GEOMETRY.agc:116
//# ZNB.
// PORT: SOURCE CSM_GEOMETRY.agc:117
//#
// PORT: SOURCE CSM_GEOMETRY.agc:118
//# THE OUTPUTS ARE THE SEXTANT SHAFT AND TRUNNION ANGLES STORED DP AT SAC AND PAC RESPECTIVELY.  (LOW ORDER PART
// PORT: SOURCE CSM_GEOMETRY.agc:119
//# EQUAL TO ZERO).
// PORT: SOURCE CSM_GEOMETRY.agc:120
//
// PORT: SOURCE CSM_GEOMETRY.agc:121
//
// PORT: SOURCE CSM_GEOMETRY.agc:122
//SXTANG		ITA	RTB		# PUSHDOWN  16D,18D,22D-26D,28D
// PORT: Fixed ROM slots 21547.
    21547, 39968,
// PORT: SOURCE CSM_GEOMETRY.agc:123
//			28D
// PORT: Fixed ROM slots 21548.
    21548, 56,
// PORT: SOURCE CSM_GEOMETRY.agc:124
//			TRANSP1		# EREF WRT NB2
// PORT: Fixed ROM slots 21549.
    21549, 38756,
// PORT: SOURCE CSM_GEOMETRY.agc:125
//		VLOAD	MXV
// PORT: Fixed ROM slots 21550.
    21550, 53754,
// PORT: SOURCE CSM_GEOMETRY.agc:126
//			XNB
// PORT: Fixed ROM slots 21551.
    21551, 2968,
// PORT: SOURCE CSM_GEOMETRY.agc:127
//			NB2NB1
// PORT: Fixed ROM slots 21552.
    21552, 6496,
// PORT: SOURCE CSM_GEOMETRY.agc:128
//		VSL1
// PORT: Fixed ROM slots 21553.
    21553, 65524,
// PORT: SOURCE CSM_GEOMETRY.agc:129
//		STOVL	XNB1
// PORT: Fixed ROM slots 21554.
    21554, 23258,
// PORT: SOURCE CSM_GEOMETRY.agc:130
//			YNB
// PORT: Fixed ROM slots 21555.
    21555, 2980,
// PORT: SOURCE CSM_GEOMETRY.agc:131
//		MXV	VSL1
// PORT: Fixed ROM slots 21556.
    21556, 64162,
// PORT: SOURCE CSM_GEOMETRY.agc:132
//			NB2NB1
// PORT: Fixed ROM slots 21557.
    21557, 6496,
// PORT: SOURCE CSM_GEOMETRY.agc:133
//		STOVL	YNB1
// PORT: Fixed ROM slots 21558.
    21558, 23270,
// PORT: SOURCE CSM_GEOMETRY.agc:134
//			ZNB
// PORT: Fixed ROM slots 21559.
    21559, 2992,
// PORT: SOURCE CSM_GEOMETRY.agc:135
//		MXV	VSL1
// PORT: Fixed ROM slots 21560.
    21560, 64162,
// PORT: SOURCE CSM_GEOMETRY.agc:136
//			NB2NB1
// PORT: Fixed ROM slots 21561.
    21561, 6496,
// PORT: SOURCE CSM_GEOMETRY.agc:137
//		STORE	ZNB1
// PORT: Fixed ROM slots 21562.
    21562, 2802,
// PORT: SOURCE CSM_GEOMETRY.agc:138
//
// PORT: SOURCE CSM_GEOMETRY.agc:139
//		RTB	RTB
// PORT: Fixed ROM slots 21563.
    21563, 39992,
// PORT: SOURCE CSM_GEOMETRY.agc:140
//			TRANSP1
// PORT: Fixed ROM slots 21564.
    21564, 38756,
// PORT: SOURCE CSM_GEOMETRY.agc:141
//			TRANSP2
// PORT: Fixed ROM slots 21565.
    21565, 38780,
// PORT: SOURCE CSM_GEOMETRY.agc:142
//
// PORT: SOURCE CSM_GEOMETRY.agc:143
//SXTANG1		VLOAD	VXV
// PORT: Fixed ROM slots 21566.
    21566, 40442,
// PORT: SOURCE CSM_GEOMETRY.agc:144
//			ZNB1
// PORT: Fixed ROM slots 21567.
    21567, 2802,
// PORT: SOURCE CSM_GEOMETRY.agc:145
//			STAR
// PORT: Fixed ROM slots 21568.
    21568, 3052,
// PORT: SOURCE CSM_GEOMETRY.agc:146
//		BOV
// PORT: Fixed ROM slots 21569.
    21569, 65280,
// PORT: SOURCE CSM_GEOMETRY.agc:147
//			+1
// PORT: Fixed ROM slots 21570.
    21570, 39046,
// PORT: SOURCE CSM_GEOMETRY.agc:148
//		UNIT	BOV
// PORT: Fixed ROM slots 21571.
    21571, 32860,
// PORT: SOURCE CSM_GEOMETRY.agc:149
//			ZNB=S1
// PORT: Fixed ROM slots 21572.
    21572, 39114,
// PORT: SOURCE CSM_GEOMETRY.agc:150
//		STORE	PDA		# PDA = UNIT(ZNB X S)
// PORT: Fixed ROM slots 21573.
    21573, 46,
// PORT: SOURCE CSM_GEOMETRY.agc:151
//
// PORT: SOURCE CSM_GEOMETRY.agc:152
//		DOT	DCOMP
// PORT: Fixed ROM slots 21574.
    21574, 48706,
// PORT: SOURCE CSM_GEOMETRY.agc:153
//			XNB1
// PORT: Fixed ROM slots 21575.
    21575, 2778,
// PORT: SOURCE CSM_GEOMETRY.agc:154
//		STOVL	SINTH		# SIN(SA) = PDA . -XNB
// PORT: Fixed ROM slots 21576.
    21576, 20518,
// PORT: SOURCE CSM_GEOMETRY.agc:155
//			PDA
// PORT: Fixed ROM slots 21577.
    21577, 46,
// PORT: SOURCE CSM_GEOMETRY.agc:156
//
// PORT: SOURCE CSM_GEOMETRY.agc:157
//		DOT
// PORT: Fixed ROM slots 21578.
    21578, 65346,
// PORT: SOURCE CSM_GEOMETRY.agc:158
//			YNB1
// PORT: Fixed ROM slots 21579.
    21579, 2790,
// PORT: SOURCE CSM_GEOMETRY.agc:159
//		STCALL	COSTH		# COS(SA) = PDA . YNB
// PORT: Fixed ROM slots 21580.
    21580, 28706,
// PORT: SOURCE CSM_GEOMETRY.agc:160
//			ARCTRIG
// PORT: Fixed ROM slots 21581.
    21581, 40284,
// PORT: SOURCE CSM_GEOMETRY.agc:161
//# Page 288
// PORT: SOURCE CSM_GEOMETRY.agc:162
//		RTB
// PORT: Fixed ROM slots 21582.
    21582, 65336,
// PORT: SOURCE CSM_GEOMETRY.agc:163
//			1STO2S
// PORT: Fixed ROM slots 21583.
    21583, 38604,
// PORT: SOURCE CSM_GEOMETRY.agc:164
//		STOVL	SAC
// PORT: Fixed ROM slots 21584.
    21584, 23544,
// PORT: SOURCE CSM_GEOMETRY.agc:165
//			STAR
// PORT: Fixed ROM slots 21585.
    21585, 3052,
// PORT: SOURCE CSM_GEOMETRY.agc:166
//		BOV
// PORT: Fixed ROM slots 21586.
    21586, 65280,
// PORT: SOURCE CSM_GEOMETRY.agc:167
//			+1
// PORT: Fixed ROM slots 21587.
    21587, 39080,
// PORT: SOURCE CSM_GEOMETRY.agc:168
//		DOT	SL1
// PORT: Fixed ROM slots 21588.
    21588, 59970,
// PORT: SOURCE CSM_GEOMETRY.agc:169
//			ZNB1
// PORT: Fixed ROM slots 21589.
    21589, 2802,
// PORT: SOURCE CSM_GEOMETRY.agc:170
//		ACOS
// PORT: Fixed ROM slots 21590.
    21590, 65452,
// PORT: SOURCE CSM_GEOMETRY.agc:171
//		BMN	SL2
// PORT: Fixed ROM slots 21591.
    21591, 51776,
// PORT: SOURCE CSM_GEOMETRY.agc:172
//			SXTALARM	# TRUNNION ANGLE NEGATIVE
// PORT: Fixed ROM slots 21592.
    21592, 39108,
// PORT: SOURCE CSM_GEOMETRY.agc:173
//		BOV	DSU
// PORT: Fixed ROM slots 21593.
    21593, 38144,
// PORT: SOURCE CSM_GEOMETRY.agc:174
//			SXTALARM	# TRUNNION ANGLE GREATER THAN 90 DEGREES
// PORT: Fixed ROM slots 21594.
    21594, 39108,
// PORT: SOURCE CSM_GEOMETRY.agc:175
//			20DEG-
// PORT: Fixed ROM slots 21595.
    21595, 6578,
// PORT: SOURCE CSM_GEOMETRY.agc:176
//		RTB
// PORT: Fixed ROM slots 21596.
    21596, 65336,
// PORT: SOURCE CSM_GEOMETRY.agc:177
//			1STO2S
// PORT: Fixed ROM slots 21597.
    21597, 38604,
// PORT: SOURCE CSM_GEOMETRY.agc:178
//		STORE	PAC		# FOR FLIGHT USE, CULTFLAG IS ON IF
// PORT: Fixed ROM slots 21598.
    21598, 3068,
// PORT: SOURCE CSM_GEOMETRY.agc:179
//		CLRGO			# TRUNION IS GREATER THAN 90 DEG
// PORT: Fixed ROM slots 21599.
    21599, 65304,
// PORT: SOURCE CSM_GEOMETRY.agc:180
//			CULTFLAG
// PORT: Fixed ROM slots 21600.
    21600, 1840,
// PORT: SOURCE CSM_GEOMETRY.agc:181
//			28D
// PORT: Fixed ROM slots 21601.
    21601, 56,
// PORT: SOURCE CSM_GEOMETRY.agc:182
//SXTALARM	SETGO			# ALARM HAS BEEN REMOVED FROM THIS
// PORT: Fixed ROM slots 21602.
    21602, 65304,
// PORT: SOURCE CSM_GEOMETRY.agc:183
//			CULTFLAG
// PORT: Fixed ROM slots 21603.
    21603, 1584,
// PORT: SOURCE CSM_GEOMETRY.agc:184
//			28D		# SUBROUTINE,ALARM WILL BE SET BY MPI
// PORT: Fixed ROM slots 21604.
    21604, 56,
// PORT: SOURCE CSM_GEOMETRY.agc:185
//ZNB=S1		DLOAD
// PORT: Fixed ROM slots 21605.
    21605, 65482,
// PORT: SOURCE CSM_GEOMETRY.agc:186
//			270DEG
// PORT: Fixed ROM slots 21606.
    21606, 6570,
// PORT: SOURCE CSM_GEOMETRY.agc:187
//		STODL	SAC
// PORT: Fixed ROM slots 21607.
    21607, 15352,
// PORT: SOURCE CSM_GEOMETRY.agc:188
//			20DEGS-
// PORT: Fixed ROM slots 21608.
    21608, 6574,
// PORT: SOURCE CSM_GEOMETRY.agc:189
//		STORE	PAC
// PORT: Fixed ROM slots 21609.
    21609, 3068,
// PORT: SOURCE CSM_GEOMETRY.agc:190
//		CLRGO
// PORT: Fixed ROM slots 21610.
    21610, 65304,
// PORT: SOURCE CSM_GEOMETRY.agc:191
//			CULTFLAG
// PORT: Fixed ROM slots 21611.
    21611, 1840,
// PORT: SOURCE CSM_GEOMETRY.agc:192
//			28D
// PORT: Fixed ROM slots 21612.
    21612, 56,
// PORT: SOURCE CSM_GEOMETRY.agc:193
//# Page 289
// PORT: SOURCE CSM_GEOMETRY.agc:194
//# THESE TWO ROUTINES COMPUTE THE ACTUAL STATE VECTOR FOR LM, CSM BY ADDING
// PORT: SOURCE CSM_GEOMETRY.agc:195
//# THE CONIC R,V AND THE DEVIATIONSR,V.  THE STATE VECTORS ARE CONVERTED TO
// PORT: SOURCE CSM_GEOMETRY.agc:196
//# METERS B-29 AND METERS/CSEC B-7 AND STORED APPROPRIATELY IN RN,VN OR
// PORT: SOURCE CSM_GEOMETRY.agc:197
//# R-OTHER , V-OTHER FOR DOWNLINK.  THE ROUTINES NAMES ARE SWITCHED IN THE
// PORT: SOURCE CSM_GEOMETRY.agc:198
//# OTHER VEHICLES COMPUTER.
// PORT: SOURCE CSM_GEOMETRY.agc:199
//#
// PORT: SOURCE CSM_GEOMETRY.agc:200
//# INPUT
// PORT: SOURCE CSM_GEOMETRY.agc:201
//#	STATE VECTOR IN TEMPORARY STORAGE AREA
// PORT: SOURCE CSM_GEOMETRY.agc:202
//#	IF STATE VECTOR IS SCALED POS B27 AND VEL B5
// PORT: SOURCE CSM_GEOMETRY.agc:203
//#		SET X2 TO +2
// PORT: SOURCE CSM_GEOMETRY.agc:204
//#	IF STATE VECTOR IS SCALED POS B29 AND VEL B7
// PORT: SOURCE CSM_GEOMETRY.agc:205
//#		SET X2 TO 0
// PORT: SOURCE CSM_GEOMETRY.agc:206
//#
// PORT: SOURCE CSM_GEOMETRY.agc:207
//# OUTPUT
// PORT: SOURCE CSM_GEOMETRY.agc:208
//#	R(T) IN RN, V(T) IN VN, T IN PIPTIME
// PORT: SOURCE CSM_GEOMETRY.agc:209
//#		OR
// PORT: SOURCE CSM_GEOMETRY.agc:210
//#	R(T) IN R-OTHER, V(T) IN V-OTHER	(T IS DEFINED BY T-OTHER)
// PORT: SOURCE CSM_GEOMETRY.agc:211
//
// PORT: SOURCE CSM_GEOMETRY.agc:212
//
// PORT: SOURCE CSM_GEOMETRY.agc:213
//		BANK	23
// PORT: SOURCE CSM_GEOMETRY.agc:214
//		SETLOC	COMGEOM2
// PORT: SOURCE CSM_GEOMETRY.agc:215
//		BANK
// PORT: SOURCE CSM_GEOMETRY.agc:216
//		COUNT	10/GEOM
// PORT: SOURCE CSM_GEOMETRY.agc:217
//SVDWN1		BOF	RVQ			# SW=1=AVETOMID DOING W-MATRIX INTEG
// PORT: Fixed ROM slots 10399.
    10399, 36376
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE CSM_GEOMETRY.agc:218
//			AVEMIDSW
// PORT: Fixed ROM slots 10400.
    10400, 5084,
// PORT: SOURCE CSM_GEOMETRY.agc:219
//			+1
// PORT: Fixed ROM slots 10401.
    10401, 16708,
// PORT: SOURCE CSM_GEOMETRY.agc:220
//		VLOAD	VSL*
// PORT: Fixed ROM slots 10402.
    10402, 45050,
// PORT: SOURCE CSM_GEOMETRY.agc:221
//			TDELTAV
// PORT: Fixed ROM slots 10403.
    10403, 1698,
// PORT: SOURCE CSM_GEOMETRY.agc:222
//			0	-7,2
// PORT: Fixed ROM slots 10404.
    10404, 48906,
// PORT: SOURCE CSM_GEOMETRY.agc:223
//		VAD	VSL*
// PORT: Fixed ROM slots 10405.
    10405, 44890,
// PORT: SOURCE CSM_GEOMETRY.agc:224
//			RCV
// PORT: Fixed ROM slots 10406.
    10406, 1722,
// PORT: SOURCE CSM_GEOMETRY.agc:225
//			0,2
// PORT: Fixed ROM slots 10407.
    10407, 48892,
// PORT: SOURCE CSM_GEOMETRY.agc:226
//		STOVL	RN
// PORT: Fixed ROM slots 10408.
    10408, 21746,
// PORT: SOURCE CSM_GEOMETRY.agc:227
//			TNUV
// PORT: Fixed ROM slots 10409.
    10409, 1710,
// PORT: SOURCE CSM_GEOMETRY.agc:228
//		VSL*	VAD
// PORT: Fixed ROM slots 10410.
    10410, 44382,
// PORT: SOURCE CSM_GEOMETRY.agc:229
//			0	-4,2
// PORT: Fixed ROM slots 10411.
    10411, 48900,
// PORT: SOURCE CSM_GEOMETRY.agc:230
//			VCV
// PORT: Fixed ROM slots 10412.
    10412, 1734,
// PORT: SOURCE CSM_GEOMETRY.agc:231
//		VSL*
// PORT: Fixed ROM slots 10413.
    10413, 65374,
// PORT: SOURCE CSM_GEOMETRY.agc:232
//			0,2
// PORT: Fixed ROM slots 10414.
    10414, 48892,
// PORT: SOURCE CSM_GEOMETRY.agc:233
//		STODL	VN
// PORT: Fixed ROM slots 10415.
    10415, 13566,
// PORT: SOURCE CSM_GEOMETRY.agc:234
//			TET
// PORT: Fixed ROM slots 10416.
    10416, 1694,
// PORT: SOURCE CSM_GEOMETRY.agc:235
//		STORE	PIPTIME
// PORT: Fixed ROM slots 10417.
    10417, 1290,
// PORT: SOURCE CSM_GEOMETRY.agc:236
//		RVQ
// PORT: Fixed ROM slots 10418.
    10418, 65308,
// PORT: SOURCE CSM_GEOMETRY.agc:237
//
// PORT: SOURCE CSM_GEOMETRY.agc:238
//SVDWN2		VLOAD	VSL*
// PORT: Fixed ROM slots 10419.
    10419, 45050,
// PORT: SOURCE CSM_GEOMETRY.agc:239
//			TDELTAV
// PORT: Fixed ROM slots 10420.
    10420, 1698,
// PORT: SOURCE CSM_GEOMETRY.agc:240
//			0	-7,2
// PORT: Fixed ROM slots 10421.
    10421, 48906,
// PORT: SOURCE CSM_GEOMETRY.agc:241
//		VAD	VSL*
// PORT: Fixed ROM slots 10422.
    10422, 44890,
// PORT: SOURCE CSM_GEOMETRY.agc:242
//			RCV
// PORT: Fixed ROM slots 10423.
    10423, 1722,
// PORT: SOURCE CSM_GEOMETRY.agc:243
//# Page 290
// PORT: SOURCE CSM_GEOMETRY.agc:244
//			0,2
// PORT: Fixed ROM slots 10424.
    10424, 48892,
// PORT: SOURCE CSM_GEOMETRY.agc:245
//		STOVL	R-OTHER
// PORT: Fixed ROM slots 10425.
    10425, 22436,
// PORT: SOURCE CSM_GEOMETRY.agc:246
//			TNUV
// PORT: Fixed ROM slots 10426.
    10426, 1710,
// PORT: SOURCE CSM_GEOMETRY.agc:247
//		VSL*	VAD
// PORT: Fixed ROM slots 10427.
    10427, 44382,
// PORT: SOURCE CSM_GEOMETRY.agc:248
//			0	-4,2
// PORT: Fixed ROM slots 10428.
    10428, 48900,
// PORT: SOURCE CSM_GEOMETRY.agc:249
//			VCV
// PORT: Fixed ROM slots 10429.
    10429, 1734,
// PORT: SOURCE CSM_GEOMETRY.agc:250
//		VSL*
// PORT: Fixed ROM slots 10430.
    10430, 65374,
// PORT: SOURCE CSM_GEOMETRY.agc:251
//			0,2
// PORT: Fixed ROM slots 10431.
    10431, 48892,
// PORT: SOURCE CSM_GEOMETRY.agc:252
//		STORE	V-OTHER
// PORT: Fixed ROM slots 10432.
    10432, 1968,
// PORT: SOURCE CSM_GEOMETRY.agc:253
//		RVQ
// PORT: Fixed ROM slots 10433.
    10433, 65308,
// PORT: SOURCE CSM_GEOMETRY.agc:254
//# Page 291
// PORT: SOURCE CSM_GEOMETRY.agc:255
//# SUBROUTINE TO COMPUTE THE NATURAL LOG OF C(MPAC, MPAC +1).
// PORT: SOURCE CSM_GEOMETRY.agc:256
//#
// PORT: SOURCE CSM_GEOMETRY.agc:257
//#	ENTRY:	CALL
// PORT: SOURCE CSM_GEOMETRY.agc:258
//#			LOG
// PORT: SOURCE CSM_GEOMETRY.agc:259
//#
// PORT: SOURCE CSM_GEOMETRY.agc:260
//# SUBROUTINE RETURNS WITH -LOG IN DP MPAC.
// PORT: SOURCE CSM_GEOMETRY.agc:261
//#
// PORT: SOURCE CSM_GEOMETRY.agc:262
//# EBANK IS ARBITRARY..
// PORT: SOURCE CSM_GEOMETRY.agc:263
//
// PORT: SOURCE CSM_GEOMETRY.agc:264
//		BANK	14
// PORT: SOURCE CSM_GEOMETRY.agc:265
//		SETLOC	POWFLIT2
// PORT: SOURCE CSM_GEOMETRY.agc:266
//		BANK
// PORT: SOURCE CSM_GEOMETRY.agc:267
//		COUNT	23/GEOM
// PORT: SOURCE CSM_GEOMETRY.agc:268
//
// PORT: SOURCE CSM_GEOMETRY.agc:269
//LOG		NORM	BDSU		# GENERATES LOG BY SHIFTING ARG
// PORT: Fixed ROM slots 21613.
    21613, 37250,
// PORT: SOURCE CSM_GEOMETRY.agc:270
//			MPAC	+3	# UNTIL IT LIES BETWEEN .5 AND 1.
// PORT: Fixed ROM slots 21614.
    21614, 224,
// PORT: SOURCE CSM_GEOMETRY.agc:271
//			NEARLY1		# THE LOG OF THIS PART IS FOUND AND THE
// PORT: Fixed ROM slots 21615.
    21615, 6420,
// PORT: SOURCE CSM_GEOMETRY.agc:272
//		EXIT			# LOG OF THE SHIFTED PART IS COMPUTED
// PORT: Fixed ROM slots 21616.
    21616, 65532
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21617–21617.
function agcAotUnit1224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE CSM_GEOMETRY.agc:273
//
// PORT: SOURCE CSM_GEOMETRY.agc:274
//		TC	POLY		# AND ADDED IN.  SHIFT COUNT STORED
// PORT: Fixed ROM slots 21617.
    if slot <> 21617 or instruction <> 3705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1224] to agcAotUnit1224@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CSM_GEOMETRY.agc:275
//
// PORT: SOURCE CSM_GEOMETRY.agc:276
//		DEC	2		# (N-1, SUPPLIED BY SMERZH)
// PORT: Fixed ROM slots 21618.
    21618, 4,
// PORT: SOURCE CSM_GEOMETRY.agc:277
//		2DEC	0		# IN MPAC +3.
// PORT: Fixed ROM slots 21619 21620.
    21619, 0, 21620, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:278
//		2DEC	.031335467
// PORT: Fixed ROM slots 21621 21622.
    21621, 1026, 21622, 13116,
// PORT: SOURCE CSM_GEOMETRY.agc:279
//		2DEC	.0130145859
// PORT: Fixed ROM slots 21623 21624.
    21623, 426, 21624, 7568,
// PORT: SOURCE CSM_GEOMETRY.agc:280
//		2DEC	.0215738898
// PORT: Fixed ROM slots 21625 21626.
    21625, 706, 21626, 15290
)).

// PORT: Physical bank 23. Shared continuation entries, slots 21627–21639.
function agcAotUnit1225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21632 {
        if slot <= 21629 {
            if slot <= 21627 {
// PORT: SOURCE CSM_GEOMETRY.agc:281
//
// PORT: SOURCE CSM_GEOMETRY.agc:282
//		CAF	ZERO
// PORT: Fixed ROM slots 21627.
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
// PORT: SOURCE CSM_GEOMETRY.agc:283
//		TS	MPAC	+2
// PORT: Fixed ROM slots 21628.
                    if slot <> 21628 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE CSM_GEOMETRY.agc:284
//		EXTEND
// PORT: Fixed ROM slots 21629.
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
// PORT: SOURCE CSM_GEOMETRY.agc:285
//		DCA	CLOG2/32
// PORT: Fixed ROM slots 21630.
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
// PORT: SOURCE CSM_GEOMETRY.agc:286
//		DXCH	MPAC
// PORT: Fixed ROM slots 21631.
                    if slot <> 21631 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE CSM_GEOMETRY.agc:287
//		DXCH	MPAC	+3
// PORT: Fixed ROM slots 21632.
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
// PORT: SOURCE CSM_GEOMETRY.agc:288
//		COM			# LOAD POSITIVE SHIFT COUNT IN A.
// PORT: Fixed ROM slots 21633.
                if slot <> 21633 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21634 {
// PORT: SOURCE CSM_GEOMETRY.agc:289
//		TC	SHORTMP		# MULTIPLY BY SHIFT COUNT.
// PORT: Fixed ROM slots 21634.
                    if slot <> 21634 or instruction <> 3758 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3758, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE CSM_GEOMETRY.agc:290
//
// PORT: SOURCE CSM_GEOMETRY.agc:291
//		DXCH	MPAC	+1
// PORT: Fixed ROM slots 21635.
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
// PORT: SOURCE CSM_GEOMETRY.agc:292
//		DXCH	MPAC
// PORT: Fixed ROM slots 21636.
                    if slot <> 21636 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE CSM_GEOMETRY.agc:293
//		DXCH	MPAC	+3
// PORT: Fixed ROM slots 21637.
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
// PORT: SOURCE CSM_GEOMETRY.agc:294
//		DAS	MPAC
// PORT: Fixed ROM slots 21638.
                    if slot <> 21638 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE CSM_GEOMETRY.agc:295
//		TC	INTPRET		# RESULT IN MPAC, MPAC +1
// PORT: Fixed ROM slots 21639.
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
// PORT: SOURCE CSM_GEOMETRY.agc:296
//
// PORT: SOURCE CSM_GEOMETRY.agc:297
//		RVQ
// PORT: Fixed ROM slots 21640.
    21640, 65308,
// PORT: SOURCE CSM_GEOMETRY.agc:298
//
// PORT: SOURCE CSM_GEOMETRY.agc:299
//NEARLY1		2DEC	.999999999
// PORT: Fixed ROM slots 21641 21642.
    21641, 32766, 21642, 32766,
// PORT: SOURCE CSM_GEOMETRY.agc:300
//
// PORT: SOURCE CSM_GEOMETRY.agc:301
//# Page 292
// PORT: SOURCE CSM_GEOMETRY.agc:302
//CLOG2/32	2DEC	.0216608494
// PORT: Fixed ROM slots 21643 21644.
    21643, 708, 21644, 29208,
// PORT: SOURCE CSM_GEOMETRY.agc:303
//
// PORT: SOURCE CSM_GEOMETRY.agc:304
//# Page 293
// PORT: SOURCE CSM_GEOMETRY.agc:305
//# SUBROUTINE NAME: 	EARTH ROTATOR	(EARROT1 OR EARROT2)		DATE:  		15 FEB 67
// PORT: SOURCE CSM_GEOMETRY.agc:306
//# MOD NO:  N +1								LOG SECTION:  	POWERED FLIGHT SUBROS
// PORT: SOURCE CSM_GEOMETRY.agc:307
//# MOD BY:  ENTRY GROUP (BAIRNSFATHER)
// PORT: SOURCE CSM_GEOMETRY.agc:308
//# FUNCTIONAL DESCRIPTION: 	THIS ROUTINE PROJECTS THE INITIAL EARTH TARGET VECTOR RTINIT AHEAD THROUGH
// PORT: SOURCE CSM_GEOMETRY.agc:309
//#	THE ESTIMATED TIME OF FLIGHT.  INITIAL CALL RESOLVES THE INITIAL TARGET VECTOR RTINIT INTO EASTERLY
// PORT: SOURCE CSM_GEOMETRY.agc:310
//#	AND NORMAL COMPONENTS RTEAST AND RTNORM .  INITIAL AND SUBSEQUENT CALLS ROTATE THIS VECTOR
// PORT: SOURCE CSM_GEOMETRY.agc:311
//#	ABOUT THE (FULL) UNIT POLAR AXIS UNITW THROUGH THE ANGLE WIE DTEAROT TO OBTAIN THE ROTATED
// PORT: SOURCE CSM_GEOMETRY.agc:312
//#	TARGET VECTOR RT .  ALL VECTORS EXCEPT UNITW ARE HALF UNIT.
// PORT: SOURCE CSM_GEOMETRY.agc:313
//#	THE EQUATIONS ARE
// PORT: SOURCE CSM_GEOMETRY.agc:314
//#		-    -        -                      -
// PORT: SOURCE CSM_GEOMETRY.agc:315
//#		RT = RTINIT + RTNORM (COS(WT) - 1) + RTEAST SIN(WT)
// PORT: SOURCE CSM_GEOMETRY.agc:316
//#	WHERE	WT = WIE DTEAROT
// PORT: SOURCE CSM_GEOMETRY.agc:317
//#		RTINIT = INITIAL TARGET VECTOR
// PORT: SOURCE CSM_GEOMETRY.agc:318
//#		-        -       -
// PORT: SOURCE CSM_GEOMETRY.agc:319
//#		RTEAST = UNITW*RTINIT
// PORT: SOURCE CSM_GEOMETRY.agc:320
//#		-        -        -
// PORT: SOURCE CSM_GEOMETRY.agc:321
//#		RTNORM = RTEAST*UNITW
// PORT: SOURCE CSM_GEOMETRY.agc:322
//#
// PORT: SOURCE CSM_GEOMETRY.agc:323
//#	FOR CONTINUOUS UPDATING, ONLY ONE ENTRY TO EARROT1 IS REQUIRED, WITH SUBSEQUENT ENTRIES AT EARROT2.
// PORT: SOURCE CSM_GEOMETRY.agc:324
//# CALLING SEQUENCE:	FIRST CALL			SUBSEQUENT CALL
// PORT: SOURCE CSM_GEOMETRY.agc:325
//#			STCALL	DTEAROT			STCALL	DTEAROT
// PORT: SOURCE CSM_GEOMETRY.agc:326
//#				EARROT1				EARROT2
// PORT: SOURCE CSM_GEOMETRY.agc:327
//#			C(MPAC) UNSPECIFIED		C(MPAC) = DTEAROT
// PORT: SOURCE CSM_GEOMETRY.agc:328
//#	PUSHLOC = PDL+0, ARBITRARY.  6 LOCATIONS USED.
// PORT: SOURCE CSM_GEOMETRY.agc:329
//#
// PORT: SOURCE CSM_GEOMETRY.agc:330
//# SUBROUTINES USED:  NONE
// PORT: SOURCE CSM_GEOMETRY.agc:331
//# NORMAL EXIT MODES:  RVQ
// PORT: SOURCE CSM_GEOMETRY.agc:332
//# ALARMS:  NONE
// PORT: SOURCE CSM_GEOMETRY.agc:333
//# OUTPUT:  RTEAST (-1)		.5 UNIT VECTOR EAST, COMPNT OF RTINIT	LEFT BY FIRST CALL
// PORT: SOURCE CSM_GEOMETRY.agc:334
//#	   RTNORM (-1)		.5 UNIT VECTOR NORML, COMPNT OF RTINIT	LEFT BY FIRST CALL
// PORT: SOURCE CSM_GEOMETRY.agc:335
//#	   RT	  (-1)		.5 UNIT TARGET VECTOR, ROTATED		LEFT BY ALL CALLS
// PORT: SOURCE CSM_GEOMETRY.agc:336
//#	   DTEAROT  (-28) CS	MAY BE CHANGED BY EARROT2, IF OVER 1 DAY
// PORT: SOURCE CSM_GEOMETRY.agc:337
//# ERASABLE INITIALIZATION REQUIRED:
// PORT: SOURCE CSM_GEOMETRY.agc:338
//#	   UNITW  (0)		UNIT POLAR VECTOR			PAD LOADED
// PORT: SOURCE CSM_GEOMETRY.agc:339
//#	   RTINIT (-1)		.5 UNIT INITIAL TARGET VECTOR		LEFT BY ENTRY
// PORT: SOURCE CSM_GEOMETRY.agc:340
//#	   DTEAROT  (-28) CS	TIME OF FLIGHT				LEFT BY CALLER
// PORT: SOURCE CSM_GEOMETRY.agc:341
//# DEBRIS:  QPRET, PDL+0 ... PDL+5
// PORT: SOURCE CSM_GEOMETRY.agc:342
//# Page 294
// PORT: SOURCE CSM_GEOMETRY.agc:343
//		EBANK=	RTINIT
// PORT: SOURCE CSM_GEOMETRY.agc:344
//
// PORT: SOURCE CSM_GEOMETRY.agc:345
//EARROT1		VLOAD	VXV
// PORT: Fixed ROM slots 21645.
    21645, 40442,
// PORT: SOURCE CSM_GEOMETRY.agc:346
//			UNITW		# FULL UNIT VECTOR
// PORT: Fixed ROM slots 21646.
    21646, 1944,
// PORT: SOURCE CSM_GEOMETRY.agc:347
//			RTINIT		# .5 UNIT
// PORT: Fixed ROM slots 21647.
    21647, 3668,
// PORT: SOURCE CSM_GEOMETRY.agc:348
//		STORE	RTEAST		# .5 UNIT
// PORT: Fixed ROM slots 21648.
    21648, 3680,
// PORT: SOURCE CSM_GEOMETRY.agc:349
//
// PORT: SOURCE CSM_GEOMETRY.agc:350
//		VXV
// PORT: Fixed ROM slots 21649.
    21649, 65338,
// PORT: SOURCE CSM_GEOMETRY.agc:351
//			UNITW		# FULL UNIT
// PORT: Fixed ROM slots 21650.
    21650, 1944,
// PORT: SOURCE CSM_GEOMETRY.agc:352
//		STODL	RTNORM		# .5 UNIT
// PORT: Fixed ROM slots 21651.
    21651, 15980,
// PORT: SOURCE CSM_GEOMETRY.agc:353
//			DTEAROT		# (-28) CS
// PORT: Fixed ROM slots 21652.
    21652, 3852,
// PORT: SOURCE CSM_GEOMETRY.agc:354
//
// PORT: SOURCE CSM_GEOMETRY.agc:355
//EARROT2		BOVB	DDV
// PORT: Fixed ROM slots 21653.
    21653, 47368,
// PORT: SOURCE CSM_GEOMETRY.agc:356
//			TCDANZIG	# RESET OVFIND, IF ON
// PORT: Fixed ROM slots 21654.
    21654, 48596,
// PORT: SOURCE CSM_GEOMETRY.agc:357
//			1/WIE
// PORT: Fixed ROM slots 21655.
    21655, 6492,
// PORT: SOURCE CSM_GEOMETRY.agc:358
//		BOV	PUSH
// PORT: Fixed ROM slots 21656.
    21656, 34304,
// PORT: SOURCE CSM_GEOMETRY.agc:359
//			OVERADAY
// PORT: Fixed ROM slots 21657.
    21657, 39242,
// PORT: SOURCE CSM_GEOMETRY.agc:360
//		COS	DSU
// PORT: Fixed ROM slots 21658.
    21658, 38348,
// PORT: SOURCE CSM_GEOMETRY.agc:361
//			HIDPHALF
// PORT: Fixed ROM slots 21659.
    21659, 13750,
// PORT: SOURCE CSM_GEOMETRY.agc:362
//		VXSC	PDDL		# XCH W PUSH LIST
// PORT: Fixed ROM slots 21660.
    21660, 54754,
// PORT: SOURCE CSM_GEOMETRY.agc:363
//			RTNORM		# .5 UNIT
// PORT: Fixed ROM slots 21661.
    21661, 3692,
// PORT: SOURCE CSM_GEOMETRY.agc:364
//		SIN	VXSC
// PORT: Fixed ROM slots 21662.
    21662, 61916,
// PORT: SOURCE CSM_GEOMETRY.agc:365
//			RTEAST		# .5 UNIT
// PORT: Fixed ROM slots 21663.
    21663, 3680,
// PORT: SOURCE CSM_GEOMETRY.agc:366
//		VAD	VSL1
// PORT: Fixed ROM slots 21664.
    21664, 64090,
// PORT: SOURCE CSM_GEOMETRY.agc:367
//		VAD	UNIT		# INSURE THAT RT IS 'UNIT'.
// PORT: Fixed ROM slots 21665.
    21665, 44634,
// PORT: SOURCE CSM_GEOMETRY.agc:368
//			RTINIT		# .5 UNIT
// PORT: Fixed ROM slots 21666.
    21666, 3668,
// PORT: SOURCE CSM_GEOMETRY.agc:369
//		STORE	RT		# .5 UNIT TARGET VECTOR
// PORT: Fixed ROM slots 21667.
    21667, 3704,
// PORT: SOURCE CSM_GEOMETRY.agc:370
//
// PORT: SOURCE CSM_GEOMETRY.agc:371
//		RVQ
// PORT: Fixed ROM slots 21668.
    21668, 65308,
// PORT: SOURCE CSM_GEOMETRY.agc:372
//
// PORT: SOURCE CSM_GEOMETRY.agc:373
//OVERADAY	DLOAD	SIGN
// PORT: Fixed ROM slots 21669.
    21669, 62922,
// PORT: SOURCE CSM_GEOMETRY.agc:374
//			1/WIE
// PORT: Fixed ROM slots 21670.
    21670, 6492,
// PORT: SOURCE CSM_GEOMETRY.agc:375
//			DTEAROT
// PORT: Fixed ROM slots 21671.
    21671, 3852,
// PORT: SOURCE CSM_GEOMETRY.agc:376
//		BDSU
// PORT: Fixed ROM slots 21672.
    21672, 65314,
// PORT: SOURCE CSM_GEOMETRY.agc:377
//			DTEAROT
// PORT: Fixed ROM slots 21673.
    21673, 3852,
// PORT: SOURCE CSM_GEOMETRY.agc:378
//		STORE	DTEAROT
// PORT: Fixed ROM slots 21674.
    21674, 3852,
// PORT: SOURCE CSM_GEOMETRY.agc:379
//
// PORT: SOURCE CSM_GEOMETRY.agc:380
//		GOTO
// PORT: Fixed ROM slots 21675.
    21675, 65360,
// PORT: SOURCE CSM_GEOMETRY.agc:381
//			EARROT2
// PORT: Fixed ROM slots 21676.
    21676, 39210,
// PORT: SOURCE CSM_GEOMETRY.agc:382
//
// PORT: SOURCE CSM_GEOMETRY.agc:383
//#WIE		2DEC	.1901487997
// PORT: SOURCE CSM_GEOMETRY.agc:384
//1/WIE		2DEC	8616410
// PORT: Fixed ROM slots 21677 21678.
    21677, 1050, 21678, 29620,
// PORT: SOURCE CSM_GEOMETRY.agc:385
//NB2NB1		2DEC	+.8431756920 B-1
// PORT: Fixed ROM slots 21679 21680.
    21679, 13814, 21680, 9676,
// PORT: SOURCE CSM_GEOMETRY.agc:386
//		2DEC	0
// PORT: Fixed ROM slots 21681 21682.
    21681, 0, 21682, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:387
//		2DEC	-.5376381241 B-1
// PORT: Fixed ROM slots 21683 21684.
    21683, 56726, 21684, 54670,
// PORT: SOURCE CSM_GEOMETRY.agc:388
//# Page 295
// PORT: SOURCE CSM_GEOMETRY.agc:389
//ZERINFLT	2DEC	0
// PORT: Fixed ROM slots 21685 21686.
    21685, 0, 21686, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:390
//HALFNFLT	2DEC	.5
// PORT: Fixed ROM slots 21687 21688.
    21687, 16384, 21688, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:391
//		2DEC	0
// PORT: Fixed ROM slots 21689 21690.
    21689, 0, 21690, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:392
//		2DEC	+.5376381241 B-1
// PORT: Fixed ROM slots 21691 21692.
    21691, 8808, 21692, 10864,
// PORT: SOURCE CSM_GEOMETRY.agc:393
//		2DEC	0
// PORT: Fixed ROM slots 21693 21694.
    21693, 0, 21694, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:394
//		2DEC	+.8431756920 B-1
// PORT: Fixed ROM slots 21695 21696.
    21695, 13814, 21696, 9676,
// PORT: SOURCE CSM_GEOMETRY.agc:395
//NB1NB2		2DEC	+.8431756920 B-1
// PORT: Fixed ROM slots 21697 21698.
    21697, 13814, 21698, 9676,
// PORT: SOURCE CSM_GEOMETRY.agc:396
//		2DEC	0
// PORT: Fixed ROM slots 21699 21700.
    21699, 0, 21700, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:397
//		2DEC	+.5376381241 B-1
// PORT: Fixed ROM slots 21701 21702.
    21701, 8808, 21702, 10864,
// PORT: SOURCE CSM_GEOMETRY.agc:398
//		2DEC	0
// PORT: Fixed ROM slots 21703 21704.
    21703, 0, 21704, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:399
//		2DEC	.5
// PORT: Fixed ROM slots 21705 21706.
    21705, 16384, 21706, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:400
//		2DEC	0
// PORT: Fixed ROM slots 21707 21708.
    21707, 0, 21708, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:401
//		2DEC	-.5376381241 B-1
// PORT: Fixed ROM slots 21709 21710.
    21709, 56726, 21710, 54670,
// PORT: SOURCE CSM_GEOMETRY.agc:402
//		2DEC	0
// PORT: Fixed ROM slots 21711 21712.
    21711, 0, 21712, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:403
//		2DEC	+.8431756920 B-1
// PORT: Fixed ROM slots 21713 21714.
    21713, 13814, 21714, 9676,
// PORT: SOURCE CSM_GEOMETRY.agc:404
//
// PORT: SOURCE CSM_GEOMETRY.agc:405
//# Page 296
// PORT: SOURCE CSM_GEOMETRY.agc:406
//10DEGS-		DEC	3600
// PORT: Fixed ROM slots 21715.
    21715, 7200,
// PORT: SOURCE CSM_GEOMETRY.agc:407
//
// PORT: SOURCE CSM_GEOMETRY.agc:408
//270DEG		OCT	60000		# SHAFT 270 DEGREES	2S COMP.
// PORT: Fixed ROM slots 21716.
    21716, 49152,
// PORT: SOURCE CSM_GEOMETRY.agc:409
//		OCT	00000
// PORT: Fixed ROM slots 21717.
    21717, 0,
// PORT: SOURCE CSM_GEOMETRY.agc:410
//
// PORT: SOURCE CSM_GEOMETRY.agc:411
//20DEGS-		DEC	-07199
// PORT: Fixed ROM slots 21718.
    21718, 51136,
// PORT: SOURCE CSM_GEOMETRY.agc:412
//		DEC	-00000
// PORT: Fixed ROM slots 21719.
    21719, 65534,
// PORT: SOURCE CSM_GEOMETRY.agc:413
//
// PORT: SOURCE CSM_GEOMETRY.agc:414
//20DEG-		DEC	03600
// PORT: Fixed ROM slots 21720.
    21720, 7200,
// PORT: SOURCE CSM_GEOMETRY.agc:415
//		DEC	00000
// PORT: Fixed ROM slots 21721.
    21721, 0
)).

