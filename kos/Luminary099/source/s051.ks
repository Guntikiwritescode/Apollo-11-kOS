// P30_P37.agc
// bank 35, slots 31744-31744
function agcAotUnit2009 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30_P37.agc:1
//# Copyright:	Public domain.
// P30_P37.agc:2
//# Filename:	P30_P37.agc
// P30_P37.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P30_P37.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// P30_P37.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P30_P37.agc:6
//# Assembler:	yaYUL
// P30_P37.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// P30_P37.agc:8
//# Website:	www.ibiblio.org/apollo.
// P30_P37.agc:9
//# Pages:	614-617
// P30_P37.agc:10
//# Mod history:	2009-05-17 RSB	Adapted from the corresponding
// P30_P37.agc:11
//#				Luminary131 file, using page
// P30_P37.agc:12
//#				images from Luminary 1A.
// P30_P37.agc:13
//#		2009-06-05 RSB	Removed 4 lines of code that shouldn't
// P30_P37.agc:14
//#				have survived from Luminary 131.
// P30_P37.agc:15
//#
// P30_P37.agc:16
//# This source code has been transcribed or otherwise adapted from
// P30_P37.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P30_P37.agc:18
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// P30_P37.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P30_P37.agc:20
//# in storage size and consequent reduction in image quality as well) are
// P30_P37.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P30_P37.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// P30_P37.agc:23
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// P30_P37.agc:24
//# actually created.
// P30_P37.agc:25
//#
// P30_P37.agc:26
//# Notations on the hardcopy document read, in part:
// P30_P37.agc:27
//#
// P30_P37.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P30_P37.agc:29
//#	16:27 JULY 14, 1969
// P30_P37.agc:30
//
// P30_P37.agc:31
//# Page 614
// P30_P37.agc:32
//# PROGRAM DESCRIPTION P30	DATE 3-6-67
// P30_P37.agc:33
//#
// P30_P37.agc:34
//# MOD.1 BY AIYAWAR KERMAN
// P30_P37.agc:35
//# FUNCTIONAL DESCRIPTION
// P30_P37.agc:36
//#	ACCEPT BOB INPUTS OF TIG.DELV(LV)
// P30_P37.agc:37
//#	CALL IMU STATUS CHECK ROUTINE (R02)
// P30_P37.agc:38
//#	DISPLAY TIME TO GO, APOGEE, PERIGEE, DELV(MAG), MGA AT IGN
// P30_P37.agc:39
//#	REQUEST BURN PROGRAM
// P30_P37.agc:40
//#
// P30_P37.agc:41
//# CALLING SEQUENCE VIA JOB FROM V37
// P30_P37.agc:42
//#
// P30_P37.agc:43
//# EXIT VIA V37 CALL OR TO GOTOPOOH (V34E)
// P30_P37.agc:44
//#
// P30_P37.agc:45
//# SUBROUTINE CALLS-FLAGUP, PHASCHNG, BANKCALL, ENDOFJOB, GOFLASH, GOFLASHR
// P30_P37.agc:46
//#		   GOPERF3R, INTPRET, BLANKET, GOTOPOOH, R02BOTH, S30.1,
// P30_P37.agc:47
//#		   TIG/N35, MIDGIM, DISPMGA
// P30_P37.agc:48
//#
// P30_P37.agc:49
//# ERASABLE INITIALIZATION- STATE VECTOR
// P30_P37.agc:50
//#
// P30_P37.agc:51
//# OUTPUT-RINIT, VINIT, +MGA, VTIG, RTIG, DELVSIN, DELVSAB, DELVSLV, HAPO,
// P30_P37.agc:52
//#	 HPER, TTOGO
// P30_P37.agc:53
//#
// P30_P37.agc:54
//# DEBRIS- A,L, MPAC, PUSHLIST
// P30_P37.agc:55
//
// P30_P37.agc:56
//		BANK	32
// P30_P37.agc:57
//		SETLOC	P30S
// P30_P37.agc:58
//		BANK
// P30_P37.agc:59
//		EBANK=	+MGA
// P30_P37.agc:60
//		COUNT*	$$/P30
// P30_P37.agc:61
//P30		TC	UPFLAG		# SET UPDATE FLAG
// slot 31744
    if slot <> 31744 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2009] to agcAotUnit2009@.

agcAotInstallSourceRope(list(
// P30_P37.agc:62
//		ADRES	UPDATFLG
// slot 31745
    31745, 46
)).

// bank 35, slots 31746-31746
function agcAotUnit2010 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30_P37.agc:63
//		TC	UPFLAG		# SET TRACK FLAG
// slot 31746
    if slot <> 31746 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2010] to agcAotUnit2010@.

agcAotInstallSourceRope(list(
// P30_P37.agc:64
//		ADRES	TRACKFLG
// slot 31747
    31747, 50
)).

// bank 35, slots 31748-31752
function agcAotUnit2011 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31749 {
        if slot <= 31748 {
// P30_P37.agc:65
//
// P30_P37.agc:66
//P30N33		CAF	V06N33		# T OF IGN
// slot 31748
            if slot <> 31748 or instruction <> 13333 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1045), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P30_P37.agc:67
//		TC	VNPOOH		# RETURNS ON PROCEED, POOH ON TERMINATE
// slot 31749
            if slot <> 31749 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31750 {
// P30_P37.agc:68
//
// P30_P37.agc:69
//		CAF	V06N81		# DISPLAY DELTA V (LV)
// slot 31750
            if slot <> 31750 or instruction <> 14295 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2007), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31751 {
// P30_P37.agc:70
//		TC	VNPOOH		#     REDISPLAY ON RECYCLE
// slot 31751
                if slot <> 31751 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P30_P37.agc:71
//
// P30_P37.agc:72
//		TC	DOWNFLAG	# RESET UPDATE FLAG
// slot 31752
                if slot <> 31752 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2011] to agcAotUnit2011@.

agcAotInstallSourceRope(list(
// P30_P37.agc:73
//		ADRES	UPDATFLG
// slot 31753
    31753, 46
)).

// bank 35, slots 31754-31754
function agcAotUnit2012 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P30_P37.agc:74
//		TC	INTPRET
// slot 31754
    if slot <> 31754 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2012] to agcAotUnit2012@.

agcAotInstallSourceRope(list(
// P30_P37.agc:75
//		CALL
// slot 31755
    31755, 65320,
// P30_P37.agc:76
//			S30.1
// slot 31756
    31756, 57344,
// P30_P37.agc:77
//		SET	EXIT
// slot 31757
    31757, 65048,
// P30_P37.agc:78
//			UPDATFLG
// slot 31758
    31758, 624
)).

// bank 35, slots 31759-31761
function agcAotUnit2013 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31759 {
// P30_P37.agc:79
//PARAM30		CAF	V06N42		# DISPLAY APOGEE,PERIGEE ,DELTA V
// slot 31759
        if slot <> 31759 or instruction <> 13334 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1046), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31760 {
// P30_P37.agc:80
//		TC	VNPOOH
// slot 31760
            if slot <> 31760 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P30_P37.agc:81
//# Page 615
// P30_P37.agc:82
//
// P30_P37.agc:83
//		TC	INTPRET
// slot 31761
            if slot <> 31761 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2013] to agcAotUnit2013@.

agcAotInstallSourceRope(list(
// P30_P37.agc:84
//		SETGO
// slot 31762
    31762, 65304,
// P30_P37.agc:85
//			XDELVFLG	# FOR P40'S: EXTERNAL DELTA-V GUIDANCE.
// slot 31763
    31763, 1070,
// P30_P37.agc:86
//			REVN1645	# TRKMKCNT, T60, +MGA  DISPLAY
// slot 31764
    31764, 60096,
// P30_P37.agc:87
//
// P30_P37.agc:88
//V06N33		VN	0633
// slot 31765
    31765, 1602,
// P30_P37.agc:89
//V06N42		VN	0642
// slot 31766
    31766, 1620,
// P30_P37.agc:90
//
// P30_P37.agc:91
//# Page 616
// P30_P37.agc:92
//# PROGRAM DESCRIPTION S30.1	DATE 9NOV66
// P30_P37.agc:93
//# MOD NO 1			LOG SECTION P30,P37
// P30_P37.agc:94
//# MOD BY AIYAWAR KERMAN **
// P30_P37.agc:95
//# FUNCTIONAL DESCRIPTION
// P30_P37.agc:96
//#	BASED ON STORED TARGET PARAMETERS(R OF IGNITION(RTIG),V OF
// P30_P37.agc:97
//#	IGNITION(VTIG),TIME OF IGNITION (TIG)),COMPUTE PERIGEE ALTITUDE
// P30_P37.agc:98
//#	APOGEE ALTITUDE AND DELTAV REQUIRED(DELVSIN).
// P30_P37.agc:99
//# CALLING SEQUENCE
// P30_P37.agc:100
//#	L	CALL
// P30_P37.agc:101
//#	L+1		s30.1
// P30_P37.agc:102
//# NORMAL EXIT MODE
// P30_P37.agc:103
//#	AT L+2 OR CALLING SEQUENCE (GOTO L+2)
// P30_P37.agc:104
//# SUBROUTINES CALLED
// P30_P37.agc:105
//#	LEMPREC
// P30_P37.agc:106
//#	PERIAPO
// P30_P37.agc:107
//# ALARM OR ABORT EXIT MODES
// P30_P37.agc:108
//#	NONE
// P30_P37.agc:109
//# ERASABLE INITIALIZATION REQUIRED
// P30_P37.agc:110
//#	TIG		TIME OF IGNITION	DP B28CS
// P30_P37.agc:111
//#	DELVSLV		SPECIFIED DELTA-V IN LOCAL VERT.
// P30_P37.agc:112
//#			COORDS. OF ACTIVE VEHICLE AT
// P30_P37.agc:113
//#			TIME OF IGNITION	VECTOR 	B+7 METERS/CS
// P30_P37.agc:114
//#
// P30_P37.agc:115
//# OUTPUT
// P30_P37.agc:116
//#	RTIG		POSITION AT TIG		VECTOR 	B+29 METERS
// P30_P37.agc:117
//#	VTIG		VELOCITY AT TIG		VECTOR 	B+29 METERS/CS
// P30_P37.agc:118
//#	PDL 4D		APOGEE ALTITUDE		DP 	B+29 M ,  B+27 METERS.
// P30_P37.agc:119
//#	HAPO		APOGEE ALTITUDE		DP 	B+29 METERS
// P30_P37.agc:120
//#	PDL 8D		PERIGEE ALTITUDE	DP 	B+29 M ,  B+27 METERS.
// P30_P37.agc:121
//#	HPER		PERIGEE ALTITUDE	DP 	B+29 METERS
// P30_P37.agc:122
//#	DELVSIN		SPECIFIED DELTA-V IN INTERTIAL
// P30_P37.agc:123
//#			COORD. OF ACTIVE VEHICLE AT
// P30_P37.agc:124
//#			TIME OF IGNITION	VECTOR 	B+7 METERS/CS
// P30_P37.agc:125
//#	DELVSAB		MAG. OF DELVSIN		VECTOR 	B+7 METERS/CS
// P30_P37.agc:126
//#
// P30_P37.agc:127
//# DEBRIS	QTEMP	TEMP. ERASABLE
// P30_P37.agc:128
//#		QPRET,MPAC
// P30_P37.agc:129
//#		PUSHLIST
// P30_P37.agc:130
//
// P30_P37.agc:131
//		SETLOC	P30S1
// P30_P37.agc:132
//		BANK
// P30_P37.agc:133
//
// P30_P37.agc:134
//		COUNT*	$$/S30S
// P30_P37.agc:135
//
// P30_P37.agc:136
//S30.1		STQ	DLOAD
// slot 30720
    30720, 58656,
// P30_P37.agc:137
//			QTEMP
// slot 30721
    30721, 3892,
// P30_P37.agc:138
//			TIG		# TIME IGNITION SCALED AT 2(+28)CS
// slot 30722
    30722, 3652,
// P30_P37.agc:139
//		STCALL	TDEC1
// slot 30723
    30723, 28738,
// P30_P37.agc:140
//			LEMPREC		# ENCKE ROUTINE FOR LEM
// slot 30724
    30724, 23646,
// P30_P37.agc:141
//
// P30_P37.agc:142
//		VLOAD	SXA,2
// slot 30725
    30725, 56570,
// P30_P37.agc:143
//# Page 617
// P30_P37.agc:144
//			RATT
// slot 30726
    30726, 2,
// P30_P37.agc:145
//			RTX2
// slot 30727
    30727, 3070,
// P30_P37.agc:146
//		STORE	RTIG		# RADIUS VECTOR AT IGNITION TIME
// slot 30728
    30728, 3908,
// P30_P37.agc:147
//		UNIT	VCOMP
// slot 30729
    30729, 48732,
// P30_P37.agc:148
//		STOVL	DELVSIN		# ZRF/LV IN DELVSIN SCALED AT 2
// slot 30730
    30730, 24412,
// P30_P37.agc:149
//			VATT		# VELOCITY VECTOR AT TIG, SCALED 2(7) M/CS
// slot 30731
    30731, 14,
// P30_P37.agc:150
//		STORE	VTIG
// slot 30732
    30732, 3920,
// P30_P37.agc:151
//		VXV	UNIT
// slot 30733
    30733, 44602,
// P30_P37.agc:152
//			RTIG
// slot 30734
    30734, 3908,
// P30_P37.agc:153
//		SETPD	SXA,1
// slot 30735
    30735, 55298,
// P30_P37.agc:154
//			0
// slot 30736
    30736, 2,
// P30_P37.agc:155
//			RTX1
// slot 30737
    30737, 3068,
// P30_P37.agc:156
//		PUSH	VXV		# YRF/LV PDL 0  SCALED AT 2
// slot 30738
    30738, 40204,
// P30_P37.agc:157
//			DELVSIN
// slot 30739
    30739, 3932,
// P30_P37.agc:158
//		VSL1	PDVL
// slot 30740
    30740, 52724,
// P30_P37.agc:159
//		PDVL	PDVL		# YRF/LV PDL 6 SCALED AT 2
// slot 30741
    30741, 52634,
// P30_P37.agc:160
//			DELVSIN		# ZRF/LV PDL 12D SCALED AT 2
// slot 30742
    30742, 3932,
// P30_P37.agc:161
//			DELVSLV
// slot 30743
    30743, 3640,
// P30_P37.agc:162
//		VXM	VSL1
// slot 30744
    30744, 64138,
// P30_P37.agc:163
//			0
// slot 30745
    30745, 2,
// P30_P37.agc:164
//		STORE	DELVSIN		# DELTAV IN INERT. COOR. SCALED TO B+7M/CS
// slot 30746
    30746, 3932,
// P30_P37.agc:165
//		ABVAL
// slot 30747
    30747, 65356,
// P30_P37.agc:166
//		STOVL	DELVSAB		# DELTA V MAG.
// slot 30748
    30748, 24424,
// P30_P37.agc:167
//			RTIG		# (FOR PERIAPO)
// slot 30749
    30749, 3908,
// P30_P37.agc:168
//		PDVL	VAD		# VREQUIRED = VTIG + DELVSIN (FOR PERIAPO)
// slot 30750
    30750, 44442,
// P30_P37.agc:169
//			VTIG
// slot 30751
    30751, 3920,
// P30_P37.agc:170
//			DELVSIN
// slot 30752
    30752, 3932,
// P30_P37.agc:171
//		CALL
// slot 30753
    30753, 65320,
// P30_P37.agc:172
//			PERIAPO1
// slot 30754
    30754, 39324,
// P30_P37.agc:173
//		CALL
// slot 30755
    30755, 65320,
// P30_P37.agc:174
//			SHIFTR1		# RESCALE IF NEEDED
// slot 30756
    30756, 39468,
// P30_P37.agc:175
//		CALL			# LIMIT DISPLAY TO 9999.9 N. MI.
// slot 30757
    30757, 65320,
// P30_P37.agc:176
//			MAXCHK
// slot 30758
    30758, 38716,
// P30_P37.agc:177
//		STODL	HPER		# PERIGEE ALT 2(29) METERS, FOR DISPLAY
// slot 30759
    30759, 14754,
// P30_P37.agc:178
//			4D
// slot 30760
    30760, 10,
// P30_P37.agc:179
//		CALL
// slot 30761
    30761, 65320,
// P30_P37.agc:180
//			SHIFTR1		# RESCALE IF NEEDED
// slot 30762
    30762, 39468,
// P30_P37.agc:181
//		CALL			# LIMIT DISPLAY TO 9999.9 N. MI.
// slot 30763
    30763, 65320,
// P30_P37.agc:182
//			MAXCHK
// slot 30764
    30764, 38716,
// P30_P37.agc:183
//		STCALL	HAPO		# APOGEE  ALT 2(29) METERS, FOR DISPLAY
// slot 30765
    30765, 31134,
// P30_P37.agc:184
//			QTEMP
// slot 30766
    30766, 3892
)).

// no code for the lines below
// P30_P37.agc:185
//
