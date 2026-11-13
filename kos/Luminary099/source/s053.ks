// P34-35_P74-75.agc
// bank 35, slots 32101-32113
function agcAotUnit2037 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32106 {
        if slot <= 32103 {
            if slot <= 32101 {
// P34-35_P74-75.agc:1
//# Copyright:	Public domain.
// P34-35_P74-75.agc:2
//# Filename:	P34-35_P74-75.agc
// P34-35_P74-75.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P34-35_P74-75.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// P34-35_P74-75.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P34-35_P74-75.agc:6
//# Assembler:	yaYUL
// P34-35_P74-75.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// P34-35_P74-75.agc:8
//# Website:	www.ibiblio.org/apollo.
// P34-35_P74-75.agc:9
//# Pages:	658-702
// P34-35_P74-75.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// P34-35_P74-75.agc:11
//#				Luminary131 file, using page
// P34-35_P74-75.agc:12
//#				images from Luminary 1A.
// P34-35_P74-75.agc:13
//#		2009-06-05 RSB	Corrected a typo.
// P34-35_P74-75.agc:14
//#		2011-01-06 JL	Fixed pseudo-label indentation.
// P34-35_P74-75.agc:15
//#		2011-01-06 JL	Added missing comment characters.
// P34-35_P74-75.agc:16
//#		2011-05-07 JL	Removed workaround.
// P34-35_P74-75.agc:17
//
// P34-35_P74-75.agc:18
//# This source code has been transcribed or otherwise adapted from
// P34-35_P74-75.agc:19
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P34-35_P74-75.agc:20
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// P34-35_P74-75.agc:21
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P34-35_P74-75.agc:22
//# in storage size and consequent reduction in image quality as well) are
// P34-35_P74-75.agc:23
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P34-35_P74-75.agc:24
//# find that the images are illegible, contact me at info@sandroid.org
// P34-35_P74-75.agc:25
//# about getting access to the (much) higher-quality images which Paul
// P34-35_P74-75.agc:26
//# actually created.
// P34-35_P74-75.agc:27
//#
// P34-35_P74-75.agc:28
//# Notations on the hardcopy document read, in part:
// P34-35_P74-75.agc:29
//#
// P34-35_P74-75.agc:30
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P34-35_P74-75.agc:31
//#	16:27 JULY 14, 1969
// P34-35_P74-75.agc:32
//
// P34-35_P74-75.agc:33
//# Page 658
// P34-35_P74-75.agc:34
//# TRANSFER PHASE INITITIATION (TPI) PROGRAMS (P34 AND P74)
// P34-35_P74-75.agc:35
//
// P34-35_P74-75.agc:36
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// P34-35_P74-75.agc:37
//# MOD BY WHITE, P.		DATE: 1 JUNE 67
// P34-35_P74-75.agc:38
//#
// P34-35_P74-75.agc:39
//# PURPOSE
// P34-35_P74-75.agc:40
//#
// P34-35_P74-75.agc:41
//#	(1)	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// P34-35_P74-75.agc:42
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE TRANSFER
// P34-35_P74-75.agc:43
//#		PHASE INITITATION (TPI) MANEUVER, GIVEN --
// P34-35_P74-75.agc:44
//
// P34-35_P74-75.agc:45
//#		(A)	TIME OF IGNITION TIG (TPI) OR THE ELEVATION ANGLE (E) OF
// P34-35_P74-75.agc:46
//#			THE ACTIVE/PASSIVE VEHICLE LOS AT TIG (TPI).
// P34-35_P74-75.agc:47
//
// P34-35_P74-75.agc:48
//#		(B)	CENTRAL ANGLE OF TRANSFER (CENTANG) FROM TIG (TPI) TO
// P34-35_P74-75.agc:49
//#			INTERCEPT TIME (TIG (TPF)).
// P34-35_P74-75.agc:50
//
// P34-35_P74-75.agc:51
//#	(2)	TO CALCULATE TIG (TPI) GIVEN E OR E GIVEN TIG (TPI).
// P34-35_P74-75.agc:52
//
// P34-35_P74-75.agc:53
//#	(3)	TO CALCULATE THESE PARAMETERS BASED UPON MANEUVER DATA
// P34-35_P74-75.agc:54
//#		APPROVED AND KEYED INTO THE DSKY BY THE ASTRONAUT.
// P34-35_P74-75.agc:55
//
// P34-35_P74-75.agc:56
//#	(4)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// P34-35_P74-75.agc:57
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// P34-35_P74-75.agc:58
//#		ASTRONAUT/GROUND.
// P34-35_P74-75.agc:59
//
// P34-35_P74-75.agc:60
//#	(5)	TO STORE THE TPI TARGET PARAMETERS FOR USE BY THE DESIRED
// P34-35_P74-75.agc:61
//#		THRUSTING PROGRAM.
// P34-35_P74-75.agc:62
//#
// P34-35_P74-75.agc:63
//# ASSUMPTIONS
// P34-35_P74-75.agc:64
//
// P34-35_P74-75.agc:65
//#	(1)	LM ONLY -- THIS PROGRAM IS BASED UPON PREVIOUS COMPLETION OF
// P34-35_P74-75.agc:66
//#		THE CONSTANT DELTA ALTITUDE (CDH) PROGRAM (P33/P73).
// P34-35_P74-75.agc:67
//#		THEREFORE --
// P34-35_P74-75.agc:68
//
// P34-35_P74-75.agc:69
//#		(A)	AT A SELECTED TPI TIME (NOW IN STORAGE) THE LINE OF SIGHT
// P34-35_P74-75.agc:70
//#			BETWEEN THE ACTIVE AND PASSIVE VEHICLES WAS SELECTED TO BE
// P34-35_P74-75.agc:71
//#			A PRESCRIBED ANGLE (E) (NOW IN STORAGE) FROM THE
// P34-35_P74-75.agc:72
//#			HORIZONTAL PLANE DEFINED BY THE ACTIVE VEHICLE POSITION.
// P34-35_P74-75.agc:73
//
// P34-35_P74-75.agc:74
//#		(B)	THE TIME BETWEEN CDH IGNITION AND TPI IGNITION WAS
// P34-35_P74-75.agc:75
//#			COMPUTED TO BE GREATER THAN 10 MINUTES.
// P34-35_P74-75.agc:76
//
// P34-35_P74-75.agc:77
//#		(C)	THE VARIATION OF THE ALTITUDE DIFFERENCE BETWEEN THE
// P34-35_P74-75.agc:78
//#			ORBITS WAS MINIMIZED.
// P34-35_P74-75.agc:79
//
// P34-35_P74-75.agc:80
//#		(D)	THE PERICENTER ALTITUDES OF ORBITS FOLLOWING CSI AND
// P34-35_P74-75.agc:81
//#			CDH WERE COMPUTED TO BE GREATER THAN 35,000 FT FOR LUNAR
// P34-35_P74-75.agc:82
//# Page 659
// P34-35_P74-75.agc:83
//#			ORBIT OR 85 NM FOR EARTH ORBIT.
// P34-35_P74-75.agc:84
//
// P34-35_P74-75.agc:85
//#		(E)	THE CSI AND CDH MANEUVERS WERE ASSUMED TO BE PARALLEL TO
// P34-35_P74-75.agc:86
//#			THE PLANE OF THE PASSIVE VEHICLE ORBIT.  HOWEVER, CREW
// P34-35_P74-75.agc:87
//#			MODIFICATION OF DELTA V (LV) COMPONENTS MAY HAVE RESULTED
// P34-35_P74-75.agc:88
//#			IN AN OUT-OF-PLANE MANEUVER.
// P34-35_P74-75.agc:89
//
// P34-35_P74-75.agc:90
//#	(2)	STATE VECTOR UPDATED BY P27 ARE DISALLOWED DURING AUTOMATIC
// P34-35_P74-75.agc:91
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (4)).
// P34-35_P74-75.agc:92
//
// P34-35_P74-75.agc:93
//#	(3)	THIS PROGRAM MUST BE DONE OVER A TRACKING STATION FOR REAL
// P34-35_P74-75.agc:94
//#		TIME GROUND PARTICIPATION IN DATA INPUT AND OUTPUT.  COMPUTED
// P34-35_P74-75.agc:95
//#		VARIABLES MAY BE STORED FOR LATER VERIFICATION BY THE GROUND.
// P34-35_P74-75.agc:96
//#		THESE STORAGE CAPABILITIES ARE LIMITED ONLY TO THE PARAMETERS
// P34-35_P74-75.agc:97
//#		FOR ONE THRUSTING MANEUVER AT A TIME EXCEPT FOR CONCENTRIC
// P34-35_P74-75.agc:98
//#		FLIGHT PLAN MANEUVER SEQUENCES.
// P34-35_P74-75.agc:99
//
// P34-35_P74-75.agc:100
//#	(4)	THE RENDEZVOUS RADAR MAY OR MAY NOT BE USED TO UPDATE THE LM
// P34-35_P74-75.agc:101
//#		OR CSM STATE VECTORS FOR THIS PROGRAM.  IF RADAR USE IS
// P34-35_P74-75.agc:102
//#		DESIRED THE RADAR WAS TURNED ON AND LOCKED ON THE CSM BY
// P34-35_P74-75.agc:103
//#		PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS WILL BE MADE
// P34-35_P74-75.agc:104
//#		AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN ENABLED BY THE
// P34-35_P74-75.agc:105
//#		TRACK AND UPDATE FLAGS (SEE P20).  THE RENDEZVOUS TRACKING
// P34-35_P74-75.agc:106
//#		MARK COUNTER IS ZEROED BY THE SELECTION OF P20 AND AFTER EACH
// P34-35_P74-75.agc:107
//#		THRUSTING MANEUVER.
// P34-35_P74-75.agc:108
//
// P34-35_P74-75.agc:109
//#	(5)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P34-35_P74-75.agc:110
//
// P34-35_P74-75.agc:111
//#	(6)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P34-35_P74-75.agc:112
//#
// P34-35_P74-75.agc:113
//#			ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P34-35_P74-75.agc:114
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P34-35_P74-75.agc:115
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P34-35_P74-75.agc:116
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P34-35_P74-75.agc:117
//#
// P34-35_P74-75.agc:118
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P34-35_P74-75.agc:119
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// P34-35_P74-75.agc:120
//#
// P34-35_P74-75.agc:121
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// P34-35_P74-75.agc:122
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// P34-35_P74-75.agc:123
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// P34-35_P74-75.agc:124
//#
// P34-35_P74-75.agc:125
//#	(7)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// P34-35_P74-75.agc:126
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// P34-35_P74-75.agc:127
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STURED.
// P34-35_P74-75.agc:128
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// P34-35_P74-75.agc:129
//#		THROUGH THE USE OF V06N52.
// P34-35_P74-75.agc:130
//#
// P34-35_P74-75.agc:131
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// P34-35_P74-75.agc:132
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// P34-35_P74-75.agc:133
//# Page 660
// P34-35_P74-75.agc:134
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// P34-35_P74-75.agc:135
//#		ASTRONAUT SHOULD REASSES THE INPUT TARGETING PARAMETERS BASED
// P34-35_P74-75.agc:136
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// P34-35_P74-75.agc:137
//#
// P34-35_P74-75.agc:138
//#	(8)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// P34-35_P74-75.agc:139
//#
// P34-35_P74-75.agc:140
//#			P34 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P34-35_P74-75.agc:141
//#
// P34-35_P74-75.agc:142
//#			P74 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P34-35_P74-75.agc:143
//#
// P34-35_P74-75.agc:144
//# INPUT
// P34-35_P74-75.agc:145
//#
// P34-35_P74-75.agc:146
//#	(1)	TTPI	TIME OF THE TPI MANEUVER.
// P34-35_P74-75.agc:147
//#	(2)	ELEV	DESIRED LOS ANGLE AT TPI
// P34-35_P74-75.agc:148
//#	(3)	CENTANG	ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// P34-35_P74-75.agc:149
//#			TRANSFER FROM TPI TO TIME OF INTERCEPT
// P34-35_P74-75.agc:150
//#
// P34-35_P74-75.agc:151
//# OUTPUT
// P34-35_P74-75.agc:152
//#
// P34-35_P74-75.agc:153
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P34-35_P74-75.agc:154
//#	(2)	TTOGO		TIME TO GO
// P34-35_P74-75.agc:155
//#	(3)	+MGA		MIDDLE GIMBAL ANGLE
// P34-35_P74-75.agc:156
//#	(4)	TTPI		COMPUTED TIME OF TPI MANEUVER
// P34-35_P74-75.agc:157
//#		 OR
// P34-35_P74-75.agc:158
//#		ELEV		COMPUTED LOS ANGLE AT TPI
// P34-35_P74-75.agc:159
//#	(5)	POSTTPI		PERIGEE ALTITUDE AFTER THE TPI MANEUVER
// P34-35_P74-75.agc:160
//#	(6)	DELVTPI		MAGNITUDE OF DELTA V AT TPI
// P34-35_P74-75.agc:161
//#	(7)	DELVTPF		MAGNITUDE OF DELTA V AT INTERCEPT
// P34-35_P74-75.agc:162
//#	(8)	DVLOS		DELTA VELOCITY AT TPI -- LINE OF SIGHT
// P34-35_P74-75.agc:163
//#	(9)	DELVLVC		DELTA VELOCITY AT TPI -- LOCAL VERTICAL COORDINATES
// P34-35_P74-75.agc:164
//#
// P34-35_P74-75.agc:165
//# DOWNLINK
// P34-35_P74-75.agc:166
//#
// P34-35_P74-75.agc:167
//#	(1)	TTPI		TIME OF TPI MANEUVER
// P34-35_P74-75.agc:168
//#	(2)	TIG		TIME OF TPI MANEUVER
// P34-35_P74-75.agc:169
//#	(3)	ELEV		DESIRED LOS ANGLE AT TPI
// P34-35_P74-75.agc:170
//#	(4)	CENTANG		ORBITAL CENTRAL ANGLE OF THE PASSIVE VEHICLE DURING
// P34-35_P74-75.agc:171
//#				TRANSFER FROM TPI TO TIME OF INTERCEPT
// P34-35_P74-75.agc:172
//#	(5)	DELVEET3	DELTA VELOCITY AT TPI -- REFERENCE COORDINATES
// P34-35_P74-75.agc:173
//#	(6)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:174
//#
// P34-35_P74-75.agc:175
//# COMMUNICATION TO THRUSTING PROGRAMS
// P34-35_P74-75.agc:176
//#
// P34-35_P74-75.agc:177
//#	(1)	TIG		TIME OF THE TPI MANEUVER
// P34-35_P74-75.agc:178
//#	(2)	RTARG		OFFSET TARGET POSITION
// P34-35_P74-75.agc:179
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:180
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION
// P34-35_P74-75.agc:181
//#
// P34-35_P74-75.agc:182
//# SUBROUTINES USED
// P34-35_P74-75.agc:183
//#
// P34-35_P74-75.agc:184
//#	AVFLAGA
// P34-35_P74-75.agc:185
//# Page 661
// P34-35_P74-75.agc:186
//#	AVFLAGP
// P34-35_P74-75.agc:187
//#	VNPOOH
// P34-35_P74-75.agc:188
//#	DISPLAYE
// P34-35_P74-75.agc:189
//#	SELECTMU
// P34-35_P74-75.agc:190
//#	PRECSET
// P34-35_P74-75.agc:191
//#	S33/34.1
// P34-35_P74-75.agc:192
//#	ALARM
// P34-35_P74-75.agc:193
//#	BANKCALL
// P34-35_P74-75.agc:194
//#	GOFLASH
// P34-35_P74-75.agc:195
//#	GOTOPOOH
// P34-35_P74-75.agc:196
//#	TIMETHET
// P34-35_P74-75.agc:197
//#	S34/35.2
// P34-35_P74-75.agc:198
//#	PERIAPO1
// P34-35_P74-75.agc:199
//#	SHIFTR1
// P34-35_P74-75.agc:200
//#	S34/35.5
// P34-35_P74-75.agc:201
//#	VN1645
// P34-35_P74-75.agc:202
//
// P34-35_P74-75.agc:203
//		SETLOC	CSI/CDH
// P34-35_P74-75.agc:204
//		BANK
// P34-35_P74-75.agc:205
//		EBANK=	SUBEXIT
// P34-35_P74-75.agc:206
//		COUNT*	$$/P3474
// P34-35_P74-75.agc:207
//P34		TC	AVFLAGA
// slot 32101
                if slot <> 32101 or instruction <> 1255 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1255, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32102 {
// P34-35_P74-75.agc:208
//		TC	P34/P74A
// slot 32102
                    if slot <> 32102 or instruction <> 1384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:209
//P74		TC	AVFLAGP
// slot 32103
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
// P34-35_P74-75.agc:210
//P34/P74A	TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// slot 32104
                if slot <> 32104 or instruction <> 1265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32105 {
// P34-35_P74-75.agc:211
//		CAF	V06N37		# TTPI
// slot 32105
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
// P34-35_P74-75.agc:212
//		TC	VNPOOH
// slot 32106
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
// P34-35_P74-75.agc:213
//		EXTEND
// slot 32107
                if slot <> 32107 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32108 {
// P34-35_P74-75.agc:214
//		DCA	130DEG
// slot 32108
                    if slot <> 32108 or instruction <> 14310 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2022, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:215
//		DXCH	CENTANG
// slot 32109
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
// P34-35_P74-75.agc:216
//		CAF	P30ZERO
// slot 32110
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
// P34-35_P74-75.agc:217
//		TS	NN
// slot 32111
                    if slot <> 32111 or instruction <> 23350 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23350, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32112 {
// P34-35_P74-75.agc:218
//		TC	DISPLAYE	# ELEV AND CENTANG
// slot 32112
                    if slot <> 32112 or instruction <> 1980 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1980, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:219
//		TC	INTPRET
// slot 32113
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
// P34-35_P74-75.agc:220
//		CLEAR	DLOAD
// slot 32114
    32114, 58648,
// P34-35_P74-75.agc:221
//			ETPIFLAG
// slot 32115
    32115, 1392,
// P34-35_P74-75.agc:222
//			TTPI
// slot 32116
    32116, 3900,
// P34-35_P74-75.agc:223
//		STODL	TIG
// slot 32117
    32117, 15940,
// P34-35_P74-75.agc:224
//			ELEV
// slot 32118
    32118, 2398,
// P34-35_P74-75.agc:225
//		BZE	SET
// slot 32119
    32119, 35928,
// P34-35_P74-75.agc:226
//			P34/P74B
// slot 32120
    32120, 60148,
// P34-35_P74-75.agc:227
//			ETPIFLAG
// slot 32121
    32121, 1136,
// P34-35_P74-75.agc:228
//P34/P74B	CALL
// slot 32122
    32122, 65320,
// P34-35_P74-75.agc:229
//			SELECTMU
// slot 32123
    32123, 16384,
// P34-35_P74-75.agc:230
//DELELO		EQUALS	26D
// P34-35_P74-75.agc:231
//P34/P74C	DLOAD	SET
// slot 32124
    32124, 36042,
// P34-35_P74-75.agc:232
//			ZEROVECS
// slot 32125
    32125, 6820,
// P34-35_P74-75.agc:233
//			ITSWICH
// slot 32126
    32126, 3680,
// P34-35_P74-75.agc:234
//		BON	CLEAR
// slot 32127
    32127, 35864,
// P34-35_P74-75.agc:235
//			ETPIFLAG
// slot 32128
    32128, 1424,
// P34-35_P74-75.agc:236
//# Page 662
// P34-35_P74-75.agc:237
//			SWCHSET
// slot 32129
    32129, 60166,
// P34-35_P74-75.agc:238
//			ITSWICH
// slot 32130
    32130, 3936,
// P34-35_P74-75.agc:239
//SWCHSET		STORE	NOMTPI
// slot 32131
    32131, 2462,
// P34-35_P74-75.agc:240
//INTLOOP		DLOAD	DAD
// slot 32132
    32132, 36298,
// P34-35_P74-75.agc:241
//			TTPI
// slot 32133
    32133, 3900,
// P34-35_P74-75.agc:242
//			NOMTPI
// slot 32134
    32134, 2462,
// P34-35_P74-75.agc:243
//		STCALL	TDEC1
// slot 32135
    32135, 28738,
// P34-35_P74-75.agc:244
//			PRECSET
// slot 32136
    32136, 39392,
// P34-35_P74-75.agc:245
//		CALL
// slot 32137
    32137, 65320,
// P34-35_P74-75.agc:246
//			S33/34.1
// slot 32138
    32138, 60392,
// P34-35_P74-75.agc:247
//		BZE	EXIT
// slot 32139
    32139, 65112,
// P34-35_P74-75.agc:248
//			SWCHCLR
// slot 32140
    32140, 60202
)).

// bank 35, slots 32141-32141
function agcAotUnit2038 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:249
//		TC	ALARM
// slot 32141
    if slot <> 32141 or instruction <> 2935 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2935, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2038] to agcAotUnit2038@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:250
//		OCT	611
// slot 32142
    32142, 786
)).

// bank 35, slots 32143-32144
function agcAotUnit2039 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32143 {
// P34-35_P74-75.agc:251
//		CAF	V05N09
// slot 32143
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
// P34-35_P74-75.agc:252
//		TC	BANKCALL
// slot 32144
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
// P34-35_P74-75.agc:253
//		CADR	GOFLASH
// slot 32145
    32145, 17020
)).

// bank 35, slots 32146-32148
function agcAotUnit2040 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32146 {
// P34-35_P74-75.agc:254
//		TC	GOTOPOOH
// slot 32146
        if slot <> 32146 or instruction <> 3073 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3073, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32147 {
// P34-35_P74-75.agc:255
//		TC	P34/P74A	# PROCEED
// slot 32147
            if slot <> 32147 or instruction <> 1384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1384, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:256
//		TC	-7		# V32
// slot 32148
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
// P34-35_P74-75.agc:257
//
// P34-35_P74-75.agc:258
//SWCHCLR		BONCLR	BON
// slot 32149
    32149, 35864,
// P34-35_P74-75.agc:259
//			ITSWICH
// slot 32150
    32150, 3840,
// P34-35_P74-75.agc:260
//			INTLOOP
// slot 32151
    32151, 60168,
// P34-35_P74-75.agc:261
//			ETPIFLAG
// slot 32152
    32152, 1424,
// P34-35_P74-75.agc:262
//			P34/P74D	# DISPLAY TTPI
// slot 32153
    32153, 60218,
// P34-35_P74-75.agc:263
//		EXIT
// slot 32154
    32154, 65532
)).

// bank 35, slots 32155-32156
function agcAotUnit2041 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32155 {
// P34-35_P74-75.agc:264
//		TC	DISPLAYE	# DISPLAY ELEV AND CENTANG
// slot 32155
        if slot <> 32155 or instruction <> 1980 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1980, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P34-35_P74-75.agc:265
//		TC	P34/P74E
// slot 32156
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
// P34-35_P74-75.agc:266
//P34/P74D	EXIT
// slot 32157
    32157, 65532
)).

// bank 35, slots 32158-32160
function agcAotUnit2042 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32158 {
// P34-35_P74-75.agc:267
//		CAF	V06N37		# TTPI
// slot 32158
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
// P34-35_P74-75.agc:268
//		TC	VNPOOH
// slot 32159
            if slot <> 32159 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:269
//P34/P74E	TC	INTPRET
// slot 32160
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
// P34-35_P74-75.agc:270
//		SETPD	DLOAD
// slot 32161
    32161, 58626,
// P34-35_P74-75.agc:271
//			0D
// slot 32162
    32162, 2,
// P34-35_P74-75.agc:272
//			RTX1
// slot 32163
    32163, 3070,
// P34-35_P74-75.agc:273
//		STODL	X1
// slot 32164
    32164, 12366,
// P34-35_P74-75.agc:274
//			CENTANG
// slot 32165
    32165, 3874,
// P34-35_P74-75.agc:275
//		PUSH	COS
// slot 32166
    32166, 58892,
// P34-35_P74-75.agc:276
//		STODL	CSTH
// slot 32167
    32167, 15284,
// P34-35_P74-75.agc:277
//		SIN
// slot 32168
    32168, 65500,
// P34-35_P74-75.agc:278
//		STOVL	SNTH
// slot 32169
    32169, 23472,
// P34-35_P74-75.agc:279
//			RPASS3
// slot 32170
    32170, 3796,
// P34-35_P74-75.agc:280
//		VSR*
// slot 32171
    32171, 65374,
// P34-35_P74-75.agc:281
//			0,2
// slot 32172
    32172, 48380,
// P34-35_P74-75.agc:282
//		STOVL	RVEC
// slot 32173
    32173, 23386,
// P34-35_P74-75.agc:283
//			VPASS3
// slot 32174
    32174, 3808,
// P34-35_P74-75.agc:284
//		VSR*	SET
// slot 32175
    32175, 35934,
// P34-35_P74-75.agc:285
//			0,2
// slot 32176
    32176, 48380,
// P34-35_P74-75.agc:286
//			RVSW
// slot 32177
    32177, 3692,
// P34-35_P74-75.agc:287
//# Page 663
// P34-35_P74-75.agc:288
//		STCALL	VVEC
// slot 32178
    32178, 31688,
// P34-35_P74-75.agc:289
//			TIMETHET
// slot 32179
    32179, 21428,
// P34-35_P74-75.agc:290
//		DLOAD
// slot 32180
    32180, 65482,
// P34-35_P74-75.agc:291
//			TTPI
// slot 32181
    32181, 3900,
// P34-35_P74-75.agc:292
//		STORE	INTIME		# FOR INITVEL
// slot 32182
    32182, 3856,
// P34-35_P74-75.agc:293
//		DAD
// slot 32183
    32183, 65306,
// P34-35_P74-75.agc:294
//			T		# RENDEZVOUS TIME
// slot 32184
    32184, 62,
// P34-35_P74-75.agc:295
//		STCALL	TPASS4		# FOR INITVEL
// slot 32185
    32185, 32562,
// P34-35_P74-75.agc:296
//			S34/35.2
// slot 32186
    32186, 60812,
// P34-35_P74-75.agc:297
//		VLOAD	ABVAL
// slot 32187
    32187, 42746,
// P34-35_P74-75.agc:298
//			DELVEET3
// slot 32188
    32188, 2540,
// P34-35_P74-75.agc:299
//		STOVL	DELVTPI
// slot 32189
    32189, 24316,
// P34-35_P74-75.agc:300
//			VPASS4
// slot 32190
    32190, 3724,
// P34-35_P74-75.agc:301
//		VSU	ABVAL
// slot 32191
    32191, 42578,
// P34-35_P74-75.agc:302
//			VTPRIME
// slot 32192
    32192, 3820,
// P34-35_P74-75.agc:303
//		STOVL	DELVTPF
// slot 32193
    32193, 22992,
// P34-35_P74-75.agc:304
//			RACT3
// slot 32194
    32194, 3772,
// P34-35_P74-75.agc:305
//		PDVL	CALL
// slot 32195
    32195, 38042,
// P34-35_P74-75.agc:306
//			VIPRIME
// slot 32196
    32196, 2494,
// P34-35_P74-75.agc:307
//			PERIAPO1
// slot 32197
    32197, 39324,
// P34-35_P74-75.agc:308
//		CALL
// slot 32198
    32198, 65320,
// P34-35_P74-75.agc:309
//			SHIFTR1
// slot 32199
    32199, 39468,
// P34-35_P74-75.agc:310
//		STODL	POSTTPI
// slot 32200
    32200, 16140,
// P34-35_P74-75.agc:311
//			TTPI
// slot 32201
    32201, 3900,
// P34-35_P74-75.agc:312
//		STORE	TIG
// slot 32202
    32202, 3652,
// P34-35_P74-75.agc:313
//		EXIT
// slot 32203
    32203, 65532
)).

// bank 35, slots 32204-32206
function agcAotUnit2043 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32204 {
// P34-35_P74-75.agc:314
//		CAF	V06N58
// slot 32204
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
// P34-35_P74-75.agc:315
//		TC	VNPOOH
// slot 32205
            if slot <> 32205 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:316
//		TC	INTPRET
// slot 32206
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
// P34-35_P74-75.agc:317
//		CALL
// slot 32207
    32207, 65320,
// P34-35_P74-75.agc:318
//			S34/35.5
// slot 32208
    32208, 61092,
// P34-35_P74-75.agc:319
//		CALL
// slot 32209
    32209, 65320,
// P34-35_P74-75.agc:320
//			VN1645
// slot 32210
    32210, 61196,
// P34-35_P74-75.agc:321
//		GOTO
// slot 32211
    32211, 65360,
// P34-35_P74-75.agc:322
//			P34/P74C
// slot 32212
    32212, 60152
)).

// bank 35, slots 32213-32222
function agcAotUnit2044 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32217 {
        if slot <= 32214 {
            if slot <= 32213 {
// P34-35_P74-75.agc:323
//# Page 664
// P34-35_P74-75.agc:324
//# RENDEZVOUS MID-COURSE MANEUVER PROGRAMS (P35 AND P75)
// P34-35_P74-75.agc:325
//
// P34-35_P74-75.agc:326
//# MOD NO -1			LOG SECTION -- P32-P35, P72-P75
// P34-35_P74-75.agc:327
//# MOD BY WHITE, P.		DATE:  1 JUNE 67
// P34-35_P74-75.agc:328
//#
// P34-35_P74-75.agc:329
//# PURPOSE
// P34-35_P74-75.agc:330
//#
// P34-35_P74-75.agc:331
//#	(1) 	TO CALCULATE THE REQUIRED DELTA V AND OTHER INITIAL CONDITIONS
// P34-35_P74-75.agc:332
//#		REQUIRED BY THE ACTIVE VEHICLE FOR EXECUTION OF THE NEXT
// P34-35_P74-75.agc:333
//#		MID-COURSE CORRECTION OF THE TRANSFER PHASE OF AN ACTIVE
// P34-35_P74-75.agc:334
//#		VEHICLE RENDEZVOUS.
// P34-35_P74-75.agc:335
//#
// P34-35_P74-75.agc:336
//#	(2)	TO DISPLAY TO THE ASTRONAUT AND THE GROUND CERTAIN DEPENDENT
// P34-35_P74-75.agc:337
//#		VARIABLES ASSOCIATED WITH THE MANEUVER FOR APPROVAL BY THE
// P34-35_P74-75.agc:338
//#		ASTRONAUT/GROUND.
// P34-35_P74-75.agc:339
//#
// P34-35_P74-75.agc:340
//#	(3)	TO STORE THE TPM TARGET PARAMETERS FOR USE BY THE DESIRED
// P34-35_P74-75.agc:341
//#		THRUSTING PROGRAM.
// P34-35_P74-75.agc:342
//#
// P34-35_P74-75.agc:343
//# ASSUMPTIONS
// P34-35_P74-75.agc:344
//#
// P34-35_P74-75.agc:345
//#	(1)	THE ISS NEED NOT BE ON TO COMPLETE THIS PROGRAM.
// P34-35_P74-75.agc:346
//#
// P34-35_P74-75.agc:347
//#	(2)	STATE VECTOR UPDATES BY P27 ARE DISALLOWED DURING AUTOMATIC
// P34-35_P74-75.agc:348
//#		STATE VECTOR UPDATING INITIATED BY P20 (SEE ASSUMPTION (3)).
// P34-35_P74-75.agc:349
//#
// P34-35_P74-75.agc:350
//#	(3)	THE RENDEZVOUS RADAR IS ON AND IS LOCKED ON THE CSM.  THIS WAS
// P34-35_P74-75.agc:351
//#		DONE DURING PREVIOUS SELECTION OF P20.  RADAR SIGHTING MARKS
// P34-35_P74-75.agc:352
//#		WILL BE MADE AUTOMATICALLY APPROXIMATELY ONCE A MINUTE WHEN
// P34-35_P74-75.agc:353
//#		ENABLED BY THE TRACK AND UPDATE FLAGS (SEE P20).  THE
// P34-35_P74-75.agc:354
//#		RENDEZVOUS TRACKING MARK COUNTER IS ZEROED BY THE SELECTION OF
// P34-35_P74-75.agc:355
//#		P20 AND AFTER EACH THRUSTING MANEUVER.
// P34-35_P74-75.agc:356
//#
// P34-35_P74-75.agc:357
//#	(4)	THE OPERATION OF THE PROGRAM UTILIZES THE FOLLOWING FLAGS --
// P34-35_P74-75.agc:358
//#
// P34-35_P74-75.agc:359
//#			THE ACTIVE VEHICLE FLAG -- DESIGNATES THE VEHICLE WHICH IS
// P34-35_P74-75.agc:360
//#			DOING RENDEZVOUS THRUSTING MANEUVERS TO THE PROGRAM WHICH
// P34-35_P74-75.agc:361
//#			CALCULATES THE MANEUVER PARAMETERS.  SET AT THE START OF
// P34-35_P74-75.agc:362
//#			EACH RENDEZVOUS PRE-THRUSTING PROGRAM.
// P34-35_P74-75.agc:363
//#
// P34-35_P74-75.agc:364
//#			FINAL FLAG -- SELECTS FINAL PROGRAM DISPLAYS AFTER CREW HAS
// P34-35_P74-75.agc:365
//#			SELECTED THE FINAL MANEUVER COMPUTATION CYCLE.
// P34-35_P74-75.agc:366
//#
// P34-35_P74-75.agc:367
//#			EXTERNAL DELTA V FLAG -- DESIGNATES THE TYPE OF STEERING
// P34-35_P74-75.agc:368
//#			REQUIRED FOR EXECUTION OF THIS MANEUVER BY THE THRUSTING
// P34-35_P74-75.agc:369
//#			PROGRAM SELECTED AFTER COMPLETION OF THIS PROGRAM.
// P34-35_P74-75.agc:370
//#
// P34-35_P74-75.agc:371
//#	(5)	THE TIME OF INTERCEPT (T(INT)) WAS DEFINED BY PREVIOUS
// P34-35_P74-75.agc:372
//#		COMPLETION OF THE TRANSFER PHASE INITIATION (TPI) PROGRAM
// P34-35_P74-75.agc:373
//#		(P34/P74) AND IS PRESENTLY AVAILABLE IN STORAGE.
// P34-35_P74-75.agc:374
//#
// P34-35_P74-75.agc:375
//# Page 665
// P34-35_P74-75.agc:376
//#	(6)	ONCE THE PARAMETERS REQUIRED FOR COMPUTATION OF THE MANEUVER
// P34-35_P74-75.agc:377
//#		HAVE BEEN COMPLETELY SPECIFIED, THE VALUE OF THE ACTIVE
// P34-35_P74-75.agc:378
//#		VEHICLE CENTRAL ANGLE OF TRANSFER IS COMPUTED AND STORED.
// P34-35_P74-75.agc:379
//#		THIS NUMBER WILL BE AVAILABLE FOR DISPLAY TO THE ASTRONAUT
// P34-35_P74-75.agc:380
//#		THROUGH THE USE OF V06N52
// P34-35_P74-75.agc:381
//#
// P34-35_P74-75.agc:382
//#		THE ASTRONAUT WILL CALL THIS DISPLAY TO VERIFY THAT THE
// P34-35_P74-75.agc:383
//#		CENTRAL ANGLE OF TRANSFER OF THE ACTIVE VEHICLE IS NOT WITHIN
// P34-35_P74-75.agc:384
//#		170 TO 190 DEGREES.  IF THE ANGLE IS WITHIN THIS ZONE THE
// P34-35_P74-75.agc:385
//#		ASTRONAUT SHOULD REASSESS THE INPUT TARGETING PARAMETERS BASED
// P34-35_P74-75.agc:386
//#		UPON DELTA V AND EXPECTED MANEUVER TIME.
// P34-35_P74-75.agc:387
//#
// P34-35_P74-75.agc:388
//#	(7)	THIS PROGRAM IS SELECTED BY THE ASTRONAUT BY DSKY ENTRY --
// P34-35_P74-75.agc:389
//#
// P34-35_P74-75.agc:390
//#			P35 IF THIS VEHICLE IS ACTIVE VEHICLE.
// P34-35_P74-75.agc:391
//#
// P34-35_P74-75.agc:392
//#			P75 IF THIS VEHICLE IS PASSIVE VEHICLE.
// P34-35_P74-75.agc:393
//#
// P34-35_P74-75.agc:394
//# INPUT
// P34-35_P74-75.agc:395
//#
// P34-35_P74-75.agc:396
//#	(1)	TPASS4		TIME OF INTERCEPT -- SAVED FROM P34/P74
// P34-35_P74-75.agc:397
//#
// P34-35_P74-75.agc:398
//# OUTPUT
// P34-35_P74-75.agc:399
//#
// P34-35_P74-75.agc:400
//#	(1)	TRKMKCNT	NUMBER OF MARKS
// P34-35_P74-75.agc:401
//#	(2)	TTOGO		TIME TO GO
// P34-35_P74-75.agc:402
//#	(3)	+MGA		MIDOLF GIMBAL ANGLE
// P34-35_P74-75.agc:403
//#	(4)	DVLOS		DELTA VELOCITY AT MID -- LINE OF SIGHT
// P34-35_P74-75.agc:404
//#	(5)	DELVLVC		DELTA VELOCITY AT MID -- LOCAL VERTICAL COORDINATES
// P34-35_P74-75.agc:405
//#
// P34-35_P74-75.agc:406
//# DOWNLINK
// P34-35_P74-75.agc:407
//#
// P34-35_P74-75.agc:408
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// P34-35_P74-75.agc:409
//#	(2)	DELVEET3	DELTA VELOCITY AT TPM -- REFERENCE COORDINATES
// P34-35_P74-75.agc:410
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:411
//#
// P34-35_P74-75.agc:412
//# COMMUNICATION TO THRUSTING PROGRAMS
// P34-35_P74-75.agc:413
//#
// P34-35_P74-75.agc:414
//#	(1)	TIG		TIME OF THE TPM MANEUVER
// P34-35_P74-75.agc:415
//#	(2)	RTARG		OFFSET TARGET POSITION
// P34-35_P74-75.agc:416
//#	(3)	TPASS4		TIME OF INTERCEPT
// P34-35_P74-75.agc:417
//#	(4)	XDELVFLG	RESET TO INDICATE LAMBERT (AIMPOINT) VG COMPUTATION.
// P34-35_P74-75.agc:418
//#
// P34-35_P74-75.agc:419
//# SUBROUTINES USED
// P34-35_P74-75.agc:420
//#
// P34-35_P74-75.agc:421
//#	AVFLAGA
// P34-35_P74-75.agc:422
//#	AVFLAGP
// P34-35_P74-75.agc:423
//#	LOADTIME
// P34-35_P74-75.agc:424
//#	SELECTMU
// P34-35_P74-75.agc:425
//#	PRECSET
// P34-35_P74-75.agc:426
//#	S34/35.1
// P34-35_P74-75.agc:427
//#	S34/35.2
// P34-35_P74-75.agc:428
//# Page 666
// P34-35_P74-75.agc:429
//#	S34/35.5
// P34-35_P74-75.agc:430
//#	VN1645
// P34-35_P74-75.agc:431
//
// P34-35_P74-75.agc:432
//		COUNT*	$$/P3575
// P34-35_P74-75.agc:433
//		EBANK=	KT
// P34-35_P74-75.agc:434
//
// P34-35_P74-75.agc:435
//P35		TC	AVFLAGA
// slot 32213
                if slot <> 32213 or instruction <> 1255 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1255, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:436
//		EXTEND
// slot 32214
                if slot <> 32214 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32215 {
// P34-35_P74-75.agc:437
//		DCA	ATIGINC
// slot 32215
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
// P34-35_P74-75.agc:438
//		TC	P35/P75A
// slot 32216
                    if slot <> 32216 or instruction <> 1500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1500, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:439
//P75		TC	AVFLAGP
// slot 32217
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
// P34-35_P74-75.agc:440
//		EXTEND
// slot 32218
                if slot <> 32218 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:441
//		DCA	PTIGINC
// slot 32219
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
// P34-35_P74-75.agc:442
//P35/P75A	DXCH	KT
// slot 32220
                if slot <> 32220 or instruction <> 22398 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 894, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32221 {
// P34-35_P74-75.agc:443
//		TC	P20FLGON	# SET UPDATFLG, TRACKFLG
// slot 32221
                    if slot <> 32221 or instruction <> 1265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1265, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:444
//		TC	INTPRET
// slot 32222
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
// P34-35_P74-75.agc:445
//		CALL
// slot 32223
    32223, 65320,
// P34-35_P74-75.agc:446
//			SELECTMU
// slot 32224
    32224, 16384,
// P34-35_P74-75.agc:447
//P35/P75B	RTB
// slot 32225
    32225, 65336,
// P34-35_P74-75.agc:448
//			LOADTIME
// slot 32226
    32226, 18166,
// P34-35_P74-75.agc:449
//		STORE	TSTRT
// slot 32227
    32227, 3860,
// P34-35_P74-75.agc:450
//		DAD
// slot 32228
    32228, 65306,
// P34-35_P74-75.agc:451
//			KT
// slot 32229
    32229, 3836,
// P34-35_P74-75.agc:452
//		STORE	TIG
// slot 32230
    32230, 3652,
// P34-35_P74-75.agc:453
//		STORE	INTIME		# FOR INITVEL
// slot 32231
    32231, 3856,
// P34-35_P74-75.agc:454
//		STCALL	TDEC1
// slot 32232
    32232, 28738,
// P34-35_P74-75.agc:455
//			PRECSET		# ADVANCE BOTH VEHICLES
// slot 32233
    32233, 39392,
// P34-35_P74-75.agc:456
//		CALL
// slot 32234
    32234, 65320,
// P34-35_P74-75.agc:457
//			S34/35.1	# GET NORM AND LOS FOR TRANSFORM
// slot 32235
    32235, 60792,
// P34-35_P74-75.agc:458
//		CALL
// slot 32236
    32236, 65320,
// P34-35_P74-75.agc:459
//			S34/35.2	# GET DELTA V(LV)
// slot 32237
    32237, 60812,
// P34-35_P74-75.agc:460
//		CALL
// slot 32238
    32238, 65320,
// P34-35_P74-75.agc:461
//			S34/35.5
// slot 32239
    32239, 61092,
// P34-35_P74-75.agc:462
//		CALL
// slot 32240
    32240, 65320,
// P34-35_P74-75.agc:463
//			VN1645
// slot 32241
    32241, 61196,
// P34-35_P74-75.agc:464
//		GOTO
// slot 32242
    32242, 65360,
// P34-35_P74-75.agc:465
//			P35/P75B
// slot 32243
    32243, 60354,
// P34-35_P74-75.agc:466
//# Page 667
// P34-35_P74-75.agc:467
//# ***** S33/34.1 *****
// P34-35_P74-75.agc:468
//
// P34-35_P74-75.agc:469
//S33/34.1	STQ	SSP
// slot 32244
    32244, 55584,
// P34-35_P74-75.agc:470
//			NORMEX
// slot 32245
    32245, 3686,
// P34-35_P74-75.agc:471
//			TITER
// slot 32246
    32246, 3864,
// P34-35_P74-75.agc:472
//		OCT	40000
// slot 32247
    32247, 32768,
// P34-35_P74-75.agc:473
//		DLOAD	SETPD
// slot 32248
    32248, 33226,
// P34-35_P74-75.agc:474
//			MAX250
// slot 32249
    32249, 28600,
// P34-35_P74-75.agc:475
//			0D
// slot 32250
    32250, 2,
// P34-35_P74-75.agc:476
//		STOVL	SECMAX
// slot 32251
    32251, 24312,
// P34-35_P74-75.agc:477
//			RACT3
// slot 32252
    32252, 3772,
// P34-35_P74-75.agc:478
//		STOVL	RAPREC
// slot 32253
    32253, 24192,
// P34-35_P74-75.agc:479
//			VACT3
// slot 32254
    32254, 3784,
// P34-35_P74-75.agc:480
//		STOVL	VAPREC
// slot 32255
    32255, 24204,
// P34-35_P74-75.agc:481
//			RPASS3
// slot 32256
    32256, 3796,
// P34-35_P74-75.agc:482
//		STOVL	RPPREC
// slot 32257
    32257, 24228,
// P34-35_P74-75.agc:483
//			VPASS3
// slot 32258
    32258, 3808,
// P34-35_P74-75.agc:484
//		STORE	VPPREC
// slot 32259
    32259, 3760,
// P34-35_P74-75.agc:485
//ELCALC		CALL
// slot 32260
    32260, 65320,
// P34-35_P74-75.agc:486
//			S34/35.1	# NORMAL AND LOS
// slot 32261
    32261, 60792,
// P34-35_P74-75.agc:487
//		VXV	PDVL
// slot 32262
    32262, 52538,
// P34-35_P74-75.agc:488
//			RACT3		# (RA*VA)*RA 0D
// slot 32263
    32263, 3772,
// P34-35_P74-75.agc:489
//		PDVL	UNIT		# ULOS AT 6D
// slot 32264
    32264, 44698,
// P34-35_P74-75.agc:490
//			RACT3
// slot 32265
    32265, 3772,
// P34-35_P74-75.agc:491
//		PDVL	VPROJ		# XCHNJ AND UP
// slot 32266
    32266, 39322,
// P34-35_P74-75.agc:492
//		VSL2	BVSU
// slot 32267
    32267, 42452,
// P34-35_P74-75.agc:493
//			ULOS
// slot 32268
    32268, 2450,
// P34-35_P74-75.agc:494
//		UNIT	PDVL		# UP AT 0D
// slot 32269
    32269, 52572,
// P34-35_P74-75.agc:495
//		DOT	PDVL		# UP.UN*RA AT 0D
// slot 32270
    32270, 52546,
// P34-35_P74-75.agc:496
//			0D		# UP IN MPAC
// slot 32271
    32271, 2,
// P34-35_P74-75.agc:497
//		DOT	SIGN
// slot 32272
    32272, 62786,
// P34-35_P74-75.agc:498
//			ULOS
// slot 32273
    32273, 2450,
// P34-35_P74-75.agc:499
//		SL1	ACOS
// slot 32274
    32274, 54996,
// P34-35_P74-75.agc:500
//		PDVL	DOT		# EA AT 0D
// slot 32275
    32275, 41370,
// P34-35_P74-75.agc:501
//			ULOS
// slot 32276
    32276, 2450,
// P34-35_P74-75.agc:502
//			RACT3
// slot 32277
    32277, 3772,
// P34-35_P74-75.agc:503
//		BPL	DLOAD
// slot 32278
    32278, 58696,
// P34-35_P74-75.agc:504
//			TESTY
// slot 32279
    32279, 60468,
// P34-35_P74-75.agc:505
//			DPPOSMAX
// slot 32280
    32280, 6832,
// P34-35_P74-75.agc:506
//		DSU	PUSH
// slot 32281
    32281, 34346,
// P34-35_P74-75.agc:507
//TESTY		BOFF	DLOAD
// slot 32282
    32282, 58648,
// P34-35_P74-75.agc:508
//			ITSWICH
// slot 32283
    32283, 4032,
// P34-35_P74-75.agc:509
//			ELEX
// slot 32284
    32284, 60770,
// P34-35_P74-75.agc:510
//			DELEL
// slot 32285
    32285, 3836,
// P34-35_P74-75.agc:511
//		STODL	DELELO
// slot 32286
    32286, 12342,
// P34-35_P74-75.agc:512
//		DSU
// slot 32287
    32287, 65322,
// P34-35_P74-75.agc:513
//			ELEV
// slot 32288
    32288, 2398,
// P34-35_P74-75.agc:514
//		STORE	DELEL
// slot 32289
    32289, 3836,
// P34-35_P74-75.agc:515
//		ABS	DSU
// slot 32290
    32290, 38220,
// P34-35_P74-75.agc:516
//			ELEPS
// slot 32291
    32291, 28608,
// P34-35_P74-75.agc:517
//# Page 668
// P34-35_P74-75.agc:518
//		BMN
// slot 32292
    32292, 65344,
// P34-35_P74-75.agc:519
//			TIMEX		# COMMERCIALS EVERYWHERE
// slot 32293
    32293, 60786,
// P34-35_P74-75.agc:520
//FIGTIME		SLOAD	SR1
// slot 32294
    32294, 58042,
// P34-35_P74-75.agc:521
//			TITER
// slot 32295
    32295, 3864,
// P34-35_P74-75.agc:522
//		BHIZ	LXA,1
// slot 32296
    32296, 59440,
// P34-35_P74-75.agc:523
//			NORMEX		# TOO MANY ITERATIONS
// slot 32297
    32297, 3686,
// P34-35_P74-75.agc:524
//			MPAC
// slot 32298
    32298, 216,
// P34-35_P74-75.agc:525
//		SXA,1	VLOAD
// slot 32299
    32299, 64944,
// P34-35_P74-75.agc:526
//			TITER
// slot 32300
    32300, 3862,
// P34-35_P74-75.agc:527
//			RPASS3
// slot 32301
    32301, 3796,
// P34-35_P74-75.agc:528
//		UNIT	PDDL
// slot 32302
    32302, 54620,
// P34-35_P74-75.agc:529
//			36D
// slot 32303
    32303, 74,
// P34-35_P74-75.agc:530
//		PDVL	UNIT
// slot 32304
    32304, 44698,
// P34-35_P74-75.agc:531
//			RACT3
// slot 32305
    32305, 3772,
// P34-35_P74-75.agc:532
//		PDDL
// slot 32306
    32306, 65450,
// P34-35_P74-75.agc:533
//		PDDL	PUSH
// slot 32307
    32307, 34474,
// P34-35_P74-75.agc:534
//			36D
// slot 32308
    32308, 74,
// P34-35_P74-75.agc:535
//		BDSU
// slot 32309
    32309, 65314,
// P34-35_P74-75.agc:536
//			12D
// slot 32310
    32310, 26,
// P34-35_P74-75.agc:537
//		STODL	30D		# RP - RA MAGNITUDES
// slot 32311
    32311, 12350,
// P34-35_P74-75.agc:538
//			DPHALF
// slot 32312
    32312, 6816,
// P34-35_P74-75.agc:539
//		DSU	PUSH
// slot 32313
    32313, 34346,
// P34-35_P74-75.agc:540
//			ELEV
// slot 32314
    32314, 2398,
// P34-35_P74-75.agc:541
//		SIGN	BMN
// slot 32315
    32315, 41194,
// P34-35_P74-75.agc:542
//			30D
// slot 32316
    32316, 62,
// P34-35_P74-75.agc:543
//			NORMEX
// slot 32317
    32317, 3686,
// P34-35_P74-75.agc:544
//		DLOAD	COS
// slot 32318
    32318, 59082,
// P34-35_P74-75.agc:545
//		DMP	DDV
// slot 32319
    32319, 47370,
// P34-35_P74-75.agc:546
//			14D
// slot 32320
    32320, 30,
// P34-35_P74-75.agc:547
//			12D
// slot 32321
    32321, 26,
// P34-35_P74-75.agc:548
//		DCOMP			# SINCE COS(180-A)=-COS A
// slot 32322
    32322, 65404,
// P34-35_P74-75.agc:549
//		STORE	28D
// slot 32323
    32323, 58,
// P34-35_P74-75.agc:550
//		ABS	BDSU
// slot 32324
    32324, 37196,
// P34-35_P74-75.agc:551
//			DPHALF
// slot 32325
    32325, 6816,
// P34-35_P74-75.agc:552
//		BMN	VLOAD
// slot 32326
    32326, 64832,
// P34-35_P74-75.agc:553
//			NORMEX
// slot 32327
    32327, 3686,
// P34-35_P74-75.agc:554
//			UNRM
// slot 32328
    32328, 2402,
// P34-35_P74-75.agc:555
//		VXV	UNIT
// slot 32329
    32329, 44602,
// P34-35_P74-75.agc:556
//			6D		# UN*RA
// slot 32330
    32330, 14,
// P34-35_P74-75.agc:557
//		DOT	DMP
// slot 32331
    32331, 34114,
// P34-35_P74-75.agc:558
//			VACT3
// slot 32332
    32332, 3784,
// P34-35_P74-75.agc:559
//			12D
// slot 32333
    32333, 26,
// P34-35_P74-75.agc:560
//		PDVL	VXV
// slot 32334
    32334, 40346,
// P34-35_P74-75.agc:561
//			0D
// slot 32335
    32335, 2,
// P34-35_P74-75.agc:562
//			VPASS3
// slot 32336
    32336, 3808,
// P34-35_P74-75.agc:563
//		VXV	UNIT
// slot 32337
    32337, 44602,
// P34-35_P74-75.agc:564
//			0D		# (RP*VP)*RP
// slot 32338
    32338, 2,
// P34-35_P74-75.agc:565
//		DOT	DMP
// slot 32339
    32339, 34114,
// P34-35_P74-75.agc:566
//			VPASS3
// slot 32340
    32340, 3808,
// P34-35_P74-75.agc:567
//			14D
// slot 32341
    32341, 30,
// P34-35_P74-75.agc:568
//# Page 669
// P34-35_P74-75.agc:569
//		BDSU
// slot 32342
    32342, 65314,
// P34-35_P74-75.agc:570
//		NORM	PDVL		# NORMALIZED WA - WP 12D
// slot 32343
    32343, 52610,
// P34-35_P74-75.agc:571
//			X1
// slot 32344
    32344, 78,
// P34-35_P74-75.agc:572
//			6D
// slot 32345
    32345, 14
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:573
//		VXV	DOT
// slot 32346
    32346, 41274,
// P34-35_P74-75.agc:574
//			0D
// slot 32347
    32347, 2,
// P34-35_P74-75.agc:575
//			UNRM		# RA*RP.UN 14D
// slot 32348
    32348, 2402,
// P34-35_P74-75.agc:576
//		PDVL	DOT
// slot 32349
    32349, 41370,
// P34-35_P74-75.agc:577
//			0D
// slot 32350
    32350, 2,
// P34-35_P74-75.agc:578
//			6D
// slot 32351
    32351, 14,
// P34-35_P74-75.agc:579
//		SL1	ACOS
// slot 32352
    32352, 54996,
// P34-35_P74-75.agc:580
//		SIGN
// slot 32353
    32353, 65514,
// P34-35_P74-75.agc:581
//		DSU	DAD		# ALPHA PI
// slot 32354
    32354, 36138,
// P34-35_P74-75.agc:582
//			DPHALF
// slot 32355
    32355, 6816,
// P34-35_P74-75.agc:583
//			ELEV
// slot 32356
    32356, 2398,
// P34-35_P74-75.agc:584
//		PDDL	ACOS
// slot 32357
    32357, 54954,
// P34-35_P74-75.agc:585
//			28D
// slot 32358
    32358, 58,
// P34-35_P74-75.agc:586
//		BDSU	SIGN
// slot 32359
    32359, 62754,
// P34-35_P74-75.agc:587
//			DPHALF
// slot 32360
    32360, 6816,
// P34-35_P74-75.agc:588
//			30D		# CONTAINS RP-RA
// slot 32361
    32361, 62,
// P34-35_P74-75.agc:589
//		DAD
// slot 32362
    32362, 65306,
// P34-35_P74-75.agc:590
//		DMP	DDV
// slot 32363
    32363, 47370,
// P34-35_P74-75.agc:591
//			TWOPI
// slot 32364
    32364, 28596,
// P34-35_P74-75.agc:592
//		DMP
// slot 32365
    32365, 65290,
// P34-35_P74-75.agc:593
//		SL*	DMP
// slot 32366
    32366, 34142,
// P34-35_P74-75.agc:594
//			0 	-3,1
// slot 32367
    32367, 16636,
// P34-35_P74-75.agc:595
//		PUSH	ABS
// slot 32368
    32368, 42508,
// P34-35_P74-75.agc:596
//		DSU	BMN
// slot 32369
    32369, 41002,
// P34-35_P74-75.agc:597
//			SECMAX
// slot 32370
    32370, 3832,
// P34-35_P74-75.agc:598
//			OKMAX
// slot 32371
    32371, 60654,
// P34-35_P74-75.agc:599
//		DLOAD	SIGN		# REPLACE TIME WITH MAX TIME SIGNED
// slot 32372
    32372, 62922,
// P34-35_P74-75.agc:600
//			SECMAX
// slot 32373
    32373, 3832,
// P34-35_P74-75.agc:601
//		PUSH
// slot 32374
    32374, 65292,
// P34-35_P74-75.agc:602
//OKMAX		SLOAD	BPL		# TEST FIRST ITERATION
// slot 32375
    32375, 42170,
// P34-35_P74-75.agc:603
//			TITER
// slot 32376
    32376, 3864,
// P34-35_P74-75.agc:604
//			REPETE
// slot 32377
    32377, 60670,
// P34-35_P74-75.agc:605
//		SSP	DLOAD
// slot 32378
    32378, 58802,
// P34-35_P74-75.agc:606
//			TITER
// slot 32379
    32379, 3864,
// P34-35_P74-75.agc:607
//		OCT	37777
// slot 32380
    32380, 32766,
// P34-35_P74-75.agc:608
//		GOTO
// slot 32381
    32381, 65360,
// P34-35_P74-75.agc:609
//			STORDELT
// slot 32382
    32382, 60730,
// P34-35_P74-75.agc:610
//REPETE		DLOAD	DMP
// slot 32383
    32383, 34250,
// P34-35_P74-75.agc:611
//			DELEL
// slot 32384
    32384, 3836,
// P34-35_P74-75.agc:612
//			DELELO
// slot 32385
    32385, 54,
// P34-35_P74-75.agc:613
//		BPL	DLOAD
// slot 32386
    32386, 58696,
// P34-35_P74-75.agc:614
//			NEXTES
// slot 32387
    32387, 60694,
// P34-35_P74-75.agc:615
//			SECMAX
// slot 32388
    32388, 3832,
// P34-35_P74-75.agc:616
//		DMP
// slot 32389
    32389, 65290,
// P34-35_P74-75.agc:617
//			THIRD
// slot 32390
    32390, 28604,
// P34-35_P74-75.agc:618
//		STODL	SECMAX
// slot 32391
    32391, 16120,
// P34-35_P74-75.agc:619
//# Page 670
// P34-35_P74-75.agc:620
//		ABS	SR1		# CROSSED OVER SOLUTION
// slot 32392
    32392, 57932,
// P34-35_P74-75.agc:621
//		DCOMP	GOTO		# DT=(-SIGN(DTO)//DT//)/2
// slot 32393
    32393, 43132,
// P34-35_P74-75.agc:622
//			RESIGN
// slot 32394
    32394, 60710,
// P34-35_P74-75.agc:623
//NEXTES		DLOAD	ABS
// slot 32395
    32395, 42698,
// P34-35_P74-75.agc:624
//			DELEL
// slot 32396
    32396, 3836,
// P34-35_P74-75.agc:625
//		PDDL	ABS
// slot 32397
    32397, 42666,
// P34-35_P74-75.agc:626
//			DELELO
// slot 32398
    32398, 54,
// P34-35_P74-75.agc:627
//		DSU
// slot 32399
    32399, 65322,
// P34-35_P74-75.agc:628
//		BMN	DLOAD
// slot 32400
    32400, 58688,
// P34-35_P74-75.agc:629
//			REVERS		# WRONG DIRECTION
// slot 32401
    32401, 60716,
// P34-35_P74-75.agc:630
//		ABS
// slot 32402
    32402, 65356,
// P34-35_P74-75.agc:631
//RESIGN		SIGN 	GOTO
// slot 32403
    32403, 43242,
// P34-35_P74-75.agc:632
//			DELTEEO
// slot 32404
    32404, 3852,
// P34-35_P74-75.agc:633
//			STORDELT
// slot 32405
    32405, 60730,
// P34-35_P74-75.agc:634
//REVERS		DLOAD	DCOMP
// slot 32406
    32406, 48842,
// P34-35_P74-75.agc:635
//			DELTEEO
// slot 32407
    32407, 3852,
// P34-35_P74-75.agc:636
//		PUSH	SR1
// slot 32408
    32408, 57868,
// P34-35_P74-75.agc:637
//		STORE	DELTEEO
// slot 32409
    32409, 3852,
// P34-35_P74-75.agc:638
//		DAD
// slot 32410
    32410, 65306,
// P34-35_P74-75.agc:639
//		GOTO
// slot 32411
    32411, 65360,
// P34-35_P74-75.agc:640
//			ADTIME
// slot 32412
    32412, 60732,
// P34-35_P74-75.agc:641
//STORDELT	STORE	DELTEEO
// slot 32413
    32413, 3852,
// P34-35_P74-75.agc:642
//ADTIME		DAD
// slot 32414
    32414, 65306,
// P34-35_P74-75.agc:643
//			NOMTPI		# SUM OF DELTA T'S
// slot 32415
    32415, 2462,
// P34-35_P74-75.agc:644
//		STORE	NOMTPI
// slot 32416
    32416, 2462,
// P34-35_P74-75.agc:645
//		VLOAD	PDVL
// slot 32417
    32417, 52730,
// P34-35_P74-75.agc:646
//			VAPREC
// slot 32418
    32418, 3724,
// P34-35_P74-75.agc:647
//			RAPREC
// slot 32419
    32419, 3712,
// P34-35_P74-75.agc:648
//		CALL
// slot 32420
    32420, 65320,
// P34-35_P74-75.agc:649
//			GOINT
// slot 32421
    32421, 61028,
// P34-35_P74-75.agc:650
//		CALL
// slot 32422
    32422, 65320,
// P34-35_P74-75.agc:651
//			ACTIVE		# STORE NEW RACT3 VACT3
// slot 32423
    32423, 39428,
// P34-35_P74-75.agc:652
//		VLOAD	PDVL
// slot 32424
    32424, 52730,
// P34-35_P74-75.agc:653
//			VPPREC
// slot 32425
    32425, 3760,
// P34-35_P74-75.agc:654
//			RPPREC
// slot 32426
    32426, 3748,
// P34-35_P74-75.agc:655
//		CALL
// slot 32427
    32427, 65320,
// P34-35_P74-75.agc:656
//			GOINT
// slot 32428
    32428, 61028,
// P34-35_P74-75.agc:657
//		CALL
// slot 32429
    32429, 65320,
// P34-35_P74-75.agc:658
//			PASSIVE		# STORE NEW RPASS3 VPASS3
// slot 32430
    32430, 39444,
// P34-35_P74-75.agc:659
//		GOTO
// slot 32431
    32431, 65360,
// P34-35_P74-75.agc:660
//			ELCALC
// slot 32432
    32432, 60424,
// P34-35_P74-75.agc:661
//ELEX		DLOAD	DAD
// slot 32433
    32433, 36298,
// P34-35_P74-75.agc:662
//			TTPI
// slot 32434
    32434, 3900,
// P34-35_P74-75.agc:663
//			NOMTPI
// slot 32435
    32435, 2462,
// P34-35_P74-75.agc:664
//		STODL	TTPI
// slot 32436
    32436, 16188,
// P34-35_P74-75.agc:665
//		BON
// slot 32437
    32437, 65304,
// P34-35_P74-75.agc:666
//			ETPIFLAG
// slot 32438
    32438, 1424,
// P34-35_P74-75.agc:667
//			TIMEX
// slot 32439
    32439, 60786,
// P34-35_P74-75.agc:668
//		STORE	ELEV
// slot 32440
    32440, 2398,
// P34-35_P74-75.agc:669
//TIMEX		DLOAD	GOTO
// slot 32441
    32441, 43210,
// P34-35_P74-75.agc:670
//# Page 671
// P34-35_P74-75.agc:671
//			ZEROVECS
// slot 32442
    32442, 6820,
// P34-35_P74-75.agc:672
//			NORMEX
// slot 32443
    32443, 3686,
// P34-35_P74-75.agc:673
//
// P34-35_P74-75.agc:674
//# Page 672
// P34-35_P74-75.agc:675
//# ***** S34/35.1 *****
// P34-35_P74-75.agc:676
//
// P34-35_P74-75.agc:677
//# COMPUTE UNIT NORMAL AND LINE OF SIGHT VECTORS GIVEN THE ACTIVE AND
// P34-35_P74-75.agc:678
//# PASSIVE POS AND VEL AT TIME T3
// P34-35_P74-75.agc:679
//
// P34-35_P74-75.agc:680
//S34/35.1	VLOAD	VSU
// slot 32444
    32444, 43514,
// P34-35_P74-75.agc:681
//			RPASS3
// slot 32445
    32445, 3796,
// P34-35_P74-75.agc:682
//			RACT3
// slot 32446
    32446, 3772,
// P34-35_P74-75.agc:683
//		UNIT	PUSH
// slot 32447
    32447, 34396,
// P34-35_P74-75.agc:684
//		STOVL	ULOS
// slot 32448
    32448, 22930,
// P34-35_P74-75.agc:685
//			RACT3
// slot 32449
    32449, 3772,
// P34-35_P74-75.agc:686
//		VXV	UNIT
// slot 32450
    32450, 44602,
// P34-35_P74-75.agc:687
//			VACT3
// slot 32451
    32451, 3784,
// P34-35_P74-75.agc:688
//		STORE	UNRM
// slot 32452
    32452, 2402,
// P34-35_P74-75.agc:689
//		RVQ
// slot 32453
    32453, 65308,
// P34-35_P74-75.agc:690
//
// P34-35_P74-75.agc:691
//# Page 673
// P34-35_P74-75.agc:692
//# ***** S34/35.2 *****
// P34-35_P74-75.agc:693
//
// P34-35_P74-75.agc:694
//# ADVANCE PASSIVE VEH TO RENDEZVOUS TIME AND GET REQ VEL FROM LAMBERT
// P34-35_P74-75.agc:695
//
// P34-35_P74-75.agc:696
//S34/35.2 	STQ	VLOAD
// slot 32454
    32454, 64800,
// P34-35_P74-75.agc:697
//			SUBEXIT
// slot 32455
    32455, 3696,
// P34-35_P74-75.agc:698
//			VPASS3
// slot 32456
    32456, 3808,
// P34-35_P74-75.agc:699
//		PDVL	PDDL
// slot 32457
    32457, 54682,
// P34-35_P74-75.agc:700
//			RPASS3
// slot 32458
    32458, 3796
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:701
//			INTIME
// slot 32459
    32459, 3856,
// P34-35_P74-75.agc:702
//		PDDL	PDDL
// slot 32460
    32460, 54698,
// P34-35_P74-75.agc:703
//			TPASS4
// slot 32461
    32461, 3890,
// P34-35_P74-75.agc:704
//			TWOPI		# CONIC
// slot 32462
    32462, 28596,
// P34-35_P74-75.agc:705
//		PDDL	BHIZ
// slot 32463
    32463, 39082,
// P34-35_P74-75.agc:706
//			NN
// slot 32464
    32464, 3694,
// P34-35_P74-75.agc:707
//			S3435.23
// slot 32465
    32465, 60842,
// P34-35_P74-75.agc:708
//		DLOAD
// slot 32466
    32466, 65482,
// P34-35_P74-75.agc:709
//		DLOAD	PUSH
// slot 32467
    32467, 34506,
// P34-35_P74-75.agc:710
//			ZEROVECS	# PRECISION
// slot 32468
    32468, 6820,
// P34-35_P74-75.agc:711
//S3435.23	CALL
// slot 32469
    32469, 65320,
// P34-35_P74-75.agc:712
//			INTINT		# GET TARGET VECTOR
// slot 32470
    32470, 61036,
// P34-35_P74-75.agc:713
//S3435.25	STOVL	RTARG
// slot 32471
    32471, 24136,
// P34-35_P74-75.agc:714
//			VATT
// slot 32472
    32472, 14,
// P34-35_P74-75.agc:715
//		STOVL	VPASS4
// slot 32473
    32473, 24204,
// P34-35_P74-75.agc:716
//			RTARG
// slot 32474
    32474, 3656,
// P34-35_P74-75.agc:717
//# COMPUTE PHI = PI + (ACOS(UNIT RA.UNIT RP) - PI)SIGN(RA*RP.U)
// P34-35_P74-75.agc:718
//		UNIT	PDVL		# UNIT RP
// slot 32475
    32475, 52572,
// P34-35_P74-75.agc:719
//			RACT3
// slot 32476
    32476, 3772,
// P34-35_P74-75.agc:720
//		UNIT	PUSH		# UNIT RA
// slot 32477
    32477, 34396,
// P34-35_P74-75.agc:721
//		VXV	DOT
// slot 32478
    32478, 41274,
// P34-35_P74-75.agc:722
//			0D
// slot 32479
    32479, 2,
// P34-35_P74-75.agc:723
//			UNRM		# RA*RP.U
// slot 32480
    32480, 2402,
// P34-35_P74-75.agc:724
//		PDVL
// slot 32481
    32481, 65434,
// P34-35_P74-75.agc:725
//		DOT	SL1		# UNIT RA.UNIT RP
// slot 32482
    32482, 59970,
// P34-35_P74-75.agc:726
//			0D
// slot 32483
    32483, 2,
// P34-35_P74-75.agc:727
//		ACOS	SIGN
// slot 32484
    32484, 62892,
// P34-35_P74-75.agc:728
//		BPL	DAD
// slot 32485
    32485, 36168,
// P34-35_P74-75.agc:729
//			NOPIE
// slot 32486
    32486, 60880,
// P34-35_P74-75.agc:730
//			DPPOSMAX	# REASONABLE TWO PI
// slot 32487
    32487, 6832,
// P34-35_P74-75.agc:731
//NOPIE		STODL	ACTCENT
// slot 32488
    32488, 14300,
// P34-35_P74-75.agc:732
//			TPASS4
// slot 32489
    32489, 3890,
// P34-35_P74-75.agc:733
//		DSU
// slot 32490
    32490, 65322,
// P34-35_P74-75.agc:734
//			INTIME
// slot 32491
    32491, 3856,
// P34-35_P74-75.agc:735
//		STORE	DELLT4
// slot 32492
    32492, 3668,
// P34-35_P74-75.agc:736
//		SLOAD	SETPD
// slot 32493
    32493, 33210,
// P34-35_P74-75.agc:737
//			NN		# NUMBER OF OFFSETS
// slot 32494
    32494, 3694,
// P34-35_P74-75.agc:738
//			0D
// slot 32495
    32495, 2,
// P34-35_P74-75.agc:739
//		PDDL	PDVL
// slot 32496
    32496, 52650,
// P34-35_P74-75.agc:740
//			EPSFOUR
// slot 32497
    32497, 28616,
// P34-35_P74-75.agc:741
//			RACT3
// slot 32498
    32498, 3772,
// P34-35_P74-75.agc:742
//		STOVL	RINIT
// slot 32499
    32499, 22950,
// P34-35_P74-75.agc:743
//# Page 674
// P34-35_P74-75.agc:744
//			VACT3
// slot 32500
    32500, 3784,
// P34-35_P74-75.agc:745
//		STCALL	VINIT
// slot 32501
    32501, 31154,
// P34-35_P74-75.agc:746
//			INITVEL
// slot 32502
    32502, 18432,
// P34-35_P74-75.agc:747
//		CALL
// slot 32503
    32503, 65320,
// P34-35_P74-75.agc:748
//			LOMAT
// slot 32504
    32504, 61006,
// P34-35_P74-75.agc:749
//		VLOAD	MXV
// slot 32505
    32505, 53754,
// P34-35_P74-75.agc:750
//			DELVEET3
// slot 32506
    32506, 2540,
// P34-35_P74-75.agc:751
//			0D
// slot 32507
    32507, 2,
// P34-35_P74-75.agc:752
//		VSL1
// slot 32508
    32508, 65524,
// P34-35_P74-75.agc:753
//		STCALL	DELVLVC
// slot 32509
    32509, 32312,
// P34-35_P74-75.agc:754
//			SUBEXIT
// slot 32510
    32510, 3696,
// P34-35_P74-75.agc:755
//
// P34-35_P74-75.agc:756
//# Page 675
// P34-35_P74-75.agc:757
//# ***** S34/35.3 *****
// P34-35_P74-75.agc:758
//
// P34-35_P74-75.agc:759
//S34/35.3	STQ	CALL
// slot 32511
    32511, 37920,
// P34-35_P74-75.agc:760
//			NORMEX
// slot 32512
    32512, 3686,
// P34-35_P74-75.agc:761
//			LOMAT		# GET MATRIX IN PUSH LIST
// slot 32513
    32513, 61006,
// P34-35_P74-75.agc:762
//		VLOAD	VXM
// slot 32514
    32514, 50682,
// P34-35_P74-75.agc:763
//			DELVLVC		# NEW DEL V TPI
// slot 32515
    32515, 3640,
// P34-35_P74-75.agc:764
//			0D
// slot 32516
    32516, 2,
// P34-35_P74-75.agc:765
//		VSL1
// slot 32517
    32517, 65524,
// P34-35_P74-75.agc:766
//		STORE	DELVEET3	# SAVE FOR TRANSFORM
// slot 32518
    32518, 2540,
// P34-35_P74-75.agc:767
//		VAD	PDVL
// slot 32519
    32519, 52570,
// P34-35_P74-75.agc:768
//			VACT3		# NEW V REQ
// slot 32520
    32520, 3784,
// P34-35_P74-75.agc:769
//			RACT3
// slot 32521
    32521, 3772,
// P34-35_P74-75.agc:770
//		PDDL	PDDL
// slot 32522
    32522, 54698,
// P34-35_P74-75.agc:771
//			TIG
// slot 32523
    32523, 3652,
// P34-35_P74-75.agc:772
//			TPASS4
// slot 32524
    32524, 3890,
// P34-35_P74-75.agc:773
//		PDDL	PUSH
// slot 32525
    32525, 34474,
// P34-35_P74-75.agc:774
//			DPPOSMAX
// slot 32526
    32526, 6832,
// P34-35_P74-75.agc:775
//		CALL			# INTEG. FOR NEW TARGET VEC
// slot 32527
    32527, 65320,
// P34-35_P74-75.agc:776
//			INTINT
// slot 32528
    32528, 61036,
// P34-35_P74-75.agc:777
//		VLOAD
// slot 32529
    32529, 65530,
// P34-35_P74-75.agc:778
//			RATT
// slot 32530
    32530, 2,
// P34-35_P74-75.agc:779
//		STORE	RTARG
// slot 32531
    32531, 3656,
// P34-35_P74-75.agc:780
//NOVRWRT		VLOAD	PUSH
// slot 32532
    32532, 34554,
// P34-35_P74-75.agc:781
//			ULOS
// slot 32533
    32533, 2450,
// P34-35_P74-75.agc:782
//		VXV	VCOMP
// slot 32534
    32534, 48698,
// P34-35_P74-75.agc:783
//			UNRM
// slot 32535
    32535, 2402,
// P34-35_P74-75.agc:784
//		UNIT	PUSH
// slot 32536
    32536, 34396,
// P34-35_P74-75.agc:785
//		VXV	VSL1
// slot 32537
    32537, 64058,
// P34-35_P74-75.agc:786
//			ULOS
// slot 32538
    32538, 2450,
// P34-35_P74-75.agc:787
//		PDVL
// slot 32539
    32539, 65434,
// P34-35_P74-75.agc:788
//		PDVL	MXV
// slot 32540
    32540, 53658,
// P34-35_P74-75.agc:789
//			DELVEET3
// slot 32541
    32541, 2540,
// P34-35_P74-75.agc:790
//			0D
// slot 32542
    32542, 2,
// P34-35_P74-75.agc:791
//		VSL1
// slot 32543
    32543, 65524,
// P34-35_P74-75.agc:792
//		STCALL	DVLOS
// slot 32544
    32544, 31110,
// P34-35_P74-75.agc:793
//			NORMEX
// slot 32545
    32545, 3686,
// P34-35_P74-75.agc:794
//
// P34-35_P74-75.agc:795
//# Page 676
// P34-35_P74-75.agc:796
//# ***** S34/35.4 *****
// P34-35_P74-75.agc:797
//
// P34-35_P74-75.agc:798
//S34/35.4	STQ	SETPD		# NO ASTRONAUT OVERWRITE
// slot 32546
    32546, 33056,
// P34-35_P74-75.agc:799
//			NORMEX
// slot 32547
    32547, 3686,
// P34-35_P74-75.agc:800
//			0D
// slot 32548
    32548, 2,
// P34-35_P74-75.agc:801
//		GOTO
// slot 32549
    32549, 65360,
// P34-35_P74-75.agc:802
//			NOVRWRT
// slot 32550
    32550, 60968,
// P34-35_P74-75.agc:803
//
// P34-35_P74-75.agc:804
//# Page 677
// P34-35_P74-75.agc:805
//# ***** LOMAT *****
// P34-35_P74-75.agc:806
//
// P34-35_P74-75.agc:807
//LOMAT		VLOAD	VCOMP
// slot 32551
    32551, 48890,
// P34-35_P74-75.agc:808
//			UNRM
// slot 32552
    32552, 2402,
// P34-35_P74-75.agc:809
//		STOVL	6D		# Y
// slot 32553
    32553, 20494,
// P34-35_P74-75.agc:810
//			RACT3
// slot 32554
    32554, 3772,
// P34-35_P74-75.agc:811
//		UNIT	VCOMP
// slot 32555
    32555, 48732,
// P34-35_P74-75.agc:812
//		STORE	12D
// slot 32556
    32556, 26,
// P34-35_P74-75.agc:813
//		VXV	VSL1
// slot 32557
    32557, 64058,
// P34-35_P74-75.agc:814
//			UNRM		# Z*-Y
// slot 32558
    32558, 2402,
// P34-35_P74-75.agc:815
//		STORE	0D
// slot 32559
    32559, 2,
// P34-35_P74-75.agc:816
//		SETPD	RVQ
// slot 32560
    32560, 36354,
// P34-35_P74-75.agc:817
//			18D
// slot 32561
    32561, 38,
// P34-35_P74-75.agc:818
//GOINT		PDDL	PDDL		# DO
// slot 32562
    32562, 54698,
// P34-35_P74-75.agc:819
//			ZEROVECS	#	NOT
// slot 32563
    32563, 6820,
// P34-35_P74-75.agc:820
//			NOMTPI		#
// slot 32564
    32564, 2462,
// P34-35_P74-75.agc:821
//		PUSH	PUSH		#		ORDER OR INSERT BEFORE INTINT
// slot 32565
    32565, 34316,
// P34-35_P74-75.agc:822
//INTINT		STQ	CALL
// slot 32566
    32566, 37920,
// P34-35_P74-75.agc:823
//			RTRN
// slot 32567
    32567, 3690,
// P34-35_P74-75.agc:824
//			INTSTALL
// slot 32568
    32568, 24088,
// P34-35_P74-75.agc:825
//		CLEAR	DLOAD
// slot 32569
    32569, 58648,
// P34-35_P74-75.agc:826
//			INTYPFLG
// slot 32570
    32570, 1910,
// P34-35_P74-75.agc:827
//		BZE	SET
// slot 32571
    32571, 35928,
// P34-35_P74-75.agc:828
//			+2
// slot 32572
    32572, 61052
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:829
//			INTYPFLG
// slot 32573
    32573, 1654,
// P34-35_P74-75.agc:830
//		DLOAD	STADR
// slot 32574
    32574, 38602,
// P34-35_P74-75.agc:831
//		STODL	TDEC1
// slot 32575
    32575, 53180,
// P34-35_P74-75.agc:832
//		SET	LXA,2
// slot 32576
    32576, 60440,
// P34-35_P74-75.agc:833
//			MOONFLAG
// slot 32577
    32577, 102,
// P34-35_P74-75.agc:834
//			RTX2
// slot 32578
    32578, 3070,
// P34-35_P74-75.agc:835
//		BON	CLEAR
// slot 32579
    32579, 35864,
// P34-35_P74-75.agc:836
//			CMOONFLG
// slot 32580
    32580, 4486,
// P34-35_P74-75.agc:837
//			ALLSET
// slot 32581
    32581, 61070,
// P34-35_P74-75.agc:838
//			MOONFLAG
// slot 32582
    32582, 358,
// P34-35_P74-75.agc:839
//ALLSET		STOVL	TET
// slot 32583
    32583, 22174,
// P34-35_P74-75.agc:840
//		VSR*
// slot 32584
    32584, 65374,
// P34-35_P74-75.agc:841
//			0,2
// slot 32585
    32585, 48380,
// P34-35_P74-75.agc:842
//		STOVL	RCV
// slot 32586
    32586, 22202,
// P34-35_P74-75.agc:843
//		VSR*
// slot 32587
    32587, 65374,
// P34-35_P74-75.agc:844
//			0,2
// slot 32588
    32588, 48380,
// P34-35_P74-75.agc:845
//		STCALL	VCV
// slot 32589
    32589, 30406,
// P34-35_P74-75.agc:846
//			INTEGRVS
// slot 32590
    32590, 23694,
// P34-35_P74-75.agc:847
//		VLOAD	GOTO
// slot 32591
    32591, 43258,
// P34-35_P74-75.agc:848
//			RATT
// slot 32592
    32592, 2,
// P34-35_P74-75.agc:849
//			RTRN
// slot 32593
    32593, 3690,
// P34-35_P74-75.agc:850
//
// P34-35_P74-75.agc:851
//# Page 678
// P34-35_P74-75.agc:852
//# ***** S34/35.5 *****
// P34-35_P74-75.agc:853
//# SUBROUTINES USED
// P34-35_P74-75.agc:854
//#	BANKCALL
// P34-35_P74-75.agc:855
//#	GOFLASH
// P34-35_P74-75.agc:856
//#	GOTOPOOH
// P34-35_P74-75.agc:857
//#	S34/35.3
// P34-35_P74-75.agc:858
//#	S34.35.4
// P34-35_P74-75.agc:859
//#	VNPOOH
// P34-35_P74-75.agc:860
//
// P34-35_P74-75.agc:861
//S34/35.5	STQ	BON
// slot 32594
    32594, 35872,
// P34-35_P74-75.agc:862
//			SUBEXIT
// slot 32595
    32595, 3696,
// P34-35_P74-75.agc:863
//			FINALFLG
// slot 32596
    32596, 1426,
// P34-35_P74-75.agc:864
//			FLAGON
// slot 32597
    32597, 61106,
// P34-35_P74-75.agc:865
//		SET	GOTO
// slot 32598
    32598, 43032,
// P34-35_P74-75.agc:866
//			UPDATFLG
// slot 32599
    32599, 624,
// P34-35_P74-75.agc:867
//			FLAGOFF
// slot 32600
    32600, 61180,
// P34-35_P74-75.agc:868
//FLAGON		CLEAR	VLOAD
// slot 32601
    32601, 64792,
// P34-35_P74-75.agc:869
//			NTARGFLG
// slot 32602
    32602, 3448,
// P34-35_P74-75.agc:870
//			DELVLVC
// slot 32603
    32603, 3640,
// P34-35_P74-75.agc:871
//		STORE	GDT/2
// slot 32604
    32604, 1342,
// P34-35_P74-75.agc:872
//		EXIT
// slot 32605
    32605, 65532
)).

// bank 35, slots 32606-32607
function agcAotUnit2045 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32606 {
// P34-35_P74-75.agc:873
// +5		CAF	V06N81
// slot 32606
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
// P34-35_P74-75.agc:874
//		TC	BANKCALL
// slot 32607
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
// P34-35_P74-75.agc:875
//		CADR	GOFLASH
// slot 32608
    32608, 17020
)).

// bank 35, slots 32609-32617
function agcAotUnit2046 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32612 {
        if slot <= 32610 {
            if slot <= 32609 {
// P34-35_P74-75.agc:876
//		TC	GOTOPOOH
// slot 32609
                if slot <> 32609 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:877
//		TC	+2		# PRO
// slot 32610
                if slot <> 32610 or instruction <> 1892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1892, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32611 {
// P34-35_P74-75.agc:878
//		TC	FLAGON 	+5	# LOAD
// slot 32611
                if slot <> 32611 or instruction <> 1886 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1886, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:879
// +2		CA	EBANK7
// slot 32612
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
// P34-35_P74-75.agc:880
//		TS	EBANK		# TO BE SURE
// slot 32613
                if slot <> 32613 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:881
//
// P34-35_P74-75.agc:882
//		ZL
// slot 32614
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
// P34-35_P74-75.agc:883
//		CA	FIVE
// slot 32615
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
// P34-35_P74-75.agc:884
//NTARGCHK	TS	Q
// slot 32616
                    if slot <> 32616 or instruction <> 22530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:885
//		INDEX	Q
// slot 32617
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
// P34-35_P74-75.agc:886
//		CS	DELVLVC
// slot 32618
    32618, 34358
)).

// bank 35, slots 32619-32619
function agcAotUnit2047 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:887
//		INDEX	Q
// slot 32619
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
// P34-35_P74-75.agc:888
//		AD	GDT/2
// slot 32620
    32620, 50492
)).

// bank 35, slots 32621-32627
function agcAotUnit2048 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32623 {
        if slot <= 32621 {
// P34-35_P74-75.agc:889
//		ADS	L
// slot 32621
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
// P34-35_P74-75.agc:890
//		CCS	Q
// slot 32622
                if slot <> 32622 or instruction <> 4098 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 2).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:891
//		TCF	NTARGCHK
// slot 32623
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
// P34-35_P74-75.agc:892
//		LXCH	A
// slot 32624
                if slot <> 32624 or instruction <> 9216 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 0, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:893
//		EXTEND
// slot 32625
                if slot <> 32625 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32626 {
// P34-35_P74-75.agc:894
//		BZF	+3
// slot 32626
                if slot <> 32626 or instruction <> 6005 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6005, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:895
//		TC	UPFLAG
// slot 32627
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
// P34-35_P74-75.agc:896
//		ADRES	NTARGFLG
// slot 32628
    32628, 204
)).

// bank 35, slots 32629-32629
function agcAotUnit2049 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:897
//
// P34-35_P74-75.agc:898
//		TC	INTPRET
// slot 32629
    if slot <> 32629 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2049] to agcAotUnit2049@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:899
//		BOFF	CALL
// slot 32630
    32630, 37912,
// P34-35_P74-75.agc:900
//			NTARGFLG
// slot 32631
    32631, 3544,
// P34-35_P74-75.agc:901
//# Page 679
// P34-35_P74-75.agc:902
//			NOCHG
// slot 32632
    32632, 61172,
// P34-35_P74-75.agc:903
//			S34/35.3
// slot 32633
    32633, 60926,
// P34-35_P74-75.agc:904
//NOCHG		CLEAR	VLOAD
// slot 32634
    32634, 64792,
// P34-35_P74-75.agc:905
//			XDELVFLG
// slot 32635
    32635, 1390,
// P34-35_P74-75.agc:906
//			DELVEET3
// slot 32636
    32636, 2540,
// P34-35_P74-75.agc:907
//		STORE	DELVSIN
// slot 32637
    32637, 3932,
// P34-35_P74-75.agc:908
//FLAGOFF		CALL
// slot 32638
    32638, 65320,
// P34-35_P74-75.agc:909
//			S34/35.4
// slot 32639
    32639, 60996,
// P34-35_P74-75.agc:910
//		EXIT
// slot 32640
    32640, 65532
)).

// bank 35, slots 32641-32643
function agcAotUnit2050 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32641 {
// P34-35_P74-75.agc:911
//		CAF	V06N59
// slot 32641
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
// P34-35_P74-75.agc:912
//		TC	VNPOOH
// slot 32642
            if slot <> 32642 or instruction <> 1994 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1994, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:913
//		TC	INTPRET
// slot 32643
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
// P34-35_P74-75.agc:914
//		GOTO
// slot 32644
    32644, 65360,
// P34-35_P74-75.agc:915
//			SUBEXIT
// slot 32645
    32645, 3696,
// P34-35_P74-75.agc:916
//
// P34-35_P74-75.agc:917
//# Page 680
// P34-35_P74-75.agc:918
//# ***** VN1645 *****
// P34-35_P74-75.agc:919
//#
// P34-35_P74-75.agc:920
//# SUBROUTINES USED
// P34-35_P74-75.agc:921
//#	P3XORP7X
// P34-35_P74-75.agc:922
//#	GET+MGA
// P34-35_P74-75.agc:923
//#	BANKCALL
// P34-35_P74-75.agc:924
//#	DELAYJOB
// P34-35_P74-75.agc:925
//#	COMPTGO
// P34-35_P74-75.agc:926
//#	GOFLASHR
// P34-35_P74-75.agc:927
//#	GOTOPOOH
// P34-35_P74-75.agc:928
//#	FLAGUP
// P34-35_P74-75.agc:929
//
// P34-35_P74-75.agc:930
//VN1645		STQ	DLOAD
// slot 32646
    32646, 58656,
// P34-35_P74-75.agc:931
//			SUBEXIT
// slot 32647
    32647, 3696,
// P34-35_P74-75.agc:932
//			DP-.01
// slot 32648
    32648, 28612,
// P34-35_P74-75.agc:933
//		STORE	+MGA		# MGA = -.01
// slot 32649
    32649, 2390,
// P34-35_P74-75.agc:934
//		BOFF	DLOAD
// slot 32650
    32650, 58648,
// P34-35_P74-75.agc:935
//			FINALFLG
// slot 32651
    32651, 1490,
// P34-35_P74-75.agc:936
//			GET45
// slot 32652
    32652, 61240,
// P34-35_P74-75.agc:937
//			DP-.01
// slot 32653
    32653, 28612,
// P34-35_P74-75.agc:938
//		DAD
// slot 32654
    32654, 65306,
// P34-35_P74-75.agc:939
//			DP-.01
// slot 32655
    32655, 28612,
// P34-35_P74-75.agc:940
//		STORE	+MGA		# MGA = -.02
// slot 32656
    32656, 2390,
// P34-35_P74-75.agc:941
//		BOFF	EXIT
// slot 32657
    32657, 65048,
// P34-35_P74-75.agc:942
//			REFSMFLG
// slot 32658
    32658, 1988,
// P34-35_P74-75.agc:943
//			GET45
// slot 32659
    32659, 61240
)).

// bank 35, slots 32660-32663
function agcAotUnit2051 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32661 {
        if slot <= 32660 {
// P34-35_P74-75.agc:944
//		TC	P3XORP7X
// slot 32660
            if slot <> 32660 or instruction <> 1988 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1988, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:945
//		TC	+2		# P3X
// slot 32661
            if slot <> 32661 or instruction <> 1943 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1943, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32662 {
// P34-35_P74-75.agc:946
//		TC	GET45 	+1	# P7X
// slot 32662
            if slot <> 32662 or instruction <> 1949 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1949, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:947
//		TC	INTPRET
// slot 32663
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
// P34-35_P74-75.agc:948
//		VLOAD	PUSH
// slot 32664
    32664, 34554,
// P34-35_P74-75.agc:949
//			DELVSIN
// slot 32665
    32665, 3932,
// P34-35_P74-75.agc:950
//		CALL			# COMPUTE MGA
// slot 32666
    32666, 65320,
// P34-35_P74-75.agc:951
//			GET+MGA
// slot 32667
    32667, 14238,
// P34-35_P74-75.agc:952
//GET45		EXIT
// slot 32668
    32668, 65532
)).

// bank 35, slots 32669-32673
function agcAotUnit2052 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32670 {
        if slot <= 32669 {
// P34-35_P74-75.agc:953
//		TC	COMPTGO		# INITIATE TASK TO UPDATE TTOGO
// slot 32669
            if slot <> 32669 or instruction <> 1306 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1306, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:954
//		CA	SUBEXIT
// slot 32670
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
// P34-35_P74-75.agc:955
//		TS	QSAVED
// slot 32671
            if slot <> 32671 or instruction <> 23348 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23348, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32672 {
// P34-35_P74-75.agc:956
//		CAF	1SEC
// slot 32672
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
// P34-35_P74-75.agc:957
//		TC	BANKCALL
// slot 32673
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
// P34-35_P74-75.agc:958
//		CADR	DELAYJOB
// slot 32674
    32674, 1978
)).

// bank 35, slots 32675-32676
function agcAotUnit2053 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32675 {
// P34-35_P74-75.agc:959
//		CAF	V16N45		# TRKMKCNT, TTOGO, +MGA
// slot 32675
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
// P34-35_P74-75.agc:960
//		TC	BANKCALL
// slot 32676
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
// P34-35_P74-75.agc:961
//		CADR	GOFLASH
// slot 32677
    32677, 17020
)).

// bank 35, slots 32678-32688
function agcAotUnit2054 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32682 {
        if slot <= 32679 {
            if slot <= 32678 {
// P34-35_P74-75.agc:962
//		TC	KILCLOCK	# TERMINATE
// slot 32678
                if slot <> 32678 or instruction <> 1961 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1961, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:963
//		TC	N45PROC		# PROCEED
// slot 32679
                if slot <> 32679 or instruction <> 1964 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1964, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32680 {
// P34-35_P74-75.agc:964
//		TC	CLUPDATE	# RECYCLE -- RETURN FOR INITIAL COMPUTATION
// slot 32680
                if slot <> 32680 or instruction <> 1972 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1972, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32681 {
// P34-35_P74-75.agc:965
//KILCLOCK	CA	Z
// slot 32681
                    if slot <> 32681 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:966
//		TS	DISPDEX
// slot 32682
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
// P34-35_P74-75.agc:967
//# Page 681
// P34-35_P74-75.agc:968
//		TC	GOTOPOOH
// slot 32683
                if slot <> 32683 or instruction <> 3073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32684 {
// P34-35_P74-75.agc:969
//N45PROC		CS	FLAGWRD2
// slot 32684
                    if slot <> 32684 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:970
//		MASK	BIT6
// slot 32685
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
// P34-35_P74-75.agc:971
//		EXTEND
// slot 32686
                if slot <> 32686 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32687 {
// P34-35_P74-75.agc:972
//		BZF	KILCLOCK	# FINALFLG IS SET -- FLASH V37 -- AWAIT NEW PGM
// slot 32687
                    if slot <> 32687 or instruction <> 6057 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6057, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:973
//		TC	PHASCHNG
// slot 32688
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
// P34-35_P74-75.agc:974
//		OCT	04024
// slot 32689
    32689, 4136
)).

// bank 35, slots 32690-32690
function agcAotUnit2055 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:975
//		TC	UPFLAG		# SET
// slot 32690
    if slot <> 32690 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2055] to agcAotUnit2055@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:976
//		ADRES	FINALFLG	# FINALFLG
// slot 32691
    32691, 78
)).

// bank 35, slots 32692-32694
function agcAotUnit2056 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32692 {
// P34-35_P74-75.agc:977
//CLUPDATE	CA	Z
// slot 32692
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
// P34-35_P74-75.agc:978
//		TS	DISPDEX
// slot 32693
            if slot <> 32693 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:979
//		TC	PHASCHNG
// slot 32694
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
// P34-35_P74-75.agc:980
//		OCT	04024
// slot 32695
    32695, 4136
)).

// bank 35, slots 32696-32696
function agcAotUnit2057 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P34-35_P74-75.agc:981
//		TC	INTPRET
// slot 32696
    if slot <> 32696 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2057] to agcAotUnit2057@.

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:982
//		CLEAR	GOTO
// slot 32697
    32697, 43032,
// P34-35_P74-75.agc:983
//			UPDATFLG
// slot 32698
    32698, 880,
// P34-35_P74-75.agc:984
//			QSAVED
// slot 32699
    32699, 3688
)).

// bank 35, slots 32700-32703
function agcAotUnit2058 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32701 {
        if slot <= 32700 {
// P34-35_P74-75.agc:985
//
// P34-35_P74-75.agc:986
//# Page 682
// P34-35_P74-75.agc:987
//# ***** DISPLAYE *****
// P34-35_P74-75.agc:988
//#
// P34-35_P74-75.agc:989
//# SUBROUTINES USED
// P34-35_P74-75.agc:990
//#	BANKCALL
// P34-35_P74-75.agc:991
//#	GOFLASHR
// P34-35_P74-75.agc:992
//#	GOTOPOOH
// P34-35_P74-75.agc:993
//#	BLANKET
// P34-35_P74-75.agc:994
//#	ENDOFJOB
// P34-35_P74-75.agc:995
//
// P34-35_P74-75.agc:996
//DISPLAYE	EXTEND
// slot 32700
            if slot <> 32700 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:997
//		QXCH	NORMEX
// slot 32701
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
// P34-35_P74-75.agc:998
//		CAF	V06N55
// slot 32702
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
// P34-35_P74-75.agc:999
//		TCR	BANKCALL
// slot 32703
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
// P34-35_P74-75.agc:1000
//		CADR	GOFLASH
// slot 32704
    32704, 17020
)).

// bank 35, slots 32705-32718
function agcAotUnit2059 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32711 {
        if slot <= 32707 {
            if slot <= 32705 {
// P34-35_P74-75.agc:1001
//		TCF	GOTOPOOH
// slot 32705
                if slot <> 32705 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32706 {
// P34-35_P74-75.agc:1002
//		TC	NORMEX
// slot 32706
                    if slot <> 32706 or instruction <> 819 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 819, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1003
//		TCF	-5
// slot 32707
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
// P34-35_P74-75.agc:1004
//
// P34-35_P74-75.agc:1005
//# Page 683
// P34-35_P74-75.agc:1006
//# ***** P3XORP7X *****
// P34-35_P74-75.agc:1007
//
// P34-35_P74-75.agc:1008
//P3XORP7X	CAF	HIGH9
// slot 32708
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
// P34-35_P74-75.agc:1009
//		MASK	MODREG
// slot 32709
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
// P34-35_P74-75.agc:1010
//		EXTEND
// slot 32710
                    if slot <> 32710 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1011
//		BZF	+2
// slot 32711
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
// P34-35_P74-75.agc:1012
//		INCR	Q
// slot 32712
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
// P34-35_P74-75.agc:1013
//		RETURN
// slot 32713
                    if slot <> 32713 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1014
//
// P34-35_P74-75.agc:1015
//# ***** VNPOOH *****
// P34-35_P74-75.agc:1016
//#
// P34-35_P74-75.agc:1017
//# SUBROUTINES USED
// P34-35_P74-75.agc:1018
//#	BANKCALL
// P34-35_P74-75.agc:1019
//#	GOFLASH
// P34-35_P74-75.agc:1020
//#	GOTOPOOH
// P34-35_P74-75.agc:1021
//
// P34-35_P74-75.agc:1022
//VNPOOH		EXTEND
// slot 32714
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
// P34-35_P74-75.agc:1023
//		QXCH	RTRN
// slot 32715
                    if slot <> 32715 or instruction <> 10037 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 821, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1024
//		TS	VERBNOUN
// slot 32716
                    if slot <> 32716 or instruction <> 23437 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23437, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32717 {
// P34-35_P74-75.agc:1025
//		CA	VERBNOUN
// slot 32717
                    if slot <> 32717 or instruction <> 13197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 909).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1026
//		TCR	BANKCALL
// slot 32718
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
// P34-35_P74-75.agc:1027
//		CADR	GOFLASH
// slot 32719
    32719, 17020
)).

// bank 35, slots 32720-32722
function agcAotUnit2060 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32720 {
// P34-35_P74-75.agc:1028
//		TCF	GOTOPOOH
// slot 32720
        if slot <> 32720 or instruction <> 7169 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 7169, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32721 {
// P34-35_P74-75.agc:1029
//		TC	RTRN
// slot 32721
            if slot <> 32721 or instruction <> 821 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 821, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:1030
//		TCF	-5
// slot 32722
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
// P34-35_P74-75.agc:1031
//
// P34-35_P74-75.agc:1032
//# Page 684
// P34-35_P74-75.agc:1033
//# ***** CONSTANTS *****
// P34-35_P74-75.agc:1034
//
// P34-35_P74-75.agc:1035
//V06N37		VN	0637
// slot 32723
    32723, 1610,
// P34-35_P74-75.agc:1036
//V06N55		VN	0655
// slot 32724
    32724, 1646,
// P34-35_P74-75.agc:1037
//V06N58		VN	0658
// slot 32725
    32725, 1652,
// P34-35_P74-75.agc:1038
//V06N59		VN	0659
// slot 32726
    32726, 1654,
// P34-35_P74-75.agc:1039
//V06N81		VN	0681
// slot 32727
    32727, 1698,
// P34-35_P74-75.agc:1040
//V16N45		VN	1645
// slot 32728
    32728, 4186,
// P34-35_P74-75.agc:1041
//TWOPI		2DEC	6.283185307 B-4
// slot 32729 32730
    32729, 12866, 32730, 32170,
// P34-35_P74-75.agc:1042
//
// P34-35_P74-75.agc:1043
//MAX250		2DEC	25 E3
// slot 32731 32732
    32731, 2, 32732, 17232,
// P34-35_P74-75.agc:1044
//
// P34-35_P74-75.agc:1045
//THIRD		2DEC	.333333333
// slot 32733 32734
    32733, 10922, 32734, 10922,
// P34-35_P74-75.agc:1046
//
// P34-35_P74-75.agc:1047
//ELEPS		2DEC	.27777777 E-3
// slot 32735 32736
    32735, 8, 32736, 18058,
// P34-35_P74-75.agc:1048
//
// P34-35_P74-75.agc:1049
//DP-.01		OCT	77777		# CONSTANTS
// slot 32737
    32737, 65534,
// P34-35_P74-75.agc:1050
//		OCT	61337		# ADJACENT	-.01 FOR MGA DSP
// slot 32738
    32738, 50622,
// P34-35_P74-75.agc:1051
//EPSFOUR		2DEC	.0416666666
// slot 32739 32740
    32739, 1364, 32740, 21846,
// P34-35_P74-75.agc:1052
//
// P34-35_P74-75.agc:1053
//130DEG		2DEC	.3611111111
// slot 32741 32742
    32741, 11832, 32742, 14564,
// P34-35_P74-75.agc:1054
//
// P34-35_P74-75.agc:1055
//# Page 685
// P34-35_P74-75.agc:1056
//# ***** INITVEL *****
// P34-35_P74-75.agc:1057
//
// P34-35_P74-75.agc:1058
//# MOD NO -1			LOG SECTION -- P34-P35, P74-P75
// P34-35_P74-75.agc:1059
//# MOD BY WHITE, P.		DATE:  21 NOV 67
// P34-35_P74-75.agc:1060
//#
// P34-35_P74-75.agc:1061
//# FUNCTIONAL
// P34-35_P74-75.agc:1062
//#
// P34-35_P74-75.agc:1063
//#	THIS SUBROUTINE COMPUTES THE REQUIRED INITIAL VELOCITY VECTOR FOR
// P34-35_P74-75.agc:1064
//#	A TRAJECTORY OF SPECIFIC TRANSFER TIME BETWEEN SPECIFIED INITIAL
// P34-35_P74-75.agc:1065
//#	AND TARGET POSITIONS.  THE TRAJECTORY MAY BE EITHER CONIC OR
// P34-35_P74-75.agc:1066
//#	PRECISION DEPENDING ON AN INPUT PARAMETER (NAMELY, NUMBER OF
// P34-35_P74-75.agc:1067
//#	OFFSETS).  IN ADDITION, IN THE PRECISION TRAJECTORY CASE, THE
// P34-35_P74-75.agc:1068
//#	SUBROUTINE ALSO COMPUTES AN OFFSET TARGET VECTOR, TO BE USED
// P34-35_P74-75.agc:1069
//#	DURING PURE-CONIC CROSS-PRODUCT STEERING.  THE OFFSET TARGET
// P34-35_P74-75.agc:1070
//#	VECTOR IS THE TERMINAL POSITION VECTOR OF A CONIC TRAJECTORY WHICH
// P34-35_P74-75.agc:1071
//#	HAS THE SAME INITIAL STATE AS A PRECISION TRAJECTORY WHOSE
// P34-35_P74-75.agc:1072
//#	TERMINAL POSITION VECTOR IS THE SPECIFIED TARGET VECTOR.
// P34-35_P74-75.agc:1073
//#
// P34-35_P74-75.agc:1074
//#	IN ORDER TO AVOID THE INHERENT SINGULARITIES IN THE 180 DEGREE
// P34-35_P74-75.agc:1075
//#	TRANSFER CASE WHEN THE (TRUE OR OFFSET) TARGET VECTOR MAY BE
// P34-35_P74-75.agc:1076
//#	SLIGHTLY OUT OF THE ORBITAL PLANE, THIS SUBROUTINE ROTATES THIS
// P34-35_P74-75.agc:1077
//#	VECTOR INTO A PLANE DEFINED BY THE INPUT INITIAL POSITION VECTOR
// P34-35_P74-75.agc:1078
//#	AND ANOTHER INPUT VECTOR (USUALLY THE INITIAL VELOCITY VECTOR),
// P34-35_P74-75.agc:1079
//#	WHENEVER THE INPUT TARGET VECTOR LIES INSIDE A CONE WHOSE VERTEX
// P34-35_P74-75.agc:1080
//#	IS THE ORIGIN OF COORDINATES, WHOSE AXIS IS THE 180 DEGREE
// P34-35_P74-75.agc:1081
//#	TRANSFER DIRECTION, AND WHOSE CONE ANGLE IS SPECIFIED BY THE USER.
// P34-35_P74-75.agc:1082
//#
// P34-35_P74-75.agc:1083
//#	THE LAMBERT SUBROUTINE IS UTILIZED FOR THE CONIC COMPUTATIONS AND
// P34-35_P74-75.agc:1084
//#	THE COASTING INTEGRATION SUBROUTINE IS UTILIZED FOR THE PRECISION
// P34-35_P74-75.agc:1085
//#	TRAJECTORY COMPUTATIONS.
// P34-35_P74-75.agc:1086
//#
// P34-35_P74-75.agc:1087
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1088
//#
// P34-35_P74-75.agc:1089
//#	L	CALL
// P34-35_P74-75.agc:1090
//#	L+1		INITVEL
// P34-35_P74-75.agc:1091
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1092
//#
// P34-35_P74-75.agc:1093
//# INPUT
// P34-35_P74-75.agc:1094
//#
// P34-35_P74-75.agc:1095
//#	(1)	RINIT		INITIAL POSITION RADIUS VECTOR
// P34-35_P74-75.agc:1096
//#	(2)	VINIT		INITIAL POSITION VELOCITY VECTOR
// P34-35_P74-75.agc:1097
//#	(3)	RTARG		TARGET POSITION RADIUS VECTOR
// P34-35_P74-75.agc:1098
//#	(4)	DELLT4		DESIRED TIME OF FLIGHT FROM RINIT TO RTARG
// P34-35_P74-75.agc:1099
//#	(5)	INTIME		TIME OF RINIT
// P34-35_P74-75.agc:1100
//#	(6)	0D		NUMBER OF ITERATIONS OF LAMBERT/INTEGRVS
// P34-35_P74-75.agc:1101
//#	(7)	2D		ANGLE TO 180 DEGREES WHEN ROTATION STARTS
// P34-35_P74-75.agc:1102
//#	(8)	RTX1		-2 FOR EARTH, -10D FOR LUNAR
// P34-35_P74-75.agc:1103
//#	(9)	RTX2		COORDINATE SYSTEM ORIGIN -- 0 FOR EARTH, 2 FOR LUNAR
// P34-35_P74-75.agc:1104
//#	PUSHLOC SET AT 4D
// P34-35_P74-75.agc:1105
//#
// P34-35_P74-75.agc:1106
//# Page 686
// P34-35_P74-75.agc:1107
//# OUTPUT
// P34-35_P74-75.agc:1108
//#
// P34-35_P74-75.agc:1109
//#	(1)	RTARG		OFFSET TARGET POSITION VECTOR
// P34-35_P74-75.agc:1110
//#	(2)	VIPRIME		MANEUVER VELOCITY REQUIRED
// P34-35_P74-75.agc:1111
//#	(3)	VTPRIME		VELOCITY AT TARGET AFTER MANEUVER
// P34-35_P74-75.agc:1112
//#	(4)	DELVEET3	DELTA VELOCITY REQUIRED FOR MANEUVER
// P34-35_P74-75.agc:1113
//#
// P34-35_P74-75.agc:1114
//# SUBROUTINES USED
// P34-35_P74-75.agc:1115
//#
// P34-35_P74-75.agc:1116
//#	LAMBERT
// P34-35_P74-75.agc:1117
//#	INTSTALL
// P34-35_P74-75.agc:1118
//#	INTEGRVS
// P34-35_P74-75.agc:1119
//
// P34-35_P74-75.agc:1120
//		SETLOC	INTVEL
// P34-35_P74-75.agc:1121
//		BANK
// P34-35_P74-75.agc:1122
//
// P34-35_P74-75.agc:1123
//		COUNT*	$$/INITV
// P34-35_P74-75.agc:1124
//INITVEL		SET			# COGA GUESS NOT AVAILABLE
// slot 11264
    11264, 65304,
// P34-35_P74-75.agc:1125
//			GUESSW
// slot 11265
    11265, 634,
// P34-35_P74-75.agc:1126
//HAVEGUES	VLOAD	STQ
// slot 11266
    11266, 37114,
// P34-35_P74-75.agc:1127
//			RTARG
// slot 11267
    11267, 3656,
// P34-35_P74-75.agc:1128
//			NORMEX
// slot 11268
    11268, 3686,
// P34-35_P74-75.agc:1129
//		STORE	RTARG1
// slot 11269
    11269, 3700,
// P34-35_P74-75.agc:1130
//		ABVAL
// slot 11270
    11270, 65356,
// P34-35_P74-75.agc:1131
//		STORE	RTMAG
// slot 11271
    11271, 4006,
// P34-35_P74-75.agc:1132
//		SLOAD	BHIZ
// slot 11272
    11272, 39098,
// P34-35_P74-75.agc:1133
//			RTX2
// slot 11273
    11273, 3072,
// P34-35_P74-75.agc:1134
//			INITVEL1
// slot 11274
    11274, 18476,
// P34-35_P74-75.agc:1135
//		VLOAD	VSL2
// slot 11275
    11275, 60154,
// P34-35_P74-75.agc:1136
//			RINIT		# B29
// slot 11276
    11276, 2470,
// P34-35_P74-75.agc:1137
//		STOVL	RINIT		# B27
// slot 11277
    11277, 22950,
// P34-35_P74-75.agc:1138
//			VINIT		# B7
// slot 11278
    11278, 2482,
// P34-35_P74-75.agc:1139
//		VSL2
// slot 11279
    11279, 65492,
// P34-35_P74-75.agc:1140
//		STOVL	VINIT		# B5
// slot 11280
    11280, 22962,
// P34-35_P74-75.agc:1141
//			RTARG1
// slot 11281
    11281, 3700,
// P34-35_P74-75.agc:1142
//		VSL2
// slot 11282
    11282, 65492,
// P34-35_P74-75.agc:1143
//		STORE	RTARG1
// slot 11283
    11283, 3700,
// P34-35_P74-75.agc:1144
//		ABVAL
// slot 11284
    11284, 65356,
// P34-35_P74-75.agc:1145
//		STORE	RTMAG
// slot 11285
    11285, 4006,
// P34-35_P74-75.agc:1146
//
// P34-35_P74-75.agc:1147
//# INITIALIZATION
// P34-35_P74-75.agc:1148
//
// P34-35_P74-75.agc:1149
//INITVEL1	SSP	DLOAD		# SET ITCTR TO -1,LOAD MPAC WITH E4 (PL 2D)
// slot 11286
    11286, 58802,
// P34-35_P74-75.agc:1150
//			ITCTR
// slot 11287
    11287, 3870,
// P34-35_P74-75.agc:1151
//			0 	-1
// slot 11288
    11288, 65532,
// P34-35_P74-75.agc:1152
//		COSINE	SR1		# CALCULATE COSINE (E4) (+2)
// slot 11289
    11289, 58060,
// P34-35_P74-75.agc:1153
//		STODL	COZY4		# SET COZY4 TO COSINE (E4) 	    (PL 0D)
// slot 11290
    11290, 16238,
// P34-35_P74-75.agc:1154
//		LXA,2	SXA,2
// slot 11291
    11291, 56536,
// P34-35_P74-75.agc:1155
//			MPAC
// slot 11292
    11292, 216,
// P34-35_P74-75.agc:1156
//			VTARGTAG	# SET VTARGTAG TO 0D (SP)
// slot 11293
    11293, 2946,
// P34-35_P74-75.agc:1157
//		VLOAD
// slot 11294
    11294, 65530,
// P34-35_P74-75.agc:1158
//# Page 687
// P34-35_P74-75.agc:1159
//			RINIT
// slot 11295
    11295, 2470
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1160
//		STOVL	R1VEC		# R1VEC EQ RINIT
// slot 11296
    11296, 23386,
// P34-35_P74-75.agc:1161
//			RTARG1
// slot 11297
    11297, 3700,
// P34-35_P74-75.agc:1162
//		STODL	R2VEC		# R2VEC EQ RTARG
// slot 11298
    11298, 15206,
// P34-35_P74-75.agc:1163
//			DELLT4
// slot 11299
    11299, 3668,
// P34-35_P74-75.agc:1164
//		STORE	TDESIRED	# TDESIRED EQ DELLT4
// slot 11300
    11300, 2930,
// P34-35_P74-75.agc:1165
//		SETPD	VLOAD
// slot 11301
    11301, 64770,
// P34-35_P74-75.agc:1166
//			0D		# INITIALIZE PL TO 0D
// slot 11302
    11302, 2,
// P34-35_P74-75.agc:1167
//			RINIT		# MPAC EQ RINIT (+29)
// slot 11303
    11303, 2470,
// P34-35_P74-75.agc:1168
//		UNIT	PUSH		# UNIT(RI) (+1)		            (PL 6D)
// slot 11304
    11304, 34396,
// P34-35_P74-75.agc:1169
//		VXV	UNIT
// slot 11305
    11305, 44602,
// P34-35_P74-75.agc:1170
//			VINIT		# MPAC EQ UNIT(RI) X VI (+8)
// slot 11306
    11306, 2482,
// P34-35_P74-75.agc:1171
//		STOVL	UN
// slot 11307
    11307, 23416,
// P34-35_P74-75.agc:1172
//			RTARG1
// slot 11308
    11308, 3700,
// P34-35_P74-75.agc:1173
//		UNIT	DOT		# TEMP*RT.URI (+2)		    (PL 0D)
// slot 11309
    11309, 41308,
// P34-35_P74-75.agc:1174
//		DAD	CLEAR
// slot 11310
    11310, 35866,
// P34-35_P74-75.agc:1175
//			COZY4
// slot 11311
    11311, 3950,
// P34-35_P74-75.agc:1176
//			NORMSW
// slot 11312
    11312, 3946,
// P34-35_P74-75.agc:1177
//		STORE	COZY4
// slot 11313
    11313, 3950,
// P34-35_P74-75.agc:1178
//INITVEL2	BPL	SET
// slot 11314
    11314, 35912,
// P34-35_P74-75.agc:1179
//			INITVEL3	# UN CALCULATED IN LAMBERT
// slot 11315
    11315, 18570,
// P34-35_P74-75.agc:1180
//			NORMSW
// slot 11316
    11316, 3690,
// P34-35_P74-75.agc:1181
//
// P34-35_P74-75.agc:1182
//# ROTATE RC INTO YC PLANE -- SET UNIT NORMAL TO YC
// P34-35_P74-75.agc:1183
//
// P34-35_P74-75.agc:1184
//		VLOAD	PUSH		#				    (PL 6D)
// slot 11317
    11317, 34554,
// P34-35_P74-75.agc:1185
//			R2VEC		# RC TO 6D (+29)
// slot 11318
    11318, 2918,
// P34-35_P74-75.agc:1186
//		ABVAL	PDVL		# RC TO MPAC, ABVAL(RC) (+29) TO OD (PL 2D)
// slot 11319
    11319, 52556,
// P34-35_P74-75.agc:1187
//		PUSH	VPROJ		#				    (PL 8D)
// slot 11320
    11320, 39180,
// P34-35_P74-75.agc:1188
//			UN
// slot 11321
    11321, 2936,
// P34-35_P74-75.agc:1189
//		VSL2	BVSU
// slot 11322
    11322, 42452,
// P34-35_P74-75.agc:1190
//		UNIT	VXSC		#				    (PL 0D)
// slot 11323
    11323, 61788,
// P34-35_P74-75.agc:1191
//		VSL1
// slot 11324
    11324, 65524,
// P34-35_P74-75.agc:1192
//		STORE	R2VEC
// slot 11325
    11325, 2918,
// P34-35_P74-75.agc:1193
//		TLOAD	SLOAD
// slot 11326
    11326, 56786,
// P34-35_P74-75.agc:1194
//			ZEROVEC
// slot 11327
    11327, 20494,
// P34-35_P74-75.agc:1195
//			ITCTR
// slot 11328
    11328, 3870,
// P34-35_P74-75.agc:1196
//		BPL	VLOAD
// slot 11329
    11329, 64840,
// P34-35_P74-75.agc:1197
//			INITVEL3
// slot 11330
    11330, 18570,
// P34-35_P74-75.agc:1198
//			R2VEC
// slot 11331
    11331, 2918,
// P34-35_P74-75.agc:1199
//		STORE	RTARG1
// slot 11332
    11332, 3700,
// P34-35_P74-75.agc:1200
//INITVEL3	DLOAD	PDVL		#				    (PL 2D)
// slot 11333
    11333, 52682,
// P34-35_P74-75.agc:1201
//			MUEARTH		# POSITIVE VALUE
// slot 11334
    11334, 22542,
// P34-35_P74-75.agc:1202
//			R2VEC
// slot 11335
    11335, 2918,
// P34-35_P74-75.agc:1203
//		UNIT	PDVL		# 2D = UNIT(R2VEC)		    (PL 8D)
// slot 11336
    11336, 52572,
// P34-35_P74-75.agc:1204
//			R1VEC
// slot 11337
    11337, 2906,
// P34-35_P74-75.agc:1205
//		UNIT	PUSH		# 8D = UNIT(R1VEC)		   (PL 14D)
// slot 11338
    11338, 34396,
// P34-35_P74-75.agc:1206
//		VXV	VCOMP		# -N = UNIT(R2VEC) X UNIT(R1VEC)
// slot 11339
    11339, 48698,
// P34-35_P74-75.agc:1207
//			2D
// slot 11340
    11340, 6,
// P34-35_P74-75.agc:1208
//		PUSH			#				   (PL 20D)
// slot 11341
    11341, 65292,
// P34-35_P74-75.agc:1209
//		LXA,1	DLOAD
// slot 11342
    11342, 58832,
// P34-35_P74-75.agc:1210
//# Page 688
// P34-35_P74-75.agc:1211
//			RTX1
// slot 11343
    11343, 3068,
// P34-35_P74-75.agc:1212
//			18D
// slot 11344
    11344, 38,
// P34-35_P74-75.agc:1213
//		BMN	INCR,1
// slot 11345
    11345, 51264,
// P34-35_P74-75.agc:1214
//			+2
// slot 11346
    11346, 18600,
// P34-35_P74-75.agc:1215
//		DEC	-8
// slot 11347
    11347, 65518,
// P34-35_P74-75.agc:1216
//		INCR,1	SLOAD
// slot 11348
    11348, 56720,
// P34-35_P74-75.agc:1217
//			10D
// slot 11349
    11349, 20,
// P34-35_P74-75.agc:1218
//			X1
// slot 11350
    11350, 78,
// P34-35_P74-75.agc:1219
//		BHIZ	VLOAD		#				   (PL 14D)
// slot 11351
    11351, 64816,
// P34-35_P74-75.agc:1220
//			+2
// slot 11352
    11352, 18612,
// P34-35_P74-75.agc:1221
//		VCOMP	PUSH		#				   (PL 20D)
// slot 11353
    11353, 34428,
// P34-35_P74-75.agc:1222
//		VLOAD			#				   (PL 14D)
// slot 11354
    11354, 65530,
// P34-35_P74-75.agc:1223
//		VXV	DOT		#				    (PL 2D)
// slot 11355
    11355, 41274,
// P34-35_P74-75.agc:1224
//		BPL	DLOAD		#				    (PL 0D)
// slot 11356
    11356, 58696,
// P34-35_P74-75.agc:1225
//			INITVEL4
// slot 11357
    11357, 18622,
// P34-35_P74-75.agc:1226
//		DCOMP	PUSH		#				    (PL 2D)
// slot 11358
    11358, 34428,
// P34-35_P74-75.agc:1227
//INITVEL4	LXA,2	SXA,2
// slot 11359
    11359, 56536,
// P34-35_P74-75.agc:1228
//			0D
// slot 11360
    11360, 0,
// P34-35_P74-75.agc:1229
//			GEOMSGN
// slot 11361
    11361, 2932,
// P34-35_P74-75.agc:1230
//
// P34-35_P74-75.agc:1231
//# SET INPUTS UP FOR LAMBERT
// P34-35_P74-75.agc:1232
//
// P34-35_P74-75.agc:1233
//		LXA,1	CALL
// slot 11362
    11362, 38096,
// P34-35_P74-75.agc:1234
//			RTX1
// slot 11363
    11363, 3068,
// P34-35_P74-75.agc:1235
//
// P34-35_P74-75.agc:1236
//#  OPERATE THE LAMBERT CONIC ROUTINE (COASTFLT SUBROUTINE)
// P34-35_P74-75.agc:1237
//
// P34-35_P74-75.agc:1238
//			SETITCTR	# GO TO END OF BANK TO SET ITERCTR BEFORE
// slot 11364
    11364, 20458,
// P34-35_P74-75.agc:1239
//					# CALLING LAMBER (FOR REMANUFACTURE ONLY)
// P34-35_P74-75.agc:1240
//
// P34-35_P74-75.agc:1241
//# ARRIVED AT SOLUTION IS GOOD ENOUGH ACCORDING TO SLIGHTLY WIDER BOUNDS.
// P34-35_P74-75.agc:1242
//
// P34-35_P74-75.agc:1243
//		CLEAR	VLOAD
// slot 11365
    11365, 64792,
// P34-35_P74-75.agc:1244
//			GUESSW
// slot 11366
    11366, 890,
// P34-35_P74-75.agc:1245
//			VVEC
// slot 11367
    11367, 3016,
// P34-35_P74-75.agc:1246
//
// P34-35_P74-75.agc:1247
//# STORE CALCULATED INITIAL VELOCITY REQUIRED IN VIPRIME
// P34-35_P74-75.agc:1248
//
// P34-35_P74-75.agc:1249
//		STODL	VIPRIME		# INITIAL VELOCITY REQUIRED (+7)
// slot 11368
    11368, 14782,
// P34-35_P74-75.agc:1250
//
// P34-35_P74-75.agc:1251
//# IF NUMIT IS ZERO, CONTINUE AT INITVELB, OTHERWISE
// P34-35_P74-75.agc:1252
//# SET UP INPUTS FOR ENCKE INTEGRATION (INTEGRVS).
// P34-35_P74-75.agc:1253
//
// P34-35_P74-75.agc:1254
//			VTARGTAG
// slot 11369
    11369, 2948,
// P34-35_P74-75.agc:1255
//		BHIZ	CALL
// slot 11370
    11370, 37936,
// P34-35_P74-75.agc:1256
//			INITVEL7
// slot 11371
    11371, 18736,
// P34-35_P74-75.agc:1257
//			INTSTALL
// slot 11372
    11372, 24088,
// P34-35_P74-75.agc:1258
//		SLOAD	CLEAR
// slot 11373
    11373, 36026,
// P34-35_P74-75.agc:1259
//			RTX2
// slot 11374
    11374, 3072,
// P34-35_P74-75.agc:1260
//			MOONFLAG
// slot 11375
    11375, 358,
// P34-35_P74-75.agc:1261
//		BHIZ	SET
// slot 11376
    11376, 35888,
// P34-35_P74-75.agc:1262
//			INITVEL5
// slot 11377
    11377, 18662,
// P34-35_P74-75.agc:1263
//# Page 689
// P34-35_P74-75.agc:1264
//			MOONFLAG
// slot 11378
    11378, 102,
// P34-35_P74-75.agc:1265
//INITVEL5	VLOAD
// slot 11379
    11379, 65530,
// P34-35_P74-75.agc:1266
//			RINIT
// slot 11380
    11380, 2470,
// P34-35_P74-75.agc:1267
//		STORE	R1VEC
// slot 11381
    11381, 2906,
// P34-35_P74-75.agc:1268
//		STOVL	RCV
// slot 11382
    11382, 22202,
// P34-35_P74-75.agc:1269
//			VIPRIME
// slot 11383
    11383, 2494,
// P34-35_P74-75.agc:1270
//		STODL	VCV
// slot 11384
    11384, 14022,
// P34-35_P74-75.agc:1271
//			INTIME
// slot 11385
    11385, 3856,
// P34-35_P74-75.agc:1272
//		STORE	TET
// slot 11386
    11386, 1694,
// P34-35_P74-75.agc:1273
//		DAD	CLEAR
// slot 11387
    11387, 35866,
// P34-35_P74-75.agc:1274
//			DELLT4
// slot 11388
    11388, 3668,
// P34-35_P74-75.agc:1275
//			INTYPFLG
// slot 11389
    11389, 1910,
// P34-35_P74-75.agc:1276
//		STCALL	TDEC1
// slot 11390
    11390, 28738,
// P34-35_P74-75.agc:1277
//			INTEGRVS
// slot 11391
    11391, 23694,
// P34-35_P74-75.agc:1278
//		VLOAD
// slot 11392
    11392, 65530,
// P34-35_P74-75.agc:1279
//			VATT1
// slot 11393
    11393, 42,
// P34-35_P74-75.agc:1280
//		STORE	VTARGET
// slot 11394
    11394, 2950,
// P34-35_P74-75.agc:1281
//
// P34-35_P74-75.agc:1282
//# IF ITERATION COUNTER (ITCTR) EQ NO. ITERATIONS (NUMIT), CONTINUE AT
// P34-35_P74-75.agc:1283
//# INITVELC, OTHERWISE REITERATE LAMBERT AND ENCKE
// P34-35_P74-75.agc:1284
//
// P34-35_P74-75.agc:1285
//		LXA,2	INCR,2
// slot 11395
    11395, 52440,
// P34-35_P74-75.agc:1286
//			ITCTR
// slot 11396
    11396, 3868,
// P34-35_P74-75.agc:1287
//			1D		# INCREMENT ITCTR
// slot 11397
    11397, 2
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1288
//		SXA,2	XSU,2
// slot 11398
    11398, 46264,
// P34-35_P74-75.agc:1289
//			ITCTR
// slot 11399
    11399, 3868,
// P34-35_P74-75.agc:1290
//			VTARGTAG
// slot 11400
    11400, 2946,
// P34-35_P74-75.agc:1291
//		SLOAD	BHIZ		# IF SP(MPAC) EQ 0, CONTINUE AT INITVELC
// slot 11401
    11401, 39098,
// P34-35_P74-75.agc:1292
//			X2
// slot 11402
    11402, 80,
// P34-35_P74-75.agc:1293
//			INITVEL6
// slot 11403
    11403, 18730,
// P34-35_P74-75.agc:1294
//
// P34-35_P74-75.agc:1295
//# OFFSET CONIC TARGET VECTOR
// P34-35_P74-75.agc:1296
//
// P34-35_P74-75.agc:1297
//		VLOAD	VSU
// slot 11404
    11404, 43514,
// P34-35_P74-75.agc:1298
//			RTARG1
// slot 11405
    11405, 3700,
// P34-35_P74-75.agc:1299
//			RATT1
// slot 11406
    11406, 30,
// P34-35_P74-75.agc:1300
//		VAD
// slot 11407
    11407, 65370,
// P34-35_P74-75.agc:1301
//			R2VEC
// slot 11408
    11408, 2918,
// P34-35_P74-75.agc:1302
//		STODL	R2VEC
// slot 11409
    11409, 15206,
// P34-35_P74-75.agc:1303
//			COZY4
// slot 11410
    11410, 3950,
// P34-35_P74-75.agc:1304
//		GOTO
// slot 11411
    11411, 65360,
// P34-35_P74-75.agc:1305
//			INITVEL2	# CONTINUE ITERATING AT INITVEL2
// slot 11412
    11412, 18532,
// P34-35_P74-75.agc:1306
//
// P34-35_P74-75.agc:1307
//# COMPUTE THE DELTA VELOCITY
// P34-35_P74-75.agc:1308
//
// P34-35_P74-75.agc:1309
//INITVEL6	VLOAD
// slot 11413
    11413, 65530,
// P34-35_P74-75.agc:1310
//			R2VEC
// slot 11414
    11414, 2918,
// P34-35_P74-75.agc:1311
//		STORE	RTARG1
// slot 11415
    11415, 3700,
// P34-35_P74-75.agc:1312
//INITVEL7	VLOAD	VSU
// slot 11416
    11416, 43514,
// P34-35_P74-75.agc:1313
//			VIPRIME
// slot 11417
    11417, 2494,
// P34-35_P74-75.agc:1314
//			VINIT
// slot 11418
    11418, 2482,
// P34-35_P74-75.agc:1315
//		STOVL	DELVEET3	# DELVEET3 = VIPRIME-VINIT (+7)
// slot 11419
    11419, 23020,
// P34-35_P74-75.agc:1316
//# Page 690
// P34-35_P74-75.agc:1317
//			VTARGET
// slot 11420
    11420, 2950,
// P34-35_P74-75.agc:1318
//		STORE	VTPRIME
// slot 11421
    11421, 3820,
// P34-35_P74-75.agc:1319
//		SLOAD	BHIZ
// slot 11422
    11422, 39098,
// P34-35_P74-75.agc:1320
//			RTX2
// slot 11423
    11423, 3072,
// P34-35_P74-75.agc:1321
//			INITVELX
// slot 11424
    11424, 18778,
// P34-35_P74-75.agc:1322
//		VLOAD	VSR2
// slot 11425
    11425, 58106,
// P34-35_P74-75.agc:1323
//			VTPRIME
// slot 11426
    11426, 3820,
// P34-35_P74-75.agc:1324
//		STOVL	VTPRIME
// slot 11427
    11427, 24300,
// P34-35_P74-75.agc:1325
//			VIPRIME
// slot 11428
    11428, 2494,
// P34-35_P74-75.agc:1326
//		VSR2
// slot 11429
    11429, 65476,
// P34-35_P74-75.agc:1327
//		STOVL	VIPRIME
// slot 11430
    11430, 22974,
// P34-35_P74-75.agc:1328
//			RTARG1
// slot 11431
    11431, 3700,
// P34-35_P74-75.agc:1329
//		VSR2
// slot 11432
    11432, 65476,
// P34-35_P74-75.agc:1330
//		STOVL	RTARG1
// slot 11433
    11433, 24180,
// P34-35_P74-75.agc:1331
//			DELVEET3
// slot 11434
    11434, 2540,
// P34-35_P74-75.agc:1332
//		VSR2
// slot 11435
    11435, 65476,
// P34-35_P74-75.agc:1333
//		STORE	DELVEET3
// slot 11436
    11436, 2540,
// P34-35_P74-75.agc:1334
//INITVELX	LXA,1	DLOAD*
// slot 11437
    11437, 58320,
// P34-35_P74-75.agc:1335
//			RTX1
// slot 11438
    11438, 3068,
// P34-35_P74-75.agc:1336
//			MUTABLE -2,1
// slot 11439
    11439, 8198,
// P34-35_P74-75.agc:1337
//		PUSH	DMP
// slot 11440
    11440, 34060,
// P34-35_P74-75.agc:1338
//			R1A
// slot 11441
    11441, 3012,
// P34-35_P74-75.agc:1339
//		SR1	DDV
// slot 11442
    11442, 47556,
// P34-35_P74-75.agc:1340
//			R1
// slot 11443
    11443, 66,
// P34-35_P74-75.agc:1341
//		STODL	MU/A
// slot 11444
    11444, 16290,
// P34-35_P74-75.agc:1342
//		SR
// slot 11445
    11445, 65378,
// P34-35_P74-75.agc:1343
//			6
// slot 11446
    11446, 17166,
// P34-35_P74-75.agc:1344
//		STORE	MUASTEER
// slot 11447
    11447, 3998,
// P34-35_P74-75.agc:1345
//		SETPD	VLOAD
// slot 11448
    11448, 64770,
// P34-35_P74-75.agc:1346
//			0D
// slot 11449
    11449, 2,
// P34-35_P74-75.agc:1347
//			RTARG1
// slot 11450
    11450, 3700,
// P34-35_P74-75.agc:1348
//		STCALL	RTARG
// slot 11451
    11451, 32328,
// P34-35_P74-75.agc:1349
//			NORMEX
// slot 11452
    11452, 3686,
// P34-35_P74-75.agc:1350
//
// P34-35_P74-75.agc:1351
//# ***** END OF INITVEL ROUTINE *****
// P34-35_P74-75.agc:1352
//
// P34-35_P74-75.agc:1353
//# Page 691
// P34-35_P74-75.agc:1354
//# ***** MIDGIM *****
// P34-35_P74-75.agc:1355
//
// P34-35_P74-75.agc:1356
//# MOD NO. 0, BY WILLMAN, SUBROUTINE RENDGUID, LOG P34-P35, P74-P75
// P34-35_P74-75.agc:1357
//# REVISION 03, 17 FEB 67
// P34-35_P74-75.agc:1358
//#
// P34-35_P74-75.agc:1359
//# IF THE ACTIVE VEHICLE IS DOING THE COMPUTATION, MIDGIM COMPUTES
// P34-35_P74-75.agc:1360
//# THE POSITIVE MIDDLE GIMBAL ANGLE OF THE ACTIVE VEHICLE TO THE INPUT
// P34-35_P74-75.agc:1361
//# DELTA VELOCITY VECTOR (0D IN PUSH LIST), OTHERWISE
// P34-35_P74-75.agc:1362
//# MIDGIM CONVERTS THE INPUT DELTA VELOCITY VECTOR FROM INERTIAL COORDIN-
// P34-35_P74-75.agc:1363
//# ATES TO LOCAL VERTICAL COORDINATES OF THE ACTIVE VEHICLE.
// P34-35_P74-75.agc:1364
//#
// P34-35_P74-75.agc:1365
//# ** INPUTS **
// P34-35_P74-75.agc:1366
//#
// P34-35_P74-75.agc:1367
//#	NAME	MEANING						UNITS/SCALING/MODE
// P34-35_P74-75.agc:1368
//#
// P34-35_P74-75.agc:1369
//#	AVFLAG	INT FLAG -- 0 IS CSM ACTIVE, 1 IS LEM ACTIVE			BIT
// P34-35_P74-75.agc:1370
//#	RINIT	ACTIVE VEHICLE RADIUS VECTOR			METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1371
//#	VINIT	ACTIVE VEHICLE VELOCITY VECTOR			METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1372
//#	0D(PL)	ACTIVE VEHICLE DELTA VELOCITY VECTOR		METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1373
//#
// P34-35_P74-75.agc:1374
//# ** OUTPUTS **
// P34-35_P74-75.agc:1375
//#
// P34-35_P74-75.agc:1376
//#    NAME	MEANING						UNITS/SCALING/MODE
// P34-35_P74-75.agc:1377
//#
// P34-35_P74-75.agc:1378
//#    +MGA	+ MIDDLE GIMBAL ANGLE				REVOLUTIONS (+0) DP
// P34-35_P74-75.agc:1379
//#    DELVLVC	DELTA VELOCITY VECTOR IN LV COORD.		METERS/CSEC (+7) VT
// P34-35_P74-75.agc:1380
//#    MGLVFLAG	INT FLAG: 0 IS +MGA COMPUTED, 1 IS DELVLVC COMP.		BIT
// P34-35_P74-75.agc:1381
//#
// P34-35_P74-75.agc:1382
//# ** CALLING SEQUENCE **
// P34-35_P74-75.agc:1383
//#
// P34-35_P74-75.agc:1384
//#	L 	CALL
// P34-35_P74-75.agc:1385
//#	L+1		MIDGIM
// P34-35_P74-75.agc:1386
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1387
//#
// P34-35_P74-75.agc:1388
//# ** NO SUBROUTINES CALLED **
// P34-35_P74-75.agc:1389
//#
// P34-35_P74-75.agc:1390
//# ** DEBRIS -- ERASABLE TEMPORARY USAGE **
// P34-35_P74-75.agc:1391
//#
// P34-35_P74-75.agc:1392
//#	A,Q,L, PUSH LIST, MPAC.
// P34-35_P74-75.agc:1393
//#
// P34-35_P74-75.agc:1394
//# ** ALARMS -- NONE **
// P34-35_P74-75.agc:1395
//
// P34-35_P74-75.agc:1396
//# Page 692
// P34-35_P74-75.agc:1397
//# MIDDLE GIMBAL ANGLE COMPUTATION.
// P34-35_P74-75.agc:1398
//
// P34-35_P74-75.agc:1399
//		SETLOC	MIDDGIM
// P34-35_P74-75.agc:1400
//		BANK
// P34-35_P74-75.agc:1401
//
// P34-35_P74-75.agc:1402
//		COUNT*	$$/MIDG
// P34-35_P74-75.agc:1403
//
// P34-35_P74-75.agc:1404
//HALFREV		2DEC	1 B-1
// slot 9165 9166
    9165, 16384, 9166, 0,
// P34-35_P74-75.agc:1405
//
// P34-35_P74-75.agc:1406
//GET+MGA		VLOAD	UNIT		# (PL 0D) V (+7) TO MPAC UNITIZE UV (+1)
// slot 9167
    9167, 44794,
// P34-35_P74-75.agc:1407
//		UNIT
// slot 9168
    9168, 65372,
// P34-35_P74-75.agc:1408
//		DOT	SL1		# DOT UV WITH Y(STABLE MEMBER) AND RESCALE
// slot 9169
    9169, 59970,
// P34-35_P74-75.agc:1409
//			REFSMMAT +6	# FROM +2 TO +1 FOR ASIN ROUTINE
// slot 9170
    9170, 1988,
// P34-35_P74-75.agc:1410
//		ARCSIN	BPL
// slot 9171
    9171, 42172,
// P34-35_P74-75.agc:1411
//			SETMGA
// slot 9172
    9172, 14256,
// P34-35_P74-75.agc:1412
//		DAD	DAD		# CONVERT -MGA TO +MGA BY
// slot 9173
    9173, 36122,
// P34-35_P74-75.agc:1413
//			HALFREV		# ADDING ONE REVOLUTION
// slot 9174
    9174, 14236,
// P34-35_P74-75.agc:1414
//			HALFREV
// slot 9175
    9175, 14236,
// P34-35_P74-75.agc:1415
//SETMGA		STORE	+MGA
// slot 9176
    9176, 2390
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1416
//		CLR	RVQ		# CLEAR MGLVFLAG TO INDICATE +MGA CALC
// slot 9177
    9177, 36376,
// P34-35_P74-75.agc:1417
//			MGLVFLAG	# AND EXIT
// slot 9178
    9178, 2938,
// P34-35_P74-75.agc:1418
//GET.LVC		VLOAD	UNIT		# (PL 6D) R (+29) IN MPAC UNITIZE UR
// slot 9179
    9179, 44794,
// P34-35_P74-75.agc:1419
//			RINIT
// slot 9180
    9180, 2470,
// P34-35_P74-75.agc:1420
//		VCOMP			# U(-R)
// slot 9181
    9181, 65404,
// P34-35_P74-75.agc:1421
//		STORE	18D		# U(-R) TO 18D
// slot 9182
    9182, 38,
// P34-35_P74-75.agc:1422
//		VXV	UNIT		# U(-R)*V EQ V*U(R), U(V*R)
// slot 9183
    9183, 44602,
// P34-35_P74-75.agc:1423
//			VINIT
// slot 9184
    9184, 2482,
// P34-35_P74-75.agc:1424
//		STORE	12D		# U(V*R) TO 12D
// slot 9185
    9185, 26,
// P34-35_P74-75.agc:1425
//		VXV	UNIT		# U(V*R)*U(-R), U((V*R)*(-R))
// slot 9186
    9186, 44602,
// P34-35_P74-75.agc:1426
//			18D
// slot 9187
    9187, 38,
// P34-35_P74-75.agc:1427
//		STOVL	6D		# TRANSFORMATION MATRIX IS IN 6D (+1)
// slot 9188
    9188, 20494,
// P34-35_P74-75.agc:1428
//			0D		# DELTA V (+7) IN 0D
// slot 9189
    9189, 2,
// P34-35_P74-75.agc:1429
//		MXV	VSL1		# CONVERT FROM INER COOR TO LV COOR (+8)
// slot 9190
    9190, 64162,
// P34-35_P74-75.agc:1430
//			6D		# AND SCALE +7 IN MPAC
// slot 9191
    9191, 14,
// P34-35_P74-75.agc:1431
//		STORE	DELVLVC		# STORE IN DELVLVC (+7)
// slot 9192
    9192, 3640,
// P34-35_P74-75.agc:1432
//		SET	RVQ		# SET MGLVFLAG TO INDICATE LVC CALC
// slot 9193
    9193, 36376,
// P34-35_P74-75.agc:1433
//			MGLVFLAG	# AND EXIT
// slot 9194
    9194, 2682,
// P34-35_P74-75.agc:1434
//
// P34-35_P74-75.agc:1435
//# ***** END OF MIDGIM ROUTINE *****
// P34-35_P74-75.agc:1436
//
// P34-35_P74-75.agc:1437
//# Page 693
// P34-35_P74-75.agc:1438
//		BANK	10
// P34-35_P74-75.agc:1439
//		SETLOC	SLCTMU
// P34-35_P74-75.agc:1440
//		BANK
// P34-35_P74-75.agc:1441
//		COUNT*	$$/MIDG
// P34-35_P74-75.agc:1442
//
// P34-35_P74-75.agc:1443
//SELECTMU	AXC,1	AXT,2
// slot 10240
    10240, 64736,
// P34-35_P74-75.agc:1444
//			2D
// slot 10241
    10241, 4,
// P34-35_P74-75.agc:1445
//			0D
// slot 10242
    10242, 0,
// P34-35_P74-75.agc:1446
//		BOFF
// slot 10243
    10243, 65304,
// P34-35_P74-75.agc:1447
//			CMOONFLG
// slot 10244
    10244, 4550,
// P34-35_P74-75.agc:1448
//			SETMUER
// slot 10245
    10245, 16402,
// P34-35_P74-75.agc:1449
//		AXC,1	AXT,2
// slot 10246
    10246, 64736,
// P34-35_P74-75.agc:1450
//			10D
// slot 10247
    10247, 20,
// P34-35_P74-75.agc:1451
//			2D
// slot 10248
    10248, 4,
// P34-35_P74-75.agc:1452
//SETMUER		DLOAD*	SXA,1
// slot 10249
    10249, 55494,
// P34-35_P74-75.agc:1453
//			MUTABLE +4,1
// slot 10250
    10250, 8210,
// P34-35_P74-75.agc:1454
//			RTX1
// slot 10251
    10251, 3068,
// P34-35_P74-75.agc:1455
//		STODL*	RTSR1/MU
// slot 10252
    10252, 18846,
// P34-35_P74-75.agc:1456
//			MUTABLE -2,1
// slot 10253
    10253, 8198,
// P34-35_P74-75.agc:1457
//		BOFF	SR
// slot 10254
    10254, 45336,
// P34-35_P74-75.agc:1458
//			CMOONFLG
// slot 10255
    10255, 4550,
// P34-35_P74-75.agc:1459
//			RTRNMU
// slot 10256
    10256, 16420,
// P34-35_P74-75.agc:1460
//			6D
// slot 10257
    10257, 17166,
// P34-35_P74-75.agc:1461
//RTRNMU		STORE	RTMU
// slot 10258
    10258, 2466,
// P34-35_P74-75.agc:1462
//		SXA,2	CLEAR
// slot 10259
    10259, 36024,
// P34-35_P74-75.agc:1463
//			RTX2
// slot 10260
    10260, 3070,
// P34-35_P74-75.agc:1464
//			FINALFLG
// slot 10261
    10261, 1394,
// P34-35_P74-75.agc:1465
//		GOTO
// slot 10262
    10262, 65360,
// P34-35_P74-75.agc:1466
//			VN1645
// slot 10263
    10263, 61196,
// P34-35_P74-75.agc:1467
//
// P34-35_P74-75.agc:1468
//# Page 694
// P34-35_P74-75.agc:1469
//# ***** PERIAPO *****
// P34-35_P74-75.agc:1470
//#
// P34-35_P74-75.agc:1471
//# MOD NO -1			LOG SECTION -- P34-P35, P74-P75
// P34-35_P74-75.agc:1472
//# MOD BY WHITE, P.		DATE 18 JAN 68
// P34-35_P74-75.agc:1473
//#
// P34-35_P74-75.agc:1474
//# FUNCTIONAL DESCRIPTION
// P34-35_P74-75.agc:1475
//#
// P34-35_P74-75.agc:1476
//#	THIS SUBROUTINE COMPUTES THE TWO BODY APOCENTER AND PERICENTER
// P34-35_P74-75.agc:1477
//#	ALTITUDES GIVEN THE POSITION AND VELOCITY VECTORS FOR A POINT ON
// P34-35_P74-75.agc:1478
//#	TRAJECTORY AND THE PRIMARY BODY.
// P34-35_P74-75.agc:1479
//#
// P34-35_P74-75.agc:1480
//#	SETRAD IS CALLED TO DETERMINE THE RADIUS OF THE PRIMARY BODY.
// P34-35_P74-75.agc:1481
//#
// P34-35_P74-75.agc:1482
//#	APSIDES IS CALLED TO SOVE FOR THE TWO BODY RADII OF APOCENTER AND
// P34-35_P74-75.agc:1483
//#	PERICENTER AND THE ECCENTRICITY OF THE TRAJECTORY.
// P34-35_P74-75.agc:1484
//#
// P34-35_P74-75.agc:1485
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1486
//#
// P34-35_P74-75.agc:1487
//#	L	CALL
// P34-35_P74-75.agc:1488
//#	L+1		PERIAPO
// P34-35_P74-75.agc:1489
//#	L+2	(RETURN -- ALWAYS)
// P34-35_P74-75.agc:1490
//#
// P34-35_P74-75.agc:1491
//# INPUT
// P34-35_P74-75.agc:1492
//#
// P34-35_P74-75.agc:1493
//#	(1)	RVEC	POSITION VECTOR IN METERS
// P34-35_P74-75.agc:1494
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1495
//#	(2)	VVEC	VELOCITY VECTOR IN METERS/CENTISECOND
// P34-35_P74-75.agc:1496
//#			SCALE FACTOR -- EARTH +7, MOON +5
// P34-35_P74-75.agc:1497
//#	(3)	X1	PRIMARY BODY INDICATOR
// P34-35_P74-75.agc:1498
//#			EARTH -1, MOON -10
// P34-35_P74-75.agc:1499
//#
// P34-35_P74-75.agc:1500
//# OUTPUT
// P34-35_P74-75.agc:1501
//#
// P34-35_P74-75.agc:1502
//#	(1)	2D	APOCENTER RADIUS IN METERS
// P34-35_P74-75.agc:1503
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1504
//#	(2)	4D	APOCENTER ALTITUDE IN METERS
// P34-35_P74-75.agc:1505
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1506
//#	(3)	6D	PERICENTER RADIUS IN METERS
// P34-35_P74-75.agc:1507
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1508
//#	(4)	8D	PERICENTER ALTITUDE IN METERS
// P34-35_P74-75.agc:1509
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1510
//#	(5)	ECC	ECCENTRICITY OF CONIC TRAJECTORY
// P34-35_P74-75.agc:1511
//#			SCALE FACTOR -- +3
// P34-35_P74-75.agc:1512
//#	(6)	XXXALT	RADIUS OF THE PRIMARY BODY IN METERS
// P34-35_P74-75.agc:1513
//#			SCALE FACTOR -- EARTH +29, MOON +27
// P34-35_P74-75.agc:1514
//#	(7)	PUSHLOC	EQUALS 10D
// P34-35_P74-75.agc:1515
//#
// P34-35_P74-75.agc:1516
//# SUBROUTINES USED
// P34-35_P74-75.agc:1517
//#
// P34-35_P74-75.agc:1518
//#	SETRAD
// P34-35_P74-75.agc:1519
//# Page 695
// P34-35_P74-75.agc:1520
//#	APSIDES
// P34-35_P74-75.agc:1521
//
// P34-35_P74-75.agc:1522
//		SETLOC	APOPERI
// P34-35_P74-75.agc:1523
//		BANK
// P34-35_P74-75.agc:1524
//
// P34-35_P74-75.agc:1525
//		COUNT*	$$/PERAP
// P34-35_P74-75.agc:1526
//
// P34-35_P74-75.agc:1527
//RPAD		2DEC	6373338 B-29	# STANDARD RADIUS OF PAD 37-B.
// slot 21708 21709
    21708, 388, 21709, 16346,
// P34-35_P74-75.agc:1528
//					# = 20 909 901.57 FT
// P34-35_P74-75.agc:1529
//
// P34-35_P74-75.agc:1530
//PERIAPO1	LXA,2	VSR*
// slot 21710
    21710, 45016,
// P34-35_P74-75.agc:1531
//			RTX2
// slot 21711
    21711, 3070,
// P34-35_P74-75.agc:1532
//			0,2
// slot 21712
    21712, 48380,
// P34-35_P74-75.agc:1533
//		STOVL	VVEC
// slot 21713
    21713, 23496,
// P34-35_P74-75.agc:1534
//		LXA,1	VSR*
// slot 21714
    21714, 45008,
// P34-35_P74-75.agc:1535
//			RTX1
// slot 21715
    21715, 3068,
// P34-35_P74-75.agc:1536
//			0,2
// slot 21716
    21716, 48380,
// P34-35_P74-75.agc:1537
//		STORE	RVEC
// slot 21717
    21717, 2906,
// P34-35_P74-75.agc:1538
//PERIAPO		STQ	CALL
// slot 21718
    21718, 37920,
// P34-35_P74-75.agc:1539
//			NORMEX
// slot 21719
    21719, 3686,
// P34-35_P74-75.agc:1540
//			SETRAD
// slot 21720
    21720, 39368,
// P34-35_P74-75.agc:1541
//		STCALL	XXXALT
// slot 21721
    21721, 32626,
// P34-35_P74-75.agc:1542
//			APSIDES
// slot 21722
    21722, 22392,
// P34-35_P74-75.agc:1543
//		SETPD	PUSH		# 2D = APOCENTER RADIUS		B29 OR B27
// slot 21723
    21723, 34306
)).

agcAotInstallSourceRope(list(
// P34-35_P74-75.agc:1544
//			2D
// slot 21724
    21724, 6,
// P34-35_P74-75.agc:1545
//		DSU	PDDL		# 4D = APOGEE ALTITUDE 		B29 OR B27
// slot 21725
    21725, 54570,
// P34-35_P74-75.agc:1546
//			XXXALT
// slot 21726
    21726, 3954,
// P34-35_P74-75.agc:1547
//			0D
// slot 21727
    21727, 2,
// P34-35_P74-75.agc:1548
//		PUSH	DSU		# 6D = PERICENTER RADIUS	B29 OR B27
// slot 21728
    21728, 38156,
// P34-35_P74-75.agc:1549
//			XXXALT
// slot 21729
    21729, 3954,
// P34-35_P74-75.agc:1550
//		PUSH	GOTO		# 8D = PERIGEE ALTITUDE 	B29 OR B27
// slot 21730
    21730, 43020,
// P34-35_P74-75.agc:1551
//			NORMEX
// slot 21731
    21731, 3686,
// P34-35_P74-75.agc:1552
//
// P34-35_P74-75.agc:1553
//# Page 696
// P34-35_P74-75.agc:1554
//SETRAD		DLOAD	PUSH
// slot 21732
    21732, 34506,
// P34-35_P74-75.agc:1555
//			RPAD
// slot 21733
    21733, 6554,
// P34-35_P74-75.agc:1556
//		SXA,1	INCR,2
// slot 21734
    21734, 52400,
// P34-35_P74-75.agc:1557
//			X2
// slot 21735
    21735, 78,
// P34-35_P74-75.agc:1558
//			2D
// slot 21736
    21736, 4,
// P34-35_P74-75.agc:1559
//		SLOAD	BHIZ
// slot 21737
    21737, 39098,
// P34-35_P74-75.agc:1560
//			X2
// slot 21738
    21738, 80,
// P34-35_P74-75.agc:1561
//			SETRADX
// slot 21739
    21739, 39390,
// P34-35_P74-75.agc:1562
//		VLOAD	ABVAL
// slot 21740
    21740, 42746,
// P34-35_P74-75.agc:1563
//			RLS
// slot 21741
    21741, 2086,
// P34-35_P74-75.agc:1564
//		PDDL
// slot 21742
    21742, 65450,
// P34-35_P74-75.agc:1565
//SETRADX		DLOAD	RVQ
// slot 21743
    21743, 36554,
// P34-35_P74-75.agc:1566
//
// P34-35_P74-75.agc:1567
//# Page 697
// P34-35_P74-75.agc:1568
//PRECSET		STQ
// slot 21744
    21744, 65312,
// P34-35_P74-75.agc:1569
//			NORMEX
// slot 21745
    21745, 3686,
// P34-35_P74-75.agc:1570
//		STCALL	TDEC2
// slot 21746
    21746, 32504,
// P34-35_P74-75.agc:1571
//			LEMPREC
// slot 21747
    21747, 23646,
// P34-35_P74-75.agc:1572
//		CALL
// slot 21748
    21748, 65320,
// P34-35_P74-75.agc:1573
//			LEMSTORE
// slot 21749
    21749, 39420,
// P34-35_P74-75.agc:1574
//		DLOAD
// slot 21750
    21750, 65482,
// P34-35_P74-75.agc:1575
//			TDEC2
// slot 21751
    21751, 3832,
// P34-35_P74-75.agc:1576
//		STCALL	TDEC1
// slot 21752
    21752, 28738,
// P34-35_P74-75.agc:1577
//			CSMPREC
// slot 21753
    21753, 23622,
// P34-35_P74-75.agc:1578
//		CALL
// slot 21754
    21754, 65320,
// P34-35_P74-75.agc:1579
//			CSMSTORE
// slot 21755
    21755, 39436,
// P34-35_P74-75.agc:1580
//		GOTO
// slot 21756
    21756, 65360,
// P34-35_P74-75.agc:1581
//			NORMEX
// slot 21757
    21757, 3686,
// P34-35_P74-75.agc:1582
//LEMSTORE	VLOAD	BOFF
// slot 21758
    21758, 36090,
// P34-35_P74-75.agc:1583
//			RATT
// slot 21759
    21759, 2,
// P34-35_P74-75.agc:1584
//			AVFLAG
// slot 21760
    21760, 1492,
// P34-35_P74-75.agc:1585
//			PASSIVE
// slot 21761
    21761, 39444,
// P34-35_P74-75.agc:1586
//ACTIVE		STOVL	RACT3
// slot 21762
    21762, 24252,
// P34-35_P74-75.agc:1587
//			VATT
// slot 21763
    21763, 14,
// P34-35_P74-75.agc:1588
//		STORE	VACT3
// slot 21764
    21764, 3784,
// P34-35_P74-75.agc:1589
//		RVQ
// slot 21765
    21765, 65308,
// P34-35_P74-75.agc:1590
//CSMSTORE	VLOAD	BOFF
// slot 21766
    21766, 36090,
// P34-35_P74-75.agc:1591
//			RATT
// slot 21767
    21767, 2,
// P34-35_P74-75.agc:1592
//			AVFLAG
// slot 21768
    21768, 1492,
// P34-35_P74-75.agc:1593
//			ACTIVE
// slot 21769
    21769, 39428,
// P34-35_P74-75.agc:1594
//PASSIVE		STOVL	RPASS3
// slot 21770
    21770, 24276,
// P34-35_P74-75.agc:1595
//			VATT
// slot 21771
    21771, 14,
// P34-35_P74-75.agc:1596
//		STORE	VPASS3
// slot 21772
    21772, 3808,
// P34-35_P74-75.agc:1597
//		RVQ
// slot 21773
    21773, 65308,
// P34-35_P74-75.agc:1598
//
// P34-35_P74-75.agc:1599
//# Page 698
// P34-35_P74-75.agc:1600
//VECSHIFT	LXA,2	VSR*
// slot 21774
    21774, 45016,
// P34-35_P74-75.agc:1601
//			RTX2
// slot 21775
    21775, 3070,
// P34-35_P74-75.agc:1602
//			0,2
// slot 21776
    21776, 48380,
// P34-35_P74-75.agc:1603
//		LXA,1	PDVL
// slot 21777
    21777, 52688,
// P34-35_P74-75.agc:1604
//			RTX1
// slot 21778
    21778, 3068,
// P34-35_P74-75.agc:1605
//		VSR*	PDVL
// slot 21779
    21779, 52574,
// P34-35_P74-75.agc:1606
//			0,2
// slot 21780
    21780, 48380,
// P34-35_P74-75.agc:1607
//		RVQ
// slot 21781
    21781, 65308,
// P34-35_P74-75.agc:1608
//
// P34-35_P74-75.agc:1609
//# Page 699
// P34-35_P74-75.agc:1610
//SHIFTR1		LXA,2	SL*
// slot 21782
    21782, 45016,
// P34-35_P74-75.agc:1611
//			RTX2
// slot 21783
    21783, 3070,
// P34-35_P74-75.agc:1612
//			0,2
// slot 21784
    21784, 48892,
// P34-35_P74-75.agc:1613
//		RVQ
// slot 21785
    21785, 65308
)).

// bank 04, slots 6574-6578
function agcAotUnit392 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6575 {
        if slot <= 6574 {
// P34-35_P74-75.agc:1614
//
// P34-35_P74-75.agc:1615
//# Page 700
// P34-35_P74-75.agc:1616
//# PROGRAM DESCRIPTION
// P34-35_P74-75.agc:1617
//# SUBROUTINE NAME	R36	OUT-OF-PLANE RENDEZVOUS ROUTINE
// P34-35_P74-75.agc:1618
//# MOD NO. 0		DATE 	22 DECEMBER 67
// P34-35_P74-75.agc:1619
//# MOD BY N.M.NEVILLE	LOG SECTION EXTENDED VERBS
// P34-35_P74-75.agc:1620
//# FUNCTIONAL DESCRIPTION
// P34-35_P74-75.agc:1621
//#
// P34-35_P74-75.agc:1622
//# TO DISPLAY AT ASTRONAUT REQUEST LGC CALCULATED RENDEZVOUS
// P34-35_P74-75.agc:1623
//# OUT-OF-PLANE PARAMETERS (Y, YDOT, PSI).  (REQUESTED BY DSKY).
// P34-35_P74-75.agc:1624
//#
// P34-35_P74-75.agc:1625
//# CALLING SEQUENCE
// P34-35_P74-75.agc:1626
//#
// P34-35_P74-75.agc:1627
//#	ASTRONAUT REQUEST THROUGH DSKY V 90 E
// P34-35_P74-75.agc:1628
//#
// P34-35_P74-75.agc:1629
//# SUBROUTINES CALLED
// P34-35_P74-75.agc:1630
//#
// P34-35_P74-75.agc:1631
//#	EXDSPRET
// P34-35_P74-75.agc:1632
//#	GOMARKF
// P34-35_P74-75.agc:1633
//#	CSMPREC
// P34-35_P74-75.agc:1634
//#	LEMPREC
// P34-35_P74-75.agc:1635
//#	SGNAGREE
// P34-35_P74-75.agc:1636
//#	LOADTIME
// P34-35_P74-75.agc:1637
//#
// P34-35_P74-75.agc:1638
//# NORMAL EXIT MODES
// P34-35_P74-75.agc:1639
//#
// P34-35_P74-75.agc:1640
//#	ASTRONAUT REQUEST THROUGH DSKY TO TERMINATE PROGRAM V 34 E
// P34-35_P74-75.agc:1641
//#
// P34-35_P74-75.agc:1642
//# ALARM OR ABORT EXIT MODES
// P34-35_P74-75.agc:1643
//#
// P34-35_P74-75.agc:1644
//#	NONE
// P34-35_P74-75.agc:1645
//#
// P34-35_P74-75.agc:1646
//# OUTPUT
// P34-35_P74-75.agc:1647
//#
// P34-35_P74-75.agc:1648
//#	DECIMAL DISPLAY OF TIME, Y, YDOT AND PSI
// P34-35_P74-75.agc:1649
//#
// P34-35_P74-75.agc:1650
//#	DISPLAYED VALUES Y, YDOT, AND PSI, ARE STORED IN ERASABLE
// P34-35_P74-75.agc:1651
//#	REGISTERS RANGE, RRATE, AND RTHETA RESPECTIVELY.
// P34-35_P74-75.agc:1652
//#
// P34-35_P74-75.agc:1653
//# ERASABLE INITIALIZATION REQUIRED
// P34-35_P74-75.agc:1654
//#
// P34-35_P74-75.agc:1655
//#	CSM AND LEM STATE VECTORS
// P34-35_P74-75.agc:1656
//#
// P34-35_P74-75.agc:1657
//# DEBRIS
// P34-35_P74-75.agc:1658
//#
// P34-35_P74-75.agc:1659
//#	CENTRALS A,Q,L
// P34-35_P74-75.agc:1660
//#	OTHER:  THOSE USED BY THE ABOVE LISTED SUBROUTINES
// P34-35_P74-75.agc:1661
//
// P34-35_P74-75.agc:1662
//		BANK	20
// P34-35_P74-75.agc:1663
//		SETLOC	R36LM
// P34-35_P74-75.agc:1664
//		BANK
// P34-35_P74-75.agc:1665
//# Page 701
// P34-35_P74-75.agc:1666
//		EBANK=	RPASS36
// P34-35_P74-75.agc:1667
//
// P34-35_P74-75.agc:1668
//		COUNT*	$$/R36
// P34-35_P74-75.agc:1669
//
// P34-35_P74-75.agc:1670
//R36		ZL
// slot 6574
            if slot <> 6574 or instruction <> 9223 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 7, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P34-35_P74-75.agc:1671
//		CAF	ZERO		# SET TIME OF EVENT TO ZERO FOR FIRST
// slot 6575
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
// P34-35_P74-75.agc:1672
//		DXCH	DSPTEMX		# DISPLAY
// slot 6576
            if slot <> 6576 or instruction <> 22058 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6577 {
// P34-35_P74-75.agc:1673
//		CAF	V06N16N
// slot 6577
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
// P34-35_P74-75.agc:1674
//		TC	BANKCALL
// slot 6578
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
// P34-35_P74-75.agc:1675
//		CADR	GOMARKF
// slot 6579
    6579, 16824
)).

// bank 04, slots 6580-6587
function agcAotUnit393 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6583 {
        if slot <= 6581 {
            if slot <= 6580 {
// P34-35_P74-75.agc:1676
//		TCF	ENDEXT		# TERMINATE
// slot 6580
                if slot <> 6580 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1677
//		TCF	+2		# PROCEED
// slot 6581
                if slot <> 6581 or instruction <> 5559 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5559, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6582 {
// P34-35_P74-75.agc:1678
//		TCF	-5		# RECYCLE FOR ASTRONAUT INPUT TIME
// slot 6582
                if slot <> 6582 or instruction <> 5553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1679
//		DXCH	DSPTEMX
// slot 6583
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
// P34-35_P74-75.agc:1680
//		EXTEND
// slot 6584
                if slot <> 6584 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1681
//		BZF	LREGCHK		# A-REG ZERO GOTO CHECK L-REG FOR ZERO
// slot 6585
                if slot <> 6585 or instruction <> 5632 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5632, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6586 {
// P34-35_P74-75.agc:1682
//ASTROTIM	DXCH	MPAC		# A-REG NON-ZERO, TIME = ASTRO INPUT TIME
// slot 6586
                if slot <> 6586 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1683
//		TC	INTPRET
// slot 6587
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
// P34-35_P74-75.agc:1684
//		RTB
// slot 6588
    6588, 65336,
// P34-35_P74-75.agc:1685
//			DPMODE
// slot 6589
    6589, 18332,
// P34-35_P74-75.agc:1686
//R36INT		STCALL	TDEC1
// slot 6590
    6590, 28738,
// P34-35_P74-75.agc:1687
//			OTHPREC
// slot 6591
    6591, 23622,
// P34-35_P74-75.agc:1688
//		VLOAD	PDVL
// slot 6592
    6592, 52730,
// P34-35_P74-75.agc:1689
//			VATT
// slot 6593
    6593, 14,
// P34-35_P74-75.agc:1690
//			RATT		# _
// slot 6594
    6594, 2,
// P34-35_P74-75.agc:1691
//		STORE	RPASS36		# R
// slot 6595
    6595, 2318,
// P34-35_P74-75.agc:1692
//		UNIT	PDVL		#  P
// slot 6596
    6596, 52572,
// P34-35_P74-75.agc:1693
//		VXV	UNIT
// slot 6597
    6597, 44602,
// P34-35_P74-75.agc:1694
//		STADR			# _
// slot 6598
    6598, 65324,
// P34-35_P74-75.agc:1695
//		STODL	UNP36		# U
// slot 6599
    6599, 50916,
// P34-35_P74-75.agc:1696
//			TAT
// slot 6600
    6600, 26,
// P34-35_P74-75.agc:1697
//		STCALL	TDEC1
// slot 6601
    6601, 28738,
// P34-35_P74-75.agc:1698
//			THISPREC
// slot 6602
    6602, 23646,
// P34-35_P74-75.agc:1699
//		VLOAD	PDVL		#		  -
// slot 6603
    6603, 52730,
// P34-35_P74-75.agc:1700
//			VATT		# VELOCITY VECTOR V		00D
// slot 6604
    6604, 14,
// P34-35_P74-75.agc:1701
//			RATT		# 		   A
// slot 6605
    6605, 2,
// P34-35_P74-75.agc:1702
//		PDDL
// slot 6606
    6606, 65450,
// P34-35_P74-75.agc:1703
//			TAT		# SAVE TIME IN LOCATION 30D FOR REDISPLAY
// slot 6607
    6607, 26,
// P34-35_P74-75.agc:1704
//		STOVL	30D		#		  _
// slot 6608
    6608, 20542,
// P34-35_P74-75.agc:1705
//		PUSH	PUSH		# POSITION VECTOR R  IN 06D AND 12D
// slot 6609
    6609, 34316,
// P34-35_P74-75.agc:1706
//		BVSU	PDVL		#		   A   _   _
// slot 6610
    6610, 52554,
// P34-35_P74-75.agc:1707
//			RPASS36		# LINE OF SIGHT VECTOR R - R  	12D
// slot 6611
    6611, 2318,
// P34-35_P74-75.agc:1708
//		DOT	SL1		#			P   A
// slot 6612
    6612, 59970,
// P34-35_P74-75.agc:1709
//			UNP36		#     _   _
// slot 6613
    6613, 2330,
// P34-35_P74-75.agc:1710
//		STOVL	RANGE		# Y = U . R
// slot 6614
    6614, 22786,
// P34-35_P74-75.agc:1711
//			00D		#          A
// slot 6615
    6615, 2,
// P34-35_P74-75.agc:1712
//		DOT	SL1
// slot 6616
    6616, 59970,
// P34-35_P74-75.agc:1713
//			UNP36		# .   _   _
// slot 6617
    6617, 2330,
// P34-35_P74-75.agc:1714
//		STOVL	RRATE		# Y = U . V
// slot 6618
    6618, 22790,
// P34-35_P74-75.agc:1715
//			06D		#          A
// slot 6619
    6619, 14,
// P34-35_P74-75.agc:1716
//# Page 702
// P34-35_P74-75.agc:1717
//					# _           _
// P34-35_P74-75.agc:1718
//		UNIT	PUSH		# U  = UNIT ( R  )		18D
// slot 6620
    6620, 34396,
// P34-35_P74-75.agc:1719
//		VXV	VXV		#  RA          A
// slot 6621
    6621, 40250,
// P34-35_P74-75.agc:1720
//			00D		#  _    _     _     _
// slot 6622
    6622, 2,
// P34-35_P74-75.agc:1721
//			18D		# (U  X V ) X U   = U
// slot 6623
    6623, 38,
// P34-35_P74-75.agc:1722
//		VSL2	UNIT		#   RA   A     RA    A
// slot 6624
    6624, 44756,
// P34-35_P74-75.agc:1723
//		UNIT
// slot 6625
    6625, 65372,
// P34-35_P74-75.agc:1724
//		STOVL	00D		# UNIT HORIZONTAL IN FORWARD DIR. 00D
// slot 6626
    6626, 20482,
// P34-35_P74-75.agc:1725
//			18D
// slot 6627
    6627, 38,
// P34-35_P74-75.agc:1726
//		DOT	VXSC		# _
// slot 6628
    6628, 61762,
// P34-35_P74-75.agc:1727
//			12D		# U
// slot 6629
    6629, 26,
// P34-35_P74-75.agc:1728
//		VSL2			#  L
// slot 6630
    6630, 65492,
// P34-35_P74-75.agc:1729
//		BVSU	UNIT
// slot 6631
    6631, 44618,
// P34-35_P74-75.agc:1730
//		UNIT
// slot 6632
    6632, 65372,
// P34-35_P74-75.agc:1731
//		PUSH	DOT		# LOS PROJECTED INTO HORIZONTAL  12D
// slot 6633
    6633, 41228,
// P34-35_P74-75.agc:1732
//			00D		# PLANE
// slot 6634
    6634, 2,
// P34-35_P74-75.agc:1733
//		SL1	ARCCOS		#              _   _
// slot 6635
    6635, 54996,
// P34-35_P74-75.agc:1734
//		STOVL	RTHETA		# PSI = ARCCOS(U . U )
// slot 6636
    6636, 22794,
// P34-35_P74-75.agc:1735
//		VXV	DOT		#               A   L
// slot 6637
    6637, 41274,
// P34-35_P74-75.agc:1736
//			00D
// slot 6638
    6638, 2,
// P34-35_P74-75.agc:1737
//		BPL	DLOAD
// slot 6639
    6639, 58696,
// P34-35_P74-75.agc:1738
//			R36TAG2
// slot 6640
    6640, 9194,
// P34-35_P74-75.agc:1739
//			LODPMAX
// slot 6641
    6641, 20512,
// P34-35_P74-75.agc:1740
//		DSU
// slot 6642
    6642, 65322,
// P34-35_P74-75.agc:1741
//			RTHETA
// slot 6643
    6643, 2314,
// P34-35_P74-75.agc:1742
//		STORE	RTHETA
// slot 6644
    6644, 2314,
// P34-35_P74-75.agc:1743
//R36TAG2		DLOAD	RTB
// slot 6645
    6645, 40138,
// P34-35_P74-75.agc:1744
//			30D
// slot 6646
    6646, 62,
// P34-35_P74-75.agc:1745
//			SGNAGREE
// slot 6647
    6647, 18196,
// P34-35_P74-75.agc:1746
//		STORE	DSPTEMX
// slot 6648
    6648, 1108,
// P34-35_P74-75.agc:1747
//		EXIT
// slot 6649
    6649, 65532
)).

// bank 04, slots 6650-6651
function agcAotUnit394 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6650 {
// P34-35_P74-75.agc:1748
//		CAF	V06N90N		# DISPLAY Y, YDOT, AND PSI.
// slot 6650
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
// P34-35_P74-75.agc:1749
//		TC	BANKCALL
// slot 6651
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
// P34-35_P74-75.agc:1750
//		CADR	GOMARKF
// slot 6652
    6652, 16824
)).

// bank 04, slots 6653-6661
function agcAotUnit395 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6656 {
        if slot <= 6654 {
            if slot <= 6653 {
// P34-35_P74-75.agc:1751
//		TCF	ENDEXT		# TERMINATE
// slot 6653
                if slot <> 6653 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1752
//		TCF	ENDEXT		# PROCEED, END OF PROGRAM
// slot 6654
                if slot <> 6654 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6655 {
// P34-35_P74-75.agc:1753
//		TCF	R36	+3	# REDISPLAY OUTPUT
// slot 6655
                if slot <> 6655 or instruction <> 5553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5553, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1754
//LREGCHK		XCH	L
// slot 6656
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
// P34-35_P74-75.agc:1755
//		EXTEND
// slot 6657
                if slot <> 6657 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P34-35_P74-75.agc:1756
//		BZF	ENTTIM2		# L-REG ZERO, SET TIME = PRESENT TIME
// slot 6658
                if slot <> 6658 or instruction <> 5637 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5637, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 6659 {
// P34-35_P74-75.agc:1757
//		XCH	L		# L-REG NON ZERO, TIME = ASTRO INPUT TIME
// slot 6659
                if slot <> 6659 or instruction <> 23553 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 1, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6660 {
// P34-35_P74-75.agc:1758
//		TCF	ASTROTIM
// slot 6660
                    if slot <> 6660 or instruction <> 5562 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5562, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P34-35_P74-75.agc:1759
//ENTTIM2		TC	INTPRET
// slot 6661
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
// P34-35_P74-75.agc:1760
//		RTB	GOTO
// slot 6662
    6662, 43064,
// P34-35_P74-75.agc:1761
//			LOADTIME
// slot 6663
    6663, 18166,
// P34-35_P74-75.agc:1762
//			R36INT
// slot 6664
    6664, 9084,
// P34-35_P74-75.agc:1763
//V06N16N		VN	00616
// slot 6665
    6665, 1568,
// P34-35_P74-75.agc:1764
//V06N90N		VN	00690
// slot 6666
    6666, 1716
)).

