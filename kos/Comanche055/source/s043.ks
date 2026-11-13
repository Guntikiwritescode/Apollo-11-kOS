// P32-P33_P72-P73.agc
// bank 04, slots 6851-6854
function agcAotUnit406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6852 {
        if slot <= 6851 {
// P32-P33_P72-P73.agc:1
//# Copyright:	Public domain.
// P32-P33_P72-P73.agc:2
//# Filename:	P32-P33_P72-P73.agc
// P32-P33_P72-P73.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// P32-P33_P72-P73.agc:4
//#		It is part of the source code for the Command Module's (CM)
// P32-P33_P72-P73.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P32-P33_P72-P73.agc:6
//# Assembler:	yaYUL
// P32-P33_P72-P73.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// P32-P33_P72-P73.agc:8
//# Website:	www.ibiblio.org/apollo.
// P32-P33_P72-P73.agc:9
//# Pages:	649-683
// P32-P33_P72-P73.agc:10
//# Mod history:	2009-05-09 RSB	Adapted from the Luminary131/ file
// P32-P33_P72-P73.agc:11
//#				P32-P35_P72-P75.agc and Comanche055 page
// P32-P33_P72-P73.agc:12
//#				images.
// P32-P33_P72-P73.agc:13
//#		2009-05-20 RSB	Corrected CSI/COM3 -> CSI/CDH3,
// P32-P33_P72-P73.agc:14
//#				CSI/CDHI -> CSI/CDH1, CDHTAB -> CDHTAG,
// P32-P33_P72-P73.agc:15
//#				changed a SETLOC from CSI/CDH to CSI/CDH1,
// P32-P33_P72-P73.agc:16
//#				a SETLOC CSI/CDH1 to CSIPROG.
// P32-P33_P72-P73.agc:17
//#		2009-05-21 RSB	Changed a P32/P72D to P32/P72E in
// P32-P33_P72-P73.agc:18
//#				P32/P72D.  DP1/4TH changed to DP1/4 in
// P32-P33_P72-P73.agc:19
//#				CDHMVR.
// P32-P33_P72-P73.agc:20
//#
// P32-P33_P72-P73.agc:21
//# This source code has been transcribed or otherwise adapted from digitized
// P32-P33_P72-P73.agc:22
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// P32-P33_P72-P73.agc:23
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// P32-P33_P72-P73.agc:24
//# thanks to both.  The images (with suitable reduction in storage size and
// P32-P33_P72-P73.agc:25
//# consequent reduction in image quality as well) are available online at
// P32-P33_P72-P73.agc:26
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// P32-P33_P72-P73.agc:27
//# illegible, contact me at info@sandroid.org about getting access to the
// P32-P33_P72-P73.agc:28
//# (much) higher-quality images which Paul actually created.
// P32-P33_P72-P73.agc:29
//#
// P32-P33_P72-P73.agc:30
//# Notations on the hardcopy document read, in part:
// P32-P33_P72-P73.agc:31
//#
// P32-P33_P72-P73.agc:32
//#	Assemble revision 055 of AGC program Comanche by NASA
// P32-P33_P72-P73.agc:33
//#	2021113-051.  10:28 APR. 1, 1969
// P32-P33_P72-P73.agc:34
//#
// P32-P33_P72-P73.agc:35
//#	This AGC program shall also be referred to as
// P32-P33_P72-P73.agc:36
//#			Colossus 2A
// P32-P33_P72-P73.agc:37
//
// P32-P33_P72-P73.agc:38
//# Page 649
// P32-P33_P72-P73.agc:39
//# COELLIPTIC SEQUENCE INITIATION (CSI) PROGRAMS (P32 AND P72)
// P32-P33_P72-P73.agc:40
//
// P32-P33_P72-P73.agc:41
//# MOD NO -1		LOG SECTION - P32-P35, P72-P75
// P32-P33_P72-P73.agc:42
//# MOD BY WHITE.P	DATE 1JUNE67
// P32-P33_P72-P73.agc:43
//
// P32-P33_P72-P73.agc:44
//# PURPOSE
// P32-P33_P72-P73.agc:45
//
// P32-P33_P72-P73.agc:46
//#	 (1) TO CALCULATE PARAMETERS ASSOCIATED WITH THE FOLLOWING
// P32-P33_P72-P73.agc:47
//#	     CONCENTRIC FLIGHT PLAN MANEUVERS - THE CO-ELLIPTIC SEQUENCE
// P32-P33_P72-P73.agc:48
//#	     INITIATION (CSI) MANEUVER AND THE CONSTANT DELTA ALTITUDE
// P32-P33_P72-P73.agc:49
//#	     (CDH) MANEUVER.
// P32-P33_P72-P73.agc:50
//
// P32-P33_P72-P73.agc:51
//#	 (2) TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P32-P33_P72-P73.agc:52
//#	     APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// P32-P33_P72-P73.agc:53
//
// P32-P33_P72-P73.agc:54
//#	 (3) TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// P32-P33_P72-P73.agc:55
//#	     ASSOCIATED WITH THE CONCENTRIC FLIGHT PLAN MANEUVERS FOR
// P32-P33_P72-P73.agc:56
//#	     APPROVAL BY THE ASTRONAUT/GROUND.
// P32-P33_P72-P73.agc:57
//
// P32-P33_P72-P73.agc:58
//#	 (4) TO STORE THE CSI TARGET PARAMETERS FOR USE BY THE DESIRED
// P32-P33_P72-P73.agc:59
//#	     THRUSTING PROGRAM.
// P32-P33_P72-P73.agc:60
//
// P32-P33_P72-P73.agc:61
//# ASSUMPTIONS
// P32-P33_P72-P73.agc:62
//
// P32-P33_P72-P73.agc:63
//#	 (1) AT A SELECTED TPI TIME THE LINE OF SIGHT BETWEEN THE ACTIVE
// P32-P33_P72-P73.agc:64
//#	     AND PASSIVE VEHICLES IS SELECTED TO BE A PRESCRIBED ANGLE (E)
// P32-P33_P72-P73.agc:65
//#	     FROM THE HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE
// P32-P33_P72-P73.agc:66
//#	     POSITION.
// P32-P33_P72-P73.agc:67
//
// P32-P33_P72-P73.agc:68
//#	 (2) THE TIME BETWEEN CSI IGNITION AND CDH IGNITION MUST BE
// P32-P33_P72-P73.agc:69
//#	     COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// P32-P33_P72-P73.agc:70
//#	     COMPLETION OF THE PROGRAM.
// P32-P33_P72-P73.agc:71
//
// P32-P33_P72-P73.agc:72
//#	 (3) THE TIME BETWEEN CDH IGNITION AND TPI IGNITION MUST BE
// P32-P33_P72-P73.agc:73
//#	     COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// P32-P33_P72-P73.agc:74
//#	     COMPLETION OF THE PROGRAM.
// P32-P33_P72-P73.agc:75
//
// P32-P33_P72-P73.agc:76
//#	 (4) CDH DELTA V IS SELECTED TO MINIMIZE THE VARIATION OF THE
// P32-P33_P72-P73.agc:77
//#	     ALTITUDE DIFFERENCE BETWEEN THE ORBITS.
// P32-P33_P72-P73.agc:78
//
// P32-P33_P72-P73.agc:79
//#	 (5) CSI BURN IS DEFINED SUCH THAT THE IMPULSIVE DELTA V IS IN THE
// P32-P33_P72-P73.agc:80
//#	     HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION AT CSI
// P32-P33_P72-P73.agc:81
//#	     IGNITION.
// P32-P33_P72-P73.agc:82
//
// P32-P33_P72-P73.agc:83
//#	 (6) THE PERICENTER ALTITUDE OF THE ORBIT FOLLOWING CSI AND CDH
// P32-P33_P72-P73.agc:84
//#	     MUST BE GREATER THAN 35,000 FT (LUNAR ORBIT) OR 85 NM (EARTH
// P32-P33_P72-P73.agc:85
//#	     ORBIT) FOR SUCCESSFUL COMPLETION OF THIS PROGRAM.
// P32-P33_P72-P73.agc:86
//
// P32-P33_P72-P73.agc:87
//#	 (7) THE CSI AND CDH MANEUVERS ARE ORIGINALLY ASSUMED TO BE
// P32-P33_P72-P73.agc:88
//#	     PARALLEL TO THE PLANE OF THE CSM ORBIT.  HOWEVER, CREW
// P32-P33_P72-P73.agc:89
//# Page 650
// P32-P33_P72-P73.agc:90
//#	     MODIFICATION OF DELTA V (LV) COMPONENTS MAY RESULT IN AN
// P32-P33_P72-P73.agc:91
//#	     OUT-OF-PLANE CSI MANEUVER.
// P32-P33_P72-P73.agc:92
//
// P32-P33_P72-P73.agc:93
//#	 (8) STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P32-P33_P72-P73.agc:94
//#	     STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 10).
// P32-P33_P72-P73.agc:95
//
// P32-P33_P72-P73.agc:96
//#	 (9) COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// P32-P33_P72-P73.agc:97
//#	     THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// P32-P33_P72-P73.agc:98
//#	     ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// P32-P33_P72-P73.agc:99
//#	     EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// P32-P33_P72-P73.agc:100
//
// P32-P33_P72-P73.agc:101
//#	(10) THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// P32-P33_P72-P73.agc:102
//#	     OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P32-P33_P72-P73.agc:103
//#	     DESIRED THE RADAR WAS TURNED ON AND LOCKED BY THE CSM BY
// P32-P33_P72-P73.agc:104
//#	     PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P32-P33_P72-P73.agc:105
//#	     AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P32-P33_P72-P73.agc:106
//#	     TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P32-P33_P72-P73.agc:107
//#	     MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P32-P33_P72-P73.agc:108
//#	     THRUSTING MANEUVER.
// P32-P33_P72-P73.agc:109
//
// P32-P33_P72-P73.agc:110
//#	(11) THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P32-P33_P72-P73.agc:111
//
// P32-P33_P72-P73.agc:112
//#	(12) THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS -
// P32-P33_P72-P73.agc:113
//
// P32-P33_P72-P73.agc:114
//#		ACTIVE VEHICLE FLAG - DESIGNATES THE VEHICLE WHICH IS
// P32-P33_P72-P73.agc:115
//#		DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P32-P33_P72-P73.agc:116
//#		CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P32-P33_P72-P73.agc:117
//#		EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P32-P33_P72-P73.agc:118
//
// P32-P33_P72-P73.agc:119
//#		FINAL FLAG - SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P32-P33_P72-P73.agc:120
//#		COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// P32-P33_P72-P73.agc:121
//#		CYCLE.
// P32-P33_P72-P73.agc:122
//
// P32-P33_P72-P73.agc:123
//#		EXTERNAL DELTA V STEERING FLAG - DESIGNATES THE TYPE OF
// P32-P33_P72-P73.agc:124
//#		STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// P32-P33_P72-P73.agc:125
//#		THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// P32-P33_P72-P73.agc:126
//#		PROGRAM.
// P32-P33_P72-P73.agc:127
//
// P32-P33_P72-P73.agc:128
//#	(13) IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// P32-P33_P72-P73.agc:129
//#	     A THRUSTING MANEUVER.
// P32-P33_P72-P73.agc:130
//
// P32-P33_P72-P73.agc:131
//#	(14) THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY -
// P32-P33_P72-P73.agc:132
//
// P32-P33_P72-P73.agc:133
//#		P32 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P32-P33_P72-P73.agc:134
//
// P32-P33_P72-P73.agc:135
//#		P72 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P32-P33_P72-P73.agc:136
//
// P32-P33_P72-P73.agc:137
//# INPUT
// P32-P33_P72-P73.agc:138
//
// P32-P33_P72-P73.agc:139
//#	 (1) TCSI	TIME OF THE CSI MANEUVER
// P32-P33_P72-P73.agc:140
//# Page 651
// P32-P33_P72-P73.agc:141
//#	 (2) NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// P32-P33_P72-P73.agc:142
//#			VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// P32-P33_P72-P73.agc:143
//#			MANEUVER POINT
// P32-P33_P72-P73.agc:144
//#	 (3) ELEV	DESIRED LOS ANGLE AT TPI
// P32-P33_P72-P73.agc:145
//#	 (4) TTPI	TIME OF THE TPI MANEUVER
// P32-P33_P72-P73.agc:146
//# OUTPUT
// P32-P33_P72-P73.agc:147
//
// P32-P33_P72-P73.agc:148
//#	 (1) TRKMKCNT	NUMBER OF MARKS
// P32-P33_P72-P73.agc:149
//#	 (2) TTOGO	TIME TO GO
// P32-P33_P72-P73.agc:150
//#	 (3) +MGA	MIDDLE GIMBAL ANGLE
// P32-P33_P72-P73.agc:151
//#	 (4) DIFFALT	DELTA ALTITUDE AT CDH
// P32-P33_P72-P73.agc:152
//#	 (5) T1TOT2	DELTA TIME FROM CSI TO CDH
// P32-P33_P72-P73.agc:153
//#	 (6) T2TOT3	DELTA TIME FROM CDH TO TPI
// P32-P33_P72-P73.agc:154
//#	 (7) DELVLVC	DELTA VELOCITY AT CSI - LOCAL VERTICAL COORDINATES
// P32-P33_P72-P73.agc:155
//#	 (8) DELVLVC	DELTA VELOCITY AT CDH - LOCAL VERTICAL COORDINATES
// P32-P33_P72-P73.agc:156
//
// P32-P33_P72-P73.agc:157
//# DOWNLINK
// P32-P33_P72-P73.agc:158
//
// P32-P33_P72-P73.agc:159
//#	 (1) TCSI	TIME OF THE CSI MANEUVER
// P32-P33_P72-P73.agc:160
//#	 (2) TCDH	TIME OF THE CDH MANEUVER
// P32-P33_P72-P73.agc:161
//#	 (3) TTPI	TIME OF THE TPI MANEUVER
// P32-P33_P72-P73.agc:162
//#	 (4) TIG	TIME OF THE CSI MANEUVER
// P32-P33_P72-P73.agc:163
//#	 (5) DELVEET1	DELTA VELOCITY AT CSI - REFERENCE COORDINATES
// P32-P33_P72-P73.agc:164
//#	 (6) DELVEET2	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// P32-P33_P72-P73.agc:165
//#	 (7) DIFFALT	DELTA ALTITUDE AT CDH
// P32-P33_P72-P73.agc:166
//#	 (8) NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// P32-P33_P72-P73.agc:167
//#			VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// P32-P33_P72-P73.agc:168
//#			MANEUVER POINT
// P32-P33_P72-P73.agc:169
//#	 (9) ELEV	DESIRED LOS ANGLE AT TPI
// P32-P33_P72-P73.agc:170
//
// P32-P33_P72-P73.agc:171
//# COMMUNICATION TO THRUSTING PROGRAMS
// P32-P33_P72-P73.agc:172
//
// P32-P33_P72-P73.agc:173
//#	 (1) TIG	TIME OF THE CSI MANEUVER
// P32-P33_P72-P73.agc:174
//#	 (2) RTIG	POSITION OF ACTIVE VEHICLE AT CSI - BEFORE ROTATION
// P32-P33_P72-P73.agc:175
//#			INTO PLANE OF PASSIVE VEHICLE
// P32-P33_P72-P73.agc:176
//#	 (3) VTIG	VELOCITY OF ACTIVE VEHICLE AT CSE - BEFORE ROTATION
// P32-P33_P72-P73.agc:177
//#			INTO PLANE OF PASSIVE VEHICLE
// P32-P33_P72-P73.agc:178
//#	 (4) DELVSIN	DELTA VELOCITY AT CSI - REFERENCE COORDINATES
// P32-P33_P72-P73.agc:179
//#	 (5) DELVSAB	MAGNITUDE OF DELTA VELOCITY AT CSI
// P32-P33_P72-P73.agc:180
//#	 (6) XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// P32-P33_P72-P73.agc:181
//
// P32-P33_P72-P73.agc:182
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:183
//
// P32-P33_P72-P73.agc:184
//#	 AVFLAGA
// P32-P33_P72-P73.agc:185
//#	 AVFLAGP
// P32-P33_P72-P73.agc:186
//#	 P20FLGON
// P32-P33_P72-P73.agc:187
//#	 VARALARM
// P32-P33_P72-P73.agc:188
//#	 BANKCALL
// P32-P33_P72-P73.agc:189
//#	 GOFLASH
// P32-P33_P72-P73.agc:190
//#	 GOTOPOOH
// P32-P33_P72-P73.agc:191
//# Page 652
// P32-P33_P72-P73.agc:192
//#	 VNPOOH
// P32-P33_P72-P73.agc:193
//#	 GOFLASHR
// P32-P33_P72-P73.agc:194
//#	 BLANKET
// P32-P33_P72-P73.agc:195
//#	 ENDOFJOB
// P32-P33_P72-P73.agc:196
//#	 SELECTMU
// P32-P33_P72-P73.agc:197
//#	 ADVANCE
// P32-P33_P72-P73.agc:198
//#	 INTINT
// P32-P33_P72-P73.agc:199
//#	 PASSIVE
// P32-P33_P72-P73.agc:200
//#	 CSI/A
// P32-P33_P72-P73.agc:201
//#	 S32/33.1
// P32-P33_P72-P73.agc:202
//#	 DISDVLVC
// P32-P33_P72-P73.agc:203
//#	 VN1645
// P32-P33_P72-P73.agc:204
//
// P32-P33_P72-P73.agc:205
//		BANK	35
// P32-P33_P72-P73.agc:206
//		SETLOC	CSI/CDH1
// P32-P33_P72-P73.agc:207
//		BANK
// P32-P33_P72-P73.agc:208
//		EBANK=	SUBEXIT
// P32-P33_P72-P73.agc:209
//		COUNT	35/P3272
// P32-P33_P72-P73.agc:210
//
// P32-P33_P72-P73.agc:211
//P32		TC	AVFLAGA
// slot 6851
            if slot <> 6851 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:212
//		TC	P32STRT
// slot 6852
            if slot <> 6852 or instruction <> 1734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6853 {
// P32-P33_P72-P73.agc:213
//P72		TC	AVFLAGP
// slot 6853
            if slot <> 6853 or instruction <> 2466 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2466, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:214
//P32STRT		TC	INTPRET
// slot 6854
            if slot <> 6854 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[406] to agcAotUnit406@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:215
//		DLOAD
// slot 6855
    6855, 65482,
// P32-P33_P72-P73.agc:216
//			ZEROVEC
// slot 6856
    6856, 9964,
// P32-P33_P72-P73.agc:217
//		STORE	CENTANG
// slot 6857
    6857, 4056,
// P32-P33_P72-P73.agc:218
//		EXIT
// slot 6858
    6858, 65532
)).

// bank 04, slots 6859-6859
function agcAotUnit407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P33_P72-P73.agc:219
//		TC	P32/P72A
// slot 6859
    if slot <> 6859 or instruction <> 1753 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1753, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[407] to agcAotUnit407@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:220
//ALMXITA		SXA,2
// slot 6860
    6860, 65464,
// P32-P33_P72-P73.agc:221
//			CSIALRM
// slot 6861
    6861, 3944,
// P32-P33_P72-P73.agc:222
//ALMXIT		LXC,1
// slot 6862
    6862, 65472,
// P32-P33_P72-P73.agc:223
//			CSIALRM
// slot 6863
    6863, 3944,
// P32-P33_P72-P73.agc:224
//		SLOAD*	EXIT
// slot 6864
    6864, 65206,
// P32-P33_P72-P73.agc:225
//			ALARM/TB -1,1
// slot 6865
    6865, 14166
)).

// bank 04, slots 6866-6869
function agcAotUnit408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6867 {
        if slot <= 6866 {
// P32-P33_P72-P73.agc:226
//		CA	MPAC
// slot 6866
            if slot <> 6866 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:227
//		TC	VARALARM
// slot 6867
            if slot <> 6867 or instruction <> 3060 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3060, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6868 {
// P32-P33_P72-P73.agc:228
//		CAF	V05N09
// slot 6868
            if slot <> 6868 or instruction <> 14888 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2600), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:229
//		TC	BANKCALL
// slot 6869
            if slot <> 6869 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[408] to agcAotUnit408@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:230
//		CADR	GOFLASH
// slot 6870
    6870, 17312
)).

// bank 04, slots 6871-6874
function agcAotUnit409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6872 {
        if slot <= 6871 {
// P32-P33_P72-P73.agc:231
//		TC	GOTOPOOH
// slot 6871
            if slot <> 6871 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:232
//		TC	-4
// slot 6872
            if slot <> 6872 or instruction <> 1748 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1748, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6873 {
// P32-P33_P72-P73.agc:233
//P32/P72A	TC	P20FLGON
// slot 6873
            if slot <> 6873 or instruction <> 2471 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2471, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:234
//		TC	INTPRET
// slot 6874
            if slot <> 6874 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[409] to agcAotUnit409@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:235
//		DLOAD
// slot 6875
    6875, 65482,
// P32-P33_P72-P73.agc:236
//			ZEROVEC
// slot 6876
    6876, 9964,
// P32-P33_P72-P73.agc:237
//		STORE	NN
// slot 6877
    6877, 4076,
// P32-P33_P72-P73.agc:238
//		EXIT
// slot 6878
    6878, 65532
)).

// bank 04, slots 6879-6882
function agcAotUnit410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6880 {
        if slot <= 6879 {
// P32-P33_P72-P73.agc:239
//		CAF	V06N11		# TCSI
// slot 6879
            if slot <> 6879 or instruction <> 14766 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2478), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:240
//		TC	VNPOOH
// slot 6880
            if slot <> 6880 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6881 {
// P32-P33_P72-P73.agc:241
//		CAF	V06N55		# NN. ELEV(RGL05)
// slot 6881
            if slot <> 6881 or instruction <> 14733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2445), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:242
//# Page 653
// P32-P33_P72-P73.agc:243
//		TC	BANKCALL
// slot 6882
            if slot <> 6882 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[410] to agcAotUnit410@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:244
//		CADR	GOFLASH
// slot 6883
    6883, 17312
)).

// bank 04, slots 6884-6889
function agcAotUnit411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6886 {
        if slot <= 6884 {
// P32-P33_P72-P73.agc:245
//		TC	GOTOPOOH
// slot 6884
            if slot <> 6884 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6885 {
// P32-P33_P72-P73.agc:246
//		TC	+2
// slot 6885
                if slot <> 6885 or instruction <> 1767 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1767, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P33_P72-P73.agc:247
//		TC	-5
// slot 6886
                if slot <> 6886 or instruction <> 1761 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1761, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6887 {
// P32-P33_P72-P73.agc:248
//		CAF	V06N37		# TTPI
// slot 6887
            if slot <> 6887 or instruction <> 14732 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2444), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6888 {
// P32-P33_P72-P73.agc:249
//		TC	VNPOOH
// slot 6888
                if slot <> 6888 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P33_P72-P73.agc:250
//		TC	INTPRET
// slot 6889
                if slot <> 6889 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[411] to agcAotUnit411@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:251
//		DLOAD
// slot 6890
    6890, 65482,
// P32-P33_P72-P73.agc:252
//			TCSI
// slot 6891
    6891, 2878,
// P32-P33_P72-P73.agc:253
//		STCALL	TIG
// slot 6892
    6892, 32278,
// P32-P33_P72-P73.agc:254
//			SELECTMU
// slot 6893
    6893, 9108,
// P32-P33_P72-P73.agc:255
//P32/P72B	CALL
// slot 6894
    6894, 65320,
// P32-P33_P72-P73.agc:256
//			ADVANCE
// slot 6895
    6895, 64330,
// P32-P33_P72-P73.agc:257
//		SETPD	VLOAD
// slot 6896
    6896, 64770,
// P32-P33_P72-P73.agc:258
//			0D
// slot 6897
    6897, 2,
// P32-P33_P72-P73.agc:259
//			VPASS1
// slot 6898
    6898, 3732,
// P32-P33_P72-P73.agc:260
//		PDVL	PDDL
// slot 6899
    6899, 54682,
// P32-P33_P72-P73.agc:261
//			RPASS1
// slot 6900
    6900, 4060,
// P32-P33_P72-P73.agc:262
//			TCSI
// slot 6901
    6901, 2878,
// P32-P33_P72-P73.agc:263
//		PDDL	PDDL
// slot 6902
    6902, 54698,
// P32-P33_P72-P73.agc:264
//			TTPI
// slot 6903
    6903, 3942,
// P32-P33_P72-P73.agc:265
//			2PISC
// slot 6904
    6904, 10032,
// P32-P33_P72-P73.agc:266
//		SL2	PUSH
// slot 6905
    6905, 34452,
// P32-P33_P72-P73.agc:267
//		CALL
// slot 6906
    6906, 65320,
// P32-P33_P72-P73.agc:268
//			INTINT
// slot 6907
    6907, 60298,
// P32-P33_P72-P73.agc:269
//		CALL
// slot 6908
    6908, 65320,
// P32-P33_P72-P73.agc:270
//			PASSIVE
// slot 6909
    6909, 38222,
// P32-P33_P72-P73.agc:271
//		CALL
// slot 6910
    6910, 65320,
// P32-P33_P72-P73.agc:272
//			CSI/A
// slot 6911
    6911, 14216,
// P32-P33_P72-P73.agc:273
//P32/P72C	BON	SET
// slot 6912
    6912, 35864,
// P32-P33_P72-P73.agc:274
//			FINALFLG
// slot 6913
    6913, 1426,
// P32-P33_P72-P73.agc:275
//			P32/P72D
// slot 6914
    6914, 9736,
// P32-P33_P72-P73.agc:276
//			UPDATFLG
// slot 6915
    6915, 624,
// P32-P33_P72-P73.agc:277
//P32/P72D	DLOAD	GOTO
// slot 6916
    6916, 43210,
// P32-P33_P72-P73.agc:278
//			T1TOT2
// slot 6917
    6917, 2766,
// P32-P33_P72-P73.agc:279
//			P32/P72E
// slot 6918
    6918, 24580,
// P32-P33_P72-P73.agc:280
//		SETLOC	CSI/CDH3
// P32-P33_P72-P73.agc:281
//		BANK
// P32-P33_P72-P73.agc:282
//P32/P72E	STORE	T1TOT2
// slot 14338
    14338, 2766,
// P32-P33_P72-P73.agc:283
//		DSU	BPL
// slot 14339
    14339, 42026,
// P32-P33_P72-P73.agc:284
//			60MIN
// slot 14340
    14340, 14164,
// P32-P33_P72-P73.agc:285
//			P32/P72E
// slot 14341
    14341, 24580,
// P32-P33_P72-P73.agc:286
//		DLOAD	GOTO
// slot 14342
    14342, 43210,
// P32-P33_P72-P73.agc:287
//			T2TOT3
// slot 14343
    14343, 3932,
// P32-P33_P72-P73.agc:288
//			P32/P72F
// slot 14344
    14344, 9742,
// P32-P33_P72-P73.agc:289
//		SETLOC	CSI/CDH1
// P32-P33_P72-P73.agc:290
//		BANK
// P32-P33_P72-P73.agc:291
//P32/P72F	STORE	T2TOT3
// slot 6919
    6919, 3932,
// P32-P33_P72-P73.agc:292
//		DSU	BPL
// slot 6920
    6920, 42026,
// P32-P33_P72-P73.agc:293
//# Page 654
// P32-P33_P72-P73.agc:294
//			60MIN
// slot 6921
    6921, 14164,
// P32-P33_P72-P73.agc:295
//			P32/P72F
// slot 6922
    6922, 9742,
// P32-P33_P72-P73.agc:296
//		EXIT
// slot 6923
    6923, 65532
)).

// bank 04, slots 6924-6926
function agcAotUnit412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6924 {
// P32-P33_P72-P73.agc:297
//		CAF	V06N75
// slot 6924
        if slot <> 6924 or instruction <> 14768 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2480), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6925 {
// P32-P33_P72-P73.agc:298
//		TC	VNPOOH
// slot 6925
            if slot <> 6925 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:299
//		TC	INTPRET
// slot 6926
            if slot <> 6926 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[412] to agcAotUnit412@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:300
//		VLOAD	CALL
// slot 6927
    6927, 38138,
// P32-P33_P72-P73.agc:301
//			DELVEET1
// slot 6928
    6928, 2634,
// P32-P33_P72-P73.agc:302
//			S32/33.1
// slot 6929
    6929, 61022,
// P32-P33_P72-P73.agc:303
//		STOVL	DELVEET1
// slot 6930
    6930, 23114,
// P32-P33_P72-P73.agc:304
//			RACT2
// slot 6931
    6931, 2646,
// P32-P33_P72-P73.agc:305
//		STOVL	RACT1
// slot 6932
    6932, 23234,
// P32-P33_P72-P73.agc:306
//			DELVEET2
// slot 6933
    6933, 3950,
// P32-P33_P72-P73.agc:307
//		AXT,1	CALL
// slot 6934
    6934, 38128,
// P32-P33_P72-P73.agc:308
//		VN	0682
// slot 6935
    6935, 1700,
// P32-P33_P72-P73.agc:309
//			DISDVLVC
// slot 6936
    6936, 64298,
// P32-P33_P72-P73.agc:310
//		DLOAD
// slot 6937
    6937, 65482,
// P32-P33_P72-P73.agc:311
//			TTPI
// slot 6938
    6938, 3942,
// P32-P33_P72-P73.agc:312
//		STCALL	TTPIO
// slot 6939
    6939, 31554,
// P32-P33_P72-P73.agc:313
//			VN1645
// slot 6940
    6940, 60420,
// P32-P33_P72-P73.agc:314
//		GOTO
// slot 6941
    6941, 65360,
// P32-P33_P72-P73.agc:315
//			P32/P72B
// slot 6942
    6942, 9692
)).

// bank 04, slots 6943-6949
function agcAotUnit413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6945 {
        if slot <= 6943 {
// P32-P33_P72-P73.agc:316
//# Page 655
// P32-P33_P72-P73.agc:317
//# CONSTANT DELTA HEIGHT (CDH) PROGRAMS (P33 AND P73)
// P32-P33_P72-P73.agc:318
//
// P32-P33_P72-P73.agc:319
//# MOD NO -1		LOC SECTION - P32-P35, P72-P75
// P32-P33_P72-P73.agc:320
//# MOD BY WHITE.P	DATE 1JUNE67
// P32-P33_P72-P73.agc:321
//# PURPOSE
// P32-P33_P72-P73.agc:322
//
// P32-P33_P72-P73.agc:323
//#	 (1) TO CALCULATE PARAMETERS ASSOCIATED WITH THE CONSTANT DELTA
// P32-P33_P72-P73.agc:324
//#	     ALTITUDE MANEUVER (CDH).
// P32-P33_P72-P73.agc:325
//
// P32-P33_P72-P73.agc:326
//#	 (2) TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P32-P33_P72-P73.agc:327
//#	     APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// P32-P33_P72-P73.agc:328
//
// P32-P33_P72-P73.agc:329
//#	 (3) TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// P32-P33_P72-P73.agc:330
//#	     ASSOCIATED WITH THE CDH MANEUVER FOR APPROVAL BY THE
// P32-P33_P72-P73.agc:331
//#	     ASTRONAUT/GROUND.
// P32-P33_P72-P73.agc:332
//
// P32-P33_P72-P73.agc:333
//#	 (4) TO STORE THE CDH TARGET PARAMETERS FOR USE BY THE DESIRED
// P32-P33_P72-P73.agc:334
//#	     THRUSTING PROGRAM.
// P32-P33_P72-P73.agc:335
//
// P32-P33_P72-P73.agc:336
//# ASSUMPTIONS
// P32-P33_P72-P73.agc:337
//
// P32-P33_P72-P73.agc:338
//#	 (1) THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF THE
// P32-P33_P72-P73.agc:339
//#	     CO-ELLIPTIC SEQUENCE INITIATION (CSI) PROGRAM (P32/P72).
// P32-P33_P72-P73.agc:340
//#	     THERFORE -
// P32-P33_P72-P73.agc:341
//
// P32-P33_P72-P73.agc:342
//#	     (A) AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// P32-P33_P72-P73.agc:343
//#		 BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// P32-P33_P72-P73.agc:344
//#		 A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// P32-P33_P72-P73.agc:345
//#		 HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// P32-P33_P72-P73.agc:346
//
// P32-P33_P72-P73.agc:347
//#	     (B) THE TIME BETWEEN CSI IGNITION AND CDH IGNITION WAS
// P32-P33_P72-P73.agc:348
//#		 COMPUTED TO BE GREATER THAN 10 MINUTES.
// P32-P33_P72-P73.agc:349
//
// P32-P33_P72-P73.agc:350
//#	     (C) THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// P32-P33_P72-P73.agc:351
//#		 COMPUTED TO BE GREATER THAN 10 MINUTES.
// P32-P33_P72-P73.agc:352
//
// P32-P33_P72-P73.agc:353
//#	     (D) THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// P32-P33_P72-P73.agc:354
//#		 ORBITS WAS MINIMIZED.
// P32-P33_P72-P73.agc:355
//
// P32-P33_P72-P73.agc:356
//#	     (E) CSI BURN WAS DEFINED SUCH THAT THE IMPULSIVE DELTA V WAS
// P32-P33_P72-P73.agc:357
//#		 IN THE HORIZONTAL PLANE DEFINED BY ACTIVE VEHICLE
// P32-P33_P72-P73.agc:358
//
// P32-P33_P72-P73.agc:359
//#		 POSITION AT CSI IGNITION.
// P32-P33_P72-P73.agc:360
//
// P32-P33_P72-P73.agc:361
//#	     (F) THE PERICENTER ALTITUDES OF THE ORBITS FOLLOWING CSI AND
// P32-P33_P72-P73.agc:362
//#		 CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// P32-P33_P72-P73.agc:363
//#		 ORBIT OR 85 NM FOR EARTH ORBIT.
// P32-P33_P72-P73.agc:364
//
// P32-P33_P72-P73.agc:365
//#	     (G) THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// P32-P33_P72-P73.agc:366
//#		 THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// P32-P33_P72-P73.agc:367
//# Page 656
// P32-P33_P72-P73.agc:368
//#		 MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// P32-P33_P72-P73.agc:369
//#		 IN AN OUT-OF-PLANE MANEUVER.
// P32-P33_P72-P73.agc:370
//
// P32-P33_P72-P73.agc:371
//#	 (2) STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P32-P33_P72-P73.agc:372
//#	     STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 4).
// P32-P33_P72-P73.agc:373
//
// P32-P33_P72-P73.agc:374
//#	 (3) COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// P32-P33_P72-P73.agc:375
//#	     THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// P32-P33_P72-P73.agc:376
//#	     ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// P32-P33_P72-P73.agc:377
//#	     EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// P32-P33_P72-P73.agc:378
//
// P32-P33_P72-P73.agc:379
//#	 (4) THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// P32-P33_P72-P73.agc:380
//#	     OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P32-P33_P72-P73.agc:381
//#	     DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// P32-P33_P72-P73.agc:382
//#	     PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P32-P33_P72-P73.agc:383
//#	     AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P32-P33_P72-P73.agc:384
//#	     TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P32-P33_P72-P73.agc:385
//#	     MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P32-P33_P72-P73.agc:386
//#	     THRUSTING MANEUVER.
// P32-P33_P72-P73.agc:387
//
// P32-P33_P72-P73.agc:388
//#	 (5) THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P32-P33_P72-P73.agc:389
//
// P32-P33_P72-P73.agc:390
//#	 (6) THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS -
// P32-P33_P72-P73.agc:391
//
// P32-P33_P72-P73.agc:392
//#		ACTIVE VEHICLE FLAG - DESIGNATES THE VEHICLE WHICH IS
// P32-P33_P72-P73.agc:393
//#		DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P32-P33_P72-P73.agc:394
//#		CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P32-P33_P72-P73.agc:395
//#		EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P32-P33_P72-P73.agc:396
//
// P32-P33_P72-P73.agc:397
//#		FINAL FLAG - SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P32-P33_P72-P73.agc:398
//#		COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// P32-P33_P72-P73.agc:399
//#		CYCLE.
// P32-P33_P72-P73.agc:400
//
// P32-P33_P72-P73.agc:401
//#		EXTERNAL DELTA V STEERING FLAG - DESIGNATES THE TYPE OF
// P32-P33_P72-P73.agc:402
//#		STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// P32-P33_P72-P73.agc:403
//#		THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// P32-P33_P72-P73.agc:404
//#		PROGRAM.
// P32-P33_P72-P73.agc:405
//
// P32-P33_P72-P73.agc:406
//#	 (7) IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// P32-P33_P72-P73.agc:407
//#	     A THRUSTING MANEUVER.
// P32-P33_P72-P73.agc:408
//
// P32-P33_P72-P73.agc:409
//#	 (8) THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY -
// P32-P33_P72-P73.agc:410
//
// P32-P33_P72-P73.agc:411
//#		P33 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P32-P33_P72-P73.agc:412
//
// P32-P33_P72-P73.agc:413
//#		P73 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P32-P33_P72-P73.agc:414
//
// P32-P33_P72-P73.agc:415
//# INPUT
// P32-P33_P72-P73.agc:416
//
// P32-P33_P72-P73.agc:417
//#	 (1) TTPIO	TIME OF THE TPI MANEUVER - SAVED FROM P32/P72
// P32-P33_P72-P73.agc:418
//# Page 657
// P32-P33_P72-P73.agc:419
//#	 (2) ELEV	DESIRED LOS ANGLE AT TPI - SAVED FROM P32/P72
// P32-P33_P72-P73.agc:420
//#	 (3) TCDH	TIME OF THE CDH MANEUVER
// P32-P33_P72-P73.agc:421
//
// P32-P33_P72-P73.agc:422
//# OUTPUT
// P32-P33_P72-P73.agc:423
//
// P32-P33_P72-P73.agc:424
//#	 (1) TRKMKCNT	NUMBER OF MARKS
// P32-P33_P72-P73.agc:425
//#	 (2) TTOGO	TIME TO GO
// P32-P33_P72-P73.agc:426
//#	 (3) +MGA	MIDDLE GIMBAL ANGLE
// P32-P33_P72-P73.agc:427
//#	 (4) DIFFALT	DELTA ALTITUDE AT CDH
// P32-P33_P72-P73.agc:428
//#	 (5) T2TOT3	DELTA TIME FROM CDH TO COMPUTED TPI
// P32-P33_P72-P73.agc:429
//#	 (6) NOMTPI	DELTA TIME FROM NOMINAL TPI TO COMPUTED TPI
// P32-P33_P72-P73.agc:430
//#	 (7) DELVLVC	DELTA VELOCITY AT CDH - LOCAL VERTICAL COORDINATES
// P32-P33_P72-P73.agc:431
//
// P32-P33_P72-P73.agc:432
//# DOWNLINK
// P32-P33_P72-P73.agc:433
//
// P32-P33_P72-P73.agc:434
//#	 (1) TCDH	TIME OF THE CDH MANEUVER
// P32-P33_P72-P73.agc:435
//#	 (2) TTPI	TIME OF THE TPI MANEUVER
// P32-P33_P72-P73.agc:436
//#	 (3) TIG	TIME OF THE CDH MANEUVER
// P32-P33_P72-P73.agc:437
//#	 (4) DELLVEET2	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// P32-P33_P72-P73.agc:438
//#	 (5) DIFFALT	DELTA ALTITUDE AT CDH
// P32-P33_P72-P73.agc:439
//#	 (6) ELEV	DESIRED LOS ANGLE AT TPI
// P32-P33_P72-P73.agc:440
//# COMMUNICATION TO THRUSTING PROGRAMS
// P32-P33_P72-P73.agc:441
//
// P32-P33_P72-P73.agc:442
//#	 (1) TIG	TIME OF THE CDH MANEUVER
// P32-P33_P72-P73.agc:443
//#	 (2) RTIG	POSITION OF ACTIVE VEHICLE AT CDH - BEFORE ROTATION
// P32-P33_P72-P73.agc:444
//#			INTO PLANE OF PASSIVE VEHICLE
// P32-P33_P72-P73.agc:445
//#	 (3) VTIG	VELOCITY OF ACTIVE VEHICLE AT CDH - BEFORE ROTATION
// P32-P33_P72-P73.agc:446
//#			INTO PLANE OF PASSIVE VEHICLE
// P32-P33_P72-P73.agc:447
//#	 (4) DELVSIN	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// P32-P33_P72-P73.agc:448
//#	 (5) DELVSAB	MAGNITUDE OF DELTA VELOCITY AT CDH
// P32-P33_P72-P73.agc:449
//#	 (6) XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// P32-P33_P72-P73.agc:450
//
// P32-P33_P72-P73.agc:451
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:452
//
// P32-P33_P72-P73.agc:453
//#	 AVFLAGA
// P32-P33_P72-P73.agc:454
//#	 AVFLAGP
// P32-P33_P72-P73.agc:455
//#	 P20FLGON
// P32-P33_P72-P73.agc:456
//#	 VNPOOH
// P32-P33_P72-P73.agc:457
//#	 SELECTMU
// P32-P33_P72-P73.agc:458
//#	 ADVANCE
// P32-P33_P72-P73.agc:459
//#	 CDHMVR
// P32-P33_P72-P73.agc:460
//#	 INTINT3P
// P32-P33_P72-P73.agc:461
//#	 ACTIVE
// P32-P33_P72-P73.agc:462
//#	 PASSIVE
// P32-P33_P72-P73.agc:463
//#	 S33/S34.1
// P32-P33_P72-P73.agc:464
//#	 ALARM
// P32-P33_P72-P73.agc:465
//#	 BANKCALL
// P32-P33_P72-P73.agc:466
//#	 GOFLASH
// P32-P33_P72-P73.agc:467
//#	 GOTOPOOH
// P32-P33_P72-P73.agc:468
//#	 S32/33.1
// P32-P33_P72-P73.agc:469
//# Page 658
// P32-P33_P72-P73.agc:470
//#	 VN1645
// P32-P33_P72-P73.agc:471
//
// P32-P33_P72-P73.agc:472
//		COUNT	35/P3373
// P32-P33_P72-P73.agc:473
//
// P32-P33_P72-P73.agc:474
//P33		TC	AVFLAGA
// slot 6943
            if slot <> 6943 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6944 {
// P32-P33_P72-P73.agc:475
//		TC	P33/P73A
// slot 6944
                if slot <> 6944 or instruction <> 1826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P33_P72-P73.agc:476
//P73		TC	AVFLAGP
// slot 6945
                if slot <> 6945 or instruction <> 2466 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6947 {
            if slot <= 6946 {
// P32-P33_P72-P73.agc:477
//P33/P73A	TC	P20FLGON
// slot 6946
                if slot <> 6946 or instruction <> 2471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P33_P72-P73.agc:478
//		CAF	V06N13		# TCDH
// slot 6947
                if slot <> 6947 or instruction <> 14767 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2479), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6948 {
// P32-P33_P72-P73.agc:479
//		TC	VNPOOH
// slot 6948
                if slot <> 6948 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P33_P72-P73.agc:480
//		TC	INTPRET
// slot 6949
                if slot <> 6949 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[413] to agcAotUnit413@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:481
//		DLOAD
// slot 6950
    6950, 65482,
// P32-P33_P72-P73.agc:482
//			TTPIO
// slot 6951
    6951, 2882,
// P32-P33_P72-P73.agc:483
//		STODL	TTPI
// slot 6952
    6952, 16230,
// P32-P33_P72-P73.agc:484
//			TCDH
// slot 6953
    6953, 2874,
// P32-P33_P72-P73.agc:485
//		STCALL	TIG
// slot 6954
    6954, 32278,
// P32-P33_P72-P73.agc:486
//			SELECTMU
// slot 6955
    6955, 9108,
// P32-P33_P72-P73.agc:487
//P33/P73B	CALL
// slot 6956
    6956, 65320,
// P32-P33_P72-P73.agc:488
//			ADVANCE
// slot 6957
    6957, 64330,
// P32-P33_P72-P73.agc:489
//		CALL
// slot 6958
    6958, 65320,
// P32-P33_P72-P73.agc:490
//			CDHMVR
// slot 6959
    6959, 11568,
// P32-P33_P72-P73.agc:491
//		SETPD	VLOAD
// slot 6960
    6960, 64770,
// P32-P33_P72-P73.agc:492
//			0D
// slot 6961
    6961, 2,
// P32-P33_P72-P73.agc:493
//			VACT3
// slot 6962
    6962, 3788,
// P32-P33_P72-P73.agc:494
//		PDVL	CALL
// slot 6963
    6963, 38042,
// P32-P33_P72-P73.agc:495
//			RACT2
// slot 6964
    6964, 2646,
// P32-P33_P72-P73.agc:496
//			INTINT3P
// slot 6965
    6965, 53106,
// P32-P33_P72-P73.agc:497
//		CALL
// slot 6966
    6966, 65320,
// P32-P33_P72-P73.agc:498
//			ACTIVE
// slot 6967
    6967, 38206,
// P32-P33_P72-P73.agc:499
//		SETPD	VLOAD
// slot 6968
    6968, 64770,
// P32-P33_P72-P73.agc:500
//			0D
// slot 6969
    6969, 2,
// P32-P33_P72-P73.agc:501
//			VPASS2
// slot 6970
    6970, 2846,
// P32-P33_P72-P73.agc:502
//		PDVL	CALL
// slot 6971
    6971, 38042,
// P32-P33_P72-P73.agc:503
//			RPASS2
// slot 6972
    6972, 2858,
// P32-P33_P72-P73.agc:504
//			INTINT3P
// slot 6973
    6973, 53106,
// P32-P33_P72-P73.agc:505
//		CALL
// slot 6974
    6974, 65320,
// P32-P33_P72-P73.agc:506
//			PASSIVE
// slot 6975
    6975, 38222,
// P32-P33_P72-P73.agc:507
//		DLOAD	SET
// slot 6976
    6976, 36042,
// P32-P33_P72-P73.agc:508
//			ZEROVEC
// slot 6977
    6977, 9964,
// P32-P33_P72-P73.agc:509
//			ITSWICH
// slot 6978
    6978, 3682,
// P32-P33_P72-P73.agc:510
//		STCALL	NOMTPI
// slot 6979
    6979, 31208,
// P32-P33_P72-P73.agc:511
//			S33/34.1
// slot 6980
    6980, 59676,
// P32-P33_P72-P73.agc:512
//		BZE	EXIT
// slot 6981
    6981, 65112,
// P32-P33_P72-P73.agc:513
//			P33/P73C
// slot 6982
    6982, 20480
)).

// bank 04, slots 6983-6983
function agcAotUnit414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P33_P72-P73.agc:514
//		TC	ALARM
// slot 6983
    if slot <> 6983 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[414] to agcAotUnit414@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:515
//		OCT	611
// slot 6984
    6984, 786
)).

// bank 04, slots 6985-6986
function agcAotUnit415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6985 {
// P32-P33_P72-P73.agc:516
//		CAF	V05N09
// slot 6985
        if slot <> 6985 or instruction <> 14888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P32-P33_P72-P73.agc:517
//		TC	BANKCALL
// slot 6986
        if slot <> 6986 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[415] to agcAotUnit415@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:518
//		CADR	GOFLASH
// slot 6987
    6987, 17312
)).

// bank 04, slots 6988-6991
function agcAotUnit416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6989 {
        if slot <= 6988 {
// P32-P33_P72-P73.agc:519
//		TC	GOTOPOOH
// slot 6988
            if slot <> 6988 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:520
//# Page 659
// P32-P33_P72-P73.agc:521
//		TC	+2
// slot 6989
            if slot <> 6989 or instruction <> 1871 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1871, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6990 {
// P32-P33_P72-P73.agc:522
//		TC	P33/P73A
// slot 6990
            if slot <> 6990 or instruction <> 1826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:523
//		TC	INTPRET
// slot 6991
            if slot <> 6991 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[416] to agcAotUnit416@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:524
//		DLOAD
// slot 6992
    6992, 65482,
// P32-P33_P72-P73.agc:525
//			ZEROVEC
// slot 6993
    6993, 9964,
// P32-P33_P72-P73.agc:526
//		STCALL	NOMTPI
// slot 6994
    6994, 31208,
// P32-P33_P72-P73.agc:527
//			P33/P73C
// slot 6995
    6995, 20480,
// P32-P33_P72-P73.agc:528
//		SETLOC	CSI/CDH2
// P32-P33_P72-P73.agc:529
//		BANK
// P32-P33_P72-P73.agc:530
//
// P32-P33_P72-P73.agc:531
//P33/P73C	BON	SET
// slot 12288
    12288, 35864,
// P32-P33_P72-P73.agc:532
//			FINALFLG
// slot 12289
    12289, 1426,
// P32-P33_P72-P73.agc:533
//			P33/P73D
// slot 12290
    12290, 20488,
// P32-P33_P72-P73.agc:534
//			UPDATFLG
// slot 12291
    12291, 624,
// P32-P33_P72-P73.agc:535
//P33/P73D	DLOAD	DAD
// slot 12292
    12292, 36298,
// P32-P33_P72-P73.agc:536
//			NOMTPI
// slot 12293
    12293, 2536,
// P32-P33_P72-P73.agc:537
//			TTPI
// slot 12294
    12294, 3942,
// P32-P33_P72-P73.agc:538
//		STORE	TTPI
// slot 12295
    12295, 3942,
// P32-P33_P72-P73.agc:539
//		DSU	GOTO
// slot 12296
    12296, 43050,
// P32-P33_P72-P73.agc:540
//			TCDH
// slot 12297
    12297, 2874,
// P32-P33_P72-P73.agc:541
//			P33/P73E
// slot 12298
    12298, 9896,
// P32-P33_P72-P73.agc:542
//		SETLOC	CSI/CDH1
// P32-P33_P72-P73.agc:543
//		BANK
// P32-P33_P72-P73.agc:544
//
// P32-P33_P72-P73.agc:545
//P33/P73E	DSU	BPL
// slot 6996
    6996, 42026,
// P32-P33_P72-P73.agc:546
//			60MIN
// slot 6997
    6997, 14164,
// P32-P33_P72-P73.agc:547
//			P33/P73E
// slot 6998
    6998, 9896,
// P32-P33_P72-P73.agc:548
//		DAD
// slot 6999
    6999, 65306,
// P32-P33_P72-P73.agc:549
//			60MIN
// slot 7000
    7000, 14164,
// P32-P33_P72-P73.agc:550
//		STODL	T1TOT2
// slot 7001
    7001, 15054,
// P32-P33_P72-P73.agc:551
//			TTPI
// slot 7002
    7002, 3942,
// P32-P33_P72-P73.agc:552
//		DSU	PUSH
// slot 7003
    7003, 34346,
// P32-P33_P72-P73.agc:553
//			TTPIO
// slot 7004
    7004, 2882,
// P32-P33_P72-P73.agc:554
//P33/P73F	ABS	DSU
// slot 7005
    7005, 38220,
// P32-P33_P72-P73.agc:555
//			60MIN
// slot 7006
    7006, 14164,
// P32-P33_P72-P73.agc:556
//		BPL	DAD
// slot 7007
    7007, 36168,
// P32-P33_P72-P73.agc:557
//			P33/P73F
// slot 7008
    7008, 9914,
// P32-P33_P72-P73.agc:558
//			60MIN
// slot 7009
    7009, 14164,
// P32-P33_P72-P73.agc:559
//		SIGN	STADR
// slot 7010
    7010, 38634,
// P32-P33_P72-P73.agc:560
//		STORE	T2TOT3
// slot 7011
    7011, 61602,
// P32-P33_P72-P73.agc:561
//		EXIT
// slot 7012
    7012, 65532
)).

// bank 04, slots 7013-7015
function agcAotUnit417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7013 {
// P32-P33_P72-P73.agc:562
//		CAF	V06N75
// slot 7013
        if slot <> 7013 or instruction <> 14768 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2480), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 7014 {
// P32-P33_P72-P73.agc:563
//		TC	VNPOOH
// slot 7014
            if slot <> 7014 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:564
//		TC	INTPRET
// slot 7015
            if slot <> 7015 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[417] to agcAotUnit417@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:565
//		VLOAD	CALL
// slot 7016
    7016, 38138,
// P32-P33_P72-P73.agc:566
//			DELVEET2
// slot 7017
    7017, 3950,
// P32-P33_P72-P73.agc:567
//			S32/33.1
// slot 7018
    7018, 61022,
// P32-P33_P72-P73.agc:568
//		STCALL	DELVEET2
// slot 7019
    7019, 32622,
// P32-P33_P72-P73.agc:569
//			VN1645
// slot 7020
    7020, 60420,
// P32-P33_P72-P73.agc:570
//		GOTO
// slot 7021
    7021, 65360,
// P32-P33_P72-P73.agc:571
//# Page 660
// P32-P33_P72-P73.agc:572
//			P33/P73B
// slot 7022
    7022, 9816,
// P32-P33_P72-P73.agc:573
//# Page 661
// P32-P33_P72-P73.agc:574
//# ..... AVFLAGA/P .....
// P32-P33_P72-P73.agc:575
//# Page 662
// P32-P33_P72-P73.agc:576
//# ..... DISDVLVC .....
// P32-P33_P72-P73.agc:577
//
// P32-P33_P72-P73.agc:578
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:579
//
// P32-P33_P72-P73.agc:580
//#	 S32/33.X
// P32-P33_P72-P73.agc:581
//#	 VNPOOH
// P32-P33_P72-P73.agc:582
//
// P32-P33_P72-P73.agc:583
//		SETLOC	CDHTAG3
// P32-P33_P72-P73.agc:584
//		BANK
// P32-P33_P72-P73.agc:585
//
// P32-P33_P72-P73.agc:586
//DISDVLVC	STORE	DELVLVC
// slot 34197
    34197, 3594,
// P32-P33_P72-P73.agc:587
//		STQ	CALL
// slot 34198
    34198, 37920,
// P32-P33_P72-P73.agc:588
//			NORMEX
// slot 34199
    34199, 1472,
// P32-P33_P72-P73.agc:589
//			S32/33.X
// slot 34200
    34200, 22834,
// P32-P33_P72-P73.agc:590
//		VLOAD	MXV
// slot 34201
    34201, 53754,
// P32-P33_P72-P73.agc:591
//			DELVLVC
// slot 34202
    34202, 3594,
// P32-P33_P72-P73.agc:592
//			0D
// slot 34203
    34203, 2,
// P32-P33_P72-P73.agc:593
//		VSL1	SXA,1
// slot 34204
    34204, 55540,
// P32-P33_P72-P73.agc:594
//			VERBNOUN
// slot 34205
    34205, 2538,
// P32-P33_P72-P73.agc:595
//		STORE	DELVLVC
// slot 34206
    34206, 3594,
// P32-P33_P72-P73.agc:596
//		EXIT
// slot 34207
    34207, 65532
)).

// bank 37, slots 34208-34210
function agcAotUnit1923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34208 {
// P32-P33_P72-P73.agc:597
//		CA	VERBNOUN
// slot 34208
        if slot <> 34208 or instruction <> 13301 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 1013).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 34209 {
// P32-P33_P72-P73.agc:598
//		TC	VNPOOH
// slot 34209
            if slot <> 34209 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P33_P72-P73.agc:599
//		TC	INTPRET
// slot 34210
            if slot <> 34210 or instruction <> 3078 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3078, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1923] to agcAotUnit1923@.

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:600
//		GOTO
// slot 34211
    34211, 65360,
// P32-P33_P72-P73.agc:601
//			NORMEX
// slot 34212
    34212, 1472,
// P32-P33_P72-P73.agc:602
//		SETLOC	FFTAG12
// P32-P33_P72-P73.agc:603
//		BANK
// P32-P33_P72-P73.agc:604
//
// P32-P33_P72-P73.agc:605
//V06N11		VN	0611
// slot 4526
    4526, 1558,
// P32-P33_P72-P73.agc:606
//V06N13		VN	0613
// slot 4527
    4527, 1562,
// P32-P33_P72-P73.agc:607
//V06N75		VN	0675
// slot 4528
    4528, 1686,
// P32-P33_P72-P73.agc:608
//
// P32-P33_P72-P73.agc:609
//V06N50		VN	0650
// slot 4529
    4529, 1636,
// P32-P33_P72-P73.agc:610
//# Page 663
// P32-P33_P72-P73.agc:611
//# ..... CSI/A .....
// P32-P33_P72-P73.agc:612
//
// P32-P33_P72-P73.agc:613
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:614
//
// P32-P33_P72-P73.agc:615
//#	 VECSHIFT
// P32-P33_P72-P73.agc:616
//#	 TIMETHET
// P32-P33_P72-P73.agc:617
//#	 PERIAPO
// P32-P33_P72-P73.agc:618
//#	 SHIFTR1
// P32-P33_P72-P73.agc:619
//#	 INTINT2C
// P32-P33_P72-P73.agc:620
//#	 CDHMVR
// P32-P33_P72-P73.agc:621
//#	 PERIAPO1
// P32-P33_P72-P73.agc:622
//#	 INTINT
// P32-P33_P72-P73.agc:623
//#	 ACTIVE
// P32-P33_P72-P73.agc:624
//
// P32-P33_P72-P73.agc:625
//		BANK	34
// P32-P33_P72-P73.agc:626
//		SETLOC	CSIPROG
// P32-P33_P72-P73.agc:627
//		BANK
// P32-P33_P72-P73.agc:628
//		EBANK=	SUBEXIT
// P32-P33_P72-P73.agc:629
//		COUNT	34/CSI
// P32-P33_P72-P73.agc:630
//
// P32-P33_P72-P73.agc:631
//60MIN		2DEC	360000
// slot 9129 9130
    9129, 42, 9130, 31872,
// P32-P33_P72-P73.agc:632
//
// P32-P33_P72-P73.agc:633
//ALARM/TB	OCT	00600		# NO 1
// slot 9131
    9131, 768,
// P32-P33_P72-P73.agc:634
//		OCT	00601		#    2
// slot 9132
    9132, 770,
// P32-P33_P72-P73.agc:635
//		OCT	00602		#    3
// slot 9133
    9133, 772,
// P32-P33_P72-P73.agc:636
//		OCT	00603		#    4
// slot 9134
    9134, 774,
// P32-P33_P72-P73.agc:637
//		OCT	00604		#    5
// slot 9135
    9135, 776,
// P32-P33_P72-P73.agc:638
//		OCT	00605		#    6
// slot 9136
    9136, 778,
// P32-P33_P72-P73.agc:639
//		OCT	00606		#    7
// slot 9137
    9137, 780,
// P32-P33_P72-P73.agc:640
//LOOPMX		2DEC	16
// slot 9138 9139
    9138, 0, 9139, 32,
// P32-P33_P72-P73.agc:641
//
// P32-P33_P72-P73.agc:642
//INITST		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// slot 9140 9141
    9140, 6, 9141, 29538,
// P32-P33_P72-P73.agc:643
//
// P32-P33_P72-P73.agc:644
//DVMAX1		2DEC	3.0480 B-7	# MAXIMUM DV1 = 1000 FPS
// slot 9142 9143
    9142, 780, 9143, 4718,
// P32-P33_P72-P73.agc:645
//
// P32-P33_P72-P73.agc:646
//DVMAX2		2DEC	3.014472 B-7	#                989 FPS
// slot 9144 9145
    9144, 770, 9145, 27932,
// P32-P33_P72-P73.agc:647
//
// P32-P33_P72-P73.agc:648
//1DPB2		2DEC	1.08-2
// slot 9146 9147
    9146, 8192, 9147, 0,
// P32-P33_P72-P73.agc:649
//
// P32-P33_P72-P73.agc:650
//1DPB28		2DEC	1
// slot 9148 9149
    9148, 0, 9149, 2,
// P32-P33_P72-P73.agc:651
//
// P32-P33_P72-P73.agc:652
//EPSILN1		2DEC	.0003048 B-7	# .1 FPS
// slot 9150 9151
    9150, 0, 9151, 1278,
// P32-P33_P72-P73.agc:653
//
// P32-P33_P72-P73.agc:654
//FIFPSDP		2DEC	-.152400 B-7	# 50  FPS
// slot 9152 9153
    9152, 65496, 9153, 48914,
// P32-P33_P72-P73.agc:655
//
// P32-P33_P72-P73.agc:656
//DELMAX1		2DEC	.6096000 B-7	# 200 FPS
// slot 9154 9155
    9154, 156, 9155, 944,
// P32-P33_P72-P73.agc:657
//
// P32-P33_P72-P73.agc:658
//		SETLOC	CSI/CDH
// P32-P33_P72-P73.agc:659
//		BANK
// P32-P33_P72-P73.agc:660
//PMINE		2DEC	157420 B-29	# 84 NM. - MUST BE 8 WORDS BEFORE PMINM
// slot 32549 32550
    32549, 8, 32550, 26348,
// P32-P33_P72-P73.agc:661
//# Page 664
// P32-P33_P72-P73.agc:662
//NICKELDP	2DEC	.021336 B-7	# 7 FPS
// slot 32551 32552
    32551, 4, 32552, 23954,
// P32-P33_P72-P73.agc:663
//
// P32-P33_P72-P73.agc:664
//INITST1		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// slot 32553 32554
    32553, 6, 32554, 29538,
// P32-P33_P72-P73.agc:665
//
// P32-P33_P72-P73.agc:666
//ONETHTH		2DEC	.0001 B-3
// slot 32555 32556
    32555, 0, 32556, 6710,
// P32-P33_P72-P73.agc:667
//
// P32-P33_P72-P73.agc:668
//PMINM		2DEC	10668 B-29	# 35000 FT - MUST BE 8 WORDS AFTER PMINE.
// slot 32557 32558
    32557, 0, 32558, 10668,
// P32-P33_P72-P73.agc:669
//
// P32-P33_P72-P73.agc:670
//		SETLOC	CSIPROG
// P32-P33_P72-P73.agc:671
//		BANK
// P32-P33_P72-P73.agc:672
//
// P32-P33_P72-P73.agc:673
//CSI/A		CLEAR	SET		# INITIALIZE INDICATORS
// slot 9156
    9156, 35864,
// P32-P33_P72-P73.agc:674
//			S32.1F1		# DVT1 HAS EXCEEDED MAX INDICATOR
// slot 9157
    9157, 5984,
// P32-P33_P72-P73.agc:675
//			S32.1F2		# FIRST PASS FOR NEWTON ITERATION INDICATR
// slot 9158
    9158, 5730,
// P32-P33_P72-P73.agc:676
//		CLEAR	SET
// slot 9159
    9159, 35864,
// P32-P33_P72-P73.agc:677
//			S32.1F3A	# 00=1ST 2 PASSES 2ND CYCLE 01=FIRST CYCLE
// slot 9160
    9160, 5988,
// P32-P33_P72-P73.agc:678
//			S32.1F3B	# 10=2ND CYCLE, 11=50 FPS STAGE 2ND CYCLE
// slot 9161
    9161, 5734,
// P32-P33_P72-P73.agc:679
//		DLOAD
// slot 9162
    9162, 65482,
// P32-P33_P72-P73.agc:680
//			ZEROVEC
// slot 9163
    9163, 9964,
// P32-P33_P72-P73.agc:681
//		STORE	LOOPCT
// slot 9164
    9164, 4072,
// P32-P33_P72-P73.agc:682
//		STORE	CSIALRM
// slot 9165
    9165, 3946,
// P32-P33_P72-P73.agc:683
//CSI/B		SETPD	VLOAD
// slot 9166
    9166, 64770,
// P32-P33_P72-P73.agc:684
//			0D
// slot 9167
    9167, 2,
// P32-P33_P72-P73.agc:685
//			RACT1
// slot 9168
    9168, 2754,
// P32-P33_P72-P73.agc:686
//		ABVAL	PUSH		# RA1                            B29 PL02D
// slot 9169
    9169, 34380,
// P32-P33_P72-P73.agc:687
//		NORM	SR1
// slot 9170
    9170, 57986,
// P32-P33_P72-P73.agc:688
//			X2		#                         B29-N2+ B1 PL04D
// slot 9171
    9171, 80,
// P32-P33_P72-P73.agc:689
//		PDVL	ABVAL
// slot 9172
    9172, 42650,
// P32-P33_P72-P73.agc:690
//			RPASS3
// slot 9173
    9173, 3800,
// P32-P33_P72-P73.agc:691
//		NORM	BDDV		# RA1/RP3                         B1 PL02D
// slot 9174
    9174, 46466,
// P32-P33_P72-P73.agc:692
//			X1
// slot 9175
    9175, 78,
// P32-P33_P72-P73.agc:693
//		XSU,2	SR*		#                                 B2
// slot 9176
    9176, 44904,
// P32-P33_P72-P73.agc:694
//			X1
// slot 9177
    9177, 76,
// P32-P33_P72-P73.agc:695
//			1,2
// slot 9178
    9178, 48378,
// P32-P33_P72-P73.agc:696
//		DAD	DMP		# (1+(RA1/RP3))RA1        B29+B2=B31 PL00D
// slot 9179
    9179, 34074,
// P32-P33_P72-P73.agc:697
//			1DPB2
// slot 9180
    9180, 14198,
// P32-P33_P72-P73.agc:698
//		NORM	PDDL		#                                    PL02D
// slot 9181
    9181, 54658,
// P32-P33_P72-P73.agc:699
//			X1
// slot 9182
    9182, 78,
// P32-P33_P72-P73.agc:700
//			RTMU
// slot 9183
    9183, 4048,
// P32-P33_P72-P73.agc:701
//		SR1	DDV		#                        B38-B31= B7 PL00D
// slot 9184
    9184, 47556,
// P32-P33_P72-P73.agc:702
//		SL*	SQRT		#                                 B7
// slot 9185
    9185, 63070,
// P32-P33_P72-P73.agc:703
//			0 -7,1
// slot 9186
    9186, 16628,
// P32-P33_P72-P73.agc:704
//		PDVL	UNIT		#                                    PL02D
// slot 9187
    9187, 44698,
// P32-P33_P72-P73.agc:705
//			RACT1
// slot 9188
    9188, 2754,
// P32-P33_P72-P73.agc:706
//		PDVL	VXV
// slot 9189
    9189, 40346,
// P32-P33_P72-P73.agc:707
//			UP1
// slot 9190
    9190, 2834,
// P32-P33_P72-P73.agc:708
//		UNIT			# UNIT(URP1 X UVP1 X URA1) = UH1
// slot 9191
    9191, 65372,
// P32-P33_P72-P73.agc:709
//		DOT	SL1		# VA1 . UH1                       B7
// slot 9192
    9192, 59970,
// P32-P33_P72-P73.agc:710
//			VACT1
// slot 9193
    9193, 3720,
// P32-P33_P72-P73.agc:711
//		BDSU	STADR		#                                    PL00D
// slot 9194
    9194, 38434,
// P32-P33_P72-P73.agc:712
//# Page 665
// P32-P33_P72-P73.agc:713
//		STODL	DELVCSI
// slot 9195
    9195, 49562,
// P32-P33_P72-P73.agc:714
//			INITST		# 10 FPS
// slot 9196
    9196, 14186,
// P32-P33_P72-P73.agc:715
//		STORE	DELDV
// slot 9197
    9197, 3688,
// P32-P33_P72-P73.agc:716
//CSI/B1		DLOAD	DAD		# IF LOOPCT = 16
// slot 9198
    9198, 36298,
// P32-P33_P72-P73.agc:717
//			LOOPCT
// slot 9199
    9199, 4072,
// P32-P33_P72-P73.agc:718
//			1DPB28
// slot 9200
    9200, 14202,
// P32-P33_P72-P73.agc:719
//		STORE	LOOPCT
// slot 9201
    9201, 4072,
// P32-P33_P72-P73.agc:720
//		DSU	AXT,2
// slot 9202
    9202, 64554,
// P32-P33_P72-P73.agc:721
//			LOOPMX
// slot 9203
    9203, 14182,
// P32-P33_P72-P73.agc:722
//			6
// slot 9204
    9204, 12,
// P32-P33_P72-P73.agc:723
//		BPL	GOTO
// slot 9205
    9205, 43080,
// P32-P33_P72-P73.agc:724
//			SCNDSOL
// slot 9206
    9206, 53060,
// P32-P33_P72-P73.agc:725
//			CSI/B2
// slot 9207
    9207, 20502,
// P32-P33_P72-P73.agc:726
//
// P32-P33_P72-P73.agc:727
//		SETLOC	CSIPROG2
// P32-P33_P72-P73.agc:728
//		BANK
// P32-P33_P72-P73.agc:729
//
// P32-P33_P72-P73.agc:730
//CSI/B2		SETPD
// slot 12299
    12299, 65282
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:731
//			0D
// slot 12300
    12300, 2,
// P32-P33_P72-P73.agc:732
//		DLOAD	ABS
// slot 12301
    12301, 42698,
// P32-P33_P72-P73.agc:733
//			DELVCSI
// slot 12302
    12302, 3684,
// P32-P33_P72-P73.agc:734
//		DSU	BMN
// slot 12303
    12303, 41002,
// P32-P33_P72-P73.agc:735
//			DVMAX1
// slot 12304
    12304, 14190,
// P32-P33_P72-P73.agc:736
//			CSI/B23
// slot 12305
    12305, 38254,
// P32-P33_P72-P73.agc:737
//		AXT,2	BON
// slot 12306
    12306, 36088,
// P32-P33_P72-P73.agc:738
//			7
// slot 12307
    12307, 14,
// P32-P33_P72-P73.agc:739
//			S32.1F1
// slot 12308
    12308, 6016,
// P32-P33_P72-P73.agc:740
//			SCNDSOL
// slot 12309
    12309, 53060,
// P32-P33_P72-P73.agc:741
//		BOFF	BON
// slot 12310
    12310, 35864,
// P32-P33_P72-P73.agc:742
//			S32.1F3A
// slot 12311
    12311, 6084,
// P32-P33_P72-P73.agc:743
//			CSI/B22		# FLAG 3 NEQ 3
// slot 12312
    12312, 20534,
// P32-P33_P72-P73.agc:744
//			S32.1F3B
// slot 12313
    12313, 6022,
// P32-P33_P72-P73.agc:745
//			SCNDSOL
// slot 12314
    12314, 53060,
// P32-P33_P72-P73.agc:746
//CSI/B22		SET	DLOAD
// slot 12315
    12315, 58648,
// P32-P33_P72-P73.agc:747
//			S32.1F1
// slot 12316
    12316, 5728,
// P32-P33_P72-P73.agc:748
//			DVMAX2
// slot 12317
    12317, 14194,
// P32-P33_P72-P73.agc:749
//		SIGN
// slot 12318
    12318, 65514,
// P32-P33_P72-P73.agc:750
//			DELVCSI
// slot 12319
    12319, 3684,
// P32-P33_P72-P73.agc:751
//		STCALL	DELVCSI
// slot 12320
    12320, 32356,
// P32-P33_P72-P73.agc:752
//			CSI/B23
// slot 12321
    12321, 38254,
// P32-P33_P72-P73.agc:753
//
// P32-P33_P72-P73.agc:754
//		SETLOC	CSIPROG3
// P32-P33_P72-P73.agc:755
//		BANK
// P32-P33_P72-P73.agc:756
//
// P32-P33_P72-P73.agc:757
//CSI/B23		VLOAD	PUSH
// slot 21175
    21175, 34554,
// P32-P33_P72-P73.agc:758
//			RACT1
// slot 21176
    21176, 2754,
// P32-P33_P72-P73.agc:759
//		UNIT	PDVL
// slot 21177
    21177, 52572,
// P32-P33_P72-P73.agc:760
//			UP1
// slot 21178
    21178, 2834,
// P32-P33_P72-P73.agc:761
//		VXV	UNIT		# UNIT(URP1 X UVP1 X URA1) = UH1
// slot 21179
    21179, 44602,
// P32-P33_P72-P73.agc:762
//		VXSC	VSL1
// slot 21180
    21180, 64226,
// P32-P33_P72-P73.agc:763
//# Page 666
// P32-P33_P72-P73.agc:764
//			DELVCSI
// slot 21181
    21181, 3684,
// P32-P33_P72-P73.agc:765
//		STORE	DELVEET1
// slot 21182
    21182, 2634,
// P32-P33_P72-P73.agc:766
//		VAD	BOV
// slot 21183
    21183, 32858,
// P32-P33_P72-P73.agc:767
//			VACT1
// slot 21184
    21184, 3720,
// P32-P33_P72-P73.agc:768
//			CSI/B23D
// slot 21185
    21185, 38276,
// P32-P33_P72-P73.agc:769
//CSI/B23D	STCALL	VACT4
// slot 21186
    21186, 32376,
// P32-P33_P72-P73.agc:770
//			VECSHIFT
// slot 21187
    21187, 38230,
// P32-P33_P72-P73.agc:771
//		STOVL	VVEC
// slot 21188
    21188, 23500,
// P32-P33_P72-P73.agc:772
//		SET
// slot 21189
    21189, 65304,
// P32-P33_P72-P73.agc:773
//			RVSW
// slot 21190
    21190, 3692,
// P32-P33_P72-P73.agc:774
//		STOVL	RVEC
// slot 21191
    21191, 23390,
// P32-P33_P72-P73.agc:775
//			SN359+
// slot 21192
    21192, 5676,
// P32-P33_P72-P73.agc:776
//		STCALL	SNTH		# ALSO CSTH
// slot 21193
    21193, 31668,
// P32-P33_P72-P73.agc:777
//			TIMETHET
// slot 21194
    21194, 21448,
// P32-P33_P72-P73.agc:778
//		SR1	LXA,1
// slot 21195
    21195, 59588,
// P32-P33_P72-P73.agc:779
//			RTX1
// slot 21196
    21196, 4042,
// P32-P33_P72-P73.agc:780
//		STCALL	HAFPA1
// slot 21197
    21197, 32372,
// P32-P33_P72-P73.agc:781
//			PERIAPO
// slot 21198
    21198, 38118,
// P32-P33_P72-P73.agc:782
//		CALL
// slot 21199
    21199, 65320,
// P32-P33_P72-P73.agc:783
//			SHIFTR1
// slot 21200
    21200, 38246,
// P32-P33_P72-P73.agc:784
//		STODL	POSTCSI
// slot 21201
    21201, 15968,
// P32-P33_P72-P73.agc:785
//			CENTANG
// slot 21202
    21202, 4056,
// P32-P33_P72-P73.agc:786
//		BZE	GOTO
// slot 21203
    21203, 43096,
// P32-P33_P72-P73.agc:787
//			+2
// slot 21204
    21204, 38316,
// P32-P33_P72-P73.agc:788
//			CIRCL
// slot 21205
    21205, 40138,
// P32-P33_P72-P73.agc:789
//		DLOAD
// slot 21206
    21206, 65482,
// P32-P33_P72-P73.agc:790
//			ECC
// slot 21207
    21207, 3032,
// P32-P33_P72-P73.agc:791
//		DSU	BMN
// slot 21208
    21208, 41002,
// P32-P33_P72-P73.agc:792
//			ONETHTH
// slot 21209
    21209, 28248,
// P32-P33_P72-P73.agc:793
//			CIRCL
// slot 21210
    21210, 40138,
// P32-P33_P72-P73.agc:794
//		DLOAD	CALL
// slot 21211
    21211, 38090,
// P32-P33_P72-P73.agc:795
//			R1
// slot 21212
    21212, 66,
// P32-P33_P72-P73.agc:796
//			SHIFTR1
// slot 21213
    21213, 38246,
// P32-P33_P72-P73.agc:797
//		SETPD	NORM
// slot 21214
    21214, 49410,
// P32-P33_P72-P73.agc:798
//			2D
// slot 21215
    21215, 6,
// P32-P33_P72-P73.agc:799
//			X1
// slot 21216
    21216, 78,
// P32-P33_P72-P73.agc:800
//		PDVL	DOT		#                                    PL04D
// slot 21217
    21217, 41370,
// P32-P33_P72-P73.agc:801
//			RACT1
// slot 21218
    21218, 2754,
// P32-P33_P72-P73.agc:802
//			VACT4
// slot 21219
    21219, 3704,
// P32-P33_P72-P73.agc:803
//		ABS	DDV
// slot 21220
    21220, 47436,
// P32-P33_P72-P73.agc:804
//			02D		# (/RDOTV/)/R1		B36-B29= B7
// slot 21221
    21221, 6,
// P32-P33_P72-P73.agc:805
//		SL*	DSU
// slot 21222
    21222, 38238,
// P32-P33_P72-P73.agc:806
//			0,1
// slot 21223
    21223, 16642,
// P32-P33_P72-P73.agc:807
//			NICKELDP
// slot 21224
    21224, 28240,
// P32-P33_P72-P73.agc:808
//		BMN	DLOAD
// slot 21225
    21225, 58688,
// P32-P33_P72-P73.agc:809
//			CIRCL
// slot 21226
    21226, 40138,
// P32-P33_P72-P73.agc:810
//			P
// slot 21227
    21227, 3012,
// P32-P33_P72-P73.agc:811
//		SL2	DSU
// slot 21228
    21228, 38292,
// P32-P33_P72-P73.agc:812
//			1RTEB2		# 1.B.2
// slot 21229
    21229, 28292,
// P32-P33_P72-P73.agc:813
//		STODL	14D
// slot 21230
    21230, 12318,
// P32-P33_P72-P73.agc:814
//# Page 667
// P32-P33_P72-P73.agc:815
//			RTSR1/MU
// slot 21231
    21231, 4052,
// P32-P33_P72-P73.agc:816
//		SR1	DDV		# (1/ROOTMU)/R1      B-16-B29 = B-45 PL02D
// slot 21232
    21232, 47556,
// P32-P33_P72-P73.agc:817
//		PDDL	DMP
// slot 21233
    21233, 34218,
// P32-P33_P72-P73.agc:818
//			P
// slot 21234
    21234, 3012,
// P32-P33_P72-P73.agc:819
//			R1
// slot 21235
    21235, 66,
// P32-P33_P72-P73.agc:820
//		CALL
// slot 21236
    21236, 65320,
// P32-P33_P72-P73.agc:821
//			SHIFTR1
// slot 21237
    21237, 38246,
// P32-P33_P72-P73.agc:822
//		SL4	SL1
// slot 21238
    21238, 59924,
// P32-P33_P72-P73.agc:823
//		SQRT	DMP		# ((P/MU)**.5)/R1    B14+B-45 = B-31 PL02D
// slot 21239
    21239, 34284,
// P32-P33_P72-P73.agc:824
//		BOFF	SL3
// slot 21240
    21240, 43544,
// P32-P33_P72-P73.agc:825
//			CMOONFLG
// slot 21241
    21241, 4550,
// P32-P33_P72-P73.agc:826
//			CSI/B3
// slot 21242
    21242, 38390,
// P32-P33_P72-P73.agc:827
//CSI/B3		PDVL	DOT
// slot 21243
    21243, 41370,
// P32-P33_P72-P73.agc:828
//			RACT1
// slot 21244
    21244, 2754,
// P32-P33_P72-P73.agc:829
//			VACT4
// slot 21245
    21245, 3704,
// P32-P33_P72-P73.agc:830
//		STORE	RDOTV
// slot 21246
    21246, 3716,
// P32-P33_P72-P73.agc:831
//		ABS
// slot 21247
    21247, 65356,
// P32-P33_P72-P73.agc:832
//		NORM	DMP		# ((P/MU)**.5)RDOTV/R1               PL02D
// slot 21248
    21248, 34178,
// P32-P33_P72-P73.agc:833
//			X2
// slot 21249
    21249, 80,
// P32-P33_P72-P73.agc:834
//		XSU,1	SL*		#			B-31+B36-B3 = B2
// slot 21250
    21250, 44896,
// P32-P33_P72-P73.agc:835
//			X2
// slot 21251
    21251, 78,
// P32-P33_P72-P73.agc:836
//			3,1
// slot 21252
    21252, 16648,
// P32-P33_P72-P73.agc:837
//		STODL	12D
// slot 21253
    21253, 12314,
// P32-P33_P72-P73.agc:838
//			ZEROVECS
// slot 21254
    21254, 13754,
// P32-P33_P72-P73.agc:839
//		STORE	16D
// slot 21255
    21255, 34,
// P32-P33_P72-P73.agc:840
//		VLOAD	UNIT
// slot 21256
    21256, 44794,
// P32-P33_P72-P73.agc:841
//			12D
// slot 21257
    21257, 26,
// P32-P33_P72-P73.agc:842
//		STOVL	SNTH		# ALSO STORES CSTH AND 0
// slot 21258
    21258, 23476,
// P32-P33_P72-P73.agc:843
//			RACT1
// slot 21259
    21259, 2754,
// P32-P33_P72-P73.agc:844
//		PDVL	SIGN
// slot 21260
    21260, 62874,
// P32-P33_P72-P73.agc:845
//			VACT4
// slot 21261
    21261, 3704,
// P32-P33_P72-P73.agc:846
//			RDOTV
// slot 21262
    21262, 3716,
// P32-P33_P72-P73.agc:847
//		VCOMP	CALL
// slot 21263
    21263, 38012,
// P32-P33_P72-P73.agc:848
//			VECSHIFT
// slot 21264
    21264, 38230,
// P32-P33_P72-P73.agc:849
//		STOVL	VVEC
// slot 21265
    21265, 23500,
// P32-P33_P72-P73.agc:850
//		SETGO
// slot 21266
    21266, 65304,
// P32-P33_P72-P73.agc:851
//			RVSW
// slot 21267
    21267, 3628,
// P32-P33_P72-P73.agc:852
//			CSINEXT
// slot 21268
    21268, 40120,
// P32-P33_P72-P73.agc:853
//
// P32-P33_P72-P73.agc:854
//SN359+		2DEC	-.000086601
// slot 21269 21270
    21269, 65532, 21270, 51808,
// P32-P33_P72-P73.agc:855
//
// P32-P33_P72-P73.agc:856
//CS359+		2DEC	+.499999992
// slot 21271 21272
    21271, 16382, 21272, 32764,
// P32-P33_P72-P73.agc:857
//
// P32-P33_P72-P73.agc:858
//		SETLOC	CSIPROG4
// P32-P33_P72-P73.agc:859
//		BANK
// P32-P33_P72-P73.agc:860
//
// P32-P33_P72-P73.agc:861
//CSINEXT		STCALL	RVEC
// slot 22108
    22108, 31582
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:862
//			TIMETHET
// slot 22109
    22109, 21448,
// P32-P33_P72-P73.agc:863
//		PDDL	BPL
// slot 22110
    22110, 42154,
// P32-P33_P72-P73.agc:864
//			RDOTV
// slot 22111
    22111, 3716,
// P32-P33_P72-P73.agc:865
//# Page 668
// P32-P33_P72-P73.agc:866
//			NTP/2
// slot 22112
    22112, 40146,
// P32-P33_P72-P73.agc:867
//		DLOAD	DSU
// slot 22113
    22113, 38346,
// P32-P33_P72-P73.agc:868
//			HAFPA1
// slot 22114
    22114, 3700,
// P32-P33_P72-P73.agc:869
//		PUSH	GOTO
// slot 22115
    22115, 43020,
// P32-P33_P72-P73.agc:870
//			NTP/2
// slot 22116
    22116, 40146,
// P32-P33_P72-P73.agc:871
//CIRCL		SETPD	DLOAD
// slot 22117
    22117, 58626,
// P32-P33_P72-P73.agc:872
//			00D
// slot 22118
    22118, 2,
// P32-P33_P72-P73.agc:873
//			ZEROVECS
// slot 22119
    22119, 13754,
// P32-P33_P72-P73.agc:874
//		PUSH
// slot 22120
    22120, 65292,
// P32-P33_P72-P73.agc:875
//NTP/2		DLOAD	DMP
// slot 22121
    22121, 34250,
// P32-P33_P72-P73.agc:876
//			NN
// slot 22122
    22122, 4076,
// P32-P33_P72-P73.agc:877
//			HAFPA1
// slot 22123
    22123, 3700,
// P32-P33_P72-P73.agc:878
//		SL	DSU
// slot 22124
    22124, 38242,
// P32-P33_P72-P73.agc:879
//			14D
// slot 22125
    22125, 16670,
// P32-P33_P72-P73.agc:880
//		DAD
// slot 22126
    22126, 65306,
// P32-P33_P72-P73.agc:881
//			TCSI
// slot 22127
    22127, 2878,
// P32-P33_P72-P73.agc:882
//		STORE	TCDH
// slot 22128
    22128, 2874,
// P32-P33_P72-P73.agc:883
//		BDSU	AXT,2
// slot 22129
    22129, 64546,
// P32-P33_P72-P73.agc:884
//			TTPI
// slot 22130
    22130, 3942,
// P32-P33_P72-P73.agc:885
//			5D
// slot 22131
    22131, 10,
// P32-P33_P72-P73.agc:886
//		BMN	SETPD
// slot 22132
    22132, 33088,
// P32-P33_P72-P73.agc:887
//			SCNDSOL
// slot 22133
    22133, 53060,
// P32-P33_P72-P73.agc:888
//			0D
// slot 22134
    22134, 2,
// P32-P33_P72-P73.agc:889
//		VLOAD	PDVL
// slot 22135
    22135, 52730,
// P32-P33_P72-P73.agc:890
//			VACT4
// slot 22136
    22136, 3704,
// P32-P33_P72-P73.agc:891
//			RACT1
// slot 22137
    22137, 2754,
// P32-P33_P72-P73.agc:892
//		CALL
// slot 22138
    22138, 65320,
// P32-P33_P72-P73.agc:893
//			INTINT2C
// slot 22139
    22139, 53092,
// P32-P33_P72-P73.agc:894
//		STOVL	RACT2
// slot 22140
    22140, 23126,
// P32-P33_P72-P73.agc:895
//			VATT
// slot 22141
    22141, 14,
// P32-P33_P72-P73.agc:896
//		STOVL	VACT2
// slot 22142
    22142, 23222,
// P32-P33_P72-P73.agc:897
//			VPASS1
// slot 22143
    22143, 3732,
// P32-P33_P72-P73.agc:898
//		SETPD	PDVL
// slot 22144
    22144, 52482,
// P32-P33_P72-P73.agc:899
//			0D
// slot 22145
    22145, 2,
// P32-P33_P72-P73.agc:900
//			RPASS1
// slot 22146
    22146, 4060,
// P32-P33_P72-P73.agc:901
//		GOTO
// slot 22147
    22147, 65360,
// P32-P33_P72-P73.agc:902
//			CSINEXT1
// slot 22148
    22148, 18780,
// P32-P33_P72-P73.agc:903
//
// P32-P33_P72-P73.agc:904
//		SETLOC	CSIPROG5
// P32-P33_P72-P73.agc:905
//		BANK
// P32-P33_P72-P73.agc:906
//
// P32-P33_P72-P73.agc:907
//CSINEXT1	CALL
// slot 11438
    11438, 65320,
// P32-P33_P72-P73.agc:908
//			INTINT2C
// slot 11439
    11439, 53092,
// P32-P33_P72-P73.agc:909
//		STOVL	RPASS2
// slot 11440
    11440, 23338,
// P32-P33_P72-P73.agc:910
//			VATT
// slot 11441
    11441, 14,
// P32-P33_P72-P73.agc:911
//		STCALL	VPASS2
// slot 11442
    11442, 31518,
// P32-P33_P72-P73.agc:912
//			CDHMVR
// slot 11443
    11443, 11568,
// P32-P33_P72-P73.agc:913
//		VLOAD	SETPD
// slot 11444
    11444, 33274,
// P32-P33_P72-P73.agc:914
//			RACT2
// slot 11445
    11445, 2646,
// P32-P33_P72-P73.agc:915
//			0D
// slot 11446
    11446, 2,
// P32-P33_P72-P73.agc:916
//# Page 669
// P32-P33_P72-P73.agc:917
//		PDVL	CALL
// slot 11447
    11447, 38042,
// P32-P33_P72-P73.agc:918
//			VACT3
// slot 11448
    11448, 3788,
// P32-P33_P72-P73.agc:919
//			PERIAPO1
// slot 11449
    11449, 38102,
// P32-P33_P72-P73.agc:920
//		CALL
// slot 11450
    11450, 65320,
// P32-P33_P72-P73.agc:921
//			SHIFTR1
// slot 11451
    11451, 38246,
// P32-P33_P72-P73.agc:922
//		STOVL	POSTCDH
// slot 11452
    11452, 24180,
// P32-P33_P72-P73.agc:923
//			VACT3
// slot 11453
    11453, 3788,
// P32-P33_P72-P73.agc:924
//		SETPD	PDVL
// slot 11454
    11454, 52482,
// P32-P33_P72-P73.agc:925
//			0D
// slot 11455
    11455, 2,
// P32-P33_P72-P73.agc:926
//			RACT2
// slot 11456
    11456, 2646,
// P32-P33_P72-P73.agc:927
//		PDDL	PDDL
// slot 11457
    11457, 54698,
// P32-P33_P72-P73.agc:928
//			TCDH
// slot 11458
    11458, 2874,
// P32-P33_P72-P73.agc:929
//			TTPI
// slot 11459
    11459, 3942,
// P32-P33_P72-P73.agc:930
//		PDDL	SL2
// slot 11460
    11460, 51882,
// P32-P33_P72-P73.agc:931
//			2PISC
// slot 11461
    11461, 10032,
// P32-P33_P72-P73.agc:932
//		PUSH	CALL
// slot 11462
    11462, 37900,
// P32-P33_P72-P73.agc:933
//			INTINT
// slot 11463
    11463, 60298,
// P32-P33_P72-P73.agc:934
//		CALL
// slot 11464
    11464, 65320,
// P32-P33_P72-P73.agc:935
//			ACTIVE
// slot 11465
    11465, 38206,
// P32-P33_P72-P73.agc:936
//		DLOAD
// slot 11466
    11466, 65482,
// P32-P33_P72-P73.agc:937
//			ELEV
// slot 11467
    11467, 4040,
// P32-P33_P72-P73.agc:938
//		SETPD	SINE
// slot 11468
    11468, 60930,
// P32-P33_P72-P73.agc:939
//			6D
// slot 11469
    11469, 14,
// P32-P33_P72-P73.agc:940
//		PDVL	UNIT
// slot 11470
    11470, 44698,
// P32-P33_P72-P73.agc:941
//			RACT3
// slot 11471
    11471, 3776,
// P32-P33_P72-P73.agc:942
//		STORE	00D		# URA3 AT 00D
// slot 11472
    11472, 2,
// P32-P33_P72-P73.agc:943
//		PDVL	VXV		# PL14D,PL08D
// slot 11473
    11473, 40346,
// P32-P33_P72-P73.agc:944
//			UP1
// slot 11474
    11474, 2834,
// P32-P33_P72-P73.agc:945
//		UNIT
// slot 11475
    11475, 65372,
// P32-P33_P72-P73.agc:946
//		PDDL	COSINE		# UNIT(URA3XUVA3XURA3) = UH3      B1 PL14D
// slot 11476
    11476, 59050,
// P32-P33_P72-P73.agc:947
//			ELEV
// slot 11477
    11477, 4040,
// P32-P33_P72-P73.agc:948
//		VXSC	STADR		# (COSLOS)(UH3)                   B2 PL08D
// slot 11478
    11478, 38626,
// P32-P33_P72-P73.agc:949
//		STCALL	18D		#		PLUS
// slot 11479
    11479, 36824,
// P32-P33_P72-P73.agc:950
//			CSINEXT2
// slot 11480
    11480, 15006,
// P32-P33_P72-P73.agc:951
//
// P32-P33_P72-P73.agc:952
//		SETLOC	CSIPROG6
// P32-P33_P72-P73.agc:953
//		BANK
// P32-P33_P72-P73.agc:954
//
// P32-P33_P72-P73.agc:955
//CSINEXT2	DLOAD	VXSC		# (SINLOS)(URA3) = U              B2 PL00D
// slot 9551
    9551, 61898,
// P32-P33_P72-P73.agc:956
//		VAD	VSL1
// slot 9552
    9552, 64090,
// P32-P33_P72-P73.agc:957
//			18D		#                                 B1
// slot 9553
    9553, 38,
// P32-P33_P72-P73.agc:958
//		PUSH	DOT		#                                    PL06D
// slot 9554
    9554, 41228,
// P32-P33_P72-P73.agc:959
//			RACT3		# (U . RA3) = TEMP1      B1 +B29=B30
// slot 9555
    9555, 3776,
// P32-P33_P72-P73.agc:960
//		SL1	PUSH		#                                B29 PL08D
// slot 9556
    9556, 34516,
// P32-P33_P72-P73.agc:961
//		DSQ	TLOAD		# TEMP1**2                       B58
// slot 9557
    9557, 59804,
// P32-P33_P72-P73.agc:962
//			MPAC
// slot 9558
    9558, 218,
// P32-P33_P72-P73.agc:963
//		PDVL	DOT		#                                    PL11D
// slot 9559
    9559, 41370,
// P32-P33_P72-P73.agc:964
//			RACT3
// slot 9560
    9560, 3776,
// P32-P33_P72-P73.agc:965
//			RACT3
// slot 9561
    9561, 3776,
// P32-P33_P72-P73.agc:966
//		TLOAD	DCOMP		# RA3.RA3
// slot 9562
    9562, 48850,
// P32-P33_P72-P73.agc:967
//# Page 670
// P32-P33_P72-P73.agc:968
//			MPAC
// slot 9563
    9563, 218,
// P32-P33_P72-P73.agc:969
//		PDVL	DOT		# RP3.RP3                        B58 PL14D
// slot 9564
    9564, 41370,
// P32-P33_P72-P73.agc:970
//			RPASS3
// slot 9565
    9565, 3800,
// P32-P33_P72-P73.agc:971
//			RPASS3		#                                    PL11D
// slot 9566
    9566, 3800,
// P32-P33_P72-P73.agc:972
//		TAD	TAD		# TEMP1**2+RA3.RA3+RP3.RP3=TEMP2     PL08D
// slot 9567
    9567, 63986,
// P32-P33_P72-P73.agc:973
//		BPL	DLOAD
// slot 9568
    9568, 58696,
// P32-P33_P72-P73.agc:974
//			K10RK2
// slot 9569
    9569, 15070,
// P32-P33_P72-P73.agc:975
//			LOOPCT
// slot 9570
    9570, 4072,
// P32-P33_P72-P73.agc:976
//		DSU	AXT,2
// slot 9571
    9571, 64554,
// P32-P33_P72-P73.agc:977
//			1DPB28
// slot 9572
    9572, 14202,
// P32-P33_P72-P73.agc:978
//			1D
// slot 9573
    9573, 2,
// P32-P33_P72-P73.agc:979
//		BZE
// slot 9574
    9574, 65368,
// P32-P33_P72-P73.agc:980
//			ALMXITA
// slot 9575
    9575, 9624,
// P32-P33_P72-P73.agc:981
//		DLOAD	SR1
// slot 9576
    9576, 58058,
// P32-P33_P72-P73.agc:982
//			DELDV
// slot 9577
    9577, 3688,
// P32-P33_P72-P73.agc:983
//		STORE	DELDV
// slot 9578
    9578, 3688,
// P32-P33_P72-P73.agc:984
//		BDSU
// slot 9579
    9579, 65314,
// P32-P33_P72-P73.agc:985
//			DVPREV
// slot 9580
    9580, 3696,
// P32-P33_P72-P73.agc:986
//		STCALL	DELVCSI
// slot 9581
    9581, 32356,
// P32-P33_P72-P73.agc:987
//			CSI/B1
// slot 9582
    9582, 14300,
// P32-P33_P72-P73.agc:988
//K10RK2		SQRT	PUSH		# TEMP3 = TEMP2**.5              B29 PL10D
// slot 9583
    9583, 34540,
// P32-P33_P72-P73.agc:989
//		DCOMP	DSU
// slot 9584
    9584, 38268
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:990
//			06D		# -TEMP1-TEMP3 =K2 AT 10D
// slot 9585
    9585, 14,
// P32-P33_P72-P73.agc:991
//		STODL	10D		#                                    PL08D
// slot 9586
    9586, 12310,
// P32-P33_P72-P73.agc:992
//		DSU	STADR		#                                    PL06D
// slot 9587
    9587, 38442,
// P32-P33_P72-P73.agc:993
//		STORE	12D		# -TEMP1+TEMP3 =K1 AT 12D
// slot 9588
    9588, 65508,
// P32-P33_P72-P73.agc:994
//		ABS
// slot 9589
    9589, 65356,
// P32-P33_P72-P73.agc:995
//		STODL	14D
// slot 9590
    9590, 12318,
// P32-P33_P72-P73.agc:996
//			10D
// slot 9591
    9591, 22,
// P32-P33_P72-P73.agc:997
//		ABS	DSU
// slot 9592
    9592, 38220,
// P32-P33_P72-P73.agc:998
//			14D
// slot 9593
    9593, 30,
// P32-P33_P72-P73.agc:999
//		BMN	DLOAD
// slot 9594
    9594, 58688,
// P32-P33_P72-P73.agc:1000
//			K2.
// slot 9595
    9595, 40964,
// P32-P33_P72-P73.agc:1001
//			12D
// slot 9596
    9596, 26,
// P32-P33_P72-P73.agc:1002
//		STCALL	10D		# K EQUALS K1
// slot 9597
    9597, 28694,
// P32-P33_P72-P73.agc:1003
//			K2.
// slot 9598
    9598, 40964,
// P32-P33_P72-P73.agc:1004
//
// P32-P33_P72-P73.agc:1005
//		SETLOC	CSIPROG7
// P32-P33_P72-P73.agc:1006
//		BANK
// P32-P33_P72-P73.agc:1007
//
// P32-P33_P72-P73.agc:1008
//K2.		DLOAD
// slot 22530
    22530, 65482,
// P32-P33_P72-P73.agc:1009
//			10D
// slot 22531
    22531, 22,
// P32-P33_P72-P73.agc:1010
//		VXSC	VSL1
// slot 22532
    22532, 64226,
// P32-P33_P72-P73.agc:1011
//		VAD	UNIT		# V=RA3+KU  UNIT                  B1
// slot 22533
    22533, 44634,
// P32-P33_P72-P73.agc:1012
//			RACT3
// slot 22534
    22534, 3776,
// P32-P33_P72-P73.agc:1013
//		PDVL	UNIT		#                                    PL06D
// slot 22535
    22535, 44698,
// P32-P33_P72-P73.agc:1014
//			RPASS3
// slot 22536
    22536, 3800,
// P32-P33_P72-P73.agc:1015
//		PDVL	UNIT		#                                    PL12D
// slot 22537
    22537, 44698,
// P32-P33_P72-P73.agc:1016
//			VPASS3
// slot 22538
    22538, 3812,
// P32-P33_P72-P73.agc:1017
//		VXV	PDVL		# UVP3 X URP3                        PL18D
// slot 22539
    22539, 52538,
// P32-P33_P72-P73.agc:1018
//# Page 671
// P32-P33_P72-P73.agc:1019
//			06D
// slot 22540
    22540, 14,
// P32-P33_P72-P73.agc:1020
//			06D
// slot 22541
    22541, 14,
// P32-P33_P72-P73.agc:1021
//		VXV	DOT
// slot 22542
    22542, 41274,
// P32-P33_P72-P73.agc:1022
//			00D
// slot 22543
    22543, 2,
// P32-P33_P72-P73.agc:1023
//		STADR			#                                    PL12D
// slot 22544
    22544, 65324,
// P32-P33_P72-P73.agc:1024
//		STOVL	12D		# (URP3XV).(UVP3XURP3)=TEMP          PL06D
// slot 22545
    22545, 45028,
// P32-P33_P72-P73.agc:1025
//		DOT	SL1		#                                    PL00D
// slot 22546
    22546, 59970,
// P32-P33_P72-P73.agc:1026
//		ARCCOS	SIGN
// slot 22547
    22547, 62892,
// P32-P33_P72-P73.agc:1027
//			12D		#                                 B0
// slot 22548
    22548, 26,
// P32-P33_P72-P73.agc:1028
//		SR1	PUSH		# GAMMA=SIGN(TEMP)ARCOS(UNITV.URP3)  PL02D
// slot 22549
    22549, 34500,
// P32-P33_P72-P73.agc:1029
//		BON	DLOAD
// slot 22550
    22550, 58648,
// P32-P33_P72-P73.agc:1030
//			S32.1F2
// slot 22551
    22551, 6018,
// P32-P33_P72-P73.agc:1031
//			FRSTPAS
// slot 22552
    22552, 41066,
// P32-P33_P72-P73.agc:1032
//			00D		# NOT THE FIRST PASS OF A CYCLE
// slot 22553
    22553, 2,
// P32-P33_P72-P73.agc:1033
//		DSU	PDDL		# GAMMA-GAMPREV                   B1 PL04D
// slot 22554
    22554, 54570,
// P32-P33_P72-P73.agc:1034
//			GAMPREV
// slot 22555
    22555, 3692,
// P32-P33_P72-P73.agc:1035
//			DELVCSI
// slot 22556
    22556, 3684,
// P32-P33_P72-P73.agc:1036
//		DSU	NORM		#                                 B7
// slot 22557
    22557, 49450,
// P32-P33_P72-P73.agc:1037
//			DVPREV
// slot 22558
    22558, 3696,
// P32-P33_P72-P73.agc:1038
//			X1
// slot 22559
    22559, 78,
// P32-P33_P72-P73.agc:1039
//		BDDV	PDDL		# (GAM-GAMPREV)/(DV-DVPREV)   B-6+N1 PL06D
// slot 22560
    22560, 54634,
// P32-P33_P72-P73.agc:1040
//			02D		#	= SLOPE
// slot 22561
    22561, 6,
// P32-P33_P72-P73.agc:1041
//			DELVCSI
// slot 22562
    22562, 3684,
// P32-P33_P72-P73.agc:1042
//		STORE	DVPREV
// slot 22563
    22563, 3696,
// P32-P33_P72-P73.agc:1043
//		BOFF	BOFF
// slot 22564
    22564, 35864,
// P32-P33_P72-P73.agc:1044
//			S32.1F3A
// slot 22565
    22565, 6084,
// P32-P33_P72-P73.agc:1045
//			THRDCHK
// slot 22566
    22566, 16782,
// P32-P33_P72-P73.agc:1046
//			S32.1F3B
// slot 22567
    22567, 6086,
// P32-P33_P72-P73.agc:1047
//			THRDCHK
// slot 22568
    22568, 16782,
// P32-P33_P72-P73.agc:1048
//		DLOAD	DMP
// slot 22569
    22569, 34250,
// P32-P33_P72-P73.agc:1049
//			02D
// slot 22570
    22570, 6,
// P32-P33_P72-P73.agc:1050
//			GAMPREV
// slot 22571
    22571, 3692,
// P32-P33_P72-P73.agc:1051
//		BPL	DLOAD
// slot 22572
    22572, 58696,
// P32-P33_P72-P73.agc:1052
//			FIFTYFPS
// slot 22573
    22573, 16792,
// P32-P33_P72-P73.agc:1053
//			INITST1
// slot 22574
    22574, 28244,
// P32-P33_P72-P73.agc:1054
//		SIGN
// slot 22575
    22575, 65514,
// P32-P33_P72-P73.agc:1055
//			DELDV
// slot 22576
    22576, 3688,
// P32-P33_P72-P73.agc:1056
//		STORE	DELDV
// slot 22577
    22577, 3688,
// P32-P33_P72-P73.agc:1057
//		SET	CLEAR
// slot 22578
    22578, 35864,
// P32-P33_P72-P73.agc:1058
//			S32.1F3A
// slot 22579
    22579, 5732,
// P32-P33_P72-P73.agc:1059
//			S32.1F3B
// slot 22580
    22580, 5990,
// P32-P33_P72-P73.agc:1060
//FRSTPAS		DLOAD
// slot 22581
    22581, 65482,
// P32-P33_P72-P73.agc:1061
//			00D
// slot 22582
    22582, 2,
// P32-P33_P72-P73.agc:1062
//		STODL	GAMPREV
// slot 22583
    22583, 15980,
// P32-P33_P72-P73.agc:1063
//			DELVCSI
// slot 22584
    22584, 3684,
// P32-P33_P72-P73.agc:1064
//		STCALL	DVPREV
// slot 22585
    22585, 32368,
// P32-P33_P72-P73.agc:1065
//			CSINEXT3
// slot 22586
    22586, 16772,
// P32-P33_P72-P73.agc:1066
//
// P32-P33_P72-P73.agc:1067
//		SETLOC	CSIPROG8
// P32-P33_P72-P73.agc:1068
//		BANK
// P32-P33_P72-P73.agc:1069
//# Page 672
// P32-P33_P72-P73.agc:1070
//CSINEXT3	DSU	CLEAR
// slot 10434
    10434, 35882,
// P32-P33_P72-P73.agc:1071
//			DELDV
// slot 10435
    10435, 3688,
// P32-P33_P72-P73.agc:1072
//			S32.1F2
// slot 10436
    10436, 5986,
// P32-P33_P72-P73.agc:1073
//		STCALL	DELVCSI
// slot 10437
    10437, 32356,
// P32-P33_P72-P73.agc:1074
//			CSI/B1
// slot 10438
    10438, 14300,
// P32-P33_P72-P73.agc:1075
//THRDCHK		BON	BON
// slot 10439
    10439, 35864,
// P32-P33_P72-P73.agc:1076
//			S32.1F3A
// slot 10440
    10440, 6020,
// P32-P33_P72-P73.agc:1077
//			NEWTN
// slot 10441
    10441, 16822,
// P32-P33_P72-P73.agc:1078
//			S32.1F3B
// slot 10442
    10442, 6022,
// P32-P33_P72-P73.agc:1079
//			NEWTN
// slot 10443
    10443, 16822,
// P32-P33_P72-P73.agc:1080
//FIFTYFPS	DLOAD	SIGN
// slot 10444
    10444, 62922,
// P32-P33_P72-P73.agc:1081
//			FIFPSDP
// slot 10445
    10445, 14210,
// P32-P33_P72-P73.agc:1082
//			04D
// slot 10446
    10446, 10,
// P32-P33_P72-P73.agc:1083
//		SIGN
// slot 10447
    10447, 65514,
// P32-P33_P72-P73.agc:1084
//			GAMPREV
// slot 10448
    10448, 3692,
// P32-P33_P72-P73.agc:1085
//		STORE	DELDV
// slot 10449
    10449, 3688,
// P32-P33_P72-P73.agc:1086
//		DCOMP	DAD
// slot 10450
    10450, 36220,
// P32-P33_P72-P73.agc:1087
//			DELVCSI
// slot 10451
    10451, 3684,
// P32-P33_P72-P73.agc:1088
//		STODL	DELVCSI
// slot 10452
    10452, 15972,
// P32-P33_P72-P73.agc:1089
//			00D
// slot 10453
    10453, 2,
// P32-P33_P72-P73.agc:1090
//		SET	SET
// slot 10454
    10454, 35864,
// P32-P33_P72-P73.agc:1091
//			S32.1F3B
// slot 10455
    10455, 5734,
// P32-P33_P72-P73.agc:1092
//			S32.1F3A
// slot 10456
    10456, 5732,
// P32-P33_P72-P73.agc:1093
//		STCALL	GAMPREV
// slot 10457
    10457, 32364,
// P32-P33_P72-P73.agc:1094
//			CSI/B2
// slot 10458
    10458, 20502,
// P32-P33_P72-P73.agc:1095
//NEWTN		DLOAD	NORM
// slot 10459
    10459, 49610,
// P32-P33_P72-P73.agc:1096
//			04D
// slot 10460
    10460, 10,
// P32-P33_P72-P73.agc:1097
//			X2
// slot 10461
    10461, 80,
// P32-P33_P72-P73.agc:1098
//		BDDV	XSU,1
// slot 10462
    10462, 45162,
// P32-P33_P72-P73.agc:1099
//			00D
// slot 10463
    10463, 2,
// P32-P33_P72-P73.agc:1100
//			X2
// slot 10464
    10464, 78,
// P32-P33_P72-P73.agc:1101
//		SR*
// slot 10465
    10465, 65374,
// P32-P33_P72-P73.agc:1102
//			0,1
// slot 10466
    10466, 17154,
// P32-P33_P72-P73.agc:1103
//		STODL	DELDV
// slot 10467
    10467, 15976,
// P32-P33_P72-P73.agc:1104
//			00D
// slot 10468
    10468, 2,
// P32-P33_P72-P73.agc:1105
//		STORE	GAMPREV
// slot 10469
    10469, 3692,
// P32-P33_P72-P73.agc:1106
//		DLOAD	ABS
// slot 10470
    10470, 42698,
// P32-P33_P72-P73.agc:1107
//			DELDV
// slot 10471
    10471, 3688,
// P32-P33_P72-P73.agc:1108
//		PUSH	DSU		#                                    PL08D
// slot 10472
    10472, 38156,
// P32-P33_P72-P73.agc:1109
//			EPSILN1
// slot 10473
    10473, 14206,
// P32-P33_P72-P73.agc:1110
//		BMN	DLOAD
// slot 10474
    10474, 58688,
// P32-P33_P72-P73.agc:1111
//			CSI/SOL
// slot 10475
    10475, 16880,
// P32-P33_P72-P73.agc:1112
//		DSU	BMN
// slot 10476
    10476, 41002,
// P32-P33_P72-P73.agc:1113
//			DELMAX1
// slot 10477
    10477, 14214,
// P32-P33_P72-P73.agc:1114
//			CSISTEP
// slot 10478
    10478, 16870,
// P32-P33_P72-P73.agc:1115
//		DLOAD	SIGN
// slot 10479
    10479, 62922,
// P32-P33_P72-P73.agc:1116
//			DELMAX1
// slot 10480
    10480, 14214,
// P32-P33_P72-P73.agc:1117
//			DELDV
// slot 10481
    10481, 3688
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:1118
//		STORE	DELDV
// slot 10482
    10482, 3688,
// P32-P33_P72-P73.agc:1119
//CSISTEP		DLOAD	DSU
// slot 10483
    10483, 38346,
// P32-P33_P72-P73.agc:1120
//# Page 673
// P32-P33_P72-P73.agc:1121
//			DELVCSI
// slot 10484
    10484, 3684,
// P32-P33_P72-P73.agc:1122
//			DELDV
// slot 10485
    10485, 3688,
// P32-P33_P72-P73.agc:1123
//		STCALL	DELVCSI
// slot 10486
    10486, 32356,
// P32-P33_P72-P73.agc:1124
//			CSI/B1
// slot 10487
    10487, 14300,
// P32-P33_P72-P73.agc:1125
//CSI/SOL		DLOAD	AXT,2
// slot 10488
    10488, 64714,
// P32-P33_P72-P73.agc:1126
//			POSTCSI
// slot 10489
    10489, 3680,
// P32-P33_P72-P73.agc:1127
//			2
// slot 10490
    10490, 4,
// P32-P33_P72-P73.agc:1128
//		LXA,1	GOTO
// slot 10491
    10491, 43216,
// P32-P33_P72-P73.agc:1129
//			RTX1
// slot 10492
    10492, 4042,
// P32-P33_P72-P73.agc:1130
//			CSINEXT4
// slot 10493
    10493, 53008,
// P32-P33_P72-P73.agc:1131
//
// P32-P33_P72-P73.agc:1132
//		SETLOC	CSIPROG9
// P32-P33_P72-P73.agc:1133
//		BANK
// P32-P33_P72-P73.agc:1134
//
// P32-P33_P72-P73.agc:1135
//CSINEXT4	DSU*	BMN
// slot 28552
    28552, 40998,
// P32-P33_P72-P73.agc:1136
//			PMINE -2,1
// slot 28553
    28553, 28232,
// P32-P33_P72-P73.agc:1137
//			SCNDSOL
// slot 28554
    28554, 53060,
// P32-P33_P72-P73.agc:1138
//		AXT,2	DLOAD
// slot 28555
    28555, 58872,
// P32-P33_P72-P73.agc:1139
//			3
// slot 28556
    28556, 6,
// P32-P33_P72-P73.agc:1140
//			POSTCDH
// slot 28557
    28557, 3700,
// P32-P33_P72-P73.agc:1141
//		DSU*	BMN
// slot 28558
    28558, 40998,
// P32-P33_P72-P73.agc:1142
//			PMINE -2,1
// slot 28559
    28559, 28232,
// P32-P33_P72-P73.agc:1143
//			SCNDSOL
// slot 28560
    28560, 53060,
// P32-P33_P72-P73.agc:1144
//		DLOAD	DSU
// slot 28561
    28561, 38346,
// P32-P33_P72-P73.agc:1145
//			TCDH
// slot 28562
    28562, 2874,
// P32-P33_P72-P73.agc:1146
//			TCSI
// slot 28563
    28563, 2878,
// P32-P33_P72-P73.agc:1147
//		STORE	T1TOT2
// slot 28564
    28564, 2766,
// P32-P33_P72-P73.agc:1148
//		AXT,2	DSU
// slot 28565
    28565, 38392,
// P32-P33_P72-P73.agc:1149
//			4
// slot 28566
    28566, 8,
// P32-P33_P72-P73.agc:1150
//			600SEC
// slot 28567
    28567, 30924,
// P32-P33_P72-P73.agc:1151
//		BMN	AXT,2
// slot 28568
    28568, 64576,
// P32-P33_P72-P73.agc:1152
//			SCNDSOL
// slot 28569
    28569, 53060,
// P32-P33_P72-P73.agc:1153
//			5
// slot 28570
    28570, 10,
// P32-P33_P72-P73.agc:1154
//		DLOAD	DSU
// slot 28571
    28571, 38346,
// P32-P33_P72-P73.agc:1155
//			TTPI
// slot 28572
    28572, 3942,
// P32-P33_P72-P73.agc:1156
//			TCDH
// slot 28573
    28573, 2874,
// P32-P33_P72-P73.agc:1157
//		STORE	T2TOT3
// slot 28574
    28574, 3932,
// P32-P33_P72-P73.agc:1158
//		DSU	BPL
// slot 28575
    28575, 42026,
// P32-P33_P72-P73.agc:1159
//			600SEC
// slot 28576
    28576, 30924,
// P32-P33_P72-P73.agc:1160
//			P32/P72C
// slot 28577
    28577, 9728,
// P32-P33_P72-P73.agc:1161
//SCNDSOL		BON	BOFF
// slot 28578
    28578, 35864,
// P32-P33_P72-P73.agc:1162
//			S32.1F3A
// slot 28579
    28579, 6020,
// P32-P33_P72-P73.agc:1163
//			ALMXIT
// slot 28580
    28580, 9628,
// P32-P33_P72-P73.agc:1164
//			S32.1F3B
// slot 28581
    28581, 6086,
// P32-P33_P72-P73.agc:1165
//			ALMXIT
// slot 28582
    28582, 9628,
// P32-P33_P72-P73.agc:1166
//		SXA,2	DLOAD
// slot 28583
    28583, 58808,
// P32-P33_P72-P73.agc:1167
//			CSIALRM
// slot 28584
    28584, 3944,
// P32-P33_P72-P73.agc:1168
//			ZEROVECS
// slot 28585
    28585, 13754,
// P32-P33_P72-P73.agc:1169
//		CLEAR	SET
// slot 28586
    28586, 35864,
// P32-P33_P72-P73.agc:1170
//			S32.1F1
// slot 28587
    28587, 5984,
// P32-P33_P72-P73.agc:1171
//# Page 674
// P32-P33_P72-P73.agc:1172
//			S32.1F2
// slot 28588
    28588, 5730,
// P32-P33_P72-P73.agc:1173
//		CLEAR	CLEAR
// slot 28589
    28589, 35864,
// P32-P33_P72-P73.agc:1174
//			S32.1F3A
// slot 28590
    28590, 5988,
// P32-P33_P72-P73.agc:1175
//			S32.1F3B
// slot 28591
    28591, 5990,
// P32-P33_P72-P73.agc:1176
//		STCALL	LOOPCT
// slot 28592
    28592, 32744,
// P32-P33_P72-P73.agc:1177
//			CSI/B
// slot 28593
    28593, 14236,
// P32-P33_P72-P73.agc:1178
//# Page 675
// P32-P33_P72-P73.agc:1179
//# ..... ADVANCE .....
// P32-P33_P72-P73.agc:1180
//
// P32-P33_P72-P73.agc:1181
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:1182
//
// P32-P33_P72-P73.agc:1183
//#	 PRECSET
// P32-P33_P72-P73.agc:1184
//#	 ROTATE
// P32-P33_P72-P73.agc:1185
//
// P32-P33_P72-P73.agc:1186
//		SETLOC	CDHTAG3
// P32-P33_P72-P73.agc:1187
//		BANK
// P32-P33_P72-P73.agc:1188
//
// P32-P33_P72-P73.agc:1189
//ADVANCE		STQ	DLOAD
// slot 34213
    34213, 58656,
// P32-P33_P72-P73.agc:1190
//			SUBEXIT
// slot 34214
    34214, 2544,
// P32-P33_P72-P73.agc:1191
//			TIG
// slot 34215
    34215, 3606,
// P32-P33_P72-P73.agc:1192
//		STCALL	TDEC1
// slot 34216
    34216, 28738,
// P32-P33_P72-P73.agc:1193
//			PRECSET
// slot 34217
    34217, 38170,
// P32-P33_P72-P73.agc:1194
//		SET	VLOAD
// slot 34218
    34218, 64792,
// P32-P33_P72-P73.agc:1195
//			XDELVFLG
// slot 34219
    34219, 1134,
// P32-P33_P72-P73.agc:1196
//			VPASS3
// slot 34220
    34220, 3812,
// P32-P33_P72-P73.agc:1197
//		STORE	VPASS2
// slot 34221
    34221, 2846,
// P32-P33_P72-P73.agc:1198
//		STOVL	VPASS1
// slot 34222
    34222, 24212,
// P32-P33_P72-P73.agc:1199
//			RPASS3
// slot 34223
    34223, 3800,
// P32-P33_P72-P73.agc:1200
//		STORE	RPASS2
// slot 34224
    34224, 2858,
// P32-P33_P72-P73.agc:1201
//		STORE	RPASS1
// slot 34225
    34225, 4060,
// P32-P33_P72-P73.agc:1202
//		UNIT	VXV
// slot 34226
    34226, 40284,
// P32-P33_P72-P73.agc:1203
//			VPASS1
// slot 34227
    34227, 3732,
// P32-P33_P72-P73.agc:1204
//		UNIT
// slot 34228
    34228, 65372,
// P32-P33_P72-P73.agc:1205
//		STOVL	UP1
// slot 34229
    34229, 23314,
// P32-P33_P72-P73.agc:1206
//			RACT3
// slot 34230
    34230, 3776,
// P32-P33_P72-P73.agc:1207
//		STCALL	RTIG
// slot 34231
    34231, 32564,
// P32-P33_P72-P73.agc:1208
//			ROTATE
// slot 34232
    34232, 11552,
// P32-P33_P72-P73.agc:1209
//		STORE	RACT2
// slot 34233
    34233, 2646,
// P32-P33_P72-P73.agc:1210
//		STOVL	RACT1
// slot 34234
    34234, 23234,
// P32-P33_P72-P73.agc:1211
//			VACT3
// slot 34235
    34235, 3788,
// P32-P33_P72-P73.agc:1212
//		STCALL	VTIG
// slot 34236
    34236, 32576,
// P32-P33_P72-P73.agc:1213
//			ROTATE
// slot 34237
    34237, 11552,
// P32-P33_P72-P73.agc:1214
//		STORE	VACT2
// slot 34238
    34238, 2742,
// P32-P33_P72-P73.agc:1215
//		STCALL	VACT1
// slot 34239
    34239, 32392,
// P32-P33_P72-P73.agc:1216
//			SUBEXIT
// slot 34240
    34240, 2544,
// P32-P33_P72-P73.agc:1217
//# Page 676
// P32-P33_P72-P73.agc:1218
//# ..... ROTATE .....
// P32-P33_P72-P73.agc:1219
//
// P32-P33_P72-P73.agc:1220
//		SETLOC	CDHTAG
// P32-P33_P72-P73.agc:1221
//		BANK
// P32-P33_P72-P73.agc:1222
//
// P32-P33_P72-P73.agc:1223
//ROTATE		PUSH	PUSH
// slot 7824
    7824, 34316,
// P32-P33_P72-P73.agc:1224
//		DOT	VXSC
// slot 7825
    7825, 61762,
// P32-P33_P72-P73.agc:1225
//			UP1
// slot 7826
    7826, 2834,
// P32-P33_P72-P73.agc:1226
//			UP1
// slot 7827
    7827, 2834,
// P32-P33_P72-P73.agc:1227
//		VSL2	BVSU
// slot 7828
    7828, 42452,
// P32-P33_P72-P73.agc:1228
//		UNIT	PDVL
// slot 7829
    7829, 52572,
// P32-P33_P72-P73.agc:1229
//		ABVAL	VXSC
// slot 7830
    7830, 61772,
// P32-P33_P72-P73.agc:1230
//		VSL1	RVQ
// slot 7831
    7831, 36596,
// P32-P33_P72-P73.agc:1231
//# Page 677
// P32-P33_P72-P73.agc:1232
//# ..... INTINTNA .....
// P32-P33_P72-P73.agc:1233
//
// P32-P33_P72-P73.agc:1234
//		SETLOC	CDHTAG2
// P32-P33_P72-P73.agc:1235
//		BANK
// P32-P33_P72-P73.agc:1236
//
// P32-P33_P72-P73.agc:1237
//INTINT2C	PDDL	PDDL
// slot 28594
    28594, 54698,
// P32-P33_P72-P73.agc:1238
//			TCSI
// slot 28595
    28595, 2878,
// P32-P33_P72-P73.agc:1239
//			TCDH
// slot 28596
    28596, 2874,
// P32-P33_P72-P73.agc:1240
//		PDDL	PUSH
// slot 28597
    28597, 34474,
// P32-P33_P72-P73.agc:1241
//			TWOPI
// slot 28598
    28598, 27790,
// P32-P33_P72-P73.agc:1242
//		GOTO
// slot 28599
    28599, 65360,
// P32-P33_P72-P73.agc:1243
//			INTINT
// slot 28600
    28600, 60298,
// P32-P33_P72-P73.agc:1244
//INTINT3P	PDDL	PDDL
// slot 28601
    28601, 54698,
// P32-P33_P72-P73.agc:1245
//			TCDH
// slot 28602
    28602, 2874
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:1246
//			TTPI
// slot 28603
    28603, 3942,
// P32-P33_P72-P73.agc:1247
//		PDDL	PUSH
// slot 28604
    28604, 34474,
// P32-P33_P72-P73.agc:1248
//			ZEROVECS
// slot 28605
    28605, 13754,
// P32-P33_P72-P73.agc:1249
//		GOTO
// slot 28606
    28606, 65360,
// P32-P33_P72-P73.agc:1250
//			INTINT
// slot 28607
    28607, 60298,
// P32-P33_P72-P73.agc:1251
//# Page 678
// P32-P33_P72-P73.agc:1252
//# ..... S32/33.1 .....
// P32-P33_P72-P73.agc:1253
//
// P32-P33_P72-P73.agc:1254
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:1255
//#	 S32/33.X
// P32-P33_P72-P73.agc:1256
//
// P32-P33_P72-P73.agc:1257
//		SETLOC	CSI/CDH
// P32-P33_P72-P73.agc:1258
//		BANK
// P32-P33_P72-P73.agc:1259
//
// P32-P33_P72-P73.agc:1260
//S32/33.1	STQ	AXT,1
// slot 32559
    32559, 63520,
// P32-P33_P72-P73.agc:1261
//			SUBEXIT
// slot 32560
    32560, 2544,
// P32-P33_P72-P73.agc:1262
//		VN	0681
// slot 32561
    32561, 1698,
// P32-P33_P72-P73.agc:1263
//		CALL
// slot 32562
    32562, 65320,
// P32-P33_P72-P73.agc:1264
//			DISDVLVC
// slot 32563
    32563, 64298,
// P32-P33_P72-P73.agc:1265
//		CALL
// slot 32564
    32564, 65320,
// P32-P33_P72-P73.agc:1266
//			S32/33.X
// slot 32565
    32565, 22834,
// P32-P33_P72-P73.agc:1267
//		VLOAD	VXM
// slot 32566
    32566, 50682,
// P32-P33_P72-P73.agc:1268
//			DELVLVC
// slot 32567
    32567, 3594,
// P32-P33_P72-P73.agc:1269
//			0D
// slot 32568
    32568, 2,
// P32-P33_P72-P73.agc:1270
//		VSL1
// slot 32569
    32569, 65524,
// P32-P33_P72-P73.agc:1271
//		STORE	DELVSIN
// slot 32570
    32570, 3916,
// P32-P33_P72-P73.agc:1272
//		PUSH	ABVAL
// slot 32571
    32571, 42508,
// P32-P33_P72-P73.agc:1273
//		STOVL	DELVSAB
// slot 32572
    32572, 24408,
// P32-P33_P72-P73.agc:1274
//		GOTO
// slot 32573
    32573, 65360,
// P32-P33_P72-P73.agc:1275
//			SUBEXIT
// slot 32574
    32574, 2544,
// P32-P33_P72-P73.agc:1276
//# Page 679
// P32-P33_P72-P73.agc:1277
//# ..... S32/33.X .....
// P32-P33_P72-P73.agc:1278
//
// P32-P33_P72-P73.agc:1279
//		SETLOC	CDHTAGS
// P32-P33_P72-P73.agc:1280
//		BANK
// P32-P33_P72-P73.agc:1281
//
// P32-P33_P72-P73.agc:1282
//S32/33.X	SETPD	VLOAD
// slot 13465
    13465, 64770,
// P32-P33_P72-P73.agc:1283
//			6D
// slot 13466
    13466, 14,
// P32-P33_P72-P73.agc:1284
//			UP1
// slot 13467
    13467, 2834,
// P32-P33_P72-P73.agc:1285
//		VCOMP	PDVL
// slot 13468
    13468, 52604,
// P32-P33_P72-P73.agc:1286
//			RACT1
// slot 13469
    13469, 2754,
// P32-P33_P72-P73.agc:1287
//		UNIT	VCOMP
// slot 13470
    13470, 48732,
// P32-P33_P72-P73.agc:1288
//		PUSH	VXV
// slot 13471
    13471, 40204,
// P32-P33_P72-P73.agc:1289
//			UP1
// slot 13472
    13472, 2834,
// P32-P33_P72-P73.agc:1290
//		VSL1
// slot 13473
    13473, 65524,
// P32-P33_P72-P73.agc:1291
//		STORE	0D
// slot 13474
    13474, 2,
// P32-P33_P72-P73.agc:1292
//		RVQ
// slot 13475
    13475, 65308,
// P32-P33_P72-P73.agc:1293
//# Page 680
// P32-P33_P72-P73.agc:1294
//# ..... CDHMVR .....
// P32-P33_P72-P73.agc:1295
//
// P32-P33_P72-P73.agc:1296
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:1297
//
// P32-P33_P72-P73.agc:1298
//#	 VECSHIFT
// P32-P33_P72-P73.agc:1299
//#	 TIMETHET
// P32-P33_P72-P73.agc:1300
//#	 SHIFTR1
// P32-P33_P72-P73.agc:1301
//
// P32-P33_P72-P73.agc:1302
//		SETLOC	CDHTAG
// P32-P33_P72-P73.agc:1303
//		BANK
// P32-P33_P72-P73.agc:1304
//
// P32-P33_P72-P73.agc:1305
//CDHMVR		STQ	VLOAD
// slot 7832
    7832, 64800,
// P32-P33_P72-P73.agc:1306
//			SUBEXIT
// slot 7833
    7833, 2544,
// P32-P33_P72-P73.agc:1307
//			RACT2
// slot 7834
    7834, 2646,
// P32-P33_P72-P73.agc:1308
//		PUSH	UNIT
// slot 7835
    7835, 44556,
// P32-P33_P72-P73.agc:1309
//		STOVL	UNVEC		# UR SUB A
// slot 7836
    7836, 24268,
// P32-P33_P72-P73.agc:1310
//			RPASS2
// slot 7837
    7837, 2858,
// P32-P33_P72-P73.agc:1311
//		UNIT	DOT
// slot 7838
    7838, 41308,
// P32-P33_P72-P73.agc:1312
//			UNVEC
// slot 7839
    7839, 3788,
// P32-P33_P72-P73.agc:1313
//		PUSH	SL1
// slot 7840
    7840, 59916,
// P32-P33_P72-P73.agc:1314
//		STODL	CSTH
// slot 7841
    7841, 15288,
// P32-P33_P72-P73.agc:1315
//		DSQ	PDDL
// slot 7842
    7842, 54684,
// P32-P33_P72-P73.agc:1316
//			DP1/4
// slot 7843
    7843, 20444,
// P32-P33_P72-P73.agc:1317
//		SR2	DSU
// slot 7844
    7844, 38276,
// P32-P33_P72-P73.agc:1318
//		SQRT	SL1
// slot 7845
    7845, 60140,
// P32-P33_P72-P73.agc:1319
//		PDVL	VCOMP
// slot 7846
    7846, 48794,
// P32-P33_P72-P73.agc:1320
//		VXV
// slot 7847
    7847, 65338,
// P32-P33_P72-P73.agc:1321
//			RPASS2
// slot 7848
    7848, 2858,
// P32-P33_P72-P73.agc:1322
//		DOT	PDDL
// slot 7849
    7849, 54594,
// P32-P33_P72-P73.agc:1323
//			UP1
// slot 7850
    7850, 2834,
// P32-P33_P72-P73.agc:1324
//		SIGN	STADR
// slot 7851
    7851, 38634,
// P32-P33_P72-P73.agc:1325
//		STOVL	SNTH
// slot 7852
    7852, 42058,
// P32-P33_P72-P73.agc:1326
//			RPASS2
// slot 7853
    7853, 2858,
// P32-P33_P72-P73.agc:1327
//		PDVL	CALL
// slot 7854
    7854, 38042,
// P32-P33_P72-P73.agc:1328
//			VPASS2
// slot 7855
    7855, 2846,
// P32-P33_P72-P73.agc:1329
//			VECSHIFT
// slot 7856
    7856, 38230,
// P32-P33_P72-P73.agc:1330
//		STOVL	VVEC
// slot 7857
    7857, 23500,
// P32-P33_P72-P73.agc:1331
//		CLEAR
// slot 7858
    7858, 65304,
// P32-P33_P72-P73.agc:1332
//			RVSW
// slot 7859
    7859, 3948,
// P32-P33_P72-P73.agc:1333
//		STCALL	RVEC
// slot 7860
    7860, 31582,
// P32-P33_P72-P73.agc:1334
//			TIMETHET
// slot 7861
    7861, 21448,
// P32-P33_P72-P73.agc:1335
//		LXA,2	VSL*
// slot 7862
    7862, 45016,
// P32-P33_P72-P73.agc:1336
//			RTX2
// slot 7863
    7863, 4044,
// P32-P33_P72-P73.agc:1337
//			0,2
// slot 7864
    7864, 48892,
// P32-P33_P72-P73.agc:1338
//		STORE	18D
// slot 7865
    7865, 38,
// P32-P33_P72-P73.agc:1339
//		DOT	SL1R
// slot 7866
    7866, 64066,
// P32-P33_P72-P73.agc:1340
//			UNVEC
// slot 7867
    7867, 3788,
// P32-P33_P72-P73.agc:1341
//		PDVL	ABVAL		# 0D = V SUB PV
// slot 7868
    7868, 42650,
// P32-P33_P72-P73.agc:1342
//		SL*	PDVL
// slot 7869
    7869, 52574,
// P32-P33_P72-P73.agc:1343
//			0,2
// slot 7870
    7870, 48892,
// P32-P33_P72-P73.agc:1344
//# Page 681
// P32-P33_P72-P73.agc:1345
//			RACT2
// slot 7871
    7871, 2646,
// P32-P33_P72-P73.agc:1346
//		ABVAL	PDDL		# 2D = LENGTH OF R SUB A
// slot 7872
    7872, 54604,
// P32-P33_P72-P73.agc:1347
//		DSU
// slot 7873
    7873, 65322,
// P32-P33_P72-P73.agc:1348
//			02D
// slot 7874
    7874, 6,
// P32-P33_P72-P73.agc:1349
//		STODL	DIFFALT		# DELTA H IN METERS		B+29
// slot 7875
    7875, 15158,
// P32-P33_P72-P73.agc:1350
//			R1A
// slot 7876
    7876, 3016,
// P32-P33_P72-P73.agc:1351
//		NORM	PDDL		# 2 - R V**/MU				04D
// slot 7877
    7877, 54658,
// P32-P33_P72-P73.agc:1352
//			X1
// slot 7878
    7878, 78,
// P32-P33_P72-P73.agc:1353
//			R1
// slot 7879
    7879, 66,
// P32-P33_P72-P73.agc:1354
//		CALL
// slot 7880
    7880, 65320,
// P32-P33_P72-P73.agc:1355
//			SHIFTR1
// slot 7881
    7881, 38246,
// P32-P33_P72-P73.agc:1356
//		SR1R	DDV
// slot 7882
    7882, 47588,
// P32-P33_P72-P73.agc:1357
//		SL*	PUSH
// slot 7883
    7883, 34398,
// P32-P33_P72-P73.agc:1358
//			0 -5,1
// slot 7884
    7884, 16632,
// P32-P33_P72-P73.agc:1359
//		DSU	PDDL		# A SUB A			B+29 	04D
// slot 7885
    7885, 54570,
// P32-P33_P72-P73.agc:1360
//			DIFFALT
// slot 7886
    7886, 2870,
// P32-P33_P72-P73.agc:1361
//		SR2	DDV		# A SUB P			B+31
// slot 7887
    7887, 47492,
// P32-P33_P72-P73.agc:1362
//			04D		#				B+2
// slot 7888
    7888, 10,
// P32-P33_P72-P73.agc:1363
//		PUSH	SQRT		# A SUB P/A SUB A			06D
// slot 7889
    7889, 62988,
// P32-P33_P72-P73.agc:1364
//		DMPR	DMP
// slot 7890
    7890, 34170,
// P32-P33_P72-P73.agc:1365
//			06D
// slot 7891
    7891, 14,
// P32-P33_P72-P73.agc:1366
//			00D
// slot 7892
    7892, 2,
// P32-P33_P72-P73.agc:1367
//		SL3R	PDDL		# V SUB A V METERS/CS		B+7 	08D
// slot 7893
    7893, 54644,
// P32-P33_P72-P73.agc:1368
//			02D		# R SUB A MAGNITUDE		B+29
// slot 7894
    7894, 6,
// P32-P33_P72-P73.agc:1369
//		NORM	PDDL
// slot 7895
    7895, 54658,
// P32-P33_P72-P73.agc:1370
//			X1
// slot 7896
    7896, 78,
// P32-P33_P72-P73.agc:1371
//			RTMU
// slot 7897
    7897, 4048,
// P32-P33_P72-P73.agc:1372
//		SR1	DDV		# 2MU 				B+38
// slot 7898
    7898, 47556,
// P32-P33_P72-P73.agc:1373
//		SL*	PDDL		# 2 MU/R SUBAA			B+14 	10D
// slot 7899
    7899, 54622
)).

agcAotInstallSourceRope(list(
// P32-P33_P72-P73.agc:1374
//			0 -5,1
// slot 7900
    7900, 16632,
// P32-P33_P72-P73.agc:1375
//			04D		# ASUBA				B+29
// slot 7901
    7901, 10,
// P32-P33_P72-P73.agc:1376
//		NORM	PDDL
// slot 7902
    7902, 54658,
// P32-P33_P72-P73.agc:1377
//			X2
// slot 7903
    7903, 80,
// P32-P33_P72-P73.agc:1378
//			RTMU
// slot 7904
    7904, 4048,
// P32-P33_P72-P73.agc:1379
//		SR1	DDV
// slot 7905
    7905, 47556,
// P32-P33_P72-P73.agc:1380
//		SL*	BDSU
// slot 7906
    7906, 37214,
// P32-P33_P72-P73.agc:1381
//			0 -6,2		# 2U/R - U/A		 B+14 (METERS/CS)SQ
// slot 7907
    7907, 48904,
// P32-P33_P72-P73.agc:1382
//		PDDL	DSQ		#					10D
// slot 7908
    7908, 52906,
// P32-P33_P72-P73.agc:1383
//			08D
// slot 7909
    7909, 18,
// P32-P33_P72-P73.agc:1384
//		BDSU	SQRT
// slot 7910
    7910, 63010,
// P32-P33_P72-P73.agc:1385
//		PDVL	VXV		# SQRT(MU(2/R SUB A-1/A SUB A)-VSUBA2)	10D
// slot 7911
    7911, 40346,
// P32-P33_P72-P73.agc:1386
//			UP1
// slot 7912
    7912, 2834,
// P32-P33_P72-P73.agc:1387
//			UNVEC
// slot 7913
    7913, 3788,
// P32-P33_P72-P73.agc:1388
//		UNIT	VXSC
// slot 7914
    7914, 61788,
// P32-P33_P72-P73.agc:1389
//			10D
// slot 7915
    7915, 22,
// P32-P33_P72-P73.agc:1390
//		PDVL	VXSC
// slot 7916
    7916, 61850,
// P32-P33_P72-P73.agc:1391
//			UNVEC
// slot 7917
    7917, 3788,
// P32-P33_P72-P73.agc:1392
//			08D
// slot 7918
    7918, 18,
// P32-P33_P72-P73.agc:1393
//		VAD	VSL1
// slot 7919
    7919, 64090,
// P32-P33_P72-P73.agc:1394
//		STADR
// slot 7920
    7920, 65324,
// P32-P33_P72-P73.agc:1395
//# Page 682
// P32-P33_P72-P73.agc:1396
//		STORE	VACT3
// slot 7921
    7921, 61746,
// P32-P33_P72-P73.agc:1397
//		VSU
// slot 7922
    7922, 65362,
// P32-P33_P72-P73.agc:1398
//			VACT2
// slot 7923
    7923, 2742,
// P32-P33_P72-P73.agc:1399
//		STCALL	DELVEET2	# DELTA VCDH - REFERENCE COORDINATES
// slot 7924
    7924, 32622,
// P32-P33_P72-P73.agc:1400
//			SUBEXIT
// slot 7925
    7925, 2544
)).

// no code for the lines below
// P32-P33_P72-P73.agc:1401
//# Page 683
// P32-P33_P72-P73.agc:1402
//# ..... COMPTGO .....
// P32-P33_P72-P73.agc:1403
//
// P32-P33_P72-P73.agc:1404
//# SUBROUTINES USED
// P32-P33_P72-P73.agc:1405
//
// P32-P33_P72-P73.agc:1406
//#	 CLOKTASK
// P32-P33_P72-P73.agc:1407
//#	 2PHSCHNG
// P32-P33_P72-P73.agc:1408
//
// P32-P33_P72-P73.agc:1409
//		BANK	35
// P32-P33_P72-P73.agc:1410
//		SETLOC	CSI/CDH
// P32-P33_P72-P73.agc:1411
//		BANK
// P32-P33_P72-P73.agc:1412
//
// P32-P33_P72-P73.agc:1413
//		EBANK=	RTRN
// P32-P33_P72-P73.agc:1414
//
// P32-P33_P72-P73.agc:1415
//		COUNT*	$$/P3575
