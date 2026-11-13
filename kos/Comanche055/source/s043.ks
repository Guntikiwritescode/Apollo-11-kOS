// PORT: Original source unit P32-P33_P72-P73.agc.
// PORT: Physical bank 04. Shared continuation entries, slots 6851–6854.
function agcAotUnit406 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6852 {
        if slot <= 6851 {
// PORT: SOURCE P32-P33_P72-P73.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P32-P33_P72-P73.agc:2
//# Filename:	P32-P33_P72-P73.agc
// PORT: SOURCE P32-P33_P72-P73.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P32-P33_P72-P73.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P32-P33_P72-P73.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P32-P33_P72-P73.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P32-P33_P72-P73.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P32-P33_P72-P73.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P32-P33_P72-P73.agc:9
//# Pages:	649-683
// PORT: SOURCE P32-P33_P72-P73.agc:10
//# Mod history:	2009-05-09 RSB	Adapted from the Luminary131/ file
// PORT: SOURCE P32-P33_P72-P73.agc:11
//#				P32-P35_P72-P75.agc and Comanche055 page
// PORT: SOURCE P32-P33_P72-P73.agc:12
//#				images.
// PORT: SOURCE P32-P33_P72-P73.agc:13
//#		2009-05-20 RSB	Corrected CSI/COM3 -> CSI/CDH3,
// PORT: SOURCE P32-P33_P72-P73.agc:14
//#				CSI/CDHI -> CSI/CDH1, CDHTAB -> CDHTAG,
// PORT: SOURCE P32-P33_P72-P73.agc:15
//#				changed a SETLOC from CSI/CDH to CSI/CDH1,
// PORT: SOURCE P32-P33_P72-P73.agc:16
//#				a SETLOC CSI/CDH1 to CSIPROG.
// PORT: SOURCE P32-P33_P72-P73.agc:17
//#		2009-05-21 RSB	Changed a P32/P72D to P32/P72E in
// PORT: SOURCE P32-P33_P72-P73.agc:18
//#				P32/P72D.  DP1/4TH changed to DP1/4 in
// PORT: SOURCE P32-P33_P72-P73.agc:19
//#				CDHMVR.
// PORT: SOURCE P32-P33_P72-P73.agc:20
//#
// PORT: SOURCE P32-P33_P72-P73.agc:21
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P32-P33_P72-P73.agc:22
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P32-P33_P72-P73.agc:23
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P32-P33_P72-P73.agc:24
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P32-P33_P72-P73.agc:25
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P32-P33_P72-P73.agc:26
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P32-P33_P72-P73.agc:27
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P32-P33_P72-P73.agc:28
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P32-P33_P72-P73.agc:29
//#
// PORT: SOURCE P32-P33_P72-P73.agc:30
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P32-P33_P72-P73.agc:31
//#
// PORT: SOURCE P32-P33_P72-P73.agc:32
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P32-P33_P72-P73.agc:33
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P32-P33_P72-P73.agc:34
//#
// PORT: SOURCE P32-P33_P72-P73.agc:35
//#	This AGC program shall also be referred to as
// PORT: SOURCE P32-P33_P72-P73.agc:36
//#			Colossus 2A
// PORT: SOURCE P32-P33_P72-P73.agc:37
//
// PORT: SOURCE P32-P33_P72-P73.agc:38
//# Page 649
// PORT: SOURCE P32-P33_P72-P73.agc:39
//# COELLIPTIC SEQUENCE INITIATION (CSI) PROGRAMS (P32 AND P72)
// PORT: SOURCE P32-P33_P72-P73.agc:40
//
// PORT: SOURCE P32-P33_P72-P73.agc:41
//# MOD NO -1		LOG SECTION - P32-P35, P72-P75
// PORT: SOURCE P32-P33_P72-P73.agc:42
//# MOD BY WHITE.P	DATE 1JUNE67
// PORT: SOURCE P32-P33_P72-P73.agc:43
//
// PORT: SOURCE P32-P33_P72-P73.agc:44
//# PURPOSE
// PORT: SOURCE P32-P33_P72-P73.agc:45
//
// PORT: SOURCE P32-P33_P72-P73.agc:46
//#	 (1) TO CALCULATE PARAMETERS ASSOCIATED WITH THE FOLLOWING
// PORT: SOURCE P32-P33_P72-P73.agc:47
//#	     CONCENTRIC FLIGHT PLAN MANEUVERS - THE CO-ELLIPTIC SEQUENCE
// PORT: SOURCE P32-P33_P72-P73.agc:48
//#	     INITIATION (CSI) MANEUVER AND THE CONSTANT DELTA ALTITUDE
// PORT: SOURCE P32-P33_P72-P73.agc:49
//#	     (CDH) MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:50
//
// PORT: SOURCE P32-P33_P72-P73.agc:51
//#	 (2) TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// PORT: SOURCE P32-P33_P72-P73.agc:52
//#	     APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// PORT: SOURCE P32-P33_P72-P73.agc:53
//
// PORT: SOURCE P32-P33_P72-P73.agc:54
//#	 (3) TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// PORT: SOURCE P32-P33_P72-P73.agc:55
//#	     ASSOCIATED WITH THE CONCENTRIC FLIGHT PLAN MANEUVERS FOR
// PORT: SOURCE P32-P33_P72-P73.agc:56
//#	     APPROVAL BY THE ASTRONAUT/GROUND.
// PORT: SOURCE P32-P33_P72-P73.agc:57
//
// PORT: SOURCE P32-P33_P72-P73.agc:58
//#	 (4) TO STORE THE CSI TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P32-P33_P72-P73.agc:59
//#	     THRUSTING PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:60
//
// PORT: SOURCE P32-P33_P72-P73.agc:61
//# ASSUMPTIONS
// PORT: SOURCE P32-P33_P72-P73.agc:62
//
// PORT: SOURCE P32-P33_P72-P73.agc:63
//#	 (1) AT A SELECTED TPI TIME THE LINE OF SIGHT BETWEEN THE ACTIVE
// PORT: SOURCE P32-P33_P72-P73.agc:64
//#	     AND PASSIVE VEHICLES IS SELECTED TO BE A PRESCRIBED ANGLE (E)
// PORT: SOURCE P32-P33_P72-P73.agc:65
//#	     FROM THE HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:66
//#	     POSITION.
// PORT: SOURCE P32-P33_P72-P73.agc:67
//
// PORT: SOURCE P32-P33_P72-P73.agc:68
//#	 (2) THE TIME BETWEEN CSI IGNITION AND CDH IGNITION MUST BE
// PORT: SOURCE P32-P33_P72-P73.agc:69
//#	     COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// PORT: SOURCE P32-P33_P72-P73.agc:70
//#	     COMPLETION OF THE PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:71
//
// PORT: SOURCE P32-P33_P72-P73.agc:72
//#	 (3) THE TIME BETWEEN CDH IGNITION AND TPI IGNITION MUST BE
// PORT: SOURCE P32-P33_P72-P73.agc:73
//#	     COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// PORT: SOURCE P32-P33_P72-P73.agc:74
//#	     COMPLETION OF THE PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:75
//
// PORT: SOURCE P32-P33_P72-P73.agc:76
//#	 (4) CDH DELTA V IS SELECTED TO MINIMIZE THE VARIATION OF THE
// PORT: SOURCE P32-P33_P72-P73.agc:77
//#	     ALTITUDE DIFFERENCE BETWEEN THE ORBITS.
// PORT: SOURCE P32-P33_P72-P73.agc:78
//
// PORT: SOURCE P32-P33_P72-P73.agc:79
//#	 (5) CSI BURN IS DEFINED SUCH THAT THE IMPULSIVE DELTA V IS IN THE
// PORT: SOURCE P32-P33_P72-P73.agc:80
//#	     HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION AT CSI
// PORT: SOURCE P32-P33_P72-P73.agc:81
//#	     IGNITION.
// PORT: SOURCE P32-P33_P72-P73.agc:82
//
// PORT: SOURCE P32-P33_P72-P73.agc:83
//#	 (6) THE PERICENTER ALTITUDE OF THE ORBIT FOLLOWING CSI AND CDH
// PORT: SOURCE P32-P33_P72-P73.agc:84
//#	     MUST BE GREATER THAN 35,000 FT (LUNAR ORBIT) OR 85 NM (EARTH
// PORT: SOURCE P32-P33_P72-P73.agc:85
//#	     ORBIT) FOR SUCCESSFUL COMPLETION OF THIS PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:86
//
// PORT: SOURCE P32-P33_P72-P73.agc:87
//#	 (7) THE CSI AND CDH MANEUVERS ARE ORIGINALLY ASSUMED TO BE
// PORT: SOURCE P32-P33_P72-P73.agc:88
//#	     PARALLEL TO THE PLANE OF THE CSM ORBIT.  HOWEVER, CREW
// PORT: SOURCE P32-P33_P72-P73.agc:89
//# Page 650
// PORT: SOURCE P32-P33_P72-P73.agc:90
//#	     MODIFICATION OF DELTA V (LV) COMPONENTS MAY RESULT IN AN
// PORT: SOURCE P32-P33_P72-P73.agc:91
//#	     OUT-OF-PLANE CSI MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:92
//
// PORT: SOURCE P32-P33_P72-P73.agc:93
//#	 (8) STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P32-P33_P72-P73.agc:94
//#	     STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 10).
// PORT: SOURCE P32-P33_P72-P73.agc:95
//
// PORT: SOURCE P32-P33_P72-P73.agc:96
//#	 (9) COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// PORT: SOURCE P32-P33_P72-P73.agc:97
//#	     THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// PORT: SOURCE P32-P33_P72-P73.agc:98
//#	     ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// PORT: SOURCE P32-P33_P72-P73.agc:99
//#	     EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// PORT: SOURCE P32-P33_P72-P73.agc:100
//
// PORT: SOURCE P32-P33_P72-P73.agc:101
//#	(10) THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// PORT: SOURCE P32-P33_P72-P73.agc:102
//#	     OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// PORT: SOURCE P32-P33_P72-P73.agc:103
//#	     DESIRED THE RADAR WAS TURNED ON AND LOCKED BY THE CSM BY
// PORT: SOURCE P32-P33_P72-P73.agc:104
//#	     PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// PORT: SOURCE P32-P33_P72-P73.agc:105
//#	     AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// PORT: SOURCE P32-P33_P72-P73.agc:106
//#	     TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// PORT: SOURCE P32-P33_P72-P73.agc:107
//#	     MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// PORT: SOURCE P32-P33_P72-P73.agc:108
//#	     THRUSTING MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:109
//
// PORT: SOURCE P32-P33_P72-P73.agc:110
//#	(11) THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:111
//
// PORT: SOURCE P32-P33_P72-P73.agc:112
//#	(12) THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS -
// PORT: SOURCE P32-P33_P72-P73.agc:113
//
// PORT: SOURCE P32-P33_P72-P73.agc:114
//#		ACTIVE VEHICLE FLAG - DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P32-P33_P72-P73.agc:115
//#		DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P32-P33_P72-P73.agc:116
//#		CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P32-P33_P72-P73.agc:117
//#		EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:118
//
// PORT: SOURCE P32-P33_P72-P73.agc:119
//#		FINAL FLAG - SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P32-P33_P72-P73.agc:120
//#		COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// PORT: SOURCE P32-P33_P72-P73.agc:121
//#		CYCLE.
// PORT: SOURCE P32-P33_P72-P73.agc:122
//
// PORT: SOURCE P32-P33_P72-P73.agc:123
//#		EXTERNAL DELTA V STEERING FLAG - DESIGNATES THE TYPE OF
// PORT: SOURCE P32-P33_P72-P73.agc:124
//#		STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// PORT: SOURCE P32-P33_P72-P73.agc:125
//#		THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// PORT: SOURCE P32-P33_P72-P73.agc:126
//#		PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:127
//
// PORT: SOURCE P32-P33_P72-P73.agc:128
//#	(13) IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// PORT: SOURCE P32-P33_P72-P73.agc:129
//#	     A THRUSTING MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:130
//
// PORT: SOURCE P32-P33_P72-P73.agc:131
//#	(14) THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY -
// PORT: SOURCE P32-P33_P72-P73.agc:132
//
// PORT: SOURCE P32-P33_P72-P73.agc:133
//#		P32 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P32-P33_P72-P73.agc:134
//
// PORT: SOURCE P32-P33_P72-P73.agc:135
//#		P72 IF THIS VEHICLE IS PASSIVE VEHICLE.
// PORT: SOURCE P32-P33_P72-P73.agc:136
//
// PORT: SOURCE P32-P33_P72-P73.agc:137
//# INPUT
// PORT: SOURCE P32-P33_P72-P73.agc:138
//
// PORT: SOURCE P32-P33_P72-P73.agc:139
//#	 (1) TCSI	TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:140
//# Page 651
// PORT: SOURCE P32-P33_P72-P73.agc:141
//#	 (2) NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// PORT: SOURCE P32-P33_P72-P73.agc:142
//#			VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// PORT: SOURCE P32-P33_P72-P73.agc:143
//#			MANEUVER POINT
// PORT: SOURCE P32-P33_P72-P73.agc:144
//#	 (3) ELEV	DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P33_P72-P73.agc:145
//#	 (4) TTPI	TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:146
//# OUTPUT
// PORT: SOURCE P32-P33_P72-P73.agc:147
//
// PORT: SOURCE P32-P33_P72-P73.agc:148
//#	 (1) TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P32-P33_P72-P73.agc:149
//#	 (2) TTOGO	TIME TO GO
// PORT: SOURCE P32-P33_P72-P73.agc:150
//#	 (3) +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE P32-P33_P72-P73.agc:151
//#	 (4) DIFFALT	DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P33_P72-P73.agc:152
//#	 (5) T1TOT2	DELTA TIME FROM CSI TO CDH
// PORT: SOURCE P32-P33_P72-P73.agc:153
//#	 (6) T2TOT3	DELTA TIME FROM CDH TO TPI
// PORT: SOURCE P32-P33_P72-P73.agc:154
//#	 (7) DELVLVC	DELTA VELOCITY AT CSI - LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:155
//#	 (8) DELVLVC	DELTA VELOCITY AT CDH - LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:156
//
// PORT: SOURCE P32-P33_P72-P73.agc:157
//# DOWNLINK
// PORT: SOURCE P32-P33_P72-P73.agc:158
//
// PORT: SOURCE P32-P33_P72-P73.agc:159
//#	 (1) TCSI	TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:160
//#	 (2) TCDH	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:161
//#	 (3) TTPI	TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:162
//#	 (4) TIG	TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:163
//#	 (5) DELVEET1	DELTA VELOCITY AT CSI - REFERENCE COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:164
//#	 (6) DELVEET2	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:165
//#	 (7) DIFFALT	DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P33_P72-P73.agc:166
//#	 (8) NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// PORT: SOURCE P32-P33_P72-P73.agc:167
//#			VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// PORT: SOURCE P32-P33_P72-P73.agc:168
//#			MANEUVER POINT
// PORT: SOURCE P32-P33_P72-P73.agc:169
//#	 (9) ELEV	DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P33_P72-P73.agc:170
//
// PORT: SOURCE P32-P33_P72-P73.agc:171
//# COMMUNICATION TO THRUSTING PROGRAMS
// PORT: SOURCE P32-P33_P72-P73.agc:172
//
// PORT: SOURCE P32-P33_P72-P73.agc:173
//#	 (1) TIG	TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:174
//#	 (2) RTIG	POSITION OF ACTIVE VEHICLE AT CSI - BEFORE ROTATION
// PORT: SOURCE P32-P33_P72-P73.agc:175
//#			INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:176
//#	 (3) VTIG	VELOCITY OF ACTIVE VEHICLE AT CSE - BEFORE ROTATION
// PORT: SOURCE P32-P33_P72-P73.agc:177
//#			INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:178
//#	 (4) DELVSIN	DELTA VELOCITY AT CSI - REFERENCE COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:179
//#	 (5) DELVSAB	MAGNITUDE OF DELTA VELOCITY AT CSI
// PORT: SOURCE P32-P33_P72-P73.agc:180
//#	 (6) XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// PORT: SOURCE P32-P33_P72-P73.agc:181
//
// PORT: SOURCE P32-P33_P72-P73.agc:182
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:183
//
// PORT: SOURCE P32-P33_P72-P73.agc:184
//#	 AVFLAGA
// PORT: SOURCE P32-P33_P72-P73.agc:185
//#	 AVFLAGP
// PORT: SOURCE P32-P33_P72-P73.agc:186
//#	 P20FLGON
// PORT: SOURCE P32-P33_P72-P73.agc:187
//#	 VARALARM
// PORT: SOURCE P32-P33_P72-P73.agc:188
//#	 BANKCALL
// PORT: SOURCE P32-P33_P72-P73.agc:189
//#	 GOFLASH
// PORT: SOURCE P32-P33_P72-P73.agc:190
//#	 GOTOPOOH
// PORT: SOURCE P32-P33_P72-P73.agc:191
//# Page 652
// PORT: SOURCE P32-P33_P72-P73.agc:192
//#	 VNPOOH
// PORT: SOURCE P32-P33_P72-P73.agc:193
//#	 GOFLASHR
// PORT: SOURCE P32-P33_P72-P73.agc:194
//#	 BLANKET
// PORT: SOURCE P32-P33_P72-P73.agc:195
//#	 ENDOFJOB
// PORT: SOURCE P32-P33_P72-P73.agc:196
//#	 SELECTMU
// PORT: SOURCE P32-P33_P72-P73.agc:197
//#	 ADVANCE
// PORT: SOURCE P32-P33_P72-P73.agc:198
//#	 INTINT
// PORT: SOURCE P32-P33_P72-P73.agc:199
//#	 PASSIVE
// PORT: SOURCE P32-P33_P72-P73.agc:200
//#	 CSI/A
// PORT: SOURCE P32-P33_P72-P73.agc:201
//#	 S32/33.1
// PORT: SOURCE P32-P33_P72-P73.agc:202
//#	 DISDVLVC
// PORT: SOURCE P32-P33_P72-P73.agc:203
//#	 VN1645
// PORT: SOURCE P32-P33_P72-P73.agc:204
//
// PORT: SOURCE P32-P33_P72-P73.agc:205
//		BANK	35
// PORT: SOURCE P32-P33_P72-P73.agc:206
//		SETLOC	CSI/CDH1
// PORT: SOURCE P32-P33_P72-P73.agc:207
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:208
//		EBANK=	SUBEXIT
// PORT: SOURCE P32-P33_P72-P73.agc:209
//		COUNT	35/P3272
// PORT: SOURCE P32-P33_P72-P73.agc:210
//
// PORT: SOURCE P32-P33_P72-P73.agc:211
//P32		TC	AVFLAGA
// PORT: Fixed ROM slots 6851.
            if slot <> 6851 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:212
//		TC	P32STRT
// PORT: Fixed ROM slots 6852.
            if slot <> 6852 or instruction <> 1734 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1734, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6853 {
// PORT: SOURCE P32-P33_P72-P73.agc:213
//P72		TC	AVFLAGP
// PORT: Fixed ROM slots 6853.
            if slot <> 6853 or instruction <> 2466 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2466, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:214
//P32STRT		TC	INTPRET
// PORT: Fixed ROM slots 6854.
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
// PORT: SOURCE P32-P33_P72-P73.agc:215
//		DLOAD
// PORT: Fixed ROM slots 6855.
    6855, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:216
//			ZEROVEC
// PORT: Fixed ROM slots 6856.
    6856, 9964,
// PORT: SOURCE P32-P33_P72-P73.agc:217
//		STORE	CENTANG
// PORT: Fixed ROM slots 6857.
    6857, 4056,
// PORT: SOURCE P32-P33_P72-P73.agc:218
//		EXIT
// PORT: Fixed ROM slots 6858.
    6858, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6859–6859.
function agcAotUnit407 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P33_P72-P73.agc:219
//		TC	P32/P72A
// PORT: Fixed ROM slots 6859.
    if slot <> 6859 or instruction <> 1753 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1753, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[407] to agcAotUnit407@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:220
//ALMXITA		SXA,2
// PORT: Fixed ROM slots 6860.
    6860, 65464,
// PORT: SOURCE P32-P33_P72-P73.agc:221
//			CSIALRM
// PORT: Fixed ROM slots 6861.
    6861, 3944,
// PORT: SOURCE P32-P33_P72-P73.agc:222
//ALMXIT		LXC,1
// PORT: Fixed ROM slots 6862.
    6862, 65472,
// PORT: SOURCE P32-P33_P72-P73.agc:223
//			CSIALRM
// PORT: Fixed ROM slots 6863.
    6863, 3944,
// PORT: SOURCE P32-P33_P72-P73.agc:224
//		SLOAD*	EXIT
// PORT: Fixed ROM slots 6864.
    6864, 65206,
// PORT: SOURCE P32-P33_P72-P73.agc:225
//			ALARM/TB -1,1
// PORT: Fixed ROM slots 6865.
    6865, 14166
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6866–6869.
function agcAotUnit408 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6867 {
        if slot <= 6866 {
// PORT: SOURCE P32-P33_P72-P73.agc:226
//		CA	MPAC
// PORT: Fixed ROM slots 6866.
            if slot <> 6866 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:227
//		TC	VARALARM
// PORT: Fixed ROM slots 6867.
            if slot <> 6867 or instruction <> 3060 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3060, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6868 {
// PORT: SOURCE P32-P33_P72-P73.agc:228
//		CAF	V05N09
// PORT: Fixed ROM slots 6868.
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
// PORT: SOURCE P32-P33_P72-P73.agc:229
//		TC	BANKCALL
// PORT: Fixed ROM slots 6869.
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
// PORT: SOURCE P32-P33_P72-P73.agc:230
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6870.
    6870, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6871–6874.
function agcAotUnit409 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6872 {
        if slot <= 6871 {
// PORT: SOURCE P32-P33_P72-P73.agc:231
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 6871.
            if slot <> 6871 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:232
//		TC	-4
// PORT: Fixed ROM slots 6872.
            if slot <> 6872 or instruction <> 1748 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1748, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6873 {
// PORT: SOURCE P32-P33_P72-P73.agc:233
//P32/P72A	TC	P20FLGON
// PORT: Fixed ROM slots 6873.
            if slot <> 6873 or instruction <> 2471 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2471, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:234
//		TC	INTPRET
// PORT: Fixed ROM slots 6874.
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
// PORT: SOURCE P32-P33_P72-P73.agc:235
//		DLOAD
// PORT: Fixed ROM slots 6875.
    6875, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:236
//			ZEROVEC
// PORT: Fixed ROM slots 6876.
    6876, 9964,
// PORT: SOURCE P32-P33_P72-P73.agc:237
//		STORE	NN
// PORT: Fixed ROM slots 6877.
    6877, 4076,
// PORT: SOURCE P32-P33_P72-P73.agc:238
//		EXIT
// PORT: Fixed ROM slots 6878.
    6878, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6879–6882.
function agcAotUnit410 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6880 {
        if slot <= 6879 {
// PORT: SOURCE P32-P33_P72-P73.agc:239
//		CAF	V06N11		# TCSI
// PORT: Fixed ROM slots 6879.
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
// PORT: SOURCE P32-P33_P72-P73.agc:240
//		TC	VNPOOH
// PORT: Fixed ROM slots 6880.
            if slot <> 6880 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6881 {
// PORT: SOURCE P32-P33_P72-P73.agc:241
//		CAF	V06N55		# NN. ELEV(RGL05)
// PORT: Fixed ROM slots 6881.
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
// PORT: SOURCE P32-P33_P72-P73.agc:242
//# Page 653
// PORT: SOURCE P32-P33_P72-P73.agc:243
//		TC	BANKCALL
// PORT: Fixed ROM slots 6882.
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
// PORT: SOURCE P32-P33_P72-P73.agc:244
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6883.
    6883, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6884–6889.
function agcAotUnit411 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6886 {
        if slot <= 6884 {
// PORT: SOURCE P32-P33_P72-P73.agc:245
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 6884.
            if slot <> 6884 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6885 {
// PORT: SOURCE P32-P33_P72-P73.agc:246
//		TC	+2
// PORT: Fixed ROM slots 6885.
                if slot <> 6885 or instruction <> 1767 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1767, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P33_P72-P73.agc:247
//		TC	-5
// PORT: Fixed ROM slots 6886.
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
// PORT: SOURCE P32-P33_P72-P73.agc:248
//		CAF	V06N37		# TTPI
// PORT: Fixed ROM slots 6887.
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
// PORT: SOURCE P32-P33_P72-P73.agc:249
//		TC	VNPOOH
// PORT: Fixed ROM slots 6888.
                if slot <> 6888 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P33_P72-P73.agc:250
//		TC	INTPRET
// PORT: Fixed ROM slots 6889.
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
// PORT: SOURCE P32-P33_P72-P73.agc:251
//		DLOAD
// PORT: Fixed ROM slots 6890.
    6890, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:252
//			TCSI
// PORT: Fixed ROM slots 6891.
    6891, 2878,
// PORT: SOURCE P32-P33_P72-P73.agc:253
//		STCALL	TIG
// PORT: Fixed ROM slots 6892.
    6892, 32278,
// PORT: SOURCE P32-P33_P72-P73.agc:254
//			SELECTMU
// PORT: Fixed ROM slots 6893.
    6893, 9108,
// PORT: SOURCE P32-P33_P72-P73.agc:255
//P32/P72B	CALL
// PORT: Fixed ROM slots 6894.
    6894, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:256
//			ADVANCE
// PORT: Fixed ROM slots 6895.
    6895, 64330,
// PORT: SOURCE P32-P33_P72-P73.agc:257
//		SETPD	VLOAD
// PORT: Fixed ROM slots 6896.
    6896, 64770,
// PORT: SOURCE P32-P33_P72-P73.agc:258
//			0D
// PORT: Fixed ROM slots 6897.
    6897, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:259
//			VPASS1
// PORT: Fixed ROM slots 6898.
    6898, 3732,
// PORT: SOURCE P32-P33_P72-P73.agc:260
//		PDVL	PDDL
// PORT: Fixed ROM slots 6899.
    6899, 54682,
// PORT: SOURCE P32-P33_P72-P73.agc:261
//			RPASS1
// PORT: Fixed ROM slots 6900.
    6900, 4060,
// PORT: SOURCE P32-P33_P72-P73.agc:262
//			TCSI
// PORT: Fixed ROM slots 6901.
    6901, 2878,
// PORT: SOURCE P32-P33_P72-P73.agc:263
//		PDDL	PDDL
// PORT: Fixed ROM slots 6902.
    6902, 54698,
// PORT: SOURCE P32-P33_P72-P73.agc:264
//			TTPI
// PORT: Fixed ROM slots 6903.
    6903, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:265
//			2PISC
// PORT: Fixed ROM slots 6904.
    6904, 10032,
// PORT: SOURCE P32-P33_P72-P73.agc:266
//		SL2	PUSH
// PORT: Fixed ROM slots 6905.
    6905, 34452,
// PORT: SOURCE P32-P33_P72-P73.agc:267
//		CALL
// PORT: Fixed ROM slots 6906.
    6906, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:268
//			INTINT
// PORT: Fixed ROM slots 6907.
    6907, 60298,
// PORT: SOURCE P32-P33_P72-P73.agc:269
//		CALL
// PORT: Fixed ROM slots 6908.
    6908, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:270
//			PASSIVE
// PORT: Fixed ROM slots 6909.
    6909, 38222,
// PORT: SOURCE P32-P33_P72-P73.agc:271
//		CALL
// PORT: Fixed ROM slots 6910.
    6910, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:272
//			CSI/A
// PORT: Fixed ROM slots 6911.
    6911, 14216,
// PORT: SOURCE P32-P33_P72-P73.agc:273
//P32/P72C	BON	SET
// PORT: Fixed ROM slots 6912.
    6912, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:274
//			FINALFLG
// PORT: Fixed ROM slots 6913.
    6913, 1426,
// PORT: SOURCE P32-P33_P72-P73.agc:275
//			P32/P72D
// PORT: Fixed ROM slots 6914.
    6914, 9736,
// PORT: SOURCE P32-P33_P72-P73.agc:276
//			UPDATFLG
// PORT: Fixed ROM slots 6915.
    6915, 624,
// PORT: SOURCE P32-P33_P72-P73.agc:277
//P32/P72D	DLOAD	GOTO
// PORT: Fixed ROM slots 6916.
    6916, 43210,
// PORT: SOURCE P32-P33_P72-P73.agc:278
//			T1TOT2
// PORT: Fixed ROM slots 6917.
    6917, 2766,
// PORT: SOURCE P32-P33_P72-P73.agc:279
//			P32/P72E
// PORT: Fixed ROM slots 6918.
    6918, 24580,
// PORT: SOURCE P32-P33_P72-P73.agc:280
//		SETLOC	CSI/CDH3
// PORT: SOURCE P32-P33_P72-P73.agc:281
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:282
//P32/P72E	STORE	T1TOT2
// PORT: Fixed ROM slots 14338.
    14338, 2766,
// PORT: SOURCE P32-P33_P72-P73.agc:283
//		DSU	BPL
// PORT: Fixed ROM slots 14339.
    14339, 42026,
// PORT: SOURCE P32-P33_P72-P73.agc:284
//			60MIN
// PORT: Fixed ROM slots 14340.
    14340, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:285
//			P32/P72E
// PORT: Fixed ROM slots 14341.
    14341, 24580,
// PORT: SOURCE P32-P33_P72-P73.agc:286
//		DLOAD	GOTO
// PORT: Fixed ROM slots 14342.
    14342, 43210,
// PORT: SOURCE P32-P33_P72-P73.agc:287
//			T2TOT3
// PORT: Fixed ROM slots 14343.
    14343, 3932,
// PORT: SOURCE P32-P33_P72-P73.agc:288
//			P32/P72F
// PORT: Fixed ROM slots 14344.
    14344, 9742,
// PORT: SOURCE P32-P33_P72-P73.agc:289
//		SETLOC	CSI/CDH1
// PORT: SOURCE P32-P33_P72-P73.agc:290
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:291
//P32/P72F	STORE	T2TOT3
// PORT: Fixed ROM slots 6919.
    6919, 3932,
// PORT: SOURCE P32-P33_P72-P73.agc:292
//		DSU	BPL
// PORT: Fixed ROM slots 6920.
    6920, 42026,
// PORT: SOURCE P32-P33_P72-P73.agc:293
//# Page 654
// PORT: SOURCE P32-P33_P72-P73.agc:294
//			60MIN
// PORT: Fixed ROM slots 6921.
    6921, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:295
//			P32/P72F
// PORT: Fixed ROM slots 6922.
    6922, 9742,
// PORT: SOURCE P32-P33_P72-P73.agc:296
//		EXIT
// PORT: Fixed ROM slots 6923.
    6923, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6924–6926.
function agcAotUnit412 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6924 {
// PORT: SOURCE P32-P33_P72-P73.agc:297
//		CAF	V06N75
// PORT: Fixed ROM slots 6924.
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
// PORT: SOURCE P32-P33_P72-P73.agc:298
//		TC	VNPOOH
// PORT: Fixed ROM slots 6925.
            if slot <> 6925 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:299
//		TC	INTPRET
// PORT: Fixed ROM slots 6926.
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
// PORT: SOURCE P32-P33_P72-P73.agc:300
//		VLOAD	CALL
// PORT: Fixed ROM slots 6927.
    6927, 38138,
// PORT: SOURCE P32-P33_P72-P73.agc:301
//			DELVEET1
// PORT: Fixed ROM slots 6928.
    6928, 2634,
// PORT: SOURCE P32-P33_P72-P73.agc:302
//			S32/33.1
// PORT: Fixed ROM slots 6929.
    6929, 61022,
// PORT: SOURCE P32-P33_P72-P73.agc:303
//		STOVL	DELVEET1
// PORT: Fixed ROM slots 6930.
    6930, 23114,
// PORT: SOURCE P32-P33_P72-P73.agc:304
//			RACT2
// PORT: Fixed ROM slots 6931.
    6931, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:305
//		STOVL	RACT1
// PORT: Fixed ROM slots 6932.
    6932, 23234,
// PORT: SOURCE P32-P33_P72-P73.agc:306
//			DELVEET2
// PORT: Fixed ROM slots 6933.
    6933, 3950,
// PORT: SOURCE P32-P33_P72-P73.agc:307
//		AXT,1	CALL
// PORT: Fixed ROM slots 6934.
    6934, 38128,
// PORT: SOURCE P32-P33_P72-P73.agc:308
//		VN	0682
// PORT: Fixed ROM slots 6935.
    6935, 1700,
// PORT: SOURCE P32-P33_P72-P73.agc:309
//			DISDVLVC
// PORT: Fixed ROM slots 6936.
    6936, 64298,
// PORT: SOURCE P32-P33_P72-P73.agc:310
//		DLOAD
// PORT: Fixed ROM slots 6937.
    6937, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:311
//			TTPI
// PORT: Fixed ROM slots 6938.
    6938, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:312
//		STCALL	TTPIO
// PORT: Fixed ROM slots 6939.
    6939, 31554,
// PORT: SOURCE P32-P33_P72-P73.agc:313
//			VN1645
// PORT: Fixed ROM slots 6940.
    6940, 60420,
// PORT: SOURCE P32-P33_P72-P73.agc:314
//		GOTO
// PORT: Fixed ROM slots 6941.
    6941, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:315
//			P32/P72B
// PORT: Fixed ROM slots 6942.
    6942, 9692
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6943–6949.
function agcAotUnit413 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6945 {
        if slot <= 6943 {
// PORT: SOURCE P32-P33_P72-P73.agc:316
//# Page 655
// PORT: SOURCE P32-P33_P72-P73.agc:317
//# CONSTANT DELTA HEIGHT (CDH) PROGRAMS (P33 AND P73)
// PORT: SOURCE P32-P33_P72-P73.agc:318
//
// PORT: SOURCE P32-P33_P72-P73.agc:319
//# MOD NO -1		LOC SECTION - P32-P35, P72-P75
// PORT: SOURCE P32-P33_P72-P73.agc:320
//# MOD BY WHITE.P	DATE 1JUNE67
// PORT: SOURCE P32-P33_P72-P73.agc:321
//# PURPOSE
// PORT: SOURCE P32-P33_P72-P73.agc:322
//
// PORT: SOURCE P32-P33_P72-P73.agc:323
//#	 (1) TO CALCULATE PARAMETERS ASSOCIATED WITH THE CONSTANT DELTA
// PORT: SOURCE P32-P33_P72-P73.agc:324
//#	     ALTITUDE MANEUVER (CDH).
// PORT: SOURCE P32-P33_P72-P73.agc:325
//
// PORT: SOURCE P32-P33_P72-P73.agc:326
//#	 (2) TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// PORT: SOURCE P32-P33_P72-P73.agc:327
//#	     APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// PORT: SOURCE P32-P33_P72-P73.agc:328
//
// PORT: SOURCE P32-P33_P72-P73.agc:329
//#	 (3) TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// PORT: SOURCE P32-P33_P72-P73.agc:330
//#	     ASSOCIATED WITH THE CDH MANEUVER FOR APPROVAL BY THE
// PORT: SOURCE P32-P33_P72-P73.agc:331
//#	     ASTRONAUT/GROUND.
// PORT: SOURCE P32-P33_P72-P73.agc:332
//
// PORT: SOURCE P32-P33_P72-P73.agc:333
//#	 (4) TO STORE THE CDH TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P32-P33_P72-P73.agc:334
//#	     THRUSTING PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:335
//
// PORT: SOURCE P32-P33_P72-P73.agc:336
//# ASSUMPTIONS
// PORT: SOURCE P32-P33_P72-P73.agc:337
//
// PORT: SOURCE P32-P33_P72-P73.agc:338
//#	 (1) THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF THE
// PORT: SOURCE P32-P33_P72-P73.agc:339
//#	     CO-ELLIPTIC SEQUENCE INITIATION (CSI) PROGRAM (P32/P72).
// PORT: SOURCE P32-P33_P72-P73.agc:340
//#	     THERFORE -
// PORT: SOURCE P32-P33_P72-P73.agc:341
//
// PORT: SOURCE P32-P33_P72-P73.agc:342
//#	     (A) AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// PORT: SOURCE P32-P33_P72-P73.agc:343
//#		 BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// PORT: SOURCE P32-P33_P72-P73.agc:344
//#		 A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// PORT: SOURCE P32-P33_P72-P73.agc:345
//#		 HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// PORT: SOURCE P32-P33_P72-P73.agc:346
//
// PORT: SOURCE P32-P33_P72-P73.agc:347
//#	     (B) THE TIME BETWEEN CSI IGNITION AND CDH IGNITION WAS
// PORT: SOURCE P32-P33_P72-P73.agc:348
//#		 COMPUTED TO BE GREATER THAN 10 MINUTES.
// PORT: SOURCE P32-P33_P72-P73.agc:349
//
// PORT: SOURCE P32-P33_P72-P73.agc:350
//#	     (C) THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// PORT: SOURCE P32-P33_P72-P73.agc:351
//#		 COMPUTED TO BE GREATER THAN 10 MINUTES.
// PORT: SOURCE P32-P33_P72-P73.agc:352
//
// PORT: SOURCE P32-P33_P72-P73.agc:353
//#	     (D) THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// PORT: SOURCE P32-P33_P72-P73.agc:354
//#		 ORBITS WAS MINIMIZED.
// PORT: SOURCE P32-P33_P72-P73.agc:355
//
// PORT: SOURCE P32-P33_P72-P73.agc:356
//#	     (E) CSI BURN WAS DEFINED SUCH THAT THE IMPULSIVE DELTA V WAS
// PORT: SOURCE P32-P33_P72-P73.agc:357
//#		 IN THE HORIZONTAL PLANE DEFINED BY ACTIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:358
//
// PORT: SOURCE P32-P33_P72-P73.agc:359
//#		 POSITION AT CSI IGNITION.
// PORT: SOURCE P32-P33_P72-P73.agc:360
//
// PORT: SOURCE P32-P33_P72-P73.agc:361
//#	     (F) THE PERICENTER ALTITUDES OF THE ORBITS FOLLOWING CSI AND
// PORT: SOURCE P32-P33_P72-P73.agc:362
//#		 CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// PORT: SOURCE P32-P33_P72-P73.agc:363
//#		 ORBIT OR 85 NM FOR EARTH ORBIT.
// PORT: SOURCE P32-P33_P72-P73.agc:364
//
// PORT: SOURCE P32-P33_P72-P73.agc:365
//#	     (G) THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// PORT: SOURCE P32-P33_P72-P73.agc:366
//#		 THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// PORT: SOURCE P32-P33_P72-P73.agc:367
//# Page 656
// PORT: SOURCE P32-P33_P72-P73.agc:368
//#		 MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// PORT: SOURCE P32-P33_P72-P73.agc:369
//#		 IN AN OUT-OF-PLANE MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:370
//
// PORT: SOURCE P32-P33_P72-P73.agc:371
//#	 (2) STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P32-P33_P72-P73.agc:372
//#	     STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 4).
// PORT: SOURCE P32-P33_P72-P73.agc:373
//
// PORT: SOURCE P32-P33_P72-P73.agc:374
//#	 (3) COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// PORT: SOURCE P32-P33_P72-P73.agc:375
//#	     THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// PORT: SOURCE P32-P33_P72-P73.agc:376
//#	     ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// PORT: SOURCE P32-P33_P72-P73.agc:377
//#	     EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// PORT: SOURCE P32-P33_P72-P73.agc:378
//
// PORT: SOURCE P32-P33_P72-P73.agc:379
//#	 (4) THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// PORT: SOURCE P32-P33_P72-P73.agc:380
//#	     OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// PORT: SOURCE P32-P33_P72-P73.agc:381
//#	     DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// PORT: SOURCE P32-P33_P72-P73.agc:382
//#	     PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// PORT: SOURCE P32-P33_P72-P73.agc:383
//#	     AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// PORT: SOURCE P32-P33_P72-P73.agc:384
//#	     TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// PORT: SOURCE P32-P33_P72-P73.agc:385
//#	     MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// PORT: SOURCE P32-P33_P72-P73.agc:386
//#	     THRUSTING MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:387
//
// PORT: SOURCE P32-P33_P72-P73.agc:388
//#	 (5) THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:389
//
// PORT: SOURCE P32-P33_P72-P73.agc:390
//#	 (6) THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS -
// PORT: SOURCE P32-P33_P72-P73.agc:391
//
// PORT: SOURCE P32-P33_P72-P73.agc:392
//#		ACTIVE VEHICLE FLAG - DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P32-P33_P72-P73.agc:393
//#		DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P32-P33_P72-P73.agc:394
//#		CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P32-P33_P72-P73.agc:395
//#		EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:396
//
// PORT: SOURCE P32-P33_P72-P73.agc:397
//#		FINAL FLAG - SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P32-P33_P72-P73.agc:398
//#		COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// PORT: SOURCE P32-P33_P72-P73.agc:399
//#		CYCLE.
// PORT: SOURCE P32-P33_P72-P73.agc:400
//
// PORT: SOURCE P32-P33_P72-P73.agc:401
//#		EXTERNAL DELTA V STEERING FLAG - DESIGNATES THE TYPE OF
// PORT: SOURCE P32-P33_P72-P73.agc:402
//#		STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// PORT: SOURCE P32-P33_P72-P73.agc:403
//#		THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// PORT: SOURCE P32-P33_P72-P73.agc:404
//#		PROGRAM.
// PORT: SOURCE P32-P33_P72-P73.agc:405
//
// PORT: SOURCE P32-P33_P72-P73.agc:406
//#	 (7) IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// PORT: SOURCE P32-P33_P72-P73.agc:407
//#	     A THRUSTING MANEUVER.
// PORT: SOURCE P32-P33_P72-P73.agc:408
//
// PORT: SOURCE P32-P33_P72-P73.agc:409
//#	 (8) THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY -
// PORT: SOURCE P32-P33_P72-P73.agc:410
//
// PORT: SOURCE P32-P33_P72-P73.agc:411
//#		P33 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P32-P33_P72-P73.agc:412
//
// PORT: SOURCE P32-P33_P72-P73.agc:413
//#		P73 IF THIS VEHICLE IS PASSIVE VEHICLE.
// PORT: SOURCE P32-P33_P72-P73.agc:414
//
// PORT: SOURCE P32-P33_P72-P73.agc:415
//# INPUT
// PORT: SOURCE P32-P33_P72-P73.agc:416
//
// PORT: SOURCE P32-P33_P72-P73.agc:417
//#	 (1) TTPIO	TIME OF THE TPI MANEUVER - SAVED FROM P32/P72
// PORT: SOURCE P32-P33_P72-P73.agc:418
//# Page 657
// PORT: SOURCE P32-P33_P72-P73.agc:419
//#	 (2) ELEV	DESIRED LOS ANGLE AT TPI - SAVED FROM P32/P72
// PORT: SOURCE P32-P33_P72-P73.agc:420
//#	 (3) TCDH	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:421
//
// PORT: SOURCE P32-P33_P72-P73.agc:422
//# OUTPUT
// PORT: SOURCE P32-P33_P72-P73.agc:423
//
// PORT: SOURCE P32-P33_P72-P73.agc:424
//#	 (1) TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P32-P33_P72-P73.agc:425
//#	 (2) TTOGO	TIME TO GO
// PORT: SOURCE P32-P33_P72-P73.agc:426
//#	 (3) +MGA	MIDDLE GIMBAL ANGLE
// PORT: SOURCE P32-P33_P72-P73.agc:427
//#	 (4) DIFFALT	DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P33_P72-P73.agc:428
//#	 (5) T2TOT3	DELTA TIME FROM CDH TO COMPUTED TPI
// PORT: SOURCE P32-P33_P72-P73.agc:429
//#	 (6) NOMTPI	DELTA TIME FROM NOMINAL TPI TO COMPUTED TPI
// PORT: SOURCE P32-P33_P72-P73.agc:430
//#	 (7) DELVLVC	DELTA VELOCITY AT CDH - LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:431
//
// PORT: SOURCE P32-P33_P72-P73.agc:432
//# DOWNLINK
// PORT: SOURCE P32-P33_P72-P73.agc:433
//
// PORT: SOURCE P32-P33_P72-P73.agc:434
//#	 (1) TCDH	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:435
//#	 (2) TTPI	TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:436
//#	 (3) TIG	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:437
//#	 (4) DELLVEET2	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:438
//#	 (5) DIFFALT	DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P33_P72-P73.agc:439
//#	 (6) ELEV	DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P33_P72-P73.agc:440
//# COMMUNICATION TO THRUSTING PROGRAMS
// PORT: SOURCE P32-P33_P72-P73.agc:441
//
// PORT: SOURCE P32-P33_P72-P73.agc:442
//#	 (1) TIG	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P33_P72-P73.agc:443
//#	 (2) RTIG	POSITION OF ACTIVE VEHICLE AT CDH - BEFORE ROTATION
// PORT: SOURCE P32-P33_P72-P73.agc:444
//#			INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:445
//#	 (3) VTIG	VELOCITY OF ACTIVE VEHICLE AT CDH - BEFORE ROTATION
// PORT: SOURCE P32-P33_P72-P73.agc:446
//#			INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P33_P72-P73.agc:447
//#	 (4) DELVSIN	DELTA VELOCITY AT CDH - REFERENCE COORDINATES
// PORT: SOURCE P32-P33_P72-P73.agc:448
//#	 (5) DELVSAB	MAGNITUDE OF DELTA VELOCITY AT CDH
// PORT: SOURCE P32-P33_P72-P73.agc:449
//#	 (6) XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// PORT: SOURCE P32-P33_P72-P73.agc:450
//
// PORT: SOURCE P32-P33_P72-P73.agc:451
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:452
//
// PORT: SOURCE P32-P33_P72-P73.agc:453
//#	 AVFLAGA
// PORT: SOURCE P32-P33_P72-P73.agc:454
//#	 AVFLAGP
// PORT: SOURCE P32-P33_P72-P73.agc:455
//#	 P20FLGON
// PORT: SOURCE P32-P33_P72-P73.agc:456
//#	 VNPOOH
// PORT: SOURCE P32-P33_P72-P73.agc:457
//#	 SELECTMU
// PORT: SOURCE P32-P33_P72-P73.agc:458
//#	 ADVANCE
// PORT: SOURCE P32-P33_P72-P73.agc:459
//#	 CDHMVR
// PORT: SOURCE P32-P33_P72-P73.agc:460
//#	 INTINT3P
// PORT: SOURCE P32-P33_P72-P73.agc:461
//#	 ACTIVE
// PORT: SOURCE P32-P33_P72-P73.agc:462
//#	 PASSIVE
// PORT: SOURCE P32-P33_P72-P73.agc:463
//#	 S33/S34.1
// PORT: SOURCE P32-P33_P72-P73.agc:464
//#	 ALARM
// PORT: SOURCE P32-P33_P72-P73.agc:465
//#	 BANKCALL
// PORT: SOURCE P32-P33_P72-P73.agc:466
//#	 GOFLASH
// PORT: SOURCE P32-P33_P72-P73.agc:467
//#	 GOTOPOOH
// PORT: SOURCE P32-P33_P72-P73.agc:468
//#	 S32/33.1
// PORT: SOURCE P32-P33_P72-P73.agc:469
//# Page 658
// PORT: SOURCE P32-P33_P72-P73.agc:470
//#	 VN1645
// PORT: SOURCE P32-P33_P72-P73.agc:471
//
// PORT: SOURCE P32-P33_P72-P73.agc:472
//		COUNT	35/P3373
// PORT: SOURCE P32-P33_P72-P73.agc:473
//
// PORT: SOURCE P32-P33_P72-P73.agc:474
//P33		TC	AVFLAGA
// PORT: Fixed ROM slots 6943.
            if slot <> 6943 or instruction <> 2455 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2455, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6944 {
// PORT: SOURCE P32-P33_P72-P73.agc:475
//		TC	P33/P73A
// PORT: Fixed ROM slots 6944.
                if slot <> 6944 or instruction <> 1826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1826, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P33_P72-P73.agc:476
//P73		TC	AVFLAGP
// PORT: Fixed ROM slots 6945.
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
// PORT: SOURCE P32-P33_P72-P73.agc:477
//P33/P73A	TC	P20FLGON
// PORT: Fixed ROM slots 6946.
                if slot <> 6946 or instruction <> 2471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2471, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P33_P72-P73.agc:478
//		CAF	V06N13		# TCDH
// PORT: Fixed ROM slots 6947.
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
// PORT: SOURCE P32-P33_P72-P73.agc:479
//		TC	VNPOOH
// PORT: Fixed ROM slots 6948.
                if slot <> 6948 or instruction <> 2429 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2429, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P33_P72-P73.agc:480
//		TC	INTPRET
// PORT: Fixed ROM slots 6949.
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
// PORT: SOURCE P32-P33_P72-P73.agc:481
//		DLOAD
// PORT: Fixed ROM slots 6950.
    6950, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:482
//			TTPIO
// PORT: Fixed ROM slots 6951.
    6951, 2882,
// PORT: SOURCE P32-P33_P72-P73.agc:483
//		STODL	TTPI
// PORT: Fixed ROM slots 6952.
    6952, 16230,
// PORT: SOURCE P32-P33_P72-P73.agc:484
//			TCDH
// PORT: Fixed ROM slots 6953.
    6953, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:485
//		STCALL	TIG
// PORT: Fixed ROM slots 6954.
    6954, 32278,
// PORT: SOURCE P32-P33_P72-P73.agc:486
//			SELECTMU
// PORT: Fixed ROM slots 6955.
    6955, 9108,
// PORT: SOURCE P32-P33_P72-P73.agc:487
//P33/P73B	CALL
// PORT: Fixed ROM slots 6956.
    6956, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:488
//			ADVANCE
// PORT: Fixed ROM slots 6957.
    6957, 64330,
// PORT: SOURCE P32-P33_P72-P73.agc:489
//		CALL
// PORT: Fixed ROM slots 6958.
    6958, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:490
//			CDHMVR
// PORT: Fixed ROM slots 6959.
    6959, 11568,
// PORT: SOURCE P32-P33_P72-P73.agc:491
//		SETPD	VLOAD
// PORT: Fixed ROM slots 6960.
    6960, 64770,
// PORT: SOURCE P32-P33_P72-P73.agc:492
//			0D
// PORT: Fixed ROM slots 6961.
    6961, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:493
//			VACT3
// PORT: Fixed ROM slots 6962.
    6962, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:494
//		PDVL	CALL
// PORT: Fixed ROM slots 6963.
    6963, 38042,
// PORT: SOURCE P32-P33_P72-P73.agc:495
//			RACT2
// PORT: Fixed ROM slots 6964.
    6964, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:496
//			INTINT3P
// PORT: Fixed ROM slots 6965.
    6965, 53106,
// PORT: SOURCE P32-P33_P72-P73.agc:497
//		CALL
// PORT: Fixed ROM slots 6966.
    6966, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:498
//			ACTIVE
// PORT: Fixed ROM slots 6967.
    6967, 38206,
// PORT: SOURCE P32-P33_P72-P73.agc:499
//		SETPD	VLOAD
// PORT: Fixed ROM slots 6968.
    6968, 64770,
// PORT: SOURCE P32-P33_P72-P73.agc:500
//			0D
// PORT: Fixed ROM slots 6969.
    6969, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:501
//			VPASS2
// PORT: Fixed ROM slots 6970.
    6970, 2846,
// PORT: SOURCE P32-P33_P72-P73.agc:502
//		PDVL	CALL
// PORT: Fixed ROM slots 6971.
    6971, 38042,
// PORT: SOURCE P32-P33_P72-P73.agc:503
//			RPASS2
// PORT: Fixed ROM slots 6972.
    6972, 2858,
// PORT: SOURCE P32-P33_P72-P73.agc:504
//			INTINT3P
// PORT: Fixed ROM slots 6973.
    6973, 53106,
// PORT: SOURCE P32-P33_P72-P73.agc:505
//		CALL
// PORT: Fixed ROM slots 6974.
    6974, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:506
//			PASSIVE
// PORT: Fixed ROM slots 6975.
    6975, 38222,
// PORT: SOURCE P32-P33_P72-P73.agc:507
//		DLOAD	SET
// PORT: Fixed ROM slots 6976.
    6976, 36042,
// PORT: SOURCE P32-P33_P72-P73.agc:508
//			ZEROVEC
// PORT: Fixed ROM slots 6977.
    6977, 9964,
// PORT: SOURCE P32-P33_P72-P73.agc:509
//			ITSWICH
// PORT: Fixed ROM slots 6978.
    6978, 3682,
// PORT: SOURCE P32-P33_P72-P73.agc:510
//		STCALL	NOMTPI
// PORT: Fixed ROM slots 6979.
    6979, 31208,
// PORT: SOURCE P32-P33_P72-P73.agc:511
//			S33/34.1
// PORT: Fixed ROM slots 6980.
    6980, 59676,
// PORT: SOURCE P32-P33_P72-P73.agc:512
//		BZE	EXIT
// PORT: Fixed ROM slots 6981.
    6981, 65112,
// PORT: SOURCE P32-P33_P72-P73.agc:513
//			P33/P73C
// PORT: Fixed ROM slots 6982.
    6982, 20480
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6983–6983.
function agcAotUnit414 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P33_P72-P73.agc:514
//		TC	ALARM
// PORT: Fixed ROM slots 6983.
    if slot <> 6983 or instruction <> 2984 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2984, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[414] to agcAotUnit414@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:515
//		OCT	611
// PORT: Fixed ROM slots 6984.
    6984, 786
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6985–6986.
function agcAotUnit415 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6985 {
// PORT: SOURCE P32-P33_P72-P73.agc:516
//		CAF	V05N09
// PORT: Fixed ROM slots 6985.
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
// PORT: SOURCE P32-P33_P72-P73.agc:517
//		TC	BANKCALL
// PORT: Fixed ROM slots 6986.
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
// PORT: SOURCE P32-P33_P72-P73.agc:518
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6987.
    6987, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6988–6991.
function agcAotUnit416 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6989 {
        if slot <= 6988 {
// PORT: SOURCE P32-P33_P72-P73.agc:519
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 6988.
            if slot <> 6988 or instruction <> 2118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:520
//# Page 659
// PORT: SOURCE P32-P33_P72-P73.agc:521
//		TC	+2
// PORT: Fixed ROM slots 6989.
            if slot <> 6989 or instruction <> 1871 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1871, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6990 {
// PORT: SOURCE P32-P33_P72-P73.agc:522
//		TC	P33/P73A
// PORT: Fixed ROM slots 6990.
            if slot <> 6990 or instruction <> 1826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1826, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:523
//		TC	INTPRET
// PORT: Fixed ROM slots 6991.
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
// PORT: SOURCE P32-P33_P72-P73.agc:524
//		DLOAD
// PORT: Fixed ROM slots 6992.
    6992, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:525
//			ZEROVEC
// PORT: Fixed ROM slots 6993.
    6993, 9964,
// PORT: SOURCE P32-P33_P72-P73.agc:526
//		STCALL	NOMTPI
// PORT: Fixed ROM slots 6994.
    6994, 31208,
// PORT: SOURCE P32-P33_P72-P73.agc:527
//			P33/P73C
// PORT: Fixed ROM slots 6995.
    6995, 20480,
// PORT: SOURCE P32-P33_P72-P73.agc:528
//		SETLOC	CSI/CDH2
// PORT: SOURCE P32-P33_P72-P73.agc:529
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:530
//
// PORT: SOURCE P32-P33_P72-P73.agc:531
//P33/P73C	BON	SET
// PORT: Fixed ROM slots 12288.
    12288, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:532
//			FINALFLG
// PORT: Fixed ROM slots 12289.
    12289, 1426,
// PORT: SOURCE P32-P33_P72-P73.agc:533
//			P33/P73D
// PORT: Fixed ROM slots 12290.
    12290, 20488,
// PORT: SOURCE P32-P33_P72-P73.agc:534
//			UPDATFLG
// PORT: Fixed ROM slots 12291.
    12291, 624,
// PORT: SOURCE P32-P33_P72-P73.agc:535
//P33/P73D	DLOAD	DAD
// PORT: Fixed ROM slots 12292.
    12292, 36298,
// PORT: SOURCE P32-P33_P72-P73.agc:536
//			NOMTPI
// PORT: Fixed ROM slots 12293.
    12293, 2536,
// PORT: SOURCE P32-P33_P72-P73.agc:537
//			TTPI
// PORT: Fixed ROM slots 12294.
    12294, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:538
//		STORE	TTPI
// PORT: Fixed ROM slots 12295.
    12295, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:539
//		DSU	GOTO
// PORT: Fixed ROM slots 12296.
    12296, 43050,
// PORT: SOURCE P32-P33_P72-P73.agc:540
//			TCDH
// PORT: Fixed ROM slots 12297.
    12297, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:541
//			P33/P73E
// PORT: Fixed ROM slots 12298.
    12298, 9896,
// PORT: SOURCE P32-P33_P72-P73.agc:542
//		SETLOC	CSI/CDH1
// PORT: SOURCE P32-P33_P72-P73.agc:543
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:544
//
// PORT: SOURCE P32-P33_P72-P73.agc:545
//P33/P73E	DSU	BPL
// PORT: Fixed ROM slots 6996.
    6996, 42026,
// PORT: SOURCE P32-P33_P72-P73.agc:546
//			60MIN
// PORT: Fixed ROM slots 6997.
    6997, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:547
//			P33/P73E
// PORT: Fixed ROM slots 6998.
    6998, 9896,
// PORT: SOURCE P32-P33_P72-P73.agc:548
//		DAD
// PORT: Fixed ROM slots 6999.
    6999, 65306,
// PORT: SOURCE P32-P33_P72-P73.agc:549
//			60MIN
// PORT: Fixed ROM slots 7000.
    7000, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:550
//		STODL	T1TOT2
// PORT: Fixed ROM slots 7001.
    7001, 15054,
// PORT: SOURCE P32-P33_P72-P73.agc:551
//			TTPI
// PORT: Fixed ROM slots 7002.
    7002, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:552
//		DSU	PUSH
// PORT: Fixed ROM slots 7003.
    7003, 34346,
// PORT: SOURCE P32-P33_P72-P73.agc:553
//			TTPIO
// PORT: Fixed ROM slots 7004.
    7004, 2882,
// PORT: SOURCE P32-P33_P72-P73.agc:554
//P33/P73F	ABS	DSU
// PORT: Fixed ROM slots 7005.
    7005, 38220,
// PORT: SOURCE P32-P33_P72-P73.agc:555
//			60MIN
// PORT: Fixed ROM slots 7006.
    7006, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:556
//		BPL	DAD
// PORT: Fixed ROM slots 7007.
    7007, 36168,
// PORT: SOURCE P32-P33_P72-P73.agc:557
//			P33/P73F
// PORT: Fixed ROM slots 7008.
    7008, 9914,
// PORT: SOURCE P32-P33_P72-P73.agc:558
//			60MIN
// PORT: Fixed ROM slots 7009.
    7009, 14164,
// PORT: SOURCE P32-P33_P72-P73.agc:559
//		SIGN	STADR
// PORT: Fixed ROM slots 7010.
    7010, 38634,
// PORT: SOURCE P32-P33_P72-P73.agc:560
//		STORE	T2TOT3
// PORT: Fixed ROM slots 7011.
    7011, 61602,
// PORT: SOURCE P32-P33_P72-P73.agc:561
//		EXIT
// PORT: Fixed ROM slots 7012.
    7012, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 7013–7015.
function agcAotUnit417 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7013 {
// PORT: SOURCE P32-P33_P72-P73.agc:562
//		CAF	V06N75
// PORT: Fixed ROM slots 7013.
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
// PORT: SOURCE P32-P33_P72-P73.agc:563
//		TC	VNPOOH
// PORT: Fixed ROM slots 7014.
            if slot <> 7014 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:564
//		TC	INTPRET
// PORT: Fixed ROM slots 7015.
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
// PORT: SOURCE P32-P33_P72-P73.agc:565
//		VLOAD	CALL
// PORT: Fixed ROM slots 7016.
    7016, 38138,
// PORT: SOURCE P32-P33_P72-P73.agc:566
//			DELVEET2
// PORT: Fixed ROM slots 7017.
    7017, 3950,
// PORT: SOURCE P32-P33_P72-P73.agc:567
//			S32/33.1
// PORT: Fixed ROM slots 7018.
    7018, 61022,
// PORT: SOURCE P32-P33_P72-P73.agc:568
//		STCALL	DELVEET2
// PORT: Fixed ROM slots 7019.
    7019, 32622,
// PORT: SOURCE P32-P33_P72-P73.agc:569
//			VN1645
// PORT: Fixed ROM slots 7020.
    7020, 60420,
// PORT: SOURCE P32-P33_P72-P73.agc:570
//		GOTO
// PORT: Fixed ROM slots 7021.
    7021, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:571
//# Page 660
// PORT: SOURCE P32-P33_P72-P73.agc:572
//			P33/P73B
// PORT: Fixed ROM slots 7022.
    7022, 9816,
// PORT: SOURCE P32-P33_P72-P73.agc:573
//# Page 661
// PORT: SOURCE P32-P33_P72-P73.agc:574
//# ..... AVFLAGA/P .....
// PORT: SOURCE P32-P33_P72-P73.agc:575
//# Page 662
// PORT: SOURCE P32-P33_P72-P73.agc:576
//# ..... DISDVLVC .....
// PORT: SOURCE P32-P33_P72-P73.agc:577
//
// PORT: SOURCE P32-P33_P72-P73.agc:578
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:579
//
// PORT: SOURCE P32-P33_P72-P73.agc:580
//#	 S32/33.X
// PORT: SOURCE P32-P33_P72-P73.agc:581
//#	 VNPOOH
// PORT: SOURCE P32-P33_P72-P73.agc:582
//
// PORT: SOURCE P32-P33_P72-P73.agc:583
//		SETLOC	CDHTAG3
// PORT: SOURCE P32-P33_P72-P73.agc:584
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:585
//
// PORT: SOURCE P32-P33_P72-P73.agc:586
//DISDVLVC	STORE	DELVLVC
// PORT: Fixed ROM slots 34197.
    34197, 3594,
// PORT: SOURCE P32-P33_P72-P73.agc:587
//		STQ	CALL
// PORT: Fixed ROM slots 34198.
    34198, 37920,
// PORT: SOURCE P32-P33_P72-P73.agc:588
//			NORMEX
// PORT: Fixed ROM slots 34199.
    34199, 1472,
// PORT: SOURCE P32-P33_P72-P73.agc:589
//			S32/33.X
// PORT: Fixed ROM slots 34200.
    34200, 22834,
// PORT: SOURCE P32-P33_P72-P73.agc:590
//		VLOAD	MXV
// PORT: Fixed ROM slots 34201.
    34201, 53754,
// PORT: SOURCE P32-P33_P72-P73.agc:591
//			DELVLVC
// PORT: Fixed ROM slots 34202.
    34202, 3594,
// PORT: SOURCE P32-P33_P72-P73.agc:592
//			0D
// PORT: Fixed ROM slots 34203.
    34203, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:593
//		VSL1	SXA,1
// PORT: Fixed ROM slots 34204.
    34204, 55540,
// PORT: SOURCE P32-P33_P72-P73.agc:594
//			VERBNOUN
// PORT: Fixed ROM slots 34205.
    34205, 2538,
// PORT: SOURCE P32-P33_P72-P73.agc:595
//		STORE	DELVLVC
// PORT: Fixed ROM slots 34206.
    34206, 3594,
// PORT: SOURCE P32-P33_P72-P73.agc:596
//		EXIT
// PORT: Fixed ROM slots 34207.
    34207, 65532
)).

// PORT: Physical bank 37. Shared continuation entries, slots 34208–34210.
function agcAotUnit1923 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34208 {
// PORT: SOURCE P32-P33_P72-P73.agc:597
//		CA	VERBNOUN
// PORT: Fixed ROM slots 34208.
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
// PORT: SOURCE P32-P33_P72-P73.agc:598
//		TC	VNPOOH
// PORT: Fixed ROM slots 34209.
            if slot <> 34209 or instruction <> 2429 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2429, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P33_P72-P73.agc:599
//		TC	INTPRET
// PORT: Fixed ROM slots 34210.
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
// PORT: SOURCE P32-P33_P72-P73.agc:600
//		GOTO
// PORT: Fixed ROM slots 34211.
    34211, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:601
//			NORMEX
// PORT: Fixed ROM slots 34212.
    34212, 1472,
// PORT: SOURCE P32-P33_P72-P73.agc:602
//		SETLOC	FFTAG12
// PORT: SOURCE P32-P33_P72-P73.agc:603
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:604
//
// PORT: SOURCE P32-P33_P72-P73.agc:605
//V06N11		VN	0611
// PORT: Fixed ROM slots 4526.
    4526, 1558,
// PORT: SOURCE P32-P33_P72-P73.agc:606
//V06N13		VN	0613
// PORT: Fixed ROM slots 4527.
    4527, 1562,
// PORT: SOURCE P32-P33_P72-P73.agc:607
//V06N75		VN	0675
// PORT: Fixed ROM slots 4528.
    4528, 1686,
// PORT: SOURCE P32-P33_P72-P73.agc:608
//
// PORT: SOURCE P32-P33_P72-P73.agc:609
//V06N50		VN	0650
// PORT: Fixed ROM slots 4529.
    4529, 1636,
// PORT: SOURCE P32-P33_P72-P73.agc:610
//# Page 663
// PORT: SOURCE P32-P33_P72-P73.agc:611
//# ..... CSI/A .....
// PORT: SOURCE P32-P33_P72-P73.agc:612
//
// PORT: SOURCE P32-P33_P72-P73.agc:613
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:614
//
// PORT: SOURCE P32-P33_P72-P73.agc:615
//#	 VECSHIFT
// PORT: SOURCE P32-P33_P72-P73.agc:616
//#	 TIMETHET
// PORT: SOURCE P32-P33_P72-P73.agc:617
//#	 PERIAPO
// PORT: SOURCE P32-P33_P72-P73.agc:618
//#	 SHIFTR1
// PORT: SOURCE P32-P33_P72-P73.agc:619
//#	 INTINT2C
// PORT: SOURCE P32-P33_P72-P73.agc:620
//#	 CDHMVR
// PORT: SOURCE P32-P33_P72-P73.agc:621
//#	 PERIAPO1
// PORT: SOURCE P32-P33_P72-P73.agc:622
//#	 INTINT
// PORT: SOURCE P32-P33_P72-P73.agc:623
//#	 ACTIVE
// PORT: SOURCE P32-P33_P72-P73.agc:624
//
// PORT: SOURCE P32-P33_P72-P73.agc:625
//		BANK	34
// PORT: SOURCE P32-P33_P72-P73.agc:626
//		SETLOC	CSIPROG
// PORT: SOURCE P32-P33_P72-P73.agc:627
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:628
//		EBANK=	SUBEXIT
// PORT: SOURCE P32-P33_P72-P73.agc:629
//		COUNT	34/CSI
// PORT: SOURCE P32-P33_P72-P73.agc:630
//
// PORT: SOURCE P32-P33_P72-P73.agc:631
//60MIN		2DEC	360000
// PORT: Fixed ROM slots 9129 9130.
    9129, 42, 9130, 31872,
// PORT: SOURCE P32-P33_P72-P73.agc:632
//
// PORT: SOURCE P32-P33_P72-P73.agc:633
//ALARM/TB	OCT	00600		# NO 1
// PORT: Fixed ROM slots 9131.
    9131, 768,
// PORT: SOURCE P32-P33_P72-P73.agc:634
//		OCT	00601		#    2
// PORT: Fixed ROM slots 9132.
    9132, 770,
// PORT: SOURCE P32-P33_P72-P73.agc:635
//		OCT	00602		#    3
// PORT: Fixed ROM slots 9133.
    9133, 772,
// PORT: SOURCE P32-P33_P72-P73.agc:636
//		OCT	00603		#    4
// PORT: Fixed ROM slots 9134.
    9134, 774,
// PORT: SOURCE P32-P33_P72-P73.agc:637
//		OCT	00604		#    5
// PORT: Fixed ROM slots 9135.
    9135, 776,
// PORT: SOURCE P32-P33_P72-P73.agc:638
//		OCT	00605		#    6
// PORT: Fixed ROM slots 9136.
    9136, 778,
// PORT: SOURCE P32-P33_P72-P73.agc:639
//		OCT	00606		#    7
// PORT: Fixed ROM slots 9137.
    9137, 780,
// PORT: SOURCE P32-P33_P72-P73.agc:640
//LOOPMX		2DEC	16
// PORT: Fixed ROM slots 9138 9139.
    9138, 0, 9139, 32,
// PORT: SOURCE P32-P33_P72-P73.agc:641
//
// PORT: SOURCE P32-P33_P72-P73.agc:642
//INITST		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// PORT: Fixed ROM slots 9140 9141.
    9140, 6, 9141, 29538,
// PORT: SOURCE P32-P33_P72-P73.agc:643
//
// PORT: SOURCE P32-P33_P72-P73.agc:644
//DVMAX1		2DEC	3.0480 B-7	# MAXIMUM DV1 = 1000 FPS
// PORT: Fixed ROM slots 9142 9143.
    9142, 780, 9143, 4718,
// PORT: SOURCE P32-P33_P72-P73.agc:645
//
// PORT: SOURCE P32-P33_P72-P73.agc:646
//DVMAX2		2DEC	3.014472 B-7	#                989 FPS
// PORT: Fixed ROM slots 9144 9145.
    9144, 770, 9145, 27932,
// PORT: SOURCE P32-P33_P72-P73.agc:647
//
// PORT: SOURCE P32-P33_P72-P73.agc:648
//1DPB2		2DEC	1.08-2
// PORT: Fixed ROM slots 9146 9147.
    9146, 8192, 9147, 0,
// PORT: SOURCE P32-P33_P72-P73.agc:649
//
// PORT: SOURCE P32-P33_P72-P73.agc:650
//1DPB28		2DEC	1
// PORT: Fixed ROM slots 9148 9149.
    9148, 0, 9149, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:651
//
// PORT: SOURCE P32-P33_P72-P73.agc:652
//EPSILN1		2DEC	.0003048 B-7	# .1 FPS
// PORT: Fixed ROM slots 9150 9151.
    9150, 0, 9151, 1278,
// PORT: SOURCE P32-P33_P72-P73.agc:653
//
// PORT: SOURCE P32-P33_P72-P73.agc:654
//FIFPSDP		2DEC	-.152400 B-7	# 50  FPS
// PORT: Fixed ROM slots 9152 9153.
    9152, 65496, 9153, 48914,
// PORT: SOURCE P32-P33_P72-P73.agc:655
//
// PORT: SOURCE P32-P33_P72-P73.agc:656
//DELMAX1		2DEC	.6096000 B-7	# 200 FPS
// PORT: Fixed ROM slots 9154 9155.
    9154, 156, 9155, 944,
// PORT: SOURCE P32-P33_P72-P73.agc:657
//
// PORT: SOURCE P32-P33_P72-P73.agc:658
//		SETLOC	CSI/CDH
// PORT: SOURCE P32-P33_P72-P73.agc:659
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:660
//PMINE		2DEC	157420 B-29	# 84 NM. - MUST BE 8 WORDS BEFORE PMINM
// PORT: Fixed ROM slots 32549 32550.
    32549, 8, 32550, 26348,
// PORT: SOURCE P32-P33_P72-P73.agc:661
//# Page 664
// PORT: SOURCE P32-P33_P72-P73.agc:662
//NICKELDP	2DEC	.021336 B-7	# 7 FPS
// PORT: Fixed ROM slots 32551 32552.
    32551, 4, 32552, 23954,
// PORT: SOURCE P32-P33_P72-P73.agc:663
//
// PORT: SOURCE P32-P33_P72-P73.agc:664
//INITST1		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// PORT: Fixed ROM slots 32553 32554.
    32553, 6, 32554, 29538,
// PORT: SOURCE P32-P33_P72-P73.agc:665
//
// PORT: SOURCE P32-P33_P72-P73.agc:666
//ONETHTH		2DEC	.0001 B-3
// PORT: Fixed ROM slots 32555 32556.
    32555, 0, 32556, 6710,
// PORT: SOURCE P32-P33_P72-P73.agc:667
//
// PORT: SOURCE P32-P33_P72-P73.agc:668
//PMINM		2DEC	10668 B-29	# 35000 FT - MUST BE 8 WORDS AFTER PMINE.
// PORT: Fixed ROM slots 32557 32558.
    32557, 0, 32558, 10668,
// PORT: SOURCE P32-P33_P72-P73.agc:669
//
// PORT: SOURCE P32-P33_P72-P73.agc:670
//		SETLOC	CSIPROG
// PORT: SOURCE P32-P33_P72-P73.agc:671
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:672
//
// PORT: SOURCE P32-P33_P72-P73.agc:673
//CSI/A		CLEAR	SET		# INITIALIZE INDICATORS
// PORT: Fixed ROM slots 9156.
    9156, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:674
//			S32.1F1		# DVT1 HAS EXCEEDED MAX INDICATOR
// PORT: Fixed ROM slots 9157.
    9157, 5984,
// PORT: SOURCE P32-P33_P72-P73.agc:675
//			S32.1F2		# FIRST PASS FOR NEWTON ITERATION INDICATR
// PORT: Fixed ROM slots 9158.
    9158, 5730,
// PORT: SOURCE P32-P33_P72-P73.agc:676
//		CLEAR	SET
// PORT: Fixed ROM slots 9159.
    9159, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:677
//			S32.1F3A	# 00=1ST 2 PASSES 2ND CYCLE 01=FIRST CYCLE
// PORT: Fixed ROM slots 9160.
    9160, 5988,
// PORT: SOURCE P32-P33_P72-P73.agc:678
//			S32.1F3B	# 10=2ND CYCLE, 11=50 FPS STAGE 2ND CYCLE
// PORT: Fixed ROM slots 9161.
    9161, 5734,
// PORT: SOURCE P32-P33_P72-P73.agc:679
//		DLOAD
// PORT: Fixed ROM slots 9162.
    9162, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:680
//			ZEROVEC
// PORT: Fixed ROM slots 9163.
    9163, 9964,
// PORT: SOURCE P32-P33_P72-P73.agc:681
//		STORE	LOOPCT
// PORT: Fixed ROM slots 9164.
    9164, 4072,
// PORT: SOURCE P32-P33_P72-P73.agc:682
//		STORE	CSIALRM
// PORT: Fixed ROM slots 9165.
    9165, 3946,
// PORT: SOURCE P32-P33_P72-P73.agc:683
//CSI/B		SETPD	VLOAD
// PORT: Fixed ROM slots 9166.
    9166, 64770,
// PORT: SOURCE P32-P33_P72-P73.agc:684
//			0D
// PORT: Fixed ROM slots 9167.
    9167, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:685
//			RACT1
// PORT: Fixed ROM slots 9168.
    9168, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:686
//		ABVAL	PUSH		# RA1                            B29 PL02D
// PORT: Fixed ROM slots 9169.
    9169, 34380,
// PORT: SOURCE P32-P33_P72-P73.agc:687
//		NORM	SR1
// PORT: Fixed ROM slots 9170.
    9170, 57986,
// PORT: SOURCE P32-P33_P72-P73.agc:688
//			X2		#                         B29-N2+ B1 PL04D
// PORT: Fixed ROM slots 9171.
    9171, 80,
// PORT: SOURCE P32-P33_P72-P73.agc:689
//		PDVL	ABVAL
// PORT: Fixed ROM slots 9172.
    9172, 42650,
// PORT: SOURCE P32-P33_P72-P73.agc:690
//			RPASS3
// PORT: Fixed ROM slots 9173.
    9173, 3800,
// PORT: SOURCE P32-P33_P72-P73.agc:691
//		NORM	BDDV		# RA1/RP3                         B1 PL02D
// PORT: Fixed ROM slots 9174.
    9174, 46466,
// PORT: SOURCE P32-P33_P72-P73.agc:692
//			X1
// PORT: Fixed ROM slots 9175.
    9175, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:693
//		XSU,2	SR*		#                                 B2
// PORT: Fixed ROM slots 9176.
    9176, 44904,
// PORT: SOURCE P32-P33_P72-P73.agc:694
//			X1
// PORT: Fixed ROM slots 9177.
    9177, 76,
// PORT: SOURCE P32-P33_P72-P73.agc:695
//			1,2
// PORT: Fixed ROM slots 9178.
    9178, 48378,
// PORT: SOURCE P32-P33_P72-P73.agc:696
//		DAD	DMP		# (1+(RA1/RP3))RA1        B29+B2=B31 PL00D
// PORT: Fixed ROM slots 9179.
    9179, 34074,
// PORT: SOURCE P32-P33_P72-P73.agc:697
//			1DPB2
// PORT: Fixed ROM slots 9180.
    9180, 14198,
// PORT: SOURCE P32-P33_P72-P73.agc:698
//		NORM	PDDL		#                                    PL02D
// PORT: Fixed ROM slots 9181.
    9181, 54658,
// PORT: SOURCE P32-P33_P72-P73.agc:699
//			X1
// PORT: Fixed ROM slots 9182.
    9182, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:700
//			RTMU
// PORT: Fixed ROM slots 9183.
    9183, 4048,
// PORT: SOURCE P32-P33_P72-P73.agc:701
//		SR1	DDV		#                        B38-B31= B7 PL00D
// PORT: Fixed ROM slots 9184.
    9184, 47556,
// PORT: SOURCE P32-P33_P72-P73.agc:702
//		SL*	SQRT		#                                 B7
// PORT: Fixed ROM slots 9185.
    9185, 63070,
// PORT: SOURCE P32-P33_P72-P73.agc:703
//			0 -7,1
// PORT: Fixed ROM slots 9186.
    9186, 16628,
// PORT: SOURCE P32-P33_P72-P73.agc:704
//		PDVL	UNIT		#                                    PL02D
// PORT: Fixed ROM slots 9187.
    9187, 44698,
// PORT: SOURCE P32-P33_P72-P73.agc:705
//			RACT1
// PORT: Fixed ROM slots 9188.
    9188, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:706
//		PDVL	VXV
// PORT: Fixed ROM slots 9189.
    9189, 40346,
// PORT: SOURCE P32-P33_P72-P73.agc:707
//			UP1
// PORT: Fixed ROM slots 9190.
    9190, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:708
//		UNIT			# UNIT(URP1 X UVP1 X URA1) = UH1
// PORT: Fixed ROM slots 9191.
    9191, 65372,
// PORT: SOURCE P32-P33_P72-P73.agc:709
//		DOT	SL1		# VA1 . UH1                       B7
// PORT: Fixed ROM slots 9192.
    9192, 59970,
// PORT: SOURCE P32-P33_P72-P73.agc:710
//			VACT1
// PORT: Fixed ROM slots 9193.
    9193, 3720,
// PORT: SOURCE P32-P33_P72-P73.agc:711
//		BDSU	STADR		#                                    PL00D
// PORT: Fixed ROM slots 9194.
    9194, 38434,
// PORT: SOURCE P32-P33_P72-P73.agc:712
//# Page 665
// PORT: SOURCE P32-P33_P72-P73.agc:713
//		STODL	DELVCSI
// PORT: Fixed ROM slots 9195.
    9195, 49562,
// PORT: SOURCE P32-P33_P72-P73.agc:714
//			INITST		# 10 FPS
// PORT: Fixed ROM slots 9196.
    9196, 14186,
// PORT: SOURCE P32-P33_P72-P73.agc:715
//		STORE	DELDV
// PORT: Fixed ROM slots 9197.
    9197, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:716
//CSI/B1		DLOAD	DAD		# IF LOOPCT = 16
// PORT: Fixed ROM slots 9198.
    9198, 36298,
// PORT: SOURCE P32-P33_P72-P73.agc:717
//			LOOPCT
// PORT: Fixed ROM slots 9199.
    9199, 4072,
// PORT: SOURCE P32-P33_P72-P73.agc:718
//			1DPB28
// PORT: Fixed ROM slots 9200.
    9200, 14202,
// PORT: SOURCE P32-P33_P72-P73.agc:719
//		STORE	LOOPCT
// PORT: Fixed ROM slots 9201.
    9201, 4072,
// PORT: SOURCE P32-P33_P72-P73.agc:720
//		DSU	AXT,2
// PORT: Fixed ROM slots 9202.
    9202, 64554,
// PORT: SOURCE P32-P33_P72-P73.agc:721
//			LOOPMX
// PORT: Fixed ROM slots 9203.
    9203, 14182,
// PORT: SOURCE P32-P33_P72-P73.agc:722
//			6
// PORT: Fixed ROM slots 9204.
    9204, 12,
// PORT: SOURCE P32-P33_P72-P73.agc:723
//		BPL	GOTO
// PORT: Fixed ROM slots 9205.
    9205, 43080,
// PORT: SOURCE P32-P33_P72-P73.agc:724
//			SCNDSOL
// PORT: Fixed ROM slots 9206.
    9206, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:725
//			CSI/B2
// PORT: Fixed ROM slots 9207.
    9207, 20502,
// PORT: SOURCE P32-P33_P72-P73.agc:726
//
// PORT: SOURCE P32-P33_P72-P73.agc:727
//		SETLOC	CSIPROG2
// PORT: SOURCE P32-P33_P72-P73.agc:728
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:729
//
// PORT: SOURCE P32-P33_P72-P73.agc:730
//CSI/B2		SETPD
// PORT: Fixed ROM slots 12299.
    12299, 65282
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:731
//			0D
// PORT: Fixed ROM slots 12300.
    12300, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:732
//		DLOAD	ABS
// PORT: Fixed ROM slots 12301.
    12301, 42698,
// PORT: SOURCE P32-P33_P72-P73.agc:733
//			DELVCSI
// PORT: Fixed ROM slots 12302.
    12302, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:734
//		DSU	BMN
// PORT: Fixed ROM slots 12303.
    12303, 41002,
// PORT: SOURCE P32-P33_P72-P73.agc:735
//			DVMAX1
// PORT: Fixed ROM slots 12304.
    12304, 14190,
// PORT: SOURCE P32-P33_P72-P73.agc:736
//			CSI/B23
// PORT: Fixed ROM slots 12305.
    12305, 38254,
// PORT: SOURCE P32-P33_P72-P73.agc:737
//		AXT,2	BON
// PORT: Fixed ROM slots 12306.
    12306, 36088,
// PORT: SOURCE P32-P33_P72-P73.agc:738
//			7
// PORT: Fixed ROM slots 12307.
    12307, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:739
//			S32.1F1
// PORT: Fixed ROM slots 12308.
    12308, 6016,
// PORT: SOURCE P32-P33_P72-P73.agc:740
//			SCNDSOL
// PORT: Fixed ROM slots 12309.
    12309, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:741
//		BOFF	BON
// PORT: Fixed ROM slots 12310.
    12310, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:742
//			S32.1F3A
// PORT: Fixed ROM slots 12311.
    12311, 6084,
// PORT: SOURCE P32-P33_P72-P73.agc:743
//			CSI/B22		# FLAG 3 NEQ 3
// PORT: Fixed ROM slots 12312.
    12312, 20534,
// PORT: SOURCE P32-P33_P72-P73.agc:744
//			S32.1F3B
// PORT: Fixed ROM slots 12313.
    12313, 6022,
// PORT: SOURCE P32-P33_P72-P73.agc:745
//			SCNDSOL
// PORT: Fixed ROM slots 12314.
    12314, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:746
//CSI/B22		SET	DLOAD
// PORT: Fixed ROM slots 12315.
    12315, 58648,
// PORT: SOURCE P32-P33_P72-P73.agc:747
//			S32.1F1
// PORT: Fixed ROM slots 12316.
    12316, 5728,
// PORT: SOURCE P32-P33_P72-P73.agc:748
//			DVMAX2
// PORT: Fixed ROM slots 12317.
    12317, 14194,
// PORT: SOURCE P32-P33_P72-P73.agc:749
//		SIGN
// PORT: Fixed ROM slots 12318.
    12318, 65514,
// PORT: SOURCE P32-P33_P72-P73.agc:750
//			DELVCSI
// PORT: Fixed ROM slots 12319.
    12319, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:751
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 12320.
    12320, 32356,
// PORT: SOURCE P32-P33_P72-P73.agc:752
//			CSI/B23
// PORT: Fixed ROM slots 12321.
    12321, 38254,
// PORT: SOURCE P32-P33_P72-P73.agc:753
//
// PORT: SOURCE P32-P33_P72-P73.agc:754
//		SETLOC	CSIPROG3
// PORT: SOURCE P32-P33_P72-P73.agc:755
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:756
//
// PORT: SOURCE P32-P33_P72-P73.agc:757
//CSI/B23		VLOAD	PUSH
// PORT: Fixed ROM slots 21175.
    21175, 34554,
// PORT: SOURCE P32-P33_P72-P73.agc:758
//			RACT1
// PORT: Fixed ROM slots 21176.
    21176, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:759
//		UNIT	PDVL
// PORT: Fixed ROM slots 21177.
    21177, 52572,
// PORT: SOURCE P32-P33_P72-P73.agc:760
//			UP1
// PORT: Fixed ROM slots 21178.
    21178, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:761
//		VXV	UNIT		# UNIT(URP1 X UVP1 X URA1) = UH1
// PORT: Fixed ROM slots 21179.
    21179, 44602,
// PORT: SOURCE P32-P33_P72-P73.agc:762
//		VXSC	VSL1
// PORT: Fixed ROM slots 21180.
    21180, 64226,
// PORT: SOURCE P32-P33_P72-P73.agc:763
//# Page 666
// PORT: SOURCE P32-P33_P72-P73.agc:764
//			DELVCSI
// PORT: Fixed ROM slots 21181.
    21181, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:765
//		STORE	DELVEET1
// PORT: Fixed ROM slots 21182.
    21182, 2634,
// PORT: SOURCE P32-P33_P72-P73.agc:766
//		VAD	BOV
// PORT: Fixed ROM slots 21183.
    21183, 32858,
// PORT: SOURCE P32-P33_P72-P73.agc:767
//			VACT1
// PORT: Fixed ROM slots 21184.
    21184, 3720,
// PORT: SOURCE P32-P33_P72-P73.agc:768
//			CSI/B23D
// PORT: Fixed ROM slots 21185.
    21185, 38276,
// PORT: SOURCE P32-P33_P72-P73.agc:769
//CSI/B23D	STCALL	VACT4
// PORT: Fixed ROM slots 21186.
    21186, 32376,
// PORT: SOURCE P32-P33_P72-P73.agc:770
//			VECSHIFT
// PORT: Fixed ROM slots 21187.
    21187, 38230,
// PORT: SOURCE P32-P33_P72-P73.agc:771
//		STOVL	VVEC
// PORT: Fixed ROM slots 21188.
    21188, 23500,
// PORT: SOURCE P32-P33_P72-P73.agc:772
//		SET
// PORT: Fixed ROM slots 21189.
    21189, 65304,
// PORT: SOURCE P32-P33_P72-P73.agc:773
//			RVSW
// PORT: Fixed ROM slots 21190.
    21190, 3692,
// PORT: SOURCE P32-P33_P72-P73.agc:774
//		STOVL	RVEC
// PORT: Fixed ROM slots 21191.
    21191, 23390,
// PORT: SOURCE P32-P33_P72-P73.agc:775
//			SN359+
// PORT: Fixed ROM slots 21192.
    21192, 5676,
// PORT: SOURCE P32-P33_P72-P73.agc:776
//		STCALL	SNTH		# ALSO CSTH
// PORT: Fixed ROM slots 21193.
    21193, 31668,
// PORT: SOURCE P32-P33_P72-P73.agc:777
//			TIMETHET
// PORT: Fixed ROM slots 21194.
    21194, 21448,
// PORT: SOURCE P32-P33_P72-P73.agc:778
//		SR1	LXA,1
// PORT: Fixed ROM slots 21195.
    21195, 59588,
// PORT: SOURCE P32-P33_P72-P73.agc:779
//			RTX1
// PORT: Fixed ROM slots 21196.
    21196, 4042,
// PORT: SOURCE P32-P33_P72-P73.agc:780
//		STCALL	HAFPA1
// PORT: Fixed ROM slots 21197.
    21197, 32372,
// PORT: SOURCE P32-P33_P72-P73.agc:781
//			PERIAPO
// PORT: Fixed ROM slots 21198.
    21198, 38118,
// PORT: SOURCE P32-P33_P72-P73.agc:782
//		CALL
// PORT: Fixed ROM slots 21199.
    21199, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:783
//			SHIFTR1
// PORT: Fixed ROM slots 21200.
    21200, 38246,
// PORT: SOURCE P32-P33_P72-P73.agc:784
//		STODL	POSTCSI
// PORT: Fixed ROM slots 21201.
    21201, 15968,
// PORT: SOURCE P32-P33_P72-P73.agc:785
//			CENTANG
// PORT: Fixed ROM slots 21202.
    21202, 4056,
// PORT: SOURCE P32-P33_P72-P73.agc:786
//		BZE	GOTO
// PORT: Fixed ROM slots 21203.
    21203, 43096,
// PORT: SOURCE P32-P33_P72-P73.agc:787
//			+2
// PORT: Fixed ROM slots 21204.
    21204, 38316,
// PORT: SOURCE P32-P33_P72-P73.agc:788
//			CIRCL
// PORT: Fixed ROM slots 21205.
    21205, 40138,
// PORT: SOURCE P32-P33_P72-P73.agc:789
//		DLOAD
// PORT: Fixed ROM slots 21206.
    21206, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:790
//			ECC
// PORT: Fixed ROM slots 21207.
    21207, 3032,
// PORT: SOURCE P32-P33_P72-P73.agc:791
//		DSU	BMN
// PORT: Fixed ROM slots 21208.
    21208, 41002,
// PORT: SOURCE P32-P33_P72-P73.agc:792
//			ONETHTH
// PORT: Fixed ROM slots 21209.
    21209, 28248,
// PORT: SOURCE P32-P33_P72-P73.agc:793
//			CIRCL
// PORT: Fixed ROM slots 21210.
    21210, 40138,
// PORT: SOURCE P32-P33_P72-P73.agc:794
//		DLOAD	CALL
// PORT: Fixed ROM slots 21211.
    21211, 38090,
// PORT: SOURCE P32-P33_P72-P73.agc:795
//			R1
// PORT: Fixed ROM slots 21212.
    21212, 66,
// PORT: SOURCE P32-P33_P72-P73.agc:796
//			SHIFTR1
// PORT: Fixed ROM slots 21213.
    21213, 38246,
// PORT: SOURCE P32-P33_P72-P73.agc:797
//		SETPD	NORM
// PORT: Fixed ROM slots 21214.
    21214, 49410,
// PORT: SOURCE P32-P33_P72-P73.agc:798
//			2D
// PORT: Fixed ROM slots 21215.
    21215, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:799
//			X1
// PORT: Fixed ROM slots 21216.
    21216, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:800
//		PDVL	DOT		#                                    PL04D
// PORT: Fixed ROM slots 21217.
    21217, 41370,
// PORT: SOURCE P32-P33_P72-P73.agc:801
//			RACT1
// PORT: Fixed ROM slots 21218.
    21218, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:802
//			VACT4
// PORT: Fixed ROM slots 21219.
    21219, 3704,
// PORT: SOURCE P32-P33_P72-P73.agc:803
//		ABS	DDV
// PORT: Fixed ROM slots 21220.
    21220, 47436,
// PORT: SOURCE P32-P33_P72-P73.agc:804
//			02D		# (/RDOTV/)/R1		B36-B29= B7
// PORT: Fixed ROM slots 21221.
    21221, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:805
//		SL*	DSU
// PORT: Fixed ROM slots 21222.
    21222, 38238,
// PORT: SOURCE P32-P33_P72-P73.agc:806
//			0,1
// PORT: Fixed ROM slots 21223.
    21223, 16642,
// PORT: SOURCE P32-P33_P72-P73.agc:807
//			NICKELDP
// PORT: Fixed ROM slots 21224.
    21224, 28240,
// PORT: SOURCE P32-P33_P72-P73.agc:808
//		BMN	DLOAD
// PORT: Fixed ROM slots 21225.
    21225, 58688,
// PORT: SOURCE P32-P33_P72-P73.agc:809
//			CIRCL
// PORT: Fixed ROM slots 21226.
    21226, 40138,
// PORT: SOURCE P32-P33_P72-P73.agc:810
//			P
// PORT: Fixed ROM slots 21227.
    21227, 3012,
// PORT: SOURCE P32-P33_P72-P73.agc:811
//		SL2	DSU
// PORT: Fixed ROM slots 21228.
    21228, 38292,
// PORT: SOURCE P32-P33_P72-P73.agc:812
//			1RTEB2		# 1.B.2
// PORT: Fixed ROM slots 21229.
    21229, 28292,
// PORT: SOURCE P32-P33_P72-P73.agc:813
//		STODL	14D
// PORT: Fixed ROM slots 21230.
    21230, 12318,
// PORT: SOURCE P32-P33_P72-P73.agc:814
//# Page 667
// PORT: SOURCE P32-P33_P72-P73.agc:815
//			RTSR1/MU
// PORT: Fixed ROM slots 21231.
    21231, 4052,
// PORT: SOURCE P32-P33_P72-P73.agc:816
//		SR1	DDV		# (1/ROOTMU)/R1      B-16-B29 = B-45 PL02D
// PORT: Fixed ROM slots 21232.
    21232, 47556,
// PORT: SOURCE P32-P33_P72-P73.agc:817
//		PDDL	DMP
// PORT: Fixed ROM slots 21233.
    21233, 34218,
// PORT: SOURCE P32-P33_P72-P73.agc:818
//			P
// PORT: Fixed ROM slots 21234.
    21234, 3012,
// PORT: SOURCE P32-P33_P72-P73.agc:819
//			R1
// PORT: Fixed ROM slots 21235.
    21235, 66,
// PORT: SOURCE P32-P33_P72-P73.agc:820
//		CALL
// PORT: Fixed ROM slots 21236.
    21236, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:821
//			SHIFTR1
// PORT: Fixed ROM slots 21237.
    21237, 38246,
// PORT: SOURCE P32-P33_P72-P73.agc:822
//		SL4	SL1
// PORT: Fixed ROM slots 21238.
    21238, 59924,
// PORT: SOURCE P32-P33_P72-P73.agc:823
//		SQRT	DMP		# ((P/MU)**.5)/R1    B14+B-45 = B-31 PL02D
// PORT: Fixed ROM slots 21239.
    21239, 34284,
// PORT: SOURCE P32-P33_P72-P73.agc:824
//		BOFF	SL3
// PORT: Fixed ROM slots 21240.
    21240, 43544,
// PORT: SOURCE P32-P33_P72-P73.agc:825
//			CMOONFLG
// PORT: Fixed ROM slots 21241.
    21241, 4550,
// PORT: SOURCE P32-P33_P72-P73.agc:826
//			CSI/B3
// PORT: Fixed ROM slots 21242.
    21242, 38390,
// PORT: SOURCE P32-P33_P72-P73.agc:827
//CSI/B3		PDVL	DOT
// PORT: Fixed ROM slots 21243.
    21243, 41370,
// PORT: SOURCE P32-P33_P72-P73.agc:828
//			RACT1
// PORT: Fixed ROM slots 21244.
    21244, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:829
//			VACT4
// PORT: Fixed ROM slots 21245.
    21245, 3704,
// PORT: SOURCE P32-P33_P72-P73.agc:830
//		STORE	RDOTV
// PORT: Fixed ROM slots 21246.
    21246, 3716,
// PORT: SOURCE P32-P33_P72-P73.agc:831
//		ABS
// PORT: Fixed ROM slots 21247.
    21247, 65356,
// PORT: SOURCE P32-P33_P72-P73.agc:832
//		NORM	DMP		# ((P/MU)**.5)RDOTV/R1               PL02D
// PORT: Fixed ROM slots 21248.
    21248, 34178,
// PORT: SOURCE P32-P33_P72-P73.agc:833
//			X2
// PORT: Fixed ROM slots 21249.
    21249, 80,
// PORT: SOURCE P32-P33_P72-P73.agc:834
//		XSU,1	SL*		#			B-31+B36-B3 = B2
// PORT: Fixed ROM slots 21250.
    21250, 44896,
// PORT: SOURCE P32-P33_P72-P73.agc:835
//			X2
// PORT: Fixed ROM slots 21251.
    21251, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:836
//			3,1
// PORT: Fixed ROM slots 21252.
    21252, 16648,
// PORT: SOURCE P32-P33_P72-P73.agc:837
//		STODL	12D
// PORT: Fixed ROM slots 21253.
    21253, 12314,
// PORT: SOURCE P32-P33_P72-P73.agc:838
//			ZEROVECS
// PORT: Fixed ROM slots 21254.
    21254, 13754,
// PORT: SOURCE P32-P33_P72-P73.agc:839
//		STORE	16D
// PORT: Fixed ROM slots 21255.
    21255, 34,
// PORT: SOURCE P32-P33_P72-P73.agc:840
//		VLOAD	UNIT
// PORT: Fixed ROM slots 21256.
    21256, 44794,
// PORT: SOURCE P32-P33_P72-P73.agc:841
//			12D
// PORT: Fixed ROM slots 21257.
    21257, 26,
// PORT: SOURCE P32-P33_P72-P73.agc:842
//		STOVL	SNTH		# ALSO STORES CSTH AND 0
// PORT: Fixed ROM slots 21258.
    21258, 23476,
// PORT: SOURCE P32-P33_P72-P73.agc:843
//			RACT1
// PORT: Fixed ROM slots 21259.
    21259, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:844
//		PDVL	SIGN
// PORT: Fixed ROM slots 21260.
    21260, 62874,
// PORT: SOURCE P32-P33_P72-P73.agc:845
//			VACT4
// PORT: Fixed ROM slots 21261.
    21261, 3704,
// PORT: SOURCE P32-P33_P72-P73.agc:846
//			RDOTV
// PORT: Fixed ROM slots 21262.
    21262, 3716,
// PORT: SOURCE P32-P33_P72-P73.agc:847
//		VCOMP	CALL
// PORT: Fixed ROM slots 21263.
    21263, 38012,
// PORT: SOURCE P32-P33_P72-P73.agc:848
//			VECSHIFT
// PORT: Fixed ROM slots 21264.
    21264, 38230,
// PORT: SOURCE P32-P33_P72-P73.agc:849
//		STOVL	VVEC
// PORT: Fixed ROM slots 21265.
    21265, 23500,
// PORT: SOURCE P32-P33_P72-P73.agc:850
//		SETGO
// PORT: Fixed ROM slots 21266.
    21266, 65304,
// PORT: SOURCE P32-P33_P72-P73.agc:851
//			RVSW
// PORT: Fixed ROM slots 21267.
    21267, 3628,
// PORT: SOURCE P32-P33_P72-P73.agc:852
//			CSINEXT
// PORT: Fixed ROM slots 21268.
    21268, 40120,
// PORT: SOURCE P32-P33_P72-P73.agc:853
//
// PORT: SOURCE P32-P33_P72-P73.agc:854
//SN359+		2DEC	-.000086601
// PORT: Fixed ROM slots 21269 21270.
    21269, 65532, 21270, 51808,
// PORT: SOURCE P32-P33_P72-P73.agc:855
//
// PORT: SOURCE P32-P33_P72-P73.agc:856
//CS359+		2DEC	+.499999992
// PORT: Fixed ROM slots 21271 21272.
    21271, 16382, 21272, 32764,
// PORT: SOURCE P32-P33_P72-P73.agc:857
//
// PORT: SOURCE P32-P33_P72-P73.agc:858
//		SETLOC	CSIPROG4
// PORT: SOURCE P32-P33_P72-P73.agc:859
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:860
//
// PORT: SOURCE P32-P33_P72-P73.agc:861
//CSINEXT		STCALL	RVEC
// PORT: Fixed ROM slots 22108.
    22108, 31582
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:862
//			TIMETHET
// PORT: Fixed ROM slots 22109.
    22109, 21448,
// PORT: SOURCE P32-P33_P72-P73.agc:863
//		PDDL	BPL
// PORT: Fixed ROM slots 22110.
    22110, 42154,
// PORT: SOURCE P32-P33_P72-P73.agc:864
//			RDOTV
// PORT: Fixed ROM slots 22111.
    22111, 3716,
// PORT: SOURCE P32-P33_P72-P73.agc:865
//# Page 668
// PORT: SOURCE P32-P33_P72-P73.agc:866
//			NTP/2
// PORT: Fixed ROM slots 22112.
    22112, 40146,
// PORT: SOURCE P32-P33_P72-P73.agc:867
//		DLOAD	DSU
// PORT: Fixed ROM slots 22113.
    22113, 38346,
// PORT: SOURCE P32-P33_P72-P73.agc:868
//			HAFPA1
// PORT: Fixed ROM slots 22114.
    22114, 3700,
// PORT: SOURCE P32-P33_P72-P73.agc:869
//		PUSH	GOTO
// PORT: Fixed ROM slots 22115.
    22115, 43020,
// PORT: SOURCE P32-P33_P72-P73.agc:870
//			NTP/2
// PORT: Fixed ROM slots 22116.
    22116, 40146,
// PORT: SOURCE P32-P33_P72-P73.agc:871
//CIRCL		SETPD	DLOAD
// PORT: Fixed ROM slots 22117.
    22117, 58626,
// PORT: SOURCE P32-P33_P72-P73.agc:872
//			00D
// PORT: Fixed ROM slots 22118.
    22118, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:873
//			ZEROVECS
// PORT: Fixed ROM slots 22119.
    22119, 13754,
// PORT: SOURCE P32-P33_P72-P73.agc:874
//		PUSH
// PORT: Fixed ROM slots 22120.
    22120, 65292,
// PORT: SOURCE P32-P33_P72-P73.agc:875
//NTP/2		DLOAD	DMP
// PORT: Fixed ROM slots 22121.
    22121, 34250,
// PORT: SOURCE P32-P33_P72-P73.agc:876
//			NN
// PORT: Fixed ROM slots 22122.
    22122, 4076,
// PORT: SOURCE P32-P33_P72-P73.agc:877
//			HAFPA1
// PORT: Fixed ROM slots 22123.
    22123, 3700,
// PORT: SOURCE P32-P33_P72-P73.agc:878
//		SL	DSU
// PORT: Fixed ROM slots 22124.
    22124, 38242,
// PORT: SOURCE P32-P33_P72-P73.agc:879
//			14D
// PORT: Fixed ROM slots 22125.
    22125, 16670,
// PORT: SOURCE P32-P33_P72-P73.agc:880
//		DAD
// PORT: Fixed ROM slots 22126.
    22126, 65306,
// PORT: SOURCE P32-P33_P72-P73.agc:881
//			TCSI
// PORT: Fixed ROM slots 22127.
    22127, 2878,
// PORT: SOURCE P32-P33_P72-P73.agc:882
//		STORE	TCDH
// PORT: Fixed ROM slots 22128.
    22128, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:883
//		BDSU	AXT,2
// PORT: Fixed ROM slots 22129.
    22129, 64546,
// PORT: SOURCE P32-P33_P72-P73.agc:884
//			TTPI
// PORT: Fixed ROM slots 22130.
    22130, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:885
//			5D
// PORT: Fixed ROM slots 22131.
    22131, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:886
//		BMN	SETPD
// PORT: Fixed ROM slots 22132.
    22132, 33088,
// PORT: SOURCE P32-P33_P72-P73.agc:887
//			SCNDSOL
// PORT: Fixed ROM slots 22133.
    22133, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:888
//			0D
// PORT: Fixed ROM slots 22134.
    22134, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:889
//		VLOAD	PDVL
// PORT: Fixed ROM slots 22135.
    22135, 52730,
// PORT: SOURCE P32-P33_P72-P73.agc:890
//			VACT4
// PORT: Fixed ROM slots 22136.
    22136, 3704,
// PORT: SOURCE P32-P33_P72-P73.agc:891
//			RACT1
// PORT: Fixed ROM slots 22137.
    22137, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:892
//		CALL
// PORT: Fixed ROM slots 22138.
    22138, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:893
//			INTINT2C
// PORT: Fixed ROM slots 22139.
    22139, 53092,
// PORT: SOURCE P32-P33_P72-P73.agc:894
//		STOVL	RACT2
// PORT: Fixed ROM slots 22140.
    22140, 23126,
// PORT: SOURCE P32-P33_P72-P73.agc:895
//			VATT
// PORT: Fixed ROM slots 22141.
    22141, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:896
//		STOVL	VACT2
// PORT: Fixed ROM slots 22142.
    22142, 23222,
// PORT: SOURCE P32-P33_P72-P73.agc:897
//			VPASS1
// PORT: Fixed ROM slots 22143.
    22143, 3732,
// PORT: SOURCE P32-P33_P72-P73.agc:898
//		SETPD	PDVL
// PORT: Fixed ROM slots 22144.
    22144, 52482,
// PORT: SOURCE P32-P33_P72-P73.agc:899
//			0D
// PORT: Fixed ROM slots 22145.
    22145, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:900
//			RPASS1
// PORT: Fixed ROM slots 22146.
    22146, 4060,
// PORT: SOURCE P32-P33_P72-P73.agc:901
//		GOTO
// PORT: Fixed ROM slots 22147.
    22147, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:902
//			CSINEXT1
// PORT: Fixed ROM slots 22148.
    22148, 18780,
// PORT: SOURCE P32-P33_P72-P73.agc:903
//
// PORT: SOURCE P32-P33_P72-P73.agc:904
//		SETLOC	CSIPROG5
// PORT: SOURCE P32-P33_P72-P73.agc:905
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:906
//
// PORT: SOURCE P32-P33_P72-P73.agc:907
//CSINEXT1	CALL
// PORT: Fixed ROM slots 11438.
    11438, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:908
//			INTINT2C
// PORT: Fixed ROM slots 11439.
    11439, 53092,
// PORT: SOURCE P32-P33_P72-P73.agc:909
//		STOVL	RPASS2
// PORT: Fixed ROM slots 11440.
    11440, 23338,
// PORT: SOURCE P32-P33_P72-P73.agc:910
//			VATT
// PORT: Fixed ROM slots 11441.
    11441, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:911
//		STCALL	VPASS2
// PORT: Fixed ROM slots 11442.
    11442, 31518,
// PORT: SOURCE P32-P33_P72-P73.agc:912
//			CDHMVR
// PORT: Fixed ROM slots 11443.
    11443, 11568,
// PORT: SOURCE P32-P33_P72-P73.agc:913
//		VLOAD	SETPD
// PORT: Fixed ROM slots 11444.
    11444, 33274,
// PORT: SOURCE P32-P33_P72-P73.agc:914
//			RACT2
// PORT: Fixed ROM slots 11445.
    11445, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:915
//			0D
// PORT: Fixed ROM slots 11446.
    11446, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:916
//# Page 669
// PORT: SOURCE P32-P33_P72-P73.agc:917
//		PDVL	CALL
// PORT: Fixed ROM slots 11447.
    11447, 38042,
// PORT: SOURCE P32-P33_P72-P73.agc:918
//			VACT3
// PORT: Fixed ROM slots 11448.
    11448, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:919
//			PERIAPO1
// PORT: Fixed ROM slots 11449.
    11449, 38102,
// PORT: SOURCE P32-P33_P72-P73.agc:920
//		CALL
// PORT: Fixed ROM slots 11450.
    11450, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:921
//			SHIFTR1
// PORT: Fixed ROM slots 11451.
    11451, 38246,
// PORT: SOURCE P32-P33_P72-P73.agc:922
//		STOVL	POSTCDH
// PORT: Fixed ROM slots 11452.
    11452, 24180,
// PORT: SOURCE P32-P33_P72-P73.agc:923
//			VACT3
// PORT: Fixed ROM slots 11453.
    11453, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:924
//		SETPD	PDVL
// PORT: Fixed ROM slots 11454.
    11454, 52482,
// PORT: SOURCE P32-P33_P72-P73.agc:925
//			0D
// PORT: Fixed ROM slots 11455.
    11455, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:926
//			RACT2
// PORT: Fixed ROM slots 11456.
    11456, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:927
//		PDDL	PDDL
// PORT: Fixed ROM slots 11457.
    11457, 54698,
// PORT: SOURCE P32-P33_P72-P73.agc:928
//			TCDH
// PORT: Fixed ROM slots 11458.
    11458, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:929
//			TTPI
// PORT: Fixed ROM slots 11459.
    11459, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:930
//		PDDL	SL2
// PORT: Fixed ROM slots 11460.
    11460, 51882,
// PORT: SOURCE P32-P33_P72-P73.agc:931
//			2PISC
// PORT: Fixed ROM slots 11461.
    11461, 10032,
// PORT: SOURCE P32-P33_P72-P73.agc:932
//		PUSH	CALL
// PORT: Fixed ROM slots 11462.
    11462, 37900,
// PORT: SOURCE P32-P33_P72-P73.agc:933
//			INTINT
// PORT: Fixed ROM slots 11463.
    11463, 60298,
// PORT: SOURCE P32-P33_P72-P73.agc:934
//		CALL
// PORT: Fixed ROM slots 11464.
    11464, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:935
//			ACTIVE
// PORT: Fixed ROM slots 11465.
    11465, 38206,
// PORT: SOURCE P32-P33_P72-P73.agc:936
//		DLOAD
// PORT: Fixed ROM slots 11466.
    11466, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:937
//			ELEV
// PORT: Fixed ROM slots 11467.
    11467, 4040,
// PORT: SOURCE P32-P33_P72-P73.agc:938
//		SETPD	SINE
// PORT: Fixed ROM slots 11468.
    11468, 60930,
// PORT: SOURCE P32-P33_P72-P73.agc:939
//			6D
// PORT: Fixed ROM slots 11469.
    11469, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:940
//		PDVL	UNIT
// PORT: Fixed ROM slots 11470.
    11470, 44698,
// PORT: SOURCE P32-P33_P72-P73.agc:941
//			RACT3
// PORT: Fixed ROM slots 11471.
    11471, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:942
//		STORE	00D		# URA3 AT 00D
// PORT: Fixed ROM slots 11472.
    11472, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:943
//		PDVL	VXV		# PL14D,PL08D
// PORT: Fixed ROM slots 11473.
    11473, 40346,
// PORT: SOURCE P32-P33_P72-P73.agc:944
//			UP1
// PORT: Fixed ROM slots 11474.
    11474, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:945
//		UNIT
// PORT: Fixed ROM slots 11475.
    11475, 65372,
// PORT: SOURCE P32-P33_P72-P73.agc:946
//		PDDL	COSINE		# UNIT(URA3XUVA3XURA3) = UH3      B1 PL14D
// PORT: Fixed ROM slots 11476.
    11476, 59050,
// PORT: SOURCE P32-P33_P72-P73.agc:947
//			ELEV
// PORT: Fixed ROM slots 11477.
    11477, 4040,
// PORT: SOURCE P32-P33_P72-P73.agc:948
//		VXSC	STADR		# (COSLOS)(UH3)                   B2 PL08D
// PORT: Fixed ROM slots 11478.
    11478, 38626,
// PORT: SOURCE P32-P33_P72-P73.agc:949
//		STCALL	18D		#		PLUS
// PORT: Fixed ROM slots 11479.
    11479, 36824,
// PORT: SOURCE P32-P33_P72-P73.agc:950
//			CSINEXT2
// PORT: Fixed ROM slots 11480.
    11480, 15006,
// PORT: SOURCE P32-P33_P72-P73.agc:951
//
// PORT: SOURCE P32-P33_P72-P73.agc:952
//		SETLOC	CSIPROG6
// PORT: SOURCE P32-P33_P72-P73.agc:953
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:954
//
// PORT: SOURCE P32-P33_P72-P73.agc:955
//CSINEXT2	DLOAD	VXSC		# (SINLOS)(URA3) = U              B2 PL00D
// PORT: Fixed ROM slots 9551.
    9551, 61898,
// PORT: SOURCE P32-P33_P72-P73.agc:956
//		VAD	VSL1
// PORT: Fixed ROM slots 9552.
    9552, 64090,
// PORT: SOURCE P32-P33_P72-P73.agc:957
//			18D		#                                 B1
// PORT: Fixed ROM slots 9553.
    9553, 38,
// PORT: SOURCE P32-P33_P72-P73.agc:958
//		PUSH	DOT		#                                    PL06D
// PORT: Fixed ROM slots 9554.
    9554, 41228,
// PORT: SOURCE P32-P33_P72-P73.agc:959
//			RACT3		# (U . RA3) = TEMP1      B1 +B29=B30
// PORT: Fixed ROM slots 9555.
    9555, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:960
//		SL1	PUSH		#                                B29 PL08D
// PORT: Fixed ROM slots 9556.
    9556, 34516,
// PORT: SOURCE P32-P33_P72-P73.agc:961
//		DSQ	TLOAD		# TEMP1**2                       B58
// PORT: Fixed ROM slots 9557.
    9557, 59804,
// PORT: SOURCE P32-P33_P72-P73.agc:962
//			MPAC
// PORT: Fixed ROM slots 9558.
    9558, 218,
// PORT: SOURCE P32-P33_P72-P73.agc:963
//		PDVL	DOT		#                                    PL11D
// PORT: Fixed ROM slots 9559.
    9559, 41370,
// PORT: SOURCE P32-P33_P72-P73.agc:964
//			RACT3
// PORT: Fixed ROM slots 9560.
    9560, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:965
//			RACT3
// PORT: Fixed ROM slots 9561.
    9561, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:966
//		TLOAD	DCOMP		# RA3.RA3
// PORT: Fixed ROM slots 9562.
    9562, 48850,
// PORT: SOURCE P32-P33_P72-P73.agc:967
//# Page 670
// PORT: SOURCE P32-P33_P72-P73.agc:968
//			MPAC
// PORT: Fixed ROM slots 9563.
    9563, 218,
// PORT: SOURCE P32-P33_P72-P73.agc:969
//		PDVL	DOT		# RP3.RP3                        B58 PL14D
// PORT: Fixed ROM slots 9564.
    9564, 41370,
// PORT: SOURCE P32-P33_P72-P73.agc:970
//			RPASS3
// PORT: Fixed ROM slots 9565.
    9565, 3800,
// PORT: SOURCE P32-P33_P72-P73.agc:971
//			RPASS3		#                                    PL11D
// PORT: Fixed ROM slots 9566.
    9566, 3800,
// PORT: SOURCE P32-P33_P72-P73.agc:972
//		TAD	TAD		# TEMP1**2+RA3.RA3+RP3.RP3=TEMP2     PL08D
// PORT: Fixed ROM slots 9567.
    9567, 63986,
// PORT: SOURCE P32-P33_P72-P73.agc:973
//		BPL	DLOAD
// PORT: Fixed ROM slots 9568.
    9568, 58696,
// PORT: SOURCE P32-P33_P72-P73.agc:974
//			K10RK2
// PORT: Fixed ROM slots 9569.
    9569, 15070,
// PORT: SOURCE P32-P33_P72-P73.agc:975
//			LOOPCT
// PORT: Fixed ROM slots 9570.
    9570, 4072,
// PORT: SOURCE P32-P33_P72-P73.agc:976
//		DSU	AXT,2
// PORT: Fixed ROM slots 9571.
    9571, 64554,
// PORT: SOURCE P32-P33_P72-P73.agc:977
//			1DPB28
// PORT: Fixed ROM slots 9572.
    9572, 14202,
// PORT: SOURCE P32-P33_P72-P73.agc:978
//			1D
// PORT: Fixed ROM slots 9573.
    9573, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:979
//		BZE
// PORT: Fixed ROM slots 9574.
    9574, 65368,
// PORT: SOURCE P32-P33_P72-P73.agc:980
//			ALMXITA
// PORT: Fixed ROM slots 9575.
    9575, 9624,
// PORT: SOURCE P32-P33_P72-P73.agc:981
//		DLOAD	SR1
// PORT: Fixed ROM slots 9576.
    9576, 58058,
// PORT: SOURCE P32-P33_P72-P73.agc:982
//			DELDV
// PORT: Fixed ROM slots 9577.
    9577, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:983
//		STORE	DELDV
// PORT: Fixed ROM slots 9578.
    9578, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:984
//		BDSU
// PORT: Fixed ROM slots 9579.
    9579, 65314,
// PORT: SOURCE P32-P33_P72-P73.agc:985
//			DVPREV
// PORT: Fixed ROM slots 9580.
    9580, 3696,
// PORT: SOURCE P32-P33_P72-P73.agc:986
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 9581.
    9581, 32356,
// PORT: SOURCE P32-P33_P72-P73.agc:987
//			CSI/B1
// PORT: Fixed ROM slots 9582.
    9582, 14300,
// PORT: SOURCE P32-P33_P72-P73.agc:988
//K10RK2		SQRT	PUSH		# TEMP3 = TEMP2**.5              B29 PL10D
// PORT: Fixed ROM slots 9583.
    9583, 34540,
// PORT: SOURCE P32-P33_P72-P73.agc:989
//		DCOMP	DSU
// PORT: Fixed ROM slots 9584.
    9584, 38268
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:990
//			06D		# -TEMP1-TEMP3 =K2 AT 10D
// PORT: Fixed ROM slots 9585.
    9585, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:991
//		STODL	10D		#                                    PL08D
// PORT: Fixed ROM slots 9586.
    9586, 12310,
// PORT: SOURCE P32-P33_P72-P73.agc:992
//		DSU	STADR		#                                    PL06D
// PORT: Fixed ROM slots 9587.
    9587, 38442,
// PORT: SOURCE P32-P33_P72-P73.agc:993
//		STORE	12D		# -TEMP1+TEMP3 =K1 AT 12D
// PORT: Fixed ROM slots 9588.
    9588, 65508,
// PORT: SOURCE P32-P33_P72-P73.agc:994
//		ABS
// PORT: Fixed ROM slots 9589.
    9589, 65356,
// PORT: SOURCE P32-P33_P72-P73.agc:995
//		STODL	14D
// PORT: Fixed ROM slots 9590.
    9590, 12318,
// PORT: SOURCE P32-P33_P72-P73.agc:996
//			10D
// PORT: Fixed ROM slots 9591.
    9591, 22,
// PORT: SOURCE P32-P33_P72-P73.agc:997
//		ABS	DSU
// PORT: Fixed ROM slots 9592.
    9592, 38220,
// PORT: SOURCE P32-P33_P72-P73.agc:998
//			14D
// PORT: Fixed ROM slots 9593.
    9593, 30,
// PORT: SOURCE P32-P33_P72-P73.agc:999
//		BMN	DLOAD
// PORT: Fixed ROM slots 9594.
    9594, 58688,
// PORT: SOURCE P32-P33_P72-P73.agc:1000
//			K2.
// PORT: Fixed ROM slots 9595.
    9595, 40964,
// PORT: SOURCE P32-P33_P72-P73.agc:1001
//			12D
// PORT: Fixed ROM slots 9596.
    9596, 26,
// PORT: SOURCE P32-P33_P72-P73.agc:1002
//		STCALL	10D		# K EQUALS K1
// PORT: Fixed ROM slots 9597.
    9597, 28694,
// PORT: SOURCE P32-P33_P72-P73.agc:1003
//			K2.
// PORT: Fixed ROM slots 9598.
    9598, 40964,
// PORT: SOURCE P32-P33_P72-P73.agc:1004
//
// PORT: SOURCE P32-P33_P72-P73.agc:1005
//		SETLOC	CSIPROG7
// PORT: SOURCE P32-P33_P72-P73.agc:1006
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1007
//
// PORT: SOURCE P32-P33_P72-P73.agc:1008
//K2.		DLOAD
// PORT: Fixed ROM slots 22530.
    22530, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:1009
//			10D
// PORT: Fixed ROM slots 22531.
    22531, 22,
// PORT: SOURCE P32-P33_P72-P73.agc:1010
//		VXSC	VSL1
// PORT: Fixed ROM slots 22532.
    22532, 64226,
// PORT: SOURCE P32-P33_P72-P73.agc:1011
//		VAD	UNIT		# V=RA3+KU  UNIT                  B1
// PORT: Fixed ROM slots 22533.
    22533, 44634,
// PORT: SOURCE P32-P33_P72-P73.agc:1012
//			RACT3
// PORT: Fixed ROM slots 22534.
    22534, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:1013
//		PDVL	UNIT		#                                    PL06D
// PORT: Fixed ROM slots 22535.
    22535, 44698,
// PORT: SOURCE P32-P33_P72-P73.agc:1014
//			RPASS3
// PORT: Fixed ROM slots 22536.
    22536, 3800,
// PORT: SOURCE P32-P33_P72-P73.agc:1015
//		PDVL	UNIT		#                                    PL12D
// PORT: Fixed ROM slots 22537.
    22537, 44698,
// PORT: SOURCE P32-P33_P72-P73.agc:1016
//			VPASS3
// PORT: Fixed ROM slots 22538.
    22538, 3812,
// PORT: SOURCE P32-P33_P72-P73.agc:1017
//		VXV	PDVL		# UVP3 X URP3                        PL18D
// PORT: Fixed ROM slots 22539.
    22539, 52538,
// PORT: SOURCE P32-P33_P72-P73.agc:1018
//# Page 671
// PORT: SOURCE P32-P33_P72-P73.agc:1019
//			06D
// PORT: Fixed ROM slots 22540.
    22540, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:1020
//			06D
// PORT: Fixed ROM slots 22541.
    22541, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:1021
//		VXV	DOT
// PORT: Fixed ROM slots 22542.
    22542, 41274,
// PORT: SOURCE P32-P33_P72-P73.agc:1022
//			00D
// PORT: Fixed ROM slots 22543.
    22543, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1023
//		STADR			#                                    PL12D
// PORT: Fixed ROM slots 22544.
    22544, 65324,
// PORT: SOURCE P32-P33_P72-P73.agc:1024
//		STOVL	12D		# (URP3XV).(UVP3XURP3)=TEMP          PL06D
// PORT: Fixed ROM slots 22545.
    22545, 45028,
// PORT: SOURCE P32-P33_P72-P73.agc:1025
//		DOT	SL1		#                                    PL00D
// PORT: Fixed ROM slots 22546.
    22546, 59970,
// PORT: SOURCE P32-P33_P72-P73.agc:1026
//		ARCCOS	SIGN
// PORT: Fixed ROM slots 22547.
    22547, 62892,
// PORT: SOURCE P32-P33_P72-P73.agc:1027
//			12D		#                                 B0
// PORT: Fixed ROM slots 22548.
    22548, 26,
// PORT: SOURCE P32-P33_P72-P73.agc:1028
//		SR1	PUSH		# GAMMA=SIGN(TEMP)ARCOS(UNITV.URP3)  PL02D
// PORT: Fixed ROM slots 22549.
    22549, 34500,
// PORT: SOURCE P32-P33_P72-P73.agc:1029
//		BON	DLOAD
// PORT: Fixed ROM slots 22550.
    22550, 58648,
// PORT: SOURCE P32-P33_P72-P73.agc:1030
//			S32.1F2
// PORT: Fixed ROM slots 22551.
    22551, 6018,
// PORT: SOURCE P32-P33_P72-P73.agc:1031
//			FRSTPAS
// PORT: Fixed ROM slots 22552.
    22552, 41066,
// PORT: SOURCE P32-P33_P72-P73.agc:1032
//			00D		# NOT THE FIRST PASS OF A CYCLE
// PORT: Fixed ROM slots 22553.
    22553, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1033
//		DSU	PDDL		# GAMMA-GAMPREV                   B1 PL04D
// PORT: Fixed ROM slots 22554.
    22554, 54570,
// PORT: SOURCE P32-P33_P72-P73.agc:1034
//			GAMPREV
// PORT: Fixed ROM slots 22555.
    22555, 3692,
// PORT: SOURCE P32-P33_P72-P73.agc:1035
//			DELVCSI
// PORT: Fixed ROM slots 22556.
    22556, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:1036
//		DSU	NORM		#                                 B7
// PORT: Fixed ROM slots 22557.
    22557, 49450,
// PORT: SOURCE P32-P33_P72-P73.agc:1037
//			DVPREV
// PORT: Fixed ROM slots 22558.
    22558, 3696,
// PORT: SOURCE P32-P33_P72-P73.agc:1038
//			X1
// PORT: Fixed ROM slots 22559.
    22559, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:1039
//		BDDV	PDDL		# (GAM-GAMPREV)/(DV-DVPREV)   B-6+N1 PL06D
// PORT: Fixed ROM slots 22560.
    22560, 54634,
// PORT: SOURCE P32-P33_P72-P73.agc:1040
//			02D		#	= SLOPE
// PORT: Fixed ROM slots 22561.
    22561, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:1041
//			DELVCSI
// PORT: Fixed ROM slots 22562.
    22562, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:1042
//		STORE	DVPREV
// PORT: Fixed ROM slots 22563.
    22563, 3696,
// PORT: SOURCE P32-P33_P72-P73.agc:1043
//		BOFF	BOFF
// PORT: Fixed ROM slots 22564.
    22564, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1044
//			S32.1F3A
// PORT: Fixed ROM slots 22565.
    22565, 6084,
// PORT: SOURCE P32-P33_P72-P73.agc:1045
//			THRDCHK
// PORT: Fixed ROM slots 22566.
    22566, 16782,
// PORT: SOURCE P32-P33_P72-P73.agc:1046
//			S32.1F3B
// PORT: Fixed ROM slots 22567.
    22567, 6086,
// PORT: SOURCE P32-P33_P72-P73.agc:1047
//			THRDCHK
// PORT: Fixed ROM slots 22568.
    22568, 16782,
// PORT: SOURCE P32-P33_P72-P73.agc:1048
//		DLOAD	DMP
// PORT: Fixed ROM slots 22569.
    22569, 34250,
// PORT: SOURCE P32-P33_P72-P73.agc:1049
//			02D
// PORT: Fixed ROM slots 22570.
    22570, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:1050
//			GAMPREV
// PORT: Fixed ROM slots 22571.
    22571, 3692,
// PORT: SOURCE P32-P33_P72-P73.agc:1051
//		BPL	DLOAD
// PORT: Fixed ROM slots 22572.
    22572, 58696,
// PORT: SOURCE P32-P33_P72-P73.agc:1052
//			FIFTYFPS
// PORT: Fixed ROM slots 22573.
    22573, 16792,
// PORT: SOURCE P32-P33_P72-P73.agc:1053
//			INITST1
// PORT: Fixed ROM slots 22574.
    22574, 28244,
// PORT: SOURCE P32-P33_P72-P73.agc:1054
//		SIGN
// PORT: Fixed ROM slots 22575.
    22575, 65514,
// PORT: SOURCE P32-P33_P72-P73.agc:1055
//			DELDV
// PORT: Fixed ROM slots 22576.
    22576, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1056
//		STORE	DELDV
// PORT: Fixed ROM slots 22577.
    22577, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1057
//		SET	CLEAR
// PORT: Fixed ROM slots 22578.
    22578, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1058
//			S32.1F3A
// PORT: Fixed ROM slots 22579.
    22579, 5732,
// PORT: SOURCE P32-P33_P72-P73.agc:1059
//			S32.1F3B
// PORT: Fixed ROM slots 22580.
    22580, 5990,
// PORT: SOURCE P32-P33_P72-P73.agc:1060
//FRSTPAS		DLOAD
// PORT: Fixed ROM slots 22581.
    22581, 65482,
// PORT: SOURCE P32-P33_P72-P73.agc:1061
//			00D
// PORT: Fixed ROM slots 22582.
    22582, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1062
//		STODL	GAMPREV
// PORT: Fixed ROM slots 22583.
    22583, 15980,
// PORT: SOURCE P32-P33_P72-P73.agc:1063
//			DELVCSI
// PORT: Fixed ROM slots 22584.
    22584, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:1064
//		STCALL	DVPREV
// PORT: Fixed ROM slots 22585.
    22585, 32368,
// PORT: SOURCE P32-P33_P72-P73.agc:1065
//			CSINEXT3
// PORT: Fixed ROM slots 22586.
    22586, 16772,
// PORT: SOURCE P32-P33_P72-P73.agc:1066
//
// PORT: SOURCE P32-P33_P72-P73.agc:1067
//		SETLOC	CSIPROG8
// PORT: SOURCE P32-P33_P72-P73.agc:1068
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1069
//# Page 672
// PORT: SOURCE P32-P33_P72-P73.agc:1070
//CSINEXT3	DSU	CLEAR
// PORT: Fixed ROM slots 10434.
    10434, 35882,
// PORT: SOURCE P32-P33_P72-P73.agc:1071
//			DELDV
// PORT: Fixed ROM slots 10435.
    10435, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1072
//			S32.1F2
// PORT: Fixed ROM slots 10436.
    10436, 5986,
// PORT: SOURCE P32-P33_P72-P73.agc:1073
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 10437.
    10437, 32356,
// PORT: SOURCE P32-P33_P72-P73.agc:1074
//			CSI/B1
// PORT: Fixed ROM slots 10438.
    10438, 14300,
// PORT: SOURCE P32-P33_P72-P73.agc:1075
//THRDCHK		BON	BON
// PORT: Fixed ROM slots 10439.
    10439, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1076
//			S32.1F3A
// PORT: Fixed ROM slots 10440.
    10440, 6020,
// PORT: SOURCE P32-P33_P72-P73.agc:1077
//			NEWTN
// PORT: Fixed ROM slots 10441.
    10441, 16822,
// PORT: SOURCE P32-P33_P72-P73.agc:1078
//			S32.1F3B
// PORT: Fixed ROM slots 10442.
    10442, 6022,
// PORT: SOURCE P32-P33_P72-P73.agc:1079
//			NEWTN
// PORT: Fixed ROM slots 10443.
    10443, 16822,
// PORT: SOURCE P32-P33_P72-P73.agc:1080
//FIFTYFPS	DLOAD	SIGN
// PORT: Fixed ROM slots 10444.
    10444, 62922,
// PORT: SOURCE P32-P33_P72-P73.agc:1081
//			FIFPSDP
// PORT: Fixed ROM slots 10445.
    10445, 14210,
// PORT: SOURCE P32-P33_P72-P73.agc:1082
//			04D
// PORT: Fixed ROM slots 10446.
    10446, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:1083
//		SIGN
// PORT: Fixed ROM slots 10447.
    10447, 65514,
// PORT: SOURCE P32-P33_P72-P73.agc:1084
//			GAMPREV
// PORT: Fixed ROM slots 10448.
    10448, 3692,
// PORT: SOURCE P32-P33_P72-P73.agc:1085
//		STORE	DELDV
// PORT: Fixed ROM slots 10449.
    10449, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1086
//		DCOMP	DAD
// PORT: Fixed ROM slots 10450.
    10450, 36220,
// PORT: SOURCE P32-P33_P72-P73.agc:1087
//			DELVCSI
// PORT: Fixed ROM slots 10451.
    10451, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:1088
//		STODL	DELVCSI
// PORT: Fixed ROM slots 10452.
    10452, 15972,
// PORT: SOURCE P32-P33_P72-P73.agc:1089
//			00D
// PORT: Fixed ROM slots 10453.
    10453, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1090
//		SET	SET
// PORT: Fixed ROM slots 10454.
    10454, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1091
//			S32.1F3B
// PORT: Fixed ROM slots 10455.
    10455, 5734,
// PORT: SOURCE P32-P33_P72-P73.agc:1092
//			S32.1F3A
// PORT: Fixed ROM slots 10456.
    10456, 5732,
// PORT: SOURCE P32-P33_P72-P73.agc:1093
//		STCALL	GAMPREV
// PORT: Fixed ROM slots 10457.
    10457, 32364,
// PORT: SOURCE P32-P33_P72-P73.agc:1094
//			CSI/B2
// PORT: Fixed ROM slots 10458.
    10458, 20502,
// PORT: SOURCE P32-P33_P72-P73.agc:1095
//NEWTN		DLOAD	NORM
// PORT: Fixed ROM slots 10459.
    10459, 49610,
// PORT: SOURCE P32-P33_P72-P73.agc:1096
//			04D
// PORT: Fixed ROM slots 10460.
    10460, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:1097
//			X2
// PORT: Fixed ROM slots 10461.
    10461, 80,
// PORT: SOURCE P32-P33_P72-P73.agc:1098
//		BDDV	XSU,1
// PORT: Fixed ROM slots 10462.
    10462, 45162,
// PORT: SOURCE P32-P33_P72-P73.agc:1099
//			00D
// PORT: Fixed ROM slots 10463.
    10463, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1100
//			X2
// PORT: Fixed ROM slots 10464.
    10464, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:1101
//		SR*
// PORT: Fixed ROM slots 10465.
    10465, 65374,
// PORT: SOURCE P32-P33_P72-P73.agc:1102
//			0,1
// PORT: Fixed ROM slots 10466.
    10466, 17154,
// PORT: SOURCE P32-P33_P72-P73.agc:1103
//		STODL	DELDV
// PORT: Fixed ROM slots 10467.
    10467, 15976,
// PORT: SOURCE P32-P33_P72-P73.agc:1104
//			00D
// PORT: Fixed ROM slots 10468.
    10468, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1105
//		STORE	GAMPREV
// PORT: Fixed ROM slots 10469.
    10469, 3692,
// PORT: SOURCE P32-P33_P72-P73.agc:1106
//		DLOAD	ABS
// PORT: Fixed ROM slots 10470.
    10470, 42698,
// PORT: SOURCE P32-P33_P72-P73.agc:1107
//			DELDV
// PORT: Fixed ROM slots 10471.
    10471, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1108
//		PUSH	DSU		#                                    PL08D
// PORT: Fixed ROM slots 10472.
    10472, 38156,
// PORT: SOURCE P32-P33_P72-P73.agc:1109
//			EPSILN1
// PORT: Fixed ROM slots 10473.
    10473, 14206,
// PORT: SOURCE P32-P33_P72-P73.agc:1110
//		BMN	DLOAD
// PORT: Fixed ROM slots 10474.
    10474, 58688,
// PORT: SOURCE P32-P33_P72-P73.agc:1111
//			CSI/SOL
// PORT: Fixed ROM slots 10475.
    10475, 16880,
// PORT: SOURCE P32-P33_P72-P73.agc:1112
//		DSU	BMN
// PORT: Fixed ROM slots 10476.
    10476, 41002,
// PORT: SOURCE P32-P33_P72-P73.agc:1113
//			DELMAX1
// PORT: Fixed ROM slots 10477.
    10477, 14214,
// PORT: SOURCE P32-P33_P72-P73.agc:1114
//			CSISTEP
// PORT: Fixed ROM slots 10478.
    10478, 16870,
// PORT: SOURCE P32-P33_P72-P73.agc:1115
//		DLOAD	SIGN
// PORT: Fixed ROM slots 10479.
    10479, 62922,
// PORT: SOURCE P32-P33_P72-P73.agc:1116
//			DELMAX1
// PORT: Fixed ROM slots 10480.
    10480, 14214,
// PORT: SOURCE P32-P33_P72-P73.agc:1117
//			DELDV
// PORT: Fixed ROM slots 10481.
    10481, 3688
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:1118
//		STORE	DELDV
// PORT: Fixed ROM slots 10482.
    10482, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1119
//CSISTEP		DLOAD	DSU
// PORT: Fixed ROM slots 10483.
    10483, 38346,
// PORT: SOURCE P32-P33_P72-P73.agc:1120
//# Page 673
// PORT: SOURCE P32-P33_P72-P73.agc:1121
//			DELVCSI
// PORT: Fixed ROM slots 10484.
    10484, 3684,
// PORT: SOURCE P32-P33_P72-P73.agc:1122
//			DELDV
// PORT: Fixed ROM slots 10485.
    10485, 3688,
// PORT: SOURCE P32-P33_P72-P73.agc:1123
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 10486.
    10486, 32356,
// PORT: SOURCE P32-P33_P72-P73.agc:1124
//			CSI/B1
// PORT: Fixed ROM slots 10487.
    10487, 14300,
// PORT: SOURCE P32-P33_P72-P73.agc:1125
//CSI/SOL		DLOAD	AXT,2
// PORT: Fixed ROM slots 10488.
    10488, 64714,
// PORT: SOURCE P32-P33_P72-P73.agc:1126
//			POSTCSI
// PORT: Fixed ROM slots 10489.
    10489, 3680,
// PORT: SOURCE P32-P33_P72-P73.agc:1127
//			2
// PORT: Fixed ROM slots 10490.
    10490, 4,
// PORT: SOURCE P32-P33_P72-P73.agc:1128
//		LXA,1	GOTO
// PORT: Fixed ROM slots 10491.
    10491, 43216,
// PORT: SOURCE P32-P33_P72-P73.agc:1129
//			RTX1
// PORT: Fixed ROM slots 10492.
    10492, 4042,
// PORT: SOURCE P32-P33_P72-P73.agc:1130
//			CSINEXT4
// PORT: Fixed ROM slots 10493.
    10493, 53008,
// PORT: SOURCE P32-P33_P72-P73.agc:1131
//
// PORT: SOURCE P32-P33_P72-P73.agc:1132
//		SETLOC	CSIPROG9
// PORT: SOURCE P32-P33_P72-P73.agc:1133
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1134
//
// PORT: SOURCE P32-P33_P72-P73.agc:1135
//CSINEXT4	DSU*	BMN
// PORT: Fixed ROM slots 28552.
    28552, 40998,
// PORT: SOURCE P32-P33_P72-P73.agc:1136
//			PMINE -2,1
// PORT: Fixed ROM slots 28553.
    28553, 28232,
// PORT: SOURCE P32-P33_P72-P73.agc:1137
//			SCNDSOL
// PORT: Fixed ROM slots 28554.
    28554, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:1138
//		AXT,2	DLOAD
// PORT: Fixed ROM slots 28555.
    28555, 58872,
// PORT: SOURCE P32-P33_P72-P73.agc:1139
//			3
// PORT: Fixed ROM slots 28556.
    28556, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:1140
//			POSTCDH
// PORT: Fixed ROM slots 28557.
    28557, 3700,
// PORT: SOURCE P32-P33_P72-P73.agc:1141
//		DSU*	BMN
// PORT: Fixed ROM slots 28558.
    28558, 40998,
// PORT: SOURCE P32-P33_P72-P73.agc:1142
//			PMINE -2,1
// PORT: Fixed ROM slots 28559.
    28559, 28232,
// PORT: SOURCE P32-P33_P72-P73.agc:1143
//			SCNDSOL
// PORT: Fixed ROM slots 28560.
    28560, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:1144
//		DLOAD	DSU
// PORT: Fixed ROM slots 28561.
    28561, 38346,
// PORT: SOURCE P32-P33_P72-P73.agc:1145
//			TCDH
// PORT: Fixed ROM slots 28562.
    28562, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:1146
//			TCSI
// PORT: Fixed ROM slots 28563.
    28563, 2878,
// PORT: SOURCE P32-P33_P72-P73.agc:1147
//		STORE	T1TOT2
// PORT: Fixed ROM slots 28564.
    28564, 2766,
// PORT: SOURCE P32-P33_P72-P73.agc:1148
//		AXT,2	DSU
// PORT: Fixed ROM slots 28565.
    28565, 38392,
// PORT: SOURCE P32-P33_P72-P73.agc:1149
//			4
// PORT: Fixed ROM slots 28566.
    28566, 8,
// PORT: SOURCE P32-P33_P72-P73.agc:1150
//			600SEC
// PORT: Fixed ROM slots 28567.
    28567, 30924,
// PORT: SOURCE P32-P33_P72-P73.agc:1151
//		BMN	AXT,2
// PORT: Fixed ROM slots 28568.
    28568, 64576,
// PORT: SOURCE P32-P33_P72-P73.agc:1152
//			SCNDSOL
// PORT: Fixed ROM slots 28569.
    28569, 53060,
// PORT: SOURCE P32-P33_P72-P73.agc:1153
//			5
// PORT: Fixed ROM slots 28570.
    28570, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:1154
//		DLOAD	DSU
// PORT: Fixed ROM slots 28571.
    28571, 38346,
// PORT: SOURCE P32-P33_P72-P73.agc:1155
//			TTPI
// PORT: Fixed ROM slots 28572.
    28572, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:1156
//			TCDH
// PORT: Fixed ROM slots 28573.
    28573, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:1157
//		STORE	T2TOT3
// PORT: Fixed ROM slots 28574.
    28574, 3932,
// PORT: SOURCE P32-P33_P72-P73.agc:1158
//		DSU	BPL
// PORT: Fixed ROM slots 28575.
    28575, 42026,
// PORT: SOURCE P32-P33_P72-P73.agc:1159
//			600SEC
// PORT: Fixed ROM slots 28576.
    28576, 30924,
// PORT: SOURCE P32-P33_P72-P73.agc:1160
//			P32/P72C
// PORT: Fixed ROM slots 28577.
    28577, 9728,
// PORT: SOURCE P32-P33_P72-P73.agc:1161
//SCNDSOL		BON	BOFF
// PORT: Fixed ROM slots 28578.
    28578, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1162
//			S32.1F3A
// PORT: Fixed ROM slots 28579.
    28579, 6020,
// PORT: SOURCE P32-P33_P72-P73.agc:1163
//			ALMXIT
// PORT: Fixed ROM slots 28580.
    28580, 9628,
// PORT: SOURCE P32-P33_P72-P73.agc:1164
//			S32.1F3B
// PORT: Fixed ROM slots 28581.
    28581, 6086,
// PORT: SOURCE P32-P33_P72-P73.agc:1165
//			ALMXIT
// PORT: Fixed ROM slots 28582.
    28582, 9628,
// PORT: SOURCE P32-P33_P72-P73.agc:1166
//		SXA,2	DLOAD
// PORT: Fixed ROM slots 28583.
    28583, 58808,
// PORT: SOURCE P32-P33_P72-P73.agc:1167
//			CSIALRM
// PORT: Fixed ROM slots 28584.
    28584, 3944,
// PORT: SOURCE P32-P33_P72-P73.agc:1168
//			ZEROVECS
// PORT: Fixed ROM slots 28585.
    28585, 13754,
// PORT: SOURCE P32-P33_P72-P73.agc:1169
//		CLEAR	SET
// PORT: Fixed ROM slots 28586.
    28586, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1170
//			S32.1F1
// PORT: Fixed ROM slots 28587.
    28587, 5984,
// PORT: SOURCE P32-P33_P72-P73.agc:1171
//# Page 674
// PORT: SOURCE P32-P33_P72-P73.agc:1172
//			S32.1F2
// PORT: Fixed ROM slots 28588.
    28588, 5730,
// PORT: SOURCE P32-P33_P72-P73.agc:1173
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 28589.
    28589, 35864,
// PORT: SOURCE P32-P33_P72-P73.agc:1174
//			S32.1F3A
// PORT: Fixed ROM slots 28590.
    28590, 5988,
// PORT: SOURCE P32-P33_P72-P73.agc:1175
//			S32.1F3B
// PORT: Fixed ROM slots 28591.
    28591, 5990,
// PORT: SOURCE P32-P33_P72-P73.agc:1176
//		STCALL	LOOPCT
// PORT: Fixed ROM slots 28592.
    28592, 32744,
// PORT: SOURCE P32-P33_P72-P73.agc:1177
//			CSI/B
// PORT: Fixed ROM slots 28593.
    28593, 14236,
// PORT: SOURCE P32-P33_P72-P73.agc:1178
//# Page 675
// PORT: SOURCE P32-P33_P72-P73.agc:1179
//# ..... ADVANCE .....
// PORT: SOURCE P32-P33_P72-P73.agc:1180
//
// PORT: SOURCE P32-P33_P72-P73.agc:1181
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:1182
//
// PORT: SOURCE P32-P33_P72-P73.agc:1183
//#	 PRECSET
// PORT: SOURCE P32-P33_P72-P73.agc:1184
//#	 ROTATE
// PORT: SOURCE P32-P33_P72-P73.agc:1185
//
// PORT: SOURCE P32-P33_P72-P73.agc:1186
//		SETLOC	CDHTAG3
// PORT: SOURCE P32-P33_P72-P73.agc:1187
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1188
//
// PORT: SOURCE P32-P33_P72-P73.agc:1189
//ADVANCE		STQ	DLOAD
// PORT: Fixed ROM slots 34213.
    34213, 58656,
// PORT: SOURCE P32-P33_P72-P73.agc:1190
//			SUBEXIT
// PORT: Fixed ROM slots 34214.
    34214, 2544,
// PORT: SOURCE P32-P33_P72-P73.agc:1191
//			TIG
// PORT: Fixed ROM slots 34215.
    34215, 3606,
// PORT: SOURCE P32-P33_P72-P73.agc:1192
//		STCALL	TDEC1
// PORT: Fixed ROM slots 34216.
    34216, 28738,
// PORT: SOURCE P32-P33_P72-P73.agc:1193
//			PRECSET
// PORT: Fixed ROM slots 34217.
    34217, 38170,
// PORT: SOURCE P32-P33_P72-P73.agc:1194
//		SET	VLOAD
// PORT: Fixed ROM slots 34218.
    34218, 64792,
// PORT: SOURCE P32-P33_P72-P73.agc:1195
//			XDELVFLG
// PORT: Fixed ROM slots 34219.
    34219, 1134,
// PORT: SOURCE P32-P33_P72-P73.agc:1196
//			VPASS3
// PORT: Fixed ROM slots 34220.
    34220, 3812,
// PORT: SOURCE P32-P33_P72-P73.agc:1197
//		STORE	VPASS2
// PORT: Fixed ROM slots 34221.
    34221, 2846,
// PORT: SOURCE P32-P33_P72-P73.agc:1198
//		STOVL	VPASS1
// PORT: Fixed ROM slots 34222.
    34222, 24212,
// PORT: SOURCE P32-P33_P72-P73.agc:1199
//			RPASS3
// PORT: Fixed ROM slots 34223.
    34223, 3800,
// PORT: SOURCE P32-P33_P72-P73.agc:1200
//		STORE	RPASS2
// PORT: Fixed ROM slots 34224.
    34224, 2858,
// PORT: SOURCE P32-P33_P72-P73.agc:1201
//		STORE	RPASS1
// PORT: Fixed ROM slots 34225.
    34225, 4060,
// PORT: SOURCE P32-P33_P72-P73.agc:1202
//		UNIT	VXV
// PORT: Fixed ROM slots 34226.
    34226, 40284,
// PORT: SOURCE P32-P33_P72-P73.agc:1203
//			VPASS1
// PORT: Fixed ROM slots 34227.
    34227, 3732,
// PORT: SOURCE P32-P33_P72-P73.agc:1204
//		UNIT
// PORT: Fixed ROM slots 34228.
    34228, 65372,
// PORT: SOURCE P32-P33_P72-P73.agc:1205
//		STOVL	UP1
// PORT: Fixed ROM slots 34229.
    34229, 23314,
// PORT: SOURCE P32-P33_P72-P73.agc:1206
//			RACT3
// PORT: Fixed ROM slots 34230.
    34230, 3776,
// PORT: SOURCE P32-P33_P72-P73.agc:1207
//		STCALL	RTIG
// PORT: Fixed ROM slots 34231.
    34231, 32564,
// PORT: SOURCE P32-P33_P72-P73.agc:1208
//			ROTATE
// PORT: Fixed ROM slots 34232.
    34232, 11552,
// PORT: SOURCE P32-P33_P72-P73.agc:1209
//		STORE	RACT2
// PORT: Fixed ROM slots 34233.
    34233, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:1210
//		STOVL	RACT1
// PORT: Fixed ROM slots 34234.
    34234, 23234,
// PORT: SOURCE P32-P33_P72-P73.agc:1211
//			VACT3
// PORT: Fixed ROM slots 34235.
    34235, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:1212
//		STCALL	VTIG
// PORT: Fixed ROM slots 34236.
    34236, 32576,
// PORT: SOURCE P32-P33_P72-P73.agc:1213
//			ROTATE
// PORT: Fixed ROM slots 34237.
    34237, 11552,
// PORT: SOURCE P32-P33_P72-P73.agc:1214
//		STORE	VACT2
// PORT: Fixed ROM slots 34238.
    34238, 2742,
// PORT: SOURCE P32-P33_P72-P73.agc:1215
//		STCALL	VACT1
// PORT: Fixed ROM slots 34239.
    34239, 32392,
// PORT: SOURCE P32-P33_P72-P73.agc:1216
//			SUBEXIT
// PORT: Fixed ROM slots 34240.
    34240, 2544,
// PORT: SOURCE P32-P33_P72-P73.agc:1217
//# Page 676
// PORT: SOURCE P32-P33_P72-P73.agc:1218
//# ..... ROTATE .....
// PORT: SOURCE P32-P33_P72-P73.agc:1219
//
// PORT: SOURCE P32-P33_P72-P73.agc:1220
//		SETLOC	CDHTAG
// PORT: SOURCE P32-P33_P72-P73.agc:1221
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1222
//
// PORT: SOURCE P32-P33_P72-P73.agc:1223
//ROTATE		PUSH	PUSH
// PORT: Fixed ROM slots 7824.
    7824, 34316,
// PORT: SOURCE P32-P33_P72-P73.agc:1224
//		DOT	VXSC
// PORT: Fixed ROM slots 7825.
    7825, 61762,
// PORT: SOURCE P32-P33_P72-P73.agc:1225
//			UP1
// PORT: Fixed ROM slots 7826.
    7826, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1226
//			UP1
// PORT: Fixed ROM slots 7827.
    7827, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1227
//		VSL2	BVSU
// PORT: Fixed ROM slots 7828.
    7828, 42452,
// PORT: SOURCE P32-P33_P72-P73.agc:1228
//		UNIT	PDVL
// PORT: Fixed ROM slots 7829.
    7829, 52572,
// PORT: SOURCE P32-P33_P72-P73.agc:1229
//		ABVAL	VXSC
// PORT: Fixed ROM slots 7830.
    7830, 61772,
// PORT: SOURCE P32-P33_P72-P73.agc:1230
//		VSL1	RVQ
// PORT: Fixed ROM slots 7831.
    7831, 36596,
// PORT: SOURCE P32-P33_P72-P73.agc:1231
//# Page 677
// PORT: SOURCE P32-P33_P72-P73.agc:1232
//# ..... INTINTNA .....
// PORT: SOURCE P32-P33_P72-P73.agc:1233
//
// PORT: SOURCE P32-P33_P72-P73.agc:1234
//		SETLOC	CDHTAG2
// PORT: SOURCE P32-P33_P72-P73.agc:1235
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1236
//
// PORT: SOURCE P32-P33_P72-P73.agc:1237
//INTINT2C	PDDL	PDDL
// PORT: Fixed ROM slots 28594.
    28594, 54698,
// PORT: SOURCE P32-P33_P72-P73.agc:1238
//			TCSI
// PORT: Fixed ROM slots 28595.
    28595, 2878,
// PORT: SOURCE P32-P33_P72-P73.agc:1239
//			TCDH
// PORT: Fixed ROM slots 28596.
    28596, 2874,
// PORT: SOURCE P32-P33_P72-P73.agc:1240
//		PDDL	PUSH
// PORT: Fixed ROM slots 28597.
    28597, 34474,
// PORT: SOURCE P32-P33_P72-P73.agc:1241
//			TWOPI
// PORT: Fixed ROM slots 28598.
    28598, 27790,
// PORT: SOURCE P32-P33_P72-P73.agc:1242
//		GOTO
// PORT: Fixed ROM slots 28599.
    28599, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:1243
//			INTINT
// PORT: Fixed ROM slots 28600.
    28600, 60298,
// PORT: SOURCE P32-P33_P72-P73.agc:1244
//INTINT3P	PDDL	PDDL
// PORT: Fixed ROM slots 28601.
    28601, 54698,
// PORT: SOURCE P32-P33_P72-P73.agc:1245
//			TCDH
// PORT: Fixed ROM slots 28602.
    28602, 2874
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:1246
//			TTPI
// PORT: Fixed ROM slots 28603.
    28603, 3942,
// PORT: SOURCE P32-P33_P72-P73.agc:1247
//		PDDL	PUSH
// PORT: Fixed ROM slots 28604.
    28604, 34474,
// PORT: SOURCE P32-P33_P72-P73.agc:1248
//			ZEROVECS
// PORT: Fixed ROM slots 28605.
    28605, 13754,
// PORT: SOURCE P32-P33_P72-P73.agc:1249
//		GOTO
// PORT: Fixed ROM slots 28606.
    28606, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:1250
//			INTINT
// PORT: Fixed ROM slots 28607.
    28607, 60298,
// PORT: SOURCE P32-P33_P72-P73.agc:1251
//# Page 678
// PORT: SOURCE P32-P33_P72-P73.agc:1252
//# ..... S32/33.1 .....
// PORT: SOURCE P32-P33_P72-P73.agc:1253
//
// PORT: SOURCE P32-P33_P72-P73.agc:1254
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:1255
//#	 S32/33.X
// PORT: SOURCE P32-P33_P72-P73.agc:1256
//
// PORT: SOURCE P32-P33_P72-P73.agc:1257
//		SETLOC	CSI/CDH
// PORT: SOURCE P32-P33_P72-P73.agc:1258
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1259
//
// PORT: SOURCE P32-P33_P72-P73.agc:1260
//S32/33.1	STQ	AXT,1
// PORT: Fixed ROM slots 32559.
    32559, 63520,
// PORT: SOURCE P32-P33_P72-P73.agc:1261
//			SUBEXIT
// PORT: Fixed ROM slots 32560.
    32560, 2544,
// PORT: SOURCE P32-P33_P72-P73.agc:1262
//		VN	0681
// PORT: Fixed ROM slots 32561.
    32561, 1698,
// PORT: SOURCE P32-P33_P72-P73.agc:1263
//		CALL
// PORT: Fixed ROM slots 32562.
    32562, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:1264
//			DISDVLVC
// PORT: Fixed ROM slots 32563.
    32563, 64298,
// PORT: SOURCE P32-P33_P72-P73.agc:1265
//		CALL
// PORT: Fixed ROM slots 32564.
    32564, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:1266
//			S32/33.X
// PORT: Fixed ROM slots 32565.
    32565, 22834,
// PORT: SOURCE P32-P33_P72-P73.agc:1267
//		VLOAD	VXM
// PORT: Fixed ROM slots 32566.
    32566, 50682,
// PORT: SOURCE P32-P33_P72-P73.agc:1268
//			DELVLVC
// PORT: Fixed ROM slots 32567.
    32567, 3594,
// PORT: SOURCE P32-P33_P72-P73.agc:1269
//			0D
// PORT: Fixed ROM slots 32568.
    32568, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1270
//		VSL1
// PORT: Fixed ROM slots 32569.
    32569, 65524,
// PORT: SOURCE P32-P33_P72-P73.agc:1271
//		STORE	DELVSIN
// PORT: Fixed ROM slots 32570.
    32570, 3916,
// PORT: SOURCE P32-P33_P72-P73.agc:1272
//		PUSH	ABVAL
// PORT: Fixed ROM slots 32571.
    32571, 42508,
// PORT: SOURCE P32-P33_P72-P73.agc:1273
//		STOVL	DELVSAB
// PORT: Fixed ROM slots 32572.
    32572, 24408,
// PORT: SOURCE P32-P33_P72-P73.agc:1274
//		GOTO
// PORT: Fixed ROM slots 32573.
    32573, 65360,
// PORT: SOURCE P32-P33_P72-P73.agc:1275
//			SUBEXIT
// PORT: Fixed ROM slots 32574.
    32574, 2544,
// PORT: SOURCE P32-P33_P72-P73.agc:1276
//# Page 679
// PORT: SOURCE P32-P33_P72-P73.agc:1277
//# ..... S32/33.X .....
// PORT: SOURCE P32-P33_P72-P73.agc:1278
//
// PORT: SOURCE P32-P33_P72-P73.agc:1279
//		SETLOC	CDHTAGS
// PORT: SOURCE P32-P33_P72-P73.agc:1280
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1281
//
// PORT: SOURCE P32-P33_P72-P73.agc:1282
//S32/33.X	SETPD	VLOAD
// PORT: Fixed ROM slots 13465.
    13465, 64770,
// PORT: SOURCE P32-P33_P72-P73.agc:1283
//			6D
// PORT: Fixed ROM slots 13466.
    13466, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:1284
//			UP1
// PORT: Fixed ROM slots 13467.
    13467, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1285
//		VCOMP	PDVL
// PORT: Fixed ROM slots 13468.
    13468, 52604,
// PORT: SOURCE P32-P33_P72-P73.agc:1286
//			RACT1
// PORT: Fixed ROM slots 13469.
    13469, 2754,
// PORT: SOURCE P32-P33_P72-P73.agc:1287
//		UNIT	VCOMP
// PORT: Fixed ROM slots 13470.
    13470, 48732,
// PORT: SOURCE P32-P33_P72-P73.agc:1288
//		PUSH	VXV
// PORT: Fixed ROM slots 13471.
    13471, 40204,
// PORT: SOURCE P32-P33_P72-P73.agc:1289
//			UP1
// PORT: Fixed ROM slots 13472.
    13472, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1290
//		VSL1
// PORT: Fixed ROM slots 13473.
    13473, 65524,
// PORT: SOURCE P32-P33_P72-P73.agc:1291
//		STORE	0D
// PORT: Fixed ROM slots 13474.
    13474, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1292
//		RVQ
// PORT: Fixed ROM slots 13475.
    13475, 65308,
// PORT: SOURCE P32-P33_P72-P73.agc:1293
//# Page 680
// PORT: SOURCE P32-P33_P72-P73.agc:1294
//# ..... CDHMVR .....
// PORT: SOURCE P32-P33_P72-P73.agc:1295
//
// PORT: SOURCE P32-P33_P72-P73.agc:1296
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:1297
//
// PORT: SOURCE P32-P33_P72-P73.agc:1298
//#	 VECSHIFT
// PORT: SOURCE P32-P33_P72-P73.agc:1299
//#	 TIMETHET
// PORT: SOURCE P32-P33_P72-P73.agc:1300
//#	 SHIFTR1
// PORT: SOURCE P32-P33_P72-P73.agc:1301
//
// PORT: SOURCE P32-P33_P72-P73.agc:1302
//		SETLOC	CDHTAG
// PORT: SOURCE P32-P33_P72-P73.agc:1303
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1304
//
// PORT: SOURCE P32-P33_P72-P73.agc:1305
//CDHMVR		STQ	VLOAD
// PORT: Fixed ROM slots 7832.
    7832, 64800,
// PORT: SOURCE P32-P33_P72-P73.agc:1306
//			SUBEXIT
// PORT: Fixed ROM slots 7833.
    7833, 2544,
// PORT: SOURCE P32-P33_P72-P73.agc:1307
//			RACT2
// PORT: Fixed ROM slots 7834.
    7834, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:1308
//		PUSH	UNIT
// PORT: Fixed ROM slots 7835.
    7835, 44556,
// PORT: SOURCE P32-P33_P72-P73.agc:1309
//		STOVL	UNVEC		# UR SUB A
// PORT: Fixed ROM slots 7836.
    7836, 24268,
// PORT: SOURCE P32-P33_P72-P73.agc:1310
//			RPASS2
// PORT: Fixed ROM slots 7837.
    7837, 2858,
// PORT: SOURCE P32-P33_P72-P73.agc:1311
//		UNIT	DOT
// PORT: Fixed ROM slots 7838.
    7838, 41308,
// PORT: SOURCE P32-P33_P72-P73.agc:1312
//			UNVEC
// PORT: Fixed ROM slots 7839.
    7839, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:1313
//		PUSH	SL1
// PORT: Fixed ROM slots 7840.
    7840, 59916,
// PORT: SOURCE P32-P33_P72-P73.agc:1314
//		STODL	CSTH
// PORT: Fixed ROM slots 7841.
    7841, 15288,
// PORT: SOURCE P32-P33_P72-P73.agc:1315
//		DSQ	PDDL
// PORT: Fixed ROM slots 7842.
    7842, 54684,
// PORT: SOURCE P32-P33_P72-P73.agc:1316
//			DP1/4
// PORT: Fixed ROM slots 7843.
    7843, 20444,
// PORT: SOURCE P32-P33_P72-P73.agc:1317
//		SR2	DSU
// PORT: Fixed ROM slots 7844.
    7844, 38276,
// PORT: SOURCE P32-P33_P72-P73.agc:1318
//		SQRT	SL1
// PORT: Fixed ROM slots 7845.
    7845, 60140,
// PORT: SOURCE P32-P33_P72-P73.agc:1319
//		PDVL	VCOMP
// PORT: Fixed ROM slots 7846.
    7846, 48794,
// PORT: SOURCE P32-P33_P72-P73.agc:1320
//		VXV
// PORT: Fixed ROM slots 7847.
    7847, 65338,
// PORT: SOURCE P32-P33_P72-P73.agc:1321
//			RPASS2
// PORT: Fixed ROM slots 7848.
    7848, 2858,
// PORT: SOURCE P32-P33_P72-P73.agc:1322
//		DOT	PDDL
// PORT: Fixed ROM slots 7849.
    7849, 54594,
// PORT: SOURCE P32-P33_P72-P73.agc:1323
//			UP1
// PORT: Fixed ROM slots 7850.
    7850, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1324
//		SIGN	STADR
// PORT: Fixed ROM slots 7851.
    7851, 38634,
// PORT: SOURCE P32-P33_P72-P73.agc:1325
//		STOVL	SNTH
// PORT: Fixed ROM slots 7852.
    7852, 42058,
// PORT: SOURCE P32-P33_P72-P73.agc:1326
//			RPASS2
// PORT: Fixed ROM slots 7853.
    7853, 2858,
// PORT: SOURCE P32-P33_P72-P73.agc:1327
//		PDVL	CALL
// PORT: Fixed ROM slots 7854.
    7854, 38042,
// PORT: SOURCE P32-P33_P72-P73.agc:1328
//			VPASS2
// PORT: Fixed ROM slots 7855.
    7855, 2846,
// PORT: SOURCE P32-P33_P72-P73.agc:1329
//			VECSHIFT
// PORT: Fixed ROM slots 7856.
    7856, 38230,
// PORT: SOURCE P32-P33_P72-P73.agc:1330
//		STOVL	VVEC
// PORT: Fixed ROM slots 7857.
    7857, 23500,
// PORT: SOURCE P32-P33_P72-P73.agc:1331
//		CLEAR
// PORT: Fixed ROM slots 7858.
    7858, 65304,
// PORT: SOURCE P32-P33_P72-P73.agc:1332
//			RVSW
// PORT: Fixed ROM slots 7859.
    7859, 3948,
// PORT: SOURCE P32-P33_P72-P73.agc:1333
//		STCALL	RVEC
// PORT: Fixed ROM slots 7860.
    7860, 31582,
// PORT: SOURCE P32-P33_P72-P73.agc:1334
//			TIMETHET
// PORT: Fixed ROM slots 7861.
    7861, 21448,
// PORT: SOURCE P32-P33_P72-P73.agc:1335
//		LXA,2	VSL*
// PORT: Fixed ROM slots 7862.
    7862, 45016,
// PORT: SOURCE P32-P33_P72-P73.agc:1336
//			RTX2
// PORT: Fixed ROM slots 7863.
    7863, 4044,
// PORT: SOURCE P32-P33_P72-P73.agc:1337
//			0,2
// PORT: Fixed ROM slots 7864.
    7864, 48892,
// PORT: SOURCE P32-P33_P72-P73.agc:1338
//		STORE	18D
// PORT: Fixed ROM slots 7865.
    7865, 38,
// PORT: SOURCE P32-P33_P72-P73.agc:1339
//		DOT	SL1R
// PORT: Fixed ROM slots 7866.
    7866, 64066,
// PORT: SOURCE P32-P33_P72-P73.agc:1340
//			UNVEC
// PORT: Fixed ROM slots 7867.
    7867, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:1341
//		PDVL	ABVAL		# 0D = V SUB PV
// PORT: Fixed ROM slots 7868.
    7868, 42650,
// PORT: SOURCE P32-P33_P72-P73.agc:1342
//		SL*	PDVL
// PORT: Fixed ROM slots 7869.
    7869, 52574,
// PORT: SOURCE P32-P33_P72-P73.agc:1343
//			0,2
// PORT: Fixed ROM slots 7870.
    7870, 48892,
// PORT: SOURCE P32-P33_P72-P73.agc:1344
//# Page 681
// PORT: SOURCE P32-P33_P72-P73.agc:1345
//			RACT2
// PORT: Fixed ROM slots 7871.
    7871, 2646,
// PORT: SOURCE P32-P33_P72-P73.agc:1346
//		ABVAL	PDDL		# 2D = LENGTH OF R SUB A
// PORT: Fixed ROM slots 7872.
    7872, 54604,
// PORT: SOURCE P32-P33_P72-P73.agc:1347
//		DSU
// PORT: Fixed ROM slots 7873.
    7873, 65322,
// PORT: SOURCE P32-P33_P72-P73.agc:1348
//			02D
// PORT: Fixed ROM slots 7874.
    7874, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:1349
//		STODL	DIFFALT		# DELTA H IN METERS		B+29
// PORT: Fixed ROM slots 7875.
    7875, 15158,
// PORT: SOURCE P32-P33_P72-P73.agc:1350
//			R1A
// PORT: Fixed ROM slots 7876.
    7876, 3016,
// PORT: SOURCE P32-P33_P72-P73.agc:1351
//		NORM	PDDL		# 2 - R V**/MU				04D
// PORT: Fixed ROM slots 7877.
    7877, 54658,
// PORT: SOURCE P32-P33_P72-P73.agc:1352
//			X1
// PORT: Fixed ROM slots 7878.
    7878, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:1353
//			R1
// PORT: Fixed ROM slots 7879.
    7879, 66,
// PORT: SOURCE P32-P33_P72-P73.agc:1354
//		CALL
// PORT: Fixed ROM slots 7880.
    7880, 65320,
// PORT: SOURCE P32-P33_P72-P73.agc:1355
//			SHIFTR1
// PORT: Fixed ROM slots 7881.
    7881, 38246,
// PORT: SOURCE P32-P33_P72-P73.agc:1356
//		SR1R	DDV
// PORT: Fixed ROM slots 7882.
    7882, 47588,
// PORT: SOURCE P32-P33_P72-P73.agc:1357
//		SL*	PUSH
// PORT: Fixed ROM slots 7883.
    7883, 34398,
// PORT: SOURCE P32-P33_P72-P73.agc:1358
//			0 -5,1
// PORT: Fixed ROM slots 7884.
    7884, 16632,
// PORT: SOURCE P32-P33_P72-P73.agc:1359
//		DSU	PDDL		# A SUB A			B+29 	04D
// PORT: Fixed ROM slots 7885.
    7885, 54570,
// PORT: SOURCE P32-P33_P72-P73.agc:1360
//			DIFFALT
// PORT: Fixed ROM slots 7886.
    7886, 2870,
// PORT: SOURCE P32-P33_P72-P73.agc:1361
//		SR2	DDV		# A SUB P			B+31
// PORT: Fixed ROM slots 7887.
    7887, 47492,
// PORT: SOURCE P32-P33_P72-P73.agc:1362
//			04D		#				B+2
// PORT: Fixed ROM slots 7888.
    7888, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:1363
//		PUSH	SQRT		# A SUB P/A SUB A			06D
// PORT: Fixed ROM slots 7889.
    7889, 62988,
// PORT: SOURCE P32-P33_P72-P73.agc:1364
//		DMPR	DMP
// PORT: Fixed ROM slots 7890.
    7890, 34170,
// PORT: SOURCE P32-P33_P72-P73.agc:1365
//			06D
// PORT: Fixed ROM slots 7891.
    7891, 14,
// PORT: SOURCE P32-P33_P72-P73.agc:1366
//			00D
// PORT: Fixed ROM slots 7892.
    7892, 2,
// PORT: SOURCE P32-P33_P72-P73.agc:1367
//		SL3R	PDDL		# V SUB A V METERS/CS		B+7 	08D
// PORT: Fixed ROM slots 7893.
    7893, 54644,
// PORT: SOURCE P32-P33_P72-P73.agc:1368
//			02D		# R SUB A MAGNITUDE		B+29
// PORT: Fixed ROM slots 7894.
    7894, 6,
// PORT: SOURCE P32-P33_P72-P73.agc:1369
//		NORM	PDDL
// PORT: Fixed ROM slots 7895.
    7895, 54658,
// PORT: SOURCE P32-P33_P72-P73.agc:1370
//			X1
// PORT: Fixed ROM slots 7896.
    7896, 78,
// PORT: SOURCE P32-P33_P72-P73.agc:1371
//			RTMU
// PORT: Fixed ROM slots 7897.
    7897, 4048,
// PORT: SOURCE P32-P33_P72-P73.agc:1372
//		SR1	DDV		# 2MU 				B+38
// PORT: Fixed ROM slots 7898.
    7898, 47556,
// PORT: SOURCE P32-P33_P72-P73.agc:1373
//		SL*	PDDL		# 2 MU/R SUBAA			B+14 	10D
// PORT: Fixed ROM slots 7899.
    7899, 54622
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P33_P72-P73.agc:1374
//			0 -5,1
// PORT: Fixed ROM slots 7900.
    7900, 16632,
// PORT: SOURCE P32-P33_P72-P73.agc:1375
//			04D		# ASUBA				B+29
// PORT: Fixed ROM slots 7901.
    7901, 10,
// PORT: SOURCE P32-P33_P72-P73.agc:1376
//		NORM	PDDL
// PORT: Fixed ROM slots 7902.
    7902, 54658,
// PORT: SOURCE P32-P33_P72-P73.agc:1377
//			X2
// PORT: Fixed ROM slots 7903.
    7903, 80,
// PORT: SOURCE P32-P33_P72-P73.agc:1378
//			RTMU
// PORT: Fixed ROM slots 7904.
    7904, 4048,
// PORT: SOURCE P32-P33_P72-P73.agc:1379
//		SR1	DDV
// PORT: Fixed ROM slots 7905.
    7905, 47556,
// PORT: SOURCE P32-P33_P72-P73.agc:1380
//		SL*	BDSU
// PORT: Fixed ROM slots 7906.
    7906, 37214,
// PORT: SOURCE P32-P33_P72-P73.agc:1381
//			0 -6,2		# 2U/R - U/A		 B+14 (METERS/CS)SQ
// PORT: Fixed ROM slots 7907.
    7907, 48904,
// PORT: SOURCE P32-P33_P72-P73.agc:1382
//		PDDL	DSQ		#					10D
// PORT: Fixed ROM slots 7908.
    7908, 52906,
// PORT: SOURCE P32-P33_P72-P73.agc:1383
//			08D
// PORT: Fixed ROM slots 7909.
    7909, 18,
// PORT: SOURCE P32-P33_P72-P73.agc:1384
//		BDSU	SQRT
// PORT: Fixed ROM slots 7910.
    7910, 63010,
// PORT: SOURCE P32-P33_P72-P73.agc:1385
//		PDVL	VXV		# SQRT(MU(2/R SUB A-1/A SUB A)-VSUBA2)	10D
// PORT: Fixed ROM slots 7911.
    7911, 40346,
// PORT: SOURCE P32-P33_P72-P73.agc:1386
//			UP1
// PORT: Fixed ROM slots 7912.
    7912, 2834,
// PORT: SOURCE P32-P33_P72-P73.agc:1387
//			UNVEC
// PORT: Fixed ROM slots 7913.
    7913, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:1388
//		UNIT	VXSC
// PORT: Fixed ROM slots 7914.
    7914, 61788,
// PORT: SOURCE P32-P33_P72-P73.agc:1389
//			10D
// PORT: Fixed ROM slots 7915.
    7915, 22,
// PORT: SOURCE P32-P33_P72-P73.agc:1390
//		PDVL	VXSC
// PORT: Fixed ROM slots 7916.
    7916, 61850,
// PORT: SOURCE P32-P33_P72-P73.agc:1391
//			UNVEC
// PORT: Fixed ROM slots 7917.
    7917, 3788,
// PORT: SOURCE P32-P33_P72-P73.agc:1392
//			08D
// PORT: Fixed ROM slots 7918.
    7918, 18,
// PORT: SOURCE P32-P33_P72-P73.agc:1393
//		VAD	VSL1
// PORT: Fixed ROM slots 7919.
    7919, 64090,
// PORT: SOURCE P32-P33_P72-P73.agc:1394
//		STADR
// PORT: Fixed ROM slots 7920.
    7920, 65324,
// PORT: SOURCE P32-P33_P72-P73.agc:1395
//# Page 682
// PORT: SOURCE P32-P33_P72-P73.agc:1396
//		STORE	VACT3
// PORT: Fixed ROM slots 7921.
    7921, 61746,
// PORT: SOURCE P32-P33_P72-P73.agc:1397
//		VSU
// PORT: Fixed ROM slots 7922.
    7922, 65362,
// PORT: SOURCE P32-P33_P72-P73.agc:1398
//			VACT2
// PORT: Fixed ROM slots 7923.
    7923, 2742,
// PORT: SOURCE P32-P33_P72-P73.agc:1399
//		STCALL	DELVEET2	# DELTA VCDH - REFERENCE COORDINATES
// PORT: Fixed ROM slots 7924.
    7924, 32622,
// PORT: SOURCE P32-P33_P72-P73.agc:1400
//			SUBEXIT
// PORT: Fixed ROM slots 7925.
    7925, 2544
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P32-P33_P72-P73.agc:1401
//# Page 683
// PORT: SOURCE P32-P33_P72-P73.agc:1402
//# ..... COMPTGO .....
// PORT: SOURCE P32-P33_P72-P73.agc:1403
//
// PORT: SOURCE P32-P33_P72-P73.agc:1404
//# SUBROUTINES USED
// PORT: SOURCE P32-P33_P72-P73.agc:1405
//
// PORT: SOURCE P32-P33_P72-P73.agc:1406
//#	 CLOKTASK
// PORT: SOURCE P32-P33_P72-P73.agc:1407
//#	 2PHSCHNG
// PORT: SOURCE P32-P33_P72-P73.agc:1408
//
// PORT: SOURCE P32-P33_P72-P73.agc:1409
//		BANK	35
// PORT: SOURCE P32-P33_P72-P73.agc:1410
//		SETLOC	CSI/CDH
// PORT: SOURCE P32-P33_P72-P73.agc:1411
//		BANK
// PORT: SOURCE P32-P33_P72-P73.agc:1412
//
// PORT: SOURCE P32-P33_P72-P73.agc:1413
//		EBANK=	RTRN
// PORT: SOURCE P32-P33_P72-P73.agc:1414
//
// PORT: SOURCE P32-P33_P72-P73.agc:1415
//		COUNT*	$$/P3575
