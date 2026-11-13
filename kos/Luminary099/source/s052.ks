// PORT: Original source unit P32-P35_P72-P75.agc.
// PORT: Physical bank 35. Shared continuation entries, slots 31767–31773.
function agcAotUnit2014 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31769 {
        if slot <= 31767 {
// PORT: SOURCE P32-P35_P72-P75.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P32-P35_P72-P75.agc:2
//# Filename:	P32-P35_P72-P75.agc
// PORT: SOURCE P32-P35_P72-P75.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P32-P35_P72-P75.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P32-P35_P72-P75.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P32-P35_P72-P75.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P32-P35_P72-P75.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P32-P35_P72-P75.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P32-P35_P72-P75.agc:9
//# Pages:	618-650
// PORT: SOURCE P32-P35_P72-P75.agc:10
//# Mod history:	2009-05-18 RSB	Adapted from the Luminary 131 file of the
// PORT: SOURCE P32-P35_P72-P75.agc:11
//#				same name, as corrected from Luminary 099
// PORT: SOURCE P32-P35_P72-P75.agc:12
//#				page images.
// PORT: SOURCE P32-P35_P72-P75.agc:13
//#
// PORT: SOURCE P32-P35_P72-P75.agc:14
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P32-P35_P72-P75.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P32-P35_P72-P75.agc:16
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P32-P35_P72-P75.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P32-P35_P72-P75.agc:18
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P32-P35_P72-P75.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P32-P35_P72-P75.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P32-P35_P72-P75.agc:21
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P32-P35_P72-P75.agc:22
//# actually created.
// PORT: SOURCE P32-P35_P72-P75.agc:23
//#
// PORT: SOURCE P32-P35_P72-P75.agc:24
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P32-P35_P72-P75.agc:25
//#
// PORT: SOURCE P32-P35_P72-P75.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P32-P35_P72-P75.agc:27
//#	16:27 JULY 14, 1969
// PORT: SOURCE P32-P35_P72-P75.agc:28
//
// PORT: SOURCE P32-P35_P72-P75.agc:29
//# Page 618
// PORT: SOURCE P32-P35_P72-P75.agc:30
//# COELLIPTIC SEQUENCE INITIATION (CSI) PROGRAMS (P32 AND P72)
// PORT: SOURCE P32-P35_P72-P75.agc:31
//#
// PORT: SOURCE P32-P35_P72-P75.agc:32
//# MOD NO -1       LOG SECTION -- P32-P35, P72-P75
// PORT: SOURCE P32-P35_P72-P75.agc:33
//# MOD BY WHITE.P  DATE 1JUNE67
// PORT: SOURCE P32-P35_P72-P75.agc:34
//#
// PORT: SOURCE P32-P35_P72-P75.agc:35
//# PURPOSE
// PORT: SOURCE P32-P35_P72-P75.agc:36
//
// PORT: SOURCE P32-P35_P72-P75.agc:37
//#	(1)	TO CALCULATE PARAMETERS ASSOCIATED WITH THE TIME FOLLOWING
// PORT: SOURCE P32-P35_P72-P75.agc:38
//#		CONCENTRIC FLIGHT PLAN MANEUVERS -- THE CO-ELLIPTIC SEQUENCE
// PORT: SOURCE P32-P35_P72-P75.agc:39
//#		INITIATION (CSI) MANEUVER AND THE CONSTANT DELTA ALTITUDE
// PORT: SOURCE P32-P35_P72-P75.agc:40
//#		(CDH) MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:41
//
// PORT: SOURCE P32-P35_P72-P75.agc:42
//#	(2)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// PORT: SOURCE P32-P35_P72-P75.agc:43
//#		APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// PORT: SOURCE P32-P35_P72-P75.agc:44
//
// PORT: SOURCE P32-P35_P72-P75.agc:45
//#	(3)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// PORT: SOURCE P32-P35_P72-P75.agc:46
//#		ASSOCIATED WITH THE CONCENTRIC FLIGHT PLAN MANEUVERS FOR
// PORT: SOURCE P32-P35_P72-P75.agc:47
//#		APPROVAL BY THE ASTRONAUT/GROUND.
// PORT: SOURCE P32-P35_P72-P75.agc:48
//
// PORT: SOURCE P32-P35_P72-P75.agc:49
//#	(4)	TO STORE THE CSI TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P32-P35_P72-P75.agc:50
//#		THRUSTING PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:51
//#
// PORT: SOURCE P32-P35_P72-P75.agc:52
//# ASSUMPTIONS
// PORT: SOURCE P32-P35_P72-P75.agc:53
//
// PORT: SOURCE P32-P35_P72-P75.agc:54
//#	(1)	AT A SELECTED TPI TIME THE LINE OF SIGHT BETWEEN THE ACTIVE
// PORT: SOURCE P32-P35_P72-P75.agc:55
//#		AND PASSIVE VEHICLES IS SELECTED TO BE A PRESCRIBED ANGLE (E)
// PORT: SOURCE P32-P35_P72-P75.agc:56
//#		FROM THE HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE
// PORT: SOURCE P32-P35_P72-P75.agc:57
//#		POSITION.
// PORT: SOURCE P32-P35_P72-P75.agc:58
//
// PORT: SOURCE P32-P35_P72-P75.agc:59
//#	(2)	THE TIME BETWEEN CSI IGNITION AND CDH IGNITION MUST BE
// PORT: SOURCE P32-P35_P72-P75.agc:60
//#		COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// PORT: SOURCE P32-P35_P72-P75.agc:61
//#		COMPLETION OF THE PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:62
//
// PORT: SOURCE P32-P35_P72-P75.agc:63
//#	(3)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION MUST BE
// PORT: SOURCE P32-P35_P72-P75.agc:64
//#		COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// PORT: SOURCE P32-P35_P72-P75.agc:65
//#		COMPLETION OF THE PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:66
//
// PORT: SOURCE P32-P35_P72-P75.agc:67
//#	(4)	CDH DELTA V IS SELECTED TO MINIMIZE THE VARIATION OF THE
// PORT: SOURCE P32-P35_P72-P75.agc:68
//#		ALTITUDE DIFFERENCE BETWEEN THE ORBITS.
// PORT: SOURCE P32-P35_P72-P75.agc:69
//
// PORT: SOURCE P32-P35_P72-P75.agc:70
//#	(5)	CSI BURN IS DEFINED SUCH THAT THE IMPULSIVE DELTA V IS IN THE
// PORT: SOURCE P32-P35_P72-P75.agc:71
//#		HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION AT CSI
// PORT: SOURCE P32-P35_P72-P75.agc:72
//#		IGNITION.
// PORT: SOURCE P32-P35_P72-P75.agc:73
//
// PORT: SOURCE P32-P35_P72-P75.agc:74
//#	(6)	THE PERICENTER ALTITUDE OF THE ORBIT FOLLOWING CSI AND CDH
// PORT: SOURCE P32-P35_P72-P75.agc:75
//#		MUST BE GREATER THAN 35,000 FT (LUNAR ORBIT) OR 85 NM (EARTH
// PORT: SOURCE P32-P35_P72-P75.agc:76
//#		ORBIT) FOR SUCCESSFUL COMPLETION OF THIS PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:77
//
// PORT: SOURCE P32-P35_P72-P75.agc:78
//#	(7)	THE CSI AND CDH MANEUVERS ARE ORIGINALLY ASSUMED TO BE
// PORT: SOURCE P32-P35_P72-P75.agc:79
//#		PARALLEL TO THE PLANE OF THE CSM ORBIT.  HOWEVER, CREW
// PORT: SOURCE P32-P35_P72-P75.agc:80
//# Page 619
// PORT: SOURCE P32-P35_P72-P75.agc:81
//#		MODIFICATION OF DELTA V (LV) COMPONENTS MAY RESULT IN AN
// PORT: SOURCE P32-P35_P72-P75.agc:82
//#		OUT-OF-PLANE CSI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:83
//
// PORT: SOURCE P32-P35_P72-P75.agc:84
//#	(8)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P32-P35_P72-P75.agc:85
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 10).
// PORT: SOURCE P32-P35_P72-P75.agc:86
//
// PORT: SOURCE P32-P35_P72-P75.agc:87
//#	(9)	COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// PORT: SOURCE P32-P35_P72-P75.agc:88
//#		THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// PORT: SOURCE P32-P35_P72-P75.agc:89
//#		ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// PORT: SOURCE P32-P35_P72-P75.agc:90
//#		EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// PORT: SOURCE P32-P35_P72-P75.agc:91
//
// PORT: SOURCE P32-P35_P72-P75.agc:92
//#	(10)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// PORT: SOURCE P32-P35_P72-P75.agc:93
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// PORT: SOURCE P32-P35_P72-P75.agc:94
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED BY THE CSM BY
// PORT: SOURCE P32-P35_P72-P75.agc:95
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// PORT: SOURCE P32-P35_P72-P75.agc:96
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// PORT: SOURCE P32-P35_P72-P75.agc:97
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// PORT: SOURCE P32-P35_P72-P75.agc:98
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// PORT: SOURCE P32-P35_P72-P75.agc:99
//#		THRUSTING MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:100
//
// PORT: SOURCE P32-P35_P72-P75.agc:101
//#	(11)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:102
//
// PORT: SOURCE P32-P35_P72-P75.agc:103
//#	(12)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// PORT: SOURCE P32-P35_P72-P75.agc:104
//#
// PORT: SOURCE P32-P35_P72-P75.agc:105
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P32-P35_P72-P75.agc:106
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P32-P35_P72-P75.agc:107
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P32-P35_P72-P75.agc:108
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:109
//#
// PORT: SOURCE P32-P35_P72-P75.agc:110
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P32-P35_P72-P75.agc:111
//#			COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// PORT: SOURCE P32-P35_P72-P75.agc:112
//#			CYCLE.
// PORT: SOURCE P32-P35_P72-P75.agc:113
//#
// PORT: SOURCE P32-P35_P72-P75.agc:114
//#			EXTERNAL DELTA V STEERING FLAG -- DESIGNATES THE TYPE OF
// PORT: SOURCE P32-P35_P72-P75.agc:115
//#			STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// PORT: SOURCE P32-P35_P72-P75.agc:116
//#			THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// PORT: SOURCE P32-P35_P72-P75.agc:117
//#			PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:118
//#
// PORT: SOURCE P32-P35_P72-P75.agc:119
//#	(13)	IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// PORT: SOURCE P32-P35_P72-P75.agc:120
//#		A THRUSTING MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:121
//#
// PORT: SOURCE P32-P35_P72-P75.agc:122
//#	(14)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY
// PORT: SOURCE P32-P35_P72-P75.agc:123
//#
// PORT: SOURCE P32-P35_P72-P75.agc:124
//#			P32 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:125
//#
// PORT: SOURCE P32-P35_P72-P75.agc:126
//#			P72 IF THIS VEHICLE IS THE PASSIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:127
//#
// PORT: SOURCE P32-P35_P72-P75.agc:128
//# INPUT
// PORT: SOURCE P32-P35_P72-P75.agc:129
//
// PORT: SOURCE P32-P35_P72-P75.agc:130
//#	(1)	TCSI		TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:131
//
// PORT: SOURCE P32-P35_P72-P75.agc:132
//# Page 620
// PORT: SOURCE P32-P35_P72-P75.agc:133
//#	(2)	NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// PORT: SOURCE P32-P35_P72-P75.agc:134
//#				VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// PORT: SOURCE P32-P35_P72-P75.agc:135
//#				MANEUVER POINT.
// PORT: SOURCE P32-P35_P72-P75.agc:136
//#	(3)	ELEV		DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P35_P72-P75.agc:137
//#	(4)	TTPI		TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:138
//#
// PORT: SOURCE P32-P35_P72-P75.agc:139
//# OUTPUT
// PORT: SOURCE P32-P35_P72-P75.agc:140
//
// PORT: SOURCE P32-P35_P72-P75.agc:141
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P32-P35_P72-P75.agc:142
//#	(2)	TTOGO		TIME TO GO
// PORT: SOURCE P32-P35_P72-P75.agc:143
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// PORT: SOURCE P32-P35_P72-P75.agc:144
//#	(4)	DIFFALT		DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P35_P72-P75.agc:145
//#	(5)	T1TOT2		DELTA TIME FROM CSI TO CDH
// PORT: SOURCE P32-P35_P72-P75.agc:146
//#	(6)	T2TOT3		DELTA TIME FROM CDH TO TPI
// PORT: SOURCE P32-P35_P72-P75.agc:147
//#	(7)	DELVLVC		DELTA VELOCITY AT CSI -- LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:148
//#	(8)	DELVLVC		DELTA VELOCITY AT CDH -- LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:149
//#
// PORT: SOURCE P32-P35_P72-P75.agc:150
//# DOWNLINK
// PORT: SOURCE P32-P35_P72-P75.agc:151
//
// PORT: SOURCE P32-P35_P72-P75.agc:152
//#	(1)	TCSI		TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:153
//#	(2)	TCDH		TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:154
//#	(3)	TTPI		TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:155
//#	(4)	TIG		TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:156
//#	(5)	DELVEET1	DELTA VELOCITY AT CSI -- REFERENCE COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:157
//#	(6)	DELVEET2	DELTA VELOCITY AT CDH -- REFERENCE COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:158
//#	(7)	DIFFALT		DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P35_P72-P75.agc:159
//#	(8)	NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// PORT: SOURCE P32-P35_P72-P75.agc:160
//#				VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// PORT: SOURCE P32-P35_P72-P75.agc:161
//#				MANEUVER POINT
// PORT: SOURCE P32-P35_P72-P75.agc:162
//#	(9)	ELEV		DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P35_P72-P75.agc:163
//#
// PORT: SOURCE P32-P35_P72-P75.agc:164
//# COMMUNICATION TO THRUSTING PROGRAM
// PORT: SOURCE P32-P35_P72-P75.agc:165
//
// PORT: SOURCE P32-P35_P72-P75.agc:166
//#	(1)	TIG		TIME OF THE CSI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:167
//#	(2)	RTIG		POSITION OF ACTIVE VEHICLE AT CSI -- BEFORE ROTATION
// PORT: SOURCE P32-P35_P72-P75.agc:168
//#				INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P35_P72-P75.agc:169
//#	(3)	VTIG		VELOCITY OF ACTIVE VEHICLE AT CSE -- BEFORE ROTATION
// PORT: SOURCE P32-P35_P72-P75.agc:170
//#				INTO PLANE OF PASSIVE VEHICLE
// PORT: SOURCE P32-P35_P72-P75.agc:171
//#	(4)	DELVSIN		DELTA VELOCITY AT CSI -- REFERENCE COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:172
//#	(5)	DELVSAB		MAGNITUDE OF DELTA VELOCITY AT CSI
// PORT: SOURCE P32-P35_P72-P75.agc:173
//#	(6)	XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// PORT: SOURCE P32-P35_P72-P75.agc:174
//#
// PORT: SOURCE P32-P35_P72-P75.agc:175
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:176
//
// PORT: SOURCE P32-P35_P72-P75.agc:177
//#	AVFLAGA
// PORT: SOURCE P32-P35_P72-P75.agc:178
//#	AVFLAGP
// PORT: SOURCE P32-P35_P72-P75.agc:179
//#	P20FLGON
// PORT: SOURCE P32-P35_P72-P75.agc:180
//#	VARALARM
// PORT: SOURCE P32-P35_P72-P75.agc:181
//#	BANKCALL
// PORT: SOURCE P32-P35_P72-P75.agc:182
//#	GOFLASH
// PORT: SOURCE P32-P35_P72-P75.agc:183
//#	GOTOPOOH
// PORT: SOURCE P32-P35_P72-P75.agc:184
//# Page 621
// PORT: SOURCE P32-P35_P72-P75.agc:185
//#	VNPOOH
// PORT: SOURCE P32-P35_P72-P75.agc:186
//#	GOFLASHR
// PORT: SOURCE P32-P35_P72-P75.agc:187
//#	BLANKET
// PORT: SOURCE P32-P35_P72-P75.agc:188
//#	ENDOFJOB
// PORT: SOURCE P32-P35_P72-P75.agc:189
//#	SELECTMU
// PORT: SOURCE P32-P35_P72-P75.agc:190
//#	ADVANCE
// PORT: SOURCE P32-P35_P72-P75.agc:191
//#	INTINT
// PORT: SOURCE P32-P35_P72-P75.agc:192
//#	PASSIVE
// PORT: SOURCE P32-P35_P72-P75.agc:193
//#	CSI/A
// PORT: SOURCE P32-P35_P72-P75.agc:194
//#	S32/33.1
// PORT: SOURCE P32-P35_P72-P75.agc:195
//#	DISDVLVC
// PORT: SOURCE P32-P35_P72-P75.agc:196
//#	VN1645
// PORT: SOURCE P32-P35_P72-P75.agc:197
//
// PORT: SOURCE P32-P35_P72-P75.agc:198
//		BANK	35
// PORT: SOURCE P32-P35_P72-P75.agc:199
//		SETLOC	CSI/CDH
// PORT: SOURCE P32-P35_P72-P75.agc:200
//		BANK
// PORT: SOURCE P32-P35_P72-P75.agc:201
//		EBANK=	SUBEXIT
// PORT: SOURCE P32-P35_P72-P75.agc:202
//		COUNT*	$$/P3272
// PORT: SOURCE P32-P35_P72-P75.agc:203
//P32		TC	AVFLAGA
// PORT: Fixed ROM slots 31767.
            if slot <> 31767 or instruction <> 1255 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1255, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31768 {
// PORT: SOURCE P32-P35_P72-P75.agc:204
//		TC	P32STRT
// PORT: Fixed ROM slots 31768.
                if slot <> 31768 or instruction <> 1050 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1050, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:205
//P72		TC	AVFLAGP
// PORT: Fixed ROM slots 31769.
                if slot <> 31769 or instruction <> 1260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1260, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31771 {
            if slot <= 31770 {
// PORT: SOURCE P32-P35_P72-P75.agc:206
//P32STRT		EXTEND
// PORT: Fixed ROM slots 31770.
                if slot <> 31770 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:207
//		DCA	P30ZERO
// PORT: Fixed ROM slots 31771.
                if slot <> 31771 or instruction <> 13584 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1296, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31772 {
// PORT: SOURCE P32-P35_P72-P75.agc:208
//		DXCH	CENTANG
// PORT: Fixed ROM slots 31772.
                if slot <> 31772 or instruction <> 22417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 913, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:209
//		TC	P32/P72A
// PORT: Fixed ROM slots 31773.
                if slot <> 31773 or instruction <> 1067 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1067, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2014] to agcAotUnit2014@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:210
//ALMXITA		SXA,2
// PORT: Fixed ROM slots 31774.
    31774, 65464,
// PORT: SOURCE P32-P35_P72-P75.agc:211
//			CSIALRM
// PORT: Fixed ROM slots 31775.
    31775, 3862,
// PORT: SOURCE P32-P35_P72-P75.agc:212
//ALMXIT		LXC,1
// PORT: Fixed ROM slots 31776.
    31776, 65472,
// PORT: SOURCE P32-P35_P72-P75.agc:213
//			CSIALRM
// PORT: Fixed ROM slots 31777.
    31777, 3862,
// PORT: SOURCE P32-P35_P72-P75.agc:214
//		SLOAD*	EXIT
// PORT: Fixed ROM slots 31778.
    31778, 65206,
// PORT: SOURCE P32-P35_P72-P75.agc:215
//			ALARM/TB -1,1
// PORT: Fixed ROM slots 31779.
    31779, 27174
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31780–31783.
function agcAotUnit2015 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31781 {
        if slot <= 31780 {
// PORT: SOURCE P32-P35_P72-P75.agc:216
//		CA	MPAC
// PORT: Fixed ROM slots 31780.
            if slot <> 31780 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:217
//		TC	VARALARM
// PORT: Fixed ROM slots 31781.
            if slot <> 31781 or instruction <> 3044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31782 {
// PORT: SOURCE P32-P35_P72-P75.agc:218
//		CAF	V05N09
// PORT: Fixed ROM slots 31782.
            if slot <> 31782 or instruction <> 14854 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:219
//		TC	BANKCALL
// PORT: Fixed ROM slots 31783.
            if slot <> 31783 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2015] to agcAotUnit2015@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:220
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31784.
    31784, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31785–31794.
function agcAotUnit2016 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31789 {
        if slot <= 31786 {
            if slot <= 31785 {
// PORT: SOURCE P32-P35_P72-P75.agc:221
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 31785.
                if slot <> 31785 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:222
//		TC	-4
// PORT: Fixed ROM slots 31786.
                if slot <> 31786 or instruction <> 1062 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1062, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31787 {
// PORT: SOURCE P32-P35_P72-P75.agc:223
//P32/P72A	TC	P20FLGON
// PORT: Fixed ROM slots 31787.
                if slot <> 31787 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31788 {
// PORT: SOURCE P32-P35_P72-P75.agc:224
//		CAF	P30ZERO
// PORT: Fixed ROM slots 31788.
                    if slot <> 31788 or instruction <> 13583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1295), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P32-P35_P72-P75.agc:225
//		TS	NN 	+1
// PORT: Fixed ROM slots 31789.
                    if slot <> 31789 or instruction <> 23351 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23351, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31791 {
            if slot <= 31790 {
// PORT: SOURCE P32-P35_P72-P75.agc:226
//		TS	TCSI
// PORT: Fixed ROM slots 31790.
                if slot <> 31790 or instruction <> 23451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23451, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:227
//		TS	TCSI 	+1
// PORT: Fixed ROM slots 31791.
                if slot <> 31791 or instruction <> 23452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23452, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31792 {
// PORT: SOURCE P32-P35_P72-P75.agc:228
//VN0611		CAF	V06N11		# TCSI
// PORT: Fixed ROM slots 31792.
                if slot <> 31792 or instruction <> 13576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1288), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31793 {
// PORT: SOURCE P32-P35_P72-P75.agc:229
//		TC	VNPOOH
// PORT: Fixed ROM slots 31793.
                    if slot <> 31793 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P32-P35_P72-P75.agc:230
//		TC	INTPRET
// PORT: Fixed ROM slots 31794.
                    if slot <> 31794 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2016] to agcAotUnit2016@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:231
//		DLOAD	DCOMP
// PORT: Fixed ROM slots 31795.
    31795, 48842,
// PORT: SOURCE P32-P35_P72-P75.agc:232
//			TCSI
// PORT: Fixed ROM slots 31796.
    31796, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:233
//		BMN	DLOAD
// PORT: Fixed ROM slots 31797.
    31797, 58688,
// PORT: SOURCE P32-P35_P72-P75.agc:234
//			VN0655
// PORT: Fixed ROM slots 31798.
    31798, 59542,
// PORT: SOURCE P32-P35_P72-P75.agc:235
//# Page 622
// PORT: SOURCE P32-P35_P72-P75.agc:236
//			TETLEM
// PORT: Fixed ROM slots 31799.
    31799, 1862,
// PORT: SOURCE P32-P35_P72-P75.agc:237
//		STCALL	TDEC1
// PORT: Fixed ROM slots 31800.
    31800, 28738,
// PORT: SOURCE P32-P35_P72-P75.agc:238
//			PRECSET
// PORT: Fixed ROM slots 31801.
    31801, 39392,
// PORT: SOURCE P32-P35_P72-P75.agc:239
//		VLOAD	VSR*
// PORT: Fixed ROM slots 31802.
    31802, 45050,
// PORT: SOURCE P32-P35_P72-P75.agc:240
//			RACT3
// PORT: Fixed ROM slots 31803.
    31803, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:241
//			0,2
// PORT: Fixed ROM slots 31804.
    31804, 48380,
// PORT: SOURCE P32-P35_P72-P75.agc:242
//		STOVL	RVEC
// PORT: Fixed ROM slots 31805.
    31805, 23386,
// PORT: SOURCE P32-P35_P72-P75.agc:243
//			VACT3
// PORT: Fixed ROM slots 31806.
    31806, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:244
//		VSR*	SET
// PORT: Fixed ROM slots 31807.
    31807, 35934,
// PORT: SOURCE P32-P35_P72-P75.agc:245
//			0,2
// PORT: Fixed ROM slots 31808.
    31808, 48380,
// PORT: SOURCE P32-P35_P72-P75.agc:246
//			RVSW
// PORT: Fixed ROM slots 31809.
    31809, 3692,
// PORT: SOURCE P32-P35_P72-P75.agc:247
//		STODL	VVEC
// PORT: Fixed ROM slots 31810.
    31810, 15304,
// PORT: SOURCE P32-P35_P72-P75.agc:248
//			DPPOSMAX
// PORT: Fixed ROM slots 31811.
    31811, 6832,
// PORT: SOURCE P32-P35_P72-P75.agc:249
//		STCALL	RDESIRED
// PORT: Fixed ROM slots 31812.
    31812, 31708,
// PORT: SOURCE P32-P35_P72-P75.agc:250
//			TIMERAD
// PORT: Fixed ROM slots 31813.
    31813, 22222,
// PORT: SOURCE P32-P35_P72-P75.agc:251
//		DAD
// PORT: Fixed ROM slots 31814.
    31814, 65306,
// PORT: SOURCE P32-P35_P72-P75.agc:252
//			TDEC2
// PORT: Fixed ROM slots 31815.
    31815, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:253
//		STORE	TCSI
// PORT: Fixed ROM slots 31816.
    31816, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:254
//		EXIT
// PORT: Fixed ROM slots 31817.
    31817, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31818–31818.
function agcAotUnit2017 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:255
//		TC	VN0611
// PORT: Fixed ROM slots 31818.
    if slot <> 31818 or instruction <> 1072 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1072, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2017] to agcAotUnit2017@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:256
//VN0655		EXIT
// PORT: Fixed ROM slots 31819.
    31819, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31820–31821.
function agcAotUnit2018 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31820 {
// PORT: SOURCE P32-P35_P72-P75.agc:257
//		CAF	V06N55		# NN, ELEV(RGLOS)
// PORT: Fixed ROM slots 31820.
        if slot <> 31820 or instruction <> 14292 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2004), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P32-P35_P72-P75.agc:258
//		TC	BANKCALL
// PORT: Fixed ROM slots 31821.
        if slot <> 31821 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2018] to agcAotUnit2018@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:259
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31822.
    31822, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31823–31828.
function agcAotUnit2019 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31825 {
        if slot <= 31823 {
// PORT: SOURCE P32-P35_P72-P75.agc:260
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 31823.
            if slot <> 31823 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31824 {
// PORT: SOURCE P32-P35_P72-P75.agc:261
//		TC	+2
// PORT: Fixed ROM slots 31824.
                if slot <> 31824 or instruction <> 1106 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1106, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:262
//		TC	-5
// PORT: Fixed ROM slots 31825.
                if slot <> 31825 or instruction <> 1100 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1100, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31826 {
// PORT: SOURCE P32-P35_P72-P75.agc:263
//		CAF	V06N37		# TTPI
// PORT: Fixed ROM slots 31826.
            if slot <> 31826 or instruction <> 14291 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2003), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31827 {
// PORT: SOURCE P32-P35_P72-P75.agc:264
//		TC	VNPOOH
// PORT: Fixed ROM slots 31827.
                if slot <> 31827 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:265
//		TC	INTPRET
// PORT: Fixed ROM slots 31828.
                if slot <> 31828 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2019] to agcAotUnit2019@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:266
//		DLOAD
// PORT: Fixed ROM slots 31829.
    31829, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:267
//			TCSI
// PORT: Fixed ROM slots 31830.
    31830, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:268
//		STCALL	TIG
// PORT: Fixed ROM slots 31831.
    31831, 32324,
// PORT: SOURCE P32-P35_P72-P75.agc:269
//			SELECTMU
// PORT: Fixed ROM slots 31832.
    31832, 16384,
// PORT: SOURCE P32-P35_P72-P75.agc:270
//P32/P72B	CALL
// PORT: Fixed ROM slots 31833.
    31833, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:271
//			ADVANCE
// PORT: Fixed ROM slots 31834.
    31834, 58396,
// PORT: SOURCE P32-P35_P72-P75.agc:272
//		SETPD	VLOAD
// PORT: Fixed ROM slots 31835.
    31835, 64770,
// PORT: SOURCE P32-P35_P72-P75.agc:273
//			0D
// PORT: Fixed ROM slots 31836.
    31836, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:274
//			VPASS1
// PORT: Fixed ROM slots 31837.
    31837, 3724,
// PORT: SOURCE P32-P35_P72-P75.agc:275
//		PDVL	PDDL
// PORT: Fixed ROM slots 31838.
    31838, 54682,
// PORT: SOURCE P32-P35_P72-P75.agc:276
//			RPASS1
// PORT: Fixed ROM slots 31839.
    31839, 3712,
// PORT: SOURCE P32-P35_P72-P75.agc:277
//			TCSI
// PORT: Fixed ROM slots 31840.
    31840, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:278
//		PDDL	PDDL
// PORT: Fixed ROM slots 31841.
    31841, 54698,
// PORT: SOURCE P32-P35_P72-P75.agc:279
//			TTPI
// PORT: Fixed ROM slots 31842.
    31842, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:280
//			TWOPI
// PORT: Fixed ROM slots 31843.
    31843, 28596,
// PORT: SOURCE P32-P35_P72-P75.agc:281
//		PUSH	CALL
// PORT: Fixed ROM slots 31844.
    31844, 37900,
// PORT: SOURCE P32-P35_P72-P75.agc:282
//			INTINT
// PORT: Fixed ROM slots 31845.
    31845, 61036,
// PORT: SOURCE P32-P35_P72-P75.agc:283
//		CALL
// PORT: Fixed ROM slots 31846.
    31846, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:284
//			PASSIVE
// PORT: Fixed ROM slots 31847.
    31847, 39444,
// PORT: SOURCE P32-P35_P72-P75.agc:285
//		CALL
// PORT: Fixed ROM slots 31848.
    31848, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:286
//# Page 623
// PORT: SOURCE P32-P35_P72-P75.agc:287
//			CSI/A
// PORT: Fixed ROM slots 31849.
    31849, 57494,
// PORT: SOURCE P32-P35_P72-P75.agc:288
//P32/P72C	BON	SET
// PORT: Fixed ROM slots 31850.
    31850, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:289
//			FINALFLG
// PORT: Fixed ROM slots 31851.
    31851, 1426,
// PORT: SOURCE P32-P35_P72-P75.agc:290
//			P32/P72D
// PORT: Fixed ROM slots 31852.
    31852, 59612,
// PORT: SOURCE P32-P35_P72-P75.agc:291
//			UPDATFLG
// PORT: Fixed ROM slots 31853.
    31853, 624,
// PORT: SOURCE P32-P35_P72-P75.agc:292
//P32/P72D	DLOAD
// PORT: Fixed ROM slots 31854.
    31854, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:293
//			T1TOT2
// PORT: Fixed ROM slots 31855.
    31855, 2390,
// PORT: SOURCE P32-P35_P72-P75.agc:294
//P32/P72E	STORE	T1TOT2
// PORT: Fixed ROM slots 31856.
    31856, 2390,
// PORT: SOURCE P32-P35_P72-P75.agc:295
//		DSU	BPL
// PORT: Fixed ROM slots 31857.
    31857, 42026,
// PORT: SOURCE P32-P35_P72-P75.agc:296
//			60MIN
// PORT: Fixed ROM slots 31858.
    31858, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:297
//			P32/P72E
// PORT: Fixed ROM slots 31859.
    31859, 59616,
// PORT: SOURCE P32-P35_P72-P75.agc:298
//		DLOAD
// PORT: Fixed ROM slots 31860.
    31860, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:299
//			T2TOT3
// PORT: Fixed ROM slots 31861.
    31861, 2394,
// PORT: SOURCE P32-P35_P72-P75.agc:300
//P32/P72F	STORE	T2TOT3
// PORT: Fixed ROM slots 31862.
    31862, 2394,
// PORT: SOURCE P32-P35_P72-P75.agc:301
//		DSU	BPL
// PORT: Fixed ROM slots 31863.
    31863, 42026,
// PORT: SOURCE P32-P35_P72-P75.agc:302
//			60MIN
// PORT: Fixed ROM slots 31864.
    31864, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:303
//			P32/P72F
// PORT: Fixed ROM slots 31865.
    31865, 59628,
// PORT: SOURCE P32-P35_P72-P75.agc:304
//		EXIT
// PORT: Fixed ROM slots 31866.
    31866, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31867–31869.
function agcAotUnit2020 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31867 {
// PORT: SOURCE P32-P35_P72-P75.agc:305
//		CAF	V06N75
// PORT: Fixed ROM slots 31867.
        if slot <> 31867 or instruction <> 13578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1290), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31868 {
// PORT: SOURCE P32-P35_P72-P75.agc:306
//		TC	VNPOOH
// PORT: Fixed ROM slots 31868.
            if slot <> 31868 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:307
//		TC	INTPRET
// PORT: Fixed ROM slots 31869.
            if slot <> 31869 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2020] to agcAotUnit2020@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:308
//		VLOAD	CALL
// PORT: Fixed ROM slots 31870.
    31870, 38138,
// PORT: SOURCE P32-P35_P72-P75.agc:309
//			DELVEET1
// PORT: Fixed ROM slots 31871.
    31871, 2414,
// PORT: SOURCE P32-P35_P72-P75.agc:310
//			S32/33.1
// PORT: Fixed ROM slots 31872.
    31872, 58496,
// PORT: SOURCE P32-P35_P72-P75.agc:311
//		STOVL	DELVEET1
// PORT: Fixed ROM slots 31873.
    31873, 22894,
// PORT: SOURCE P32-P35_P72-P75.agc:312
//			RACT2
// PORT: Fixed ROM slots 31874.
    31874, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:313
//		STOVL	RACT1
// PORT: Fixed ROM slots 31875.
    31875, 22918,
// PORT: SOURCE P32-P35_P72-P75.agc:314
//			DELVEET2
// PORT: Fixed ROM slots 31876.
    31876, 2426,
// PORT: SOURCE P32-P35_P72-P75.agc:315
//		AXT,1	CALL
// PORT: Fixed ROM slots 31877.
    31877, 38128,
// PORT: SOURCE P32-P35_P72-P75.agc:316
//		VN	0682
// PORT: Fixed ROM slots 31878.
    31878, 1700,
// PORT: SOURCE P32-P35_P72-P75.agc:317
//			DISDVLVC
// PORT: Fixed ROM slots 31879.
    31879, 59888,
// PORT: SOURCE P32-P35_P72-P75.agc:318
//		DLOAD
// PORT: Fixed ROM slots 31880.
    31880, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:319
//			TTPI
// PORT: Fixed ROM slots 31881.
    31881, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:320
//		STCALL	TTPIO
// PORT: Fixed ROM slots 31882.
    31882, 32576,
// PORT: SOURCE P32-P35_P72-P75.agc:321
//			VN1645
// PORT: Fixed ROM slots 31883.
    31883, 61196,
// PORT: SOURCE P32-P35_P72-P75.agc:322
//		GOTO
// PORT: Fixed ROM slots 31884.
    31884, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:323
//			P32/P72B
// PORT: Fixed ROM slots 31885.
    31885, 59570
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31886–31892.
function agcAotUnit2021 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31888 {
        if slot <= 31886 {
// PORT: SOURCE P32-P35_P72-P75.agc:324
//
// PORT: SOURCE P32-P35_P72-P75.agc:325
//# Page 624
// PORT: SOURCE P32-P35_P72-P75.agc:326
//# CONSTANT DELTA HEIGHT (CDH) PROGRAMS (P33 AND P73)
// PORT: SOURCE P32-P35_P72-P75.agc:327
//# MOD NO -1			LOC SECTION -- P32-P35, P72-P75
// PORT: SOURCE P32-P35_P72-P75.agc:328
//# MOD BY WHITE, P.		DATE: 1 JUNE 67
// PORT: SOURCE P32-P35_P72-P75.agc:329
//#
// PORT: SOURCE P32-P35_P72-P75.agc:330
//# PURPOSE
// PORT: SOURCE P32-P35_P72-P75.agc:331
//#
// PORT: SOURCE P32-P35_P72-P75.agc:332
//#	(1)	TO CALCULATE PARAMETERS ASSOCIATED WITH THE CONSTANT DELTA
// PORT: SOURCE P32-P35_P72-P75.agc:333
//#		ALTITUDE MANEUVER (CDH).
// PORT: SOURCE P32-P35_P72-P75.agc:334
//#
// PORT: SOURCE P32-P35_P72-P75.agc:335
//#	(2)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// PORT: SOURCE P32-P35_P72-P75.agc:336
//#		APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// PORT: SOURCE P32-P35_P72-P75.agc:337
//#
// PORT: SOURCE P32-P35_P72-P75.agc:338
//#	(3)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND DEPENDENT VARIABLES
// PORT: SOURCE P32-P35_P72-P75.agc:339
//#		ASSOCIATED WITH THE CDH MANEUVER FOR APPROVAL BY THE
// PORT: SOURCE P32-P35_P72-P75.agc:340
//#		ASTRONAUT/GROUND.
// PORT: SOURCE P32-P35_P72-P75.agc:341
//#
// PORT: SOURCE P32-P35_P72-P75.agc:342
//#	(4)	TO STORE THE CDH TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P32-P35_P72-P75.agc:343
//#		THRUSTING PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:344
//#
// PORT: SOURCE P32-P35_P72-P75.agc:345
//# ASSUMPTIONS
// PORT: SOURCE P32-P35_P72-P75.agc:346
//#
// PORT: SOURCE P32-P35_P72-P75.agc:347
//#	(1)	THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF THE
// PORT: SOURCE P32-P35_P72-P75.agc:348
//#		CO-ELLIPTIC SEQUENCE INITIATION (CSI) PROGRAM (P32/P72).
// PORT: SOURCE P32-P35_P72-P75.agc:349
//#		THEREFORE --
// PORT: SOURCE P32-P35_P72-P75.agc:350
//#
// PORT: SOURCE P32-P35_P72-P75.agc:351
//#		(A)	AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// PORT: SOURCE P32-P35_P72-P75.agc:352
//#			BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// PORT: SOURCE P32-P35_P72-P75.agc:353
//#			A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// PORT: SOURCE P32-P35_P72-P75.agc:354
//#			HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// PORT: SOURCE P32-P35_P72-P75.agc:355
//#
// PORT: SOURCE P32-P35_P72-P75.agc:356
//#		(B)	THE TIME BETWEEN CSI IGNITION AND CDH IGNITION WAS
// PORT: SOURCE P32-P35_P72-P75.agc:357
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// PORT: SOURCE P32-P35_P72-P75.agc:358
//#
// PORT: SOURCE P32-P35_P72-P75.agc:359
//#		(C)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// PORT: SOURCE P32-P35_P72-P75.agc:360
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// PORT: SOURCE P32-P35_P72-P75.agc:361
//#
// PORT: SOURCE P32-P35_P72-P75.agc:362
//#		(D)	THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// PORT: SOURCE P32-P35_P72-P75.agc:363
//#			ORBITS WAS MINIMIZED.
// PORT: SOURCE P32-P35_P72-P75.agc:364
//#
// PORT: SOURCE P32-P35_P72-P75.agc:365
//#		(E)	CSI BURN WAS DEFINED SUCH THAT THE IMPULSIVE DELTA V WAS
// PORT: SOURCE P32-P35_P72-P75.agc:366
//#			IN THE HORIZONTAL PLANE DEFINED BY ACTIVE VEHICLE
// PORT: SOURCE P32-P35_P72-P75.agc:367
//#			POSITION AT CSI IGNITION.
// PORT: SOURCE P32-P35_P72-P75.agc:368
//#
// PORT: SOURCE P32-P35_P72-P75.agc:369
//#		(F) 	THE PERICENTER ALTITUDES OF THE ORBITS FOLLOWING CSI AND
// PORT: SOURCE P32-P35_P72-P75.agc:370
//#			CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// PORT: SOURCE P32-P35_P72-P75.agc:371
//#			ORBIT OR 85 NM FOR EARTH ORBIT.
// PORT: SOURCE P32-P35_P72-P75.agc:372
//#
// PORT: SOURCE P32-P35_P72-P75.agc:373
//#		(G)	THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// PORT: SOURCE P32-P35_P72-P75.agc:374
//#			THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// PORT: SOURCE P32-P35_P72-P75.agc:375
//# Page 625
// PORT: SOURCE P32-P35_P72-P75.agc:376
//#			MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// PORT: SOURCE P32-P35_P72-P75.agc:377
//#			IN AN OUT-OF-PLANE MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:378
//#
// PORT: SOURCE P32-P35_P72-P75.agc:379
//#	(2)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P32-P35_P72-P75.agc:380
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 4).
// PORT: SOURCE P32-P35_P72-P75.agc:381
//#
// PORT: SOURCE P32-P35_P72-P75.agc:382
//#	(3)	COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// PORT: SOURCE P32-P35_P72-P75.agc:383
//#		THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// PORT: SOURCE P32-P35_P72-P75.agc:384
//#		ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// PORT: SOURCE P32-P35_P72-P75.agc:385
//#		EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// PORT: SOURCE P32-P35_P72-P75.agc:386
//#
// PORT: SOURCE P32-P35_P72-P75.agc:387
//#	(4)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM.
// PORT: SOURCE P32-P35_P72-P75.agc:388
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// PORT: SOURCE P32-P35_P72-P75.agc:389
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// PORT: SOURCE P32-P35_P72-P75.agc:390
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// PORT: SOURCE P32-P35_P72-P75.agc:391
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// PORT: SOURCE P32-P35_P72-P75.agc:392
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// PORT: SOURCE P32-P35_P72-P75.agc:393
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// PORT: SOURCE P32-P35_P72-P75.agc:394
//#		THRUSTING MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:395
//#
// PORT: SOURCE P32-P35_P72-P75.agc:396
//#	(5)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:397
//#
// PORT: SOURCE P32-P35_P72-P75.agc:398
//#	(6)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// PORT: SOURCE P32-P35_P72-P75.agc:399
//#
// PORT: SOURCE P32-P35_P72-P75.agc:400
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P32-P35_P72-P75.agc:401
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P32-P35_P72-P75.agc:402
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P32-P35_P72-P75.agc:403
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:404
//#
// PORT: SOURCE P32-P35_P72-P75.agc:405
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P32-P35_P72-P75.agc:406
//#			COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// PORT: SOURCE P32-P35_P72-P75.agc:407
//#			CYCLE.
// PORT: SOURCE P32-P35_P72-P75.agc:408
//#
// PORT: SOURCE P32-P35_P72-P75.agc:409
//#			EXTERNAL DELTA V STEERING FLAG -- DESIGNATES THE TYPE OF
// PORT: SOURCE P32-P35_P72-P75.agc:410
//#			STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// PORT: SOURCE P32-P35_P72-P75.agc:411
//#			THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// PORT: SOURCE P32-P35_P72-P75.agc:412
//#			PROGRAM.
// PORT: SOURCE P32-P35_P72-P75.agc:413
//#
// PORT: SOURCE P32-P35_P72-P75.agc:414
//#	(7)	IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// PORT: SOURCE P32-P35_P72-P75.agc:415
//#		A THRUSTING MANEUVER.
// PORT: SOURCE P32-P35_P72-P75.agc:416
//#
// PORT: SOURCE P32-P35_P72-P75.agc:417
//#	(8)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY.
// PORT: SOURCE P32-P35_P72-P75.agc:418
//#
// PORT: SOURCE P32-P35_P72-P75.agc:419
//#			P33 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:420
//#
// PORT: SOURCE P32-P35_P72-P75.agc:421
//#			P73 IF THIS VEHICLE IS PASSIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:422
//#
// PORT: SOURCE P32-P35_P72-P75.agc:423
//# INPUT
// PORT: SOURCE P32-P35_P72-P75.agc:424
//#
// PORT: SOURCE P32-P35_P72-P75.agc:425
//#	(1)	TTPIO	TIME OF THE TPI MANEUVER -- SAVED FROM P32/P72
// PORT: SOURCE P32-P35_P72-P75.agc:426
//# Page 626
// PORT: SOURCE P32-P35_P72-P75.agc:427
//#	(2)	ELEV	DESIRED LOS ANGLE AT TPI -- SAVED FROM P32/P72
// PORT: SOURCE P32-P35_P72-P75.agc:428
//#	(3)	TCDH	TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:429
//#
// PORT: SOURCE P32-P35_P72-P75.agc:430
//# OUTPUT
// PORT: SOURCE P32-P35_P72-P75.agc:431
//#
// PORT: SOURCE P32-P35_P72-P75.agc:432
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P32-P35_P72-P75.agc:433
//#	(2)	TTOGO		TIME TO GO
// PORT: SOURCE P32-P35_P72-P75.agc:434
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// PORT: SOURCE P32-P35_P72-P75.agc:435
//#	(4)	DIFFALT		DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P35_P72-P75.agc:436
//#	(5)	T2TOT3		DELTA TIME FROM CDH TO COMPUTED TPI
// PORT: SOURCE P32-P35_P72-P75.agc:437
//#	(6)	NOMTPI		DELTA TIME FROM NOMINAL TPI TO COMPUTED TPI
// PORT: SOURCE P32-P35_P72-P75.agc:438
//#	(7)	DELVLVC		DELTA VELOCITY AT CDH -- LOCAL VERTICAL COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:439
//#
// PORT: SOURCE P32-P35_P72-P75.agc:440
//# DOWNLINK
// PORT: SOURCE P32-P35_P72-P75.agc:441
//#
// PORT: SOURCE P32-P35_P72-P75.agc:442
//#	(1)	TCDH		TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:443
//#	(2)	TTPI		TIME OF THE TPI MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:444
//#	(3)	TIG		TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:445
//#	(4)	DELLVEET2	DELTA VELOCITY AT CDH -- REFERENCE COORDINATES
// PORT: SOURCE P32-P35_P72-P75.agc:446
//#	(5)	DIFFALT		DELTA ALTITUDE AT CDH
// PORT: SOURCE P32-P35_P72-P75.agc:447
//#	(6)	ELEV		DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P32-P35_P72-P75.agc:448
//#
// PORT: SOURCE P32-P35_P72-P75.agc:449
//# COMMUNICATION TO THRUSTING PROGRAMS
// PORT: SOURCE P32-P35_P72-P75.agc:450
//#
// PORT: SOURCE P32-P35_P72-P75.agc:451
//#	(1)	TIG		TIME OF THE CDH MANEUVER
// PORT: SOURCE P32-P35_P72-P75.agc:452
//#	(2)	RTIG		POSITION OF ACTIVE VEHICLE AT CDH -- BEFORE ROTATION
// PORT: SOURCE P32-P35_P72-P75.agc:453
//#				INTO PLANE OF PASSIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:454
//#	(3)	VTIG		VELOCITY OF ACTIVE VEHICLE AT CDH -- BEFORE ROTATION
// PORT: SOURCE P32-P35_P72-P75.agc:455
//#				INTO PLANE OF PASSIVE VEHICLE.
// PORT: SOURCE P32-P35_P72-P75.agc:456
//#	(4)	DELVSIN		DELTA VELOCITY AT CDH -- REFERENCE COORDINATES.
// PORT: SOURCE P32-P35_P72-P75.agc:457
//#	(5)	DELVSAB		MAGNITUDE OF DELTA VELOCITY AT CDH.
// PORT: SOURCE P32-P35_P72-P75.agc:458
//#	(6)	XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION.
// PORT: SOURCE P32-P35_P72-P75.agc:459
//#
// PORT: SOURCE P32-P35_P72-P75.agc:460
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:461
//#
// PORT: SOURCE P32-P35_P72-P75.agc:462
//#	AVFLAGA
// PORT: SOURCE P32-P35_P72-P75.agc:463
//#	AVFLAGP
// PORT: SOURCE P32-P35_P72-P75.agc:464
//#	P20FLGON
// PORT: SOURCE P32-P35_P72-P75.agc:465
//#	VNPOOH
// PORT: SOURCE P32-P35_P72-P75.agc:466
//#	SELECTMU
// PORT: SOURCE P32-P35_P72-P75.agc:467
//#	ADVANCE
// PORT: SOURCE P32-P35_P72-P75.agc:468
//#	CDHMVR
// PORT: SOURCE P32-P35_P72-P75.agc:469
//#	INTINT3P
// PORT: SOURCE P32-P35_P72-P75.agc:470
//#	ACTIVE
// PORT: SOURCE P32-P35_P72-P75.agc:471
//#	PASSIVE
// PORT: SOURCE P32-P35_P72-P75.agc:472
//#	S33/S34.1
// PORT: SOURCE P32-P35_P72-P75.agc:473
//#	ALARM
// PORT: SOURCE P32-P35_P72-P75.agc:474
//#	BANKCALL
// PORT: SOURCE P32-P35_P72-P75.agc:475
//#	GOFLASH
// PORT: SOURCE P32-P35_P72-P75.agc:476
//#	GOTOPOOH
// PORT: SOURCE P32-P35_P72-P75.agc:477
//#	S32/33.1
// PORT: SOURCE P32-P35_P72-P75.agc:478
//# Page 627
// PORT: SOURCE P32-P35_P72-P75.agc:479
//#	VN1645
// PORT: SOURCE P32-P35_P72-P75.agc:480
//
// PORT: SOURCE P32-P35_P72-P75.agc:481
//		COUNT*	$$/P3373
// PORT: SOURCE P32-P35_P72-P75.agc:482
//P33		TC	AVFLAGA
// PORT: Fixed ROM slots 31886.
            if slot <> 31886 or instruction <> 1255 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1255, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31887 {
// PORT: SOURCE P32-P35_P72-P75.agc:483
//		TC	P33/P73A
// PORT: Fixed ROM slots 31887.
                if slot <> 31887 or instruction <> 1169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:484
//P73		TC	AVFLAGP
// PORT: Fixed ROM slots 31888.
                if slot <> 31888 or instruction <> 1260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1260, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 31890 {
            if slot <= 31889 {
// PORT: SOURCE P32-P35_P72-P75.agc:485
//P33/P73A	TC	P20FLGON
// PORT: Fixed ROM slots 31889.
                if slot <> 31889 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:486
//		CAF	V06N13		# TCDH
// PORT: Fixed ROM slots 31890.
                if slot <> 31890 or instruction <> 13577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1289), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31891 {
// PORT: SOURCE P32-P35_P72-P75.agc:487
//		TC	VNPOOH
// PORT: Fixed ROM slots 31891.
                if slot <> 31891 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:488
//		TC	INTPRET
// PORT: Fixed ROM slots 31892.
                if slot <> 31892 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2021] to agcAotUnit2021@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:489
//		DLOAD
// PORT: Fixed ROM slots 31893.
    31893, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:490
//			TTPIO
// PORT: Fixed ROM slots 31894.
    31894, 3904,
// PORT: SOURCE P32-P35_P72-P75.agc:491
//		STODL	TTPI
// PORT: Fixed ROM slots 31895.
    31895, 16188,
// PORT: SOURCE P32-P35_P72-P75.agc:492
//			TCDH
// PORT: Fixed ROM slots 31896.
    31896, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:493
//		STCALL	TIG
// PORT: Fixed ROM slots 31897.
    31897, 32324,
// PORT: SOURCE P32-P35_P72-P75.agc:494
//			SELECTMU
// PORT: Fixed ROM slots 31898.
    31898, 16384,
// PORT: SOURCE P32-P35_P72-P75.agc:495
//P33/P73B	CALL
// PORT: Fixed ROM slots 31899.
    31899, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:496
//			ADVANCE
// PORT: Fixed ROM slots 31900.
    31900, 58396,
// PORT: SOURCE P32-P35_P72-P75.agc:497
//		CALL
// PORT: Fixed ROM slots 31901.
    31901, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:498
//			CDHMVR
// PORT: Fixed ROM slots 31902.
    31902, 58550,
// PORT: SOURCE P32-P35_P72-P75.agc:499
//		SETPD	VLOAD
// PORT: Fixed ROM slots 31903.
    31903, 64770,
// PORT: SOURCE P32-P35_P72-P75.agc:500
//			0D
// PORT: Fixed ROM slots 31904.
    31904, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:501
//			VACT3
// PORT: Fixed ROM slots 31905.
    31905, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:502
//		PDVL	CALL
// PORT: Fixed ROM slots 31906.
    31906, 38042,
// PORT: SOURCE P32-P35_P72-P75.agc:503
//			RACT2
// PORT: Fixed ROM slots 31907.
    31907, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:504
//			INTINT3P
// PORT: Fixed ROM slots 31908.
    31908, 58482,
// PORT: SOURCE P32-P35_P72-P75.agc:505
//		CALL
// PORT: Fixed ROM slots 31909.
    31909, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:506
//			ACTIVE
// PORT: Fixed ROM slots 31910.
    31910, 39428,
// PORT: SOURCE P32-P35_P72-P75.agc:507
//		SETPD	VLOAD
// PORT: Fixed ROM slots 31911.
    31911, 64770,
// PORT: SOURCE P32-P35_P72-P75.agc:508
//			0D
// PORT: Fixed ROM slots 31912.
    31912, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:509
//			VPASS2
// PORT: Fixed ROM slots 31913.
    31913, 3760,
// PORT: SOURCE P32-P35_P72-P75.agc:510
//		PDVL	CALL
// PORT: Fixed ROM slots 31914.
    31914, 38042,
// PORT: SOURCE P32-P35_P72-P75.agc:511
//			RPASS2
// PORT: Fixed ROM slots 31915.
    31915, 3748,
// PORT: SOURCE P32-P35_P72-P75.agc:512
//			INTINT3P
// PORT: Fixed ROM slots 31916.
    31916, 58482,
// PORT: SOURCE P32-P35_P72-P75.agc:513
//		CALL
// PORT: Fixed ROM slots 31917.
    31917, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:514
//			PASSIVE
// PORT: Fixed ROM slots 31918.
    31918, 39444,
// PORT: SOURCE P32-P35_P72-P75.agc:515
//		DLOAD	SET
// PORT: Fixed ROM slots 31919.
    31919, 36042,
// PORT: SOURCE P32-P35_P72-P75.agc:516
//			P30ZERO
// PORT: Fixed ROM slots 31920.
    31920, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:517
//			ITSWICH
// PORT: Fixed ROM slots 31921.
    31921, 3680,
// PORT: SOURCE P32-P35_P72-P75.agc:518
//		STCALL	NOMTPI
// PORT: Fixed ROM slots 31922.
    31922, 31134,
// PORT: SOURCE P32-P35_P72-P75.agc:519
//			S33/34.1
// PORT: Fixed ROM slots 31923.
    31923, 60392,
// PORT: SOURCE P32-P35_P72-P75.agc:520
//		BZE	EXIT
// PORT: Fixed ROM slots 31924.
    31924, 65112,
// PORT: SOURCE P32-P35_P72-P75.agc:521
//			P33/P73C
// PORT: Fixed ROM slots 31925.
    31925, 59780
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31926–31926.
function agcAotUnit2022 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:522
//		TC	ALARM
// PORT: Fixed ROM slots 31926.
    if slot <> 31926 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2022] to agcAotUnit2022@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:523
//		OCT	611
// PORT: Fixed ROM slots 31927.
    31927, 786
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31928–31929.
function agcAotUnit2023 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31928 {
// PORT: SOURCE P32-P35_P72-P75.agc:524
//		CAF	V05N09
// PORT: Fixed ROM slots 31928.
        if slot <> 31928 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P32-P35_P72-P75.agc:525
//		TC	BANKCALL
// PORT: Fixed ROM slots 31929.
        if slot <> 31929 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2023] to agcAotUnit2023@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:526
//		CADR	GOFLASH
// PORT: Fixed ROM slots 31930.
    31930, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31931–31934.
function agcAotUnit2024 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31932 {
        if slot <= 31931 {
// PORT: SOURCE P32-P35_P72-P75.agc:527
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 31931.
            if slot <> 31931 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:528
//		TC	+2
// PORT: Fixed ROM slots 31932.
            if slot <> 31932 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31933 {
// PORT: SOURCE P32-P35_P72-P75.agc:529
//# Page 628
// PORT: SOURCE P32-P35_P72-P75.agc:530
//		TC	P33/P73A
// PORT: Fixed ROM slots 31933.
            if slot <> 31933 or instruction <> 1169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:531
//		TC	INTPRET
// PORT: Fixed ROM slots 31934.
            if slot <> 31934 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2024] to agcAotUnit2024@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:532
//		DLOAD
// PORT: Fixed ROM slots 31935.
    31935, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:533
//			P30ZERO
// PORT: Fixed ROM slots 31936.
    31936, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:534
//		STORE	NOMTPI
// PORT: Fixed ROM slots 31937.
    31937, 2462,
// PORT: SOURCE P32-P35_P72-P75.agc:535
//P33/P73C	BON	SET
// PORT: Fixed ROM slots 31938.
    31938, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:536
//			FINALFLG
// PORT: Fixed ROM slots 31939.
    31939, 1426,
// PORT: SOURCE P32-P35_P72-P75.agc:537
//			P33/P73D
// PORT: Fixed ROM slots 31940.
    31940, 59788,
// PORT: SOURCE P32-P35_P72-P75.agc:538
//			UPDATFLG
// PORT: Fixed ROM slots 31941.
    31941, 624,
// PORT: SOURCE P32-P35_P72-P75.agc:539
//P33/P73D	DLOAD	DAD
// PORT: Fixed ROM slots 31942.
    31942, 36298,
// PORT: SOURCE P32-P35_P72-P75.agc:540
//			NOMTPI
// PORT: Fixed ROM slots 31943.
    31943, 2462,
// PORT: SOURCE P32-P35_P72-P75.agc:541
//			TTPI
// PORT: Fixed ROM slots 31944.
    31944, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:542
//		STORE	TTPI
// PORT: Fixed ROM slots 31945.
    31945, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:543
//		DSU
// PORT: Fixed ROM slots 31946.
    31946, 65322,
// PORT: SOURCE P32-P35_P72-P75.agc:544
//			TCDH
// PORT: Fixed ROM slots 31947.
    31947, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:545
//P33/P73E	DSU	BPL
// PORT: Fixed ROM slots 31948.
    31948, 42026,
// PORT: SOURCE P32-P35_P72-P75.agc:546
//			60MIN
// PORT: Fixed ROM slots 31949.
    31949, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:547
//			P33/P73E
// PORT: Fixed ROM slots 31950.
    31950, 59800,
// PORT: SOURCE P32-P35_P72-P75.agc:548
//		DAD
// PORT: Fixed ROM slots 31951.
    31951, 65306,
// PORT: SOURCE P32-P35_P72-P75.agc:549
//			60MIN
// PORT: Fixed ROM slots 31952.
    31952, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:550
//		STODL	T1TOT2
// PORT: Fixed ROM slots 31953.
    31953, 14678,
// PORT: SOURCE P32-P35_P72-P75.agc:551
//			TTPI
// PORT: Fixed ROM slots 31954.
    31954, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:552
//		DSU	PUSH
// PORT: Fixed ROM slots 31955.
    31955, 34346,
// PORT: SOURCE P32-P35_P72-P75.agc:553
//			TTPIO
// PORT: Fixed ROM slots 31956.
    31956, 3904,
// PORT: SOURCE P32-P35_P72-P75.agc:554
//P33/P73F	ABS	DSU
// PORT: Fixed ROM slots 31957.
    31957, 38220,
// PORT: SOURCE P32-P35_P72-P75.agc:555
//			60MIN
// PORT: Fixed ROM slots 31958.
    31958, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:556
//		BPL	DAD
// PORT: Fixed ROM slots 31959.
    31959, 36168,
// PORT: SOURCE P32-P35_P72-P75.agc:557
//			P33/P73F
// PORT: Fixed ROM slots 31960.
    31960, 59818,
// PORT: SOURCE P32-P35_P72-P75.agc:558
//			60MIN
// PORT: Fixed ROM slots 31961.
    31961, 27172,
// PORT: SOURCE P32-P35_P72-P75.agc:559
//		SIGN	STADR
// PORT: Fixed ROM slots 31962.
    31962, 38634,
// PORT: SOURCE P32-P35_P72-P75.agc:560
//		STORE	T2TOT3
// PORT: Fixed ROM slots 31963.
    31963, 63140,
// PORT: SOURCE P32-P35_P72-P75.agc:561
//		EXIT
// PORT: Fixed ROM slots 31964.
    31964, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31965–31967.
function agcAotUnit2025 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31965 {
// PORT: SOURCE P32-P35_P72-P75.agc:562
//		CAF	V06N75
// PORT: Fixed ROM slots 31965.
        if slot <> 31965 or instruction <> 13578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1290), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31966 {
// PORT: SOURCE P32-P35_P72-P75.agc:563
//		TC	VNPOOH
// PORT: Fixed ROM slots 31966.
            if slot <> 31966 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:564
//		TC	INTPRET
// PORT: Fixed ROM slots 31967.
            if slot <> 31967 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2025] to agcAotUnit2025@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:565
//		VLOAD	CALL
// PORT: Fixed ROM slots 31968.
    31968, 38138,
// PORT: SOURCE P32-P35_P72-P75.agc:566
//			DELVEET2
// PORT: Fixed ROM slots 31969.
    31969, 2426,
// PORT: SOURCE P32-P35_P72-P75.agc:567
//			S32/33.1
// PORT: Fixed ROM slots 31970.
    31970, 58496,
// PORT: SOURCE P32-P35_P72-P75.agc:568
//		STCALL	DELVEET2
// PORT: Fixed ROM slots 31971.
    31971, 31098,
// PORT: SOURCE P32-P35_P72-P75.agc:569
//			VN1645
// PORT: Fixed ROM slots 31972.
    31972, 61196,
// PORT: SOURCE P32-P35_P72-P75.agc:570
//		GOTO
// PORT: Fixed ROM slots 31973.
    31973, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:571
//			P33/P73B
// PORT: Fixed ROM slots 31974.
    31974, 59702
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31975–31977.
function agcAotUnit2026 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31975 {
// PORT: SOURCE P32-P35_P72-P75.agc:572
//
// PORT: SOURCE P32-P35_P72-P75.agc:573
//# Page 629
// PORT: SOURCE P32-P35_P72-P75.agc:574
//# ***** ADFLAG/P *****
// PORT: SOURCE P32-P35_P72-P75.agc:575
//#
// PORT: SOURCE P32-P35_P72-P75.agc:576
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:577
//#
// PORT: SOURCE P32-P35_P72-P75.agc:578
//#	UPFLAG
// PORT: SOURCE P32-P35_P72-P75.agc:579
//#	DOWNFLAG
// PORT: SOURCE P32-P35_P72-P75.agc:580
//
// PORT: SOURCE P32-P35_P72-P75.agc:581
//AVFLAGA		EXTEND			# AVFLAG = LEM
// PORT: Fixed ROM slots 31975.
        if slot <> 31975 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31976 {
// PORT: SOURCE P32-P35_P72-P75.agc:582
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 31976.
            if slot <> 31976 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:583
//		TC	UPFLAG
// PORT: Fixed ROM slots 31977.
            if slot <> 31977 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2026] to agcAotUnit2026@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:584
//		ADRES	AVFLAG
// PORT: Fixed ROM slots 31978.
    31978, 80
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31979–31982.
function agcAotUnit2027 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31980 {
        if slot <= 31979 {
// PORT: SOURCE P32-P35_P72-P75.agc:585
//		TC	SUBEXIT
// PORT: Fixed ROM slots 31979.
            if slot <> 31979 or instruction <> 824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:586
//AVFLAGP		EXTEND			# AVFLAG = CSM
// PORT: Fixed ROM slots 31980.
            if slot <> 31980 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31981 {
// PORT: SOURCE P32-P35_P72-P75.agc:587
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 31981.
            if slot <> 31981 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:588
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 31982.
            if slot <> 31982 or instruction <> 2894 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2894, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2027] to agcAotUnit2027@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:589
//		ADRES	AVFLAG
// PORT: Fixed ROM slots 31983.
    31983, 80
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31984–31987.
function agcAotUnit2028 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31985 {
        if slot <= 31984 {
// PORT: SOURCE P32-P35_P72-P75.agc:590
//		TC	SUBEXIT
// PORT: Fixed ROM slots 31984.
            if slot <> 31984 or instruction <> 824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:591
//P20FLGON	EXTEND
// PORT: Fixed ROM slots 31985.
            if slot <> 31985 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31986 {
// PORT: SOURCE P32-P35_P72-P75.agc:592
//		QXCH	SUBEXIT
// PORT: Fixed ROM slots 31986.
            if slot <> 31986 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:593
//		TC	UPFLAG
// PORT: Fixed ROM slots 31987.
            if slot <> 31987 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2028] to agcAotUnit2028@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:594
//		ADRES	UPDATFLG	# SET UPDATFLG
// PORT: Fixed ROM slots 31988.
    31988, 46
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31989–31989.
function agcAotUnit2029 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:595
//		TC	UPFLAG
// PORT: Fixed ROM slots 31989.
    if slot <> 31989 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2029] to agcAotUnit2029@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:596
//		ADRES	TRACKFLG	# SET TRACKFLG
// PORT: Fixed ROM slots 31990.
    31990, 50
)).

// PORT: Physical bank 35. Shared continuation entries, slots 31991–31991.
function agcAotUnit2030 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:597
//		TC	SUBEXIT
// PORT: Fixed ROM slots 31991.
    if slot <> 31991 or instruction <> 824 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 824, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2030] to agcAotUnit2030@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:598
//
// PORT: SOURCE P32-P35_P72-P75.agc:599
//# Page 630
// PORT: SOURCE P32-P35_P72-P75.agc:600
//# ***** DISDVLVC *****
// PORT: SOURCE P32-P35_P72-P75.agc:601
//#
// PORT: SOURCE P32-P35_P72-P75.agc:602
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:603
//#
// PORT: SOURCE P32-P35_P72-P75.agc:604
//#	S32/33.X
// PORT: SOURCE P32-P35_P72-P75.agc:605
//#	VNPOOH
// PORT: SOURCE P32-P35_P72-P75.agc:606
//
// PORT: SOURCE P32-P35_P72-P75.agc:607
//DISDVLVC	STORE	DELVLVC
// PORT: Fixed ROM slots 31992.
    31992, 3640,
// PORT: SOURCE P32-P35_P72-P75.agc:608
//		STQ	CALL
// PORT: Fixed ROM slots 31993.
    31993, 37920,
// PORT: SOURCE P32-P35_P72-P75.agc:609
//			NORMEX
// PORT: Fixed ROM slots 31994.
    31994, 3686,
// PORT: SOURCE P32-P35_P72-P75.agc:610
//			S32/33.X
// PORT: Fixed ROM slots 31995.
    31995, 58528,
// PORT: SOURCE P32-P35_P72-P75.agc:611
//		VLOAD	MXV
// PORT: Fixed ROM slots 31996.
    31996, 53754,
// PORT: SOURCE P32-P35_P72-P75.agc:612
//			DELVLVC
// PORT: Fixed ROM slots 31997.
    31997, 3640,
// PORT: SOURCE P32-P35_P72-P75.agc:613
//			0D
// PORT: Fixed ROM slots 31998.
    31998, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:614
//		VSL1	SXA,1
// PORT: Fixed ROM slots 31999.
    31999, 55540,
// PORT: SOURCE P32-P35_P72-P75.agc:615
//			VERBNOUN
// PORT: Fixed ROM slots 32000.
    32000, 3866,
// PORT: SOURCE P32-P35_P72-P75.agc:616
//		STORE	DELVLVC
// PORT: Fixed ROM slots 32001.
    32001, 3640,
// PORT: SOURCE P32-P35_P72-P75.agc:617
//		EXIT
// PORT: Fixed ROM slots 32002.
    32002, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32003–32005.
function agcAotUnit2031 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32003 {
// PORT: SOURCE P32-P35_P72-P75.agc:618
//		CA	VERBNOUN
// PORT: Fixed ROM slots 32003.
        if slot <> 32003 or instruction <> 13197 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 909).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32004 {
// PORT: SOURCE P32-P35_P72-P75.agc:619
//		TC	VNPOOH
// PORT: Fixed ROM slots 32004.
            if slot <> 32004 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P32-P35_P72-P75.agc:620
//		TC	INTPRET
// PORT: Fixed ROM slots 32005.
            if slot <> 32005 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2031] to agcAotUnit2031@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:621
//		GOTO
// PORT: Fixed ROM slots 32006.
    32006, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:622
//			NORMEX
// PORT: Fixed ROM slots 32007.
    32007, 3686,
// PORT: SOURCE P32-P35_P72-P75.agc:623
//
// PORT: SOURCE P32-P35_P72-P75.agc:624
//# Page 631
// PORT: SOURCE P32-P35_P72-P75.agc:625
//# ***** CONSTANTS *****
// PORT: SOURCE P32-P35_P72-P75.agc:626
//
// PORT: SOURCE P32-P35_P72-P75.agc:627
//V06N11		VN	0611
// PORT: Fixed ROM slots 32008.
    32008, 1558,
// PORT: SOURCE P32-P35_P72-P75.agc:628
//V06N13		VN	0613
// PORT: Fixed ROM slots 32009.
    32009, 1562,
// PORT: SOURCE P32-P35_P72-P75.agc:629
//V06N75		VN	0675
// PORT: Fixed ROM slots 32010.
    32010, 1686,
// PORT: SOURCE P32-P35_P72-P75.agc:630
//SN359+		2DEC	-.000086601
// PORT: Fixed ROM slots 32011 32012.
    32011, 65532, 32012, 51808,
// PORT: SOURCE P32-P35_P72-P75.agc:631
//
// PORT: SOURCE P32-P35_P72-P75.agc:632
//CS359+		2DEC	+.499999992
// PORT: Fixed ROM slots 32013 32014.
    32013, 16382, 32014, 32764,
// PORT: SOURCE P32-P35_P72-P75.agc:633
//
// PORT: SOURCE P32-P35_P72-P75.agc:634
//P30ZERO		2DEC	0
// PORT: Fixed ROM slots 32015 32016.
    32015, 0, 32016, 0,
// PORT: SOURCE P32-P35_P72-P75.agc:635
//
// PORT: SOURCE P32-P35_P72-P75.agc:636
//60MIN		2DEC	360000
// PORT: Fixed ROM slots 32017 32018.
    32017, 42, 32018, 31872,
// PORT: SOURCE P32-P35_P72-P75.agc:637
//
// PORT: SOURCE P32-P35_P72-P75.agc:638
//ALARM/TB	OCT	00600		# NO 1
// PORT: Fixed ROM slots 32019.
    32019, 768,
// PORT: SOURCE P32-P35_P72-P75.agc:639
//		OCT	00601		#    2
// PORT: Fixed ROM slots 32020.
    32020, 770,
// PORT: SOURCE P32-P35_P72-P75.agc:640
//		OCT	00602		#    3
// PORT: Fixed ROM slots 32021.
    32021, 772,
// PORT: SOURCE P32-P35_P72-P75.agc:641
//		OCT	00603		#    4
// PORT: Fixed ROM slots 32022.
    32022, 774,
// PORT: SOURCE P32-P35_P72-P75.agc:642
//		OCT	00604		#    5
// PORT: Fixed ROM slots 32023.
    32023, 776,
// PORT: SOURCE P32-P35_P72-P75.agc:643
//		OCT	00605		#    6
// PORT: Fixed ROM slots 32024.
    32024, 778,
// PORT: SOURCE P32-P35_P72-P75.agc:644
//		OCT	00606		#    7
// PORT: Fixed ROM slots 32025.
    32025, 780,
// PORT: SOURCE P32-P35_P72-P75.agc:645
//
// PORT: SOURCE P32-P35_P72-P75.agc:646
//# Page 632
// PORT: SOURCE P32-P35_P72-P75.agc:647
//# ***** CSI/A *****
// PORT: SOURCE P32-P35_P72-P75.agc:648
//#
// PORT: SOURCE P32-P35_P72-P75.agc:649
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:650
//#
// PORT: SOURCE P32-P35_P72-P75.agc:651
//#	VECSHIFT
// PORT: SOURCE P32-P35_P72-P75.agc:652
//#	TIMETHET
// PORT: SOURCE P32-P35_P72-P75.agc:653
//#	PERIAPO
// PORT: SOURCE P32-P35_P72-P75.agc:654
//#	SHIFTR1
// PORT: SOURCE P32-P35_P72-P75.agc:655
//#	INTINT2C
// PORT: SOURCE P32-P35_P72-P75.agc:656
//#	CDHMVR
// PORT: SOURCE P32-P35_P72-P75.agc:657
//#	PERIAPO1
// PORT: SOURCE P32-P35_P72-P75.agc:658
//#	INTINT
// PORT: SOURCE P32-P35_P72-P75.agc:659
//#	ACTIVE
// PORT: SOURCE P32-P35_P72-P75.agc:660
//
// PORT: SOURCE P32-P35_P72-P75.agc:661
//		BANK	34
// PORT: SOURCE P32-P35_P72-P75.agc:662
//		SETLOC	CSI/CDH1
// PORT: SOURCE P32-P35_P72-P75.agc:663
//		BANK
// PORT: SOURCE P32-P35_P72-P75.agc:664
//		EBANK=	SUBEXIT
// PORT: SOURCE P32-P35_P72-P75.agc:665
//		COUNT*	$$/CSI
// PORT: SOURCE P32-P35_P72-P75.agc:666
//LOOPMX		2DEC	16
// PORT: Fixed ROM slots 30767 30768.
    30767, 0, 30768, 32,
// PORT: SOURCE P32-P35_P72-P75.agc:667
//
// PORT: SOURCE P32-P35_P72-P75.agc:668
//INITST		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// PORT: Fixed ROM slots 30769 30770.
    30769, 6, 30770, 29538,
// PORT: SOURCE P32-P35_P72-P75.agc:669
//
// PORT: SOURCE P32-P35_P72-P75.agc:670
//DVMAX1		2DEC	3.0480 B-7	# MAXIMUM DV1 = 1000 FPS
// PORT: Fixed ROM slots 30771 30772.
    30771, 780, 30772, 4718,
// PORT: SOURCE P32-P35_P72-P75.agc:671
//
// PORT: SOURCE P32-P35_P72-P75.agc:672
//DVMAX2		2DEC	3.014472 B-7	#		 989 FPS
// PORT: Fixed ROM slots 30773 30774.
    30773, 770, 30774, 27932,
// PORT: SOURCE P32-P35_P72-P75.agc:673
//
// PORT: SOURCE P32-P35_P72-P75.agc:674
//1DPB2		2DEC	1.0 B-2
// PORT: Fixed ROM slots 30775 30776.
    30775, 8192, 30776, 0,
// PORT: SOURCE P32-P35_P72-P75.agc:675
//
// PORT: SOURCE P32-P35_P72-P75.agc:676
//1DPB28		2DEC	1
// PORT: Fixed ROM slots 30777 30778.
    30777, 0, 30778, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:677
//
// PORT: SOURCE P32-P35_P72-P75.agc:678
//PMINE		2DEC	157420 B-29	# 85 NM -- MUST BE 8 WORDS BEFORE PMINM
// PORT: Fixed ROM slots 30779 30780.
    30779, 8, 30780, 26348,
// PORT: SOURCE P32-P35_P72-P75.agc:679
//
// PORT: SOURCE P32-P35_P72-P75.agc:680
//EPSILN1		2DEC	.0003048 B-7	# .1 FPS
// PORT: Fixed ROM slots 30781 30782.
    30781, 0, 30782, 1278,
// PORT: SOURCE P32-P35_P72-P75.agc:681
//
// PORT: SOURCE P32-P35_P72-P75.agc:682
//NICKELDP	2DEC	.021336 B-7	# 7 FPS (CHANGED FROM .05 FPS)
// PORT: Fixed ROM slots 30783 30784.
    30783, 4, 30784, 23954,
// PORT: SOURCE P32-P35_P72-P75.agc:683
//
// PORT: SOURCE P32-P35_P72-P75.agc:684
//FIFPSDP		2DEC	-.152400 B-7	# 50 FPS
// PORT: Fixed ROM slots 30785 30786.
    30785, 65496, 30786, 48914,
// PORT: SOURCE P32-P35_P72-P75.agc:685
//
// PORT: SOURCE P32-P35_P72-P75.agc:686
//PMINM		2DEC	10668 B-29	# 35000 FT -- MUST BE 8 WORDS AFTER PMINE
// PORT: Fixed ROM slots 30787 30788.
    30787, 0, 30788, 10668,
// PORT: SOURCE P32-P35_P72-P75.agc:687
//
// PORT: SOURCE P32-P35_P72-P75.agc:688
//DELMAX1		2DEC	.6096000 B-7	# 200 FPS
// PORT: Fixed ROM slots 30789 30790.
    30789, 156, 30790, 944,
// PORT: SOURCE P32-P35_P72-P75.agc:689
//
// PORT: SOURCE P32-P35_P72-P75.agc:690
//ONETHTH		2DEC	.0001 B-3
// PORT: Fixed ROM slots 30791 30792.
    30791, 0, 30792, 6710,
// PORT: SOURCE P32-P35_P72-P75.agc:691
//
// PORT: SOURCE P32-P35_P72-P75.agc:692
//TMIN		2DEC	60000		# 10 MIN
// PORT: Fixed ROM slots 30793 30794.
    30793, 6, 30794, 21696,
// PORT: SOURCE P32-P35_P72-P75.agc:693
//
// PORT: SOURCE P32-P35_P72-P75.agc:694
//CSI/A		CLEAR	SET		# INITIALIZE INDICATORS
// PORT: Fixed ROM slots 30795.
    30795, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:695
//			S32.1F1		# DVT1 HAS EXCEEDED MAX INDICATOR
// PORT: Fixed ROM slots 30796.
    30796, 3424,
// PORT: SOURCE P32-P35_P72-P75.agc:696
//			S32.1F2		# FIRST PASS FOR NEWTON ITERATION INDICATOR
// PORT: Fixed ROM slots 30797.
    30797, 3170,
// PORT: SOURCE P32-P35_P72-P75.agc:697
//# Page 633
// PORT: SOURCE P32-P35_P72-P75.agc:698
//		CLEAR	SET
// PORT: Fixed ROM slots 30798.
    30798, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:699
//			S32.1F3A	# 00=1ST 2 PASSES 2ND CYCLE, 01=FIRST CYCLE
// PORT: Fixed ROM slots 30799.
    30799, 3428,
// PORT: SOURCE P32-P35_P72-P75.agc:700
//			S32.1F3B	# 10=2ND CYCLE, 11=50 FPS STAGE 2ND CYCLE
// PORT: Fixed ROM slots 30800.
    30800, 3174,
// PORT: SOURCE P32-P35_P72-P75.agc:701
//		DLOAD
// PORT: Fixed ROM slots 30801.
    30801, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:702
//			P30ZERO
// PORT: Fixed ROM slots 30802.
    30802, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:703
//		STORE	LOOPCT
// PORT: Fixed ROM slots 30803.
    30803, 3852,
// PORT: SOURCE P32-P35_P72-P75.agc:704
//		STORE	CSIALRM
// PORT: Fixed ROM slots 30804.
    30804, 3864,
// PORT: SOURCE P32-P35_P72-P75.agc:705
//CSI/B		SETPD	VLOAD
// PORT: Fixed ROM slots 30805.
    30805, 64770,
// PORT: SOURCE P32-P35_P72-P75.agc:706
//			0D
// PORT: Fixed ROM slots 30806.
    30806, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:707
//			RACT1
// PORT: Fixed ROM slots 30807.
    30807, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:708
//		ABVAL	PUSH		# RA1			      B29 PL02D
// PORT: Fixed ROM slots 30808.
    30808, 34380,
// PORT: SOURCE P32-P35_P72-P75.agc:709
//		NORM	SR1
// PORT: Fixed ROM slots 30809.
    30809, 57986,
// PORT: SOURCE P32-P35_P72-P75.agc:710
//			X2		#		       B29-N2+ B1 PL04D
// PORT: Fixed ROM slots 30810.
    30810, 80,
// PORT: SOURCE P32-P35_P72-P75.agc:711
//		PDVL	ABVAL
// PORT: Fixed ROM slots 30811.
    30811, 42650,
// PORT: SOURCE P32-P35_P72-P75.agc:712
//			RPASS3
// PORT: Fixed ROM slots 30812.
    30812, 3796,
// PORT: SOURCE P32-P35_P72-P75.agc:713
//		NORM	BDDV		# RA1/RP3		       B1 PL02D
// PORT: Fixed ROM slots 30813.
    30813, 46466,
// PORT: SOURCE P32-P35_P72-P75.agc:714
//			X1
// PORT: Fixed ROM slots 30814.
    30814, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:715
//		XSU,2	SR*		#			       B2
// PORT: Fixed ROM slots 30815.
    30815, 44904,
// PORT: SOURCE P32-P35_P72-P75.agc:716
//			X1
// PORT: Fixed ROM slots 30816.
    30816, 76,
// PORT: SOURCE P32-P35_P72-P75.agc:717
//			1,2
// PORT: Fixed ROM slots 30817.
    30817, 48378,
// PORT: SOURCE P32-P35_P72-P75.agc:718
//		DAD	DMP		# (1+(RA1/RP3))RA1	B29+B2=B31 PL00D
// PORT: Fixed ROM slots 30818.
    30818, 34074,
// PORT: SOURCE P32-P35_P72-P75.agc:719
//			1DPB2
// PORT: Fixed ROM slots 30819.
    30819, 24688,
// PORT: SOURCE P32-P35_P72-P75.agc:720
//		NORM	PDDL		#				   PL02D
// PORT: Fixed ROM slots 30820.
    30820, 54658,
// PORT: SOURCE P32-P35_P72-P75.agc:721
//			X1
// PORT: Fixed ROM slots 30821.
    30821, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:722
//			RTMU
// PORT: Fixed ROM slots 30822.
    30822, 2466,
// PORT: SOURCE P32-P35_P72-P75.agc:723
//		SR1	DDV		#		       B38-B31= B7 PL00D
// PORT: Fixed ROM slots 30823.
    30823, 47556,
// PORT: SOURCE P32-P35_P72-P75.agc:724
//		SL*	SQRT		#				B7
// PORT: Fixed ROM slots 30824.
    30824, 63070,
// PORT: SOURCE P32-P35_P72-P75.agc:725
//			0 	-7,1
// PORT: Fixed ROM slots 30825.
    30825, 16628,
// PORT: SOURCE P32-P35_P72-P75.agc:726
//		PDVL	UNIT		#				   PL02D
// PORT: Fixed ROM slots 30826.
    30826, 44698,
// PORT: SOURCE P32-P35_P72-P75.agc:727
//			RACT1
// PORT: Fixed ROM slots 30827.
    30827, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:728
//		PDVL	VXV
// PORT: Fixed ROM slots 30828.
    30828, 40346,
// PORT: SOURCE P32-P35_P72-P75.agc:729
//			UP1
// PORT: Fixed ROM slots 30829.
    30829, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:730
//		UNIT			# UNIT(URP1 X UVP1 X URA1) = UH1
// PORT: Fixed ROM slots 30830.
    30830, 65372,
// PORT: SOURCE P32-P35_P72-P75.agc:731
//		DOT	SL1		# VA1 . UH1			B7
// PORT: Fixed ROM slots 30831.
    30831, 59970,
// PORT: SOURCE P32-P35_P72-P75.agc:732
//			VACT1
// PORT: Fixed ROM slots 30832.
    30832, 3700,
// PORT: SOURCE P32-P35_P72-P75.agc:733
//		BDSU	STADR		#				   PL00D
// PORT: Fixed ROM slots 30833.
    30833, 38434,
// PORT: SOURCE P32-P35_P72-P75.agc:734
//		STODL	DELVCSI
// PORT: Fixed ROM slots 30834.
    30834, 49414,
// PORT: SOURCE P32-P35_P72-P75.agc:735
//			INITST		# 10 FPS
// PORT: Fixed ROM slots 30835.
    30835, 24676,
// PORT: SOURCE P32-P35_P72-P75.agc:736
//		STORE	DELDV
// PORT: Fixed ROM slots 30836.
    30836, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:737
//CSI/B1		DLOAD	DAD		# IF LOOPCT = 16
// PORT: Fixed ROM slots 30837.
    30837, 36298,
// PORT: SOURCE P32-P35_P72-P75.agc:738
//			LOOPCT
// PORT: Fixed ROM slots 30838.
    30838, 3852,
// PORT: SOURCE P32-P35_P72-P75.agc:739
//			1DPB28
// PORT: Fixed ROM slots 30839.
    30839, 24692,
// PORT: SOURCE P32-P35_P72-P75.agc:740
//		STORE	LOOPCT
// PORT: Fixed ROM slots 30840.
    30840, 3852,
// PORT: SOURCE P32-P35_P72-P75.agc:741
//		DSU	AXT,2
// PORT: Fixed ROM slots 30841.
    30841, 64554,
// PORT: SOURCE P32-P35_P72-P75.agc:742
//			LOOPMX
// PORT: Fixed ROM slots 30842.
    30842, 24672,
// PORT: SOURCE P32-P35_P72-P75.agc:743
//			6
// PORT: Fixed ROM slots 30843.
    30843, 12,
// PORT: SOURCE P32-P35_P72-P75.agc:744
//		BPL
// PORT: Fixed ROM slots 30844.
    30844, 65352,
// PORT: SOURCE P32-P35_P72-P75.agc:745
//			SCNDSOL
// PORT: Fixed ROM slots 30845.
    30845, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:746
//CSI/B2		SETPD
// PORT: Fixed ROM slots 30846.
    30846, 65282,
// PORT: SOURCE P32-P35_P72-P75.agc:747
//			0D
// PORT: Fixed ROM slots 30847.
    30847, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:748
//# Page 634
// PORT: SOURCE P32-P35_P72-P75.agc:749
//		DLOAD	ABS
// PORT: Fixed ROM slots 30848.
    30848, 42698
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:750
//			DELVCSI
// PORT: Fixed ROM slots 30849.
    30849, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:751
//		DSU	BMN
// PORT: Fixed ROM slots 30850.
    30850, 41002,
// PORT: SOURCE P32-P35_P72-P75.agc:752
//			DVMAX1
// PORT: Fixed ROM slots 30851.
    30851, 24680,
// PORT: SOURCE P32-P35_P72-P75.agc:753
//			CSI/B23
// PORT: Fixed ROM slots 30852.
    30852, 57640,
// PORT: SOURCE P32-P35_P72-P75.agc:754
//		AXT,2	BON
// PORT: Fixed ROM slots 30853.
    30853, 36088,
// PORT: SOURCE P32-P35_P72-P75.agc:755
//			7
// PORT: Fixed ROM slots 30854.
    30854, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:756
//			S32.1F1
// PORT: Fixed ROM slots 30855.
    30855, 3456,
// PORT: SOURCE P32-P35_P72-P75.agc:757
//			SCNDSOL
// PORT: Fixed ROM slots 30856.
    30856, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:758
//		BOFF	BON
// PORT: Fixed ROM slots 30857.
    30857, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:759
//			S32.1F3A
// PORT: Fixed ROM slots 30858.
    30858, 3524,
// PORT: SOURCE P32-P35_P72-P75.agc:760
//			CSI/B22		# FLAG 3 NEQ 3
// PORT: Fixed ROM slots 30859.
    30859, 57628,
// PORT: SOURCE P32-P35_P72-P75.agc:761
//			S32.1F3B
// PORT: Fixed ROM slots 30860.
    30860, 3462,
// PORT: SOURCE P32-P35_P72-P75.agc:762
//			SCNDSOL
// PORT: Fixed ROM slots 30861.
    30861, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:763
//CSI/B22		SET	DLOAD
// PORT: Fixed ROM slots 30862.
    30862, 58648,
// PORT: SOURCE P32-P35_P72-P75.agc:764
//			S32.1F1
// PORT: Fixed ROM slots 30863.
    30863, 3168,
// PORT: SOURCE P32-P35_P72-P75.agc:765
//			DVMAX2
// PORT: Fixed ROM slots 30864.
    30864, 24684,
// PORT: SOURCE P32-P35_P72-P75.agc:766
//		SIGN
// PORT: Fixed ROM slots 30865.
    30865, 65514,
// PORT: SOURCE P32-P35_P72-P75.agc:767
//			DELVCSI
// PORT: Fixed ROM slots 30866.
    30866, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:768
//		STORE	DELVCSI
// PORT: Fixed ROM slots 30867.
    30867, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:769
//CSI/B23		VLOAD	PUSH
// PORT: Fixed ROM slots 30868.
    30868, 34554,
// PORT: SOURCE P32-P35_P72-P75.agc:770
//			RACT1
// PORT: Fixed ROM slots 30869.
    30869, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:771
//		UNIT	PDVL
// PORT: Fixed ROM slots 30870.
    30870, 52572,
// PORT: SOURCE P32-P35_P72-P75.agc:772
//			UP1
// PORT: Fixed ROM slots 30871.
    30871, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:773
//		VXV	UNIT		# UNIT (URP1 X UVP1 X URA1) = UH1
// PORT: Fixed ROM slots 30872.
    30872, 44602,
// PORT: SOURCE P32-P35_P72-P75.agc:774
//		VXSC	VSL1
// PORT: Fixed ROM slots 30873.
    30873, 64226,
// PORT: SOURCE P32-P35_P72-P75.agc:775
//			DELVCSI
// PORT: Fixed ROM slots 30874.
    30874, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:776
//		STORE	DELVEET1
// PORT: Fixed ROM slots 30875.
    30875, 2414,
// PORT: SOURCE P32-P35_P72-P75.agc:777
//		VAD	BOV
// PORT: Fixed ROM slots 30876.
    30876, 32858,
// PORT: SOURCE P32-P35_P72-P75.agc:778
//			VACT1
// PORT: Fixed ROM slots 30877.
    30877, 3700,
// PORT: SOURCE P32-P35_P72-P75.agc:779
//			CSI/B23D
// PORT: Fixed ROM slots 30878.
    30878, 57662,
// PORT: SOURCE P32-P35_P72-P75.agc:780
//CSI/B23D	STCALL	VACT4
// PORT: Fixed ROM slots 30879.
    30879, 32492,
// PORT: SOURCE P32-P35_P72-P75.agc:781
//			VECSHIFT
// PORT: Fixed ROM slots 30880.
    30880, 39452,
// PORT: SOURCE P32-P35_P72-P75.agc:782
//		STOVL	VVEC
// PORT: Fixed ROM slots 30881.
    30881, 23496,
// PORT: SOURCE P32-P35_P72-P75.agc:783
//		SET
// PORT: Fixed ROM slots 30882.
    30882, 65304,
// PORT: SOURCE P32-P35_P72-P75.agc:784
//			RVSW
// PORT: Fixed ROM slots 30883.
    30883, 3692,
// PORT: SOURCE P32-P35_P72-P75.agc:785
//		STOVL	RVEC
// PORT: Fixed ROM slots 30884.
    30884, 23386,
// PORT: SOURCE P32-P35_P72-P75.agc:786
//			SN359+
// PORT: Fixed ROM slots 30885.
    30885, 27160,
// PORT: SOURCE P32-P35_P72-P75.agc:787
//		STCALL	SNTH		# ALSO CSTH
// PORT: Fixed ROM slots 30886.
    30886, 31664,
// PORT: SOURCE P32-P35_P72-P75.agc:788
//			TIMETHET
// PORT: Fixed ROM slots 30887.
    30887, 21428,
// PORT: SOURCE P32-P35_P72-P75.agc:789
//		SR1	LXA,1
// PORT: Fixed ROM slots 30888.
    30888, 59588,
// PORT: SOURCE P32-P35_P72-P75.agc:790
//			RTX1
// PORT: Fixed ROM slots 30889.
    30889, 3068,
// PORT: SOURCE P32-P35_P72-P75.agc:791
//		STCALL	HAFPA1
// PORT: Fixed ROM slots 30890.
    30890, 32520,
// PORT: SOURCE P32-P35_P72-P75.agc:792
//			PERIAPO
// PORT: Fixed ROM slots 30891.
    30891, 39340,
// PORT: SOURCE P32-P35_P72-P75.agc:793
//		CALL
// PORT: Fixed ROM slots 30892.
    30892, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:794
//			SHIFTR1
// PORT: Fixed ROM slots 30893.
    30893, 39468,
// PORT: SOURCE P32-P35_P72-P75.agc:795
//		STODL	POSTCSI
// PORT: Fixed ROM slots 30894.
    30894, 16132,
// PORT: SOURCE P32-P35_P72-P75.agc:796
//			CENTANG
// PORT: Fixed ROM slots 30895.
    30895, 3874,
// PORT: SOURCE P32-P35_P72-P75.agc:797
//		BZE	GOTO
// PORT: Fixed ROM slots 30896.
    30896, 43096,
// PORT: SOURCE P32-P35_P72-P75.agc:798
//			+2
// PORT: Fixed ROM slots 30897.
    30897, 57702,
// PORT: SOURCE P32-P35_P72-P75.agc:799
//# Page 635
// PORT: SOURCE P32-P35_P72-P75.agc:800
//			CIRCL
// PORT: Fixed ROM slots 30898.
    30898, 57844,
// PORT: SOURCE P32-P35_P72-P75.agc:801
//		DLOAD
// PORT: Fixed ROM slots 30899.
    30899, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:802
//			ECC
// PORT: Fixed ROM slots 30900.
    30900, 3028,
// PORT: SOURCE P32-P35_P72-P75.agc:803
//		DSU	BMN
// PORT: Fixed ROM slots 30901.
    30901, 41002,
// PORT: SOURCE P32-P35_P72-P75.agc:804
//			ONETHTH
// PORT: Fixed ROM slots 30902.
    30902, 24720,
// PORT: SOURCE P32-P35_P72-P75.agc:805
//			CIRCL
// PORT: Fixed ROM slots 30903.
    30903, 57844,
// PORT: SOURCE P32-P35_P72-P75.agc:806
//		DLOAD	CALL
// PORT: Fixed ROM slots 30904.
    30904, 38090,
// PORT: SOURCE P32-P35_P72-P75.agc:807
//			R1
// PORT: Fixed ROM slots 30905.
    30905, 66,
// PORT: SOURCE P32-P35_P72-P75.agc:808
//			SHIFTR1
// PORT: Fixed ROM slots 30906.
    30906, 39468,
// PORT: SOURCE P32-P35_P72-P75.agc:809
//		SETPD	NORM
// PORT: Fixed ROM slots 30907.
    30907, 49410,
// PORT: SOURCE P32-P35_P72-P75.agc:810
//			2D
// PORT: Fixed ROM slots 30908.
    30908, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:811
//			X1
// PORT: Fixed ROM slots 30909.
    30909, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:812
//		PDVL	DOT		#					PL04D
// PORT: Fixed ROM slots 30910.
    30910, 41370,
// PORT: SOURCE P32-P35_P72-P75.agc:813
//			RACT1
// PORT: Fixed ROM slots 30911.
    30911, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:814
//			VACT4
// PORT: Fixed ROM slots 30912.
    30912, 3820,
// PORT: SOURCE P32-P35_P72-P75.agc:815
//		ABS	DDV
// PORT: Fixed ROM slots 30913.
    30913, 47436,
// PORT: SOURCE P32-P35_P72-P75.agc:816
//			02D		# (/RDOTV/)/R1		   B38-B29= B7
// PORT: Fixed ROM slots 30914.
    30914, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:817
//		SL*	DSU
// PORT: Fixed ROM slots 30915.
    30915, 38238,
// PORT: SOURCE P32-P35_P72-P75.agc:818
//			0,1
// PORT: Fixed ROM slots 30916.
    30916, 16642,
// PORT: SOURCE P32-P35_P72-P75.agc:819
//			NICKELDP
// PORT: Fixed ROM slots 30917.
    30917, 24704,
// PORT: SOURCE P32-P35_P72-P75.agc:820
//		BMN	DLOAD
// PORT: Fixed ROM slots 30918.
    30918, 58688,
// PORT: SOURCE P32-P35_P72-P75.agc:821
//			CIRCL
// PORT: Fixed ROM slots 30919.
    30919, 57844,
// PORT: SOURCE P32-P35_P72-P75.agc:822
//			P
// PORT: Fixed ROM slots 30920.
    30920, 3008,
// PORT: SOURCE P32-P35_P72-P75.agc:823
//		SL2	DSU
// PORT: Fixed ROM slots 30921.
    30921, 38292,
// PORT: SOURCE P32-P35_P72-P75.agc:824
//			1DPB2
// PORT: Fixed ROM slots 30922.
    30922, 24688,
// PORT: SOURCE P32-P35_P72-P75.agc:825
//		STODL	14D
// PORT: Fixed ROM slots 30923.
    30923, 12318,
// PORT: SOURCE P32-P35_P72-P75.agc:826
//			RTSR1/MU
// PORT: Fixed ROM slots 30924.
    30924, 2462,
// PORT: SOURCE P32-P35_P72-P75.agc:827
//		SR1	DDV		# (1/ROOTMU)/R1		B-16-B29 = B-45 PL02D
// PORT: Fixed ROM slots 30925.
    30925, 47556,
// PORT: SOURCE P32-P35_P72-P75.agc:828
//		PDDL	DMP
// PORT: Fixed ROM slots 30926.
    30926, 34218,
// PORT: SOURCE P32-P35_P72-P75.agc:829
//			P
// PORT: Fixed ROM slots 30927.
    30927, 3008,
// PORT: SOURCE P32-P35_P72-P75.agc:830
//			R1
// PORT: Fixed ROM slots 30928.
    30928, 66,
// PORT: SOURCE P32-P35_P72-P75.agc:831
//		CALL
// PORT: Fixed ROM slots 30929.
    30929, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:832
//			SHIFTR1
// PORT: Fixed ROM slots 30930.
    30930, 39468,
// PORT: SOURCE P32-P35_P72-P75.agc:833
//		SL4	SL1
// PORT: Fixed ROM slots 30931.
    30931, 59924,
// PORT: SOURCE P32-P35_P72-P75.agc:834
//		SQRT	DMP		# ((P/MU)**.5)/R1	B14+B-14 = B-31 PL02D
// PORT: Fixed ROM slots 30932.
    30932, 34284,
// PORT: SOURCE P32-P35_P72-P75.agc:835
//		BOFF	SL3
// PORT: Fixed ROM slots 30933.
    30933, 43544,
// PORT: SOURCE P32-P35_P72-P75.agc:836
//			CMOONFLG
// PORT: Fixed ROM slots 30934.
    30934, 4550,
// PORT: SOURCE P32-P35_P72-P75.agc:837
//			CSI/B3
// PORT: Fixed ROM slots 30935.
    30935, 57776,
// PORT: SOURCE P32-P35_P72-P75.agc:838
//CSI/B3		PDVL	DOT
// PORT: Fixed ROM slots 30936.
    30936, 41370,
// PORT: SOURCE P32-P35_P72-P75.agc:839
//			RACT1
// PORT: Fixed ROM slots 30937.
    30937, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:840
//			VACT4
// PORT: Fixed ROM slots 30938.
    30938, 3820,
// PORT: SOURCE P32-P35_P72-P75.agc:841
//		STORE	RDOTV
// PORT: Fixed ROM slots 30939.
    30939, 3870,
// PORT: SOURCE P32-P35_P72-P75.agc:842
//		ABS
// PORT: Fixed ROM slots 30940.
    30940, 65356,
// PORT: SOURCE P32-P35_P72-P75.agc:843
//		NORM	DMP		# ((P/MU)**.5)RDOTV/R1			PL02D
// PORT: Fixed ROM slots 30941.
    30941, 34178,
// PORT: SOURCE P32-P35_P72-P75.agc:844
//			X2
// PORT: Fixed ROM slots 30942.
    30942, 80,
// PORT: SOURCE P32-P35_P72-P75.agc:845
//		XSU,1	SL*		#		       B-31+B36-B3 = B2
// PORT: Fixed ROM slots 30943.
    30943, 44896,
// PORT: SOURCE P32-P35_P72-P75.agc:846
//			X2
// PORT: Fixed ROM slots 30944.
    30944, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:847
//			3,1
// PORT: Fixed ROM slots 30945.
    30945, 16648,
// PORT: SOURCE P32-P35_P72-P75.agc:848
//		STODL	12D
// PORT: Fixed ROM slots 30946.
    30946, 12314,
// PORT: SOURCE P32-P35_P72-P75.agc:849
//			P30ZERO
// PORT: Fixed ROM slots 30947.
    30947, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:850
//# Page 636
// PORT: SOURCE P32-P35_P72-P75.agc:851
//		STORE	16D
// PORT: Fixed ROM slots 30948.
    30948, 34,
// PORT: SOURCE P32-P35_P72-P75.agc:852
//		VLOAD	UNIT
// PORT: Fixed ROM slots 30949.
    30949, 44794,
// PORT: SOURCE P32-P35_P72-P75.agc:853
//			12D
// PORT: Fixed ROM slots 30950.
    30950, 26,
// PORT: SOURCE P32-P35_P72-P75.agc:854
//		STOVL	SNTH		# ALSO STORES CSTH AND 0
// PORT: Fixed ROM slots 30951.
    30951, 23472,
// PORT: SOURCE P32-P35_P72-P75.agc:855
//			RACT1
// PORT: Fixed ROM slots 30952.
    30952, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:856
//		PDVL	SIGN
// PORT: Fixed ROM slots 30953.
    30953, 62874,
// PORT: SOURCE P32-P35_P72-P75.agc:857
//			VACT4
// PORT: Fixed ROM slots 30954.
    30954, 3820,
// PORT: SOURCE P32-P35_P72-P75.agc:858
//			RDOTV
// PORT: Fixed ROM slots 30955.
    30955, 3870,
// PORT: SOURCE P32-P35_P72-P75.agc:859
//		VCOMP	CALL
// PORT: Fixed ROM slots 30956.
    30956, 38012,
// PORT: SOURCE P32-P35_P72-P75.agc:860
//			VECSHIFT
// PORT: Fixed ROM slots 30957.
    30957, 39452,
// PORT: SOURCE P32-P35_P72-P75.agc:861
//		STOVL	VVEC
// PORT: Fixed ROM slots 30958.
    30958, 23496,
// PORT: SOURCE P32-P35_P72-P75.agc:862
//		SET
// PORT: Fixed ROM slots 30959.
    30959, 65304,
// PORT: SOURCE P32-P35_P72-P75.agc:863
//			RVSW
// PORT: Fixed ROM slots 30960.
    30960, 3692,
// PORT: SOURCE P32-P35_P72-P75.agc:864
//		STCALL	RVEC
// PORT: Fixed ROM slots 30961.
    30961, 31578,
// PORT: SOURCE P32-P35_P72-P75.agc:865
//			TIMETHET
// PORT: Fixed ROM slots 30962.
    30962, 21428,
// PORT: SOURCE P32-P35_P72-P75.agc:866
//		PDDL	BPL
// PORT: Fixed ROM slots 30963.
    30963, 42154,
// PORT: SOURCE P32-P35_P72-P75.agc:867
//			RDOTV
// PORT: Fixed ROM slots 30964.
    30964, 3870,
// PORT: SOURCE P32-P35_P72-P75.agc:868
//			NTP/2
// PORT: Fixed ROM slots 30965.
    30965, 57852,
// PORT: SOURCE P32-P35_P72-P75.agc:869
//		DLOAD	DSU
// PORT: Fixed ROM slots 30966.
    30966, 38346,
// PORT: SOURCE P32-P35_P72-P75.agc:870
//			HAFPA1
// PORT: Fixed ROM slots 30967.
    30967, 3848,
// PORT: SOURCE P32-P35_P72-P75.agc:871
//		PUSH	GOTO
// PORT: Fixed ROM slots 30968.
    30968, 43020,
// PORT: SOURCE P32-P35_P72-P75.agc:872
//			NTP/2
// PORT: Fixed ROM slots 30969.
    30969, 57852,
// PORT: SOURCE P32-P35_P72-P75.agc:873
//CIRCL		SETPD	DLOAD
// PORT: Fixed ROM slots 30970.
    30970, 58626,
// PORT: SOURCE P32-P35_P72-P75.agc:874
//			00D
// PORT: Fixed ROM slots 30971.
    30971, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:875
//			P30ZERO
// PORT: Fixed ROM slots 30972.
    30972, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:876
//		PUSH
// PORT: Fixed ROM slots 30973.
    30973, 65292,
// PORT: SOURCE P32-P35_P72-P75.agc:877
//NTP/2		DLOAD	DMP
// PORT: Fixed ROM slots 30974.
    30974, 34250
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:878
//			NN
// PORT: Fixed ROM slots 30975.
    30975, 3694,
// PORT: SOURCE P32-P35_P72-P75.agc:879
//			HAFPA1
// PORT: Fixed ROM slots 30976.
    30976, 3848,
// PORT: SOURCE P32-P35_P72-P75.agc:880
//		SL	DSU
// PORT: Fixed ROM slots 30977.
    30977, 38242,
// PORT: SOURCE P32-P35_P72-P75.agc:881
//			14D
// PORT: Fixed ROM slots 30978.
    30978, 16670,
// PORT: SOURCE P32-P35_P72-P75.agc:882
//		DAD
// PORT: Fixed ROM slots 30979.
    30979, 65306,
// PORT: SOURCE P32-P35_P72-P75.agc:883
//			TCSI
// PORT: Fixed ROM slots 30980.
    30980, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:884
//		STORE	TCDH
// PORT: Fixed ROM slots 30981.
    30981, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:885
//		BDSU	AXT,2
// PORT: Fixed ROM slots 30982.
    30982, 64546,
// PORT: SOURCE P32-P35_P72-P75.agc:886
//			TTPI
// PORT: Fixed ROM slots 30983.
    30983, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:887
//			5D
// PORT: Fixed ROM slots 30984.
    30984, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:888
//		BMN	SETPD
// PORT: Fixed ROM slots 30985.
    30985, 33088,
// PORT: SOURCE P32-P35_P72-P75.agc:889
//			SCNDSOL
// PORT: Fixed ROM slots 30986.
    30986, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:890
//			0D
// PORT: Fixed ROM slots 30987.
    30987, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:891
//		VLOAD	PDVL
// PORT: Fixed ROM slots 30988.
    30988, 52730,
// PORT: SOURCE P32-P35_P72-P75.agc:892
//			VACT4
// PORT: Fixed ROM slots 30989.
    30989, 3820,
// PORT: SOURCE P32-P35_P72-P75.agc:893
//			RACT1
// PORT: Fixed ROM slots 30990.
    30990, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:894
//		CALL
// PORT: Fixed ROM slots 30991.
    30991, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:895
//			INTINT2C
// PORT: Fixed ROM slots 30992.
    30992, 58468,
// PORT: SOURCE P32-P35_P72-P75.agc:896
//		STOVL	RACT2
// PORT: Fixed ROM slots 30993.
    30993, 22930,
// PORT: SOURCE P32-P35_P72-P75.agc:897
//			VATT
// PORT: Fixed ROM slots 30994.
    30994, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:898
//		STOVL	VACT2
// PORT: Fixed ROM slots 30995.
    30995, 24216,
// PORT: SOURCE P32-P35_P72-P75.agc:899
//			VPASS1
// PORT: Fixed ROM slots 30996.
    30996, 3724,
// PORT: SOURCE P32-P35_P72-P75.agc:900
//		SETPD	PDVL
// PORT: Fixed ROM slots 30997.
    30997, 52482,
// PORT: SOURCE P32-P35_P72-P75.agc:901
//# Page 637
// PORT: SOURCE P32-P35_P72-P75.agc:902
//			0D
// PORT: Fixed ROM slots 30998.
    30998, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:903
//			RPASS1
// PORT: Fixed ROM slots 30999.
    30999, 3712,
// PORT: SOURCE P32-P35_P72-P75.agc:904
//		CALL
// PORT: Fixed ROM slots 31000.
    31000, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:905
//			INTINT2C
// PORT: Fixed ROM slots 31001.
    31001, 58468,
// PORT: SOURCE P32-P35_P72-P75.agc:906
//		STOVL	RPASS2
// PORT: Fixed ROM slots 31002.
    31002, 24228,
// PORT: SOURCE P32-P35_P72-P75.agc:907
//			VATT
// PORT: Fixed ROM slots 31003.
    31003, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:908
//		STCALL	VPASS2
// PORT: Fixed ROM slots 31004.
    31004, 32432,
// PORT: SOURCE P32-P35_P72-P75.agc:909
//			CDHMVR
// PORT: Fixed ROM slots 31005.
    31005, 58550,
// PORT: SOURCE P32-P35_P72-P75.agc:910
//		VLOAD	SETPD
// PORT: Fixed ROM slots 31006.
    31006, 33274,
// PORT: SOURCE P32-P35_P72-P75.agc:911
//			RACT2
// PORT: Fixed ROM slots 31007.
    31007, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:912
//			0D
// PORT: Fixed ROM slots 31008.
    31008, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:913
//		PDVL	CALL
// PORT: Fixed ROM slots 31009.
    31009, 38042,
// PORT: SOURCE P32-P35_P72-P75.agc:914
//			VACT3
// PORT: Fixed ROM slots 31010.
    31010, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:915
//			PERIAPO1
// PORT: Fixed ROM slots 31011.
    31011, 39324,
// PORT: SOURCE P32-P35_P72-P75.agc:916
//		CALL
// PORT: Fixed ROM slots 31012.
    31012, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:917
//			SHIFTR1
// PORT: Fixed ROM slots 31013.
    31013, 39468,
// PORT: SOURCE P32-P35_P72-P75.agc:918
//		STOVL	POSTCDH
// PORT: Fixed ROM slots 31014.
    31014, 24328,
// PORT: SOURCE P32-P35_P72-P75.agc:919
//			VACT3
// PORT: Fixed ROM slots 31015.
    31015, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:920
//		SETPD	PDVL
// PORT: Fixed ROM slots 31016.
    31016, 52482,
// PORT: SOURCE P32-P35_P72-P75.agc:921
//			0D
// PORT: Fixed ROM slots 31017.
    31017, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:922
//			RACT2
// PORT: Fixed ROM slots 31018.
    31018, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:923
//		PDDL	PDDL
// PORT: Fixed ROM slots 31019.
    31019, 54698,
// PORT: SOURCE P32-P35_P72-P75.agc:924
//			TCDH
// PORT: Fixed ROM slots 31020.
    31020, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:925
//			TTPI
// PORT: Fixed ROM slots 31021.
    31021, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:926
//		PDDL	PUSH
// PORT: Fixed ROM slots 31022.
    31022, 34474,
// PORT: SOURCE P32-P35_P72-P75.agc:927
//			TWOPI
// PORT: Fixed ROM slots 31023.
    31023, 28596,
// PORT: SOURCE P32-P35_P72-P75.agc:928
//		CALL
// PORT: Fixed ROM slots 31024.
    31024, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:929
//			INTINT
// PORT: Fixed ROM slots 31025.
    31025, 61036,
// PORT: SOURCE P32-P35_P72-P75.agc:930
//		CALL
// PORT: Fixed ROM slots 31026.
    31026, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:931
//			ACTIVE
// PORT: Fixed ROM slots 31027.
    31027, 39428,
// PORT: SOURCE P32-P35_P72-P75.agc:932
//		DLOAD
// PORT: Fixed ROM slots 31028.
    31028, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:933
//			ELEV
// PORT: Fixed ROM slots 31029.
    31029, 2398,
// PORT: SOURCE P32-P35_P72-P75.agc:934
//		SETPD	SINE
// PORT: Fixed ROM slots 31030.
    31030, 60930,
// PORT: SOURCE P32-P35_P72-P75.agc:935
//			6D
// PORT: Fixed ROM slots 31031.
    31031, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:936
//		PDVL	UNIT
// PORT: Fixed ROM slots 31032.
    31032, 44698,
// PORT: SOURCE P32-P35_P72-P75.agc:937
//			RACT3
// PORT: Fixed ROM slots 31033.
    31033, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:938
//		STORE	00D		# URA3 AT 00D
// PORT: Fixed ROM slots 31034.
    31034, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:939
//		PDVL	VXV		# PL14D, PL08D
// PORT: Fixed ROM slots 31035.
    31035, 40346,
// PORT: SOURCE P32-P35_P72-P75.agc:940
//			UP1
// PORT: Fixed ROM slots 31036.
    31036, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:941
//		UNIT
// PORT: Fixed ROM slots 31037.
    31037, 65372,
// PORT: SOURCE P32-P35_P72-P75.agc:942
//		PDDL	COSINE		# UNIT(URA3 X UVA3 X URA3) = UH3	B1 PL14D
// PORT: Fixed ROM slots 31038.
    31038, 59050,
// PORT: SOURCE P32-P35_P72-P75.agc:943
//			ELEV
// PORT: Fixed ROM slots 31039.
    31039, 2398,
// PORT: SOURCE P32-P35_P72-P75.agc:944
//		VXSC	STADR		# (COSLOS)(UH3)				B2 PL08D
// PORT: Fixed ROM slots 31040.
    31040, 38626,
// PORT: SOURCE P32-P35_P72-P75.agc:945
//		STORE	18D		#	PLUS
// PORT: Fixed ROM slots 31041.
    31041, 65496,
// PORT: SOURCE P32-P35_P72-P75.agc:946
//		DLOAD	VXSC		# (SINLOS)(URA3) = U			B2 PL00D
// PORT: Fixed ROM slots 31042.
    31042, 61898,
// PORT: SOURCE P32-P35_P72-P75.agc:947
//		VAD	VSL1
// PORT: Fixed ROM slots 31043.
    31043, 64090,
// PORT: SOURCE P32-P35_P72-P75.agc:948
//			18D		#					B1
// PORT: Fixed ROM slots 31044.
    31044, 38,
// PORT: SOURCE P32-P35_P72-P75.agc:949
//		PUSH	DOT		#					   PL06D
// PORT: Fixed ROM slots 31045.
    31045, 41228,
// PORT: SOURCE P32-P35_P72-P75.agc:950
//			RACT3		# (U . RA3) = TEMP1	      B1 +B29 = B30
// PORT: Fixed ROM slots 31046.
    31046, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:951
//		SL1	PUSH		#				       B29 PL08D
// PORT: Fixed ROM slots 31047.
    31047, 34516,
// PORT: SOURCE P32-P35_P72-P75.agc:952
//# Page 638
// PORT: SOURCE P32-P35_P72-P75.agc:953
//		DSQ	TLOAD		# TEMP1**2			       B58
// PORT: Fixed ROM slots 31048.
    31048, 59804,
// PORT: SOURCE P32-P35_P72-P75.agc:954
//			MPAC
// PORT: Fixed ROM slots 31049.
    31049, 218,
// PORT: SOURCE P32-P35_P72-P75.agc:955
//		PDVL	DOT		#					   PL11D
// PORT: Fixed ROM slots 31050.
    31050, 41370,
// PORT: SOURCE P32-P35_P72-P75.agc:956
//			RACT3
// PORT: Fixed ROM slots 31051.
    31051, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:957
//			RACT3
// PORT: Fixed ROM slots 31052.
    31052, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:958
//		TLOAD	DCOMP		# RA3 . RA3
// PORT: Fixed ROM slots 31053.
    31053, 48850,
// PORT: SOURCE P32-P35_P72-P75.agc:959
//			MPAC
// PORT: Fixed ROM slots 31054.
    31054, 218,
// PORT: SOURCE P32-P35_P72-P75.agc:960
//		PDVL	DOT		# RP3 . RP3			       B58 PL14D
// PORT: Fixed ROM slots 31055.
    31055, 41370,
// PORT: SOURCE P32-P35_P72-P75.agc:961
//			RPASS3
// PORT: Fixed ROM slots 31056.
    31056, 3796,
// PORT: SOURCE P32-P35_P72-P75.agc:962
//			RPASS3		#					   PL11D
// PORT: Fixed ROM slots 31057.
    31057, 3796,
// PORT: SOURCE P32-P35_P72-P75.agc:963
//		TAD	TAD		# TEMP1**2 + RA3.RA3 + RP3.RP3 = TEMP2	   PL08D
// PORT: Fixed ROM slots 31058.
    31058, 63986,
// PORT: SOURCE P32-P35_P72-P75.agc:964
//		BPL	DLOAD
// PORT: Fixed ROM slots 31059.
    31059, 58696,
// PORT: SOURCE P32-P35_P72-P75.agc:965
//			K10RK2
// PORT: Fixed ROM slots 31060.
    31060, 58052,
// PORT: SOURCE P32-P35_P72-P75.agc:966
//			LOOPCT
// PORT: Fixed ROM slots 31061.
    31061, 3852,
// PORT: SOURCE P32-P35_P72-P75.agc:967
//		DSU	AXT,2
// PORT: Fixed ROM slots 31062.
    31062, 64554,
// PORT: SOURCE P32-P35_P72-P75.agc:968
//			1DPB28
// PORT: Fixed ROM slots 31063.
    31063, 24692,
// PORT: SOURCE P32-P35_P72-P75.agc:969
//			1D
// PORT: Fixed ROM slots 31064.
    31064, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:970
//		BZE
// PORT: Fixed ROM slots 31065.
    31065, 65368,
// PORT: SOURCE P32-P35_P72-P75.agc:971
//			ALMXITA
// PORT: Fixed ROM slots 31066.
    31066, 59452,
// PORT: SOURCE P32-P35_P72-P75.agc:972
//		DLOAD	SR1
// PORT: Fixed ROM slots 31067.
    31067, 58058,
// PORT: SOURCE P32-P35_P72-P75.agc:973
//			DELDV
// PORT: Fixed ROM slots 31068.
    31068, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:974
//		STORE	DELDV
// PORT: Fixed ROM slots 31069.
    31069, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:975
//		BDSU
// PORT: Fixed ROM slots 31070.
    31070, 65314,
// PORT: SOURCE P32-P35_P72-P75.agc:976
//			DVPREV
// PORT: Fixed ROM slots 31071.
    31071, 3836,
// PORT: SOURCE P32-P35_P72-P75.agc:977
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 31072.
    31072, 32504,
// PORT: SOURCE P32-P35_P72-P75.agc:978
//			CSI/B1
// PORT: Fixed ROM slots 31073.
    31073, 57578,
// PORT: SOURCE P32-P35_P72-P75.agc:979
//K10RK2		SQRT	PUSH		# TEMP3 = TEMP2**.5		       B29 PL10D
// PORT: Fixed ROM slots 31074.
    31074, 34540,
// PORT: SOURCE P32-P35_P72-P75.agc:980
//		DCOMP	DSU
// PORT: Fixed ROM slots 31075.
    31075, 38268,
// PORT: SOURCE P32-P35_P72-P75.agc:981
//			06D		# -TEMP1-TEMP3 = K2 AT 10D
// PORT: Fixed ROM slots 31076.
    31076, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:982
//		STODL	10D		#					   PL08D
// PORT: Fixed ROM slots 31077.
    31077, 12310,
// PORT: SOURCE P32-P35_P72-P75.agc:983
//		DSU	STADR		#					   PL06D
// PORT: Fixed ROM slots 31078.
    31078, 38442,
// PORT: SOURCE P32-P35_P72-P75.agc:984
//		STORE	12D		# -TEMP1+TEMP3 = K1 AT 12D
// PORT: Fixed ROM slots 31079.
    31079, 65508,
// PORT: SOURCE P32-P35_P72-P75.agc:985
//		ABS
// PORT: Fixed ROM slots 31080.
    31080, 65356,
// PORT: SOURCE P32-P35_P72-P75.agc:986
//		STODL	14D
// PORT: Fixed ROM slots 31081.
    31081, 12318,
// PORT: SOURCE P32-P35_P72-P75.agc:987
//			10D
// PORT: Fixed ROM slots 31082.
    31082, 22,
// PORT: SOURCE P32-P35_P72-P75.agc:988
//		ABS	DSU
// PORT: Fixed ROM slots 31083.
    31083, 38220,
// PORT: SOURCE P32-P35_P72-P75.agc:989
//			14D
// PORT: Fixed ROM slots 31084.
    31084, 30,
// PORT: SOURCE P32-P35_P72-P75.agc:990
//		BMN	DLOAD
// PORT: Fixed ROM slots 31085.
    31085, 58688,
// PORT: SOURCE P32-P35_P72-P75.agc:991
//			K2.
// PORT: Fixed ROM slots 31086.
    31086, 58082,
// PORT: SOURCE P32-P35_P72-P75.agc:992
//			12D
// PORT: Fixed ROM slots 31087.
    31087, 26,
// PORT: SOURCE P32-P35_P72-P75.agc:993
//		STORE	10D		# K = K1
// PORT: Fixed ROM slots 31088.
    31088, 22,
// PORT: SOURCE P32-P35_P72-P75.agc:994
//K2.		DLOAD
// PORT: Fixed ROM slots 31089.
    31089, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:995
//			10D
// PORT: Fixed ROM slots 31090.
    31090, 22,
// PORT: SOURCE P32-P35_P72-P75.agc:996
//		VXSC	VSL1
// PORT: Fixed ROM slots 31091.
    31091, 64226,
// PORT: SOURCE P32-P35_P72-P75.agc:997
//		VAD	UNIT		# V = RA3 + KU UNIT			B1
// PORT: Fixed ROM slots 31092.
    31092, 44634,
// PORT: SOURCE P32-P35_P72-P75.agc:998
//			RACT3
// PORT: Fixed ROM slots 31093.
    31093, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:999
//		PDVL	UNIT
// PORT: Fixed ROM slots 31094.
    31094, 44698,
// PORT: SOURCE P32-P35_P72-P75.agc:1000
//			RPASS3		#					   PL06D
// PORT: Fixed ROM slots 31095.
    31095, 3796,
// PORT: SOURCE P32-P35_P72-P75.agc:1001
//		PDVL	UNIT
// PORT: Fixed ROM slots 31096.
    31096, 44698,
// PORT: SOURCE P32-P35_P72-P75.agc:1002
//			VPASS3		#					   PL12D
// PORT: Fixed ROM slots 31097.
    31097, 3808,
// PORT: SOURCE P32-P35_P72-P75.agc:1003
//# Page 639
// PORT: SOURCE P32-P35_P72-P75.agc:1004
//		VXV	PDVL		# UVP3 X URP3				   PL18D
// PORT: Fixed ROM slots 31098.
    31098, 52538,
// PORT: SOURCE P32-P35_P72-P75.agc:1005
//			06D
// PORT: Fixed ROM slots 31099.
    31099, 14
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:1006
//			06D
// PORT: Fixed ROM slots 31100.
    31100, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:1007
//		VXV	DOT
// PORT: Fixed ROM slots 31101.
    31101, 41274,
// PORT: SOURCE P32-P35_P72-P75.agc:1008
//			00D
// PORT: Fixed ROM slots 31102.
    31102, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1009
//		STADR			#					   PL12D
// PORT: Fixed ROM slots 31103.
    31103, 65324,
// PORT: SOURCE P32-P35_P72-P75.agc:1010
//		STOVL	12D		# (URP3 X V).(UVP3 X URP3)=TEMP		   PL06D
// PORT: Fixed ROM slots 31104.
    31104, 45028,
// PORT: SOURCE P32-P35_P72-P75.agc:1011
//		DOT	SL1		#					   PL00D
// PORT: Fixed ROM slots 31105.
    31105, 59970,
// PORT: SOURCE P32-P35_P72-P75.agc:1012
//		ARCCOS	SIGN
// PORT: Fixed ROM slots 31106.
    31106, 62892,
// PORT: SOURCE P32-P35_P72-P75.agc:1013
//			12D		#					B0
// PORT: Fixed ROM slots 31107.
    31107, 26,
// PORT: SOURCE P32-P35_P72-P75.agc:1014
//		SR1	PUSH		# GAMMA = SIGN(TEMP)ARCOS(UNITV.URP3)	   PL02D
// PORT: Fixed ROM slots 31108.
    31108, 34500,
// PORT: SOURCE P32-P35_P72-P75.agc:1015
//		BON	DLOAD
// PORT: Fixed ROM slots 31109.
    31109, 58648,
// PORT: SOURCE P32-P35_P72-P75.agc:1016
//			S32.1F2
// PORT: Fixed ROM slots 31110.
    31110, 3458,
// PORT: SOURCE P32-P35_P72-P75.agc:1017
//			FRSTPAS
// PORT: Fixed ROM slots 31111.
    31111, 58184,
// PORT: SOURCE P32-P35_P72-P75.agc:1018
//			00D		# NOT THE FIRST PASS OF A CYCLE
// PORT: Fixed ROM slots 31112.
    31112, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1019
//		DSU	PDDL		# GAMMA-GAMPREV				B1 PL04D
// PORT: Fixed ROM slots 31113.
    31113, 54570,
// PORT: SOURCE P32-P35_P72-P75.agc:1020
//			GAMPREV
// PORT: Fixed ROM slots 31114.
    31114, 3856,
// PORT: SOURCE P32-P35_P72-P75.agc:1021
//			DELVCSI
// PORT: Fixed ROM slots 31115.
    31115, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:1022
//		DSU	NORM		#					B7
// PORT: Fixed ROM slots 31116.
    31116, 49450,
// PORT: SOURCE P32-P35_P72-P75.agc:1023
//			DVPREV
// PORT: Fixed ROM slots 31117.
    31117, 3836,
// PORT: SOURCE P32-P35_P72-P75.agc:1024
//			X1
// PORT: Fixed ROM slots 31118.
    31118, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:1025
//		BDDV	PDDL		# (GAM-GAMPREV)/(DV-DVPREV)	     B-6+N1 PL06D
// PORT: Fixed ROM slots 31119.
    31119, 54634,
// PORT: SOURCE P32-P35_P72-P75.agc:1026
//			02D		#	= SLOPE
// PORT: Fixed ROM slots 31120.
    31120, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:1027
//			DELVCSI
// PORT: Fixed ROM slots 31121.
    31121, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:1028
//		STORE	DVPREV
// PORT: Fixed ROM slots 31122.
    31122, 3836,
// PORT: SOURCE P32-P35_P72-P75.agc:1029
//		BOFF	BOFF
// PORT: Fixed ROM slots 31123.
    31123, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1030
//			S32.1F3A
// PORT: Fixed ROM slots 31124.
    31124, 3524,
// PORT: SOURCE P32-P35_P72-P75.agc:1031
//			THRDCHK
// PORT: Fixed ROM slots 31125.
    31125, 58204,
// PORT: SOURCE P32-P35_P72-P75.agc:1032
//			S32.1F3B
// PORT: Fixed ROM slots 31126.
    31126, 3526,
// PORT: SOURCE P32-P35_P72-P75.agc:1033
//			THRDCHK
// PORT: Fixed ROM slots 31127.
    31127, 58204,
// PORT: SOURCE P32-P35_P72-P75.agc:1034
//		DLOAD	DMP
// PORT: Fixed ROM slots 31128.
    31128, 34250,
// PORT: SOURCE P32-P35_P72-P75.agc:1035
//			02D
// PORT: Fixed ROM slots 31129.
    31129, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:1036
//			GAMPREV
// PORT: Fixed ROM slots 31130.
    31130, 3856,
// PORT: SOURCE P32-P35_P72-P75.agc:1037
//		BPL	DLOAD
// PORT: Fixed ROM slots 31131.
    31131, 58696,
// PORT: SOURCE P32-P35_P72-P75.agc:1038
//			FIFTYFPS
// PORT: Fixed ROM slots 31132.
    31132, 58214,
// PORT: SOURCE P32-P35_P72-P75.agc:1039
//			INITST
// PORT: Fixed ROM slots 31133.
    31133, 24676,
// PORT: SOURCE P32-P35_P72-P75.agc:1040
//		SIGN
// PORT: Fixed ROM slots 31134.
    31134, 65514,
// PORT: SOURCE P32-P35_P72-P75.agc:1041
//			DELDV
// PORT: Fixed ROM slots 31135.
    31135, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1042
//		STORE	DELDV
// PORT: Fixed ROM slots 31136.
    31136, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1043
//		SET	CLEAR
// PORT: Fixed ROM slots 31137.
    31137, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1044
//			S32.1F3A
// PORT: Fixed ROM slots 31138.
    31138, 3172,
// PORT: SOURCE P32-P35_P72-P75.agc:1045
//			S32.1F3B
// PORT: Fixed ROM slots 31139.
    31139, 3430,
// PORT: SOURCE P32-P35_P72-P75.agc:1046
//FRSTPAS		DLOAD
// PORT: Fixed ROM slots 31140.
    31140, 65482,
// PORT: SOURCE P32-P35_P72-P75.agc:1047
//			00D
// PORT: Fixed ROM slots 31141.
    31141, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1048
//		STODL	GAMPREV
// PORT: Fixed ROM slots 31142.
    31142, 16144,
// PORT: SOURCE P32-P35_P72-P75.agc:1049
//			DELVCSI
// PORT: Fixed ROM slots 31143.
    31143, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:1050
//		STORE	DVPREV
// PORT: Fixed ROM slots 31144.
    31144, 3836,
// PORT: SOURCE P32-P35_P72-P75.agc:1051
//		DSU	CLEAR
// PORT: Fixed ROM slots 31145.
    31145, 35882,
// PORT: SOURCE P32-P35_P72-P75.agc:1052
//			DELDV
// PORT: Fixed ROM slots 31146.
    31146, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1053
//			S32.1F2
// PORT: Fixed ROM slots 31147.
    31147, 3426,
// PORT: SOURCE P32-P35_P72-P75.agc:1054
//# Page 640
// PORT: SOURCE P32-P35_P72-P75.agc:1055
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 31148.
    31148, 32504,
// PORT: SOURCE P32-P35_P72-P75.agc:1056
//			CSI/B1
// PORT: Fixed ROM slots 31149.
    31149, 57578,
// PORT: SOURCE P32-P35_P72-P75.agc:1057
//THRDCHK		BON	BON
// PORT: Fixed ROM slots 31150.
    31150, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1058
//			S32.1F3A
// PORT: Fixed ROM slots 31151.
    31151, 3460,
// PORT: SOURCE P32-P35_P72-P75.agc:1059
//			NEWTN
// PORT: Fixed ROM slots 31152.
    31152, 58244,
// PORT: SOURCE P32-P35_P72-P75.agc:1060
//			S32.1F3B
// PORT: Fixed ROM slots 31153.
    31153, 3462,
// PORT: SOURCE P32-P35_P72-P75.agc:1061
//			NEWTN
// PORT: Fixed ROM slots 31154.
    31154, 58244,
// PORT: SOURCE P32-P35_P72-P75.agc:1062
//FIFTYFPS	DLOAD	SIGN
// PORT: Fixed ROM slots 31155.
    31155, 62922,
// PORT: SOURCE P32-P35_P72-P75.agc:1063
//			FIFPSDP
// PORT: Fixed ROM slots 31156.
    31156, 24708,
// PORT: SOURCE P32-P35_P72-P75.agc:1064
//			04D
// PORT: Fixed ROM slots 31157.
    31157, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:1065
//		SIGN
// PORT: Fixed ROM slots 31158.
    31158, 65514,
// PORT: SOURCE P32-P35_P72-P75.agc:1066
//			GAMPREV
// PORT: Fixed ROM slots 31159.
    31159, 3856,
// PORT: SOURCE P32-P35_P72-P75.agc:1067
//		STORE	DELDV
// PORT: Fixed ROM slots 31160.
    31160, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1068
//		DCOMP	DAD
// PORT: Fixed ROM slots 31161.
    31161, 36220,
// PORT: SOURCE P32-P35_P72-P75.agc:1069
//			DELVCSI
// PORT: Fixed ROM slots 31162.
    31162, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:1070
//		STODL	DELVCSI
// PORT: Fixed ROM slots 31163.
    31163, 16120,
// PORT: SOURCE P32-P35_P72-P75.agc:1071
//			00D
// PORT: Fixed ROM slots 31164.
    31164, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1072
//		SET	SET
// PORT: Fixed ROM slots 31165.
    31165, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1073
//			S32.1F3B
// PORT: Fixed ROM slots 31166.
    31166, 3174,
// PORT: SOURCE P32-P35_P72-P75.agc:1074
//			S32.1F3A
// PORT: Fixed ROM slots 31167.
    31167, 3172,
// PORT: SOURCE P32-P35_P72-P75.agc:1075
//		STCALL	GAMPREV
// PORT: Fixed ROM slots 31168.
    31168, 32528,
// PORT: SOURCE P32-P35_P72-P75.agc:1076
//			CSI/B2
// PORT: Fixed ROM slots 31169.
    31169, 57596,
// PORT: SOURCE P32-P35_P72-P75.agc:1077
//NEWTN		DLOAD	NORM
// PORT: Fixed ROM slots 31170.
    31170, 49610,
// PORT: SOURCE P32-P35_P72-P75.agc:1078
//			04D
// PORT: Fixed ROM slots 31171.
    31171, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:1079
//			X2
// PORT: Fixed ROM slots 31172.
    31172, 80,
// PORT: SOURCE P32-P35_P72-P75.agc:1080
//		BDDV	XSU,1
// PORT: Fixed ROM slots 31173.
    31173, 45162,
// PORT: SOURCE P32-P35_P72-P75.agc:1081
//			00D
// PORT: Fixed ROM slots 31174.
    31174, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1082
//			X2
// PORT: Fixed ROM slots 31175.
    31175, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:1083
//		SR*
// PORT: Fixed ROM slots 31176.
    31176, 65374,
// PORT: SOURCE P32-P35_P72-P75.agc:1084
//			0,1
// PORT: Fixed ROM slots 31177.
    31177, 17154,
// PORT: SOURCE P32-P35_P72-P75.agc:1085
//		STODL	DELDV
// PORT: Fixed ROM slots 31178.
    31178, 16148,
// PORT: SOURCE P32-P35_P72-P75.agc:1086
//			00D
// PORT: Fixed ROM slots 31179.
    31179, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1087
//		STORE	GAMPREV
// PORT: Fixed ROM slots 31180.
    31180, 3856,
// PORT: SOURCE P32-P35_P72-P75.agc:1088
//		DLOAD	ABS
// PORT: Fixed ROM slots 31181.
    31181, 42698,
// PORT: SOURCE P32-P35_P72-P75.agc:1089
//			DELDV		#					   PL08D
// PORT: Fixed ROM slots 31182.
    31182, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1090
//		PUSH	DSU
// PORT: Fixed ROM slots 31183.
    31183, 38156,
// PORT: SOURCE P32-P35_P72-P75.agc:1091
//			EPSILN1
// PORT: Fixed ROM slots 31184.
    31184, 24700,
// PORT: SOURCE P32-P35_P72-P75.agc:1092
//		BMN	DLOAD
// PORT: Fixed ROM slots 31185.
    31185, 58688,
// PORT: SOURCE P32-P35_P72-P75.agc:1093
//			CSI/SOL
// PORT: Fixed ROM slots 31186.
    31186, 58302,
// PORT: SOURCE P32-P35_P72-P75.agc:1094
//		DSU	BMN
// PORT: Fixed ROM slots 31187.
    31187, 41002,
// PORT: SOURCE P32-P35_P72-P75.agc:1095
//			DELMAX1
// PORT: Fixed ROM slots 31188.
    31188, 24716,
// PORT: SOURCE P32-P35_P72-P75.agc:1096
//			CSISTEP
// PORT: Fixed ROM slots 31189.
    31189, 58292,
// PORT: SOURCE P32-P35_P72-P75.agc:1097
//		DLOAD	SIGN
// PORT: Fixed ROM slots 31190.
    31190, 62922,
// PORT: SOURCE P32-P35_P72-P75.agc:1098
//			DELMAX1
// PORT: Fixed ROM slots 31191.
    31191, 24716,
// PORT: SOURCE P32-P35_P72-P75.agc:1099
//			DELDV
// PORT: Fixed ROM slots 31192.
    31192, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1100
//		STORE	DELDV
// PORT: Fixed ROM slots 31193.
    31193, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1101
//CSISTEP		DLOAD	DSU
// PORT: Fixed ROM slots 31194.
    31194, 38346,
// PORT: SOURCE P32-P35_P72-P75.agc:1102
//			DELVCSI
// PORT: Fixed ROM slots 31195.
    31195, 3832,
// PORT: SOURCE P32-P35_P72-P75.agc:1103
//			DELDV
// PORT: Fixed ROM slots 31196.
    31196, 3860,
// PORT: SOURCE P32-P35_P72-P75.agc:1104
//		STCALL	DELVCSI
// PORT: Fixed ROM slots 31197.
    31197, 32504,
// PORT: SOURCE P32-P35_P72-P75.agc:1105
//# Page 641
// PORT: SOURCE P32-P35_P72-P75.agc:1106
//			CSI/B1
// PORT: Fixed ROM slots 31198.
    31198, 57578,
// PORT: SOURCE P32-P35_P72-P75.agc:1107
//CSI/SOL		DLOAD	AXT,2
// PORT: Fixed ROM slots 31199.
    31199, 64714,
// PORT: SOURCE P32-P35_P72-P75.agc:1108
//			POSTCSI
// PORT: Fixed ROM slots 31200.
    31200, 3844,
// PORT: SOURCE P32-P35_P72-P75.agc:1109
//			2
// PORT: Fixed ROM slots 31201.
    31201, 4,
// PORT: SOURCE P32-P35_P72-P75.agc:1110
//		LXA,1
// PORT: Fixed ROM slots 31202.
    31202, 65488,
// PORT: SOURCE P32-P35_P72-P75.agc:1111
//			RTX1
// PORT: Fixed ROM slots 31203.
    31203, 3068,
// PORT: SOURCE P32-P35_P72-P75.agc:1112
//		DSU*	BMN
// PORT: Fixed ROM slots 31204.
    31204, 40998,
// PORT: SOURCE P32-P35_P72-P75.agc:1113
//			PMINE 	-2,1
// PORT: Fixed ROM slots 31205.
    31205, 24692,
// PORT: SOURCE P32-P35_P72-P75.agc:1114
//			SCNDSOL
// PORT: Fixed ROM slots 31206.
    31206, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:1115
//		AXT,2	DLOAD
// PORT: Fixed ROM slots 31207.
    31207, 58872,
// PORT: SOURCE P32-P35_P72-P75.agc:1116
//			3
// PORT: Fixed ROM slots 31208.
    31208, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:1117
//			POSTCDH
// PORT: Fixed ROM slots 31209.
    31209, 3848,
// PORT: SOURCE P32-P35_P72-P75.agc:1118
//		DSU*	BMN
// PORT: Fixed ROM slots 31210.
    31210, 40998,
// PORT: SOURCE P32-P35_P72-P75.agc:1119
//			PMINE 	-2,1
// PORT: Fixed ROM slots 31211.
    31211, 24692,
// PORT: SOURCE P32-P35_P72-P75.agc:1120
//			SCNDSOL
// PORT: Fixed ROM slots 31212.
    31212, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:1121
//		DLOAD	DSU
// PORT: Fixed ROM slots 31213.
    31213, 38346,
// PORT: SOURCE P32-P35_P72-P75.agc:1122
//			TCDH
// PORT: Fixed ROM slots 31214.
    31214, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:1123
//			TCSI
// PORT: Fixed ROM slots 31215.
    31215, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:1124
//		STORE	T1TOT2
// PORT: Fixed ROM slots 31216.
    31216, 2390,
// PORT: SOURCE P32-P35_P72-P75.agc:1125
//		AXT,2	DSU
// PORT: Fixed ROM slots 31217.
    31217, 38392,
// PORT: SOURCE P32-P35_P72-P75.agc:1126
//			4
// PORT: Fixed ROM slots 31218.
    31218, 8,
// PORT: SOURCE P32-P35_P72-P75.agc:1127
//			TMIN
// PORT: Fixed ROM slots 31219.
    31219, 24724,
// PORT: SOURCE P32-P35_P72-P75.agc:1128
//		BMN	AXT,2
// PORT: Fixed ROM slots 31220.
    31220, 64576,
// PORT: SOURCE P32-P35_P72-P75.agc:1129
//			SCNDSOL
// PORT: Fixed ROM slots 31221.
    31221, 58364,
// PORT: SOURCE P32-P35_P72-P75.agc:1130
//			5
// PORT: Fixed ROM slots 31222.
    31222, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:1131
//		DLOAD	DSU
// PORT: Fixed ROM slots 31223.
    31223, 38346,
// PORT: SOURCE P32-P35_P72-P75.agc:1132
//			TTPI
// PORT: Fixed ROM slots 31224.
    31224, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:1133
//			TCDH
// PORT: Fixed ROM slots 31225.
    31225, 2046
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:1134
//		STORE	T2TOT3
// PORT: Fixed ROM slots 31226.
    31226, 2394,
// PORT: SOURCE P32-P35_P72-P75.agc:1135
//		DSU	BPL
// PORT: Fixed ROM slots 31227.
    31227, 42026,
// PORT: SOURCE P32-P35_P72-P75.agc:1136
//			TMIN
// PORT: Fixed ROM slots 31228.
    31228, 24724,
// PORT: SOURCE P32-P35_P72-P75.agc:1137
//			P32/P72C
// PORT: Fixed ROM slots 31229.
    31229, 59604,
// PORT: SOURCE P32-P35_P72-P75.agc:1138
//SCNDSOL		BON	BOFF
// PORT: Fixed ROM slots 31230.
    31230, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1139
//			S32.1F3A
// PORT: Fixed ROM slots 31231.
    31231, 3460,
// PORT: SOURCE P32-P35_P72-P75.agc:1140
//			ALMXIT
// PORT: Fixed ROM slots 31232.
    31232, 59456,
// PORT: SOURCE P32-P35_P72-P75.agc:1141
//			S32.1F3B
// PORT: Fixed ROM slots 31233.
    31233, 3526,
// PORT: SOURCE P32-P35_P72-P75.agc:1142
//			ALMXIT
// PORT: Fixed ROM slots 31234.
    31234, 59456,
// PORT: SOURCE P32-P35_P72-P75.agc:1143
//		SXA,2	DLOAD
// PORT: Fixed ROM slots 31235.
    31235, 58808,
// PORT: SOURCE P32-P35_P72-P75.agc:1144
//			CSIALRM
// PORT: Fixed ROM slots 31236.
    31236, 3862,
// PORT: SOURCE P32-P35_P72-P75.agc:1145
//			P30ZERO
// PORT: Fixed ROM slots 31237.
    31237, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:1146
//		CLEAR	SET
// PORT: Fixed ROM slots 31238.
    31238, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1147
//			S32.1F1
// PORT: Fixed ROM slots 31239.
    31239, 3424,
// PORT: SOURCE P32-P35_P72-P75.agc:1148
//			S32.1F2
// PORT: Fixed ROM slots 31240.
    31240, 3170,
// PORT: SOURCE P32-P35_P72-P75.agc:1149
//		CLEAR	CLEAR
// PORT: Fixed ROM slots 31241.
    31241, 35864,
// PORT: SOURCE P32-P35_P72-P75.agc:1150
//			S32.1F3A
// PORT: Fixed ROM slots 31242.
    31242, 3428,
// PORT: SOURCE P32-P35_P72-P75.agc:1151
//			S32.1F3B
// PORT: Fixed ROM slots 31243.
    31243, 3430,
// PORT: SOURCE P32-P35_P72-P75.agc:1152
//		STCALL	LOOPCT
// PORT: Fixed ROM slots 31244.
    31244, 32524,
// PORT: SOURCE P32-P35_P72-P75.agc:1153
//			CSI/B
// PORT: Fixed ROM slots 31245.
    31245, 57514,
// PORT: SOURCE P32-P35_P72-P75.agc:1154
//
// PORT: SOURCE P32-P35_P72-P75.agc:1155
//# Page 642
// PORT: SOURCE P32-P35_P72-P75.agc:1156
//# ***** ADVANCE *****
// PORT: SOURCE P32-P35_P72-P75.agc:1157
//#
// PORT: SOURCE P32-P35_P72-P75.agc:1158
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:1159
//#	PRECSET
// PORT: SOURCE P32-P35_P72-P75.agc:1160
//#	ROTATE
// PORT: SOURCE P32-P35_P72-P75.agc:1161
//
// PORT: SOURCE P32-P35_P72-P75.agc:1162
//ADVANCE		STQ	DLOAD
// PORT: Fixed ROM slots 31246.
    31246, 58656,
// PORT: SOURCE P32-P35_P72-P75.agc:1163
//			SUBEXIT
// PORT: Fixed ROM slots 31247.
    31247, 3696,
// PORT: SOURCE P32-P35_P72-P75.agc:1164
//			TIG
// PORT: Fixed ROM slots 31248.
    31248, 3652,
// PORT: SOURCE P32-P35_P72-P75.agc:1165
//		STCALL	TDEC1
// PORT: Fixed ROM slots 31249.
    31249, 28738,
// PORT: SOURCE P32-P35_P72-P75.agc:1166
//			PRECSET
// PORT: Fixed ROM slots 31250.
    31250, 39392,
// PORT: SOURCE P32-P35_P72-P75.agc:1167
//		SET	VLOAD
// PORT: Fixed ROM slots 31251.
    31251, 64792,
// PORT: SOURCE P32-P35_P72-P75.agc:1168
//			XDELVFLG
// PORT: Fixed ROM slots 31252.
    31252, 1134,
// PORT: SOURCE P32-P35_P72-P75.agc:1169
//			VPASS3
// PORT: Fixed ROM slots 31253.
    31253, 3808,
// PORT: SOURCE P32-P35_P72-P75.agc:1170
//		STORE	VPASS2
// PORT: Fixed ROM slots 31254.
    31254, 3760,
// PORT: SOURCE P32-P35_P72-P75.agc:1171
//		STOVL	VPASS1
// PORT: Fixed ROM slots 31255.
    31255, 24204,
// PORT: SOURCE P32-P35_P72-P75.agc:1172
//			RPASS3
// PORT: Fixed ROM slots 31256.
    31256, 3796,
// PORT: SOURCE P32-P35_P72-P75.agc:1173
//		STORE	RPASS2
// PORT: Fixed ROM slots 31257.
    31257, 3748,
// PORT: SOURCE P32-P35_P72-P75.agc:1174
//		STORE	RPASS1
// PORT: Fixed ROM slots 31258.
    31258, 3712,
// PORT: SOURCE P32-P35_P72-P75.agc:1175
//		UNIT	VXV
// PORT: Fixed ROM slots 31259.
    31259, 40284,
// PORT: SOURCE P32-P35_P72-P75.agc:1176
//			VPASS1
// PORT: Fixed ROM slots 31260.
    31260, 3724,
// PORT: SOURCE P32-P35_P72-P75.agc:1177
//		UNIT
// PORT: Fixed ROM slots 31261.
    31261, 65372,
// PORT: SOURCE P32-P35_P72-P75.agc:1178
//		STOVL	UP1
// PORT: Fixed ROM slots 31262.
    31262, 22882,
// PORT: SOURCE P32-P35_P72-P75.agc:1179
//			RACT3
// PORT: Fixed ROM slots 31263.
    31263, 3772,
// PORT: SOURCE P32-P35_P72-P75.agc:1180
//		STCALL	RTIG
// PORT: Fixed ROM slots 31264.
    31264, 32580,
// PORT: SOURCE P32-P35_P72-P75.agc:1181
//			ROTATE
// PORT: Fixed ROM slots 31265.
    31265, 58452,
// PORT: SOURCE P32-P35_P72-P75.agc:1182
//		STORE	RACT2
// PORT: Fixed ROM slots 31266.
    31266, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:1183
//		STOVL	RACT1
// PORT: Fixed ROM slots 31267.
    31267, 22918,
// PORT: SOURCE P32-P35_P72-P75.agc:1184
//			VACT3
// PORT: Fixed ROM slots 31268.
    31268, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:1185
//		STCALL	VTIG
// PORT: Fixed ROM slots 31269.
    31269, 32592,
// PORT: SOURCE P32-P35_P72-P75.agc:1186
//			ROTATE
// PORT: Fixed ROM slots 31270.
    31270, 58452,
// PORT: SOURCE P32-P35_P72-P75.agc:1187
//		STORE	VACT2
// PORT: Fixed ROM slots 31271.
    31271, 3736,
// PORT: SOURCE P32-P35_P72-P75.agc:1188
//		STCALL	VACT1
// PORT: Fixed ROM slots 31272.
    31272, 32372,
// PORT: SOURCE P32-P35_P72-P75.agc:1189
//			SUBEXIT
// PORT: Fixed ROM slots 31273.
    31273, 3696,
// PORT: SOURCE P32-P35_P72-P75.agc:1190
//
// PORT: SOURCE P32-P35_P72-P75.agc:1191
//# Page 643
// PORT: SOURCE P32-P35_P72-P75.agc:1192
//# ***** ROTATE *****
// PORT: SOURCE P32-P35_P72-P75.agc:1193
//
// PORT: SOURCE P32-P35_P72-P75.agc:1194
//ROTATE		PUSH	PUSH
// PORT: Fixed ROM slots 31274.
    31274, 34316,
// PORT: SOURCE P32-P35_P72-P75.agc:1195
//		DOT	VXSC
// PORT: Fixed ROM slots 31275.
    31275, 61762,
// PORT: SOURCE P32-P35_P72-P75.agc:1196
//			UP1
// PORT: Fixed ROM slots 31276.
    31276, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1197
//			UP1
// PORT: Fixed ROM slots 31277.
    31277, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1198
//		VSL2	BVSU
// PORT: Fixed ROM slots 31278.
    31278, 42452,
// PORT: SOURCE P32-P35_P72-P75.agc:1199
//		UNIT	PDVL
// PORT: Fixed ROM slots 31279.
    31279, 52572,
// PORT: SOURCE P32-P35_P72-P75.agc:1200
//		ABVAL	VXSC
// PORT: Fixed ROM slots 31280.
    31280, 61772,
// PORT: SOURCE P32-P35_P72-P75.agc:1201
//		VSL1	RVQ
// PORT: Fixed ROM slots 31281.
    31281, 36596,
// PORT: SOURCE P32-P35_P72-P75.agc:1202
//
// PORT: SOURCE P32-P35_P72-P75.agc:1203
//# Page 644
// PORT: SOURCE P32-P35_P72-P75.agc:1204
//# ***** INTINTNA *****
// PORT: SOURCE P32-P35_P72-P75.agc:1205
//
// PORT: SOURCE P32-P35_P72-P75.agc:1206
//INTINT2C	PDDL	PDDL
// PORT: Fixed ROM slots 31282.
    31282, 54698,
// PORT: SOURCE P32-P35_P72-P75.agc:1207
//			TCSI
// PORT: Fixed ROM slots 31283.
    31283, 3896,
// PORT: SOURCE P32-P35_P72-P75.agc:1208
//			TCDH
// PORT: Fixed ROM slots 31284.
    31284, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:1209
//		PDDL	PUSH
// PORT: Fixed ROM slots 31285.
    31285, 34474,
// PORT: SOURCE P32-P35_P72-P75.agc:1210
//			TWOPI
// PORT: Fixed ROM slots 31286.
    31286, 28596,
// PORT: SOURCE P32-P35_P72-P75.agc:1211
//		GOTO
// PORT: Fixed ROM slots 31287.
    31287, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:1212
//			INTINT
// PORT: Fixed ROM slots 31288.
    31288, 61036,
// PORT: SOURCE P32-P35_P72-P75.agc:1213
//INTINT3P	PDDL	PDDL
// PORT: Fixed ROM slots 31289.
    31289, 54698,
// PORT: SOURCE P32-P35_P72-P75.agc:1214
//			TCDH
// PORT: Fixed ROM slots 31290.
    31290, 2046,
// PORT: SOURCE P32-P35_P72-P75.agc:1215
//			TTPI
// PORT: Fixed ROM slots 31291.
    31291, 3900,
// PORT: SOURCE P32-P35_P72-P75.agc:1216
//		PDDL	PUSH
// PORT: Fixed ROM slots 31292.
    31292, 34474,
// PORT: SOURCE P32-P35_P72-P75.agc:1217
//			P30ZERO
// PORT: Fixed ROM slots 31293.
    31293, 27168,
// PORT: SOURCE P32-P35_P72-P75.agc:1218
//		GOTO
// PORT: Fixed ROM slots 31294.
    31294, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:1219
//			INTINT
// PORT: Fixed ROM slots 31295.
    31295, 61036,
// PORT: SOURCE P32-P35_P72-P75.agc:1220
//
// PORT: SOURCE P32-P35_P72-P75.agc:1221
//# Page 645
// PORT: SOURCE P32-P35_P72-P75.agc:1222
//# ***** S32/33.1 *****
// PORT: SOURCE P32-P35_P72-P75.agc:1223
//#
// PORT: SOURCE P32-P35_P72-P75.agc:1224
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:1225
//#	S32/33.X
// PORT: SOURCE P32-P35_P72-P75.agc:1226
//
// PORT: SOURCE P32-P35_P72-P75.agc:1227
//S32/33.1	STQ	AXT,1
// PORT: Fixed ROM slots 31296.
    31296, 63520,
// PORT: SOURCE P32-P35_P72-P75.agc:1228
//			SUBEXIT
// PORT: Fixed ROM slots 31297.
    31297, 3696,
// PORT: SOURCE P32-P35_P72-P75.agc:1229
//		VN	0681
// PORT: Fixed ROM slots 31298.
    31298, 1698,
// PORT: SOURCE P32-P35_P72-P75.agc:1230
//		CALL
// PORT: Fixed ROM slots 31299.
    31299, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:1231
//			DISDVLVC
// PORT: Fixed ROM slots 31300.
    31300, 59888,
// PORT: SOURCE P32-P35_P72-P75.agc:1232
//		CALL
// PORT: Fixed ROM slots 31301.
    31301, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:1233
//			S32/33.X
// PORT: Fixed ROM slots 31302.
    31302, 58528,
// PORT: SOURCE P32-P35_P72-P75.agc:1234
//		VLOAD	VXM
// PORT: Fixed ROM slots 31303.
    31303, 50682,
// PORT: SOURCE P32-P35_P72-P75.agc:1235
//			DELVLVC
// PORT: Fixed ROM slots 31304.
    31304, 3640,
// PORT: SOURCE P32-P35_P72-P75.agc:1236
//			0D
// PORT: Fixed ROM slots 31305.
    31305, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1237
//		VSL1
// PORT: Fixed ROM slots 31306.
    31306, 65524,
// PORT: SOURCE P32-P35_P72-P75.agc:1238
//		STORE	DELVSIN
// PORT: Fixed ROM slots 31307.
    31307, 3932,
// PORT: SOURCE P32-P35_P72-P75.agc:1239
//		PUSH	ABVAL
// PORT: Fixed ROM slots 31308.
    31308, 42508,
// PORT: SOURCE P32-P35_P72-P75.agc:1240
//		STOVL	DELVSAB
// PORT: Fixed ROM slots 31309.
    31309, 24424,
// PORT: SOURCE P32-P35_P72-P75.agc:1241
//		GOTO
// PORT: Fixed ROM slots 31310.
    31310, 65360,
// PORT: SOURCE P32-P35_P72-P75.agc:1242
//			SUBEXIT
// PORT: Fixed ROM slots 31311.
    31311, 3696,
// PORT: SOURCE P32-P35_P72-P75.agc:1243
//
// PORT: SOURCE P32-P35_P72-P75.agc:1244
//# Page 646
// PORT: SOURCE P32-P35_P72-P75.agc:1245
//# ***** S32/33.X *****
// PORT: SOURCE P32-P35_P72-P75.agc:1246
//
// PORT: SOURCE P32-P35_P72-P75.agc:1247
//S32/33.X	SETPD	VLOAD
// PORT: Fixed ROM slots 31312.
    31312, 64770,
// PORT: SOURCE P32-P35_P72-P75.agc:1248
//			6D
// PORT: Fixed ROM slots 31313.
    31313, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:1249
//			UP1
// PORT: Fixed ROM slots 31314.
    31314, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1250
//		VCOMP	PDVL
// PORT: Fixed ROM slots 31315.
    31315, 52604,
// PORT: SOURCE P32-P35_P72-P75.agc:1251
//			RACT1
// PORT: Fixed ROM slots 31316.
    31316, 2438,
// PORT: SOURCE P32-P35_P72-P75.agc:1252
//		UNIT	VCOMP
// PORT: Fixed ROM slots 31317.
    31317, 48732,
// PORT: SOURCE P32-P35_P72-P75.agc:1253
//		PUSH	VXV
// PORT: Fixed ROM slots 31318.
    31318, 40204,
// PORT: SOURCE P32-P35_P72-P75.agc:1254
//			UP1
// PORT: Fixed ROM slots 31319.
    31319, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1255
//		VSL1
// PORT: Fixed ROM slots 31320.
    31320, 65524,
// PORT: SOURCE P32-P35_P72-P75.agc:1256
//		STORE	0D
// PORT: Fixed ROM slots 31321.
    31321, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1257
//		RVQ
// PORT: Fixed ROM slots 31322.
    31322, 65308,
// PORT: SOURCE P32-P35_P72-P75.agc:1258
//
// PORT: SOURCE P32-P35_P72-P75.agc:1259
//# Page 647
// PORT: SOURCE P32-P35_P72-P75.agc:1260
//# ***** CDHMVR *****
// PORT: SOURCE P32-P35_P72-P75.agc:1261
//#
// PORT: SOURCE P32-P35_P72-P75.agc:1262
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:1263
//#	VECSHIFT
// PORT: SOURCE P32-P35_P72-P75.agc:1264
//#	TIMETHET
// PORT: SOURCE P32-P35_P72-P75.agc:1265
//#	SHIFTR1
// PORT: SOURCE P32-P35_P72-P75.agc:1266
//
// PORT: SOURCE P32-P35_P72-P75.agc:1267
//CDHMVR		STQ	VLOAD
// PORT: Fixed ROM slots 31323.
    31323, 64800
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:1268
//			SUBEXIT
// PORT: Fixed ROM slots 31324.
    31324, 3696,
// PORT: SOURCE P32-P35_P72-P75.agc:1269
//			RACT2
// PORT: Fixed ROM slots 31325.
    31325, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:1270
//		PUSH	UNIT
// PORT: Fixed ROM slots 31326.
    31326, 44556,
// PORT: SOURCE P32-P35_P72-P75.agc:1271
//		STOVL	UNVEC		# UR SUB A
// PORT: Fixed ROM slots 31327.
    31327, 24264,
// PORT: SOURCE P32-P35_P72-P75.agc:1272
//			RPASS2
// PORT: Fixed ROM slots 31328.
    31328, 3748,
// PORT: SOURCE P32-P35_P72-P75.agc:1273
//		UNIT	DOT
// PORT: Fixed ROM slots 31329.
    31329, 41308,
// PORT: SOURCE P32-P35_P72-P75.agc:1274
//			UNVEC
// PORT: Fixed ROM slots 31330.
    31330, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:1275
//		PUSH	SL1
// PORT: Fixed ROM slots 31331.
    31331, 59916,
// PORT: SOURCE P32-P35_P72-P75.agc:1276
//		STODL	CSTH
// PORT: Fixed ROM slots 31332.
    31332, 15284,
// PORT: SOURCE P32-P35_P72-P75.agc:1277
//		DSQ	PDDL
// PORT: Fixed ROM slots 31333.
    31333, 54684,
// PORT: SOURCE P32-P35_P72-P75.agc:1278
//			DP1/4TH
// PORT: Fixed ROM slots 31334.
    31334, 6804,
// PORT: SOURCE P32-P35_P72-P75.agc:1279
//		SR2	DSU
// PORT: Fixed ROM slots 31335.
    31335, 38276,
// PORT: SOURCE P32-P35_P72-P75.agc:1280
//		SQRT	SL1
// PORT: Fixed ROM slots 31336.
    31336, 60140,
// PORT: SOURCE P32-P35_P72-P75.agc:1281
//		PDVL	VCOMP
// PORT: Fixed ROM slots 31337.
    31337, 48794,
// PORT: SOURCE P32-P35_P72-P75.agc:1282
//		VXV
// PORT: Fixed ROM slots 31338.
    31338, 65338,
// PORT: SOURCE P32-P35_P72-P75.agc:1283
//			RPASS2
// PORT: Fixed ROM slots 31339.
    31339, 3748,
// PORT: SOURCE P32-P35_P72-P75.agc:1284
//		DOT	PDDL
// PORT: Fixed ROM slots 31340.
    31340, 54594,
// PORT: SOURCE P32-P35_P72-P75.agc:1285
//			UP1
// PORT: Fixed ROM slots 31341.
    31341, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1286
//		SIGN	STADR
// PORT: Fixed ROM slots 31342.
    31342, 38634,
// PORT: SOURCE P32-P35_P72-P75.agc:1287
//		STOVL	SNTH
// PORT: Fixed ROM slots 31343.
    31343, 42062,
// PORT: SOURCE P32-P35_P72-P75.agc:1288
//			RPASS2
// PORT: Fixed ROM slots 31344.
    31344, 3748,
// PORT: SOURCE P32-P35_P72-P75.agc:1289
//		PDVL	CALL
// PORT: Fixed ROM slots 31345.
    31345, 38042,
// PORT: SOURCE P32-P35_P72-P75.agc:1290
//			VPASS2
// PORT: Fixed ROM slots 31346.
    31346, 3760,
// PORT: SOURCE P32-P35_P72-P75.agc:1291
//			VECSHIFT
// PORT: Fixed ROM slots 31347.
    31347, 39452,
// PORT: SOURCE P32-P35_P72-P75.agc:1292
//		STOVL	VVEC
// PORT: Fixed ROM slots 31348.
    31348, 23496,
// PORT: SOURCE P32-P35_P72-P75.agc:1293
//		CLEAR
// PORT: Fixed ROM slots 31349.
    31349, 65304,
// PORT: SOURCE P32-P35_P72-P75.agc:1294
//			RVSW
// PORT: Fixed ROM slots 31350.
    31350, 3948,
// PORT: SOURCE P32-P35_P72-P75.agc:1295
//		STCALL	RVEC
// PORT: Fixed ROM slots 31351.
    31351, 31578,
// PORT: SOURCE P32-P35_P72-P75.agc:1296
//			TIMETHET
// PORT: Fixed ROM slots 31352.
    31352, 21428,
// PORT: SOURCE P32-P35_P72-P75.agc:1297
//		LXA,2	VSL*
// PORT: Fixed ROM slots 31353.
    31353, 45016,
// PORT: SOURCE P32-P35_P72-P75.agc:1298
//			RTX2
// PORT: Fixed ROM slots 31354.
    31354, 3070,
// PORT: SOURCE P32-P35_P72-P75.agc:1299
//			0,2
// PORT: Fixed ROM slots 31355.
    31355, 48892,
// PORT: SOURCE P32-P35_P72-P75.agc:1300
//		STORE	18D
// PORT: Fixed ROM slots 31356.
    31356, 38,
// PORT: SOURCE P32-P35_P72-P75.agc:1301
//		DOT	SL1R
// PORT: Fixed ROM slots 31357.
    31357, 64066,
// PORT: SOURCE P32-P35_P72-P75.agc:1302
//			UNVEC
// PORT: Fixed ROM slots 31358.
    31358, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:1303
//		PDVL	ABVAL		# 0D = V SUB PV
// PORT: Fixed ROM slots 31359.
    31359, 42650,
// PORT: SOURCE P32-P35_P72-P75.agc:1304
//		SL*	PDVL
// PORT: Fixed ROM slots 31360.
    31360, 52574,
// PORT: SOURCE P32-P35_P72-P75.agc:1305
//			0,2
// PORT: Fixed ROM slots 31361.
    31361, 48892,
// PORT: SOURCE P32-P35_P72-P75.agc:1306
//			RACT2
// PORT: Fixed ROM slots 31362.
    31362, 2450,
// PORT: SOURCE P32-P35_P72-P75.agc:1307
//		ABVAL	PDDL		# 2D = LENGTH OF R SUB A
// PORT: Fixed ROM slots 31363.
    31363, 54604,
// PORT: SOURCE P32-P35_P72-P75.agc:1308
//		DSU
// PORT: Fixed ROM slots 31364.
    31364, 65322,
// PORT: SOURCE P32-P35_P72-P75.agc:1309
//# Page 648
// PORT: SOURCE P32-P35_P72-P75.agc:1310
//			02D
// PORT: Fixed ROM slots 31365.
    31365, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:1311
//		STODL	DIFFALT		# DELTA H IN METERS		B+29
// PORT: Fixed ROM slots 31366.
    31366, 16128,
// PORT: SOURCE P32-P35_P72-P75.agc:1312
//			R1A
// PORT: Fixed ROM slots 31367.
    31367, 3012,
// PORT: SOURCE P32-P35_P72-P75.agc:1313
//		NORM	PDDL		# 2 - R V**/MU				04D
// PORT: Fixed ROM slots 31368.
    31368, 54658,
// PORT: SOURCE P32-P35_P72-P75.agc:1314
//			X1
// PORT: Fixed ROM slots 31369.
    31369, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:1315
//			R1
// PORT: Fixed ROM slots 31370.
    31370, 66,
// PORT: SOURCE P32-P35_P72-P75.agc:1316
//		CALL
// PORT: Fixed ROM slots 31371.
    31371, 65320,
// PORT: SOURCE P32-P35_P72-P75.agc:1317
//			SHIFTR1
// PORT: Fixed ROM slots 31372.
    31372, 39468,
// PORT: SOURCE P32-P35_P72-P75.agc:1318
//		SR1R	DDV
// PORT: Fixed ROM slots 31373.
    31373, 47588,
// PORT: SOURCE P32-P35_P72-P75.agc:1319
//		SL*	PUSH
// PORT: Fixed ROM slots 31374.
    31374, 34398,
// PORT: SOURCE P32-P35_P72-P75.agc:1320
//			0 	-5,1
// PORT: Fixed ROM slots 31375.
    31375, 16632,
// PORT: SOURCE P32-P35_P72-P75.agc:1321
//		DSU	PDDL		# A SUB A			B+29 	04D
// PORT: Fixed ROM slots 31376.
    31376, 54570,
// PORT: SOURCE P32-P35_P72-P75.agc:1322
//			DIFFALT
// PORT: Fixed ROM slots 31377.
    31377, 3840,
// PORT: SOURCE P32-P35_P72-P75.agc:1323
//		SR2	DDV		# A SUB P			B+31
// PORT: Fixed ROM slots 31378.
    31378, 47492,
// PORT: SOURCE P32-P35_P72-P75.agc:1324
//			04D		#				B+2
// PORT: Fixed ROM slots 31379.
    31379, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:1325
//		PUSH	SQRT		# A SUB P/A SUB A			06D
// PORT: Fixed ROM slots 31380.
    31380, 62988,
// PORT: SOURCE P32-P35_P72-P75.agc:1326
//		DMPR	DMP
// PORT: Fixed ROM slots 31381.
    31381, 34170,
// PORT: SOURCE P32-P35_P72-P75.agc:1327
//			06D
// PORT: Fixed ROM slots 31382.
    31382, 14,
// PORT: SOURCE P32-P35_P72-P75.agc:1328
//			00D
// PORT: Fixed ROM slots 31383.
    31383, 2,
// PORT: SOURCE P32-P35_P72-P75.agc:1329
//		SL3R	PDDL		# V SUB AV METERS/CS		B+7 	08D
// PORT: Fixed ROM slots 31384.
    31384, 54644,
// PORT: SOURCE P32-P35_P72-P75.agc:1330
//			02D		# R SUB A MAGNITUDE		B+29
// PORT: Fixed ROM slots 31385.
    31385, 6,
// PORT: SOURCE P32-P35_P72-P75.agc:1331
//		NORM	PDDL
// PORT: Fixed ROM slots 31386.
    31386, 54658,
// PORT: SOURCE P32-P35_P72-P75.agc:1332
//			X1
// PORT: Fixed ROM slots 31387.
    31387, 78,
// PORT: SOURCE P32-P35_P72-P75.agc:1333
//			RTMU
// PORT: Fixed ROM slots 31388.
    31388, 2466,
// PORT: SOURCE P32-P35_P72-P75.agc:1334
//		SR1	DDV		# 2MU 				B+38
// PORT: Fixed ROM slots 31389.
    31389, 47556,
// PORT: SOURCE P32-P35_P72-P75.agc:1335
//		SL*	PDDL		# 2 MU/R SUBAA			B+14 	10D
// PORT: Fixed ROM slots 31390.
    31390, 54622,
// PORT: SOURCE P32-P35_P72-P75.agc:1336
//			0 	-5,1
// PORT: Fixed ROM slots 31391.
    31391, 16632,
// PORT: SOURCE P32-P35_P72-P75.agc:1337
//			04D		# ASUBA				B+29
// PORT: Fixed ROM slots 31392.
    31392, 10,
// PORT: SOURCE P32-P35_P72-P75.agc:1338
//		NORM	PDDL
// PORT: Fixed ROM slots 31393.
    31393, 54658,
// PORT: SOURCE P32-P35_P72-P75.agc:1339
//			X2
// PORT: Fixed ROM slots 31394.
    31394, 80,
// PORT: SOURCE P32-P35_P72-P75.agc:1340
//			RTMU
// PORT: Fixed ROM slots 31395.
    31395, 2466,
// PORT: SOURCE P32-P35_P72-P75.agc:1341
//		SR1	DDV
// PORT: Fixed ROM slots 31396.
    31396, 47556,
// PORT: SOURCE P32-P35_P72-P75.agc:1342
//		SL*	BDSU
// PORT: Fixed ROM slots 31397.
    31397, 37214,
// PORT: SOURCE P32-P35_P72-P75.agc:1343
//			0 	-6,2	# 2U/R - U/A		B+14 (METERS/CS)SQ
// PORT: Fixed ROM slots 31398.
    31398, 48904,
// PORT: SOURCE P32-P35_P72-P75.agc:1344
//		PDDL	DSQ		#					10D
// PORT: Fixed ROM slots 31399.
    31399, 52906,
// PORT: SOURCE P32-P35_P72-P75.agc:1345
//			08D
// PORT: Fixed ROM slots 31400.
    31400, 18,
// PORT: SOURCE P32-P35_P72-P75.agc:1346
//		BDSU	SQRT
// PORT: Fixed ROM slots 31401.
    31401, 63010,
// PORT: SOURCE P32-P35_P72-P75.agc:1347
//		PDVL	VXV		# SQRT(MU(2/R SUB A-1/A SUB A)-VSUBA2)	10D
// PORT: Fixed ROM slots 31402.
    31402, 40346,
// PORT: SOURCE P32-P35_P72-P75.agc:1348
//			UP1
// PORT: Fixed ROM slots 31403.
    31403, 2402,
// PORT: SOURCE P32-P35_P72-P75.agc:1349
//			UNVEC
// PORT: Fixed ROM slots 31404.
    31404, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:1350
//		UNIT	VXSC
// PORT: Fixed ROM slots 31405.
    31405, 61788,
// PORT: SOURCE P32-P35_P72-P75.agc:1351
//			10D
// PORT: Fixed ROM slots 31406.
    31406, 22,
// PORT: SOURCE P32-P35_P72-P75.agc:1352
//		PDVL	VXSC
// PORT: Fixed ROM slots 31407.
    31407, 61850,
// PORT: SOURCE P32-P35_P72-P75.agc:1353
//			UNVEC
// PORT: Fixed ROM slots 31408.
    31408, 3784,
// PORT: SOURCE P32-P35_P72-P75.agc:1354
//			08D
// PORT: Fixed ROM slots 31409.
    31409, 18,
// PORT: SOURCE P32-P35_P72-P75.agc:1355
//		VAD	VSL1
// PORT: Fixed ROM slots 31410.
    31410, 64090,
// PORT: SOURCE P32-P35_P72-P75.agc:1356
//		STADR
// PORT: Fixed ROM slots 31411.
    31411, 65324,
// PORT: SOURCE P32-P35_P72-P75.agc:1357
//		STORE	VACT3
// PORT: Fixed ROM slots 31412.
    31412, 61750,
// PORT: SOURCE P32-P35_P72-P75.agc:1358
//		VSU
// PORT: Fixed ROM slots 31413.
    31413, 65362,
// PORT: SOURCE P32-P35_P72-P75.agc:1359
//			VACT2
// PORT: Fixed ROM slots 31414.
    31414, 3736,
// PORT: SOURCE P32-P35_P72-P75.agc:1360
//# Page 649
// PORT: SOURCE P32-P35_P72-P75.agc:1361
//		STCALL	DELVEET2	# DELTA VCDH -- REFERENCE COORDINATES
// PORT: Fixed ROM slots 31415.
    31415, 31098,
// PORT: SOURCE P32-P35_P72-P75.agc:1362
//			SUBEXIT
// PORT: Fixed ROM slots 31416.
    31416, 3696
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32026–32032.
function agcAotUnit2032 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32028 {
        if slot <= 32026 {
// PORT: SOURCE P32-P35_P72-P75.agc:1363
//
// PORT: SOURCE P32-P35_P72-P75.agc:1364
//# Page 650
// PORT: SOURCE P32-P35_P72-P75.agc:1365
//# ***** COMPTGO *****
// PORT: SOURCE P32-P35_P72-P75.agc:1366
//#
// PORT: SOURCE P32-P35_P72-P75.agc:1367
//# SUBROUTINES USED
// PORT: SOURCE P32-P35_P72-P75.agc:1368
//#	CLOKTASK
// PORT: SOURCE P32-P35_P72-P75.agc:1369
//#	2PHSCHNG
// PORT: SOURCE P32-P35_P72-P75.agc:1370
//
// PORT: SOURCE P32-P35_P72-P75.agc:1371
//		BANK	35
// PORT: SOURCE P32-P35_P72-P75.agc:1372
//		SETLOC	CSI/CDH
// PORT: SOURCE P32-P35_P72-P75.agc:1373
//		BANK
// PORT: SOURCE P32-P35_P72-P75.agc:1374
//
// PORT: SOURCE P32-P35_P72-P75.agc:1375
//		EBANK=	RTRN
// PORT: SOURCE P32-P35_P72-P75.agc:1376
//
// PORT: SOURCE P32-P35_P72-P75.agc:1377
//		COUNT*	$$/P3575
// PORT: SOURCE P32-P35_P72-P75.agc:1378
//
// PORT: SOURCE P32-P35_P72-P75.agc:1379
//COMPTGO		EXTEND
// PORT: Fixed ROM slots 32026.
            if slot <> 32026 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32027 {
// PORT: SOURCE P32-P35_P72-P75.agc:1380
//		QXCH	RTRN
// PORT: Fixed ROM slots 32027.
                if slot <> 32027 or instruction <> 10037 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 821, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:1381
//		CAF	ZERO
// PORT: Fixed ROM slots 32028.
                if slot <> 32028 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32030 {
            if slot <= 32029 {
// PORT: SOURCE P32-P35_P72-P75.agc:1382
//		TS	DISPDEX
// PORT: Fixed ROM slots 32029.
                if slot <> 32029 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:1383
//		CAF	BIT2
// PORT: Fixed ROM slots 32030.
                if slot <> 32030 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32031 {
// PORT: SOURCE P32-P35_P72-P75.agc:1384
//		INHINT
// PORT: Fixed ROM slots 32031.
                if slot <> 32031 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P32-P35_P72-P75.agc:1385
//		TC	WAITLIST
// PORT: Fixed ROM slots 32032.
                if slot <> 32032 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2032] to agcAotUnit2032@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:1386
//		EBANK=	WHICH
// PORT: SOURCE P32-P35_P72-P75.agc:1387
//		2CADR	CLOKTASK
// PORT: Fixed ROM slots 32033 32034.
    32033, 2974, 32034, 61550
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32035–32035.
function agcAotUnit2033 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:1388
//
// PORT: SOURCE P32-P35_P72-P75.agc:1389
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 32035.
    if slot <> 32035 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2033] to agcAotUnit2033@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P32-P35_P72-P75.agc:1390
//		OCT	40036
// PORT: Fixed ROM slots 32036.
    32036, 32828,
// PORT: SOURCE P32-P35_P72-P75.agc:1391
//		OCT	05024
// PORT: Fixed ROM slots 32037.
    32037, 5160,
// PORT: SOURCE P32-P35_P72-P75.agc:1392
//		OCT	13000
// PORT: Fixed ROM slots 32038.
    32038, 11264
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32039–32039.
function agcAotUnit2034 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P32-P35_P72-P75.agc:1393
//		TC	RTRN
// PORT: Fixed ROM slots 32039.
    if slot <> 32039 or instruction <> 821 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 821, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2034] to agcAotUnit2034@.

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE P32-P35_P72-P75.agc:1394
//
