// PORT: Original source unit P34-35_P74-75.agc.
// PORT: Physical bank 35. Shared continuation entries, slots 32101–32113.
function agcAotUnit2037 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32106 {
        if slot <= 32103 {
            if slot <= 32101 {
// PORT: SOURCE P34-35_P74-75.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P34-35_P74-75.agc:2
//# Filename:	P34-35_P74-75.agc
// PORT: SOURCE P34-35_P74-75.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P34-35_P74-75.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P34-35_P74-75.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P34-35_P74-75.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P34-35_P74-75.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE P34-35_P74-75.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P34-35_P74-75.agc:9
//# Pages:	658-702
// PORT: SOURCE P34-35_P74-75.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// PORT: SOURCE P34-35_P74-75.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE P34-35_P74-75.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE P34-35_P74-75.agc:13
//#		2009-06-05 RSB	Corrected a typo.
// PORT: SOURCE P34-35_P74-75.agc:14
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// PORT: SOURCE P34-35_P74-75.agc:15
//#		2011-01-06 JL	Added missing comment characters.
// PORT: SOURCE P34-35_P74-75.agc:16
//#		2011-05-07 JL	Removed workaround.
// PORT: SOURCE P34-35_P74-75.agc:17
//
// PORT: SOURCE P34-35_P74-75.agc:18
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P34-35_P74-75.agc:19
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P34-35_P74-75.agc:20
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P34-35_P74-75.agc:21
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P34-35_P74-75.agc:22
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P34-35_P74-75.agc:23
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P34-35_P74-75.agc:24
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P34-35_P74-75.agc:25
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P34-35_P74-75.agc:26
//# actually created.
// PORT: SOURCE P34-35_P74-75.agc:27
//#
// PORT: SOURCE P34-35_P74-75.agc:28
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P34-35_P74-75.agc:29
//#
// PORT: SOURCE P34-35_P74-75.agc:30
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P34-35_P74-75.agc:31
//#	16:27 JULY 14, 1969
// PORT: SOURCE P34-35_P74-75.agc:32
//
// PORT: SOURCE P34-35_P74-75.agc:33
//# Page 658
// PORT: SOURCE P34-35_P74-75.agc:34
//# TRANSFER PHASE INITITIATION (TPI) PROGRAMS (P34 AND P74)
// PORT: SOURCE P34-35_P74-75.agc:35
//
// PORT: SOURCE P34-35_P74-75.agc:36
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// PORT: SOURCE P34-35_P74-75.agc:37
//# MOD BY WHITE, P.		DATE: 1 JUNE 67
// PORT: SOURCE P34-35_P74-75.agc:38
//#
// PORT: SOURCE P34-35_P74-75.agc:39
//# PURPOSE
// PORT: SOURCE P34-35_P74-75.agc:40
//#
// PORT: SOURCE P34-35_P74-75.agc:41
//#	(1)	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// PORT: SOURCE P34-35_P74-75.agc:42
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE TRANSFER
// PORT: SOURCE P34-35_P74-75.agc:43
//#		PHASE INITITATION (TPI) MANEUVER, GIVEN --
// PORT: SOURCE P34-35_P74-75.agc:44
//
// PORT: SOURCE P34-35_P74-75.agc:45
//#		(A)	TIME OF IGNITION TIG (TPI) OR THE ELEVATION ANGLE (E) OF
// PORT: SOURCE P34-35_P74-75.agc:46
//#			THE ACTIVE/PASSIVE VEHICLE LOS AT TIG (TPI).
// PORT: SOURCE P34-35_P74-75.agc:47
//
// PORT: SOURCE P34-35_P74-75.agc:48
//#		(B)	CENTRAL ANGLE OF TRANSFER (CENTANG) FROM TIG (TPI) TO
// PORT: SOURCE P34-35_P74-75.agc:49
//#			INTERCEPT TIME (TIG (TPF)).
// PORT: SOURCE P34-35_P74-75.agc:50
//
// PORT: SOURCE P34-35_P74-75.agc:51
//#	(2)	TO CALCULATE TIG (TPI) GIVEN E OR E GIVEN TIG (TPI).
// PORT: SOURCE P34-35_P74-75.agc:52
//
// PORT: SOURCE P34-35_P74-75.agc:53
//#	(3)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// PORT: SOURCE P34-35_P74-75.agc:54
//#		APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// PORT: SOURCE P34-35_P74-75.agc:55
//
// PORT: SOURCE P34-35_P74-75.agc:56
//#	(4)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// PORT: SOURCE P34-35_P74-75.agc:57
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// PORT: SOURCE P34-35_P74-75.agc:58
//#		ASTRONAUT/GROUND.
// PORT: SOURCE P34-35_P74-75.agc:59
//
// PORT: SOURCE P34-35_P74-75.agc:60
//#	(5)	TO STORE THE TPI TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P34-35_P74-75.agc:61
//#		THRUSTING PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:62
//#
// PORT: SOURCE P34-35_P74-75.agc:63
//# ASSUMPTIONS
// PORT: SOURCE P34-35_P74-75.agc:64
//
// PORT: SOURCE P34-35_P74-75.agc:65
//#	(1)	LM ONLY -- THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF
// PORT: SOURCE P34-35_P74-75.agc:66
//#		THE CONSTANT DELTA ALTITUDE (CDH) PROGRAM (P33/P73).
// PORT: SOURCE P34-35_P74-75.agc:67
//#		THEREFORE --
// PORT: SOURCE P34-35_P74-75.agc:68
//
// PORT: SOURCE P34-35_P74-75.agc:69
//#		(A)	AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// PORT: SOURCE P34-35_P74-75.agc:70
//#			BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// PORT: SOURCE P34-35_P74-75.agc:71
//#			A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// PORT: SOURCE P34-35_P74-75.agc:72
//#			HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// PORT: SOURCE P34-35_P74-75.agc:73
//
// PORT: SOURCE P34-35_P74-75.agc:74
//#		(B)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// PORT: SOURCE P34-35_P74-75.agc:75
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// PORT: SOURCE P34-35_P74-75.agc:76
//
// PORT: SOURCE P34-35_P74-75.agc:77
//#		(C)	THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// PORT: SOURCE P34-35_P74-75.agc:78
//#			ORBITS WAS MINIMIZED.
// PORT: SOURCE P34-35_P74-75.agc:79
//
// PORT: SOURCE P34-35_P74-75.agc:80
//#		(D)	THE PERICENTER ALTITUDES OF ORBITS FOLLOWING CSI AND
// PORT: SOURCE P34-35_P74-75.agc:81
//#			CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// PORT: SOURCE P34-35_P74-75.agc:82
//# Page 659
// PORT: SOURCE P34-35_P74-75.agc:83
//#			ORBIT OR 85 NM FOR EARTH ORBIT.
// PORT: SOURCE P34-35_P74-75.agc:84
//
// PORT: SOURCE P34-35_P74-75.agc:85
//#		(E)	THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// PORT: SOURCE P34-35_P74-75.agc:86
//#			THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// PORT: SOURCE P34-35_P74-75.agc:87
//#			MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// PORT: SOURCE P34-35_P74-75.agc:88
//#			IN AN OUT-OF-PLANE MANEUVER.
// PORT: SOURCE P34-35_P74-75.agc:89
//
// PORT: SOURCE P34-35_P74-75.agc:90
//#	(2)	STATE VECTOR UPDATED BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P34-35_P74-75.agc:91
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (4)).
// PORT: SOURCE P34-35_P74-75.agc:92
//
// PORT: SOURCE P34-35_P74-75.agc:93
//#	(3)	THIS PROGRAM MUST BE DONE OVER A TRACKING STATION FOR REAL
// PORT: SOURCE P34-35_P74-75.agc:94
//#		TIME GROUND PARTICIPATION IN DATA INPUT AND OUTPUT.  COMPUTED
// PORT: SOURCE P34-35_P74-75.agc:95
//#		VARIABLES MAY BE STORED FOR LATER VERIFICATION BY THE GROUND.
// PORT: SOURCE P34-35_P74-75.agc:96
//#		THESE STORAGE CAPABILITIES ARE LIMITED ONLY TO THE PARAMETERS
// PORT: SOURCE P34-35_P74-75.agc:97
//#		FOR ONE THRUSTING MANEUVER AT A TIME EXCEPT FOR CONCENTRIC
// PORT: SOURCE P34-35_P74-75.agc:98
//#		FLIGHT PLAN MANEUVER SEQUENCES.
// PORT: SOURCE P34-35_P74-75.agc:99
//
// PORT: SOURCE P34-35_P74-75.agc:100
//#	(4)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// PORT: SOURCE P34-35_P74-75.agc:101
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// PORT: SOURCE P34-35_P74-75.agc:102
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// PORT: SOURCE P34-35_P74-75.agc:103
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// PORT: SOURCE P34-35_P74-75.agc:104
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// PORT: SOURCE P34-35_P74-75.agc:105
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// PORT: SOURCE P34-35_P74-75.agc:106
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// PORT: SOURCE P34-35_P74-75.agc:107
//#		THRUSTING MANEUVER.
// PORT: SOURCE P34-35_P74-75.agc:108
//
// PORT: SOURCE P34-35_P74-75.agc:109
//#	(5)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:110
//
// PORT: SOURCE P34-35_P74-75.agc:111
//#	(6)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// PORT: SOURCE P34-35_P74-75.agc:112
//#
// PORT: SOURCE P34-35_P74-75.agc:113
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P34-35_P74-75.agc:114
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P34-35_P74-75.agc:115
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P34-35_P74-75.agc:116
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:117
//#
// PORT: SOURCE P34-35_P74-75.agc:118
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P34-35_P74-75.agc:119
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// PORT: SOURCE P34-35_P74-75.agc:120
//#
// PORT: SOURCE P34-35_P74-75.agc:121
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// PORT: SOURCE P34-35_P74-75.agc:122
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// PORT: SOURCE P34-35_P74-75.agc:123
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:124
//#
// PORT: SOURCE P34-35_P74-75.agc:125
//#	(7)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:126
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// PORT: SOURCE P34-35_P74-75.agc:127
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STURED.
// PORT: SOURCE P34-35_P74-75.agc:128
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// PORT: SOURCE P34-35_P74-75.agc:129
//#		THROUGH THE USE OF V06N52.
// PORT: SOURCE P34-35_P74-75.agc:130
//#
// PORT: SOURCE P34-35_P74-75.agc:131
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// PORT: SOURCE P34-35_P74-75.agc:132
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// PORT: SOURCE P34-35_P74-75.agc:133
//# Page 660
// PORT: SOURCE P34-35_P74-75.agc:134
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// PORT: SOURCE P34-35_P74-75.agc:135
//#		ASTRONAUT SHOULD REASSES THE INPUT TARGETING PARAMETERS BASED
// PORT: SOURCE P34-35_P74-75.agc:136
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// PORT: SOURCE P34-35_P74-75.agc:137
//#
// PORT: SOURCE P34-35_P74-75.agc:138
//#	(8)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// PORT: SOURCE P34-35_P74-75.agc:139
//#
// PORT: SOURCE P34-35_P74-75.agc:140
//#			P34 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P34-35_P74-75.agc:141
//#
// PORT: SOURCE P34-35_P74-75.agc:142
//#			P74 IF THIS VEHICLE IS PASSIVE VEHICLE.
// PORT: SOURCE P34-35_P74-75.agc:143
//#
// PORT: SOURCE P34-35_P74-75.agc:144
//# INPUT
// PORT: SOURCE P34-35_P74-75.agc:145
//#
// PORT: SOURCE P34-35_P74-75.agc:146
//#	(1)	TTPI	TIME OF THE TPI MANEUVER.
// PORT: SOURCE P34-35_P74-75.agc:147
//#	(2)	ELEV	DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P34-35_P74-75.agc:148
//#	(3)	CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// PORT: SOURCE P34-35_P74-75.agc:149
//#			TRANSFER FROM TPI TO TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:150
//#
// PORT: SOURCE P34-35_P74-75.agc:151
//# OUTPUT
// PORT: SOURCE P34-35_P74-75.agc:152
//#
// PORT: SOURCE P34-35_P74-75.agc:153
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P34-35_P74-75.agc:154
//#	(2)	TTOGO		TIME TO GO
// PORT: SOURCE P34-35_P74-75.agc:155
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// PORT: SOURCE P34-35_P74-75.agc:156
//#	(4)	TTPI		COMPUTED TIME OF TPI MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:157
//#		 OR
// PORT: SOURCE P34-35_P74-75.agc:158
//#		ELEV		COMPUTED LOS ANGLE AT TPI
// PORT: SOURCE P34-35_P74-75.agc:159
//#	(5)	POSTTPI		PERIGEE ALTITUDE AFTER THE TPI MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:160
//#	(6)	DELVTPI		MAGNITUDE OF DELTA V AT TPI
// PORT: SOURCE P34-35_P74-75.agc:161
//#	(7)	DELVTPF		MAGNITUDE OF DELTA V AT INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:162
//#	(8)	DVLOS		DELTA VELOCITY AT TPI -- LINE OF SIGHT
// PORT: SOURCE P34-35_P74-75.agc:163
//#	(9)	DELVLVC		DELTA VELOCITY AT TPI -- LOCAL VERTICAL COORDINATES
// PORT: SOURCE P34-35_P74-75.agc:164
//#
// PORT: SOURCE P34-35_P74-75.agc:165
//# DOWNLINK
// PORT: SOURCE P34-35_P74-75.agc:166
//#
// PORT: SOURCE P34-35_P74-75.agc:167
//#	(1)	TTPI		TIME OF TPI MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:168
//#	(2)	TIG		TIME OF TPI MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:169
//#	(3)	ELEV		DESIRED LOS ANGLE AT TPI
// PORT: SOURCE P34-35_P74-75.agc:170
//#	(4)	CENTANG		ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// PORT: SOURCE P34-35_P74-75.agc:171
//#				TRANSFER FROM TPI TO TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:172
//#	(5)	DELVEET3	DELTA VELOCITY AT TPI -- REFERENCE COORDINATES
// PORT: SOURCE P34-35_P74-75.agc:173
//#	(6)	TPASS4		TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:174
//#
// PORT: SOURCE P34-35_P74-75.agc:175
//# COMMUNICATION TO THRUSTING PROGRAMS
// PORT: SOURCE P34-35_P74-75.agc:176
//#
// PORT: SOURCE P34-35_P74-75.agc:177
//#	(1)	TIG		TIME OF THE TPI MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:178
//#	(2)	RTARG		OFFSET TARGET POSITION
// PORT: SOURCE P34-35_P74-75.agc:179
//#	(3)	TPASS4		TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:180
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION
// PORT: SOURCE P34-35_P74-75.agc:181
//#
// PORT: SOURCE P34-35_P74-75.agc:182
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:183
//#
// PORT: SOURCE P34-35_P74-75.agc:184
//#	AVFLAGA
// PORT: SOURCE P34-35_P74-75.agc:185
//# Page 661
// PORT: SOURCE P34-35_P74-75.agc:186
//#	AVFLAGP
// PORT: SOURCE P34-35_P74-75.agc:187
//#	VNPOOH
// PORT: SOURCE P34-35_P74-75.agc:188
//#	DISPLAYE
// PORT: SOURCE P34-35_P74-75.agc:189
//#	SELECTMU
// PORT: SOURCE P34-35_P74-75.agc:190
//#	PRECSET
// PORT: SOURCE P34-35_P74-75.agc:191
//#	S33/34.1
// PORT: SOURCE P34-35_P74-75.agc:192
//#	ALARM
// PORT: SOURCE P34-35_P74-75.agc:193
//#	BANKCALL
// PORT: SOURCE P34-35_P74-75.agc:194
//#	GOFLASH
// PORT: SOURCE P34-35_P74-75.agc:195
//#	GOTOPOOH
// PORT: SOURCE P34-35_P74-75.agc:196
//#	TIMETHET
// PORT: SOURCE P34-35_P74-75.agc:197
//#	S34/35.2
// PORT: SOURCE P34-35_P74-75.agc:198
//#	PERIAPO1
// PORT: SOURCE P34-35_P74-75.agc:199
//#	SHIFTR1
// PORT: SOURCE P34-35_P74-75.agc:200
//#	S34/35.5
// PORT: SOURCE P34-35_P74-75.agc:201
//#	VN1645
// PORT: SOURCE P34-35_P74-75.agc:202
//
// PORT: SOURCE P34-35_P74-75.agc:203
//		SETLOC	CSI/CDH
// PORT: SOURCE P34-35_P74-75.agc:204
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:205
//		EBANK=	SUBEXIT
// PORT: SOURCE P34-35_P74-75.agc:206
//		COUNT*	$$/P3474
// PORT: SOURCE P34-35_P74-75.agc:207
//P34		TC	AVFLAGA
// PORT: Fixed ROM slots 32101.
                if slot <> 32101 or instruction <> 1255 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1255, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32102 {
// PORT: SOURCE P34-35_P74-75.agc:208
//		TC	P34/P74A
// PORT: Fixed ROM slots 32102.
                    if slot <> 32102 or instruction <> 1384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:209
//P74		TC	AVFLAGP
// PORT: Fixed ROM slots 32103.
                    if slot <> 32103 or instruction <> 1260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1260, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32104 {
// PORT: SOURCE P34-35_P74-75.agc:210
//P34/P74A	TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 32104.
                if slot <> 32104 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32105 {
// PORT: SOURCE P34-35_P74-75.agc:211
//		CAF	V06N37		# TTPI
// PORT: Fixed ROM slots 32105.
                    if slot <> 32105 or instruction <> 14291 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2003), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:212
//		TC	VNPOOH
// PORT: Fixed ROM slots 32106.
                    if slot <> 32106 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32109 {
            if slot <= 32107 {
// PORT: SOURCE P34-35_P74-75.agc:213
//		EXTEND
// PORT: Fixed ROM slots 32107.
                if slot <> 32107 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32108 {
// PORT: SOURCE P34-35_P74-75.agc:214
//		DCA	130DEG
// PORT: Fixed ROM slots 32108.
                    if slot <> 32108 or instruction <> 14310 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2022, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:215
//		DXCH	CENTANG
// PORT: Fixed ROM slots 32109.
                    if slot <> 32109 or instruction <> 22417 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 913, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32111 {
                if slot <= 32110 {
// PORT: SOURCE P34-35_P74-75.agc:216
//		CAF	P30ZERO
// PORT: Fixed ROM slots 32110.
                    if slot <> 32110 or instruction <> 13583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1295), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:217
//		TS	NN
// PORT: Fixed ROM slots 32111.
                    if slot <> 32111 or instruction <> 23350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23350, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32112 {
// PORT: SOURCE P34-35_P74-75.agc:218
//		TC	DISPLAYE	# ELEV AND CENTANG
// PORT: Fixed ROM slots 32112.
                    if slot <> 32112 or instruction <> 1980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:219
//		TC	INTPRET
// PORT: Fixed ROM slots 32113.
                    if slot <> 32113 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2037] to agcAotUnit2037@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:220
//		CLEAR	DLOAD
// PORT: Fixed ROM slots 32114.
    32114, 58648,
// PORT: SOURCE P34-35_P74-75.agc:221
//			ETPIFLAG
// PORT: Fixed ROM slots 32115.
    32115, 1392,
// PORT: SOURCE P34-35_P74-75.agc:222
//			TTPI
// PORT: Fixed ROM slots 32116.
    32116, 3900,
// PORT: SOURCE P34-35_P74-75.agc:223
//		STODL	TIG
// PORT: Fixed ROM slots 32117.
    32117, 15940,
// PORT: SOURCE P34-35_P74-75.agc:224
//			ELEV
// PORT: Fixed ROM slots 32118.
    32118, 2398,
// PORT: SOURCE P34-35_P74-75.agc:225
//		BZE	SET
// PORT: Fixed ROM slots 32119.
    32119, 35928,
// PORT: SOURCE P34-35_P74-75.agc:226
//			P34/P74B
// PORT: Fixed ROM slots 32120.
    32120, 60148,
// PORT: SOURCE P34-35_P74-75.agc:227
//			ETPIFLAG
// PORT: Fixed ROM slots 32121.
    32121, 1136,
// PORT: SOURCE P34-35_P74-75.agc:228
//P34/P74B	CALL
// PORT: Fixed ROM slots 32122.
    32122, 65320,
// PORT: SOURCE P34-35_P74-75.agc:229
//			SELECTMU
// PORT: Fixed ROM slots 32123.
    32123, 16384,
// PORT: SOURCE P34-35_P74-75.agc:230
//DELELO		EQUALS	26D
// PORT: SOURCE P34-35_P74-75.agc:231
//P34/P74C	DLOAD	SET
// PORT: Fixed ROM slots 32124.
    32124, 36042,
// PORT: SOURCE P34-35_P74-75.agc:232
//			ZEROVECS
// PORT: Fixed ROM slots 32125.
    32125, 6820,
// PORT: SOURCE P34-35_P74-75.agc:233
//			ITSWICH
// PORT: Fixed ROM slots 32126.
    32126, 3680,
// PORT: SOURCE P34-35_P74-75.agc:234
//		BON	CLEAR
// PORT: Fixed ROM slots 32127.
    32127, 35864,
// PORT: SOURCE P34-35_P74-75.agc:235
//			ETPIFLAG
// PORT: Fixed ROM slots 32128.
    32128, 1424,
// PORT: SOURCE P34-35_P74-75.agc:236
//# Page 662
// PORT: SOURCE P34-35_P74-75.agc:237
//			SWCHSET
// PORT: Fixed ROM slots 32129.
    32129, 60166,
// PORT: SOURCE P34-35_P74-75.agc:238
//			ITSWICH
// PORT: Fixed ROM slots 32130.
    32130, 3936,
// PORT: SOURCE P34-35_P74-75.agc:239
//SWCHSET		STORE	NOMTPI
// PORT: Fixed ROM slots 32131.
    32131, 2462,
// PORT: SOURCE P34-35_P74-75.agc:240
//INTLOOP		DLOAD	DAD
// PORT: Fixed ROM slots 32132.
    32132, 36298,
// PORT: SOURCE P34-35_P74-75.agc:241
//			TTPI
// PORT: Fixed ROM slots 32133.
    32133, 3900,
// PORT: SOURCE P34-35_P74-75.agc:242
//			NOMTPI
// PORT: Fixed ROM slots 32134.
    32134, 2462,
// PORT: SOURCE P34-35_P74-75.agc:243
//		STCALL	TDEC1
// PORT: Fixed ROM slots 32135.
    32135, 28738,
// PORT: SOURCE P34-35_P74-75.agc:244
//			PRECSET
// PORT: Fixed ROM slots 32136.
    32136, 39392,
// PORT: SOURCE P34-35_P74-75.agc:245
//		CALL
// PORT: Fixed ROM slots 32137.
    32137, 65320,
// PORT: SOURCE P34-35_P74-75.agc:246
//			S33/34.1
// PORT: Fixed ROM slots 32138.
    32138, 60392,
// PORT: SOURCE P34-35_P74-75.agc:247
//		BZE	EXIT
// PORT: Fixed ROM slots 32139.
    32139, 65112,
// PORT: SOURCE P34-35_P74-75.agc:248
//			SWCHCLR
// PORT: Fixed ROM slots 32140.
    32140, 60202
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32141–32141.
function agcAotUnit2038 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P34-35_P74-75.agc:249
//		TC	ALARM
// PORT: Fixed ROM slots 32141.
    if slot <> 32141 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2038] to agcAotUnit2038@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:250
//		OCT	611
// PORT: Fixed ROM slots 32142.
    32142, 786
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32143–32144.
function agcAotUnit2039 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32143 {
// PORT: SOURCE P34-35_P74-75.agc:251
//		CAF	V05N09
// PORT: Fixed ROM slots 32143.
        if slot <> 32143 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P34-35_P74-75.agc:252
//		TC	BANKCALL
// PORT: Fixed ROM slots 32144.
        if slot <> 32144 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2039] to agcAotUnit2039@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:253
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32145.
    32145, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32146–32148.
function agcAotUnit2040 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32146 {
// PORT: SOURCE P34-35_P74-75.agc:254
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 32146.
        if slot <> 32146 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32147 {
// PORT: SOURCE P34-35_P74-75.agc:255
//		TC	P34/P74A	# PROCEED
// PORT: Fixed ROM slots 32147.
            if slot <> 32147 or instruction <> 1384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1384, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:256
//		TC	-7		# V32
// PORT: Fixed ROM slots 32148.
            if slot <> 32148 or instruction <> 1421 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1421, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2040] to agcAotUnit2040@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:257
//
// PORT: SOURCE P34-35_P74-75.agc:258
//SWCHCLR		BONCLR	BON
// PORT: Fixed ROM slots 32149.
    32149, 35864,
// PORT: SOURCE P34-35_P74-75.agc:259
//			ITSWICH
// PORT: Fixed ROM slots 32150.
    32150, 3840,
// PORT: SOURCE P34-35_P74-75.agc:260
//			INTLOOP
// PORT: Fixed ROM slots 32151.
    32151, 60168,
// PORT: SOURCE P34-35_P74-75.agc:261
//			ETPIFLAG
// PORT: Fixed ROM slots 32152.
    32152, 1424,
// PORT: SOURCE P34-35_P74-75.agc:262
//			P34/P74D	# DISPLAY TTPI
// PORT: Fixed ROM slots 32153.
    32153, 60218,
// PORT: SOURCE P34-35_P74-75.agc:263
//		EXIT
// PORT: Fixed ROM slots 32154.
    32154, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32155–32156.
function agcAotUnit2041 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32155 {
// PORT: SOURCE P34-35_P74-75.agc:264
//		TC	DISPLAYE	# DISPLAY ELEV AND CENTANG
// PORT: Fixed ROM slots 32155.
        if slot <> 32155 or instruction <> 1980 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1980, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P34-35_P74-75.agc:265
//		TC	P34/P74E
// PORT: Fixed ROM slots 32156.
        if slot <> 32156 or instruction <> 1440 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1440, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2041] to agcAotUnit2041@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:266
//P34/P74D	EXIT
// PORT: Fixed ROM slots 32157.
    32157, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32158–32160.
function agcAotUnit2042 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32158 {
// PORT: SOURCE P34-35_P74-75.agc:267
//		CAF	V06N37		# TTPI
// PORT: Fixed ROM slots 32158.
        if slot <> 32158 or instruction <> 14291 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2003), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32159 {
// PORT: SOURCE P34-35_P74-75.agc:268
//		TC	VNPOOH
// PORT: Fixed ROM slots 32159.
            if slot <> 32159 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:269
//P34/P74E	TC	INTPRET
// PORT: Fixed ROM slots 32160.
            if slot <> 32160 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2042] to agcAotUnit2042@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:270
//		SETPD	DLOAD
// PORT: Fixed ROM slots 32161.
    32161, 58626,
// PORT: SOURCE P34-35_P74-75.agc:271
//			0D
// PORT: Fixed ROM slots 32162.
    32162, 2,
// PORT: SOURCE P34-35_P74-75.agc:272
//			RTX1
// PORT: Fixed ROM slots 32163.
    32163, 3070,
// PORT: SOURCE P34-35_P74-75.agc:273
//		STODL	X1
// PORT: Fixed ROM slots 32164.
    32164, 12366,
// PORT: SOURCE P34-35_P74-75.agc:274
//			CENTANG
// PORT: Fixed ROM slots 32165.
    32165, 3874,
// PORT: SOURCE P34-35_P74-75.agc:275
//		PUSH	COS
// PORT: Fixed ROM slots 32166.
    32166, 58892,
// PORT: SOURCE P34-35_P74-75.agc:276
//		STODL	CSTH
// PORT: Fixed ROM slots 32167.
    32167, 15284,
// PORT: SOURCE P34-35_P74-75.agc:277
//		SIN
// PORT: Fixed ROM slots 32168.
    32168, 65500,
// PORT: SOURCE P34-35_P74-75.agc:278
//		STOVL	SNTH
// PORT: Fixed ROM slots 32169.
    32169, 23472,
// PORT: SOURCE P34-35_P74-75.agc:279
//			RPASS3
// PORT: Fixed ROM slots 32170.
    32170, 3796,
// PORT: SOURCE P34-35_P74-75.agc:280
//		VSR*
// PORT: Fixed ROM slots 32171.
    32171, 65374,
// PORT: SOURCE P34-35_P74-75.agc:281
//			0,2
// PORT: Fixed ROM slots 32172.
    32172, 48380,
// PORT: SOURCE P34-35_P74-75.agc:282
//		STOVL	RVEC
// PORT: Fixed ROM slots 32173.
    32173, 23386,
// PORT: SOURCE P34-35_P74-75.agc:283
//			VPASS3
// PORT: Fixed ROM slots 32174.
    32174, 3808,
// PORT: SOURCE P34-35_P74-75.agc:284
//		VSR*	SET
// PORT: Fixed ROM slots 32175.
    32175, 35934,
// PORT: SOURCE P34-35_P74-75.agc:285
//			0,2
// PORT: Fixed ROM slots 32176.
    32176, 48380,
// PORT: SOURCE P34-35_P74-75.agc:286
//			RVSW
// PORT: Fixed ROM slots 32177.
    32177, 3692,
// PORT: SOURCE P34-35_P74-75.agc:287
//# Page 663
// PORT: SOURCE P34-35_P74-75.agc:288
//		STCALL	VVEC
// PORT: Fixed ROM slots 32178.
    32178, 31688,
// PORT: SOURCE P34-35_P74-75.agc:289
//			TIMETHET
// PORT: Fixed ROM slots 32179.
    32179, 21428,
// PORT: SOURCE P34-35_P74-75.agc:290
//		DLOAD
// PORT: Fixed ROM slots 32180.
    32180, 65482,
// PORT: SOURCE P34-35_P74-75.agc:291
//			TTPI
// PORT: Fixed ROM slots 32181.
    32181, 3900,
// PORT: SOURCE P34-35_P74-75.agc:292
//		STORE	INTIME		# FOR INITVEL
// PORT: Fixed ROM slots 32182.
    32182, 3856,
// PORT: SOURCE P34-35_P74-75.agc:293
//		DAD
// PORT: Fixed ROM slots 32183.
    32183, 65306,
// PORT: SOURCE P34-35_P74-75.agc:294
//			T		# RENDEZVOUS TIME
// PORT: Fixed ROM slots 32184.
    32184, 62,
// PORT: SOURCE P34-35_P74-75.agc:295
//		STCALL	TPASS4		# FOR INITVEL
// PORT: Fixed ROM slots 32185.
    32185, 32562,
// PORT: SOURCE P34-35_P74-75.agc:296
//			S34/35.2
// PORT: Fixed ROM slots 32186.
    32186, 60812,
// PORT: SOURCE P34-35_P74-75.agc:297
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 32187.
    32187, 42746,
// PORT: SOURCE P34-35_P74-75.agc:298
//			DELVEET3
// PORT: Fixed ROM slots 32188.
    32188, 2540,
// PORT: SOURCE P34-35_P74-75.agc:299
//		STOVL	DELVTPI
// PORT: Fixed ROM slots 32189.
    32189, 24316,
// PORT: SOURCE P34-35_P74-75.agc:300
//			VPASS4
// PORT: Fixed ROM slots 32190.
    32190, 3724,
// PORT: SOURCE P34-35_P74-75.agc:301
//		VSU	ABVAL
// PORT: Fixed ROM slots 32191.
    32191, 42578,
// PORT: SOURCE P34-35_P74-75.agc:302
//			VTPRIME
// PORT: Fixed ROM slots 32192.
    32192, 3820,
// PORT: SOURCE P34-35_P74-75.agc:303
//		STOVL	DELVTPF
// PORT: Fixed ROM slots 32193.
    32193, 22992,
// PORT: SOURCE P34-35_P74-75.agc:304
//			RACT3
// PORT: Fixed ROM slots 32194.
    32194, 3772,
// PORT: SOURCE P34-35_P74-75.agc:305
//		PDVL	CALL
// PORT: Fixed ROM slots 32195.
    32195, 38042,
// PORT: SOURCE P34-35_P74-75.agc:306
//			VIPRIME
// PORT: Fixed ROM slots 32196.
    32196, 2494,
// PORT: SOURCE P34-35_P74-75.agc:307
//			PERIAPO1
// PORT: Fixed ROM slots 32197.
    32197, 39324,
// PORT: SOURCE P34-35_P74-75.agc:308
//		CALL
// PORT: Fixed ROM slots 32198.
    32198, 65320,
// PORT: SOURCE P34-35_P74-75.agc:309
//			SHIFTR1
// PORT: Fixed ROM slots 32199.
    32199, 39468,
// PORT: SOURCE P34-35_P74-75.agc:310
//		STODL	POSTTPI
// PORT: Fixed ROM slots 32200.
    32200, 16140,
// PORT: SOURCE P34-35_P74-75.agc:311
//			TTPI
// PORT: Fixed ROM slots 32201.
    32201, 3900,
// PORT: SOURCE P34-35_P74-75.agc:312
//		STORE	TIG
// PORT: Fixed ROM slots 32202.
    32202, 3652,
// PORT: SOURCE P34-35_P74-75.agc:313
//		EXIT
// PORT: Fixed ROM slots 32203.
    32203, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32204–32206.
function agcAotUnit2043 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32204 {
// PORT: SOURCE P34-35_P74-75.agc:314
//		CAF	V06N58
// PORT: Fixed ROM slots 32204.
        if slot <> 32204 or instruction <> 14293 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2005), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32205 {
// PORT: SOURCE P34-35_P74-75.agc:315
//		TC	VNPOOH
// PORT: Fixed ROM slots 32205.
            if slot <> 32205 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:316
//		TC	INTPRET
// PORT: Fixed ROM slots 32206.
            if slot <> 32206 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2043] to agcAotUnit2043@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:317
//		CALL
// PORT: Fixed ROM slots 32207.
    32207, 65320,
// PORT: SOURCE P34-35_P74-75.agc:318
//			S34/35.5
// PORT: Fixed ROM slots 32208.
    32208, 61092,
// PORT: SOURCE P34-35_P74-75.agc:319
//		CALL
// PORT: Fixed ROM slots 32209.
    32209, 65320,
// PORT: SOURCE P34-35_P74-75.agc:320
//			VN1645
// PORT: Fixed ROM slots 32210.
    32210, 61196,
// PORT: SOURCE P34-35_P74-75.agc:321
//		GOTO
// PORT: Fixed ROM slots 32211.
    32211, 65360,
// PORT: SOURCE P34-35_P74-75.agc:322
//			P34/P74C
// PORT: Fixed ROM slots 32212.
    32212, 60152
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32213–32222.
function agcAotUnit2044 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32217 {
        if slot <= 32214 {
            if slot <= 32213 {
// PORT: SOURCE P34-35_P74-75.agc:323
//# Page 664
// PORT: SOURCE P34-35_P74-75.agc:324
//# RENDEZVOUS MID-COURSE MANEUVER PROGRAMS (P35 AND P75)
// PORT: SOURCE P34-35_P74-75.agc:325
//
// PORT: SOURCE P34-35_P74-75.agc:326
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// PORT: SOURCE P34-35_P74-75.agc:327
//# MOD BY WHITE, P.		DATE:  1 JUNE 67
// PORT: SOURCE P34-35_P74-75.agc:328
//#
// PORT: SOURCE P34-35_P74-75.agc:329
//# PURPOSE
// PORT: SOURCE P34-35_P74-75.agc:330
//#
// PORT: SOURCE P34-35_P74-75.agc:331
//#	(1) 	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// PORT: SOURCE P34-35_P74-75.agc:332
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE NEXT
// PORT: SOURCE P34-35_P74-75.agc:333
//#		MID-COURSE CORRECTION OF THE TRANSFER PHASE OF AN ACTIVE
// PORT: SOURCE P34-35_P74-75.agc:334
//#		VEHICLE RENDEZVOUS.
// PORT: SOURCE P34-35_P74-75.agc:335
//#
// PORT: SOURCE P34-35_P74-75.agc:336
//#	(2)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// PORT: SOURCE P34-35_P74-75.agc:337
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// PORT: SOURCE P34-35_P74-75.agc:338
//#		ASTRONAUT/GROUND.
// PORT: SOURCE P34-35_P74-75.agc:339
//#
// PORT: SOURCE P34-35_P74-75.agc:340
//#	(3)	TO STORE THE TPM TARGET PARAMETERS FOR USE BY THE DESIRED
// PORT: SOURCE P34-35_P74-75.agc:341
//#		THRUSTING PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:342
//#
// PORT: SOURCE P34-35_P74-75.agc:343
//# ASSUMPTIONS
// PORT: SOURCE P34-35_P74-75.agc:344
//#
// PORT: SOURCE P34-35_P74-75.agc:345
//#	(1)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:346
//#
// PORT: SOURCE P34-35_P74-75.agc:347
//#	(2)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// PORT: SOURCE P34-35_P74-75.agc:348
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (3)).
// PORT: SOURCE P34-35_P74-75.agc:349
//#
// PORT: SOURCE P34-35_P74-75.agc:350
//#	(3)	THE RENDEZVOUS RADAR IS ON AND IS LOCKED ON THE CSM.  THIS WAS
// PORT: SOURCE P34-35_P74-75.agc:351
//#		DONE DURING PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS
// PORT: SOURCE P34-35_P74-75.agc:352
//#		WILL BE MADE AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN
// PORT: SOURCE P34-35_P74-75.agc:353
//#		ENABLED BY THE TRACK AND UPDATE FLAGS (SEE P20).  THE
// PORT: SOURCE P34-35_P74-75.agc:354
//#		RENDEZVOUS TRACKING MARK COUNTER IS ZEROED BY THE SELECTION OF
// PORT: SOURCE P34-35_P74-75.agc:355
//#		P20 AND AFTER EACH THRUSTING MANEUVER.
// PORT: SOURCE P34-35_P74-75.agc:356
//#
// PORT: SOURCE P34-35_P74-75.agc:357
//#	(4)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// PORT: SOURCE P34-35_P74-75.agc:358
//#
// PORT: SOURCE P34-35_P74-75.agc:359
//#			THE ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// PORT: SOURCE P34-35_P74-75.agc:360
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// PORT: SOURCE P34-35_P74-75.agc:361
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// PORT: SOURCE P34-35_P74-75.agc:362
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:363
//#
// PORT: SOURCE P34-35_P74-75.agc:364
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// PORT: SOURCE P34-35_P74-75.agc:365
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// PORT: SOURCE P34-35_P74-75.agc:366
//#
// PORT: SOURCE P34-35_P74-75.agc:367
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// PORT: SOURCE P34-35_P74-75.agc:368
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// PORT: SOURCE P34-35_P74-75.agc:369
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// PORT: SOURCE P34-35_P74-75.agc:370
//#
// PORT: SOURCE P34-35_P74-75.agc:371
//#	(5)	THE TIME OF INTERCEPT (T(INT)) WAS DEFINED BY PREVIOUS
// PORT: SOURCE P34-35_P74-75.agc:372
//#		COMPLETION OF THE TRANSFER PHASE INITIATION (TPI) PROGRAM
// PORT: SOURCE P34-35_P74-75.agc:373
//#		(P34/P74) AND IS PRESENTLY AVAILABLE IN STORAGE.
// PORT: SOURCE P34-35_P74-75.agc:374
//#
// PORT: SOURCE P34-35_P74-75.agc:375
//# Page 665
// PORT: SOURCE P34-35_P74-75.agc:376
//#	(6)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:377
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// PORT: SOURCE P34-35_P74-75.agc:378
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STORED.
// PORT: SOURCE P34-35_P74-75.agc:379
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// PORT: SOURCE P34-35_P74-75.agc:380
//#		THROUGH THE USE OF V06N52
// PORT: SOURCE P34-35_P74-75.agc:381
//#
// PORT: SOURCE P34-35_P74-75.agc:382
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// PORT: SOURCE P34-35_P74-75.agc:383
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// PORT: SOURCE P34-35_P74-75.agc:384
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// PORT: SOURCE P34-35_P74-75.agc:385
//#		ASTRONAUT SHOULD REASSESS THE INPUT TARGETING PARAMETERS BASED
// PORT: SOURCE P34-35_P74-75.agc:386
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// PORT: SOURCE P34-35_P74-75.agc:387
//#
// PORT: SOURCE P34-35_P74-75.agc:388
//#	(7)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// PORT: SOURCE P34-35_P74-75.agc:389
//#
// PORT: SOURCE P34-35_P74-75.agc:390
//#			P35 IF THIS VEHICLE IS ACTIVE VEHICLE.
// PORT: SOURCE P34-35_P74-75.agc:391
//#
// PORT: SOURCE P34-35_P74-75.agc:392
//#			P75 IF THIS VEHICLE IS PASSIVE VEHICLE.
// PORT: SOURCE P34-35_P74-75.agc:393
//#
// PORT: SOURCE P34-35_P74-75.agc:394
//# INPUT
// PORT: SOURCE P34-35_P74-75.agc:395
//#
// PORT: SOURCE P34-35_P74-75.agc:396
//#	(1)	TPASS4		TIME OF INTERCEPT -- SAVED FROM P34/P74
// PORT: SOURCE P34-35_P74-75.agc:397
//#
// PORT: SOURCE P34-35_P74-75.agc:398
//# OUTPUT
// PORT: SOURCE P34-35_P74-75.agc:399
//#
// PORT: SOURCE P34-35_P74-75.agc:400
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// PORT: SOURCE P34-35_P74-75.agc:401
//#	(2)	TTOGO		TIME TO GO
// PORT: SOURCE P34-35_P74-75.agc:402
//#	(3)	+MGA		MIDOLF GIMBAL ANGLE
// PORT: SOURCE P34-35_P74-75.agc:403
//#	(4)	DVLOS		DELTA VELOCITY AT MID -- LINE OF SIGHT
// PORT: SOURCE P34-35_P74-75.agc:404
//#	(5)	DELVLVC		DELTA VELOCITY AT MID -- LOCAL VERTICAL COORDINATES
// PORT: SOURCE P34-35_P74-75.agc:405
//#
// PORT: SOURCE P34-35_P74-75.agc:406
//# DOWNLINK
// PORT: SOURCE P34-35_P74-75.agc:407
//#
// PORT: SOURCE P34-35_P74-75.agc:408
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:409
//#	(2)	DELVEET3	DELTA VELOCITY AT TPM -- REFERENCE COORDINATES
// PORT: SOURCE P34-35_P74-75.agc:410
//#	(3)	TPASS4		TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:411
//#
// PORT: SOURCE P34-35_P74-75.agc:412
//# COMMUNICATION TO THRUSTING PROGRAMS
// PORT: SOURCE P34-35_P74-75.agc:413
//#
// PORT: SOURCE P34-35_P74-75.agc:414
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:415
//#	(2)	RTARG		OFFSET TARGET POSITION
// PORT: SOURCE P34-35_P74-75.agc:416
//#	(3)	TPASS4		TIME OF INTERCEPT
// PORT: SOURCE P34-35_P74-75.agc:417
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION.
// PORT: SOURCE P34-35_P74-75.agc:418
//#
// PORT: SOURCE P34-35_P74-75.agc:419
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:420
//#
// PORT: SOURCE P34-35_P74-75.agc:421
//#	AVFLAGA
// PORT: SOURCE P34-35_P74-75.agc:422
//#	AVFLAGP
// PORT: SOURCE P34-35_P74-75.agc:423
//#	LOADTIME
// PORT: SOURCE P34-35_P74-75.agc:424
//#	SELECTMU
// PORT: SOURCE P34-35_P74-75.agc:425
//#	PRECSET
// PORT: SOURCE P34-35_P74-75.agc:426
//#	S34/35.1
// PORT: SOURCE P34-35_P74-75.agc:427
//#	S34/35.2
// PORT: SOURCE P34-35_P74-75.agc:428
//# Page 666
// PORT: SOURCE P34-35_P74-75.agc:429
//#	S34/35.5
// PORT: SOURCE P34-35_P74-75.agc:430
//#	VN1645
// PORT: SOURCE P34-35_P74-75.agc:431
//
// PORT: SOURCE P34-35_P74-75.agc:432
//		COUNT*	$$/P3575
// PORT: SOURCE P34-35_P74-75.agc:433
//		EBANK=	KT
// PORT: SOURCE P34-35_P74-75.agc:434
//
// PORT: SOURCE P34-35_P74-75.agc:435
//P35		TC	AVFLAGA
// PORT: Fixed ROM slots 32213.
                if slot <> 32213 or instruction <> 1255 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1255, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:436
//		EXTEND
// PORT: Fixed ROM slots 32214.
                if slot <> 32214 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32215 {
// PORT: SOURCE P34-35_P74-75.agc:437
//		DCA	ATIGINC
// PORT: Fixed ROM slots 32215.
                if slot <> 32215 or instruction <> 13057 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 769, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32216 {
// PORT: SOURCE P34-35_P74-75.agc:438
//		TC	P35/P75A
// PORT: Fixed ROM slots 32216.
                    if slot <> 32216 or instruction <> 1500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1500, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:439
//P75		TC	AVFLAGP
// PORT: Fixed ROM slots 32217.
                    if slot <> 32217 or instruction <> 1260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1260, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32219 {
            if slot <= 32218 {
// PORT: SOURCE P34-35_P74-75.agc:440
//		EXTEND
// PORT: Fixed ROM slots 32218.
                if slot <> 32218 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:441
//		DCA	PTIGINC
// PORT: Fixed ROM slots 32219.
                if slot <> 32219 or instruction <> 13059 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 771, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32220 {
// PORT: SOURCE P34-35_P74-75.agc:442
//P35/P75A	DXCH	KT
// PORT: Fixed ROM slots 32220.
                if slot <> 32220 or instruction <> 22398 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 894, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32221 {
// PORT: SOURCE P34-35_P74-75.agc:443
//		TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// PORT: Fixed ROM slots 32221.
                    if slot <> 32221 or instruction <> 1265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1265, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:444
//		TC	INTPRET
// PORT: Fixed ROM slots 32222.
                    if slot <> 32222 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2044] to agcAotUnit2044@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:445
//		CALL
// PORT: Fixed ROM slots 32223.
    32223, 65320,
// PORT: SOURCE P34-35_P74-75.agc:446
//			SELECTMU
// PORT: Fixed ROM slots 32224.
    32224, 16384,
// PORT: SOURCE P34-35_P74-75.agc:447
//P35/P75B	RTB
// PORT: Fixed ROM slots 32225.
    32225, 65336,
// PORT: SOURCE P34-35_P74-75.agc:448
//			LOADTIME
// PORT: Fixed ROM slots 32226.
    32226, 18166,
// PORT: SOURCE P34-35_P74-75.agc:449
//		STORE	TSTRT
// PORT: Fixed ROM slots 32227.
    32227, 3860,
// PORT: SOURCE P34-35_P74-75.agc:450
//		DAD
// PORT: Fixed ROM slots 32228.
    32228, 65306,
// PORT: SOURCE P34-35_P74-75.agc:451
//			KT
// PORT: Fixed ROM slots 32229.
    32229, 3836,
// PORT: SOURCE P34-35_P74-75.agc:452
//		STORE	TIG
// PORT: Fixed ROM slots 32230.
    32230, 3652,
// PORT: SOURCE P34-35_P74-75.agc:453
//		STORE	INTIME		# FOR INITVEL
// PORT: Fixed ROM slots 32231.
    32231, 3856,
// PORT: SOURCE P34-35_P74-75.agc:454
//		STCALL	TDEC1
// PORT: Fixed ROM slots 32232.
    32232, 28738,
// PORT: SOURCE P34-35_P74-75.agc:455
//			PRECSET		# ADVANCE BOTH VEHICLES
// PORT: Fixed ROM slots 32233.
    32233, 39392,
// PORT: SOURCE P34-35_P74-75.agc:456
//		CALL
// PORT: Fixed ROM slots 32234.
    32234, 65320,
// PORT: SOURCE P34-35_P74-75.agc:457
//			S34/35.1	# GET NORM AND LOS FOR TRANSFORM
// PORT: Fixed ROM slots 32235.
    32235, 60792,
// PORT: SOURCE P34-35_P74-75.agc:458
//		CALL
// PORT: Fixed ROM slots 32236.
    32236, 65320,
// PORT: SOURCE P34-35_P74-75.agc:459
//			S34/35.2	# GET DELTA V(LV)
// PORT: Fixed ROM slots 32237.
    32237, 60812,
// PORT: SOURCE P34-35_P74-75.agc:460
//		CALL
// PORT: Fixed ROM slots 32238.
    32238, 65320,
// PORT: SOURCE P34-35_P74-75.agc:461
//			S34/35.5
// PORT: Fixed ROM slots 32239.
    32239, 61092,
// PORT: SOURCE P34-35_P74-75.agc:462
//		CALL
// PORT: Fixed ROM slots 32240.
    32240, 65320,
// PORT: SOURCE P34-35_P74-75.agc:463
//			VN1645
// PORT: Fixed ROM slots 32241.
    32241, 61196,
// PORT: SOURCE P34-35_P74-75.agc:464
//		GOTO
// PORT: Fixed ROM slots 32242.
    32242, 65360,
// PORT: SOURCE P34-35_P74-75.agc:465
//			P35/P75B
// PORT: Fixed ROM slots 32243.
    32243, 60354,
// PORT: SOURCE P34-35_P74-75.agc:466
//# Page 667
// PORT: SOURCE P34-35_P74-75.agc:467
//# ***** S33/34.1 *****
// PORT: SOURCE P34-35_P74-75.agc:468
//
// PORT: SOURCE P34-35_P74-75.agc:469
//S33/34.1	STQ	SSP
// PORT: Fixed ROM slots 32244.
    32244, 55584,
// PORT: SOURCE P34-35_P74-75.agc:470
//			NORMEX
// PORT: Fixed ROM slots 32245.
    32245, 3686,
// PORT: SOURCE P34-35_P74-75.agc:471
//			TITER
// PORT: Fixed ROM slots 32246.
    32246, 3864,
// PORT: SOURCE P34-35_P74-75.agc:472
//		OCT	40000
// PORT: Fixed ROM slots 32247.
    32247, 32768,
// PORT: SOURCE P34-35_P74-75.agc:473
//		DLOAD	SETPD
// PORT: Fixed ROM slots 32248.
    32248, 33226,
// PORT: SOURCE P34-35_P74-75.agc:474
//			MAX250
// PORT: Fixed ROM slots 32249.
    32249, 28600,
// PORT: SOURCE P34-35_P74-75.agc:475
//			0D
// PORT: Fixed ROM slots 32250.
    32250, 2,
// PORT: SOURCE P34-35_P74-75.agc:476
//		STOVL	SECMAX
// PORT: Fixed ROM slots 32251.
    32251, 24312,
// PORT: SOURCE P34-35_P74-75.agc:477
//			RACT3
// PORT: Fixed ROM slots 32252.
    32252, 3772,
// PORT: SOURCE P34-35_P74-75.agc:478
//		STOVL	RAPREC
// PORT: Fixed ROM slots 32253.
    32253, 24192,
// PORT: SOURCE P34-35_P74-75.agc:479
//			VACT3
// PORT: Fixed ROM slots 32254.
    32254, 3784,
// PORT: SOURCE P34-35_P74-75.agc:480
//		STOVL	VAPREC
// PORT: Fixed ROM slots 32255.
    32255, 24204,
// PORT: SOURCE P34-35_P74-75.agc:481
//			RPASS3
// PORT: Fixed ROM slots 32256.
    32256, 3796,
// PORT: SOURCE P34-35_P74-75.agc:482
//		STOVL	RPPREC
// PORT: Fixed ROM slots 32257.
    32257, 24228,
// PORT: SOURCE P34-35_P74-75.agc:483
//			VPASS3
// PORT: Fixed ROM slots 32258.
    32258, 3808,
// PORT: SOURCE P34-35_P74-75.agc:484
//		STORE	VPPREC
// PORT: Fixed ROM slots 32259.
    32259, 3760,
// PORT: SOURCE P34-35_P74-75.agc:485
//ELCALC		CALL
// PORT: Fixed ROM slots 32260.
    32260, 65320,
// PORT: SOURCE P34-35_P74-75.agc:486
//			S34/35.1	# NORMAL AND LOS
// PORT: Fixed ROM slots 32261.
    32261, 60792,
// PORT: SOURCE P34-35_P74-75.agc:487
//		VXV	PDVL
// PORT: Fixed ROM slots 32262.
    32262, 52538,
// PORT: SOURCE P34-35_P74-75.agc:488
//			RACT3		# (RA*VA)*RA 0D
// PORT: Fixed ROM slots 32263.
    32263, 3772,
// PORT: SOURCE P34-35_P74-75.agc:489
//		PDVL	UNIT		# ULOS AT 6D
// PORT: Fixed ROM slots 32264.
    32264, 44698,
// PORT: SOURCE P34-35_P74-75.agc:490
//			RACT3
// PORT: Fixed ROM slots 32265.
    32265, 3772,
// PORT: SOURCE P34-35_P74-75.agc:491
//		PDVL	VPROJ		# XCHNJ AND UP
// PORT: Fixed ROM slots 32266.
    32266, 39322,
// PORT: SOURCE P34-35_P74-75.agc:492
//		VSL2	BVSU
// PORT: Fixed ROM slots 32267.
    32267, 42452,
// PORT: SOURCE P34-35_P74-75.agc:493
//			ULOS
// PORT: Fixed ROM slots 32268.
    32268, 2450,
// PORT: SOURCE P34-35_P74-75.agc:494
//		UNIT	PDVL		# UP AT 0D
// PORT: Fixed ROM slots 32269.
    32269, 52572,
// PORT: SOURCE P34-35_P74-75.agc:495
//		DOT	PDVL		# UP.UN*RA AT 0D
// PORT: Fixed ROM slots 32270.
    32270, 52546,
// PORT: SOURCE P34-35_P74-75.agc:496
//			0D		# UP IN MPAC
// PORT: Fixed ROM slots 32271.
    32271, 2,
// PORT: SOURCE P34-35_P74-75.agc:497
//		DOT	SIGN
// PORT: Fixed ROM slots 32272.
    32272, 62786,
// PORT: SOURCE P34-35_P74-75.agc:498
//			ULOS
// PORT: Fixed ROM slots 32273.
    32273, 2450,
// PORT: SOURCE P34-35_P74-75.agc:499
//		SL1	ACOS
// PORT: Fixed ROM slots 32274.
    32274, 54996,
// PORT: SOURCE P34-35_P74-75.agc:500
//		PDVL	DOT		# EA AT 0D
// PORT: Fixed ROM slots 32275.
    32275, 41370,
// PORT: SOURCE P34-35_P74-75.agc:501
//			ULOS
// PORT: Fixed ROM slots 32276.
    32276, 2450,
// PORT: SOURCE P34-35_P74-75.agc:502
//			RACT3
// PORT: Fixed ROM slots 32277.
    32277, 3772,
// PORT: SOURCE P34-35_P74-75.agc:503
//		BPL	DLOAD
// PORT: Fixed ROM slots 32278.
    32278, 58696,
// PORT: SOURCE P34-35_P74-75.agc:504
//			TESTY
// PORT: Fixed ROM slots 32279.
    32279, 60468,
// PORT: SOURCE P34-35_P74-75.agc:505
//			DPPOSMAX
// PORT: Fixed ROM slots 32280.
    32280, 6832,
// PORT: SOURCE P34-35_P74-75.agc:506
//		DSU	PUSH
// PORT: Fixed ROM slots 32281.
    32281, 34346,
// PORT: SOURCE P34-35_P74-75.agc:507
//TESTY		BOFF	DLOAD
// PORT: Fixed ROM slots 32282.
    32282, 58648,
// PORT: SOURCE P34-35_P74-75.agc:508
//			ITSWICH
// PORT: Fixed ROM slots 32283.
    32283, 4032,
// PORT: SOURCE P34-35_P74-75.agc:509
//			ELEX
// PORT: Fixed ROM slots 32284.
    32284, 60770,
// PORT: SOURCE P34-35_P74-75.agc:510
//			DELEL
// PORT: Fixed ROM slots 32285.
    32285, 3836,
// PORT: SOURCE P34-35_P74-75.agc:511
//		STODL	DELELO
// PORT: Fixed ROM slots 32286.
    32286, 12342,
// PORT: SOURCE P34-35_P74-75.agc:512
//		DSU
// PORT: Fixed ROM slots 32287.
    32287, 65322,
// PORT: SOURCE P34-35_P74-75.agc:513
//			ELEV
// PORT: Fixed ROM slots 32288.
    32288, 2398,
// PORT: SOURCE P34-35_P74-75.agc:514
//		STORE	DELEL
// PORT: Fixed ROM slots 32289.
    32289, 3836,
// PORT: SOURCE P34-35_P74-75.agc:515
//		ABS	DSU
// PORT: Fixed ROM slots 32290.
    32290, 38220,
// PORT: SOURCE P34-35_P74-75.agc:516
//			ELEPS
// PORT: Fixed ROM slots 32291.
    32291, 28608,
// PORT: SOURCE P34-35_P74-75.agc:517
//# Page 668
// PORT: SOURCE P34-35_P74-75.agc:518
//		BMN
// PORT: Fixed ROM slots 32292.
    32292, 65344,
// PORT: SOURCE P34-35_P74-75.agc:519
//			TIMEX		# COMMERCIALS EVERYWHERE
// PORT: Fixed ROM slots 32293.
    32293, 60786,
// PORT: SOURCE P34-35_P74-75.agc:520
//FIGTIME		SLOAD	SR1
// PORT: Fixed ROM slots 32294.
    32294, 58042,
// PORT: SOURCE P34-35_P74-75.agc:521
//			TITER
// PORT: Fixed ROM slots 32295.
    32295, 3864,
// PORT: SOURCE P34-35_P74-75.agc:522
//		BHIZ	LXA,1
// PORT: Fixed ROM slots 32296.
    32296, 59440,
// PORT: SOURCE P34-35_P74-75.agc:523
//			NORMEX		# TOO MANY ITERATIONS
// PORT: Fixed ROM slots 32297.
    32297, 3686,
// PORT: SOURCE P34-35_P74-75.agc:524
//			MPAC
// PORT: Fixed ROM slots 32298.
    32298, 216,
// PORT: SOURCE P34-35_P74-75.agc:525
//		SXA,1	VLOAD
// PORT: Fixed ROM slots 32299.
    32299, 64944,
// PORT: SOURCE P34-35_P74-75.agc:526
//			TITER
// PORT: Fixed ROM slots 32300.
    32300, 3862,
// PORT: SOURCE P34-35_P74-75.agc:527
//			RPASS3
// PORT: Fixed ROM slots 32301.
    32301, 3796,
// PORT: SOURCE P34-35_P74-75.agc:528
//		UNIT	PDDL
// PORT: Fixed ROM slots 32302.
    32302, 54620,
// PORT: SOURCE P34-35_P74-75.agc:529
//			36D
// PORT: Fixed ROM slots 32303.
    32303, 74,
// PORT: SOURCE P34-35_P74-75.agc:530
//		PDVL	UNIT
// PORT: Fixed ROM slots 32304.
    32304, 44698,
// PORT: SOURCE P34-35_P74-75.agc:531
//			RACT3
// PORT: Fixed ROM slots 32305.
    32305, 3772,
// PORT: SOURCE P34-35_P74-75.agc:532
//		PDDL
// PORT: Fixed ROM slots 32306.
    32306, 65450,
// PORT: SOURCE P34-35_P74-75.agc:533
//		PDDL	PUSH
// PORT: Fixed ROM slots 32307.
    32307, 34474,
// PORT: SOURCE P34-35_P74-75.agc:534
//			36D
// PORT: Fixed ROM slots 32308.
    32308, 74,
// PORT: SOURCE P34-35_P74-75.agc:535
//		BDSU
// PORT: Fixed ROM slots 32309.
    32309, 65314,
// PORT: SOURCE P34-35_P74-75.agc:536
//			12D
// PORT: Fixed ROM slots 32310.
    32310, 26,
// PORT: SOURCE P34-35_P74-75.agc:537
//		STODL	30D		# RP - RA MAGNITUDES
// PORT: Fixed ROM slots 32311.
    32311, 12350,
// PORT: SOURCE P34-35_P74-75.agc:538
//			DPHALF
// PORT: Fixed ROM slots 32312.
    32312, 6816,
// PORT: SOURCE P34-35_P74-75.agc:539
//		DSU	PUSH
// PORT: Fixed ROM slots 32313.
    32313, 34346,
// PORT: SOURCE P34-35_P74-75.agc:540
//			ELEV
// PORT: Fixed ROM slots 32314.
    32314, 2398,
// PORT: SOURCE P34-35_P74-75.agc:541
//		SIGN	BMN
// PORT: Fixed ROM slots 32315.
    32315, 41194,
// PORT: SOURCE P34-35_P74-75.agc:542
//			30D
// PORT: Fixed ROM slots 32316.
    32316, 62,
// PORT: SOURCE P34-35_P74-75.agc:543
//			NORMEX
// PORT: Fixed ROM slots 32317.
    32317, 3686,
// PORT: SOURCE P34-35_P74-75.agc:544
//		DLOAD	COS
// PORT: Fixed ROM slots 32318.
    32318, 59082,
// PORT: SOURCE P34-35_P74-75.agc:545
//		DMP	DDV
// PORT: Fixed ROM slots 32319.
    32319, 47370,
// PORT: SOURCE P34-35_P74-75.agc:546
//			14D
// PORT: Fixed ROM slots 32320.
    32320, 30,
// PORT: SOURCE P34-35_P74-75.agc:547
//			12D
// PORT: Fixed ROM slots 32321.
    32321, 26,
// PORT: SOURCE P34-35_P74-75.agc:548
//		DCOMP			# SINCE COS(180-A)=-COS A
// PORT: Fixed ROM slots 32322.
    32322, 65404,
// PORT: SOURCE P34-35_P74-75.agc:549
//		STORE	28D
// PORT: Fixed ROM slots 32323.
    32323, 58,
// PORT: SOURCE P34-35_P74-75.agc:550
//		ABS	BDSU
// PORT: Fixed ROM slots 32324.
    32324, 37196,
// PORT: SOURCE P34-35_P74-75.agc:551
//			DPHALF
// PORT: Fixed ROM slots 32325.
    32325, 6816,
// PORT: SOURCE P34-35_P74-75.agc:552
//		BMN	VLOAD
// PORT: Fixed ROM slots 32326.
    32326, 64832,
// PORT: SOURCE P34-35_P74-75.agc:553
//			NORMEX
// PORT: Fixed ROM slots 32327.
    32327, 3686,
// PORT: SOURCE P34-35_P74-75.agc:554
//			UNRM
// PORT: Fixed ROM slots 32328.
    32328, 2402,
// PORT: SOURCE P34-35_P74-75.agc:555
//		VXV	UNIT
// PORT: Fixed ROM slots 32329.
    32329, 44602,
// PORT: SOURCE P34-35_P74-75.agc:556
//			6D		# UN*RA
// PORT: Fixed ROM slots 32330.
    32330, 14,
// PORT: SOURCE P34-35_P74-75.agc:557
//		DOT	DMP
// PORT: Fixed ROM slots 32331.
    32331, 34114,
// PORT: SOURCE P34-35_P74-75.agc:558
//			VACT3
// PORT: Fixed ROM slots 32332.
    32332, 3784,
// PORT: SOURCE P34-35_P74-75.agc:559
//			12D
// PORT: Fixed ROM slots 32333.
    32333, 26,
// PORT: SOURCE P34-35_P74-75.agc:560
//		PDVL	VXV
// PORT: Fixed ROM slots 32334.
    32334, 40346,
// PORT: SOURCE P34-35_P74-75.agc:561
//			0D
// PORT: Fixed ROM slots 32335.
    32335, 2,
// PORT: SOURCE P34-35_P74-75.agc:562
//			VPASS3
// PORT: Fixed ROM slots 32336.
    32336, 3808,
// PORT: SOURCE P34-35_P74-75.agc:563
//		VXV	UNIT
// PORT: Fixed ROM slots 32337.
    32337, 44602,
// PORT: SOURCE P34-35_P74-75.agc:564
//			0D		# (RP*VP)*RP
// PORT: Fixed ROM slots 32338.
    32338, 2,
// PORT: SOURCE P34-35_P74-75.agc:565
//		DOT	DMP
// PORT: Fixed ROM slots 32339.
    32339, 34114,
// PORT: SOURCE P34-35_P74-75.agc:566
//			VPASS3
// PORT: Fixed ROM slots 32340.
    32340, 3808,
// PORT: SOURCE P34-35_P74-75.agc:567
//			14D
// PORT: Fixed ROM slots 32341.
    32341, 30,
// PORT: SOURCE P34-35_P74-75.agc:568
//# Page 669
// PORT: SOURCE P34-35_P74-75.agc:569
//		BDSU
// PORT: Fixed ROM slots 32342.
    32342, 65314,
// PORT: SOURCE P34-35_P74-75.agc:570
//		NORM	PDVL		# NORMALIZED WA - WP 12D
// PORT: Fixed ROM slots 32343.
    32343, 52610,
// PORT: SOURCE P34-35_P74-75.agc:571
//			X1
// PORT: Fixed ROM slots 32344.
    32344, 78,
// PORT: SOURCE P34-35_P74-75.agc:572
//			6D
// PORT: Fixed ROM slots 32345.
    32345, 14
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:573
//		VXV	DOT
// PORT: Fixed ROM slots 32346.
    32346, 41274,
// PORT: SOURCE P34-35_P74-75.agc:574
//			0D
// PORT: Fixed ROM slots 32347.
    32347, 2,
// PORT: SOURCE P34-35_P74-75.agc:575
//			UNRM		# RA*RP.UN 14D
// PORT: Fixed ROM slots 32348.
    32348, 2402,
// PORT: SOURCE P34-35_P74-75.agc:576
//		PDVL	DOT
// PORT: Fixed ROM slots 32349.
    32349, 41370,
// PORT: SOURCE P34-35_P74-75.agc:577
//			0D
// PORT: Fixed ROM slots 32350.
    32350, 2,
// PORT: SOURCE P34-35_P74-75.agc:578
//			6D
// PORT: Fixed ROM slots 32351.
    32351, 14,
// PORT: SOURCE P34-35_P74-75.agc:579
//		SL1	ACOS
// PORT: Fixed ROM slots 32352.
    32352, 54996,
// PORT: SOURCE P34-35_P74-75.agc:580
//		SIGN
// PORT: Fixed ROM slots 32353.
    32353, 65514,
// PORT: SOURCE P34-35_P74-75.agc:581
//		DSU	DAD		# ALPHA PI
// PORT: Fixed ROM slots 32354.
    32354, 36138,
// PORT: SOURCE P34-35_P74-75.agc:582
//			DPHALF
// PORT: Fixed ROM slots 32355.
    32355, 6816,
// PORT: SOURCE P34-35_P74-75.agc:583
//			ELEV
// PORT: Fixed ROM slots 32356.
    32356, 2398,
// PORT: SOURCE P34-35_P74-75.agc:584
//		PDDL	ACOS
// PORT: Fixed ROM slots 32357.
    32357, 54954,
// PORT: SOURCE P34-35_P74-75.agc:585
//			28D
// PORT: Fixed ROM slots 32358.
    32358, 58,
// PORT: SOURCE P34-35_P74-75.agc:586
//		BDSU	SIGN
// PORT: Fixed ROM slots 32359.
    32359, 62754,
// PORT: SOURCE P34-35_P74-75.agc:587
//			DPHALF
// PORT: Fixed ROM slots 32360.
    32360, 6816,
// PORT: SOURCE P34-35_P74-75.agc:588
//			30D		# CONTAINS RP-RA
// PORT: Fixed ROM slots 32361.
    32361, 62,
// PORT: SOURCE P34-35_P74-75.agc:589
//		DAD
// PORT: Fixed ROM slots 32362.
    32362, 65306,
// PORT: SOURCE P34-35_P74-75.agc:590
//		DMP	DDV
// PORT: Fixed ROM slots 32363.
    32363, 47370,
// PORT: SOURCE P34-35_P74-75.agc:591
//			TWOPI
// PORT: Fixed ROM slots 32364.
    32364, 28596,
// PORT: SOURCE P34-35_P74-75.agc:592
//		DMP
// PORT: Fixed ROM slots 32365.
    32365, 65290,
// PORT: SOURCE P34-35_P74-75.agc:593
//		SL*	DMP
// PORT: Fixed ROM slots 32366.
    32366, 34142,
// PORT: SOURCE P34-35_P74-75.agc:594
//			0 	-3,1
// PORT: Fixed ROM slots 32367.
    32367, 16636,
// PORT: SOURCE P34-35_P74-75.agc:595
//		PUSH	ABS
// PORT: Fixed ROM slots 32368.
    32368, 42508,
// PORT: SOURCE P34-35_P74-75.agc:596
//		DSU	BMN
// PORT: Fixed ROM slots 32369.
    32369, 41002,
// PORT: SOURCE P34-35_P74-75.agc:597
//			SECMAX
// PORT: Fixed ROM slots 32370.
    32370, 3832,
// PORT: SOURCE P34-35_P74-75.agc:598
//			OKMAX
// PORT: Fixed ROM slots 32371.
    32371, 60654,
// PORT: SOURCE P34-35_P74-75.agc:599
//		DLOAD	SIGN		# REPLACE TIME WITH MAX TIME SIGNED
// PORT: Fixed ROM slots 32372.
    32372, 62922,
// PORT: SOURCE P34-35_P74-75.agc:600
//			SECMAX
// PORT: Fixed ROM slots 32373.
    32373, 3832,
// PORT: SOURCE P34-35_P74-75.agc:601
//		PUSH
// PORT: Fixed ROM slots 32374.
    32374, 65292,
// PORT: SOURCE P34-35_P74-75.agc:602
//OKMAX		SLOAD	BPL		# TEST FIRST ITERATION
// PORT: Fixed ROM slots 32375.
    32375, 42170,
// PORT: SOURCE P34-35_P74-75.agc:603
//			TITER
// PORT: Fixed ROM slots 32376.
    32376, 3864,
// PORT: SOURCE P34-35_P74-75.agc:604
//			REPETE
// PORT: Fixed ROM slots 32377.
    32377, 60670,
// PORT: SOURCE P34-35_P74-75.agc:605
//		SSP	DLOAD
// PORT: Fixed ROM slots 32378.
    32378, 58802,
// PORT: SOURCE P34-35_P74-75.agc:606
//			TITER
// PORT: Fixed ROM slots 32379.
    32379, 3864,
// PORT: SOURCE P34-35_P74-75.agc:607
//		OCT	37777
// PORT: Fixed ROM slots 32380.
    32380, 32766,
// PORT: SOURCE P34-35_P74-75.agc:608
//		GOTO
// PORT: Fixed ROM slots 32381.
    32381, 65360,
// PORT: SOURCE P34-35_P74-75.agc:609
//			STORDELT
// PORT: Fixed ROM slots 32382.
    32382, 60730,
// PORT: SOURCE P34-35_P74-75.agc:610
//REPETE		DLOAD	DMP
// PORT: Fixed ROM slots 32383.
    32383, 34250,
// PORT: SOURCE P34-35_P74-75.agc:611
//			DELEL
// PORT: Fixed ROM slots 32384.
    32384, 3836,
// PORT: SOURCE P34-35_P74-75.agc:612
//			DELELO
// PORT: Fixed ROM slots 32385.
    32385, 54,
// PORT: SOURCE P34-35_P74-75.agc:613
//		BPL	DLOAD
// PORT: Fixed ROM slots 32386.
    32386, 58696,
// PORT: SOURCE P34-35_P74-75.agc:614
//			NEXTES
// PORT: Fixed ROM slots 32387.
    32387, 60694,
// PORT: SOURCE P34-35_P74-75.agc:615
//			SECMAX
// PORT: Fixed ROM slots 32388.
    32388, 3832,
// PORT: SOURCE P34-35_P74-75.agc:616
//		DMP
// PORT: Fixed ROM slots 32389.
    32389, 65290,
// PORT: SOURCE P34-35_P74-75.agc:617
//			THIRD
// PORT: Fixed ROM slots 32390.
    32390, 28604,
// PORT: SOURCE P34-35_P74-75.agc:618
//		STODL	SECMAX
// PORT: Fixed ROM slots 32391.
    32391, 16120,
// PORT: SOURCE P34-35_P74-75.agc:619
//# Page 670
// PORT: SOURCE P34-35_P74-75.agc:620
//		ABS	SR1		# CROSSED OVER SOLUTION
// PORT: Fixed ROM slots 32392.
    32392, 57932,
// PORT: SOURCE P34-35_P74-75.agc:621
//		DCOMP	GOTO		# DT=(-SIGN(DTO)//DT//)/2
// PORT: Fixed ROM slots 32393.
    32393, 43132,
// PORT: SOURCE P34-35_P74-75.agc:622
//			RESIGN
// PORT: Fixed ROM slots 32394.
    32394, 60710,
// PORT: SOURCE P34-35_P74-75.agc:623
//NEXTES		DLOAD	ABS
// PORT: Fixed ROM slots 32395.
    32395, 42698,
// PORT: SOURCE P34-35_P74-75.agc:624
//			DELEL
// PORT: Fixed ROM slots 32396.
    32396, 3836,
// PORT: SOURCE P34-35_P74-75.agc:625
//		PDDL	ABS
// PORT: Fixed ROM slots 32397.
    32397, 42666,
// PORT: SOURCE P34-35_P74-75.agc:626
//			DELELO
// PORT: Fixed ROM slots 32398.
    32398, 54,
// PORT: SOURCE P34-35_P74-75.agc:627
//		DSU
// PORT: Fixed ROM slots 32399.
    32399, 65322,
// PORT: SOURCE P34-35_P74-75.agc:628
//		BMN	DLOAD
// PORT: Fixed ROM slots 32400.
    32400, 58688,
// PORT: SOURCE P34-35_P74-75.agc:629
//			REVERS		# WRONG DIRECTION
// PORT: Fixed ROM slots 32401.
    32401, 60716,
// PORT: SOURCE P34-35_P74-75.agc:630
//		ABS
// PORT: Fixed ROM slots 32402.
    32402, 65356,
// PORT: SOURCE P34-35_P74-75.agc:631
//RESIGN		SIGN 	GOTO
// PORT: Fixed ROM slots 32403.
    32403, 43242,
// PORT: SOURCE P34-35_P74-75.agc:632
//			DELTEEO
// PORT: Fixed ROM slots 32404.
    32404, 3852,
// PORT: SOURCE P34-35_P74-75.agc:633
//			STORDELT
// PORT: Fixed ROM slots 32405.
    32405, 60730,
// PORT: SOURCE P34-35_P74-75.agc:634
//REVERS		DLOAD	DCOMP
// PORT: Fixed ROM slots 32406.
    32406, 48842,
// PORT: SOURCE P34-35_P74-75.agc:635
//			DELTEEO
// PORT: Fixed ROM slots 32407.
    32407, 3852,
// PORT: SOURCE P34-35_P74-75.agc:636
//		PUSH	SR1
// PORT: Fixed ROM slots 32408.
    32408, 57868,
// PORT: SOURCE P34-35_P74-75.agc:637
//		STORE	DELTEEO
// PORT: Fixed ROM slots 32409.
    32409, 3852,
// PORT: SOURCE P34-35_P74-75.agc:638
//		DAD
// PORT: Fixed ROM slots 32410.
    32410, 65306,
// PORT: SOURCE P34-35_P74-75.agc:639
//		GOTO
// PORT: Fixed ROM slots 32411.
    32411, 65360,
// PORT: SOURCE P34-35_P74-75.agc:640
//			ADTIME
// PORT: Fixed ROM slots 32412.
    32412, 60732,
// PORT: SOURCE P34-35_P74-75.agc:641
//STORDELT	STORE	DELTEEO
// PORT: Fixed ROM slots 32413.
    32413, 3852,
// PORT: SOURCE P34-35_P74-75.agc:642
//ADTIME		DAD
// PORT: Fixed ROM slots 32414.
    32414, 65306,
// PORT: SOURCE P34-35_P74-75.agc:643
//			NOMTPI		# SUM OF DELTA T'S
// PORT: Fixed ROM slots 32415.
    32415, 2462,
// PORT: SOURCE P34-35_P74-75.agc:644
//		STORE	NOMTPI
// PORT: Fixed ROM slots 32416.
    32416, 2462,
// PORT: SOURCE P34-35_P74-75.agc:645
//		VLOAD	PDVL
// PORT: Fixed ROM slots 32417.
    32417, 52730,
// PORT: SOURCE P34-35_P74-75.agc:646
//			VAPREC
// PORT: Fixed ROM slots 32418.
    32418, 3724,
// PORT: SOURCE P34-35_P74-75.agc:647
//			RAPREC
// PORT: Fixed ROM slots 32419.
    32419, 3712,
// PORT: SOURCE P34-35_P74-75.agc:648
//		CALL
// PORT: Fixed ROM slots 32420.
    32420, 65320,
// PORT: SOURCE P34-35_P74-75.agc:649
//			GOINT
// PORT: Fixed ROM slots 32421.
    32421, 61028,
// PORT: SOURCE P34-35_P74-75.agc:650
//		CALL
// PORT: Fixed ROM slots 32422.
    32422, 65320,
// PORT: SOURCE P34-35_P74-75.agc:651
//			ACTIVE		# STORE NEW RACT3 VACT3
// PORT: Fixed ROM slots 32423.
    32423, 39428,
// PORT: SOURCE P34-35_P74-75.agc:652
//		VLOAD	PDVL
// PORT: Fixed ROM slots 32424.
    32424, 52730,
// PORT: SOURCE P34-35_P74-75.agc:653
//			VPPREC
// PORT: Fixed ROM slots 32425.
    32425, 3760,
// PORT: SOURCE P34-35_P74-75.agc:654
//			RPPREC
// PORT: Fixed ROM slots 32426.
    32426, 3748,
// PORT: SOURCE P34-35_P74-75.agc:655
//		CALL
// PORT: Fixed ROM slots 32427.
    32427, 65320,
// PORT: SOURCE P34-35_P74-75.agc:656
//			GOINT
// PORT: Fixed ROM slots 32428.
    32428, 61028,
// PORT: SOURCE P34-35_P74-75.agc:657
//		CALL
// PORT: Fixed ROM slots 32429.
    32429, 65320,
// PORT: SOURCE P34-35_P74-75.agc:658
//			PASSIVE		# STORE NEW RPASS3 VPASS3
// PORT: Fixed ROM slots 32430.
    32430, 39444,
// PORT: SOURCE P34-35_P74-75.agc:659
//		GOTO
// PORT: Fixed ROM slots 32431.
    32431, 65360,
// PORT: SOURCE P34-35_P74-75.agc:660
//			ELCALC
// PORT: Fixed ROM slots 32432.
    32432, 60424,
// PORT: SOURCE P34-35_P74-75.agc:661
//ELEX		DLOAD	DAD
// PORT: Fixed ROM slots 32433.
    32433, 36298,
// PORT: SOURCE P34-35_P74-75.agc:662
//			TTPI
// PORT: Fixed ROM slots 32434.
    32434, 3900,
// PORT: SOURCE P34-35_P74-75.agc:663
//			NOMTPI
// PORT: Fixed ROM slots 32435.
    32435, 2462,
// PORT: SOURCE P34-35_P74-75.agc:664
//		STODL	TTPI
// PORT: Fixed ROM slots 32436.
    32436, 16188,
// PORT: SOURCE P34-35_P74-75.agc:665
//		BON
// PORT: Fixed ROM slots 32437.
    32437, 65304,
// PORT: SOURCE P34-35_P74-75.agc:666
//			ETPIFLAG
// PORT: Fixed ROM slots 32438.
    32438, 1424,
// PORT: SOURCE P34-35_P74-75.agc:667
//			TIMEX
// PORT: Fixed ROM slots 32439.
    32439, 60786,
// PORT: SOURCE P34-35_P74-75.agc:668
//		STORE	ELEV
// PORT: Fixed ROM slots 32440.
    32440, 2398,
// PORT: SOURCE P34-35_P74-75.agc:669
//TIMEX		DLOAD	GOTO
// PORT: Fixed ROM slots 32441.
    32441, 43210,
// PORT: SOURCE P34-35_P74-75.agc:670
//# Page 671
// PORT: SOURCE P34-35_P74-75.agc:671
//			ZEROVECS
// PORT: Fixed ROM slots 32442.
    32442, 6820,
// PORT: SOURCE P34-35_P74-75.agc:672
//			NORMEX
// PORT: Fixed ROM slots 32443.
    32443, 3686,
// PORT: SOURCE P34-35_P74-75.agc:673
//
// PORT: SOURCE P34-35_P74-75.agc:674
//# Page 672
// PORT: SOURCE P34-35_P74-75.agc:675
//# ***** S34/35.1 *****
// PORT: SOURCE P34-35_P74-75.agc:676
//
// PORT: SOURCE P34-35_P74-75.agc:677
//# COMPUTE UNIT NORMAL AND LINE OF SIGHT VECTORS GIVEN THE ACTIVE AND
// PORT: SOURCE P34-35_P74-75.agc:678
//# PASSIVE POS AND VEL AT TIME T3
// PORT: SOURCE P34-35_P74-75.agc:679
//
// PORT: SOURCE P34-35_P74-75.agc:680
//S34/35.1	VLOAD	VSU
// PORT: Fixed ROM slots 32444.
    32444, 43514,
// PORT: SOURCE P34-35_P74-75.agc:681
//			RPASS3
// PORT: Fixed ROM slots 32445.
    32445, 3796,
// PORT: SOURCE P34-35_P74-75.agc:682
//			RACT3
// PORT: Fixed ROM slots 32446.
    32446, 3772,
// PORT: SOURCE P34-35_P74-75.agc:683
//		UNIT	PUSH
// PORT: Fixed ROM slots 32447.
    32447, 34396,
// PORT: SOURCE P34-35_P74-75.agc:684
//		STOVL	ULOS
// PORT: Fixed ROM slots 32448.
    32448, 22930,
// PORT: SOURCE P34-35_P74-75.agc:685
//			RACT3
// PORT: Fixed ROM slots 32449.
    32449, 3772,
// PORT: SOURCE P34-35_P74-75.agc:686
//		VXV	UNIT
// PORT: Fixed ROM slots 32450.
    32450, 44602,
// PORT: SOURCE P34-35_P74-75.agc:687
//			VACT3
// PORT: Fixed ROM slots 32451.
    32451, 3784,
// PORT: SOURCE P34-35_P74-75.agc:688
//		STORE	UNRM
// PORT: Fixed ROM slots 32452.
    32452, 2402,
// PORT: SOURCE P34-35_P74-75.agc:689
//		RVQ
// PORT: Fixed ROM slots 32453.
    32453, 65308,
// PORT: SOURCE P34-35_P74-75.agc:690
//
// PORT: SOURCE P34-35_P74-75.agc:691
//# Page 673
// PORT: SOURCE P34-35_P74-75.agc:692
//# ***** S34/35.2 *****
// PORT: SOURCE P34-35_P74-75.agc:693
//
// PORT: SOURCE P34-35_P74-75.agc:694
//# ADVANCE PASSIVE VEH TO RENDEZVOUS TIME AND GET REQ VEL FROM LAMBERT
// PORT: SOURCE P34-35_P74-75.agc:695
//
// PORT: SOURCE P34-35_P74-75.agc:696
//S34/35.2 	STQ	VLOAD
// PORT: Fixed ROM slots 32454.
    32454, 64800,
// PORT: SOURCE P34-35_P74-75.agc:697
//			SUBEXIT
// PORT: Fixed ROM slots 32455.
    32455, 3696,
// PORT: SOURCE P34-35_P74-75.agc:698
//			VPASS3
// PORT: Fixed ROM slots 32456.
    32456, 3808,
// PORT: SOURCE P34-35_P74-75.agc:699
//		PDVL	PDDL
// PORT: Fixed ROM slots 32457.
    32457, 54682,
// PORT: SOURCE P34-35_P74-75.agc:700
//			RPASS3
// PORT: Fixed ROM slots 32458.
    32458, 3796
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:701
//			INTIME
// PORT: Fixed ROM slots 32459.
    32459, 3856,
// PORT: SOURCE P34-35_P74-75.agc:702
//		PDDL	PDDL
// PORT: Fixed ROM slots 32460.
    32460, 54698,
// PORT: SOURCE P34-35_P74-75.agc:703
//			TPASS4
// PORT: Fixed ROM slots 32461.
    32461, 3890,
// PORT: SOURCE P34-35_P74-75.agc:704
//			TWOPI		# CONIC
// PORT: Fixed ROM slots 32462.
    32462, 28596,
// PORT: SOURCE P34-35_P74-75.agc:705
//		PDDL	BHIZ
// PORT: Fixed ROM slots 32463.
    32463, 39082,
// PORT: SOURCE P34-35_P74-75.agc:706
//			NN
// PORT: Fixed ROM slots 32464.
    32464, 3694,
// PORT: SOURCE P34-35_P74-75.agc:707
//			S3435.23
// PORT: Fixed ROM slots 32465.
    32465, 60842,
// PORT: SOURCE P34-35_P74-75.agc:708
//		DLOAD
// PORT: Fixed ROM slots 32466.
    32466, 65482,
// PORT: SOURCE P34-35_P74-75.agc:709
//		DLOAD	PUSH
// PORT: Fixed ROM slots 32467.
    32467, 34506,
// PORT: SOURCE P34-35_P74-75.agc:710
//			ZEROVECS	# PRECISION
// PORT: Fixed ROM slots 32468.
    32468, 6820,
// PORT: SOURCE P34-35_P74-75.agc:711
//S3435.23	CALL
// PORT: Fixed ROM slots 32469.
    32469, 65320,
// PORT: SOURCE P34-35_P74-75.agc:712
//			INTINT		# GET TARGET VECTOR
// PORT: Fixed ROM slots 32470.
    32470, 61036,
// PORT: SOURCE P34-35_P74-75.agc:713
//S3435.25	STOVL	RTARG
// PORT: Fixed ROM slots 32471.
    32471, 24136,
// PORT: SOURCE P34-35_P74-75.agc:714
//			VATT
// PORT: Fixed ROM slots 32472.
    32472, 14,
// PORT: SOURCE P34-35_P74-75.agc:715
//		STOVL	VPASS4
// PORT: Fixed ROM slots 32473.
    32473, 24204,
// PORT: SOURCE P34-35_P74-75.agc:716
//			RTARG
// PORT: Fixed ROM slots 32474.
    32474, 3656,
// PORT: SOURCE P34-35_P74-75.agc:717
//# COMPUTE PHI = PI + (ACOS(UNIT RA.UNIT RP) - PI)SIGN(RA*RP.U)
// PORT: SOURCE P34-35_P74-75.agc:718
//		UNIT	PDVL		# UNIT RP
// PORT: Fixed ROM slots 32475.
    32475, 52572,
// PORT: SOURCE P34-35_P74-75.agc:719
//			RACT3
// PORT: Fixed ROM slots 32476.
    32476, 3772,
// PORT: SOURCE P34-35_P74-75.agc:720
//		UNIT	PUSH		# UNIT RA
// PORT: Fixed ROM slots 32477.
    32477, 34396,
// PORT: SOURCE P34-35_P74-75.agc:721
//		VXV	DOT
// PORT: Fixed ROM slots 32478.
    32478, 41274,
// PORT: SOURCE P34-35_P74-75.agc:722
//			0D
// PORT: Fixed ROM slots 32479.
    32479, 2,
// PORT: SOURCE P34-35_P74-75.agc:723
//			UNRM		# RA*RP.U
// PORT: Fixed ROM slots 32480.
    32480, 2402,
// PORT: SOURCE P34-35_P74-75.agc:724
//		PDVL
// PORT: Fixed ROM slots 32481.
    32481, 65434,
// PORT: SOURCE P34-35_P74-75.agc:725
//		DOT	SL1		# UNIT RA.UNIT RP
// PORT: Fixed ROM slots 32482.
    32482, 59970,
// PORT: SOURCE P34-35_P74-75.agc:726
//			0D
// PORT: Fixed ROM slots 32483.
    32483, 2,
// PORT: SOURCE P34-35_P74-75.agc:727
//		ACOS	SIGN
// PORT: Fixed ROM slots 32484.
    32484, 62892,
// PORT: SOURCE P34-35_P74-75.agc:728
//		BPL	DAD
// PORT: Fixed ROM slots 32485.
    32485, 36168,
// PORT: SOURCE P34-35_P74-75.agc:729
//			NOPIE
// PORT: Fixed ROM slots 32486.
    32486, 60880,
// PORT: SOURCE P34-35_P74-75.agc:730
//			DPPOSMAX	# REASONABLE TWO PI
// PORT: Fixed ROM slots 32487.
    32487, 6832,
// PORT: SOURCE P34-35_P74-75.agc:731
//NOPIE		STODL	ACTCENT
// PORT: Fixed ROM slots 32488.
    32488, 14300,
// PORT: SOURCE P34-35_P74-75.agc:732
//			TPASS4
// PORT: Fixed ROM slots 32489.
    32489, 3890,
// PORT: SOURCE P34-35_P74-75.agc:733
//		DSU
// PORT: Fixed ROM slots 32490.
    32490, 65322,
// PORT: SOURCE P34-35_P74-75.agc:734
//			INTIME
// PORT: Fixed ROM slots 32491.
    32491, 3856,
// PORT: SOURCE P34-35_P74-75.agc:735
//		STORE	DELLT4
// PORT: Fixed ROM slots 32492.
    32492, 3668,
// PORT: SOURCE P34-35_P74-75.agc:736
//		SLOAD	SETPD
// PORT: Fixed ROM slots 32493.
    32493, 33210,
// PORT: SOURCE P34-35_P74-75.agc:737
//			NN		# NUMBER OF OFFSETS
// PORT: Fixed ROM slots 32494.
    32494, 3694,
// PORT: SOURCE P34-35_P74-75.agc:738
//			0D
// PORT: Fixed ROM slots 32495.
    32495, 2,
// PORT: SOURCE P34-35_P74-75.agc:739
//		PDDL	PDVL
// PORT: Fixed ROM slots 32496.
    32496, 52650,
// PORT: SOURCE P34-35_P74-75.agc:740
//			EPSFOUR
// PORT: Fixed ROM slots 32497.
    32497, 28616,
// PORT: SOURCE P34-35_P74-75.agc:741
//			RACT3
// PORT: Fixed ROM slots 32498.
    32498, 3772,
// PORT: SOURCE P34-35_P74-75.agc:742
//		STOVL	RINIT
// PORT: Fixed ROM slots 32499.
    32499, 22950,
// PORT: SOURCE P34-35_P74-75.agc:743
//# Page 674
// PORT: SOURCE P34-35_P74-75.agc:744
//			VACT3
// PORT: Fixed ROM slots 32500.
    32500, 3784,
// PORT: SOURCE P34-35_P74-75.agc:745
//		STCALL	VINIT
// PORT: Fixed ROM slots 32501.
    32501, 31154,
// PORT: SOURCE P34-35_P74-75.agc:746
//			INITVEL
// PORT: Fixed ROM slots 32502.
    32502, 18432,
// PORT: SOURCE P34-35_P74-75.agc:747
//		CALL
// PORT: Fixed ROM slots 32503.
    32503, 65320,
// PORT: SOURCE P34-35_P74-75.agc:748
//			LOMAT
// PORT: Fixed ROM slots 32504.
    32504, 61006,
// PORT: SOURCE P34-35_P74-75.agc:749
//		VLOAD	MXV
// PORT: Fixed ROM slots 32505.
    32505, 53754,
// PORT: SOURCE P34-35_P74-75.agc:750
//			DELVEET3
// PORT: Fixed ROM slots 32506.
    32506, 2540,
// PORT: SOURCE P34-35_P74-75.agc:751
//			0D
// PORT: Fixed ROM slots 32507.
    32507, 2,
// PORT: SOURCE P34-35_P74-75.agc:752
//		VSL1
// PORT: Fixed ROM slots 32508.
    32508, 65524,
// PORT: SOURCE P34-35_P74-75.agc:753
//		STCALL	DELVLVC
// PORT: Fixed ROM slots 32509.
    32509, 32312,
// PORT: SOURCE P34-35_P74-75.agc:754
//			SUBEXIT
// PORT: Fixed ROM slots 32510.
    32510, 3696,
// PORT: SOURCE P34-35_P74-75.agc:755
//
// PORT: SOURCE P34-35_P74-75.agc:756
//# Page 675
// PORT: SOURCE P34-35_P74-75.agc:757
//# ***** S34/35.3 *****
// PORT: SOURCE P34-35_P74-75.agc:758
//
// PORT: SOURCE P34-35_P74-75.agc:759
//S34/35.3	STQ	CALL
// PORT: Fixed ROM slots 32511.
    32511, 37920,
// PORT: SOURCE P34-35_P74-75.agc:760
//			NORMEX
// PORT: Fixed ROM slots 32512.
    32512, 3686,
// PORT: SOURCE P34-35_P74-75.agc:761
//			LOMAT		# GET MATRIX IN PUSH LIST
// PORT: Fixed ROM slots 32513.
    32513, 61006,
// PORT: SOURCE P34-35_P74-75.agc:762
//		VLOAD	VXM
// PORT: Fixed ROM slots 32514.
    32514, 50682,
// PORT: SOURCE P34-35_P74-75.agc:763
//			DELVLVC		# NEW DEL V TPI
// PORT: Fixed ROM slots 32515.
    32515, 3640,
// PORT: SOURCE P34-35_P74-75.agc:764
//			0D
// PORT: Fixed ROM slots 32516.
    32516, 2,
// PORT: SOURCE P34-35_P74-75.agc:765
//		VSL1
// PORT: Fixed ROM slots 32517.
    32517, 65524,
// PORT: SOURCE P34-35_P74-75.agc:766
//		STORE	DELVEET3	# SAVE FOR TRANSFORM
// PORT: Fixed ROM slots 32518.
    32518, 2540,
// PORT: SOURCE P34-35_P74-75.agc:767
//		VAD	PDVL
// PORT: Fixed ROM slots 32519.
    32519, 52570,
// PORT: SOURCE P34-35_P74-75.agc:768
//			VACT3		# NEW V REQ
// PORT: Fixed ROM slots 32520.
    32520, 3784,
// PORT: SOURCE P34-35_P74-75.agc:769
//			RACT3
// PORT: Fixed ROM slots 32521.
    32521, 3772,
// PORT: SOURCE P34-35_P74-75.agc:770
//		PDDL	PDDL
// PORT: Fixed ROM slots 32522.
    32522, 54698,
// PORT: SOURCE P34-35_P74-75.agc:771
//			TIG
// PORT: Fixed ROM slots 32523.
    32523, 3652,
// PORT: SOURCE P34-35_P74-75.agc:772
//			TPASS4
// PORT: Fixed ROM slots 32524.
    32524, 3890,
// PORT: SOURCE P34-35_P74-75.agc:773
//		PDDL	PUSH
// PORT: Fixed ROM slots 32525.
    32525, 34474,
// PORT: SOURCE P34-35_P74-75.agc:774
//			DPPOSMAX
// PORT: Fixed ROM slots 32526.
    32526, 6832,
// PORT: SOURCE P34-35_P74-75.agc:775
//		CALL			# INTEG. FOR NEW TARGET VEC
// PORT: Fixed ROM slots 32527.
    32527, 65320,
// PORT: SOURCE P34-35_P74-75.agc:776
//			INTINT
// PORT: Fixed ROM slots 32528.
    32528, 61036,
// PORT: SOURCE P34-35_P74-75.agc:777
//		VLOAD
// PORT: Fixed ROM slots 32529.
    32529, 65530,
// PORT: SOURCE P34-35_P74-75.agc:778
//			RATT
// PORT: Fixed ROM slots 32530.
    32530, 2,
// PORT: SOURCE P34-35_P74-75.agc:779
//		STORE	RTARG
// PORT: Fixed ROM slots 32531.
    32531, 3656,
// PORT: SOURCE P34-35_P74-75.agc:780
//NOVRWRT		VLOAD	PUSH
// PORT: Fixed ROM slots 32532.
    32532, 34554,
// PORT: SOURCE P34-35_P74-75.agc:781
//			ULOS
// PORT: Fixed ROM slots 32533.
    32533, 2450,
// PORT: SOURCE P34-35_P74-75.agc:782
//		VXV	VCOMP
// PORT: Fixed ROM slots 32534.
    32534, 48698,
// PORT: SOURCE P34-35_P74-75.agc:783
//			UNRM
// PORT: Fixed ROM slots 32535.
    32535, 2402,
// PORT: SOURCE P34-35_P74-75.agc:784
//		UNIT	PUSH
// PORT: Fixed ROM slots 32536.
    32536, 34396,
// PORT: SOURCE P34-35_P74-75.agc:785
//		VXV	VSL1
// PORT: Fixed ROM slots 32537.
    32537, 64058,
// PORT: SOURCE P34-35_P74-75.agc:786
//			ULOS
// PORT: Fixed ROM slots 32538.
    32538, 2450,
// PORT: SOURCE P34-35_P74-75.agc:787
//		PDVL
// PORT: Fixed ROM slots 32539.
    32539, 65434,
// PORT: SOURCE P34-35_P74-75.agc:788
//		PDVL	MXV
// PORT: Fixed ROM slots 32540.
    32540, 53658,
// PORT: SOURCE P34-35_P74-75.agc:789
//			DELVEET3
// PORT: Fixed ROM slots 32541.
    32541, 2540,
// PORT: SOURCE P34-35_P74-75.agc:790
//			0D
// PORT: Fixed ROM slots 32542.
    32542, 2,
// PORT: SOURCE P34-35_P74-75.agc:791
//		VSL1
// PORT: Fixed ROM slots 32543.
    32543, 65524,
// PORT: SOURCE P34-35_P74-75.agc:792
//		STCALL	DVLOS
// PORT: Fixed ROM slots 32544.
    32544, 31110,
// PORT: SOURCE P34-35_P74-75.agc:793
//			NORMEX
// PORT: Fixed ROM slots 32545.
    32545, 3686,
// PORT: SOURCE P34-35_P74-75.agc:794
//
// PORT: SOURCE P34-35_P74-75.agc:795
//# Page 676
// PORT: SOURCE P34-35_P74-75.agc:796
//# ***** S34/35.4 *****
// PORT: SOURCE P34-35_P74-75.agc:797
//
// PORT: SOURCE P34-35_P74-75.agc:798
//S34/35.4	STQ	SETPD		# NO ASTRONAUT OVERWRITE
// PORT: Fixed ROM slots 32546.
    32546, 33056,
// PORT: SOURCE P34-35_P74-75.agc:799
//			NORMEX
// PORT: Fixed ROM slots 32547.
    32547, 3686,
// PORT: SOURCE P34-35_P74-75.agc:800
//			0D
// PORT: Fixed ROM slots 32548.
    32548, 2,
// PORT: SOURCE P34-35_P74-75.agc:801
//		GOTO
// PORT: Fixed ROM slots 32549.
    32549, 65360,
// PORT: SOURCE P34-35_P74-75.agc:802
//			NOVRWRT
// PORT: Fixed ROM slots 32550.
    32550, 60968,
// PORT: SOURCE P34-35_P74-75.agc:803
//
// PORT: SOURCE P34-35_P74-75.agc:804
//# Page 677
// PORT: SOURCE P34-35_P74-75.agc:805
//# ***** LOMAT *****
// PORT: SOURCE P34-35_P74-75.agc:806
//
// PORT: SOURCE P34-35_P74-75.agc:807
//LOMAT		VLOAD	VCOMP
// PORT: Fixed ROM slots 32551.
    32551, 48890,
// PORT: SOURCE P34-35_P74-75.agc:808
//			UNRM
// PORT: Fixed ROM slots 32552.
    32552, 2402,
// PORT: SOURCE P34-35_P74-75.agc:809
//		STOVL	6D		# Y
// PORT: Fixed ROM slots 32553.
    32553, 20494,
// PORT: SOURCE P34-35_P74-75.agc:810
//			RACT3
// PORT: Fixed ROM slots 32554.
    32554, 3772,
// PORT: SOURCE P34-35_P74-75.agc:811
//		UNIT	VCOMP
// PORT: Fixed ROM slots 32555.
    32555, 48732,
// PORT: SOURCE P34-35_P74-75.agc:812
//		STORE	12D
// PORT: Fixed ROM slots 32556.
    32556, 26,
// PORT: SOURCE P34-35_P74-75.agc:813
//		VXV	VSL1
// PORT: Fixed ROM slots 32557.
    32557, 64058,
// PORT: SOURCE P34-35_P74-75.agc:814
//			UNRM		# Z*-Y
// PORT: Fixed ROM slots 32558.
    32558, 2402,
// PORT: SOURCE P34-35_P74-75.agc:815
//		STORE	0D
// PORT: Fixed ROM slots 32559.
    32559, 2,
// PORT: SOURCE P34-35_P74-75.agc:816
//		SETPD	RVQ
// PORT: Fixed ROM slots 32560.
    32560, 36354,
// PORT: SOURCE P34-35_P74-75.agc:817
//			18D
// PORT: Fixed ROM slots 32561.
    32561, 38,
// PORT: SOURCE P34-35_P74-75.agc:818
//GOINT		PDDL	PDDL		# DO
// PORT: Fixed ROM slots 32562.
    32562, 54698,
// PORT: SOURCE P34-35_P74-75.agc:819
//			ZEROVECS	#	NOT
// PORT: Fixed ROM slots 32563.
    32563, 6820,
// PORT: SOURCE P34-35_P74-75.agc:820
//			NOMTPI		#
// PORT: Fixed ROM slots 32564.
    32564, 2462,
// PORT: SOURCE P34-35_P74-75.agc:821
//		PUSH	PUSH		#		ORDER OR INSERT BEFORE INTINT
// PORT: Fixed ROM slots 32565.
    32565, 34316,
// PORT: SOURCE P34-35_P74-75.agc:822
//INTINT		STQ	CALL
// PORT: Fixed ROM slots 32566.
    32566, 37920,
// PORT: SOURCE P34-35_P74-75.agc:823
//			RTRN
// PORT: Fixed ROM slots 32567.
    32567, 3690,
// PORT: SOURCE P34-35_P74-75.agc:824
//			INTSTALL
// PORT: Fixed ROM slots 32568.
    32568, 24088,
// PORT: SOURCE P34-35_P74-75.agc:825
//		CLEAR	DLOAD
// PORT: Fixed ROM slots 32569.
    32569, 58648,
// PORT: SOURCE P34-35_P74-75.agc:826
//			INTYPFLG
// PORT: Fixed ROM slots 32570.
    32570, 1910,
// PORT: SOURCE P34-35_P74-75.agc:827
//		BZE	SET
// PORT: Fixed ROM slots 32571.
    32571, 35928,
// PORT: SOURCE P34-35_P74-75.agc:828
//			+2
// PORT: Fixed ROM slots 32572.
    32572, 61052
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:829
//			INTYPFLG
// PORT: Fixed ROM slots 32573.
    32573, 1654,
// PORT: SOURCE P34-35_P74-75.agc:830
//		DLOAD	STADR
// PORT: Fixed ROM slots 32574.
    32574, 38602,
// PORT: SOURCE P34-35_P74-75.agc:831
//		STODL	TDEC1
// PORT: Fixed ROM slots 32575.
    32575, 53180,
// PORT: SOURCE P34-35_P74-75.agc:832
//		SET	LXA,2
// PORT: Fixed ROM slots 32576.
    32576, 60440,
// PORT: SOURCE P34-35_P74-75.agc:833
//			MOONFLAG
// PORT: Fixed ROM slots 32577.
    32577, 102,
// PORT: SOURCE P34-35_P74-75.agc:834
//			RTX2
// PORT: Fixed ROM slots 32578.
    32578, 3070,
// PORT: SOURCE P34-35_P74-75.agc:835
//		BON	CLEAR
// PORT: Fixed ROM slots 32579.
    32579, 35864,
// PORT: SOURCE P34-35_P74-75.agc:836
//			CMOONFLG
// PORT: Fixed ROM slots 32580.
    32580, 4486,
// PORT: SOURCE P34-35_P74-75.agc:837
//			ALLSET
// PORT: Fixed ROM slots 32581.
    32581, 61070,
// PORT: SOURCE P34-35_P74-75.agc:838
//			MOONFLAG
// PORT: Fixed ROM slots 32582.
    32582, 358,
// PORT: SOURCE P34-35_P74-75.agc:839
//ALLSET		STOVL	TET
// PORT: Fixed ROM slots 32583.
    32583, 22174,
// PORT: SOURCE P34-35_P74-75.agc:840
//		VSR*
// PORT: Fixed ROM slots 32584.
    32584, 65374,
// PORT: SOURCE P34-35_P74-75.agc:841
//			0,2
// PORT: Fixed ROM slots 32585.
    32585, 48380,
// PORT: SOURCE P34-35_P74-75.agc:842
//		STOVL	RCV
// PORT: Fixed ROM slots 32586.
    32586, 22202,
// PORT: SOURCE P34-35_P74-75.agc:843
//		VSR*
// PORT: Fixed ROM slots 32587.
    32587, 65374,
// PORT: SOURCE P34-35_P74-75.agc:844
//			0,2
// PORT: Fixed ROM slots 32588.
    32588, 48380,
// PORT: SOURCE P34-35_P74-75.agc:845
//		STCALL	VCV
// PORT: Fixed ROM slots 32589.
    32589, 30406,
// PORT: SOURCE P34-35_P74-75.agc:846
//			INTEGRVS
// PORT: Fixed ROM slots 32590.
    32590, 23694,
// PORT: SOURCE P34-35_P74-75.agc:847
//		VLOAD	GOTO
// PORT: Fixed ROM slots 32591.
    32591, 43258,
// PORT: SOURCE P34-35_P74-75.agc:848
//			RATT
// PORT: Fixed ROM slots 32592.
    32592, 2,
// PORT: SOURCE P34-35_P74-75.agc:849
//			RTRN
// PORT: Fixed ROM slots 32593.
    32593, 3690,
// PORT: SOURCE P34-35_P74-75.agc:850
//
// PORT: SOURCE P34-35_P74-75.agc:851
//# Page 678
// PORT: SOURCE P34-35_P74-75.agc:852
//# ***** S34/35.5 *****
// PORT: SOURCE P34-35_P74-75.agc:853
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:854
//#	BANKCALL
// PORT: SOURCE P34-35_P74-75.agc:855
//#	GOFLASH
// PORT: SOURCE P34-35_P74-75.agc:856
//#	GOTOPOOH
// PORT: SOURCE P34-35_P74-75.agc:857
//#	S34/35.3
// PORT: SOURCE P34-35_P74-75.agc:858
//#	S34.35.4
// PORT: SOURCE P34-35_P74-75.agc:859
//#	VNPOOH
// PORT: SOURCE P34-35_P74-75.agc:860
//
// PORT: SOURCE P34-35_P74-75.agc:861
//S34/35.5	STQ	BON
// PORT: Fixed ROM slots 32594.
    32594, 35872,
// PORT: SOURCE P34-35_P74-75.agc:862
//			SUBEXIT
// PORT: Fixed ROM slots 32595.
    32595, 3696,
// PORT: SOURCE P34-35_P74-75.agc:863
//			FINALFLG
// PORT: Fixed ROM slots 32596.
    32596, 1426,
// PORT: SOURCE P34-35_P74-75.agc:864
//			FLAGON
// PORT: Fixed ROM slots 32597.
    32597, 61106,
// PORT: SOURCE P34-35_P74-75.agc:865
//		SET	GOTO
// PORT: Fixed ROM slots 32598.
    32598, 43032,
// PORT: SOURCE P34-35_P74-75.agc:866
//			UPDATFLG
// PORT: Fixed ROM slots 32599.
    32599, 624,
// PORT: SOURCE P34-35_P74-75.agc:867
//			FLAGOFF
// PORT: Fixed ROM slots 32600.
    32600, 61180,
// PORT: SOURCE P34-35_P74-75.agc:868
//FLAGON		CLEAR	VLOAD
// PORT: Fixed ROM slots 32601.
    32601, 64792,
// PORT: SOURCE P34-35_P74-75.agc:869
//			NTARGFLG
// PORT: Fixed ROM slots 32602.
    32602, 3448,
// PORT: SOURCE P34-35_P74-75.agc:870
//			DELVLVC
// PORT: Fixed ROM slots 32603.
    32603, 3640,
// PORT: SOURCE P34-35_P74-75.agc:871
//		STORE	GDT/2
// PORT: Fixed ROM slots 32604.
    32604, 1342,
// PORT: SOURCE P34-35_P74-75.agc:872
//		EXIT
// PORT: Fixed ROM slots 32605.
    32605, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32606–32607.
function agcAotUnit2045 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32606 {
// PORT: SOURCE P34-35_P74-75.agc:873
// +5		CAF	V06N81
// PORT: Fixed ROM slots 32606.
        if slot <> 32606 or instruction <> 14295 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2007), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P34-35_P74-75.agc:874
//		TC	BANKCALL
// PORT: Fixed ROM slots 32607.
        if slot <> 32607 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2045] to agcAotUnit2045@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:875
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32608.
    32608, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32609–32617.
function agcAotUnit2046 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32612 {
        if slot <= 32610 {
            if slot <= 32609 {
// PORT: SOURCE P34-35_P74-75.agc:876
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 32609.
                if slot <> 32609 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:877
//		TC	+2		# PRO
// PORT: Fixed ROM slots 32610.
                if slot <> 32610 or instruction <> 1892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1892, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32611 {
// PORT: SOURCE P34-35_P74-75.agc:878
//		TC	FLAGON 	+5	# LOAD
// PORT: Fixed ROM slots 32611.
                if slot <> 32611 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:879
// +2		CA	EBANK7
// PORT: Fixed ROM slots 32612.
                if slot <> 32612 or instruction <> 14862 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32614 {
            if slot <= 32613 {
// PORT: SOURCE P34-35_P74-75.agc:880
//		TS	EBANK		# TO BE SURE
// PORT: Fixed ROM slots 32613.
                if slot <> 32613 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:881
//
// PORT: SOURCE P34-35_P74-75.agc:882
//		ZL
// PORT: Fixed ROM slots 32614.
                if slot <> 32614 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32615 {
// PORT: SOURCE P34-35_P74-75.agc:883
//		CA	FIVE
// PORT: Fixed ROM slots 32615.
                if slot <> 32615 or instruction <> 14830 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2542), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32616 {
// PORT: SOURCE P34-35_P74-75.agc:884
//NTARGCHK	TS	Q
// PORT: Fixed ROM slots 32616.
                    if slot <> 32616 or instruction <> 22530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:885
//		INDEX	Q
// PORT: Fixed ROM slots 32617.
                    if slot <> 32617 or instruction <> 20482 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20482, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2046] to agcAotUnit2046@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:886
//		CS	DELVLVC
// PORT: Fixed ROM slots 32618.
    32618, 34358
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32619–32619.
function agcAotUnit2047 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P34-35_P74-75.agc:887
//		INDEX	Q
// PORT: Fixed ROM slots 32619.
    if slot <> 32619 or instruction <> 20482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20482, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2047] to agcAotUnit2047@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:888
//		AD	GDT/2
// PORT: Fixed ROM slots 32620.
    32620, 50492
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32621–32627.
function agcAotUnit2048 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32623 {
        if slot <= 32621 {
// PORT: SOURCE P34-35_P74-75.agc:889
//		ADS	L
// PORT: Fixed ROM slots 32621.
            if slot <> 32621 or instruction <> 11265 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 1).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32622 {
// PORT: SOURCE P34-35_P74-75.agc:890
//		CCS	Q
// PORT: Fixed ROM slots 32622.
                if slot <> 32622 or instruction <> 4098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:891
//		TCF	NTARGCHK
// PORT: Fixed ROM slots 32623.
                if slot <> 32623 or instruction <> 5992 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5992, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32625 {
            if slot <= 32624 {
// PORT: SOURCE P34-35_P74-75.agc:892
//		LXCH	A
// PORT: Fixed ROM slots 32624.
                if slot <> 32624 or instruction <> 9216 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 0, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:893
//		EXTEND
// PORT: Fixed ROM slots 32625.
                if slot <> 32625 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32626 {
// PORT: SOURCE P34-35_P74-75.agc:894
//		BZF	+3
// PORT: Fixed ROM slots 32626.
                if slot <> 32626 or instruction <> 6005 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6005, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:895
//		TC	UPFLAG
// PORT: Fixed ROM slots 32627.
                if slot <> 32627 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2048] to agcAotUnit2048@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:896
//		ADRES	NTARGFLG
// PORT: Fixed ROM slots 32628.
    32628, 204
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32629–32629.
function agcAotUnit2049 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P34-35_P74-75.agc:897
//
// PORT: SOURCE P34-35_P74-75.agc:898
//		TC	INTPRET
// PORT: Fixed ROM slots 32629.
    if slot <> 32629 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2049] to agcAotUnit2049@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:899
//		BOFF	CALL
// PORT: Fixed ROM slots 32630.
    32630, 37912,
// PORT: SOURCE P34-35_P74-75.agc:900
//			NTARGFLG
// PORT: Fixed ROM slots 32631.
    32631, 3544,
// PORT: SOURCE P34-35_P74-75.agc:901
//# Page 679
// PORT: SOURCE P34-35_P74-75.agc:902
//			NOCHG
// PORT: Fixed ROM slots 32632.
    32632, 61172,
// PORT: SOURCE P34-35_P74-75.agc:903
//			S34/35.3
// PORT: Fixed ROM slots 32633.
    32633, 60926,
// PORT: SOURCE P34-35_P74-75.agc:904
//NOCHG		CLEAR	VLOAD
// PORT: Fixed ROM slots 32634.
    32634, 64792,
// PORT: SOURCE P34-35_P74-75.agc:905
//			XDELVFLG
// PORT: Fixed ROM slots 32635.
    32635, 1390,
// PORT: SOURCE P34-35_P74-75.agc:906
//			DELVEET3
// PORT: Fixed ROM slots 32636.
    32636, 2540,
// PORT: SOURCE P34-35_P74-75.agc:907
//		STORE	DELVSIN
// PORT: Fixed ROM slots 32637.
    32637, 3932,
// PORT: SOURCE P34-35_P74-75.agc:908
//FLAGOFF		CALL
// PORT: Fixed ROM slots 32638.
    32638, 65320,
// PORT: SOURCE P34-35_P74-75.agc:909
//			S34/35.4
// PORT: Fixed ROM slots 32639.
    32639, 60996,
// PORT: SOURCE P34-35_P74-75.agc:910
//		EXIT
// PORT: Fixed ROM slots 32640.
    32640, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32641–32643.
function agcAotUnit2050 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32641 {
// PORT: SOURCE P34-35_P74-75.agc:911
//		CAF	V06N59
// PORT: Fixed ROM slots 32641.
        if slot <> 32641 or instruction <> 14294 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2006), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32642 {
// PORT: SOURCE P34-35_P74-75.agc:912
//		TC	VNPOOH
// PORT: Fixed ROM slots 32642.
            if slot <> 32642 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:913
//		TC	INTPRET
// PORT: Fixed ROM slots 32643.
            if slot <> 32643 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2050] to agcAotUnit2050@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:914
//		GOTO
// PORT: Fixed ROM slots 32644.
    32644, 65360,
// PORT: SOURCE P34-35_P74-75.agc:915
//			SUBEXIT
// PORT: Fixed ROM slots 32645.
    32645, 3696,
// PORT: SOURCE P34-35_P74-75.agc:916
//
// PORT: SOURCE P34-35_P74-75.agc:917
//# Page 680
// PORT: SOURCE P34-35_P74-75.agc:918
//# ***** VN1645 *****
// PORT: SOURCE P34-35_P74-75.agc:919
//#
// PORT: SOURCE P34-35_P74-75.agc:920
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:921
//#	P3XORP7X
// PORT: SOURCE P34-35_P74-75.agc:922
//#	GET+MGA
// PORT: SOURCE P34-35_P74-75.agc:923
//#	BANKCALL
// PORT: SOURCE P34-35_P74-75.agc:924
//#	DELAYJOB
// PORT: SOURCE P34-35_P74-75.agc:925
//#	COMPTGO
// PORT: SOURCE P34-35_P74-75.agc:926
//#	GOFLASHR
// PORT: SOURCE P34-35_P74-75.agc:927
//#	GOTOPOOH
// PORT: SOURCE P34-35_P74-75.agc:928
//#	FLAGUP
// PORT: SOURCE P34-35_P74-75.agc:929
//
// PORT: SOURCE P34-35_P74-75.agc:930
//VN1645		STQ	DLOAD
// PORT: Fixed ROM slots 32646.
    32646, 58656,
// PORT: SOURCE P34-35_P74-75.agc:931
//			SUBEXIT
// PORT: Fixed ROM slots 32647.
    32647, 3696,
// PORT: SOURCE P34-35_P74-75.agc:932
//			DP-.01
// PORT: Fixed ROM slots 32648.
    32648, 28612,
// PORT: SOURCE P34-35_P74-75.agc:933
//		STORE	+MGA		# MGA = -.01
// PORT: Fixed ROM slots 32649.
    32649, 2390,
// PORT: SOURCE P34-35_P74-75.agc:934
//		BOFF	DLOAD
// PORT: Fixed ROM slots 32650.
    32650, 58648,
// PORT: SOURCE P34-35_P74-75.agc:935
//			FINALFLG
// PORT: Fixed ROM slots 32651.
    32651, 1490,
// PORT: SOURCE P34-35_P74-75.agc:936
//			GET45
// PORT: Fixed ROM slots 32652.
    32652, 61240,
// PORT: SOURCE P34-35_P74-75.agc:937
//			DP-.01
// PORT: Fixed ROM slots 32653.
    32653, 28612,
// PORT: SOURCE P34-35_P74-75.agc:938
//		DAD
// PORT: Fixed ROM slots 32654.
    32654, 65306,
// PORT: SOURCE P34-35_P74-75.agc:939
//			DP-.01
// PORT: Fixed ROM slots 32655.
    32655, 28612,
// PORT: SOURCE P34-35_P74-75.agc:940
//		STORE	+MGA		# MGA = -.02
// PORT: Fixed ROM slots 32656.
    32656, 2390,
// PORT: SOURCE P34-35_P74-75.agc:941
//		BOFF	EXIT
// PORT: Fixed ROM slots 32657.
    32657, 65048,
// PORT: SOURCE P34-35_P74-75.agc:942
//			REFSMFLG
// PORT: Fixed ROM slots 32658.
    32658, 1988,
// PORT: SOURCE P34-35_P74-75.agc:943
//			GET45
// PORT: Fixed ROM slots 32659.
    32659, 61240
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32660–32663.
function agcAotUnit2051 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32661 {
        if slot <= 32660 {
// PORT: SOURCE P34-35_P74-75.agc:944
//		TC	P3XORP7X
// PORT: Fixed ROM slots 32660.
            if slot <> 32660 or instruction <> 1988 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1988, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:945
//		TC	+2		# P3X
// PORT: Fixed ROM slots 32661.
            if slot <> 32661 or instruction <> 1943 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1943, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32662 {
// PORT: SOURCE P34-35_P74-75.agc:946
//		TC	GET45 	+1	# P7X
// PORT: Fixed ROM slots 32662.
            if slot <> 32662 or instruction <> 1949 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1949, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:947
//		TC	INTPRET
// PORT: Fixed ROM slots 32663.
            if slot <> 32663 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2051] to agcAotUnit2051@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:948
//		VLOAD	PUSH
// PORT: Fixed ROM slots 32664.
    32664, 34554,
// PORT: SOURCE P34-35_P74-75.agc:949
//			DELVSIN
// PORT: Fixed ROM slots 32665.
    32665, 3932,
// PORT: SOURCE P34-35_P74-75.agc:950
//		CALL			# COMPUTE MGA
// PORT: Fixed ROM slots 32666.
    32666, 65320,
// PORT: SOURCE P34-35_P74-75.agc:951
//			GET+MGA
// PORT: Fixed ROM slots 32667.
    32667, 14238,
// PORT: SOURCE P34-35_P74-75.agc:952
//GET45		EXIT
// PORT: Fixed ROM slots 32668.
    32668, 65532
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32669–32673.
function agcAotUnit2052 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32670 {
        if slot <= 32669 {
// PORT: SOURCE P34-35_P74-75.agc:953
//		TC	COMPTGO		# INITIATE TASK TO UPDATE TTOGO
// PORT: Fixed ROM slots 32669.
            if slot <> 32669 or instruction <> 1306 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1306, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:954
//		CA	SUBEXIT
// PORT: Fixed ROM slots 32670.
            if slot <> 32670 or instruction <> 13112 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 824).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32671 {
// PORT: SOURCE P34-35_P74-75.agc:955
//		TS	QSAVED
// PORT: Fixed ROM slots 32671.
            if slot <> 32671 or instruction <> 23348 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23348, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32672 {
// PORT: SOURCE P34-35_P74-75.agc:956
//		CAF	1SEC
// PORT: Fixed ROM slots 32672.
                if slot <> 32672 or instruction <> 14847 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:957
//		TC	BANKCALL
// PORT: Fixed ROM slots 32673.
                if slot <> 32673 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2052] to agcAotUnit2052@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:958
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 32674.
    32674, 1978
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32675–32676.
function agcAotUnit2053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32675 {
// PORT: SOURCE P34-35_P74-75.agc:959
//		CAF	V16N45		# TRKMKCNT, TTOGO, +MGA
// PORT: Fixed ROM slots 32675.
        if slot <> 32675 or instruction <> 14296 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2008), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P34-35_P74-75.agc:960
//		TC	BANKCALL
// PORT: Fixed ROM slots 32676.
        if slot <> 32676 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2053] to agcAotUnit2053@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:961
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32677.
    32677, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32678–32688.
function agcAotUnit2054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32682 {
        if slot <= 32679 {
            if slot <= 32678 {
// PORT: SOURCE P34-35_P74-75.agc:962
//		TC	KILCLOCK	# TERMINATE
// PORT: Fixed ROM slots 32678.
                if slot <> 32678 or instruction <> 1961 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1961, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:963
//		TC	N45PROC		# PROCEED
// PORT: Fixed ROM slots 32679.
                if slot <> 32679 or instruction <> 1964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32680 {
// PORT: SOURCE P34-35_P74-75.agc:964
//		TC	CLUPDATE	# RECYCLE -- RETURN FOR INITIAL COMPUTATION
// PORT: Fixed ROM slots 32680.
                if slot <> 32680 or instruction <> 1972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1972, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32681 {
// PORT: SOURCE P34-35_P74-75.agc:965
//KILCLOCK	CA	Z
// PORT: Fixed ROM slots 32681.
                    if slot <> 32681 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:966
//		TS	DISPDEX
// PORT: Fixed ROM slots 32682.
                    if slot <> 32682 or instruction <> 23155 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23155, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32685 {
            if slot <= 32683 {
// PORT: SOURCE P34-35_P74-75.agc:967
//# Page 681
// PORT: SOURCE P34-35_P74-75.agc:968
//		TC	GOTOPOOH
// PORT: Fixed ROM slots 32683.
                if slot <> 32683 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32684 {
// PORT: SOURCE P34-35_P74-75.agc:969
//N45PROC		CS	FLAGWRD2
// PORT: Fixed ROM slots 32684.
                    if slot <> 32684 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:970
//		MASK	BIT6
// PORT: Fixed ROM slots 32685.
                    if slot <> 32685 or instruction <> 31206 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32686 {
// PORT: SOURCE P34-35_P74-75.agc:971
//		EXTEND
// PORT: Fixed ROM slots 32686.
                if slot <> 32686 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32687 {
// PORT: SOURCE P34-35_P74-75.agc:972
//		BZF	KILCLOCK	# FINALFLG IS SET -- FLASH V37 -- AWAIT NEW PGM
// PORT: Fixed ROM slots 32687.
                    if slot <> 32687 or instruction <> 6057 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6057, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:973
//		TC	PHASCHNG
// PORT: Fixed ROM slots 32688.
                    if slot <> 32688 or instruction <> 2795 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2795, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2054] to agcAotUnit2054@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:974
//		OCT	04024
// PORT: Fixed ROM slots 32689.
    32689, 4136
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32690–32690.
function agcAotUnit2055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P34-35_P74-75.agc:975
//		TC	UPFLAG		# SET
// PORT: Fixed ROM slots 32690.
    if slot <> 32690 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2055] to agcAotUnit2055@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:976
//		ADRES	FINALFLG	# FINALFLG
// PORT: Fixed ROM slots 32691.
    32691, 78
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32692–32694.
function agcAotUnit2056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32692 {
// PORT: SOURCE P34-35_P74-75.agc:977
//CLUPDATE	CA	Z
// PORT: Fixed ROM slots 32692.
        if slot <> 32692 or instruction <> 12293 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 5).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32693 {
// PORT: SOURCE P34-35_P74-75.agc:978
//		TS	DISPDEX
// PORT: Fixed ROM slots 32693.
            if slot <> 32693 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:979
//		TC	PHASCHNG
// PORT: Fixed ROM slots 32694.
            if slot <> 32694 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2056] to agcAotUnit2056@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:980
//		OCT	04024
// PORT: Fixed ROM slots 32695.
    32695, 4136
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32696–32696.
function agcAotUnit2057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P34-35_P74-75.agc:981
//		TC	INTPRET
// PORT: Fixed ROM slots 32696.
    if slot <> 32696 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2057] to agcAotUnit2057@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:982
//		CLEAR	GOTO
// PORT: Fixed ROM slots 32697.
    32697, 43032,
// PORT: SOURCE P34-35_P74-75.agc:983
//			UPDATFLG
// PORT: Fixed ROM slots 32698.
    32698, 880,
// PORT: SOURCE P34-35_P74-75.agc:984
//			QSAVED
// PORT: Fixed ROM slots 32699.
    32699, 3688
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32700–32703.
function agcAotUnit2058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32701 {
        if slot <= 32700 {
// PORT: SOURCE P34-35_P74-75.agc:985
//
// PORT: SOURCE P34-35_P74-75.agc:986
//# Page 682
// PORT: SOURCE P34-35_P74-75.agc:987
//# ***** DISPLAYE *****
// PORT: SOURCE P34-35_P74-75.agc:988
//#
// PORT: SOURCE P34-35_P74-75.agc:989
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:990
//#	BANKCALL
// PORT: SOURCE P34-35_P74-75.agc:991
//#	GOFLASHR
// PORT: SOURCE P34-35_P74-75.agc:992
//#	GOTOPOOH
// PORT: SOURCE P34-35_P74-75.agc:993
//#	BLANKET
// PORT: SOURCE P34-35_P74-75.agc:994
//#	ENDOFJOB
// PORT: SOURCE P34-35_P74-75.agc:995
//
// PORT: SOURCE P34-35_P74-75.agc:996
//DISPLAYE	EXTEND
// PORT: Fixed ROM slots 32700.
            if slot <> 32700 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:997
//		QXCH	NORMEX
// PORT: Fixed ROM slots 32701.
            if slot <> 32701 or instruction <> 10035 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 819, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32702 {
// PORT: SOURCE P34-35_P74-75.agc:998
//		CAF	V06N55
// PORT: Fixed ROM slots 32702.
            if slot <> 32702 or instruction <> 14292 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2004), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:999
//		TCR	BANKCALL
// PORT: Fixed ROM slots 32703.
            if slot <> 32703 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2058] to agcAotUnit2058@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1000
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32704.
    32704, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32705–32718.
function agcAotUnit2059 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32711 {
        if slot <= 32707 {
            if slot <= 32705 {
// PORT: SOURCE P34-35_P74-75.agc:1001
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32705.
                if slot <> 32705 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32706 {
// PORT: SOURCE P34-35_P74-75.agc:1002
//		TC	NORMEX
// PORT: Fixed ROM slots 32706.
                    if slot <> 32706 or instruction <> 819 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 819, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1003
//		TCF	-5
// PORT: Fixed ROM slots 32707.
                    if slot <> 32707 or instruction <> 6078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32709 {
                if slot <= 32708 {
// PORT: SOURCE P34-35_P74-75.agc:1004
//
// PORT: SOURCE P34-35_P74-75.agc:1005
//# Page 683
// PORT: SOURCE P34-35_P74-75.agc:1006
//# ***** P3XORP7X *****
// PORT: SOURCE P34-35_P74-75.agc:1007
//
// PORT: SOURCE P34-35_P74-75.agc:1008
//P3XORP7X	CAF	HIGH9
// PORT: Fixed ROM slots 32708.
                    if slot <> 32708 or instruction <> 16356 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4068), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1009
//		MASK	MODREG
// PORT: Fixed ROM slots 32709.
                    if slot <> 32709 or instruction <> 29193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32710 {
// PORT: SOURCE P34-35_P74-75.agc:1010
//		EXTEND
// PORT: Fixed ROM slots 32710.
                    if slot <> 32710 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1011
//		BZF	+2
// PORT: Fixed ROM slots 32711.
                    if slot <> 32711 or instruction <> 6089 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6089, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32714 {
            if slot <= 32712 {
// PORT: SOURCE P34-35_P74-75.agc:1012
//		INCR	Q
// PORT: Fixed ROM slots 32712.
                if slot <> 32712 or instruction <> 10242 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32713 {
// PORT: SOURCE P34-35_P74-75.agc:1013
//		RETURN
// PORT: Fixed ROM slots 32713.
                    if slot <> 32713 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1014
//
// PORT: SOURCE P34-35_P74-75.agc:1015
//# ***** VNPOOH *****
// PORT: SOURCE P34-35_P74-75.agc:1016
//#
// PORT: SOURCE P34-35_P74-75.agc:1017
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:1018
//#	BANKCALL
// PORT: SOURCE P34-35_P74-75.agc:1019
//#	GOFLASH
// PORT: SOURCE P34-35_P74-75.agc:1020
//#	GOTOPOOH
// PORT: SOURCE P34-35_P74-75.agc:1021
//
// PORT: SOURCE P34-35_P74-75.agc:1022
//VNPOOH		EXTEND
// PORT: Fixed ROM slots 32714.
                    if slot <> 32714 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32716 {
                if slot <= 32715 {
// PORT: SOURCE P34-35_P74-75.agc:1023
//		QXCH	RTRN
// PORT: Fixed ROM slots 32715.
                    if slot <> 32715 or instruction <> 10037 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 821, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1024
//		TS	VERBNOUN
// PORT: Fixed ROM slots 32716.
                    if slot <> 32716 or instruction <> 23437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23437, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32717 {
// PORT: SOURCE P34-35_P74-75.agc:1025
//		CA	VERBNOUN
// PORT: Fixed ROM slots 32717.
                    if slot <> 32717 or instruction <> 13197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 909).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1026
//		TCR	BANKCALL
// PORT: Fixed ROM slots 32718.
                    if slot <> 32718 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2059] to agcAotUnit2059@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1027
//		CADR	GOFLASH
// PORT: Fixed ROM slots 32719.
    32719, 17020
)).

// PORT: Physical bank 35. Shared continuation entries, slots 32720–32722.
function agcAotUnit2060 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32720 {
// PORT: SOURCE P34-35_P74-75.agc:1028
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 32720.
        if slot <> 32720 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32721 {
// PORT: SOURCE P34-35_P74-75.agc:1029
//		TC	RTRN
// PORT: Fixed ROM slots 32721.
            if slot <> 32721 or instruction <> 821 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 821, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:1030
//		TCF	-5
// PORT: Fixed ROM slots 32722.
            if slot <> 32722 or instruction <> 6093 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6093, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2060] to agcAotUnit2060@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1031
//
// PORT: SOURCE P34-35_P74-75.agc:1032
//# Page 684
// PORT: SOURCE P34-35_P74-75.agc:1033
//# ***** CONSTANTS *****
// PORT: SOURCE P34-35_P74-75.agc:1034
//
// PORT: SOURCE P34-35_P74-75.agc:1035
//V06N37		VN	0637
// PORT: Fixed ROM slots 32723.
    32723, 1610,
// PORT: SOURCE P34-35_P74-75.agc:1036
//V06N55		VN	0655
// PORT: Fixed ROM slots 32724.
    32724, 1646,
// PORT: SOURCE P34-35_P74-75.agc:1037
//V06N58		VN	0658
// PORT: Fixed ROM slots 32725.
    32725, 1652,
// PORT: SOURCE P34-35_P74-75.agc:1038
//V06N59		VN	0659
// PORT: Fixed ROM slots 32726.
    32726, 1654,
// PORT: SOURCE P34-35_P74-75.agc:1039
//V06N81		VN	0681
// PORT: Fixed ROM slots 32727.
    32727, 1698,
// PORT: SOURCE P34-35_P74-75.agc:1040
//V16N45		VN	1645
// PORT: Fixed ROM slots 32728.
    32728, 4186,
// PORT: SOURCE P34-35_P74-75.agc:1041
//TWOPI		2DEC	6.283185307 B-4
// PORT: Fixed ROM slots 32729 32730.
    32729, 12866, 32730, 32170,
// PORT: SOURCE P34-35_P74-75.agc:1042
//
// PORT: SOURCE P34-35_P74-75.agc:1043
//MAX250		2DEC	25 E3
// PORT: Fixed ROM slots 32731 32732.
    32731, 2, 32732, 17232,
// PORT: SOURCE P34-35_P74-75.agc:1044
//
// PORT: SOURCE P34-35_P74-75.agc:1045
//THIRD		2DEC	.333333333
// PORT: Fixed ROM slots 32733 32734.
    32733, 10922, 32734, 10922,
// PORT: SOURCE P34-35_P74-75.agc:1046
//
// PORT: SOURCE P34-35_P74-75.agc:1047
//ELEPS		2DEC	.27777777 E-3
// PORT: Fixed ROM slots 32735 32736.
    32735, 8, 32736, 18058,
// PORT: SOURCE P34-35_P74-75.agc:1048
//
// PORT: SOURCE P34-35_P74-75.agc:1049
//DP-.01		OCT	77777		# CONSTANTS
// PORT: Fixed ROM slots 32737.
    32737, 65534,
// PORT: SOURCE P34-35_P74-75.agc:1050
//		OCT	61337		# ADJACENT	-.01 FOR MGA DSP
// PORT: Fixed ROM slots 32738.
    32738, 50622,
// PORT: SOURCE P34-35_P74-75.agc:1051
//EPSFOUR		2DEC	.0416666666
// PORT: Fixed ROM slots 32739 32740.
    32739, 1364, 32740, 21846,
// PORT: SOURCE P34-35_P74-75.agc:1052
//
// PORT: SOURCE P34-35_P74-75.agc:1053
//130DEG		2DEC	.3611111111
// PORT: Fixed ROM slots 32741 32742.
    32741, 11832, 32742, 14564,
// PORT: SOURCE P34-35_P74-75.agc:1054
//
// PORT: SOURCE P34-35_P74-75.agc:1055
//# Page 685
// PORT: SOURCE P34-35_P74-75.agc:1056
//# ***** INITVEL *****
// PORT: SOURCE P34-35_P74-75.agc:1057
//
// PORT: SOURCE P34-35_P74-75.agc:1058
//# MOD NO -1			LOG SECTION -- P34-P35, P74-P75
// PORT: SOURCE P34-35_P74-75.agc:1059
//# MOD BY WHITE, P.		DATE:  21 NOV 67
// PORT: SOURCE P34-35_P74-75.agc:1060
//#
// PORT: SOURCE P34-35_P74-75.agc:1061
//# FUNCTIONAL
// PORT: SOURCE P34-35_P74-75.agc:1062
//#
// PORT: SOURCE P34-35_P74-75.agc:1063
//#	THIS SUBROUTINE COMPUTES THE REQUIRED INITIAL VELOCITY VECTOR FOR
// PORT: SOURCE P34-35_P74-75.agc:1064
//#	A TRAJECTORY OF SPECIFIC TRANSFER TIME BETWEEN SPECIFIED INITIAL
// PORT: SOURCE P34-35_P74-75.agc:1065
//#	AND TARGET POSITIONS.  THE TRAJECTORY MAY BE EITHER CONIC OR
// PORT: SOURCE P34-35_P74-75.agc:1066
//#	PRECISION DEPENDING ON AN INPUT PARAMETER (NAMELY, NUMBER OF
// PORT: SOURCE P34-35_P74-75.agc:1067
//#	OFFSETS).  IN ADDITION, IN THE PRECISION TRAJECTORY CASE, THE
// PORT: SOURCE P34-35_P74-75.agc:1068
//#	SUBROUTINE ALSO COMPUTES AN OFFSET TARGET VECTOR, TO BE USED
// PORT: SOURCE P34-35_P74-75.agc:1069
//#	DURING PURE-CONIC CROSS-PRODUCT STEERING.  THE OFFSET TARGET
// PORT: SOURCE P34-35_P74-75.agc:1070
//#	VECTOR IS THE TERMINAL POSITION VECTOR OF A CONIC TRAJECTORY WHICH
// PORT: SOURCE P34-35_P74-75.agc:1071
//#	HAS THE SAME INITIAL STATE AS A PRECISION TRAJECTORY WHOSE
// PORT: SOURCE P34-35_P74-75.agc:1072
//#	TERMINAL POSITION VECTOR IS THE SPECIFIED TARGET VECTOR.
// PORT: SOURCE P34-35_P74-75.agc:1073
//#
// PORT: SOURCE P34-35_P74-75.agc:1074
//#	IN ORDER TO AVOID THE INHERENT SINGULARITIES IN THE 180 DEGREE
// PORT: SOURCE P34-35_P74-75.agc:1075
//#	TRANSFER CASE WHEN THE (TRUE OR OFFSET) TARGET VECTOR MAY BE
// PORT: SOURCE P34-35_P74-75.agc:1076
//#	SLIGHTLY OUT OF THE ORBITAL PLANE, THIS SUBROUTINE ROTATES THIS
// PORT: SOURCE P34-35_P74-75.agc:1077
//#	VECTOR INTO A PLANE DEFINED BY THE INPUT INITIAL POSITION VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1078
//#	AND ANOTHER INPUT VECTOR (USUALLY THE INITIAL VELOCITY VECTOR),
// PORT: SOURCE P34-35_P74-75.agc:1079
//#	WHENEVER THE INPUT TARGET VECTOR LIES INSIDE A CONE WHOSE VERTEX
// PORT: SOURCE P34-35_P74-75.agc:1080
//#	IS THE ORIGIN OF COORDINATES, WHOSE AXIS IS THE 180 DEGREE
// PORT: SOURCE P34-35_P74-75.agc:1081
//#	TRANSFER DIRECTION, AND WHOSE CONE ANGLE IS SPECIFIED BY THE USER.
// PORT: SOURCE P34-35_P74-75.agc:1082
//#
// PORT: SOURCE P34-35_P74-75.agc:1083
//#	THE LAMBERT SUBROUTINE IS UTILIZED FOR THE CONIC COMPUTATIONS AND
// PORT: SOURCE P34-35_P74-75.agc:1084
//#	THE COASTING INTEGRATION SUBROUTINE IS UTILIZED FOR THE PRECISION
// PORT: SOURCE P34-35_P74-75.agc:1085
//#	TRAJECTORY COMPUTATIONS.
// PORT: SOURCE P34-35_P74-75.agc:1086
//#
// PORT: SOURCE P34-35_P74-75.agc:1087
//# CALLING SEQUENCE
// PORT: SOURCE P34-35_P74-75.agc:1088
//#
// PORT: SOURCE P34-35_P74-75.agc:1089
//#	L	CALL
// PORT: SOURCE P34-35_P74-75.agc:1090
//#	L+1		INITVEL
// PORT: SOURCE P34-35_P74-75.agc:1091
//#	L+2	(RETURN -- ALWAYS)
// PORT: SOURCE P34-35_P74-75.agc:1092
//#
// PORT: SOURCE P34-35_P74-75.agc:1093
//# INPUT
// PORT: SOURCE P34-35_P74-75.agc:1094
//#
// PORT: SOURCE P34-35_P74-75.agc:1095
//#	(1)	RINIT		INITIAL POSITION RADIUS VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1096
//#	(2)	VINIT		INITIAL POSITION VELOCITY VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1097
//#	(3)	RTARG		TARGET POSITION RADIUS VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1098
//#	(4)	DELLT4		DESIRED TIME OF FLIGHT FROM RINIT TO RTARG
// PORT: SOURCE P34-35_P74-75.agc:1099
//#	(5)	INTIME		TIME OF RINIT
// PORT: SOURCE P34-35_P74-75.agc:1100
//#	(6)	0D		NUMBER OF ITERATIONS OF LAMBERT/INTEGRVS
// PORT: SOURCE P34-35_P74-75.agc:1101
//#	(7)	2D		ANGLE TO 180 DEGREES WHEN ROTATION STARTS
// PORT: SOURCE P34-35_P74-75.agc:1102
//#	(8)	RTX1		-2 FOR EARTH, -10D FOR LUNAR
// PORT: SOURCE P34-35_P74-75.agc:1103
//#	(9)	RTX2		COORDINATE SYSTEM ORIGIN -- 0 FOR EARTH, 2 FOR LUNAR
// PORT: SOURCE P34-35_P74-75.agc:1104
//#	PUSHLOC SET AT 4D
// PORT: SOURCE P34-35_P74-75.agc:1105
//#
// PORT: SOURCE P34-35_P74-75.agc:1106
//# Page 686
// PORT: SOURCE P34-35_P74-75.agc:1107
//# OUTPUT
// PORT: SOURCE P34-35_P74-75.agc:1108
//#
// PORT: SOURCE P34-35_P74-75.agc:1109
//#	(1)	RTARG		OFFSET TARGET POSITION VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1110
//#	(2)	VIPRIME		MANEUVER VELOCITY REQUIRED
// PORT: SOURCE P34-35_P74-75.agc:1111
//#	(3)	VTPRIME		VELOCITY AT TARGET AFTER MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:1112
//#	(4)	DELVEET3	DELTA VELOCITY REQUIRED FOR MANEUVER
// PORT: SOURCE P34-35_P74-75.agc:1113
//#
// PORT: SOURCE P34-35_P74-75.agc:1114
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:1115
//#
// PORT: SOURCE P34-35_P74-75.agc:1116
//#	LAMBERT
// PORT: SOURCE P34-35_P74-75.agc:1117
//#	INTSTALL
// PORT: SOURCE P34-35_P74-75.agc:1118
//#	INTEGRVS
// PORT: SOURCE P34-35_P74-75.agc:1119
//
// PORT: SOURCE P34-35_P74-75.agc:1120
//		SETLOC	INTVEL
// PORT: SOURCE P34-35_P74-75.agc:1121
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:1122
//
// PORT: SOURCE P34-35_P74-75.agc:1123
//		COUNT*	$$/INITV
// PORT: SOURCE P34-35_P74-75.agc:1124
//INITVEL		SET			# COGA GUESS NOT AVAILABLE
// PORT: Fixed ROM slots 11264.
    11264, 65304,
// PORT: SOURCE P34-35_P74-75.agc:1125
//			GUESSW
// PORT: Fixed ROM slots 11265.
    11265, 634,
// PORT: SOURCE P34-35_P74-75.agc:1126
//HAVEGUES	VLOAD	STQ
// PORT: Fixed ROM slots 11266.
    11266, 37114,
// PORT: SOURCE P34-35_P74-75.agc:1127
//			RTARG
// PORT: Fixed ROM slots 11267.
    11267, 3656,
// PORT: SOURCE P34-35_P74-75.agc:1128
//			NORMEX
// PORT: Fixed ROM slots 11268.
    11268, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1129
//		STORE	RTARG1
// PORT: Fixed ROM slots 11269.
    11269, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1130
//		ABVAL
// PORT: Fixed ROM slots 11270.
    11270, 65356,
// PORT: SOURCE P34-35_P74-75.agc:1131
//		STORE	RTMAG
// PORT: Fixed ROM slots 11271.
    11271, 4006,
// PORT: SOURCE P34-35_P74-75.agc:1132
//		SLOAD	BHIZ
// PORT: Fixed ROM slots 11272.
    11272, 39098,
// PORT: SOURCE P34-35_P74-75.agc:1133
//			RTX2
// PORT: Fixed ROM slots 11273.
    11273, 3072,
// PORT: SOURCE P34-35_P74-75.agc:1134
//			INITVEL1
// PORT: Fixed ROM slots 11274.
    11274, 18476,
// PORT: SOURCE P34-35_P74-75.agc:1135
//		VLOAD	VSL2
// PORT: Fixed ROM slots 11275.
    11275, 60154,
// PORT: SOURCE P34-35_P74-75.agc:1136
//			RINIT		# B29
// PORT: Fixed ROM slots 11276.
    11276, 2470,
// PORT: SOURCE P34-35_P74-75.agc:1137
//		STOVL	RINIT		# B27
// PORT: Fixed ROM slots 11277.
    11277, 22950,
// PORT: SOURCE P34-35_P74-75.agc:1138
//			VINIT		# B7
// PORT: Fixed ROM slots 11278.
    11278, 2482,
// PORT: SOURCE P34-35_P74-75.agc:1139
//		VSL2
// PORT: Fixed ROM slots 11279.
    11279, 65492,
// PORT: SOURCE P34-35_P74-75.agc:1140
//		STOVL	VINIT		# B5
// PORT: Fixed ROM slots 11280.
    11280, 22962,
// PORT: SOURCE P34-35_P74-75.agc:1141
//			RTARG1
// PORT: Fixed ROM slots 11281.
    11281, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1142
//		VSL2
// PORT: Fixed ROM slots 11282.
    11282, 65492,
// PORT: SOURCE P34-35_P74-75.agc:1143
//		STORE	RTARG1
// PORT: Fixed ROM slots 11283.
    11283, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1144
//		ABVAL
// PORT: Fixed ROM slots 11284.
    11284, 65356,
// PORT: SOURCE P34-35_P74-75.agc:1145
//		STORE	RTMAG
// PORT: Fixed ROM slots 11285.
    11285, 4006,
// PORT: SOURCE P34-35_P74-75.agc:1146
//
// PORT: SOURCE P34-35_P74-75.agc:1147
//# INITIALIZATION
// PORT: SOURCE P34-35_P74-75.agc:1148
//
// PORT: SOURCE P34-35_P74-75.agc:1149
//INITVEL1	SSP	DLOAD		# SET ITCTR TO -1,LOAD MPAC WITH E4 (PL 2D)
// PORT: Fixed ROM slots 11286.
    11286, 58802,
// PORT: SOURCE P34-35_P74-75.agc:1150
//			ITCTR
// PORT: Fixed ROM slots 11287.
    11287, 3870,
// PORT: SOURCE P34-35_P74-75.agc:1151
//			0 	-1
// PORT: Fixed ROM slots 11288.
    11288, 65532,
// PORT: SOURCE P34-35_P74-75.agc:1152
//		COSINE	SR1		# CALCULATE COSINE (E4) (+2)
// PORT: Fixed ROM slots 11289.
    11289, 58060,
// PORT: SOURCE P34-35_P74-75.agc:1153
//		STODL	COZY4		# SET COZY4 TO COSINE (E4) 	    (PL 0D)
// PORT: Fixed ROM slots 11290.
    11290, 16238,
// PORT: SOURCE P34-35_P74-75.agc:1154
//		LXA,2	SXA,2
// PORT: Fixed ROM slots 11291.
    11291, 56536,
// PORT: SOURCE P34-35_P74-75.agc:1155
//			MPAC
// PORT: Fixed ROM slots 11292.
    11292, 216,
// PORT: SOURCE P34-35_P74-75.agc:1156
//			VTARGTAG	# SET VTARGTAG TO 0D (SP)
// PORT: Fixed ROM slots 11293.
    11293, 2946,
// PORT: SOURCE P34-35_P74-75.agc:1157
//		VLOAD
// PORT: Fixed ROM slots 11294.
    11294, 65530,
// PORT: SOURCE P34-35_P74-75.agc:1158
//# Page 687
// PORT: SOURCE P34-35_P74-75.agc:1159
//			RINIT
// PORT: Fixed ROM slots 11295.
    11295, 2470
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1160
//		STOVL	R1VEC		# R1VEC EQ RINIT
// PORT: Fixed ROM slots 11296.
    11296, 23386,
// PORT: SOURCE P34-35_P74-75.agc:1161
//			RTARG1
// PORT: Fixed ROM slots 11297.
    11297, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1162
//		STODL	R2VEC		# R2VEC EQ RTARG
// PORT: Fixed ROM slots 11298.
    11298, 15206,
// PORT: SOURCE P34-35_P74-75.agc:1163
//			DELLT4
// PORT: Fixed ROM slots 11299.
    11299, 3668,
// PORT: SOURCE P34-35_P74-75.agc:1164
//		STORE	TDESIRED	# TDESIRED EQ DELLT4
// PORT: Fixed ROM slots 11300.
    11300, 2930,
// PORT: SOURCE P34-35_P74-75.agc:1165
//		SETPD	VLOAD
// PORT: Fixed ROM slots 11301.
    11301, 64770,
// PORT: SOURCE P34-35_P74-75.agc:1166
//			0D		# INITIALIZE PL TO 0D
// PORT: Fixed ROM slots 11302.
    11302, 2,
// PORT: SOURCE P34-35_P74-75.agc:1167
//			RINIT		# MPAC EQ RINIT (+29)
// PORT: Fixed ROM slots 11303.
    11303, 2470,
// PORT: SOURCE P34-35_P74-75.agc:1168
//		UNIT	PUSH		# UNIT(RI) (+1)		            (PL 6D)
// PORT: Fixed ROM slots 11304.
    11304, 34396,
// PORT: SOURCE P34-35_P74-75.agc:1169
//		VXV	UNIT
// PORT: Fixed ROM slots 11305.
    11305, 44602,
// PORT: SOURCE P34-35_P74-75.agc:1170
//			VINIT		# MPAC EQ UNIT(RI) X VI (+8)
// PORT: Fixed ROM slots 11306.
    11306, 2482,
// PORT: SOURCE P34-35_P74-75.agc:1171
//		STOVL	UN
// PORT: Fixed ROM slots 11307.
    11307, 23416,
// PORT: SOURCE P34-35_P74-75.agc:1172
//			RTARG1
// PORT: Fixed ROM slots 11308.
    11308, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1173
//		UNIT	DOT		# TEMP*RT.URI (+2)		    (PL 0D)
// PORT: Fixed ROM slots 11309.
    11309, 41308,
// PORT: SOURCE P34-35_P74-75.agc:1174
//		DAD	CLEAR
// PORT: Fixed ROM slots 11310.
    11310, 35866,
// PORT: SOURCE P34-35_P74-75.agc:1175
//			COZY4
// PORT: Fixed ROM slots 11311.
    11311, 3950,
// PORT: SOURCE P34-35_P74-75.agc:1176
//			NORMSW
// PORT: Fixed ROM slots 11312.
    11312, 3946,
// PORT: SOURCE P34-35_P74-75.agc:1177
//		STORE	COZY4
// PORT: Fixed ROM slots 11313.
    11313, 3950,
// PORT: SOURCE P34-35_P74-75.agc:1178
//INITVEL2	BPL	SET
// PORT: Fixed ROM slots 11314.
    11314, 35912,
// PORT: SOURCE P34-35_P74-75.agc:1179
//			INITVEL3	# UN CALCULATED IN LAMBERT
// PORT: Fixed ROM slots 11315.
    11315, 18570,
// PORT: SOURCE P34-35_P74-75.agc:1180
//			NORMSW
// PORT: Fixed ROM slots 11316.
    11316, 3690,
// PORT: SOURCE P34-35_P74-75.agc:1181
//
// PORT: SOURCE P34-35_P74-75.agc:1182
//# ROTATE RC INTO YC PLANE -- SET UNIT NORMAL TO YC
// PORT: SOURCE P34-35_P74-75.agc:1183
//
// PORT: SOURCE P34-35_P74-75.agc:1184
//		VLOAD	PUSH		#				    (PL 6D)
// PORT: Fixed ROM slots 11317.
    11317, 34554,
// PORT: SOURCE P34-35_P74-75.agc:1185
//			R2VEC		# RC TO 6D (+29)
// PORT: Fixed ROM slots 11318.
    11318, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1186
//		ABVAL	PDVL		# RC TO MPAC, ABVAL(RC) (+29) TO OD (PL 2D)
// PORT: Fixed ROM slots 11319.
    11319, 52556,
// PORT: SOURCE P34-35_P74-75.agc:1187
//		PUSH	VPROJ		#				    (PL 8D)
// PORT: Fixed ROM slots 11320.
    11320, 39180,
// PORT: SOURCE P34-35_P74-75.agc:1188
//			UN
// PORT: Fixed ROM slots 11321.
    11321, 2936,
// PORT: SOURCE P34-35_P74-75.agc:1189
//		VSL2	BVSU
// PORT: Fixed ROM slots 11322.
    11322, 42452,
// PORT: SOURCE P34-35_P74-75.agc:1190
//		UNIT	VXSC		#				    (PL 0D)
// PORT: Fixed ROM slots 11323.
    11323, 61788,
// PORT: SOURCE P34-35_P74-75.agc:1191
//		VSL1
// PORT: Fixed ROM slots 11324.
    11324, 65524,
// PORT: SOURCE P34-35_P74-75.agc:1192
//		STORE	R2VEC
// PORT: Fixed ROM slots 11325.
    11325, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1193
//		TLOAD	SLOAD
// PORT: Fixed ROM slots 11326.
    11326, 56786,
// PORT: SOURCE P34-35_P74-75.agc:1194
//			ZEROVEC
// PORT: Fixed ROM slots 11327.
    11327, 20494,
// PORT: SOURCE P34-35_P74-75.agc:1195
//			ITCTR
// PORT: Fixed ROM slots 11328.
    11328, 3870,
// PORT: SOURCE P34-35_P74-75.agc:1196
//		BPL	VLOAD
// PORT: Fixed ROM slots 11329.
    11329, 64840,
// PORT: SOURCE P34-35_P74-75.agc:1197
//			INITVEL3
// PORT: Fixed ROM slots 11330.
    11330, 18570,
// PORT: SOURCE P34-35_P74-75.agc:1198
//			R2VEC
// PORT: Fixed ROM slots 11331.
    11331, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1199
//		STORE	RTARG1
// PORT: Fixed ROM slots 11332.
    11332, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1200
//INITVEL3	DLOAD	PDVL		#				    (PL 2D)
// PORT: Fixed ROM slots 11333.
    11333, 52682,
// PORT: SOURCE P34-35_P74-75.agc:1201
//			MUEARTH		# POSITIVE VALUE
// PORT: Fixed ROM slots 11334.
    11334, 22542,
// PORT: SOURCE P34-35_P74-75.agc:1202
//			R2VEC
// PORT: Fixed ROM slots 11335.
    11335, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1203
//		UNIT	PDVL		# 2D = UNIT(R2VEC)		    (PL 8D)
// PORT: Fixed ROM slots 11336.
    11336, 52572,
// PORT: SOURCE P34-35_P74-75.agc:1204
//			R1VEC
// PORT: Fixed ROM slots 11337.
    11337, 2906,
// PORT: SOURCE P34-35_P74-75.agc:1205
//		UNIT	PUSH		# 8D = UNIT(R1VEC)		   (PL 14D)
// PORT: Fixed ROM slots 11338.
    11338, 34396,
// PORT: SOURCE P34-35_P74-75.agc:1206
//		VXV	VCOMP		# -N = UNIT(R2VEC) X UNIT(R1VEC)
// PORT: Fixed ROM slots 11339.
    11339, 48698,
// PORT: SOURCE P34-35_P74-75.agc:1207
//			2D
// PORT: Fixed ROM slots 11340.
    11340, 6,
// PORT: SOURCE P34-35_P74-75.agc:1208
//		PUSH			#				   (PL 20D)
// PORT: Fixed ROM slots 11341.
    11341, 65292,
// PORT: SOURCE P34-35_P74-75.agc:1209
//		LXA,1	DLOAD
// PORT: Fixed ROM slots 11342.
    11342, 58832,
// PORT: SOURCE P34-35_P74-75.agc:1210
//# Page 688
// PORT: SOURCE P34-35_P74-75.agc:1211
//			RTX1
// PORT: Fixed ROM slots 11343.
    11343, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1212
//			18D
// PORT: Fixed ROM slots 11344.
    11344, 38,
// PORT: SOURCE P34-35_P74-75.agc:1213
//		BMN	INCR,1
// PORT: Fixed ROM slots 11345.
    11345, 51264,
// PORT: SOURCE P34-35_P74-75.agc:1214
//			+2
// PORT: Fixed ROM slots 11346.
    11346, 18600,
// PORT: SOURCE P34-35_P74-75.agc:1215
//		DEC	-8
// PORT: Fixed ROM slots 11347.
    11347, 65518,
// PORT: SOURCE P34-35_P74-75.agc:1216
//		INCR,1	SLOAD
// PORT: Fixed ROM slots 11348.
    11348, 56720,
// PORT: SOURCE P34-35_P74-75.agc:1217
//			10D
// PORT: Fixed ROM slots 11349.
    11349, 20,
// PORT: SOURCE P34-35_P74-75.agc:1218
//			X1
// PORT: Fixed ROM slots 11350.
    11350, 78,
// PORT: SOURCE P34-35_P74-75.agc:1219
//		BHIZ	VLOAD		#				   (PL 14D)
// PORT: Fixed ROM slots 11351.
    11351, 64816,
// PORT: SOURCE P34-35_P74-75.agc:1220
//			+2
// PORT: Fixed ROM slots 11352.
    11352, 18612,
// PORT: SOURCE P34-35_P74-75.agc:1221
//		VCOMP	PUSH		#				   (PL 20D)
// PORT: Fixed ROM slots 11353.
    11353, 34428,
// PORT: SOURCE P34-35_P74-75.agc:1222
//		VLOAD			#				   (PL 14D)
// PORT: Fixed ROM slots 11354.
    11354, 65530,
// PORT: SOURCE P34-35_P74-75.agc:1223
//		VXV	DOT		#				    (PL 2D)
// PORT: Fixed ROM slots 11355.
    11355, 41274,
// PORT: SOURCE P34-35_P74-75.agc:1224
//		BPL	DLOAD		#				    (PL 0D)
// PORT: Fixed ROM slots 11356.
    11356, 58696,
// PORT: SOURCE P34-35_P74-75.agc:1225
//			INITVEL4
// PORT: Fixed ROM slots 11357.
    11357, 18622,
// PORT: SOURCE P34-35_P74-75.agc:1226
//		DCOMP	PUSH		#				    (PL 2D)
// PORT: Fixed ROM slots 11358.
    11358, 34428,
// PORT: SOURCE P34-35_P74-75.agc:1227
//INITVEL4	LXA,2	SXA,2
// PORT: Fixed ROM slots 11359.
    11359, 56536,
// PORT: SOURCE P34-35_P74-75.agc:1228
//			0D
// PORT: Fixed ROM slots 11360.
    11360, 0,
// PORT: SOURCE P34-35_P74-75.agc:1229
//			GEOMSGN
// PORT: Fixed ROM slots 11361.
    11361, 2932,
// PORT: SOURCE P34-35_P74-75.agc:1230
//
// PORT: SOURCE P34-35_P74-75.agc:1231
//# SET INPUTS UP FOR LAMBERT
// PORT: SOURCE P34-35_P74-75.agc:1232
//
// PORT: SOURCE P34-35_P74-75.agc:1233
//		LXA,1	CALL
// PORT: Fixed ROM slots 11362.
    11362, 38096,
// PORT: SOURCE P34-35_P74-75.agc:1234
//			RTX1
// PORT: Fixed ROM slots 11363.
    11363, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1235
//
// PORT: SOURCE P34-35_P74-75.agc:1236
//#  OPERATE THE LAMBERT CONIC ROUTINE (COASTFLT SUBROUTINE)
// PORT: SOURCE P34-35_P74-75.agc:1237
//
// PORT: SOURCE P34-35_P74-75.agc:1238
//			SETITCTR	# GO TO END OF BANK TO SET ITERCTR BEFORE
// PORT: Fixed ROM slots 11364.
    11364, 20458,
// PORT: SOURCE P34-35_P74-75.agc:1239
//					# CALLING LAMBER (FOR REMANUFACTURE ONLY)
// PORT: SOURCE P34-35_P74-75.agc:1240
//
// PORT: SOURCE P34-35_P74-75.agc:1241
//# ARRIVED AT SOLUTION IS GOOD ENOUGH ACCORDING TO SLIGHTLY WIDER BOUNDS.
// PORT: SOURCE P34-35_P74-75.agc:1242
//
// PORT: SOURCE P34-35_P74-75.agc:1243
//		CLEAR	VLOAD
// PORT: Fixed ROM slots 11365.
    11365, 64792,
// PORT: SOURCE P34-35_P74-75.agc:1244
//			GUESSW
// PORT: Fixed ROM slots 11366.
    11366, 890,
// PORT: SOURCE P34-35_P74-75.agc:1245
//			VVEC
// PORT: Fixed ROM slots 11367.
    11367, 3016,
// PORT: SOURCE P34-35_P74-75.agc:1246
//
// PORT: SOURCE P34-35_P74-75.agc:1247
//# STORE CALCULATED INITIAL VELOCITY REQUIRED IN VIPRIME
// PORT: SOURCE P34-35_P74-75.agc:1248
//
// PORT: SOURCE P34-35_P74-75.agc:1249
//		STODL	VIPRIME		# INITIAL VELOCITY REQUIRED (+7)
// PORT: Fixed ROM slots 11368.
    11368, 14782,
// PORT: SOURCE P34-35_P74-75.agc:1250
//
// PORT: SOURCE P34-35_P74-75.agc:1251
//# IF NUMIT IS ZERO, CONTINUE AT INITVELB, OTHERWISE
// PORT: SOURCE P34-35_P74-75.agc:1252
//# SET UP INPUTS FOR ENCKE INTEGRATION (INTEGRVS).
// PORT: SOURCE P34-35_P74-75.agc:1253
//
// PORT: SOURCE P34-35_P74-75.agc:1254
//			VTARGTAG
// PORT: Fixed ROM slots 11369.
    11369, 2948,
// PORT: SOURCE P34-35_P74-75.agc:1255
//		BHIZ	CALL
// PORT: Fixed ROM slots 11370.
    11370, 37936,
// PORT: SOURCE P34-35_P74-75.agc:1256
//			INITVEL7
// PORT: Fixed ROM slots 11371.
    11371, 18736,
// PORT: SOURCE P34-35_P74-75.agc:1257
//			INTSTALL
// PORT: Fixed ROM slots 11372.
    11372, 24088,
// PORT: SOURCE P34-35_P74-75.agc:1258
//		SLOAD	CLEAR
// PORT: Fixed ROM slots 11373.
    11373, 36026,
// PORT: SOURCE P34-35_P74-75.agc:1259
//			RTX2
// PORT: Fixed ROM slots 11374.
    11374, 3072,
// PORT: SOURCE P34-35_P74-75.agc:1260
//			MOONFLAG
// PORT: Fixed ROM slots 11375.
    11375, 358,
// PORT: SOURCE P34-35_P74-75.agc:1261
//		BHIZ	SET
// PORT: Fixed ROM slots 11376.
    11376, 35888,
// PORT: SOURCE P34-35_P74-75.agc:1262
//			INITVEL5
// PORT: Fixed ROM slots 11377.
    11377, 18662,
// PORT: SOURCE P34-35_P74-75.agc:1263
//# Page 689
// PORT: SOURCE P34-35_P74-75.agc:1264
//			MOONFLAG
// PORT: Fixed ROM slots 11378.
    11378, 102,
// PORT: SOURCE P34-35_P74-75.agc:1265
//INITVEL5	VLOAD
// PORT: Fixed ROM slots 11379.
    11379, 65530,
// PORT: SOURCE P34-35_P74-75.agc:1266
//			RINIT
// PORT: Fixed ROM slots 11380.
    11380, 2470,
// PORT: SOURCE P34-35_P74-75.agc:1267
//		STORE	R1VEC
// PORT: Fixed ROM slots 11381.
    11381, 2906,
// PORT: SOURCE P34-35_P74-75.agc:1268
//		STOVL	RCV
// PORT: Fixed ROM slots 11382.
    11382, 22202,
// PORT: SOURCE P34-35_P74-75.agc:1269
//			VIPRIME
// PORT: Fixed ROM slots 11383.
    11383, 2494,
// PORT: SOURCE P34-35_P74-75.agc:1270
//		STODL	VCV
// PORT: Fixed ROM slots 11384.
    11384, 14022,
// PORT: SOURCE P34-35_P74-75.agc:1271
//			INTIME
// PORT: Fixed ROM slots 11385.
    11385, 3856,
// PORT: SOURCE P34-35_P74-75.agc:1272
//		STORE	TET
// PORT: Fixed ROM slots 11386.
    11386, 1694,
// PORT: SOURCE P34-35_P74-75.agc:1273
//		DAD	CLEAR
// PORT: Fixed ROM slots 11387.
    11387, 35866,
// PORT: SOURCE P34-35_P74-75.agc:1274
//			DELLT4
// PORT: Fixed ROM slots 11388.
    11388, 3668,
// PORT: SOURCE P34-35_P74-75.agc:1275
//			INTYPFLG
// PORT: Fixed ROM slots 11389.
    11389, 1910,
// PORT: SOURCE P34-35_P74-75.agc:1276
//		STCALL	TDEC1
// PORT: Fixed ROM slots 11390.
    11390, 28738,
// PORT: SOURCE P34-35_P74-75.agc:1277
//			INTEGRVS
// PORT: Fixed ROM slots 11391.
    11391, 23694,
// PORT: SOURCE P34-35_P74-75.agc:1278
//		VLOAD
// PORT: Fixed ROM slots 11392.
    11392, 65530,
// PORT: SOURCE P34-35_P74-75.agc:1279
//			VATT1
// PORT: Fixed ROM slots 11393.
    11393, 42,
// PORT: SOURCE P34-35_P74-75.agc:1280
//		STORE	VTARGET
// PORT: Fixed ROM slots 11394.
    11394, 2950,
// PORT: SOURCE P34-35_P74-75.agc:1281
//
// PORT: SOURCE P34-35_P74-75.agc:1282
//# IF ITERATION COUNTER (ITCTR) EQ NO. ITERATIONS (NUMIT), CONTINUE AT
// PORT: SOURCE P34-35_P74-75.agc:1283
//# INITVELC, OTHERWISE REITERATE LAMBERT AND ENCKE
// PORT: SOURCE P34-35_P74-75.agc:1284
//
// PORT: SOURCE P34-35_P74-75.agc:1285
//		LXA,2	INCR,2
// PORT: Fixed ROM slots 11395.
    11395, 52440,
// PORT: SOURCE P34-35_P74-75.agc:1286
//			ITCTR
// PORT: Fixed ROM slots 11396.
    11396, 3868,
// PORT: SOURCE P34-35_P74-75.agc:1287
//			1D		# INCREMENT ITCTR
// PORT: Fixed ROM slots 11397.
    11397, 2
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1288
//		SXA,2	XSU,2
// PORT: Fixed ROM slots 11398.
    11398, 46264,
// PORT: SOURCE P34-35_P74-75.agc:1289
//			ITCTR
// PORT: Fixed ROM slots 11399.
    11399, 3868,
// PORT: SOURCE P34-35_P74-75.agc:1290
//			VTARGTAG
// PORT: Fixed ROM slots 11400.
    11400, 2946,
// PORT: SOURCE P34-35_P74-75.agc:1291
//		SLOAD	BHIZ		# IF SP(MPAC) EQ 0, CONTINUE AT INITVELC
// PORT: Fixed ROM slots 11401.
    11401, 39098,
// PORT: SOURCE P34-35_P74-75.agc:1292
//			X2
// PORT: Fixed ROM slots 11402.
    11402, 80,
// PORT: SOURCE P34-35_P74-75.agc:1293
//			INITVEL6
// PORT: Fixed ROM slots 11403.
    11403, 18730,
// PORT: SOURCE P34-35_P74-75.agc:1294
//
// PORT: SOURCE P34-35_P74-75.agc:1295
//# OFFSET CONIC TARGET VECTOR
// PORT: SOURCE P34-35_P74-75.agc:1296
//
// PORT: SOURCE P34-35_P74-75.agc:1297
//		VLOAD	VSU
// PORT: Fixed ROM slots 11404.
    11404, 43514,
// PORT: SOURCE P34-35_P74-75.agc:1298
//			RTARG1
// PORT: Fixed ROM slots 11405.
    11405, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1299
//			RATT1
// PORT: Fixed ROM slots 11406.
    11406, 30,
// PORT: SOURCE P34-35_P74-75.agc:1300
//		VAD
// PORT: Fixed ROM slots 11407.
    11407, 65370,
// PORT: SOURCE P34-35_P74-75.agc:1301
//			R2VEC
// PORT: Fixed ROM slots 11408.
    11408, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1302
//		STODL	R2VEC
// PORT: Fixed ROM slots 11409.
    11409, 15206,
// PORT: SOURCE P34-35_P74-75.agc:1303
//			COZY4
// PORT: Fixed ROM slots 11410.
    11410, 3950,
// PORT: SOURCE P34-35_P74-75.agc:1304
//		GOTO
// PORT: Fixed ROM slots 11411.
    11411, 65360,
// PORT: SOURCE P34-35_P74-75.agc:1305
//			INITVEL2	# CONTINUE ITERATING AT INITVEL2
// PORT: Fixed ROM slots 11412.
    11412, 18532,
// PORT: SOURCE P34-35_P74-75.agc:1306
//
// PORT: SOURCE P34-35_P74-75.agc:1307
//# COMPUTE THE DELTA VELOCITY
// PORT: SOURCE P34-35_P74-75.agc:1308
//
// PORT: SOURCE P34-35_P74-75.agc:1309
//INITVEL6	VLOAD
// PORT: Fixed ROM slots 11413.
    11413, 65530,
// PORT: SOURCE P34-35_P74-75.agc:1310
//			R2VEC
// PORT: Fixed ROM slots 11414.
    11414, 2918,
// PORT: SOURCE P34-35_P74-75.agc:1311
//		STORE	RTARG1
// PORT: Fixed ROM slots 11415.
    11415, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1312
//INITVEL7	VLOAD	VSU
// PORT: Fixed ROM slots 11416.
    11416, 43514,
// PORT: SOURCE P34-35_P74-75.agc:1313
//			VIPRIME
// PORT: Fixed ROM slots 11417.
    11417, 2494,
// PORT: SOURCE P34-35_P74-75.agc:1314
//			VINIT
// PORT: Fixed ROM slots 11418.
    11418, 2482,
// PORT: SOURCE P34-35_P74-75.agc:1315
//		STOVL	DELVEET3	# DELVEET3 = VIPRIME-VINIT (+7)
// PORT: Fixed ROM slots 11419.
    11419, 23020,
// PORT: SOURCE P34-35_P74-75.agc:1316
//# Page 690
// PORT: SOURCE P34-35_P74-75.agc:1317
//			VTARGET
// PORT: Fixed ROM slots 11420.
    11420, 2950,
// PORT: SOURCE P34-35_P74-75.agc:1318
//		STORE	VTPRIME
// PORT: Fixed ROM slots 11421.
    11421, 3820,
// PORT: SOURCE P34-35_P74-75.agc:1319
//		SLOAD	BHIZ
// PORT: Fixed ROM slots 11422.
    11422, 39098,
// PORT: SOURCE P34-35_P74-75.agc:1320
//			RTX2
// PORT: Fixed ROM slots 11423.
    11423, 3072,
// PORT: SOURCE P34-35_P74-75.agc:1321
//			INITVELX
// PORT: Fixed ROM slots 11424.
    11424, 18778,
// PORT: SOURCE P34-35_P74-75.agc:1322
//		VLOAD	VSR2
// PORT: Fixed ROM slots 11425.
    11425, 58106,
// PORT: SOURCE P34-35_P74-75.agc:1323
//			VTPRIME
// PORT: Fixed ROM slots 11426.
    11426, 3820,
// PORT: SOURCE P34-35_P74-75.agc:1324
//		STOVL	VTPRIME
// PORT: Fixed ROM slots 11427.
    11427, 24300,
// PORT: SOURCE P34-35_P74-75.agc:1325
//			VIPRIME
// PORT: Fixed ROM slots 11428.
    11428, 2494,
// PORT: SOURCE P34-35_P74-75.agc:1326
//		VSR2
// PORT: Fixed ROM slots 11429.
    11429, 65476,
// PORT: SOURCE P34-35_P74-75.agc:1327
//		STOVL	VIPRIME
// PORT: Fixed ROM slots 11430.
    11430, 22974,
// PORT: SOURCE P34-35_P74-75.agc:1328
//			RTARG1
// PORT: Fixed ROM slots 11431.
    11431, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1329
//		VSR2
// PORT: Fixed ROM slots 11432.
    11432, 65476,
// PORT: SOURCE P34-35_P74-75.agc:1330
//		STOVL	RTARG1
// PORT: Fixed ROM slots 11433.
    11433, 24180,
// PORT: SOURCE P34-35_P74-75.agc:1331
//			DELVEET3
// PORT: Fixed ROM slots 11434.
    11434, 2540,
// PORT: SOURCE P34-35_P74-75.agc:1332
//		VSR2
// PORT: Fixed ROM slots 11435.
    11435, 65476,
// PORT: SOURCE P34-35_P74-75.agc:1333
//		STORE	DELVEET3
// PORT: Fixed ROM slots 11436.
    11436, 2540,
// PORT: SOURCE P34-35_P74-75.agc:1334
//INITVELX	LXA,1	DLOAD*
// PORT: Fixed ROM slots 11437.
    11437, 58320,
// PORT: SOURCE P34-35_P74-75.agc:1335
//			RTX1
// PORT: Fixed ROM slots 11438.
    11438, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1336
//			MUTABLE -2,1
// PORT: Fixed ROM slots 11439.
    11439, 8198,
// PORT: SOURCE P34-35_P74-75.agc:1337
//		PUSH	DMP
// PORT: Fixed ROM slots 11440.
    11440, 34060,
// PORT: SOURCE P34-35_P74-75.agc:1338
//			R1A
// PORT: Fixed ROM slots 11441.
    11441, 3012,
// PORT: SOURCE P34-35_P74-75.agc:1339
//		SR1	DDV
// PORT: Fixed ROM slots 11442.
    11442, 47556,
// PORT: SOURCE P34-35_P74-75.agc:1340
//			R1
// PORT: Fixed ROM slots 11443.
    11443, 66,
// PORT: SOURCE P34-35_P74-75.agc:1341
//		STODL	MU/A
// PORT: Fixed ROM slots 11444.
    11444, 16290,
// PORT: SOURCE P34-35_P74-75.agc:1342
//		SR
// PORT: Fixed ROM slots 11445.
    11445, 65378,
// PORT: SOURCE P34-35_P74-75.agc:1343
//			6
// PORT: Fixed ROM slots 11446.
    11446, 17166,
// PORT: SOURCE P34-35_P74-75.agc:1344
//		STORE	MUASTEER
// PORT: Fixed ROM slots 11447.
    11447, 3998,
// PORT: SOURCE P34-35_P74-75.agc:1345
//		SETPD	VLOAD
// PORT: Fixed ROM slots 11448.
    11448, 64770,
// PORT: SOURCE P34-35_P74-75.agc:1346
//			0D
// PORT: Fixed ROM slots 11449.
    11449, 2,
// PORT: SOURCE P34-35_P74-75.agc:1347
//			RTARG1
// PORT: Fixed ROM slots 11450.
    11450, 3700,
// PORT: SOURCE P34-35_P74-75.agc:1348
//		STCALL	RTARG
// PORT: Fixed ROM slots 11451.
    11451, 32328,
// PORT: SOURCE P34-35_P74-75.agc:1349
//			NORMEX
// PORT: Fixed ROM slots 11452.
    11452, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1350
//
// PORT: SOURCE P34-35_P74-75.agc:1351
//# ***** END OF INITVEL ROUTINE *****
// PORT: SOURCE P34-35_P74-75.agc:1352
//
// PORT: SOURCE P34-35_P74-75.agc:1353
//# Page 691
// PORT: SOURCE P34-35_P74-75.agc:1354
//# ***** MIDGIM *****
// PORT: SOURCE P34-35_P74-75.agc:1355
//
// PORT: SOURCE P34-35_P74-75.agc:1356
//# MOD NO. 0, BY WILLMAN, SUBROUTINE RENDGUID, LOG P34-P35, P74-P75
// PORT: SOURCE P34-35_P74-75.agc:1357
//# REVISION 03, 17 FEB 67
// PORT: SOURCE P34-35_P74-75.agc:1358
//#
// PORT: SOURCE P34-35_P74-75.agc:1359
//# IF THE ACTIVE VEHICLE IS DOING THE COMPUTATION, MIDGIM COMPUTES
// PORT: SOURCE P34-35_P74-75.agc:1360
//# THE POSITIVE MIDDLE GIMBAL ANGLE OF THE ACTIVE VEHICLE TO THE INPUT
// PORT: SOURCE P34-35_P74-75.agc:1361
//# DELTA VELOCITY VECTOR (0D IN PUSH LIST), OTHERWISE
// PORT: SOURCE P34-35_P74-75.agc:1362
//# MIDGIM CONVERTS THE INPUT DELTA VELOCITY VECTOR FROM INERTIAL COORDIN-
// PORT: SOURCE P34-35_P74-75.agc:1363
//# ATES TO LOCAL VERTICAL COORDINATES OF THE ACTIVE VEHICLE.
// PORT: SOURCE P34-35_P74-75.agc:1364
//#
// PORT: SOURCE P34-35_P74-75.agc:1365
//# ** INPUTS **
// PORT: SOURCE P34-35_P74-75.agc:1366
//#
// PORT: SOURCE P34-35_P74-75.agc:1367
//#	NAME	MEANING						UNITS/SCALING/MODE
// PORT: SOURCE P34-35_P74-75.agc:1368
//#
// PORT: SOURCE P34-35_P74-75.agc:1369
//#	AVFLAG	INT FLAG -- 0 IS CSM ACTIVE, 1 IS LEM ACTIVE			BIT
// PORT: SOURCE P34-35_P74-75.agc:1370
//#	RINIT	ACTIVE VEHICLE RADIUS VECTOR			METERS/CSEC (+7) VT
// PORT: SOURCE P34-35_P74-75.agc:1371
//#	VINIT	ACTIVE VEHICLE VELOCITY VECTOR			METERS/CSEC (+7) VT
// PORT: SOURCE P34-35_P74-75.agc:1372
//#	0D(PL)	ACTIVE VEHICLE DELTA VELOCITY VECTOR		METERS/CSEC (+7) VT
// PORT: SOURCE P34-35_P74-75.agc:1373
//#
// PORT: SOURCE P34-35_P74-75.agc:1374
//# ** OUTPUTS **
// PORT: SOURCE P34-35_P74-75.agc:1375
//#
// PORT: SOURCE P34-35_P74-75.agc:1376
//#    NAME	MEANING						UNITS/SCALING/MODE
// PORT: SOURCE P34-35_P74-75.agc:1377
//#
// PORT: SOURCE P34-35_P74-75.agc:1378
//#    +MGA	+ MIDDLE GIMBAL ANGLE				REVOLUTIONS (+0) DP
// PORT: SOURCE P34-35_P74-75.agc:1379
//#    DELVLVC	DELTA VELOCITY VECTOR IN LV COORD.		METERS/CSEC (+7) VT
// PORT: SOURCE P34-35_P74-75.agc:1380
//#    MGLVFLAG	INT FLAG: 0 IS +MGA COMPUTED, 1 IS DELVLVC COMP.		BIT
// PORT: SOURCE P34-35_P74-75.agc:1381
//#
// PORT: SOURCE P34-35_P74-75.agc:1382
//# ** CALLING SEQUENCE **
// PORT: SOURCE P34-35_P74-75.agc:1383
//#
// PORT: SOURCE P34-35_P74-75.agc:1384
//#	L 	CALL
// PORT: SOURCE P34-35_P74-75.agc:1385
//#	L+1		MIDGIM
// PORT: SOURCE P34-35_P74-75.agc:1386
//#	L+2	(RETURN -- ALWAYS)
// PORT: SOURCE P34-35_P74-75.agc:1387
//#
// PORT: SOURCE P34-35_P74-75.agc:1388
//# ** NO SUBROUTINES CALLED **
// PORT: SOURCE P34-35_P74-75.agc:1389
//#
// PORT: SOURCE P34-35_P74-75.agc:1390
//# ** DEBRIS -- ERASABLE TEMPORARY USAGE **
// PORT: SOURCE P34-35_P74-75.agc:1391
//#
// PORT: SOURCE P34-35_P74-75.agc:1392
//#	A,Q,L, PUSH LIST, MPAC.
// PORT: SOURCE P34-35_P74-75.agc:1393
//#
// PORT: SOURCE P34-35_P74-75.agc:1394
//# ** ALARMS -- NONE **
// PORT: SOURCE P34-35_P74-75.agc:1395
//
// PORT: SOURCE P34-35_P74-75.agc:1396
//# Page 692
// PORT: SOURCE P34-35_P74-75.agc:1397
//# MIDDLE GIMBAL ANGLE COMPUTATION.
// PORT: SOURCE P34-35_P74-75.agc:1398
//
// PORT: SOURCE P34-35_P74-75.agc:1399
//		SETLOC	MIDDGIM
// PORT: SOURCE P34-35_P74-75.agc:1400
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:1401
//
// PORT: SOURCE P34-35_P74-75.agc:1402
//		COUNT*	$$/MIDG
// PORT: SOURCE P34-35_P74-75.agc:1403
//
// PORT: SOURCE P34-35_P74-75.agc:1404
//HALFREV		2DEC	1 B-1
// PORT: Fixed ROM slots 9165 9166.
    9165, 16384, 9166, 0,
// PORT: SOURCE P34-35_P74-75.agc:1405
//
// PORT: SOURCE P34-35_P74-75.agc:1406
//GET+MGA		VLOAD	UNIT		# (PL 0D) V (+7) TO MPAC UNITIZE UV (+1)
// PORT: Fixed ROM slots 9167.
    9167, 44794,
// PORT: SOURCE P34-35_P74-75.agc:1407
//		UNIT
// PORT: Fixed ROM slots 9168.
    9168, 65372,
// PORT: SOURCE P34-35_P74-75.agc:1408
//		DOT	SL1		# DOT UV WITH Y(STABLE MEMBER) AND RESCALE
// PORT: Fixed ROM slots 9169.
    9169, 59970,
// PORT: SOURCE P34-35_P74-75.agc:1409
//			REFSMMAT +6	# FROM +2 TO +1 FOR ASIN ROUTINE
// PORT: Fixed ROM slots 9170.
    9170, 1988,
// PORT: SOURCE P34-35_P74-75.agc:1410
//		ARCSIN	BPL
// PORT: Fixed ROM slots 9171.
    9171, 42172,
// PORT: SOURCE P34-35_P74-75.agc:1411
//			SETMGA
// PORT: Fixed ROM slots 9172.
    9172, 14256,
// PORT: SOURCE P34-35_P74-75.agc:1412
//		DAD	DAD		# CONVERT -MGA TO +MGA BY
// PORT: Fixed ROM slots 9173.
    9173, 36122,
// PORT: SOURCE P34-35_P74-75.agc:1413
//			HALFREV		# ADDING ONE REVOLUTION
// PORT: Fixed ROM slots 9174.
    9174, 14236,
// PORT: SOURCE P34-35_P74-75.agc:1414
//			HALFREV
// PORT: Fixed ROM slots 9175.
    9175, 14236,
// PORT: SOURCE P34-35_P74-75.agc:1415
//SETMGA		STORE	+MGA
// PORT: Fixed ROM slots 9176.
    9176, 2390
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1416
//		CLR	RVQ		# CLEAR MGLVFLAG TO INDICATE +MGA CALC
// PORT: Fixed ROM slots 9177.
    9177, 36376,
// PORT: SOURCE P34-35_P74-75.agc:1417
//			MGLVFLAG	# AND EXIT
// PORT: Fixed ROM slots 9178.
    9178, 2938,
// PORT: SOURCE P34-35_P74-75.agc:1418
//GET.LVC		VLOAD	UNIT		# (PL 6D) R (+29) IN MPAC UNITIZE UR
// PORT: Fixed ROM slots 9179.
    9179, 44794,
// PORT: SOURCE P34-35_P74-75.agc:1419
//			RINIT
// PORT: Fixed ROM slots 9180.
    9180, 2470,
// PORT: SOURCE P34-35_P74-75.agc:1420
//		VCOMP			# U(-R)
// PORT: Fixed ROM slots 9181.
    9181, 65404,
// PORT: SOURCE P34-35_P74-75.agc:1421
//		STORE	18D		# U(-R) TO 18D
// PORT: Fixed ROM slots 9182.
    9182, 38,
// PORT: SOURCE P34-35_P74-75.agc:1422
//		VXV	UNIT		# U(-R)*V EQ V*U(R), U(V*R)
// PORT: Fixed ROM slots 9183.
    9183, 44602,
// PORT: SOURCE P34-35_P74-75.agc:1423
//			VINIT
// PORT: Fixed ROM slots 9184.
    9184, 2482,
// PORT: SOURCE P34-35_P74-75.agc:1424
//		STORE	12D		# U(V*R) TO 12D
// PORT: Fixed ROM slots 9185.
    9185, 26,
// PORT: SOURCE P34-35_P74-75.agc:1425
//		VXV	UNIT		# U(V*R)*U(-R), U((V*R)*(-R))
// PORT: Fixed ROM slots 9186.
    9186, 44602,
// PORT: SOURCE P34-35_P74-75.agc:1426
//			18D
// PORT: Fixed ROM slots 9187.
    9187, 38,
// PORT: SOURCE P34-35_P74-75.agc:1427
//		STOVL	6D		# TRANSFORMATION MATRIX IS IN 6D (+1)
// PORT: Fixed ROM slots 9188.
    9188, 20494,
// PORT: SOURCE P34-35_P74-75.agc:1428
//			0D		# DELTA V (+7) IN 0D
// PORT: Fixed ROM slots 9189.
    9189, 2,
// PORT: SOURCE P34-35_P74-75.agc:1429
//		MXV	VSL1		# CONVERT FROM INER COOR TO LV COOR (+8)
// PORT: Fixed ROM slots 9190.
    9190, 64162,
// PORT: SOURCE P34-35_P74-75.agc:1430
//			6D		# AND SCALE +7 IN MPAC
// PORT: Fixed ROM slots 9191.
    9191, 14,
// PORT: SOURCE P34-35_P74-75.agc:1431
//		STORE	DELVLVC		# STORE IN DELVLVC (+7)
// PORT: Fixed ROM slots 9192.
    9192, 3640,
// PORT: SOURCE P34-35_P74-75.agc:1432
//		SET	RVQ		# SET MGLVFLAG TO INDICATE LVC CALC
// PORT: Fixed ROM slots 9193.
    9193, 36376,
// PORT: SOURCE P34-35_P74-75.agc:1433
//			MGLVFLAG	# AND EXIT
// PORT: Fixed ROM slots 9194.
    9194, 2682,
// PORT: SOURCE P34-35_P74-75.agc:1434
//
// PORT: SOURCE P34-35_P74-75.agc:1435
//# ***** END OF MIDGIM ROUTINE *****
// PORT: SOURCE P34-35_P74-75.agc:1436
//
// PORT: SOURCE P34-35_P74-75.agc:1437
//# Page 693
// PORT: SOURCE P34-35_P74-75.agc:1438
//		BANK	10
// PORT: SOURCE P34-35_P74-75.agc:1439
//		SETLOC	SLCTMU
// PORT: SOURCE P34-35_P74-75.agc:1440
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:1441
//		COUNT*	$$/MIDG
// PORT: SOURCE P34-35_P74-75.agc:1442
//
// PORT: SOURCE P34-35_P74-75.agc:1443
//SELECTMU	AXC,1	AXT,2
// PORT: Fixed ROM slots 10240.
    10240, 64736,
// PORT: SOURCE P34-35_P74-75.agc:1444
//			2D
// PORT: Fixed ROM slots 10241.
    10241, 4,
// PORT: SOURCE P34-35_P74-75.agc:1445
//			0D
// PORT: Fixed ROM slots 10242.
    10242, 0,
// PORT: SOURCE P34-35_P74-75.agc:1446
//		BOFF
// PORT: Fixed ROM slots 10243.
    10243, 65304,
// PORT: SOURCE P34-35_P74-75.agc:1447
//			CMOONFLG
// PORT: Fixed ROM slots 10244.
    10244, 4550,
// PORT: SOURCE P34-35_P74-75.agc:1448
//			SETMUER
// PORT: Fixed ROM slots 10245.
    10245, 16402,
// PORT: SOURCE P34-35_P74-75.agc:1449
//		AXC,1	AXT,2
// PORT: Fixed ROM slots 10246.
    10246, 64736,
// PORT: SOURCE P34-35_P74-75.agc:1450
//			10D
// PORT: Fixed ROM slots 10247.
    10247, 20,
// PORT: SOURCE P34-35_P74-75.agc:1451
//			2D
// PORT: Fixed ROM slots 10248.
    10248, 4,
// PORT: SOURCE P34-35_P74-75.agc:1452
//SETMUER		DLOAD*	SXA,1
// PORT: Fixed ROM slots 10249.
    10249, 55494,
// PORT: SOURCE P34-35_P74-75.agc:1453
//			MUTABLE +4,1
// PORT: Fixed ROM slots 10250.
    10250, 8210,
// PORT: SOURCE P34-35_P74-75.agc:1454
//			RTX1
// PORT: Fixed ROM slots 10251.
    10251, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1455
//		STODL*	RTSR1/MU
// PORT: Fixed ROM slots 10252.
    10252, 18846,
// PORT: SOURCE P34-35_P74-75.agc:1456
//			MUTABLE -2,1
// PORT: Fixed ROM slots 10253.
    10253, 8198,
// PORT: SOURCE P34-35_P74-75.agc:1457
//		BOFF	SR
// PORT: Fixed ROM slots 10254.
    10254, 45336,
// PORT: SOURCE P34-35_P74-75.agc:1458
//			CMOONFLG
// PORT: Fixed ROM slots 10255.
    10255, 4550,
// PORT: SOURCE P34-35_P74-75.agc:1459
//			RTRNMU
// PORT: Fixed ROM slots 10256.
    10256, 16420,
// PORT: SOURCE P34-35_P74-75.agc:1460
//			6D
// PORT: Fixed ROM slots 10257.
    10257, 17166,
// PORT: SOURCE P34-35_P74-75.agc:1461
//RTRNMU		STORE	RTMU
// PORT: Fixed ROM slots 10258.
    10258, 2466,
// PORT: SOURCE P34-35_P74-75.agc:1462
//		SXA,2	CLEAR
// PORT: Fixed ROM slots 10259.
    10259, 36024,
// PORT: SOURCE P34-35_P74-75.agc:1463
//			RTX2
// PORT: Fixed ROM slots 10260.
    10260, 3070,
// PORT: SOURCE P34-35_P74-75.agc:1464
//			FINALFLG
// PORT: Fixed ROM slots 10261.
    10261, 1394,
// PORT: SOURCE P34-35_P74-75.agc:1465
//		GOTO
// PORT: Fixed ROM slots 10262.
    10262, 65360,
// PORT: SOURCE P34-35_P74-75.agc:1466
//			VN1645
// PORT: Fixed ROM slots 10263.
    10263, 61196,
// PORT: SOURCE P34-35_P74-75.agc:1467
//
// PORT: SOURCE P34-35_P74-75.agc:1468
//# Page 694
// PORT: SOURCE P34-35_P74-75.agc:1469
//# ***** PERIAPO *****
// PORT: SOURCE P34-35_P74-75.agc:1470
//#
// PORT: SOURCE P34-35_P74-75.agc:1471
//# MOD NO -1			LOG SECTION -- P34-P35, P74-P75
// PORT: SOURCE P34-35_P74-75.agc:1472
//# MOD BY WHITE, P.		DATE 18 JAN 68
// PORT: SOURCE P34-35_P74-75.agc:1473
//#
// PORT: SOURCE P34-35_P74-75.agc:1474
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P34-35_P74-75.agc:1475
//#
// PORT: SOURCE P34-35_P74-75.agc:1476
//#	THIS SUBROUTINE COMPUTES THE TWO BODY APOCENTER AND PERICENTER
// PORT: SOURCE P34-35_P74-75.agc:1477
//#	ALTITUDES GIVEN THE POSITION AND VELOCITY VECTORS FOR A POINT ON
// PORT: SOURCE P34-35_P74-75.agc:1478
//#	TRAJECTORY AND THE PRIMARY BODY.
// PORT: SOURCE P34-35_P74-75.agc:1479
//#
// PORT: SOURCE P34-35_P74-75.agc:1480
//#	SETRAD IS CALLED TO DETERMINE THE RADIUS OF THE PRIMARY BODY.
// PORT: SOURCE P34-35_P74-75.agc:1481
//#
// PORT: SOURCE P34-35_P74-75.agc:1482
//#	APSIDES IS CALLED TO SOVE FOR THE TWO BODY RADII OF APOCENTER AND
// PORT: SOURCE P34-35_P74-75.agc:1483
//#	PERICENTER AND THE ECCENTRICITY OF THE TRAJECTORY.
// PORT: SOURCE P34-35_P74-75.agc:1484
//#
// PORT: SOURCE P34-35_P74-75.agc:1485
//# CALLING SEQUENCE
// PORT: SOURCE P34-35_P74-75.agc:1486
//#
// PORT: SOURCE P34-35_P74-75.agc:1487
//#	L	CALL
// PORT: SOURCE P34-35_P74-75.agc:1488
//#	L+1		PERIAPO
// PORT: SOURCE P34-35_P74-75.agc:1489
//#	L+2	(RETURN -- ALWAYS)
// PORT: SOURCE P34-35_P74-75.agc:1490
//#
// PORT: SOURCE P34-35_P74-75.agc:1491
//# INPUT
// PORT: SOURCE P34-35_P74-75.agc:1492
//#
// PORT: SOURCE P34-35_P74-75.agc:1493
//#	(1)	RVEC	POSITION VECTOR IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1494
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1495
//#	(2)	VVEC	VELOCITY VECTOR IN METERS/CENTISECOND
// PORT: SOURCE P34-35_P74-75.agc:1496
//#			SCALE FACTOR -- EARTH +7, MOON +5
// PORT: SOURCE P34-35_P74-75.agc:1497
//#	(3)	X1	PRIMARY BODY INDICATOR
// PORT: SOURCE P34-35_P74-75.agc:1498
//#			EARTH -1, MOON -10
// PORT: SOURCE P34-35_P74-75.agc:1499
//#
// PORT: SOURCE P34-35_P74-75.agc:1500
//# OUTPUT
// PORT: SOURCE P34-35_P74-75.agc:1501
//#
// PORT: SOURCE P34-35_P74-75.agc:1502
//#	(1)	2D	APOCENTER RADIUS IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1503
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1504
//#	(2)	4D	APOCENTER ALTITUDE IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1505
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1506
//#	(3)	6D	PERICENTER RADIUS IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1507
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1508
//#	(4)	8D	PERICENTER ALTITUDE IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1509
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1510
//#	(5)	ECC	ECCENTRICITY OF CONIC TRAJECTORY
// PORT: SOURCE P34-35_P74-75.agc:1511
//#			SCALE FACTOR -- +3
// PORT: SOURCE P34-35_P74-75.agc:1512
//#	(6)	XXXALT	RADIUS OF THE PRIMARY BODY IN METERS
// PORT: SOURCE P34-35_P74-75.agc:1513
//#			SCALE FACTOR -- EARTH +29, MOON +27
// PORT: SOURCE P34-35_P74-75.agc:1514
//#	(7)	PUSHLOC	EQUALS 10D
// PORT: SOURCE P34-35_P74-75.agc:1515
//#
// PORT: SOURCE P34-35_P74-75.agc:1516
//# SUBROUTINES USED
// PORT: SOURCE P34-35_P74-75.agc:1517
//#
// PORT: SOURCE P34-35_P74-75.agc:1518
//#	SETRAD
// PORT: SOURCE P34-35_P74-75.agc:1519
//# Page 695
// PORT: SOURCE P34-35_P74-75.agc:1520
//#	APSIDES
// PORT: SOURCE P34-35_P74-75.agc:1521
//
// PORT: SOURCE P34-35_P74-75.agc:1522
//		SETLOC	APOPERI
// PORT: SOURCE P34-35_P74-75.agc:1523
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:1524
//
// PORT: SOURCE P34-35_P74-75.agc:1525
//		COUNT*	$$/PERAP
// PORT: SOURCE P34-35_P74-75.agc:1526
//
// PORT: SOURCE P34-35_P74-75.agc:1527
//RPAD		2DEC	6373338 B-29	# STANDARD RADIUS OF PAD 37-B.
// PORT: Fixed ROM slots 21708 21709.
    21708, 388, 21709, 16346,
// PORT: SOURCE P34-35_P74-75.agc:1528
//					# = 20 909 901.57 FT
// PORT: SOURCE P34-35_P74-75.agc:1529
//
// PORT: SOURCE P34-35_P74-75.agc:1530
//PERIAPO1	LXA,2	VSR*
// PORT: Fixed ROM slots 21710.
    21710, 45016,
// PORT: SOURCE P34-35_P74-75.agc:1531
//			RTX2
// PORT: Fixed ROM slots 21711.
    21711, 3070,
// PORT: SOURCE P34-35_P74-75.agc:1532
//			0,2
// PORT: Fixed ROM slots 21712.
    21712, 48380,
// PORT: SOURCE P34-35_P74-75.agc:1533
//		STOVL	VVEC
// PORT: Fixed ROM slots 21713.
    21713, 23496,
// PORT: SOURCE P34-35_P74-75.agc:1534
//		LXA,1	VSR*
// PORT: Fixed ROM slots 21714.
    21714, 45008,
// PORT: SOURCE P34-35_P74-75.agc:1535
//			RTX1
// PORT: Fixed ROM slots 21715.
    21715, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1536
//			0,2
// PORT: Fixed ROM slots 21716.
    21716, 48380,
// PORT: SOURCE P34-35_P74-75.agc:1537
//		STORE	RVEC
// PORT: Fixed ROM slots 21717.
    21717, 2906,
// PORT: SOURCE P34-35_P74-75.agc:1538
//PERIAPO		STQ	CALL
// PORT: Fixed ROM slots 21718.
    21718, 37920,
// PORT: SOURCE P34-35_P74-75.agc:1539
//			NORMEX
// PORT: Fixed ROM slots 21719.
    21719, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1540
//			SETRAD
// PORT: Fixed ROM slots 21720.
    21720, 39368,
// PORT: SOURCE P34-35_P74-75.agc:1541
//		STCALL	XXXALT
// PORT: Fixed ROM slots 21721.
    21721, 32626,
// PORT: SOURCE P34-35_P74-75.agc:1542
//			APSIDES
// PORT: Fixed ROM slots 21722.
    21722, 22392,
// PORT: SOURCE P34-35_P74-75.agc:1543
//		SETPD	PUSH		# 2D = APOCENTER RADIUS		B29 OR B27
// PORT: Fixed ROM slots 21723.
    21723, 34306
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1544
//			2D
// PORT: Fixed ROM slots 21724.
    21724, 6,
// PORT: SOURCE P34-35_P74-75.agc:1545
//		DSU	PDDL		# 4D = APOGEE ALTITUDE 		B29 OR B27
// PORT: Fixed ROM slots 21725.
    21725, 54570,
// PORT: SOURCE P34-35_P74-75.agc:1546
//			XXXALT
// PORT: Fixed ROM slots 21726.
    21726, 3954,
// PORT: SOURCE P34-35_P74-75.agc:1547
//			0D
// PORT: Fixed ROM slots 21727.
    21727, 2,
// PORT: SOURCE P34-35_P74-75.agc:1548
//		PUSH	DSU		# 6D = PERICENTER RADIUS	B29 OR B27
// PORT: Fixed ROM slots 21728.
    21728, 38156,
// PORT: SOURCE P34-35_P74-75.agc:1549
//			XXXALT
// PORT: Fixed ROM slots 21729.
    21729, 3954,
// PORT: SOURCE P34-35_P74-75.agc:1550
//		PUSH	GOTO		# 8D = PERIGEE ALTITUDE 	B29 OR B27
// PORT: Fixed ROM slots 21730.
    21730, 43020,
// PORT: SOURCE P34-35_P74-75.agc:1551
//			NORMEX
// PORT: Fixed ROM slots 21731.
    21731, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1552
//
// PORT: SOURCE P34-35_P74-75.agc:1553
//# Page 696
// PORT: SOURCE P34-35_P74-75.agc:1554
//SETRAD		DLOAD	PUSH
// PORT: Fixed ROM slots 21732.
    21732, 34506,
// PORT: SOURCE P34-35_P74-75.agc:1555
//			RPAD
// PORT: Fixed ROM slots 21733.
    21733, 6554,
// PORT: SOURCE P34-35_P74-75.agc:1556
//		SXA,1	INCR,2
// PORT: Fixed ROM slots 21734.
    21734, 52400,
// PORT: SOURCE P34-35_P74-75.agc:1557
//			X2
// PORT: Fixed ROM slots 21735.
    21735, 78,
// PORT: SOURCE P34-35_P74-75.agc:1558
//			2D
// PORT: Fixed ROM slots 21736.
    21736, 4,
// PORT: SOURCE P34-35_P74-75.agc:1559
//		SLOAD	BHIZ
// PORT: Fixed ROM slots 21737.
    21737, 39098,
// PORT: SOURCE P34-35_P74-75.agc:1560
//			X2
// PORT: Fixed ROM slots 21738.
    21738, 80,
// PORT: SOURCE P34-35_P74-75.agc:1561
//			SETRADX
// PORT: Fixed ROM slots 21739.
    21739, 39390,
// PORT: SOURCE P34-35_P74-75.agc:1562
//		VLOAD	ABVAL
// PORT: Fixed ROM slots 21740.
    21740, 42746,
// PORT: SOURCE P34-35_P74-75.agc:1563
//			RLS
// PORT: Fixed ROM slots 21741.
    21741, 2086,
// PORT: SOURCE P34-35_P74-75.agc:1564
//		PDDL
// PORT: Fixed ROM slots 21742.
    21742, 65450,
// PORT: SOURCE P34-35_P74-75.agc:1565
//SETRADX		DLOAD	RVQ
// PORT: Fixed ROM slots 21743.
    21743, 36554,
// PORT: SOURCE P34-35_P74-75.agc:1566
//
// PORT: SOURCE P34-35_P74-75.agc:1567
//# Page 697
// PORT: SOURCE P34-35_P74-75.agc:1568
//PRECSET		STQ
// PORT: Fixed ROM slots 21744.
    21744, 65312,
// PORT: SOURCE P34-35_P74-75.agc:1569
//			NORMEX
// PORT: Fixed ROM slots 21745.
    21745, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1570
//		STCALL	TDEC2
// PORT: Fixed ROM slots 21746.
    21746, 32504,
// PORT: SOURCE P34-35_P74-75.agc:1571
//			LEMPREC
// PORT: Fixed ROM slots 21747.
    21747, 23646,
// PORT: SOURCE P34-35_P74-75.agc:1572
//		CALL
// PORT: Fixed ROM slots 21748.
    21748, 65320,
// PORT: SOURCE P34-35_P74-75.agc:1573
//			LEMSTORE
// PORT: Fixed ROM slots 21749.
    21749, 39420,
// PORT: SOURCE P34-35_P74-75.agc:1574
//		DLOAD
// PORT: Fixed ROM slots 21750.
    21750, 65482,
// PORT: SOURCE P34-35_P74-75.agc:1575
//			TDEC2
// PORT: Fixed ROM slots 21751.
    21751, 3832,
// PORT: SOURCE P34-35_P74-75.agc:1576
//		STCALL	TDEC1
// PORT: Fixed ROM slots 21752.
    21752, 28738,
// PORT: SOURCE P34-35_P74-75.agc:1577
//			CSMPREC
// PORT: Fixed ROM slots 21753.
    21753, 23622,
// PORT: SOURCE P34-35_P74-75.agc:1578
//		CALL
// PORT: Fixed ROM slots 21754.
    21754, 65320,
// PORT: SOURCE P34-35_P74-75.agc:1579
//			CSMSTORE
// PORT: Fixed ROM slots 21755.
    21755, 39436,
// PORT: SOURCE P34-35_P74-75.agc:1580
//		GOTO
// PORT: Fixed ROM slots 21756.
    21756, 65360,
// PORT: SOURCE P34-35_P74-75.agc:1581
//			NORMEX
// PORT: Fixed ROM slots 21757.
    21757, 3686,
// PORT: SOURCE P34-35_P74-75.agc:1582
//LEMSTORE	VLOAD	BOFF
// PORT: Fixed ROM slots 21758.
    21758, 36090,
// PORT: SOURCE P34-35_P74-75.agc:1583
//			RATT
// PORT: Fixed ROM slots 21759.
    21759, 2,
// PORT: SOURCE P34-35_P74-75.agc:1584
//			AVFLAG
// PORT: Fixed ROM slots 21760.
    21760, 1492,
// PORT: SOURCE P34-35_P74-75.agc:1585
//			PASSIVE
// PORT: Fixed ROM slots 21761.
    21761, 39444,
// PORT: SOURCE P34-35_P74-75.agc:1586
//ACTIVE		STOVL	RACT3
// PORT: Fixed ROM slots 21762.
    21762, 24252,
// PORT: SOURCE P34-35_P74-75.agc:1587
//			VATT
// PORT: Fixed ROM slots 21763.
    21763, 14,
// PORT: SOURCE P34-35_P74-75.agc:1588
//		STORE	VACT3
// PORT: Fixed ROM slots 21764.
    21764, 3784,
// PORT: SOURCE P34-35_P74-75.agc:1589
//		RVQ
// PORT: Fixed ROM slots 21765.
    21765, 65308,
// PORT: SOURCE P34-35_P74-75.agc:1590
//CSMSTORE	VLOAD	BOFF
// PORT: Fixed ROM slots 21766.
    21766, 36090,
// PORT: SOURCE P34-35_P74-75.agc:1591
//			RATT
// PORT: Fixed ROM slots 21767.
    21767, 2,
// PORT: SOURCE P34-35_P74-75.agc:1592
//			AVFLAG
// PORT: Fixed ROM slots 21768.
    21768, 1492,
// PORT: SOURCE P34-35_P74-75.agc:1593
//			ACTIVE
// PORT: Fixed ROM slots 21769.
    21769, 39428,
// PORT: SOURCE P34-35_P74-75.agc:1594
//PASSIVE		STOVL	RPASS3
// PORT: Fixed ROM slots 21770.
    21770, 24276,
// PORT: SOURCE P34-35_P74-75.agc:1595
//			VATT
// PORT: Fixed ROM slots 21771.
    21771, 14,
// PORT: SOURCE P34-35_P74-75.agc:1596
//		STORE	VPASS3
// PORT: Fixed ROM slots 21772.
    21772, 3808,
// PORT: SOURCE P34-35_P74-75.agc:1597
//		RVQ
// PORT: Fixed ROM slots 21773.
    21773, 65308,
// PORT: SOURCE P34-35_P74-75.agc:1598
//
// PORT: SOURCE P34-35_P74-75.agc:1599
//# Page 698
// PORT: SOURCE P34-35_P74-75.agc:1600
//VECSHIFT	LXA,2	VSR*
// PORT: Fixed ROM slots 21774.
    21774, 45016,
// PORT: SOURCE P34-35_P74-75.agc:1601
//			RTX2
// PORT: Fixed ROM slots 21775.
    21775, 3070,
// PORT: SOURCE P34-35_P74-75.agc:1602
//			0,2
// PORT: Fixed ROM slots 21776.
    21776, 48380,
// PORT: SOURCE P34-35_P74-75.agc:1603
//		LXA,1	PDVL
// PORT: Fixed ROM slots 21777.
    21777, 52688,
// PORT: SOURCE P34-35_P74-75.agc:1604
//			RTX1
// PORT: Fixed ROM slots 21778.
    21778, 3068,
// PORT: SOURCE P34-35_P74-75.agc:1605
//		VSR*	PDVL
// PORT: Fixed ROM slots 21779.
    21779, 52574,
// PORT: SOURCE P34-35_P74-75.agc:1606
//			0,2
// PORT: Fixed ROM slots 21780.
    21780, 48380,
// PORT: SOURCE P34-35_P74-75.agc:1607
//		RVQ
// PORT: Fixed ROM slots 21781.
    21781, 65308,
// PORT: SOURCE P34-35_P74-75.agc:1608
//
// PORT: SOURCE P34-35_P74-75.agc:1609
//# Page 699
// PORT: SOURCE P34-35_P74-75.agc:1610
//SHIFTR1		LXA,2	SL*
// PORT: Fixed ROM slots 21782.
    21782, 45016,
// PORT: SOURCE P34-35_P74-75.agc:1611
//			RTX2
// PORT: Fixed ROM slots 21783.
    21783, 3070,
// PORT: SOURCE P34-35_P74-75.agc:1612
//			0,2
// PORT: Fixed ROM slots 21784.
    21784, 48892,
// PORT: SOURCE P34-35_P74-75.agc:1613
//		RVQ
// PORT: Fixed ROM slots 21785.
    21785, 65308
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6574–6578.
function agcAotUnit392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6575 {
        if slot <= 6574 {
// PORT: SOURCE P34-35_P74-75.agc:1614
//
// PORT: SOURCE P34-35_P74-75.agc:1615
//# Page 700
// PORT: SOURCE P34-35_P74-75.agc:1616
//# PROGRAM DESCRIPTION
// PORT: SOURCE P34-35_P74-75.agc:1617
//# SUBROUTINE NAME	R36	OUT-OF-PLANE RENDEZVOUS ROUTINE
// PORT: SOURCE P34-35_P74-75.agc:1618
//# MOD NO. 0		DATE 	22 DECEMBER 67
// PORT: SOURCE P34-35_P74-75.agc:1619
//# MOD BY N.M.NEVILLE	LOG SECTION EXTENDED VERBS
// PORT: SOURCE P34-35_P74-75.agc:1620
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P34-35_P74-75.agc:1621
//#
// PORT: SOURCE P34-35_P74-75.agc:1622
//# TO DISPLAY AT ASTRONAUT REQUEST LGC CALCULATED RENDEZVOUS
// PORT: SOURCE P34-35_P74-75.agc:1623
//# OUT-OF-PLANE PARAMETERS (Y, YDOT, PSI).  (REQUESTED BY DSKY).
// PORT: SOURCE P34-35_P74-75.agc:1624
//#
// PORT: SOURCE P34-35_P74-75.agc:1625
//# CALLING SEQUENCE
// PORT: SOURCE P34-35_P74-75.agc:1626
//#
// PORT: SOURCE P34-35_P74-75.agc:1627
//#	ASTRONAUT REQUEST THROUGH DSKY V 90 E
// PORT: SOURCE P34-35_P74-75.agc:1628
//#
// PORT: SOURCE P34-35_P74-75.agc:1629
//# SUBROUTINES CALLED
// PORT: SOURCE P34-35_P74-75.agc:1630
//#
// PORT: SOURCE P34-35_P74-75.agc:1631
//#	EXDSPRET
// PORT: SOURCE P34-35_P74-75.agc:1632
//#	GOMARKF
// PORT: SOURCE P34-35_P74-75.agc:1633
//#	CSMPREC
// PORT: SOURCE P34-35_P74-75.agc:1634
//#	LEMPREC
// PORT: SOURCE P34-35_P74-75.agc:1635
//#	SGNAGREE
// PORT: SOURCE P34-35_P74-75.agc:1636
//#	LOADTIME
// PORT: SOURCE P34-35_P74-75.agc:1637
//#
// PORT: SOURCE P34-35_P74-75.agc:1638
//# NORMAL EXIT MODES
// PORT: SOURCE P34-35_P74-75.agc:1639
//#
// PORT: SOURCE P34-35_P74-75.agc:1640
//#	ASTRONAUT REQUEST THROUGH DSKY TO TERMINATE PROGRAM V 34 E
// PORT: SOURCE P34-35_P74-75.agc:1641
//#
// PORT: SOURCE P34-35_P74-75.agc:1642
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P34-35_P74-75.agc:1643
//#
// PORT: SOURCE P34-35_P74-75.agc:1644
//#	NONE
// PORT: SOURCE P34-35_P74-75.agc:1645
//#
// PORT: SOURCE P34-35_P74-75.agc:1646
//# OUTPUT
// PORT: SOURCE P34-35_P74-75.agc:1647
//#
// PORT: SOURCE P34-35_P74-75.agc:1648
//#	DECIMAL DISPLAY OF TIME, Y, YDOT AND PSI
// PORT: SOURCE P34-35_P74-75.agc:1649
//#
// PORT: SOURCE P34-35_P74-75.agc:1650
//#	DISPLAYED VALUES Y, YDOT, AND PSI, ARE STORED IN ERASABLE
// PORT: SOURCE P34-35_P74-75.agc:1651
//#	REGISTERS RANGE, RRATE, AND RTHETA RESPECTIVELY.
// PORT: SOURCE P34-35_P74-75.agc:1652
//#
// PORT: SOURCE P34-35_P74-75.agc:1653
//# ERASABLE INITIALIZATION REQUIRED
// PORT: SOURCE P34-35_P74-75.agc:1654
//#
// PORT: SOURCE P34-35_P74-75.agc:1655
//#	CSM AND LEM STATE VECTORS
// PORT: SOURCE P34-35_P74-75.agc:1656
//#
// PORT: SOURCE P34-35_P74-75.agc:1657
//# DEBRIS
// PORT: SOURCE P34-35_P74-75.agc:1658
//#
// PORT: SOURCE P34-35_P74-75.agc:1659
//#	CENTRALS A,Q,L
// PORT: SOURCE P34-35_P74-75.agc:1660
//#	OTHER:  THOSE USED BY THE ABOVE LISTED SUBROUTINES
// PORT: SOURCE P34-35_P74-75.agc:1661
//
// PORT: SOURCE P34-35_P74-75.agc:1662
//		BANK	20
// PORT: SOURCE P34-35_P74-75.agc:1663
//		SETLOC	R36LM
// PORT: SOURCE P34-35_P74-75.agc:1664
//		BANK
// PORT: SOURCE P34-35_P74-75.agc:1665
//# Page 701
// PORT: SOURCE P34-35_P74-75.agc:1666
//		EBANK=	RPASS36
// PORT: SOURCE P34-35_P74-75.agc:1667
//
// PORT: SOURCE P34-35_P74-75.agc:1668
//		COUNT*	$$/R36
// PORT: SOURCE P34-35_P74-75.agc:1669
//
// PORT: SOURCE P34-35_P74-75.agc:1670
//R36		ZL
// PORT: Fixed ROM slots 6574.
            if slot <> 6574 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P34-35_P74-75.agc:1671
//		CAF	ZERO		# SET TIME OF EVENT TO ZERO FOR FIRST
// PORT: Fixed ROM slots 6575.
            if slot <> 6575 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6576 {
// PORT: SOURCE P34-35_P74-75.agc:1672
//		DXCH	DSPTEMX		# DISPLAY
// PORT: Fixed ROM slots 6576.
            if slot <> 6576 or instruction <> 22058 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6577 {
// PORT: SOURCE P34-35_P74-75.agc:1673
//		CAF	V06N16N
// PORT: Fixed ROM slots 6577.
                if slot <> 6577 or instruction <> 13833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1545), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1674
//		TC	BANKCALL
// PORT: Fixed ROM slots 6578.
                if slot <> 6578 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[392] to agcAotUnit392@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1675
//		CADR	GOMARKF
// PORT: Fixed ROM slots 6579.
    6579, 16824
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6580–6587.
function agcAotUnit393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6583 {
        if slot <= 6581 {
            if slot <= 6580 {
// PORT: SOURCE P34-35_P74-75.agc:1676
//		TCF	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 6580.
                if slot <> 6580 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1677
//		TCF	+2		# PROCEED
// PORT: Fixed ROM slots 6581.
                if slot <> 6581 or instruction <> 5559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6582 {
// PORT: SOURCE P34-35_P74-75.agc:1678
//		TCF	-5		# RECYCLE FOR ASTRONAUT INPUT TIME
// PORT: Fixed ROM slots 6582.
                if slot <> 6582 or instruction <> 5553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1679
//		DXCH	DSPTEMX
// PORT: Fixed ROM slots 6583.
                if slot <> 6583 or instruction <> 22058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6585 {
            if slot <= 6584 {
// PORT: SOURCE P34-35_P74-75.agc:1680
//		EXTEND
// PORT: Fixed ROM slots 6584.
                if slot <> 6584 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1681
//		BZF	LREGCHK		# A-REG ZERO GOTO CHECK L-REG FOR ZERO
// PORT: Fixed ROM slots 6585.
                if slot <> 6585 or instruction <> 5632 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5632, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6586 {
// PORT: SOURCE P34-35_P74-75.agc:1682
//ASTROTIM	DXCH	MPAC		# A-REG NON-ZERO, TIME = ASTRO INPUT TIME
// PORT: Fixed ROM slots 6586.
                if slot <> 6586 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1683
//		TC	INTPRET
// PORT: Fixed ROM slots 6587.
                if slot <> 6587 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[393] to agcAotUnit393@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1684
//		RTB
// PORT: Fixed ROM slots 6588.
    6588, 65336,
// PORT: SOURCE P34-35_P74-75.agc:1685
//			DPMODE
// PORT: Fixed ROM slots 6589.
    6589, 18332,
// PORT: SOURCE P34-35_P74-75.agc:1686
//R36INT		STCALL	TDEC1
// PORT: Fixed ROM slots 6590.
    6590, 28738,
// PORT: SOURCE P34-35_P74-75.agc:1687
//			OTHPREC
// PORT: Fixed ROM slots 6591.
    6591, 23622,
// PORT: SOURCE P34-35_P74-75.agc:1688
//		VLOAD	PDVL
// PORT: Fixed ROM slots 6592.
    6592, 52730,
// PORT: SOURCE P34-35_P74-75.agc:1689
//			VATT
// PORT: Fixed ROM slots 6593.
    6593, 14,
// PORT: SOURCE P34-35_P74-75.agc:1690
//			RATT		# _
// PORT: Fixed ROM slots 6594.
    6594, 2,
// PORT: SOURCE P34-35_P74-75.agc:1691
//		STORE	RPASS36		# R
// PORT: Fixed ROM slots 6595.
    6595, 2318,
// PORT: SOURCE P34-35_P74-75.agc:1692
//		UNIT	PDVL		#  P
// PORT: Fixed ROM slots 6596.
    6596, 52572,
// PORT: SOURCE P34-35_P74-75.agc:1693
//		VXV	UNIT
// PORT: Fixed ROM slots 6597.
    6597, 44602,
// PORT: SOURCE P34-35_P74-75.agc:1694
//		STADR			# _
// PORT: Fixed ROM slots 6598.
    6598, 65324,
// PORT: SOURCE P34-35_P74-75.agc:1695
//		STODL	UNP36		# U
// PORT: Fixed ROM slots 6599.
    6599, 50916,
// PORT: SOURCE P34-35_P74-75.agc:1696
//			TAT
// PORT: Fixed ROM slots 6600.
    6600, 26,
// PORT: SOURCE P34-35_P74-75.agc:1697
//		STCALL	TDEC1
// PORT: Fixed ROM slots 6601.
    6601, 28738,
// PORT: SOURCE P34-35_P74-75.agc:1698
//			THISPREC
// PORT: Fixed ROM slots 6602.
    6602, 23646,
// PORT: SOURCE P34-35_P74-75.agc:1699
//		VLOAD	PDVL		#		  -
// PORT: Fixed ROM slots 6603.
    6603, 52730,
// PORT: SOURCE P34-35_P74-75.agc:1700
//			VATT		# VELOCITY VECTOR V		00D
// PORT: Fixed ROM slots 6604.
    6604, 14,
// PORT: SOURCE P34-35_P74-75.agc:1701
//			RATT		# 		   A
// PORT: Fixed ROM slots 6605.
    6605, 2,
// PORT: SOURCE P34-35_P74-75.agc:1702
//		PDDL
// PORT: Fixed ROM slots 6606.
    6606, 65450,
// PORT: SOURCE P34-35_P74-75.agc:1703
//			TAT		# SAVE TIME IN LOCATION 30D FOR REDISPLAY
// PORT: Fixed ROM slots 6607.
    6607, 26,
// PORT: SOURCE P34-35_P74-75.agc:1704
//		STOVL	30D		#		  _
// PORT: Fixed ROM slots 6608.
    6608, 20542,
// PORT: SOURCE P34-35_P74-75.agc:1705
//		PUSH	PUSH		# POSITION VECTOR R  IN 06D AND 12D
// PORT: Fixed ROM slots 6609.
    6609, 34316,
// PORT: SOURCE P34-35_P74-75.agc:1706
//		BVSU	PDVL		#		   A   _   _
// PORT: Fixed ROM slots 6610.
    6610, 52554,
// PORT: SOURCE P34-35_P74-75.agc:1707
//			RPASS36		# LINE OF SIGHT VECTOR R - R  	12D
// PORT: Fixed ROM slots 6611.
    6611, 2318,
// PORT: SOURCE P34-35_P74-75.agc:1708
//		DOT	SL1		#			P   A
// PORT: Fixed ROM slots 6612.
    6612, 59970,
// PORT: SOURCE P34-35_P74-75.agc:1709
//			UNP36		#     _   _
// PORT: Fixed ROM slots 6613.
    6613, 2330,
// PORT: SOURCE P34-35_P74-75.agc:1710
//		STOVL	RANGE		# Y = U . R
// PORT: Fixed ROM slots 6614.
    6614, 22786,
// PORT: SOURCE P34-35_P74-75.agc:1711
//			00D		#          A
// PORT: Fixed ROM slots 6615.
    6615, 2,
// PORT: SOURCE P34-35_P74-75.agc:1712
//		DOT	SL1
// PORT: Fixed ROM slots 6616.
    6616, 59970,
// PORT: SOURCE P34-35_P74-75.agc:1713
//			UNP36		# .   _   _
// PORT: Fixed ROM slots 6617.
    6617, 2330,
// PORT: SOURCE P34-35_P74-75.agc:1714
//		STOVL	RRATE		# Y = U . V
// PORT: Fixed ROM slots 6618.
    6618, 22790,
// PORT: SOURCE P34-35_P74-75.agc:1715
//			06D		#          A
// PORT: Fixed ROM slots 6619.
    6619, 14,
// PORT: SOURCE P34-35_P74-75.agc:1716
//# Page 702
// PORT: SOURCE P34-35_P74-75.agc:1717
//					# _           _
// PORT: SOURCE P34-35_P74-75.agc:1718
//		UNIT	PUSH		# U  = UNIT ( R  )		18D
// PORT: Fixed ROM slots 6620.
    6620, 34396,
// PORT: SOURCE P34-35_P74-75.agc:1719
//		VXV	VXV		#  RA          A
// PORT: Fixed ROM slots 6621.
    6621, 40250,
// PORT: SOURCE P34-35_P74-75.agc:1720
//			00D		#  _    _     _     _
// PORT: Fixed ROM slots 6622.
    6622, 2,
// PORT: SOURCE P34-35_P74-75.agc:1721
//			18D		# (U  X V ) X U   = U
// PORT: Fixed ROM slots 6623.
    6623, 38,
// PORT: SOURCE P34-35_P74-75.agc:1722
//		VSL2	UNIT		#   RA   A     RA    A
// PORT: Fixed ROM slots 6624.
    6624, 44756,
// PORT: SOURCE P34-35_P74-75.agc:1723
//		UNIT
// PORT: Fixed ROM slots 6625.
    6625, 65372,
// PORT: SOURCE P34-35_P74-75.agc:1724
//		STOVL	00D		# UNIT HORIZONTAL IN FORWARD DIR. 00D
// PORT: Fixed ROM slots 6626.
    6626, 20482,
// PORT: SOURCE P34-35_P74-75.agc:1725
//			18D
// PORT: Fixed ROM slots 6627.
    6627, 38,
// PORT: SOURCE P34-35_P74-75.agc:1726
//		DOT	VXSC		# _
// PORT: Fixed ROM slots 6628.
    6628, 61762,
// PORT: SOURCE P34-35_P74-75.agc:1727
//			12D		# U
// PORT: Fixed ROM slots 6629.
    6629, 26,
// PORT: SOURCE P34-35_P74-75.agc:1728
//		VSL2			#  L
// PORT: Fixed ROM slots 6630.
    6630, 65492,
// PORT: SOURCE P34-35_P74-75.agc:1729
//		BVSU	UNIT
// PORT: Fixed ROM slots 6631.
    6631, 44618,
// PORT: SOURCE P34-35_P74-75.agc:1730
//		UNIT
// PORT: Fixed ROM slots 6632.
    6632, 65372,
// PORT: SOURCE P34-35_P74-75.agc:1731
//		PUSH	DOT		# LOS PROJECTED INTO HORIZONTAL  12D
// PORT: Fixed ROM slots 6633.
    6633, 41228,
// PORT: SOURCE P34-35_P74-75.agc:1732
//			00D		# PLANE
// PORT: Fixed ROM slots 6634.
    6634, 2,
// PORT: SOURCE P34-35_P74-75.agc:1733
//		SL1	ARCCOS		#              _   _
// PORT: Fixed ROM slots 6635.
    6635, 54996,
// PORT: SOURCE P34-35_P74-75.agc:1734
//		STOVL	RTHETA		# PSI = ARCCOS(U . U )
// PORT: Fixed ROM slots 6636.
    6636, 22794,
// PORT: SOURCE P34-35_P74-75.agc:1735
//		VXV	DOT		#               A   L
// PORT: Fixed ROM slots 6637.
    6637, 41274,
// PORT: SOURCE P34-35_P74-75.agc:1736
//			00D
// PORT: Fixed ROM slots 6638.
    6638, 2,
// PORT: SOURCE P34-35_P74-75.agc:1737
//		BPL	DLOAD
// PORT: Fixed ROM slots 6639.
    6639, 58696,
// PORT: SOURCE P34-35_P74-75.agc:1738
//			R36TAG2
// PORT: Fixed ROM slots 6640.
    6640, 9194,
// PORT: SOURCE P34-35_P74-75.agc:1739
//			LODPMAX
// PORT: Fixed ROM slots 6641.
    6641, 20512,
// PORT: SOURCE P34-35_P74-75.agc:1740
//		DSU
// PORT: Fixed ROM slots 6642.
    6642, 65322,
// PORT: SOURCE P34-35_P74-75.agc:1741
//			RTHETA
// PORT: Fixed ROM slots 6643.
    6643, 2314,
// PORT: SOURCE P34-35_P74-75.agc:1742
//		STORE	RTHETA
// PORT: Fixed ROM slots 6644.
    6644, 2314,
// PORT: SOURCE P34-35_P74-75.agc:1743
//R36TAG2		DLOAD	RTB
// PORT: Fixed ROM slots 6645.
    6645, 40138,
// PORT: SOURCE P34-35_P74-75.agc:1744
//			30D
// PORT: Fixed ROM slots 6646.
    6646, 62,
// PORT: SOURCE P34-35_P74-75.agc:1745
//			SGNAGREE
// PORT: Fixed ROM slots 6647.
    6647, 18196,
// PORT: SOURCE P34-35_P74-75.agc:1746
//		STORE	DSPTEMX
// PORT: Fixed ROM slots 6648.
    6648, 1108,
// PORT: SOURCE P34-35_P74-75.agc:1747
//		EXIT
// PORT: Fixed ROM slots 6649.
    6649, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6650–6651.
function agcAotUnit394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6650 {
// PORT: SOURCE P34-35_P74-75.agc:1748
//		CAF	V06N90N		# DISPLAY Y, YDOT, AND PSI.
// PORT: Fixed ROM slots 6650.
        if slot <> 6650 or instruction <> 13834 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1546), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P34-35_P74-75.agc:1749
//		TC	BANKCALL
// PORT: Fixed ROM slots 6651.
        if slot <> 6651 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[394] to agcAotUnit394@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1750
//		CADR	GOMARKF
// PORT: Fixed ROM slots 6652.
    6652, 16824
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6653–6661.
function agcAotUnit395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6656 {
        if slot <= 6654 {
            if slot <= 6653 {
// PORT: SOURCE P34-35_P74-75.agc:1751
//		TCF	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 6653.
                if slot <> 6653 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1752
//		TCF	ENDEXT		# PROCEED, END OF PROGRAM
// PORT: Fixed ROM slots 6654.
                if slot <> 6654 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6655 {
// PORT: SOURCE P34-35_P74-75.agc:1753
//		TCF	R36	+3	# REDISPLAY OUTPUT
// PORT: Fixed ROM slots 6655.
                if slot <> 6655 or instruction <> 5553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1754
//LREGCHK		XCH	L
// PORT: Fixed ROM slots 6656.
                if slot <> 6656 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6658 {
            if slot <= 6657 {
// PORT: SOURCE P34-35_P74-75.agc:1755
//		EXTEND
// PORT: Fixed ROM slots 6657.
                if slot <> 6657 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P34-35_P74-75.agc:1756
//		BZF	ENTTIM2		# L-REG ZERO, SET TIME = PRESENT TIME
// PORT: Fixed ROM slots 6658.
                if slot <> 6658 or instruction <> 5637 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5637, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6659 {
// PORT: SOURCE P34-35_P74-75.agc:1757
//		XCH	L		# L-REG NON ZERO, TIME = ASTRO INPUT TIME
// PORT: Fixed ROM slots 6659.
                if slot <> 6659 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6660 {
// PORT: SOURCE P34-35_P74-75.agc:1758
//		TCF	ASTROTIM
// PORT: Fixed ROM slots 6660.
                    if slot <> 6660 or instruction <> 5562 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5562, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P34-35_P74-75.agc:1759
//ENTTIM2		TC	INTPRET
// PORT: Fixed ROM slots 6661.
                    if slot <> 6661 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[395] to agcAotUnit395@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P34-35_P74-75.agc:1760
//		RTB	GOTO
// PORT: Fixed ROM slots 6662.
    6662, 43064,
// PORT: SOURCE P34-35_P74-75.agc:1761
//			LOADTIME
// PORT: Fixed ROM slots 6663.
    6663, 18166,
// PORT: SOURCE P34-35_P74-75.agc:1762
//			R36INT
// PORT: Fixed ROM slots 6664.
    6664, 9084,
// PORT: SOURCE P34-35_P74-75.agc:1763
//V06N16N		VN	00616
// PORT: Fixed ROM slots 6665.
    6665, 1568,
// PORT: SOURCE P34-35_P74-75.agc:1764
//V06N90N		VN	00690
// PORT: Fixed ROM slots 6666.
    6666, 1716
)).

