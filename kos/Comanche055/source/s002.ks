// PORT: Original source unit ANGLFIND.agc.
// PORT: Physical bank 22. Shared continuation entries, slots 20480–20480.
function agcAotUnit1191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ANGLFIND.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE ANGLFIND.agc:2
//# Filename:	ANGLFIND.agc
// PORT: SOURCE ANGLFIND.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE ANGLFIND.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE ANGLFIND.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE ANGLFIND.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE ANGLFIND.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE ANGLFIND.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE ANGLFIND.agc:9
//# Pages:	399-411
// PORT: SOURCE ANGLFIND.agc:10
//# Mod history:	2009-05-09 RSB	Adapted from the Colossus249/ file
// PORT: SOURCE ANGLFIND.agc:11
//#				of the same name, using Comanche055 page
// PORT: SOURCE ANGLFIND.agc:12
//#				images.
// PORT: SOURCE ANGLFIND.agc:13
//#		2009-05-22 RSB	In NOGOM2, TC ZEROEROR corrected to
// PORT: SOURCE ANGLFIND.agc:14
//#				CADR ZEROEROR.
// PORT: SOURCE ANGLFIND.agc:15
//#
// PORT: SOURCE ANGLFIND.agc:16
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE ANGLFIND.agc:17
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE ANGLFIND.agc:18
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE ANGLFIND.agc:19
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE ANGLFIND.agc:20
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE ANGLFIND.agc:21
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE ANGLFIND.agc:22
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE ANGLFIND.agc:23
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE ANGLFIND.agc:24
//#
// PORT: SOURCE ANGLFIND.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE ANGLFIND.agc:26
//#
// PORT: SOURCE ANGLFIND.agc:27
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE ANGLFIND.agc:28
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE ANGLFIND.agc:29
//#
// PORT: SOURCE ANGLFIND.agc:30
//#	This AGC program shall also be referred to as
// PORT: SOURCE ANGLFIND.agc:31
//#			Colossus 2A
// PORT: SOURCE ANGLFIND.agc:32
//
// PORT: SOURCE ANGLFIND.agc:33
//# Page 399
// PORT: SOURCE ANGLFIND.agc:34
//		BANK	15
// PORT: SOURCE ANGLFIND.agc:35
//		SETLOC	KALCMON1
// PORT: SOURCE ANGLFIND.agc:36
//		BANK
// PORT: SOURCE ANGLFIND.agc:37
//
// PORT: SOURCE ANGLFIND.agc:38
//		EBANK=	BCDU
// PORT: SOURCE ANGLFIND.agc:39
//
// PORT: SOURCE ANGLFIND.agc:40
//		COUNT	22/KALC
// PORT: SOURCE ANGLFIND.agc:41
//
// PORT: SOURCE ANGLFIND.agc:42
//KALCMAN3	TC	INTPRET
// PORT: Fixed ROM slots 20480.
    if slot <> 20480 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1191] to agcAotUnit1191@.

agcAotInstallSourceRope(list(
// PORT: SOURCE ANGLFIND.agc:43
//		RTB
// PORT: Fixed ROM slots 20481.
    20481, 65336,
// PORT: SOURCE ANGLFIND.agc:44
//			READCDUK	# PICK UP CURRENT CDU ANGLES
// PORT: Fixed ROM slots 20482.
    20482, 37372,
// PORT: SOURCE ANGLFIND.agc:45
//		STORE	BCDU		# STORE THE INITIAL S/C ANGLES
// PORT: Fixed ROM slots 20483.
    20483, 3428,
// PORT: SOURCE ANGLFIND.agc:46
//		AXC,2	TLOAD		# COMPUTE THE TRANSFORMATION FROM
// PORT: Fixed ROM slots 20484.
    20484, 59880,
// PORT: SOURCE ANGLFIND.agc:47
//			MIS		# INITIAL S/C AXES TO STABLE MEMBER AXES
// PORT: Fixed ROM slots 20485.
    20485, 3488,
// PORT: SOURCE ANGLFIND.agc:48
//			BCDU		# (MIS)
// PORT: Fixed ROM slots 20486.
    20486, 3428,
// PORT: SOURCE ANGLFIND.agc:49
//		CALL
// PORT: Fixed ROM slots 20487.
    20487, 65320,
// PORT: SOURCE ANGLFIND.agc:50
//			CDUTODCM
// PORT: Fixed ROM slots 20488.
    20488, 37386,
// PORT: SOURCE ANGLFIND.agc:51
//		AXC,2	TLOAD		# COMPUTE THE TRANSFORMATION FROM
// PORT: Fixed ROM slots 20489.
    20489, 59880,
// PORT: SOURCE ANGLFIND.agc:52
//			MFS		# FINAL S/C AXES TO STABLE MEMBER AXES
// PORT: Fixed ROM slots 20490.
    20490, 3626,
// PORT: SOURCE ANGLFIND.agc:53
//			CPHI		# (MFS)
// PORT: Fixed ROM slots 20491.
    20491, 1244,
// PORT: SOURCE ANGLFIND.agc:54
//		CALL
// PORT: Fixed ROM slots 20492.
    20492, 65320,
// PORT: SOURCE ANGLFIND.agc:55
//			CDUTODCM
// PORT: Fixed ROM slots 20493.
    20493, 37386,
// PORT: SOURCE ANGLFIND.agc:56
//SECAD		AXC,1	CALL		# MIS AND MFS ARRAYS CALCULATED		$2
// PORT: Fixed ROM slots 20494.
    20494, 38112,
// PORT: SOURCE ANGLFIND.agc:57
//			MIS
// PORT: Fixed ROM slots 20495.
    20495, 3488,
// PORT: SOURCE ANGLFIND.agc:58
//			TRANSPOS
// PORT: Fixed ROM slots 20496.
    20496, 37304,
// PORT: SOURCE ANGLFIND.agc:59
//		VLOAD
// PORT: Fixed ROM slots 20497.
    20497, 65530,
// PORT: SOURCE ANGLFIND.agc:60
//		STADR
// PORT: Fixed ROM slots 20498.
    20498, 65324,
// PORT: SOURCE ANGLFIND.agc:61
//		STOVL	TMIS +12D
// PORT: Fixed ROM slots 20499.
    20499, 41592,
// PORT: SOURCE ANGLFIND.agc:62
//		STADR
// PORT: Fixed ROM slots 20500.
    20500, 65324,
// PORT: SOURCE ANGLFIND.agc:63
//		STOVL	TMIS +6
// PORT: Fixed ROM slots 20501.
    20501, 41604,
// PORT: SOURCE ANGLFIND.agc:64
//		STADR
// PORT: Fixed ROM slots 20502.
    20502, 65324,
// PORT: SOURCE ANGLFIND.agc:65
//		STORE	TMIS		# TMIS = TRANSPOSE(MIS) SCALED BY 2
// PORT: Fixed ROM slots 20503.
    20503, 62096,
// PORT: SOURCE ANGLFIND.agc:66
//		AXC,1	AXC,2
// PORT: Fixed ROM slots 20504.
    20504, 62688,
// PORT: SOURCE ANGLFIND.agc:67
//			TMIS
// PORT: Fixed ROM slots 20505.
    20505, 3436,
// PORT: SOURCE ANGLFIND.agc:68
//			MFS
// PORT: Fixed ROM slots 20506.
    20506, 3626,
// PORT: SOURCE ANGLFIND.agc:69
//		CALL
// PORT: Fixed ROM slots 20507.
    20507, 65320,
// PORT: SOURCE ANGLFIND.agc:70
//			MXM3
// PORT: Fixed ROM slots 20508.
    20508, 37256,
// PORT: SOURCE ANGLFIND.agc:71
//		VLOAD	STADR
// PORT: Fixed ROM slots 20509.
    20509, 38650,
// PORT: SOURCE ANGLFIND.agc:72
//		STOVL	MFI +12D
// PORT: Fixed ROM slots 20510.
    20510, 41402,
// PORT: SOURCE ANGLFIND.agc:73
//		STADR
// PORT: Fixed ROM slots 20511.
    20511, 65324,
// PORT: SOURCE ANGLFIND.agc:74
//		STOVL	MFI +6
// PORT: Fixed ROM slots 20512.
    20512, 41414,
// PORT: SOURCE ANGLFIND.agc:75
//		STADR
// PORT: Fixed ROM slots 20513.
    20513, 65324,
// PORT: SOURCE ANGLFIND.agc:76
//		STORE	MFI		# MFI = TMIS MFS (SCALED BY 4)
// PORT: Fixed ROM slots 20514.
    20514, 61906,
// PORT: SOURCE ANGLFIND.agc:77
//		SETPD	CALL		# TRANSPOSE MFI IN PD LIST
// PORT: Fixed ROM slots 20515.
    20515, 37890,
// PORT: SOURCE ANGLFIND.agc:78
//			18D
// PORT: Fixed ROM slots 20516.
    20516, 38,
// PORT: SOURCE ANGLFIND.agc:79
//			TRNSPSPD
// PORT: Fixed ROM slots 20517.
    20517, 37318,
// PORT: SOURCE ANGLFIND.agc:80
//		VLOAD	STADR
// PORT: Fixed ROM slots 20518.
    20518, 38650,
// PORT: SOURCE ANGLFIND.agc:81
//		STOVL	TMFI +12D
// PORT: Fixed ROM slots 20519.
    20519, 41592,
// PORT: SOURCE ANGLFIND.agc:82
//		STADR
// PORT: Fixed ROM slots 20520.
    20520, 65324,
// PORT: SOURCE ANGLFIND.agc:83
//		STOVL	TMFI +6
// PORT: Fixed ROM slots 20521.
    20521, 41604,
// PORT: SOURCE ANGLFIND.agc:84
//# Page 400
// PORT: SOURCE ANGLFIND.agc:85
//		STADR
// PORT: Fixed ROM slots 20522.
    20522, 65324,
// PORT: SOURCE ANGLFIND.agc:86
//		STORE	TMFI		# TMFI = TRANSPOSE (MFI)  SCALED BY 4
// PORT: Fixed ROM slots 20523.
    20523, 62096,
// PORT: SOURCE ANGLFIND.agc:87
//
// PORT: SOURCE ANGLFIND.agc:88
//# CALCULATE COFSKEW AND MFISYM
// PORT: SOURCE ANGLFIND.agc:89
//
// PORT: SOURCE ANGLFIND.agc:90
//		DLOAD	DSU
// PORT: Fixed ROM slots 20524.
    20524, 38346,
// PORT: SOURCE ANGLFIND.agc:91
//			TMFI +2
// PORT: Fixed ROM slots 20525.
    20525, 3442,
// PORT: SOURCE ANGLFIND.agc:92
//			MFI +2
// PORT: Fixed ROM slots 20526.
    20526, 3632,
// PORT: SOURCE ANGLFIND.agc:93
//		PDDL	DSU		# CALCULATE COF SCALED BY 2/SIN(AM)
// PORT: Fixed ROM slots 20527.
    20527, 38314,
// PORT: SOURCE ANGLFIND.agc:94
//			MFI +4
// PORT: Fixed ROM slots 20528.
    20528, 3636,
// PORT: SOURCE ANGLFIND.agc:95
//			TMFI +4
// PORT: Fixed ROM slots 20529.
    20529, 3446,
// PORT: SOURCE ANGLFIND.agc:96
//		PDDL	DSU
// PORT: Fixed ROM slots 20530.
    20530, 38314,
// PORT: SOURCE ANGLFIND.agc:97
//			TMFI +10D
// PORT: Fixed ROM slots 20531.
    20531, 3458,
// PORT: SOURCE ANGLFIND.agc:98
//			MFI +10D
// PORT: Fixed ROM slots 20532.
    20532, 3648,
// PORT: SOURCE ANGLFIND.agc:99
//		VDEF
// PORT: Fixed ROM slots 20533.
    20533, 65388,
// PORT: SOURCE ANGLFIND.agc:100
//		STORE	COFSKEW		# EQUALS MFISKEW
// PORT: Fixed ROM slots 20534.
    20534, 3474,
// PORT: SOURCE ANGLFIND.agc:101
//
// PORT: SOURCE ANGLFIND.agc:102
//# CALCULATE AM AND PROCEED ACCORDING TO ITS MAGNITUDE
// PORT: SOURCE ANGLFIND.agc:103
//
// PORT: SOURCE ANGLFIND.agc:104
//		DLOAD	DAD
// PORT: Fixed ROM slots 20535.
    20535, 36298,
// PORT: SOURCE ANGLFIND.agc:105
//			MFI
// PORT: Fixed ROM slots 20536.
    20536, 3628,
// PORT: SOURCE ANGLFIND.agc:106
//			MFI +16D
// PORT: Fixed ROM slots 20537.
    20537, 3660,
// PORT: SOURCE ANGLFIND.agc:107
//		DSU	DAD
// PORT: Fixed ROM slots 20538.
    20538, 36138,
// PORT: SOURCE ANGLFIND.agc:108
//			DP1/4TH
// PORT: Fixed ROM slots 20539.
    20539, 13738,
// PORT: SOURCE ANGLFIND.agc:109
//			MFI +8D
// PORT: Fixed ROM slots 20540.
    20540, 3644,
// PORT: SOURCE ANGLFIND.agc:110
//		STORE	CAM		# CAM = (MFI0+MFI4+MFI8-1)/2 HALF SCALE
// PORT: Fixed ROM slots 20541.
    20541, 3486,
// PORT: SOURCE ANGLFIND.agc:111
//		ARCCOS
// PORT: Fixed ROM slots 20542.
    20542, 65452,
// PORT: SOURCE ANGLFIND.agc:112
//		STORE	AM		# AM=ARCCOS(CAM)  (AM SCALED BY 2)
// PORT: Fixed ROM slots 20543.
    20543, 3562,
// PORT: SOURCE ANGLFIND.agc:113
//		DSU	BPL
// PORT: Fixed ROM slots 20544.
    20544, 42026,
// PORT: SOURCE ANGLFIND.agc:114
//			MINANG
// PORT: Fixed ROM slots 20545.
    20545, 4590,
// PORT: SOURCE ANGLFIND.agc:115
//			CHECKMAX
// PORT: Fixed ROM slots 20546.
    20546, 37010,
// PORT: SOURCE ANGLFIND.agc:116
//		EXIT			# MANEUVER LESS THAN 0.25 DEG
// PORT: Fixed ROM slots 20547.
    20547, 65532
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20548–20552.
function agcAotUnit1192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20549 {
        if slot <= 20548 {
// PORT: SOURCE ANGLFIND.agc:117
//		INHINT			# GO DIRECTLY INTO ATTITUDE HOLD
// PORT: Fixed ROM slots 20548.
            if slot <> 20548 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ANGLFIND.agc:118
//		CS	ONE		# ABOUT COMMANDED ANGLES
// PORT: Fixed ROM slots 20549.
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
// PORT: SOURCE ANGLFIND.agc:119
//		TS	HOLDFLAG	# NOGO WILL STOP ANY RATE AND SET UP FOR A
// PORT: Fixed ROM slots 20550.
            if slot <> 20550 or instruction <> 23258 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23258, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20551 {
// PORT: SOURCE ANGLFIND.agc:120
//		TC	LOADCDUD	# GOOD RETURN
// PORT: Fixed ROM slots 20551.
                if slot <> 20551 or instruction <> 1634 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1634, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ANGLFIND.agc:121
//		TCF	NOGO
// PORT: Fixed ROM slots 20552.
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
// PORT: SOURCE ANGLFIND.agc:122
//
// PORT: SOURCE ANGLFIND.agc:123
//CHECKMAX	DLOAD	DSU
// PORT: Fixed ROM slots 20553.
    20553, 38346,
// PORT: SOURCE ANGLFIND.agc:124
//			AM
// PORT: Fixed ROM slots 20554.
    20554, 3562,
// PORT: SOURCE ANGLFIND.agc:125
//			MAXANG
// PORT: Fixed ROM slots 20555.
    20555, 4592,
// PORT: SOURCE ANGLFIND.agc:126
//		BPL	VLOAD
// PORT: Fixed ROM slots 20556.
    20556, 64840,
// PORT: SOURCE ANGLFIND.agc:127
//			ALTCALC		# UNIT
// PORT: Fixed ROM slots 20557.
    20557, 37030,
// PORT: SOURCE ANGLFIND.agc:128
//			COFSKEW		# COFSKEW
// PORT: Fixed ROM slots 20558.
    20558, 3474,
// PORT: SOURCE ANGLFIND.agc:129
//		UNIT
// PORT: Fixed ROM slots 20559.
    20559, 65372,
// PORT: SOURCE ANGLFIND.agc:130
//		STORE	COF		# COF IS THE MANEUVER AXIS
// PORT: Fixed ROM slots 20560.
    20560, 3526,
// PORT: SOURCE ANGLFIND.agc:131
//		GOTO			# SEE IF MANEUVER GOES THRU GIMBAL LOCK
// PORT: Fixed ROM slots 20561.
    20561, 65360,
// PORT: SOURCE ANGLFIND.agc:132
//			LOCSKIRT
// PORT: Fixed ROM slots 20562.
    20562, 37822,
// PORT: SOURCE ANGLFIND.agc:133
//ALTCALC		VLOAD	VAD		# IF AM GREATER THAN 170 DEGREES
// PORT: Fixed ROM slots 20563.
    20563, 44538,
// PORT: SOURCE ANGLFIND.agc:134
//			MFI
// PORT: Fixed ROM slots 20564.
    20564, 3628,
// PORT: SOURCE ANGLFIND.agc:135
//# Page 401
// PORT: SOURCE ANGLFIND.agc:136
//			TMFI
// PORT: Fixed ROM slots 20565.
    20565, 3438,
// PORT: SOURCE ANGLFIND.agc:137
//		VSR1
// PORT: Fixed ROM slots 20566.
    20566, 65508,
// PORT: SOURCE ANGLFIND.agc:138
//		STOVL	MFISYM
// PORT: Fixed ROM slots 20567.
    20567, 23918,
// PORT: SOURCE ANGLFIND.agc:139
//			MFI +6
// PORT: Fixed ROM slots 20568.
    20568, 3640,
// PORT: SOURCE ANGLFIND.agc:140
//		VAD	VSR1
// PORT: Fixed ROM slots 20569.
    20569, 62042,
// PORT: SOURCE ANGLFIND.agc:141
//			TMFI +6
// PORT: Fixed ROM slots 20570.
    20570, 3450,
// PORT: SOURCE ANGLFIND.agc:142
//		STOVL	MFISYM +6
// PORT: Fixed ROM slots 20571.
    20571, 23930,
// PORT: SOURCE ANGLFIND.agc:143
//			MFI +12D
// PORT: Fixed ROM slots 20572.
    20572, 3652,
// PORT: SOURCE ANGLFIND.agc:144
//		VAD	VSR1
// PORT: Fixed ROM slots 20573.
    20573, 62042,
// PORT: SOURCE ANGLFIND.agc:145
//			TMFI +12D
// PORT: Fixed ROM slots 20574.
    20574, 3462,
// PORT: SOURCE ANGLFIND.agc:146
//		STORE	MFISYM +12D	# MFISYM=(MFI+TMFI)/2	SCALED BY 4
// PORT: Fixed ROM slots 20575.
    20575, 3462,
// PORT: SOURCE ANGLFIND.agc:147
//
// PORT: SOURCE ANGLFIND.agc:148
//# CALCULATE COF
// PORT: SOURCE ANGLFIND.agc:149
//
// PORT: SOURCE ANGLFIND.agc:150
//		DLOAD	SR1
// PORT: Fixed ROM slots 20576.
    20576, 58058,
// PORT: SOURCE ANGLFIND.agc:151
//			CAM
// PORT: Fixed ROM slots 20577.
    20577, 3486,
// PORT: SOURCE ANGLFIND.agc:152
//		PDDL	DSU		# PD0 CAM		 	       $4
// PORT: Fixed ROM slots 20578.
    20578, 38314,
// PORT: SOURCE ANGLFIND.agc:153
//			DPHALF
// PORT: Fixed ROM slots 20579.
    20579, 13750,
// PORT: SOURCE ANGLFIND.agc:154
//			CAM
// PORT: Fixed ROM slots 20580.
    20580, 3486,
// PORT: SOURCE ANGLFIND.agc:155
//		BOVB	PDDL		# PD2 1 - CAM			       $2
// PORT: Fixed ROM slots 20581.
    20581, 54536,
// PORT: SOURCE ANGLFIND.agc:156
//			SIGNMPAC
// PORT: Fixed ROM slots 20582.
    20582, 38804,
// PORT: SOURCE ANGLFIND.agc:157
//			MFISYM +16D
// PORT: Fixed ROM slots 20583.
    20583, 3470,
// PORT: SOURCE ANGLFIND.agc:158
//		DSU	DDV
// PORT: Fixed ROM slots 20584.
    20584, 47402,
// PORT: SOURCE ANGLFIND.agc:159
//			0
// PORT: Fixed ROM slots 20585.
    20585, 2,
// PORT: SOURCE ANGLFIND.agc:160
//			2
// PORT: Fixed ROM slots 20586.
    20586, 6,
// PORT: SOURCE ANGLFIND.agc:161
//		SQRT	PDDL		# COFZ = SQRT(MFISYM8-CAM)/(1-CAM)
// PORT: Fixed ROM slots 20587.
    20587, 54764,
// PORT: SOURCE ANGLFIND.agc:162
//			MFISYM +8D	#			  	 $ ROOT 2
// PORT: Fixed ROM slots 20588.
    20588, 3454,
// PORT: SOURCE ANGLFIND.agc:163
//		DSU	DDV
// PORT: Fixed ROM slots 20589.
    20589, 47402,
// PORT: SOURCE ANGLFIND.agc:164
//			0
// PORT: Fixed ROM slots 20590.
    20590, 2,
// PORT: SOURCE ANGLFIND.agc:165
//			2
// PORT: Fixed ROM slots 20591.
    20591, 6,
// PORT: SOURCE ANGLFIND.agc:166
//		SQRT	PDDL		# COFY = SQRT(MFISYM4-CAM)/(1-CAM) $ROOT2
// PORT: Fixed ROM slots 20592.
    20592, 54764,
// PORT: SOURCE ANGLFIND.agc:167
//			MFISYM
// PORT: Fixed ROM slots 20593.
    20593, 3438,
// PORT: SOURCE ANGLFIND.agc:168
//		DSU	DDV
// PORT: Fixed ROM slots 20594.
    20594, 47402,
// PORT: SOURCE ANGLFIND.agc:169
//			0
// PORT: Fixed ROM slots 20595.
    20595, 2,
// PORT: SOURCE ANGLFIND.agc:170
//			2
// PORT: Fixed ROM slots 20596.
    20596, 6,
// PORT: SOURCE ANGLFIND.agc:171
//		SQRT	VDEF		# COFX = SQRT(MFISYM-CAM)/(1-CAM) $ROOT 2
// PORT: Fixed ROM slots 20597.
    20597, 46828,
// PORT: SOURCE ANGLFIND.agc:172
//		UNIT
// PORT: Fixed ROM slots 20598.
    20598, 65372,
// PORT: SOURCE ANGLFIND.agc:173
//		STORE	COF
// PORT: Fixed ROM slots 20599.
    20599, 3526,
// PORT: SOURCE ANGLFIND.agc:174
//
// PORT: SOURCE ANGLFIND.agc:175
//# DETERMINE LARGEST COF AND ADJUST ACCORDINGLY
// PORT: SOURCE ANGLFIND.agc:176
//
// PORT: SOURCE ANGLFIND.agc:177
//COFMAXGO	DLOAD	DSU
// PORT: Fixed ROM slots 20600.
    20600, 38346,
// PORT: SOURCE ANGLFIND.agc:178
//			COF
// PORT: Fixed ROM slots 20601.
    20601, 3526,
// PORT: SOURCE ANGLFIND.agc:179
//			COF +2
// PORT: Fixed ROM slots 20602.
    20602, 3530,
// PORT: SOURCE ANGLFIND.agc:180
//		BMN	DLOAD		# COFY G COFX
// PORT: Fixed ROM slots 20603.
    20603, 58688,
// PORT: SOURCE ANGLFIND.agc:181
//			COMP12
// PORT: Fixed ROM slots 20604.
    20604, 37126,
// PORT: SOURCE ANGLFIND.agc:182
//			COF
// PORT: Fixed ROM slots 20605.
    20605, 3526,
// PORT: SOURCE ANGLFIND.agc:183
//		DSU	BMN
// PORT: Fixed ROM slots 20606.
    20606, 41002,
// PORT: SOURCE ANGLFIND.agc:184
//			COF +4
// PORT: Fixed ROM slots 20607.
    20607, 3534,
// PORT: SOURCE ANGLFIND.agc:185
//# Page 402
// PORT: SOURCE ANGLFIND.agc:186
//			METHOD3		# COFZ G COFX OR COFY
// PORT: Fixed ROM slots 20608.
    20608, 37216,
// PORT: SOURCE ANGLFIND.agc:187
//		GOTO
// PORT: Fixed ROM slots 20609.
    20609, 65360,
// PORT: SOURCE ANGLFIND.agc:188
//			METHOD1		# COFX G COFY OR COFZ
// PORT: Fixed ROM slots 20610.
    20610, 37176,
// PORT: SOURCE ANGLFIND.agc:189
//COMP12		DLOAD	DSU
// PORT: Fixed ROM slots 20611.
    20611, 38346,
// PORT: SOURCE ANGLFIND.agc:190
//			COF +2
// PORT: Fixed ROM slots 20612.
    20612, 3530,
// PORT: SOURCE ANGLFIND.agc:191
//			COF +4
// PORT: Fixed ROM slots 20613.
    20613, 3534,
// PORT: SOURCE ANGLFIND.agc:192
//		BMN
// PORT: Fixed ROM slots 20614.
    20614, 65344,
// PORT: SOURCE ANGLFIND.agc:193
//			METHOD3		# COFZ G COFY OR COFX
// PORT: Fixed ROM slots 20615.
    20615, 37216,
// PORT: SOURCE ANGLFIND.agc:194
//
// PORT: SOURCE ANGLFIND.agc:195
//METHOD2		DLOAD	BPL		# COFY MAX
// PORT: Fixed ROM slots 20616.
    20616, 42186,
// PORT: SOURCE ANGLFIND.agc:196
//			COFSKEW +2	# UY
// PORT: Fixed ROM slots 20617.
    20617, 3478,
// PORT: SOURCE ANGLFIND.agc:197
//			U2POS
// PORT: Fixed ROM slots 20618.
    20618, 37148,
// PORT: SOURCE ANGLFIND.agc:198
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 20619.
    20619, 48890,
// PORT: SOURCE ANGLFIND.agc:199
//			COF
// PORT: Fixed ROM slots 20620.
    20620, 3526,
// PORT: SOURCE ANGLFIND.agc:200
//		STORE	COF
// PORT: Fixed ROM slots 20621.
    20621, 3526,
// PORT: SOURCE ANGLFIND.agc:201
//U2POS		DLOAD	BPL
// PORT: Fixed ROM slots 20622.
    20622, 42186,
// PORT: SOURCE ANGLFIND.agc:202
//			MFISYM +2	# UX UY
// PORT: Fixed ROM slots 20623.
    20623, 3442,
// PORT: SOURCE ANGLFIND.agc:203
//			OKU21
// PORT: Fixed ROM slots 20624.
    20624, 37160,
// PORT: SOURCE ANGLFIND.agc:204
//		DLOAD	DCOMP		# SIGN OF UX OPPOSITE TO UY
// PORT: Fixed ROM slots 20625.
    20625, 48842,
// PORT: SOURCE ANGLFIND.agc:205
//			COF
// PORT: Fixed ROM slots 20626.
    20626, 3526,
// PORT: SOURCE ANGLFIND.agc:206
//		STORE	COF
// PORT: Fixed ROM slots 20627.
    20627, 3526,
// PORT: SOURCE ANGLFIND.agc:207
//OKU21		DLOAD	BPL
// PORT: Fixed ROM slots 20628.
    20628, 42186,
// PORT: SOURCE ANGLFIND.agc:208
//			MFISYM +10D	# UY UZ
// PORT: Fixed ROM slots 20629.
    20629, 3458,
// PORT: SOURCE ANGLFIND.agc:209
//			LOCSKIRT
// PORT: Fixed ROM slots 20630.
    20630, 37822,
// PORT: SOURCE ANGLFIND.agc:210
//		DLOAD	DCOMP		# SIGN OF UZ OPPOSITE TO UY
// PORT: Fixed ROM slots 20631.
    20631, 48842,
// PORT: SOURCE ANGLFIND.agc:211
//			COF +4
// PORT: Fixed ROM slots 20632.
    20632, 3534,
// PORT: SOURCE ANGLFIND.agc:212
//		STORE	COF +4
// PORT: Fixed ROM slots 20633.
    20633, 3534,
// PORT: SOURCE ANGLFIND.agc:213
//		GOTO
// PORT: Fixed ROM slots 20634.
    20634, 65360,
// PORT: SOURCE ANGLFIND.agc:214
//			LOCSKIRT
// PORT: Fixed ROM slots 20635.
    20635, 37822,
// PORT: SOURCE ANGLFIND.agc:215
//METHOD1		DLOAD	BPL		# COFX MAX
// PORT: Fixed ROM slots 20636.
    20636, 42186,
// PORT: SOURCE ANGLFIND.agc:216
//			COFSKEW		# UX
// PORT: Fixed ROM slots 20637.
    20637, 3474,
// PORT: SOURCE ANGLFIND.agc:217
//			U1POS
// PORT: Fixed ROM slots 20638.
    20638, 37188,
// PORT: SOURCE ANGLFIND.agc:218
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 20639.
    20639, 48890,
// PORT: SOURCE ANGLFIND.agc:219
//			COF
// PORT: Fixed ROM slots 20640.
    20640, 3526,
// PORT: SOURCE ANGLFIND.agc:220
//		STORE	COF
// PORT: Fixed ROM slots 20641.
    20641, 3526,
// PORT: SOURCE ANGLFIND.agc:221
//U1POS		DLOAD	BPL
// PORT: Fixed ROM slots 20642.
    20642, 42186,
// PORT: SOURCE ANGLFIND.agc:222
//			MFISYM +2	# UX UY
// PORT: Fixed ROM slots 20643.
    20643, 3442,
// PORT: SOURCE ANGLFIND.agc:223
//			OKU12
// PORT: Fixed ROM slots 20644.
    20644, 37200,
// PORT: SOURCE ANGLFIND.agc:224
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 20645.
    20645, 48842,
// PORT: SOURCE ANGLFIND.agc:225
//			COF +2		# SIGN OF UY OPPOSITE TO UX
// PORT: Fixed ROM slots 20646.
    20646, 3530,
// PORT: SOURCE ANGLFIND.agc:226
//		STORE	COF +2
// PORT: Fixed ROM slots 20647.
    20647, 3530,
// PORT: SOURCE ANGLFIND.agc:227
//OKU12		DLOAD	BPL
// PORT: Fixed ROM slots 20648.
    20648, 42186,
// PORT: SOURCE ANGLFIND.agc:228
//			MFISYM +4	# UX UZ
// PORT: Fixed ROM slots 20649.
    20649, 3446,
// PORT: SOURCE ANGLFIND.agc:229
//			LOCSKIRT
// PORT: Fixed ROM slots 20650.
    20650, 37822,
// PORT: SOURCE ANGLFIND.agc:230
//		DLOAD	DCOMP		# SIGN OF UZ OPPOSITE TO UY
// PORT: Fixed ROM slots 20651.
    20651, 48842,
// PORT: SOURCE ANGLFIND.agc:231
//			COF +4
// PORT: Fixed ROM slots 20652.
    20652, 3534,
// PORT: SOURCE ANGLFIND.agc:232
//		STORE	COF +4
// PORT: Fixed ROM slots 20653.
    20653, 3534,
// PORT: SOURCE ANGLFIND.agc:233
//		GOTO
// PORT: Fixed ROM slots 20654.
    20654, 65360,
// PORT: SOURCE ANGLFIND.agc:234
//			LOCSKIRT
// PORT: Fixed ROM slots 20655.
    20655, 37822,
// PORT: SOURCE ANGLFIND.agc:235
//METHOD3		DLOAD	BPL		# COFZ MAX
// PORT: Fixed ROM slots 20656.
    20656, 42186,
// PORT: SOURCE ANGLFIND.agc:236
//# Page 403
// PORT: SOURCE ANGLFIND.agc:237
//			COFSKEW	+4	# UZ
// PORT: Fixed ROM slots 20657.
    20657, 3482,
// PORT: SOURCE ANGLFIND.agc:238
//			U3POS
// PORT: Fixed ROM slots 20658.
    20658, 37228,
// PORT: SOURCE ANGLFIND.agc:239
//		VLOAD	VCOMP
// PORT: Fixed ROM slots 20659.
    20659, 48890,
// PORT: SOURCE ANGLFIND.agc:240
//			COF
// PORT: Fixed ROM slots 20660.
    20660, 3526,
// PORT: SOURCE ANGLFIND.agc:241
//		STORE	COF
// PORT: Fixed ROM slots 20661.
    20661, 3526,
// PORT: SOURCE ANGLFIND.agc:242
//U3POS		DLOAD	BPL
// PORT: Fixed ROM slots 20662.
    20662, 42186,
// PORT: SOURCE ANGLFIND.agc:243
//			MFISYM +4	# UX UZ
// PORT: Fixed ROM slots 20663.
    20663, 3446,
// PORT: SOURCE ANGLFIND.agc:244
//			OKU31
// PORT: Fixed ROM slots 20664.
    20664, 37240,
// PORT: SOURCE ANGLFIND.agc:245
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 20665.
    20665, 48842,
// PORT: SOURCE ANGLFIND.agc:246
//			COF		# SIGN OF UX OPPOSITE TO UZ
// PORT: Fixed ROM slots 20666.
    20666, 3526,
// PORT: SOURCE ANGLFIND.agc:247
//		STORE	COF
// PORT: Fixed ROM slots 20667.
    20667, 3526,
// PORT: SOURCE ANGLFIND.agc:248
//OKU31		DLOAD	BPL
// PORT: Fixed ROM slots 20668.
    20668, 42186,
// PORT: SOURCE ANGLFIND.agc:249
//			MFISYM +10D	# UY UZ
// PORT: Fixed ROM slots 20669.
    20669, 3458
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE ANGLFIND.agc:250
//			LOCSKIRT
// PORT: Fixed ROM slots 20670.
    20670, 37822,
// PORT: SOURCE ANGLFIND.agc:251
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 20671.
    20671, 48842,
// PORT: SOURCE ANGLFIND.agc:252
//			COF +2		# SIGN OF UY OPPOSITE TO UZ
// PORT: Fixed ROM slots 20672.
    20672, 3530,
// PORT: SOURCE ANGLFIND.agc:253
//		STORE	COF +2
// PORT: Fixed ROM slots 20673.
    20673, 3530,
// PORT: SOURCE ANGLFIND.agc:254
//		GOTO
// PORT: Fixed ROM slots 20674.
    20674, 65360,
// PORT: SOURCE ANGLFIND.agc:255
//			LOCSKIRT
// PORT: Fixed ROM slots 20675.
    20675, 37822,
// PORT: SOURCE ANGLFIND.agc:256
//
// PORT: SOURCE ANGLFIND.agc:257
//# Page 404
// PORT: SOURCE ANGLFIND.agc:258
//# MATRIX OPERATIONS
// PORT: SOURCE ANGLFIND.agc:259
//
// PORT: SOURCE ANGLFIND.agc:260
//MXM3		SETPD			# MXM3 MULTIPLIES 2 3X3 MATRICES
// PORT: Fixed ROM slots 20676.
    20676, 65282,
// PORT: SOURCE ANGLFIND.agc:261
//			0		# AND LEAVES RESULT IN PD LIST
// PORT: Fixed ROM slots 20677.
    20677, 2,
// PORT: SOURCE ANGLFIND.agc:262
//		DLOAD*	PDDL*		# ADDRESS OF 1ST MATRIX IN XR1
// PORT: Fixed ROM slots 20678.
    20678, 54214,
// PORT: SOURCE ANGLFIND.agc:263
//			12D,2		# ADDRESS OF 2ND MATRIX IN XR2
// PORT: Fixed ROM slots 20679.
    20679, 65508,
// PORT: SOURCE ANGLFIND.agc:264
//			6,2
// PORT: Fixed ROM slots 20680.
    20680, 65520,
// PORT: SOURCE ANGLFIND.agc:265
//		PDDL*	VDEF		# DEFINE VECTOR M2(COL 1)
// PORT: Fixed ROM slots 20681.
    20681, 46758,
// PORT: SOURCE ANGLFIND.agc:266
//			0,2
// PORT: Fixed ROM slots 20682.
    20682, 65532,
// PORT: SOURCE ANGLFIND.agc:267
//		MXV*	PDDL*		# M1XM2(COL 1) IN PD
// PORT: Fixed ROM slots 20683.
    20683, 54174,
// PORT: SOURCE ANGLFIND.agc:268
//			0,1
// PORT: Fixed ROM slots 20684.
    20684, 2,
// PORT: SOURCE ANGLFIND.agc:269
//			14D,2
// PORT: Fixed ROM slots 20685.
    20685, 65504,
// PORT: SOURCE ANGLFIND.agc:270
//		PDDL*	PDDL*
// PORT: Fixed ROM slots 20686.
    20686, 54182,
// PORT: SOURCE ANGLFIND.agc:271
//			8D,2
// PORT: Fixed ROM slots 20687.
    20687, 65516,
// PORT: SOURCE ANGLFIND.agc:272
//			2,2
// PORT: Fixed ROM slots 20688.
    20688, 65528,
// PORT: SOURCE ANGLFIND.agc:273
//		VDEF	MXV*		# DEFINE VECTOR M2(COL 2)
// PORT: Fixed ROM slots 20689.
    20689, 53100,
// PORT: SOURCE ANGLFIND.agc:274
//			0,1
// PORT: Fixed ROM slots 20690.
    20690, 2,
// PORT: SOURCE ANGLFIND.agc:275
//		PDDL*	PDDL*		# M1XM2(COL 2) IN PD
// PORT: Fixed ROM slots 20691.
    20691, 54182,
// PORT: SOURCE ANGLFIND.agc:276
//			16D,2
// PORT: Fixed ROM slots 20692.
    20692, 65500,
// PORT: SOURCE ANGLFIND.agc:277
//			10D,2
// PORT: Fixed ROM slots 20693.
    20693, 65512,
// PORT: SOURCE ANGLFIND.agc:278
//		PDDL*	VDEF		# DEFINE VECTOR M2(COL 3)
// PORT: Fixed ROM slots 20694.
    20694, 46758,
// PORT: SOURCE ANGLFIND.agc:279
//			4,2
// PORT: Fixed ROM slots 20695.
    20695, 65524,
// PORT: SOURCE ANGLFIND.agc:280
//		MXV*	PUSH		# M1XM2(COL 3) IN PD
// PORT: Fixed ROM slots 20696.
    20696, 34462,
// PORT: SOURCE ANGLFIND.agc:281
//			0,1
// PORT: Fixed ROM slots 20697.
    20697, 2,
// PORT: SOURCE ANGLFIND.agc:282
//		GOTO
// PORT: Fixed ROM slots 20698.
    20698, 65360,
// PORT: SOURCE ANGLFIND.agc:283
//			TRNSPSPD	# REVERSE ROWS AND COLS IN PD AND
// PORT: Fixed ROM slots 20699.
    20699, 37318,
// PORT: SOURCE ANGLFIND.agc:284
//					# RETURN WITH M1XM2 IN PD LIST
// PORT: SOURCE ANGLFIND.agc:285
//
// PORT: SOURCE ANGLFIND.agc:286
//TRANSPOS	SETPD	VLOAD*		# TRANSPOS TRANSPOSES A 3X3 MATRIX
// PORT: Fixed ROM slots 20700.
    20700, 64258,
// PORT: SOURCE ANGLFIND.agc:287
//			0		#  AND LEAVES RESULT IN PD LIST
// PORT: Fixed ROM slots 20701.
    20701, 2,
// PORT: SOURCE ANGLFIND.agc:288
//			0,1		# MATRIX ADDRESS IN XR1
// PORT: Fixed ROM slots 20702.
    20702, 2,
// PORT: SOURCE ANGLFIND.agc:289
//		PDVL*	PDVL*
// PORT: Fixed ROM slots 20703.
    20703, 52118,
// PORT: SOURCE ANGLFIND.agc:290
//			6,1
// PORT: Fixed ROM slots 20704.
    20704, 14,
// PORT: SOURCE ANGLFIND.agc:291
//			12D,1
// PORT: Fixed ROM slots 20705.
    20705, 26,
// PORT: SOURCE ANGLFIND.agc:292
//		PUSH			# MATRIX IN PD
// PORT: Fixed ROM slots 20706.
    20706, 65292,
// PORT: SOURCE ANGLFIND.agc:293
//TRNSPSPD	DLOAD	PDDL		# ENTER WITH MATRIX IN PD LIST
// PORT: Fixed ROM slots 20707.
    20707, 54730,
// PORT: SOURCE ANGLFIND.agc:294
//			2
// PORT: Fixed ROM slots 20708.
    20708, 6,
// PORT: SOURCE ANGLFIND.agc:295
//			6
// PORT: Fixed ROM slots 20709.
    20709, 14,
// PORT: SOURCE ANGLFIND.agc:296
//		STODL	2
// PORT: Fixed ROM slots 20710.
    20710, 12294,
// PORT: SOURCE ANGLFIND.agc:297
//		STADR
// PORT: Fixed ROM slots 20711.
    20711, 65324,
// PORT: SOURCE ANGLFIND.agc:298
//		STODL	6
// PORT: Fixed ROM slots 20712.
    20712, 53232,
// PORT: SOURCE ANGLFIND.agc:299
//			4
// PORT: Fixed ROM slots 20713.
    20713, 10,
// PORT: SOURCE ANGLFIND.agc:300
//		PDDL
// PORT: Fixed ROM slots 20714.
    20714, 65450,
// PORT: SOURCE ANGLFIND.agc:301
//			12D
// PORT: Fixed ROM slots 20715.
    20715, 26,
// PORT: SOURCE ANGLFIND.agc:302
//		STODL	4
// PORT: Fixed ROM slots 20716.
    20716, 12298,
// PORT: SOURCE ANGLFIND.agc:303
//		STADR
// PORT: Fixed ROM slots 20717.
    20717, 65324,
// PORT: SOURCE ANGLFIND.agc:304
//		STODL	12D
// PORT: Fixed ROM slots 20718.
    20718, 53220,
// PORT: SOURCE ANGLFIND.agc:305
//			10D
// PORT: Fixed ROM slots 20719.
    20719, 22,
// PORT: SOURCE ANGLFIND.agc:306
//		PDDL
// PORT: Fixed ROM slots 20720.
    20720, 65450,
// PORT: SOURCE ANGLFIND.agc:307
//# Page 405
// PORT: SOURCE ANGLFIND.agc:308
//			14D
// PORT: Fixed ROM slots 20721.
    20721, 30,
// PORT: SOURCE ANGLFIND.agc:309
//		STODL	10D
// PORT: Fixed ROM slots 20722.
    20722, 12310,
// PORT: SOURCE ANGLFIND.agc:310
//		STADR
// PORT: Fixed ROM slots 20723.
    20723, 65324,
// PORT: SOURCE ANGLFIND.agc:311
//		STORE	14D
// PORT: Fixed ROM slots 20724.
    20724, 65504,
// PORT: SOURCE ANGLFIND.agc:312
//		RVQ			# RETURN WITH TRANSPOSED MATRIX IN PD LIST
// PORT: Fixed ROM slots 20725.
    20725, 65308,
// PORT: SOURCE ANGLFIND.agc:313
//MINANG		DEC	.00069375
// PORT: Fixed ROM slots 20726.
    20726, 22,
// PORT: SOURCE ANGLFIND.agc:314
//MAXANG		DEC	.472222
// PORT: Fixed ROM slots 20727.
    20727, 15474,
// PORT: SOURCE ANGLFIND.agc:315
//# GIMBAL LOCK CONSTANTS
// PORT: SOURCE ANGLFIND.agc:316
//
// PORT: SOURCE ANGLFIND.agc:317
//# D = MGA CORRESPONDING TO GIMBAL LOCK = 60 DEGREES
// PORT: SOURCE ANGLFIND.agc:318
//# NGL = BUFFER ANGLE (TO AVOID DIVISIONS BY ZERO) = 2 DEGREES
// PORT: SOURCE ANGLFIND.agc:319
//
// PORT: SOURCE ANGLFIND.agc:320
//SD		DEC	.433015		# = SIN(D)				$2
// PORT: Fixed ROM slots 20728.
    20728, 14190,
// PORT: SOURCE ANGLFIND.agc:321
//K3S1		DEC	.86603		# = SIN(D)				$2
// PORT: Fixed ROM slots 20729.
    20729, 28378,
// PORT: SOURCE ANGLFIND.agc:322
//K4		DEC	-.25		# = - COS(D)				$2
// PORT: Fixed ROM slots 20730.
    20730, 57342,
// PORT: SOURCE ANGLFIND.agc:323
//K4SQ		DEC	.125		# = COS(D)COS(D)			$2
// PORT: Fixed ROM slots 20731.
    20731, 4096,
// PORT: SOURCE ANGLFIND.agc:324
//SNGLCD		DEC	.008725		# = SIN(NGL)COS(D)			$2
// PORT: Fixed ROM slots 20732.
    20732, 286,
// PORT: SOURCE ANGLFIND.agc:325
//CNGL		DEC	.499695		# = COS(NGL)				$2
// PORT: Fixed ROM slots 20733.
    20733, 16374
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20734–20740.
function agcAotUnit1193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20736 {
        if slot <= 20734 {
// PORT: SOURCE ANGLFIND.agc:326
//READCDUK	INHINT			# LOAD T(MPAC) WITH THE CURRENT CDU ANGLES
// PORT: Fixed ROM slots 20734.
            if slot <> 20734 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 20735 {
// PORT: SOURCE ANGLFIND.agc:327
//		CA	CDUZ
// PORT: Fixed ROM slots 20735.
                if slot <> 20735 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ANGLFIND.agc:328
//		TS	MPAC +2
// PORT: Fixed ROM slots 20736.
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
// PORT: SOURCE ANGLFIND.agc:329
//		EXTEND
// PORT: Fixed ROM slots 20737.
                if slot <> 20737 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ANGLFIND.agc:330
//		DCA	CDUX
// PORT: Fixed ROM slots 20738.
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
// PORT: SOURCE ANGLFIND.agc:331
//		RELINT
// PORT: Fixed ROM slots 20739.
                if slot <> 20739 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE ANGLFIND.agc:332
//		TCF	TLOAD +6
// PORT: Fixed ROM slots 20740.
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
// PORT: SOURCE ANGLFIND.agc:333
//		BANK	16
// PORT: SOURCE ANGLFIND.agc:334
//		SETLOC	KALCMON2
// PORT: SOURCE ANGLFIND.agc:335
//		BANK
// PORT: SOURCE ANGLFIND.agc:336
//
// PORT: SOURCE ANGLFIND.agc:337
//		COUNT*	$$/KALC
// PORT: SOURCE ANGLFIND.agc:338
//
// PORT: SOURCE ANGLFIND.agc:339
//CDUTODCM	AXT,1	SSP		# SUBROUTINE TO COMPUTE  DIRECTION COSINE
// PORT: Fixed ROM slots 20741.
    20741, 55792,
// PORT: SOURCE ANGLFIND.agc:340
//		OCT	3		# MATRIX RELATING S/C AXES TO STABLE
// PORT: Fixed ROM slots 20742.
    20742, 6,
// PORT: SOURCE ANGLFIND.agc:341
//			S1		# MEMBER AXES FROM 3 CDU ANGLES IN T(MPAC)
// PORT: Fixed ROM slots 20743.
    20743, 82,
// PORT: SOURCE ANGLFIND.agc:342
//		OCT	1		# SET XR1, S1 AND PD FOR LOOP
// PORT: Fixed ROM slots 20744.
    20744, 2,
// PORT: SOURCE ANGLFIND.agc:343
//		STORE	7
// PORT: Fixed ROM slots 20745.
    20745, 16,
// PORT: SOURCE ANGLFIND.agc:344
//		SETPD
// PORT: Fixed ROM slots 20746.
    20746, 65282,
// PORT: SOURCE ANGLFIND.agc:345
//			0
// PORT: Fixed ROM slots 20747.
    20747, 2,
// PORT: SOURCE ANGLFIND.agc:346
//LOOPSIN		SLOAD*	RTB
// PORT: Fixed ROM slots 20748.
    20748, 40118,
// PORT: SOURCE ANGLFIND.agc:347
//			10D,1
// PORT: Fixed ROM slots 20749.
    20749, 22,
// PORT: SOURCE ANGLFIND.agc:348
//			CDULOGIC
// PORT: Fixed ROM slots 20750.
    20750, 38550,
// PORT: SOURCE ANGLFIND.agc:349
//		STORE	10D		# LOAD PD WITH 0 SIN(PHI)
// PORT: Fixed ROM slots 20751.
    20751, 22,
// PORT: SOURCE ANGLFIND.agc:350
//		SIN	PDDL		#	       2 COS(PHI)
// PORT: Fixed ROM slots 20752.
    20752, 54748,
// PORT: SOURCE ANGLFIND.agc:351
//			10D		#	       4 SIN(THETA)
// PORT: Fixed ROM slots 20753.
    20753, 22,
// PORT: SOURCE ANGLFIND.agc:352
//		COS	PUSH		#	       6 COS(THETA)
// PORT: Fixed ROM slots 20754.
    20754, 34508,
// PORT: SOURCE ANGLFIND.agc:353
//		TIX,1	DLOAD		#	       8 SIN(PSI)
// PORT: Fixed ROM slots 20755.
    20755, 58752,
// PORT: SOURCE ANGLFIND.agc:354
//			LOOPSIN		#	      10 COS(PSI)
// PORT: Fixed ROM slots 20756.
    20756, 37400,
// PORT: SOURCE ANGLFIND.agc:355
//			6
// PORT: Fixed ROM slots 20757.
    20757, 14,
// PORT: SOURCE ANGLFIND.agc:356
//		DMP	SL1
// PORT: Fixed ROM slots 20758.
    20758, 59914,
// PORT: SOURCE ANGLFIND.agc:357
//			10D
// PORT: Fixed ROM slots 20759.
    20759, 22,
// PORT: SOURCE ANGLFIND.agc:358
//# Page 406
// PORT: SOURCE ANGLFIND.agc:359
//		STORE	0,2
// PORT: Fixed ROM slots 20760.
    20760, 8194,
// PORT: SOURCE ANGLFIND.agc:360
//		DLOAD
// PORT: Fixed ROM slots 20761.
    20761, 65482,
// PORT: SOURCE ANGLFIND.agc:361
//			4
// PORT: Fixed ROM slots 20762.
    20762, 10,
// PORT: SOURCE ANGLFIND.agc:362
//		DMP	PDDL
// PORT: Fixed ROM slots 20763.
    20763, 54538,
// PORT: SOURCE ANGLFIND.agc:363
//			0		# (PD6 SIN(THETA)SIN(PHI))
// PORT: Fixed ROM slots 20764.
    20764, 2,
// PORT: SOURCE ANGLFIND.agc:364
//			6
// PORT: Fixed ROM slots 20765.
    20765, 14,
// PORT: SOURCE ANGLFIND.agc:365
//		DMP	DMP
// PORT: Fixed ROM slots 20766.
    20766, 34058,
// PORT: SOURCE ANGLFIND.agc:366
//			8D
// PORT: Fixed ROM slots 20767.
    20767, 18,
// PORT: SOURCE ANGLFIND.agc:367
//			2
// PORT: Fixed ROM slots 20768.
    20768, 6,
// PORT: SOURCE ANGLFIND.agc:368
//		SL1	BDSU
// PORT: Fixed ROM slots 20769.
    20769, 37332,
// PORT: SOURCE ANGLFIND.agc:369
//			12D
// PORT: Fixed ROM slots 20770.
    20770, 26,
// PORT: SOURCE ANGLFIND.agc:370
//		SL1
// PORT: Fixed ROM slots 20771.
    20771, 65492,
// PORT: SOURCE ANGLFIND.agc:371
//		STORE	2,2
// PORT: Fixed ROM slots 20772.
    20772, 8198,
// PORT: SOURCE ANGLFIND.agc:372
//		DLOAD
// PORT: Fixed ROM slots 20773.
    20773, 65482,
// PORT: SOURCE ANGLFIND.agc:373
//			2
// PORT: Fixed ROM slots 20774.
    20774, 6,
// PORT: SOURCE ANGLFIND.agc:374
//		DMP	PDDL		# (PD7 COS(PHI)SIN(THETA)) SCALED 4
// PORT: Fixed ROM slots 20775.
    20775, 54538,
// PORT: SOURCE ANGLFIND.agc:375
//			4
// PORT: Fixed ROM slots 20776.
    20776, 10,
// PORT: SOURCE ANGLFIND.agc:376
//			6
// PORT: Fixed ROM slots 20777.
    20777, 14,
// PORT: SOURCE ANGLFIND.agc:377
//		DMP	DMP
// PORT: Fixed ROM slots 20778.
    20778, 34058,
// PORT: SOURCE ANGLFIND.agc:378
//			8D
// PORT: Fixed ROM slots 20779.
    20779, 18,
// PORT: SOURCE ANGLFIND.agc:379
//			0
// PORT: Fixed ROM slots 20780.
    20780, 2,
// PORT: SOURCE ANGLFIND.agc:380
//		SL1
// PORT: Fixed ROM slots 20781.
    20781, 65492,
// PORT: SOURCE ANGLFIND.agc:381
//		DAD	SL1
// PORT: Fixed ROM slots 20782.
    20782, 59930,
// PORT: SOURCE ANGLFIND.agc:382
//			14D
// PORT: Fixed ROM slots 20783.
    20783, 30,
// PORT: SOURCE ANGLFIND.agc:383
//		STORE	4,2
// PORT: Fixed ROM slots 20784.
    20784, 8202,
// PORT: SOURCE ANGLFIND.agc:384
//		DLOAD
// PORT: Fixed ROM slots 20785.
    20785, 65482,
// PORT: SOURCE ANGLFIND.agc:385
//			8D
// PORT: Fixed ROM slots 20786.
    20786, 18,
// PORT: SOURCE ANGLFIND.agc:386
//		STORE	6,2
// PORT: Fixed ROM slots 20787.
    20787, 8206,
// PORT: SOURCE ANGLFIND.agc:387
//		DLOAD
// PORT: Fixed ROM slots 20788.
    20788, 65482,
// PORT: SOURCE ANGLFIND.agc:388
//			10D
// PORT: Fixed ROM slots 20789.
    20789, 22,
// PORT: SOURCE ANGLFIND.agc:389
//		DMP	SL1
// PORT: Fixed ROM slots 20790.
    20790, 59914,
// PORT: SOURCE ANGLFIND.agc:390
//			2
// PORT: Fixed ROM slots 20791.
    20791, 6,
// PORT: SOURCE ANGLFIND.agc:391
//		STORE	8D,2
// PORT: Fixed ROM slots 20792.
    20792, 8210,
// PORT: SOURCE ANGLFIND.agc:392
//		DLOAD
// PORT: Fixed ROM slots 20793.
    20793, 65482,
// PORT: SOURCE ANGLFIND.agc:393
//			10D
// PORT: Fixed ROM slots 20794.
    20794, 22,
// PORT: SOURCE ANGLFIND.agc:394
//		DMP	DCOMP
// PORT: Fixed ROM slots 20795.
    20795, 48650,
// PORT: SOURCE ANGLFIND.agc:395
//			0
// PORT: Fixed ROM slots 20796.
    20796, 2,
// PORT: SOURCE ANGLFIND.agc:396
//		SL1
// PORT: Fixed ROM slots 20797.
    20797, 65492,
// PORT: SOURCE ANGLFIND.agc:397
//		STORE	10D,2
// PORT: Fixed ROM slots 20798.
    20798, 8214,
// PORT: SOURCE ANGLFIND.agc:398
//		DLOAD
// PORT: Fixed ROM slots 20799.
    20799, 65482,
// PORT: SOURCE ANGLFIND.agc:399
//			4
// PORT: Fixed ROM slots 20800.
    20800, 10,
// PORT: SOURCE ANGLFIND.agc:400
//		DMP	DCOMP
// PORT: Fixed ROM slots 20801.
    20801, 48650,
// PORT: SOURCE ANGLFIND.agc:401
//			10D
// PORT: Fixed ROM slots 20802.
    20802, 22,
// PORT: SOURCE ANGLFIND.agc:402
//		SL1
// PORT: Fixed ROM slots 20803.
    20803, 65492,
// PORT: SOURCE ANGLFIND.agc:403
//		STORE	12D,2
// PORT: Fixed ROM slots 20804.
    20804, 8218,
// PORT: SOURCE ANGLFIND.agc:404
//		DLOAD
// PORT: Fixed ROM slots 20805.
    20805, 65482,
// PORT: SOURCE ANGLFIND.agc:405
//		DMP	SL1		# (PUSH UP 7)
// PORT: Fixed ROM slots 20806.
    20806, 59914,
// PORT: SOURCE ANGLFIND.agc:406
//			8D
// PORT: Fixed ROM slots 20807.
    20807, 18,
// PORT: SOURCE ANGLFIND.agc:407
//		PDDL	DMP		# (PD7 COS(PHI)SIN(THETA)SIN(PSI)) SCALE4
// PORT: Fixed ROM slots 20808.
    20808, 34218,
// PORT: SOURCE ANGLFIND.agc:408
//			6
// PORT: Fixed ROM slots 20809.
    20809, 14,
// PORT: SOURCE ANGLFIND.agc:409
//# Page 407
// PORT: SOURCE ANGLFIND.agc:410
//			0
// PORT: Fixed ROM slots 20810.
    20810, 2,
// PORT: SOURCE ANGLFIND.agc:411
//		DAD	SL1		#  (PUSH UP 7)
// PORT: Fixed ROM slots 20811.
    20811, 59930,
// PORT: SOURCE ANGLFIND.agc:412
//		STADR			# C7=COS(PHI)SIN(THETA)SIN(PSI)
// PORT: Fixed ROM slots 20812.
    20812, 65324,
// PORT: SOURCE ANGLFIND.agc:413
//		STORE	14D,2
// PORT: Fixed ROM slots 20813.
    20813, 57312,
// PORT: SOURCE ANGLFIND.agc:414
//		DLOAD
// PORT: Fixed ROM slots 20814.
    20814, 65482,
// PORT: SOURCE ANGLFIND.agc:415
//		DMP	SL1		#  (PUSH UP 6)
// PORT: Fixed ROM slots 20815.
    20815, 59914,
// PORT: SOURCE ANGLFIND.agc:416
//			8D
// PORT: Fixed ROM slots 20816.
    20816, 18,
// PORT: SOURCE ANGLFIND.agc:417
//		PDDL	DMP		#  (PD6 SIN(THETA)SIN(PHI)SIN(PSI)) SCALE4
// PORT: Fixed ROM slots 20817.
    20817, 34218,
// PORT: SOURCE ANGLFIND.agc:418
//			6
// PORT: Fixed ROM slots 20818.
    20818, 14,
// PORT: SOURCE ANGLFIND.agc:419
//			2
// PORT: Fixed ROM slots 20819.
    20819, 6,
// PORT: SOURCE ANGLFIND.agc:420
//		DSU	SL1		#  (PUSH UP 6)
// PORT: Fixed ROM slots 20820.
    20820, 59946,
// PORT: SOURCE ANGLFIND.agc:421
//		STADR
// PORT: Fixed ROM slots 20821.
    20821, 65324,
// PORT: SOURCE ANGLFIND.agc:422
//		STORE	16D,2		# C8=-SIN(THETA)SIN(PHI)SIN(PSI)
// PORT: Fixed ROM slots 20822.
    20822, 57308,
// PORT: SOURCE ANGLFIND.agc:423
//		RVQ			#  +COS(THETA)COS(PHI)
// PORT: Fixed ROM slots 20823.
    20823, 65308,
// PORT: SOURCE ANGLFIND.agc:424
//ENDOCM		EQUALS
// PORT: SOURCE ANGLFIND.agc:425
//
// PORT: SOURCE ANGLFIND.agc:426
//		BANK	15
// PORT: SOURCE ANGLFIND.agc:427
//		SETLOC	KALCMON1
// PORT: SOURCE ANGLFIND.agc:428
//		BANK
// PORT: SOURCE ANGLFIND.agc:429
//
// PORT: SOURCE ANGLFIND.agc:430
//# CALCULATION OF THE MATRIX DEL......
// PORT: SOURCE ANGLFIND.agc:431
//#
// PORT: SOURCE ANGLFIND.agc:432
//#	*      *               --T           *
// PORT: SOURCE ANGLFIND.agc:433
//#	DEL = (IDMATRIX)COS(A)+UU (1-COS(A))+UX SIN(A)		SCALED 1
// PORT: SOURCE ANGLFIND.agc:434
//#
// PORT: SOURCE ANGLFIND.agc:435
//#             -
// PORT: SOURCE ANGLFIND.agc:436
//#	WHERE U IS A UNIT VECTOR (DP SCALED 2) ALONG THE AXIS OF ROTATION.
// PORT: SOURCE ANGLFIND.agc:437
//#	A IS THE ANGLE OF ROTATION (DP SCALED 2)
// PORT: SOURCE ANGLFIND.agc:438
//#					   -
// PORT: SOURCE ANGLFIND.agc:439
//#	UPON ENTRY THE STARTING ADDRESS OF U IS COF, AND A IS IN MPAC
// PORT: SOURCE ANGLFIND.agc:440
//
// PORT: SOURCE ANGLFIND.agc:441
//		COUNT	22/KALC
// PORT: SOURCE ANGLFIND.agc:442
//
// PORT: SOURCE ANGLFIND.agc:443
//DELCOMP		SETPD	PUSH		# MPAC CONTAINS THE ANGLE A
// PORT: Fixed ROM slots 20824.
    20824, 34306,
// PORT: SOURCE ANGLFIND.agc:444
//			0
// PORT: Fixed ROM slots 20825.
    20825, 2,
// PORT: SOURCE ANGLFIND.agc:445
//		SIN	PDDL		# PD0 = SIN(A)
// PORT: Fixed ROM slots 20826.
    20826, 54748,
// PORT: SOURCE ANGLFIND.agc:446
//		COS	PUSH		# PD2 = COS(A)
// PORT: Fixed ROM slots 20827.
    20827, 34508,
// PORT: SOURCE ANGLFIND.agc:447
//		SR2	PDDL		# PD2 = COS(A)				$8
// PORT: Fixed ROM slots 20828.
    20828, 54660,
// PORT: SOURCE ANGLFIND.agc:448
//		BDSU	BOVB		# PD4 = 1-COS(A)			$2
// PORT: Fixed ROM slots 20829.
    20829, 33826,
// PORT: SOURCE ANGLFIND.agc:449
//			DPHALF
// PORT: Fixed ROM slots 20830.
    20830, 13750,
// PORT: SOURCE ANGLFIND.agc:450
//			SIGNMPAC
// PORT: Fixed ROM slots 20831.
    20831, 38804,
// PORT: SOURCE ANGLFIND.agc:451
//
// PORT: SOURCE ANGLFIND.agc:452
//# COMPUTE THE DIAGONAL COMPONENTS OF DEL
// PORT: SOURCE ANGLFIND.agc:453
//
// PORT: SOURCE ANGLFIND.agc:454
//		PDDL
// PORT: Fixed ROM slots 20832.
    20832, 65450,
// PORT: SOURCE ANGLFIND.agc:455
//			COF
// PORT: Fixed ROM slots 20833.
    20833, 3526,
// PORT: SOURCE ANGLFIND.agc:456
//		DSQ	DMP
// PORT: Fixed ROM slots 20834.
    20834, 34204,
// PORT: SOURCE ANGLFIND.agc:457
//			4
// PORT: Fixed ROM slots 20835.
    20835, 10,
// PORT: SOURCE ANGLFIND.agc:458
//		DAD	SL3
// PORT: Fixed ROM slots 20836.
    20836, 43546,
// PORT: SOURCE ANGLFIND.agc:459
//# Page 408
// PORT: SOURCE ANGLFIND.agc:460
//			2
// PORT: Fixed ROM slots 20837.
    20837, 6
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE ANGLFIND.agc:461
//		BOVB
// PORT: Fixed ROM slots 20838.
    20838, 65288,
// PORT: SOURCE ANGLFIND.agc:462
//			SIGNMPAC
// PORT: Fixed ROM slots 20839.
    20839, 38804,
// PORT: SOURCE ANGLFIND.agc:463
//		STODL	DEL		# UX UX(U-COS(A)) +COS(A)		$1
// PORT: Fixed ROM slots 20840.
    20840, 15916,
// PORT: SOURCE ANGLFIND.agc:464
//			COF +2
// PORT: Fixed ROM slots 20841.
    20841, 3530,
// PORT: SOURCE ANGLFIND.agc:465
//		DSQ	DMP
// PORT: Fixed ROM slots 20842.
    20842, 34204,
// PORT: SOURCE ANGLFIND.agc:466
//			4
// PORT: Fixed ROM slots 20843.
    20843, 10,
// PORT: SOURCE ANGLFIND.agc:467
//		DAD	SL3
// PORT: Fixed ROM slots 20844.
    20844, 43546,
// PORT: SOURCE ANGLFIND.agc:468
//			2
// PORT: Fixed ROM slots 20845.
    20845, 6,
// PORT: SOURCE ANGLFIND.agc:469
//		BOVB
// PORT: Fixed ROM slots 20846.
    20846, 65288,
// PORT: SOURCE ANGLFIND.agc:470
//			SIGNMPAC
// PORT: Fixed ROM slots 20847.
    20847, 38804,
// PORT: SOURCE ANGLFIND.agc:471
//		STODL	DEL +8D		# UY UY(1-COS(A)) +COS(A)		$1
// PORT: Fixed ROM slots 20848.
    20848, 15932,
// PORT: SOURCE ANGLFIND.agc:472
//			COF +4
// PORT: Fixed ROM slots 20849.
    20849, 3534,
// PORT: SOURCE ANGLFIND.agc:473
//		DSQ	DMP
// PORT: Fixed ROM slots 20850.
    20850, 34204,
// PORT: SOURCE ANGLFIND.agc:474
//			4
// PORT: Fixed ROM slots 20851.
    20851, 10,
// PORT: SOURCE ANGLFIND.agc:475
//		DAD	SL3
// PORT: Fixed ROM slots 20852.
    20852, 43546,
// PORT: SOURCE ANGLFIND.agc:476
//			2
// PORT: Fixed ROM slots 20853.
    20853, 6,
// PORT: SOURCE ANGLFIND.agc:477
//		BOVB
// PORT: Fixed ROM slots 20854.
    20854, 65288,
// PORT: SOURCE ANGLFIND.agc:478
//			SIGNMPAC
// PORT: Fixed ROM slots 20855.
    20855, 38804,
// PORT: SOURCE ANGLFIND.agc:479
//		STORE	DEL +16D	# UZ UZ(1-COS(A)) +COS(A)		$1
// PORT: Fixed ROM slots 20856.
    20856, 3660,
// PORT: SOURCE ANGLFIND.agc:480
//
// PORT: SOURCE ANGLFIND.agc:481
//# COMPUTE THE OFF DIAGONAL TERMS OF DEL
// PORT: SOURCE ANGLFIND.agc:482
//
// PORT: SOURCE ANGLFIND.agc:483
//		DLOAD	DMP
// PORT: Fixed ROM slots 20857.
    20857, 34250,
// PORT: SOURCE ANGLFIND.agc:484
//			COF
// PORT: Fixed ROM slots 20858.
    20858, 3526,
// PORT: SOURCE ANGLFIND.agc:485
//			COF +2
// PORT: Fixed ROM slots 20859.
    20859, 3530,
// PORT: SOURCE ANGLFIND.agc:486
//		DMP	SL1
// PORT: Fixed ROM slots 20860.
    20860, 59914,
// PORT: SOURCE ANGLFIND.agc:487
//			4
// PORT: Fixed ROM slots 20861.
    20861, 10,
// PORT: SOURCE ANGLFIND.agc:488
//		PDDL	DMP		# D6  UX UY (1-COS A)			$ 4
// PORT: Fixed ROM slots 20862.
    20862, 34218,
// PORT: SOURCE ANGLFIND.agc:489
//			COF +4
// PORT: Fixed ROM slots 20863.
    20863, 3534,
// PORT: SOURCE ANGLFIND.agc:490
//			0
// PORT: Fixed ROM slots 20864.
    20864, 2,
// PORT: SOURCE ANGLFIND.agc:491
//		PUSH	DAD		# D8  UZ SIN A				$ 4
// PORT: Fixed ROM slots 20865.
    20865, 36108,
// PORT: SOURCE ANGLFIND.agc:492
//			6
// PORT: Fixed ROM slots 20866.
    20866, 14,
// PORT: SOURCE ANGLFIND.agc:493
//		SL2	BOVB
// PORT: Fixed ROM slots 20867.
    20867, 33940,
// PORT: SOURCE ANGLFIND.agc:494
//			SIGNMPAC
// PORT: Fixed ROM slots 20868.
    20868, 38804,
// PORT: SOURCE ANGLFIND.agc:495
//		STODL	DEL +6
// PORT: Fixed ROM slots 20869.
    20869, 15928,
// PORT: SOURCE ANGLFIND.agc:496
//		BDSU	SL2
// PORT: Fixed ROM slots 20870.
    20870, 51746,
// PORT: SOURCE ANGLFIND.agc:497
//		BOVB
// PORT: Fixed ROM slots 20871.
    20871, 65288,
// PORT: SOURCE ANGLFIND.agc:498
//			SIGNMPAC
// PORT: Fixed ROM slots 20872.
    20872, 38804,
// PORT: SOURCE ANGLFIND.agc:499
//		STODL	DEL +2
// PORT: Fixed ROM slots 20873.
    20873, 15920,
// PORT: SOURCE ANGLFIND.agc:500
//			COF
// PORT: Fixed ROM slots 20874.
    20874, 3526,
// PORT: SOURCE ANGLFIND.agc:501
//		DMP	DMP
// PORT: Fixed ROM slots 20875.
    20875, 34058,
// PORT: SOURCE ANGLFIND.agc:502
//			COF +4
// PORT: Fixed ROM slots 20876.
    20876, 3534,
// PORT: SOURCE ANGLFIND.agc:503
//			4
// PORT: Fixed ROM slots 20877.
    20877, 10,
// PORT: SOURCE ANGLFIND.agc:504
//		SL1	PDDL		# D6  UX UZ (1-COS A )		$ 4
// PORT: Fixed ROM slots 20878.
    20878, 54740,
// PORT: SOURCE ANGLFIND.agc:505
//			COF +2
// PORT: Fixed ROM slots 20879.
    20879, 3530,
// PORT: SOURCE ANGLFIND.agc:506
//		DMP	PUSH		# D8  UY SIN(A)
// PORT: Fixed ROM slots 20880.
    20880, 34314,
// PORT: SOURCE ANGLFIND.agc:507
//			0
// PORT: Fixed ROM slots 20881.
    20881, 2,
// PORT: SOURCE ANGLFIND.agc:508
//		DAD	SL2
// PORT: Fixed ROM slots 20882.
    20882, 51738,
// PORT: SOURCE ANGLFIND.agc:509
//			6
// PORT: Fixed ROM slots 20883.
    20883, 14,
// PORT: SOURCE ANGLFIND.agc:510
//# Page 409
// PORT: SOURCE ANGLFIND.agc:511
//		BOVB
// PORT: Fixed ROM slots 20884.
    20884, 65288,
// PORT: SOURCE ANGLFIND.agc:512
//			SIGNMPAC
// PORT: Fixed ROM slots 20885.
    20885, 38804,
// PORT: SOURCE ANGLFIND.agc:513
//		STODL	DEL +4		# UX UZ (1-COS(A))+UY SIN(A)
// PORT: Fixed ROM slots 20886.
    20886, 15924,
// PORT: SOURCE ANGLFIND.agc:514
//		BDSU	SL2
// PORT: Fixed ROM slots 20887.
    20887, 51746,
// PORT: SOURCE ANGLFIND.agc:515
//		BOVB
// PORT: Fixed ROM slots 20888.
    20888, 65288,
// PORT: SOURCE ANGLFIND.agc:516
//			SIGNMPAC
// PORT: Fixed ROM slots 20889.
    20889, 38804,
// PORT: SOURCE ANGLFIND.agc:517
//		STODL	DEL +12D	# UX UZ (U-COS(A))-UY SIN(A)
// PORT: Fixed ROM slots 20890.
    20890, 15940,
// PORT: SOURCE ANGLFIND.agc:518
//			COF +2
// PORT: Fixed ROM slots 20891.
    20891, 3530,
// PORT: SOURCE ANGLFIND.agc:519
//		DMP	DMP
// PORT: Fixed ROM slots 20892.
    20892, 34058,
// PORT: SOURCE ANGLFIND.agc:520
//			COF +4
// PORT: Fixed ROM slots 20893.
    20893, 3534,
// PORT: SOURCE ANGLFIND.agc:521
//			4
// PORT: Fixed ROM slots 20894.
    20894, 10,
// PORT: SOURCE ANGLFIND.agc:522
//		SL1	PDDL		# D6  UY UZ (1-COS(A))		$ 4
// PORT: Fixed ROM slots 20895.
    20895, 54740,
// PORT: SOURCE ANGLFIND.agc:523
//			COF
// PORT: Fixed ROM slots 20896.
    20896, 3526,
// PORT: SOURCE ANGLFIND.agc:524
//		DMP	PUSH		# D6  UX SIN(A)
// PORT: Fixed ROM slots 20897.
    20897, 34314,
// PORT: SOURCE ANGLFIND.agc:525
//			0
// PORT: Fixed ROM slots 20898.
    20898, 2,
// PORT: SOURCE ANGLFIND.agc:526
//		DAD	SL2
// PORT: Fixed ROM slots 20899.
    20899, 51738,
// PORT: SOURCE ANGLFIND.agc:527
//			6
// PORT: Fixed ROM slots 20900.
    20900, 14,
// PORT: SOURCE ANGLFIND.agc:528
//		BOVB
// PORT: Fixed ROM slots 20901.
    20901, 65288,
// PORT: SOURCE ANGLFIND.agc:529
//			SIGNMPAC
// PORT: Fixed ROM slots 20902.
    20902, 38804,
// PORT: SOURCE ANGLFIND.agc:530
//		STODL	DEL +14D	# UY UZ(1-COS(A)) +UX SIN(A)
// PORT: Fixed ROM slots 20903.
    20903, 15944,
// PORT: SOURCE ANGLFIND.agc:531
//		BDSU	SL2
// PORT: Fixed ROM slots 20904.
    20904, 51746,
// PORT: SOURCE ANGLFIND.agc:532
//		BOVB
// PORT: Fixed ROM slots 20905.
    20905, 65288,
// PORT: SOURCE ANGLFIND.agc:533
//			SIGNMPAC
// PORT: Fixed ROM slots 20906.
    20906, 38804,
// PORT: SOURCE ANGLFIND.agc:534
//		STORE	DEL +10D	# UY UZ (1-COS(A)) -UX SIN(A)
// PORT: Fixed ROM slots 20907.
    20907, 3648,
// PORT: SOURCE ANGLFIND.agc:535
//		RVQ
// PORT: Fixed ROM slots 20908.
    20908, 65308,
// PORT: SOURCE ANGLFIND.agc:536
//
// PORT: SOURCE ANGLFIND.agc:537
//# DIRECTION COSINE MATRIX TO CDU ANGLE ROUTINE
// PORT: SOURCE ANGLFIND.agc:538
//# X1 CONTAINS THE COMPLEMENT OF THE STARTING ADDRESS FOR MATRIX (SCALED 2)
// PORT: SOURCE ANGLFIND.agc:539
//# LEAVES CDU ANGLES SCALED 2PI IN V(MPAC)
// PORT: SOURCE ANGLFIND.agc:540
//# COS(MGA) WILL BE LEFT IN S1 (SCALED 1)
// PORT: SOURCE ANGLFIND.agc:541
//#
// PORT: SOURCE ANGLFIND.agc:542
//# THE DIRECTION COSINE MATRIX RELATING S/C AXES TO STABLE MEMBER AXES CAN BE WRITTEN AS***
// PORT: SOURCE ANGLFIND.agc:543
//#
// PORT: SOURCE ANGLFIND.agc:544
//#	C =COS(THETA)COS(PSI)
// PORT: SOURCE ANGLFIND.agc:545
//#	 0
// PORT: SOURCE ANGLFIND.agc:546
//#	C =-COS(THETA)SIN(PSI)COS(PHI)+SI (THETA)SIN(PHI)
// PORT: SOURCE ANGLFIND.agc:547
//#	 1
// PORT: SOURCE ANGLFIND.agc:548
//#	C =COS(THETA)SIN(PSI)SIN(PHI) + S N(THETA)COS(PHI)
// PORT: SOURCE ANGLFIND.agc:549
//#	 2
// PORT: SOURCE ANGLFIND.agc:550
//#	C =SIN(PSI)
// PORT: SOURCE ANGLFIND.agc:551
//#	 3
// PORT: SOURCE ANGLFIND.agc:552
//#	C =COS(PSI)COS(PHI)
// PORT: SOURCE ANGLFIND.agc:553
//#	 4
// PORT: SOURCE ANGLFIND.agc:554
//#	C =-COS(PSI)SIN(PHI)
// PORT: SOURCE ANGLFIND.agc:555
//#	 5
// PORT: SOURCE ANGLFIND.agc:556
//#	C =-SIN(THETA)COS(PSI)
// PORT: SOURCE ANGLFIND.agc:557
//#	 6
// PORT: SOURCE ANGLFIND.agc:558
//#	C =SIN(THETA)SIN(PSI)COS(PHI)+COS THETA)SIN(PHI)
// PORT: SOURCE ANGLFIND.agc:559
//#	 7
// PORT: SOURCE ANGLFIND.agc:560
//# Page 410
// PORT: SOURCE ANGLFIND.agc:561
//#	C =-SIN(THETA)SIN(PSI)SIN(PHI)+COS(THETA)COS(PHI)
// PORT: SOURCE ANGLFIND.agc:562
//#	 8
// PORT: SOURCE ANGLFIND.agc:563
//#
// PORT: SOURCE ANGLFIND.agc:564
//#	WHERE	PHI = OGA
// PORT: SOURCE ANGLFIND.agc:565
//#		THETA = IGA
// PORT: SOURCE ANGLFIND.agc:566
//#		PSI = MGA
// PORT: SOURCE ANGLFIND.agc:567
//
// PORT: SOURCE ANGLFIND.agc:568
//DCMTOCDU	DLOAD*	ARCSIN
// PORT: Fixed ROM slots 20909.
    20909, 57030,
// PORT: SOURCE ANGLFIND.agc:569
//			6,1
// PORT: Fixed ROM slots 20910.
    20910, 14,
// PORT: SOURCE ANGLFIND.agc:570
//		PUSH	COS		# PD +0		PSI
// PORT: Fixed ROM slots 20911.
    20911, 58892,
// PORT: SOURCE ANGLFIND.agc:571
//		SL1	BOVB
// PORT: Fixed ROM slots 20912.
    20912, 34004,
// PORT: SOURCE ANGLFIND.agc:572
//			SIGNMPAC
// PORT: Fixed ROM slots 20913.
    20913, 38804,
// PORT: SOURCE ANGLFIND.agc:573
//		STORE	S1
// PORT: Fixed ROM slots 20914.
    20914, 82,
// PORT: SOURCE ANGLFIND.agc:574
//		DLOAD*	DCOMP
// PORT: Fixed ROM slots 20915.
    20915, 48838,
// PORT: SOURCE ANGLFIND.agc:575
//			12D,1
// PORT: Fixed ROM slots 20916.
    20916, 26,
// PORT: SOURCE ANGLFIND.agc:576
//		DDV	ARCSIN
// PORT: Fixed ROM slots 20917.
    20917, 56946,
// PORT: SOURCE ANGLFIND.agc:577
//			S1
// PORT: Fixed ROM slots 20918.
    20918, 82,
// PORT: SOURCE ANGLFIND.agc:578
//		PDDL*	BPL		# PD +2		THETA
// PORT: Fixed ROM slots 20919.
    20919, 42150,
// PORT: SOURCE ANGLFIND.agc:579
//			0,1		# MUST CHECK THE SIGN OF COS(THETA)
// PORT: Fixed ROM slots 20920.
    20920, 2,
// PORT: SOURCE ANGLFIND.agc:580
//			OKTHETA		# TO DETERMINE THE PROPER QUADRANT
// PORT: Fixed ROM slots 20921.
    20921, 37766,
// PORT: SOURCE ANGLFIND.agc:581
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 20922.
    20922, 48842,
// PORT: SOURCE ANGLFIND.agc:582
//		BPL	DAD
// PORT: Fixed ROM slots 20923.
    20923, 36168,
// PORT: SOURCE ANGLFIND.agc:583
//			SUHALFA
// PORT: Fixed ROM slots 20924.
    20924, 37760,
// PORT: SOURCE ANGLFIND.agc:584
//			DPHALF
// PORT: Fixed ROM slots 20925.
    20925, 13750,
// PORT: SOURCE ANGLFIND.agc:585
//		GOTO
// PORT: Fixed ROM slots 20926.
    20926, 65360,
// PORT: SOURCE ANGLFIND.agc:586
//			CALCPHI
// PORT: Fixed ROM slots 20927.
    20927, 37764,
// PORT: SOURCE ANGLFIND.agc:587
//SUHALFA		DSU
// PORT: Fixed ROM slots 20928.
    20928, 65322,
// PORT: SOURCE ANGLFIND.agc:588
//			DPHALF
// PORT: Fixed ROM slots 20929.
    20929, 13750
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE ANGLFIND.agc:589
//CALCPHI		PUSH
// PORT: Fixed ROM slots 20930.
    20930, 65292,
// PORT: SOURCE ANGLFIND.agc:590
//OKTHETA		DLOAD*	DCOMP
// PORT: Fixed ROM slots 20931.
    20931, 48838,
// PORT: SOURCE ANGLFIND.agc:591
//			10D,1
// PORT: Fixed ROM slots 20932.
    20932, 22,
// PORT: SOURCE ANGLFIND.agc:592
//		DDV	ARCSIN
// PORT: Fixed ROM slots 20933.
    20933, 56946,
// PORT: SOURCE ANGLFIND.agc:593
//			S1
// PORT: Fixed ROM slots 20934.
    20934, 82,
// PORT: SOURCE ANGLFIND.agc:594
//		PDDL*	BPL		# PUSH DOWN PHI
// PORT: Fixed ROM slots 20935.
    20935, 42150,
// PORT: SOURCE ANGLFIND.agc:595
//			8D,1
// PORT: Fixed ROM slots 20936.
    20936, 18,
// PORT: SOURCE ANGLFIND.agc:596
//			OKPHI
// PORT: Fixed ROM slots 20937.
    20937, 37798,
// PORT: SOURCE ANGLFIND.agc:597
//		DLOAD	DCOMP		# PUSH UP PHI
// PORT: Fixed ROM slots 20938.
    20938, 48842,
// PORT: SOURCE ANGLFIND.agc:598
//		BPL	DAD
// PORT: Fixed ROM slots 20939.
    20939, 36168,
// PORT: SOURCE ANGLFIND.agc:599
//			SUHALFAP
// PORT: Fixed ROM slots 20940.
    20940, 37792,
// PORT: SOURCE ANGLFIND.agc:600
//			DPHALF
// PORT: Fixed ROM slots 20941.
    20941, 13750,
// PORT: SOURCE ANGLFIND.agc:601
//		GOTO
// PORT: Fixed ROM slots 20942.
    20942, 65360,
// PORT: SOURCE ANGLFIND.agc:602
//			VECOFANG
// PORT: Fixed ROM slots 20943.
    20943, 37800,
// PORT: SOURCE ANGLFIND.agc:603
//SUHALFAP	DSU	GOTO
// PORT: Fixed ROM slots 20944.
    20944, 43050,
// PORT: SOURCE ANGLFIND.agc:604
//			DPHALF
// PORT: Fixed ROM slots 20945.
    20945, 13750,
// PORT: SOURCE ANGLFIND.agc:605
//			VECOFANG
// PORT: Fixed ROM slots 20946.
    20946, 37800,
// PORT: SOURCE ANGLFIND.agc:606
//OKPHI		DLOAD			# PUSH UP PHI
// PORT: Fixed ROM slots 20947.
    20947, 65482,
// PORT: SOURCE ANGLFIND.agc:607
//VECOFANG	VDEF	RVQ
// PORT: Fixed ROM slots 20948.
    20948, 36460
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20949–20950.
function agcAotUnit1194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20949 {
// PORT: SOURCE ANGLFIND.agc:608
//
// PORT: SOURCE ANGLFIND.agc:609
//# Page 411
// PORT: SOURCE ANGLFIND.agc:610
//# ROUTINE FOR TERMINATING AUTOMATIC MANEUVERS
// PORT: SOURCE ANGLFIND.agc:611
//
// PORT: SOURCE ANGLFIND.agc:612
//NOGOM2		INHINT			# THIS LOCATION ACCESSED BY A BZMF NOGO -2
// PORT: Fixed ROM slots 20949.
        if slot <> 20949 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE ANGLFIND.agc:613
//		TC	BANKCALL
// PORT: Fixed ROM slots 20950.
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
// PORT: SOURCE ANGLFIND.agc:614
//		CADR	ZEROEROR
// PORT: Fixed ROM slots 20951.
    20951, 32986
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20952–20955.
function agcAotUnit1195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20953 {
        if slot <= 20952 {
// PORT: SOURCE ANGLFIND.agc:615
//
// PORT: SOURCE ANGLFIND.agc:616
//NOGO		INHINT
// PORT: Fixed ROM slots 20952.
            if slot <> 20952 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE ANGLFIND.agc:617
//		TC	STOPRATE
// PORT: Fixed ROM slots 20953.
            if slot <> 20953 or instruction <> 2390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 20954 {
// PORT: SOURCE ANGLFIND.agc:618
//
// PORT: SOURCE ANGLFIND.agc:619
//					# TERMINATE MANEUVER
// PORT: SOURCE ANGLFIND.agc:620
//		CAF	TWO		# NOTE - ALL RETURNS ARE NOW MADE VIA
// PORT: Fixed ROM slots 20954.
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
// PORT: SOURCE ANGLFIND.agc:621
//		TC	WAITLIST	# GOODEND
// PORT: Fixed ROM slots 20955.
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
// PORT: SOURCE ANGLFIND.agc:622
//		EBANK=	BCDU
// PORT: SOURCE ANGLFIND.agc:623
//		2CADR	ENDMANU
// PORT: Fixed ROM slots 20956 20957.
    20956, 2060, 20957, 34924
)).

// PORT: Physical bank 22. Shared continuation entries, slots 20958–20958.
function agcAotUnit1196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE ANGLFIND.agc:624
//
// PORT: SOURCE ANGLFIND.agc:625
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 20958.
    if slot <> 20958 or instruction <> 6799 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6799, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1196] to agcAotUnit1196@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE ANGLFIND.agc:626
//
