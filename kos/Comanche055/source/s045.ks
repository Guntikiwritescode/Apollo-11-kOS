// P37_P70.agc
// bank 36, slots 33078-33078
function agcAotUnit1856 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:1
//# Copyright:	Public domain.
// P37_P70.agc:2
//# Filename:	P37_P70.agc
// P37_P70.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// P37_P70.agc:4
//#		It is part of the source code for the Command Module's (CM)
// P37_P70.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P37_P70.agc:6
//# Assembler:	yaYUL
// P37_P70.agc:7
//# Contact:	Lawton Kerman <jim.lawton@gmail.com>.
// P37_P70.agc:8
//# Website:	www.ibiblio.org/apollo.
// P37_P70.agc:9
//# Pages:	890-933
// P37_P70.agc:10
//# Mod history:	2009-05-11 JVL	Adapted from the Colossus249/ file
// P37_P70.agc:11
//#				of the same name, using Comanche055 page
// P37_P70.agc:12
//#				images.
// P37_P70.agc:13
//#		2009-05-20 RSB	Added missing label V2T179.  Fixed POODOO -> POODOO.
// P37_P70.agc:14
//#		2009-05-23 RSB	In RTD18, corrected a STOVL DELVLVC to
// P37_P70.agc:15
//#				STODL DELVLVC and a STODL 02D to STORE 02D.
// P37_P70.agc:16
//#
// P37_P70.agc:17
//# This source code has been transcribed or otherwise adapted from digitized
// P37_P70.agc:18
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// P37_P70.agc:19
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// P37_P70.agc:20
//# thanks to both.  The images (with suitable reduction in storage size and
// P37_P70.agc:21
//# consequent reduction in image quality as well) are available online at
// P37_P70.agc:22
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// P37_P70.agc:23
//# illegible, contact me at info@sandroid.org about getting access to the
// P37_P70.agc:24
//# (much) higher-quality images which Fjeld Kerman actually created.
// P37_P70.agc:25
//#
// P37_P70.agc:26
//# Notations on the hardcopy document read, in part:
// P37_P70.agc:27
//#
// P37_P70.agc:28
//#    Assemble revision 055 of AGC program Comanche by NASA
// P37_P70.agc:29
//#    2021113-051.  10:28 APR. 1, 1969
// P37_P70.agc:30
//#
// P37_P70.agc:31
//#    This AGC program shall also be referred to as
// P37_P70.agc:32
//#            Colossus 2A
// P37_P70.agc:33
//
// P37_P70.agc:34
//# Page 890
// P37_P70.agc:35
//		BANK	31
// P37_P70.agc:36
//		SETLOC	RTE1
// P37_P70.agc:37
//		BANK
// P37_P70.agc:38
//
// P37_P70.agc:39
//		EBANK=	RTEDVD
// P37_P70.agc:40
//		COUNT	31/P37
// P37_P70.agc:41
//
// P37_P70.agc:42
//# PROGRAM DESCRIPTION:  P37, RETURN TO KERBIN
// P37_P70.agc:43
//#
// P37_P70.agc:44
//# DESCRIPTION
// P37_P70.agc:45
//#	A RETURN TO KERBIN TRAJECTORY IS COMPUTED PROVIDED THE CSM IS OUTSIDE THE MUN SPHERE OF INFLUENCE AT THE
// P37_P70.agc:46
//#	TIME OF IGNITION.  INITIALLY A CONIC TRAJECTORY IS DETERMINED AND RESULTING IGNITION AND REENTRY PARAMETERS ARE
// P37_P70.agc:47
//# 	DISPLAYED TO VAL.  THEN IF VAL SO DESIRES, A PRECISION TRAJECTORY IS DETERMINED WITH THE
// P37_P70.agc:48
//# 	RESULTING IGNITION AND REENTRY PARAMETERS DISPLAYED.  UPON FINAL ACCEPTANCE BY VAL, THE PROGRAM
// P37_P70.agc:49
//# 	COMPUTES AND STORES THE TARGET PARAMETERS FOR RETURN TO KERBIN FOR USE BY SPS PROGRAM (P40) OR RCS PROGRAM (P41).
// P37_P70.agc:50
//#
// P37_P70.agc:51
//# CALLING SEQUENCE
// P37_P70.agc:52
//#	L	TC	P37
// P37_P70.agc:53
//#
// P37_P70.agc:54
//# SUBROUTINES CALLED
// P37_P70.agc:55
//#	PREC100
// P37_P70.agc:56
//#		V2T100
// P37_P70.agc:57
//#		RTENCK2
// P37_P70.agc:58
//#		RTENCK3
// P37_P70.agc:59
//#		TIMERAD
// P37_P70.agc:60
//#		PARAM
// P37_P70.agc:61
//#	V2T100
// P37_P70.agc:62
//#		GAMDV10
// P37_P70.agc:63
//#		XT1LIM
// P37_P70.agc:64
//#		DVCALC
// P37_P70.agc:65
//#	RTENCK1
// P37_P70.agc:66
//#		INTSTALL
// P37_P70.agc:67
//#		INTEGRVS
// P37_P70.agc:68
//#	RTEVN
// P37_P70.agc:69
//#		RTEDISP
// P37_P70.agc:70
//#		TMRAD100
// P37_P70.agc:71
//#		AUGEKUGL
// P37_P70.agc:72
//#		LAT-LONG
// P37_P70.agc:73
//#	TMRAD100
// P37_P70.agc:74
//#		TIMERAD
// P37_P70.agc:75
//#	INVC100
// P37_P70.agc:76
//#		CSMPREC
// P37_P70.agc:77
//#	GETERAD
// P37_P70.agc:78
//#	TIMETHET
// P37_P70.agc:79
//#	P370ALRM
// P37_P70.agc:80
//#	VN1645
// P37_P70.agc:81
//#	POLY
// P37_P70.agc:82
//#
// P37_P70.agc:83
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:84
//#	CSM STATE VECTOR
// P37_P70.agc:85
//# Page 891
// P37_P70.agc:86
//#	NJETSFLG	NUMBER OF JETS IF THE RCS PROPULSION SYSTEM SELECTED	STATE FLAG	0=4 JETS  1=2 JETS
// P37_P70.agc:87
//#
// P37_P70.agc:88
//# VAL INPUT
// P37_P70.agc:89
//#	SPRTETIG	TIME OF IGNITION (OVERLAYS TIG)				DP	B28	CS
// P37_P70.agc:90
//#	VPRED		DESIRED CHANGE IN VELOCITY AT TIG(PROGRM COMPUTED IF 0)	DP	B7	METERS/CS
// P37_P70.agc:91
//#	GAMMAEI		DESIRED FLIGHT PATH ANGLE AT REENTRY (COMPUTED IF 0)	DP	B0	REVS + ABOVE HORIZ.
// P37_P70.agc:92
//#	OPTION2		PROPULSION SYSTEM OPTION				SP	B14	1=SPS, 2=RCS
// P37_P70.agc:93
//#
// P37_P70.agc:94
//# OUTPUT
// P37_P70.agc:95
//#    CONIC OR PRECISION TRAJECTORY DISPLAY
// P37_P70.agc:96
//#	VPRED	 	VELOCITY MAGNITUDE AT 400,000 FT. ENTRY ALTITUDE	DP	B7	METERS/CS
// P37_P70.agc:97
//#	T3TOT4		TRANSIT TIME TO 400,000 FT. ENTRY ALTITUDE		DP	B28	CS
// P37_P70.agc:98
//#	GAMMAEI		FLIGHT PATH ANGLE AT 400,00 FT. ENTRY ALTITUDE		DP	B0	REVS + ABOVE HORIZON
// P37_P70.agc:99
//#	DELVLVC		INITIAL VELOCITY CHANGE VECTOR IN LOCAL VERTICAL COORD.	VECTOR	B7	METERS/CS
// P37_P70.agc:100
//#	LAT(SPL)	LATITUDE OF THE LANDING SITE				DP	B0	REVS
// P37_P70.agc:101
//#	LNG(SPL)	LONGITUDE OF THE LANDING SITE				DP	B0	REVS
// P37_P70.agc:102
//#    TARGETING COMPUTATION DISPLAY
// P37_P70.agc:103
//#	TIG		RECOMPUTED TIG BASED ON THRUST OPTION			DP	B28	CS
// P37_P70.agc:104
//#	TTOGO		TIME FROM TIG						DP	B28	CS
// P37_P70.agc:105
//#	+MGA		POSITIVE MIDDLE GIMBAL ANGLE				DP	B0	REVS -.02 IF REFSMFLG=0
// P37_P70.agc:106
//#    THRUST PROGRAM COMMUNICATION
// P37_P70.agc:107
//#	XDELVFLG	EXTERNAL DELTA V FLAG					STATE	FLAG	SET 0 FOR LAMBERT AIMPT
// P37_P70.agc:108
//#	NORMSW		LAMBERT AIMPT ROTATION SWITCH				STATE	FLAG	SET 0 FOR NO ROTATION
// P37_P70.agc:109
//#	ECSTEER		CROSS PRODUCT STEERING CONSTANT				SP	B2	SET 1
// P37_P70.agc:110
//#	RTARG		CONICALLY INTEGRATED REENTRY POSITION VECTOR		VECTOR	B29	METERS
// P37_P70.agc:111
//#	TPASS4		REENTRY TIME						DP	B28	CS
// P37_P70.agc:112
//
// P37_P70.agc:113
//P37		TC	PHASCHNG	# P37 IS NOT RESTARTABLE
// slot 33078
    if slot <> 33078 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1856] to agcAotUnit1856@.

agcAotInstallSourceRope(list(
// P37_P70.agc:114
//		OCT	4
// slot 33079
    33079, 8
)).

// bank 36, slots 33080-33080
function agcAotUnit1857 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:115
//
// P37_P70.agc:116
//		TC	INTPRET
// slot 33080
    if slot <> 33080 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1857] to agcAotUnit1857@.

agcAotInstallSourceRope(list(
// P37_P70.agc:117
//		AXT,1	SXA,1
// slot 33081
    33081, 55536,
// P37_P70.agc:118
//		OCT	04000
// slot 33082
    33082, 4096,
// P37_P70.agc:119
//			ECSTEER
// slot 33083
    33083, 3624,
// P37_P70.agc:120
//		DLOAD
// slot 33084
    33084, 65482,
// P37_P70.agc:121
//			ZEROVECS
// slot 33085
    33085, 13754,
// P37_P70.agc:122
//		STORE	VPRED
// slot 33086
    33086, 4078,
// P37_P70.agc:123
//		STORE	GAMMAEI
// slot 33087
    33087, 4082,
// P37_P70.agc:124
//		EXIT
// slot 33088
    33088, 65532
)).

// bank 36, slots 33089-33095
function agcAotUnit1858 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33091 {
        if slot <= 33089 {
// P37_P70.agc:125
//		CAF	V6N33RTE	# INPUT TIG	STORED IN SPRTETIG
// slot 33089
            if slot <> 33089 or instruction <> 13990 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1702), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33090 {
// P37_P70.agc:126
//		TCR	P370GOF		#		OVERLAYED WITH TIG
// slot 33090
                if slot <> 33090 or instruction <> 1693 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1693, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:127
//		TCF	-2		# DISPLAY NEW DATA
// slot 33091
                if slot <> 33091 or instruction <> 5441 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5441, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33093 {
            if slot <= 33092 {
// P37_P70.agc:128
//		CAF	V6N60RTE	# INPUT REENTRY ANGLE IN GAMMAEI
// slot 33092
                if slot <> 33092 or instruction <> 13994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1706), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:129
//		TCR	P37GFRB1	#	AND DESIRED DELTA V IN RTEDVD
// slot 33093
                if slot <> 33093 or instruction <> 1673 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1673, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33094 {
// P37_P70.agc:130
//		TCF	-2		# DISPLAY NEW DATA
// slot 33094
                if slot <> 33094 or instruction <> 5444 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5444, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:131
//RTE299		TC	INTPRET
// slot 33095
                if slot <> 33095 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1858] to agcAotUnit1858@.

agcAotInstallSourceRope(list(
// P37_P70.agc:132
//		SSP	DLOAD
// slot 33096
    33096, 58802,
// P37_P70.agc:133
//			OVFIND
// slot 33097
    33097, 164,
// P37_P70.agc:134
//			0
// slot 33098
    33098, 0,
// P37_P70.agc:135
//			VPRED
// slot 33099
    33099, 4078,
// P37_P70.agc:136
//# Page 892
// P37_P70.agc:137
//		STODL	RTEDVD
// slot 33100
    33100, 16180,
// P37_P70.agc:138
//			GAMMAEI
// slot 33101
    33101, 4082,
// P37_P70.agc:139
//		STODL	RTEGAM2D
// slot 33102
    33102, 16184,
// P37_P70.agc:140
//			1RTEB13
// slot 33103
    33103, 28312,
// P37_P70.agc:141
//		STODL	CONICX1
// slot 33104
    33104, 16314,
// P37_P70.agc:142
//			C4RTE
// slot 33105
    33105, 28448,
// P37_P70.agc:143
//		STCALL	MAMAX1
// slot 33106
    33106, 32596,
// P37_P70.agc:144
//			INVC100		# GET R(T1)/,V(T1)/,UR1/,UH/
// slot 33107
    33107, 53840,
// P37_P70.agc:145
//		CLEAR	DLOAD
// slot 33108
    33108, 58648,
// P37_P70.agc:146
//			SLOWFLG
// slot 33109
    33109, 2916,
// P37_P70.agc:147
//			RTEDVD
// slot 33110
    33110, 3892,
// P37_P70.agc:148
//		BPL	ABS
// slot 33111
    33111, 42568,
// P37_P70.agc:149
//			RTE317
// slot 33112
    33112, 62144,
// P37_P70.agc:150
//		STORE	RTEDVD
// slot 33113
    33113, 3892,
// P37_P70.agc:151
//		DLOAD	DSU
// slot 33114
    33114, 38346,
// P37_P70.agc:152
//			R(T1)
// slot 33115
    33115, 3916,
// P37_P70.agc:153
//			K1RTE
// slot 33116
    33116, 28452,
// P37_P70.agc:154
//		BMN	SET
// slot 33117
    33117, 35904,
// P37_P70.agc:155
//			RTE317
// slot 33118
    33118, 62144,
// P37_P70.agc:156
//			SLOWFLG
// slot 33119
    33119, 2660,
// P37_P70.agc:157
//RTE317		DLOAD	EXIT
// slot 33120
    33120, 65226,
// P37_P70.agc:158
//			R(T1)
// slot 33121
    33121, 3916
)).

// bank 36, slots 33122-33122
function agcAotUnit1859 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:159
//		TC	POLY
// slot 33122
    if slot <> 33122 or instruction <> 3705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1859] to agcAotUnit1859@.

agcAotInstallSourceRope(list(
// P37_P70.agc:160
//		DEC	2
// slot 33123
    33123, 4,
// P37_P70.agc:161
//		2DEC	181000434. B-31
// slot 33124 33125
    33124, 2760, 33125, 30268,
// P37_P70.agc:162
//		2DEC	1.50785145 B-2
// slot 33126 33127
    33126, 12352, 33127, 5228,
// P37_P70.agc:163
//		2DEC*	-6.49993057 E-9 B27*
// slot 33128 33129
    33128, 36948, 33129, 49200,
// P37_P70.agc:164
//		2DEC*	9.76938926 E-18 B56*
// slot 33130 33131
    33130, 23066, 33131, 21598
)).

// bank 36, slots 33132-33132
function agcAotUnit1860 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:165
//		TC	INTPRET
// slot 33132
    if slot <> 33132 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1860] to agcAotUnit1860@.

agcAotInstallSourceRope(list(
// P37_P70.agc:166
//		SL1
// slot 33133
    33133, 65492,
// P37_P70.agc:167
//		STODL	MAMAX2		# C0+C1*R+C2*R**2+C3*R**3=MAMAX2 B30
// slot 33134
    33134, 16216,
// P37_P70.agc:168
//			M9RTEB28
// slot 33135
    33135, 28360,
// P37_P70.agc:169
//		STODL	NN1A
// slot 33136
    33136, 16304,
// P37_P70.agc:170
//			K2RTE
// slot 33137
    33137, 28456,
// P37_P70.agc:171
//RTE320		STODL	RCON		# RCON=K2
// slot 33138
    33138, 16188,
// P37_P70.agc:172
//			RTEGAM2D
// slot 33139
    33139, 3896,
// P37_P70.agc:173
//		BZE	BDSU
// slot 33140
    33140, 37208,
// P37_P70.agc:174
//			RTE340		# GOTORTE340 IF REENTRY ANGLE NOT INPUT
// slot 33141
    33141, 62200,
// P37_P70.agc:175
//			1RTEB2
// slot 33142
    33142, 28292,
// P37_P70.agc:176
//		PUSH	COS		#					PL02D
// slot 33143
    33143, 58892,
// P37_P70.agc:177
//		PDDL	SIN
// slot 33144
    33144, 61098,
// P37_P70.agc:178
//		BDDV	STADR		#					PL00D
// slot 33145
    33145, 38506,
// P37_P70.agc:179
//		STCALL	X(T2)		# X(T2)=COT(GAM2D)			B0
// slot 33146
    33146, 32850,
// P37_P70.agc:180
//			RTE360
// slot 33147
    33147, 62222,
// P37_P70.agc:181
//RTE340		DLOAD	DSU
// slot 33148
    33148, 38346,
// P37_P70.agc:182
//			R(T1)
// slot 33149
    33149, 3916,
// P37_P70.agc:183
//# Page 893
// P37_P70.agc:184
//			K1RTE
// slot 33150
    33150, 28452,
// P37_P70.agc:185
//		BMN	DLOAD
// slot 33151
    33151, 58688,
// P37_P70.agc:186
//			RTE350
// slot 33152
    33152, 62216,
// P37_P70.agc:187
//			K4RTE
// slot 33153
    33153, 28464,
// P37_P70.agc:188
//		STCALL	X(T2)		# X(T2)=K4
// slot 33154
    33154, 32684,
// P37_P70.agc:189
//			RTE360
// slot 33155
    33155, 62222,
// P37_P70.agc:190
//RTE350		DLOAD
// slot 33156
    33156, 65482,
// P37_P70.agc:191
//			K3RTE
// slot 33157
    33157, 28460,
// P37_P70.agc:192
//		STORE	X(T2)		# X(T2)=K3
// slot 33158
    33158, 4012,
// P37_P70.agc:193
//RTE360		CALL
// slot 33159
    33159, 65320,
// P37_P70.agc:194
//			V2T100
// slot 33160
    33160, 54394,
// P37_P70.agc:195
//		BZE	GOTO
// slot 33161
    33161, 43096,
// P37_P70.agc:196
//			RTE367
// slot 33162
    33162, 62232,
// P37_P70.agc:197
//			RTEALRM
// slot 33163
    33163, 62460,
// P37_P70.agc:198
//RTE367		VLOAD
// slot 33164
    33164, 65530,
// P37_P70.agc:199
//			R(T1)/
// slot 33165
    33165, 3904,
// P37_P70.agc:200
//		STODL	RVEC
// slot 33166
    33166, 15198,
// P37_P70.agc:201
//			RCON
// slot 33167
    33167, 3900,
// P37_P70.agc:202
//		STOVL	RDESIRED
// slot 33168
    33168, 23520,
// P37_P70.agc:203
//			V2(T1)/
// slot 33169
    33169, 3968,
// P37_P70.agc:204
//		STCALL	VVEC
// slot 33170
    33170, 31692,
// P37_P70.agc:205
//			TMRAD100
// slot 33171
    33171, 53630,
// P37_P70.agc:206
//		DAD
// slot 33172
    33172, 65306,
// P37_P70.agc:207
//			T1
// slot 33173
    33173, 3996,
// P37_P70.agc:208
//		STODL	T2
// slot 33174
    33174, 16316,
// P37_P70.agc:209
//			RTEGAM2D
// slot 33175
    33175, 3896,
// P37_P70.agc:210
//		BZE	GOTO
// slot 33176
    33176, 43096,
// P37_P70.agc:211
//			RTE369
// slot 33177
    33177, 62262,
// P37_P70.agc:212
//			RTE372
// slot 33178
    33178, 62298,
// P37_P70.agc:213
//RTE369		VLOAD	ABVAL
// slot 33179
    33179, 42746,
// P37_P70.agc:214
//			V(T2)/
// slot 33180
    33180, 3984,
// P37_P70.agc:215
//		EXIT
// slot 33181
    33181, 65532
)).

// bank 36, slots 33182-33182
function agcAotUnit1861 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:216
//		TC	POLY
// slot 33182
    if slot <> 33182 or instruction <> 3705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1861] to agcAotUnit1861@.

agcAotInstallSourceRope(list(
// P37_P70.agc:217
//		DEC	2
// slot 33183
    33183, 4,
// P37_P70.agc:218
//		2DEC	0
// slot 33184 33185
    33184, 0, 33185, 0,
// P37_P70.agc:219
//		2DEC	-4.8760771 E-2 B4
// slot 33186 33187
    33186, 39970, 33187, 54276,
// P37_P70.agc:220
//		2DEC	4.5419476 E-4 B11
// slot 33188 33189
    33188, 30480, 33189, 8100,
// P37_P70.agc:221
//		2DEC	-1.4317675 E-6 B18
// slot 33190 33191
    33190, 53236, 33191, 52604
)).

// bank 36, slots 33192-33192
function agcAotUnit1862 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:222
//
// P37_P70.agc:223
//		TC	INTPRET
// slot 33192
    if slot <> 33192 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1862] to agcAotUnit1862@.

agcAotInstallSourceRope(list(
// P37_P70.agc:224
//		DAD
// slot 33193
    33193, 65306,
// P37_P70.agc:225
//			RTED1
// slot 33194
    33194, 1492,
// P37_P70.agc:226
//		SL3	GOTO		# X(T2),=D1+D2V2+D3V2**2+D4V2**3
// slot 33195
    33195, 43092,
// P37_P70.agc:227
//			RTE373
// slot 33196
    33196, 62302,
// P37_P70.agc:228
//RTE372		DLOAD			# X(T2),=X(T2)
// slot 33197
    33197, 65482,
// P37_P70.agc:229
//			X(T2)
// slot 33198
    33198, 4012,
// P37_P70.agc:230
//RTE373		DSU	PUSH		# X(T2)ERR				B0 PL02D
// slot 33199
    33199, 34346,
// P37_P70.agc:231
//# Page 894
// P37_P70.agc:232
//			X(T2)
// slot 33200
    33200, 4012,
// P37_P70.agc:233
//		VLOAD	UNIT
// slot 33201
    33201, 44794,
// P37_P70.agc:234
//			R(T2)/		#					B58
// slot 33202
    33202, 3932,
// P37_P70.agc:235
//		STCALL	ALPHAV
// slot 33203
    33203, 30932,
// P37_P70.agc:236
//			GETERAD
// slot 33204
    33204, 23178,
// P37_P70.agc:237
//		DAD
// slot 33205
    33205, 65306,
// P37_P70.agc:238
//			E3RTE
// slot 33206
    33206, 28472,
// P37_P70.agc:239
//		PUSH	DSU		# RCON,=(E1/1+E2BETA11)**.5)+E3 	B29 PL04D
// slot 33207
    33207, 38156,
// P37_P70.agc:240
//			RCON
// slot 33208
    33208, 3900,
// P37_P70.agc:241
//		ABS	DSU
// slot 33209
    33209, 38220,
// P37_P70.agc:242
//			EPC2RTE
// slot 33210
    33210, 28416,
// P37_P70.agc:243
//		BMN	GOTO
// slot 33211
    33211, 43072,
// P37_P70.agc:244
//			RTE374
// slot 33212
    33212, 62332,
// P37_P70.agc:245
//			RTE375
// slot 33213
    33213, 62342,
// P37_P70.agc:246
//RTE374		DLOAD	ABS
// slot 33214
    33214, 42698,
// P37_P70.agc:247
//			00D
// slot 33215
    33215, 2,
// P37_P70.agc:248
//		DSU	BMN
// slot 33216
    33216, 41002,
// P37_P70.agc:249
//			EPC3RTE
// slot 33217
    33217, 28420,
// P37_P70.agc:250
//			P37E
// slot 33218
    33218, 62422,
// P37_P70.agc:251
//RTE375		DLOAD	DAD
// slot 33219
    33219, 36298,
// P37_P70.agc:252
//			NN1A
// slot 33220
    33220, 4016,
// P37_P70.agc:253
//			1RTEB28
// slot 33221
    33221, 28324,
// P37_P70.agc:254
//		BMN	SLOAD
// slot 33222
    33222, 56640,
// P37_P70.agc:255
//			RTE380
// slot 33223
    33223, 62358,
// P37_P70.agc:256
//			OCT605
// slot 33224
    33224, 28388,
// P37_P70.agc:257
//		GOTO
// slot 33225
    33225, 65360,
// P37_P70.agc:258
//			RTEALRM		# TOO MANY ITERATIONS
// slot 33226
    33226, 62460,
// P37_P70.agc:259
//RTE380		STORE	NN1A
// slot 33227
    33227, 4016,
// P37_P70.agc:260
//		DSU	BZE
// slot 33228
    33228, 44074,
// P37_P70.agc:261
//			M8RTEB28
// slot 33229
    33229, 28364,
// P37_P70.agc:262
//			RTE385
// slot 33230
    33230, 62392,
// P37_P70.agc:263
//		DLOAD	DSU
// slot 33231
    33231, 38346,
// P37_P70.agc:264
//			00D
// slot 33232
    33232, 2,
// P37_P70.agc:265
//			DRCON
// slot 33233
    33233, 3948,
// P37_P70.agc:266
//		NORM	PDDL		# X(T2)ERR-X(T2)ERR,=Z1			PL06D
// slot 33234
    33234, 54658,
// P37_P70.agc:267
//			X1
// slot 33235
    33235, 78,
// P37_P70.agc:268
//			RPRE'
// slot 33236
    33236, 3952,
// P37_P70.agc:269
//		DSU	DDV		# X(T2)PRI-X(T2)=Z2			PL04D
// slot 33237
    33237, 47402,
// P37_P70.agc:270
//			X(T2)
// slot 33238
    33238, 4012,
// P37_P70.agc:271
//		DMP	SL*		# DX(T2)=X(T2)ERR(Z2/Z1)
// slot 33239
    33239, 44810,
// P37_P70.agc:272
//			00D
// slot 33240
    33240, 2,
// P37_P70.agc:273
//			0,1
// slot 33241
    33241, 16642,
// P37_P70.agc:274
//		GOTO
// slot 33242
    33242, 65360,
// P37_P70.agc:275
//			RTE390
// slot 33243
    33243, 62396,
// P37_P70.agc:276
//RTE385		DLOAD			# DX(T2)=X(T2)ERR
// slot 33244
    33244, 65482,
// P37_P70.agc:277
//			00D
// slot 33245
    33245, 2,
// P37_P70.agc:278
//RTE390		STODL	16D		# DX(T2)				PL02D
// slot 33246
    33246, 12322,
// P37_P70.agc:279
//		STADR
// slot 33247
    33247, 65324,
// P37_P70.agc:280
//		STODL	RCON		# RCON=RCON,
// slot 33248
    33248, 49346,
// P37_P70.agc:281
//		BOV
// slot 33249
    33249, 65280,
// P37_P70.agc:282
//# Page 895
// P37_P70.agc:283
//			RTE360
// slot 33250
    33250, 62222,
// P37_P70.agc:284
//		STODL	DRCON		# X(T2)ERR,=X(T2)ERR
// slot 33251
    33251, 16236,
// P37_P70.agc:285
//			X(T2)
// slot 33252
    33252, 4012,
// P37_P70.agc:286
//		STODL	RPRE'		# X(T2)PRI=X(T2)
// slot 33253
    33253, 16240,
// P37_P70.agc:287
//			16D
// slot 33254
    33254, 34,
// P37_P70.agc:288
//		DAD
// slot 33255
    33255, 65306,
// P37_P70.agc:289
//			X(T2)
// slot 33256
    33256, 4012,
// P37_P70.agc:290
//		STCALL	X(T2)		# X(T2)=X(T2)+DX(T2)
// slot 33257
    33257, 32684,
// P37_P70.agc:291
//			RTE360		# REITERATE
// slot 33258
    33258, 62222,
// P37_P70.agc:292
//P37E		CALL			# DISPLAY CONIC SOLUTION
// slot 33259
    33259, 65320,
// P37_P70.agc:293
//			RTEVN
// slot 33260
    33260, 62468,
// P37_P70.agc:294
//RTE505		DLOAD	DMP
// slot 33261
    33261, 34250,
// P37_P70.agc:295
//			PCON
// slot 33262
    33262, 4000,
// P37_P70.agc:296
//			BETA1
// slot 33263
    33263, 4056,
// P37_P70.agc:297
//		BDSU	BZE
// slot 33264
    33264, 44066,
// P37_P70.agc:298
//			RCON
// slot 33265
    33265, 3900,
// P37_P70.agc:299
//			RTE510
// slot 33266
    33266, 62448,
// P37_P70.agc:300
//		BMN	DLOAD
// slot 33267
    33267, 58688,
// P37_P70.agc:301
//			RTE510
// slot 33268
    33268, 62448,
// P37_P70.agc:302
//			1RTEB2
// slot 33269
    33269, 28292,
// P37_P70.agc:303
//		GOTO			# ENTRY NEAR APOGEE
// slot 33270
    33270, 65360,
// P37_P70.agc:304
//			RTE515
// slot 33271
    33271, 62452,
// P37_P70.agc:305
//RTE510		DLOAD	DCOMP		# ENTRY NEAR PERIGEE
// slot 33272
    33272, 48842,
// P37_P70.agc:306
//			1RTEB2
// slot 33273
    33273, 28292,
// P37_P70.agc:307
//RTE515		STCALL	PHI2
// slot 33274
    33274, 32738,
// P37_P70.agc:308
//			PREC100		# PRECISION TRAJECTORY COMPUTATION
// slot 33275
    33275, 53954,
// P37_P70.agc:309
//RTE625		BZE
// slot 33276
    33276, 65368,
// P37_P70.agc:310
//			P37G
// slot 33277
    33277, 62512,
// P37_P70.agc:311
//RTEALRM		CALL
// slot 33278
    33278, 65320,
// P37_P70.agc:312
//			P370ALRM
// slot 33279
    33279, 53604,
// P37_P70.agc:313
//		EXIT
// slot 33280
    33280, 65532
)).

// bank 36, slots 33281-33281
function agcAotUnit1863 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:314
//		TCF	P37		# RECYCLE AFTER ALARM DISPLAY
// slot 33281
    if slot <> 33281 or instruction <> 5430 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5430, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1863] to agcAotUnit1863@.

agcAotInstallSourceRope(list(
// P37_P70.agc:315
//
// P37_P70.agc:316
//# RETURN TO KERBIN DISPLAY SUBROUTINE
// P37_P70.agc:317
//
// P37_P70.agc:318
//RTEVN		STQ	CALL
// slot 33282
    33282, 37920,
// P37_P70.agc:319
//			VNSTORE
// slot 33283
    33283, 4070,
// P37_P70.agc:320
//			RTEDISP		# DISPLAY PREPARATION
// slot 33284
    33284, 53660,
// P37_P70.agc:321
//		EXIT
// slot 33285
    33285, 65532
)).

// bank 36, slots 33286-33301
function agcAotUnit1864 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33293 {
        if slot <= 33289 {
            if slot <= 33287 {
                if slot <= 33286 {
// P37_P70.agc:322
//		CAF	V6N61RTE	# LATITUDE,LONGITUDE,BLANK
// slot 33286
                    if slot <> 33286 or instruction <> 13992 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1704), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:323
//		TCR	P370GOFR	#   IN LAT(SPL),LNG(SPL),-
// slot 33287
                    if slot <> 33287 or instruction <> 1681 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1681, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33288 {
// P37_P70.agc:324
//		CAF	FOUR
// slot 33288
                    if slot <> 33288 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:325
//		TCR	37BLANK +1
// slot 33289
                    if slot <> 33289 or instruction <> 1677 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1677, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33291 {
                if slot <= 33290 {
// P37_P70.agc:326
//		TCF	+5
// slot 33290
                    if slot <> 33290 or instruction <> 5647 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5647, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:327
//		TCF	P37		# RECYCLE
// slot 33291
                    if slot <> 33291 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33292 {
// P37_P70.agc:328
//		CAF	V6N39RTE	# T21 HRS,MIN,SEC IN T3TOT4
// slot 33292
                    if slot <> 33292 or instruction <> 13993 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1705), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:329
//		TCR	P370GOF
// slot 33293
                    if slot <> 33293 or instruction <> 1693 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1693, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33297 {
            if slot <= 33295 {
                if slot <= 33294 {
// P37_P70.agc:330
//		TCF	P37		# RECYCLE
// slot 33294
                    if slot <> 33294 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:331
//		CAF	V6N60RTE	# DISPLAY BLANK,V(T2),FPA2
// slot 33295
                    if slot <> 33295 or instruction <> 13994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1706), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33296 {
// P37_P70.agc:332
//		TCR	P37GFRB1	#   IN -,VPRED,GAMMAEI
// slot 33296
                    if slot <> 33296 or instruction <> 1673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1673, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:333
//# Page 896
// P37_P70.agc:334
//		TCF	P37		# RECYCLE
// slot 33297
                    if slot <> 33297 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33299 {
                if slot <= 33298 {
// P37_P70.agc:335
//		CAF	V6N81RTE	# DISPLAY DELTA V (LV) IN DELVLVC
// slot 33298
                    if slot <> 33298 or instruction <> 13995 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1707), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:336
//		TCR	P370GOF
// slot 33299
                    if slot <> 33299 or instruction <> 1693 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1693, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33300 {
// P37_P70.agc:337
//		TCF	P37		# RECYCLE
// slot 33300
                    if slot <> 33300 or instruction <> 5430 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5430, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:338
//		TCR	INTPRET
// slot 33301
                    if slot <> 33301 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1864] to agcAotUnit1864@.

agcAotInstallSourceRope(list(
// P37_P70.agc:339
//		GOTO
// slot 33302
    33302, 65360,
// P37_P70.agc:340
//			VNSTORE
// slot 33303
    33303, 4070,
// P37_P70.agc:341
//
// P37_P70.agc:342
//# PRECISION DISPLAY, TARGETING COMPUTATION AND RTE END PROCESSING
// P37_P70.agc:343
//
// P37_P70.agc:344
//P37G		CALL
// slot 33304
    33304, 65320,
// P37_P70.agc:345
//			RTEVN
// slot 33305
    33305, 62468,
// P37_P70.agc:346
//		EXIT
// slot 33306
    33306, 65532
)).

// bank 36, slots 33307-33314
function agcAotUnit1865 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33310 {
        if slot <= 33308 {
            if slot <= 33307 {
// P37_P70.agc:347
//P37N		CAF	SEVEN
// slot 33307
                if slot <> 33307 or instruction <> 14867 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:348
//		TS	OPTION1
// slot 33308
                if slot <> 33308 or instruction <> 23129 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23129, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33309 {
// P37_P70.agc:349
//		CAF	ONE
// slot 33309
                if slot <> 33309 or instruction <> 14863 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:350
//		TS	OPTION2
// slot 33310
                if slot <> 33310 or instruction <> 23130 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23130, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33312 {
            if slot <= 33311 {
// P37_P70.agc:351
//		CAF	V4N06RTE	# DISPLAY RCS OR SPS OPTION  SPS ASSUMED
// slot 33311
                if slot <> 33311 or instruction <> 13991 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1703), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:352
//		TCR	P370GOF
// slot 33312
                if slot <> 33312 or instruction <> 1693 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1693, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33313 {
// P37_P70.agc:353
//		TCF	-2		# RECYCLE
// slot 33313
                if slot <> 33313 or instruction <> 5663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:354
//		TC	INTPRET		# PROCEED
// slot 33314
                if slot <> 33314 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1865] to agcAotUnit1865@.

agcAotInstallSourceRope(list(
// P37_P70.agc:355
//		SETPD	SLOAD
// slot 33315
    33315, 56578,
// P37_P70.agc:356
//			00D
// slot 33316
    33316, 2,
// P37_P70.agc:357
//			OPTION2
// slot 33317
    33317, 1206,
// P37_P70.agc:358
//		DSU	BZE
// slot 33318
    33318, 44074,
// P37_P70.agc:359
//			1RTEB13
// slot 33319
    33319, 28312,
// P37_P70.agc:360
//			P37Q
// slot 33320
    33320, 62558,
// P37_P70.agc:361
//		SLOAD	NORM		# SPS
// slot 33321
    33321, 49594,
// P37_P70.agc:362
//			EMDOT
// slot 33322
    33322, 146,
// P37_P70.agc:363
//			X1
// slot 33323
    33323, 78,
// P37_P70.agc:364
//		PDDL	GOTO
// slot 33324
    33324, 43178,
// P37_P70.agc:365
//			VCSPS
// slot 33325
    33325, 28372,
// P37_P70.agc:366
//			P37T
// slot 33326
    33326, 62576,
// P37_P70.agc:367
//P37Q		DLOAD	BON		# RCS
// slot 33327
    33327, 36042,
// P37_P70.agc:368
//			MDOTRCS
// slot 33328
    33328, 28380,
// P37_P70.agc:369
//			NJETSFLG
// slot 33329
    33329, 896,
// P37_P70.agc:370
//			P37R
// slot 33330
    33330, 62568,
// P37_P70.agc:371
//		SL1
// slot 33331
    33331, 65492,
// P37_P70.agc:372
//P37R		SL1
// slot 33332
    33332, 65492,
// P37_P70.agc:373
//		NORM	PDDL
// slot 33333
    33333, 54658,
// P37_P70.agc:374
//			X1
// slot 33334
    33334, 78,
// P37_P70.agc:375
//			VCRCS
// slot 33335
    33335, 28376,
// P37_P70.agc:376
//P37T		PDDL	DDV		# DV/VC			B7 -B5 = B2 	PL02D
// slot 33336
    33336, 47530,
// P37_P70.agc:377
//			DV
// slot 33337
    33337, 3980,
// P37_P70.agc:378
//		EXIT
// slot 33338
    33338, 65532
)).

// bank 36, slots 33339-33339
function agcAotUnit1866 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:379
//		TC	POLY
// slot 33339
    if slot <> 33339 or instruction <> 3705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1866] to agcAotUnit1866@.

agcAotInstallSourceRope(list(
// P37_P70.agc:380
//		DEC	1
// slot 33340
    33340, 2,
// P37_P70.agc:381
//		2DEC	5.66240507 E-4 B-3
// slot 33341 33342
    33341, 2, 33342, 5232,
// P37_P70.agc:382
//		2DEC	9.79487897 E-1 B-1
// slot 33343 33344
    33343, 16046, 33344, 31616,
// P37_P70.agc:383
//# Page 897
// P37_P70.agc:384
//		2DEC	-.388281955 B1
// slot 33345 33346
    33345, 40088, 33346, 58224
)).

// bank 36, slots 33347-33347
function agcAotUnit1867 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:385
//		TC	INTPRET
// slot 33347
    if slot <> 33347 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1867] to agcAotUnit1867@.

agcAotInstallSourceRope(list(
// P37_P70.agc:386
//		PUSH	SLOAD		# (1-E)**(-DV/VC)=A		B3 	PL04D
// slot 33348
    33348, 56588,
// P37_P70.agc:387
//			WEIGHT/G
// slot 33349
    33349, 3196,
// P37_P70.agc:388
//		DMP	DDV		# DTB=(M0/MDOT)A	B16+B3-B3=B16 	PL00D
// slot 33350
    33350, 47370,
// P37_P70.agc:389
//		SL*	DMP
// slot 33351
    33351, 34142,
// P37_P70.agc:390
//			0 -12D,1
// slot 33352
    33352, 16618,
// P37_P70.agc:391
//			CSUBT
// slot 33353
    33353, 28384,
// P37_P70.agc:392
//		BDSU
// slot 33354
    33354, 65314,
// P37_P70.agc:393
//			T1
// slot 33355
    33355, 3996,
// P37_P70.agc:394
//		STORE	TIG		# TIG=T1-CT*DTB			B28
// slot 33356
    33356, 3606,
// P37_P70.agc:395
//		EXIT
// slot 33357
    33357, 65532
)).

// bank 36, slots 33358-33364
function agcAotUnit1868 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33360 {
        if slot <= 33358 {
// P37_P70.agc:396
//		CAF	V6N33RTE	# DISPLAY BIASED TIG
// slot 33358
            if slot <> 33358 or instruction <> 13990 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1702), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33359 {
// P37_P70.agc:397
//		TCR	P370GOF
// slot 33359
                if slot <> 33359 or instruction <> 1693 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1693, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:398
//		TCF	-2
// slot 33360
                if slot <> 33360 or instruction <> 5710 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5710, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33362 {
            if slot <= 33361 {
// P37_P70.agc:399
//		CAF	ZERO
// slot 33361
                if slot <> 33361 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:400
//		TS	VHFCNT
// slot 33362
                if slot <> 33362 or instruction <> 23125 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23125, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33363 {
// P37_P70.agc:401
//		TS	TRKMKCNT
// slot 33363
                if slot <> 33363 or instruction <> 23126 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23126, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:402
//		TC	INTPRET
// slot 33364
                if slot <> 33364 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1868] to agcAotUnit1868@.

agcAotInstallSourceRope(list(
// P37_P70.agc:403
//		CALL			# CONICALLY INTEGRATE FROM R1,V1 OVER T12
// slot 33365
    33365, 65320,
// P37_P70.agc:404
//			RTENCK1
// slot 33366
    33366, 53120,
// P37_P70.agc:405
//		VLOAD	UNIT		#					PL00D
// slot 33367
    33367, 44794,
// P37_P70.agc:406
//			R(T2)/
// slot 33368
    33368, 3932,
// P37_P70.agc:407
//		PDVL	VXSC		# UR2				B1 	PL06D
// slot 33369
    33369, 61850,
// P37_P70.agc:408
//			UR1/
// slot 33370
    33370, 4032,
// P37_P70.agc:409
//			MCOS7.5
// slot 33371
    33371, 28392,
// P37_P70.agc:410
//		PDVL	VXSC		# -UR1(COS7.5)			B1 	PL12D
// slot 33372
    33372, 61850,
// P37_P70.agc:411
//			UH/
// slot 33373
    33373, 4044,
// P37_P70.agc:412
//			MSIN7.5
// slot 33374
    33374, 28396,
// P37_P70.agc:413
//		VAD	DOT		# K/=-UR1(COS7.5)-UH(SIN7.5)	B2 	PL00D
// slot 33375
    33375, 41306,
// P37_P70.agc:414
//		DAD	BMN
// slot 33376
    33376, 40986,
// P37_P70.agc:415
//			MCOS22.5
// slot 33377
    33377, 28400,
// P37_P70.agc:416
//			P37W
// slot 33378
    33378, 62702,
// P37_P70.agc:417
//		VLOAD	DOT		# K/ . UR2 GR COS22.5
// slot 33379
    33379, 41466,
// P37_P70.agc:418
//			UH/
// slot 33380
    33380, 4044,
// P37_P70.agc:419
//			R(T2)/
// slot 33381
    33381, 3932,
// P37_P70.agc:420
//		BMN	DLOAD
// slot 33382
    33382, 58688,
// P37_P70.agc:421
//			P37U
// slot 33383
    33383, 62678,
// P37_P70.agc:422
//			THETA165
// slot 33384
    33384, 28404,
// P37_P70.agc:423
//		PUSH	GOTO
// slot 33385
    33385, 43020,
// P37_P70.agc:424
//			P37V
// slot 33386
    33386, 62682,
// P37_P70.agc:425
//P37U		DLOAD	PUSH
// slot 33387
    33387, 34506,
// P37_P70.agc:426
//			THETA210
// slot 33388
    33388, 28408,
// P37_P70.agc:427
//P37V		SIN
// slot 33389
    33389, 65500,
// P37_P70.agc:428
//		STODL	SNTH
// slot 33390
    33390, 15284,
// P37_P70.agc:429
//		COS	CLEAR
// slot 33391
    33391, 36044,
// P37_P70.agc:430
//			RVSW
// slot 33392
    33392, 3948,
// P37_P70.agc:431
//		STOVL	CSTH
// slot 33393
    33393, 23480,
// P37_P70.agc:432
//			R(T1)/
// slot 33394
    33394, 3904,
// P37_P70.agc:433
//# Page 898
// P37_P70.agc:434
//		STOVL	RVEC
// slot 33395
    33395, 23390,
// P37_P70.agc:435
//			V2(T1)/
// slot 33396
    33396, 3968,
// P37_P70.agc:436
//		STCALL	VVEC
// slot 33397
    33397, 31692,
// P37_P70.agc:437
//			TIMETHET
// slot 33398
    33398, 21448,
// P37_P70.agc:438
//P37W		CLEAR	CLEAR
// slot 33399
    33399, 35864,
// P37_P70.agc:439
//			XDELVFLG
// slot 33400
    33400, 1390,
// P37_P70.agc:440
//			NORMSW
// slot 33401
    33401, 3946,
// P37_P70.agc:441
//		SET	VLOAD
// slot 33402
    33402, 64792,
// P37_P70.agc:442
//			FINALFLG
// slot 33403
    33403, 1138,
// P37_P70.agc:443
//		STADR
// slot 33404
    33404, 65324,
// P37_P70.agc:444
//		STODL	RTARG
// slot 33405
    33405, 49636,
// P37_P70.agc:445
//			T
// slot 33406
    33406, 62,
// P37_P70.agc:446
//		DAD
// slot 33407
    33407, 65306,
// P37_P70.agc:447
//			T1
// slot 33408
    33408, 3996,
// P37_P70.agc:448
//		STOVL	TPASS4
// slot 33409
    33409, 24412,
// P37_P70.agc:449
//			V2(T1)/
// slot 33410
    33410, 3968,
// P37_P70.agc:450
//		VSU
// slot 33411
    33411, 65362,
// P37_P70.agc:451
//			V(T1)/
// slot 33412
    33412, 3956,
// P37_P70.agc:452
//		STCALL	DELVSIN
// slot 33413
    33413, 32588,
// P37_P70.agc:453
//			VN1645
// slot 33414
    33414, 60420,
// P37_P70.agc:454
//		GOTO
// slot 33415
    33415, 65360,
// P37_P70.agc:455
//			P37W
// slot 33416
    33416, 62702
)).

// bank 36, slots 33417-33427
function agcAotUnit1869 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33421 {
        if slot <= 33418 {
            if slot <= 33417 {
// P37_P70.agc:456
//
// P37_P70.agc:457
//# SUBROUTINE TO GO TO GOFLASHR AND BLANK R1
// P37_P70.agc:458
//
// P37_P70.agc:459
//P37GFRB1	EXTEND
// slot 33417
                if slot <> 33417 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:460
//		QXCH	SPRTEX
// slot 33418
                if slot <> 33418 or instruction <> 10226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 1010, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33419 {
// P37_P70.agc:461
//		TCR	P370GOFR
// slot 33419
                if slot <> 33419 or instruction <> 1681 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1681, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33420 {
// P37_P70.agc:462
//37BLANK		CAF	ONE
// slot 33420
                    if slot <> 33420 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:463
//		TCR	BLANKET
// slot 33421
                    if slot <> 33421 or instruction <> 2902 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2902, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 33424 {
            if slot <= 33422 {
// P37_P70.agc:464
//		TCF	ENDOFJOB
// slot 33422
                if slot <> 33422 or instruction <> 6799 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6799, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33423 {
// P37_P70.agc:465
//		TC	SPRTEX		# RECYCLE
// slot 33423
                    if slot <> 33423 or instruction <> 1010 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1010, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:466
//		TCF	P37PROC		# PROCEED
// slot 33424
                    if slot <> 33424 or instruction <> 5796 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5796, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33425 {
// P37_P70.agc:467
//
// P37_P70.agc:468
//# SUBROUTINE TO GO TO GOFLASHR
// P37_P70.agc:469
//
// P37_P70.agc:470
//P370GOFR	EXTEND
// slot 33425
                if slot <> 33425 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33426 {
// P37_P70.agc:471
//		QXCH	RTENCKEX
// slot 33426
                    if slot <> 33426 or instruction <> 10203 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 987, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P37_P70.agc:472
//		TCR	BANKCALL
// slot 33427
                    if slot <> 33427 or instruction <> 2482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1869] to agcAotUnit1869@.

agcAotInstallSourceRope(list(
// P37_P70.agc:473
//		CADR	GOFLASHR
// slot 33428
    33428, 17502
)).

// bank 36, slots 33429-33433
function agcAotUnit1870 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33430 {
        if slot <= 33429 {
// P37_P70.agc:474
//		TCF	GOTOPOOH	# TERMINATE
// slot 33429
            if slot <> 33429 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:475
//		TCF	+3
// slot 33430
            if slot <> 33430 or instruction <> 5785 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5785, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33431 {
// P37_P70.agc:476
//		TCF	+4
// slot 33431
            if slot <> 33431 or instruction <> 5787 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5787, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33432 {
// P37_P70.agc:477
//		TC	RTENCKEX	# IMMEDIATE RETURN
// slot 33432
                if slot <> 33432 or instruction <> 987 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 987, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P37_P70.agc:478
//		INDEX	RTENCKEX	# PROCEED
// slot 33433
                if slot <> 33433 or instruction <> 21467 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21467, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21467, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1870] to agcAotUnit1870@.

agcAotInstallSourceRope(list(
// P37_P70.agc:479
//		TCF	0 +4
// slot 33434
    33434, 8200
)).

// bank 36, slots 33435-33435
function agcAotUnit1871 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:480
//		INDEX	RTENCKEX	# RECYCLE
// slot 33435
    if slot <> 33435 or instruction <> 21467 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21467, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21467, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1871] to agcAotUnit1871@.

agcAotInstallSourceRope(list(
// P37_P70.agc:481
//		TCF	0 +3
// slot 33436
    33436, 8198
)).

// bank 36, slots 33437-33439
function agcAotUnit1872 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33437 {
// P37_P70.agc:482
//
// P37_P70.agc:483
//# SUBROUTINE TO GO TO GOFLASH
// P37_P70.agc:484
//
// P37_P70.agc:485
//# Page 899
// P37_P70.agc:486
//P370GOF		EXTEND
// slot 33437
        if slot <> 33437 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33438 {
// P37_P70.agc:487
//		QXCH	SPRTEX
// slot 33438
            if slot <> 33438 or instruction <> 10226 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 1010, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:488
//		TCR	BANKCALL
// slot 33439
            if slot <> 33439 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1872] to agcAotUnit1872@.

agcAotInstallSourceRope(list(
// P37_P70.agc:489
//		CADR	GOFLASH
// slot 33440
    33440, 17312
)).

// bank 36, slots 33441-33444
function agcAotUnit1873 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33442 {
        if slot <= 33441 {
// P37_P70.agc:490
//		TCF	GOTOPOOH
// slot 33441
            if slot <> 33441 or instruction <> 6214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:491
//		TCF	+2
// slot 33442
            if slot <> 33442 or instruction <> 5796 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5796, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33443 {
// P37_P70.agc:492
//		TC	SPRTEX
// slot 33443
            if slot <> 33443 or instruction <> 1010 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1010, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:493
//P37PROC		INDEX	SPRTEX
// slot 33444
            if slot <> 33444 or instruction <> 21490 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21490, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21490, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1873] to agcAotUnit1873@.

agcAotInstallSourceRope(list(
// P37_P70.agc:494
//		TCF	0 +1
// slot 33445
    33445, 8194,
// P37_P70.agc:495
//V6N33RTE	VN	0633
// slot 33446
    33446, 1602,
// P37_P70.agc:496
//V4N06RTE	VN	0406
// slot 33447
    33447, 1036,
// P37_P70.agc:497
//V6N61RTE	VN	0661
// slot 33448
    33448, 1658,
// P37_P70.agc:498
//V6N39RTE	VN	0639
// slot 33449
    33449, 1614,
// P37_P70.agc:499
//V6N60RTE	VN	0660
// slot 33450
    33450, 1656,
// P37_P70.agc:500
//V6N81RTE	VN	0681
// slot 33451
    33451, 1698,
// P37_P70.agc:501
//		BANK	32
// P37_P70.agc:502
//		SETLOC	RTE
// P37_P70.agc:503
//		BANK
// P37_P70.agc:504
//		COUNT	32/RTE
// P37_P70.agc:505
//
// P37_P70.agc:506
//# Page 900
// P37_P70.agc:507
//# ALARM DISPLAY SUBROUTINE
// P37_P70.agc:508
//
// P37_P70.agc:509
//P370ALRM	STQ	EXIT
// slot 28850
    28850, 65056,
// P37_P70.agc:510
//			SPRTEX
// slot 28851
    28851, 4068
)).

// bank 32, slots 28852-28855
function agcAotUnit1624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28853 {
        if slot <= 28852 {
// P37_P70.agc:511
//		CA	MPAC
// slot 28852
            if slot <> 28852 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:512
//		TC	VARALARM
// slot 28853
            if slot <> 28853 or instruction <> 3060 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3060, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28854 {
// P37_P70.agc:513
//		CAF	V5N09RTE
// slot 28854
            if slot <> 28854 or instruction <> 13502 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1214), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:514
//		TC	BANKCALL
// slot 28855
            if slot <> 28855 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1624] to agcAotUnit1624@.

agcAotInstallSourceRope(list(
// P37_P70.agc:515
//		CADR	GOFLASH
// slot 28856
    28856, 17312
)).

// bank 32, slots 28857-28859
function agcAotUnit1625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28857 {
// P37_P70.agc:516
//		TCF	GOTOPOOH
// slot 28857
        if slot <> 28857 or instruction <> 6214 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6214, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28858 {
// P37_P70.agc:517
//		TCF	-4
// slot 28858
            if slot <> 28858 or instruction <> 5302 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5302, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P37_P70.agc:518
//		TC	INTPRET
// slot 28859
            if slot <> 28859 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1625] to agcAotUnit1625@.

agcAotInstallSourceRope(list(
// P37_P70.agc:519
//		GOTO
// slot 28860
    28860, 65360,
// P37_P70.agc:520
//			SPRTEX
// slot 28861
    28861, 4068,
// P37_P70.agc:521
//V5N09RTE	VN	0509
// slot 28862
    28862, 1298,
// P37_P70.agc:522
//
// P37_P70.agc:523
//# Page 901
// P37_P70.agc:524
//# TIME RADIUS CALLING SUBROUTINE
// P37_P70.agc:525
//#
// P37_P70.agc:526
//# INPUT
// P37_P70.agc:527
//#	RVEC		INITIAL POSITION VECTOR					VECTOR	B29	METERS
// P37_P70.agc:528
//#	VVEC		INITIAL VELOCITY VECTOR					VECTOR	B7	METERS/CS
// P37_P70.agc:529
//#	RDESIRED	FINAL RADIUS FOR WHICH TRANSFER TIME IS TO BE COMPUTED	DP	B29	METERS
// P37_P70.agc:530
//#	CONICX1		X1 SETTING FOR CONIC SUBROUTINES  -2=KERBIN		SP	B14
// P37_P70.agc:531
//#
// P37_P70.agc:532
//# OUTPUT
// P37_P70.agc:533
//#	R(T2)/		FINAL POSITION VECTOR					VECTOR	B29 	METERS
// P37_P70.agc:534
//#	V(T2)/		FINAL VELOCITY VECTOR					VECTOR	B7	METERS/CS
// P37_P70.agc:535
//#	T12		TRANSFER TIME TO FINAL RADIUS				DP	B28	CS
// P37_P70.agc:536
//
// P37_P70.agc:537
//TMRAD100	STQ	CLEAR
// slot 28863
    28863, 35872,
// P37_P70.agc:538
//			RTENCKEX
// slot 28864
    28864, 4022,
// P37_P70.agc:539
//			RVSW
// slot 28865
    28865, 3948,
// P37_P70.agc:540
//		AXC,2	SXA,2
// slot 28866
    28866, 56552,
// P37_P70.agc:541
//		OCT	20000
// slot 28867
    28867, 16384,
// P37_P70.agc:542
//			SGNRDOT
// slot 28868
    28868, 3036,
// P37_P70.agc:543
//		LXC,1	CALL
// slot 28869
    28869, 38080,
// P37_P70.agc:544
//			CONICX1
// slot 28870
    28870, 4024,
// P37_P70.agc:545
//			TIMERAD
// slot 28871
    28871, 22236,
// P37_P70.agc:546
//		STOVL	V(T2)/							PL00D
// slot 28872
    28872, 24464,
// P37_P70.agc:547
//		STADR
// slot 28873
    28873, 65324,
// P37_P70.agc:548
//		STODL	R(T2)/
// slot 28874
    28874, 49314,
// P37_P70.agc:549
//			T
// slot 28875
    28875, 62,
// P37_P70.agc:550
//		STCALL	T12
// slot 28876
    28876, 32680,
// P37_P70.agc:551
//			RTENCKEX
// slot 28877
    28877, 4022,
// P37_P70.agc:552
//
// P37_P70.agc:553
//# Page 902
// P37_P70.agc:554
//# DISPLAY CALCULATION SUBROUTINE
// P37_P70.agc:555
//#
// P37_P70.agc:556
//# DESCRIPTION
// P37_P70.agc:557
//#	OUTPUT FOR DISPLAY IS CONVERTED TO PROPER UNITS AND PLACED IN OUTPUT STORAGE REGISTERS.  LANDING SITE
// P37_P70.agc:558
//#	COMPUTATION FOR DETERMINING LANDING SITE LATITUDE AND LONGITUDE IS INCLUDED IN THE ROUTINE.
// P37_P70.agc:559
//#
// P37_P70.agc:560
//# CALLING SEQUENCE
// P37_P70.agc:561
//#	L	CALL
// P37_P70.agc:562
//#	L+1		RTEDISP
// P37_P70.agc:563
//#
// P37_P70.agc:564
//# SUBROUTINES CALLED
// P37_P70.agc:565
//#	TMRAD100
// P37_P70.agc:566
//#	AUGEKUGL
// P37_P70.agc:567
//#	LAT-LONG
// P37_P70.agc:568
//#
// P37_P70.agc:569
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:570
//#    PUSHLIST
// P37_P70.agc:571
//#	NONE
// P37_P70.agc:572
//#    MPAC
// P37_P70.agc:573
//#	NONE
// P37_P70.agc:574
//#    OTHER
// P37_P70.agc:575
//#	R(T2)/		FINAL POSITION VECTOR					VECTOR	B29	METERS
// P37_P70.agc:576
//#	V(T2)/		FINAL VELOCITY VECTOR					VECTOR	B7	METERS/CS
// P37_P70.agc:577
//#	T2		FINAL TIME						DP	B28	CS
// P37_P70.agc:578
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7	METERS/CS
// P37_P70.agc:579
//#	V(T1)/		INITIAL VELOCITY VECTOR					VECTOR	B7
// P37_P70.agc:580
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:581
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:582
//#
// P37_P70.agc:583
//# OUTPUT
// P37_P70.agc:584
//#	VPRED		VELOCITY MAGNITUDE AT 400,000 FT. ENTRY ALTITUDE	DP	B7	METERS/CS
// P37_P70.agc:585
//#	T3TOT4		TRANSIT TIME TO 400,000 FT. ENTRY ALTITUDE		DP	B28	CS
// P37_P70.agc:586
//#	GAMMAEI		FLIGHT PATH ANGLE AT 400,000 FT. ENTRY ALTITUDE		DP	B0	REVS + ABOVE HORIZ
// P37_P70.agc:587
//#	DELVLVC		INITIAL VELOCITY CHANGE VECTOR IN LOCAL VERTICAL COORD.	VECTOR	B7	METERS/CS
// P37_P70.agc:588
//#	LAT(SPL)	LATITUDE OF THE LANDING SITE				DP	B0	REVS
// P37_P70.agc:589
//#	LNG(SPL)	LONGITUDE OF THE LANDING SITE				DP	B0	REVS
// P37_P70.agc:590
//
// P37_P70.agc:591
//RTEDISP		STQ	VLOAD		# DISPLAY
// slot 28878
    28878, 64800,
// P37_P70.agc:592
//			SPRTEX
// slot 28879
    28879, 4068,
// P37_P70.agc:593
//			V(T2)/
// slot 28880
    28880, 3984,
// P37_P70.agc:594
//		UNIT	PDDL
// slot 28881
    28881, 54620,
// P37_P70.agc:595
//			36D
// slot 28882
    28882, 74,
// P37_P70.agc:596
//		STODL	VPRED		# V(T2)
// slot 28883
    28883, 16366,
// P37_P70.agc:597
//			T2
// slot 28884
    28884, 4028,
// P37_P70.agc:598
//		DSU
// slot 28885
    28885, 65322,
// P37_P70.agc:599
//			SPRTETIG
// slot 28886
    28886, 3606,
// P37_P70.agc:600
//		STOVL	T3TOT4		# T21
// slot 28887
    28887, 23362,
// P37_P70.agc:601
//			R(T2)/
// slot 28888
    28888, 3932,
// P37_P70.agc:602
//		UNIT	DOT
// slot 28889
    28889, 41308,
// P37_P70.agc:603
//		SL1
// slot 28890
    28890, 65492,
// P37_P70.agc:604
//
// P37_P70.agc:605
//# Page 903
// P37_P70.agc:606
//		ARCCOS	BDSU
// slot 28891
    28891, 37292,
// P37_P70.agc:607
//			1RTEB2
// slot 28892
    28892, 28292,
// P37_P70.agc:608
//		STOVL	GAMMAEI		# FLIGHT PATH ANGLE T2
// slot 28893
    28893, 24562,
// P37_P70.agc:609
//			V2(T1)/
// slot 28894
    28894, 3968,
// P37_P70.agc:610
//		VSU	PUSH
// slot 28895
    28895, 34386,
// P37_P70.agc:611
//			V(T1)/
// slot 28896
    28896, 3956,
// P37_P70.agc:612
//		DOT	DCOMP
// slot 28897
    28897, 48706,
// P37_P70.agc:613
//			UR1/
// slot 28898
    28898, 4032,
// P37_P70.agc:614
//		PDVL	PUSH
// slot 28899
    28899, 34458,
// P37_P70.agc:615
//		DLOAD	PDVL
// slot 28900
    28900, 52682,
// P37_P70.agc:616
//			ZERORTE
// slot 28901
    28901, 28328,
// P37_P70.agc:617
//		DOT	VDEF
// slot 28902
    28902, 46658,
// P37_P70.agc:618
//			UH/
// slot 28903
    28903, 4044,
// P37_P70.agc:619
//		VSL1
// slot 28904
    28904, 65524,
// P37_P70.agc:620
//		STODL	DELVLVC
// slot 28905
    28905, 15882,
// P37_P70.agc:621
//			DELVLVC
// slot 28906
    28906, 3594,
// P37_P70.agc:622
//		BOFF	DCOMP
// slot 28907
    28907, 48664,
// P37_P70.agc:623
//			RETROFLG
// slot 28908
    28908, 3010,
// P37_P70.agc:624
//			RTD18
// slot 28909
    28909, 53726,
// P37_P70.agc:625
//		STORE	DELVLVC		# NEGATE X COMPONENT, RETROGRADE
// slot 28910
    28910, 3594,
// P37_P70.agc:626
//RTD18		VLOAD	ABVAL
// slot 28911
    28911, 42746,
// P37_P70.agc:627
//			DELVLVC
// slot 28912
    28912, 3594,
// P37_P70.agc:628
//		STOVL	VGDISP
// slot 28913
    28913, 24566,
// P37_P70.agc:629
//			R(T2)/
// slot 28914
    28914, 3932,
// P37_P70.agc:630
//		STORE	RVEC		# ***** LANDING SITE COMPUTATION *****
// slot 28915
    28915, 2910,
// P37_P70.agc:631
//		ABVAL	DSU
// slot 28916
    28916, 38220,
// P37_P70.agc:632
//			30480RTE
// slot 28917
    28917, 28368,
// P37_P70.agc:633
//		STOVL	RDESIRED
// slot 28918
    28918, 23520,
// P37_P70.agc:634
//			V(T2)/
// slot 28919
    28919, 3984,
// P37_P70.agc:635
//		STCALL	VVEC
// slot 28920
    28920, 31692,
// P37_P70.agc:636
//			TMRAD100	# R3,V3,T23 FROM TIMERAD
// slot 28921
    28921, 53630,
// P37_P70.agc:637
//		VLOAD	UNIT
// slot 28922
    28922, 44794,
// P37_P70.agc:638
//			R(T2)/
// slot 28923
    28923, 3932,
// P37_P70.agc:639
//		PDVL	UNIT		# UR3					PL06D
// slot 28924
    28924, 44698,
// P37_P70.agc:640
//			V(T2)/
// slot 28925
    28925, 3984,
// P37_P70.agc:641
//		DOT	SL1		# GAMMAE=ARCSIN(UR3 . UV3)		PL00D
// slot 28926
    28926, 59970,
// P37_P70.agc:642
//		ARCSIN	PDDL		# V(T3)					PL02D
// slot 28927
    28927, 54716,
// P37_P70.agc:643
//			36D
// slot 28928
    28928, 74,
// P37_P70.agc:644
//		PDDL	ABS
// slot 28929
    28929, 42666,
// P37_P70.agc:645
//		PUSH	CALL		# /GAMMAE/				PL04D
// slot 28930
    28930, 37900,
// P37_P70.agc:646
//			AUGEKUGL	# PHIE					PL06D
// slot 28931
    28931, 53370
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:647
//		DAD	DAD
// slot 28932
    28932, 36122,
// P37_P70.agc:648
//			T12		# T23
// slot 28933
    28933, 4008,
// P37_P70.agc:649
//			T2
// slot 28934
    28934, 4028,
// P37_P70.agc:650
//		STORE	02D		# T(LS)=T2&T23&TE
// slot 28935
    28935, 6,
// P37_P70.agc:651
//		SLOAD	BZE
// slot 28936
    28936, 44218,
// P37_P70.agc:652
//			P37RANGE
// slot 28937
    28937, 3582,
// P37_P70.agc:653
//			RTD22
// slot 28938
    28938, 53784,
// P37_P70.agc:654
//		STORE	04D		# OVERRIDE RANGE (PCR 261)
// slot 28939
    28939, 10,
// P37_P70.agc:655
//RTD22		DLOAD	SIN
// slot 28940
    28940, 61130,
// P37_P70.agc:656
//
// P37_P70.agc:657
//# Page 904
// P37_P70.agc:658
//			04D
// slot 28941
    28941, 10,
// P37_P70.agc:659
//		STODL	LNG(SPL)	# LNG(SPL)=SIN(PHIE)			PL04D
// slot 28942
    28942, 15878,
// P37_P70.agc:660
//		COS
// slot 28943
    28943, 65484,
// P37_P70.agc:661
//		STORE	LAT(SPL)	# LAT(SPL)=COS(PHIE)
// slot 28944
    28944, 3586,
// P37_P70.agc:662
//		VLOAD	UNIT
// slot 28945
    28945, 44794,
// P37_P70.agc:663
//			R(T2)/
// slot 28946
    28946, 3932,
// P37_P70.agc:664
//		PUSH	PUSH
// slot 28947
    28947, 34316,
// P37_P70.agc:665
//		PDVL	UNIT		#					PL22D
// slot 28948
    28948, 44698,
// P37_P70.agc:666
//			V(T2)/
// slot 28949
    28949, 3984,
// P37_P70.agc:667
//		PDVL	VXV
// slot 28950
    28950, 40346,
// P37_P70.agc:668
//		VXV	UNIT		# UH3=UNIT(UR3 X UV3 X UR3)		PL10D
// slot 28951
    28951, 44602,
// P37_P70.agc:669
//		VXSC	PDVL
// slot 28952
    28952, 52706,
// P37_P70.agc:670
//			LNG(SPL)
// slot 28953
    28953, 3590,
// P37_P70.agc:671
//		VXSC	VAD		#					PL04D
// slot 28954
    28954, 44514,
// P37_P70.agc:672
//			LAT(SPL)
// slot 28955
    28955, 3586,
// P37_P70.agc:673
//		CLEAR	CLEAR		# T(LS) IN MPAC
// slot 28956
    28956, 35864,
// P37_P70.agc:674
//			ERADFLAG
// slot 28957
    28957, 868,
// P37_P70.agc:675
//			LUNAFLAG
// slot 28958
    28958, 1894,
// P37_P70.agc:676
//		STODL	ALPHAV		# ALPHAV=UR3(COSPHIE)+UH3(SINPHIE) 	PL02D
// slot 28959
    28959, 14548,
// P37_P70.agc:677
//		CALL
// slot 28960
    28960, 65320,
// P37_P70.agc:678
//			LAT-LONG
// slot 28961
    28961, 23024,
// P37_P70.agc:679
//		DLOAD
// slot 28962
    28962, 65482,
// P37_P70.agc:680
//			LAT
// slot 28963
    28963, 1160,
// P37_P70.agc:681
//		STODL	LAT(SPL)	# LATITUDE LANDING SITE  *****
// slot 28964
    28964, 15874,
// P37_P70.agc:682
//			LONG
// slot 28965
    28965, 1164,
// P37_P70.agc:683
//		STCALL	LNG(SPL)	# LONGITUDE LANDING SITE *****
// slot 28966
    28966, 32262,
// P37_P70.agc:684
//			SPRTEX
// slot 28967
    28967, 4068,
// P37_P70.agc:685
//		COUNT*	$$/RTE
// P37_P70.agc:686
//
// P37_P70.agc:687
//# Page 905
// P37_P70.agc:688
//# INITIAL VECTOR SUBROUTINE
// P37_P70.agc:689
//#
// P37_P70.agc:690
//# DESCRIPTION
// P37_P70.agc:691
//#	A PRECISION INTEGRATION OF THE STATE VECTOR TO THE TIME OF IGNITION IS PERFORMED. PRECOMPUTATIONS OCCUR.
// P37_P70.agc:692
//#
// P37_P70.agc:693
//# CALLING SEQUENCE
// P37_P70.agc:694
//#	L	CALL
// P37_P70.agc:695
//#	L+1		INVC100
// P37_P70.agc:696
//#
// P37_P70.agc:697
//# NORMAL EXIT MODE
// P37_P70.agc:698
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC = 0
// P37_P70.agc:699
//#
// P37_P70.agc:700
//# ALARM EXIT MODE
// P37_P70.agc:701
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC = OCTAL 612 FOR STATE VECTOR IN MUNS SPHERE OF INFLUENCE
// P37_P70.agc:702
//#
// P37_P70.agc:703
//# SUBROUTINES CALLED
// P37_P70.agc:704
//#	CSMPREC
// P37_P70.agc:705
//#
// P37_P70.agc:706
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:707
//#    PUSHLIST
// P37_P70.agc:708
//#	NONE
// P37_P70.agc:709
//#    MPAC
// P37_P70.agc:710
//#	NONE
// P37_P70.agc:711
//#    OTHER
// P37_P70.agc:712
//#	SPRTETIG	TIME OF IGNITION					DP	B28	CS
// P37_P70.agc:713
//#	CSM STATE VECTOR
// P37_P70.agc:714
//#
// P37_P70.agc:715
//# OUTPUT
// P37_P70.agc:716
//#	R(T1)/		INITIAL POSITION VECTOR AT TIG				VECTOR	B29	METERS
// P37_P70.agc:717
//#	V(T1)/		INITIAL VELOCITY VECTOR AT TIG				VECTOR	B7	METERS/CS
// P37_P70.agc:718
//#	T1		INITIAL VECTOR TIME (TIG)				DP	B28	CS
// P37_P70.agc:719
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:720
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:721
//#	CFPA		COSINE OF INITIAL FLIGHT PATH ANGLE			DP	B1
// P37_P70.agc:722
//
// P37_P70.agc:723
//INVC100		STQ	DLOAD
// slot 28968
    28968, 58656,
// P37_P70.agc:724
//			SPRTEX
// slot 28969
    28969, 4068,
// P37_P70.agc:725
//			SPRTETIG
// slot 28970
    28970, 3606,
// P37_P70.agc:726
//		STCALL	TDEC1
// slot 28971
    28971, 28738,
// P37_P70.agc:727
//			CSMPREC		# PRECISION INTEGRATION  R0,V0 TO R1,V1
// slot 28972
    28972, 23666,
// P37_P70.agc:728
//		VLOAD	SXA,2
// slot 28973
    28973, 56570,
// P37_P70.agc:729
//			RATT
// slot 28974
    28974, 2,
// P37_P70.agc:730
//			P(T1)
// slot 28975
    28975, 4058,
// P37_P70.agc:731
//		STOVL	R(T1)/
// slot 28976
    28976, 24384,
// P37_P70.agc:732
//			VATT
// slot 28977
    28977, 14,
// P37_P70.agc:733
//		STODL	V(T1)/
// slot 28978
    28978, 16244,
// P37_P70.agc:734
//			TAT
// slot 28979
    28979, 26,
// P37_P70.agc:735
//		STORE	T1
// slot 28980
    28980, 3996,
// P37_P70.agc:736
//		SLOAD	BZE
// slot 28981
    28981, 44218,
// P37_P70.agc:737
//			P(T1)
// slot 28982
    28982, 4060,
// P37_P70.agc:738
//# Page 906
// P37_P70.agc:739
//			INVC109
// slot 28983
    28983, 53878,
// P37_P70.agc:740
//INVC107		SLOAD	GOTO
// slot 28984
    28984, 43194,
// P37_P70.agc:741
//			OCT612
// slot 28985
    28985, 28390,
// P37_P70.agc:742
//			RTEALRM		# R1,V1 NOT IN PROPER SPHERE OF INFLUENCE
// slot 28986
    28986, 62460,
// P37_P70.agc:743
//INVC109		VLOAD	UNIT
// slot 28987
    28987, 44794,
// P37_P70.agc:744
//			R(T1)/
// slot 28988
    28988, 3904,
// P37_P70.agc:745
//		STODL	UR1/		# UR1/					B1
// slot 28989
    28989, 16320,
// P37_P70.agc:746
//			36D
// slot 28990
    28990, 74,
// P37_P70.agc:747
//		STOVL	R(T1)		# R(T1)					B29
// slot 28991
    28991, 24396,
// P37_P70.agc:748
//			V(T1)/
// slot 28992
    28992, 3956,
// P37_P70.agc:749
//		UNIT
// slot 28993
    28993, 65372,
// P37_P70.agc:750
//		STORE	UV1/
// slot 28994
    28994, 4044,
// P37_P70.agc:751
//		DOT	SL1
// slot 28995
    28995, 59970,
// P37_P70.agc:752
//			UR1/
// slot 28996
    28996, 4032,
// P37_P70.agc:753
//		STORE	CFPA		# CFPA					B1
// slot 28997
    28997, 4062,
// P37_P70.agc:754
//		ABS	DSU
// slot 28998
    28998, 38220,
// P37_P70.agc:755
//			EPC1RTE
// slot 28999
    28999, 28412,
// P37_P70.agc:756
//		BMN	DLOAD
// slot 29000
    29000, 58688,
// P37_P70.agc:757
//			INVC115		# NOT NEAR RECTILINEAR
// slot 29001
    29001, 53920,
// P37_P70.agc:758
//			1RTEB2
// slot 29002
    29002, 28292,
// P37_P70.agc:759
//		PDDL	PUSH
// slot 29003
    29003, 34474,
// P37_P70.agc:760
//			ZERORTE
// slot 29004
    29004, 28328,
// P37_P70.agc:761
//		VDEF	PUSH		# N/ = (0,0,1)
// slot 29005
    29005, 34412,
// P37_P70.agc:762
//		GOTO
// slot 29006
    29006, 65360,
// P37_P70.agc:763
//			INVC120
// slot 29007
    29007, 53928,
// P37_P70.agc:764
//INVC115		VLOAD	VXV
// slot 29008
    29008, 40442,
// P37_P70.agc:765
//			UR1/
// slot 29009
    29009, 4032,
// P37_P70.agc:766
//			UV1/
// slot 29010
    29010, 4044,
// P37_P70.agc:767
//		PUSH			# N/ = UR X UV				B2
// slot 29011
    29011, 65292,
// P37_P70.agc:768
//INVC120		CLEAR	DLOAD
// slot 29012
    29012, 58648,
// P37_P70.agc:769
//			RETROFLG
// slot 29013
    29013, 2914,
// P37_P70.agc:770
//		PUSH	BPL
// slot 29014
    29014, 41996,
// P37_P70.agc:771
//			INVC125
// slot 29015
    29015, 53942,
// P37_P70.agc:772
//		VLOAD	VCOMP		# RETROGRADE ORBIT
// slot 29016
    29016, 48890,
// P37_P70.agc:773
//		PUSH	SET
// slot 29017
    29017, 35852,
// P37_P70.agc:774
//			RETROFLG
// slot 29018
    29018, 2658
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:775
//INVC125		VLOAD
// slot 29019
    29019, 65530,
// P37_P70.agc:776
//		VXV	UNIT
// slot 29020
    29020, 44602,
// P37_P70.agc:777
//			UR1/
// slot 29021
    29021, 4032,
// P37_P70.agc:778
//		STORE	UH/		# UH/					B1
// slot 29022
    29022, 4044,
// P37_P70.agc:779
//		GOTO
// slot 29023
    29023, 65360,
// P37_P70.agc:780
//			SPRTEX
// slot 29024
    29024, 4068,
// P37_P70.agc:781
//
// P37_P70.agc:782
//# Page 907
// P37_P70.agc:783
//# PRECISION TRAJECTORY COMPUTATION SUBROUTINE
// P37_P70.agc:784
//#
// P37_P70.agc:785
//# DESCRIPTION
// P37_P70.agc:786
//#	A NUMERICALLY INTEGRATED TRAJECTORY IS GENERATED WHICH FOR THE RETURN TO KERBIN PROBLEM SATISFIES THE REENTRY
// P37_P70.agc:787
//#	CONSTRAINTS (RCON AND X(T2)) ACHIEVED BY THE INITIAL CONIC TRAJECTORY AND MEETS THE DVD REQUIREMENT AS CLOSELY
// P37_P70.agc:788
//#	AS POSSIBLE.
// P37_P70.agc:789
//#
// P37_P70.agc:790
//# CALLING SEQUENCE
// P37_P70.agc:791
//#	L	CALL
// P37_P70.agc:792
//#	L+1		PREC100
// P37_P70.agc:793
//#
// P37_P70.agc:794
//# NORMAL EXIT MODE
// P37_P70.agc:795
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC = 0
// P37_P70.agc:796
//#
// P37_P70.agc:797
//# ALARM EXIT MODE
// P37_P70.agc:798
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC =
// P37_P70.agc:799
//#		OCTAL 605	FOR EXCESS ITERATIONS
// P37_P70.agc:800
//#		OCTAL 613	FOR REENTRY ANGLE OUT OF LIMITS
// P37_P70.agc:801
//#
// P37_P70.agc:802
//# SUBROUTINES CALLED
// P37_P70.agc:803
//#	INTSTALL
// P37_P70.agc:804
//#	RTENCK2
// P37_P70.agc:805
//#	RTENCK3
// P37_P70.agc:806
//#	TIMERAD
// P37_P70.agc:807
//#	PARAM
// P37_P70.agc:808
//#	V2T100
// P37_P70.agc:809
//#
// P37_P70.agc:810
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:811
//#    PUSHLIST
// P37_P70.agc:812
//#	NONE
// P37_P70.agc:813
//#    MPAC
// P37_P70.agc:814
//#	NONE
// P37_P70.agc:815
//#    OTHER
// P37_P70.agc:816
//#	R(T1)/		INITIAL POSITION VECTOR					VECTOR	B29/B27	METERS
// P37_P70.agc:817
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7/B5	METERS/CS
// P37_P70.agc:818
//#	V(T1)/		INITIAL VELOCITY VECTOR					VECTOR	B7/B5	METERS/CS
// P37_P70.agc:819
//#	T1		INITIAL VECTOR TIME					DP	B28	CS
// P37_P70.agc:820
//#	T12		INITIAL TO FINAL POSITION TIME				DP	B28 	CS
// P37_P70.agc:821
//#	RCON		CONIC FINAL RADIUS					DP	B29/B27	METERS
// P37_P70.agc:822
//#	R(T1)		MAGNITUDE OF INITIAL POSITION VECTOR			DP	B29/B27	METERS
// P37_P70.agc:823
//#	X(T2)		COTANGENT OF FINAL FLIGHT PATH ANGLE			DP	B0
// P37_P70.agc:824
//#	X(T1)		COTANGENT OF INITIAL FLIGHT PATH ANGLE			DP	B5
// P37_P70.agc:825
//#	RTEDVD		DELTA VELOCITY DESIRED					DP	B7/B5	METERS/CS
// P37_P70.agc:826
//#	MAMAX1		MAJOR AXIS LIMIT FOR LOWER BOUND ON GAMDV ITERATOR	DP	B30/B28	METERS
// P37_P70.agc:827
//#	MAMAX2		MAJOR AXIS LIMIT FOR UPPER BOUND ON GAMDV ITERATOR	DP	B30/B28	METERS
// P37_P70.agc:828
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:829
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:830
//#	BETA1		1+X(T2)**2						DP	B1
// P37_P70.agc:831
//#	PHI2		PERIGEE OR APOGEE INDICATOR				DP	B2	-1 PERIGEE, +1 APOGEE
// P37_P70.agc:832
//#
// P37_P70.agc:833
//# Page 908
// P37_P70.agc:834
//#
// P37_P70.agc:835
//# OUTPUT
// P37_P70.agc:836
//#    	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7	METERS/CS
// P37_P70.agc:837
//#	R(T2)/		FINAL POSITION VECTOR					VECTOR	B29	METERS
// P37_P70.agc:838
//#	V(T2)/		FINAL VELOCITY VECTOR					VECTOR	B7	METERS/CS
// P37_P70.agc:839
//#	T2		FINAL TIME						DP	B28	CENTISECONDS
// P37_P70.agc:840
//#
// P37_P70.agc:841
//# DEBRIS
// P37_P70.agc:842
//#	RD		FINAL R DESIRED						DP	B29/B27	METERS
// P37_P70.agc:843
//#	R/APRE		R/A							DP	B6
// P37_P70.agc:844
//#	P/RPRE		P/R							DP	B4
// P37_P70.agc:845
//#	RPRE		MAGNITUDE OF R(T2)/					DP	B29/B27	METERS
// P37_P70.agc:846
//#	X(T2)PRE	COTANGENT OF GAMMA2					DP	B0
// P37_P70.agc:847
//#	DT12		CORRECTION TO FINAL TIME T2				DP	B28	CENTISECONDS
// P37_P70.agc:848
//#	RCON		FINAL RADIUS						DP	B29/B27	METERS
// P37_P70.agc:849
//#	DRCON		DELTA RCON						DP	B29/B27	METERS
// P37_P70.agc:850
//
// P37_P70.agc:851
//PREC100		STQ	DLOAD
// slot 29025
    29025, 58656,
// P37_P70.agc:852
//			SPRTEX
// slot 29026
    29026, 4068,
// P37_P70.agc:853
//			10RTE
// slot 29027
    29027, 28340,
// P37_P70.agc:854
//		STODL	NN1A
// slot 29028
    29028, 16304,
// P37_P70.agc:855
//			RCON
// slot 29029
    29029, 3900,
// P37_P70.agc:856
//		STORE	RD
// slot 29030
    29030, 3944,
// P37_P70.agc:857
//PREC120		DLOAD
// slot 29031
    29031, 65482,
// P37_P70.agc:858
//			2RTEB1
// slot 29032
    29032, 28356,
// P37_P70.agc:859
//		STODL	DT21PR		# DT21PR = POSMAX
// slot 29033
    29033, 16208,
// P37_P70.agc:860
//			M15RTE
// slot 29034
    29034, 28336,
// P37_P70.agc:861
//		STCALL	NN2
// slot 29035
    29035, 32692,
// P37_P70.agc:862
//			RTENCK3
// slot 29036
    29036, 53164,
// P37_P70.agc:863
//PREC125		CALL
// slot 29037
    29037, 65320,
// P37_P70.agc:864
//			PARAM
// slot 29038
    29038, 10046,
// P37_P70.agc:865
//		DLOAD
// slot 29039
    29039, 65482,
// P37_P70.agc:866
//			P
// slot 29040
    29040, 3012,
// P37_P70.agc:867
//		STODL	P/RPRE
// slot 29041
    29041, 12342,
// P37_P70.agc:868
//			R1A
// slot 29042
    29042, 3016,
// P37_P70.agc:869
//		STODL	R/APRE
// slot 29043
    29043, 12346,
// P37_P70.agc:870
//			R1
// slot 29044
    29044, 66,
// P37_P70.agc:871
//		STODL	RPRE
// slot 29045
    29045, 12338,
// P37_P70.agc:872
//			COGA
// slot 29046
    29046, 4090,
// P37_P70.agc:873
//		SL
// slot 29047
    29047, 65378,
// P37_P70.agc:874
//			5
// slot 29048
    29048, 16652,
// P37_P70.agc:875
//		STORE	X(T2)PRE
// slot 29049
    29049, 4008,
// P37_P70.agc:876
//		DCOMP	DAD
// slot 29050
    29050, 36220,
// P37_P70.agc:877
//			X(T2)
// slot 29051
    29051, 4012,
// P37_P70.agc:878
//		ABS	DSU
// slot 29052
    29052, 38220,
// P37_P70.agc:879
//			EPC4RTE
// slot 29053
    29053, 28424,
// P37_P70.agc:880
//		BOV	BMN
// slot 29054
    29054, 40960,
// P37_P70.agc:881
//			PREC130
// slot 29055
    29055, 54018,
// P37_P70.agc:882
//			PREC175
// slot 29056
    29056, 54256,
// P37_P70.agc:883
//
// P37_P70.agc:884
//# DESIRED REENTRY ANGLE NOT ACHIEVED
// P37_P70.agc:885
//
// P37_P70.agc:886
//# Page 909
// P37_P70.agc:887
//PREC130		DLOAD	BMN
// slot 29057
    29057, 41162,
// P37_P70.agc:888
//			NN2
// slot 29058
    29058, 4020,
// P37_P70.agc:889
//			PREC140
// slot 29059
    29059, 54030,
// P37_P70.agc:890
//PREC132		SLOAD	GOTO		# TOO MANY ITERATIONS
// slot 29060
    29060, 43194,
// P37_P70.agc:891
//			OCT605		#	EXIT WITH ALARM
// slot 29061
    29061, 28388,
// P37_P70.agc:892
//			PRECX
// slot 29062
    29062, 54390,
// P37_P70.agc:893
//
// P37_P70.agc:894
//# DETERMINE RADIUS AT WHICH THE DESIRED REENTRY ANGLE WILL BE ACHIEVED
// P37_P70.agc:895
//
// P37_P70.agc:896
//PREC140		DLOAD	BZE
// slot 29063
    29063, 44234,
// P37_P70.agc:897
//			NN1A
// slot 29064
    29064, 4016,
// P37_P70.agc:898
//			PREC162
// slot 29065
    29065, 54094,
// P37_P70.agc:899
//PREC150		DLOAD	SL2						B2
// slot 29066
    29066, 51914,
// P37_P70.agc:900
//			P/RPRE
// slot 29067
    29067, 54,
// P37_P70.agc:901
//		DMP	SL1		# BETA2=BETA1*P/R		B2	PL02
// slot 29068
    29068, 59914,
// P37_P70.agc:902
//			BETA1
// slot 29069
    29069, 4056
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:903
//		PUSH	DLOAD
// slot 29070
    29070, 58636,
// P37_P70.agc:904
//			R/APRE
// slot 29071
    29071, 58,
// P37_P70.agc:905
//		SL4	DMP
// slot 29072
    29072, 34068,
// P37_P70.agc:906
//			00D
// slot 29073
    29073, 2,
// P37_P70.agc:907
//		BDSU	BMN		# BETA3=1-BETA2*R/A
// slot 29074
    29074, 40994,
// P37_P70.agc:908
//			1RTEB4
// slot 29075
    29075, 28300,
// P37_P70.agc:909
//			PREC160
// slot 29076
    29076, 54078,
// P37_P70.agc:910
//PREC155		SL2	SQRT
// slot 29077
    29077, 63124,
// P37_P70.agc:911
//		DMP	BDSU
// slot 29078
    29078, 37130,
// P37_P70.agc:912
//			PHI2
// slot 29079
    29079, 4066,
// P37_P70.agc:913
//			1RTEB3
// slot 29080
    29080, 28296,
// P37_P70.agc:914
//		NORM	PDDL
// slot 29081
    29081, 54658,
// P37_P70.agc:915
//			X1
// slot 29082
    29082, 78,
// P37_P70.agc:916
//		SR1	DDV		# BETA4=BETA2/(1-PHI2*SQRT(BETA3))
// slot 29083
    29083, 47556,
// P37_P70.agc:917
//		SL*	GOTO						B1
// slot 29084
    29084, 43102,
// P37_P70.agc:918
//			0	-1,1
// slot 29085
    29085, 16640,
// P37_P70.agc:919
//			PREC165
// slot 29086
    29086, 54106,
// P37_P70.agc:920
//PREC160		DLOAD	NORM
// slot 29087
    29087, 49610,
// P37_P70.agc:921
//			R/APRE
// slot 29088
    29088, 58,
// P37_P70.agc:922
//			X1
// slot 29089
    29089, 78,
// P37_P70.agc:923
//		BDDV	SL*						B1
// slot 29090
    29090, 44906,
// P37_P70.agc:924
//			1RTEB1
// slot 29091
    29091, 28288,
// P37_P70.agc:925
//			0	-6,1
// slot 29092
    29092, 16630,
// P37_P70.agc:926
//		GOTO
// slot 29093
    29093, 65360,
// P37_P70.agc:927
//			PREC165
// slot 29094
    29094, 54106,
// P37_P70.agc:928
//PREC162		DLOAD	NORM
// slot 29095
    29095, 49610,
// P37_P70.agc:929
//			RPRE
// slot 29096
    29096, 50,
// P37_P70.agc:930
//			X1
// slot 29097
    29097, 78,
// P37_P70.agc:931
//		BDDV	SL*		# BETA4=RD/RPRE			B1
// slot 29098
    29098, 44906,
// P37_P70.agc:932
//			RD
// slot 29099
    29099, 3944,
// P37_P70.agc:933
//			0 -1,1
// slot 29100
    29100, 16640,
// P37_P70.agc:934
//PREC165		SETPD	PUSH
// slot 29101
    29101, 34306,
// P37_P70.agc:935
//			0
// slot 29102
    29102, 2,
// P37_P70.agc:936
//		DSU	DCOMP
// slot 29103
    29103, 48682,
// P37_P70.agc:937
//# Page 910
// P37_P70.agc:938
//			1RTEB1
// slot 29104
    29104, 28288,
// P37_P70.agc:939
//		STORE	BETA12
// slot 29105
    29105, 4074,
// P37_P70.agc:940
//		BMN	DLOAD
// slot 29106
    29106, 58688,
// P37_P70.agc:941
//			PREC168
// slot 29107
    29107, 54136,
// P37_P70.agc:942
//			X(T2)PRE
// slot 29108
    29108, 4008,
// P37_P70.agc:943
//		BMN	DLOAD
// slot 29109
    29109, 58688,
// P37_P70.agc:944
//			PREC167
// slot 29110
    29110, 54132,
// P37_P70.agc:945
//			BETA12
// slot 29111
    29111, 4074,
// P37_P70.agc:946
//		DCOMP
// slot 29112
    29112, 65404,
// P37_P70.agc:947
//		STORE	BETA12
// slot 29113
    29113, 4074,
// P37_P70.agc:948
//PREC167		DLOAD
// slot 29114
    29114, 65482,
// P37_P70.agc:949
//			BETA12
// slot 29115
    29115, 4074,
// P37_P70.agc:950
//PREC168		ABS	DSU
// slot 29116
    29116, 38220,
// P37_P70.agc:951
//			EPC6RTE
// slot 29117
    29117, 28432,
// P37_P70.agc:952
//		BMN	DLOAD
// slot 29118
    29118, 58688,
// P37_P70.agc:953
//			PREC175
// slot 29119
    29119, 54256,
// P37_P70.agc:954
//		DMP	SL1
// slot 29120
    29120, 59914,
// P37_P70.agc:955
//			RPRE
// slot 29121
    29121, 50,
// P37_P70.agc:956
//		PUSH			# RF = NEW RADIUS
// slot 29122
    29122, 65292,
// P37_P70.agc:957
//PREC170		DLOAD	DAD
// slot 29123
    29123, 36298,
// P37_P70.agc:958
//			NN2
// slot 29124
    29124, 4020,
// P37_P70.agc:959
//			1RTEB28
// slot 29125
    29125, 28324,
// P37_P70.agc:960
//		STORE	NN2
// slot 29126
    29126, 4020,
// P37_P70.agc:961
//		VLOAD	SET
// slot 29127
    29127, 36090,
// P37_P70.agc:962
//			R(T2)/
// slot 29128
    29128, 3932,
// P37_P70.agc:963
//			RVSW
// slot 29129
    29129, 3692,
// P37_P70.agc:964
//		STOVL	RVEC
// slot 29130
    29130, 23390,
// P37_P70.agc:965
//			V(T2)/
// slot 29131
    29131, 3984,
// P37_P70.agc:966
//		SIGN
// slot 29132
    29132, 65514,
// P37_P70.agc:967
//			BETA12
// slot 29133
    29133, 4074,
// P37_P70.agc:968
//		STODL	VVEC
// slot 29134
    29134, 15308,
// P37_P70.agc:969
//			1RTEB1
// slot 29135
    29135, 28288,
// P37_P70.agc:970
//		SIGN	DCOMP
// slot 29136
    29136, 48874,
// P37_P70.agc:971
//			BETA12
// slot 29137
    29137, 4074,
// P37_P70.agc:972
//		LXA,2	DLOAD
// slot 29138
    29138, 58840,
// P37_P70.agc:973
//			MPAC
// slot 29139
    29139, 216,
// P37_P70.agc:974
//		LXC,1	SXA,2
// slot 29140
    29140, 56512,
// P37_P70.agc:975
//			CONICX1
// slot 29141
    29141, 4024,
// P37_P70.agc:976
//			SGNRDOT
// slot 29142
    29142, 3036,
// P37_P70.agc:977
//		STCALL	RDESIRED	# COMPUTED DT12 (CORRECTION TO TIME OF
// slot 29143
    29143, 31712,
// P37_P70.agc:978
//			TIMERAD		#	NEW RADIUS)
// slot 29144
    29144, 22236,
// P37_P70.agc:979
//		DLOAD	SIGN
// slot 29145
    29145, 62922,
// P37_P70.agc:980
//			T
// slot 29146
    29146, 62,
// P37_P70.agc:981
//			BETA12
// slot 29147
    29147, 4074,
// P37_P70.agc:982
//		PDDL	NORM		# DT21=(PHI4)DT21			PL02D
// slot 29148
    29148, 49578,
// P37_P70.agc:983
//			DT21PR
// slot 29149
    29149, 3920,
// P37_P70.agc:984
//			X1
// slot 29150
    29150, 78,
// P37_P70.agc:985
//		BDDV	SL*
// slot 29151
    29151, 44906,
// P37_P70.agc:986
//			00D
// slot 29152
    29152, 2,
// P37_P70.agc:987
//			0 -3,1
// slot 29153
    29153, 16636,
// P37_P70.agc:988
//# Page 911
// P37_P70.agc:989
//		PUSH	BMN		# BETA13=(DT21)/(DT21PR)	R3 	PL04D
// slot 29154
    29154, 40972,
// P37_P70.agc:990
//			PREC172
// slot 29155
    29155, 54224,
// P37_P70.agc:991
//		DLOAD	PDDL		# BETA14=1			B0 	PL04D
// slot 29156
    29156, 54730,
// P37_P70.agc:992
//			2RTEB1
// slot 29157
    29157, 28356,
// P37_P70.agc:993
//		GOTO
// slot 29158
    29158, 65360,
// P37_P70.agc:994
//			PREC173
// slot 29159
    29159, 54228,
// P37_P70.agc:995
//PREC172		DLOAD	PDDL		# BETA14=.6			B0 	PL04D
// slot 29160
    29160, 54730,
// P37_P70.agc:996
//			M.6RTE
// slot 29161
    29161, 28344,
// P37_P70.agc:997
//PREC173		DDV	DSU
// slot 29162
    29162, 38258,
// P37_P70.agc:998
//			02D
// slot 29163
    29163, 6,
// P37_P70.agc:999
//			1RTEB3
// slot 29164
    29164, 28296,
// P37_P70.agc:1000
//		BMN	DLOAD
// slot 29165
    29165, 58688,
// P37_P70.agc:1001
//			PREC174
// slot 29166
    29166, 54244,
// P37_P70.agc:1002
//		DMP
// slot 29167
    29167, 65290,
// P37_P70.agc:1003
//			DT21PR
// slot 29168
    29168, 3920,
// P37_P70.agc:1004
//		STORE	00D		# DT21=(BETA14)DT21PR		B28
// slot 29169
    29169, 2,
// P37_P70.agc:1005
//PREC174		DLOAD	PUSH
// slot 29170
    29170, 34506,
// P37_P70.agc:1006
//			00D
// slot 29171
    29171, 2,
// P37_P70.agc:1007
//		STCALL	DT21PR
// slot 29172
    29172, 32592,
// P37_P70.agc:1008
//			RTENCK2
// slot 29173
    29173, 53136,
// P37_P70.agc:1009
//		GOTO
// slot 29174
    29174, 65360,
// P37_P70.agc:1010
//			PREC125
// slot 29175
    29175, 53978,
// P37_P70.agc:1011
//PREC175		DLOAD	DSU
// slot 29176
    29176, 38346,
// P37_P70.agc:1012
//			RPRE
// slot 29177
    29177, 50,
// P37_P70.agc:1013
//			RD
// slot 29178
    29178, 3944,
// P37_P70.agc:1014
//		PUSH	ABS		# RPRE-RD = RERR
// slot 29179
    29179, 42508,
// P37_P70.agc:1015
//		DSU	BMN
// slot 29180
    29180, 41002,
// P37_P70.agc:1016
//			EPC7RTE
// slot 29181
    29181, 28436,
// P37_P70.agc:1017
//			PREC220
// slot 29182
    29182, 29574,
// P37_P70.agc:1018
//
// P37_P70.agc:1019
//# DESIRED RADIUS HAS NOT BEEN ACHIEVED
// P37_P70.agc:1020
//
// P37_P70.agc:1021
//		DLOAD	BZE
// slot 29183
    29183, 44234,
// P37_P70.agc:1022
//			NN1A
// slot 29184
    29184, 4016,
// P37_P70.agc:1023
//			PREC132		# TOO MANY ITERATIONS
// slot 29185
    29185, 54024,
// P37_P70.agc:1024
//		DSU	BZE
// slot 29186
    29186, 44074,
// P37_P70.agc:1025
//			10RTE
// slot 29187
    29187, 28340,
// P37_P70.agc:1026
//			PREC207
// slot 29188
    29188, 54334,
// P37_P70.agc:1027
//PREC205		DLOAD	DSU		# NOT FIRST PASS OF ITERATION
// slot 29189
    29189, 38346,
// P37_P70.agc:1028
//			RPRE'
// slot 29190
    29190, 3952,
// P37_P70.agc:1029
//			RPRE		# RPRE'-RPRE			B29/B27
// slot 29191
    29191, 50,
// P37_P70.agc:1030
//		NORM	BDDV
// slot 29192
    29192, 46466
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1031
//			X2
// slot 29193
    29193, 80,
// P37_P70.agc:1032
//			DRCON
// slot 29194
    29194, 3948,
// P37_P70.agc:1033
//		SL*	PUSH		# DRCON/(RPRE'-RPRE)=S		B2
// slot 29195
    29195, 34398,
// P37_P70.agc:1034
//			0 -2,2
// slot 29196
    29196, 48896,
// P37_P70.agc:1035
//		DAD	BOV		# S GR +4 OR LS -4
// slot 29197
    29197, 32794,
// P37_P70.agc:1036
//			1RTEB1
// slot 29198
    29198, 28288,
// P37_P70.agc:1037
//			PREC205M
// slot 29199
    29199, 54312,
// P37_P70.agc:1038
//		ABS	DSU
// slot 29200
    29200, 38220,
// P37_P70.agc:1039
//# Page 912
// P37_P70.agc:1040
//			1RTEB1
// slot 29201
    29201, 28288,
// P37_P70.agc:1041
//		BMN
// slot 29202
    29202, 65344,
// P37_P70.agc:1042
//			PREC206
// slot 29203
    29203, 54318,
// P37_P70.agc:1043
//PREC205M	DLOAD	DCOMP		# S GR 0 OR LS -4
// slot 29204
    29204, 48842,
// P37_P70.agc:1044
//			2RTEB1
// slot 29205
    29205, 28356,
// P37_P70.agc:1045
//		PDDL			# S=-4				B2
// slot 29206
    29206, 65450,
// P37_P70.agc:1046
//PREC206		DLOAD	DMP
// slot 29207
    29207, 34250,
// P37_P70.agc:1047
//		SL2
// slot 29208
    29208, 65428,
// P37_P70.agc:1048
//		STORE	DRCON		# DRCON=S(RERR)			B29
// slot 29209
    29209, 3948,
// P37_P70.agc:1049
//		DAD
// slot 29210
    29210, 65306,
// P37_P70.agc:1050
//			RCON
// slot 29211
    29211, 3900,
// P37_P70.agc:1051
//		STORE	RCON		# RCON+DRCON=RCON
// slot 29212
    29212, 3900,
// P37_P70.agc:1052
//		GOTO
// slot 29213
    29213, 65360,
// P37_P70.agc:1053
//			PREC210
// slot 29214
    29214, 54364,
// P37_P70.agc:1054
//PREC207		DLOAD	DSQ		# FIRST PASS OF ITERATION
// slot 29215
    29215, 52938,
// P37_P70.agc:1055
//			RD
// slot 29216
    29216, 3944,
// P37_P70.agc:1056
//		NORM	SR1
// slot 29217
    29217, 57986,
// P37_P70.agc:1057
//			X1
// slot 29218
    29218, 78,
// P37_P70.agc:1058
//		PDDL	NORM
// slot 29219
    29219, 49578,
// P37_P70.agc:1059
//			RPRE
// slot 29220
    29220, 50,
// P37_P70.agc:1060
//			X2
// slot 29221
    29221, 80,
// P37_P70.agc:1061
//		XSU,1	BDDV
// slot 29222
    29222, 46432,
// P37_P70.agc:1062
//			X2
// slot 29223
    29223, 78,
// P37_P70.agc:1063
//		SR*
// slot 29224
    29224, 65374,
// P37_P70.agc:1064
//			0 -1,1
// slot 29225
    29225, 17152,
// P37_P70.agc:1065
//		STORE	RCON		# RD**2/RPRE=RCON
// slot 29226
    29226, 3900,
// P37_P70.agc:1066
//		DSU
// slot 29227
    29227, 65322,
// P37_P70.agc:1067
//			RD
// slot 29228
    29228, 3944,
// P37_P70.agc:1068
//		STORE	DRCON		# RCON-RD=DRCON
// slot 29229
    29229, 3948,
// P37_P70.agc:1069
//PREC210		DLOAD			# PREPARE FOR NEXT ITERATION
// slot 29230
    29230, 65482,
// P37_P70.agc:1070
//			RPRE
// slot 29231
    29231, 50,
// P37_P70.agc:1071
//		STODL	RPRE'
// slot 29232
    29232, 16240,
// P37_P70.agc:1072
//			NN1A
// slot 29233
    29233, 4016,
// P37_P70.agc:1073
//		DSU
// slot 29234
    29234, 65322,
// P37_P70.agc:1074
//			1RTEB28
// slot 29235
    29235, 28324,
// P37_P70.agc:1075
//		STCALL	NN1A
// slot 29236
    29236, 32688,
// P37_P70.agc:1076
//			V2T100
// slot 29237
    29237, 54394,
// P37_P70.agc:1077
//		BHIZ	GOTO
// slot 29238
    29238, 43056,
// P37_P70.agc:1078
//			PREC120
// slot 29239
    29239, 53966,
// P37_P70.agc:1079
//			PRECX
// slot 29240
    29240, 54390,
// P37_P70.agc:1080
//
// P37_P70.agc:1081
//# DESIRED RADIUS ACHIEVED
// P37_P70.agc:1082
//
// P37_P70.agc:1083
//		SETLOC	RTE2
// P37_P70.agc:1084
//		BANK
// P37_P70.agc:1085
//PREC220		DLOAD	DSU
// slot 16835
    16835, 38346,
// P37_P70.agc:1086
//			X(T2)
// slot 16836
    16836, 4012,
// P37_P70.agc:1087
//			X(T2)PRE
// slot 16837
    16837, 4008,
// P37_P70.agc:1088
//		ABS	DSU
// slot 16838
    16838, 38220,
// P37_P70.agc:1089
//			EPC8RTE
// slot 16839
    16839, 29596,
// P37_P70.agc:1090
//# Page 913
// P37_P70.agc:1091
//		BMN	SLOAD
// slot 16840
    16840, 56640,
// P37_P70.agc:1092
//			PREC225
// slot 16841
    16841, 54386,
// P37_P70.agc:1093
//			OCT613
// slot 16842
    16842, 29600,
// P37_P70.agc:1094
//		GOTO
// slot 16843
    16843, 65360,
// P37_P70.agc:1095
//			PRECX		# IF REENTRY ANGLE OUT OF LIMITS
// slot 16844
    16844, 54390,
// P37_P70.agc:1096
//
// P37_P70.agc:1097
//EPC8RTE		2DEC	.002
// slot 16845 16846
    16845, 64, 16846, 25166,
// P37_P70.agc:1098
//
// P37_P70.agc:1099
//OCT613		OCT	613
// slot 16847
    16847, 790,
// P37_P70.agc:1100
//
// P37_P70.agc:1101
//# DESIRED FINAL ANGLE HAS BEEN REACHED.
// P37_P70.agc:1102
//
// P37_P70.agc:1103
//		SETLOC	RTE
// P37_P70.agc:1104
//		BANK
// P37_P70.agc:1105
//PREC225		DLOAD
// slot 29241
    29241, 65482,
// P37_P70.agc:1106
//			ZERORTE
// slot 29242
    29242, 28328,
// P37_P70.agc:1107
//PRECX		GOTO
// slot 29243
    29243, 65360,
// P37_P70.agc:1108
//			SPRTEX
// slot 29244
    29244, 4068,
// P37_P70.agc:1109
//
// P37_P70.agc:1110
//# Page 914
// P37_P70.agc:1111
//# INTEGRATION CALLING SUBROUTINE
// P37_P70.agc:1112
//#
// P37_P70.agc:1113
//# DESCRIPTION
// P37_P70.agc:1114
//#	PERFORMS CONIC AND PRECISION INTEGRATIONS USING SUBROUTINE INTEGRVS.  THERE ARE THREE ENTRANCES (RTENCK1,
// P37_P70.agc:1115
//#	RTENCK2, AND RTENCK3) FOR DIFFERENT SOURCES OF INPUT AND DIFFERENT OPTIONS.  THERE IS A COMMON SET OF OUTPUT
// P37_P70.agc:1116
//# 	WHICH INCLUDES SET UP OF INPUT FOR THE PARAM SUBROUTINE.
// P37_P70.agc:1117
//#
// P37_P70.agc:1118
//# RTENCK1 (CONIC INTEGRATION)
// P37_P70.agc:1119
//#
// P37_P70.agc:1120
//#    CALLING SEQUENCE
// P37_P70.agc:1121
//#	L	CALL
// P37_P70.agc:1122
//#	L+1		RTENCK1
// P37_P70.agc:1123
//#
// P37_P70.agc:1124
//#    ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:1125
//#	SAME AS FOR THE RTENCK3 ENTRANCE
// P37_P70.agc:1126
//#
// P37_P70.agc:1127
//# RTENCK2 (PRECISION INTEGRATION)
// P37_P70.agc:1128
//#
// P37_P70.agc:1129
//#    CALLING SEQUENCE
// P37_P70.agc:1130
//#	L	CALL
// P37_P70.agc:1131
//#	L+1		RTENCK2
// P37_P70.agc:1132
//#
// P37_P70.agc:1133
//#    ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:1134
//#	PUSHLIST
// P37_P70.agc:1135
//#	    PUSHLOC-2	INTEGRATION TIME DT12 (CORRECTION TO T2)		DP	B28	CS
// P37_P70.agc:1136
//#	OTHER
// P37_P70.agc:1137
//#	    R(T2)/	FINAL POSITION VECTOR					VECTOR	B29	METERS
// P37_P70.agc:1138
//#	    V(T2)/	FINAL VELOCITY VECTOR					VECTOR	B7	METERS/CS
// P37_P70.agc:1139
//#	    T2		FINAL TIME						DP	B28	CS
// P37_P70.agc:1140
//#
// P37_P70.agc:1141
//# RTENCK3 (PRECISION INTEGRATION)
// P37_P70.agc:1142
//#
// P37_P70.agc:1143
//#    CALLING SEQUENCE
// P37_P70.agc:1144
//#	L	CALL
// P37_P70.agc:1145
//#	L+1		RTENCK3
// P37_P70.agc:1146
//#
// P37_P70.agc:1147
//#    ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:1148
//#	R(T1)/		INITIAL POSITION VECTOR					VECTOR	B29	METERS
// P37_P70.agc:1149
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7	M/CS
// P37_P70.agc:1150
//#	T1		INITIAL VECTOR TIME					DP	B28	CS
// P37_P70.agc:1151
//#	T2		FINAL TIME						DP	B28	CS
// P37_P70.agc:1152
//#
// P37_P70.agc:1153
//# EXIT MODE
// P37_P70.agc:1154
//#	AT L+2 OF CALLING SEQUENCE
// P37_P70.agc:1155
//#
// P37_P70.agc:1156
//# SUBROUTINES CALLED
// P37_P70.agc:1157
//#	INTSTALL
// P37_P70.agc:1158
//#	INTEGRVS
// P37_P70.agc:1159
//#
// P37_P70.agc:1160
//# OUTPUT
// P37_P70.agc:1161
//#    PUSHLIST
// P37_P70.agc:1162
//# Page 915
// P37_P70.agc:1163
//#	PUSHLOC-6	FINAL POSITION VECTOR R(T2)/				VECTOR	B29	METERS
// P37_P70.agc:1164
//#	X1		CONICS MUTABLE ENTRY FOR KERBIN (-2)			SP	B14
// P37_P70.agc:1165
//#    MPAC
// P37_P70.agc:1166
//#			FINAL VELOCITY VECTOR V(T2)/				VECTOR	B7	M/CS
// P37_P70.agc:1167
//#    OTHER
// P37_P70.agc:1168
//#	R(T2)/		AS IN PUSHLIST
// P37_P70.agc:1169
//#	V(T2)/		AS IN MPAC
// P37_P70.agc:1170
//#	T2		FINAL TIME						DP	B28	CS
// P37_P70.agc:1171
//
// P37_P70.agc:1172
//		SETLOC	RTE3
// P37_P70.agc:1173
//		BANK
// P37_P70.agc:1174
//RTENCK1		STQ	CALL
// slot 28608
    28608, 37920
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1175
//			RTENCKEX
// slot 28609
    28609, 4022,
// P37_P70.agc:1176
//			INTSTALL
// slot 28610
    28610, 24132,
// P37_P70.agc:1177
//		VLOAD	SET
// slot 28611
    28611, 36090,
// P37_P70.agc:1178
//			R(T1)/
// slot 28612
    28612, 3904,
// P37_P70.agc:1179
//			INTYPFLG
// slot 28613
    28613, 1654,
// P37_P70.agc:1180
//		GOTO
// slot 28614
    28614, 65360,
// P37_P70.agc:1181
//			RTENCK3B
// slot 28615
    28615, 53176,
// P37_P70.agc:1182
//
// P37_P70.agc:1183
//RTENCK2		STQ	CALL
// slot 28616
    28616, 37920,
// P37_P70.agc:1184
//			RTENCKEX
// slot 28617
    28617, 4022,
// P37_P70.agc:1185
//			INTSTALL
// slot 28618
    28618, 24132,
// P37_P70.agc:1186
//		CLEAR	VLOAD
// slot 28619
    28619, 64792,
// P37_P70.agc:1187
//			INTYPFLG
// slot 28620
    28620, 1910,
// P37_P70.agc:1188
//			R(T2)/
// slot 28621
    28621, 3932,
// P37_P70.agc:1189
//		STOVL	RCV
// slot 28622
    28622, 22202,
// P37_P70.agc:1190
//			V(T2)/
// slot 28623
    28623, 3984,
// P37_P70.agc:1191
//		STODL	VCV
// slot 28624
    28624, 14022,
// P37_P70.agc:1192
//			T2
// slot 28625
    28625, 4028,
// P37_P70.agc:1193
//		STORE	TET
// slot 28626
    28626, 1694,
// P37_P70.agc:1194
//		DAD
// slot 28627
    28627, 65306,
// P37_P70.agc:1195
//		GOTO
// slot 28628
    28628, 65360,
// P37_P70.agc:1196
//			RTENCK3D
// slot 28629
    28629, 53188,
// P37_P70.agc:1197
//
// P37_P70.agc:1198
//RTENCK3		STQ	CALL
// slot 28630
    28630, 37920,
// P37_P70.agc:1199
//			RTENCKEX
// slot 28631
    28631, 4022,
// P37_P70.agc:1200
//			INTSTALL
// slot 28632
    28632, 24132,
// P37_P70.agc:1201
//RTENCK3A	VLOAD	CLEAR
// slot 28633
    28633, 36090,
// P37_P70.agc:1202
//			R(T1)/
// slot 28634
    28634, 3904,
// P37_P70.agc:1203
//			INTYPFLG
// slot 28635
    28635, 1910,
// P37_P70.agc:1204
//RTENCK3B	STOVL	RCV
// slot 28636
    28636, 22202,
// P37_P70.agc:1205
//			V2(T1)/
// slot 28637
    28637, 3968,
// P37_P70.agc:1206
//		STODL	VCV
// slot 28638
    28638, 14022,
// P37_P70.agc:1207
//			T1
// slot 28639
    28639, 3996,
// P37_P70.agc:1208
//		STODL	TET
// slot 28640
    28640, 13982,
// P37_P70.agc:1209
//			T2
// slot 28641
    28641, 4028,
// P37_P70.agc:1210
//# Page 916
// P37_P70.agc:1211
//RTENCK3D	STORE	TDEC1
// slot 28642
    28642, 66,
// P37_P70.agc:1212
//		CLEAR	CALL
// slot 28643
    28643, 37912,
// P37_P70.agc:1213
//			MOONFLAG
// slot 28644
    28644, 358,
// P37_P70.agc:1214
//			INTEGRVS
// slot 28645
    28645, 23738,
// P37_P70.agc:1215
//		VLOAD
// slot 28646
    28646, 65530,
// P37_P70.agc:1216
//			RATT
// slot 28647
    28647, 2,
// P37_P70.agc:1217
//		STORE	R(T2)/
// slot 28648
    28648, 3932,
// P37_P70.agc:1218
//		PDDL	LXC,1
// slot 28649
    28649, 57514,
// P37_P70.agc:1219
//			TAT
// slot 28650
    28650, 26,
// P37_P70.agc:1220
//			CONICX1
// slot 28651
    28651, 4024,
// P37_P70.agc:1221
//		STOVL	T2
// slot 28652
    28652, 24508,
// P37_P70.agc:1222
//			VATT
// slot 28653
    28653, 14,
// P37_P70.agc:1223
//		STORE	V(T2)/
// slot 28654
    28654, 3984,
// P37_P70.agc:1224
//		GOTO
// slot 28655
    28655, 65360,
// P37_P70.agc:1225
//			RTENCKEX
// slot 28656
    28656, 4022,
// P37_P70.agc:1226
//		SETLOC	RTE
// P37_P70.agc:1227
//		BANK
// P37_P70.agc:1228
//
// P37_P70.agc:1229
//# Page 917
// P37_P70.agc:1230
//# V2(T1) COMPUTATION SUBROUTINE
// P37_P70.agc:1231
//#
// P37_P70.agc:1232
//# DESCRIPTION
// P37_P70.agc:1233
//#	A POST IMPULSE VELOCITY VECTOR (V2(T1)) IS COMPUTED WHICH EITHER
// P37_P70.agc:1234
//#	(1)	MEETS THE INPUT VELOCITY CHANGE DESIRED (RTEDVD) IN A MINIMUM TIME	OR
// P37_P70.agc:1235
//#	(2)	IF A VELOCITY CHANGE ISN'T SPECIFIED (RTEDVD = 0), A V2(T1) IS COMPUTED WHICH MINIMIZES THE IMPULSE (DV)
// P37_P70.agc:1236
//#		AND CONSEQUENTLY FUEL.
// P37_P70.agc:1237
//#
// P37_P70.agc:1238
//# CALLING SEQUENCE
// P37_P70.agc:1239
//#	L	CALL
// P37_P70.agc:1240
//#	L+1		V2T100
// P37_P70.agc:1241
//#
// P37_P70.agc:1242
//# NORMAL EXIT MODE
// P37_P70.agc:1243
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC = 0
// P37_P70.agc:1244
//#
// P37_P70.agc:1245
//# ALARM EXIT MODE
// P37_P70.agc:1246
//#	AT L+2 OF CALLING SEQUENCE WITH MPAC = OCTAL 605 FOR EXCESS ITERATIONS.
// P37_P70.agc:1247
//#
// P37_P70.agc:1248
//# SUBROUTINES CALLED
// P37_P70.agc:1249
//#	GAMDV10
// P37_P70.agc:1250
//#	XT1LIM
// P37_P70.agc:1251
//#	DVCALC
// P37_P70.agc:1252
//#
// P37_P70.agc:1253
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:1254
//#    PUSHLIST
// P37_P70.agc:1255
//#	NONE
// P37_P70.agc:1256
//#    MPAC
// P37_P70.agc:1257
//#	NONE
// P37_P70.agc:1258
//#    OTHER
// P37_P70.agc:1259
//#	R(T1)		MAGNITUDE OF INITIAL POSITION VECTOR			DP	B29/B27	METERS
// P37_P70.agc:1260
//#	RCON		MAGNITUDE OF FINAL POSITION VECTOR			DP	B29/B27	METERS
// P37_P70.agc:1261
//#	V(T1)/		INITIAL VELOCITY VECTOR					VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1262
//#	RTEDVD		DELTA VELOCITY DESIRED					DP	B7/B5	METERS/CS
// P37_P70.agc:1263
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:1264
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:1265
//#	X(T2)		COTANGENT OF FINAL FLIGHT PATH ANGLE			DP	B0
// P37_P70.agc:1266
//#	X(T1)		COTANGENT OF INITIAL FLIGHT PATH ANGLE (INPUT FOR PREC)	DP	B5
// P37_P70.agc:1267
//#	CFPA		COSINE OF INITIAL FLIGHT PATH ANGLE			DP	B1
// P37_P70.agc:1268
//#	MAMAX1		MAJOR AXIS LIMIT FOR LOWER BOUND ON GAMDV ITERATOR	DP	B30/B28	METERS
// P37_P70.agc:1269
//#	MAMAX2		MAJOR AXIS LIMIT FOR UPPER BOUND ON GAMDV ITERATOR	DP	B30/B28	METERS
// P37_P70.agc:1270
//#	PHI2		REENTRY NEAR PERIGEE OR APOGEE INDICATE (RTE ONLY)	DP	B2	-1 PERIGEE, +1 APOGEE
// P37_P70.agc:1271
//#	N1		CONIC OR PRECISION ITERATION OPERATOR			DP	B28	NEGATIVE CONIC, PLUS PREC
// P37_P70.agc:1272
//#
// P37_P70.agc:1273
//# OUTPUT
// P37_P70.agc:1274
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1275
//#	DV		INITIAL VELOCITY CHANGE					DP	B7/B5	METERS/CS
// P37_P70.agc:1276
//#	X(T1)		COTANGENT OF INITIAL FLIGHT PATH ANGLE (POST IMPULSE)	DP	B5
// P37_P70.agc:1277
//#	PCON		SEMI-LATUS RECTUM					DP	B28/B26	METERS
// P37_P70.agc:1278
//#	BETA1		1+X(T2)**2						DP	B1
// P37_P70.agc:1279
//#
// P37_P70.agc:1280
//# Page 918
// P37_P70.agc:1281
//#
// P37_P70.agc:1282
//# DEBRIS
// P37_P70.agc:1283
//#    PUSHLIST
// P37_P70.agc:1284
//#	00D		X(T1),,=PREVIOUS PRECISION X(T1)			DP	B5
// P37_P70.agc:1285
//#	02D		THETA1=BETA5*LAMBDA-1					TP	B17
// P37_P70.agc:1286
//#	05D		THETA2=2*R(T1)*(LAMBDA-1)				TP	B38/B36
// P37_P70.agc:1287
//#	08D		THETA3=MU**.5/R(T1)					DP	B-4/B-5
// P37_P70.agc:1288
//#	10D		X(T1)MIN=LOWER BOUND ON X(T1) IN GAMDV ITERATOR		DP	B5
// P37_P70.agc:1289
//#	12D		DX(T1)MAX=MAXIMUM DELTA X(T1)				DP	B5
// P37_P70.agc:1290
//#	14D		X(T1)MAX=UPPER BOUND ON X(T1) IN GAMDV ITERATOR		DP	B5
// P37_P70.agc:1291
//#	16D		DX(T1)=ITERATOR INCREMENT				DP	B5
// P37_P70.agc:1292
//#	31D		GAMDV10 SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1293
//#	32D		DVCALC SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1294
//#	33D		V2T100 SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1295
//
// P37_P70.agc:1296
//V2T100		STQ	DLOAD
// slot 29245
    29245, 58656,
// P37_P70.agc:1297
//			33D
// slot 29246
    29246, 66,
// P37_P70.agc:1298
//			RCON
// slot 29247
    29247, 3900,
// P37_P70.agc:1299
//		BMN	DSU		# ABORT IF RCON NEGATIVE
// slot 29248
    29248, 38208,
// P37_P70.agc:1300
//			V2TERROR
// slot 29249
    29249, 54410,
// P37_P70.agc:1301
//			R(T1)
// slot 29250
    29250, 3916,
// P37_P70.agc:1302
//		BMN
// slot 29251
    29251, 65344
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1303
//			V2T101
// slot 29252
    29252, 54416,
// P37_P70.agc:1304
//V2TERROR	EXIT			#	OR IF LAMBDA LESS THAN ONE
// slot 29253
    29253, 65532
)).

// bank 32, slots 29254-29254
function agcAotUnit1626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P37_P70.agc:1305
//		TC	POODOO		# NO SOLUTION IF LAMBDA LESS THAN 1
// slot 29254
    if slot <> 29254 or instruction <> 3025 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3025, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1626] to agcAotUnit1626@.

agcAotInstallSourceRope(list(
// P37_P70.agc:1306
//		OCT	00610
// slot 29255
    29255, 784,
// P37_P70.agc:1307
//V2T101		SETPD	CLEAR
// slot 29256
    29256, 35842,
// P37_P70.agc:1308
//			0		#					PL00D
// slot 29257
    29257, 2,
// P37_P70.agc:1309
//			F2RTE
// slot 29258
    29258, 372,
// P37_P70.agc:1310
//		DLOAD	NORM
// slot 29259
    29259, 49610,
// P37_P70.agc:1311
//			RCON
// slot 29260
    29260, 3900,
// P37_P70.agc:1312
//			X1
// slot 29261
    29261, 78,
// P37_P70.agc:1313
//		PDDL	NORM
// slot 29262
    29262, 49578,
// P37_P70.agc:1314
//			R(T1)
// slot 29263
    29263, 3916,
// P37_P70.agc:1315
//			S1
// slot 29264
    29264, 82,
// P37_P70.agc:1316
//		STORE	10D
// slot 29265
    29265, 22,
// P37_P70.agc:1317
//		SR1	DDV		# R1/RCON = LAMBDA		B1
// slot 29266
    29266, 47556,
// P37_P70.agc:1318
//		XSU,1	PDDL		#					PL02D
// slot 29267
    29267, 54624,
// P37_P70.agc:1319
//			S1
// slot 29268
    29268, 80,
// P37_P70.agc:1320
//			X(T2)
// slot 29269
    29269, 4012,
// P37_P70.agc:1321
//		DSQ
// slot 29270
    29270, 65436,
// P37_P70.agc:1322
//		SR1	DAD
// slot 29271
    29271, 36292,
// P37_P70.agc:1323
//			1RTEB1
// slot 29272
    29272, 28288,
// P37_P70.agc:1324
//		STORE	BETA1		# 1+X(T2)**2 = BETA1		B1
// slot 29273
    29273, 4056,
// P37_P70.agc:1325
//		DMP
// slot 29274
    29274, 65290,
// P37_P70.agc:1326
//			00D
// slot 29275
    29275, 2,
// P37_P70.agc:1327
//		STORE	28D		# BETAI*LAMBDA = BETA5
// slot 29276
    29276, 58,
// P37_P70.agc:1328
//		DMP	SL*
// slot 29277
    29277, 44810,
// P37_P70.agc:1329
//			00D
// slot 29278
    29278, 2,
// P37_P70.agc:1330
//			0 -7,1
// slot 29279
    29279, 16628,
// P37_P70.agc:1331
//		SL*	DSU
// slot 29280
    29280, 38238,
// P37_P70.agc:1332
//# Page 919
// P37_P70.agc:1333
//			0 -7,1
// slot 29281
    29281, 16628,
// P37_P70.agc:1334
//			1RTEB17
// slot 29282
    29282, 28316,
// P37_P70.agc:1335
//		RTB	PDDL		# BETA5*LAMBDA-1 = THETA1	B17	PL05D
// slot 29283
    29283, 54584,
// P37_P70.agc:1336
//			TPMODE
// slot 29284
    29284, 38634,
// P37_P70.agc:1337
//			1RTEB1
// slot 29285
    29285, 28288,
// P37_P70.agc:1338
//		SR*	DCOMP
// slot 29286
    29286, 48734,
// P37_P70.agc:1339
//			0,1
// slot 29287
    29287, 17154,
// P37_P70.agc:1340
//		DAD	DMP
// slot 29288
    29288, 34074,
// P37_P70.agc:1341
//			00D
// slot 29289
    29289, 2,
// P37_P70.agc:1342
//			R(T1)
// slot 29290
    29290, 3916,
// P37_P70.agc:1343
//		SL*	RTB
// slot 29291
    29291, 40030,
// P37_P70.agc:1344
//			0 -7D,1
// slot 29292
    29292, 16628,
// P37_P70.agc:1345
//			TPMODE
// slot 29293
    29293, 38634,
// P37_P70.agc:1346
//		PDDL			# 2*R(T1)*(LAMBDA-1)=THETA2	B38/B36 PL08D
// slot 29294
    29294, 65450,
// P37_P70.agc:1347
//			RTMURTE
// slot 29295
    29295, 28468,
// P37_P70.agc:1348
//		NORM	SR1
// slot 29296
    29296, 57986,
// P37_P70.agc:1349
//			X2
// slot 29297
    29297, 80,
// P37_P70.agc:1350
//		XSU,2	DDV
// slot 29298
    29298, 47464,
// P37_P70.agc:1351
//			S1
// slot 29299
    29299, 80,
// P37_P70.agc:1352
//			10D
// slot 29300
    29300, 22,
// P37_P70.agc:1353
//		SR*	PDDL		# MU**.5/R(T1)=THETA3		B-4/B-5 PL10D
// slot 29301
    29301, 54622,
// P37_P70.agc:1354
//			6,2
// slot 29302
    29302, 48368,
// P37_P70.agc:1355
//			MAMAX1
// slot 29303
    29303, 3924,
// P37_P70.agc:1356
//		PUSH	PUSH		# MAMAX1=MA
// slot 29304
    29304, 34316,
// P37_P70.agc:1357
//		CALL
// slot 29305
    29305, 65320,
// P37_P70.agc:1358
//			XT1LIM
// slot 29306
    29306, 55224,
// P37_P70.agc:1359
//		DCOMP	PUSH		# X(T1)MIN			B5 	PL12D
// slot 29307
    29307, 34428,
// P37_P70.agc:1360
//		DCOMP	SR4
// slot 29308
    29308, 33404,
// P37_P70.agc:1361
//		PDDL	PUSH		# DX(T1)MAX			B5 	PL14D
// slot 29309
    29309, 34474,
// P37_P70.agc:1362
//			MAMAX2
// slot 29310
    29310, 3928,
// P37_P70.agc:1363
//		PUSH	CALL
// slot 29311
    29311, 37900,
// P37_P70.agc:1364
//			XT1LIM
// slot 29312
    29312, 55224,
// P37_P70.agc:1365
//		PDDL	BMN		# X(T1)MAX			B5 	PL16D
// slot 29313
    29313, 41130,
// P37_P70.agc:1366
//			NN1A
// slot 29314
    29314, 4016,
// P37_P70.agc:1367
//			V2T102
// slot 29315
    29315, 54540,
// P37_P70.agc:1368
//		GOTO
// slot 29316
    29316, 65360,
// P37_P70.agc:1369
//			V2T110
// slot 29317
    29317, 54560,
// P37_P70.agc:1370
//
// P37_P70.agc:1371
//# PROCEED HERE IF NOT PRECISION COMPUTATION
// P37_P70.agc:1372
//
// P37_P70.agc:1373
//V2T102		DLOAD
// slot 29318
    29318, 65482,
// P37_P70.agc:1374
//			RTEDVD
// slot 29319
    29319, 3892,
// P37_P70.agc:1375
//		BZE	GOTO
// slot 29320
    29320, 43096,
// P37_P70.agc:1376
//			V2T105
// slot 29321
    29321, 54550,
// P37_P70.agc:1377
//			V2T140
// slot 29322
    29322, 54680,
// P37_P70.agc:1378
//V2T105		DLOAD	BMN
// slot 29323
    29323, 41162,
// P37_P70.agc:1379
//			CFPA
// slot 29324
    29324, 4062,
// P37_P70.agc:1380
//			V2T140
// slot 29325
    29325, 54680,
// P37_P70.agc:1381
//		GOTO
// slot 29326
    29326, 65360,
// P37_P70.agc:1382
//			V2T145
// slot 29327
    29327, 54692,
// P37_P70.agc:1383
//# Page 920
// P37_P70.agc:1384
//# DURING A PRECISION TRAJECTORY ITERATION CONSTRAIN THE INDEPENDENT
// P37_P70.agc:1385
//# VARIABLE TO INSURE THAT ALL CONICS PASS THROUGH RCON ON THE SAME PASS
// P37_P70.agc:1386
//# THROUGH X(T2)
// P37_P70.agc:1387
//
// P37_P70.agc:1388
//V2T110		DLOAD	RTB
// slot 29328
    29328, 40138,
// P37_P70.agc:1389
//			1RTEB17
// slot 29329
    29329, 28316,
// P37_P70.agc:1390
//			TPMODE
// slot 29330
    29330, 38634,
// P37_P70.agc:1391
//		DCOMP	PDDL		# -1				B17 	PL19D
// slot 29331
    29331, 54652,
// P37_P70.agc:1392
//			2RTEB1
// slot 29332
    29332, 28356,
// P37_P70.agc:1393
//		SR*	DSU
// slot 29333
    29333, 38238,
// P37_P70.agc:1394
//			0,1
// slot 29334
    29334, 17154,
// P37_P70.agc:1395
//			00D
// slot 29335
    29335, 2,
// P37_P70.agc:1396
//		DMP	SL*
// slot 29336
    29336, 44810,
// P37_P70.agc:1397
//			28D
// slot 29337
    29337, 58,
// P37_P70.agc:1398
//			0 -7,1
// slot 29338
    29338, 16628,
// P37_P70.agc:1399
//		SL*	TAD
// slot 29339
    29339, 63838,
// P37_P70.agc:1400
//			0 -7,1
// slot 29340
    29340, 16628,
// P37_P70.agc:1401
//		RTB	PDDL		# BETA5(2-LAMBDA)-1=BETA6	B17 	PL19D
// slot 29341
    29341, 54584,
// P37_P70.agc:1402
//			TPMODE
// slot 29342
    29342, 38634,
// P37_P70.agc:1403
//			X(T1)
// slot 29343
    29343, 4004,
// P37_P70.agc:1404
//		STORE	00D		# X(T1),,			B5
// slot 29344
    29344, 2,
// P37_P70.agc:1405
//		TLOAD			#					PL16D
// slot 29345
    29345, 65490,
// P37_P70.agc:1406
//		BMN	BZE
// slot 29346
    29346, 44096,
// P37_P70.agc:1407
//			V2T115
// slot 29347
    29347, 54608,
// P37_P70.agc:1408
//			V2T115
// slot 29348
    29348, 54608,
// P37_P70.agc:1409
//		SL	GOTO
// slot 29349
    29349, 43106,
// P37_P70.agc:1410
//			7
// slot 29350
    29350, 16656,
// P37_P70.agc:1411
//			V2T120
// slot 29351
    29351, 54626,
// P37_P70.agc:1412
//V2T115		DLOAD	BMN
// slot 29352
    29352, 41162,
// P37_P70.agc:1413
//			PHI2
// slot 29353
    29353, 4066,
// P37_P70.agc:1414
//			V2T125
// slot 29354
    29354, 54644,
// P37_P70.agc:1415
//		DCOMP
// slot 29355
    29355, 65404,
// P37_P70.agc:1416
//		STODL	PHI2
// slot 29356
    29356, 16354,
// P37_P70.agc:1417
//			10RTE
// slot 29357
    29357, 28340,
// P37_P70.agc:1418
//		STORE	NN1A
// slot 29358
    29358, 4016,
// P37_P70.agc:1419
//		GOTO
// slot 29359
    29359, 65360,
// P37_P70.agc:1420
//			V2T125
// slot 29360
    29360, 54644,
// P37_P70.agc:1421
//V2T120		SQRT	RTB
// slot 29361
    29361, 40172,
// P37_P70.agc:1422
//			DPMODE
// slot 29362
    29362, 38812,
// P37_P70.agc:1423
//		PDDL	BMN		# BETA6**.5=X(T1)LIM		B5 	PL18D
// slot 29363
    29363, 41130,
// P37_P70.agc:1424
//			PHI2
// slot 29364
    29364, 4066,
// P37_P70.agc:1425
//			V2T130
// slot 29365
    29365, 54656,
// P37_P70.agc:1426
//		DLOAD	STADR
// slot 29366
    29366, 38602,
// P37_P70.agc:1427
//		STORE	14D		# X(T1)LIM = X(T1)MAX
// slot 29367
    29367, 65504,
// P37_P70.agc:1428
//		DCOMP
// slot 29368
    29368, 65404,
// P37_P70.agc:1429
//		STORE	10D		# -X(T1)LIM = X(T1)MIN
// slot 29369
    29369, 22,
// P37_P70.agc:1430
//V2T125		DLOAD	BZE
// slot 29370
    29370, 44234,
// P37_P70.agc:1431
//			X(T1)
// slot 29371
    29371, 4004,
// P37_P70.agc:1432
//			V2T140
// slot 29372
    29372, 54680,
// P37_P70.agc:1433
//		BMN	GOTO
// slot 29373
    29373, 43072
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1434
//# Page 921
// P37_P70.agc:1435
//			V2T140
// slot 29374
    29374, 54680,
// P37_P70.agc:1436
//			V2T145
// slot 29375
    29375, 54692,
// P37_P70.agc:1437
//V2T130		DLOAD	BZE
// slot 29376
    29376, 44234,
// P37_P70.agc:1438
//			X(T1)
// slot 29377
    29377, 4004,
// P37_P70.agc:1439
//			V2T135
// slot 29378
    29378, 54674,
// P37_P70.agc:1440
//		BMN	DLOAD		#					PL16D
// slot 29379
    29379, 58688,
// P37_P70.agc:1441
//			V2T135
// slot 29380
    29380, 54674,
// P37_P70.agc:1442
//		STADR
// slot 29381
    29381, 65324,
// P37_P70.agc:1443
//		STORE	10D		# X(T1)LIM = X(T1)MIN
// slot 29382
    29382, 65512,
// P37_P70.agc:1444
//		GOTO
// slot 29383
    29383, 65360,
// P37_P70.agc:1445
//			V2T145
// slot 29384
    29384, 54692,
// P37_P70.agc:1446
//V2T135		DLOAD	DCOMP		#					PL16D
// slot 29385
    29385, 48842,
// P37_P70.agc:1447
//		STADR
// slot 29386
    29386, 65324,
// P37_P70.agc:1448
//		STORE	14D		# -X(T1)LIM = X(T1)MAX
// slot 29387
    29387, 65504,
// P37_P70.agc:1449
//V2T140		DLOAD
// slot 29388
    29388, 65482,
// P37_P70.agc:1450
//			10D
// slot 29389
    29389, 22,
// P37_P70.agc:1451
//		STODL	X(T1)		# X(T1)MIN = X(T1)
// slot 29390
    29390, 16292,
// P37_P70.agc:1452
//			12D
// slot 29391
    29391, 26,
// P37_P70.agc:1453
//		PUSH	GOTO		# DX(T1)MAX = DX(T1)			PL18D
// slot 29392
    29392, 43020,
// P37_P70.agc:1454
//			V2T150
// slot 29393
    29393, 54702,
// P37_P70.agc:1455
//V2T145		DLOAD
// slot 29394
    29394, 65482,
// P37_P70.agc:1456
//			14D
// slot 29395
    29395, 30,
// P37_P70.agc:1457
//		STODL	X(T1)		# X(T1)MAX = X(T1)
// slot 29396
    29396, 16292,
// P37_P70.agc:1458
//			12D
// slot 29397
    29397, 26,
// P37_P70.agc:1459
//		DCOMP	PUSH		# -DX(T1)MAX = DX(T1)			PL18D
// slot 29398
    29398, 34428,
// P37_P70.agc:1460
//V2T150		CALL			# GOTO X(T1)-DV ITERATOR
// slot 29399
    29399, 65320,
// P37_P70.agc:1461
//			GAMDV10
// slot 29400
    29400, 54878,
// P37_P70.agc:1462
//		DLOAD	BZE		# EXIT IF MINIMUM FUEL MODE
// slot 29401
    29401, 44234,
// P37_P70.agc:1463
//			RTEDVD
// slot 29402
    29402, 3892,
// P37_P70.agc:1464
//			V2T1X
// slot 29403
    29403, 54874,
// P37_P70.agc:1465
//
// P37_P70.agc:1466
//# CONTINUE IF TIME CRITICAL MODE
// P37_P70.agc:1467
//
// P37_P70.agc:1468
//		DSU	BMN
// slot 29404
    29404, 41002,
// P37_P70.agc:1469
//			DV
// slot 29405
    29405, 3980,
// P37_P70.agc:1470
//			V2T155
// slot 29406
    29406, 54722,
// P37_P70.agc:1471
//		GOTO
// slot 29407
    29407, 65360,
// P37_P70.agc:1472
//			V2T175
// slot 29408
    29408, 54776,
// P37_P70.agc:1473
//V2T155		DLOAD	BMN
// slot 29409
    29409, 41162,
// P37_P70.agc:1474
//			NN1A
// slot 29410
    29410, 4016,
// P37_P70.agc:1475
//			V2T160
// slot 29411
    29411, 54732,
// P37_P70.agc:1476
//		GOTO
// slot 29412
    29412, 65360,
// P37_P70.agc:1477
//			V2T185
// slot 29413
    29413, 54812,
// P37_P70.agc:1478
//
// P37_P70.agc:1479
//# CONIC TRAJECTORY COMPUTATION
// P37_P70.agc:1480
//
// P37_P70.agc:1481
//V2T160		DLOAD	BZE
// slot 29414
    29414, 44234,
// P37_P70.agc:1482
//			X(T1)
// slot 29415
    29415, 4004,
// P37_P70.agc:1483
//			V2T165
// slot 29416
    29416, 54744,
// P37_P70.agc:1484
//		BMN	GOTO
// slot 29417
    29417, 43072,
// P37_P70.agc:1485
//# Page 922
// P37_P70.agc:1486
//			V2T165
// slot 29418
    29418, 54744,
// P37_P70.agc:1487
//			V2T300
// slot 29419
    29419, 54870,
// P37_P70.agc:1488
//V2T165		DLOAD	BZE
// slot 29420
    29420, 44234,
// P37_P70.agc:1489
//			CFPA
// slot 29421
    29421, 4062,
// P37_P70.agc:1490
//			V2T300
// slot 29422
    29422, 54870,
// P37_P70.agc:1491
//		BMN	DLOAD
// slot 29423
    29423, 58688,
// P37_P70.agc:1492
//			V2T300
// slot 29424
    29424, 54870,
// P37_P70.agc:1493
//			14D
// slot 29425
    29425, 30,
// P37_P70.agc:1494
//		STODL	X(T1)		# X(T1)MAX=X(T1)
// slot 29426
    29426, 16292,
// P37_P70.agc:1495
//			12D
// slot 29427
    29427, 26,
// P37_P70.agc:1496
//		DCOMP
// slot 29428
    29428, 65404,
// P37_P70.agc:1497
//		STCALL	16D		# -DX(T1)MAX=DX(T1)
// slot 29429
    29429, 28706,
// P37_P70.agc:1498
//			GAMDV10
// slot 29430
    29430, 54878,
// P37_P70.agc:1499
//		DLOAD	DSU
// slot 29431
    29431, 38346,
// P37_P70.agc:1500
//			RTEDVD
// slot 29432
    29432, 3892,
// P37_P70.agc:1501
//			DV
// slot 29433
    29433, 3980,
// P37_P70.agc:1502
//		BMN
// slot 29434
    29434, 65344,
// P37_P70.agc:1503
//			V2T300
// slot 29435
    29435, 54870,
// P37_P70.agc:1504
//V2T175		SET	DLOAD
// slot 29436
    29436, 58648,
// P37_P70.agc:1505
//			F2RTE
// slot 29437
    29437, 116,
// P37_P70.agc:1506
//			X(T1)
// slot 29438
    29438, 4004,
// P37_P70.agc:1507
//		BOFF
// slot 29439
    29439, 65304,
// P37_P70.agc:1508
//			SLOWFLG
// slot 29440
    29440, 3012,
// P37_P70.agc:1509
//			V2T177
// slot 29441
    29441, 54796,
// P37_P70.agc:1510
//		STODL	10D		# X(T1)MIN
// slot 29442
    29442, 12310,
// P37_P70.agc:1511
//			12D		# DX(T1)MAX
// slot 29443
    29443, 26,
// P37_P70.agc:1512
//		GOTO
// slot 29444
    29444, 65360,
// P37_P70.agc:1513
//			V2T179
// slot 29445
    29445, 54802,
// P37_P70.agc:1514
//V2T177		STODL	14D
// slot 29446
    29446, 12318,
// P37_P70.agc:1515
//			12D
// slot 29447
    29447, 26,
// P37_P70.agc:1516
//		DCOMP
// slot 29448
    29448, 65404,
// P37_P70.agc:1517
//V2T179		STCALL	16D		# DX(T1)
// slot 29449
    29449, 28706,
// P37_P70.agc:1518
//			GAMDV10
// slot 29450
    29450, 54878,
// P37_P70.agc:1519
//		DLOAD	BMN
// slot 29451
    29451, 41162,
// P37_P70.agc:1520
//			NN1A
// slot 29452
    29452, 4016,
// P37_P70.agc:1521
//			V2T300
// slot 29453
    29453, 54870,
// P37_P70.agc:1522
//
// P37_P70.agc:1523
//# PREVENT A LARGE CHANGE IN INDEPENDENT VARIABLE DURING AN ITERATION FOR A
// P37_P70.agc:1524
//# PRECISION TRAJECTORY
// P37_P70.agc:1525
//
// P37_P70.agc:1526
//V2T185		DLOAD	DSU
// slot 29454
    29454, 38346,
// P37_P70.agc:1527
//			X(T1)
// slot 29455
    29455, 4004,
// P37_P70.agc:1528
//			00D
// slot 29456
    29456, 2,
// P37_P70.agc:1529
//		ABS	PDDL		# /X(T1)-X(T1),,/ = BETA7
// slot 29457
    29457, 54604,
// P37_P70.agc:1530
//			12D
// slot 29458
    29458, 26,
// P37_P70.agc:1531
//		SL1	BDSU
// slot 29459
    29459, 37332,
// P37_P70.agc:1532
//		BMN	DLOAD
// slot 29460
    29460, 58688,
// P37_P70.agc:1533
//			V2T300
// slot 29461
    29461, 54870,
// P37_P70.agc:1534
//			00D		# CONTINUE IF BETA7 LARGER THAN 2DX(T1)MAX
// slot 29462
    29462, 2,
// P37_P70.agc:1535
//		STORE	X(T1)		# X(T1),, = X(T1)
// slot 29463
    29463, 4004,
// P37_P70.agc:1536
//# Page 923
// P37_P70.agc:1537
//		DSU	BMN
// slot 29464
    29464, 41002,
// P37_P70.agc:1538
//			14D
// slot 29465
    29465, 30,
// P37_P70.agc:1539
//			V2T195
// slot 29466
    29466, 54848,
// P37_P70.agc:1540
//		DLOAD
// slot 29467
    29467, 65482,
// P37_P70.agc:1541
//			14D
// slot 29468
    29468, 30,
// P37_P70.agc:1542
//		STORE	X(T1)		# X(T1)MAX = X(T1)
// slot 29469
    29469, 4004,
// P37_P70.agc:1543
//		GOTO
// slot 29470
    29470, 65360,
// P37_P70.agc:1544
//			V2T205
// slot 29471
    29471, 54866,
// P37_P70.agc:1545
//V2T195		DLOAD	DSU
// slot 29472
    29472, 38346,
// P37_P70.agc:1546
//			X(T1)
// slot 29473
    29473, 4004,
// P37_P70.agc:1547
//			10D
// slot 29474
    29474, 22,
// P37_P70.agc:1548
//		BMN	GOTO
// slot 29475
    29475, 43072,
// P37_P70.agc:1549
//			V2T200
// slot 29476
    29476, 54860,
// P37_P70.agc:1550
//			V2T205
// slot 29477
    29477, 54866,
// P37_P70.agc:1551
//V2T200		DLOAD
// slot 29478
    29478, 65482,
// P37_P70.agc:1552
//			10D
// slot 29479
    29479, 22,
// P37_P70.agc:1553
//		STORE	X(T1)		# X(T1)MIN = X(T1)
// slot 29480
    29480, 4004,
// P37_P70.agc:1554
//V2T205		CALL
// slot 29481
    29481, 65320,
// P37_P70.agc:1555
//			DVCALC
// slot 29482
    29482, 55136,
// P37_P70.agc:1556
//V2T300		DLOAD
// slot 29483
    29483, 65482,
// P37_P70.agc:1557
//			ZERORTE
// slot 29484
    29484, 28328,
// P37_P70.agc:1558
//V2T1X		GOTO
// slot 29485
    29485, 65360,
// P37_P70.agc:1559
//			33D
// slot 29486
    29486, 66,
// P37_P70.agc:1560
//
// P37_P70.agc:1561
//# Page 924
// P37_P70.agc:1562
//# X(T1)-DV ITERATOR SUBROUTINE
// P37_P70.agc:1563
//#
// P37_P70.agc:1564
//# DESCRIPTION
// P37_P70.agc:1565
//#	COMPUTES A POST IMPULSE VELOCITY VECTOR (V2(T1)) WHICH REQUIRES A MINIMUM DV.
// P37_P70.agc:1566
//#
// P37_P70.agc:1567
//# CALLING SEQUENCE
// P37_P70.agc:1568
//#	L	CALL
// P37_P70.agc:1569
//#	L+1		GAMDV10
// P37_P70.agc:1570
//#
// P37_P70.agc:1571
//# NORMAL EXIT MODE
// P37_P70.agc:1572
//#	AT L+2 OF CALLING SEQUENCE
// P37_P70.agc:1573
//#
// P37_P70.agc:1574
//# ALARM EXIT MODE
// P37_P70.agc:1575
//#	AT V2T1X WITH MPAC = OCTAL 605 FOR EXCESS ITERATIONS
// P37_P70.agc:1576
//#
// P37_P70.agc:1577
//# SUBROUTINES CALLED
// P37_P70.agc:1578
//#	DVCALC
// P37_P70.agc:1579
//#
// P37_P70.agc:1580
//# ERASABLE INITIALIZATION REQUIRED
// P37_P70.agc:1581
//#    PUSHLIST
// P37_P70.agc:1582
//#	02D		THETA1=BETA5*LAMBDA-1					TP	B17
// P37_P70.agc:1583
//#	05D		THETA2=2*R(T1)*(LAMBDA-1)				TP	B38/B36
// P37_P70.agc:1584
//#	08D		THETA3=MU**.5/R(T1)					DP	B-4/B-5
// P37_P70.agc:1585
//#	10D		X(T1)MIN=LOWER BOUND ON INDEPENDENT VARIABLE X(T1)	DP	B5
// P37_P70.agc:1586
//#	12D		DX(T1)MAX=MAXIMUM DX(T1)				DP	B5
// P37_P70.agc:1587
//#	14D		X(T1)MAX=UPPER BOUND ON INDEPENDENT VARIABLE X(T1)	DP	B5
// P37_P70.agc:1588
//#	16D		DX(T1)=ITERATOR INCREMENT				DP	B5
// P37_P70.agc:1589
//#    MPAC
// P37_P70.agc:1590
//#	NONE
// P37_P70.agc:1591
//#    OTHER
// P37_P70.agc:1592
//#	V(T1)/		INITIAL VELOCITY VECTOR					VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1593
//#	RTEDVD		DELTA VELOCITY DESIRED					DP	B7/B5	METERS/CS
// P37_P70.agc:1594
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:1595
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:1596
//#	X(T1)		COTANGENT OF INITIAL FLIGHT PATH ANGLE (FROM VERTICAL)	DP	B5
// P37_P70.agc:1597
//#	F2RTE		TIME CRITICAL OR MINIMUM FUEL MODE INDICATOR		STATE AREA	0 MIN. FUEL, 1 MIN. TIME
// P37_P70.agc:1598
//#
// P37_P70.agc:1599
//# OUTPUT
// P37_P70.agc:1600
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1601
//#	DV		INITIAL VELOCITY CHANGE					DP	B7/B5	METERS/CS
// P37_P70.agc:1602
//#	X(T1)		COTANGENT OF INITIAL FPA MEASURED FROM VERTICAL		DP	B5
// P37_P70.agc:1603
//#	PCON		SEMI-LATUS RECTUM					DP	B28/B26	METERS
// P37_P70.agc:1604
//#
// P37_P70.agc:1605
//# DEBRIS
// P37_P70.agc:1606
//#    PUSHLIST
// P37_P70.agc:1607
//#	00D		X(T1),,
// P37_P70.agc:1608
//#	02D		THETA1
// P37_P70.agc:1609
//#	05D		THETA2
// P37_P70.agc:1610
//#	08D		THETA3
// P37_P70.agc:1611
//#	10D		X(T1)MIN
// P37_P70.agc:1612
//#	12D		DX(T1)MAX
// P37_P70.agc:1613
//# Page 925
// P37_P70.agc:1614
//#	14D		X(T1)MAX
// P37_P70.agc:1615
//#	16D		DX(T1)
// P37_P70.agc:1616
//#	22D		DV,=PREVIOUS DV						DP	B7/B5
// P37_P70.agc:1617
//#	24D		BETA9=X(T1)+1.1DX(T1)					DP	B5
// P37_P70.agc:1618
//#	31D		GAMDV10 SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1619
//#	32D		DVCALC SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1620
//#	33D		V2T100 SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1621
//
// P37_P70.agc:1622
//GAMDV10		STQ
// slot 29487
    29487, 65312
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1623
//			31D
// slot 29488
    29488, 62,
// P37_P70.agc:1624
//		SETPD	CALL
// slot 29489
    29489, 37890,
// P37_P70.agc:1625
//			18D		#					PL18D
// slot 29490
    29490, 38,
// P37_P70.agc:1626
//			DVCALC
// slot 29491
    29491, 55136,
// P37_P70.agc:1627
//		DLOAD	DSU
// slot 29492
    29492, 38346,
// P37_P70.agc:1628
//			14D
// slot 29493
    29493, 30,
// P37_P70.agc:1629
//			10D
// slot 29494
    29494, 22,
// P37_P70.agc:1630
//		BOV
// slot 29495
    29495, 65280,
// P37_P70.agc:1631
//			GAMDV20
// slot 29496
    29496, 54928,
// P37_P70.agc:1632
//		PUSH	DSU		# X(T1)MAX-X(T1)MIN=BETA8	B5 	PL20D
// slot 29497
    29497, 38156,
// P37_P70.agc:1633
//			EPC9RTE
// slot 29498
    29498, 28440,
// P37_P70.agc:1634
//		BMN	DLOAD
// slot 29499
    29499, 58688,
// P37_P70.agc:1635
//			GAMDVX		# BOUNDS CLOSE TOGETHER
// slot 29500
    29500, 55132,
// P37_P70.agc:1636
//			18D
// slot 29501
    29501, 38,
// P37_P70.agc:1637
//		DSU	BMN		# BETA8-DX(T1)MAX
// slot 29502
    29502, 41002,
// P37_P70.agc:1638
//			12D
// slot 29503
    29503, 26,
// P37_P70.agc:1639
//			GAMDV15
// slot 29504
    29504, 54920,
// P37_P70.agc:1640
//		SETPD	GOTO		#					PL18D
// slot 29505
    29505, 43010,
// P37_P70.agc:1641
//			18D
// slot 29506
    29506, 38,
// P37_P70.agc:1642
//			GAMDV20
// slot 29507
    29507, 54928,
// P37_P70.agc:1643
//GAMDV15		DLOAD			#					PL18D
// slot 29508
    29508, 65482,
// P37_P70.agc:1644
//		SIGN	SR1
// slot 29509
    29509, 58090,
// P37_P70.agc:1645
//			16D
// slot 29510
    29510, 34,
// P37_P70.agc:1646
//		STORE	16D		# BETA8(SIGNDX(T1))/2=DX(T1)
// slot 29511
    29511, 34,
// P37_P70.agc:1647
//GAMDV20		DLOAD
// slot 29512
    29512, 65482,
// P37_P70.agc:1648
//			M144RTE
// slot 29513
    29513, 28332,
// P37_P70.agc:1649
//		STORE	NN2
// slot 29514
    29514, 4020,
// P37_P70.agc:1650
//GAMDV25		DLOAD	DAD
// slot 29515
    29515, 36298,
// P37_P70.agc:1651
//			NN2
// slot 29516
    29516, 4020,
// P37_P70.agc:1652
//			1RTEB28
// slot 29517
    29517, 28324,
// P37_P70.agc:1653
//		BMN	SLOAD
// slot 29518
    29518, 56640,
// P37_P70.agc:1654
//			GAMDV30
// slot 29519
    29519, 54950,
// P37_P70.agc:1655
//			OCT605
// slot 29520
    29520, 28388,
// P37_P70.agc:1656
//		GOTO
// slot 29521
    29521, 65360,
// P37_P70.agc:1657
//			V2T1X
// slot 29522
    29522, 54874,
// P37_P70.agc:1658
//GAMDV30		STORE	NN2		# NN2=NN2+1
// slot 29523
    29523, 4020,
// P37_P70.agc:1659
//		DLOAD	PDDL		# X(T1)=X(T1),			B5 	PL20D
// slot 29524
    29524, 54730,
// P37_P70.agc:1660
//			X(T1)
// slot 29525
    29525, 4004,
// P37_P70.agc:1661
//			DV
// slot 29526
    29526, 3980,
// P37_P70.agc:1662
//		PDDL	DAD		# DV=DV,			B7/B5 	PL22D
// slot 29527
    29527, 36266,
// P37_P70.agc:1663
//			X(T1)
// slot 29528
    29528, 4004,
// P37_P70.agc:1664
//			16D
// slot 29529
    29529, 34,
// P37_P70.agc:1665
//# Page 926
// P37_P70.agc:1666
//		STCALL	X(T1)		# X(T1)+DX(T1)=X(T1)		B5
// slot 29530
    29530, 32676,
// P37_P70.agc:1667
//			DVCALC
// slot 29531
    29531, 55136,
// P37_P70.agc:1668
//		BON	DLOAD
// slot 29532
    29532, 58648,
// P37_P70.agc:1669
//			F2RTE
// slot 29533
    29533, 404,
// P37_P70.agc:1670
//			GAMDV35
// slot 29534
    29534, 54996,
// P37_P70.agc:1671
//			DV
// slot 29535
    29535, 3980,
// P37_P70.agc:1672
//		DSU	BMN		# CONTINUE IF FUEL CRITICAL MODE
// slot 29536
    29536, 41002,
// P37_P70.agc:1673
//			20D
// slot 29537
    29537, 42,
// P37_P70.agc:1674
//			GAMDV33
// slot 29538
    29538, 54990,
// P37_P70.agc:1675
//GAMDV32		DLOAD	DCOMP
// slot 29539
    29539, 48842,
// P37_P70.agc:1676
//			16D
// slot 29540
    29540, 34,
// P37_P70.agc:1677
//		SR1
// slot 29541
    29541, 65476,
// P37_P70.agc:1678
//		STORE	16D
// slot 29542
    29542, 34,
// P37_P70.agc:1679
//GAMDV33		SETPD	GOTO
// slot 29543
    29543, 43010,
// P37_P70.agc:1680
//			18D		#					PL18D
// slot 29544
    29544, 38,
// P37_P70.agc:1681
//			GAMDV50
// slot 29545
    29545, 55066,
// P37_P70.agc:1682
//
// P37_P70.agc:1683
//# TIME CRITICAL MODE
// P37_P70.agc:1684
//
// P37_P70.agc:1685
//GAMDV35		DLOAD	DSU
// slot 29546
    29546, 38346,
// P37_P70.agc:1686
//			RTEDVD
// slot 29547
    29547, 3892,
// P37_P70.agc:1687
//			DV
// slot 29548
    29548, 3980,
// P37_P70.agc:1688
//		PDDL	PUSH		# DVD-DV=DVERR			B7/B5 	PL22D
// slot 29549
    29549, 34474,
// P37_P70.agc:1689
//GAMDV40		DLOAD	ABS		# DV,					PL24D
// slot 29550
    29550, 42698,
// P37_P70.agc:1690
//			20D
// slot 29551
    29551, 42,
// P37_P70.agc:1691
//		DSU	BMN
// slot 29552
    29552, 41002,
// P37_P70.agc:1692
//			EPC10RTE
// slot 29553
    29553, 28444,
// P37_P70.agc:1693
//			GAMDVX
// slot 29554
    29554, 55132,
// P37_P70.agc:1694
//GAMDV45		BOVB	DLOAD
// slot 29555
    29555, 58632,
// P37_P70.agc:1695
//			TCDANZIG	# ASSURE OVFIND IS 0
// slot 29556
    29556, 48596,
// P37_P70.agc:1696
//		BDSU	NORM
// slot 29557
    29557, 49442,
// P37_P70.agc:1697
//			DV
// slot 29558
    29558, 3980,
// P37_P70.agc:1698
//			X2
// slot 29559
    29559, 80,
// P37_P70.agc:1699
//		PDDL			# DV-DV,			B7/B5-N2 PL22D
// slot 29560
    29560, 65450,
// P37_P70.agc:1700
//		NORM	SR1		# DVERR				B8/B6-N1
// slot 29561
    29561, 57986,
// P37_P70.agc:1701
//			X1
// slot 29562
    29562, 78,
// P37_P70.agc:1702
//		DDV	PDDL		# DVERR/ DV - DV
// slot 29563
    29563, 54642,
// P37_P70.agc:1703
//		BDSU	DMP		#					PL18D
// slot 29564
    29564, 34082,
// P37_P70.agc:1704
//			X(T1)
// slot 29565
    29565, 4004,
// P37_P70.agc:1705
//		XSU,1
// slot 29566
    29566, 65376,
// P37_P70.agc:1706
//			X2
// slot 29567
    29567, 78,
// P37_P70.agc:1707
//		STORE	16D		# PRESERVE SIGN IF OVERFLOW
// slot 29568
    29568, 34,
// P37_P70.agc:1708
//		SR*	BOV
// slot 29569
    29569, 32862,
// P37_P70.agc:1709
//			0 -1,1
// slot 29570
    29570, 17152,
// P37_P70.agc:1710
//			GAMDV47
// slot 29571
    29571, 55058,
// P37_P70.agc:1711
//		STORE	16D		# (X(T1)-X(T1),)DVERR/(DV-DV,)=DX(T1)
// slot 29572
    29572, 34,
// P37_P70.agc:1712
//		ABS	DSU
// slot 29573
    29573, 38220,
// P37_P70.agc:1713
//			12D
// slot 29574
    29574, 26,
// P37_P70.agc:1714
//		BMN
// slot 29575
    29575, 65344,
// P37_P70.agc:1715
//			GAMDV50
// slot 29576
    29576, 55066,
// P37_P70.agc:1716
//# Page 927
// P37_P70.agc:1717
//GAMDV47		DLOAD	SIGN
// slot 29577
    29577, 62922,
// P37_P70.agc:1718
//			12D
// slot 29578
    29578, 26,
// P37_P70.agc:1719
//			16D
// slot 29579
    29579, 34,
// P37_P70.agc:1720
//		STORE	16D		# DX(T1)MAX(SIGNDX(T1))=DX(T1)
// slot 29580
    29580, 34,
// P37_P70.agc:1721
//
// P37_P70.agc:1722
//# CHECK TO KEEP INDEPENDENT VARIABLE IN BOUNDS
// P37_P70.agc:1723
//
// P37_P70.agc:1724
//GAMDV50		DLOAD	DMP
// slot 29581
    29581, 34250,
// P37_P70.agc:1725
//			16D
// slot 29582
    29582, 34,
// P37_P70.agc:1726
//			1.1RTEB1
// slot 29583
    29583, 28348,
// P37_P70.agc:1727
//		SL1	DAD
// slot 29584
    29584, 36308,
// P37_P70.agc:1728
//			X(T1)
// slot 29585
    29585, 4004,
// P37_P70.agc:1729
//		STORE	24D		# X(T1)+1.1DX(T1)=BETA9		B5
// slot 29586
    29586, 50,
// P37_P70.agc:1730
//		DSU	BMN
// slot 29587
    29587, 41002,
// P37_P70.agc:1731
//			14D
// slot 29588
    29588, 30,
// P37_P70.agc:1732
//			GAMDV55
// slot 29589
    29589, 55096,
// P37_P70.agc:1733
//		DLOAD	DSU
// slot 29590
    29590, 38346,
// P37_P70.agc:1734
//			14D
// slot 29591
    29591, 30,
// P37_P70.agc:1735
//			X(T1)
// slot 29592
    29592, 4004,
// P37_P70.agc:1736
//		SR1
// slot 29593
    29593, 65476,
// P37_P70.agc:1737
//		STCALL	16D		# (X(T1)MAX-X(T1))/2=DX(T1)	B5
// slot 29594
    29594, 28706,
// P37_P70.agc:1738
//			GAMDV65
// slot 29595
    29595, 55118,
// P37_P70.agc:1739
//GAMDV55		DLOAD	DSU
// slot 29596
    29596, 38346,
// P37_P70.agc:1740
//			24D
// slot 29597
    29597, 50,
// P37_P70.agc:1741
//			10D
// slot 29598
    29598, 22,
// P37_P70.agc:1742
//		BMN	GOTO
// slot 29599
    29599, 43072,
// P37_P70.agc:1743
//			GAMDV60
// slot 29600
    29600, 55108,
// P37_P70.agc:1744
//			GAMDV65
// slot 29601
    29601, 55118,
// P37_P70.agc:1745
//GAMDV60		DLOAD	DSU
// slot 29602
    29602, 38346,
// P37_P70.agc:1746
//			10D
// slot 29603
    29603, 22,
// P37_P70.agc:1747
//			X(T1)
// slot 29604
    29604, 4004,
// P37_P70.agc:1748
//		SR1
// slot 29605
    29605, 65476,
// P37_P70.agc:1749
//		STORE	16D		# (X(T1)MIN-X(T1))/2=DX(T1)	B5
// slot 29606
    29606, 34,
// P37_P70.agc:1750
//GAMDV65		DLOAD	ABS
// slot 29607
    29607, 42698
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1751
//			16D
// slot 29608
    29608, 34,
// P37_P70.agc:1752
//		DSU	BMN
// slot 29609
    29609, 41002,
// P37_P70.agc:1753
//			EPC9RTE
// slot 29610
    29610, 28440,
// P37_P70.agc:1754
//			GAMDVX
// slot 29611
    29611, 55132,
// P37_P70.agc:1755
//		GOTO
// slot 29612
    29612, 65360,
// P37_P70.agc:1756
//			GAMDV25
// slot 29613
    29613, 54934,
// P37_P70.agc:1757
//GAMDVX		GOTO
// slot 29614
    29614, 65360,
// P37_P70.agc:1758
//			31D
// slot 29615
    29615, 62,
// P37_P70.agc:1759
//
// P37_P70.agc:1760
//# Page 928
// P37_P70.agc:1761
//# DV CALCULATION SUBROUTINE
// P37_P70.agc:1762
//#
// P37_P70.agc:1763
//# INPUT
// P37_P70.agc:1764
//#    PUSHLIST
// P37_P70.agc:1765
//#	02D		THETA1=BETA5*LAMBDA-1					TP	B17
// P37_P70.agc:1766
//#	05D		THETA2=2*R(T1)*(LAMBDA-1)				TP	B38/B36
// P37_P70.agc:1767
//#	08D		THETA3=MU**.5/R(T1)					DP	B-4/B-5
// P37_P70.agc:1768
//#    OTHER
// P37_P70.agc:1769
//#	X(T1)		COTANGENT OF POST IMPULSE INITIAL FLIGHT PATH ANGLE	DP	B5
// P37_P70.agc:1770
//#	V(T1)/		INITIAL VELOCITY VECTOR (PRE IMPULSE)			VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1771
//#	UR1/		UNIT INITIAL VECTOR					VECTOR	B1
// P37_P70.agc:1772
//#	UH/		UNIT HORIZONTAL VECTOR					VECTOR	B1
// P37_P70.agc:1773
//#
// P37_P70.agc:1774
//# OUTPUT
// P37_P70.agc:1775
//#	V2(T1)/		POST IMPULSE INITIAL VELOCITY VECTOR			VECTOR	B7/B5	METERS/CS
// P37_P70.agc:1776
//#	DV		INITIAL VELOCITY CHANGE					DP	B7/B5	METERS/CS
// P37_P70.agc:1777
//#	PCON		SEMI-LATUS RECTUM					DP	B28/B26	METERS
// P37_P70.agc:1778
//#
// P37_P70.agc:1779
//# DEBRIS
// P37_P70.agc:1780
//#	28D		THETA3*PCON**.5						DP	B10/B8-N1
// P37_P70.agc:1781
//#	C(PUSHLOC)	THETA3(PCON**.5)*X(T1)*UR1/				VECTOR	B7/B5
// P37_P70.agc:1782
//#	32D		DVCALC SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1783
//#	X1		NORMALIZATION FACTOR FOR VALUE IN 28D
// P37_P70.agc:1784
//#
// P37_P70.agc:1785
//# PUSHLOC IS RESTORED TO ITS ENTRANCE VALUE UPON EXITING DVCALC
// P37_P70.agc:1786
//
// P37_P70.agc:1787
//DVCALC		STQ	DLOAD
// slot 29616
    29616, 58656,
// P37_P70.agc:1788
//			32D
// slot 29617
    29617, 64,
// P37_P70.agc:1789
//			X(T1)
// slot 29618
    29618, 4004,
// P37_P70.agc:1790
//		DSQ	SR
// slot 29619
    29619, 45468,
// P37_P70.agc:1791
//			7
// slot 29620
    29620, 17168,
// P37_P70.agc:1792
//		DCOMP	TAD
// slot 29621
    29621, 63868,
// P37_P70.agc:1793
//			02D
// slot 29622
    29622, 6,
// P37_P70.agc:1794
//		NORM	PUSH
// slot 29623
    29623, 34434,
// P37_P70.agc:1795
//			X1
// slot 29624
    29624, 78,
// P37_P70.agc:1796
//		TLOAD	NORM
// slot 29625
    29625, 49618,
// P37_P70.agc:1797
//			05D
// slot 29626
    29626, 12,
// P37_P70.agc:1798
//			X2
// slot 29627
    29627, 80,
// P37_P70.agc:1799
//		RTB	SR1
// slot 29628
    29628, 57912,
// P37_P70.agc:1800
//			DPMODE
// slot 29629
    29629, 38812,
// P37_P70.agc:1801
//		XSU,2	DDV
// slot 29630
    29630, 47464,
// P37_P70.agc:1802
//			X1
// slot 29631
    29631, 76,
// P37_P70.agc:1803
//		SR*
// slot 29632
    29632, 65374,
// P37_P70.agc:1804
//			6,2
// slot 29633
    29633, 48368,
// P37_P70.agc:1805
//		STORE	PCON		# THETA2/(THETA1-X(T1)**2)=PCON	B28/26
// slot 29634
    29634, 4000,
// P37_P70.agc:1806
//		SQRT	DMP
// slot 29635
    29635, 34284,
// P37_P70.agc:1807
//			08D
// slot 29636
    29636, 18,
// P37_P70.agc:1808
//		NORM
// slot 29637
    29637, 65410,
// P37_P70.agc:1809
//			X1
// slot 29638
    29638, 78,
// P37_P70.agc:1810
//		STODL	28D		# THETA3*PCON**.5		B10/B8 -N1
// slot 29639
    29639, 12346,
// P37_P70.agc:1811
//# Page 929
// P37_P70.agc:1812
//			X(T1)
// slot 29640
    29640, 4004,
// P37_P70.agc:1813
//		NORM	VXSC
// slot 29641
    29641, 61826,
// P37_P70.agc:1814
//			X2
// slot 29642
    29642, 80,
// P37_P70.agc:1815
//			UR1/		# X(T1)*UR1/			B5+B1 -N2
// slot 29643
    29643, 4032,
// P37_P70.agc:1816
//		XAD,2	VXSC
// slot 29644
    29644, 61816,
// P37_P70.agc:1817
//			X1
// slot 29645
    29645, 76,
// P37_P70.agc:1818
//			28D
// slot 29646
    29646, 58,
// P37_P70.agc:1819
//		VSR*	PDVL		# THETA3(PCON**.5)X(T1)*UR1/	B7/B5
// slot 29647
    29647, 52574,
// P37_P70.agc:1820
//			0 -9D,2		#		+
// slot 29648
    29648, 48398,
// P37_P70.agc:1821
//			UH/
// slot 29649
    29649, 4044,
// P37_P70.agc:1822
//		VXSC	VSR*		# THETA3(PCON**.5)UH/		B7/B5
// slot 29650
    29650, 45026,
// P37_P70.agc:1823
//			28D
// slot 29651
    29651, 58,
// P37_P70.agc:1824
//			0 -4,1		#		=
// slot 29652
    29652, 17146,
// P37_P70.agc:1825
//		VAD	STADR
// slot 29653
    29653, 38490,
// P37_P70.agc:1826
//		STORE	V2(T1)/		# V2(T1)/			B7/B5
// slot 29654
    29654, 61566,
// P37_P70.agc:1827
//		VSU	ABVAL
// slot 29655
    29655, 42578,
// P37_P70.agc:1828
//			V(T1)/
// slot 29656
    29656, 3956,
// P37_P70.agc:1829
//		STORE	DV		# ABVAL(V2(T1)/-V1(T)/)=DV	B7/B5
// slot 29657
    29657, 3980,
// P37_P70.agc:1830
//		GOTO
// slot 29658
    29658, 65360,
// P37_P70.agc:1831
//			32D
// slot 29659
    29659, 64,
// P37_P70.agc:1832
//
// P37_P70.agc:1833
//# Page 930
// P37_P70.agc:1834
//# SUBROUTINE TO COMPUTE BOUNDS ON INDEPENDENT VARIABLE X(T1)
// P37_P70.agc:1835
//#
// P37_P70.agc:1836
//# INPUT
// P37_P70.agc:1837
//#    PUSHLIST
// P37_P70.agc:1838
//#	PUSHLOC -4	MAJOR AXIS (MA)						DP	B30/B28
// P37_P70.agc:1839
//#	PUSHLOC -2	MAJOR AXIS (MA) AGAIN					DP	B30/B28
// P37_P70.agc:1840
//#	28D		BETA5=LAMBDA*BETA1					DP	B9
// P37_P70.agc:1841
//#    OTHER
// P37_P70.agc:1842
//#	RCON									DP	B29/B27
// P37_P70.agc:1843
//#	R(T1)									DP	B29/B27
// P37_P70.agc:1844
//#
// P37_P70.agc:1845
//# OUTPUT
// P37_P70.agc:1846
//#    MPAC
// P37_P70.agc:1847
//#	X(T1)LIM	LIMIT ON INDEPENDENT VARIABLE X(T1)			DP	B5
// P37_P70.agc:1848
//#
// P37_P70.agc:1849
//# DEBRIS
// P37_P70.agc:1850
//#    PUSHLIST
// P37_P70.agc:1851
//#	C(PUSHLOC)	MA-RCON							DP	(B30/28)-N1
// P37_P70.agc:1852
//#	C(PUSHLOC) +2	MA							DP	B30/B28
// P37_P70.agc:1853
//#	X1		NORMALIZATION FACTOR FOR MA-RCON
// P37_P70.agc:1854
//#	20D		XT1LIM SUBROUTINE RETURN ADDRESS
// P37_P70.agc:1855
//#
// P37_P70.agc:1856
//# PUSHLOC IS RESTORED TO ITS ENTRANCE VALUE UPON EXITING XT1LIM
// P37_P70.agc:1857
//
// P37_P70.agc:1858
//XT1LIM		STQ	DLOAD
// slot 29660
    29660, 58656,
// P37_P70.agc:1859
//			20D
// slot 29661
    29661, 40,
// P37_P70.agc:1860
//			RCON
// slot 29662
    29662, 3900,
// P37_P70.agc:1861
//		SR1	BDSU
// slot 29663
    29663, 37316,
// P37_P70.agc:1862
//		NORM	PDDL		# MA-RCON			B30-N1
// slot 29664
    29664, 54658,
// P37_P70.agc:1863
//			X2
// slot 29665
    29665, 80,
// P37_P70.agc:1864
//		PDDL	SR1
// slot 29666
    29666, 58026,
// P37_P70.agc:1865
//			R(T1)
// slot 29667
    29667, 3916,
// P37_P70.agc:1866
//		BDSU	DDV
// slot 29668
    29668, 47394,
// P37_P70.agc:1867
//		SL*	DMP
// slot 29669
    29669, 34142,
// P37_P70.agc:1868
//			0	-3,2
// slot 29670
    29670, 48898,
// P37_P70.agc:1869
//			28D
// slot 29671
    29671, 58,
// P37_P70.agc:1870
//		SL*	DSU		# BETA10=BETA5(MA-RT)/(MA-RC)-1	B11
// slot 29672
    29672, 38238,
// P37_P70.agc:1871
//			0	-6,1
// slot 29673
    29673, 16630,
// P37_P70.agc:1872
//			1RTEB25 +1	# 1.0				B-11
// slot 29674
    29674, 28322,
// P37_P70.agc:1873
//		SL1	BOV
// slot 29675
    29675, 32980,
// P37_P70.agc:1874
//			XT1LIM2
// slot 29676
    29676, 55264,
// P37_P70.agc:1875
//		BMN	GOTO
// slot 29677
    29677, 43072,
// P37_P70.agc:1876
//			XT1LIM5
// slot 29678
    29678, 55272,
// P37_P70.agc:1877
//			XT1LIM3
// slot 29679
    29679, 55268,
// P37_P70.agc:1878
//XT1LIM2		DLOAD			# BETA10=POSMAX IF OVERFLOW
// slot 29680
    29680, 65482
)).

agcAotInstallSourceRope(list(
// P37_P70.agc:1879
//			2RTEB1
// slot 29681
    29681, 28356,
// P37_P70.agc:1880
//XT1LIM3		SQRT	GOTO		# X(T1)=SQRT(BETA10)
// slot 29682
    29682, 43244,
// P37_P70.agc:1881
//			XT1LIMX
// slot 29683
    29683, 55276,
// P37_P70.agc:1882
//XT1LIM5		DLOAD
// slot 29684
    29684, 65482,
// P37_P70.agc:1883
//			ZERORTE
// slot 29685
    29685, 28328,
// P37_P70.agc:1884
//XT1LIMX		GOTO
// slot 29686
    29686, 65360,
// P37_P70.agc:1885
//			20D
// slot 29687
    29687, 40,
// P37_P70.agc:1886
//
// P37_P70.agc:1887
//# Page 931
// P37_P70.agc:1888
//# CONSTANTS FOR THE P37 AND P70 PROGRAMS AND SUBROUTINES
// P37_P70.agc:1889
//
// P37_P70.agc:1890
//		BANK	36
// P37_P70.agc:1891
//		SETLOC	RTECON1
// P37_P70.agc:1892
//		BANK
// P37_P70.agc:1893
//
// P37_P70.agc:1894
//1RTEB1		2DEC	1. B-1
// slot 32575 32576
    32575, 16384, 32576, 0,
// P37_P70.agc:1895
//1RTEB2		2DEC	1. B-2
// slot 32577 32578
    32577, 8192, 32578, 0,
// P37_P70.agc:1896
//1RTEB3		2DEC	1. B-3
// slot 32579 32580
    32579, 4096, 32580, 0,
// P37_P70.agc:1897
//1RTEB4		2DEC	1. B-4
// slot 32581 32582
    32581, 2048, 32582, 0,
// P37_P70.agc:1898
//1RTEB10		2DEC	1. B-10
// slot 32583 32584
    32583, 32, 32584, 0,
// P37_P70.agc:1899
//1RTEB12		2DEC	1. B-12
// slot 32585 32586
    32585, 8, 32586, 0,
// P37_P70.agc:1900
//1RTEB13		2DEC	1. B-13
// slot 32587 32588
    32587, 4, 32588, 0,
// P37_P70.agc:1901
//1RTEB17		2DEC	1. B-17
// slot 32589 32590
    32589, 0, 32590, 4096,
// P37_P70.agc:1902
//1RTEB25		2DEC	1. B-25
// slot 32591 32592
    32591, 0, 32592, 16,
// P37_P70.agc:1903
//#					* * B25 AND B28 MUST BE CONSECUTIVE * *
// P37_P70.agc:1904
//1RTEB28		2DEC	1. B-28
// slot 32593 32594
    32593, 0, 32594, 2,
// P37_P70.agc:1905
//ZERORTE		2DEC	0
// slot 32595 32596
    32595, 0, 32596, 0,
// P37_P70.agc:1906
//M144RTE		2DEC	-144. B-28
// slot 32597 32598
    32597, 65534, 32598, 65246,
// P37_P70.agc:1907
//M15RTE		2DEC	-15
// slot 32599 32600
    32599, 65534, 32600, 65504,
// P37_P70.agc:1908
//10RTE		2DEC	10
// slot 32601 32602
    32601, 0, 32602, 20,
// P37_P70.agc:1909
//M.6RTE		2DEC	-.6
// slot 32603 32604
    32603, 45874, 32604, 52426,
// P37_P70.agc:1910
//1.1RTEB1	2DEC	1.1 B-1
// slot 32605 32606
    32605, 18022, 32606, 6554,
// P37_P70.agc:1911
//M6RTEB28	2DEC	-6
// slot 32607 32608
    32607, 65534, 32608, 65522,
// P37_P70.agc:1912
//2RTEB1		2OCT	3777737777
// slot 32609 32610
    32609, 32766, 32610, 32766,
// P37_P70.agc:1913
//M9RTEB28	2DEC	-9
// slot 32611 32612
    32611, 65534, 32612, 65516,
// P37_P70.agc:1914
//M8RTEB28	2DEC	-8
// slot 32613 32614
    32613, 65534, 32614, 65518,
// P37_P70.agc:1915
//30480RTE	2DEC	30480. B-29
// slot 32615 32616
    32615, 0, 32616, 30480,
// P37_P70.agc:1916
//VCSPS		2DEC	31.510396 B-5	# (SEE 2VEXHUST)
// slot 32617 32618
    32617, 32266, 32618, 10576,
// P37_P70.agc:1917
//# Page 932
// P37_P70.agc:1918
//VCRCS		2DEC	27.0664 B-5
// slot 32619 32620
    32619, 27714, 32620, 32664,
// P37_P70.agc:1919
//MDOTRCS		2DEC	.0016375 B-3
// slot 32621 32622
    32621, 6, 32622, 11586,
// P37_P70.agc:1920
//CSUBT		2DEC	.5
// slot 32623 32624
    32623, 16384, 32624, 0,
// P37_P70.agc:1921
//OCT605		OCT	00605
// slot 32625
    32625, 778,
// P37_P70.agc:1922
//OCT612		OCT	00612
// slot 32626
    32626, 788,
// P37_P70.agc:1923
//MCOS7.5		2DEC	-.99144486
// slot 32627 32628
    32627, 33048, 32628, 38252,
// P37_P70.agc:1924
//MSIN7.5		2DEC	-.13052619
// slot 32629 32630
    32629, 61258, 32630, 47804,
// P37_P70.agc:1925
//MCOS22.5	2DEC	-.92387953 B-2
// slot 32631 32632
    32631, 57966, 32632, 58634,
// P37_P70.agc:1926
//THETA165	2DEC	.4583333333
// slot 32633 32634
    32633, 15018, 32634, 10922,
// P37_P70.agc:1927
//THETA210	2DEC	.5833333333
// slot 32635 32636
    32635, 19114, 32636, 10922,
// P37_P70.agc:1928
//EPC1RTE		2DEC	.99966 B-1
// slot 32637 32638
    32637, 16378, 32638, 7036,
// P37_P70.agc:1929
//EPC2RTE		2DEC	100. B-29
// slot 32639 32640
    32639, 0, 32640, 100,
// P37_P70.agc:1930
//EPC3RTE		2DEC	.001
// slot 32641 32642
    32641, 32, 32642, 12582,
// P37_P70.agc:1931
//EPC4RTE		2DEC	.00001
// slot 32643 32644
    32643, 0, 32644, 5368,
// P37_P70.agc:1932
//EPC5RTE		2DEC	.01 B-6
// slot 32645 32646
    32645, 4, 32646, 18350,
// P37_P70.agc:1933
//EPC6RTE		2DEC	.000007 B-1
// slot 32647 32648
    32647, 0, 32648, 1880,
// P37_P70.agc:1934
//EPC7RTE		2DEC	1000. B-29
// slot 32649 32650
    32649, 0, 32650, 1000,
// P37_P70.agc:1935
//EPC9RTE		2DEC	1. B-25
// slot 32651 32652
    32651, 0, 32652, 16,
// P37_P70.agc:1936
//EPC10RTE	2DEC	.0001 B-7
// slot 32653 32654
    32653, 0, 32654, 420,
// P37_P70.agc:1937
//
// P37_P70.agc:1938
//		BANK	35
// P37_P70.agc:1939
//		SETLOC	RTECON1
// P37_P70.agc:1940
//		BANK
// P37_P70.agc:1941
//
// P37_P70.agc:1942
//C4RTE		2DEC	-6.986643 E7 B-30
// slot 32655 32656
    32655, 63402, 32656, 63006,
// P37_P70.agc:1943
//K1RTE		2DEC	7. E6 B-29
// slot 32657 32658
    32657, 426, 32658, 20416,
// P37_P70.agc:1944
//K2RTE		2DEC	6495000. B-29
// slot 32659 32660
    32659, 396, 32660, 6936,
// P37_P70.agc:1945
//K3RTE		2DEC	-.06105
// slot 32661 32662
    32661, 63534, 32662, 57564,
// P37_P70.agc:1946
//K4RTE		2DEC	-.10453
// slot 32663 32664
    32663, 62110, 32664, 45234,
// P37_P70.agc:1947
//RTMURTE		2DEC	199650.501 B-18
// slot 32665 32666
    32665, 24956, 32666, 5122,
// P37_P70.agc:1948
//# Page 933
// P37_P70.agc:1949
//E3RTE		2DEC	121920. B-29
// slot 32667 32668
    32667, 6, 32668, 23616
)).

// no code for the lines below
// P37_P70.agc:1950
//
