// PORT: Original source unit CM_BODY_ATTITUDE.agc.
// PORT: Physical bank 37. Shared continuation entries, slots 34616–34616.
function agcAotUnit1963 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:2
//# Filename:     CM_BODY_ATTITUDE.agc
// PORT: SOURCE CM_BODY_ATTITUDE.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE CM_BODY_ATTITUDE.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE CM_BODY_ATTITUDE.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE CM_BODY_ATTITUDE.agc:7
//# Reference:    pp. 883-889
// PORT: SOURCE CM_BODY_ATTITUDE.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE CM_BODY_ATTITUDE.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:10
//# Mod history:  2009-05-12 RSB	Adapted from Colossus249 file of the same
// PORT: SOURCE CM_BODY_ATTITUDE.agc:11
//#				name and Comanche 055 page images.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:12
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE CM_BODY_ATTITUDE.agc:14
//# from scanned documents.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:15
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:16
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE CM_BODY_ATTITUDE.agc:17
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:18
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:19
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE CM_BODY_ATTITUDE.agc:20
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:21
//#       Prepared by
// PORT: SOURCE CM_BODY_ATTITUDE.agc:22
//#                       Massachusetts Institute of Technology
// PORT: SOURCE CM_BODY_ATTITUDE.agc:23
//#                       75 Cambridge Parkway
// PORT: SOURCE CM_BODY_ATTITUDE.agc:24
//#                       Cambridge, Massachusetts
// PORT: SOURCE CM_BODY_ATTITUDE.agc:25
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:26
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:27
//#
// PORT: SOURCE CM_BODY_ATTITUDE.agc:28
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE CM_BODY_ATTITUDE.agc:29
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:30
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:31
//# Page 883
// PORT: SOURCE CM_BODY_ATTITUDE.agc:32
//		BANK	35
// PORT: SOURCE CM_BODY_ATTITUDE.agc:33
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:34
//		SETLOC	BODYATT
// PORT: SOURCE CM_BODY_ATTITUDE.agc:35
//		BANK
// PORT: SOURCE CM_BODY_ATTITUDE.agc:36
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:37
//		COUNT	37/CMBAT
// PORT: SOURCE CM_BODY_ATTITUDE.agc:38
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:39
//# PDL 12D - 15D SAFE.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:40
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:41
//# VALUES OF GIMBAL AND BODY ANGLES VALID AT PIP TIME ARE SAVED DURING	READACCS.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:42
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:43
//		EBANK=	RTINIT		# LET INTERPRETER SET EB
// PORT: SOURCE CM_BODY_ATTITUDE.agc:44
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:45
//CM/POSE		TC	INTPRET		# COME HERE VIA AVEGEXIT.
// PORT: Fixed ROM slots 34616.
    if slot <> 34616 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1963] to agcAotUnit1963@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:46
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:47
//		SETPD	VLOAD
// PORT: Fixed ROM slots 34617.
    34617, 64770,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:48
//			0
// PORT: Fixed ROM slots 34618.
    34618, 2,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:49
//			VN		# KVSCALE = (12800/ .3048) /2VS
// PORT: Fixed ROM slots 34619.
    34619, 1278,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:50
//		VXSC	PDVL
// PORT: Fixed ROM slots 34620.
    34620, 52706,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:51
//			-KVSCALE	# KVSCALE = .81491944
// PORT: Fixed ROM slots 34621.
    34621, 32750,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:52
//			UNITW		# FULL UNIT VECTOR
// PORT: Fixed ROM slots 34622.
    34622, 1944,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:53
//		VXV	VXSC		# VREL = V - WE*R
// PORT: Fixed ROM slots 34623.
    34623, 61754,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:54
//			UNITR
// PORT: Fixed ROM slots 34624.
    34624, 2016,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:55
//			KWE
// PORT: Fixed ROM slots 34625.
    34625, 13642,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:56
//		VAD	STADR
// PORT: Fixed ROM slots 34626.
    34626, 38490,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:57
//		STORE	-VREL		# SAVE FOR ENTRY GUIDANCE.	REF COORDS
// PORT: Fixed ROM slots 34627.
    34627, 61778,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:58
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:59
//		UNIT	LXA,1
// PORT: Fixed ROM slots 34628.
    34628, 59484,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:60
//			36D		# ABVAL( -VREL) TO X1
// PORT: Fixed ROM slots 34629.
    34629, 72,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:61
//		STORE	UXA/2		# -UVREL			REF COORDS
// PORT: Fixed ROM slots 34630.
    34630, 3780,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:62
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:63
//		VXV	VCOMP
// PORT: Fixed ROM slots 34631.
    34631, 48698,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:64
//			UNITR		# .5 UNIT			REF COORDS
// PORT: Fixed ROM slots 34632.
    34632, 2016,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:65
//		UNIT	SSP		# THE FOLLOWING IS TO PROVIDE A STABLE
// PORT: Fixed ROM slots 34633.
    34633, 55644,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:66
//			S1		# UN FOR THE END OF THE TERMINAL PHASE.
// PORT: Fixed ROM slots 34634.
    34634, 82,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:67
//SPVQUIT		DEC	.019405		# 1000/ 2 VS
// PORT: Fixed ROM slots 34635.
    34635, 636,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:68
//		TIX,1	VLOAD		# IF V-VQUIT POS, BRANCH.
// PORT: Fixed ROM slots 34636.
    34636, 64896,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:69
//			CM/POSE2	# SAVE UYA IN OLDUYA
// PORT: Fixed ROM slots 34637.
    34637, 65182,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:70
//			OLDUYA		# OTHERWISE CONTINUE TO USE OLDUYA.
// PORT: Fixed ROM slots 34638.
    34638, 3768,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:71
//CM/POSE2	STORE	UYA/2		#				REF COORDS
// PORT: Fixed ROM slots 34639.
    34639, 3792,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:72
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:73
//		STORE	OLDUYA		# RESTORE, OR SAVE AS CASE MAY BE.
// PORT: Fixed ROM slots 34640.
    34640, 3768,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:74
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:75
//		VXV	VCOMP
// PORT: Fixed ROM slots 34641.
    34641, 48698,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:76
//			UXA/2		# FINISH OBTAINING TRAJECTORY TRIAD.
// PORT: Fixed ROM slots 34642.
    34642, 3780,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:77
//		VSL1
// PORT: Fixed ROM slots 34643.
    34643, 65524,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:78
//		STORE	UZA/2		#				REF COORDS
// PORT: Fixed ROM slots 34644.
    34644, 3804,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:79
//# Page 884
// PORT: SOURCE CM_BODY_ATTITUDE.agc:80
//		TLOAD			# PICK UP CDUX, CDUY, CDUZ CORRESPONDING
// PORT: Fixed ROM slots 34645.
    34645, 65490,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:81
//			AOG/PIP		# TO PIPUP TIME IN 2S.C AND SAVE.
// PORT: Fixed ROM slots 34646.
    34646, 3440,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:82
//CM/TRIO		STODL	24D
// PORT: Fixed ROM slots 34647.
    34647, 12338,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:83
//			25D		# AIG/PIP
// PORT: Fixed ROM slots 34648.
    34648, 52,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:84
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:85
//		RTB	PUSH		# TO PDL0
// PORT: Fixed ROM slots 34649.
    34649, 34360,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:86
//			CDULOGIC
// PORT: Fixed ROM slots 34650.
    34650, 38550,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:87
//		COS
// PORT: Fixed ROM slots 34651.
    34651, 65484,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:88
//		STODL	UBX/2		# CI /2
// PORT: Fixed ROM slots 34652.
    34652, 16104,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:89
//					# AIG/PIP FROM PDL 0
// PORT: SOURCE CM_BODY_ATTITUDE.agc:90
//		SIN	DCOMP
// PORT: Fixed ROM slots 34653.
    34653, 48860,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:91
//		STODL	UBX/2 +4	# -SI /2
// PORT: Fixed ROM slots 34654.
    34654, 16112,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:92
//			26D		# AMG/PIP
// PORT: Fixed ROM slots 34655.
    34655, 54,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:93
//		RTB	PUSH		# TO PDL 0
// PORT: Fixed ROM slots 34656.
    34656, 34360,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:94
//			CDULOGIC
// PORT: Fixed ROM slots 34657.
    34657, 38550,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:95
//		SIN	PDDL		# XCH PDL 0.  SAVE SM /2
// PORT: Fixed ROM slots 34658.
    34658, 54748,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:96
//		COS	PDDL		# CM /2 TO PDL 2
// PORT: Fixed ROM slots 34659.
    34659, 54732,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:97
//			0		# SM /2
// PORT: Fixed ROM slots 34660.
    34660, 2,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:98
//		DCOMP	VXSC
// PORT: Fixed ROM slots 34661.
    34661, 61820,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:99
//			UBX/2
// PORT: Fixed ROM slots 34662.
    34662, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:100
//		VSL1			# NOISE WONT OVFL.
// PORT: Fixed ROM slots 34663.
    34663, 65524,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:101
//		STODL	UBY/2		# =(-SMCI, NOISE, SMSI)/2
// PORT: Fixed ROM slots 34664.
    34664, 16116,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:102
//			2		# CM /2 REPLACES NOISE
// PORT: Fixed ROM slots 34665.
    34665, 6,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:103
//		STODL	UBY/2 +2	# UBY/2=(-SMCI, CM, SMSI)/2
// PORT: Fixed ROM slots 34666.
    34666, 16120,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:104
//			24D		# AOG/PIP
// PORT: Fixed ROM slots 34667.
    34667, 50,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:105
//		RTB	PUSH		# TO PDL 4
// PORT: Fixed ROM slots 34668.
    34668, 34360,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:106
//			CDULOGIC
// PORT: Fixed ROM slots 34669.
    34669, 38550,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:107
//		SIN	PDDL		# XCH PDL 4.  SAVE SO /2
// PORT: Fixed ROM slots 34670.
    34670, 54748,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:108
//		COS	VXSC		# CO /2
// PORT: Fixed ROM slots 34671.
    34671, 61900,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:109
//			UBY/2
// PORT: Fixed ROM slots 34672.
    34672, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:110
//		STODL	UBY/2		# UBY/2=(-COSMCI, COCM, COSMSI)/4
// PORT: Fixed ROM slots 34673.
    34673, 16116,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:111
//			4D		# SO /2
// PORT: Fixed ROM slots 34674.
    34674, 10,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:112
//		DMP	DCOMP
// PORT: Fixed ROM slots 34675.
    34675, 48650,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:113
//			UBX/2 +4	# -SI /2
// PORT: Fixed ROM slots 34676.
    34676, 3824,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:114
//		DAD
// PORT: Fixed ROM slots 34677.
    34677, 65306,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:115
//			UBY/2		# INCREMENT BY (SOSI /4)
// PORT: Fixed ROM slots 34678.
    34678, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:116
//		STODL	UBY/2
// PORT: Fixed ROM slots 34679.
    34679, 16116,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:117
//					# SO /2 FROM PDL 4
// PORT: SOURCE CM_BODY_ATTITUDE.agc:118
//		DMP	DAD
// PORT: Fixed ROM slots 34680.
    34680, 36106,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:119
//			UBX/2		# CI /2
// PORT: Fixed ROM slots 34681.
    34681, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:120
//			UBY/2 +4
// PORT: Fixed ROM slots 34682.
    34682, 3836,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:121
//		STOVL	UBY/2 +4	# YB/4				PLATFORM COORDS
// PORT: Fixed ROM slots 34683.
    34683, 24316,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:122
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:123
//				# YB = (-COSMCI + SOSI , COCM , COSMSI + SOCI )
// PORT: SOURCE CM_BODY_ATTITUDE.agc:124
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:125
//			UBY/2
// PORT: Fixed ROM slots 34684.
    34684, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:126
//		VXM	VSL2
// PORT: Fixed ROM slots 34685.
    34685, 60042,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:127
//			REFSMMAT	# .5 UNIT
// PORT: Fixed ROM slots 34686.
    34686, 1980,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:128
//		STODL	UBY/2		# YB/2 DONE			REF COORDS
// PORT: Fixed ROM slots 34687.
    34687, 16116,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:129
//# Page 885
// PORT: SOURCE CM_BODY_ATTITUDE.agc:130
//					# CM /2 FROM PDL 2
// PORT: SOURCE CM_BODY_ATTITUDE.agc:131
//		VXSC	VSL1
// PORT: Fixed ROM slots 34688.
    34688, 64226,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:132
//			UBX/2
// PORT: Fixed ROM slots 34689.
    34689, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:133
//		STODL	UBX/2		# =( CMCI, NOISE, -CMSI)/2
// PORT: Fixed ROM slots 34690.
    34690, 16104,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:134
//		STADR			# SM /2 FROM PDL 0
// PORT: Fixed ROM slots 34691.
    34691, 65324,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:135
//		STOVL	UBX/2 +2	# SM /2 REPLACES NOISE
// PORT: Fixed ROM slots 34692.
    34692, 41234,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:136
//			UBX/2		# XB/2				PLATFORM COORDS
// PORT: Fixed ROM slots 34693.
    34693, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:137
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:138
//				# XB = ( CMCI , SM , -CMSI )
// PORT: SOURCE CM_BODY_ATTITUDE.agc:139
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:140
//		VXM	VSL1
// PORT: Fixed ROM slots 34694.
    34694, 64138,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:141
//			REFSMMAT	# .5 UNIT
// PORT: Fixed ROM slots 34695.
    34695, 1980,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:142
//		STORE	UBX/2		# XB/2 DONE			REF COORDS
// PORT: Fixed ROM slots 34696.
    34696, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:143
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:144
//		VXV	VSL1
// PORT: Fixed ROM slots 34697.
    34697, 64058,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:145
//			UBY/2
// PORT: Fixed ROM slots 34698.
    34698, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:146
//		STOVL	UBZ/2		# ZB/2 DONE			REF COORDS
// PORT: Fixed ROM slots 34699.
    34699, 24320,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:147
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:148
//				# EQUIVALENT TO
// PORT: SOURCE CM_BODY_ATTITUDE.agc:149
//				# ZB = ( SOSMCI + COSI , -SOCM , -SOSMSI + COCI)
// PORT: SOURCE CM_BODY_ATTITUDE.agc:150
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:151
//			UXA/2		# -UVREL/2 = -UVA/2
// PORT: Fixed ROM slots 34700.
    34700, 3780,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:152
//		VXV	UNIT		# GET UNIT(-UVREL*UBY)/2 = UL/2
// PORT: Fixed ROM slots 34701.
    34701, 44602,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:153
//			UBY/2		# YB/2
// PORT: Fixed ROM slots 34702.
    34702, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:154
//		PUSH	DOT		# UL/2 TO PDL 0,5
// PORT: Fixed ROM slots 34703.
    34703, 41228,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:155
//			UZA/2		# UNA/2
// PORT: Fixed ROM slots 34704.
    34704, 3804,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:156
//		STOVL	COSTH		# COS(ROLL)/4
// PORT: Fixed ROM slots 34705.
    34705, 20514,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:157
//			0		# UL/2
// PORT: Fixed ROM slots 34706.
    34706, 2,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:158
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:159
//		DOT
// PORT: Fixed ROM slots 34707.
    34707, 65346,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:160
//			UYA/2
// PORT: Fixed ROM slots 34708.
    34708, 3792,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:161
//		STCALL	SINTH		# -SIN(ROLL)/4
// PORT: Fixed ROM slots 34709.
    34709, 28710,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:162
//			ARCTRIG
// PORT: Fixed ROM slots 34710.
    34710, 40284,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:163
//		STOVL	6D		# -(ROLL/180) /2
// PORT: Fixed ROM slots 34711.
    34711, 20494,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:164
//			UBY/2
// PORT: Fixed ROM slots 34712.
    34712, 3828,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:165
//		DOT	SL1		# -UVA.UBY = -SIN(BETA)
// PORT: Fixed ROM slots 34713.
    34713, 59970,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:166
//			UXA/2		# -UVREL/2
// PORT: Fixed ROM slots 34714.
    34714, 3780,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:167
//		ARCSIN
// PORT: Fixed ROM slots 34715.
    34715, 65468,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:168
//		STOVL	7D		# -(BETA/180) /2
// PORT: Fixed ROM slots 34716.
    34716, 20496,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:169
//			UBX/2		# XB/2
// PORT: Fixed ROM slots 34717.
    34717, 3816,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:170
//		DOT			# UL.UBX = -SIN(ALFA)
// PORT: Fixed ROM slots 34718.
    34718, 65346,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:171
//			0		# UL/2
// PORT: Fixed ROM slots 34719.
    34719, 2,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:172
//		STOVL	SINTH		# -SIN(ALFA)/4
// PORT: Fixed ROM slots 34720.
    34720, 20518,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:173
//		DOT			# UL/2 FROM PDL 0
// PORT: Fixed ROM slots 34721.
    34721, 65346
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:174
//			UBZ/2
// PORT: Fixed ROM slots 34722.
    34722, 3840,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:175
//		STCALL	COSTH		# COS(ALFA)/2
// PORT: Fixed ROM slots 34723.
    34723, 28706,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:176
//			ARCTRIG
// PORT: Fixed ROM slots 34724.
    34724, 40284,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:177
//		STOVL	8D		# -(ALFA/180) /2
// PORT: Fixed ROM slots 34725.
    34725, 20498,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:178
//			UNITR		# UR/2				REF COORDS
// PORT: Fixed ROM slots 34726.
    34726, 2016,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:179
//		DOT	SL1
// PORT: Fixed ROM slots 34727.
    34727, 59970,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:180
//# Page 886
// PORT: SOURCE CM_BODY_ATTITUDE.agc:181
//			UZA/2		# MORE ACCURATE AT LARGE ARG.
// PORT: Fixed ROM slots 34728.
    34728, 3804,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:182
//		ARCCOS
// PORT: Fixed ROM slots 34729.
    34729, 65452,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:183
//		STORE	10D		# (-GAMA/180)/2
// PORT: Fixed ROM slots 34730.
    34730, 22,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:184
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:185
//		TLOAD	EXIT		# ANGLES IN MPAC IN THE ORDER
// PORT: Fixed ROM slots 34731.
    34731, 65234,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:186
//					# -( (ROLL, BETA, ALFA) /180)/2
// PORT: SOURCE CM_BODY_ATTITUDE.agc:187
//			6D		# THESE VALUES CORRECT AT PIPUP TIME.
// PORT: Fixed ROM slots 34732.
    34732, 14
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34733–34735.
function agcAotUnit1964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34733 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:188
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:189
//# Page 887
// PORT: SOURCE CM_BODY_ATTITUDE.agc:190
//# BASIC SUBROUTINE TO UPDATE ATTITUDE ANGLES
// PORT: SOURCE CM_BODY_ATTITUDE.agc:191
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:192
//		EBANK=	AOG
// PORT: SOURCE CM_BODY_ATTITUDE.agc:193
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:194
//CM/ATUP		CA	EBAOG
// PORT: Fixed ROM slots 34733.
        if slot <> 34733 or instruction <> 14895 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2607), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34734 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:195
//		TS	EBANK
// PORT: Fixed ROM slots 34734.
            if slot <> 34734 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:196
//CMTR1		INDEX	FIXLOC
// PORT: Fixed ROM slots 34735.
            if slot <> 34735 or instruction <> 20560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1964] to agcAotUnit1964@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:197
//		CS	10D		# (GAMA/180)/2
// PORT: Fixed ROM slots 34736.
    34736, 32788
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34737–34794.
function agcAotUnit1965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34765 {
        if slot <= 34750 {
            if slot <= 34743 {
                if slot <= 34739 {
                    if slot <= 34737 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:198
//		XCH	GAMA
// PORT: Fixed ROM slots 34737.
                        if slot <> 34737 or instruction <> 24530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 978, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34738 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:199
//		TS	L
// PORT: Fixed ROM slots 34738.
                            if slot <> 34738 or instruction <> 22529 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22529, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:200
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:201
//		INHINT
// PORT: Fixed ROM slots 34739.
                            if slot <> 34739 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34741 {
                        if slot <= 34740 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:202
//				# MUST REMAIN INHINTED UNTIL UPDATE OF BODY
// PORT: SOURCE CM_BODY_ATTITUDE.agc:203
//				# ANGLES, SO THAT GAMDIFSW IS VALID FIRST PASS
// PORT: SOURCE CM_BODY_ATTITUDE.agc:204
//				# INDICATOR.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:205
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:206
//		CS	CM/FLAGS
// PORT: Fixed ROM slots 34740.
                            if slot <> 34740 or instruction <> 16450 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 66).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:207
//		MASK	BIT11		# GAMDIFSW=94D BIT11	INITLY=0
// PORT: Fixed ROM slots 34741.
                            if slot <> 34741 or instruction <> 31237 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                if fixedOperand = 1024 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34742 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:208
//		EXTEND			# DONT CALC GAMA DOT UNTIL HAVE FORMD
// PORT: Fixed ROM slots 34742.
                            if slot <> 34742 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:209
//					# ONE DIFFERENCE.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:210
//		BZF	DOGAMDOT	# IS OK, GO ON.
// PORT: Fixed ROM slots 34743.
                            if slot <> 34743 or instruction <> 6074 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6074, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34746 {
                    if slot <= 34744 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:211
//		ADS	CM/FLAGS	# KNOW BIT IS 0
// PORT: Fixed ROM slots 34744.
                        if slot <> 34744 or instruction <> 11330 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34745 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:212
//		TC	NOGAMDOT	# SET GAMDOT = 0
// PORT: Fixed ROM slots 34745.
                            if slot <> 34745 or instruction <> 1989 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1989, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:213
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:214
//DOGAMDOT	CS	L
// PORT: Fixed ROM slots 34746.
                            if slot <> 34746 or instruction <> 16385 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 1).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34748 {
                        if slot <= 34747 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:215
//		AD	GAMA		# DEL GAMA/360= T GAMDOT/360
// PORT: Fixed ROM slots 34747.
                            if slot <> 34747 or instruction <> 25554 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 978).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:216
//		EXTEND
// PORT: Fixed ROM slots 34748.
                            if slot <> 34748 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34749 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:217
//		MP	TCDU		# TCDU = .1 SEC, T = 2 SEC.
// PORT: Fixed ROM slots 34749.
                            if slot <> 34749 or instruction <> 30712 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2040, readEffective:call(words, 2040)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:218
//		TS	GAMDOT		# GAMA DOT TCDU / 180
// PORT: Fixed ROM slots 34750.
                            if slot <> 34750 or instruction <> 23507 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23507, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34757 {
                if slot <= 34753 {
                    if slot <= 34751 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:219
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:220
//		EXTEND			# IGNORE GAMDOT IF LEQ .5 DEG/SEC
// PORT: Fixed ROM slots 34751.
                        if slot <> 34751 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34752 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:221
//		BZMF	+2
// PORT: Fixed ROM slots 34752.
                            if slot <> 34752 or instruction <> 26562 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26562, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:222
//		COM
// PORT: Fixed ROM slots 34753.
                            if slot <> 34753 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34755 {
                        if slot <= 34754 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:223
//		AD	FIVE
// PORT: Fixed ROM slots 34754.
                            if slot <> 34754 or instruction <> 27154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:224
//		EXTEND
// PORT: Fixed ROM slots 34755.
                            if slot <> 34755 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34756 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:225
//		BZMF	+3		# SET GAMDOT=+0 AS TAG IF TOO SMALL.
// PORT: Fixed ROM slots 34756.
                            if slot <> 34756 or instruction <> 26567 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26567, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:226
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:227
//NOGAMDOT	CA	ZERO		# COME HERE INHINTED.
// PORT: Fixed ROM slots 34757.
                            if slot <> 34757 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34761 {
                    if slot <= 34759 {
                        if slot <= 34758 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:228
//		TS	GAMDOT
// PORT: Fixed ROM slots 34758.
                            if slot <> 34758 or instruction <> 23507 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23507, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:229
//					# FOR NOW LEAVE IN 2S.C
// PORT: SOURCE CM_BODY_ATTITUDE.agc:230
//					# UPDATE ANGLES BY CORRECTING EUILER ANG
// PORT: SOURCE CM_BODY_ATTITUDE.agc:231
//					# FOR ACCRUED INCREMENT SINCE PIPUP
// PORT: SOURCE CM_BODY_ATTITUDE.agc:232
//					# R = R EUIL + R(NOW) -R(PIPUP)
// PORT: SOURCE CM_BODY_ATTITUDE.agc:233
//		CS	MPAC		# GET (R EUL/180) /2
// PORT: Fixed ROM slots 34759.
                            if slot <> 34759 or instruction <> 16492 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 108).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34760 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:234
//		DOUBLE			# POSSIBLE OVERFLOW
// PORT: Fixed ROM slots 34760.
                            if slot <> 34760 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:235
//		TC	CORANGOV	# CORRECT FOR OVFL IF ANY
// PORT: Fixed ROM slots 34761.
                            if slot <> 34761 or instruction <> 2032 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2032, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34763 {
                        if slot <= 34762 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:236
//		EXTEND
// PORT: Fixed ROM slots 34762.
                            if slot <> 34762 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:237
//		SU	ROLL/PIP	# GET INCR SINCE PIPUP
// PORT: Fixed ROM slots 34763.
                            if slot <> 34763 or instruction <> 25530 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 954).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34764 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:238
//		AD	ROLL/180	# ONLY SINGLE OVFL POSSIBLE.
// PORT: Fixed ROM slots 34764.
                            if slot <> 34764 or instruction <> 25524 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 948).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:239
//		TC	CORANGOV	# CORRECT FOR OVFL IF ANY
// PORT: Fixed ROM slots 34765.
                            if slot <> 34765 or instruction <> 2032 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2032, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 34779 {
            if slot <= 34772 {
                if slot <= 34768 {
                    if slot <= 34766 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:240
//# Page 888
// PORT: SOURCE CM_BODY_ATTITUDE.agc:241
//		TS	TEMPROLL
// PORT: Fixed ROM slots 34766.
                        if slot <> 34766 or instruction <> 23544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34767 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:242
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:243
//		CS	MPAC +2		# GET (ALFA EUL/180) /2
// PORT: Fixed ROM slots 34767.
                            if slot <> 34767 or instruction <> 16494 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 110).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:244
//		DOUBLE			# SAME AS FOR ROLL.  NEEDED FOR EXT ATM DAP
// PORT: Fixed ROM slots 34768.
                            if slot <> 34768 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34770 {
                        if slot <= 34769 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:245
//		TC	CORANGOV	# CORRECT FOR OVFL IF ANY
// PORT: Fixed ROM slots 34769.
                            if slot <> 34769 or instruction <> 2032 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2032, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:246
//		EXTEND
// PORT: Fixed ROM slots 34770.
                            if slot <> 34770 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34771 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:247
//		SU	ALFA/PIP
// PORT: Fixed ROM slots 34771.
                            if slot <> 34771 or instruction <> 25531 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 955).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:248
//		AD	ALFA/180
// PORT: Fixed ROM slots 34772.
                            if slot <> 34772 or instruction <> 25525 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 949).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34775 {
                    if slot <= 34773 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:249
//		TC	CORANGOV	# CORRECT FOR OVFL IF ANY
// PORT: Fixed ROM slots 34773.
                        if slot <> 34773 or instruction <> 2032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34774 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:250
//		TS	TEMPALFA
// PORT: Fixed ROM slots 34774.
                            if slot <> 34774 or instruction <> 23545 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23545, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:251
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:252
//		CS	MPAC +1		# GET (BETA EUL/180) /2
// PORT: Fixed ROM slots 34775.
                            if slot <> 34775 or instruction <> 16493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 109).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34777 {
                        if slot <= 34776 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:253
//CMTR2		DOUBLE
// PORT: Fixed ROM slots 34776.
                            if slot <> 34776 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:254
//		EXTEND
// PORT: Fixed ROM slots 34777.
                            if slot <> 34777 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34778 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:255
//		SU	BETA/PIP
// PORT: Fixed ROM slots 34778.
                            if slot <> 34778 or instruction <> 25532 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 956).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:256
//		AD	BETA/180
// PORT: Fixed ROM slots 34779.
                            if slot <> 34779 or instruction <> 25526 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 950).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 34786 {
                if slot <= 34782 {
                    if slot <= 34780 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:257
//		XCH	TEMPBETA	# OVFL NOT EXPECTED.
// PORT: Fixed ROM slots 34780.
                        if slot <> 34780 or instruction <> 24570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1018, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 34781 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:258
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:259
//		CA	EBANK3
// PORT: Fixed ROM slots 34781.
                            if slot <> 34781 or instruction <> 14889 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:260
//		TS	EBANK
// PORT: Fixed ROM slots 34782.
                            if slot <> 34782 or instruction <> 22531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34784 {
                        if slot <= 34783 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:261
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:262
//		EBANK=	PHSNAME5
// PORT: SOURCE CM_BODY_ATTITUDE.agc:263
//		EXTEND
// PORT: Fixed ROM slots 34783.
                            if slot <> 34783 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:264
//		DCA	REPOSADR	# THIS ASSUMES THAT THE		TC  PHASCHNG
// PORT: Fixed ROM slots 34784.
                            if slot <> 34784 or instruction <> 14330 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 2042, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34785 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:265
//		DXCH	PHSNAME5	# IS NOT CHANGED IN		OCT 10035
// PORT: Fixed ROM slots 34785.
                            if slot <> 34785 or instruction <> 22311 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 807, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:266
//					# SERVICER.
// PORT: SOURCE CM_BODY_ATTITUDE.agc:267
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:268
//		CA	EBAOG
// PORT: Fixed ROM slots 34786.
                            if slot <> 34786 or instruction <> 14895 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 34790 {
                    if slot <= 34788 {
                        if slot <= 34787 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:269
//		TS	EBANK
// PORT: Fixed ROM slots 34787.
                            if slot <> 34787 or instruction <> 22531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:270
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:271
//		EBANK=	AOG
// PORT: SOURCE CM_BODY_ATTITUDE.agc:272
//REDOPOSE	EXTEND			# RE-STARTS COME HERE
// PORT: Fixed ROM slots 34788.
                            if slot <> 34788 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34789 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:273
//		DCA	TEMPROLL
// PORT: Fixed ROM slots 34789.
                            if slot <> 34789 or instruction <> 13305 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1017, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:274
//		DXCH	ROLL/180
// PORT: Fixed ROM slots 34790.
                            if slot <> 34790 or instruction <> 22453 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 949, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 34792 {
                        if slot <= 34791 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:275
//		CA	TEMPBETA
// PORT: Fixed ROM slots 34791.
                            if slot <> 34791 or instruction <> 13306 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1018).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:276
//		TS	BETA/180
// PORT: Fixed ROM slots 34792.
                            if slot <> 34792 or instruction <> 23478 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 34793 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:277
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:278
//		RELINT
// PORT: Fixed ROM slots 34793.
                            if slot <> 34793 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:279
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:280
//		TC	INTPRET		# CANT TC DANZIG AFTER PHASCHNG.
// PORT: Fixed ROM slots 34794.
                            if slot <> 34794 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1965] to agcAotUnit1965@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:281
//CM/POSE3	VLOAD	ABVAL		# RETURN FROM CM/ATUP.	(RESTART)
// PORT: Fixed ROM slots 34795.
    34795, 42746,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:282
//			VN		# 2(-7) M/CS
// PORT: Fixed ROM slots 34796.
    34796, 1278,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:283
//		STORE	VMAGI		# FOR DISPLAY ON CALL.
// PORT: Fixed ROM slots 34797.
    34797, 4006,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:284
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:285
//		GOTO
// PORT: Fixed ROM slots 34798.
    34798, 65360,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:286
//			POSEXIT		# ENDEXIT, STARTENT, OR SCALEPOP.
// PORT: Fixed ROM slots 34799.
    34799, 3496
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34800–34802.
function agcAotUnit1966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34800 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:287
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:288
//CORANGOV	TS	L
// PORT: Fixed ROM slots 34800.
        if slot <> 34800 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34801 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:289
//		TC	Q
// PORT: Fixed ROM slots 34801.
            if slot <> 34801 or instruction <> 2 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:290
//		INDEX	A
// PORT: Fixed ROM slots 34802.
            if slot <> 34802 or instruction <> 20480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1966] to agcAotUnit1966@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:291
//# Page 889
// PORT: SOURCE CM_BODY_ATTITUDE.agc:292
//		CA	LIMITS
// PORT: Fixed ROM slots 34803.
    34803, 29696
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34804–34805.
function agcAotUnit1967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34804 {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:293
//		ADS	L
// PORT: Fixed ROM slots 34804.
        if slot <> 34804 or instruction <> 11265 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 1).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE CM_BODY_ATTITUDE.agc:294
//		TC	Q		# COSTS 2 MCT TO USE.  SEE ANGOVCOR.
// PORT: Fixed ROM slots 34805.
        if slot <> 34805 or instruction <> 2 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1967] to agcAotUnit1967@.

agcAotInstallSourceRope(list(
// PORT: SOURCE CM_BODY_ATTITUDE.agc:295
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:296
//-KVSCALE	2DEC	-.81491944	# -12800/(2 VS .3048)
// PORT: Fixed ROM slots 34806 34807.
    34806, 38832, 34807, 44560,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:297
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:298
//TCDU		DEC	.1		# TCDU = .1 SEC.
// PORT: Fixed ROM slots 34808.
    34808, 3276,
// PORT: SOURCE CM_BODY_ATTITUDE.agc:299
//
// PORT: SOURCE CM_BODY_ATTITUDE.agc:300
//		EBANK=	AOG
// PORT: SOURCE CM_BODY_ATTITUDE.agc:301
//REPOSADR	2CADR	REDOPOSE
// PORT: Fixed ROM slots 34809 34810.
    34809, 4040, 34810, 63596
)).

