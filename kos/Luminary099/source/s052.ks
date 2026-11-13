// P32-P35_P72-P75.agc
// bank 35, slots 31767-31773
function agcAotUnit2014 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31769 {
        if slot <= 31767 {
// P32-P35_P72-P75.agc:1
//# Copyright:	Public domain.
// P32-P35_P72-P75.agc:2
//# Filename:	P32-P35_P72-P75.agc
// P32-P35_P72-P75.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P32-P35_P72-P75.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// P32-P35_P72-P75.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P32-P35_P72-P75.agc:6
//# Assembler:	yaYUL
// P32-P35_P72-P75.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// P32-P35_P72-P75.agc:8
//# Website:	www.ibiblio.org/apollo.
// P32-P35_P72-P75.agc:9
//# Pages:	618-650
// P32-P35_P72-P75.agc:10
//# Mod history:	2009-05-18 RSB	Adapted from the Luminary 131 file of the
// P32-P35_P72-P75.agc:11
//#				same name, as corrected from Luminary 099
// P32-P35_P72-P75.agc:12
//#				page images.
// P32-P35_P72-P75.agc:13
//#
// P32-P35_P72-P75.agc:14
//# This source code has been transcribed or otherwise adapted from
// P32-P35_P72-P75.agc:15
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P32-P35_P72-P75.agc:16
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// P32-P35_P72-P75.agc:17
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P32-P35_P72-P75.agc:18
//# in storage size and consequent reduction in image quality as well) are
// P32-P35_P72-P75.agc:19
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P32-P35_P72-P75.agc:20
//# find that the images are illegible, contact me at info@sandroid.org
// P32-P35_P72-P75.agc:21
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// P32-P35_P72-P75.agc:22
//# actually created.
// P32-P35_P72-P75.agc:23
//#
// P32-P35_P72-P75.agc:24
//# Notations on the hardcopy document read, in part:
// P32-P35_P72-P75.agc:25
//#
// P32-P35_P72-P75.agc:26
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P32-P35_P72-P75.agc:27
//#	16:27 JULY 14, 1969
// P32-P35_P72-P75.agc:28
//
// P32-P35_P72-P75.agc:29
//# Page 618
// P32-P35_P72-P75.agc:30
//# COELLIPTIC SEQUENCE INITIATION (CSI) PROGRAMS (P32 AND P72)
// P32-P35_P72-P75.agc:31
//#
// P32-P35_P72-P75.agc:32
//# MOD NO -1       LOG SECTION -- P32-P35, P72-P75
// P32-P35_P72-P75.agc:33
//# MOD BY WHITE KERMAN  DATE 1JUNE67
// P32-P35_P72-P75.agc:34
//#
// P32-P35_P72-P75.agc:35
//# PURPOSE
// P32-P35_P72-P75.agc:36
//
// P32-P35_P72-P75.agc:37
//#	(1)	TO CALCULATE PARAMETERS ASSOCIATED WITH THE TIME FOLLOWING
// P32-P35_P72-P75.agc:38
//#		CONCENTRIC FLIGHT PLAN MANEUVERS -- THE CO-ELLIPTIC SEQUENCE
// P32-P35_P72-P75.agc:39
//#		INITIATION (CSI) MANEUVER AND THE CONSTANT DELTA ALTITUDE
// P32-P35_P72-P75.agc:40
//#		(CDH) MANEUVER.
// P32-P35_P72-P75.agc:41
//
// P32-P35_P72-P75.agc:42
//#	(2)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P32-P35_P72-P75.agc:43
//#		APPROVED AND KEYED INTO THE DSKY BY BOB.
// P32-P35_P72-P75.agc:44
//
// P32-P35_P72-P75.agc:45
//#	(3)	TO DISPLAY TO BOB AND THE GROUND DEPENDENT VARIABLES
// P32-P35_P72-P75.agc:46
//#		ASSOCIATED WITH THE CONCENTRIC FLIGHT PLAN MANEUVERS FOR
// P32-P35_P72-P75.agc:47
//#		APPROVAL BY BOB/GROUND.
// P32-P35_P72-P75.agc:48
//
// P32-P35_P72-P75.agc:49
//#	(4)	TO STORE THE CSI TARGET PARAMETERS FOR USE BY THE DESIRED
// P32-P35_P72-P75.agc:50
//#		THRUSTING PROGRAM.
// P32-P35_P72-P75.agc:51
//#
// P32-P35_P72-P75.agc:52
//# ASSUMPTIONS
// P32-P35_P72-P75.agc:53
//
// P32-P35_P72-P75.agc:54
//#	(1)	AT A SELECTED TPI TIME THE LINE OF SIGHT BETWEEN THE ACTIVE
// P32-P35_P72-P75.agc:55
//#		AND PASSIVE VEHICLES IS SELECTED TO BE A PRESCRIBED ANGLE (E)
// P32-P35_P72-P75.agc:56
//#		FROM THE HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE
// P32-P35_P72-P75.agc:57
//#		POSITION.
// P32-P35_P72-P75.agc:58
//
// P32-P35_P72-P75.agc:59
//#	(2)	THE TIME BETWEEN CSI IGNITION AND CDH IGNITION MUST BE
// P32-P35_P72-P75.agc:60
//#		COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// P32-P35_P72-P75.agc:61
//#		COMPLETION OF THE PROGRAM.
// P32-P35_P72-P75.agc:62
//
// P32-P35_P72-P75.agc:63
//#	(3)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION MUST BE
// P32-P35_P72-P75.agc:64
//#		COMPUTED TO BE GREATER THAN 10 MINUTES FOR SUCCESSFUL
// P32-P35_P72-P75.agc:65
//#		COMPLETION OF THE PROGRAM.
// P32-P35_P72-P75.agc:66
//
// P32-P35_P72-P75.agc:67
//#	(4)	CDH DELTA V IS SELECTED TO MINIMIZE THE VARIATION OF THE
// P32-P35_P72-P75.agc:68
//#		ALTITUDE DIFFERENCE BETWEEN THE ORBITS.
// P32-P35_P72-P75.agc:69
//
// P32-P35_P72-P75.agc:70
//#	(5)	CSI BURN IS DEFINED SUCH THAT THE IMPULSIVE DELTA V IS IN THE
// P32-P35_P72-P75.agc:71
//#		HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION AT CSI
// P32-P35_P72-P75.agc:72
//#		IGNITION.
// P32-P35_P72-P75.agc:73
//
// P32-P35_P72-P75.agc:74
//#	(6)	THE PERICENTER ALTITUDE OF THE ORBIT FOLLOWING CSI AND CDH
// P32-P35_P72-P75.agc:75
//#		MUST BE GREATER THAN 35,000 FT (MUN ORBIT) OR 85 NM (KERBIN
// P32-P35_P72-P75.agc:76
//#		ORBIT) FOR SUCCESSFUL COMPLETION OF THIS PROGRAM.
// P32-P35_P72-P75.agc:77
//
// P32-P35_P72-P75.agc:78
//#	(7)	THE CSI AND CDH MANEUVERS ARE ORIGINALLY ASSUMED TO BE
// P32-P35_P72-P75.agc:79
//#		PARALLEL TO THE PLANE OF THE CSM ORBIT.  HOWEVER, CREW
// P32-P35_P72-P75.agc:80
//# Page 619
// P32-P35_P72-P75.agc:81
//#		MODIFICATION OF DELTA V (LV) COMPONENTS MAY RESULT IN AN
// P32-P35_P72-P75.agc:82
//#		OUT-OF-PLANE CSI MANEUVER
// P32-P35_P72-P75.agc:83
//
// P32-P35_P72-P75.agc:84
//#	(8)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P32-P35_P72-P75.agc:85
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 10).
// P32-P35_P72-P75.agc:86
//
// P32-P35_P72-P75.agc:87
//#	(9)	COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// P32-P35_P72-P75.agc:88
//#		THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// P32-P35_P72-P75.agc:89
//#		ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// P32-P35_P72-P75.agc:90
//#		EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// P32-P35_P72-P75.agc:91
//
// P32-P35_P72-P75.agc:92
//#	(10)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// P32-P35_P72-P75.agc:93
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P32-P35_P72-P75.agc:94
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED BY THE CSM BY
// P32-P35_P72-P75.agc:95
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P32-P35_P72-P75.agc:96
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P32-P35_P72-P75.agc:97
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P32-P35_P72-P75.agc:98
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P32-P35_P72-P75.agc:99
//#		THRUSTING MANEUVER.
// P32-P35_P72-P75.agc:100
//
// P32-P35_P72-P75.agc:101
//#	(11)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P32-P35_P72-P75.agc:102
//
// P32-P35_P72-P75.agc:103
//#	(12)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P32-P35_P72-P75.agc:104
//#
// P32-P35_P72-P75.agc:105
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P32-P35_P72-P75.agc:106
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P32-P35_P72-P75.agc:107
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P32-P35_P72-P75.agc:108
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P32-P35_P72-P75.agc:109
//#
// P32-P35_P72-P75.agc:110
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P32-P35_P72-P75.agc:111
//#			COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// P32-P35_P72-P75.agc:112
//#			CYCLE.
// P32-P35_P72-P75.agc:113
//#
// P32-P35_P72-P75.agc:114
//#			EXTERNAL DELTA V STEERING FLAG -- DESIGNATES THE TYPE OF
// P32-P35_P72-P75.agc:115
//#			STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// P32-P35_P72-P75.agc:116
//#			THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// P32-P35_P72-P75.agc:117
//#			PROGRAM.
// P32-P35_P72-P75.agc:118
//#
// P32-P35_P72-P75.agc:119
//#	(13)	IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// P32-P35_P72-P75.agc:120
//#		A THRUSTING MANEUVER.
// P32-P35_P72-P75.agc:121
//#
// P32-P35_P72-P75.agc:122
//#	(14)	THIS PROGRAM IS SELECTED BY BOB BY DSKY ENTRY
// P32-P35_P72-P75.agc:123
//#
// P32-P35_P72-P75.agc:124
//#			P32 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P32-P35_P72-P75.agc:125
//#
// P32-P35_P72-P75.agc:126
//#			P72 IF THIS VEHICLE IS THE PASSIVE VEHICLE.
// P32-P35_P72-P75.agc:127
//#
// P32-P35_P72-P75.agc:128
//# INPUT
// P32-P35_P72-P75.agc:129
//
// P32-P35_P72-P75.agc:130
//#	(1)	TCSI		TIME OF THE CSI MANEUVER
// P32-P35_P72-P75.agc:131
//
// P32-P35_P72-P75.agc:132
//# Page 620
// P32-P35_P72-P75.agc:133
//#	(2)	NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// P32-P35_P72-P75.agc:134
//#				VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// P32-P35_P72-P75.agc:135
//#				MANEUVER POINT.
// P32-P35_P72-P75.agc:136
//#	(3)	ELEV		DESIRED LOS ANGLE AT TPI
// P32-P35_P72-P75.agc:137
//#	(4)	TTPI		TIME OF THE TPI MANEUVER
// P32-P35_P72-P75.agc:138
//#
// P32-P35_P72-P75.agc:139
//# OUTPUT
// P32-P35_P72-P75.agc:140
//
// P32-P35_P72-P75.agc:141
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P32-P35_P72-P75.agc:142
//#	(2)	TTOGO		TIME TO GO
// P32-P35_P72-P75.agc:143
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// P32-P35_P72-P75.agc:144
//#	(4)	DIFFALT		DELTA ALTITUDE AT CDH
// P32-P35_P72-P75.agc:145
//#	(5)	T1TOT2		DELTA TIME FROM CSI TO CDH
// P32-P35_P72-P75.agc:146
//#	(6)	T2TOT3		DELTA TIME FROM CDH TO TPI
// P32-P35_P72-P75.agc:147
//#	(7)	DELVLVC		DELTA VELOCITY AT CSI -- LOCAL VERTICAL COORDINATES
// P32-P35_P72-P75.agc:148
//#	(8)	DELVLVC		DELTA VELOCITY AT CDH -- LOCAL VERTICAL COORDINATES
// P32-P35_P72-P75.agc:149
//#
// P32-P35_P72-P75.agc:150
//# DOWNLINK
// P32-P35_P72-P75.agc:151
//
// P32-P35_P72-P75.agc:152
//#	(1)	TCSI		TIME OF THE CSI MANEUVER
// P32-P35_P72-P75.agc:153
//#	(2)	TCDH		TIME OF THE CDH MANEUVER
// P32-P35_P72-P75.agc:154
//#	(3)	TTPI		TIME OF THE TPI MANEUVER
// P32-P35_P72-P75.agc:155
//#	(4)	TIG		TIME OF THE CSI MANEUVER
// P32-P35_P72-P75.agc:156
//#	(5)	DELVEET1	DELTA VELOCITY AT CSI -- REFERENCE COORDINATES
// P32-P35_P72-P75.agc:157
//#	(6)	DELVEET2	DELTA VELOCITY AT CDH -- REFERENCE COORDINATES
// P32-P35_P72-P75.agc:158
//#	(7)	DIFFALT		DELTA ALTITUDE AT CDH
// P32-P35_P72-P75.agc:159
//#	(8)	NN		NUMBER OF APSIDAL CROSSINGS THRU WHICH THE ACTIVE
// P32-P35_P72-P75.agc:160
//#				VEHICLE ORBIT CAN BE ADVANCED TO OBTAIN THE CDH
// P32-P35_P72-P75.agc:161
//#				MANEUVER POINT
// P32-P35_P72-P75.agc:162
//#	(9)	ELEV		DESIRED LOS ANGLE AT TPI
// P32-P35_P72-P75.agc:163
//#
// P32-P35_P72-P75.agc:164
//# COMMUNICATION TO THRUSTING PROGRAM
// P32-P35_P72-P75.agc:165
//
// P32-P35_P72-P75.agc:166
//#	(1)	TIG		TIME OF THE CSI MANEUVER
// P32-P35_P72-P75.agc:167
//#	(2)	RTIG		POSITION OF ACTIVE VEHICLE AT CSI -- BEFORE ROTATION
// P32-P35_P72-P75.agc:168
//#				INTO PLANE OF PASSIVE VEHICLE
// P32-P35_P72-P75.agc:169
//#	(3)	VTIG		VELOCITY OF ACTIVE VEHICLE AT CSE -- BEFORE ROTATION
// P32-P35_P72-P75.agc:170
//#				INTO PLANE OF PASSIVE VEHICLE
// P32-P35_P72-P75.agc:171
//#	(4)	DELVSIN		DELTA VELOCITY AT CSI -- REFERENCE COORDINATES
// P32-P35_P72-P75.agc:172
//#	(5)	DELVSAB		MAGNITUDE OF DELTA VELOCITY AT CSI
// P32-P35_P72-P75.agc:173
//#	(6)	XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION
// P32-P35_P72-P75.agc:174
//#
// P32-P35_P72-P75.agc:175
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:176
//
// P32-P35_P72-P75.agc:177
//#	AVFLAGA
// P32-P35_P72-P75.agc:178
//#	AVFLAGP
// P32-P35_P72-P75.agc:179
//#	P20FLGON
// P32-P35_P72-P75.agc:180
//#	VARALARM
// P32-P35_P72-P75.agc:181
//#	BANKCALL
// P32-P35_P72-P75.agc:182
//#	GOFLASH
// P32-P35_P72-P75.agc:183
//#	GOTOPOOH
// P32-P35_P72-P75.agc:184
//# Page 621
// P32-P35_P72-P75.agc:185
//#	VNPOOH
// P32-P35_P72-P75.agc:186
//#	GOFLASHR
// P32-P35_P72-P75.agc:187
//#	BLANKET
// P32-P35_P72-P75.agc:188
//#	ENDOFJOB
// P32-P35_P72-P75.agc:189
//#	SELECTMU
// P32-P35_P72-P75.agc:190
//#	ADVANCE
// P32-P35_P72-P75.agc:191
//#	INTINT
// P32-P35_P72-P75.agc:192
//#	PASSIVE
// P32-P35_P72-P75.agc:193
//#	CSI/A
// P32-P35_P72-P75.agc:194
//#	S32/33.1
// P32-P35_P72-P75.agc:195
//#	DISDVLVC
// P32-P35_P72-P75.agc:196
//#	VN1645
// P32-P35_P72-P75.agc:197
//
// P32-P35_P72-P75.agc:198
//		BANK	35
// P32-P35_P72-P75.agc:199
//		SETLOC	CSI/CDH
// P32-P35_P72-P75.agc:200
//		BANK
// P32-P35_P72-P75.agc:201
//		EBANK=	SUBEXIT
// P32-P35_P72-P75.agc:202
//		COUNT*	$$/P3272
// P32-P35_P72-P75.agc:203
//P32		TC	AVFLAGA
// slot 31767
            if slot <> 31767 or instruction <> 1255 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1255, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31768 {
// P32-P35_P72-P75.agc:204
//		TC	P32STRT
// slot 31768
                if slot <> 31768 or instruction <> 1050 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1050, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:205
//P72		TC	AVFLAGP
// slot 31769
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
// P32-P35_P72-P75.agc:206
//P32STRT		EXTEND
// slot 31770
                if slot <> 31770 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:207
//		DCA	P30ZERO
// slot 31771
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
// P32-P35_P72-P75.agc:208
//		DXCH	CENTANG
// slot 31772
                if slot <> 31772 or instruction <> 22417 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 913, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:209
//		TC	P32/P72A
// slot 31773
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
// P32-P35_P72-P75.agc:210
//ALMXITA		SXA,2
// slot 31774
    31774, 65464,
// P32-P35_P72-P75.agc:211
//			CSIALRM
// slot 31775
    31775, 3862,
// P32-P35_P72-P75.agc:212
//ALMXIT		LXC,1
// slot 31776
    31776, 65472,
// P32-P35_P72-P75.agc:213
//			CSIALRM
// slot 31777
    31777, 3862,
// P32-P35_P72-P75.agc:214
//		SLOAD*	EXIT
// slot 31778
    31778, 65206,
// P32-P35_P72-P75.agc:215
//			ALARM/TB -1,1
// slot 31779
    31779, 27174
)).

// bank 35, slots 31780-31783
function agcAotUnit2015 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31781 {
        if slot <= 31780 {
// P32-P35_P72-P75.agc:216
//		CA	MPAC
// slot 31780
            if slot <> 31780 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:217
//		TC	VARALARM
// slot 31781
            if slot <> 31781 or instruction <> 3044 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3044, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31782 {
// P32-P35_P72-P75.agc:218
//		CAF	V05N09
// slot 31782
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
// P32-P35_P72-P75.agc:219
//		TC	BANKCALL
// slot 31783
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
// P32-P35_P72-P75.agc:220
//		CADR	GOFLASH
// slot 31784
    31784, 17020
)).

// bank 35, slots 31785-31794
function agcAotUnit2016 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31789 {
        if slot <= 31786 {
            if slot <= 31785 {
// P32-P35_P72-P75.agc:221
//		TC	GOTOPOOH
// slot 31785
                if slot <> 31785 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:222
//		TC	-4
// slot 31786
                if slot <> 31786 or instruction <> 1062 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1062, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31787 {
// P32-P35_P72-P75.agc:223
//P32/P72A	TC	P20FLGON
// slot 31787
                if slot <> 31787 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31788 {
// P32-P35_P72-P75.agc:224
//		CAF	P30ZERO
// slot 31788
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
// P32-P35_P72-P75.agc:225
//		TS	NN 	+1
// slot 31789
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
// P32-P35_P72-P75.agc:226
//		TS	TCSI
// slot 31790
                if slot <> 31790 or instruction <> 23451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23451, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:227
//		TS	TCSI 	+1
// slot 31791
                if slot <> 31791 or instruction <> 23452 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23452, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31792 {
// P32-P35_P72-P75.agc:228
//VN0611		CAF	V06N11		# TCSI
// slot 31792
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
// P32-P35_P72-P75.agc:229
//		TC	VNPOOH
// slot 31793
                    if slot <> 31793 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P32-P35_P72-P75.agc:230
//		TC	INTPRET
// slot 31794
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
// P32-P35_P72-P75.agc:231
//		DLOAD	DCOMP
// slot 31795
    31795, 48842,
// P32-P35_P72-P75.agc:232
//			TCSI
// slot 31796
    31796, 3896,
// P32-P35_P72-P75.agc:233
//		BMN	DLOAD
// slot 31797
    31797, 58688,
// P32-P35_P72-P75.agc:234
//			VN0655
// slot 31798
    31798, 59542,
// P32-P35_P72-P75.agc:235
//# Page 622
// P32-P35_P72-P75.agc:236
//			TETLEM
// slot 31799
    31799, 1862,
// P32-P35_P72-P75.agc:237
//		STCALL	TDEC1
// slot 31800
    31800, 28738,
// P32-P35_P72-P75.agc:238
//			PRECSET
// slot 31801
    31801, 39392,
// P32-P35_P72-P75.agc:239
//		VLOAD	VSR*
// slot 31802
    31802, 45050,
// P32-P35_P72-P75.agc:240
//			RACT3
// slot 31803
    31803, 3772,
// P32-P35_P72-P75.agc:241
//			0,2
// slot 31804
    31804, 48380,
// P32-P35_P72-P75.agc:242
//		STOVL	RVEC
// slot 31805
    31805, 23386,
// P32-P35_P72-P75.agc:243
//			VACT3
// slot 31806
    31806, 3784,
// P32-P35_P72-P75.agc:244
//		VSR*	SET
// slot 31807
    31807, 35934,
// P32-P35_P72-P75.agc:245
//			0,2
// slot 31808
    31808, 48380,
// P32-P35_P72-P75.agc:246
//			RVSW
// slot 31809
    31809, 3692,
// P32-P35_P72-P75.agc:247
//		STODL	VVEC
// slot 31810
    31810, 15304,
// P32-P35_P72-P75.agc:248
//			DPPOSMAX
// slot 31811
    31811, 6832,
// P32-P35_P72-P75.agc:249
//		STCALL	RDESIRED
// slot 31812
    31812, 31708,
// P32-P35_P72-P75.agc:250
//			TIMERAD
// slot 31813
    31813, 22222,
// P32-P35_P72-P75.agc:251
//		DAD
// slot 31814
    31814, 65306,
// P32-P35_P72-P75.agc:252
//			TDEC2
// slot 31815
    31815, 3832,
// P32-P35_P72-P75.agc:253
//		STORE	TCSI
// slot 31816
    31816, 3896,
// P32-P35_P72-P75.agc:254
//		EXIT
// slot 31817
    31817, 65532
)).

// bank 35, slots 31818-31818
function agcAotUnit2017 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:255
//		TC	VN0611
// slot 31818
    if slot <> 31818 or instruction <> 1072 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1072, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2017] to agcAotUnit2017@.

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:256
//VN0655		EXIT
// slot 31819
    31819, 65532
)).

// bank 35, slots 31820-31821
function agcAotUnit2018 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31820 {
// P32-P35_P72-P75.agc:257
//		CAF	V06N55		# NN, ELEV(RGLOS)
// slot 31820
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
// P32-P35_P72-P75.agc:258
//		TC	BANKCALL
// slot 31821
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
// P32-P35_P72-P75.agc:259
//		CADR	GOFLASH
// slot 31822
    31822, 17020
)).

// bank 35, slots 31823-31828
function agcAotUnit2019 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31825 {
        if slot <= 31823 {
// P32-P35_P72-P75.agc:260
//		TC	GOTOPOOH
// slot 31823
            if slot <> 31823 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31824 {
// P32-P35_P72-P75.agc:261
//		TC	+2
// slot 31824
                if slot <> 31824 or instruction <> 1106 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1106, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:262
//		TC	-5
// slot 31825
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
// P32-P35_P72-P75.agc:263
//		CAF	V06N37		# TTPI
// slot 31826
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
// P32-P35_P72-P75.agc:264
//		TC	VNPOOH
// slot 31827
                if slot <> 31827 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:265
//		TC	INTPRET
// slot 31828
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
// P32-P35_P72-P75.agc:266
//		DLOAD
// slot 31829
    31829, 65482,
// P32-P35_P72-P75.agc:267
//			TCSI
// slot 31830
    31830, 3896,
// P32-P35_P72-P75.agc:268
//		STCALL	TIG
// slot 31831
    31831, 32324,
// P32-P35_P72-P75.agc:269
//			SELECTMU
// slot 31832
    31832, 16384,
// P32-P35_P72-P75.agc:270
//P32/P72B	CALL
// slot 31833
    31833, 65320,
// P32-P35_P72-P75.agc:271
//			ADVANCE
// slot 31834
    31834, 58396,
// P32-P35_P72-P75.agc:272
//		SETPD	VLOAD
// slot 31835
    31835, 64770,
// P32-P35_P72-P75.agc:273
//			0D
// slot 31836
    31836, 2,
// P32-P35_P72-P75.agc:274
//			VPASS1
// slot 31837
    31837, 3724,
// P32-P35_P72-P75.agc:275
//		PDVL	PDDL
// slot 31838
    31838, 54682,
// P32-P35_P72-P75.agc:276
//			RPASS1
// slot 31839
    31839, 3712,
// P32-P35_P72-P75.agc:277
//			TCSI
// slot 31840
    31840, 3896,
// P32-P35_P72-P75.agc:278
//		PDDL	PDDL
// slot 31841
    31841, 54698,
// P32-P35_P72-P75.agc:279
//			TTPI
// slot 31842
    31842, 3900,
// P32-P35_P72-P75.agc:280
//			TWOPI
// slot 31843
    31843, 28596,
// P32-P35_P72-P75.agc:281
//		PUSH	CALL
// slot 31844
    31844, 37900,
// P32-P35_P72-P75.agc:282
//			INTINT
// slot 31845
    31845, 61036,
// P32-P35_P72-P75.agc:283
//		CALL
// slot 31846
    31846, 65320,
// P32-P35_P72-P75.agc:284
//			PASSIVE
// slot 31847
    31847, 39444,
// P32-P35_P72-P75.agc:285
//		CALL
// slot 31848
    31848, 65320,
// P32-P35_P72-P75.agc:286
//# Page 623
// P32-P35_P72-P75.agc:287
//			CSI/A
// slot 31849
    31849, 57494,
// P32-P35_P72-P75.agc:288
//P32/P72C	BON	SET
// slot 31850
    31850, 35864,
// P32-P35_P72-P75.agc:289
//			FINALFLG
// slot 31851
    31851, 1426,
// P32-P35_P72-P75.agc:290
//			P32/P72D
// slot 31852
    31852, 59612,
// P32-P35_P72-P75.agc:291
//			UPDATFLG
// slot 31853
    31853, 624,
// P32-P35_P72-P75.agc:292
//P32/P72D	DLOAD
// slot 31854
    31854, 65482,
// P32-P35_P72-P75.agc:293
//			T1TOT2
// slot 31855
    31855, 2390,
// P32-P35_P72-P75.agc:294
//P32/P72E	STORE	T1TOT2
// slot 31856
    31856, 2390,
// P32-P35_P72-P75.agc:295
//		DSU	BPL
// slot 31857
    31857, 42026,
// P32-P35_P72-P75.agc:296
//			60MIN
// slot 31858
    31858, 27172,
// P32-P35_P72-P75.agc:297
//			P32/P72E
// slot 31859
    31859, 59616,
// P32-P35_P72-P75.agc:298
//		DLOAD
// slot 31860
    31860, 65482,
// P32-P35_P72-P75.agc:299
//			T2TOT3
// slot 31861
    31861, 2394,
// P32-P35_P72-P75.agc:300
//P32/P72F	STORE	T2TOT3
// slot 31862
    31862, 2394,
// P32-P35_P72-P75.agc:301
//		DSU	BPL
// slot 31863
    31863, 42026,
// P32-P35_P72-P75.agc:302
//			60MIN
// slot 31864
    31864, 27172,
// P32-P35_P72-P75.agc:303
//			P32/P72F
// slot 31865
    31865, 59628,
// P32-P35_P72-P75.agc:304
//		EXIT
// slot 31866
    31866, 65532
)).

// bank 35, slots 31867-31869
function agcAotUnit2020 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31867 {
// P32-P35_P72-P75.agc:305
//		CAF	V06N75
// slot 31867
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
// P32-P35_P72-P75.agc:306
//		TC	VNPOOH
// slot 31868
            if slot <> 31868 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:307
//		TC	INTPRET
// slot 31869
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
// P32-P35_P72-P75.agc:308
//		VLOAD	CALL
// slot 31870
    31870, 38138,
// P32-P35_P72-P75.agc:309
//			DELVEET1
// slot 31871
    31871, 2414,
// P32-P35_P72-P75.agc:310
//			S32/33.1
// slot 31872
    31872, 58496,
// P32-P35_P72-P75.agc:311
//		STOVL	DELVEET1
// slot 31873
    31873, 22894,
// P32-P35_P72-P75.agc:312
//			RACT2
// slot 31874
    31874, 2450,
// P32-P35_P72-P75.agc:313
//		STOVL	RACT1
// slot 31875
    31875, 22918,
// P32-P35_P72-P75.agc:314
//			DELVEET2
// slot 31876
    31876, 2426,
// P32-P35_P72-P75.agc:315
//		AXT,1	CALL
// slot 31877
    31877, 38128,
// P32-P35_P72-P75.agc:316
//		VN	0682
// slot 31878
    31878, 1700,
// P32-P35_P72-P75.agc:317
//			DISDVLVC
// slot 31879
    31879, 59888,
// P32-P35_P72-P75.agc:318
//		DLOAD
// slot 31880
    31880, 65482,
// P32-P35_P72-P75.agc:319
//			TTPI
// slot 31881
    31881, 3900,
// P32-P35_P72-P75.agc:320
//		STCALL	TTPIO
// slot 31882
    31882, 32576,
// P32-P35_P72-P75.agc:321
//			VN1645
// slot 31883
    31883, 61196,
// P32-P35_P72-P75.agc:322
//		GOTO
// slot 31884
    31884, 65360,
// P32-P35_P72-P75.agc:323
//			P32/P72B
// slot 31885
    31885, 59570
)).

// bank 35, slots 31886-31892
function agcAotUnit2021 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31888 {
        if slot <= 31886 {
// P32-P35_P72-P75.agc:324
//
// P32-P35_P72-P75.agc:325
//# Page 624
// P32-P35_P72-P75.agc:326
//# CONSTANT DELTA HEIGHT (CDH) PROGRAMS (P33 AND P73)
// P32-P35_P72-P75.agc:327
//# MOD NO -1			LOC SECTION -- P32-P35, P72-P75
// P32-P35_P72-P75.agc:328
//# MOD BY WHITE KERMAN		DATE: 1 JUNE 67
// P32-P35_P72-P75.agc:329
//#
// P32-P35_P72-P75.agc:330
//# PURPOSE
// P32-P35_P72-P75.agc:331
//#
// P32-P35_P72-P75.agc:332
//#	(1)	TO CALCULATE PARAMETERS ASSOCIATED WITH THE CONSTANT DELTA
// P32-P35_P72-P75.agc:333
//#		ALTITUDE MANEUVER (CDH).
// P32-P35_P72-P75.agc:334
//#
// P32-P35_P72-P75.agc:335
//#	(2)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P32-P35_P72-P75.agc:336
//#		APPROVED AND KEYED INTO THE DSKY BY BOB.
// P32-P35_P72-P75.agc:337
//#
// P32-P35_P72-P75.agc:338
//#	(3)	TO DISPLAY TO BOB AND THE GROUND DEPENDENT VARIABLES
// P32-P35_P72-P75.agc:339
//#		ASSOCIATED WITH THE CDH MANEUVER FOR APPROVAL BY THE
// P32-P35_P72-P75.agc:340
//#		BOB/GROUND.
// P32-P35_P72-P75.agc:341
//#
// P32-P35_P72-P75.agc:342
//#	(4)	TO STORE THE CDH TARGET PARAMETERS FOR USE BY THE DESIRED
// P32-P35_P72-P75.agc:343
//#		THRUSTING PROGRAM.
// P32-P35_P72-P75.agc:344
//#
// P32-P35_P72-P75.agc:345
//# ASSUMPTIONS
// P32-P35_P72-P75.agc:346
//#
// P32-P35_P72-P75.agc:347
//#	(1)	THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF THE
// P32-P35_P72-P75.agc:348
//#		CO-ELLIPTIC SEQUENCE INITIATION (CSI) PROGRAM (P32/P72).
// P32-P35_P72-P75.agc:349
//#		THEREFORE --
// P32-P35_P72-P75.agc:350
//#
// P32-P35_P72-P75.agc:351
//#		(A)	AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// P32-P35_P72-P75.agc:352
//#			BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// P32-P35_P72-P75.agc:353
//#			A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// P32-P35_P72-P75.agc:354
//#			HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// P32-P35_P72-P75.agc:355
//#
// P32-P35_P72-P75.agc:356
//#		(B)	THE TIME BETWEEN CSI IGNITION AND CDH IGNITION WAS
// P32-P35_P72-P75.agc:357
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// P32-P35_P72-P75.agc:358
//#
// P32-P35_P72-P75.agc:359
//#		(C)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// P32-P35_P72-P75.agc:360
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// P32-P35_P72-P75.agc:361
//#
// P32-P35_P72-P75.agc:362
//#		(D)	THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// P32-P35_P72-P75.agc:363
//#			ORBITS WAS MINIMIZED.
// P32-P35_P72-P75.agc:364
//#
// P32-P35_P72-P75.agc:365
//#		(E)	CSI BURN WAS DEFINED SUCH THAT THE IMPULSIVE DELTA V WAS
// P32-P35_P72-P75.agc:366
//#			IN THE HORIZONTAL PLANE DEFINED BY ACTIVE VEHICLE
// P32-P35_P72-P75.agc:367
//#			POSITION AT CSI IGNITION.
// P32-P35_P72-P75.agc:368
//#
// P32-P35_P72-P75.agc:369
//#		(F) 	THE PERICENTER ALTITUDES OF THE ORBITS FOLLOWING CSI AND
// P32-P35_P72-P75.agc:370
//#			CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR MUN
// P32-P35_P72-P75.agc:371
//#			ORBIT OR 85 NM FOR KERBIN ORBIT.
// P32-P35_P72-P75.agc:372
//#
// P32-P35_P72-P75.agc:373
//#		(G)	THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// P32-P35_P72-P75.agc:374
//#			THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// P32-P35_P72-P75.agc:375
//# Page 625
// P32-P35_P72-P75.agc:376
//#			MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// P32-P35_P72-P75.agc:377
//#			IN AN OUT-OF-PLANE MANEUVER.
// P32-P35_P72-P75.agc:378
//#
// P32-P35_P72-P75.agc:379
//#	(2)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P32-P35_P72-P75.agc:380
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION 4).
// P32-P35_P72-P75.agc:381
//#
// P32-P35_P72-P75.agc:382
//#	(3)	COMPUTED VARIABLES MAY BE STORED FOR LATER VERIFICATION BY
// P32-P35_P72-P75.agc:383
//#		THE GROUND.  THESE STORAGE CAPABILITIES ARE NORMALLY LIMITED
// P32-P35_P72-P75.agc:384
//#		ONLY TO THE PARAMETERS FOR ONE THRUSTING MANEUVER AT A TIME
// P32-P35_P72-P75.agc:385
//#		EXCEPT FOR CONCENTRIC FLIGHT PLAN MANEUVER SEQUENCES.
// P32-P35_P72-P75.agc:386
//#
// P32-P35_P72-P75.agc:387
//#	(4)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM.
// P32-P35_P72-P75.agc:388
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P32-P35_P72-P75.agc:389
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// P32-P35_P72-P75.agc:390
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P32-P35_P72-P75.agc:391
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P32-P35_P72-P75.agc:392
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P32-P35_P72-P75.agc:393
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P32-P35_P72-P75.agc:394
//#		THRUSTING MANEUVER.
// P32-P35_P72-P75.agc:395
//#
// P32-P35_P72-P75.agc:396
//#	(5)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P32-P35_P72-P75.agc:397
//#
// P32-P35_P72-P75.agc:398
//#	(6)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P32-P35_P72-P75.agc:399
//#
// P32-P35_P72-P75.agc:400
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P32-P35_P72-P75.agc:401
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P32-P35_P72-P75.agc:402
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P32-P35_P72-P75.agc:403
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P32-P35_P72-P75.agc:404
//#
// P32-P35_P72-P75.agc:405
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P32-P35_P72-P75.agc:406
//#			COMPLETED THE FINAL MANEUVER COMPUTATION AND DISPLAY
// P32-P35_P72-P75.agc:407
//#			CYCLE.
// P32-P35_P72-P75.agc:408
//#
// P32-P35_P72-P75.agc:409
//#			EXTERNAL DELTA V STEERING FLAG -- DESIGNATES THE TYPE OF
// P32-P35_P72-P75.agc:410
//#			STEERING REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE
// P32-P35_P72-P75.agc:411
//#			THRUSTING PROGRAM SELECTED AFTER COMPLETION OF THIS
// P32-P35_P72-P75.agc:412
//#			PROGRAM.
// P32-P35_P72-P75.agc:413
//#
// P32-P35_P72-P75.agc:414
//#	(7)	IT IS NORMALLY REQUIRED THAT THE ISS BE ON FOR 1 HOUR PRIOR TO
// P32-P35_P72-P75.agc:415
//#		A THRUSTING MANEUVER.
// P32-P35_P72-P75.agc:416
//#
// P32-P35_P72-P75.agc:417
//#	(8)	THIS PROGRAM IS SELECTED BY BOB BY DSKY ENTRY.
// P32-P35_P72-P75.agc:418
//#
// P32-P35_P72-P75.agc:419
//#			P33 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P32-P35_P72-P75.agc:420
//#
// P32-P35_P72-P75.agc:421
//#			P73 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P32-P35_P72-P75.agc:422
//#
// P32-P35_P72-P75.agc:423
//# INPUT
// P32-P35_P72-P75.agc:424
//#
// P32-P35_P72-P75.agc:425
//#	(1)	TTPIO	TIME OF THE TPI MANEUVER -- SAVED FROM P32/P72
// P32-P35_P72-P75.agc:426
//# Page 626
// P32-P35_P72-P75.agc:427
//#	(2)	ELEV	DESIRED LOS ANGLE AT TPI -- SAVED FROM P32/P72
// P32-P35_P72-P75.agc:428
//#	(3)	TCDH	TIME OF THE CDH MANEUVER
// P32-P35_P72-P75.agc:429
//#
// P32-P35_P72-P75.agc:430
//# OUTPUT
// P32-P35_P72-P75.agc:431
//#
// P32-P35_P72-P75.agc:432
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P32-P35_P72-P75.agc:433
//#	(2)	TTOGO		TIME TO GO
// P32-P35_P72-P75.agc:434
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// P32-P35_P72-P75.agc:435
//#	(4)	DIFFALT		DELTA ALTITUDE AT CDH
// P32-P35_P72-P75.agc:436
//#	(5)	T2TOT3		DELTA TIME FROM CDH TO COMPUTED TPI
// P32-P35_P72-P75.agc:437
//#	(6)	NOMTPI		DELTA TIME FROM NOMINAL TPI TO COMPUTED TPI
// P32-P35_P72-P75.agc:438
//#	(7)	DELVLVC		DELTA VELOCITY AT CDH -- LOCAL VERTICAL COORDINATES
// P32-P35_P72-P75.agc:439
//#
// P32-P35_P72-P75.agc:440
//# DOWNLINK
// P32-P35_P72-P75.agc:441
//#
// P32-P35_P72-P75.agc:442
//#	(1)	TCDH		TIME OF THE CDH MANEUVER
// P32-P35_P72-P75.agc:443
//#	(2)	TTPI		TIME OF THE TPI MANEUVER
// P32-P35_P72-P75.agc:444
//#	(3)	TIG		TIME OF THE CDH MANEUVER
// P32-P35_P72-P75.agc:445
//#	(4)	DELLVEET2	DELTA VELOCITY AT CDH -- REFERENCE COORDINATES
// P32-P35_P72-P75.agc:446
//#	(5)	DIFFALT		DELTA ALTITUDE AT CDH
// P32-P35_P72-P75.agc:447
//#	(6)	ELEV		DESIRED LOS ANGLE AT TPI
// P32-P35_P72-P75.agc:448
//#
// P32-P35_P72-P75.agc:449
//# COMMUNICATION TO THRUSTING PROGRAMS
// P32-P35_P72-P75.agc:450
//#
// P32-P35_P72-P75.agc:451
//#	(1)	TIG		TIME OF THE CDH MANEUVER
// P32-P35_P72-P75.agc:452
//#	(2)	RTIG		POSITION OF ACTIVE VEHICLE AT CDH -- BEFORE ROTATION
// P32-P35_P72-P75.agc:453
//#				INTO PLANE OF PASSIVE VEHICLE.
// P32-P35_P72-P75.agc:454
//#	(3)	VTIG		VELOCITY OF ACTIVE VEHICLE AT CDH -- BEFORE ROTATION
// P32-P35_P72-P75.agc:455
//#				INTO PLANE OF PASSIVE VEHICLE.
// P32-P35_P72-P75.agc:456
//#	(4)	DELVSIN		DELTA VELOCITY AT CDH -- REFERENCE COORDINATES.
// P32-P35_P72-P75.agc:457
//#	(5)	DELVSAB		MAGNITUDE OF DELTA VELOCITY AT CDH.
// P32-P35_P72-P75.agc:458
//#	(6)	XDELVFLG	SET TO INDICATE EXTERNAL DELTA V VG COMPUTATION.
// P32-P35_P72-P75.agc:459
//#
// P32-P35_P72-P75.agc:460
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:461
//#
// P32-P35_P72-P75.agc:462
//#	AVFLAGA
// P32-P35_P72-P75.agc:463
//#	AVFLAGP
// P32-P35_P72-P75.agc:464
//#	P20FLGON
// P32-P35_P72-P75.agc:465
//#	VNPOOH
// P32-P35_P72-P75.agc:466
//#	SELECTMU
// P32-P35_P72-P75.agc:467
//#	ADVANCE
// P32-P35_P72-P75.agc:468
//#	CDHMVR
// P32-P35_P72-P75.agc:469
//#	INTINT3P
// P32-P35_P72-P75.agc:470
//#	ACTIVE
// P32-P35_P72-P75.agc:471
//#	PASSIVE
// P32-P35_P72-P75.agc:472
//#	S33/S34.1
// P32-P35_P72-P75.agc:473
//#	ALARM
// P32-P35_P72-P75.agc:474
//#	BANKCALL
// P32-P35_P72-P75.agc:475
//#	GOFLASH
// P32-P35_P72-P75.agc:476
//#	GOTOPOOH
// P32-P35_P72-P75.agc:477
//#	S32/33.1
// P32-P35_P72-P75.agc:478
//# Page 627
// P32-P35_P72-P75.agc:479
//#	VN1645
// P32-P35_P72-P75.agc:480
//
// P32-P35_P72-P75.agc:481
//		COUNT*	$$/P3373
// P32-P35_P72-P75.agc:482
//P33		TC	AVFLAGA
// slot 31886
            if slot <> 31886 or instruction <> 1255 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1255, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31887 {
// P32-P35_P72-P75.agc:483
//		TC	P33/P73A
// slot 31887
                if slot <> 31887 or instruction <> 1169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:484
//P73		TC	AVFLAGP
// slot 31888
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
// P32-P35_P72-P75.agc:485
//P33/P73A	TC	P20FLGON
// slot 31889
                if slot <> 31889 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:486
//		CAF	V06N13		# TCDH
// slot 31890
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
// P32-P35_P72-P75.agc:487
//		TC	VNPOOH
// slot 31891
                if slot <> 31891 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:488
//		TC	INTPRET
// slot 31892
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
// P32-P35_P72-P75.agc:489
//		DLOAD
// slot 31893
    31893, 65482,
// P32-P35_P72-P75.agc:490
//			TTPIO
// slot 31894
    31894, 3904,
// P32-P35_P72-P75.agc:491
//		STODL	TTPI
// slot 31895
    31895, 16188,
// P32-P35_P72-P75.agc:492
//			TCDH
// slot 31896
    31896, 2046,
// P32-P35_P72-P75.agc:493
//		STCALL	TIG
// slot 31897
    31897, 32324,
// P32-P35_P72-P75.agc:494
//			SELECTMU
// slot 31898
    31898, 16384,
// P32-P35_P72-P75.agc:495
//P33/P73B	CALL
// slot 31899
    31899, 65320,
// P32-P35_P72-P75.agc:496
//			ADVANCE
// slot 31900
    31900, 58396,
// P32-P35_P72-P75.agc:497
//		CALL
// slot 31901
    31901, 65320,
// P32-P35_P72-P75.agc:498
//			CDHMVR
// slot 31902
    31902, 58550,
// P32-P35_P72-P75.agc:499
//		SETPD	VLOAD
// slot 31903
    31903, 64770,
// P32-P35_P72-P75.agc:500
//			0D
// slot 31904
    31904, 2,
// P32-P35_P72-P75.agc:501
//			VACT3
// slot 31905
    31905, 3784,
// P32-P35_P72-P75.agc:502
//		PDVL	CALL
// slot 31906
    31906, 38042,
// P32-P35_P72-P75.agc:503
//			RACT2
// slot 31907
    31907, 2450,
// P32-P35_P72-P75.agc:504
//			INTINT3P
// slot 31908
    31908, 58482,
// P32-P35_P72-P75.agc:505
//		CALL
// slot 31909
    31909, 65320,
// P32-P35_P72-P75.agc:506
//			ACTIVE
// slot 31910
    31910, 39428,
// P32-P35_P72-P75.agc:507
//		SETPD	VLOAD
// slot 31911
    31911, 64770,
// P32-P35_P72-P75.agc:508
//			0D
// slot 31912
    31912, 2,
// P32-P35_P72-P75.agc:509
//			VPASS2
// slot 31913
    31913, 3760,
// P32-P35_P72-P75.agc:510
//		PDVL	CALL
// slot 31914
    31914, 38042,
// P32-P35_P72-P75.agc:511
//			RPASS2
// slot 31915
    31915, 3748,
// P32-P35_P72-P75.agc:512
//			INTINT3P
// slot 31916
    31916, 58482,
// P32-P35_P72-P75.agc:513
//		CALL
// slot 31917
    31917, 65320,
// P32-P35_P72-P75.agc:514
//			PASSIVE
// slot 31918
    31918, 39444,
// P32-P35_P72-P75.agc:515
//		DLOAD	SET
// slot 31919
    31919, 36042,
// P32-P35_P72-P75.agc:516
//			P30ZERO
// slot 31920
    31920, 27168,
// P32-P35_P72-P75.agc:517
//			ITSWICH
// slot 31921
    31921, 3680,
// P32-P35_P72-P75.agc:518
//		STCALL	NOMTPI
// slot 31922
    31922, 31134,
// P32-P35_P72-P75.agc:519
//			S33/34.1
// slot 31923
    31923, 60392,
// P32-P35_P72-P75.agc:520
//		BZE	EXIT
// slot 31924
    31924, 65112,
// P32-P35_P72-P75.agc:521
//			P33/P73C
// slot 31925
    31925, 59780
)).

// bank 35, slots 31926-31926
function agcAotUnit2022 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:522
//		TC	ALARM
// slot 31926
    if slot <> 31926 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2022] to agcAotUnit2022@.

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:523
//		OCT	611
// slot 31927
    31927, 786
)).

// bank 35, slots 31928-31929
function agcAotUnit2023 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31928 {
// P32-P35_P72-P75.agc:524
//		CAF	V05N09
// slot 31928
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
// P32-P35_P72-P75.agc:525
//		TC	BANKCALL
// slot 31929
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
// P32-P35_P72-P75.agc:526
//		CADR	GOFLASH
// slot 31930
    31930, 17020
)).

// bank 35, slots 31931-31934
function agcAotUnit2024 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31932 {
        if slot <= 31931 {
// P32-P35_P72-P75.agc:527
//		TC	GOTOPOOH
// slot 31931
            if slot <> 31931 or instruction <> 3073 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3073, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:528
//		TC	+2
// slot 31932
            if slot <> 31932 or instruction <> 1214 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1214, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31933 {
// P32-P35_P72-P75.agc:529
//# Page 628
// P32-P35_P72-P75.agc:530
//		TC	P33/P73A
// slot 31933
            if slot <> 31933 or instruction <> 1169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:531
//		TC	INTPRET
// slot 31934
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
// P32-P35_P72-P75.agc:532
//		DLOAD
// slot 31935
    31935, 65482,
// P32-P35_P72-P75.agc:533
//			P30ZERO
// slot 31936
    31936, 27168,
// P32-P35_P72-P75.agc:534
//		STORE	NOMTPI
// slot 31937
    31937, 2462,
// P32-P35_P72-P75.agc:535
//P33/P73C	BON	SET
// slot 31938
    31938, 35864,
// P32-P35_P72-P75.agc:536
//			FINALFLG
// slot 31939
    31939, 1426,
// P32-P35_P72-P75.agc:537
//			P33/P73D
// slot 31940
    31940, 59788,
// P32-P35_P72-P75.agc:538
//			UPDATFLG
// slot 31941
    31941, 624,
// P32-P35_P72-P75.agc:539
//P33/P73D	DLOAD	DAD
// slot 31942
    31942, 36298,
// P32-P35_P72-P75.agc:540
//			NOMTPI
// slot 31943
    31943, 2462,
// P32-P35_P72-P75.agc:541
//			TTPI
// slot 31944
    31944, 3900,
// P32-P35_P72-P75.agc:542
//		STORE	TTPI
// slot 31945
    31945, 3900,
// P32-P35_P72-P75.agc:543
//		DSU
// slot 31946
    31946, 65322,
// P32-P35_P72-P75.agc:544
//			TCDH
// slot 31947
    31947, 2046,
// P32-P35_P72-P75.agc:545
//P33/P73E	DSU	BPL
// slot 31948
    31948, 42026,
// P32-P35_P72-P75.agc:546
//			60MIN
// slot 31949
    31949, 27172,
// P32-P35_P72-P75.agc:547
//			P33/P73E
// slot 31950
    31950, 59800,
// P32-P35_P72-P75.agc:548
//		DAD
// slot 31951
    31951, 65306,
// P32-P35_P72-P75.agc:549
//			60MIN
// slot 31952
    31952, 27172,
// P32-P35_P72-P75.agc:550
//		STODL	T1TOT2
// slot 31953
    31953, 14678,
// P32-P35_P72-P75.agc:551
//			TTPI
// slot 31954
    31954, 3900,
// P32-P35_P72-P75.agc:552
//		DSU	PUSH
// slot 31955
    31955, 34346,
// P32-P35_P72-P75.agc:553
//			TTPIO
// slot 31956
    31956, 3904,
// P32-P35_P72-P75.agc:554
//P33/P73F	ABS	DSU
// slot 31957
    31957, 38220,
// P32-P35_P72-P75.agc:555
//			60MIN
// slot 31958
    31958, 27172,
// P32-P35_P72-P75.agc:556
//		BPL	DAD
// slot 31959
    31959, 36168,
// P32-P35_P72-P75.agc:557
//			P33/P73F
// slot 31960
    31960, 59818,
// P32-P35_P72-P75.agc:558
//			60MIN
// slot 31961
    31961, 27172,
// P32-P35_P72-P75.agc:559
//		SIGN	STADR
// slot 31962
    31962, 38634,
// P32-P35_P72-P75.agc:560
//		STORE	T2TOT3
// slot 31963
    31963, 63140,
// P32-P35_P72-P75.agc:561
//		EXIT
// slot 31964
    31964, 65532
)).

// bank 35, slots 31965-31967
function agcAotUnit2025 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31965 {
// P32-P35_P72-P75.agc:562
//		CAF	V06N75
// slot 31965
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
// P32-P35_P72-P75.agc:563
//		TC	VNPOOH
// slot 31966
            if slot <> 31966 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:564
//		TC	INTPRET
// slot 31967
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
// P32-P35_P72-P75.agc:565
//		VLOAD	CALL
// slot 31968
    31968, 38138,
// P32-P35_P72-P75.agc:566
//			DELVEET2
// slot 31969
    31969, 2426,
// P32-P35_P72-P75.agc:567
//			S32/33.1
// slot 31970
    31970, 58496,
// P32-P35_P72-P75.agc:568
//		STCALL	DELVEET2
// slot 31971
    31971, 31098,
// P32-P35_P72-P75.agc:569
//			VN1645
// slot 31972
    31972, 61196,
// P32-P35_P72-P75.agc:570
//		GOTO
// slot 31973
    31973, 65360,
// P32-P35_P72-P75.agc:571
//			P33/P73B
// slot 31974
    31974, 59702
)).

// bank 35, slots 31975-31977
function agcAotUnit2026 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31975 {
// P32-P35_P72-P75.agc:572
//
// P32-P35_P72-P75.agc:573
//# Page 629
// P32-P35_P72-P75.agc:574
//# ***** ADFLAG/P *****
// P32-P35_P72-P75.agc:575
//#
// P32-P35_P72-P75.agc:576
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:577
//#
// P32-P35_P72-P75.agc:578
//#	UPFLAG
// P32-P35_P72-P75.agc:579
//#	DOWNFLAG
// P32-P35_P72-P75.agc:580
//
// P32-P35_P72-P75.agc:581
//AVFLAGA		EXTEND			# AVFLAG = LEM
// slot 31975
        if slot <> 31975 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 31976 {
// P32-P35_P72-P75.agc:582
//		QXCH	SUBEXIT
// slot 31976
            if slot <> 31976 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:583
//		TC	UPFLAG
// slot 31977
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
// P32-P35_P72-P75.agc:584
//		ADRES	AVFLAG
// slot 31978
    31978, 80
)).

// bank 35, slots 31979-31982
function agcAotUnit2027 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31980 {
        if slot <= 31979 {
// P32-P35_P72-P75.agc:585
//		TC	SUBEXIT
// slot 31979
            if slot <> 31979 or instruction <> 824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:586
//AVFLAGP		EXTEND			# AVFLAG = CSM
// slot 31980
            if slot <> 31980 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31981 {
// P32-P35_P72-P75.agc:587
//		QXCH	SUBEXIT
// slot 31981
            if slot <> 31981 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:588
//		TC	DOWNFLAG
// slot 31982
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
// P32-P35_P72-P75.agc:589
//		ADRES	AVFLAG
// slot 31983
    31983, 80
)).

// bank 35, slots 31984-31987
function agcAotUnit2028 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31985 {
        if slot <= 31984 {
// P32-P35_P72-P75.agc:590
//		TC	SUBEXIT
// slot 31984
            if slot <> 31984 or instruction <> 824 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 824, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:591
//P20FLGON	EXTEND
// slot 31985
            if slot <> 31985 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31986 {
// P32-P35_P72-P75.agc:592
//		QXCH	SUBEXIT
// slot 31986
            if slot <> 31986 or instruction <> 10040 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 824, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:593
//		TC	UPFLAG
// slot 31987
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
// P32-P35_P72-P75.agc:594
//		ADRES	UPDATFLG	# SET UPDATFLG
// slot 31988
    31988, 46
)).

// bank 35, slots 31989-31989
function agcAotUnit2029 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:595
//		TC	UPFLAG
// slot 31989
    if slot <> 31989 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2029] to agcAotUnit2029@.

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:596
//		ADRES	TRACKFLG	# SET TRACKFLG
// slot 31990
    31990, 50
)).

// bank 35, slots 31991-31991
function agcAotUnit2030 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:597
//		TC	SUBEXIT
// slot 31991
    if slot <> 31991 or instruction <> 824 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 824, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2030] to agcAotUnit2030@.

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:598
//
// P32-P35_P72-P75.agc:599
//# Page 630
// P32-P35_P72-P75.agc:600
//# ***** DISDVLVC *****
// P32-P35_P72-P75.agc:601
//#
// P32-P35_P72-P75.agc:602
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:603
//#
// P32-P35_P72-P75.agc:604
//#	S32/33.X
// P32-P35_P72-P75.agc:605
//#	VNPOOH
// P32-P35_P72-P75.agc:606
//
// P32-P35_P72-P75.agc:607
//DISDVLVC	STORE	DELVLVC
// slot 31992
    31992, 3640,
// P32-P35_P72-P75.agc:608
//		STQ	CALL
// slot 31993
    31993, 37920,
// P32-P35_P72-P75.agc:609
//			NORMEX
// slot 31994
    31994, 3686,
// P32-P35_P72-P75.agc:610
//			S32/33.X
// slot 31995
    31995, 58528,
// P32-P35_P72-P75.agc:611
//		VLOAD	MXV
// slot 31996
    31996, 53754,
// P32-P35_P72-P75.agc:612
//			DELVLVC
// slot 31997
    31997, 3640,
// P32-P35_P72-P75.agc:613
//			0D
// slot 31998
    31998, 2,
// P32-P35_P72-P75.agc:614
//		VSL1	SXA,1
// slot 31999
    31999, 55540,
// P32-P35_P72-P75.agc:615
//			VERBNOUN
// slot 32000
    32000, 3866,
// P32-P35_P72-P75.agc:616
//		STORE	DELVLVC
// slot 32001
    32001, 3640,
// P32-P35_P72-P75.agc:617
//		EXIT
// slot 32002
    32002, 65532
)).

// bank 35, slots 32003-32005
function agcAotUnit2031 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32003 {
// P32-P35_P72-P75.agc:618
//		CA	VERBNOUN
// slot 32003
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
// P32-P35_P72-P75.agc:619
//		TC	VNPOOH
// slot 32004
            if slot <> 32004 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P32-P35_P72-P75.agc:620
//		TC	INTPRET
// slot 32005
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
// P32-P35_P72-P75.agc:621
//		GOTO
// slot 32006
    32006, 65360,
// P32-P35_P72-P75.agc:622
//			NORMEX
// slot 32007
    32007, 3686,
// P32-P35_P72-P75.agc:623
//
// P32-P35_P72-P75.agc:624
//# Page 631
// P32-P35_P72-P75.agc:625
//# ***** CONSTANTS *****
// P32-P35_P72-P75.agc:626
//
// P32-P35_P72-P75.agc:627
//V06N11		VN	0611
// slot 32008
    32008, 1558,
// P32-P35_P72-P75.agc:628
//V06N13		VN	0613
// slot 32009
    32009, 1562,
// P32-P35_P72-P75.agc:629
//V06N75		VN	0675
// slot 32010
    32010, 1686,
// P32-P35_P72-P75.agc:630
//SN359+		2DEC	-.000086601
// slot 32011 32012
    32011, 65532, 32012, 51808,
// P32-P35_P72-P75.agc:631
//
// P32-P35_P72-P75.agc:632
//CS359+		2DEC	+.499999992
// slot 32013 32014
    32013, 16382, 32014, 32764,
// P32-P35_P72-P75.agc:633
//
// P32-P35_P72-P75.agc:634
//P30ZERO		2DEC	0
// slot 32015 32016
    32015, 0, 32016, 0,
// P32-P35_P72-P75.agc:635
//
// P32-P35_P72-P75.agc:636
//60MIN		2DEC	360000
// slot 32017 32018
    32017, 42, 32018, 31872,
// P32-P35_P72-P75.agc:637
//
// P32-P35_P72-P75.agc:638
//ALARM/TB	OCT	00600		# NO 1
// slot 32019
    32019, 768,
// P32-P35_P72-P75.agc:639
//		OCT	00601		#    2
// slot 32020
    32020, 770,
// P32-P35_P72-P75.agc:640
//		OCT	00602		#    3
// slot 32021
    32021, 772,
// P32-P35_P72-P75.agc:641
//		OCT	00603		#    4
// slot 32022
    32022, 774,
// P32-P35_P72-P75.agc:642
//		OCT	00604		#    5
// slot 32023
    32023, 776,
// P32-P35_P72-P75.agc:643
//		OCT	00605		#    6
// slot 32024
    32024, 778,
// P32-P35_P72-P75.agc:644
//		OCT	00606		#    7
// slot 32025
    32025, 780,
// P32-P35_P72-P75.agc:645
//
// P32-P35_P72-P75.agc:646
//# Page 632
// P32-P35_P72-P75.agc:647
//# ***** CSI/A *****
// P32-P35_P72-P75.agc:648
//#
// P32-P35_P72-P75.agc:649
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:650
//#
// P32-P35_P72-P75.agc:651
//#	VECSHIFT
// P32-P35_P72-P75.agc:652
//#	TIMETHET
// P32-P35_P72-P75.agc:653
//#	PERIAPO
// P32-P35_P72-P75.agc:654
//#	SHIFTR1
// P32-P35_P72-P75.agc:655
//#	INTINT2C
// P32-P35_P72-P75.agc:656
//#	CDHMVR
// P32-P35_P72-P75.agc:657
//#	PERIAPO1
// P32-P35_P72-P75.agc:658
//#	INTINT
// P32-P35_P72-P75.agc:659
//#	ACTIVE
// P32-P35_P72-P75.agc:660
//
// P32-P35_P72-P75.agc:661
//		BANK	34
// P32-P35_P72-P75.agc:662
//		SETLOC	CSI/CDH1
// P32-P35_P72-P75.agc:663
//		BANK
// P32-P35_P72-P75.agc:664
//		EBANK=	SUBEXIT
// P32-P35_P72-P75.agc:665
//		COUNT*	$$/CSI
// P32-P35_P72-P75.agc:666
//LOOPMX		2DEC	16
// slot 30767 30768
    30767, 0, 30768, 32,
// P32-P35_P72-P75.agc:667
//
// P32-P35_P72-P75.agc:668
//INITST		2DEC	.03048 B-7	# INITIAL DELDV = 10 FPS
// slot 30769 30770
    30769, 6, 30770, 29538,
// P32-P35_P72-P75.agc:669
//
// P32-P35_P72-P75.agc:670
//DVMAX1		2DEC	3.0480 B-7	# MAXIMUM DV1 = 1000 FPS
// slot 30771 30772
    30771, 780, 30772, 4718,
// P32-P35_P72-P75.agc:671
//
// P32-P35_P72-P75.agc:672
//DVMAX2		2DEC	3.014472 B-7	#		 989 FPS
// slot 30773 30774
    30773, 770, 30774, 27932,
// P32-P35_P72-P75.agc:673
//
// P32-P35_P72-P75.agc:674
//1DPB2		2DEC	1.0 B-2
// slot 30775 30776
    30775, 8192, 30776, 0,
// P32-P35_P72-P75.agc:675
//
// P32-P35_P72-P75.agc:676
//1DPB28		2DEC	1
// slot 30777 30778
    30777, 0, 30778, 2,
// P32-P35_P72-P75.agc:677
//
// P32-P35_P72-P75.agc:678
//PMINE		2DEC	157420 B-29	# 85 NM -- MUST BE 8 WORDS BEFORE PMINM
// slot 30779 30780
    30779, 8, 30780, 26348,
// P32-P35_P72-P75.agc:679
//
// P32-P35_P72-P75.agc:680
//EPSILN1		2DEC	.0003048 B-7	# .1 FPS
// slot 30781 30782
    30781, 0, 30782, 1278,
// P32-P35_P72-P75.agc:681
//
// P32-P35_P72-P75.agc:682
//NICKELDP	2DEC	.021336 B-7	# 7 FPS (CHANGED FROM .05 FPS)
// slot 30783 30784
    30783, 4, 30784, 23954,
// P32-P35_P72-P75.agc:683
//
// P32-P35_P72-P75.agc:684
//FIFPSDP		2DEC	-.152400 B-7	# 50 FPS
// slot 30785 30786
    30785, 65496, 30786, 48914,
// P32-P35_P72-P75.agc:685
//
// P32-P35_P72-P75.agc:686
//PMINM		2DEC	10668 B-29	# 35000 FT -- MUST BE 8 WORDS AFTER PMINE
// slot 30787 30788
    30787, 0, 30788, 10668,
// P32-P35_P72-P75.agc:687
//
// P32-P35_P72-P75.agc:688
//DELMAX1		2DEC	.6096000 B-7	# 200 FPS
// slot 30789 30790
    30789, 156, 30790, 944,
// P32-P35_P72-P75.agc:689
//
// P32-P35_P72-P75.agc:690
//ONETHTH		2DEC	.0001 B-3
// slot 30791 30792
    30791, 0, 30792, 6710,
// P32-P35_P72-P75.agc:691
//
// P32-P35_P72-P75.agc:692
//TMIN		2DEC	60000		# 10 MIN
// slot 30793 30794
    30793, 6, 30794, 21696,
// P32-P35_P72-P75.agc:693
//
// P32-P35_P72-P75.agc:694
//CSI/A		CLEAR	SET		# INITIALIZE INDICATORS
// slot 30795
    30795, 35864,
// P32-P35_P72-P75.agc:695
//			S32.1F1		# DVT1 HAS EXCEEDED MAX INDICATOR
// slot 30796
    30796, 3424,
// P32-P35_P72-P75.agc:696
//			S32.1F2		# FIRST PASS FOR NEWTON ITERATION INDICATOR
// slot 30797
    30797, 3170,
// P32-P35_P72-P75.agc:697
//# Page 633
// P32-P35_P72-P75.agc:698
//		CLEAR	SET
// slot 30798
    30798, 35864,
// P32-P35_P72-P75.agc:699
//			S32.1F3A	# 00=1ST 2 PASSES 2ND CYCLE, 01=FIRST CYCLE
// slot 30799
    30799, 3428,
// P32-P35_P72-P75.agc:700
//			S32.1F3B	# 10=2ND CYCLE, 11=50 FPS STAGE 2ND CYCLE
// slot 30800
    30800, 3174,
// P32-P35_P72-P75.agc:701
//		DLOAD
// slot 30801
    30801, 65482,
// P32-P35_P72-P75.agc:702
//			P30ZERO
// slot 30802
    30802, 27168,
// P32-P35_P72-P75.agc:703
//		STORE	LOOPCT
// slot 30803
    30803, 3852,
// P32-P35_P72-P75.agc:704
//		STORE	CSIALRM
// slot 30804
    30804, 3864,
// P32-P35_P72-P75.agc:705
//CSI/B		SETPD	VLOAD
// slot 30805
    30805, 64770,
// P32-P35_P72-P75.agc:706
//			0D
// slot 30806
    30806, 2,
// P32-P35_P72-P75.agc:707
//			RACT1
// slot 30807
    30807, 2438,
// P32-P35_P72-P75.agc:708
//		ABVAL	PUSH		# RA1			      B29 PL02D
// slot 30808
    30808, 34380,
// P32-P35_P72-P75.agc:709
//		NORM	SR1
// slot 30809
    30809, 57986,
// P32-P35_P72-P75.agc:710
//			X2		#		       B29-N2+ B1 PL04D
// slot 30810
    30810, 80,
// P32-P35_P72-P75.agc:711
//		PDVL	ABVAL
// slot 30811
    30811, 42650,
// P32-P35_P72-P75.agc:712
//			RPASS3
// slot 30812
    30812, 3796,
// P32-P35_P72-P75.agc:713
//		NORM	BDDV		# RA1/RP3		       B1 PL02D
// slot 30813
    30813, 46466,
// P32-P35_P72-P75.agc:714
//			X1
// slot 30814
    30814, 78,
// P32-P35_P72-P75.agc:715
//		XSU,2	SR*		#			       B2
// slot 30815
    30815, 44904,
// P32-P35_P72-P75.agc:716
//			X1
// slot 30816
    30816, 76,
// P32-P35_P72-P75.agc:717
//			1,2
// slot 30817
    30817, 48378,
// P32-P35_P72-P75.agc:718
//		DAD	DMP		# (1+(RA1/RP3))RA1	B29+B2=B31 PL00D
// slot 30818
    30818, 34074,
// P32-P35_P72-P75.agc:719
//			1DPB2
// slot 30819
    30819, 24688,
// P32-P35_P72-P75.agc:720
//		NORM	PDDL		#				   PL02D
// slot 30820
    30820, 54658,
// P32-P35_P72-P75.agc:721
//			X1
// slot 30821
    30821, 78,
// P32-P35_P72-P75.agc:722
//			RTMU
// slot 30822
    30822, 2466,
// P32-P35_P72-P75.agc:723
//		SR1	DDV		#		       B38-B31= B7 PL00D
// slot 30823
    30823, 47556,
// P32-P35_P72-P75.agc:724
//		SL*	SQRT		#				B7
// slot 30824
    30824, 63070,
// P32-P35_P72-P75.agc:725
//			0 	-7,1
// slot 30825
    30825, 16628,
// P32-P35_P72-P75.agc:726
//		PDVL	UNIT		#				   PL02D
// slot 30826
    30826, 44698,
// P32-P35_P72-P75.agc:727
//			RACT1
// slot 30827
    30827, 2438,
// P32-P35_P72-P75.agc:728
//		PDVL	VXV
// slot 30828
    30828, 40346,
// P32-P35_P72-P75.agc:729
//			UP1
// slot 30829
    30829, 2402,
// P32-P35_P72-P75.agc:730
//		UNIT			# UNIT(URP1 X UVP1 X URA1) = UH1
// slot 30830
    30830, 65372,
// P32-P35_P72-P75.agc:731
//		DOT	SL1		# VA1 . UH1			B7
// slot 30831
    30831, 59970,
// P32-P35_P72-P75.agc:732
//			VACT1
// slot 30832
    30832, 3700,
// P32-P35_P72-P75.agc:733
//		BDSU	STADR		#				   PL00D
// slot 30833
    30833, 38434,
// P32-P35_P72-P75.agc:734
//		STODL	DELVCSI
// slot 30834
    30834, 49414,
// P32-P35_P72-P75.agc:735
//			INITST		# 10 FPS
// slot 30835
    30835, 24676,
// P32-P35_P72-P75.agc:736
//		STORE	DELDV
// slot 30836
    30836, 3860,
// P32-P35_P72-P75.agc:737
//CSI/B1		DLOAD	DAD		# IF LOOPCT = 16
// slot 30837
    30837, 36298,
// P32-P35_P72-P75.agc:738
//			LOOPCT
// slot 30838
    30838, 3852,
// P32-P35_P72-P75.agc:739
//			1DPB28
// slot 30839
    30839, 24692,
// P32-P35_P72-P75.agc:740
//		STORE	LOOPCT
// slot 30840
    30840, 3852,
// P32-P35_P72-P75.agc:741
//		DSU	AXT,2
// slot 30841
    30841, 64554,
// P32-P35_P72-P75.agc:742
//			LOOPMX
// slot 30842
    30842, 24672,
// P32-P35_P72-P75.agc:743
//			6
// slot 30843
    30843, 12,
// P32-P35_P72-P75.agc:744
//		BPL
// slot 30844
    30844, 65352,
// P32-P35_P72-P75.agc:745
//			SCNDSOL
// slot 30845
    30845, 58364,
// P32-P35_P72-P75.agc:746
//CSI/B2		SETPD
// slot 30846
    30846, 65282,
// P32-P35_P72-P75.agc:747
//			0D
// slot 30847
    30847, 2,
// P32-P35_P72-P75.agc:748
//# Page 634
// P32-P35_P72-P75.agc:749
//		DLOAD	ABS
// slot 30848
    30848, 42698
)).

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:750
//			DELVCSI
// slot 30849
    30849, 3832,
// P32-P35_P72-P75.agc:751
//		DSU	BMN
// slot 30850
    30850, 41002,
// P32-P35_P72-P75.agc:752
//			DVMAX1
// slot 30851
    30851, 24680,
// P32-P35_P72-P75.agc:753
//			CSI/B23
// slot 30852
    30852, 57640,
// P32-P35_P72-P75.agc:754
//		AXT,2	BON
// slot 30853
    30853, 36088,
// P32-P35_P72-P75.agc:755
//			7
// slot 30854
    30854, 14,
// P32-P35_P72-P75.agc:756
//			S32.1F1
// slot 30855
    30855, 3456,
// P32-P35_P72-P75.agc:757
//			SCNDSOL
// slot 30856
    30856, 58364,
// P32-P35_P72-P75.agc:758
//		BOFF	BON
// slot 30857
    30857, 35864,
// P32-P35_P72-P75.agc:759
//			S32.1F3A
// slot 30858
    30858, 3524,
// P32-P35_P72-P75.agc:760
//			CSI/B22		# FLAG 3 NEQ 3
// slot 30859
    30859, 57628,
// P32-P35_P72-P75.agc:761
//			S32.1F3B
// slot 30860
    30860, 3462,
// P32-P35_P72-P75.agc:762
//			SCNDSOL
// slot 30861
    30861, 58364,
// P32-P35_P72-P75.agc:763
//CSI/B22		SET	DLOAD
// slot 30862
    30862, 58648,
// P32-P35_P72-P75.agc:764
//			S32.1F1
// slot 30863
    30863, 3168,
// P32-P35_P72-P75.agc:765
//			DVMAX2
// slot 30864
    30864, 24684,
// P32-P35_P72-P75.agc:766
//		SIGN
// slot 30865
    30865, 65514,
// P32-P35_P72-P75.agc:767
//			DELVCSI
// slot 30866
    30866, 3832,
// P32-P35_P72-P75.agc:768
//		STORE	DELVCSI
// slot 30867
    30867, 3832,
// P32-P35_P72-P75.agc:769
//CSI/B23		VLOAD	PUSH
// slot 30868
    30868, 34554,
// P32-P35_P72-P75.agc:770
//			RACT1
// slot 30869
    30869, 2438,
// P32-P35_P72-P75.agc:771
//		UNIT	PDVL
// slot 30870
    30870, 52572,
// P32-P35_P72-P75.agc:772
//			UP1
// slot 30871
    30871, 2402,
// P32-P35_P72-P75.agc:773
//		VXV	UNIT		# UNIT (URP1 X UVP1 X URA1) = UH1
// slot 30872
    30872, 44602,
// P32-P35_P72-P75.agc:774
//		VXSC	VSL1
// slot 30873
    30873, 64226,
// P32-P35_P72-P75.agc:775
//			DELVCSI
// slot 30874
    30874, 3832,
// P32-P35_P72-P75.agc:776
//		STORE	DELVEET1
// slot 30875
    30875, 2414,
// P32-P35_P72-P75.agc:777
//		VAD	BOV
// slot 30876
    30876, 32858,
// P32-P35_P72-P75.agc:778
//			VACT1
// slot 30877
    30877, 3700,
// P32-P35_P72-P75.agc:779
//			CSI/B23D
// slot 30878
    30878, 57662,
// P32-P35_P72-P75.agc:780
//CSI/B23D	STCALL	VACT4
// slot 30879
    30879, 32492,
// P32-P35_P72-P75.agc:781
//			VECSHIFT
// slot 30880
    30880, 39452,
// P32-P35_P72-P75.agc:782
//		STOVL	VVEC
// slot 30881
    30881, 23496,
// P32-P35_P72-P75.agc:783
//		SET
// slot 30882
    30882, 65304,
// P32-P35_P72-P75.agc:784
//			RVSW
// slot 30883
    30883, 3692,
// P32-P35_P72-P75.agc:785
//		STOVL	RVEC
// slot 30884
    30884, 23386,
// P32-P35_P72-P75.agc:786
//			SN359+
// slot 30885
    30885, 27160,
// P32-P35_P72-P75.agc:787
//		STCALL	SNTH		# ALSO CSTH
// slot 30886
    30886, 31664,
// P32-P35_P72-P75.agc:788
//			TIMETHET
// slot 30887
    30887, 21428,
// P32-P35_P72-P75.agc:789
//		SR1	LXA,1
// slot 30888
    30888, 59588,
// P32-P35_P72-P75.agc:790
//			RTX1
// slot 30889
    30889, 3068,
// P32-P35_P72-P75.agc:791
//		STCALL	HAFPA1
// slot 30890
    30890, 32520,
// P32-P35_P72-P75.agc:792
//			PERIAPO
// slot 30891
    30891, 39340,
// P32-P35_P72-P75.agc:793
//		CALL
// slot 30892
    30892, 65320,
// P32-P35_P72-P75.agc:794
//			SHIFTR1
// slot 30893
    30893, 39468,
// P32-P35_P72-P75.agc:795
//		STODL	POSTCSI
// slot 30894
    30894, 16132,
// P32-P35_P72-P75.agc:796
//			CENTANG
// slot 30895
    30895, 3874,
// P32-P35_P72-P75.agc:797
//		BZE	GOTO
// slot 30896
    30896, 43096,
// P32-P35_P72-P75.agc:798
//			+2
// slot 30897
    30897, 57702,
// P32-P35_P72-P75.agc:799
//# Page 635
// P32-P35_P72-P75.agc:800
//			CIRCL
// slot 30898
    30898, 57844,
// P32-P35_P72-P75.agc:801
//		DLOAD
// slot 30899
    30899, 65482,
// P32-P35_P72-P75.agc:802
//			ECC
// slot 30900
    30900, 3028,
// P32-P35_P72-P75.agc:803
//		DSU	BMN
// slot 30901
    30901, 41002,
// P32-P35_P72-P75.agc:804
//			ONETHTH
// slot 30902
    30902, 24720,
// P32-P35_P72-P75.agc:805
//			CIRCL
// slot 30903
    30903, 57844,
// P32-P35_P72-P75.agc:806
//		DLOAD	CALL
// slot 30904
    30904, 38090,
// P32-P35_P72-P75.agc:807
//			R1
// slot 30905
    30905, 66,
// P32-P35_P72-P75.agc:808
//			SHIFTR1
// slot 30906
    30906, 39468,
// P32-P35_P72-P75.agc:809
//		SETPD	NORM
// slot 30907
    30907, 49410,
// P32-P35_P72-P75.agc:810
//			2D
// slot 30908
    30908, 6,
// P32-P35_P72-P75.agc:811
//			X1
// slot 30909
    30909, 78,
// P32-P35_P72-P75.agc:812
//		PDVL	DOT		#					PL04D
// slot 30910
    30910, 41370,
// P32-P35_P72-P75.agc:813
//			RACT1
// slot 30911
    30911, 2438,
// P32-P35_P72-P75.agc:814
//			VACT4
// slot 30912
    30912, 3820,
// P32-P35_P72-P75.agc:815
//		ABS	DDV
// slot 30913
    30913, 47436,
// P32-P35_P72-P75.agc:816
//			02D		# (/RDOTV/)/R1		   B38-B29= B7
// slot 30914
    30914, 6,
// P32-P35_P72-P75.agc:817
//		SL*	DSU
// slot 30915
    30915, 38238,
// P32-P35_P72-P75.agc:818
//			0,1
// slot 30916
    30916, 16642,
// P32-P35_P72-P75.agc:819
//			NICKELDP
// slot 30917
    30917, 24704,
// P32-P35_P72-P75.agc:820
//		BMN	DLOAD
// slot 30918
    30918, 58688,
// P32-P35_P72-P75.agc:821
//			CIRCL
// slot 30919
    30919, 57844,
// P32-P35_P72-P75.agc:822
//			P
// slot 30920
    30920, 3008,
// P32-P35_P72-P75.agc:823
//		SL2	DSU
// slot 30921
    30921, 38292,
// P32-P35_P72-P75.agc:824
//			1DPB2
// slot 30922
    30922, 24688,
// P32-P35_P72-P75.agc:825
//		STODL	14D
// slot 30923
    30923, 12318,
// P32-P35_P72-P75.agc:826
//			RTSR1/MU
// slot 30924
    30924, 2462,
// P32-P35_P72-P75.agc:827
//		SR1	DDV		# (1/ROOTMU)/R1		B-16-B29 = B-45 PL02D
// slot 30925
    30925, 47556,
// P32-P35_P72-P75.agc:828
//		PDDL	DMP
// slot 30926
    30926, 34218,
// P32-P35_P72-P75.agc:829
//			P
// slot 30927
    30927, 3008,
// P32-P35_P72-P75.agc:830
//			R1
// slot 30928
    30928, 66,
// P32-P35_P72-P75.agc:831
//		CALL
// slot 30929
    30929, 65320,
// P32-P35_P72-P75.agc:832
//			SHIFTR1
// slot 30930
    30930, 39468,
// P32-P35_P72-P75.agc:833
//		SL4	SL1
// slot 30931
    30931, 59924,
// P32-P35_P72-P75.agc:834
//		SQRT	DMP		# ((P/MU)**.5)/R1	B14+B-14 = B-31 PL02D
// slot 30932
    30932, 34284,
// P32-P35_P72-P75.agc:835
//		BOFF	SL3
// slot 30933
    30933, 43544,
// P32-P35_P72-P75.agc:836
//			CMOONFLG
// slot 30934
    30934, 4550,
// P32-P35_P72-P75.agc:837
//			CSI/B3
// slot 30935
    30935, 57776,
// P32-P35_P72-P75.agc:838
//CSI/B3		PDVL	DOT
// slot 30936
    30936, 41370,
// P32-P35_P72-P75.agc:839
//			RACT1
// slot 30937
    30937, 2438,
// P32-P35_P72-P75.agc:840
//			VACT4
// slot 30938
    30938, 3820,
// P32-P35_P72-P75.agc:841
//		STORE	RDOTV
// slot 30939
    30939, 3870,
// P32-P35_P72-P75.agc:842
//		ABS
// slot 30940
    30940, 65356,
// P32-P35_P72-P75.agc:843
//		NORM	DMP		# ((P/MU)**.5)RDOTV/R1			PL02D
// slot 30941
    30941, 34178,
// P32-P35_P72-P75.agc:844
//			X2
// slot 30942
    30942, 80,
// P32-P35_P72-P75.agc:845
//		XSU,1	SL*		#		       B-31+B36-B3 = B2
// slot 30943
    30943, 44896,
// P32-P35_P72-P75.agc:846
//			X2
// slot 30944
    30944, 78,
// P32-P35_P72-P75.agc:847
//			3,1
// slot 30945
    30945, 16648,
// P32-P35_P72-P75.agc:848
//		STODL	12D
// slot 30946
    30946, 12314,
// P32-P35_P72-P75.agc:849
//			P30ZERO
// slot 30947
    30947, 27168,
// P32-P35_P72-P75.agc:850
//# Page 636
// P32-P35_P72-P75.agc:851
//		STORE	16D
// slot 30948
    30948, 34,
// P32-P35_P72-P75.agc:852
//		VLOAD	UNIT
// slot 30949
    30949, 44794,
// P32-P35_P72-P75.agc:853
//			12D
// slot 30950
    30950, 26,
// P32-P35_P72-P75.agc:854
//		STOVL	SNTH		# ALSO STORES CSTH AND 0
// slot 30951
    30951, 23472,
// P32-P35_P72-P75.agc:855
//			RACT1
// slot 30952
    30952, 2438,
// P32-P35_P72-P75.agc:856
//		PDVL	SIGN
// slot 30953
    30953, 62874,
// P32-P35_P72-P75.agc:857
//			VACT4
// slot 30954
    30954, 3820,
// P32-P35_P72-P75.agc:858
//			RDOTV
// slot 30955
    30955, 3870,
// P32-P35_P72-P75.agc:859
//		VCOMP	CALL
// slot 30956
    30956, 38012,
// P32-P35_P72-P75.agc:860
//			VECSHIFT
// slot 30957
    30957, 39452,
// P32-P35_P72-P75.agc:861
//		STOVL	VVEC
// slot 30958
    30958, 23496,
// P32-P35_P72-P75.agc:862
//		SET
// slot 30959
    30959, 65304,
// P32-P35_P72-P75.agc:863
//			RVSW
// slot 30960
    30960, 3692,
// P32-P35_P72-P75.agc:864
//		STCALL	RVEC
// slot 30961
    30961, 31578,
// P32-P35_P72-P75.agc:865
//			TIMETHET
// slot 30962
    30962, 21428,
// P32-P35_P72-P75.agc:866
//		PDDL	BPL
// slot 30963
    30963, 42154,
// P32-P35_P72-P75.agc:867
//			RDOTV
// slot 30964
    30964, 3870,
// P32-P35_P72-P75.agc:868
//			NTP/2
// slot 30965
    30965, 57852,
// P32-P35_P72-P75.agc:869
//		DLOAD	DSU
// slot 30966
    30966, 38346,
// P32-P35_P72-P75.agc:870
//			HAFPA1
// slot 30967
    30967, 3848,
// P32-P35_P72-P75.agc:871
//		PUSH	GOTO
// slot 30968
    30968, 43020,
// P32-P35_P72-P75.agc:872
//			NTP/2
// slot 30969
    30969, 57852,
// P32-P35_P72-P75.agc:873
//CIRCL		SETPD	DLOAD
// slot 30970
    30970, 58626,
// P32-P35_P72-P75.agc:874
//			00D
// slot 30971
    30971, 2,
// P32-P35_P72-P75.agc:875
//			P30ZERO
// slot 30972
    30972, 27168,
// P32-P35_P72-P75.agc:876
//		PUSH
// slot 30973
    30973, 65292,
// P32-P35_P72-P75.agc:877
//NTP/2		DLOAD	DMP
// slot 30974
    30974, 34250
)).

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:878
//			NN
// slot 30975
    30975, 3694,
// P32-P35_P72-P75.agc:879
//			HAFPA1
// slot 30976
    30976, 3848,
// P32-P35_P72-P75.agc:880
//		SL	DSU
// slot 30977
    30977, 38242,
// P32-P35_P72-P75.agc:881
//			14D
// slot 30978
    30978, 16670,
// P32-P35_P72-P75.agc:882
//		DAD
// slot 30979
    30979, 65306,
// P32-P35_P72-P75.agc:883
//			TCSI
// slot 30980
    30980, 3896,
// P32-P35_P72-P75.agc:884
//		STORE	TCDH
// slot 30981
    30981, 2046,
// P32-P35_P72-P75.agc:885
//		BDSU	AXT,2
// slot 30982
    30982, 64546,
// P32-P35_P72-P75.agc:886
//			TTPI
// slot 30983
    30983, 3900,
// P32-P35_P72-P75.agc:887
//			5D
// slot 30984
    30984, 10,
// P32-P35_P72-P75.agc:888
//		BMN	SETPD
// slot 30985
    30985, 33088,
// P32-P35_P72-P75.agc:889
//			SCNDSOL
// slot 30986
    30986, 58364,
// P32-P35_P72-P75.agc:890
//			0D
// slot 30987
    30987, 2,
// P32-P35_P72-P75.agc:891
//		VLOAD	PDVL
// slot 30988
    30988, 52730,
// P32-P35_P72-P75.agc:892
//			VACT4
// slot 30989
    30989, 3820,
// P32-P35_P72-P75.agc:893
//			RACT1
// slot 30990
    30990, 2438,
// P32-P35_P72-P75.agc:894
//		CALL
// slot 30991
    30991, 65320,
// P32-P35_P72-P75.agc:895
//			INTINT2C
// slot 30992
    30992, 58468,
// P32-P35_P72-P75.agc:896
//		STOVL	RACT2
// slot 30993
    30993, 22930,
// P32-P35_P72-P75.agc:897
//			VATT
// slot 30994
    30994, 14,
// P32-P35_P72-P75.agc:898
//		STOVL	VACT2
// slot 30995
    30995, 24216,
// P32-P35_P72-P75.agc:899
//			VPASS1
// slot 30996
    30996, 3724,
// P32-P35_P72-P75.agc:900
//		SETPD	PDVL
// slot 30997
    30997, 52482,
// P32-P35_P72-P75.agc:901
//# Page 637
// P32-P35_P72-P75.agc:902
//			0D
// slot 30998
    30998, 2,
// P32-P35_P72-P75.agc:903
//			RPASS1
// slot 30999
    30999, 3712,
// P32-P35_P72-P75.agc:904
//		CALL
// slot 31000
    31000, 65320,
// P32-P35_P72-P75.agc:905
//			INTINT2C
// slot 31001
    31001, 58468,
// P32-P35_P72-P75.agc:906
//		STOVL	RPASS2
// slot 31002
    31002, 24228,
// P32-P35_P72-P75.agc:907
//			VATT
// slot 31003
    31003, 14,
// P32-P35_P72-P75.agc:908
//		STCALL	VPASS2
// slot 31004
    31004, 32432,
// P32-P35_P72-P75.agc:909
//			CDHMVR
// slot 31005
    31005, 58550,
// P32-P35_P72-P75.agc:910
//		VLOAD	SETPD
// slot 31006
    31006, 33274,
// P32-P35_P72-P75.agc:911
//			RACT2
// slot 31007
    31007, 2450,
// P32-P35_P72-P75.agc:912
//			0D
// slot 31008
    31008, 2,
// P32-P35_P72-P75.agc:913
//		PDVL	CALL
// slot 31009
    31009, 38042,
// P32-P35_P72-P75.agc:914
//			VACT3
// slot 31010
    31010, 3784,
// P32-P35_P72-P75.agc:915
//			PERIAPO1
// slot 31011
    31011, 39324,
// P32-P35_P72-P75.agc:916
//		CALL
// slot 31012
    31012, 65320,
// P32-P35_P72-P75.agc:917
//			SHIFTR1
// slot 31013
    31013, 39468,
// P32-P35_P72-P75.agc:918
//		STOVL	POSTCDH
// slot 31014
    31014, 24328,
// P32-P35_P72-P75.agc:919
//			VACT3
// slot 31015
    31015, 3784,
// P32-P35_P72-P75.agc:920
//		SETPD	PDVL
// slot 31016
    31016, 52482,
// P32-P35_P72-P75.agc:921
//			0D
// slot 31017
    31017, 2,
// P32-P35_P72-P75.agc:922
//			RACT2
// slot 31018
    31018, 2450,
// P32-P35_P72-P75.agc:923
//		PDDL	PDDL
// slot 31019
    31019, 54698,
// P32-P35_P72-P75.agc:924
//			TCDH
// slot 31020
    31020, 2046,
// P32-P35_P72-P75.agc:925
//			TTPI
// slot 31021
    31021, 3900,
// P32-P35_P72-P75.agc:926
//		PDDL	PUSH
// slot 31022
    31022, 34474,
// P32-P35_P72-P75.agc:927
//			TWOPI
// slot 31023
    31023, 28596,
// P32-P35_P72-P75.agc:928
//		CALL
// slot 31024
    31024, 65320,
// P32-P35_P72-P75.agc:929
//			INTINT
// slot 31025
    31025, 61036,
// P32-P35_P72-P75.agc:930
//		CALL
// slot 31026
    31026, 65320,
// P32-P35_P72-P75.agc:931
//			ACTIVE
// slot 31027
    31027, 39428,
// P32-P35_P72-P75.agc:932
//		DLOAD
// slot 31028
    31028, 65482,
// P32-P35_P72-P75.agc:933
//			ELEV
// slot 31029
    31029, 2398,
// P32-P35_P72-P75.agc:934
//		SETPD	SINE
// slot 31030
    31030, 60930,
// P32-P35_P72-P75.agc:935
//			6D
// slot 31031
    31031, 14,
// P32-P35_P72-P75.agc:936
//		PDVL	UNIT
// slot 31032
    31032, 44698,
// P32-P35_P72-P75.agc:937
//			RACT3
// slot 31033
    31033, 3772,
// P32-P35_P72-P75.agc:938
//		STORE	00D		# URA3 AT 00D
// slot 31034
    31034, 2,
// P32-P35_P72-P75.agc:939
//		PDVL	VXV		# PL14D, PL08D
// slot 31035
    31035, 40346,
// P32-P35_P72-P75.agc:940
//			UP1
// slot 31036
    31036, 2402,
// P32-P35_P72-P75.agc:941
//		UNIT
// slot 31037
    31037, 65372,
// P32-P35_P72-P75.agc:942
//		PDDL	COSINE		# UNIT(URA3 X UVA3 X URA3) = UH3	B1 PL14D
// slot 31038
    31038, 59050,
// P32-P35_P72-P75.agc:943
//			ELEV
// slot 31039
    31039, 2398,
// P32-P35_P72-P75.agc:944
//		VXSC	STADR		# (COSLOS)(UH3)				B2 PL08D
// slot 31040
    31040, 38626,
// P32-P35_P72-P75.agc:945
//		STORE	18D		#	PLUS
// slot 31041
    31041, 65496,
// P32-P35_P72-P75.agc:946
//		DLOAD	VXSC		# (SINLOS)(URA3) = U			B2 PL00D
// slot 31042
    31042, 61898,
// P32-P35_P72-P75.agc:947
//		VAD	VSL1
// slot 31043
    31043, 64090,
// P32-P35_P72-P75.agc:948
//			18D		#					B1
// slot 31044
    31044, 38,
// P32-P35_P72-P75.agc:949
//		PUSH	DOT		#					   PL06D
// slot 31045
    31045, 41228,
// P32-P35_P72-P75.agc:950
//			RACT3		# (U . RA3) = TEMP1	      B1 +B29 = B30
// slot 31046
    31046, 3772,
// P32-P35_P72-P75.agc:951
//		SL1	PUSH		#				       B29 PL08D
// slot 31047
    31047, 34516,
// P32-P35_P72-P75.agc:952
//# Page 638
// P32-P35_P72-P75.agc:953
//		DSQ	TLOAD		# TEMP1**2			       B58
// slot 31048
    31048, 59804,
// P32-P35_P72-P75.agc:954
//			MPAC
// slot 31049
    31049, 218,
// P32-P35_P72-P75.agc:955
//		PDVL	DOT		#					   PL11D
// slot 31050
    31050, 41370,
// P32-P35_P72-P75.agc:956
//			RACT3
// slot 31051
    31051, 3772,
// P32-P35_P72-P75.agc:957
//			RACT3
// slot 31052
    31052, 3772,
// P32-P35_P72-P75.agc:958
//		TLOAD	DCOMP		# RA3 . RA3
// slot 31053
    31053, 48850,
// P32-P35_P72-P75.agc:959
//			MPAC
// slot 31054
    31054, 218,
// P32-P35_P72-P75.agc:960
//		PDVL	DOT		# RP3 . RP3			       B58 PL14D
// slot 31055
    31055, 41370,
// P32-P35_P72-P75.agc:961
//			RPASS3
// slot 31056
    31056, 3796,
// P32-P35_P72-P75.agc:962
//			RPASS3		#					   PL11D
// slot 31057
    31057, 3796,
// P32-P35_P72-P75.agc:963
//		TAD	TAD		# TEMP1**2 + RA3.RA3 + RP3.RP3 = TEMP2	   PL08D
// slot 31058
    31058, 63986,
// P32-P35_P72-P75.agc:964
//		BPL	DLOAD
// slot 31059
    31059, 58696,
// P32-P35_P72-P75.agc:965
//			K10RK2
// slot 31060
    31060, 58052,
// P32-P35_P72-P75.agc:966
//			LOOPCT
// slot 31061
    31061, 3852,
// P32-P35_P72-P75.agc:967
//		DSU	AXT,2
// slot 31062
    31062, 64554,
// P32-P35_P72-P75.agc:968
//			1DPB28
// slot 31063
    31063, 24692,
// P32-P35_P72-P75.agc:969
//			1D
// slot 31064
    31064, 2,
// P32-P35_P72-P75.agc:970
//		BZE
// slot 31065
    31065, 65368,
// P32-P35_P72-P75.agc:971
//			ALMXITA
// slot 31066
    31066, 59452,
// P32-P35_P72-P75.agc:972
//		DLOAD	SR1
// slot 31067
    31067, 58058,
// P32-P35_P72-P75.agc:973
//			DELDV
// slot 31068
    31068, 3860,
// P32-P35_P72-P75.agc:974
//		STORE	DELDV
// slot 31069
    31069, 3860,
// P32-P35_P72-P75.agc:975
//		BDSU
// slot 31070
    31070, 65314,
// P32-P35_P72-P75.agc:976
//			DVPREV
// slot 31071
    31071, 3836,
// P32-P35_P72-P75.agc:977
//		STCALL	DELVCSI
// slot 31072
    31072, 32504,
// P32-P35_P72-P75.agc:978
//			CSI/B1
// slot 31073
    31073, 57578,
// P32-P35_P72-P75.agc:979
//K10RK2		SQRT	PUSH		# TEMP3 = TEMP2**.5		       B29 PL10D
// slot 31074
    31074, 34540,
// P32-P35_P72-P75.agc:980
//		DCOMP	DSU
// slot 31075
    31075, 38268,
// P32-P35_P72-P75.agc:981
//			06D		# -TEMP1-TEMP3 = K2 AT 10D
// slot 31076
    31076, 14,
// P32-P35_P72-P75.agc:982
//		STODL	10D		#					   PL08D
// slot 31077
    31077, 12310,
// P32-P35_P72-P75.agc:983
//		DSU	STADR		#					   PL06D
// slot 31078
    31078, 38442,
// P32-P35_P72-P75.agc:984
//		STORE	12D		# -TEMP1+TEMP3 = K1 AT 12D
// slot 31079
    31079, 65508,
// P32-P35_P72-P75.agc:985
//		ABS
// slot 31080
    31080, 65356,
// P32-P35_P72-P75.agc:986
//		STODL	14D
// slot 31081
    31081, 12318,
// P32-P35_P72-P75.agc:987
//			10D
// slot 31082
    31082, 22,
// P32-P35_P72-P75.agc:988
//		ABS	DSU
// slot 31083
    31083, 38220,
// P32-P35_P72-P75.agc:989
//			14D
// slot 31084
    31084, 30,
// P32-P35_P72-P75.agc:990
//		BMN	DLOAD
// slot 31085
    31085, 58688,
// P32-P35_P72-P75.agc:991
//			K2.
// slot 31086
    31086, 58082,
// P32-P35_P72-P75.agc:992
//			12D
// slot 31087
    31087, 26,
// P32-P35_P72-P75.agc:993
//		STORE	10D		# K = K1
// slot 31088
    31088, 22,
// P32-P35_P72-P75.agc:994
//K2.		DLOAD
// slot 31089
    31089, 65482,
// P32-P35_P72-P75.agc:995
//			10D
// slot 31090
    31090, 22,
// P32-P35_P72-P75.agc:996
//		VXSC	VSL1
// slot 31091
    31091, 64226,
// P32-P35_P72-P75.agc:997
//		VAD	UNIT		# V = RA3 + KU UNIT			B1
// slot 31092
    31092, 44634,
// P32-P35_P72-P75.agc:998
//			RACT3
// slot 31093
    31093, 3772,
// P32-P35_P72-P75.agc:999
//		PDVL	UNIT
// slot 31094
    31094, 44698,
// P32-P35_P72-P75.agc:1000
//			RPASS3		#					   PL06D
// slot 31095
    31095, 3796,
// P32-P35_P72-P75.agc:1001
//		PDVL	UNIT
// slot 31096
    31096, 44698,
// P32-P35_P72-P75.agc:1002
//			VPASS3		#					   PL12D
// slot 31097
    31097, 3808,
// P32-P35_P72-P75.agc:1003
//# Page 639
// P32-P35_P72-P75.agc:1004
//		VXV	PDVL		# UVP3 X URP3				   PL18D
// slot 31098
    31098, 52538,
// P32-P35_P72-P75.agc:1005
//			06D
// slot 31099
    31099, 14
)).

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:1006
//			06D
// slot 31100
    31100, 14,
// P32-P35_P72-P75.agc:1007
//		VXV	DOT
// slot 31101
    31101, 41274,
// P32-P35_P72-P75.agc:1008
//			00D
// slot 31102
    31102, 2,
// P32-P35_P72-P75.agc:1009
//		STADR			#					   PL12D
// slot 31103
    31103, 65324,
// P32-P35_P72-P75.agc:1010
//		STOVL	12D		# (URP3 X V).(UVP3 X URP3)=TEMP		   PL06D
// slot 31104
    31104, 45028,
// P32-P35_P72-P75.agc:1011
//		DOT	SL1		#					   PL00D
// slot 31105
    31105, 59970,
// P32-P35_P72-P75.agc:1012
//		ARCCOS	SIGN
// slot 31106
    31106, 62892,
// P32-P35_P72-P75.agc:1013
//			12D		#					B0
// slot 31107
    31107, 26,
// P32-P35_P72-P75.agc:1014
//		SR1	PUSH		# GAMMA = SIGN(TEMP)ARCOS(UNITV.URP3)	   PL02D
// slot 31108
    31108, 34500,
// P32-P35_P72-P75.agc:1015
//		BON	DLOAD
// slot 31109
    31109, 58648,
// P32-P35_P72-P75.agc:1016
//			S32.1F2
// slot 31110
    31110, 3458,
// P32-P35_P72-P75.agc:1017
//			FRSTPAS
// slot 31111
    31111, 58184,
// P32-P35_P72-P75.agc:1018
//			00D		# NOT THE FIRST PASS OF A CYCLE
// slot 31112
    31112, 2,
// P32-P35_P72-P75.agc:1019
//		DSU	PDDL		# GAMMA-GAMPREV				B1 PL04D
// slot 31113
    31113, 54570,
// P32-P35_P72-P75.agc:1020
//			GAMPREV
// slot 31114
    31114, 3856,
// P32-P35_P72-P75.agc:1021
//			DELVCSI
// slot 31115
    31115, 3832,
// P32-P35_P72-P75.agc:1022
//		DSU	NORM		#					B7
// slot 31116
    31116, 49450,
// P32-P35_P72-P75.agc:1023
//			DVPREV
// slot 31117
    31117, 3836,
// P32-P35_P72-P75.agc:1024
//			X1
// slot 31118
    31118, 78,
// P32-P35_P72-P75.agc:1025
//		BDDV	PDDL		# (GAM-GAMPREV)/(DV-DVPREV)	     B-6+N1 PL06D
// slot 31119
    31119, 54634,
// P32-P35_P72-P75.agc:1026
//			02D		#	= SLOPE
// slot 31120
    31120, 6,
// P32-P35_P72-P75.agc:1027
//			DELVCSI
// slot 31121
    31121, 3832,
// P32-P35_P72-P75.agc:1028
//		STORE	DVPREV
// slot 31122
    31122, 3836,
// P32-P35_P72-P75.agc:1029
//		BOFF	BOFF
// slot 31123
    31123, 35864,
// P32-P35_P72-P75.agc:1030
//			S32.1F3A
// slot 31124
    31124, 3524,
// P32-P35_P72-P75.agc:1031
//			THRDCHK
// slot 31125
    31125, 58204,
// P32-P35_P72-P75.agc:1032
//			S32.1F3B
// slot 31126
    31126, 3526,
// P32-P35_P72-P75.agc:1033
//			THRDCHK
// slot 31127
    31127, 58204,
// P32-P35_P72-P75.agc:1034
//		DLOAD	DMP
// slot 31128
    31128, 34250,
// P32-P35_P72-P75.agc:1035
//			02D
// slot 31129
    31129, 6,
// P32-P35_P72-P75.agc:1036
//			GAMPREV
// slot 31130
    31130, 3856,
// P32-P35_P72-P75.agc:1037
//		BPL	DLOAD
// slot 31131
    31131, 58696,
// P32-P35_P72-P75.agc:1038
//			FIFTYFPS
// slot 31132
    31132, 58214,
// P32-P35_P72-P75.agc:1039
//			INITST
// slot 31133
    31133, 24676,
// P32-P35_P72-P75.agc:1040
//		SIGN
// slot 31134
    31134, 65514,
// P32-P35_P72-P75.agc:1041
//			DELDV
// slot 31135
    31135, 3860,
// P32-P35_P72-P75.agc:1042
//		STORE	DELDV
// slot 31136
    31136, 3860,
// P32-P35_P72-P75.agc:1043
//		SET	CLEAR
// slot 31137
    31137, 35864,
// P32-P35_P72-P75.agc:1044
//			S32.1F3A
// slot 31138
    31138, 3172,
// P32-P35_P72-P75.agc:1045
//			S32.1F3B
// slot 31139
    31139, 3430,
// P32-P35_P72-P75.agc:1046
//FRSTPAS		DLOAD
// slot 31140
    31140, 65482,
// P32-P35_P72-P75.agc:1047
//			00D
// slot 31141
    31141, 2,
// P32-P35_P72-P75.agc:1048
//		STODL	GAMPREV
// slot 31142
    31142, 16144,
// P32-P35_P72-P75.agc:1049
//			DELVCSI
// slot 31143
    31143, 3832,
// P32-P35_P72-P75.agc:1050
//		STORE	DVPREV
// slot 31144
    31144, 3836,
// P32-P35_P72-P75.agc:1051
//		DSU	CLEAR
// slot 31145
    31145, 35882,
// P32-P35_P72-P75.agc:1052
//			DELDV
// slot 31146
    31146, 3860,
// P32-P35_P72-P75.agc:1053
//			S32.1F2
// slot 31147
    31147, 3426,
// P32-P35_P72-P75.agc:1054
//# Page 640
// P32-P35_P72-P75.agc:1055
//		STCALL	DELVCSI
// slot 31148
    31148, 32504,
// P32-P35_P72-P75.agc:1056
//			CSI/B1
// slot 31149
    31149, 57578,
// P32-P35_P72-P75.agc:1057
//THRDCHK		BON	BON
// slot 31150
    31150, 35864,
// P32-P35_P72-P75.agc:1058
//			S32.1F3A
// slot 31151
    31151, 3460,
// P32-P35_P72-P75.agc:1059
//			NEWTN
// slot 31152
    31152, 58244,
// P32-P35_P72-P75.agc:1060
//			S32.1F3B
// slot 31153
    31153, 3462,
// P32-P35_P72-P75.agc:1061
//			NEWTN
// slot 31154
    31154, 58244,
// P32-P35_P72-P75.agc:1062
//FIFTYFPS	DLOAD	SIGN
// slot 31155
    31155, 62922,
// P32-P35_P72-P75.agc:1063
//			FIFPSDP
// slot 31156
    31156, 24708,
// P32-P35_P72-P75.agc:1064
//			04D
// slot 31157
    31157, 10,
// P32-P35_P72-P75.agc:1065
//		SIGN
// slot 31158
    31158, 65514,
// P32-P35_P72-P75.agc:1066
//			GAMPREV
// slot 31159
    31159, 3856,
// P32-P35_P72-P75.agc:1067
//		STORE	DELDV
// slot 31160
    31160, 3860,
// P32-P35_P72-P75.agc:1068
//		DCOMP	DAD
// slot 31161
    31161, 36220,
// P32-P35_P72-P75.agc:1069
//			DELVCSI
// slot 31162
    31162, 3832,
// P32-P35_P72-P75.agc:1070
//		STODL	DELVCSI
// slot 31163
    31163, 16120,
// P32-P35_P72-P75.agc:1071
//			00D
// slot 31164
    31164, 2,
// P32-P35_P72-P75.agc:1072
//		SET	SET
// slot 31165
    31165, 35864,
// P32-P35_P72-P75.agc:1073
//			S32.1F3B
// slot 31166
    31166, 3174,
// P32-P35_P72-P75.agc:1074
//			S32.1F3A
// slot 31167
    31167, 3172,
// P32-P35_P72-P75.agc:1075
//		STCALL	GAMPREV
// slot 31168
    31168, 32528,
// P32-P35_P72-P75.agc:1076
//			CSI/B2
// slot 31169
    31169, 57596,
// P32-P35_P72-P75.agc:1077
//NEWTN		DLOAD	NORM
// slot 31170
    31170, 49610,
// P32-P35_P72-P75.agc:1078
//			04D
// slot 31171
    31171, 10,
// P32-P35_P72-P75.agc:1079
//			X2
// slot 31172
    31172, 80,
// P32-P35_P72-P75.agc:1080
//		BDDV	XSU,1
// slot 31173
    31173, 45162,
// P32-P35_P72-P75.agc:1081
//			00D
// slot 31174
    31174, 2,
// P32-P35_P72-P75.agc:1082
//			X2
// slot 31175
    31175, 78,
// P32-P35_P72-P75.agc:1083
//		SR*
// slot 31176
    31176, 65374,
// P32-P35_P72-P75.agc:1084
//			0,1
// slot 31177
    31177, 17154,
// P32-P35_P72-P75.agc:1085
//		STODL	DELDV
// slot 31178
    31178, 16148,
// P32-P35_P72-P75.agc:1086
//			00D
// slot 31179
    31179, 2,
// P32-P35_P72-P75.agc:1087
//		STORE	GAMPREV
// slot 31180
    31180, 3856,
// P32-P35_P72-P75.agc:1088
//		DLOAD	ABS
// slot 31181
    31181, 42698,
// P32-P35_P72-P75.agc:1089
//			DELDV		#					   PL08D
// slot 31182
    31182, 3860,
// P32-P35_P72-P75.agc:1090
//		PUSH	DSU
// slot 31183
    31183, 38156,
// P32-P35_P72-P75.agc:1091
//			EPSILN1
// slot 31184
    31184, 24700,
// P32-P35_P72-P75.agc:1092
//		BMN	DLOAD
// slot 31185
    31185, 58688,
// P32-P35_P72-P75.agc:1093
//			CSI/SOL
// slot 31186
    31186, 58302,
// P32-P35_P72-P75.agc:1094
//		DSU	BMN
// slot 31187
    31187, 41002,
// P32-P35_P72-P75.agc:1095
//			DELMAX1
// slot 31188
    31188, 24716,
// P32-P35_P72-P75.agc:1096
//			CSISTEP
// slot 31189
    31189, 58292,
// P32-P35_P72-P75.agc:1097
//		DLOAD	SIGN
// slot 31190
    31190, 62922,
// P32-P35_P72-P75.agc:1098
//			DELMAX1
// slot 31191
    31191, 24716,
// P32-P35_P72-P75.agc:1099
//			DELDV
// slot 31192
    31192, 3860,
// P32-P35_P72-P75.agc:1100
//		STORE	DELDV
// slot 31193
    31193, 3860,
// P32-P35_P72-P75.agc:1101
//CSISTEP		DLOAD	DSU
// slot 31194
    31194, 38346,
// P32-P35_P72-P75.agc:1102
//			DELVCSI
// slot 31195
    31195, 3832,
// P32-P35_P72-P75.agc:1103
//			DELDV
// slot 31196
    31196, 3860,
// P32-P35_P72-P75.agc:1104
//		STCALL	DELVCSI
// slot 31197
    31197, 32504,
// P32-P35_P72-P75.agc:1105
//# Page 641
// P32-P35_P72-P75.agc:1106
//			CSI/B1
// slot 31198
    31198, 57578,
// P32-P35_P72-P75.agc:1107
//CSI/SOL		DLOAD	AXT,2
// slot 31199
    31199, 64714,
// P32-P35_P72-P75.agc:1108
//			POSTCSI
// slot 31200
    31200, 3844,
// P32-P35_P72-P75.agc:1109
//			2
// slot 31201
    31201, 4,
// P32-P35_P72-P75.agc:1110
//		LXA,1
// slot 31202
    31202, 65488,
// P32-P35_P72-P75.agc:1111
//			RTX1
// slot 31203
    31203, 3068,
// P32-P35_P72-P75.agc:1112
//		DSU*	BMN
// slot 31204
    31204, 40998,
// P32-P35_P72-P75.agc:1113
//			PMINE 	-2,1
// slot 31205
    31205, 24692,
// P32-P35_P72-P75.agc:1114
//			SCNDSOL
// slot 31206
    31206, 58364,
// P32-P35_P72-P75.agc:1115
//		AXT,2	DLOAD
// slot 31207
    31207, 58872,
// P32-P35_P72-P75.agc:1116
//			3
// slot 31208
    31208, 6,
// P32-P35_P72-P75.agc:1117
//			POSTCDH
// slot 31209
    31209, 3848,
// P32-P35_P72-P75.agc:1118
//		DSU*	BMN
// slot 31210
    31210, 40998,
// P32-P35_P72-P75.agc:1119
//			PMINE 	-2,1
// slot 31211
    31211, 24692,
// P32-P35_P72-P75.agc:1120
//			SCNDSOL
// slot 31212
    31212, 58364,
// P32-P35_P72-P75.agc:1121
//		DLOAD	DSU
// slot 31213
    31213, 38346,
// P32-P35_P72-P75.agc:1122
//			TCDH
// slot 31214
    31214, 2046,
// P32-P35_P72-P75.agc:1123
//			TCSI
// slot 31215
    31215, 3896,
// P32-P35_P72-P75.agc:1124
//		STORE	T1TOT2
// slot 31216
    31216, 2390,
// P32-P35_P72-P75.agc:1125
//		AXT,2	DSU
// slot 31217
    31217, 38392,
// P32-P35_P72-P75.agc:1126
//			4
// slot 31218
    31218, 8,
// P32-P35_P72-P75.agc:1127
//			TMIN
// slot 31219
    31219, 24724,
// P32-P35_P72-P75.agc:1128
//		BMN	AXT,2
// slot 31220
    31220, 64576,
// P32-P35_P72-P75.agc:1129
//			SCNDSOL
// slot 31221
    31221, 58364,
// P32-P35_P72-P75.agc:1130
//			5
// slot 31222
    31222, 10,
// P32-P35_P72-P75.agc:1131
//		DLOAD	DSU
// slot 31223
    31223, 38346,
// P32-P35_P72-P75.agc:1132
//			TTPI
// slot 31224
    31224, 3900,
// P32-P35_P72-P75.agc:1133
//			TCDH
// slot 31225
    31225, 2046
)).

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:1134
//		STORE	T2TOT3
// slot 31226
    31226, 2394,
// P32-P35_P72-P75.agc:1135
//		DSU	BPL
// slot 31227
    31227, 42026,
// P32-P35_P72-P75.agc:1136
//			TMIN
// slot 31228
    31228, 24724,
// P32-P35_P72-P75.agc:1137
//			P32/P72C
// slot 31229
    31229, 59604,
// P32-P35_P72-P75.agc:1138
//SCNDSOL		BON	BOFF
// slot 31230
    31230, 35864,
// P32-P35_P72-P75.agc:1139
//			S32.1F3A
// slot 31231
    31231, 3460,
// P32-P35_P72-P75.agc:1140
//			ALMXIT
// slot 31232
    31232, 59456,
// P32-P35_P72-P75.agc:1141
//			S32.1F3B
// slot 31233
    31233, 3526,
// P32-P35_P72-P75.agc:1142
//			ALMXIT
// slot 31234
    31234, 59456,
// P32-P35_P72-P75.agc:1143
//		SXA,2	DLOAD
// slot 31235
    31235, 58808,
// P32-P35_P72-P75.agc:1144
//			CSIALRM
// slot 31236
    31236, 3862,
// P32-P35_P72-P75.agc:1145
//			P30ZERO
// slot 31237
    31237, 27168,
// P32-P35_P72-P75.agc:1146
//		CLEAR	SET
// slot 31238
    31238, 35864,
// P32-P35_P72-P75.agc:1147
//			S32.1F1
// slot 31239
    31239, 3424,
// P32-P35_P72-P75.agc:1148
//			S32.1F2
// slot 31240
    31240, 3170,
// P32-P35_P72-P75.agc:1149
//		CLEAR	CLEAR
// slot 31241
    31241, 35864,
// P32-P35_P72-P75.agc:1150
//			S32.1F3A
// slot 31242
    31242, 3428,
// P32-P35_P72-P75.agc:1151
//			S32.1F3B
// slot 31243
    31243, 3430,
// P32-P35_P72-P75.agc:1152
//		STCALL	LOOPCT
// slot 31244
    31244, 32524,
// P32-P35_P72-P75.agc:1153
//			CSI/B
// slot 31245
    31245, 57514,
// P32-P35_P72-P75.agc:1154
//
// P32-P35_P72-P75.agc:1155
//# Page 642
// P32-P35_P72-P75.agc:1156
//# ***** ADVANCE *****
// P32-P35_P72-P75.agc:1157
//#
// P32-P35_P72-P75.agc:1158
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:1159
//#	PRECSET
// P32-P35_P72-P75.agc:1160
//#	ROTATE
// P32-P35_P72-P75.agc:1161
//
// P32-P35_P72-P75.agc:1162
//ADVANCE		STQ	DLOAD
// slot 31246
    31246, 58656,
// P32-P35_P72-P75.agc:1163
//			SUBEXIT
// slot 31247
    31247, 3696,
// P32-P35_P72-P75.agc:1164
//			TIG
// slot 31248
    31248, 3652,
// P32-P35_P72-P75.agc:1165
//		STCALL	TDEC1
// slot 31249
    31249, 28738,
// P32-P35_P72-P75.agc:1166
//			PRECSET
// slot 31250
    31250, 39392,
// P32-P35_P72-P75.agc:1167
//		SET	VLOAD
// slot 31251
    31251, 64792,
// P32-P35_P72-P75.agc:1168
//			XDELVFLG
// slot 31252
    31252, 1134,
// P32-P35_P72-P75.agc:1169
//			VPASS3
// slot 31253
    31253, 3808,
// P32-P35_P72-P75.agc:1170
//		STORE	VPASS2
// slot 31254
    31254, 3760,
// P32-P35_P72-P75.agc:1171
//		STOVL	VPASS1
// slot 31255
    31255, 24204,
// P32-P35_P72-P75.agc:1172
//			RPASS3
// slot 31256
    31256, 3796,
// P32-P35_P72-P75.agc:1173
//		STORE	RPASS2
// slot 31257
    31257, 3748,
// P32-P35_P72-P75.agc:1174
//		STORE	RPASS1
// slot 31258
    31258, 3712,
// P32-P35_P72-P75.agc:1175
//		UNIT	VXV
// slot 31259
    31259, 40284,
// P32-P35_P72-P75.agc:1176
//			VPASS1
// slot 31260
    31260, 3724,
// P32-P35_P72-P75.agc:1177
//		UNIT
// slot 31261
    31261, 65372,
// P32-P35_P72-P75.agc:1178
//		STOVL	UP1
// slot 31262
    31262, 22882,
// P32-P35_P72-P75.agc:1179
//			RACT3
// slot 31263
    31263, 3772,
// P32-P35_P72-P75.agc:1180
//		STCALL	RTIG
// slot 31264
    31264, 32580,
// P32-P35_P72-P75.agc:1181
//			ROTATE
// slot 31265
    31265, 58452,
// P32-P35_P72-P75.agc:1182
//		STORE	RACT2
// slot 31266
    31266, 2450,
// P32-P35_P72-P75.agc:1183
//		STOVL	RACT1
// slot 31267
    31267, 22918,
// P32-P35_P72-P75.agc:1184
//			VACT3
// slot 31268
    31268, 3784,
// P32-P35_P72-P75.agc:1185
//		STCALL	VTIG
// slot 31269
    31269, 32592,
// P32-P35_P72-P75.agc:1186
//			ROTATE
// slot 31270
    31270, 58452,
// P32-P35_P72-P75.agc:1187
//		STORE	VACT2
// slot 31271
    31271, 3736,
// P32-P35_P72-P75.agc:1188
//		STCALL	VACT1
// slot 31272
    31272, 32372,
// P32-P35_P72-P75.agc:1189
//			SUBEXIT
// slot 31273
    31273, 3696,
// P32-P35_P72-P75.agc:1190
//
// P32-P35_P72-P75.agc:1191
//# Page 643
// P32-P35_P72-P75.agc:1192
//# ***** ROTATE *****
// P32-P35_P72-P75.agc:1193
//
// P32-P35_P72-P75.agc:1194
//ROTATE		PUSH	PUSH
// slot 31274
    31274, 34316,
// P32-P35_P72-P75.agc:1195
//		DOT	VXSC
// slot 31275
    31275, 61762,
// P32-P35_P72-P75.agc:1196
//			UP1
// slot 31276
    31276, 2402,
// P32-P35_P72-P75.agc:1197
//			UP1
// slot 31277
    31277, 2402,
// P32-P35_P72-P75.agc:1198
//		VSL2	BVSU
// slot 31278
    31278, 42452,
// P32-P35_P72-P75.agc:1199
//		UNIT	PDVL
// slot 31279
    31279, 52572,
// P32-P35_P72-P75.agc:1200
//		ABVAL	VXSC
// slot 31280
    31280, 61772,
// P32-P35_P72-P75.agc:1201
//		VSL1	RVQ
// slot 31281
    31281, 36596,
// P32-P35_P72-P75.agc:1202
//
// P32-P35_P72-P75.agc:1203
//# Page 644
// P32-P35_P72-P75.agc:1204
//# ***** INTINTNA *****
// P32-P35_P72-P75.agc:1205
//
// P32-P35_P72-P75.agc:1206
//INTINT2C	PDDL	PDDL
// slot 31282
    31282, 54698,
// P32-P35_P72-P75.agc:1207
//			TCSI
// slot 31283
    31283, 3896,
// P32-P35_P72-P75.agc:1208
//			TCDH
// slot 31284
    31284, 2046,
// P32-P35_P72-P75.agc:1209
//		PDDL	PUSH
// slot 31285
    31285, 34474,
// P32-P35_P72-P75.agc:1210
//			TWOPI
// slot 31286
    31286, 28596,
// P32-P35_P72-P75.agc:1211
//		GOTO
// slot 31287
    31287, 65360,
// P32-P35_P72-P75.agc:1212
//			INTINT
// slot 31288
    31288, 61036,
// P32-P35_P72-P75.agc:1213
//INTINT3P	PDDL	PDDL
// slot 31289
    31289, 54698,
// P32-P35_P72-P75.agc:1214
//			TCDH
// slot 31290
    31290, 2046,
// P32-P35_P72-P75.agc:1215
//			TTPI
// slot 31291
    31291, 3900,
// P32-P35_P72-P75.agc:1216
//		PDDL	PUSH
// slot 31292
    31292, 34474,
// P32-P35_P72-P75.agc:1217
//			P30ZERO
// slot 31293
    31293, 27168,
// P32-P35_P72-P75.agc:1218
//		GOTO
// slot 31294
    31294, 65360,
// P32-P35_P72-P75.agc:1219
//			INTINT
// slot 31295
    31295, 61036,
// P32-P35_P72-P75.agc:1220
//
// P32-P35_P72-P75.agc:1221
//# Page 645
// P32-P35_P72-P75.agc:1222
//# ***** S32/33.1 *****
// P32-P35_P72-P75.agc:1223
//#
// P32-P35_P72-P75.agc:1224
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:1225
//#	S32/33.X
// P32-P35_P72-P75.agc:1226
//
// P32-P35_P72-P75.agc:1227
//S32/33.1	STQ	AXT,1
// slot 31296
    31296, 63520,
// P32-P35_P72-P75.agc:1228
//			SUBEXIT
// slot 31297
    31297, 3696,
// P32-P35_P72-P75.agc:1229
//		VN	0681
// slot 31298
    31298, 1698,
// P32-P35_P72-P75.agc:1230
//		CALL
// slot 31299
    31299, 65320,
// P32-P35_P72-P75.agc:1231
//			DISDVLVC
// slot 31300
    31300, 59888,
// P32-P35_P72-P75.agc:1232
//		CALL
// slot 31301
    31301, 65320,
// P32-P35_P72-P75.agc:1233
//			S32/33.X
// slot 31302
    31302, 58528,
// P32-P35_P72-P75.agc:1234
//		VLOAD	VXM
// slot 31303
    31303, 50682,
// P32-P35_P72-P75.agc:1235
//			DELVLVC
// slot 31304
    31304, 3640,
// P32-P35_P72-P75.agc:1236
//			0D
// slot 31305
    31305, 2,
// P32-P35_P72-P75.agc:1237
//		VSL1
// slot 31306
    31306, 65524,
// P32-P35_P72-P75.agc:1238
//		STORE	DELVSIN
// slot 31307
    31307, 3932,
// P32-P35_P72-P75.agc:1239
//		PUSH	ABVAL
// slot 31308
    31308, 42508,
// P32-P35_P72-P75.agc:1240
//		STOVL	DELVSAB
// slot 31309
    31309, 24424,
// P32-P35_P72-P75.agc:1241
//		GOTO
// slot 31310
    31310, 65360,
// P32-P35_P72-P75.agc:1242
//			SUBEXIT
// slot 31311
    31311, 3696,
// P32-P35_P72-P75.agc:1243
//
// P32-P35_P72-P75.agc:1244
//# Page 646
// P32-P35_P72-P75.agc:1245
//# ***** S32/33.X *****
// P32-P35_P72-P75.agc:1246
//
// P32-P35_P72-P75.agc:1247
//S32/33.X	SETPD	VLOAD
// slot 31312
    31312, 64770,
// P32-P35_P72-P75.agc:1248
//			6D
// slot 31313
    31313, 14,
// P32-P35_P72-P75.agc:1249
//			UP1
// slot 31314
    31314, 2402,
// P32-P35_P72-P75.agc:1250
//		VCOMP	PDVL
// slot 31315
    31315, 52604,
// P32-P35_P72-P75.agc:1251
//			RACT1
// slot 31316
    31316, 2438,
// P32-P35_P72-P75.agc:1252
//		UNIT	VCOMP
// slot 31317
    31317, 48732,
// P32-P35_P72-P75.agc:1253
//		PUSH	VXV
// slot 31318
    31318, 40204,
// P32-P35_P72-P75.agc:1254
//			UP1
// slot 31319
    31319, 2402,
// P32-P35_P72-P75.agc:1255
//		VSL1
// slot 31320
    31320, 65524,
// P32-P35_P72-P75.agc:1256
//		STORE	0D
// slot 31321
    31321, 2,
// P32-P35_P72-P75.agc:1257
//		RVQ
// slot 31322
    31322, 65308,
// P32-P35_P72-P75.agc:1258
//
// P32-P35_P72-P75.agc:1259
//# Page 647
// P32-P35_P72-P75.agc:1260
//# ***** CDHMVR *****
// P32-P35_P72-P75.agc:1261
//#
// P32-P35_P72-P75.agc:1262
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:1263
//#	VECSHIFT
// P32-P35_P72-P75.agc:1264
//#	TIMETHET
// P32-P35_P72-P75.agc:1265
//#	SHIFTR1
// P32-P35_P72-P75.agc:1266
//
// P32-P35_P72-P75.agc:1267
//CDHMVR		STQ	VLOAD
// slot 31323
    31323, 64800
)).

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:1268
//			SUBEXIT
// slot 31324
    31324, 3696,
// P32-P35_P72-P75.agc:1269
//			RACT2
// slot 31325
    31325, 2450,
// P32-P35_P72-P75.agc:1270
//		PUSH	UNIT
// slot 31326
    31326, 44556,
// P32-P35_P72-P75.agc:1271
//		STOVL	UNVEC		# UR SUB A
// slot 31327
    31327, 24264,
// P32-P35_P72-P75.agc:1272
//			RPASS2
// slot 31328
    31328, 3748,
// P32-P35_P72-P75.agc:1273
//		UNIT	DOT
// slot 31329
    31329, 41308,
// P32-P35_P72-P75.agc:1274
//			UNVEC
// slot 31330
    31330, 3784,
// P32-P35_P72-P75.agc:1275
//		PUSH	SL1
// slot 31331
    31331, 59916,
// P32-P35_P72-P75.agc:1276
//		STODL	CSTH
// slot 31332
    31332, 15284,
// P32-P35_P72-P75.agc:1277
//		DSQ	PDDL
// slot 31333
    31333, 54684,
// P32-P35_P72-P75.agc:1278
//			DP1/4TH
// slot 31334
    31334, 6804,
// P32-P35_P72-P75.agc:1279
//		SR2	DSU
// slot 31335
    31335, 38276,
// P32-P35_P72-P75.agc:1280
//		SQRT	SL1
// slot 31336
    31336, 60140,
// P32-P35_P72-P75.agc:1281
//		PDVL	VCOMP
// slot 31337
    31337, 48794,
// P32-P35_P72-P75.agc:1282
//		VXV
// slot 31338
    31338, 65338,
// P32-P35_P72-P75.agc:1283
//			RPASS2
// slot 31339
    31339, 3748,
// P32-P35_P72-P75.agc:1284
//		DOT	PDDL
// slot 31340
    31340, 54594,
// P32-P35_P72-P75.agc:1285
//			UP1
// slot 31341
    31341, 2402,
// P32-P35_P72-P75.agc:1286
//		SIGN	STADR
// slot 31342
    31342, 38634,
// P32-P35_P72-P75.agc:1287
//		STOVL	SNTH
// slot 31343
    31343, 42062,
// P32-P35_P72-P75.agc:1288
//			RPASS2
// slot 31344
    31344, 3748,
// P32-P35_P72-P75.agc:1289
//		PDVL	CALL
// slot 31345
    31345, 38042,
// P32-P35_P72-P75.agc:1290
//			VPASS2
// slot 31346
    31346, 3760,
// P32-P35_P72-P75.agc:1291
//			VECSHIFT
// slot 31347
    31347, 39452,
// P32-P35_P72-P75.agc:1292
//		STOVL	VVEC
// slot 31348
    31348, 23496,
// P32-P35_P72-P75.agc:1293
//		CLEAR
// slot 31349
    31349, 65304,
// P32-P35_P72-P75.agc:1294
//			RVSW
// slot 31350
    31350, 3948,
// P32-P35_P72-P75.agc:1295
//		STCALL	RVEC
// slot 31351
    31351, 31578,
// P32-P35_P72-P75.agc:1296
//			TIMETHET
// slot 31352
    31352, 21428,
// P32-P35_P72-P75.agc:1297
//		LXA,2	VSL*
// slot 31353
    31353, 45016,
// P32-P35_P72-P75.agc:1298
//			RTX2
// slot 31354
    31354, 3070,
// P32-P35_P72-P75.agc:1299
//			0,2
// slot 31355
    31355, 48892,
// P32-P35_P72-P75.agc:1300
//		STORE	18D
// slot 31356
    31356, 38,
// P32-P35_P72-P75.agc:1301
//		DOT	SL1R
// slot 31357
    31357, 64066,
// P32-P35_P72-P75.agc:1302
//			UNVEC
// slot 31358
    31358, 3784,
// P32-P35_P72-P75.agc:1303
//		PDVL	ABVAL		# 0D = V SUB PV
// slot 31359
    31359, 42650,
// P32-P35_P72-P75.agc:1304
//		SL*	PDVL
// slot 31360
    31360, 52574,
// P32-P35_P72-P75.agc:1305
//			0,2
// slot 31361
    31361, 48892,
// P32-P35_P72-P75.agc:1306
//			RACT2
// slot 31362
    31362, 2450,
// P32-P35_P72-P75.agc:1307
//		ABVAL	PDDL		# 2D = LENGTH OF R SUB A
// slot 31363
    31363, 54604,
// P32-P35_P72-P75.agc:1308
//		DSU
// slot 31364
    31364, 65322,
// P32-P35_P72-P75.agc:1309
//# Page 648
// P32-P35_P72-P75.agc:1310
//			02D
// slot 31365
    31365, 6,
// P32-P35_P72-P75.agc:1311
//		STODL	DIFFALT		# DELTA H IN METERS		B+29
// slot 31366
    31366, 16128,
// P32-P35_P72-P75.agc:1312
//			R1A
// slot 31367
    31367, 3012,
// P32-P35_P72-P75.agc:1313
//		NORM	PDDL		# 2 - R V**/MU				04D
// slot 31368
    31368, 54658,
// P32-P35_P72-P75.agc:1314
//			X1
// slot 31369
    31369, 78,
// P32-P35_P72-P75.agc:1315
//			R1
// slot 31370
    31370, 66,
// P32-P35_P72-P75.agc:1316
//		CALL
// slot 31371
    31371, 65320,
// P32-P35_P72-P75.agc:1317
//			SHIFTR1
// slot 31372
    31372, 39468,
// P32-P35_P72-P75.agc:1318
//		SR1R	DDV
// slot 31373
    31373, 47588,
// P32-P35_P72-P75.agc:1319
//		SL*	PUSH
// slot 31374
    31374, 34398,
// P32-P35_P72-P75.agc:1320
//			0 	-5,1
// slot 31375
    31375, 16632,
// P32-P35_P72-P75.agc:1321
//		DSU	PDDL		# A SUB A			B+29 	04D
// slot 31376
    31376, 54570,
// P32-P35_P72-P75.agc:1322
//			DIFFALT
// slot 31377
    31377, 3840,
// P32-P35_P72-P75.agc:1323
//		SR2	DDV		# A SUB P			B+31
// slot 31378
    31378, 47492,
// P32-P35_P72-P75.agc:1324
//			04D		#				B+2
// slot 31379
    31379, 10,
// P32-P35_P72-P75.agc:1325
//		PUSH	SQRT		# A SUB P/A SUB A			06D
// slot 31380
    31380, 62988,
// P32-P35_P72-P75.agc:1326
//		DMPR	DMP
// slot 31381
    31381, 34170,
// P32-P35_P72-P75.agc:1327
//			06D
// slot 31382
    31382, 14,
// P32-P35_P72-P75.agc:1328
//			00D
// slot 31383
    31383, 2,
// P32-P35_P72-P75.agc:1329
//		SL3R	PDDL		# V SUB AV METERS/CS		B+7 	08D
// slot 31384
    31384, 54644,
// P32-P35_P72-P75.agc:1330
//			02D		# R SUB A MAGNITUDE		B+29
// slot 31385
    31385, 6,
// P32-P35_P72-P75.agc:1331
//		NORM	PDDL
// slot 31386
    31386, 54658,
// P32-P35_P72-P75.agc:1332
//			X1
// slot 31387
    31387, 78,
// P32-P35_P72-P75.agc:1333
//			RTMU
// slot 31388
    31388, 2466,
// P32-P35_P72-P75.agc:1334
//		SR1	DDV		# 2MU 				B+38
// slot 31389
    31389, 47556,
// P32-P35_P72-P75.agc:1335
//		SL*	PDDL		# 2 MU/R SUBAA			B+14 	10D
// slot 31390
    31390, 54622,
// P32-P35_P72-P75.agc:1336
//			0 	-5,1
// slot 31391
    31391, 16632,
// P32-P35_P72-P75.agc:1337
//			04D		# ASUBA				B+29
// slot 31392
    31392, 10,
// P32-P35_P72-P75.agc:1338
//		NORM	PDDL
// slot 31393
    31393, 54658,
// P32-P35_P72-P75.agc:1339
//			X2
// slot 31394
    31394, 80,
// P32-P35_P72-P75.agc:1340
//			RTMU
// slot 31395
    31395, 2466,
// P32-P35_P72-P75.agc:1341
//		SR1	DDV
// slot 31396
    31396, 47556,
// P32-P35_P72-P75.agc:1342
//		SL*	BDSU
// slot 31397
    31397, 37214,
// P32-P35_P72-P75.agc:1343
//			0 	-6,2	# 2U/R - U/A		B+14 (METERS/CS)SQ
// slot 31398
    31398, 48904,
// P32-P35_P72-P75.agc:1344
//		PDDL	DSQ		#					10D
// slot 31399
    31399, 52906,
// P32-P35_P72-P75.agc:1345
//			08D
// slot 31400
    31400, 18,
// P32-P35_P72-P75.agc:1346
//		BDSU	SQRT
// slot 31401
    31401, 63010,
// P32-P35_P72-P75.agc:1347
//		PDVL	VXV		# SQRT(MU(2/R SUB A-1/A SUB A)-VSUBA2)	10D
// slot 31402
    31402, 40346,
// P32-P35_P72-P75.agc:1348
//			UP1
// slot 31403
    31403, 2402,
// P32-P35_P72-P75.agc:1349
//			UNVEC
// slot 31404
    31404, 3784,
// P32-P35_P72-P75.agc:1350
//		UNIT	VXSC
// slot 31405
    31405, 61788,
// P32-P35_P72-P75.agc:1351
//			10D
// slot 31406
    31406, 22,
// P32-P35_P72-P75.agc:1352
//		PDVL	VXSC
// slot 31407
    31407, 61850,
// P32-P35_P72-P75.agc:1353
//			UNVEC
// slot 31408
    31408, 3784,
// P32-P35_P72-P75.agc:1354
//			08D
// slot 31409
    31409, 18,
// P32-P35_P72-P75.agc:1355
//		VAD	VSL1
// slot 31410
    31410, 64090,
// P32-P35_P72-P75.agc:1356
//		STADR
// slot 31411
    31411, 65324,
// P32-P35_P72-P75.agc:1357
//		STORE	VACT3
// slot 31412
    31412, 61750,
// P32-P35_P72-P75.agc:1358
//		VSU
// slot 31413
    31413, 65362,
// P32-P35_P72-P75.agc:1359
//			VACT2
// slot 31414
    31414, 3736,
// P32-P35_P72-P75.agc:1360
//# Page 649
// P32-P35_P72-P75.agc:1361
//		STCALL	DELVEET2	# DELTA VCDH -- REFERENCE COORDINATES
// slot 31415
    31415, 31098,
// P32-P35_P72-P75.agc:1362
//			SUBEXIT
// slot 31416
    31416, 3696
)).

// bank 35, slots 32026-32032
function agcAotUnit2032 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32028 {
        if slot <= 32026 {
// P32-P35_P72-P75.agc:1363
//
// P32-P35_P72-P75.agc:1364
//# Page 650
// P32-P35_P72-P75.agc:1365
//# ***** COMPTGO *****
// P32-P35_P72-P75.agc:1366
//#
// P32-P35_P72-P75.agc:1367
//# SUBROUTINES USED
// P32-P35_P72-P75.agc:1368
//#	CLOKTASK
// P32-P35_P72-P75.agc:1369
//#	2PHSCHNG
// P32-P35_P72-P75.agc:1370
//
// P32-P35_P72-P75.agc:1371
//		BANK	35
// P32-P35_P72-P75.agc:1372
//		SETLOC	CSI/CDH
// P32-P35_P72-P75.agc:1373
//		BANK
// P32-P35_P72-P75.agc:1374
//
// P32-P35_P72-P75.agc:1375
//		EBANK=	RTRN
// P32-P35_P72-P75.agc:1376
//
// P32-P35_P72-P75.agc:1377
//		COUNT*	$$/P3575
// P32-P35_P72-P75.agc:1378
//
// P32-P35_P72-P75.agc:1379
//COMPTGO		EXTEND
// slot 32026
            if slot <> 32026 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32027 {
// P32-P35_P72-P75.agc:1380
//		QXCH	RTRN
// slot 32027
                if slot <> 32027 or instruction <> 10037 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 821, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:1381
//		CAF	ZERO
// slot 32028
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
// P32-P35_P72-P75.agc:1382
//		TS	DISPDEX
// slot 32029
                if slot <> 32029 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:1383
//		CAF	BIT2
// slot 32030
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
// P32-P35_P72-P75.agc:1384
//		INHINT
// slot 32031
                if slot <> 32031 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P32-P35_P72-P75.agc:1385
//		TC	WAITLIST
// slot 32032
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
// P32-P35_P72-P75.agc:1386
//		EBANK=	WHICH
// P32-P35_P72-P75.agc:1387
//		2CADR	CLOKTASK
// slot 32033 32034
    32033, 2974, 32034, 61550
)).

// bank 35, slots 32035-32035
function agcAotUnit2033 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:1388
//
// P32-P35_P72-P75.agc:1389
//		TC	2PHSCHNG
// slot 32035
    if slot <> 32035 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2033] to agcAotUnit2033@.

agcAotInstallSourceRope(list(
// P32-P35_P72-P75.agc:1390
//		OCT	40036
// slot 32036
    32036, 32828,
// P32-P35_P72-P75.agc:1391
//		OCT	05024
// slot 32037
    32037, 5160,
// P32-P35_P72-P75.agc:1392
//		OCT	13000
// slot 32038
    32038, 11264
)).

// bank 35, slots 32039-32039
function agcAotUnit2034 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P32-P35_P72-P75.agc:1393
//		TC	RTRN
// slot 32039
    if slot <> 32039 or instruction <> 821 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 821, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2034] to agcAotUnit2034@.

// no code for the lines below
// P32-P35_P72-P75.agc:1394
//
