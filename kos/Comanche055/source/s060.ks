// REENTRY_CONTROL.agc
agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1
//# Copyright:	Public domain.
// REENTRY_CONTROL.agc:2
//# Filename:	REENTRY_CONTROL.agc
// REENTRY_CONTROL.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// REENTRY_CONTROL.agc:4
//#		It is part of the source code for the Command Module's (CM)
// REENTRY_CONTROL.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// REENTRY_CONTROL.agc:6
//# Assembler:	yaYUL
// REENTRY_CONTROL.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// REENTRY_CONTROL.agc:8
//# Website:	www.ibiblio.org/apollo.
// REENTRY_CONTROL.agc:9
//# Pages:	844-882
// REENTRY_CONTROL.agc:10
//# Mod history:	2009-05-08 RSB	Adapted from the Colossus249/ file of the
// REENTRY_CONTROL.agc:11
//#				same name, using Comanche055 page images.
// REENTRY_CONTROL.agc:12
//#		2009-05-23 RSB	In a couple of 2OCT statements, removed the
// REENTRY_CONTROL.agc:13
//#				space between the first and second octal words.
// REENTRY_CONTROL.agc:14
//#
// REENTRY_CONTROL.agc:15
//# This source code has been transcribed or otherwise adapted from digitized
// REENTRY_CONTROL.agc:16
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// REENTRY_CONTROL.agc:17
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// REENTRY_CONTROL.agc:18
//# thanks to both.  The images (with suitable reduction in storage size and
// REENTRY_CONTROL.agc:19
//# consequent reduction in image quality as well) are available online at
// REENTRY_CONTROL.agc:20
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// REENTRY_CONTROL.agc:21
//# illegible, contact me at info@sandroid.org about getting access to the
// REENTRY_CONTROL.agc:22
//# (much) higher-quality images which Fjeld Kerman actually created.
// REENTRY_CONTROL.agc:23
//#
// REENTRY_CONTROL.agc:24
//# Notations on the hardcopy document read, in part:
// REENTRY_CONTROL.agc:25
//#
// REENTRY_CONTROL.agc:26
//#	Assemble revision 055 of AGC program Comanche by NASA
// REENTRY_CONTROL.agc:27
//#	2021113-051.  10:28 APR. 1, 1969
// REENTRY_CONTROL.agc:28
//#
// REENTRY_CONTROL.agc:29
//#	This AGC program shall also be referred to as
// REENTRY_CONTROL.agc:30
//#			Colossus 2A
// REENTRY_CONTROL.agc:31
//
// REENTRY_CONTROL.agc:32
//# Page 844
// REENTRY_CONTROL.agc:33
//# ENTRY INITIALIZATION ROUTINE
// REENTRY_CONTROL.agc:34
//# ----------------------------
// REENTRY_CONTROL.agc:35
//
// REENTRY_CONTROL.agc:36
//		BANK	25
// REENTRY_CONTROL.agc:37
//		SETLOC	REENTRY
// REENTRY_CONTROL.agc:38
//		BANK
// REENTRY_CONTROL.agc:39
//
// REENTRY_CONTROL.agc:40
//		COUNT*	$$/ENTRY
// REENTRY_CONTROL.agc:41
//		EBANK=	RTINIT
// REENTRY_CONTROL.agc:42
//
// REENTRY_CONTROL.agc:43
//EBENTRY		=	EBANK7
// REENTRY_CONTROL.agc:44
//EBAOG		EQUALS	EBANK6
// REENTRY_CONTROL.agc:45
//NTRYPRIO	EQUALS	PRIO20		# (SERVICER)
// REENTRY_CONTROL.agc:46
//CM/FLAGS	EQUALS	STATE +6
// REENTRY_CONTROL.agc:47
//
// REENTRY_CONTROL.agc:48
//STARTENT	EXIT			# MM = 63
// slot 23552
    23552, 65532
)).

// bank 25, slots 23553-23559
function agcAotUnit1403 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 23555 {
        if slot <= 23553 {
// REENTRY_CONTROL.agc:49
//
// REENTRY_CONTROL.agc:50
//					# COME HERE FROM CM/POSE.  RESTARTED IN CM/POSE.
// REENTRY_CONTROL.agc:51
//		CS	ENTMASK		# INITIALIZE ALL SWITCHES TO ZERO
// slot 23553
            if slot <> 23553 or instruction <> 17483 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1099), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 23554 {
// REENTRY_CONTROL.agc:52
//					# EXCEPT LATSW, ENTRYDSP, AND GONEPAST.
// REENTRY_CONTROL.agc:53
//					# GONEBY 112D BIT8 FLAG7, SELF-INITIALIZING.
// REENTRY_CONTROL.agc:54
//		INHINT
// slot 23554
                if slot <> 23554 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:55
//		MASK	CM/FLAGS
// slot 23555
                if slot <> 23555 or instruction <> 28738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 23557 {
            if slot <= 23556 {
// REENTRY_CONTROL.agc:56
//					# ENTRYDSP = 92D B13
// REENTRY_CONTROL.agc:57
//					# GONEPAST=95D B10.	RELVELSW=96D B9
// REENTRY_CONTROL.agc:58
//					# EGSW = 97D B8		NOSWITCH = 98D B7
// REENTRY_CONTROL.agc:59
//					# HIND=99D B6		INRLSW=100D B5
// REENTRY_CONTROL.agc:60
//					# LATSW=101D B4		.05GSW=102D B3
// REENTRY_CONTROL.agc:61
//
// REENTRY_CONTROL.agc:62
//		AD	ENTRYSW		# SET ENTRYDSP, LATSW, GONEPAST.
// slot 23556
                if slot <> 23556 or instruction <> 25676 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1100), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:63
//		TS	CM/FLAGS
// slot 23557
                if slot <> 23557 or instruction <> 22594 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22594, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 23558 {
// REENTRY_CONTROL.agc:64
//
// REENTRY_CONTROL.agc:65
//		RELINT
// slot 23558
                if slot <> 23558 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:66
//
// REENTRY_CONTROL.agc:67
//		TC	INTPRET
// slot 23559
                if slot <> 23559 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1403] to agcAotUnit1403@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:68
//
// REENTRY_CONTROL.agc:69
//		SLOAD
// slot 23560
    23560, 65466,
// REENTRY_CONTROL.agc:70
//			LODPAD
// slot 23561
    23561, 3090,
// REENTRY_CONTROL.agc:71
//		STORE	LOD
// slot 23562
    23562, 3884,
// REENTRY_CONTROL.agc:72
//
// REENTRY_CONTROL.agc:73
//		SLOAD
// slot 23563
    23563, 65466,
// REENTRY_CONTROL.agc:74
//			LADPAD
// slot 23564
    23564, 3088,
// REENTRY_CONTROL.agc:75
//		STORE	LAD
// slot 23565
    23565, 3880,
// REENTRY_CONTROL.agc:76
//
// REENTRY_CONTROL.agc:77
//		DMP			# L/DCMINR = LAD COS(15)
// slot 23566
    23566, 65290,
// REENTRY_CONTROL.agc:78
//			COS15
// slot 23567
    23567, 13734,
// REENTRY_CONTROL.agc:79
//		STODL	L/DCMINR
// slot 23568
    23568, 16176,
// REENTRY_CONTROL.agc:80
//			LATSLOPE
// slot 23569
    23569, 13516,
// REENTRY_CONTROL.agc:81
//		DMP	SR1		# KLAT = LAD/24
// slot 23570
    23570, 57866,
// REENTRY_CONTROL.agc:82
//			LAD
// slot 23571
    23571, 3880,
// REENTRY_CONTROL.agc:83
//# Page 845
// REENTRY_CONTROL.agc:84
//		STODL	KLAT
// slot 23572
    23572, 16180,
// REENTRY_CONTROL.agc:85
//			Q7F
// slot 23573
    23573, 13566,
// REENTRY_CONTROL.agc:86
//		STODL	Q7		# Q7 = Q7F
// slot 23574
    23574, 15610,
// REENTRY_CONTROL.agc:87
//			NEARONE		# 1.0 -1BIT
// slot 23575
    23575, 15860,
// REENTRY_CONTROL.agc:88
//		STODL	FACTOR
// slot 23576
    23576, 16152,
// REENTRY_CONTROL.agc:89
//			LAD
// slot 23577
    23577, 3880,
// REENTRY_CONTROL.agc:90
//		SIGN	DCOMP
// slot 23578
    23578, 48874,
// REENTRY_CONTROL.agc:91
//			HEADSUP		# MAY BE NOISE FOR DISPLAY P61
// slot 23579
    23579, 3502,
// REENTRY_CONTROL.agc:92
//		STCALL	L/D		# L/D = - LAD SGN(HEADSUP)
// slot 23580
    23580, 32568,
// REENTRY_CONTROL.agc:93
//
// REENTRY_CONTROL.agc:94
//			STARTEN1	# RETURN VIA GOTOADDR
// slot 23581
    23581, 43110,
// REENTRY_CONTROL.agc:95
//		VLOAD	VXV
// slot 23582
    23582, 40442,
// REENTRY_CONTROL.agc:96
//			VN		# (-7) M/CS
// slot 23583
    23583, 1278,
// REENTRY_CONTROL.agc:97
//			UNITR		# .5 UNIT		REF COORDS
// slot 23584
    23584, 2016,
// REENTRY_CONTROL.agc:98
//		UNIT	DOT
// slot 23585
    23585, 41308,
// REENTRY_CONTROL.agc:99
//			RT		# RT/2 TARGET VECTOR	REF COORDS
// slot 23586
    23586, 3704,
// REENTRY_CONTROL.agc:100
//		STORE	LATANG		# LATANG = UNI.RT /4
// slot 23587
    23587, 3964,
// REENTRY_CONTROL.agc:101
//		DCOMP	RTB
// slot 23588
    23588, 40060,
// REENTRY_CONTROL.agc:102
//			SIGNMPAC
// slot 23589
    23589, 38804,
// REENTRY_CONTROL.agc:103
//		STODL	K2ROLL		# K2ROLL = -SGN(LATANG)
// slot 23590
    23590, 16200,
// REENTRY_CONTROL.agc:104
//
// REENTRY_CONTROL.agc:105
//			LAD
// slot 23591
    23591, 3880,
// REENTRY_CONTROL.agc:106
//		DMP	DAD
// slot 23592
    23592, 36106,
// REENTRY_CONTROL.agc:107
//			Q21
// slot 23593
    23593, 13570,
// REENTRY_CONTROL.agc:108
//			Q22
// slot 23594
    23594, 13574,
// REENTRY_CONTROL.agc:109
//		STORE	Q2		# Q2 = -1152 + 500 LAD
// slot 23595
    23595, 3988,
// REENTRY_CONTROL.agc:110
//
// REENTRY_CONTROL.agc:111
//		SSP	SSP
// slot 23596
    23596, 55730,
// REENTRY_CONTROL.agc:112
//			GOTOADDR	# SET SELECTOR FOR INITIAL PASS
// slot 23597
    23597, 3916,
// REENTRY_CONTROL.agc:113
//			INITROLL
// slot 23598
    23598, 43360,
// REENTRY_CONTROL.agc:114
//			POSEXIT
// slot 23599
    23599, 3498,
// REENTRY_CONTROL.agc:115
//			SCALEPOP	# SET CM/POSE TO CONTINUE AT SCALEPOP
// slot 23600
    23600, 43162,
// REENTRY_CONTROL.agc:116
//
// REENTRY_CONTROL.agc:117
//		RTB
// slot 23601
    23601, 65336,
// REENTRY_CONTROL.agc:118
//			SERVNOUT	# OMIT INITIAL DISPLAY, SINCE 1ST GUESSBAD
// slot 23602
    23602, 44818,
// REENTRY_CONTROL.agc:119
//
// REENTRY_CONTROL.agc:120
//# CALCULATE THE INITIAL TARGET VECTOR: RTINIT, ALSO RTEAST, RTNORM AND RT.  ALL ARE .5 UNIT AND IN
// REENTRY_CONTROL.agc:121
//# REFERENCE COORDINATES.
// REENTRY_CONTROL.agc:122
//
// REENTRY_CONTROL.agc:123
//STARTEN1	STQ	VLOAD
// slot 23603
    23603, 64800,
// REENTRY_CONTROL.agc:124
//			GOTOADDR
// slot 23604
    23604, 3914,
// REENTRY_CONTROL.agc:125
//			LAT(SPL)	# TARGET COORDINATES
// slot 23605
    23605, 3586,
// REENTRY_CONTROL.agc:126
//		CLEAR	CLEAR		# DO CALL USING PAD RADIUS.  WILL UNIT IT.
// slot 23606
    23606, 35864,
// REENTRY_CONTROL.agc:127
//			ERADFLAG	# ANYWAY.
// slot 23607
    23607, 868,
// REENTRY_CONTROL.agc:128
//			LUNAFLAG
// slot 23608
    23608, 1894,
// REENTRY_CONTROL.agc:129
//		STODL	LAT
// slot 23609
    23609, 13448,
// REENTRY_CONTROL.agc:130
//			3ZEROS
// slot 23610
    23610, 13754,
// REENTRY_CONTROL.agc:131
//
// REENTRY_CONTROL.agc:132
//		STODL	LAT +4		# SET ALT=0.
// slot 23611
    23611, 13456,
// REENTRY_CONTROL.agc:133
//			PIPTIME		# ESTABLISH RTINIT AT TIME OF PRESENT
// slot 23612
    23612, 1290,
// REENTRY_CONTROL.agc:134
//# Page 846
// REENTRY_CONTROL.agc:135
//					# RN AND VN.
// REENTRY_CONTROL.agc:136
//		STCALL	TIME/RTO	# SAVE TIME BASE OF RTINIT.
// slot 23613
    23613, 32424,
// REENTRY_CONTROL.agc:137
//			LALOTORV	# C(MPAC) =TIME  (PIPTIME)
// slot 23614
    23614, 23106,
// REENTRY_CONTROL.agc:138
//		UNIT			# ANSWER IN ALPHAV ALSO
// slot 23615
    23615, 65372,
// REENTRY_CONTROL.agc:139
//		STODL	RTINIT		# .5 UNIT TARGET		REF COORDS
// slot 23616
    23616, 15956,
// REENTRY_CONTROL.agc:140
//			500SEC		# NOMINAL ENTRY TIME FOR P63
// slot 23617
    23617, 10388,
// REENTRY_CONTROL.agc:141
//					# TIME/RTO = PIPTIME, STILL.
// REENTRY_CONTROL.agc:142
//		STCALL	DTEAROT		# INITIALIZE EARROT
// slot 23618
    23618, 32524,
// REENTRY_CONTROL.agc:143
//			EARROT1		# GET RT
// slot 23619
    23619, 39194,
// REENTRY_CONTROL.agc:144
//		DOT	SL1
// slot 23620
    23620, 59970,
// REENTRY_CONTROL.agc:145
//			UNITR		# RT/2 IN MPAC
// slot 23621
    23621, 2016,
// REENTRY_CONTROL.agc:146
//		ACOS
// slot 23622
    23622, 65452,
// REENTRY_CONTROL.agc:147
//		STCALL	THETAH		# RANGE ANGLE /360
// slot 23623
    23623, 32644,
// REENTRY_CONTROL.agc:148
//			GOTOADDR	# RETURN TO CALLER
// slot 23624
    23624, 3914,
// REENTRY_CONTROL.agc:149
//
// REENTRY_CONTROL.agc:150
//500SEC		2DEC	50000 B-28	# CS
// slot 23625 23626
    23625, 6, 23626, 1696,
// REENTRY_CONTROL.agc:151
//
// REENTRY_CONTROL.agc:152
//ENTMASK		OCT	11774
// slot 23627
    23627, 10232,
// REENTRY_CONTROL.agc:153
//ENTRYSW		OCT	11010		# ENTRYDSP B13, GONEPAST B10, LATSW B4
// slot 23628
    23628, 9232,
// REENTRY_CONTROL.agc:154
//# Page 847
// REENTRY_CONTROL.agc:155
//
// REENTRY_CONTROL.agc:156
//SCALEPOP	CALL
// slot 23629
    23629, 65320,
// REENTRY_CONTROL.agc:157
//			TARGETNG
// slot 23630
    23630, 43178,
// REENTRY_CONTROL.agc:158
//
// REENTRY_CONTROL.agc:159
//		EXIT
// slot 23631
    23631, 65532
)).

// bank 25, slots 23632-23632
function agcAotUnit1404 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:160
//
// REENTRY_CONTROL.agc:161
//REFAZE10	TC	PHASCHNG
// slot 23632
    if slot <> 23632 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1404] to agcAotUnit1404@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:162
//		OCT	10035		# SERVICER 5.3 RESTART AT REFAZE10
// slot 23633
    23633, 8250
)).

// bank 25, slots 23634-23634
function agcAotUnit1405 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:163
//
// REENTRY_CONTROL.agc:164
//		TC	INTPRET
// slot 23634
    if slot <> 23634 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1405] to agcAotUnit1405@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:165
//
// REENTRY_CONTROL.agc:166
//# JUMP TO PARTICULAR RE-ENTRY PHASE:
// REENTRY_CONTROL.agc:167
//#SEQUENCE
// REENTRY_CONTROL.agc:168
//		GOTO
// slot 23635
    23635, 65360,
// REENTRY_CONTROL.agc:169
//			GOTOADDR
// slot 23636
    23636, 3914,
// REENTRY_CONTROL.agc:170
//
// REENTRY_CONTROL.agc:171
//# GOTOADDR CONTAINS THE ADDRESS OF THE ROLL COMMAND EQUATIONS TO THE CURRENT PHASE OF
// REENTRY_CONTROL.agc:172
//# RE-ENTRY.  SEQUENCING IS AS FOLLOWS:
// REENTRY_CONTROL.agc:173
//#
// REENTRY_CONTROL.agc:174
//# INITROLL	ADDRESS IS SET HERE INITIALLY.  HOLDS INITIAL ROLL ATTITUDE UNTIL  KAT  IS EXCEEDED.  THEN HOLDS NEW ROLL
// REENTRY_CONTROL.agc:175
//#		ATTITUDE UNTIL  VRTHRESH  IS EXCEEDED.  THEN BRANCHES TO
// REENTRY_CONTROL.agc:176
//#
// REENTRY_CONTROL.agc:177
//# HUNTEST	THIS SECTION CHECKS TO SEE IF THE PREDICTED RANGE AT NOMINAL   L/D FROM PRESENT CONDITIONS IS LESS
// REENTRY_CONTROL.agc:178
//#		THAN THE DESIRED RANGE.
// REENTRY_CONTROL.agc:179
//#			IF NOT --- A ROLL COMMAND IS GENERATED BY THE CONSTANT DRAG CONTROLLER.
// REENTRY_CONTROL.agc:180
//#			IF SO  --- CONTROL AND GOTOADDR ARE SET TO UPCONTRL.
// REENTRY_CONTROL.agc:181
//#		USUALLY NO ITERATION IS INVOLVED EXCEPT IF THE RANGE DESIRED IS TOO LONG ON THE FIRST PASS THROUGH
// REENTRY_CONTROL.agc:182
//#		HUNTEST.
// REENTRY_CONTROL.agc:183
//#
// REENTRY_CONTROL.agc:184
//# UPCONTRL	CONTROLS ROLL DURING THE SUPER-CIRCULAR PHASE.  UPCONTRL IS TERMINATED EITHER
// REENTRY_CONTROL.agc:185
//#			(A) WHEN THE DRAG (AS MEASURED BY THE PIPAS) FALLS BELOW Q7, OR
// REENTRY_CONTROL.agc:186
//#			(B) IF RDOT IS NEGATIVE AND REFERENCE VL EXCEEDS V.
// REENTRY_CONTROL.agc:187
//#		IN CASE (A),  GOTOADDR  IS SET TO  KEP2  AND IN CASE (B), TO  PREDICT3  SKIPPING THE KEPLER PHASE OF
// REENTRY_CONTROL.agc:188
//#		ENTRY.
// REENTRY_CONTROL.agc:189
//#
// REENTRY_CONTROL.agc:190
//# KEP2		GOTOADDR IS SET HERE DURING THE KEPLER PHASE TO MONITOR DRAG.  THE SPACECRAFT IS INSTANTANEOUSLY
// REENTRY_CONTROL.agc:191
//#		TRIMMED IN PITCH AND YAW TO THE COMPUTED RELATIVE VELOCITY.  THE LAST COMPUTED ROLL ANGLE IS MAINTAINED.
// REENTRY_CONTROL.agc:192
//#		WHEN THE MEASURED DRAG EXCEEDS Q7 +0.5,  GOTOADDR  IS SET TO
// REENTRY_CONTROL.agc:193
//#
// REENTRY_CONTROL.agc:194
//# PREDICT3	THIS CONTROLS THE FINAL SUB-ORBITAL PHASE. ROLL COMMANDS CEASE
// REENTRY_CONTROL.agc:195
//#		WHEN  V  IS LESS THAN  VQUIT .  AN EXIT IS MADE TO
// REENTRY_CONTROL.agc:196
//#
// REENTRY_CONTROL.agc:197
//# P67.1		THE LAST COMPUTED ROLL ANGLE IS MAINTAINED.  RATE DAMPING IS DONE IN PITCH AND YAW.  PRESENT LATITUDE
// REENTRY_CONTROL.agc:198
//#		AND LONGITUDE ARE COMPUTED FOR DISPLAY.
// REENTRY_CONTROL.agc:199
//#		ENTRY IS TERMINATED WHEN DISKY RESPONSE IS MADE TO TO THIS FINAL FLASHING DISPLAY.
// REENTRY_CONTROL.agc:200
//
// REENTRY_CONTROL.agc:201
//# Page 848
// REENTRY_CONTROL.agc:202
//# PROCESS AVERAGE G OUTPUT...SCALE IT AND GET INPUT DATA
// REENTRY_CONTROL.agc:203
//
// REENTRY_CONTROL.agc:204
//# * START  TARGETING ...
// REENTRY_CONTROL.agc:205
//
// REENTRY_CONTROL.agc:206
//		EBANK=	RTINIT
// REENTRY_CONTROL.agc:207
//
// REENTRY_CONTROL.agc:208
//					# TARGETNG IS CALLED BY P61, FROM GROUP 4.
// REENTRY_CONTROL.agc:209
//					# TARGETNG IS CALLED BY ENTRY, FROM GROUP 5.
// REENTRY_CONTROL.agc:210
//
// REENTRY_CONTROL.agc:211
//					# ALL MM COME HERE.
// REENTRY_CONTROL.agc:212
//TARGETNG	BOFF	VLOAD		# ENTER WITH PROPER EB FROM CM/POSE(TEST)
// slot 23637
    23637, 64792,
// REENTRY_CONTROL.agc:213
//			RELVELSW	# RELVELSW = 96D BIT9
// slot 23638
    23638, 3532,
// REENTRY_CONTROL.agc:214
//			GETVEL		# WANT INERTIAL VEL.  GO GET IT.
// slot 23639
    23639, 43190,
// REENTRY_CONTROL.agc:215
//			-VREL		# NEW V IS RELATIVE, CONTINUE
// slot 23640
    23640, 3756,
// REENTRY_CONTROL.agc:216
//
// REENTRY_CONTROL.agc:217
//		VCOMP	GOTO		# (VREL) = (V) + KWE UNITR*UNITW
// slot 23641
    23641, 43132,
// REENTRY_CONTROL.agc:218
//			GETUNITV -1	# - VREL WAS LEFT BY CM/POSE
// slot 23642
    23642, 43196,
// REENTRY_CONTROL.agc:219
//
// REENTRY_CONTROL.agc:220
//GETVEL		VLOAD	VXSC		# INERTIAL V WANTED
// slot 23643
    23643, 61946,
// REENTRY_CONTROL.agc:221
//			VN		# KVSCALE = (12800 / .3048) / 2VS
// slot 23644
    23644, 1278,
// REENTRY_CONTROL.agc:222
//			KVSCALE		# KVSCALE = .81491944
// slot 23645
    23645, 13618,
// REENTRY_CONTROL.agc:223
//		STORE	VEL		# V/2 VS
// slot 23646
    23646, 3740,
// REENTRY_CONTROL.agc:224
//
// REENTRY_CONTROL.agc:225
//GETUNITV	UNIT	STQ
// slot 23647
    23647, 36956,
// REENTRY_CONTROL.agc:226
//			60GENRET
// slot 23648
    23648, 3574,
// REENTRY_CONTROL.agc:227
//		STODL	UNITV
// slot 23649
    23649, 16016,
// REENTRY_CONTROL.agc:228
//			34D
// slot 23650
    23650, 70,
// REENTRY_CONTROL.agc:229
//		STORE	VSQUARE		# VSQ/4
// slot 23651
    23651, 3876,
// REENTRY_CONTROL.agc:230
//
// REENTRY_CONTROL.agc:231
//		DSU			# LEQ = VSQUARE - 1
// slot 23652
    23652, 65322,
// REENTRY_CONTROL.agc:232
//			FOURTH		# 4 G-S FULL SCALE
// slot 23653
    23653, 13738,
// REENTRY_CONTROL.agc:233
//		STODL	LEQ		# LEQ/4
// slot 23654
    23654, 16216,
// REENTRY_CONTROL.agc:234
//
// REENTRY_CONTROL.agc:235
//			36D
// slot 23655
    23655, 74,
// REENTRY_CONTROL.agc:236
//		STOVL	V		# V/2 VS = VEL/2 VS
// slot 23656
    23656, 24440,
// REENTRY_CONTROL.agc:237
//
// REENTRY_CONTROL.agc:238
//			VEL
// slot 23657
    23657, 3740,
// REENTRY_CONTROL.agc:239
//		DOT	SL1		# RDOT= V.UNITR
// slot 23658
    23658, 59970,
// REENTRY_CONTROL.agc:240
//			UNITR
// slot 23659
    23659, 2016,
// REENTRY_CONTROL.agc:241
//		STOVL	RDOT		# RDOT /2 VS
// slot 23660
    23660, 24448,
// REENTRY_CONTROL.agc:242
//
// REENTRY_CONTROL.agc:243
//			DELV		# PIPA COUNTS IN PLATFORM COORDS.
// slot 23661
    23661, 1254,
// REENTRY_CONTROL.agc:244
//		ABVAL	DMP
// slot 23662
    23662, 34124,
// REENTRY_CONTROL.agc:245
//			KASCALE
// slot 23663
    23663, 13622,
// REENTRY_CONTROL.agc:246
//		SL1	BZE
// slot 23664
    23664, 44244,
// REENTRY_CONTROL.agc:247
//			SETMIND
// slot 23665
    23665, 46262,
// REENTRY_CONTROL.agc:248
//DSTORE		STOVL	D		# ACCELERATION USED TO APPROX DRAG
// slot 23666
    23666, 24384,
// REENTRY_CONTROL.agc:249
//			VEL
// slot 23667
    23667, 3740,
// REENTRY_CONTROL.agc:250
//		VXV	UNIT		# UNI = UNIT(V*R)
// slot 23668
    23668, 44602,
// REENTRY_CONTROL.agc:251
//# Page 849
// REENTRY_CONTROL.agc:252
//			UNITR
// slot 23669
    23669, 2016,
// REENTRY_CONTROL.agc:253
//		STORE	UNI		# .5 UNI		REF COORDS.
// slot 23670
    23670, 3716,
// REENTRY_CONTROL.agc:254
//
// REENTRY_CONTROL.agc:255
//		BOFF	DLOAD
// slot 23671
    23671, 58648,
// REENTRY_CONTROL.agc:256
//			RELVELSW
// slot 23672
    23672, 3532,
// REENTRY_CONTROL.agc:257
//			GETETA
// slot 23673
    23673, 46200,
// REENTRY_CONTROL.agc:258
//			3ZEROS
// slot 23674
    23674, 13754,
// REENTRY_CONTROL.agc:259
//UPDATERT	DSU	DAD		# PIPTIME-TIME/RTO =ELAPSED TIME SINCE
// slot 23675
    23675, 36138,
// REENTRY_CONTROL.agc:260
//					# RTINIT WAS ESTABLISHED.
// REENTRY_CONTROL.agc:261
//			TIME/RTO
// slot 23676
    23676, 3752,
// REENTRY_CONTROL.agc:262
//			PIPTIME
// slot 23677
    23677, 1290,
// REENTRY_CONTROL.agc:263
//		STCALL	DTEAROT		# GET PREDICTED TARGET VECTOR RT
// slot 23678
    23678, 32524,
// REENTRY_CONTROL.agc:264
//
// REENTRY_CONTROL.agc:265
//			EARROT2
// slot 23679
    23679, 39210,
// REENTRY_CONTROL.agc:266
//		DOT	SETPD		# SINCE (RT) UNIT VECT, THIS IS 1/4 MAX
// slot 23680
    23680, 33090,
// REENTRY_CONTROL.agc:267
//			UNI		# LATANG = RT.UNI
// slot 23681
    23681, 3716,
// REENTRY_CONTROL.agc:268
//			0
// slot 23682
    23682, 2,
// REENTRY_CONTROL.agc:269
//		STOVL	LATANG		# LATANG = MAC LATANG / 4
// slot 23683
    23683, 24444,
// REENTRY_CONTROL.agc:270
//
// REENTRY_CONTROL.agc:271
//			RT
// slot 23684
    23684, 3704,
// REENTRY_CONTROL.agc:272
//		CLEAR
// slot 23685
    23685, 65304,
// REENTRY_CONTROL.agc:273
//			GONEBY		# SHOW HAVE NOT GONE PAST TARGET.
// slot 23686
    23686, 3950,
// REENTRY_CONTROL.agc:274
//		VXV	DOT		# IF RT*UNITR.UNI NEG, GONEBY=1
// slot 23687
    23687, 41274,
// REENTRY_CONTROL.agc:275
//			UNITR		# GONEPAST IS CONDITIONAL SW SET IN
// slot 23688
    23688, 2016,
// REENTRY_CONTROL.agc:276
//			UNI		# FINAL PHASE.
// slot 23689
    23689, 3716,
// REENTRY_CONTROL.agc:277
//		BPL	SET
// slot 23690
    23690, 35912,
// REENTRY_CONTROL.agc:278
//			+2
// slot 23691
    23691, 43290,
// REENTRY_CONTROL.agc:279
//			GONEBY		# SHOW HAVE GONE PAST TARGET.
// slot 23692
    23692, 3694,
// REENTRY_CONTROL.agc:280
//
// REENTRY_CONTROL.agc:281
//		VLOAD
// slot 23693
    23693, 65530,
// REENTRY_CONTROL.agc:282
//			RT
// slot 23694
    23694, 3704,
// REENTRY_CONTROL.agc:283
//GETANGLE	DOT	DSU		# THETA = ARCCOS(RT.UNITR)
// slot 23695
    23695, 38210,
// REENTRY_CONTROL.agc:284
//			UNITR
// slot 23696
    23696, 2016,
// REENTRY_CONTROL.agc:285
//			NEAR1/4		# TO IMPROVE ACCURACY, CALC RANGE BY
// slot 23697
    23697, 13542,
// REENTRY_CONTROL.agc:286
//		BPL	DAD		# TINYTHET IF HIGH ORDER PART OF
// slot 23698
    23698, 36168,
// REENTRY_CONTROL.agc:287
//			TINYTHET	# ARCCOS ARGUMENT IS ZERO
// slot 23699
    23699, 46268,
// REENTRY_CONTROL.agc:288
//			NEAR1/4
// slot 23700
    23700, 13542,
// REENTRY_CONTROL.agc:289
//		SL1	ACOS
// slot 23701
    23701, 54996,
// REENTRY_CONTROL.agc:290
//THETDONE	STORE	THETAH		# THETAH/360
// slot 23702
    23702, 3972,
// REENTRY_CONTROL.agc:291
//					# HI WORD, LO BIT =1.32 NM=360 60/16384
// REENTRY_CONTROL.agc:292
//
// REENTRY_CONTROL.agc:293
//		BON	DCOMP
// slot 23703
    23703, 48664
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:294
//			GONEBY		# =1 IF HAVE GONE PAST TARGET.
// slot 23704
    23704, 3982,
// REENTRY_CONTROL.agc:295
//					# (SIGN MAY BECOME ERRATIC VERY NEAR
// REENTRY_CONTROL.agc:296
//					# TARGET DUE TO LOSS OF PRECISION.)
// REENTRY_CONTROL.agc:297
//			+1
// slot 23705
    23705, 43316,
// REENTRY_CONTROL.agc:298
//		STODL	RTGON67		# RANGE ERROR:  NEG IF WILL FALL SHORT.
// slot 23706
    23706, 16280,
// REENTRY_CONTROL.agc:299
//
// REENTRY_CONTROL.agc:300
//			D
// slot 23707
    23707, 3904,
// REENTRY_CONTROL.agc:301
//		DSU	BMN
// slot 23708
    23708, 41002,
// REENTRY_CONTROL.agc:302
//# Page 850
// REENTRY_CONTROL.agc:303
//			.05G
// slot 23709
    23709, 13634,
// REENTRY_CONTROL.agc:304
//			NO.05G
// slot 23710
    23710, 43354,
// REENTRY_CONTROL.agc:305
//		SET	VLOAD
// slot 23711
    23711, 64792,
// REENTRY_CONTROL.agc:306
//			.05GSW
// slot 23712
    23712, 3192,
// REENTRY_CONTROL.agc:307
//			DELVREF
// slot 23713
    23713, 3638,
// REENTRY_CONTROL.agc:308
//		PUSH	DOT
// slot 23714
    23714, 41228,
// REENTRY_CONTROL.agc:309
//			UXA/2
// slot 23715
    23715, 3780,
// REENTRY_CONTROL.agc:310
//		SL1	DSQ
// slot 23716
    23716, 52948,
// REENTRY_CONTROL.agc:311
//		PDVL	VSQ		# EXCHANGE WITH PDL.
// slot 23717
    23717, 40602,
// REENTRY_CONTROL.agc:312
//		DSU	DDV
// slot 23718
    23718, 47402,
// REENTRY_CONTROL.agc:313
//			0
// slot 23719
    23719, 2,
// REENTRY_CONTROL.agc:314
//		BOV	SQRT
// slot 23720
    23720, 62976,
// REENTRY_CONTROL.agc:315
//			NOLDCALC	# OVFL LAST CLEARED IN EARROT2 ABOVE.
// slot 23721
    23721, 43350,
// REENTRY_CONTROL.agc:316
//		STORE	L/DCALC
// slot 23722
    23722, 4014,
// REENTRY_CONTROL.agc:317
//
// REENTRY_CONTROL.agc:318
//NOLDCALC	GOTO
// slot 23723
    23723, 65360,
// REENTRY_CONTROL.agc:319
//			60GENRET
// slot 23724
    23724, 3574,
// REENTRY_CONTROL.agc:320
//
// REENTRY_CONTROL.agc:321
//NO.05G		CLEAR	GOTO		# THIS WAY FOR DAP. (MAY INTERRUPT)
// slot 23725
    23725, 43032,
// REENTRY_CONTROL.agc:322
//			.05GSW		# .05GSW = 102D B3
// slot 23726
    23726, 3448,
// REENTRY_CONTROL.agc:323
//			NOLDCALC	# KEEP SINGLE EXIT FOR TARGETNG
// slot 23727
    23727, 43350,
// REENTRY_CONTROL.agc:324
//
// REENTRY_CONTROL.agc:325
//# Page 851
// REENTRY_CONTROL.agc:326
//# SUBROUTINES CALLED BY SCALEPOP (TARGETING):
// REENTRY_CONTROL.agc:327
//
// REENTRY_CONTROL.agc:328
//		BANK	26
// REENTRY_CONTROL.agc:329
//		SETLOC	REENTRY1
// REENTRY_CONTROL.agc:330
//		BANK
// REENTRY_CONTROL.agc:331
//
// REENTRY_CONTROL.agc:332
//		COUNT*	$$/ENTRY
// REENTRY_CONTROL.agc:333
//
// REENTRY_CONTROL.agc:334
//GETETA		DLOAD	DDV		# D = D +D(-RDOT/HS -2D/V)  DT/2
// slot 25148
    25148, 47562,
// REENTRY_CONTROL.agc:335
//					# DT/2 = 2/2 =1
// REENTRY_CONTROL.agc:336
//			RDOT
// slot 25149
    25149, 3968,
// REENTRY_CONTROL.agc:337
//			-HSCALED
// slot 25150
    25150, 13726,
// REENTRY_CONTROL.agc:338
//		PDDL	DMP
// slot 25151
    25151, 34218,
// REENTRY_CONTROL.agc:339
//			D
// slot 25152
    25152, 3904,
// REENTRY_CONTROL.agc:340
//			-KSCALE
// slot 25153
    25153, 13730,
// REENTRY_CONTROL.agc:341
//		DDV	DAD
// slot 25154
    25154, 36210,
// REENTRY_CONTROL.agc:342
//			V
// slot 25155
    25155, 3960,
// REENTRY_CONTROL.agc:343
//					# -RDOT/HS FROM PDL.
// REENTRY_CONTROL.agc:344
//		DMP	DAD
// slot 25156
    25156, 36106,
// REENTRY_CONTROL.agc:345
//			D
// slot 25157
    25157, 3904,
// REENTRY_CONTROL.agc:346
//			D
// slot 25158
    25158, 3904,
// REENTRY_CONTROL.agc:347
//		STORE	D
// slot 25159
    25159, 3904,
// REENTRY_CONTROL.agc:348
//
// REENTRY_CONTROL.agc:349
//		BON	DLOAD		# EGSW INDICATES FINAL PHASE.
// slot 25160
    25160, 58648,
// REENTRY_CONTROL.agc:350
//			EGSW
// slot 25161
    25161, 3470,
// REENTRY_CONTROL.agc:351
//			SUBETA
// slot 25162
    25162, 46238,
// REENTRY_CONTROL.agc:352
//			THETAH
// slot 25163
    25163, 3972,
// REENTRY_CONTROL.agc:353
//		DMP	GOTO
// slot 25164
    25164, 43018,
// REENTRY_CONTROL.agc:354
//			KTETA		# = 1000X2PI/(2)E14 163.84
// slot 25165
    25165, 13626,
// REENTRY_CONTROL.agc:355
//			UPDATERT
// slot 25166
    25166, 43254,
// REENTRY_CONTROL.agc:356
//
// REENTRY_CONTROL.agc:357
//SUBETA		DLOAD	DSU		# SWITCH FROM INERTIAL TO RELATIVE VEL.
// slot 25167
    25167, 38346,
// REENTRY_CONTROL.agc:358
//			V
// slot 25168
    25168, 3960,
// REENTRY_CONTROL.agc:359
//			VMIN
// slot 25169
    25169, 13738,
// REENTRY_CONTROL.agc:360
//		BPL	SET
// slot 25170
    25170, 35912,
// REENTRY_CONTROL.agc:361
//			SUBETA2
// slot 25171
    25171, 46250,
// REENTRY_CONTROL.agc:362
//			RELVELSW
// slot 25172
    25172, 3180,
// REENTRY_CONTROL.agc:363
//
// REENTRY_CONTROL.agc:364
//SUBETA2		DLOAD	DMP
// slot 25173
    25173, 34250,
// REENTRY_CONTROL.agc:365
//
// REENTRY_CONTROL.agc:366
//			THETAH
// slot 25174
    25174, 3972,
// REENTRY_CONTROL.agc:367
//			KT1		# KT1 = KT
// slot 25175
    25175, 13630,
// REENTRY_CONTROL.agc:368
//		DDV	GOTO
// slot 25176
    25176, 43122,
// REENTRY_CONTROL.agc:369
//			V		# KT = RE(2 PI)/2 VS 16384 163.84/ 2 VSAT
// slot 25177
    25177, 3960,
// REENTRY_CONTROL.agc:370
//			UPDATERT
// slot 25178
    25178, 43254,
// REENTRY_CONTROL.agc:371
//
// REENTRY_CONTROL.agc:372
//SETMIND		DLOAD	GOTO
// slot 25179
    25179, 43210,
// REENTRY_CONTROL.agc:373
//			1BITDP
// slot 25180
    25180, 14764,
// REENTRY_CONTROL.agc:374
//			DSTORE
// slot 25181
    25181, 43236,
// REENTRY_CONTROL.agc:375
//
// REENTRY_CONTROL.agc:376
//# Page 852
// REENTRY_CONTROL.agc:377
//TINYTHET	DSU	ABS		# ENTER WITH X-.249
// slot 25182
    25182, 42538,
// REENTRY_CONTROL.agc:378
//			1BITDP +1	# GET 1/4 - MPAC
// slot 25183
    25183, 14766,
// REENTRY_CONTROL.agc:379
//		SL	SQRT		# SCALE UP BEFORE SQRT
// slot 25184
    25184, 63074,
// REENTRY_CONTROL.agc:380
//			13D		# HAS FACTOR FOR UP SCALING
// slot 25185
    25185, 16668,
// REENTRY_CONTROL.agc:381
//		DMP	GOTO
// slot 25186
    25186, 43018,
// REENTRY_CONTROL.agc:382
//			KACOS
// slot 25187
    25187, 13646,
// REENTRY_CONTROL.agc:383
//			THETDONE
// slot 25188
    25188, 43308,
// REENTRY_CONTROL.agc:384
//
// REENTRY_CONTROL.agc:385
//# Page 853
// REENTRY_CONTROL.agc:386
//# * START	INITIAL ROLL ...
// REENTRY_CONTROL.agc:387
//
// REENTRY_CONTROL.agc:388
//		BANK	25
// REENTRY_CONTROL.agc:389
//		SETLOC	REENTRY
// REENTRY_CONTROL.agc:390
//		BANK
// REENTRY_CONTROL.agc:391
//
// REENTRY_CONTROL.agc:392
//		COUNT*	$$/ENTRY
// REENTRY_CONTROL.agc:393
//
// REENTRY_CONTROL.agc:394
//					# MM = 63 , 64 ..
// REENTRY_CONTROL.agc:395
//INITROLL	BON	BOFF		# IF D- .05G NEG, GO TO LIMITL/D
// slot 23728
    23728, 35864,
// REENTRY_CONTROL.agc:396
//			INRLSW
// slot 23729
    23729, 3476,
// REENTRY_CONTROL.agc:397
//			INITRL1
// slot 23730
    23730, 43492,
// REENTRY_CONTROL.agc:398
//			.05GSW
// slot 23731
    23731, 3544,
// REENTRY_CONTROL.agc:399
//			LIMITL/D
// slot 23732
    23732, 44716,
// REENTRY_CONTROL.agc:400
//
// REENTRY_CONTROL.agc:401
//					# MM = 64, NOW
// REENTRY_CONTROL.agc:402
//					#	      3
// REENTRY_CONTROL.agc:403
//					# KA = KA1 LEQ  + KA2
// REENTRY_CONTROL.agc:404
//		DLOAD	DSQ
// slot 23733
    23733, 52938,
// REENTRY_CONTROL.agc:405
//			LEQ
// slot 23734
    23734, 3928,
// REENTRY_CONTROL.agc:406
//		DMP	DDV
// slot 23735
    23735, 47370,
// REENTRY_CONTROL.agc:407
//			LEQ
// slot 23736
    23736, 3928,
// REENTRY_CONTROL.agc:408
//			1/KA1		# = 25 /(64  1.8)
// slot 23737
    23737, 13706,
// REENTRY_CONTROL.agc:409
//		DAD	RTB
// slot 23738
    23738, 39962,
// REENTRY_CONTROL.agc:410
//			KA2		# = .2
// slot 23739
    23739, 13710,
// REENTRY_CONTROL.agc:411
//			P64		# ROLLC		VI		RDOT
// slot 23740
    23740, 45622,
// REENTRY_CONTROL.agc:412
//					# XXX.XX DEG	XXXXX. FPS	XXXXX. FPS
// REENTRY_CONTROL.agc:413
//		STORE	KAT
// slot 23741
    23741, 4000,
// REENTRY_CONTROL.agc:414
//
// REENTRY_CONTROL.agc:415
//		DSU	BMN
// slot 23742
    23742, 41002,
// REENTRY_CONTROL.agc:416
//			KALIM
// slot 23743
    23743, 13722,
// REENTRY_CONTROL.agc:417
//			+4
// slot 23744
    23744, 43400,
// REENTRY_CONTROL.agc:418
//		DLOAD
// slot 23745
    23745, 65482,
// REENTRY_CONTROL.agc:419
//			KALIM
// slot 23746
    23746, 13722,
// REENTRY_CONTROL.agc:420
//		STORE	KAT
// slot 23747
    23747, 4000,
// REENTRY_CONTROL.agc:421
//		DLOAD	DSU		# IF V-VFINAL1 NEG, GO TO FINAL PHASE.
// slot 23748
    23748, 38346
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:422
//			V
// slot 23749
    23749, 3960,
// REENTRY_CONTROL.agc:423
//			VFINAL1
// slot 23750
    23750, 13702,
// REENTRY_CONTROL.agc:424
//		CLEAR	BPL		# (CAN'T CLEAR INRLSW AFTER HERE: RESTARTS)
// slot 23751
    23751, 42008,
// REENTRY_CONTROL.agc:425
//			GONEPAST	# GONEPAST WAS INITIALLY SET=1 TO FORCE
// slot 23752
    23752, 3434,
// REENTRY_CONTROL.agc:426
//					# ROLLC TO REMAIN AS DEFINED BY HEADSUP
// REENTRY_CONTROL.agc:427
//					# UNTIL START OF P64.  (UNTIL D > .05G)
// REENTRY_CONTROL.agc:428
//			D0EQ
// slot 23753
    23753, 43420,
// REENTRY_CONTROL.agc:429
//		SSP	GOTO
// slot 23754
    23754, 43186,
// REENTRY_CONTROL.agc:430
//			GOTOADDR
// slot 23755
    23755, 3916,
// REENTRY_CONTROL.agc:431
//			KEP2		# AND IDLE UNTIL D > 0.2 G.  (NO P66 HERE)
// slot 23756
    23756, 44446,
// REENTRY_CONTROL.agc:432
//			INROLOUT	# GO TO LIMITL/D AFTER SETTING INRLSW.
// slot 23757
    23757, 43474,
// REENTRY_CONTROL.agc:433
//
// REENTRY_CONTROL.agc:434
//D0EQ		DLOAD	DMP		# D0 = KA3 LEQ + KA4
// slot 23758
    23758, 34250,
// REENTRY_CONTROL.agc:435
//# Page 854
// REENTRY_CONTROL.agc:436
//			LEQ
// slot 23759
    23759, 3928,
// REENTRY_CONTROL.agc:437
//			KA3
// slot 23760
    23760, 13714,
// REENTRY_CONTROL.agc:438
//		DAD
// slot 23761
    23761, 65306,
// REENTRY_CONTROL.agc:439
//			KA4
// slot 23762
    23762, 13718,
// REENTRY_CONTROL.agc:440
//		STORE	D0		# D0/805
// slot 23763
    23763, 3984,
// REENTRY_CONTROL.agc:441
//		BDDV	BOV
// slot 23764
    23764, 32874,
// REENTRY_CONTROL.agc:442
//			C001		# (-4/25 G) B-8
// slot 23765
    23765, 13678,
// REENTRY_CONTROL.agc:443
//			+1		# CLEAR OVFIND, IF ON.
// slot 23766
    23766, 43438,
// REENTRY_CONTROL.agc:444
//		STODL	C/D0		# (-4/D0) B-8
// slot 23767
    23767, 16268,
// REENTRY_CONTROL.agc:445
//			LAD		# IF V-VFINAL +K(RDOT/V)CUBED POS,L/D=-LAD
// slot 23768
    23768, 3880,
// REENTRY_CONTROL.agc:446
//		STODL	L/D
// slot 23769
    23769, 16184,
// REENTRY_CONTROL.agc:447
//			RDOT
// slot 23770
    23770, 3968,
// REENTRY_CONTROL.agc:448
//		DDV	PUSH
// slot 23771
    23771, 34418,
// REENTRY_CONTROL.agc:449
//			V
// slot 23772
    23772, 3960,
// REENTRY_CONTROL.agc:450
//		DSQ	DMP
// slot 23773
    23773, 34204,
// REENTRY_CONTROL.agc:451
//		DDV	DSU
// slot 23774
    23774, 38258,
// REENTRY_CONTROL.agc:452
//			1/K44
// slot 23775
    23775, 13694,
// REENTRY_CONTROL.agc:453
//			VFINAL
// slot 23776
    23776, 13698,
// REENTRY_CONTROL.agc:454
//					#		    3
// REENTRY_CONTROL.agc:455
//					# V-VFINAL +(RDOT/V)  / K44	OVFL $
// REENTRY_CONTROL.agc:456
//
// REENTRY_CONTROL.agc:457
//		DAD	BOV
// slot 23777
    23777, 32794,
// REENTRY_CONTROL.agc:458
//			V
// slot 23778
    23778, 3960,
// REENTRY_CONTROL.agc:459
//			INROLOUT	# GO TO LIMITL/D AFTER SETTING INRLSW.
// slot 23779
    23779, 43474,
// REENTRY_CONTROL.agc:460
//		BMN	DLOAD
// slot 23780
    23780, 58688,
// REENTRY_CONTROL.agc:461
//			INROLOUT	# GO TO LIMITL/D AFTER SETTING INRLSW.
// slot 23781
    23781, 43474,
// REENTRY_CONTROL.agc:462
//			LAD
// slot 23782
    23782, 3880,
// REENTRY_CONTROL.agc:463
//		DCOMP
// slot 23783
    23783, 65404,
// REENTRY_CONTROL.agc:464
//		STORE	L/D
// slot 23784
    23784, 3896,
// REENTRY_CONTROL.agc:465
//
// REENTRY_CONTROL.agc:466
//					# SET INRLSW AT END FOR RESTART PROTECTION
// REENTRY_CONTROL.agc:467
//INROLOUT	BOFSET			# END OF PRE .05G PATH OF INITROLL.
// slot 23785
    23785, 65304,
// REENTRY_CONTROL.agc:468
//			INRLSW		# SWITCH IS ZERO INITIALLY.
// slot 23786
    23786, 3156,
// REENTRY_CONTROL.agc:469
//			LIMITL/D	# (GO TO)
// slot 23787
    23787, 44716,
// REENTRY_CONTROL.agc:470
//
// REENTRY_CONTROL.agc:471
//KATEST		DLOAD	DSU		# IF KAT - D POS, GO TO CONSTD
// slot 23788
    23788, 38346,
// REENTRY_CONTROL.agc:472
//			KAT
// slot 23789
    23789, 4000,
// REENTRY_CONTROL.agc:473
//			D		# IF POS, OUT WITH COMMAND VIA LIMITL/D
// slot 23790
    23790, 3904,
// REENTRY_CONTROL.agc:474
//		BPL	GOTO
// slot 23791
    23791, 43080,
// REENTRY_CONTROL.agc:475
//			LIMITL/D
// slot 23792
    23792, 44716,
// REENTRY_CONTROL.agc:476
//			CONSTD
// slot 23793
    23793, 44340,
// REENTRY_CONTROL.agc:477
//
// REENTRY_CONTROL.agc:478
//INITRL1		DLOAD	DAD		# IF RDOT + VRCONT POS, GO TO HUNTEST
// slot 23794
    23794, 36298,
// REENTRY_CONTROL.agc:479
//			RDOT
// slot 23795
    23795, 3968,
// REENTRY_CONTROL.agc:480
//			VRCONT
// slot 23796
    23796, 13666,
// REENTRY_CONTROL.agc:481
//		BMN	CALL		# IF POSITIVE, FALL INTO HUNTEST.
// slot 23797
    23797, 37952,
// REENTRY_CONTROL.agc:482
//			KATEST
// slot 23798
    23798, 43480,
// REENTRY_CONTROL.agc:483
//
// REENTRY_CONTROL.agc:484
//			FOREHUNT	# INITIALIZE HUNTEST.
// slot 23799
    23799, 44068,
// REENTRY_CONTROL.agc:485
//
// REENTRY_CONTROL.agc:486
//# Page 855
// REENTRY_CONTROL.agc:487
//# * START	HUNT TEST ..
// REENTRY_CONTROL.agc:488
//					# MM = 64
// REENTRY_CONTROL.agc:489
//		SSP			# INITIALIZE HUNTEST ON FIRST PASS
// slot 23800
    23800, 65458,
// REENTRY_CONTROL.agc:490
//			GOTOADDR
// slot 23801
    23801, 3916,
// REENTRY_CONTROL.agc:491
//			HUNTEST		# MUST GO AFTER FOREHUNT FOR RESTARTS.
// slot 23802
    23802, 43510,
// REENTRY_CONTROL.agc:492
//
// REENTRY_CONTROL.agc:493
//HUNTEST		DLOAD
// slot 23803
    23803, 65482,
// REENTRY_CONTROL.agc:494
//			D
// slot 23804
    23804, 3904,
// REENTRY_CONTROL.agc:495
//		STODL	A1		# A1/805 = A1/25G
// slot 23805
    23805, 16232,
// REENTRY_CONTROL.agc:496
//
// REENTRY_CONTROL.agc:497
//			LAD
// slot 23806
    23806, 3880,
// REENTRY_CONTROL.agc:498
//		STODL	TEM1B
// slot 23807
    23807, 16206,
// REENTRY_CONTROL.agc:499
//			RDOT
// slot 23808
    23808, 3968,
// REENTRY_CONTROL.agc:500
//		BMN	DLOAD		# IF RDOT NEG,TEM1B=LAD, OTHERWISE = LEWD
// slot 23809
    23809, 58688,
// REENTRY_CONTROL.agc:501
//			A0CALC
// slot 23810
    23810, 43532,
// REENTRY_CONTROL.agc:502
//			LEWD
// slot 23811
    23811, 4010,
// REENTRY_CONTROL.agc:503
//		STODL	TEM1B
// slot 23812
    23812, 16206,
// REENTRY_CONTROL.agc:504
//
// REENTRY_CONTROL.agc:505
//			RDOT
// slot 23813
    23813, 3968,
// REENTRY_CONTROL.agc:506
//A0CALC		DDV	DAD		# V1 = V + RDOT/TEM1B
// slot 23814
    23814, 36210,
// REENTRY_CONTROL.agc:507
//			TEM1B
// slot 23815
    23815, 3918,
// REENTRY_CONTROL.agc:508
//			V
// slot 23816
    23816, 3960,
// REENTRY_CONTROL.agc:509
//		STODL	V1		# V1/2 VS
// slot 23817
    23817, 12716,
// REENTRY_CONTROL.agc:510
//
// REENTRY_CONTROL.agc:511
//			RDOT
// slot 23818
    23818, 3968,
// REENTRY_CONTROL.agc:512
//		DSQ	DDV		# A0=(V1/V)SQ(D+RDOT SQ/(TEM1B 2 C1 HS)
// slot 23819
    23819, 47516,
// REENTRY_CONTROL.agc:513
//			TEM1B
// slot 23820
    23820, 3918,
// REENTRY_CONTROL.agc:514
//		DDV	DAD
// slot 23821
    23821, 36210,
// REENTRY_CONTROL.agc:515
//			2C1HS
// slot 23822
    23822, 13686,
// REENTRY_CONTROL.agc:516
//			D
// slot 23823
    23823, 3904,
// REENTRY_CONTROL.agc:517
//		DMP	DMP
// slot 23824
    23824, 34058,
// REENTRY_CONTROL.agc:518
//			V1
// slot 23825
    23825, 428,
// REENTRY_CONTROL.agc:519
//			V1
// slot 23826
    23826, 428,
// REENTRY_CONTROL.agc:520
//		DDV
// slot 23827
    23827, 65394,
// REENTRY_CONTROL.agc:521
//			VSQUARE
// slot 23828
    23828, 3876,
// REENTRY_CONTROL.agc:522
//		STODL	A0		# A0/805 = A0/25G
// slot 23829
    23829, 12720,
// REENTRY_CONTROL.agc:523
//
// REENTRY_CONTROL.agc:524
//			RDOT
// slot 23830
    23830, 3968,
// REENTRY_CONTROL.agc:525
//		BPL	DLOAD
// slot 23831
    23831, 58696,
// REENTRY_CONTROL.agc:526
//			V1LEAD
// slot 23832
    23832, 43574,
// REENTRY_CONTROL.agc:527
//			A0
// slot 23833
    23833, 432,
// REENTRY_CONTROL.agc:528
//		STORE	A1		# A1/25G
// slot 23834
    23834, 3944,
// REENTRY_CONTROL.agc:529
//
// REENTRY_CONTROL.agc:530
//V1LEAD		DLOAD	BPL		# IF L/D NEG, V1=V1 - 1000
// slot 23835
    23835, 42186,
// REENTRY_CONTROL.agc:531
//			L/D
// slot 23836
    23836, 3896,
// REENTRY_CONTROL.agc:532
//			HUNTEST1
// slot 23837
    23837, 43588,
// REENTRY_CONTROL.agc:533
//
// REENTRY_CONTROL.agc:534
//		DLOAD	DSU
// slot 23838
    23838, 38346,
// REENTRY_CONTROL.agc:535
//			V1
// slot 23839
    23839, 428,
// REENTRY_CONTROL.agc:536
//# Page 856
// REENTRY_CONTROL.agc:537
//			VQUIT
// slot 23840
    23840, 13594,
// REENTRY_CONTROL.agc:538
//		STORE	V1
// slot 23841
    23841, 428,
// REENTRY_CONTROL.agc:539
//
// REENTRY_CONTROL.agc:540
//HUNTEST1	DLOAD	DMP		# ALP = 2 C1 HS A0/LEWD V1 V1
// slot 23842
    23842, 34250,
// REENTRY_CONTROL.agc:541
//			A0
// slot 23843
    23843, 432,
// REENTRY_CONTROL.agc:542
//			2C1HS
// slot 23844
    23844, 13686,
// REENTRY_CONTROL.agc:543
//		DDV	SETPD
// slot 23845
    23845, 33138,
// REENTRY_CONTROL.agc:544
//			V1
// slot 23846
    23846, 428,
// REENTRY_CONTROL.agc:545
//			0
// slot 23847
    23847, 2,
// REENTRY_CONTROL.agc:546
//		DDV	DDV
// slot 23848
    23848, 47474,
// REENTRY_CONTROL.agc:547
//			V1
// slot 23849
    23849, 428,
// REENTRY_CONTROL.agc:548
//			LEWD
// slot 23850
    23850, 4010,
// REENTRY_CONTROL.agc:549
//		STORE	ALP
// slot 23851
    23851, 3976
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:550
//
// REENTRY_CONTROL.agc:551
//		BDSU	BDDV		# FACT1 = V1 / (1 - ALP)
// slot 23852
    23852, 46370,
// REENTRY_CONTROL.agc:552
//			BARELY1
// slot 23853
    23853, 15860,
// REENTRY_CONTROL.agc:553
//			V1
// slot 23854
    23854, 428,
// REENTRY_CONTROL.agc:554
//		STODL	FACT1		# FACT1 / 2VS
// slot 23855
    23855, 16156,
// REENTRY_CONTROL.agc:555
//
// REENTRY_CONTROL.agc:556
//			ALP
// slot 23856
    23856, 3976,
// REENTRY_CONTROL.agc:557
//		DSU	DMP		# FACT2 = ALP(ALP - 1) / A0
// slot 23857
    23857, 34090,
// REENTRY_CONTROL.agc:558
//			BARELY1
// slot 23858
    23858, 15860,
// REENTRY_CONTROL.agc:559
//			ALP
// slot 23859
    23859, 3976,
// REENTRY_CONTROL.agc:560
//		DDV
// slot 23860
    23860, 65394,
// REENTRY_CONTROL.agc:561
//			A0
// slot 23861
    23861, 432,
// REENTRY_CONTROL.agc:562
//		STORE	FACT2		# FACT2 (25G)
// slot 23862
    23862, 3872,
// REENTRY_CONTROL.agc:563
//
// REENTRY_CONTROL.agc:564
//		DMP	DAD
// slot 23863
    23863, 36106,
// REENTRY_CONTROL.agc:565
//			Q7		# Q7 / 805 = Q7 / 25G
// slot 23864
    23864, 3322,
// REENTRY_CONTROL.agc:566
//			ALP		# VL=FACT1 (1-SQRT(Q7 FACT2 +ALP) )
// slot 23865
    23865, 3976,
// REENTRY_CONTROL.agc:567
//		SQRT	BDSU
// slot 23866
    23866, 37356,
// REENTRY_CONTROL.agc:568
//			BARELY1
// slot 23867
    23867, 15860,
// REENTRY_CONTROL.agc:569
//		DMP
// slot 23868
    23868, 65290,
// REENTRY_CONTROL.agc:570
//			FACT1
// slot 23869
    23869, 3868,
// REENTRY_CONTROL.agc:571
//		STORE	VL		# VL / 2 VS
// slot 23870
    23870, 4078,
// REENTRY_CONTROL.agc:572
//
// REENTRY_CONTROL.agc:573
//		BDSU	DMP		# GAMMAL1 = LEWD (V1-VL)/VL
// slot 23871
    23871, 34082,
// REENTRY_CONTROL.agc:574
//			V1
// slot 23872
    23872, 428,
// REENTRY_CONTROL.agc:575
//			LEWD
// slot 23873
    23873, 4010,
// REENTRY_CONTROL.agc:576
//		DDV
// slot 23874
    23874, 65394,
// REENTRY_CONTROL.agc:577
//			VL
// slot 23875
    23875, 4078,
// REENTRY_CONTROL.agc:578
//		STODL	GAMMAL1		# GAMMAL1 USED IN UPCONTROL
// slot 23876
    23876, 12334,
// REENTRY_CONTROL.agc:579
//
// REENTRY_CONTROL.agc:580
//					# GAMMAL1 = PDL 22D.
// REENTRY_CONTROL.agc:581
//			VL
// slot 23877
    23877, 4078,
// REENTRY_CONTROL.agc:582
//		DSU	BMN		# IF VL-VLMIN NEG, GO TO PREFINAL
// slot 23878
    23878, 41002,
// REENTRY_CONTROL.agc:583
//			VLMIN
// slot 23879
    23879, 13578,
// REENTRY_CONTROL.agc:584
//			PREFINAL
// slot 23880
    23880, 44470,
// REENTRY_CONTROL.agc:585
//
// REENTRY_CONTROL.agc:586
//		DLOAD	DSQ
// slot 23881
    23881, 52938,
// REENTRY_CONTROL.agc:587
//# Page 857
// REENTRY_CONTROL.agc:588
//			VL
// slot 23882
    23882, 4078,
// REENTRY_CONTROL.agc:589
//		STODL	VBARS		# VBARS / 4 VS VS
// slot 23883
    23883, 16236,
// REENTRY_CONTROL.agc:590
//
// REENTRY_CONTROL.agc:591
//			HALVE		# IF VSAT-VL NEG, GO TO CONSTD
// slot 23884
    23884, 13750,
// REENTRY_CONTROL.agc:592
//		DSU	BMN
// slot 23885
    23885, 41002,
// REENTRY_CONTROL.agc:593
//			VL
// slot 23886
    23886, 4078,
// REENTRY_CONTROL.agc:594
//			BECONSTD	# SET MODE=HUNTEST, CONTINUE IN CONSTD
// slot 23887
    23887, 44332,
// REENTRY_CONTROL.agc:595
//		STODL	DVL		# DVL / 2VS
// slot 23888
    23888, 16228,
// REENTRY_CONTROL.agc:596
//
// REENTRY_CONTROL.agc:597
//			HALVE
// slot 23889
    23889, 13750,
// REENTRY_CONTROL.agc:598
//		STORE	VS1		# VS1 = VSAT
// slot 23890
    23890, 3956,
// REENTRY_CONTROL.agc:599
//
// REENTRY_CONTROL.agc:600
//		DSU	BMN		# IF V1 GREATER THAN VSAT, GO ON
// slot 23891
    23891, 41002,
// REENTRY_CONTROL.agc:601
//			V1
// slot 23892
    23892, 428,
// REENTRY_CONTROL.agc:602
//			GETDHOOK
// slot 23893
    23893, 43702,
// REENTRY_CONTROL.agc:603
//		BDSU
// slot 23894
    23894, 65314,
// REENTRY_CONTROL.agc:604
//			DVL
// slot 23895
    23895, 3940,
// REENTRY_CONTROL.agc:605
//		STODL	DVL		# DVL = DVL - (VSAT-V1) = V1 - VL
// slot 23896
    23896, 16228,
// REENTRY_CONTROL.agc:606
//			V1
// slot 23897
    23897, 428,
// REENTRY_CONTROL.agc:607
//		STORE	VS1		# VS1 = V1, IN THIS CASE
// slot 23898
    23898, 3956,
// REENTRY_CONTROL.agc:608
//
// REENTRY_CONTROL.agc:609
//GETDHOOK	DLOAD	CALL		# DHOOK=((1-VS1/FACT1) SQ -ALP)/FACT2
// slot 23899
    23899, 38090,
// REENTRY_CONTROL.agc:610
//			VS1		# VS1 / 2 VS
// slot 23900
    23900, 3956,
// REENTRY_CONTROL.agc:611
//			DHOOKYQ7	# GO CALC DHOOK
// slot 23901
    23901, 44040,
// REENTRY_CONTROL.agc:612
//		STORE	DHOOK		# DHOOK / 25G
// slot 23902
    23902, 3932,
// REENTRY_CONTROL.agc:613
//
// REENTRY_CONTROL.agc:614
//		SR	DDV
// slot 23903
    23903, 47458,
// REENTRY_CONTROL.agc:615
//			6		# CHOOK
// slot 23904
    23904, 17166,
// REENTRY_CONTROL.agc:616
//			Q7
// slot 23905
    23905, 3322,
// REENTRY_CONTROL.agc:617
//		DSU
// slot 23906
    23906, 65322,
// REENTRY_CONTROL.agc:618
//			CHOOK		# = .25/16 = (-6)
// slot 23907
    23907, 13650,
// REENTRY_CONTROL.agc:619
//		STORE	AHOOKDV
// slot 23908
    23908, 3936,
// REENTRY_CONTROL.agc:620
//
// REENTRY_CONTROL.agc:621
//		DAD	DMP		# GAMMAL= GAMMAL1-CH1 DVL SQ(1+AHOOK DVL)
// slot 23909
    23909, 34074,
// REENTRY_CONTROL.agc:622
//			1/16TH
// slot 23910
    23910, 15852,
// REENTRY_CONTROL.agc:623
//			CH1
// slot 23911
    23911, 13658,
// REENTRY_CONTROL.agc:624
//		DMP	DMP
// slot 23912
    23912, 34058,
// REENTRY_CONTROL.agc:625
//			DVL
// slot 23913
    23913, 3940,
// REENTRY_CONTROL.agc:626
//			DVL
// slot 23914
    23914, 3940,
// REENTRY_CONTROL.agc:627
//		DDV	DDV
// slot 23915
    23915, 47474,
// REENTRY_CONTROL.agc:628
//			DHOOK
// slot 23916
    23916, 3932,
// REENTRY_CONTROL.agc:629
//			VBARS
// slot 23917
    23917, 3948,
// REENTRY_CONTROL.agc:630
//		BDSU	BMN
// slot 23918
    23918, 40994,
// REENTRY_CONTROL.agc:631
//			GAMMAL1
// slot 23919
    23919, 46,
// REENTRY_CONTROL.agc:632
//			NEGAMA
// slot 23920
    23920, 43986,
// REENTRY_CONTROL.agc:633
//HUNTEST3	STORE	GAMMAL
// slot 23921
    23921, 4082,
// REENTRY_CONTROL.agc:634
//
// REENTRY_CONTROL.agc:635
//		DSU			# GAMMAL1=GAMMAL1 +Q19 (GAMMAL-GAMMAL1)
// slot 23922
    23922, 65322,
// REENTRY_CONTROL.agc:636
//			GAMMAL1
// slot 23923
    23923, 46,
// REENTRY_CONTROL.agc:637
//		DMP	DAD
// slot 23924
    23924, 36106,
// REENTRY_CONTROL.agc:638
//# Page 858
// REENTRY_CONTROL.agc:639
//			Q19
// slot 23925
    23925, 13750,
// REENTRY_CONTROL.agc:640
//			GAMMAL1
// slot 23926
    23926, 46,
// REENTRY_CONTROL.agc:641
//		STODL	GAMMAL1
// slot 23927
    23927, 12334,
// REENTRY_CONTROL.agc:642
//			GAMMAL
// slot 23928
    23928, 4082,
// REENTRY_CONTROL.agc:643
//
// REENTRY_CONTROL.agc:644
//# Page 859
// REENTRY_CONTROL.agc:645
//# *START	RANGE PREDICTION ...
// REENTRY_CONTROL.agc:646
//					# C(MPAC) = GAMMAL
// REENTRY_CONTROL.agc:647
//RANGER		DSQ	SR2		# COSG = 1-GAMMAL SQ/2, TRUNCATED SERIES
// slot 23929
    23929, 49820,
// REENTRY_CONTROL.agc:648
//		BDSU
// slot 23930
    23930, 65314,
// REENTRY_CONTROL.agc:649
//			HALVE
// slot 23931
    23931, 13750,
// REENTRY_CONTROL.agc:650
//		STODL	COSG/2
// slot 23932
    23932, 16240,
// REENTRY_CONTROL.agc:651
//			VBARS		# E=SQRT(1+VBARS........
// slot 23933
    23933, 3948,
// REENTRY_CONTROL.agc:652
//
// REENTRY_CONTROL.agc:653
//		DSU	DMP
// slot 23934
    23934, 34090,
// REENTRY_CONTROL.agc:654
//			HALVE
// slot 23935
    23935, 13750,
// REENTRY_CONTROL.agc:655
//			VBARS
// slot 23936
    23936, 3948,
// REENTRY_CONTROL.agc:656
//		DMP	DMP
// slot 23937
    23937, 34058,
// REENTRY_CONTROL.agc:657
//			COSG/2
// slot 23938
    23938, 3952,
// REENTRY_CONTROL.agc:658
//			COSG/2
// slot 23939
    23939, 3952,
// REENTRY_CONTROL.agc:659
//		SL2	DAD
// slot 23940
    23940, 36244,
// REENTRY_CONTROL.agc:660
//			C1/16		# C1/16 = 1/16
// slot 23941
    23941, 15852,
// REENTRY_CONTROL.agc:661
//		SQRT	PDDL		# E/4 INTO PDL
// slot 23942
    23942, 54764,
// REENTRY_CONTROL.agc:662
//
// REENTRY_CONTROL.agc:663
//			VBARS
// slot 23943
    23943, 3948,
// REENTRY_CONTROL.agc:664
//		DMP	DMP		# ASKEP/2 = ARCSIN(VBARS COSG SING/E)
// slot 23944
    23944, 34058,
// REENTRY_CONTROL.agc:665
//			COSG/2
// slot 23945
    23945, 3952,
// REENTRY_CONTROL.agc:666
//			GAMMAL
// slot 23946
    23946, 4082,
// REENTRY_CONTROL.agc:667
//		DDV	ASIN
// slot 23947
    23947, 56946,
// REENTRY_CONTROL.agc:668
//		SL1	PUSH		# ASKEP TO PDL 0.
// slot 23948
    23948, 34516,
// REENTRY_CONTROL.agc:669
//		STODL	ASKEP		# BALLISTIC RANGE	ASKEP/2PI
// slot 23949
    23949, 16306,
// REENTRY_CONTROL.agc:670
//
// REENTRY_CONTROL.agc:671
//					# FOR TM, STORE RANGE COMPONENTS OVERLAPPING (SP)
// REENTRY_CONTROL.agc:672
//			VL
// slot 23950
    23950, 4078,
// REENTRY_CONTROL.agc:673
//		DMP	DAD		# ASP1 = Q2 + Q3 VL
// slot 23951
    23951, 36106,
// REENTRY_CONTROL.agc:674
//			Q3
// slot 23952
    23952, 13554,
// REENTRY_CONTROL.agc:675
//			Q2
// slot 23953
    23953, 3988,
// REENTRY_CONTROL.agc:676
//		STORE	ASP1		# FINAL PHASE RANGE	ASP1/2 PI
// slot 23954
    23954, 4020,
// REENTRY_CONTROL.agc:677
//
// REENTRY_CONTROL.agc:678
//		PDDL	DSQ		# ASP1 TO PDL 2.
// slot 23955
    23955, 52906
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:679
//			V1
// slot 23956
    23956, 428,
// REENTRY_CONTROL.agc:680
//					#		    2
// REENTRY_CONTROL.agc:681
//					# ASPUP= -C12 LOG(V1 Q7/VBARS A0)/GAMMAL1
// REENTRY_CONTROL.agc:682
//		DMP	DDV
// slot 23957
    23957, 47370,
// REENTRY_CONTROL.agc:683
//			Q7
// slot 23958
    23958, 3322,
// REENTRY_CONTROL.agc:684
//			VBARS
// slot 23959
    23959, 3948,
// REENTRY_CONTROL.agc:685
//		DDV	CALL
// slot 23960
    23960, 38002,
// REENTRY_CONTROL.agc:686
//			A0
// slot 23961
    23961, 432,
// REENTRY_CONTROL.agc:687
//			LOG		# RETURN WITH -LOG IN MPAC
// slot 23962
    23962, 39130,
// REENTRY_CONTROL.agc:688
//
// REENTRY_CONTROL.agc:689
//		DMP	DDV
// slot 23963
    23963, 47370,
// REENTRY_CONTROL.agc:690
//			C12
// slot 23964
    23964, 13582,
// REENTRY_CONTROL.agc:691
//			GAMMAL1
// slot 23965
    23965, 46,
// REENTRY_CONTROL.agc:692
//		STORE	ASPUP		# UP PHASE RANGE	ASPUP / 2 PI
// slot 23966
    23966, 4022,
// REENTRY_CONTROL.agc:693
//# Page 860
// REENTRY_CONTROL.agc:694
//		PDDL	DMP		# ASPUP TO PDL 4.
// slot 23967
    23967, 34218,
// REENTRY_CONTROL.agc:695
//			KC3		# KC3 = -4 VS VS / 2 PI 805 RE
// slot 23968
    23968, 13662,
// REENTRY_CONTROL.agc:696
//					# ASPDWN = KC3 RDOT V / A0
// REENTRY_CONTROL.agc:697
//			RDOT
// slot 23969
    23969, 3968,
// REENTRY_CONTROL.agc:698
//		DMP	DDV
// slot 23970
    23970, 47370,
// REENTRY_CONTROL.agc:699
//			V
// slot 23971
    23971, 3960,
// REENTRY_CONTROL.agc:700
//			A0
// slot 23972
    23972, 432,
// REENTRY_CONTROL.agc:701
//		DDV	PUSH		# ASPDWN TO PDL 6.
// slot 23973
    23973, 34418,
// REENTRY_CONTROL.agc:702
//			LAD
// slot 23974
    23974, 3880,
// REENTRY_CONTROL.agc:703
//		STODL	ASPDWN		# RANGE TO PULL OUT	ASPDWN /2 PI
// slot 23975
    23975, 16312,
// REENTRY_CONTROL.agc:704
//
// REENTRY_CONTROL.agc:705
//			Q6
// slot 23976
    23976, 13562,
// REENTRY_CONTROL.agc:706
//		DSU	DMP		# ASP3 = Q5(Q6-GAMMAL)
// slot 23977
    23977, 34090,
// REENTRY_CONTROL.agc:707
//			GAMMAL
// slot 23978
    23978, 4082,
// REENTRY_CONTROL.agc:708
//			Q5
// slot 23979
    23979, 13558,
// REENTRY_CONTROL.agc:709
//		STOVL	ASP3		# GAMMA CORRECTION	ASP3/2PI
// slot 23980
    23980, 24506,
// REENTRY_CONTROL.agc:710
//
// REENTRY_CONTROL.agc:711
//			ASKEP		# GET HI-WD AND
// slot 23981
    23981, 4018,
// REENTRY_CONTROL.agc:712
//		STODL	ASPS(TM)	# SAVE HI-WORD OF ASP'S FOR TM.
// slot 23982
    23982, 15532,
// REENTRY_CONTROL.agc:713
//
// REENTRY_CONTROL.agc:714
//			ASP3
// slot 23983
    23983, 4026,
// REENTRY_CONTROL.agc:715
//		DAD	DAD
// slot 23984
    23984, 36122,
// REENTRY_CONTROL.agc:716
//					# ASPDWN FROM PDL 6.
// REENTRY_CONTROL.agc:717
//					# ASPUP FROM PDL 4.
// REENTRY_CONTROL.agc:718
//		DAD	DAD
// slot 23985
    23985, 36122,
// REENTRY_CONTROL.agc:719
//					# ASP1 FROM PDL 2.
// REENTRY_CONTROL.agc:720
//					# ASKEP FROM PDL 0.
// REENTRY_CONTROL.agc:721
//		DSU	BOVB		# CLEAR OVFIND.
// slot 23986
    23986, 33834,
// REENTRY_CONTROL.agc:722
//			THETAH
// slot 23987
    23987, 3972,
// REENTRY_CONTROL.agc:723
//			TCDANZIG
// slot 23988
    23988, 48596,
// REENTRY_CONTROL.agc:724
//		STORE	DIFF		# DIFF = (ASP-THETAH) / 2 PI
// slot 23989
    23989, 3856,
// REENTRY_CONTROL.agc:725
//					# ASP=ASKEP+ASP1+ASPUP+ASP3+ASPDWN = TOTAL RANGE
// REENTRY_CONTROL.agc:726
//
// REENTRY_CONTROL.agc:727
//		ABS	DSU		# IF ABS(THETAH-ASP) -25NM NEG, GO TO UPSY
// slot 23990
    23990, 38220,
// REENTRY_CONTROL.agc:728
//			25NM
// slot 23991
    23991, 13606,
// REENTRY_CONTROL.agc:729
//		BMN	BON
// slot 23992
    23992, 35904,
// REENTRY_CONTROL.agc:730
//			GOTOUPSY
// slot 23993
    23993, 44086,
// REENTRY_CONTROL.agc:731
//			HIND
// slot 23994
    23994, 3474,
// REENTRY_CONTROL.agc:732
//			GETLEWD
// slot 23995
    23995, 43902,
// REENTRY_CONTROL.agc:733
//
// REENTRY_CONTROL.agc:734
//		DLOAD	BPL
// slot 23996
    23996, 42186,
// REENTRY_CONTROL.agc:735
//			DIFF
// slot 23997
    23997, 3856,
// REENTRY_CONTROL.agc:736
//			DCONSTD		# EVENTUALLY SETS MODE = HUNTEST.
// slot 23998
    23998, 44322,
// REENTRY_CONTROL.agc:737
//GETDLEWD	DLOAD	DMP
// slot 23999
    23999, 34250,
// REENTRY_CONTROL.agc:738
//					# DLEWD = DLEWD (DIFF/(DIFFOLD-DIFF))
// REENTRY_CONTROL.agc:739
//			DLEWD
// slot 24000
    24000, 3908,
// REENTRY_CONTROL.agc:740
//			DIFF
// slot 24001
    24001, 3856,
// REENTRY_CONTROL.agc:741
//		PDDL	DSU
// slot 24002
    24002, 38314,
// REENTRY_CONTROL.agc:742
//			DIFFOLD
// slot 24003
    24003, 3860,
// REENTRY_CONTROL.agc:743
//			DIFF
// slot 24004
    24004, 3856,
// REENTRY_CONTROL.agc:744
//# Page 861
// REENTRY_CONTROL.agc:745
//		BDDV
// slot 24005
    24005, 65386,
// REENTRY_CONTROL.agc:746
//LWDSTORE	STADR
// slot 24006
    24006, 65324,
// REENTRY_CONTROL.agc:747
//		STORE	DLEWD
// slot 24007
    24007, 61626,
// REENTRY_CONTROL.agc:748
//		DAD	BMN		# IF LEWD+DLEWD NEG, DLEWD=-LEWD/2
// slot 24008
    24008, 40986,
// REENTRY_CONTROL.agc:749
//			LEWD
// slot 24009
    24009, 4010,
// REENTRY_CONTROL.agc:750
//			LEWDPTR
// slot 24010
    24010, 43978,
// REENTRY_CONTROL.agc:751
//		BOV
// slot 24011
    24011, 65280,
// REENTRY_CONTROL.agc:752
//			LEWDOVFL
// slot 24012
    24012, 43970,
// REENTRY_CONTROL.agc:753
//		STORE	LEWD
// slot 24013
    24013, 4010,
// REENTRY_CONTROL.agc:754
//
// REENTRY_CONTROL.agc:755
//SIDETRAK	EXIT
// slot 24014
    24014, 65532
)).

// bank 25, slots 24015-24019
function agcAotUnit1406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24016 {
        if slot <= 24015 {
// REENTRY_CONTROL.agc:756
//
// REENTRY_CONTROL.agc:757
//		CA	EBENTRY
// slot 24015
            if slot <> 24015 or instruction <> 14896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:758
//		TS	EBANK
// slot 24016
            if slot <> 24016 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24017 {
// REENTRY_CONTROL.agc:759
//
// REENTRY_CONTROL.agc:760
//		CA	PRIO16		# DROP GRP 5 RESTART PRIO TO 1 LESS THAN
// slot 24017
            if slot <> 24017 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24018 {
// REENTRY_CONTROL.agc:761
//		TS	PHSPRDT5	# GRP 4.
// slot 24018
                if slot <> 24018 or instruction <> 23092 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23092, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:762
//
// REENTRY_CONTROL.agc:763
//		TC	PHASCHNG
// slot 24019
                if slot <> 24019 or instruction <> 2826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1406] to agcAotUnit1406@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:764
//		OCT	00474		# RESTART GRP 4 AT PRE-HUNT.
// slot 24020
    24020, 632
)).

// bank 25, slots 24021-24025
function agcAotUnit1407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24022 {
        if slot <= 24021 {
// REENTRY_CONTROL.agc:765
//					# FORCE RESTART TO PICK UP IN GRP 4:
// REENTRY_CONTROL.agc:766
//					# USE PRIO 17 FOR GRP 4 (< SERVICER PRIO)
// REENTRY_CONTROL.agc:767
//		CA	PRIO16		# CONTINUE GRP 5 AT LOWER PRIO THAN EITHER
// slot 24021
            if slot <> 24021 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:768
//					# GRP 4 OR SERVICER.
// REENTRY_CONTROL.agc:769
//		TC	PRIOCHNG
// slot 24022
            if slot <> 24022 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24023 {
// REENTRY_CONTROL.agc:770
//
// REENTRY_CONTROL.agc:771
//		CAF	ADENDEXT	# SIDETRACK NEXT PASS UNTIL THIS ONE DONE.
// slot 24023
            if slot <> 24023 or instruction <> 13850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24024 {
// REENTRY_CONTROL.agc:772
//		TS	GOTOADDR	# ONLY AFTER RESTART IS LEFT AFTER DETOUR.
// slot 24024
                if slot <> 24024 or instruction <> 23461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:773
//
// REENTRY_CONTROL.agc:774
//		TC	INTPRET
// slot 24025
                if slot <> 24025 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1407] to agcAotUnit1407@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:775
//
// REENTRY_CONTROL.agc:776
//		DLOAD	SET
// slot 24026
    24026, 36042,
// REENTRY_CONTROL.agc:777
//			DIFF
// slot 24027
    24027, 3856,
// REENTRY_CONTROL.agc:778
//			HIND
// slot 24028
    24028, 3186,
// REENTRY_CONTROL.agc:779
//		STODL	DIFFOLD		# DIFFOLD / 2 PI
// slot 24029
    24029, 16148,
// REENTRY_CONTROL.agc:780
//
// REENTRY_CONTROL.agc:781
//			Q7F
// slot 24030
    24030, 13566,
// REENTRY_CONTROL.agc:782
//		STCALL	Q7		# Q7 / 805 FPSS
// slot 24031
    24031, 31994,
// REENTRY_CONTROL.agc:783
//			HUNTEST		# (GO TO)
// slot 24032
    24032, 43510,
// REENTRY_CONTROL.agc:784
//
// REENTRY_CONTROL.agc:785
//LEWDOVFL	DLOAD
// slot 24033
    24033, 65482,
// REENTRY_CONTROL.agc:786
//			NEARONE
// slot 24034
    24034, 15860,
// REENTRY_CONTROL.agc:787
//		STCALL	LEWD
// slot 24035
    24035, 32682,
// REENTRY_CONTROL.agc:788
//			DCONSTD		# (GO TO)  ALSO WILL SET MODE = HUNTEST
// slot 24036
    24036, 44322,
// REENTRY_CONTROL.agc:789
//
// REENTRY_CONTROL.agc:790
//LEWDPTR		DLOAD	SR1
// slot 24037
    24037, 58058,
// REENTRY_CONTROL.agc:791
//			LEWD
// slot 24038
    24038, 4010,
// REENTRY_CONTROL.agc:792
//		DCOMP	GOTO
// slot 24039
    24039, 43132,
// REENTRY_CONTROL.agc:793
//			LWDSTORE
// slot 24040
    24040, 43916,
// REENTRY_CONTROL.agc:794
//
// REENTRY_CONTROL.agc:795
//# Page 862
// REENTRY_CONTROL.agc:796
//# NEGAMA IS PART OF HUNTEST ...
// REENTRY_CONTROL.agc:797
//NEGAMA		DMP	DMP		# ENTER WITH GAMMAL IN MPAC
// slot 24041
    24041, 34058,
// REENTRY_CONTROL.agc:798
//			VL
// slot 24042
    24042, 4078,
// REENTRY_CONTROL.agc:799
//			1/3RD
// slot 24043
    24043, 13518,
// REENTRY_CONTROL.agc:800
//		PDDL	DMP		# PUSH GAMMAL VL/3
// slot 24044
    24044, 34218,
// REENTRY_CONTROL.agc:801
//			LEWD
// slot 24045
    24045, 4010,
// REENTRY_CONTROL.agc:802
//			1/3RD
// slot 24046
    24046, 13518,
// REENTRY_CONTROL.agc:803
//		PDDL	DAD		# PUSH LEWD/3
// slot 24047
    24047, 36266,
// REENTRY_CONTROL.agc:804
//			AHOOKDV
// slot 24048
    24048, 3936,
// REENTRY_CONTROL.agc:805
//			1/24TH
// slot 24049
    24049, 13654,
// REENTRY_CONTROL.agc:806
//		DMP	DMP		# DEL VL = (GAMMAL VL/3)/(LEWD/3-DVL
// slot 24050
    24050, 34058,
// REENTRY_CONTROL.agc:807
//			DVL		# (2/3 + AHOOKDV)(CH1 GS/DHOOK VL))
// slot 24051
    24051, 3940,
// REENTRY_CONTROL.agc:808
//			CH1
// slot 24052
    24052, 13658,
// REENTRY_CONTROL.agc:809
//		DDV	DDV
// slot 24053
    24053, 47474,
// REENTRY_CONTROL.agc:810
//			DHOOK
// slot 24054
    24054, 3932,
// REENTRY_CONTROL.agc:811
//			VL
// slot 24055
    24055, 4078,
// REENTRY_CONTROL.agc:812
//		BDSU	BDDV
// slot 24056
    24056, 46370,
// REENTRY_CONTROL.agc:813
//					# LEWD/3
// REENTRY_CONTROL.agc:814
//					# GAMMAL VL /3
// REENTRY_CONTROL.agc:815
//		DAD
// slot 24057
    24057, 65306,
// REENTRY_CONTROL.agc:816
//			VL
// slot 24058
    24058, 4078,
// REENTRY_CONTROL.agc:817
//		STCALL	VL		# VL/2 VS
// slot 24059
    24059, 32750,
// REENTRY_CONTROL.agc:818
//
// REENTRY_CONTROL.agc:819
//			DHOOKYQ7	# GO CALC Q7
// slot 24060
    24060, 44040,
// REENTRY_CONTROL.agc:820
//					# Q7=((1-VL/FACT1)SQ - ALP)/FACT2
// REENTRY_CONTROL.agc:821
//		STODL	Q7		# Q7 / 25G
// slot 24061
    24061, 15610,
// REENTRY_CONTROL.agc:822
//
// REENTRY_CONTROL.agc:823
//			VL
// slot 24062
    24062, 4078,
// REENTRY_CONTROL.agc:824
//		DSQ
// slot 24063
    24063, 65436,
// REENTRY_CONTROL.agc:825
//		STODL	VBARS		# VBARS / 4 VS VS
// slot 24064
    24064, 16236,
// REENTRY_CONTROL.agc:826
//
// REENTRY_CONTROL.agc:827
//			3ZEROS
// slot 24065
    24065, 13754,
// REENTRY_CONTROL.agc:828
//		GOTO			# SET GAMMAL = 0
// slot 24066
    24066, 65360,
// REENTRY_CONTROL.agc:829
//			HUNTEST3
// slot 24067
    24067, 43746,
// REENTRY_CONTROL.agc:830
//
// REENTRY_CONTROL.agc:831
//DHOOKYQ7	SR1	DDV		# SUBROUTINE TO CALC DHOOK OR Q7)
// slot 24068
    24068, 47556,
// REENTRY_CONTROL.agc:832
//			FACT1
// slot 24069
    24069, 3868,
// REENTRY_CONTROL.agc:833
//		BDSU	SL1
// slot 24070
    24070, 59938,
// REENTRY_CONTROL.agc:834
//			HALVE
// slot 24071
    24071, 13750,
// REENTRY_CONTROL.agc:835
//		DSQ	DSU
// slot 24072
    24072, 38300,
// REENTRY_CONTROL.agc:836
//			ALP
// slot 24073
    24073, 3976,
// REENTRY_CONTROL.agc:837
//		DDV	RVQ
// slot 24074
    24074, 36466,
// REENTRY_CONTROL.agc:838
//			FACT2
// slot 24075
    24075, 3872
)).

// bank 25, slots 24076-24076
function agcAotUnit1408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:839
//
// REENTRY_CONTROL.agc:840
//# Page 863
// REENTRY_CONTROL.agc:841
//					# COME TO PRE-HUNT WHEN RESTART OCCURS AFTER
// REENTRY_CONTROL.agc:842
//					# HUNTEST IS SIDE-TRACKED AT SIDETRAK.
// REENTRY_CONTROL.agc:843
//					# PICK UP IN GROUP 4.
// REENTRY_CONTROL.agc:844
//
// REENTRY_CONTROL.agc:845
//PRE-HUNT	TC	INTPRET
// slot 24076
    if slot <> 24076 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1408] to agcAotUnit1408@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:846
//		CLEAR	CALL
// slot 24077
    24077, 37912,
// REENTRY_CONTROL.agc:847
//			HIND		# HIND	99D BIT 6 FLAG 6
// slot 24078
    24078, 3442,
// REENTRY_CONTROL.agc:848
//			FOREHUNT	# RE-INITIALIZE HUNTEST AFTER RE-START.
// slot 24079
    24079, 44068,
// REENTRY_CONTROL.agc:849
//		GOTO
// slot 24080
    24080, 65360,
// REENTRY_CONTROL.agc:850
//			HUNTEST
// slot 24081
    24081, 43510,
// REENTRY_CONTROL.agc:851
//
// REENTRY_CONTROL.agc:852
//FOREHUNT	DLOAD			# INITIALIZE HUNTEST.
// slot 24082
    24082, 65482,
// REENTRY_CONTROL.agc:853
//			3ZEROS
// slot 24083
    24083, 13754,
// REENTRY_CONTROL.agc:854
//		STODL	DIFFOLD
// slot 24084
    24084, 16148,
// REENTRY_CONTROL.agc:855
//			DLEWD0
// slot 24085
    24085, 13534,
// REENTRY_CONTROL.agc:856
//		STODL	DLEWD
// slot 24086
    24086, 16196,
// REENTRY_CONTROL.agc:857
//			LEWD1
// slot 24087
    24087, 13522,
// REENTRY_CONTROL.agc:858
//		STORE	LEWD
// slot 24088
    24088, 4010,
// REENTRY_CONTROL.agc:859
//		RVQ
// slot 24089
    24089, 65308,
// REENTRY_CONTROL.agc:860
//
// REENTRY_CONTROL.agc:861
//ADENDEXT	CADR	ENDEXIT
// slot 24090
    24090, 44796,
// REENTRY_CONTROL.agc:862
//
// REENTRY_CONTROL.agc:863
//# Page 864
// REENTRY_CONTROL.agc:864
//# * START	UP CONTROL ...
// REENTRY_CONTROL.agc:865
//					# MM = 65
// REENTRY_CONTROL.agc:866
//GOTOUPSY	RTB			# END OF HUNTEST
// slot 24091
    24091, 65336,
// REENTRY_CONTROL.agc:867
//			P65		# HUNTEST USE OF GRP4 IS DISABLED BY P65
// slot 24092
    24092, 45634,
// REENTRY_CONTROL.agc:868
//					# USE FOR DISPLAY.
// REENTRY_CONTROL.agc:869
//					# SET MODE = UPCONTRL.
// REENTRY_CONTROL.agc:870
//					# RETURN FROM P65 DIRECTLY TO UPCONTRL
// REENTRY_CONTROL.agc:871
//					# VIA THE GOTOADDR AT REFAZE10.
// REENTRY_CONTROL.agc:872
//
// REENTRY_CONTROL.agc:873
//UPCONTRL	DLOAD	DSU		# IF D-140 POS, NOSWITCH =1
// slot 24093
    24093, 38346,
// REENTRY_CONTROL.agc:874
//			D		# (SUPPRESS LATERAL SWITCH)
// slot 24094
    24094, 3904,
// REENTRY_CONTROL.agc:875
//			C21
// slot 24095
    24095, 13602,
// REENTRY_CONTROL.agc:876
//		BMN	SET
// slot 24096
    24096, 35904,
// REENTRY_CONTROL.agc:877
//			+2
// slot 24097
    24097, 44102,
// REENTRY_CONTROL.agc:878
//			NOSWITCH
// slot 24098
    24098, 3184,
// REENTRY_CONTROL.agc:879
//
// REENTRY_CONTROL.agc:880
//		DLOAD	DSU		# IF V-V1 POS, GO TO DOWN CONTROL.
// slot 24099
    24099, 38346,
// REENTRY_CONTROL.agc:881
//			V
// slot 24100
    24100, 3960,
// REENTRY_CONTROL.agc:882
//			V1
// slot 24101
    24101, 428,
// REENTRY_CONTROL.agc:883
//		BPL	DLOAD
// slot 24102
    24102, 58696,
// REENTRY_CONTROL.agc:884
//			DOWNCNTL
// slot 24103
    24103, 44384,
// REENTRY_CONTROL.agc:885
//			D
// slot 24104
    24104, 3904,
// REENTRY_CONTROL.agc:886
//		DSU	BMN		# IF D- Q7 NEG, GO TO KEP
// slot 24105
    24105, 41002,
// REENTRY_CONTROL.agc:887
//			Q7
// slot 24106
    24106, 3322,
// REENTRY_CONTROL.agc:888
//			KEP
// slot 24107
    24107, 44438,
// REENTRY_CONTROL.agc:889
//		DLOAD	BPL		# IF RDOT NEG, DO VLTEST
// slot 24108
    24108, 42186,
// REENTRY_CONTROL.agc:890
//			RDOT
// slot 24109
    24109, 3968,
// REENTRY_CONTROL.agc:891
//			CONT1
// slot 24110
    24110, 44138,
// REENTRY_CONTROL.agc:892
//
// REENTRY_CONTROL.agc:893
//VLTEST		DLOAD	DSU		# IF V-VL-C18 NEG,EGSW=1,MODE=PREDICT3
// slot 24111
    24111, 38346,
// REENTRY_CONTROL.agc:894
//			V
// slot 24112
    24112, 3960,
// REENTRY_CONTROL.agc:895
//			VL
// slot 24113
    24113, 4078,
// REENTRY_CONTROL.agc:896
//		DSU	BMN
// slot 24114
    24114, 41002,
// REENTRY_CONTROL.agc:897
//			C18
// slot 24115
    24115, 13546,
// REENTRY_CONTROL.agc:898
//			PREFINAL
// slot 24116
    24116, 44470,
// REENTRY_CONTROL.agc:899
//
// REENTRY_CONTROL.agc:900
//CONT1		DLOAD			# IF D-A0 POS, L/D = LAD, GO TO LIMITL/D
// slot 24117
    24117, 65482,
// REENTRY_CONTROL.agc:901
//			D
// slot 24118
    24118, 3904,
// REENTRY_CONTROL.agc:902
//		DSU	BMN
// slot 24119
    24119, 41002,
// REENTRY_CONTROL.agc:903
//			A0
// slot 24120
    24120, 432,
// REENTRY_CONTROL.agc:904
//			CONT3
// slot 24121
    24121, 44154,
// REENTRY_CONTROL.agc:905
//		DLOAD	GOTO
// slot 24122
    24122, 43210,
// REENTRY_CONTROL.agc:906
//			LAD
// slot 24123
    24123, 3880,
// REENTRY_CONTROL.agc:907
//			STOREL/D
// slot 24124
    24124, 44714,
// REENTRY_CONTROL.agc:908
//
// REENTRY_CONTROL.agc:909
//CONT3		DLOAD	DMP		# VREF=FACT1(1-SQRT(FACT2 D + ALP))
// slot 24125
    24125, 34250,
// REENTRY_CONTROL.agc:910
//			D
// slot 24126
    24126, 3904,
// REENTRY_CONTROL.agc:911
//			FACT2
// slot 24127
    24127, 3872,
// REENTRY_CONTROL.agc:912
//# Page 865
// REENTRY_CONTROL.agc:913
//		DAD	SQRT
// slot 24128
    24128, 63002,
// REENTRY_CONTROL.agc:914
//			ALP
// slot 24129
    24129, 3976,
// REENTRY_CONTROL.agc:915
//		BDSU	DMP
// slot 24130
    24130, 34082,
// REENTRY_CONTROL.agc:916
//			BARELY1
// slot 24131
    24131, 15860,
// REENTRY_CONTROL.agc:917
//			FACT1
// slot 24132
    24132, 3868,
// REENTRY_CONTROL.agc:918
//		STORE	VREF		# VREF / 2VS
// slot 24133
    24133, 1248,
// REENTRY_CONTROL.agc:919
//
// REENTRY_CONTROL.agc:920
//		BDSU	DMP		# RDOTREF = LEWD(V1-VREF)
// slot 24134
    24134, 34082,
// REENTRY_CONTROL.agc:921
//			V1
// slot 24135
    24135, 428,
// REENTRY_CONTROL.agc:922
//			LEWD
// slot 24136
    24136, 4010,
// REENTRY_CONTROL.agc:923
//		STODL	RDOTREF		# RDOTREF / 2VS
// slot 24137
    24137, 13532,
// REENTRY_CONTROL.agc:924
//
// REENTRY_CONTROL.agc:925
//			VS1
// slot 24138
    24138, 3956,
// REENTRY_CONTROL.agc:926
//		DSU	BMN		# IF VSAT-VREF NEG, GO TO CONTINU2
// slot 24139
    24139, 41002,
// REENTRY_CONTROL.agc:927
//			VREF
// slot 24140
    24140, 1248,
// REENTRY_CONTROL.agc:928
//			CONTINU2
// slot 24141
    24141, 44216,
// REENTRY_CONTROL.agc:929
//
// REENTRY_CONTROL.agc:930
//		PUSH	PUSH		# VS1-VREF  TO PDL TWICE
// slot 24142
    24142, 34316,
// REENTRY_CONTROL.agc:931
//		DMP	DDV		# RDHOOK=CHI(1+DV AHOOKDV/DVL) DV DV
// slot 24143
    24143, 47370,
// REENTRY_CONTROL.agc:932
//			AHOOKDV		#	/DHOOK VREF
// slot 24144
    24144, 3936,
// REENTRY_CONTROL.agc:933
//			DVL		# WHERE  DV = (VS1-VREF)
// slot 24145
    24145, 3940,
// REENTRY_CONTROL.agc:934
//		DAD	DMP
// slot 24146
    24146, 34074,
// REENTRY_CONTROL.agc:935
//			1/16TH
// slot 24147
    24147, 15852,
// REENTRY_CONTROL.agc:936
//			CH1
// slot 24148
    24148, 13658,
// REENTRY_CONTROL.agc:937
//		DMP	DMP
// slot 24149
    24149, 34058,
// REENTRY_CONTROL.agc:938
//					# VS1-VREF  FROM PDL TWICE.
// REENTRY_CONTROL.agc:939
//		DDV
// slot 24150
    24150, 65394,
// REENTRY_CONTROL.agc:940
//			DHOOK
// slot 24151
    24151, 3932,
// REENTRY_CONTROL.agc:941
//		DDV	BDSU
// slot 24152
    24152, 37234,
// REENTRY_CONTROL.agc:942
//			VREF
// slot 24153
    24153, 1248,
// REENTRY_CONTROL.agc:943
//			RDOTREF		# C(RDOTREF)= LEWD (V1-VREF)
// slot 24154
    24154, 1244,
// REENTRY_CONTROL.agc:944
//		STORE	RDOTREF		# RDOTREF = RDOTREF - RDHOOK
// slot 24155
    24155, 1244,
// REENTRY_CONTROL.agc:945
//
// REENTRY_CONTROL.agc:946
//CONTINU2	DLOAD	DSU
// slot 24156
    24156, 38346,
// REENTRY_CONTROL.agc:947
//			D
// slot 24157
    24157, 3904,
// REENTRY_CONTROL.agc:948
//			Q7MIN
// slot 24158
    24158, 13718,
// REENTRY_CONTROL.agc:949
//		BOVB	BMN
// slot 24159
    24159, 40968,
// REENTRY_CONTROL.agc:950
//			TCDANZIG	# CLEAR OVFL IND, IF ON.
// slot 24160
    24160, 48596,
// REENTRY_CONTROL.agc:951
//			UPCNTRL3
// slot 24161
    24161, 44244,
// REENTRY_CONTROL.agc:952
//		DLOAD	DSU
// slot 24162
    24162, 38346,
// REENTRY_CONTROL.agc:953
//			A1
// slot 24163
    24163, 3944,
// REENTRY_CONTROL.agc:954
//			Q7
// slot 24164
    24164, 3322,
// REENTRY_CONTROL.agc:955
//		PDDL	DSU
// slot 24165
    24165, 38314,
// REENTRY_CONTROL.agc:956
//			D
// slot 24166
    24166, 3904,
// REENTRY_CONTROL.agc:957
//			Q7
// slot 24167
    24167, 3322,
// REENTRY_CONTROL.agc:958
//		DDV	STADR
// slot 24168
    24168, 38514,
// REENTRY_CONTROL.agc:959
//		STORE	FACTOR		# FACTOR / 25G
// slot 24169
    24169, 61670,
// REENTRY_CONTROL.agc:960
//
// REENTRY_CONTROL.agc:961
//# Page 866
// REENTRY_CONTROL.agc:962
//# SKIPPER
// REENTRY_CONTROL.agc:963
//					# DELTA L/D=-((RDOT-RDOTREF)F1 KB1+V-VREF)F1 KB2
// REENTRY_CONTROL.agc:964
//					#	WHERE F1 = FACTOR
// REENTRY_CONTROL.agc:965
//
// REENTRY_CONTROL.agc:966
//UPCNTRL3	DLOAD
// slot 24170
    24170, 65482,
// REENTRY_CONTROL.agc:967
//			RDOT
// slot 24171
    24171, 3968,
// REENTRY_CONTROL.agc:968
//		DSU	DMP		# L/D = LEWD
// slot 24172
    24172, 34090,
// REENTRY_CONTROL.agc:969
//			RDOTREF		# -((RDOT-RDOTREF)F1/KB1+V-VREF)F1/KB2
// slot 24173
    24173, 1244,
// REENTRY_CONTROL.agc:970
//			FACTOR
// slot 24174
    24174, 3864,
// REENTRY_CONTROL.agc:971
//		DDV	DAD
// slot 24175
    24175, 36210,
// REENTRY_CONTROL.agc:972
//			1/KB1
// slot 24176
    24176, 13586,
// REENTRY_CONTROL.agc:973
//			V
// slot 24177
    24177, 3960
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:974
//		DSU	DMP
// slot 24178
    24178, 34090,
// REENTRY_CONTROL.agc:975
//			VREF
// slot 24179
    24179, 1248,
// REENTRY_CONTROL.agc:976
//			FACTOR
// slot 24180
    24180, 3864,
// REENTRY_CONTROL.agc:977
//		DDV	PUSH
// slot 24181
    24181, 34418,
// REENTRY_CONTROL.agc:978
//
// REENTRY_CONTROL.agc:979
//			-1/KB2		# DELTA L/D INTO PDL
// slot 24182
    24182, 13590,
// REENTRY_CONTROL.agc:980
//		BOV	ABS		# NONLINEAR CIRCUIT FOR REDUCING HIGH GAIN
// slot 24183
    24183, 42496,
// REENTRY_CONTROL.agc:981
//			GOMAXL/D
// slot 24184
    24184, 44660,
// REENTRY_CONTROL.agc:982
//		DSU	BMN
// slot 24185
    24185, 41002,
// REENTRY_CONTROL.agc:983
//			PT1/16
// slot 24186
    24186, 13690,
// REENTRY_CONTROL.agc:984
//			NEXT1
// slot 24187
    24187, 44288,
// REENTRY_CONTROL.agc:985
//		DMP	DAD
// slot 24188
    24188, 36106,
// REENTRY_CONTROL.agc:986
//			POINT1
// slot 24189
    24189, 13526,
// REENTRY_CONTROL.agc:987
//			PT1/16
// slot 24190
    24190, 13690,
// REENTRY_CONTROL.agc:988
//		SIGN	PUSH		# ATTACH SIGN OF PUSH TO MPAC THEN PUSH
// slot 24191
    24191, 34538,
// REENTRY_CONTROL.agc:989
//
// REENTRY_CONTROL.agc:990
//NEXT1		DLOAD	SL4
// slot 24192
    24192, 35530,
// REENTRY_CONTROL.agc:991
//					# DELTA L/D FROM PDL.
// REENTRY_CONTROL.agc:992
//
// REENTRY_CONTROL.agc:993
//		DAD
// slot 24193
    24193, 65306,
// REENTRY_CONTROL.agc:994
//			LEWD
// slot 24194
    24194, 4010,
// REENTRY_CONTROL.agc:995
//NEGTESTS	BOV	PUSH		# L/D TO PDL FOR USE IN NEGTESTS.
// slot 24195
    24195, 34304,
// REENTRY_CONTROL.agc:996
//			GOMAXL/D
// slot 24196
    24196, 44660,
// REENTRY_CONTROL.agc:997
//		STODL	L/D
// slot 24197
    24197, 16184,
// REENTRY_CONTROL.agc:998
//					# IF D-C20 POS, LATSW =0
// REENTRY_CONTROL.agc:999
//					# AND IF L/D NEG, L/D = 0.
// REENTRY_CONTROL.agc:1000
//			D
// slot 24198
    24198, 3904,
// REENTRY_CONTROL.agc:1001
//		DSU	BMN
// slot 24199
    24199, 41002,
// REENTRY_CONTROL.agc:1002
//			C20
// slot 24200
    24200, 13598,
// REENTRY_CONTROL.agc:1003
//			LIMITL/D
// slot 24201
    24201, 44716,
// REENTRY_CONTROL.agc:1004
//		CLEAR	DLOAD
// slot 24202
    24202, 58648,
// REENTRY_CONTROL.agc:1005
//			LATSW		# =21D.  ROLL OVER TOP, REGARDLESS.
// slot 24203
    24203, 3446,
// REENTRY_CONTROL.agc:1006
//					# L/D FROM PDL.
// REENTRY_CONTROL.agc:1007
//		BPL	DLOAD
// slot 24204
    24204, 58696,
// REENTRY_CONTROL.agc:1008
//			LIMITL/D
// slot 24205
    24205, 44716,
// REENTRY_CONTROL.agc:1009
//			3ZEROS
// slot 24206
    24206, 13754,
// REENTRY_CONTROL.agc:1010
//		STCALL	L/D
// slot 24207
    24207, 32568,
// REENTRY_CONTROL.agc:1011
//			LIMITL/D	# (GO TO)
// slot 24208
    24208, 44716,
// REENTRY_CONTROL.agc:1012
//
// REENTRY_CONTROL.agc:1013
//# Page 867
// REENTRY_CONTROL.agc:1014
//DCONSTD		DLOAD			# TWO RANGER ENTRIES TO CONSTD HERE
// slot 24209
    24209, 65482,
// REENTRY_CONTROL.agc:1015
//			DIFF
// slot 24210
    24210, 3856,
// REENTRY_CONTROL.agc:1016
//					# SAVE OLD VALUE OF DIFF FOR NEXT PASS.
// REENTRY_CONTROL.agc:1017
//		STODL	DIFFOLD		# DIFFOLD / 2 PI
// slot 24211
    24211, 16148,
// REENTRY_CONTROL.agc:1018
//
// REENTRY_CONTROL.agc:1019
//			Q7F
// slot 24212
    24212, 13566,
// REENTRY_CONTROL.agc:1020
//		STORE	Q7
// slot 24213
    24213, 3322,
// REENTRY_CONTROL.agc:1021
//
// REENTRY_CONTROL.agc:1022
//BECONSTD	SSP	RTB		# A HUNTEST ENTRY INTO CONSTD.
// slot 24214
    24214, 40114,
// REENTRY_CONTROL.agc:1023
//			GOTOADDR	# RESET MODE TO HUNTEST
// slot 24215
    24215, 3916,
// REENTRY_CONTROL.agc:1024
//			HUNTEST
// slot 24216
    24216, 43510,
// REENTRY_CONTROL.agc:1025
//			KILLGRP4	# DEACTIVATE GRP4 FROM HUNTEST.
// slot 24217
    24217, 45708,
// REENTRY_CONTROL.agc:1026
//
// REENTRY_CONTROL.agc:1027
//CONSTD		BOVB
// slot 24218
    24218, 65288,
// REENTRY_CONTROL.agc:1028
//			TCDANZIG	# CLEAR OVF IND IF ON.
// slot 24219
    24219, 48596,
// REENTRY_CONTROL.agc:1029
//
// REENTRY_CONTROL.agc:1030
//		DLOAD	DMP
// slot 24220
    24220, 34250,
// REENTRY_CONTROL.agc:1031
//			LEQ
// slot 24221
    24221, 3928,
// REENTRY_CONTROL.agc:1032
//			C/D0		# C/D0 = -4/D0 B-8
// slot 24222
    24222, 3980,
// REENTRY_CONTROL.agc:1033
//		PDDL	DMP		# LEQ C/D0 INTO PDL
// slot 24223
    24223, 34218,
// REENTRY_CONTROL.agc:1034
//			2HS		# 2HS / 4 VS VS
// slot 24224
    24224, 13670,
// REENTRY_CONTROL.agc:1035
//			D0
// slot 24225
    24225, 3984,
// REENTRY_CONTROL.agc:1036
//		DDV	DAD		# RDOTREF = -2 HS D0/V
// slot 24226
    24226, 36210,
// REENTRY_CONTROL.agc:1037
//			V
// slot 24227
    24227, 3960,
// REENTRY_CONTROL.agc:1038
//			RDOT
// slot 24228
    24228, 3968,
// REENTRY_CONTROL.agc:1039
//		DMP	DAD
// slot 24229
    24229, 36106,
// REENTRY_CONTROL.agc:1040
//			K2D		# C/D0 LEQ + K2D(RDOT-RDOTREF) INTO PD
// slot 24230
    24230, 13614,
// REENTRY_CONTROL.agc:1041
//		PDDL
// slot 24231
    24231, 65450,
// REENTRY_CONTROL.agc:1042
//			D0		# D0 /805
// slot 24232
    24232, 3984,
// REENTRY_CONTROL.agc:1043
//
// REENTRY_CONTROL.agc:1044
//CONSTD1		BDSU			# ENTER WITH DREF IN MPAC
// slot 24233
    24233, 65314,
// REENTRY_CONTROL.agc:1045
//			D
// slot 24234
    24234, 3904,
// REENTRY_CONTROL.agc:1046
//		DMP	DAD
// slot 24235
    24235, 36106,
// REENTRY_CONTROL.agc:1047
//			K1D		# K2D TERM FROM PUSH
// slot 24236
    24236, 13610,
// REENTRY_CONTROL.agc:1048
//		SL	GOTO
// slot 24237
    24237, 43106,
// REENTRY_CONTROL.agc:1049
//			8D
// slot 24238
    24238, 16658,
// REENTRY_CONTROL.agc:1050
//			NEGTESTS	# (GO TO)
// slot 24239
    24239, 44294,
// REENTRY_CONTROL.agc:1051
//
// REENTRY_CONTROL.agc:1052
//DOWNCNTL	BOVB			# INITIAL PART OF UPCONTROL.
// slot 24240
    24240, 65288,
// REENTRY_CONTROL.agc:1053
//			TCDANZIG	# CLEAR OVFIND, IF ON.
// slot 24241
    24241, 48596,
// REENTRY_CONTROL.agc:1054
//
// REENTRY_CONTROL.agc:1055
//		DLOAD	SR
// slot 24242
    24242, 45514,
// REENTRY_CONTROL.agc:1056
//			LAD
// slot 24243
    24243, 3880,
// REENTRY_CONTROL.agc:1057
//			8D
// slot 24244
    24244, 17170,
// REENTRY_CONTROL.agc:1058
//		PDDL	DSU		# RDTR = LAD(V1-V)
// slot 24245
    24245, 38314,
// REENTRY_CONTROL.agc:1059
//			V
// slot 24246
    24246, 3960,
// REENTRY_CONTROL.agc:1060
//			V1
// slot 24247
    24247, 428,
// REENTRY_CONTROL.agc:1061
//		DMP	DAD
// slot 24248
    24248, 36106,
// REENTRY_CONTROL.agc:1062
//			LAD
// slot 24249
    24249, 3880,
// REENTRY_CONTROL.agc:1063
//# Page 868
// REENTRY_CONTROL.agc:1064
//			RDOT
// slot 24250
    24250, 3968,
// REENTRY_CONTROL.agc:1065
//		DMP	DAD
// slot 24251
    24251, 36106,
// REENTRY_CONTROL.agc:1066
//			K2D
// slot 24252
    24252, 13614,
// REENTRY_CONTROL.agc:1067
//					# PUSH UP LAD.
// REENTRY_CONTROL.agc:1068
//		PDDL	DSU		# LAD + K2D(RDOT-RDTR) INTO PD
// slot 24253
    24253, 38314,
// REENTRY_CONTROL.agc:1069
//			V1
// slot 24254
    24254, 428,
// REENTRY_CONTROL.agc:1070
//			V
// slot 24255
    24255, 3960,
// REENTRY_CONTROL.agc:1071
//		DSQ	DMP
// slot 24256
    24256, 34204,
// REENTRY_CONTROL.agc:1072
//			LAD
// slot 24257
    24257, 3880,
// REENTRY_CONTROL.agc:1073
//		DDV	PDDL		# (V1-V)SQ LAD/(2 C1 HS) INTO PD
// slot 24258
    24258, 54642,
// REENTRY_CONTROL.agc:1074
//			2C1HS
// slot 24259
    24259, 13686,
// REENTRY_CONTROL.agc:1075
//			V1
// slot 24260
    24260, 428,
// REENTRY_CONTROL.agc:1076
//		DSQ	DDV
// slot 24261
    24261, 47516,
// REENTRY_CONTROL.agc:1077
//			VSQUARE
// slot 24262
    24262, 3876,
// REENTRY_CONTROL.agc:1078
//		BDDV	DSU		# DREF = (V/V1)SQ A0 - PD
// slot 24263
    24263, 38250,
// REENTRY_CONTROL.agc:1079
//			A0
// slot 24264
    24264, 432,
// REENTRY_CONTROL.agc:1080
//					# PUSH UP HERE
// REENTRY_CONTROL.agc:1081
//		GOTO			# C(MPAC) = DREF
// slot 24265
    24265, 65360,
// REENTRY_CONTROL.agc:1082
//			CONSTD1
// slot 24266
    24266, 44370,
// REENTRY_CONTROL.agc:1083
//
// REENTRY_CONTROL.agc:1084
//					#              2           2
// REENTRY_CONTROL.agc:1085
//					# DREF = (V/V1)  A0 -(V-V1)  LAD/2 C1 HS
// REENTRY_CONTROL.agc:1086
//# Page 869
// REENTRY_CONTROL.agc:1087
//# * START	BALLISTIC PHASE ...
// REENTRY_CONTROL.agc:1088
//					# MM = 66	UPCONTRL ENTRY INTO KEP2.
// REENTRY_CONTROL.agc:1089
//KEP		RTB	SSP
// slot 24267
    24267, 55608,
// REENTRY_CONTROL.agc:1090
//			P66		# DISPLAY TRIM GIMBAL ANGLE VALUES.
// slot 24268
    24268, 45688,
// REENTRY_CONTROL.agc:1091
//			GOTOADDR	# SET GOTOADDR TO KEPLER PHASE.
// slot 24269
    24269, 3916,
// REENTRY_CONTROL.agc:1092
//			KEP2
// slot 24270
    24270, 44446,
// REENTRY_CONTROL.agc:1093
//
// REENTRY_CONTROL.agc:1094
//					# KEP2 CAN ALSO BE STARTED UP DIRECTLY FROM INITROLL
// REENTRY_CONTROL.agc:1095
//					# IN P64.  PROGRAM WILL IDLE IN P64 UNTIL D EXCEEDS
// REENTRY_CONTROL.agc:1096
//					# .2 G BEFORE GOING ON TO P67.
// REENTRY_CONTROL.agc:1097
//
// REENTRY_CONTROL.agc:1098
//KEP2		DLOAD	DSU		# IF Q7F+KDMIN -D NEG, GO TO FINAL PHASE.
// slot 24271
    24271, 38346,
// REENTRY_CONTROL.agc:1099
//			Q7FKDMIN	# (Q7F + KDMIN)/805
// slot 24272
    24272, 13550,
// REENTRY_CONTROL.agc:1100
//			D
// slot 24273
    24273, 3904,
// REENTRY_CONTROL.agc:1101
//		BMN	TLOAD
// slot 24274
    24274, 59712
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1102
//			PREFINAL
// slot 24275
    24275, 44470,
// REENTRY_CONTROL.agc:1103
//					# SET ROLLHOLD = ROLLC, IN CASE CMDAPMOD
// REENTRY_CONTROL.agc:1104
//			ROLLC		# = +1 EVER ENTERED.
// slot 24276
    24276, 3484,
// REENTRY_CONTROL.agc:1105
//		BON	TLOAD		# IF D > .05G, KEEP PRESENT ROLL COMMAND.
// slot 24277
    24277, 59672,
// REENTRY_CONTROL.agc:1106
//			.05GSW		# IF D < .05G, SET ROLL COMMAND = 0.
// slot 24278
    24278, 3480,
// REENTRY_CONTROL.agc:1107
//			+2
// slot 24279
    24279, 44466,
// REENTRY_CONTROL.agc:1108
//			3ZEROS		# SET ROLLC & ROLLHOLD =0.
// slot 24280
    24280, 13754,
// REENTRY_CONTROL.agc:1109
//+2		STCALL	ROLLC		# (SP ROLLHOLD FOLLOWS DP ROLLC)
// slot 24281
    24281, 32156,
// REENTRY_CONTROL.agc:1110
//			P62.3		# CALC DESIRED GIMBAL ANGLES AT PRESENT
// slot 24282
    24282, 45570,
// REENTRY_CONTROL.agc:1111
//					# RN, VN TO YIELD TRIM ATTITUDE.
// REENTRY_CONTROL.agc:1112
//					# AVAILABLE IN CPHI'S FOR N22.
// REENTRY_CONTROL.agc:1113
//# Page 870
// REENTRY_CONTROL.agc:1114
//# START FINAL PHASE ...
// REENTRY_CONTROL.agc:1115
//					# MM = 67
// REENTRY_CONTROL.agc:1116
//PREFINAL	SSP	RTB
// slot 24283
    24283, 40114,
// REENTRY_CONTROL.agc:1117
//			GOTOADDR	# RESTART PROTECT: RESET GOTOADDR IF CAME
// slot 24284
    24284, 3916,
// REENTRY_CONTROL.agc:1118
//			PREFINAL	# FROM HUNTEST.
// slot 24285
    24285, 44470,
// REENTRY_CONTROL.agc:1119
//			P67		# DISABLES GRP4.  FINE IF FROM HUNTEST.BUT
// slot 24286
    24286, 45696,
// REENTRY_CONTROL.agc:1120
//					# MAY ALSO REMOVE RESTART PROTECTION OF
// REENTRY_CONTROL.agc:1121
//					# N69 (P65).
// REENTRY_CONTROL.agc:1122
//					# ROLLC		XRNGERR		DNRNGERR
// REENTRY_CONTROL.agc:1123
//					# XXX.XX DEG	XXXX.X NM	XXXX.X NM
// REENTRY_CONTROL.agc:1124
//
// REENTRY_CONTROL.agc:1125
//		SET	SSP
// slot 24287
    24287, 55576,
// REENTRY_CONTROL.agc:1126
//			EGSW
// slot 24288
    24288, 3182,
// REENTRY_CONTROL.agc:1127
//			GOTOADDR
// slot 24289
    24289, 3916,
// REENTRY_CONTROL.agc:1128
//			PREDICT3
// slot 24290
    24290, 44486,
// REENTRY_CONTROL.agc:1129
//
// REENTRY_CONTROL.agc:1130
//PREDICT3	DLOAD	DSU		# IF V-VQUIT NEG, STOP STEERING
// slot 24291
    24291, 38346,
// REENTRY_CONTROL.agc:1131
//			V
// slot 24292
    24292, 3960,
// REENTRY_CONTROL.agc:1132
//			VQUIT
// slot 24293
    24293, 13594,
// REENTRY_CONTROL.agc:1133
//		BMN	EXIT
// slot 24294
    24294, 65088,
// REENTRY_CONTROL.agc:1134
//			STEEROFF
// slot 24295
    24295, 44822
)).

// bank 25, slots 24296-24301
function agcAotUnit1409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24298 {
        if slot <= 24296 {
// REENTRY_CONTROL.agc:1135
//
// REENTRY_CONTROL.agc:1136
//		CA	EBENTRY		# PRECAUTIONARY.
// slot 24296
            if slot <> 24296 or instruction <> 14896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24297 {
// REENTRY_CONTROL.agc:1137
//		TS	EBANK
// slot 24297
                if slot <> 24297 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1138
//
// REENTRY_CONTROL.agc:1139
//		CA	TWELVE
// slot 24298
                if slot <> 24298 or instruction <> 15353 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24299 {
// REENTRY_CONTROL.agc:1140
//BACK		TS	JJ
// slot 24299
            if slot <> 24299 or instruction <> 23545 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23545, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24300 {
// REENTRY_CONTROL.agc:1141
//
// REENTRY_CONTROL.agc:1142
//		CS	V
// slot 24300
                if slot <> 24300 or instruction <> 17339 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 955).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1143
//		INDEX	JJ
// slot 24301
                if slot <> 24301 or instruction <> 21497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21497, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1409] to agcAotUnit1409@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1144
//		AD	VREFER		# VREF - V, HIGHEST VREF AT END OF TABLE.
// slot 24302
    24302, 53054
)).

// bank 25, slots 24303-24308
function agcAotUnit1410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24305 {
        if slot <= 24303 {
// REENTRY_CONTROL.agc:1145
//		CCS	A		# IF VREF-V POS LOOP BACK
// slot 24303
            if slot <> 24303 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24304 {
// REENTRY_CONTROL.agc:1146
//		CCS	JJ		# DECREMENT JJ, JJ CANNOT BE ZERO
// slot 24304
                if slot <> 24304 or instruction <> 5113 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 1017).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1147
//		TCF	BACK
// slot 24305
                if slot <> 24305 or instruction <> 5867 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5867, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24306 {
// REENTRY_CONTROL.agc:1148
//		AD	ONE
// slot 24306
            if slot <> 24306 or instruction <> 27151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24307 {
// REENTRY_CONTROL.agc:1149
//		TS	TEM1B		# V-VREF IN TEM1B (MUST BE POSITIVE NUM)
// slot 24307
                if slot <> 24307 or instruction <> 23462 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1150
//
// REENTRY_CONTROL.agc:1151
//		INDEX	JJ
// slot 24308
                if slot <> 24308 or instruction <> 21497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21497, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1410] to agcAotUnit1410@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1152
//		CS	VREFER
// slot 24309
    24309, 36670
)).

// bank 25, slots 24310-24310
function agcAotUnit1411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:1153
//		INDEX	JJ
// slot 24310
    if slot <> 24310 or instruction <> 21497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21497, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1411] to agcAotUnit1411@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1154
//		AD	VREFER +1	# V(K+1) - V(K)			(POS NUM)
// slot 24311
    24311, 53056
)).

// bank 25, slots 24312-24321
function agcAotUnit1412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24316 {
        if slot <= 24313 {
            if slot <= 24312 {
// REENTRY_CONTROL.agc:1155
//		XCH	TEM1B
// slot 24312
                if slot <> 24312 or instruction <> 24486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 934, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1156
//		ZL
// slot 24313
                if slot <> 24313 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24314 {
// REENTRY_CONTROL.agc:1157
//		EXTEND
// slot 24314
                if slot <> 24314 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24315 {
// REENTRY_CONTROL.agc:1158
//		DV	TEM1B
// slot 24315
                    if slot <> 24315 or instruction <> 5030 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 934, readEffective:call(words, 934)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1159
//		TS	GRAD		# GRAD = (V-VREF)/(VK+1 - VK)	(POS NUM
// slot 24316
                    if slot <> 24316 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 24318 {
            if slot <= 24317 {
// REENTRY_CONTROL.agc:1160
//
// REENTRY_CONTROL.agc:1161
//		CAF	FIVE
// slot 24317
                if slot <> 24317 or instruction <> 14866 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1162
//
// REENTRY_CONTROL.agc:1163
//# Page 871
// REENTRY_CONTROL.agc:1164
//BACK2		TS	MM
// slot 24318
                if slot <> 24318 or instruction <> 23464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 24319 {
// REENTRY_CONTROL.agc:1165
//		CAF	THIRTEEN
// slot 24319
                if slot <> 24319 or instruction <> 14869 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2581), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 24320 {
// REENTRY_CONTROL.agc:1166
//		ADS	JJ
// slot 24320
                    if slot <> 24320 or instruction <> 12281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1017).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1167
//		INDEX	A
// slot 24321
                    if slot <> 24321 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1412] to agcAotUnit1412@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1168
//		CS	VREFER
// slot 24322
    24322, 36670
)).

// bank 25, slots 24323-24323
function agcAotUnit1413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:1169
//		INDEX	JJ
// slot 24323
    if slot <> 24323 or instruction <> 21497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21497, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1413] to agcAotUnit1413@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1170
//		AD	VREFER	 +1	# X(K+1) - X(K)
// slot 24324
    24324, 53056
)).

// bank 25, slots 24325-24327
function agcAotUnit1414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24325 {
// REENTRY_CONTROL.agc:1171
//		EXTEND
// slot 24325
        if slot <> 24325 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24326 {
// REENTRY_CONTROL.agc:1172
//		MP	GRAD
// slot 24326
            if slot <> 24326 or instruction <> 29609 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 937, readEffective:call(words, 937)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1173
//		INDEX	JJ
// slot 24327
            if slot <> 24327 or instruction <> 21497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21497, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1414] to agcAotUnit1414@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1174
//		AD	VREFER
// slot 24328
    24328, 53054
)).

// bank 25, slots 24329-24329
function agcAotUnit1415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:1175
//		INDEX	MM
// slot 24329
    if slot <> 24329 or instruction <> 21416 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21416, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21416, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1415] to agcAotUnit1415@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1176
//		TS	FX		# FX = AK + GRAD (AK+1 - AK)
// slot 24330
    24330, 46932
)).

// bank 25, slots 24331-24350
function agcAotUnit1416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24340 {
        if slot <= 24335 {
            if slot <= 24332 {
                if slot <= 24331 {
// REENTRY_CONTROL.agc:1177
//		CCS	MM
// slot 24331
                    if slot <> 24331 or instruction <> 5032 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 936).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1178
//		TCF	BACK2
// slot 24332
                    if slot <> 24332 or instruction <> 5886 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5886, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24333 {
// REENTRY_CONTROL.agc:1179
//		XCH	FX 	+1	# ZERO FX +1 AND GET DREFR
// slot 24333
                    if slot <> 24333 or instruction <> 24491 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 939, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24334 {
// REENTRY_CONTROL.agc:1180
//		AD	D
// slot 24334
                        if slot <> 24334 or instruction <> 25503 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 927).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// REENTRY_CONTROL.agc:1181
//		EXTEND
// slot 24335
                        if slot <> 24335 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24337 {
                if slot <= 24336 {
// REENTRY_CONTROL.agc:1182
//		MP	FX	+5	# F1
// slot 24336
                    if slot <> 24336 or instruction <> 29615 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 943, readEffective:call(words, 943)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1183
//		DXCH	MPAC		# MPAC = F1(D-DREF)
// slot 24337
                    if slot <> 24337 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24338 {
// REENTRY_CONTROL.agc:1184
//
// REENTRY_CONTROL.agc:1185
//		EXTEND
// slot 24338
                    if slot <> 24338 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24339 {
// REENTRY_CONTROL.agc:1186
//		DCS	RDOT		# FORM RDOTREF - RDOT
// slot 24339
                        if slot <> 24339 or instruction <> 17344 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 960, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// REENTRY_CONTROL.agc:1187
//		DDOUBL
// slot 24340
                        if slot <> 24340 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 24345 {
            if slot <= 24342 {
                if slot <= 24341 {
// REENTRY_CONTROL.agc:1188
//		DDOUBL
// slot 24341
                    if slot <> 24341 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1189
//		DDOUBL			# SCALE UP BY 8 FOR THIS PHASE.
// slot 24342
                    if slot <> 24342 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24343 {
// REENTRY_CONTROL.agc:1190
//		AD	FX 	+3	# RDOTREF
// slot 24343
                    if slot <> 24343 or instruction <> 25517 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 941).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24344 {
// REENTRY_CONTROL.agc:1191
//		EXTEND
// slot 24344
                        if slot <> 24344 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// REENTRY_CONTROL.agc:1192
//		MP	FX 	+4	# F2
// slot 24345
                        if slot <> 24345 or instruction <> 29614 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 942, readEffective:call(words, 942)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 24347 {
                if slot <= 24346 {
// REENTRY_CONTROL.agc:1193
//		AD	FX	+2	# RTOGO
// slot 24346
                    if slot <> 24346 or instruction <> 25516 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 940).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// REENTRY_CONTROL.agc:1194
//		DAS	MPAC		# ADD F2(DADV1-DADVR)
// slot 24347
                    if slot <> 24347 or instruction <> 8301 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 109) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 24348 {
// REENTRY_CONTROL.agc:1195
//		CA	MPAC
// slot 24348
                    if slot <> 24348 or instruction <> 12396 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 24349 {
// REENTRY_CONTROL.agc:1196
//		TS	PREDANG
// slot 24349
                        if slot <> 24349 or instruction <> 23544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23544, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// REENTRY_CONTROL.agc:1197
//					# L/D = LOD + (THETA- PREDANG)/ Y
// REENTRY_CONTROL.agc:1198
//		TC	INTPRET
// slot 24350
                        if slot <> 24350 or instruction <> 3078 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1416] to agcAotUnit1416@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1199
//
// REENTRY_CONTROL.agc:1200
//		SR3	DSU
// slot 24351
    24351, 38212,
// REENTRY_CONTROL.agc:1201
//			THETAH
// slot 24352
    24352, 3972,
// REENTRY_CONTROL.agc:1202
//		BON	BOFF
// slot 24353
    24353, 35864,
// REENTRY_CONTROL.agc:1203
//			GONEPAST
// slot 24354
    24354, 3466,
// REENTRY_CONTROL.agc:1204
//			GONEGLAD
// slot 24355
    24355, 44656,
// REENTRY_CONTROL.agc:1205
//			GONEBY
// slot 24356
    24356, 4046,
// REENTRY_CONTROL.agc:1206
//			HAVDNRNG
// slot 24357
    24357, 44630,
// REENTRY_CONTROL.agc:1207
//		DLOAD	SET		# SET GONEPAST IF GONEBY SET & LATCH IN-PLACE
// slot 24358
    24358, 36042,
// REENTRY_CONTROL.agc:1208
//			MAXRNG		# DISPLAY = 9999.9 IF GONEBY
// slot 24359
    24359, 12278,
// REENTRY_CONTROL.agc:1209
//			GONEPAST
// slot 24360
    24360, 3178,
// REENTRY_CONTROL.agc:1210
//		STCALL	DNRNGERR
// slot 24361
    24361, 32668,
// REENTRY_CONTROL.agc:1211
//			GONEGLAD
// slot 24362
    24362, 44656,
// REENTRY_CONTROL.agc:1212
//
// REENTRY_CONTROL.agc:1213
//HAVDNRNG	STORE	DNRNGERR	# = (PREDANG - THETA) /360
// slot 24363
    24363, 3996,
// REENTRY_CONTROL.agc:1214
//# Page 872
// REENTRY_CONTROL.agc:1215
//		DCOMP			# FALL SHORT IF NEG, OVERSHOOT IF POS
// slot 24364
    24364, 65404,
// REENTRY_CONTROL.agc:1216
//		BOVB	DDV
// slot 24365
    24365, 47368,
// REENTRY_CONTROL.agc:1217
//			TCDANZIG	# CLEAR OVFIND IF ON.
// slot 24366
    24366, 48596,
// REENTRY_CONTROL.agc:1218
//			FX		# FX= DRANGE/D L/D = Y
// slot 24367
    24367, 3926,
// REENTRY_CONTROL.agc:1219
//		SL	BOV
// slot 24368
    24368, 32866,
// REENTRY_CONTROL.agc:1220
//			5
// slot 24369
    24369, 16652,
// REENTRY_CONTROL.agc:1221
//			GOMAXL/D
// slot 24370
    24370, 44660,
// REENTRY_CONTROL.agc:1222
//		DAD	BOV
// slot 24371
    24371, 32794,
// REENTRY_CONTROL.agc:1223
//			LOD
// slot 24372
    24372, 3884,
// REENTRY_CONTROL.agc:1224
//			GOMAXL/D
// slot 24373
    24373, 44660,
// REENTRY_CONTROL.agc:1225
//		STCALL	L/D
// slot 24374
    24374, 32568,
// REENTRY_CONTROL.agc:1226
//			GLIMITER	# (GO TO)
// slot 24375
    24375, 44668,
// REENTRY_CONTROL.agc:1227
//
// REENTRY_CONTROL.agc:1228
//# GONEGLAD AND GOPOSMAX ENTRY POINTS FOR GLIMITER ...
// REENTRY_CONTROL.agc:1229
//
// REENTRY_CONTROL.agc:1230
//GONEGLAD	DLOAD			# SET L/D = -LAD
// slot 24376
    24376, 65482,
// REENTRY_CONTROL.agc:1231
//			GONEGLAD	# (ANY NEGATIVE NUMBER WILL DO)
// slot 24377
    24377, 11890,
// REENTRY_CONTROL.agc:1232
//
// REENTRY_CONTROL.agc:1233
//GOMAXL/D	RTB	DMP		# L/D = LAD SIGN(MPAC)
// slot 24378
    24378, 34104,
// REENTRY_CONTROL.agc:1234
//			SIGNMPAC
// slot 24379
    24379, 38804,
// REENTRY_CONTROL.agc:1235
//			LAD
// slot 24380
    24380, 3880,
// REENTRY_CONTROL.agc:1236
//		STORE	L/D		# AND FALL INTO GLIMITER SECTION
// slot 24381
    24381, 3896,
// REENTRY_CONTROL.agc:1237
//
// REENTRY_CONTROL.agc:1238
//GLIMITER	DLOAD	DSU		# IF GMAX/2-D POS, GO TO LIMITL/D
// slot 24382
    24382, 38346,
// REENTRY_CONTROL.agc:1239
//			GMAX/2
// slot 24383
    24383, 13538,
// REENTRY_CONTROL.agc:1240
//			D
// slot 24384
    24384, 3904,
// REENTRY_CONTROL.agc:1241
//		BPL	DAD		# IF GMAX  -D NEG, GO TO GOPOSLAD
// slot 24385
    24385, 36168,
// REENTRY_CONTROL.agc:1242
//			LIMITL/D
// slot 24386
    24386, 44716,
// REENTRY_CONTROL.agc:1243
//			GMAX/2
// slot 24387
    24387, 13538,
// REENTRY_CONTROL.agc:1244
//		BMN	DMP
// slot 24388
    24388, 34112,
// REENTRY_CONTROL.agc:1245
//			GOPOSLAD
// slot 24389
    24389, 44710,
// REENTRY_CONTROL.agc:1246
//			2HS
// slot 24390
    24390, 13670,
// REENTRY_CONTROL.agc:1247
//		PDDL	DMP		# 2HS(GMAX-D) INTO PD
// slot 24391
    24391, 34218,
// REENTRY_CONTROL.agc:1248
//			LEQ
// slot 24392
    24392, 3928,
// REENTRY_CONTROL.agc:1249
//			1/GMAX
// slot 24393
    24393, 13750,
// REENTRY_CONTROL.agc:1250
//		DAD	DMP
// slot 24394
    24394, 34074,
// REENTRY_CONTROL.agc:1251
//			LAD
// slot 24395
    24395, 3880,
// REENTRY_CONTROL.agc:1252
//		PDDL	DDV		# 2HS(GMAX-D) (LEQ/GMAX+LAD) INTO PD
// slot 24396
    24396, 47530,
// REENTRY_CONTROL.agc:1253
//			2HSGMXSQ
// slot 24397
    24397, 13674,
// REENTRY_CONTROL.agc:1254
//			VSQUARE
// slot 24398
    24398, 3876,
// REENTRY_CONTROL.agc:1255
//		DAD	SQRT		# XLIM = SQRT(PD+(2HSGMAX/V)SQ)
// slot 24399
    24399, 63002,
// REENTRY_CONTROL.agc:1256
//		DAD	BPL		# IF RDOT+XLIM POS, GO TO LIMITL/D
// slot 24400
    24400, 42010,
// REENTRY_CONTROL.agc:1257
//			RDOT
// slot 24401
    24401, 3968,
// REENTRY_CONTROL.agc:1258
//			LIMITL/D
// slot 24402
    24402, 44716,
// REENTRY_CONTROL.agc:1259
//
// REENTRY_CONTROL.agc:1260
//GOPOSLAD	DLOAD
// slot 24403
    24403, 65482,
// REENTRY_CONTROL.agc:1261
//			LAD
// slot 24404
    24404, 3880,
// REENTRY_CONTROL.agc:1262
//STOREL/D	STORE	L/D
// slot 24405
    24405, 3896,
// REENTRY_CONTROL.agc:1263
//
// REENTRY_CONTROL.agc:1264
//# Page 873
// REENTRY_CONTROL.agc:1265
//LIMITL/D	DLOAD
// slot 24406
    24406, 65482,
// REENTRY_CONTROL.agc:1266
//			L/D
// slot 24407
    24407, 3896,
// REENTRY_CONTROL.agc:1267
//		STODL	L/D1
// slot 24408
    24408, 16188,
// REENTRY_CONTROL.agc:1268
//			VSQUARE
// slot 24409
    24409, 3876,
// REENTRY_CONTROL.agc:1269
//
// REENTRY_CONTROL.agc:1270
//		BON			# NO LATERAL CONTROL IF PAST TARGET
// slot 24410
    24410, 65304,
// REENTRY_CONTROL.agc:1271
//			GONEPAST
// slot 24411
    24411, 3466,
// REENTRY_CONTROL.agc:1272
//			L355
// slot 24412
    24412, 44780,
// REENTRY_CONTROL.agc:1273
//		DMP	DAD		# Y= KLAT VSQUARE + LATBIAS
// slot 24413
    24413, 36106,
// REENTRY_CONTROL.agc:1274
//			KLAT
// slot 24414
    24414, 3892,
// REENTRY_CONTROL.agc:1275
//			LATBIAS		# Y INTO PD
// slot 24415
    24415, 13638,
// REENTRY_CONTROL.agc:1276
//L350		PDDL	ABS		# IF ABS(L/D)-L/DCMINR NEG, GO TO L353
// slot 24416
    24416, 42666,
// REENTRY_CONTROL.agc:1277
//			L/D
// slot 24417
    24417, 3896,
// REENTRY_CONTROL.agc:1278
//		DSU	BMN
// slot 24418
    24418, 41002,
// REENTRY_CONTROL.agc:1279
//			L/DCMINR
// slot 24419
    24419, 3888,
// REENTRY_CONTROL.agc:1280
//			L353
// slot 24420
    24420, 44758,
// REENTRY_CONTROL.agc:1281
//		DLOAD	SIGN		# IF K2ROLL LATANG NEG, GO TO L357
// slot 24421
    24421, 62922,
// REENTRY_CONTROL.agc:1282
//			LATANG
// slot 24422
    24422, 3964,
// REENTRY_CONTROL.agc:1283
//			K2ROLL
// slot 24423
    24423, 3912,
// REENTRY_CONTROL.agc:1284
//		BMN	DLOAD
// slot 24424
    24424, 58688,
// REENTRY_CONTROL.agc:1285
//			L357
// slot 24425
    24425, 44852,
// REENTRY_CONTROL.agc:1286
//		SR1	PUSH		# Y = Y/2
// slot 24426
    24426, 34500,
// REENTRY_CONTROL.agc:1287
//L353		DLOAD	SIGN		# IF LATANG SIGN(K2ROLL)-Y POS, SWITCH
// slot 24427
    24427, 62922,
// REENTRY_CONTROL.agc:1288
//			LATANG
// slot 24428
    24428, 3964,
// REENTRY_CONTROL.agc:1289
//			K2ROLL
// slot 24429
    24429, 3912,
// REENTRY_CONTROL.agc:1290
//		DSU
// slot 24430
    24430, 65322,
// REENTRY_CONTROL.agc:1291
//		BMN	DLOAD
// slot 24431
    24431, 58688,
// REENTRY_CONTROL.agc:1292
//			L355
// slot 24432
    24432, 44780,
// REENTRY_CONTROL.agc:1293
//			K2ROLL
// slot 24433
    24433, 3912,
// REENTRY_CONTROL.agc:1294
//		BONCLR	DCOMP		# IF NOSWITCH =1, K2ROLL= K2ROLL
// slot 24434
    24434, 48664,
// REENTRY_CONTROL.agc:1295
//			NOSWITCH
// slot 24435
    24435, 3344,
// REENTRY_CONTROL.agc:1296
//			L355
// slot 24436
    24436, 44780,
// REENTRY_CONTROL.agc:1297
//		STORE	K2ROLL		# K2ROLL = -K2ROLL
// slot 24437
    24437, 3912,
// REENTRY_CONTROL.agc:1298
//
// REENTRY_CONTROL.agc:1299
//L355		DLOAD	DDV		# ROLLC = ACOS( (L/D1) / LAD)
// slot 24438
    24438, 47562,
// REENTRY_CONTROL.agc:1300
//			L/D1
// slot 24439
    24439, 3900,
// REENTRY_CONTROL.agc:1301
//			LAD		# MPAC SET TO +-1 IF OVERFLOW***
// slot 24440
    24440, 3880,
// REENTRY_CONTROL.agc:1302
//		SR1	ACOS
// slot 24441
    24441, 54980,
// REENTRY_CONTROL.agc:1303
//		SIGN	CLEAR
// slot 24442
    24442, 36074,
// REENTRY_CONTROL.agc:1304
//			K2ROLL
// slot 24443
    24443, 3912,
// REENTRY_CONTROL.agc:1305
//			NOSWITCH
// slot 24444
    24444, 3440,
// REENTRY_CONTROL.agc:1306
//		STORE	ROLLC
// slot 24445
    24445, 3484,
// REENTRY_CONTROL.agc:1307
//
// REENTRY_CONTROL.agc:1308
//ENDEXIT		EXIT
// slot 24446
    24446, 65532
)).

// bank 25, slots 24447-24452
function agcAotUnit1417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24449 {
        if slot <= 24447 {
// REENTRY_CONTROL.agc:1309
//
// REENTRY_CONTROL.agc:1310
//OVERNOUT	CA	BIT13		# ENTRYDSP =92D B13
// slot 24447
            if slot <> 24447 or instruction <> 14851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24448 {
// REENTRY_CONTROL.agc:1311
//		MASK	CM/FLAGS
// slot 24448
                if slot <> 24448 or instruction <> 28738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1312
//		EXTEND
// slot 24449
                if slot <> 24449 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 24450 {
// REENTRY_CONTROL.agc:1313
//		BZF	NODISKY		# OMIT DISPLAY.
// slot 24450
            if slot <> 24450 or instruction <> 6022 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6022, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 24451 {
// REENTRY_CONTROL.agc:1314
//# Page 874
// REENTRY_CONTROL.agc:1315
//		CA	ENTRYVN		# ALL ENTRY DISPLAYS ARE DONE HERE.
// slot 24451
                if slot <> 24451 or instruction <> 12979 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 691).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// REENTRY_CONTROL.agc:1316
//		TC	BANKCALL
// slot 24452
                if slot <> 24452 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1417] to agcAotUnit1417@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1317
//		CADR	REGODSPR	# NO ABORT IF DISKY IN USE
// slot 24453
    24453, 17300
)).

// bank 25, slots 24454-24457
function agcAotUnit1418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24455 {
        if slot <= 24454 {
// REENTRY_CONTROL.agc:1318
//
// REENTRY_CONTROL.agc:1319
//NODISKY		INHINT
// slot 24454
            if slot <> 24454 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1320
//		CCS	NEWJOB		# PROTECT READACCS GRP 5, IF SIDETRACKED.
// slot 24455
            if slot <> 24455 or instruction <> 4151 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 55).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24456 {
// REENTRY_CONTROL.agc:1321
//		TC	CHANG1
// slot 24456
            if slot <> 24456 or instruction <> 2676 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2676, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1322
//SERVNOUT	TC	POSTJUMP	# ( COME HERE FROM P67.3 )
// slot 24457
            if slot <> 24457 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1418] to agcAotUnit1418@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1323
//		CADR	SERVEXIT	# AND END AVERAGEG JOB VIA  ENDOFJOB.
// slot 24458
    24458, 64814,
// REENTRY_CONTROL.agc:1324
//
// REENTRY_CONTROL.agc:1325
//# Page 875
// REENTRY_CONTROL.agc:1326
//# DISPLAY WHEN V IS LESS THAN VQUIT.
// REENTRY_CONTROL.agc:1327
//
// REENTRY_CONTROL.agc:1328
//STEEROFF	EXIT
// slot 24459
    24459, 65532
)).

// bank 25, slots 24460-24463
function agcAotUnit1419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24461 {
        if slot <= 24460 {
// REENTRY_CONTROL.agc:1329
//		CA	EBENTRY		# PRECAUTIONARY.
// slot 24460
            if slot <> 24460 or instruction <> 14896 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1330
//		TS	EBANK
// slot 24461
            if slot <> 24461 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 24462 {
// REENTRY_CONTROL.agc:1331
//
// REENTRY_CONTROL.agc:1332
//		CA	PRIO16		# 2 LESS THAN NTRYPRIO.
// slot 24462
            if slot <> 24462 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1333
//		TC	NOVAC
// slot 24463
            if slot <> 24463 or instruction <> 2652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1419] to agcAotUnit1419@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1334
//		EBANK=	AOG		# ANY EB HERE
// REENTRY_CONTROL.agc:1335
//		2CADR	P67.1		# START UP REMAINDER OF P67
// slot 24464 24465
    24464, 2708, 24465, 45164
)).

// bank 25, slots 24466-24466
function agcAotUnit1420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// REENTRY_CONTROL.agc:1336
//
// REENTRY_CONTROL.agc:1337
//					# RTOGO		LAT		LONG
// REENTRY_CONTROL.agc:1338
//					# XXXX.X NM	XXX.XX DEG	XXX.XX DEG
// REENTRY_CONTROL.agc:1339
//
// REENTRY_CONTROL.agc:1340
//		TC	2PHSCHNG	# INHINT/RELINT DONE.
// slot 24466
    if slot <> 24466 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1420] to agcAotUnit1420@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1341
//		OCT	00414		# 4.41 RESTART FOR P67.1 DISPLAY JOB.
// slot 24467
    24467, 536,
// REENTRY_CONTROL.agc:1342
//		OCT	10035		# SERVICER 5.3 RESTART.
// slot 24468
    24468, 8250
)).

// bank 25, slots 24469-24471
function agcAotUnit1421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 24469 {
// REENTRY_CONTROL.agc:1343
//
// REENTRY_CONTROL.agc:1344
//		CA	P67.2CAD	# HEREAFTER, DO LAT, LONG.
// slot 24469
        if slot <> 24469 or instruction <> 14233 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1945), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 24470 {
// REENTRY_CONTROL.agc:1345
//		TS	GOTOADDR
// slot 24470
            if slot <> 24470 or instruction <> 23461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// REENTRY_CONTROL.agc:1346
//
// REENTRY_CONTROL.agc:1347
//		TC	INTPRET
// slot 24471
            if slot <> 24471 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1421] to agcAotUnit1421@.

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1348
//		GOTO
// slot 24472
    24472, 65360,
// REENTRY_CONTROL.agc:1349
//P67.2CAD		P67.2		# CONTINUE FOR LAT, LONG THIS TIME.
// slot 24473
    24473, 45746,
// REENTRY_CONTROL.agc:1350
//
// REENTRY_CONTROL.agc:1351
//L357		DLOAD	SIGN		# L/D = L/DCMINR SIGN(L/D)
// slot 24474
    24474, 62922,
// REENTRY_CONTROL.agc:1352
//			L/DCMINR
// slot 24475
    24475, 3888,
// REENTRY_CONTROL.agc:1353
//			L/D
// slot 24476
    24476, 3896,
// REENTRY_CONTROL.agc:1354
//		STCALL	L/D1
// slot 24477
    24477, 32572,
// REENTRY_CONTROL.agc:1355
//			L355		# (GO TO)
// slot 24478
    24478, 44780,
// REENTRY_CONTROL.agc:1356
//
// REENTRY_CONTROL.agc:1357
//# Page 876
// REENTRY_CONTROL.agc:1358
//# TABLE USED FOR SUB-ORBITAL REFERENCE TRAJECTORY CONTROL.
// REENTRY_CONTROL.agc:1359
//
// REENTRY_CONTROL.agc:1360
//VREFER		DEC	.019288		# REFERENCE VELOCITY SCALED V/51532.3946
// slot 24479
    24479, 632,
// REENTRY_CONTROL.agc:1361
//		DEC	.040809		# 13 POINTS ARE STORED AS THE INDEPENDENT
// slot 24480
    24480, 1338,
// REENTRY_CONTROL.agc:1362
//		DEC	.076107		# VARIABLE AND THEN SIX 13 POINT FUNCTIONS
// slot 24481
    24481, 2494,
// REENTRY_CONTROL.agc:1363
//		DEC	.122156		# OF V ARE STORED CONSECUTIVELY
// slot 24482
    24482, 4002,
// REENTRY_CONTROL.agc:1364
//		DEC	.165546
// slot 24483
    24483, 5424,
// REENTRY_CONTROL.agc:1365
//		DEC	.196012
// slot 24484
    24484, 6422,
// REENTRY_CONTROL.agc:1366
//		DEC	.271945
// slot 24485
    24485, 8912,
// REENTRY_CONTROL.agc:1367
//		DEC	.309533
// slot 24486
    24486, 10142,
// REENTRY_CONTROL.agc:1368
//		DEC	.356222
// slot 24487
    24487, 11672,
// REENTRY_CONTROL.agc:1369
//		DEC	.404192
// slot 24488
    24488, 13244,
// REENTRY_CONTROL.agc:1370
//		DEC	.448067
// slot 24489
    24489, 14682,
// REENTRY_CONTROL.agc:1371
//		DEC	.456023
// slot 24490
    24490, 14942,
// REENTRY_CONTROL.agc:1372
//		DEC	.67918		# HIGHVELOCITY FOR SAFETY.
// slot 24491
    24491, 22256,
// REENTRY_CONTROL.agc:1373
//
// REENTRY_CONTROL.agc:1374
//		DEC	-.010337	# DRANGE/DA	SCALED DRDA/(2700/805)
// slot 24492
    24492, 65196,
// REENTRY_CONTROL.agc:1375
//		DEC	-.016550
// slot 24493
    24493, 64992,
// REENTRY_CONTROL.agc:1376
//		DEC	-.026935
// slot 24494
    24494, 64652,
// REENTRY_CONTROL.agc:1377
//		DEC	-.042039
// slot 24495
    24495, 64156,
// REENTRY_CONTROL.agc:1378
//		DEC	-.058974
// slot 24496
    24496, 63602,
// REENTRY_CONTROL.agc:1379
//		DEC	-.070721
// slot 24497
    24497, 63216,
// REENTRY_CONTROL.agc:1380
//		DEC	-.098538
// slot 24498
    24498, 62306,
// REENTRY_CONTROL.agc:1381
//		DEC	-.107482
// slot 24499
    24499, 62012,
// REENTRY_CONTROL.agc:1382
//		DEC	-.147762
// slot 24500
    24500, 60692,
// REENTRY_CONTROL.agc:1383
//		DEC	-.193289
// slot 24501
    24501, 59200,
// REENTRY_CONTROL.agc:1384
//		DEC	-.602557
// slot 24502
    24502, 45790,
// REENTRY_CONTROL.agc:1385
//		DEC	-.99999
// slot 24503
    24503, 32768,
// REENTRY_CONTROL.agc:1386
//		DEC	-.99999
// slot 24504
    24504, 32768,
// REENTRY_CONTROL.agc:1387
//
// REENTRY_CONTROL.agc:1388
//		DEC	-.0478599 B-3	# -DRANGE/DRDOT
// slot 24505
    24505, 65338,
// REENTRY_CONTROL.agc:1389
//		DEC	-.0683663 B-3	# SCALED ((2VS/8 2700) DR/DRDOT)
// slot 24506
    24506, 65254,
// REENTRY_CONTROL.agc:1390
//		DEC	-.1343468 B-3
// slot 24507
    24507, 64984,
// REENTRY_CONTROL.agc:1391
//		DEC	-.2759846 B-3
// slot 24508
    24508, 64404,
// REENTRY_CONTROL.agc:1392
//		DEC	-.4731437 B-3
// slot 24509
    24509, 63596,
// REENTRY_CONTROL.agc:1393
//		DEC	-.6472087 B-3
// slot 24510
    24510, 62884,
// REENTRY_CONTROL.agc:1394
//		DEC	-1.171693 B-3
// slot 24511
    24511, 60734,
// REENTRY_CONTROL.agc:1395
//		DEC	-1.466382 B-3
// slot 24512
    24512, 59528,
// REENTRY_CONTROL.agc:1396
//		DEC	-1.905171 B-3
// slot 24513
    24513, 57730,
// REENTRY_CONTROL.agc:1397
//		DEC	-2.547990 B-3
// slot 24514
    24514, 55098,
// REENTRY_CONTROL.agc:1398
//		DEC	-4.151220 B-3
// slot 24515
    24515, 48530,
// REENTRY_CONTROL.agc:1399
//		DEC	-5.813617 B-3
// slot 24516
    24516, 41722,
// REENTRY_CONTROL.agc:1400
//		DEC	-5.813617 B-3
// slot 24517
    24517, 41722,
// REENTRY_CONTROL.agc:1401
//
// REENTRY_CONTROL.agc:1402
//# Page 877
// REENTRY_CONTROL.agc:1403
//		DEC	-.0134001  B3	# RDOTREF	SCALED (8 RDT/2VS)
// slot 24518
    24518, 62022,
// REENTRY_CONTROL.agc:1404
//		DEC	-.013947   B3
// slot 24519
    24519, 61878,
// REENTRY_CONTROL.agc:1405
//		DEC	-.013462   B3
// slot 24520
    24520, 62006,
// REENTRY_CONTROL.agc:1406
//		DEC	-.011813   B3
// slot 24521
    24521, 62438,
// REENTRY_CONTROL.agc:1407
//		DEC	-.0095631  B3
// slot 24522
    24522, 63028,
// REENTRY_CONTROL.agc:1408
//		DEC	-.00806946 B3
// slot 24523
    24523, 63418,
// REENTRY_CONTROL.agc:1409
//		DEC	-.006828   B3
// slot 24524
    24524, 63744,
// REENTRY_CONTROL.agc:1410
//		DEC	-.00806946 B3
// slot 24525
    24525, 63418,
// REENTRY_CONTROL.agc:1411
//		DEC	-.0109791  B3
// slot 24526
    24526, 62656,
// REENTRY_CONTROL.agc:1412
//		DEC	-.0151498  B3
// slot 24527
    24527, 61562,
// REENTRY_CONTROL.agc:1413
//		DEC	-.0179817  B3
// slot 24528
    24528, 60820,
// REENTRY_CONTROL.agc:1414
//		DEC	-.0159061  B3
// slot 24529
    24529, 61364,
// REENTRY_CONTROL.agc:1415
//		DEC	-.0159061  B3
// slot 24530
    24530, 61364,
// REENTRY_CONTROL.agc:1416
//
// REENTRY_CONTROL.agc:1417
//		DEC	.0008067	# RANGE TO GO SCALED RTOGO/2700
// slot 24531
    24531, 26,
// REENTRY_CONTROL.agc:1418
//		DEC	.0032963	#	8.9
// slot 24532
    24532, 108,
// REENTRY_CONTROL.agc:1419
//		DEC	.0081852	#	22.1
// slot 24533
    24533, 268,
// REENTRY_CONTROL.agc:1420
//		DEC	.017148
// slot 24534
    24534, 562,
// REENTRY_CONTROL.agc:1421
//		DEC	.027926
// slot 24535
    24535, 916,
// REENTRY_CONTROL.agc:1422
//		DEC	.037
// slot 24536
    24536, 1212,
// REENTRY_CONTROL.agc:1423
//		DEC	.063296
// slot 24537
    24537, 2074,
// REENTRY_CONTROL.agc:1424
//		DEC	.077889
// slot 24538
    24538, 2552,
// REENTRY_CONTROL.agc:1425
//		DEC	.098815
// slot 24539
    24539, 3238,
// REENTRY_CONTROL.agc:1426
//		DEC	.127519
// slot 24540
    24540, 4178,
// REENTRY_CONTROL.agc:1427
//		DEC	.186963
// slot 24541
    24541, 6126,
// REENTRY_CONTROL.agc:1428
//		DEC	.238148
// slot 24542
    24542, 7804,
// REENTRY_CONTROL.agc:1429
//		DEC	.294185185
// slot 24543
    24543, 9640,
// REENTRY_CONTROL.agc:1430
//
// REENTRY_CONTROL.agc:1431
//		DEC	-.051099	# -AREF/805
// slot 24544
    24544, 63860,
// REENTRY_CONTROL.agc:1432
//		DEC	-.074534
// slot 24545
    24545, 63092,
// REENTRY_CONTROL.agc:1433
//		DEC	-.101242
// slot 24546
    24546, 62216,
// REENTRY_CONTROL.agc:1434
//		DEC	-.116646
// slot 24547
    24547, 61712,
// REENTRY_CONTROL.agc:1435
//		DEC	-.122360
// slot 24548
    24548, 61524,
// REENTRY_CONTROL.agc:1436
//		DEC	-.127081
// slot 24549
    24549, 61370,
// REENTRY_CONTROL.agc:1437
//		DEC	-.147453
// slot 24550
    24550, 60702,
// REENTRY_CONTROL.agc:1438
//		DEC	-.155528
// slot 24551
    24551, 60438,
// REENTRY_CONTROL.agc:1439
//		DEC	-.149565
// slot 24552
    24552, 60634,
// REENTRY_CONTROL.agc:1440
//		DEC	-.118509
// slot 24553
    24553, 61650,
// REENTRY_CONTROL.agc:1441
//		DEC	-.034907
// slot 24554
    24554, 64390,
// REENTRY_CONTROL.agc:1442
//		DEC	-.007950
// slot 24555
    24555, 65274,
// REENTRY_CONTROL.agc:1443
//		DEC	-.007950
// slot 24556
    24556, 65274,
// REENTRY_CONTROL.agc:1444
//
// REENTRY_CONTROL.agc:1445
//# Page 878
// REENTRY_CONTROL.agc:1446
//		DEC	.004491		# DRANGE/D L/D SCALED Y/2700
// slot 24557
    24557, 148,
// REENTRY_CONTROL.agc:1447
//		DEC	.008081
// slot 24558
    24558, 264,
// REENTRY_CONTROL.agc:1448
//		DEC	.016030
// slot 24559
    24559, 526,
// REENTRY_CONTROL.agc:1449
//		DEC	.035815
// slot 24560
    24560, 1174,
// REENTRY_CONTROL.agc:1450
//		DEC	.069422
// slot 24561
    24561, 2274,
// REENTRY_CONTROL.agc:1451
//		DEC	.104519
// slot 24562
    24562, 3424,
// REENTRY_CONTROL.agc:1452
//		DEC	.122
// slot 24563
    24563, 3998,
// REENTRY_CONTROL.agc:1453
//		DEC	.172407
// slot 24564
    24564, 5650,
// REENTRY_CONTROL.agc:1454
//		DEC	.252852
// slot 24565
    24565, 8286,
// REENTRY_CONTROL.agc:1455
//		DEC	.363148
// slot 24566
    24566, 11900,
// REENTRY_CONTROL.agc:1456
//		DEC	.512963
// slot 24567
    24567, 16808,
// REENTRY_CONTROL.agc:1457
//		DEC	.558519
// slot 24568
    24568, 18302,
// REENTRY_CONTROL.agc:1458
//		DEC	.558519		# END OF STORED REFERENCE
// slot 24569
    24569, 18302,
// REENTRY_CONTROL.agc:1459
//
// REENTRY_CONTROL.agc:1460
//# Page 879
// REENTRY_CONTROL.agc:1461
//# REENTRY CONSTANTS.
// REENTRY_CONTROL.agc:1462
//
// REENTRY_CONTROL.agc:1463
//# DEFINED BY EQUALS
// REENTRY_CONTROL.agc:1464
//
// REENTRY_CONTROL.agc:1465
//DEC15		=	LOW4
// REENTRY_CONTROL.agc:1466
//#GAMMAL1	=	22D
// REENTRY_CONTROL.agc:1467
//
// REENTRY_CONTROL.agc:1468
//MAXRNG		2OCT	1663106755	# DNRNGERR = 9999.9 IF GONEPAST=1
// slot 24570 24571
    24570, 15154, 24571, 7130,
// REENTRY_CONTROL.agc:1469
//
// REENTRY_CONTROL.agc:1470
//		BANK	26
// REENTRY_CONTROL.agc:1471
//		SETLOC	REENTRY1
// REENTRY_CONTROL.agc:1472
//		BANK
// REENTRY_CONTROL.agc:1473
//
// REENTRY_CONTROL.agc:1474
//		COUNT*	$$/ENTRY
// REENTRY_CONTROL.agc:1475
//
// REENTRY_CONTROL.agc:1476
//BARELY1		=	NEARONE		# COMMON TO BOTH DISK,DANCE.DEFND IN TFF
// REENTRY_CONTROL.agc:1477
//#1BITDP					# COMMON TO BOTH DISK AND DANCE. DEFND IN VECPOINT.
// REENTRY_CONTROL.agc:1478
//
// REENTRY_CONTROL.agc:1479
//1/12TH		DEC	.083333		# DP 1/12 USES HI WORD IN 1/3 BELOW
// slot 25189
    25189, 2730
)).

agcAotInstallSourceRope(list(
// REENTRY_CONTROL.agc:1480
//1/3RD		2DEC	.3333333333	# DP 1/3
// slot 25190 25191
    25190, 10922, 25191, 10922,
// REENTRY_CONTROL.agc:1481
//
// REENTRY_CONTROL.agc:1482
//1/16TH		=	DP2(-4)
// REENTRY_CONTROL.agc:1483
//
// REENTRY_CONTROL.agc:1484
//# BELOW:  VS = VSAT = 25766.1973 FT/SEC
// REENTRY_CONTROL.agc:1485
//
// REENTRY_CONTROL.agc:1486
//#	  RE = 21,202,900 FEET
// REENTRY_CONTROL.agc:1487
//
// REENTRY_CONTROL.agc:1488
//LEWD1		2DEC	.15
// slot 25192 25193
    25192, 4914, 25193, 19660,
// REENTRY_CONTROL.agc:1489
//
// REENTRY_CONTROL.agc:1490
//POINT1		2DEC	.1
// slot 25194 25195
    25194, 3276, 25195, 13108,
// REENTRY_CONTROL.agc:1491
//
// REENTRY_CONTROL.agc:1492
//POINT2		2DEC	.2		# .2
// slot 25196 25197
    25196, 6552, 25197, 26214,
// REENTRY_CONTROL.agc:1493
//
// REENTRY_CONTROL.agc:1494
//DLEWD0		2DEC	-.05		# -.05
// slot 25198 25199
    25198, 63896, 25199, 58980,
// REENTRY_CONTROL.agc:1495
//
// REENTRY_CONTROL.agc:1496
//GMAX/2		2DEC	.16		# 8 GS / 2
// slot 25200 25201
    25200, 5242, 25201, 14418,
// REENTRY_CONTROL.agc:1497
//
// REENTRY_CONTROL.agc:1498
//3ZEROS		EQUALS	HI6ZEROS
// REENTRY_CONTROL.agc:1499
//NEAR1/4		2OCT	0777700000	# 1/4 LESS 1 BIT IN UPPER PART.
// slot 25202 25203
    25202, 8190, 25203, 0,
// REENTRY_CONTROL.agc:1500
//
// REENTRY_CONTROL.agc:1501
//C18		2DEC	.0097026346	# 500/2VS
// slot 25204 25205
    25204, 316, 25205, 31718,
// REENTRY_CONTROL.agc:1502
//
// REENTRY_CONTROL.agc:1503
//Q7FKDMIN	2DEC	.0080745342	# 6.5/805  (Q7F +KDMIN) = 6 + .5)
// slot 25206 25207
    25206, 264, 25207, 9606,
// REENTRY_CONTROL.agc:1504
//
// REENTRY_CONTROL.agc:1505
//C1/16		=	DP2(-4)
// REENTRY_CONTROL.agc:1506
//
// REENTRY_CONTROL.agc:1507
//Q3		2DEC	.167003132	# .07 2VS/21600
// slot 25208 25209
    25208, 5472, 25209, 5876,
// REENTRY_CONTROL.agc:1508
//# Page 880
// REENTRY_CONTROL.agc:1509
//Q5		2DEC	.326388889	# .3 23500/21600
// slot 25210 25211
    25210, 10694, 25211, 18204,
// REENTRY_CONTROL.agc:1510
//
// REENTRY_CONTROL.agc:1511
//Q6		2DEC	.0349		# 2 DEG. APPROX 820/23500
// slot 25212 25213
    25212, 1142, 25213, 26266,
// REENTRY_CONTROL.agc:1512
//
// REENTRY_CONTROL.agc:1513
//Q7F		2DEC	.0074534161	# 6/805  (VALUE OF Q7 IN FIXED MEM.)
// slot 25214 25215
    25214, 244, 25215, 3826,
// REENTRY_CONTROL.agc:1514
//
// REENTRY_CONTROL.agc:1515
//Q19		=	HALVE		# Q19 = .5
// REENTRY_CONTROL.agc:1516
//
// REENTRY_CONTROL.agc:1517
//Q21		2DEC	.0231481481	# 500/21600
// slot 25216 25217
    25216, 758, 25217, 8496,
// REENTRY_CONTROL.agc:1518
//
// REENTRY_CONTROL.agc:1519
//Q22		2DEC	-.053333333	# -1152/21600
// slot 25218 25219
    25218, 63788, 25219, 38882,
// REENTRY_CONTROL.agc:1520
//
// REENTRY_CONTROL.agc:1521
//VLMIN		2DEC	.34929485	# 18000/2 VS
// slot 25220 25221
    25220, 11444, 25221, 27748,
// REENTRY_CONTROL.agc:1522
//
// REENTRY_CONTROL.agc:1523
//VMIN		=	FOURTH		# (VS/2) / 2VS
// REENTRY_CONTROL.agc:1524
//C12		2DEC	.00684572901	# 32 28500/(21202900 2 PI)
// slot 25222 25223
    25222, 224, 25223, 5256,
// REENTRY_CONTROL.agc:1525
//
// REENTRY_CONTROL.agc:1526
//1/KB1		2DEC	.29411765	# 1 / 3.4
// slot 25224 25225
    25224, 9636, 25225, 26986,
// REENTRY_CONTROL.agc:1527
//
// REENTRY_CONTROL.agc:1528
//-1/KB2		2DEC	-.0057074322 B4	# = -1/(.0034 2 VS) EXP +4
// slot 25226 25227
    25226, 62542, 25227, 59992,
// REENTRY_CONTROL.agc:1529
//
// REENTRY_CONTROL.agc:1530
//VQUIT		2DEC	.019405269	# 1000 /2VS
// slot 25228 25229
    25228, 634, 25229, 30668,
// REENTRY_CONTROL.agc:1531
//
// REENTRY_CONTROL.agc:1532
//C20		2DEC	.21739130	# (175 FPSS) LIFT UP IF ABOVE C20
// slot 25230 25231
    25230, 7122, 25231, 24218,
// REENTRY_CONTROL.agc:1533
//
// REENTRY_CONTROL.agc:1534
//C21		2DEC	.17391304	# 140/805
// slot 25232 25233
    25232, 5698, 25233, 12820,
// REENTRY_CONTROL.agc:1535
//
// REENTRY_CONTROL.agc:1536
//25NM		2DEC	.0011574074	# 25/21600	(25 NAUT MILES)
// slot 25234 25235
    25234, 36, 25235, 31554,
// REENTRY_CONTROL.agc:1537
//
// REENTRY_CONTROL.agc:1538
//K1D		2DEC	.0314453125	# =C16 805/256 = .01 805/256
// slot 25236 25237
    25236, 1030, 25237, 6554,
// REENTRY_CONTROL.agc:1539
//
// REENTRY_CONTROL.agc:1540
//K2D		2DEC	-.201298418	# -C17 2VS/256 = -.001 2VS/256
// slot 25238 25239
    25238, 58938, 25239, 63132,
// REENTRY_CONTROL.agc:1541
//
// REENTRY_CONTROL.agc:1542
//KVSCALE		2DEC	.81491944	# 12800/(2 VS .3048)
// slot 25240 25241
    25240, 26702, 25241, 20974,
// REENTRY_CONTROL.agc:1543
//
// REENTRY_CONTROL.agc:1544
//KASCALE		2DEC	.97657358	# 5.85 16384/(4 .3048 100 805)
// slot 25242 25243
    25242, 32000, 25243, 5948,
// REENTRY_CONTROL.agc:1545
//
// REENTRY_CONTROL.agc:1546
//KTETA		2DEC*	.383495203 E2 B-14* # 1000 2PI/16384(163.84)
// slot 25244 25245
    25244, 76, 25245, 11454,
// REENTRY_CONTROL.agc:1547
//
// REENTRY_CONTROL.agc:1548
//KT1		2DEC*	.157788327 E 2 B-14* # RE(2PI)/2 VS(16384) 163.84
// slot 25246 25247
    25246, 30, 25247, 25520,
// REENTRY_CONTROL.agc:1549
//
// REENTRY_CONTROL.agc:1550
//.05G		2DEC	.002		# .05/25
// slot 25248 25249
    25248, 64, 25249, 25166,
// REENTRY_CONTROL.agc:1551
//
// REENTRY_CONTROL.agc:1552
//LATBIAS		2DEC	.00003		# APPRX .5 NM/ 4(21600/2 PI)
// slot 25250 25251
    25250, 0, 25251, 16106,
// REENTRY_CONTROL.agc:1553
//
// REENTRY_CONTROL.agc:1554
//KWE		2DEC	.120056652 B-1
// slot 25252 25253
    25252, 1966, 25253, 16518,
// REENTRY_CONTROL.agc:1555
//
// REENTRY_CONTROL.agc:1556
//KACOS		2DEC	.004973592	# 1/32(2PI)
// slot 25254 25255
    25254, 162, 25255, 15968,
// REENTRY_CONTROL.agc:1557
//
// REENTRY_CONTROL.agc:1558
//CHOOK		2DEC	1 B-6		# .25/16
// slot 25256 25257
    25256, 512, 25257, 0,
// REENTRY_CONTROL.agc:1559
//# Page 881
// REENTRY_CONTROL.agc:1560
//1/24TH		2DEC	.0833333333 B-1
// slot 25258 25259
    25258, 1364, 25259, 21846,
// REENTRY_CONTROL.agc:1561
//
// REENTRY_CONTROL.agc:1562
//CH1		2DEC	.32 B1		# 16 CH1/25 = 16 (1) /25
// slot 25260 25261
    25260, 20970, 25261, 24904,
// REENTRY_CONTROL.agc:1563
//
// REENTRY_CONTROL.agc:1564
//KC3		2DEC	-.0247622232	# -(4 VS VS/ 2 PI 805 RE)
// slot 25262 25263
    25262, 64724, 25263, 42456,
// REENTRY_CONTROL.agc:1565
//
// REENTRY_CONTROL.agc:1566
//VRCONT		2DEC	.0135836886	# 700/2 VSAT
// slot 25264 25265
    25264, 444, 25265, 18192,
// REENTRY_CONTROL.agc:1567
//
// REENTRY_CONTROL.agc:1568
//HALVE		EQUALS	HIDPHALF
// REENTRY_CONTROL.agc:1569
//FOURTH		EQUALS	HIDP1/4
// REENTRY_CONTROL.agc:1570
//
// REENTRY_CONTROL.agc:1571
//1/GMAX		EQUALS	HALVE		# 4/GMAX = 4 / 8
// REENTRY_CONTROL.agc:1572
//2HS		2DEC	.0172786611	# 2 28500 25 32.2/(4 VS VS)
// slot 25266 25267
    25266, 566, 25267, 3066,
// REENTRY_CONTROL.agc:1573
//
// REENTRY_CONTROL.agc:1574
//2HSGMXSQ	2DEC	.0000305717	# (2 28500 8 32.2/ 4 VS VS)SQ
// slot 25268 25269
    25268, 0, 25269, 16414,
// REENTRY_CONTROL.agc:1575
//
// REENTRY_CONTROL.agc:1576
//C001		2DEC	-.000625	# -(4/25)/256	LEQ/D0 CONST
// slot 25270 25271
    25270, 65514, 25271, 57670,
// REENTRY_CONTROL.agc:1577
//
// REENTRY_CONTROL.agc:1578
//POINT8		2DEC	.8
// slot 25272 25273
    25272, 26214, 25273, 6554,
// REENTRY_CONTROL.agc:1579
//
// REENTRY_CONTROL.agc:1580
//2C1HS		2DEC	.0215983264	# 2 1.25 28500 805/(2 VS)SQ
// slot 25274 25275
    25274, 706, 25275, 28410,
// REENTRY_CONTROL.agc:1581
//
// REENTRY_CONTROL.agc:1582
//PT1/16		2DEC	.1 B-4
// slot 25276 25277
    25276, 204, 25277, 13108,
// REENTRY_CONTROL.agc:1583
//
// REENTRY_CONTROL.agc:1584
//1/K44		2DEC	.00260929464	# 2 VS/19749550
// slot 25278 25279
    25278, 84, 25279, 24598,
// REENTRY_CONTROL.agc:1585
//
// REENTRY_CONTROL.agc:1586
//VFINAL		2DEC	.51618016	# 26600/2 VS
// slot 25280 25281
    25280, 16914, 25281, 3138,
// REENTRY_CONTROL.agc:1587
//
// REENTRY_CONTROL.agc:1588
//VFINAL1		2DEC	.523942273	# = 27000 / 2 VS
// slot 25282 25283
    25282, 17168, 25283, 8854,
// REENTRY_CONTROL.agc:1589
//
// REENTRY_CONTROL.agc:1590
//1/KA1		2DEC	.30048077	# 25/(1.3 64)
// slot 25284 25285
    25284, 9846, 25285, 2522,
// REENTRY_CONTROL.agc:1591
//
// REENTRY_CONTROL.agc:1592
//KA2		2DEC	.008		# .2/25
// slot 25286 25287
    25286, 262, 25287, 2360,
// REENTRY_CONTROL.agc:1593
//
// REENTRY_CONTROL.agc:1594
//KA3		2DEC	.44720497	# = 90 4/805
// slot 25288 25289
    25288, 14654, 25289, 204,
// REENTRY_CONTROL.agc:1595
//
// REENTRY_CONTROL.agc:1596
//KA4		2DEC	.049689441	# 40/805
// slot 25290 25291
    25290, 1628, 25291, 3664,
// REENTRY_CONTROL.agc:1597
//
// REENTRY_CONTROL.agc:1598
//KALIM		2DEC	.06		# 1.5/25
// slot 25292 25293
    25292, 1966, 25293, 1310,
// REENTRY_CONTROL.agc:1599
//
// REENTRY_CONTROL.agc:1600
//Q7MIN		=	KA4		# = 40/805 = .049689441
// REENTRY_CONTROL.agc:1601
//-HSCALED	2DEC	-.55305018	# -28500/2 VS
// slot 25294 25295
    25294, 47412, 25295, 59828,
// REENTRY_CONTROL.agc:1602
//
// REENTRY_CONTROL.agc:1603
//-KSCALE		2DEC	-.0312424837	# -805/VS
// slot 25296 25297
    25296, 64512, 25297, 36802,
// REENTRY_CONTROL.agc:1604
//
// REENTRY_CONTROL.agc:1605
//COS15		2DEC	.965
// slot 25298 25299
    25298, 31620, 25299, 18350
)).

// no code for the lines below
// REENTRY_CONTROL.agc:1606
//
// REENTRY_CONTROL.agc:1607
//LATSLOPE	EQUALS	1/12TH
// REENTRY_CONTROL.agc:1608
//# ... END OF RE-ENTRY CONSTANTS ...
// REENTRY_CONTROL.agc:1609
//
